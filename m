Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795180576;
	b=wk9jTo7wOQgjgxonmeJZy2G/ImwTNKV0hXI7x0di1IeGO50CP2/VMZow+mN4PfdCzXw8
	 ePMB2Uce5J5ihyIVTI52VtN/mlTD0viOm9ZaF8MX6Tuj+QAntZC06koc2E+M1FwvwrrPe
	 g/Z8yzlfzL1nqwZ7eBzJvxZx5vTRJFXo+MCN95ZEPPMggiGWRW9T82xHiUM5Oil1W6svQ
	 ABqKtG9uyaA/FpFZT9dZsCO1Q8IzUGD6S62Mf0rT4siKhMh0cRrGjzSirhVGqFV4WqVce
	 vINJGlaOcaXBWym/yIHKrztZE3m+l0JPNAwknXjg9WjocJx0ChRmBDFtqJ1wQYMRicw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795180576;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=vrg7+etryRTWAuLxtBfLDW2Eg3be2tf/bw8+JoHgpTs=;
	b=ybEepOw4MbyDClZpkYW3kgA5dtk9M/cTfbyzqvRQ9P8F5ycQFo2i51AQDQrnkXFrqmVI
	 ctZ9DYikdb0cXtoKcKmDjEM5LhXgFIU6wMIyCz+5hQUa/qvV6ZT38Gr1/1l86UksNXCii
	 zjOX7EyQeIAbWY9YuTPTmYqYTTe07l+SysWDNdvlzdq495Csbpn/bqCKFB6+cFOFwdgm8
	 s/27/IxZaGxv0D0UydlmNngqe+Zs4+ZYuzlbhDd1GvNnetKldB+2WB3dDUle+6QMR5j5O
	 jM2oYBwLuAmzEXQ3P8xpCF/CcNPNgTek/Y0pYZd59EM3YMF2YIouu7r8vwKpYrqM5CA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=V3ZV4l34;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AvaqZYe6;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50C88606A320
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 13:16:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50C88606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=V3ZV4l34;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AvaqZYe6
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAjxuL3731641
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 13:16:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=vrg7+etryRTWAuLxtBfLDW
	2Eg3be2tf/bw8+JoHgpTs=; b=V3ZV4l34St5ViD9sBos/yLnG6MfljMmIQTRPNc
	hJJsz305rEwy6KlERjMlb/if6ia9GVGBPjZDotLqZqLeUPnYjSvlMsIGvyxbjWSl
	0ez3E0Phv04tED0c9BTEcVekITHevAaoJQ4+Xo/iUy6ziOlxmfEuWrOEGr27GHnc
	7b8grH78Fg8ZiOiExFf+k4dGtaQsdICWd5sKxvN7HmOTlVRVjBBGwrn5vJxaP1XQ
	LJmXz271iRvTmk/pKk2jT1PtLHMrotz3uO+XtYJ4ufXb8cwiX9IO4pLL+5BUwYXB
	pJUPLYP60wxz5mOA6B7YiZ5cyFoMICMTOHQckhk+Suly5CXw==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2mm4gjw8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 13:16:15 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1b3b63b9665so862584c88.1
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 05:16:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795180574; x=1795785374; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=vrg7+etryRTWAuLxtBfLDW2Eg3be2tf/bw8+JoHgpTs=;
        b=AvaqZYe6rjNDNfK+fijZgLzLQRSPA8Nq7i4WQg42PMGQUF8f1FJF/vSzGonZdhBFRz
         dansS1ge9XKdQbZ/gFvUr4LybUDmr+dVjy+OU85cZhLXDiA9SFZ0vr7cZOlxHcYorHw0
         l4HUtfR9lQrTMwFNrs8fJHd/F41smEfd9EAj5E4SO03I/+K2RogNQBEFgzLg45lSuo7a
         TZ+P/fNEAq9D7EauH5Q/QsHNS+xHMt7aj28zr3pstItY/re2wkTzm07IETMtME15YxcR
         8X+9pP9WhJgJXQOIpa6OKTIALeqz7TCRuxxzdLR+aaEadCwJJB/Bm+6Wwk89+uHTDQw4
         d8nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795180574; x=1795785374;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=vrg7+etryRTWAuLxtBfLDW2Eg3be2tf/bw8+JoHgpTs=;
        b=rvxfTkWk09wCU6Y2xtfRZueVqZyrwEhmo2CDnZ7MK6RmStGathlpOUdNM7Y24cayrk
         E43KH0rpBnzRtze0OsLmSUiIJ4+spZKkwZzfZpZPhEzHL3JMO2LPKH9omUYcQ3Ldv/wR
         0+IWNiyZziUN8h62oC6pfzna5QbW/zFqkOIDo/LkSBobbj5Ehk83/z2LXm26po2pnkc7
         iTT6XMzW+tw5GsM04JDuk1alDhI3/fSEv36PdPJDaoXRo0GE2UkJwd1QXzSFXvuAJF5n
         cwodxuwpPoLNu/FL2SyYCiOMEwwFczSTC7xoHcgYfBdEIqfvm9wJ7YLKfC3gTgPE69zQ
         dpxQ==
X-Forwarded-Encrypted: i=1; AL+hErGcL67TEjgcMypMKTmfEo7udobufn9XXYiNuPG9IbFPGPz/16M1Jv9WUmt6Q0ijvVrobu+kSrS19KOW@vger.kernel.org
X-Gm-Message-State: APuU4Z8KxpFRX5c7FCKIKbGIHrziFud9tx0E1WrvorQGS8U2oQSDU8el
	RyVsrokmdfY6VlcEc2lFo6uHojszXXgZ0peZUJTvB559G1nlxpbdFcx0lEUvTgy9EjY/GIDEiPl
	y4i1pmMvitG+sF47v0XFlPN0DST3EpmK9VQQ/TVDt/ayG4bVlz2ttQlI6i0yNx5tx
X-Gm-Gg: AYBFou3qNASG92B0uC0+LM9RkJqD3o78N+SaDGuX2tpTjwgZNEedEjlZm03EUOSnPBP
	IqQvgt3VF4WFNooaTc4x7WOMKylOa/GUYKyz7PO4nJoYssc8/+rHeVUAyMvGGlJLIohOvABcdPw
	sdI/xClEuY/2OyLCvzZ7nlfILs/8OSJqygULYFlBmQo9gbVUCkUHYUq54zqNa9tcWZNmFd1sEof
	E8y58jFJOLfUBkJO+jq2VQ6M39daIXOjAGWmtA/sqqnKMAKlsnGS+0unwQlXjOc+RD19wKx/CUN
	PxVb27R/MBRivEaAzWwmH1+eHX7/SJiouk2TXNrsjONDWdU0d+VOI/na5HUfEsQOxilowJKPkM7
	fCs2JS36Of3+H0PlopneYOjcxpvk0HZsgg6qJbZK0kcFdUddhj8gnoy0HBpxS2oSO
X-Received: by 2002:a05:7022:3a0b:b0:1a2:fa1d:1de5 with SMTP id a92af1059eb24-1b5568d861cmr2753998c88.20.1795180574035;
        Fri, 20 Nov 2026 05:16:14 -0800 (PST)
X-Received: by 2002:a05:7022:3a0b:b0:1a2:fa1d:1de5 with SMTP id a92af1059eb24-1b5568d861cmr2753975c88.20.1795180573332;
        Fri, 20 Nov 2026 05:16:13 -0800 (PST)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b55684c85fsm10494874c88.14.2026.11.20.05.16.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 05:16:12 -0800 (PST)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Subject: [PATCH v7 0/5] arm64: dts: qcom: Add EL2 overlays for Shikra and
 SM8750
Date: Fri, 20 Nov 2026 18:46:02 +0530
Message-Id: <20261120-shikra-el2-v7-0-b19595f24eb1@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIABNIAGsC/3XOzWrDMAzA8VcpPs9F8rd32nuUHRRHWczaZou7s
 FHy7nN72BJoLoK/QD90FYXHzEU8765i5CmXPJxr+KedSD2d31jmtrZQoBxEDLL0+X0kyUclmUJ
 0UQebdBL14GPkLn/fscNr7T6XyzD+3O0Jb9uHzIQSJfimAa8aIo0vQyn7zy86puF02tchbtqkF
 oKGlaAkyA6CUg1bIuYNQf8JCGBXgq6Cw9B5bbSLNm0I5l9AMCvBVCF69oCx5abrNgS7EFCvBFu
 FQIm80S1HvyW4pRBXgqsCcERC4+or8YEwz/MvT529xvUBAAA=
X-Change-ID: 20260918-shikra-el2-ea8969385c3c
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Kumar Patro <bibek.patro@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795180567; l=6584;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=Gn8GKKFb8CdZcuwQevOhAFcs7R26w3NdGhQp1McDMxE=;
 b=VfddK1nevjjO2ait5eY6DXoq1oc5lDNf1pTVSdJo++YF1qcqWEHKUxwl055auj8ZCR90GLAxt
 9vuIWVknrtiBFOAnQX6cVOsxdLfnaDIytHCEBOuz28eVdmDjYHx+iVy
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-ORIG-GUID: hhSmBUoVMRWOL5e7LRI2TnNoGeQy7qk0
X-Authority-Analysis: v=2.4 cv=RZYFmFtv c=1 sm=1 tr=0 ts=6b00481f cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=7yht7nwCIrXBMJmmVpIA:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA1MiBTYWx0ZWRfX5epr3nd04a2Z
 3pF1PtcWIUyT80BD/QgHIkA4dkHC5goR4IdeZvVcIU9QUmV8rSBl7SfuicpyPN0TXI87IXb95aj
 Wn1qsSHZ6MbzlwqRDEQDXgZ49MEHIPA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA1MiBTYWx0ZWRfXyvpkfcT+u5ep
 ZDFod9OFsO7EVwfQ5M/JyXx2cR7TNdI6QTFlCxluTg1XRheIeZTcPsh/DgPmaPuPCp8W2c3xWwV
 JbQKwfPl1C7MVUOFjamOFcPGrqQZd+IcCTBY4a+h1IbvkJduUuu93YVBsTsPGnJVW1Egxfo10a0
 zcphU9DUTf91Ug22IYGzERO0c7XEqO72+ikHU/ybM/QvfuwmS3AsH2VjL8D66CivsxxSY/CvlJK
 Cw2Qydd1ryvnssJ9H4AsagM5+VEYGCnLrjkUtq3aJjYk2bLuhkeMv3fUAjaiadEyy4dFwP4KDzD
 vSlYGEmpXTUI3cOzTOC1UjUPowxHaw+sgiQZbRoFKeVD9PqcTuoI7oWjVx2GDClb9jBVYj26eyQ
 83+6IC8VzXyrA798wDi71yBQ7YIk9ZxlWCs/T+udtbD1MSvyuVddoUOwop6N7w/aeEBsS4BDgd1
 nzRp8rzzJUlu5u5+rzg==
X-Proofpoint-GUID: hhSmBUoVMRWOL5e7LRI2TnNoGeQy7qk0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 suspectscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200052

Shikra EVK variants boot Linux under the Gunyah hypervisor (EL2) by
default, with Linux running at EL1. Booting Linux directly at EL2
requires the remote processor firmware IOMMU streams to be described
in the DeviceTree used by Linux.

Add a Shikra EL2-specific DT overlay and wire it up in the Makefile to
generate -el2.dtb artifacts for the Shikra EVK variants alongside the
regular DTBs.

Add a similar EL2 overlay for SM8750 MTP, which also boots Linux under
Gunyah by default.

The series also moves the Qualcomm PAS remoteproc iommus constraint to
the SoC-specific bindings and relaxes the item limit to accommodate the
remoteproc SMMU mappings required for Shikra and SM8750 EL2 boot.

Komal Bajaj (5):
  dt-bindings: remoteproc: Move iommus constraint to SoC-specific bindings
  dt-bindings: remoteproc: qcom,shikra-pas: Add iommus constraints
  dt-bindings: remoteproc: qcom,sm8550-pas: Allow 6 iommus for SM8750 ADSP
  arm64: dts: qcom: shikra: Add EL2 overlay for EVK variants
  arm64: dts: qcom: sm8750: Add EL2 overlay for MTP

 .../bindings/remoteproc/qcom,adsp.yaml        |  6 ++++
 .../remoteproc/qcom,kaanapali-soccp-pas.yaml  |  6 ++++
 .../bindings/remoteproc/qcom,milos-pas.yaml   |  6 ++++
 .../bindings/remoteproc/qcom,nord-pas.yaml    |  6 ++++
 .../bindings/remoteproc/qcom,pas-common.yaml  |  3 --
 .../bindings/remoteproc/qcom,qcs404-pas.yaml  |  6 ++++
 .../bindings/remoteproc/qcom,sa8775p-pas.yaml |  6 ++++
 .../bindings/remoteproc/qcom,sc7180-pas.yaml  |  6 ++++
 .../remoteproc/qcom,sc8280xp-pas.yaml         |  6 ++++
 .../bindings/remoteproc/qcom,sdx55-pas.yaml   |  6 ++++
 .../bindings/remoteproc/qcom,shikra-pas.yaml  | 28 ++++++++++++++++
 .../bindings/remoteproc/qcom,sm6115-pas.yaml  |  6 ++++
 .../bindings/remoteproc/qcom,sm6350-pas.yaml  |  6 ++++
 .../bindings/remoteproc/qcom,sm6375-pas.yaml  |  6 ++++
 .../bindings/remoteproc/qcom,sm8150-pas.yaml  |  6 ++++
 .../bindings/remoteproc/qcom,sm8350-pas.yaml  |  6 ++++
 .../bindings/remoteproc/qcom,sm8550-pas.yaml  | 30 +++++++++++++++++
 arch/arm64/boot/dts/qcom/Makefile             | 15 +++++++++
 arch/arm64/boot/dts/qcom/shikra-el2.dtso      | 33 +++++++++++++++++++
 arch/arm64/boot/dts/qcom/sm8750-el2.dtso      | 30 +++++++++++++++++
 20 files changed, 220 insertions(+), 3 deletions(-)

Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
Changes in v7:
- Shikra: drop the q6apmdai node from EL2 overlay (sashiko)
- Shikra, SM8750: fix the subject and commit message of the EL2 overlay (sashiko)
- Link to v6: https://lore.kernel.org/r/20261119-shikra-el2-v6-0-0e91a1467e79@oss.qualcomm.com

Changes in v6:
- Define iommus with a description in the top-level properties of every
  binding referencing qcom,pas-common.yaml instead of in conditional
  blocks, making patch 1 a no functional change move (Krzysztof, Mukesh)
- Reword the commit messages
- Shikra: allow up to three iommus entries at the top level, require
  three for LPAICP, allow one for CDSP and disallow iommus for MPSS
- Shikra: drop the per-item iommus descriptions
- Add SM8750 EL2 overlay and the corresponding binding change
- Link to v5: https://lore.kernel.org/r/20261113-shikra-el2-v5-0-8aca743de97f@oss.qualcomm.com

Changes in v5:
- Declare iommus property once in top-level properties of qcom,sa8775p-pas.yaml instead of repeating it in every allOf branch (Krzysztof, sashiko)
- Add Glymur ADSP/CDSP compatibles to iommus conditional in qcom,sm8550-pas.yaml
- Add sc7280 ADSP/CDSP compatibles to iommus conditional in qcom,sc7180-pas.yaml
- Add a description for each iommus entry
- Shikra: list three entries for LPAICP and drop the iommus property for qcom,shikra-mpss-pas (Krzysztof)
- Link to v4: https://lore.kernel.org/r/20261104-shikra-el2-v4-0-97e7019debff@oss.qualcomm.com

Changes in v4:
- Add a patch to move the iommus constraint from qcom,pas-common.yaml to SoC-specific PAS bindings (Mukesh)
- Add iommus constraints for all Shikra PAS compatibles instead of only relaxing the limit for LPAICP
- Add WiFi firmware iommus to Shikra EL2 overlay
- Link to v3: https://lore.kernel.org/r/20261005-shikra-el2-v3-0-618f7343695c@oss.qualcomm.com

Changes in v3:
- Drop qcom,pas-common reference and add per-compatible iommus limits for Shikra (Krzysztof)
- Link to v2: https://lore.kernel.org/r/20260930-shikra-el2-v2-0-f0822be5aaee@oss.qualcomm.com

Changes in v2:
- Relax the Qualcomm PAS remoteproc `iommus` item limit, needed for Shikra EL2 remoteproc SMMU mappings.
- Link to v1: https://lore.kernel.org/r/20260918-shikra-el2-v1-1-07bb072baa31@oss.qualcomm.com

---
Komal Bajaj (5):
      dt-bindings: remoteproc: Move iommus constraint to SoC-specific bindings
      dt-bindings: remoteproc: qcom,shikra-pas: Add iommus constraints
      dt-bindings: remoteproc: qcom,sm8550-pas: Allow 6 iommus for SM8750 ADSP
      arm64: dts: qcom: shikra: Add EL2 overlay for EVK variants
      arm64: dts: qcom: sm8750: Add EL2 overlay for MTP

 .../devicetree/bindings/remoteproc/qcom,adsp.yaml  |  6 ++++
 .../remoteproc/qcom,kaanapali-soccp-pas.yaml       |  6 ++++
 .../bindings/remoteproc/qcom,milos-pas.yaml        |  6 ++++
 .../bindings/remoteproc/qcom,nord-pas.yaml         |  6 ++++
 .../bindings/remoteproc/qcom,pas-common.yaml       |  3 --
 .../bindings/remoteproc/qcom,qcs404-pas.yaml       |  6 ++++
 .../bindings/remoteproc/qcom,sa8775p-pas.yaml      |  6 ++++
 .../bindings/remoteproc/qcom,sc7180-pas.yaml       |  6 ++++
 .../bindings/remoteproc/qcom,sc8280xp-pas.yaml     |  6 ++++
 .../bindings/remoteproc/qcom,sdx55-pas.yaml        |  6 ++++
 .../bindings/remoteproc/qcom,shikra-pas.yaml       | 28 ++++++++++++++++++
 .../bindings/remoteproc/qcom,sm6115-pas.yaml       |  6 ++++
 .../bindings/remoteproc/qcom,sm6350-pas.yaml       |  6 ++++
 .../bindings/remoteproc/qcom,sm6375-pas.yaml       |  6 ++++
 .../bindings/remoteproc/qcom,sm8150-pas.yaml       |  6 ++++
 .../bindings/remoteproc/qcom,sm8350-pas.yaml       |  6 ++++
 .../bindings/remoteproc/qcom,sm8550-pas.yaml       | 30 ++++++++++++++++++++
 arch/arm64/boot/dts/qcom/Makefile                  | 15 ++++++++++
 arch/arm64/boot/dts/qcom/shikra-el2.dtso           | 33 ++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/sm8750-el2.dtso           | 30 ++++++++++++++++++++
 20 files changed, 220 insertions(+), 3 deletions(-)
---
base-commit: e8017d29067fd1310a65c3494ce1a1b492adbac6
change-id: 20260918-shikra-el2-ea8969385c3c

Best regards,
-- 
Komal Bajaj <komal.bajaj@oss.qualcomm.com>

