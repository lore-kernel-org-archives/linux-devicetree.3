Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795088637;
	b=orxePXUTbp1IBCLXAuvXpnoGKEDCTL4wWvMajXf/veUtv/D1VCaUWj1kq7EYtPyMJZGs
	 tSq87sov6Rvmj0V1cJj7CxMoA/RYtP4TuAM/CverHAhADEau89NczLvGNIJBMvDHUhJE7
	 gwuV4sQmrQQjdZPpov1I5Q756eFAf1i8lFgmRcQHrEnx63v4j7UBimfP1jrzb+dUsU8F1
	 b8ueQIYNvD2WTz+vke6CCUMyyuqQi3+mXn4kx2JcgpNHnmz8f52OmhGqH17k/K9KS6jOg
	 XZLPFo4/xTLEA23LIN0hxP5c04mUUKv7yfnXueTSjb7YS6WQiLsRkD2Aqfv2kwhfgoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795088637;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=9xOgOHgiYG8x7M9rRTIBGrT1trNfPalsKi+/lvyMD4o=;
	b=ctS53zKr0RMCJuhWICkiurIa/qsLEzC9x7umz75qTouImpQHD8QU3cr0ldJfZBxVH+td
	 CvYY8w3Tq8Ji451I0RrZrU/Tm+rkUKQqiJYmPT8vLj3GbsLGssp24jG9PncCEOF4SlyG1
	 VT2wLiuDfeyppXZ3o9d3bTp4MJUG2HUbb6nI81lvqAe5z8v7FPnxOf7vIGurIi42GWD1n
	 3qJQ2Db4f2aE1U7+No3Ubc9czdRvz7z6hXX+mplqHGZ0LwQYzcpRq7rAbQ/c56Z88rsI9
	 mkxpdGv/4UmoiBiNNCCdeKf3+bg68lSxKBaT2thMCDeBQ8eTNtHqV87fCDWy8CoWnNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hlOQRU86;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=H0yNEDwZ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF555606A320
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 11:43:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF555606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hlOQRU86;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=H0yNEDwZ
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJAuh9N869675
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 11:43:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=9xOgOHgiYG8x7M9rRTIBGr
	T1trNfPalsKi+/lvyMD4o=; b=hlOQRU867W7F/ZcZ/Iwh6RmgM3lid605Dl9KcT
	olBroo9a3D3N1I4ew5orJyDd/WCJaKrkgcvg/uD9VTkTNEXXTbvN4PCGwrsAnpWB
	tcvh4wFIXRE+QmTwFQzB4A7L79x3pmAccog0dVQXoPnW58lyZX8HpsN5gqfaOKcI
	QxOaEEckdQ/oenI59HHrvS86tphhlQGfQan5O16fxY57pBKD1Ryo6qxPgg0BzG2O
	+bG7aJ7agfhL0QRfBZQyh/zNfkF29JpdAA7T/ket5K23F6mnyGj1YzexUZemHLWe
	IdlHLr2zmuTNZS0XyQby0gPDNxp4J/4iI8pApyIn9AdnMhYA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1fpnmb7s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 11:43:55 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cddf34086c8so1325028a12.3
        for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 03:43:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795088635; x=1795693435; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=9xOgOHgiYG8x7M9rRTIBGrT1trNfPalsKi+/lvyMD4o=;
        b=H0yNEDwZERO8ulDZbasZMXiWb8n9INGwTWcks7menY45TkKRaaAP8FsIXOaJhUrUZl
         Pdu1JnVdjHyw0izY6w+miuUkBd5+h+k3PICaN9j/PcbAbNfvo3CBGmqVvtqxVlIkZQre
         vS+cJnnnZm6AWISagfXP8zwlqf2+tO8jz7w01/nONjwfh11Gd2N7RvabfjdLXo+T/eIN
         VEG2xN+P+SgaTxyBrvh/UPHb4uuq3mhqfh/TVKO/Qs4z8XeX8IK5hXW/xtaZO8LloQoI
         BhPp5TqxOKpJ0uiGyGB6KfvEXVlefqiYngzyuKSZ/qeCY6NgDvbY+6S6rDS+95poFlFp
         LlKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795088635; x=1795693435;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9xOgOHgiYG8x7M9rRTIBGrT1trNfPalsKi+/lvyMD4o=;
        b=NiJ7UzUHJG3wbUIomOLwm6NwzkaEqoQ6zmdi1s+W7zhtOl1aeDzAPLM4rUbkP23gsA
         viFwDiRrFm72YslyD201BNrRicGmE2OUdYSAl78/KobOU+MA+TVn2sJlOFk+9G489CPF
         ja59b1hBG2ypP5tnM6Pda3OyonctXdqJ4FP/htgSbsSxU6H0FXYf6XFihE+lkAe4YUb/
         kwpz05RXAYKZTo5/NT4lgPHaTFIuQGxdrEv9Mahyr+X+7vrEyeTRElpBB0E/enajWMCE
         VEawOQ/NMB728iGc1AAFbc42fc71UhFhUuZiQGF10fCQBEiZd1gffVVl4tPWJarjX7Lj
         7vVA==
X-Forwarded-Encrypted: i=1; AL+hErEDh68dlAouEA84938zf3U2du6VXDLnbng7Zi3iY55c8i3paztMU2GE57xeslkzDEJ3N5/+jH+S7DHx@vger.kernel.org
X-Gm-Message-State: APuU4Z/ostC/7gn5HciU3Kn6ABMpzVBJW7hkTKYoJUAbgF49j9frXx6H
	ite3DOeqx/HuokoEfM8ik+dbuZ2k9HBkulOlOtrPQpxUxgF/E51aZ0MGWWihaSWbYYC3Fka/9Sy
	RQ9HQEoZzsxTscTpKWptfnbRXVQvelWKUCFzDyiW3vQIFG20tyqHxWupIL3EYQmH6RfOkaw+C
X-Gm-Gg: AYBFou2aycqPNvYH1GVAlRQWWgThdG6hkqnz991yc1T/uLEM+FsCs5Fz/GWutInxVjL
	p0tlEoYkRZhFLLIOnr2N+JSqU0kT5gphgViJOvDqxJvfuoMWU7nt4GftY3DMiCua8/5ZGBrmiuc
	ixvuYn0yNb7DQyHaK6/pWj4ckwBon9Psl6x8i0ggAGzzH6eSF2+shS7RQcGWV7/dXl5MwYLWXYS
	1vAr+PUdJYWJdWKVjovQvELi587TpN3fGemlKEFi7ESVJdyIAb3RH8FBESbDsDAVkOcu/T6OYvv
	P6nOtd97FcAKfpL5wdLMbz4oQuoQgOAPSqQGjxvE0cDH+GbVIJW4upkiwBn4JEo6BI67KkU2r5/
	3Q6O7fsn8OZOG77X2pBSoNbceVssR1FaFhtHoKgHozDzMNaYaFBkKHDgaS//pzut6
X-Received: by 2002:a05:6a21:6b87:b0:3f9:4434:8a0 with SMTP id adf61e73a8af0-3fe86bdc716mr5718030637.2.1795088634938;
        Thu, 19 Nov 2026 03:43:54 -0800 (PST)
X-Received: by 2002:a05:6a21:6b87:b0:3f9:4434:8a0 with SMTP id adf61e73a8af0-3fe86bdc716mr5717992637.2.1795088634277;
        Thu, 19 Nov 2026 03:43:54 -0800 (PST)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde534854b1sm1613960a12.12.2026.11.19.03.43.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 03:43:53 -0800 (PST)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Subject: [PATCH v6 0/5] arm64: dts: qcom: Add EL2 overlays for Shikra and
 SM8750
Date: Thu, 19 Nov 2026 17:13:43 +0530
Message-Id: <20261119-shikra-el2-v6-0-0e91a1467e79@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAO/g/moC/3XMTU7DMBCG4atUXuNqxv9mxT0QC9sZE4u2ARsiU
 JW743YBjdRsRnpH+p4za1QLNfa4O7NKc2llOvUwDzuWxnB6JV6G3kyAMODR8TaWtxo4HQSn4Lz
 x0ukkE+uD90q5fF+x55feY2mfU/252jNevneZGTlysDGCFTEEiU9Ta/uPr3BI0/G474ddtFncC
 BJWguDAMzghIukQiDYE+ScggF4JsgsGXbZSSeN12hDUv4CgVoLqgrdkAf1AMecNQd8IKFeC7oI
 LKVglB/L2nrAsyy8gB1H+swEAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795088627; l=6383;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=0WpEzlt0mQSvD6sTU8HqGw5ZuK6nv7hwJzVaeswCIUg=;
 b=0ew1Jg50O6cTm5/wpXKrMWLl/ps1jI9gUTAYs/LopMF0M+2tQOhLkFUlaUKhU6GdhqOePmy3h
 WacBen3Ie+UBFuFj5jfSHe63dc4IM1jyOKnEUu2Mk1Hl7mqo+h/QqlB
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-GUID: cB9_GgAevQBHLy7JlFy1542zh39pW9T7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDA0NiBTYWx0ZWRfX4Q3Yf3IjUMf0
 Bo+jHTcaePhmKu/2uTBGXg5kt2PgZ0Zi3yMqNBHEYMNnk2st0T8N5Yo50suAoTPjloW+HDxlopV
 +zsWofNBLvqGK3GV6Kh6zSLmcDLc4/N/4eLxTIeNWQ3d1CPrNBz44442yEWYyKuV5PsN7KS9GZ1
 b3rUtxsULh6CmnQ45YWHy+yVnGROXxPzU+Bq9SSMYMaNFxOhci4teZUSc4PM2lxzI2eBcgqjLCO
 Qk/43AkLtIfWfDL6PUScdGy3GxAwNpG5ID4hjF5jb56AtsEqtvQaxq1ECQji6btAr76bfstGHrv
 40REm/qxpaZbAujePAuuHupJtrtx4ZSOHbnYggrKxUJRxuG7c3ChTX+LwwcXWA2Dp5XodhJO0cP
 ao1U76aVCJCpaw/bg2hvceKevq/+48XODB240VMGYGP8R4zbl2AUhoBhnuPJzb6pbrNCOZYjATA
 KpR/f0UiME5fsPX/tMA==
X-Proofpoint-ORIG-GUID: cB9_GgAevQBHLy7JlFy1542zh39pW9T7
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDA0NiBTYWx0ZWRfX9uCDBriPY7nO
 +viIYbBzfTKlkE+2moj09Z14PnDfUcb0S3xa89pT/MZxTcCdTjJ0LPdcWjMJUShDSf1qsyKaHaM
 mitQ+tgFg2fzyC/T5L31rFged3q9fBI=
X-Authority-Analysis: v=2.4 cv=PJ6aavqC c=1 sm=1 tr=0 ts=6afee0fb cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=7yht7nwCIrXBMJmmVpIA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_03,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 phishscore=0 spamscore=0 adultscore=0 impostorscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611190046

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
  arm64: dts: qcom: shikra: Add EL2 overlay for remoteproc SMMU mappings
  arm64: dts: qcom: sm8750: Add EL2 overlay for remoteproc SMMU mappings

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
      arm64: dts: qcom: shikra: Add EL2 overlay for remoteproc SMMU mappings
      arm64: dts: qcom: sm8750: Add EL2 overlay for remoteproc SMMU mappings

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
 .../bindings/remoteproc/qcom,shikra-pas.yaml       | 28 ++++++++++++++++
 .../bindings/remoteproc/qcom,sm6115-pas.yaml       |  6 ++++
 .../bindings/remoteproc/qcom,sm6350-pas.yaml       |  6 ++++
 .../bindings/remoteproc/qcom,sm6375-pas.yaml       |  6 ++++
 .../bindings/remoteproc/qcom,sm8150-pas.yaml       |  6 ++++
 .../bindings/remoteproc/qcom,sm8350-pas.yaml       |  6 ++++
 .../bindings/remoteproc/qcom,sm8550-pas.yaml       | 30 +++++++++++++++++
 arch/arm64/boot/dts/qcom/Makefile                  | 15 +++++++++
 arch/arm64/boot/dts/qcom/shikra-el2.dtso           | 38 ++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/sm8750-el2.dtso           | 30 +++++++++++++++++
 20 files changed, 225 insertions(+), 3 deletions(-)
---
base-commit: e8017d29067fd1310a65c3494ce1a1b492adbac6
change-id: 20260918-shikra-el2-ea8969385c3c

Best regards,
-- 
Komal Bajaj <komal.bajaj@oss.qualcomm.com>

