Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 303A73A1C9
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 00:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774917314; cv=none; b=ZFTDXE/qnnnh2wdUBtiTnfwDBjGpgICLA0SBuxEoMrFAWcyCw7k80zlRyQ+yTd3wB+jQ7b3LZzi8bFNaLPg0fxSpferewhpBm4Ab0/OZFplRzKN+BZHI81HTVC9FqLU2BU/vyNDfLk5oHQjoarZd6v/UdNo0ccKNKLrvFojE2ts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774917314; c=relaxed/simple;
	bh=OxmTEsU6yPIvA9JFvpyrJOrSETzVU0VLbsVYljlqaU4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=UfiHEU2TXwBM1zMGxv18EeRtXY60phat2rN92A0irryy6a0/Kr8vJfDcunTJp9/YpHS36thHX3VQ8l81dTDVd+4rcszoYZm2lfbRHxMnWK7OAS4i9DFQ9j6lBLMokrch3ut/Z9WWzH+RaIg/Neeh9oELkvr4/9SM+v/tGtRf9bc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XnlR/aHA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EHIJwjzd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XnlR/aHA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EHIJwjzd"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62UMfsJh2391396
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 00:35:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=XxOdSYsl3fecO0oeoW1Y9y
	XUtWQGqOKVZLqUNQjrjcs=; b=XnlR/aHAt2QDBTmvO04+DyTONKUNTC83UWR5XL
	PpdqO4kM95oPHAlmCETkr1GazRTphzC/IbFk9hzD4FFwjwrYt19EDbpDjRUF+2PD
	HmyOqLYL4oHuHvUSnH4d/VHpUcfHT9Rf3K4W5V2qEAxJOfk5MNuQ8UdzzPgSXDCO
	3Him7TgCzjlXHFfN2XMP72spfwOG+aqIzVjD1jz7QBXl1PRYuGXLYqNaJWDvdOKY
	qjrdb87hi8JA1Mp/dNGBz2GHvpUcCzrWgMT+uj13sRI5JBjQoz8KtNASEdleXpCh
	U6GEWbc5K5m4QwXgPalz1/zp+eDk79s0UnWw4A9MjhQ4eHEw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7ue7hxsd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 00:35:12 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2c18175fc54so15449983eec.1
        for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 17:35:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774917312; x=1775522112; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XxOdSYsl3fecO0oeoW1Y9yXUtWQGqOKVZLqUNQjrjcs=;
        b=EHIJwjzdCQdUgb9ns7dxz1otpLWzdCK8BPGS8AdfkGgiHKK0+D9gvdVw4ByUEweqeL
         fqAaeoi4q3HRkHjcx9OmAXA8FstZD3zkpNwRctb8oqoSKAm3rr46h/FFqv6dYe8/Iije
         styhvP9Sy7ir0NK88/z/MvzKBrjtjLAqHHPUheMgLkx+ijAaDP+MZXtf/fQuXzgJELAx
         fWs1iGIKM4NhzE4Q24NfM0ZlEI53bLhg9V9TLth2jbAfUVySOi5hLSCDhYP3y7Ry8hoj
         jh4DaX7lLk0jmOagtOmljFb1muzF5rdpMIJrUf2zhMK03/h8/NvCnrKhdGfWrdQ2yhQ6
         L7RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774917312; x=1775522112;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XxOdSYsl3fecO0oeoW1Y9yXUtWQGqOKVZLqUNQjrjcs=;
        b=Ut5jmCuTyzm4IbNWUgGtlwQJNRwzqBFcnRqdasOx3lgAcqJmU2XLL4Or04cWxpVZdd
         IacIozHfumVe8XAp94SNxe9NW628PkEIZDxWH7k8v2iFCvU9R9Ay/a0n5AmZYQSmu4oP
         ftJx8e678Ct110qCxi8rXH+XtGWiMbsDtYvwuubWzVUf1+EqowgnMfzubXl5lJbTw61L
         FNqnc1cJNthen/CEaHcjiFWUhN87WGw0Rxl01UVAvs0Lhv7hwjew3PUV1ekdPFzlMT+U
         mG/g1AZZmUk9Mq80Bmk6YI7UWFsm98CGPRv62r7HRaOBDAi1oKNCBTfbKncLwND0mK2f
         bnSg==
X-Forwarded-Encrypted: i=1; AJvYcCWqvZ6zGtap85SQPxkGCM6eINpOsT4yXjznPuQX98n96QZtyxIJDrpg3O0zPEltkxmvdhcbbjOLvifg@vger.kernel.org
X-Gm-Message-State: AOJu0YwpVJYdMJeANergIxdEWlQq16VnPIGKuwYjfsyYS6QQUwiBDIbw
	1M7J2DIrFGRAH0KwevhQNMGgNDuatVAiiAfIdJ+H+0b7zB1jTxqU1bV45v7Av0/ZfVyE44Yql88
	x9heCV3eFOj7c/b/Unpk/+ebNCRefCA5Nod1FaBe9wNwuvKTcO4oTh+rsMg5uexGY
X-Gm-Gg: ATEYQzz1M/BI7Iv8l6wLsi82NHpnfeq23cAsrxIHdVvB4dA4upUu1OS/GMRcC2M5TjG
	CSkC4EvPpvlR8bmau27tcYcKSJ4DW8xY36+w00WreftZ049Jw4l4lQfu6fDVSOFzttfvByrkL6P
	X2pmkp7pXsip3MzuYWqzTb44miJepRi1qHBALunT2X9TFkqh+vGaB6/o5N7JzcPgLFrGOm4x63A
	J7MLrTTMc41de28f4owf59/mCLJjglSeiB/qhT2I9/oBYguvi7nKbCc+1KY1IzQmdceLLUMDE4n
	c7rlE2AeDn1i4l+1CUvEct8myWDq7OGb6Ckk5zG9yPVGkeKpNRg5XlJm8fbeVDiMdJfieDRHn7W
	O0hibud3H+ImqThfysxbOpAU7s6LdvoYtUwdtYv2cTXfwUtX8sKXTqf4OK3Z1VMpnnh1v7wgAa4
	dF
X-Received: by 2002:a05:7301:1298:b0:2c7:11f2:d081 with SMTP id 5a478bee46e88-2c711f31321mr2311291eec.14.1774917311783;
        Mon, 30 Mar 2026 17:35:11 -0700 (PDT)
X-Received: by 2002:a05:7301:1298:b0:2c7:11f2:d081 with SMTP id 5a478bee46e88-2c711f31321mr2311253eec.14.1774917311215;
        Mon, 30 Mar 2026 17:35:11 -0700 (PDT)
Received: from hu-viveka-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c3c6e9c088sm8454529eec.21.2026.03.30.17.35.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 17:35:10 -0700 (PDT)
From: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
Subject: [PATCH 0/7] clk: qcom: Add initial clock controllers for the
 upcoming Hawi SoC
Date: Mon, 30 Mar 2026 17:34:55 -0700
Message-Id: <20260330-clk-hawi-v1-0-c2a663e1d35b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAK8Wy2kC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDY0Mz3eScbN2MxPJMXcPEFJPkxBRjsxSzRCWg8oKi1LTMCrBR0bG1tQA
 aW78dWgAAAA==
X-Change-ID: 20260316-clk-hawi-1ad4cad36d6a
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mike Tipton <mike.tipton@oss.qualcomm.com>,
        Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774917310; l=1758;
 i=vivek.aknurwar@oss.qualcomm.com; s=20260311; h=from:subject:message-id;
 bh=OxmTEsU6yPIvA9JFvpyrJOrSETzVU0VLbsVYljlqaU4=;
 b=03RbKNT3HIjRENWAS08w++Bz8qNif54rsAGZizhRTonDIoenKuxuIIhcT7pQrAuNclrEjWQKl
 nmDiaHysXmsBUvtK06l6Z6MtIgZnh3aIqezZCgw9DE1G5UO6fqgODHO
X-Developer-Key: i=vivek.aknurwar@oss.qualcomm.com; a=ed25519;
 pk=WIVIbn3nJR9YRWNRyJiEbvpgoHhNyYrmVqMUXWqAIC0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDAwMyBTYWx0ZWRfXx9r+uFEJEbGx
 iXaXZ2rp2hvEfodoCA3OzOs70BvOKJk0YMc+PhPxe4w5TxxvZQ+TIwPdxrzNz71Q1dnf1fP+7LM
 zOaVNWQAK4//UwJO1TPyP5/PvnBBkmt89IOestx4dfHM0k72ih3bVDKdsqLKqv/S2p6mLDjKop3
 eOIO5v7fraFUtiXVqO+I9kDBgFOV9KA+kswLZ8pnzZWLWDh6TsRnBzElBKz9e1qXN7Mt224Y+bl
 RWt9PiITbmukaDJ70MeRnag1+tE3FCJygw68B7iA/v7bsNotKcj0hH3hNs1q3oOdjHuBej7tDbJ
 hNU7JeLxkmK5fTKUQ5V3WABoPipeIGZ/g1S+ss1pgKyingY1bNPQMSpB4xCT4COD5YygkVjMkny
 MJoLESV69ZiyJDTMn7D/R9k+SczFRNDow1G0u5gw3fllkGXFDLJw2jo3jkxKa0hzCD4xlCF1Ye7
 FR7GjenmmdYbdU4zCGg==
X-Proofpoint-GUID: IuaVhWqHVNZhfRY7r-gpPmiBN3UrHS9E
X-Authority-Analysis: v=2.4 cv=G7sR0tk5 c=1 sm=1 tr=0 ts=69cb16c0 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=jia197ti5a5XF4lDde8A:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: IuaVhWqHVNZhfRY7r-gpPmiBN3UrHS9E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-30_02,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 phishscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 spamscore=0 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603310003

This series adds support for the initial clock controllers required
by the upcoming Qualcomm Hawi SoC. These include the Global Clock
Controller (GCC), TCSR clocks, and RPMH-managed clocks. It also adds
the PLL support required by Hawi.

Signed-off-by: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
---
Vivek Aknurwar (7):
      dt-bindings: clock: qcom-rpmhcc: Add RPMHCC bindings for Hawi
      dt-bindings: clock: qcom: Add Hawi TCSR clock controller
      dt-bindings: clock: qcom: Add Hawi global clock controller
      clk: qcom: rpmh: Add support for Hawi RPMH clocks
      clk: qcom: Add Hawi TCSR clock controller driver
      clk: qcom: clk-alpha-pll: Add support for Taycan EHA_T PLL
      clk: qcom: Add support for global clock controller on Hawi

 .../devicetree/bindings/clock/qcom,hawi-gcc.yaml   |   63 +
 .../devicetree/bindings/clock/qcom,rpmhcc.yaml     |    1 +
 .../bindings/clock/qcom,sm8550-tcsr.yaml           |    2 +
 drivers/clk/qcom/Kconfig                           |   16 +
 drivers/clk/qcom/Makefile                          |    2 +
 drivers/clk/qcom/clk-alpha-pll.h                   |    6 +
 drivers/clk/qcom/clk-rpmh.c                        |   33 +
 drivers/clk/qcom/gcc-hawi.c                        | 3656 ++++++++++++++++++++
 drivers/clk/qcom/tcsrcc-hawi.c                     |  158 +
 include/dt-bindings/clock/qcom,hawi-gcc.h          |  253 ++
 include/dt-bindings/clock/qcom,hawi-tcsrcc.h       |   16 +
 include/dt-bindings/clock/qcom,rpmh.h              |    2 +
 12 files changed, 4208 insertions(+)
---
base-commit: e77a5a5cfe43b4c25bd44a3818e487033287517f
change-id: 20260316-clk-hawi-1ad4cad36d6a

Best regards,
-- 
Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>

