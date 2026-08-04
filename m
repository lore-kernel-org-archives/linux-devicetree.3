Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DED136657B
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 12:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785846068; cv=none; b=a4RJjp6YQ8qq91q0uiWgMpDq/oNqwoDUcPSAUL9gfbSa3IT/fwczh2MvG+NDZf99JDVWqGarPdHBIRuyTJdEmSeiyQ/vMDWwttc61C0HQf1vKohpCsU02cTdVzsL2S+MIyMwI1YCkS80ITbDXeuFKMMM4o/7E34pKlj3eL3n9Xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785846068; c=relaxed/simple;
	bh=7M65xX2SPEAZPbTkfMIRQqvlRwJZ9lkojNzAD6XjxXw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=svigVQfbk81x6mguMPhiSdT2H5POdgky9q1ixIbCPZ49QBHbyXLnFum2z6DBl0yiLp3C7A74MNJiQB3b9GQNoaThPItRq1AfAQrsVRd1KmrySEFwfkmL1K9X+30Rrt3DbnkvoxDRAuTDPRSS3KP86ySHnye0vG/08FdEyI2p4fU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jAMXZDtO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DykT4pxi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jAMXZDtO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DykT4pxi"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6748CGWI3546088
	for <devicetree@vger.kernel.org>; Tue, 4 Aug 2026 12:21:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=QW8b2paILWu+Ej0pRDMZ4QBKcqdnuTo0dY2
	YaB6hRZw=; b=jAMXZDtOWtbzFZPi25xMx0U8dZ1MoeN30qOdP+uTPR23IMQqKhR
	QR3P0sikLsk7mtMu1BvzshwKGg8VOnjq+CQYartZTPne2voG/MeO2mez0yKQ37K6
	/NUFbm8gVTwvmGFNOCbJVpxUgkbXkACndtTrvpqBfRWn3QWFqtvvlufoqa12UsoA
	/sYwUQgoNWE7CP/qseIf6cVCa+J30NsvJE9MQEt85zvO1/fr2kQoPs6okVY4Wp9C
	/TgrH5DSHlWVZ+6/AOTHFgunUEaDnN01cISPaAksvkD+hC0UoH9N6K3L2NeEEKK2
	MUs9XRy7jrhHG8oSrWCj7eXjdHl1RsGBVxg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fu3vs2w4q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 04 Aug 2026 12:21:05 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38dd87656d3so6215850a91.2
        for <devicetree@vger.kernel.org>; Tue, 04 Aug 2026 05:21:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785846065; x=1786450865; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QW8b2paILWu+Ej0pRDMZ4QBKcqdnuTo0dY2YaB6hRZw=;
        b=DykT4pxi/oEuk1aRq86BTsQxEfqHXVLZxOqxpAKkY8VVLGmmDgPLV0Bt3b3iX/vV+V
         /vEQR4/4jbAW+FHrzL62c3kxoTPw+tIeNBNh/XL2hYdKKFVWdjWJhYtTLP/vkDxF8wvO
         5iQsFWMccWN1m8EAhk0svQpRjmzEDD+LPWejF3otzQ6Q1JMlA7cN7f6UwsBsx39m6RM5
         UUldLaG7uB2ly4xAIs+2rpy2tWPcbs212+0HGbRxme7uKOsQQbTeiKxROPlIPE7L+Vmd
         E57pi7itXdLApRJbVHpn8HVGGwDuD1aAAG9nlUMx3HUT24kHZxD60QH4+F/eoEVZ9tIA
         dn1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785846065; x=1786450865;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QW8b2paILWu+Ej0pRDMZ4QBKcqdnuTo0dY2YaB6hRZw=;
        b=l/A3HAQQwX3OvsIcAlVnHTn2kpa9J4l50TF6sh1LCauormDVq3gLKDR2Id68Xq9uyQ
         S/PU4XW9iMbhE8FtOVV0viuju70ulv1URNqHsl1OYz8oJIUa0RqmuQSFFRHHnRoZ7lt3
         ikrBkq7NhQwX5HeapsMuyBx6d5wyd0iGq9VgzVEC0TwOoFz9W8Ef0INz1TCBTVvPblIi
         Pn4KrLWi/MMeDkAVgxbdfObkkvBDCrT8ej2RvQMRq2vpf7LJQ09sNaqvFl2mkVuXcTAm
         xVfcxDaR6LwGdJEPG4GMtmocOySKwPtETAC7yt7n0NylWfhCg7DBfT9jaikrf2djg1I2
         ggOQ==
X-Forwarded-Encrypted: i=1; AHgh+RqRmhc9RPu2rbmZ5kyHYmv/DmZ8QHvokGfoSw3z9ZUPl1z35FIbQ3nzFi4IGWqa/ByhRMQflIAnn6Q6@vger.kernel.org
X-Gm-Message-State: AOJu0YwTVtsu7SIwSOiApGqxXFVTVNCz4iXqteaWmjTOU1BQBpbMLc0e
	pBKv0ZeiXy0vLmaf5fPvycZkKNjQCp/E5HOobO19i1d8XhoiPG6MueF5e3fweKG6vLQ/roqH4i2
	Yu6ftXcVZXDGiXrLc7vpqJ4USqqL7zXIugIBSht1F9LqPcFWDpf2/Aokz2ITtOwQa
X-Gm-Gg: AR+sD10+/Wm6vpXT2J06cmzcRUX+jjYzaUOuQzSkmB3fZaGk4snC+tzDls2xxr1gRxW
	VW5yVgrTAqFkwn5LHZEJjjtQs6/1hlS/Oo6GMjd+Sf6SvqPrbb7J/+3MlYdeRYPZYYatBHkO5CV
	LOTOYrMQubaICabrIA5qdmDuYoOO2SKHwiQy9NJndyOsh/TQdKnDjZoAaXT0K2AkJ7GdejavXpD
	fmMuMiu+9zSP3aOQgJWcfzlMQY9pHl/TIgkNzMh3fzAhlLyjAKEKy6iymfJclMHQeMsE5mo+7IL
	jqUZDStsQaxY1k+J08BZKGtb363ijWuYq927ol4Mppyzd0BQRlbXEibdyeIGJ0nFcHtXp5YPwae
	zomEFa7UIqbeY1QxCc5lbPZDXarTfbDfSwm4=
X-Received: by 2002:a17:90b:3985:b0:38e:9045:babe with SMTP id 98e67ed59e1d1-38fbc4053d7mr12011108a91.7.1785846064694;
        Tue, 04 Aug 2026 05:21:04 -0700 (PDT)
X-Received: by 2002:a17:90b:3985:b0:38e:9045:babe with SMTP id 98e67ed59e1d1-38fbc4053d7mr12011071a91.7.1785846064182;
        Tue, 04 Aug 2026 05:21:04 -0700 (PDT)
Received: from hu-mchunara-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38fedc650a0sm1237832a91.14.2026.08.04.05.20.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 05:21:03 -0700 (PDT)
From: Monish Chunara <monish.chunara@oss.qualcomm.com>
To: Monish Chunara <monish.chunara@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, Ulf Hansson <ulfh@kernel.org>,
        Kernel Team <kernel@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-mmc@vger.kernel.org, Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
        Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Subject: [PATCH V4 0/2] arm64: dts: qcom: Shikra SD Card support
Date: Tue,  4 Aug 2026 17:50:52 +0530
Message-Id: <20260804122054.3462145-1-monish.chunara@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDA5OCBTYWx0ZWRfX9FaW3Iih+TsI
 ekVJArnFPXYLzuRBhpfgZVQ7BJvnaNlDrPtvs/pYef7bQoH5hru+qQcN7QKp64Wcpyy59XKq/87
 CkAFgXO77hoCMTuC17gcYXGn/GCHZl+mDk/y2lqmHz/TqZEV7oN7Z66cymV7ne5fLAqy3CvxRTq
 FY5VdGocCqdX5ku+oE86qSJAJoVJ81aE2uQw0XU6Oerv0P+C0Zp6Bdv+apJ78o4pBVul8Cuzxsi
 E6wHhOrM4yOxh+XKdthfIYSDcb4jf6CxUjiQMyM9PqXXBU3s5x6ABRLB5v5sCFJqnzDlsHp6DYU
 wF3NUpsVzBYNzAcLkHTxBKHWt/F2QPga+pVkwJY4D7CRk/2KrjDgnfBcgdnK4rW2LlXEvcqzbU3
 gbfxLwpSJINusbIma41e/yGGx+3WGnKd5qXNtCqMMDT7pQKhnbfzmMByPztcx6SmsgEARLDdI0t
 MXYj8m+6OjeFlDfQQXA==
X-Proofpoint-ORIG-GUID: j1K7XQ4waSdI6ycjYISWMlSgjBSbQG2v
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDA5OCBTYWx0ZWRfXwY+f8b0FTXvc
 P55zoQNbkN5nyiDQbm4/PdfqqMyfuLVRbGiudz8e+7OYDzPNeTKG9vrghAKGetV8T6OKK9VhjXV
 rmc8Ebs/DhsO4yKGPIda/+RGeTZ1yFc=
X-Authority-Analysis: v=2.4 cv=EK82FVZC c=1 sm=1 tr=0 ts=6a71d931 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=1w3StAHzAm3vCDDRDnYA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: j1K7XQ4waSdI6ycjYISWMlSgjBSbQG2v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_02,2026-08-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 spamscore=0 phishscore=0 clxscore=1015 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608040098

This is v4 of the Shikra SD Card support series.

This series adds SD card support for the Shikra platform.

The first patch adds the SDHC2 controller node and the necessary pinctrl
configurations to the base Shikra SoC dtsi. The second patch enables 
this support on the Shikra EVK (CQS, CQM, and IQS variants) by defining
the regulator supplies and the card detection GPIO.

Signed-off-by: Monish Chunara <monish.chunara@oss.qualcomm.com>

Changes in v4:
- Rebase on latest code base
- Collect Reviewed-by tags (Konrad)
- Drop the dependency link - since all base changes are merged

Changes in v3:
- Padded the address part of the reg property in the sdhc_2 node to
  8 hex digits with leading zeroes for consistency with other nodes
  in the file
- Moved the common sdhc_2 properties to shikra-evk DT file
- Link to v2: https://lore.kernel.org/all/20260630165700.1886608-1-monish.chunara@oss.qualcomm.com

Changes in v2:
- Rectify the alignment for clocks and interconnect properties for SD
  card
- Link to v1: https://lore.kernel.org/all/20260604122045.494712-1-monish.chunara@oss.qualcomm.com

Testing:
- Validated on Shikra EVK variants.  

Monish Chunara (2):
  arm64: dts: qcom: Add SD Card support for Shikra SoC
  arm64: dts: qcom: Enable SD card for Shikra EVK

 arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts |  9 ++
 arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts |  9 ++
 arch/arm64/boot/dts/qcom/shikra-evk.dtsi    | 11 +++
 arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts |  9 ++
 arch/arm64/boot/dts/qcom/shikra.dtsi        | 97 +++++++++++++++++++++
 5 files changed, 135 insertions(+)

-- 
2.34.1

