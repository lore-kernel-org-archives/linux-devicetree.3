Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A1C1483BE3
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 09:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789549895; cv=none; b=k+oUmAoWO61gMsP1ufzPWVxIQs4ovJASJ8Lea5IwEgXclMpuDJ32yQIxDbykT+D1FPYr2a6x7B5oLUZUuvoqTlfa7oXNM3LXeFluksHG9LfTLcplhfgHeb3Kb4R0fobG8vGI16NxN0hntk1MSGU5KaaU3mhrWgPaQxISTY1onoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789549895; c=relaxed/simple;
	bh=bxU9A36GV6X5cD4U4Hs76RR/9c8QzDFoAdoCC9AYlts=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=me/tl+CiGWyM8NKHpJBuLl/XNxrRwzxunYRnSQvDPvTNF6WKmxBa5X1UFMlGKdzZ74RoYCsiEGRKx3DQbIMJX1Fe1KJQAJESklbohGU5Bip6K+vQU9IaMyScjfF6eqS9F5NP/SA1d9i/4hMAbD7Tnvr0O//rkcFbY829ZsYKRxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZsO++zK0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SApkLNDQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZsO++zK0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SApkLNDQ"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G92nIB978258
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 09:11:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=o7/UDFZNMGC0sVUehP8pc1
	zfZcfAnhJSSnFpwW3L5/w=; b=ZsO++zK09NANDTYaIxT/CILSyyLMs4Y+tTl7P+
	ZYEFRVWw9kON22zwZHpnsJ+XeWX+5wMW6fif7IY8guP5lIQawEbIBSHa66DuEjP2
	OpjxjNGwWdTlQS4nrzpMl6n22VUPehhVztXE8DNdzxW1e6ebnwvEZz22fshIojHL
	KCGVG6slwDVEjki7+51cjp1Y0j1BEcYzRbi3qeDK2uUFeTsdfb6IxDQxax7kNc3o
	0xS8+AGAMLO96GfU6++RP2iS+GZMJl71HyHYwPAX2FmtaUioyKYAprA2o+ChBvFe
	judHTLkYKNTWaPRruZ3Wm0SgSbvP2N/SbnWLzjU4gKhk6ndA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqqp3r59j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 09:11:26 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-86b70a52946so8853715b3a.2
        for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 02:11:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789549886; x=1790154686; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=o7/UDFZNMGC0sVUehP8pc1zfZcfAnhJSSnFpwW3L5/w=;
        b=SApkLNDQ4GOm2pRyDuZcT5dpoYLZk73xRjhZoXqtaK2bPqufHHHCK0coveHDAmTUxb
         8NTmqmwpFiQ10gX9OL/6Yyzo70DPsfuGIs244yD8a0HDHFGREqPpLpNTZLanX21qHjFG
         zYpgQnaCMKmIyk19B4R0aBwG5UuKnKzgLRBOKvcl8SVAginNUT/LbfGQhaahJ1V5Rhm+
         cHlkzd1WVtEDz5AwX0B8inBtDVya8rw4SrrKab2QcYG8985uaoNFnWuw/Uh10ogWLzar
         1RwQPT4wxNTNYC+HR3ti2lO8lNqS2I9/yR2SJT3JrBIW+GH+Tr1yVoUcXuEFiLMupgxw
         xH6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789549886; x=1790154686;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=o7/UDFZNMGC0sVUehP8pc1zfZcfAnhJSSnFpwW3L5/w=;
        b=TN6GhbXXrFTVePcBOZ1XStw49Ij8rhW3rHET30agMX9qWwVL8HCf2exJ3rshb5wNW4
         Fo9mKjgZtbgwhNdXw15a8F6RuldR2P+mkQlnGeIuNXLfPbX09DvimrWsyDlCsfY+Lz8/
         5vHRzQrws6EppC5c+Vv6C7bNBSTP/Th9fBAAJmU5KwPjm83viWjgt+Z62A1YIi/pRTbx
         4mzuqWQQRbQR3fOTVMMGF2AYg6ykST1XqrJfPYW8DV0+PjyX/srZHp5AKwt9C5k2v4bL
         aRkaFUmuKTfUgz//BUMUaJU0ERxMaB55meOpKZefSLaA0TOoy81iNTEZIi1EXiwg1/2o
         +EQA==
X-Forwarded-Encrypted: i=1; AKwUvByQaD0Mgy4HHZED4EzHsT6wAByxNjw+qqYPl1LR4rWvdhWSPf6GAXU7R1WQr3sZBeV7eBAHhfxiT3Xd@vger.kernel.org
X-Gm-Message-State: AFuF++mu50mI/mcgAnbS/1rIJJ+tID6hYdlFWKRlwbf1xwZmKI1IIG5Z
	tEhLhhkNQQwdGgxGYymKHKF4gspoun+qtUxvvYgWoNJ1d8lda74R/cspD4+44v3Xu4AA1jPT/Or
	EhSp9H3N7HyfSx+pMz2D5CZnWwMn8jPX2fGsVvMlLKKDiLB0A7y0DdEYPPVpV5UJs
X-Gm-Gg: AYBFou2P5TCghHTFREMAQmfZAz3ySzA9Vi3WNSuhWwDbRqKf+/uk7QUke26gCFqqG29
	yrL6E9oaWmpNK3RpPc6rLInYnMlQG6MtPgcoWxHA71kJJMRu2X8RhvJA+qB4kgQyb2sM87yKW9l
	nqMsJd1a9N3rfGamtZmFsdIhRJBGxurXFUHLc0gn9brygzQjjc9P+U/IqEC05Y28xxE6uGUPTwj
	qC3zlc7PncXA3Fr+xf15imh1cx6vXPOwu87x+0j2ZU8tpH39kppukH1YSwxdcc2nqEtyzHxVQNL
	szMPHyoa+ucN+qq9FW1OVAAiMbR4lNW/LPRiw299LJyAhm1WnfWgzWLJWVtxgvm4A3ii4nPlNxl
	Jo4cDiIOQS544cQtRek2rgjn+Y5U=
X-Received: by 2002:a05:6a20:9c8c:b0:3d3:adad:f176 with SMTP id adf61e73a8af0-3dd5f787fcfmr5489187637.24.1789549886173;
        Wed, 16 Sep 2026 02:11:26 -0700 (PDT)
X-Received: by 2002:a05:6a20:9c8c:b0:3d3:adad:f176 with SMTP id adf61e73a8af0-3dd5f787fcfmr5489116637.24.1789549885723;
        Wed, 16 Sep 2026 02:11:25 -0700 (PDT)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14395d3a31asm4779492c88.9.2026.09.16.02.11.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 02:11:25 -0700 (PDT)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Subject: [PATCH v4 0/4] arm64: qcom: dts: Add display support for Qualcomm
 Shikra
Date: Wed, 16 Sep 2026 14:41:17 +0530
Message-Id: <20260916-shikra-dt-changes-v4-0-d5d5c3ffe070@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADZdqmoC/22Oyw6CMBBFf4V0bUlb+xBX/odxUWiRqlDtQKMh/
 LsFYtywmeRmzpw7IwIbnAV0zEYUbHTgfJcC32WoanR3tdiZlBEjTBLJJIbG3YPGpsfrHvDBUKZ
 KWwhqBEp3z2Br916c58uaYShvtupn0Uw0DnofPktppDP386sNf6SYYM4LzROj9oacPED+GvSj8
 m2bp4Hmmsj+IkW2Ho0siYSsK0OlKKzmG6Jpmr64zK0+FAEAAA==
X-Change-ID: 20260626-shikra-dt-changes-8d127be951d5
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: Arpit Saini <arpit.saini@oss.qualcomm.com>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789549881; l=3056;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=bxU9A36GV6X5cD4U4Hs76RR/9c8QzDFoAdoCC9AYlts=;
 b=+uWbf+ewUsRh7+LDuZv8ff1XxdChw6ggcu3l3EcnnBd0g1Pu/Qr/+a8BuypJ8vgeUqiSs8X7K
 3/Hf9ru/hYtBNIcBHee4EtoDm0ue39ZXa33B/izzcJiv3ytVDtN/Zow
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDExOCBTYWx0ZWRfX6slEa/NX5fSF
 AxR8b6yktt9gryiC6Tl8HLBZ+6baiCiBZSjsL5MeOo7k+rFRnYPkS3W5eMDkcTRY7+mFOjxa41m
 TD/sLW0Im/GMaS/xZoJ+cDIjV3r6eKefZTLlz2GXS1l/lwMAo8OMTnxYF2g8T0tT3EaYJ+aH7vO
 6/vVIiqgj8DcXUDQo8/MA2iH6FiZ6uZ/I8KQNhdILUS1TBZcZuJ33B93GNWkHMqerX86jUbRUeb
 bTzG034zfqI9u8hEr+wnFNLbT8pH4QvHTPgQofOImS6IO1KJSDos8eiG5TQS26Xau4nJzMkTU7p
 +Vf9RSJkJ8oGO4fNIosdoFJS5m15blFaJMFphlYNJRWuN5HSBYYV4v5/WAWJT6CR6jNKEqPK9iD
 7uhi8M66OYqsAylDxwRX161zj4J3s2sU0yoOwhoWiTi8yxcdKLv4C7s2Nsj9lV+Eq38b67x4Zu4
 URvl3bFPN07PbZBQZJA==
X-Proofpoint-GUID: gM2gYEEmcIbaUecyzBQSsay8PJ_KmIsk
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDExOCBTYWx0ZWRfX80rbN/90MXG3
 OkIwovdNoka3xEk8MLDfl1xdPl15w9gVqXVXNmPOTi6eduTQm2eg919cF5jAVwElCBbTgSVVBkw
 RY9WMZyJgAozpXvKLpSmved7NR1jLSQ=
X-Proofpoint-ORIG-GUID: gM2gYEEmcIbaUecyzBQSsay8PJ_KmIsk
X-Authority-Analysis: v=2.4 cv=F/DC5ahN c=1 sm=1 tr=0 ts=6aaa5d3e cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bC-a23v3AAAA:8 a=EzW1FMLw5TrtRJQtR8UA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 bulkscore=0 clxscore=1015
 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160118

This series adds display support for the Qualcomm Shikra platform.

It introduces the Qualcomm Shikra MDSS display subsystem support
at the SoC level, and enables display on the Qualcomm Shikra CQS
EVK and CQM EVK boards with the required DSI panel nodes.

---
Changes in v4:
- Rebased on top of next-20260915 tag.
- Dropped all prerequisite-message-id references since the dependent
  patches have been merged.
- Link to v3:
  https://lore.kernel.org/all/20260713-shikra-dt-changes-v3-0-15102fca9570@oss.qualcomm.com/

Changes in v3:
- Drop redundant vph_pwr fixed-regulator node (Krzysztof Kozlowski)
- Remove vin-supply = <&vph_pwr> from lcd_bias node (Krzysztof
  Kozlowski).
- Add the new line between the last property and the following
  subnodes in mdss block(Konrad).
- Link to v2: https://patch.msgid.link/20260706-shikra-dt-changes-v2-0-56fcd1659ea4@oss.qualcomm.com

Changes in v2:
- Replace QCM2290-specific RPM power domain identifiers with generic
  RPMPD_VDDCX/VDDMX macros in Shikra display and DSI nodes.
- Add missing blank line before status = "okay" in &mdss_dsi0 node(Dmitry).
- Split avdd-supply and avee-supply into separate regulators vreg_disp_p
  and vreg_disp_n instead of sharing the same lcd_bias regulator(Dmitry).
- Sort tlmm pin state entries by pin number: gpio3, gpio86, gpio91,
  gpio151 (Dmitry).
- Add vph_pwr as an always-on fixed regulator representing the main
  board power supply, used as vin-supply for lcd_bias.
- Droped the 5th patch "Shikra LT9611UXD support". NAK by Dmitry. Once
  the hdmi-dsi driver is fixed then we will post DT changes.
- Link to v1: https://patch.msgid.link/20260627-shikra-dt-changes-v1-0-449a402673d0@oss.qualcomm.com

Signed-off-by: Arpit Saini <arpit.saini@oss.qualcomm.com>
Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>

To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: arpit.saini@oss.qualcomm.com

---
Arpit Saini (3):
      arm64: dts: qcom: shikra-cqs-evk: Enable display and add ili7807s panel
      arm64: dts: qcom: shikra-cqm-evk: Enable display and add ili7807s panel
      arm64: defconfig: Enable ILI7807S DSI panel driver

Nabige Aala (1):
      arm64: dts: qcom: shikra: Add MDSS display subsystem

 arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts | 118 ++++++++++++++++
 arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts | 118 ++++++++++++++++
 arch/arm64/boot/dts/qcom/shikra.dtsi        | 206 +++++++++++++++++++++++++++-
 arch/arm64/configs/defconfig                |   1 +
 4 files changed, 441 insertions(+), 2 deletions(-)
---
base-commit: e6e35979777d646fe3c7c94dca7dd32fb25d45f4
change-id: 20260626-shikra-dt-changes-8d127be951d5

Best regards,
--  
Nabige Aala <nabige.aala@oss.qualcomm.com>

