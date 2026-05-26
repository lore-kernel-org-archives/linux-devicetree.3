Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9987C30BBB8
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 05:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779772406; cv=none; b=qLAJO7pXKas4DwUYQGtoFVNtNCujxfvfee+/+SopSkeZUn6HC5HQbVXxwFoYGDKS8jKRbeiICkeNCVi+SjftK3ejTTFox0FYqUdeQN5KALP0kMmOP1Qr167/RXRwOTVmQLxc3y5TFv+A2cIx2faWVSTbTy4Wuw/jMG0VKjq8Obw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779772406; c=relaxed/simple;
	bh=i8xIVDkEZbfitPKLyNZMLZ+kPQ2krwQdgOM6EvC5jKU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=UMjyHeiIVWkbsycOIWNBL5YPLYcnK5R9Gzvci3Eh2kgsK/PTZ7Syxp/AEUDoVqI4hfbrpQh38xI8MVcGscIfDSvAiqB2enKDC/er0x4heeXaMrKuwr6LmjbHdTSWHWj5y14LtrcZnwTHW/5VaeggHjIcGts7Kbtf2e+eDPlPY/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jqdfGxrb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RcIIhT/z; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jqdfGxrb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RcIIhT/z"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64Q2pNwf3658354
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 05:13:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Fjj0r7FjNz9men9qfkiywh
	V/7oP7JT75ZB7jNFpzrig=; b=jqdfGxrbvNGIJe7isTa19ZcQiVRG2HQtbFz12Z
	bKMMd/vTvriKBmYbGrehsKw69aLdyi72LsHq/d02X+X6vYzrubfjS4oEuaoM0IuY
	6kKNw+Hr9ffUAjQvn+7D+anAtiehNBR+gdm8DZ3FYZH0uprJQ3r9Ly3ZFKP1+FLk
	rkSJUkj+xFKWckVUAUMRxOTVz+vBJEheS/nOdwdvIUU35iDGMePj6OH0XwWQH2KN
	b+93zAX/vOuxnGNHr0g+hzi5P/yhA1RZS0ZoujtyocJSpmpGw9Q23PH8vxLWCTtO
	ZDm++27VwTXS86zOqdiOATyqEzQS8q7DPIkpcT/zFiPFIIyA==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecqyna5fc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 05:13:24 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1361d52b3a0so7763151c88.0
        for <devicetree@vger.kernel.org>; Mon, 25 May 2026 22:13:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779772403; x=1780377203; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Fjj0r7FjNz9men9qfkiywhV/7oP7JT75ZB7jNFpzrig=;
        b=RcIIhT/zC6IemZcrc2bvlqiXxUNg+Du1VhkrdXcPyWCaBVKE57/Re6QQNHdWMp+jHL
         A3fmE2Dy5Ncdozi9AAgr9Nh362gw9fszYp11+qLitiBVkBEymW6YO7JWDKCaBrB0JkwN
         iqAU2FF3RWxh/h3vnYjlAnyLXmGlSuQVGp4Fx1j2nGqkxZbJiDKAtd3+il62R3HibG/Q
         JPcLuntyJzAOOWF4YxVroxB8tJwu9Q+w1mmIVy+zMaH3nfUftAxAfkPcFb972c0hm58c
         ZpxtWzs39RntIntltvZJKQZ7sJ6cODeEorecD7uqtLAaV/O8gA7SK/cQM8W/73CEuwER
         OS/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779772403; x=1780377203;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fjj0r7FjNz9men9qfkiywhV/7oP7JT75ZB7jNFpzrig=;
        b=larAUevdzE/Wa3ZIUUSc/WwsmmatREKXPtz03IYllG4+da8HkthdDbyONLZaFi8ePd
         2wC/dTBLap8y10ag54uvE3CpaMhfLLHxUXeheMIOTt25WDj0PkK0epnqkXFiW+cvkVGO
         /wSVIf+8CQSQPBy8N430A0PqDT7z4CIuVVkqdfSSrN0by1dewHYIWo2vZZjaDWvd/NgO
         EEmNeef9xhYfNKbftzrmQl1aLgTBWt9x8EDOelndQHd9mlNPoc0e5NPvtR0HapkvMEoC
         DxuHdmPnqmC3C4AIIkOBhyaMYGJ9KTzgr2gYAHSRdANat40L6Rq06m1/V5PrcAmQFGh5
         RgJg==
X-Forwarded-Encrypted: i=1; AFNElJ9TaYbMLQXOAyscXDgox1c8zhO4HAhalEX0ypoMbklrYXvw8QefuaB5tJDAVKAUdGcbITrcehCXQN3Y@vger.kernel.org
X-Gm-Message-State: AOJu0YwphlWjSZJdsK+QLVOl0tGL+IPBO52Qq/Ok9K/KMCx9JZzNA7Ec
	6+nCza1u2vfyNgjBgUYRGjiFwP5Sm05k8bfxxMKFy6ZgtWxYIdcX76S06nA2oPKsAUHa0fd3Ey2
	VK0Hcs/RLB0OE8EnKavB8cvbSHL0KtZs1lA3YnOPpsixVL1lMJ+Ln/TiQ8eQ9BKJG
X-Gm-Gg: Acq92OFFBn8sxZmArZRT2LE0i56ZpdRCt4sNOstK7NSUUVqjszPJhE7yjjtPvyVS+wl
	h2Q1T+/oPyS91W3LrjfDQvbqFIgALYK1CrYjtqrUNn6SpgHUfFQYSRkLBtG4c7wSdMjmdoqRKkv
	B0i9Bu4JLo7Aggp20hf/MQSY+mmnP0yYEpomUnfMouTC6s/P9LgspTe3hp0IXjlumkJcFyOfzF4
	eTVcwEm0e7vSefwtOco9/XRn32T1bYDBFIT89fz8pypfcVpe3SKrLAlyom9Ngv3Ve6ttaEpf0CY
	yd3cstMoio8VW0a5PG3Wt3MjkT/wc4gFUxKjsCg/rx/J5I8FXgw3PyraQ3zOrF6JMgGQq23ZNEq
	gsStmwG669wyebuRrAg0acAUqf8/L8r06f27hLo1ftDBosA7pdI3/WyEyAi0KrVtDNZXN9gOldK
	hl5/yuaA==
X-Received: by 2002:a05:7022:2528:b0:133:598c:2b1a with SMTP id a92af1059eb24-1365fc70587mr6195133c88.41.1779772403125;
        Mon, 25 May 2026 22:13:23 -0700 (PDT)
X-Received: by 2002:a05:7022:2528:b0:133:598c:2b1a with SMTP id a92af1059eb24-1365fc70587mr6195109c88.41.1779772402412;
        Mon, 25 May 2026 22:13:22 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-136b3706ad6sm5423053c88.13.2026.05.25.22.13.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 22:13:22 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Herbert Xu <herbert@gondor.apana.org.au>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v3 RESEND 0/5] Add initial device trees for Nord SA8797P
Date: Tue, 26 May 2026 13:12:55 +0800
Message-ID: <20260526051300.1669201-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Wpwb99fv c=1 sm=1 tr=0 ts=6a152bf4 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=GKQnK2gSpAXo-FtYTtoA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-GUID: hfrxuejBOKmqlsEG_koYAx58hcS3OraN
X-Proofpoint-ORIG-GUID: hfrxuejBOKmqlsEG_koYAx58hcS3OraN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDA0MiBTYWx0ZWRfX2SP2wYsAE162
 2/cshdTLnNYJbottx/G3rIR+QEHPGop/IyLVlLOfxSJQ5qGtOV0EzdGFn6F2GvupQ34kk9bR8Zb
 0/4Y+IvCPEgb/hB4nMPjShE0b2w9LyQmLvVC9Bha4CuFczPJu9hSTzXvVnIw2NfiKh22buqz9BL
 RFgc41RdN+BnuJFx//c/47hwfVZ0gSwYKQWgl39W70xGLJf2UqHlxCj6shrn6woNMPeiBsRe6lC
 jMhSmrm+IJvgbGgQeug1U9+CGrkRRcRfktVaZqvBtMbJlaoSXa0LAuPgyjR+ACnThOnAAovqfdg
 /5Hkztd9Heen65wr4I2mCiVzqLoKcfnRjy4ApP4W3DTCp64Irvr2R76ddTsZs5ziDN8dVDwnxA0
 ZpiXMVd1awkzLqDoOVrjFnA+k3aeDANl2jwr9jDqL4SV48iBR8baAj07HCVj+EItPSb8cd5TFQw
 8Ddks5NJrnrJCiOftyQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-26_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 suspectscore=0 impostorscore=0 adultscore=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260042

[ Resend to correct mailing list address ]

This series adds initial device tree support for Qualcomm's Nord SA8797P
SoC and the SA8797P Ride reference board.

The Nord is a new generation of SoC series from Qualcomm built around
18 Oryon cores (qcom,oryon-1-5) organized in three clusters. SA8797P
is the automotive variant in the family.  The IoT variant IQ-10 will be
added later, by sharing the base nord.dtsi with SA8797P.

Dependencies picked up but not hit next-20260525:
- TSENS: https://lore.kernel.org/all/20260504081236.825755-1-shengchao.guo@oss.qualcomm.com/

Dependencies to be picked up:
- RPMH powerdomain: https://lore.kernel.org/all/20260414035909.652992-1-shengchao.guo@oss.qualcomm.com/
- APSS SMMU: https://lore.kernel.org/all/20260519013950.873105-1-shengchao.guo@oss.qualcomm.com/

Changes for v3:
- Rebase on next-20260525 and drop patches/dependencies that hit linux-next
- Improve commit log of "Document SA8797P Ride board" to explain the need
  of SA8797P model compatible
- Fix the real issues reported by sashiko-bot
  - Fix unit address of pdp0_a2p node
  - Add missing compatible for i2c15 and spi15
  - Drop GIC_CPU_MASK_SIMPLE(8) from arch_timer interrupts property
  - Update commit log of "Add device tree for Nord SA8797P SoC" to match
    code change
  - Sort sa8797p-ride thermal trips in ascending order of temperature
  - Fix sa8797p-ride thermal zones with identical trip0 and trip1
- Link to v2: https://lore.kernel.org/all/20260519063505.883379-1-shengchao.guo@oss.qualcomm.com/

Changes for v2:
- Rebase on next-20260518 and drop dependencies that hit linux-next
- Include SoC ID changes into the series
- Include ICE binding change into the series as the prerequisite change
  from Harshal [1] was merged to qcom soc tree instead of crypto
- Improve commit log of SA8797P Ride binding change
- Use label in nord-sa8797p.dtsi for referencing nodes defined in
  the base nord.dtsi
- Link to v1: https://lore.kernel.org/all/20260427023455.236410-1-shengchao.guo@oss.qualcomm.com/

[1] https://lore.kernel.org/all/20260416-qcom_ice_power_and_clk_vote-v5-1-5ccf5d7e2846@oss.qualcomm.com

Deepti Jaggi (2):
  arm64: dts: qcom: Add device tree for Nord SA8797P SoC
  arm64: dts: qcom: Add device tree for SA8797P Ride board

Shawn Guo (3):
  dt-bindings: crypto: qcom,inline-crypto-engine: Document Nord ICE
  arm64: dts: qcom: Add device tree for Nord SoC series
  dt-bindings: arm: qcom: Document SA8797P Ride board

 .../devicetree/bindings/arm/qcom.yaml         |    6 +
 .../crypto/qcom,inline-crypto-engine.yaml     |    2 +
 arch/arm64/boot/dts/qcom/Makefile             |    1 +
 arch/arm64/boot/dts/qcom/nord-sa8797p.dtsi    |  937 ++++
 arch/arm64/boot/dts/qcom/nord.dtsi            | 4513 +++++++++++++++++
 arch/arm64/boot/dts/qcom/sa8797p-ride.dts     |  306 ++
 arch/arm64/boot/dts/qcom/scmi-common.dtsi     | 1918 +++++++
 7 files changed, 7683 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/nord-sa8797p.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/nord.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sa8797p-ride.dts
 create mode 100644 arch/arm64/boot/dts/qcom/scmi-common.dtsi

-- 
2.43.0

