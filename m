Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794996311;
	b=OIIfUzI/anFJrQwsqR62NCivZTLBm3ND+eQ2fB60MhEHLamCp1+VuF+wWtC6y2pVYPtm
	 NxElgaNIZGsZQ4mcvZh0aDAKBBPl5rYW4m9wmQmfvh7jTJMNU/aFh3R+uzLcegECrNygJ
	 HWaKzIAO5NRQ/bcmt5nJjxTnwfzTDdyB7tnQIcLTr/stuLGss5THCG14bhTcJ0MlcBqbz
	 4lCBunZZHZT5EJ2JaVBvSOb8+16YddgM7fvB7/dmN5ZLQTepmvegkLmyMXSdy6vmVYp8p
	 yLwTqrUOrDYK/Yp4arSu9QGI+UoVLdF/kpNGd/ye0o7Huw4xiJTyWfv9zUnNzb0PvBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794996311;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=i+6tpym98MAYAOwimK86ni0rb2mcq3dJimT4WgymRsI=;
	b=nBRrU7ZHuTS/WZmp6FRoukGOe/iSXu2DT0DxM8l6ZjGCcFd9af3YXR7rur/b/qBV2xF2
	 ttve0vsYT2YmSJu13gpEOsxhXSn31Z2WkL7BR/TIZ7WFa/CiK18nK6+MYLcUFWVCxIssl
	 QuyOrJyMKCxiuSKgXz5ozauJr1eHqusgM2kwrAYnOcvXRajlcse61hE760CL1ATRdiBZJ
	 qhyHkgBteY7WbjEHfoAEG0SWRJ0UakJfaGNUqO3rJnaabtychZFoj3g/Z/srgDuW60b2s
	 OAVwYgykm1yNY0791g5JeDtsEMtNwkTNkYAHTyITxGLUCjx89Qed4xUMra3CfWmbTaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=K042lPMI;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EexNY1JF;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA191606A32F
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 10:05:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA191606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=K042lPMI;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EexNY1JF
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI9lePx835347
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 10:05:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=i+6tpym98MAYAOwimK86ni
	0rb2mcq3dJimT4WgymRsI=; b=K042lPMI33MpMUHNBF3KLatffLSuRSL4VYpPm1
	b08sNZILcJKNZGEUijYcfx9byNa5n7HLX6ECacVuXQf1JlrGVFzyB9G76vR7m6KF
	NU6ZGipaxzFmi4IawW54JAWcjpqhN/pLW1X3+6n4DDFJYAqFdRTdgNTvBIyaKybc
	jvLuihZWlT2Kp3eOSDcg88J8XnKOXFaOcL3MtYR6I3TaV5sMgEVlhk0jCG24oURN
	bAwNJidg6X7GKieaZh1tqU6FJ317X9op78xKCZTui1FAhRLMqZIP/4arjWSPARDI
	PvB20h9KCYC77FY8KNx5Y3X1Xdhnaj6VR/cFO7BhtTiccDJQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yvcjg38-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 10:05:09 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9496ff065bcso120643785a.3
        for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 02:05:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794996309; x=1795601109; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=i+6tpym98MAYAOwimK86ni0rb2mcq3dJimT4WgymRsI=;
        b=EexNY1JFAFcSrnsCX3oqihqw2h621KYC74UObL+3en5FgTKOsFlnVPj+jL3IBXW6Gx
         tyJIxFHWt9YVgJ3BXzpjyHLaGwfCztJexXG0LlgVbRnKuReO6u5aA1+mp47RFTsjb2og
         Ho8kxruDBDratuBemcV24lCf7g0nf5H00T9s1hG/QJXiJGK6lzHMvpeN01du1zqBMu7q
         a0OBgLP1dIMUGZNdHmDZyjAi47lAuxOHFK8QaS1WO+NMLUTXCXzoK3RD2Mg3ZJtcaOnR
         oFsAwicSoA20vfjyK2vbatoMXmPEaPCuywt6W7tbnqGmtiZPIFms+sfjXiD1q55F1MT3
         RZaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794996309; x=1795601109;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=i+6tpym98MAYAOwimK86ni0rb2mcq3dJimT4WgymRsI=;
        b=IR7W9jHdVE1Zc4cSH+coJt8jQQrK9ylAkCe61eANkEl1+HBGhDQNQwoX1XeLowgrBu
         NQAcGvq8cKrG9UFl7ivFtmyrokfjVYdAjTknRZc47ufm6t+1QNleTEdxqsAnt4qZ4CFC
         IBw78XGKIANS+1UkHpE0ad6d+yW9eQL914TXjt4TbPwiAKTKTbSuQLSyC9FDIsVlrK+9
         LAxcM+ROL7R3GSXMjTPGkW7S7gA+KQiZ/P0r5qYBO81MduxrFieGibbY52rOdlEaIYaP
         akBSLx4W3Lp4zqVT0bpQ74AFqaNFQB68YOxUv05px7XuXjS4m61ouf+ucybipq8Exq5q
         T0Hg==
X-Forwarded-Encrypted: i=1; AL+hErG3Hx22Bl9Q+YFS/iNF6rJZM/Y5cOcUsT2mNukcp98Rdo3FdbKsZjNRtPClkq9s3NGwUv4T3SFtz086@vger.kernel.org
X-Gm-Message-State: APuU4Z/VCPRDlt+DfhqEgOGPQOlk/CozfN5LBLrClDFS0opIG0w13LMs
	NHrEVCLcNdhEUo0WJvmjam9kusWVAkKMUIcz4K/AvTyBDlqnooFKSd2ytiPqwHqXySxhtzc5mdD
	aOTAaVqKmlFA7y+l23cFwpnctMYe9UbQOL7Ax163uDdc1uKJ+I2HCPoZF2wqAl7X6
X-Gm-Gg: AYBFou3iKDKQQpiUUKnMIUh9XzzPQg3+f3Z+StxymRfS4ywXcB8RNtsKnVDnGwHDTb9
	3yxcXPX+BDVCrbY5y9RUBdamXcieH5F6Ds/bI73aTItXSvx24cR6i7pIj97enXMJhjzOVvgW0Cd
	VM0mMgtMz6bvUXCYQ4kll8fAEKcRVigMM+86U0exto5GTBW2CmdVXZzwomVVkh7hQb+dJiyi+33
	JKH8/pqxWgmox88NI6U6B+j5aCNJGoJz0ciLNuBuowRGOPlhz8uUZDSr9h2Gg46OturFXCXsXJC
	rc6ysE24MBSd7x0pGzO+zmJuaHNmpCwPPA9Ha8cjbYytYahH7CBkn78vHZ5tupsUnJJJ+qsepks
	VZPsruJ6/PVxlBJeGHqwMbJ/QZJfr9BSstpNuTVDKUGpRooPQgWpFl2SpJWeE6zc75LIM00kJ++
	k=
X-Received: by 2002:a05:620a:6e8b:20b0:949:a254:706a with SMTP id af79cd13be357-949a2549880mr58800685a.14.1794996308922;
        Wed, 18 Nov 2026 02:05:08 -0800 (PST)
X-Received: by 2002:a05:620a:6e8b:20b0:949:a254:706a with SMTP id af79cd13be357-949a2549880mr58795985a.14.1794996308217;
        Wed, 18 Nov 2026 02:05:08 -0800 (PST)
Received: from brgl-qcom.local ([195.50.164.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a65609389dsm3735509f8f.37.2026.11.18.02.05.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 02:05:07 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v3 0/2] arm64: dts: qcom: sa8255p: add ethernet nodes
Date: Wed, 18 Nov 2026 11:05:01 +0100
Message-Id: <20261118-sa8255p-emac-dts-v3-0-e2c365d95a0b@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAE14/WoC/23NTQ6DIBAF4KsY1sXAIP501Xs0XVDASlJFQUkb4
 92LNo2LupnkvWS+NyOvndEenZMZOR2MN7aLgZ0SJBvRPTQ2KmYEBHJKALAXJXDeY90KidXosbp
 LDjQDCkWO4lvvdG1eG3m9fbPTwxTlcS8b40fr3ttsoGv7W2D/C4FiggXLVFGUUldCXqz36TCJp
 7Rtm8aDVjPA7lBy5EB0CK8rxrmqqzw/cJZl+QD14GueFAEAAA==
X-Change-ID: 20261022-sa8255p-emac-dts-dbc521421276
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Andrew Halaney <ahalaney@redhat.com>,
        Richard Cochran <richardcochran@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1947;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=SYilKXB3pqBPaa42ESLbf2vTCnrWgL4ec3Gduqh6u7Y=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq/XhQReghUUWGHHaRMvfcY+ooGv2Ptz8UU2OgF
 flsn+Tnc/6JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCav14UAAKCRAFnS7L/zaE
 w6/ZEACGblRXOtYlsin++5GIgERHGsqoBOGVAIz/VBA7uFy0IW4M60FZvIltZAPVMiFxg/wsTmq
 Z0x7FiErlNYMpGpLxlDMiVUzdVYXdLqKYMOONDB6ydzHzQhNVBgC0nPqF1aTf2ZigUSuVCb436/
 Tq1Ki+/3qKERA1g+t9m+oQpx+wfeti+8FJPj4W/xfKGBrfG7WeQJhhseJpGLeH7onh/2MGJ9dSa
 4BGgzfRdFzYGKaYgtYgjRYJ8PCHsfbiHFvifbE28Q0wbn6E7ASZCUivP4JGchG65fxwigzu2Fxt
 ecgiF7Vlt7UsdJWYvVHdfQytdf+eKoujPaY0d0yQttt0E1KBS3JGPaEfjtLouqOiaKtkE2ZGaq3
 D+mdUWBUYWTm1w1yaJ57C46qc9uKZj5rgyKk9j7f6pt81Y6kzkd5DtaD78CXbpPwaPBXyuJRK/N
 hEgFviYuOnCfsrYuht10LwyLMqvV0DjGj2Nited4VyHbP2DSW2tj7Or8I/WQOKAYm2WxR9dy2T4
 O0Kaus34hmZBcBbPyIEDAS5gCdF4V6jz3WndfPyOz/haSbF+t4dZAKn5tyzqxC8KdCXTCyW3rUx
 I4Iz7z0EisOjZkbohOUUZ2z8nufEbjRWc4VtfsRltiIeisGAre+M7sHMu5b0NW5rBxuNRLMNjA6
 x/LfoQTsnnpEnwQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=R5OWitRX c=1 sm=1 tr=0 ts=6afd7855 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=Jk2/TV77q6/E6wQq2oQJxQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=Tejp0hr6YFsyB7xwJ1IA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: kWUl5SMFarz2_BJ9t0EYLbBrHar8jKal
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAzOSBTYWx0ZWRfX0HqU30yE98QF
 lnw6RFcczJtczVBuAO4X7juXwrIhZ2OEvSBrrb3yj+zwwT5qgEu7zhxpy4n9qcb3U7QLL9TjRkk
 nz7u0ddQIL0hfQ36n6g0HxS+nEXZW7g=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAzOSBTYWx0ZWRfX/Ovr3P1qLiDn
 6JCcSVvSKI/nSY8UDqEVhGb9O0oUSQ9bsskafqDuV9xn34w1j8m4fVjJeyYaiF6exVq3p+VhW+m
 hM82DWjnsbAE82FvcaWnJgKDq+BvOGIdm0uJbf/X/Nw6pLtDGFMmlLnhgnjwNXM0c6omjO8IEK8
 4n/Xoe7Z2Xig1FNXGaOApBQ5pTzFOEK2NyRFsfQrG6aJXdNEH+RJl36FYZM8CpEjbcq8IYEzbP5
 sGr6QpYmbposaW6+ExMtOXTvx5wuFvMAOjnlw7skAhrzcH4WiDodbgBn1Ytb8xhVIvNFyd0qH5R
 xWrjwuCSdyxr3Emcx7nR3ETIj1wJ0XQkRCYM9yViHbu9nyPK8vcflpAphz71iIMgE+7XAA+1AiF
 NWcitv7qNCMC88G3BLEY4DwLjcQfOy3DG6XoiE1uacg1mUZHRNyn88zoZ/Np3OSeEFKYoSrzVjW
 lQFhm+cZJOsmFRlrVvQ==
X-Proofpoint-ORIG-GUID: kWUl5SMFarz2_BJ9t0EYLbBrHar8jKal
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180039

This series adds the ethernet nodes for the gearvm variant of lemans and
enables them on the ride development board.

The first patch is a fix to the iommu SID mask - it was wrong all along
but only triggered a crash with recent firmware. This should be queued
for v7.4 and backported to stable branches.

The second adds the ethernet nodes for the sa8255p SoC and enables them
for the Ride platform.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Changes in v3:
- Move power-domains and power-domain-names properties for ethernet
  nodes into the gearvm variant .dtsi
- Fix sort order for nodes
- Fix PHY label naming for ethernet nodes
- Rebase on top of current linux-next where all dependencies are already
  available
- Link to v2: https://patch.msgid.link/20261103-sa8255p-emac-dts-v2-0-05f9355df966@oss.qualcomm.com

Changes in v2:
- Fix node extension ordering
- Move hard-wired serdes phy references to the gearvm .dtsi
- Rebase on top of v7.4-rc1 and v3 of Shawn's series reworking the dts
  layout for lemans
- Adjust dt nodes for dropped power-domain-names property
- Drop patch 2/3 in favor of overwriting the compatible property for
  the sa8255p variant
- Link to v1: https://patch.msgid.link/20261023-sa8255p-emac-dts-v1-0-a34d778ce9ac@oss.qualcomm.com

---
Bartosz Golaszewski (2):
      arm64: dts: qcom: lemans: fix iommus SID mask for ethernet nodes
      arm64: dts: qcom: lemans-sa8255p: add ethernet nodes

 arch/arm64/boot/dts/qcom/lemans-gearvm.dtsi      |  34 ++++
 arch/arm64/boot/dts/qcom/lemans-sa8255p-ride.dts | 201 +++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/lemans.dtsi             |   4 +-
 3 files changed, 237 insertions(+), 2 deletions(-)
---
base-commit: 7cfbf79c66c63e807ea452abf0546e6f6d6833a6
change-id: 20261022-sa8255p-emac-dts-dbc521421276

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

