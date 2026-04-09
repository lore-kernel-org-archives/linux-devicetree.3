Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D39CF27281D
	for <devicetree@vger.kernel.org>; Thu,  9 Apr 2026 18:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775758267; cv=none; b=QydPLj+/bUTjRUM6FQgAKnw2OgJK4i0u4/jTOLfmC9Kp1nMW3x7R5VhkKie4uREsgYcTLBartFn6/lBVLb1Zwmes2kK1ghRQI3jg+rDp3DSg8kij/uKsgpxnUPpgsm5Ef8bSRyfKZDygw6scD8AqDnZwfh14FpVrKz4zctsLWk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775758267; c=relaxed/simple;
	bh=DcNNggxe3/4gvizHu0j9sZrhDu4v9aPRRQ+y/3tUjT0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=DV9avwgPzzxVX8TJTsSd1b27amLDgiaZd5VFwrOW/ehsdkOBOSHkRAAnhnIUsnOn09J1kxrX1zLD0EeS8pIjeP2n5ExymDUuJbwKpVZ+eSWYwzH9p4lFJhXiOx7fHmS1bBWOeOwYVQD+kMKmJiYoEn58VPEQWkVwXdnkDUgPbb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oOv1WGiD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FfFqu/K0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oOv1WGiD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FfFqu/K0"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 639CxmGd1729916
	for <devicetree@vger.kernel.org>; Thu, 9 Apr 2026 18:11:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=vYpYuC0n38W0nO+hluOO6j
	DvBMadgq+PwfBPn4EQ3kw=; b=oOv1WGiDKNP8CjOph4FPN5YWeLxm8jl8ZEPeHH
	NxDmx0A+301t04L2xXkKAdJ+5J0BE1bJvrlZPk2oNNcNkl9NdhY5sx96RJW8eDwI
	N0y+WxDQq3PtfXK1KKH+ffWlPPaLsE2aYb79UKSq8E8BrJCyKCb25Fg7w3ws6kHH
	pumfCHyQrszHMnvkp3HMkrA6A4U2X/AtsSiwnjVbolVYINyEdNTcDZoN3ZlN7uah
	D2/1VSFjAeHTtG+/90Xydm0G5cIyJc9/FAjArPJdpOfxBr0IudV6UEsdUdHsn21Y
	mAoa0AtQ6/4npULpXkMuepFBdpHlFC6Nxm85bSSJR9sa25zw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4deckxh5wk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 09 Apr 2026 18:11:03 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c741c4cebf3so607064a12.2
        for <devicetree@vger.kernel.org>; Thu, 09 Apr 2026 11:11:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775758263; x=1776363063; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vYpYuC0n38W0nO+hluOO6jDvBMadgq+PwfBPn4EQ3kw=;
        b=FfFqu/K06thMBR0XU13QT9q8IHdSHWlq4PwlUaiQQgmLA53igDn9tHTbYzXP/WF9lM
         XyDruJikUYYgrFMgAhO+TsO9K0QyuJvgEKzmAFffmQad3sH6gDYiKU9FBpm1zIJHtSUV
         scY/yqtM/b+f69GX+gFLtQjcnKZfmti/VOIqEi/STv7vbiBwvPt+CdrywJdM4DCEVS3Q
         RcYOrmp/wEBXCktw7Dqx8NftgT2hUTLuK0y8+dP1uU2DYyn2r5T7L5xzA+Qp038THzEr
         +LV0Szt1ClJ7IFNWChGJXs+v0C4Lf9eWAS8OBbKW18VXl9ACutTzp7Pvtph0IzGb2Wwr
         scrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775758263; x=1776363063;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vYpYuC0n38W0nO+hluOO6jDvBMadgq+PwfBPn4EQ3kw=;
        b=iRkP2a3FDlY0q4/eeGuszRLnXVKxYSKR6VJrcUBM+h56SHO4LlWz+/aVaJh5nr+ByF
         JEM8pGpiiBz0+3EbFdoKngxDlVnjzimtNnUFdBsJn0b9kriNSFBg8fqRih1EKtb7e/21
         S5+Pe4FDtkmnjDJPNDc9k0w8xkQ8AhQ1PGZv7BcA/m4LXHIMKGyzN8SK8bNIqg55LC1R
         Kp4Nl7fzVbHtqUGhcGrdz1F7yOO6iclkvJ3fDjzpu82sFZSpj3/YWPa0ob0gMhznXGZs
         e0CTQRzz34Mcf2nFJKIZPZDiXNWqO1pEK+7IDnxrY1jFyQXTT3V2y+H2UbU9tHYjzIWi
         JQOA==
X-Forwarded-Encrypted: i=1; AJvYcCUxSfj6SgNs2IfWIYAIQMLtlX3H7pqAYtIkNVA89evcWrIxCSh2u4aNa3KO7eTmn66PD0E7pYm4cI4l@vger.kernel.org
X-Gm-Message-State: AOJu0YzuDRGDdiKakrIkYKBTtqIDqXEEqAO/oMgTiDRhOwlTHjN+1vPL
	S35RcClX/RCFLdaY3u3rK4ebyH217t3fViAnRbuzXdLNDw+XAuiDOw30HZNCyaaWFDF9/TRk/4h
	KMjMDH1LPjqrWC5F4kqdLUcUXLf4nLtf19qcew5swuEhCZ/VoG4KyHseW7AKel9Nr
X-Gm-Gg: AeBDievvdkkhG+c5Tw1CFt2POr+5SJ3PTYOWrYpzoVvI0KlsYZQDrp8ytJwn2gLo06o
	UPwGef/WsfuE1wW0vmQrQ0kKLYZA2gHmV1d+YHvNzyY+b0sg89LvBNAn9XTgfemiRLFK2rQ0jS5
	VscB1Kw4/fKimryqOVGrWARklKa8ExBq8esrGyia8rW/lBer+W0SEKvtNBPQ1mWckD2pw7VDtOx
	MO6ZBbz16VBM6xml7kPfeXr3V60TGmMth05OBooIy8lNWoqEzPNvopqWWRVgqJ0Rs+cSLaR5IgE
	ctd0wungwGB9fIMkkWQXWKmaFjaXF8Bn2lAFIrQu2ZZQTphZEiCurOWdtnLd1BHftxMBxL9NA2A
	yTMQJehJZpo8DE5KVodFK41/rjHqHdvAY4xf63G7y4c78DA==
X-Received: by 2002:a05:6a20:1587:b0:39b:fbb2:5e46 with SMTP id adf61e73a8af0-39f2f0968d0mr27843586637.40.1775758262380;
        Thu, 09 Apr 2026 11:11:02 -0700 (PDT)
X-Received: by 2002:a05:6a20:1587:b0:39b:fbb2:5e46 with SMTP id adf61e73a8af0-39f2f0968d0mr27843534637.40.1775758261702;
        Thu, 09 Apr 2026 11:11:01 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7921a2d9ebsm66132a12.30.2026.04.09.11.10.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 11:11:01 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Subject: [PATCH v2 0/8] Add support for Video, Camera, Graphics clock
 controllers on Eliza
Date: Thu, 09 Apr 2026 23:40:41 +0530
Message-Id: <20260409-eliza_mm_cc_v2-v2-0-bc0c6dd77bc5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKHr12kC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyjHQUlJIzE
 vPSU3UzU4B8JSMDIzMDEwNL3dSczKrE+Nzc+OTk+DIjXXMDw2Rjk5SUJHOTVCWgpoKi1LTMCrC
 B0bG1tQCG5W/qYAAAAA==
X-Change-ID: 20260409-eliza_mm_cc_v2-701c34ddb74e
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-ORIG-GUID: SvaYop1QAjCHX3-zfjjqxpb2-1M2Wqn4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDE2NyBTYWx0ZWRfX8f8KXi75TT1i
 0s8Tf+DQmy9spBMShrZY4Ouz+sHvymOqx4G6Uuy/SOH2PGLIlyJ4uvD+RUT0ejFfp8EvFwNa+7s
 BO4Z2R+Q8Cod7Mn7icfnvHeoagcuVHFsnuirl4C91qEFqMw0o2k9zY71Nh8yUUz1LcrWVNhnXP+
 cHoq6UBj3e1TEdmCNqfodYv/sKsROZ3ExzFLcRm6qCkyZEDfvvzFW+3IkG391GVU8DRPf5LF0PO
 q3/ynpcObqGSXfjx4Ipb2sL3GWCYEa6H9cdNSW/QyndLZD1TfQ8R40V+ENMbF3kntYKdNmwqXls
 FF30LDDKPcjQhY7bkyTKnr9zxLnMuURSaCc4uIkMAzIof5bwZN0rK1vaaV+4kV7SvYCfXLiB9NI
 +EFu5ekclOTzGJ5NRhjlDbn4iR/407c53Y7WlYghR41RC++9XwdHqTuNNsQbulnEkXwqBphHh3C
 G1mDbtca0bdpEZGIuBg==
X-Authority-Analysis: v=2.4 cv=OMcXGyaB c=1 sm=1 tr=0 ts=69d7ebb7 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=O432ggMcIDbDob6sqXIA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: SvaYop1QAjCHX3-zfjjqxpb2-1M2Wqn4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 clxscore=1015 impostorscore=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604090167

Add driver for Eliza SoC camera, graphics and Video clock controllers.
The camera clock controller supports the cambist clock controller and
the regular camera clock controller.

The patches have been tested on Qualcomm Eliza MTP board.

Changes in v2:
 - rebased the patches on the latest linux-next.
 - Add new bindings for Video and Camcc.
 - Remove commented code in GPUCC (limiter code).
 - Add device nodes for the corresponding clock controllers.
 - Add RB-by tags for VideoCC and CamCC/Cambistmclk from v1.
 - Link to v1: https://lore.kernel.org/r/20260317-eliza_mm_clock_controllers_v1-v1-0-4696eeda8cfb@oss.qualcomm.com

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
Taniya Das (8):
      dt-bindings: clock: qcom: Add video clock controller on Eliza SoC
      dt-bindings: clock: qcom: document the Eliza GPU Clock Controller
      dt-bindings: clock: qcom: Add support for CAMCC for Eliza
      clk: qcom: videocc: Add video clock controller driver for Eliza
      clk: qcom: gpucc: Add GPU Clock Controller driver for Eliza
      clk: qcom: camcc: Add support for camera clock controller for Eliza
      arm64: defconfig: Enable clock controllers on Qualcomm Eliza SoC
      arm64: dts: qcom: eliza: Add support for MM clock controllers

 .../bindings/clock/qcom,eliza-camcc.yaml           |   55 +
 .../bindings/clock/qcom,eliza-videocc.yaml         |   51 +
 .../bindings/clock/qcom,sm8450-gpucc.yaml          |    3 +
 arch/arm64/boot/dts/qcom/eliza.dtsi                |   54 +
 arch/arm64/configs/defconfig                       |    3 +
 drivers/clk/qcom/Kconfig                           |   28 +
 drivers/clk/qcom/Makefile                          |    3 +
 drivers/clk/qcom/cambistmclkcc-eliza.c             |  465 ++++
 drivers/clk/qcom/camcc-eliza.c                     | 2803 ++++++++++++++++++++
 drivers/clk/qcom/gpucc-eliza.c                     |  621 +++++
 drivers/clk/qcom/videocc-eliza.c                   |  403 +++
 .../dt-bindings/clock/qcom,eliza-cambistmclkcc.h   |   32 +
 include/dt-bindings/clock/qcom,eliza-camcc.h       |  151 ++
 include/dt-bindings/clock/qcom,eliza-gpucc.h       |   52 +
 include/dt-bindings/clock/qcom,eliza-videocc.h     |   37 +
 15 files changed, 4761 insertions(+)
---
base-commit: db7efce4ae23ad5e42f5f55428f529ff62b86fab
change-id: 20260409-eliza_mm_cc_v2-701c34ddb74e

Best regards,
-- 
Taniya Das <taniya.das@oss.qualcomm.com>

