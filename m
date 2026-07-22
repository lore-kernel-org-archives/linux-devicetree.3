Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A439D35C691
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 09:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784712432; cv=none; b=bLuu1B9fFvIOLNZjoQ/FQSF/nfUiB0fO87dLUBcDxnOcSOViD/xdmQ91/z20JB5hZo0DEjK7GPtnNUuMSVcu2GK+TwBngrnE5sLP8xud37PRCuA/ogZC8LStw+ckaykyJZ4OwIpN0eIPfadJMa8znB1UWRXv6i+fu/8cFlk0y+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784712432; c=relaxed/simple;
	bh=uW/Vj5fuJng1LvdLmMQs506xzm1+TVv9B57jQPoSfxg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=CgKmWBm/riLFDRt+1PVF7fSJeiFuCWb5mSUEcg0MzKO6sboYhDHqSP12ZZMcIk5FNtcRjZ/Iyt1Ev0wE7in3Eez7ZESnT5VAIKJCYuxqnnNpTOCKqlMC983xMzWwsfrTvms2TkOwJXaMoNATltvypFqZJY6EiCVEC/hGXhyirWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bkooD7Zq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bDMqjN8O; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bkooD7Zq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bDMqjN8O"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M9Dlum049581
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 09:27:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=n0OFJwQjx85fwwK+gVcoig
	tUxSx5yPqwqgEn2qCbrtA=; b=bkooD7ZqL1qTUQtGyvlWyI0in4ekJagrO6CLyC
	ZR64B0fVD6Cx/UlzlCUxscxm/RoqeNzQEEk4rYVJ9TM8jXwWzvC7otyEwajgCRpH
	JVBOKy49kHrbpBziQnGl4QwIUjml0pCssuiO+ITjQCEmnTMkz7/nnKCOtQQd83aF
	9UYqMOfgTuFeWAeq2W592ePFAroUULM/rp7vrjHDQCUXOghOQFXdDWLew0N4e12z
	hMWWKvgF7euxSYqWHte+i1OjL1XAJQKKmIsYzyA1vWoBoN/smfxJhuCqD85/3VvA
	nkUb80MHKmo9GRdLlcUymrt4XSrsvDZ9+iJxoIKy46+MlDTQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fju2281ma-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 09:27:08 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-ca124bf0189so4245841a12.0
        for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 02:27:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784712428; x=1785317228; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=n0OFJwQjx85fwwK+gVcoigtUxSx5yPqwqgEn2qCbrtA=;
        b=bDMqjN8OFOzF83QMPCgSdYN3dc1i0RWZ40vv33yIJhYkMHA6BnOJpCGZA3TNipw5po
         fUXEl0XLnX2f+XDyo1MrH6+RlZ0bgF2dIYPOuKnSshALbbT3vt478yJYbFppVZLSWLlX
         xmgzorDyLvpuhJjE/SJw2lrQJhuloTrkq8RHrvx202Kkk+aBpu9QmhrwnvSJ72CB5EMJ
         c4MO+QfnqQf+9ZsvXtpvgCXf0MTIgILxoVIGBWaGmvSxu9jO2/hkIZMnyGbcbrNJVXVV
         HCxA5zEZgk5qFNeDooVK1MI2mv8pOOkRmCO6utGMAjLP94IzPaeio1ajjuCopbflvfSY
         DPAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784712428; x=1785317228;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=n0OFJwQjx85fwwK+gVcoigtUxSx5yPqwqgEn2qCbrtA=;
        b=mAOnFE7T1F0jKZchlIEvJgIqhexar3BiNqbXKO154XYMsV0Fj+bww3ThMlECDEqiWg
         DGq1NTVBN/97mbaro645yNsYIV4MVLd65ZpDQ6TKEZUmhH1H4hgB4sCUBjiouuzQIncM
         6V2qGGAC9HPuTwGed2Gr/eKXu74oVNOm5YkxtccAk4UVtPG6KiuuWx5nSaY3i3SWb0Et
         SBaBKiLH4AOQbwhepR4UILouCd4FOGV44iGsoN5xt/fgNpsfu4OLO7nUQIGxI47es4CQ
         fpe96aLyuIpeoiLWT/SOTOEvqqGqgL6KwzyqzQBSbouQiWkHE07I2jO9Ochr+81zTQht
         m6oQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro4T0hQVIMQ15Z0dI6w/Kd95PDCh/jYP/EzLs+SVOZhs8QoRvyCd8U3snL2e+vluPJr41TBhzsPTscj@vger.kernel.org
X-Gm-Message-State: AOJu0YwDuQVrtKSNAZICVKOvAX7MQ1Oc11Gl+UwTs77aJIt2pPEwO+Wl
	8xLBJDivJzVai5RKYJmDVzRaR8CM9xMiHRHKLONGo/eMhc7DOlpz6C5AVxLxo3sc7m9xlttH3SX
	7DsNqSYQe3KhNb4ikyKJNhDebQLcfZ/17OE9iMI9dUey+HCTlXBaJAdDYnNs0V0Mx
X-Gm-Gg: AR+sD13+x0vff4G8fmEQ/K/UwiBNP5H5LxgCQlTK4Jb/0Su+6MvYhEn3IxY9tPTt0Lt
	GnkgxhdPMTtbBMk8fh58grZVbxN/sq+kELMVRbPlYm1n7xpyTsKG1FtGbGd3MAu0ShzhsA3LpXH
	k6yleqGdjl28EgESVOTHFYpSFNY4xoP0xZasbBx6JCq6dyk45EfPgPYlWh+L9bKykCsOOXiZzGh
	u4Em3gTme4uTQGcmwBfnyr2JYdXiNr2ai+J6UZ2TbFeliHWs+vxa2Xfab78GgmjsWWf+MC4OOhl
	qXyxUqEsBwEurNcGIG3zTCmzKb+JC/DoweGMi1mcazAi6UZFhmRO9M/oAqvwcPUfJ8+wZ/1aj6H
	qtGNlJr6tCPP6/5fhnb/psOptDBrqk3hAbw3d6y/sOZ9m8IN0ik+sXXfsEJIoupcir+CrN6lgiQ
	==
X-Received: by 2002:a05:6a20:c78e:b0:39c:4e62:b843 with SMTP id adf61e73a8af0-3c4292dfacamr3611018637.10.1784712428218;
        Wed, 22 Jul 2026 02:27:08 -0700 (PDT)
X-Received: by 2002:a05:6a20:c78e:b0:39c:4e62:b843 with SMTP id adf61e73a8af0-3c4292dfacamr3610985637.10.1784712427768;
        Wed, 22 Jul 2026 02:27:07 -0700 (PDT)
Received: from cse-cd04-lnx.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbb8f18f08asm850677a12.21.2026.07.22.02.27.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 02:27:07 -0700 (PDT)
From: Wenjia Zhang <wenjia.zhang@oss.qualcomm.com>
Subject: [PATCH v2 0/2] Enable ICE for UFS on Hamoa IoT EVK
Date: Wed, 22 Jul 2026 17:26:27 +0800
Message-Id: <20260722-devtool-v2-0-d7e609ef7388@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMaMYGoC/0WP3YrCMBSEX6XkeiP5a2J75XssIic/3YZVo0kMK
 9J3N03BvTkww/CdmRdKLnqX0Ni9UHTFJx+uVbCvDpkZrj8Oe1s1YoRJoqjA1pUcwhn3ZOADIWB
 6Cqimb9FN/q+Rvo+bju7+qMC8mf+8im80QrEWOM3+N8LJxOcth1MLJYcnZqXt9USE7sci1g8aq
 m/C5eLz2ImBS8YHYcEqO0lpmBJmLxUwRattKDHAtN6jtcvsUw7x2UYW2spsDRj97CkUEwzWSc7
 BGC3oIaS0uz/gvL7c1YOOy7K8ASPSYY4xAQAA
X-Change-ID: 20260714-devtool-5093900ac51a
To: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wenjia Zhang <wenjia.zhang@oss.qualcomm.com>, kernel@quicinc.com
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=X4Bi7mTe c=1 sm=1 tr=0 ts=6a608cec cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=M4l5zgTsi59Zh--6b5wA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: pxgkn4HiR5aIdZFU3nGD7LamASRxOdtU
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDA4OCBTYWx0ZWRfX761/uBN3vUrv
 TnYCVpaLyIjmqnniDcSAFCH+XoHUZlVawh6FGSxqxZGyn1R1WYPjETQ9NSsNh751nuFPR1JuOFF
 mxAgQv+Xftm1xvs/7KzJz07Sm6Ry+Sg=
X-Proofpoint-ORIG-GUID: pxgkn4HiR5aIdZFU3nGD7LamASRxOdtU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDA4OCBTYWx0ZWRfXwhQVw0/5FMxr
 CeBDhqpDNKplx7wLRTTL/beYJEYebvFQDonw+zjQIo/dLVw1vsTNQfv2VA4cijt3ElD7tQzgMa2
 ZT1z/dHsqncBFe0jLw/AWJVoJM3/modaH32hHJTGKA8kjkAyy1Nl904khUvH5i8F5deSF+ZcCcJ
 4h0BAlkbMF05+amiOwEp3IEeCExDmDnq5ZM+fVZcJk30TzhXYCzr8Sn6OIUch7dAGq5btssiDtv
 ddB6uhHCItqRswsco1kDgre2cwyc8RL44y5b1Y3aOTsITzoH+6IbSOEJiXttlkXhwfNzSL8Yu3c
 8rTXavL9GyTCa+fpoB4R/WmAiQIkbg3oElgtOZMvt9e+xTNyc0IiIOFIMGfHvjCmhRBKLLKEXei
 Id4Fel+QNPbT+HXL9bJK+2ZRZuVMhcXxDi0Gmree8aUEjWBAnRCmUGiPROTGDmq2uiVbwzwNXIl
 C4YvSYZ+uV0s6VK0D7w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_03,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0 malwarescore=0
 clxscore=1015 priorityscore=1501 spamscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220088

This series enables the Inline Crypto Engine (ICE) hardware for UFS
storage on the Qualcomm X1E80100 (Hamoa IoT EVK) platform.

The ICE hardware provides AES-256-XTS inline encryption/decryption for
UFS storage, offloading cryptographic operations from the CPU. The
hardware version on this platform is ICE v4.0.1 with HWKM v2 support.

Validation:
- Probe successfully
- Standard key work well

Patch 1 adds the new compatible string to the DT binding documentation.
Patch 2 adds the ICE device node to the Hamoa DTSI.

Note: The allOf conditional block enforcement for power-domains and
clock-names is handled by the prerequisite series.

Signed-off-by: Wenjia Zhang <wenjia.zhang@oss.qualcomm.com>
---
Changes in v2:
- Improve commit messages for both patches.
- Link to v1: https://lore.kernel.org/r/20260721-devtool-v1-0-ade633accb41@oss.qualcomm.com

---
Wenjia Zhang (2):
      dt-bindings: crypto: qcom,inline-crypto-engine: Add x1e80100 support
      arm64: dts: qcom: hamoa: Add ICE node for UFS inline encryption

 .../bindings/crypto/qcom,inline-crypto-engine.yaml          |  1 +
 arch/arm64/boot/dts/qcom/hamoa.dtsi                         | 13 +++++++++++++
 2 files changed, 14 insertions(+)
---
base-commit: 49362394dad7df66c274c867a271394c10ca2bb8
change-id: 20260714-devtool-5093900ac51a
prerequisite-change-id: 20260701-b4-shikra_crypto_changse-f2d6d5bf04b5:v4
prerequisite-patch-id: d5bc84db11dfa16371755109d32bafa6325a7706
prerequisite-patch-id: f653bca04deb0f4fe7d51b3064644c8e6b0d9c99
prerequisite-patch-id: 615f80abf57c155bbc190c1a70fe615a783755cf
prerequisite-patch-id: 59d8102674ce98be1a0e9b4d7939ffd8a7289ab1
prerequisite-patch-id: 691ec3b8a386d2c5b991a4311236f7f06adfc5b1
prerequisite-patch-id: 5b949e801e9bf4b5593a1f7cb8f02709eb3e869a

Best regards,
-- 
Wenjia Zhang <wenjia.zhang@oss.qualcomm.com>

