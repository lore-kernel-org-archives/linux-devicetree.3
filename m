Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D1AB3C5DBE
	for <devicetree@vger.kernel.org>; Thu,  9 Apr 2026 18:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775758308; cv=none; b=Lx9+Rtxh+VGiZOpaLLqNecIMakxrACXsKcAWc7LEbI3XyGgsi3EQ1cVzXNn7gJcCWFtNeL4mSJjxABQQ1V/RRxKJjpPsCVRX3RiWoADxQYHONU73/fIXNUnuPZWIT3VNBy1+KHs4NOJ8g9v3FifEyw+YBclcOa7puEXQDxgw2qQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775758308; c=relaxed/simple;
	bh=dWcGPZUTYNR+IrjazAYIkxGZaepcVATPwDyqe7mibkQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Zzdy5JOmpE8uIuYJYg1w4UiZUmHl9R4n0RgBUUeSxREMQPK/3NysuViZdCDTSWTrI1S0kXoPG7ZM+VOju3bL0c5oa8uF+MFPv+k9y6+YX6LGICWDIHzyPkvUM2DvX32x1EoGf76xijiLCOkLc5MMwjxnZ7xwzmBCo/P5EYqJ3/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PAgb7lkp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FS9Nt1E9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PAgb7lkp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FS9Nt1E9"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 639Cxmg01729913
	for <devicetree@vger.kernel.org>; Thu, 9 Apr 2026 18:11:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t2hSeCqy3196ZrPyXqAGFPnwN9LeRm2Fe9O2th3jhQA=; b=PAgb7lkp52h2aYe7
	X/q/AUNoT8wFXcENwF2xkHMQdpolfuJRSn3wDifsClUkQSrrf/zlY8GzlBWXEd6C
	7SvU3SDb5KzHJPPb83l5BBzoh9n0peh9a6bL5IjpU4fo0SthbVvtKQfL1fehBYva
	H/M9mnm0jSNxjxaV9U4U15b/3mwzoOByXOQe1IbfZSX9KtNupF6qYNymkSzHBeA7
	+7bkSGm/7xnnft1jUn6clpeEMxdJu59BOhyMwUyFCJwNHe7VN4PZCWYUnxl0XOPq
	Quzs9LMgIs1X1jYeFD59B4dLMq31tO3oF7cMpX/ltWeGczFMSxw4O+gbQZFFr1q4
	lGHE7Q==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4deckxh61k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 09 Apr 2026 18:11:45 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c76bb22a8ceso1409443a12.2
        for <devicetree@vger.kernel.org>; Thu, 09 Apr 2026 11:11:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775758305; x=1776363105; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t2hSeCqy3196ZrPyXqAGFPnwN9LeRm2Fe9O2th3jhQA=;
        b=FS9Nt1E932rGf8Mv8vTX/nP3Zy311RndazOYsFG+ggmz3+0HrRMulLXE+Yq9YkTB8V
         2m32gGq1P9kDyMVPapyBf5NZzQomvj0zkFWW6YPm9wb3A0Yk6KwmtGK3y38uW4UmmwkD
         wYiFmwiYHvnCqSAn4/qSqHr00+rT/uHzsywOuU96J0Il8dQIAXOCRkmIyXnHFw/mCVsX
         i8eZ/Ynrfv9QcSzuAoC/mf7L+SargKnlwO3I+KVecmUTv65aq5bkGEvXJ493arUSt+B0
         owXQFizJsEfLEkKnJQWjM36FyhSaKCR/qpgMt2ambm932x275rgR1nLAg4RV2Kkzu7Z2
         HOeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775758305; x=1776363105;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=t2hSeCqy3196ZrPyXqAGFPnwN9LeRm2Fe9O2th3jhQA=;
        b=ryhHkGDbRM+9yX+ozig+b37fWTYX2bA9Yl3pBGFFZyQ4IliaNidqxklMl+mEHR6dqD
         7MjvmM330fjWN0NwNC44TZnQnQ2jNSKemDRem88ezQ206cN4bmfxqgcn0ARrN+XPxQIr
         QkHpUKK3wZON+idxXILPCQlChfPTZa+TTzYGxbY7ij5C57ZWv+cUuhg+H+2bfx2Suulp
         cc9QZ/fjpmTUeugzz4Kcd3bf4UeMrDrsFKA6bDW3RJ8HA7KFEtitpJHv0RfiFLd6DkiV
         Qi5t64ilBWEqGGd9IMQ8BJOfeWMIDGcb3Gqq4NgRACjq89blQbFqbsYitKbM+X5mAyfS
         cRZA==
X-Forwarded-Encrypted: i=1; AJvYcCXKDBsYasYn+keHfycZad1coyujInCCM3w4bv1XgCRobuAA/GfK7O9jq6RxICr/6Mdo42ZUsClXVFkP@vger.kernel.org
X-Gm-Message-State: AOJu0YyY1NPpnjL5BmhVS5nFxuoRfNkPM9yC6y22rlskbia3KIA2vgo8
	lpDurO5SLLV0etHiU+yndCGkU9jfaY78geuNUQhuEdvw9f0a2cPzFB7Fa1RN2dUckH+6inGYLq+
	MR8RWkR0ORESzGnHfdOuRWqZxWEpjXEbTUP0ew01isQYBwyDmhyu6ATrsnbv+dPTU
X-Gm-Gg: AeBDieubea0gdNNhT0bJDxPbqpPtB7Jywd1XVLgLMi0+4yJ+WF7L+bLEO+sQkK8pl6z
	M2PlJeZgrMVjVbVBhgIVd0F9WPR5I42XLryKJvGD/NEGlA6auQw6YWD7OXIEL94gHhGPm1YKyFW
	UJYZDUJ93jZhLlbAsBRHNBCXf3fut74ys2cZ4nkVlY9wVCe7L4+wj1lMm991XMY2UlBFkgauRAY
	IBStcN4YPjtxoE2euOkKJ0a5TmBv/SbEv4oKEyNOOQECnLCjgn6O4OxApmcuh+CS7/8PaWV6gsh
	PQ3b0405ZSndmQ0H5DCG5n+3ONaaxmDwTg/lwFihax97YS+yqYC46ici/kV3jACEceV9BvdZvyF
	Sf8oeKjGCGeW6WO/V9JVJbfxv4+x0gm04uNyRocrkWdBuew==
X-Received: by 2002:a05:6a21:32a4:b0:39c:4e62:b838 with SMTP id adf61e73a8af0-39f2edf5056mr31142016637.17.1775758304827;
        Thu, 09 Apr 2026 11:11:44 -0700 (PDT)
X-Received: by 2002:a05:6a21:32a4:b0:39c:4e62:b838 with SMTP id adf61e73a8af0-39f2edf5056mr31141967637.17.1775758304218;
        Thu, 09 Apr 2026 11:11:44 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7921a2d9ebsm66132a12.30.2026.04.09.11.11.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 11:11:43 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Thu, 09 Apr 2026 23:40:48 +0530
Subject: [PATCH v2 7/8] arm64: defconfig: Enable clock controllers on
 Qualcomm Eliza SoC
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260409-eliza_mm_cc_v2-v2-7-bc0c6dd77bc5@oss.qualcomm.com>
References: <20260409-eliza_mm_cc_v2-v2-0-bc0c6dd77bc5@oss.qualcomm.com>
In-Reply-To: <20260409-eliza_mm_cc_v2-v2-0-bc0c6dd77bc5@oss.qualcomm.com>
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
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-ORIG-GUID: Za21AhGhCkYiBt-F7e0nFd5uzCJVsrVh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDE2NyBTYWx0ZWRfX7+96xhtNvx2m
 x0HQ1J1n68cKJ9p/gDQRixtSBvuZQMrbA+qMYOL1gzTOjJaHdk7Y9x+Oigdubnzr4F+Yv5nsac1
 YyNWk5KfJ/QiOM/QaVF3RKHFjuag0/8BnDqpqxlIytnl+SzYbF4Zjw3b/A300pITmG6M0uWrohg
 PLcIKIKsEFvNHX438jZSIVbMJFvQXJCVWdcIDbUbuTagn6Bt1m9FO/qEfG8SwRNi1rxgl8+9pn6
 dmGIoQOrlfOEJZ12c4h9YKwiwvG0FL5zyhucfVDhsuJjZkIphOnD0DqKFlep6Qc0s6tjN8dHa74
 wS2PG/zLlTR2/NiehqAXB4rZmaqPeGYBJuInL3M1qcSzSMl57gWtFiqCyg6caJe1dEoCFER5hsI
 oeCtUOzqNx0gEWQaxpVK7N9qx/Nq+KwMZC1ust1TCdhLu0KjuMlZevNNOMGp0VJHwFtDj20CFXP
 COkhinOtFb5Q1njfhPQ==
X-Authority-Analysis: v=2.4 cv=OMcXGyaB c=1 sm=1 tr=0 ts=69d7ebe1 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=2e1B0ptGhY38lJQULHwA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: Za21AhGhCkYiBt-F7e0nFd5uzCJVsrVh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 clxscore=1015 impostorscore=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604090167

Enable the video, camera and gpu clock controllers for their respective
functionalities on the Qualcomm Eliza MTP board.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index dd1ac01ee29bf631d517c38486f6896ffd82dcc9..130e8716e67d69c54cde3f66db09b352f736feaf 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1475,9 +1475,12 @@ CONFIG_COMMON_CLK_MT8192_SCP_ADSP=y
 CONFIG_COMMON_CLK_MT8192_VDECSYS=y
 CONFIG_COMMON_CLK_MT8192_VENCSYS=y
 CONFIG_COMMON_CLK_QCOM=y
+CONFIG_CLK_ELIZA_CAMCC=m
 CONFIG_CLK_ELIZA_DISPCC=m
 CONFIG_CLK_ELIZA_GCC=y
+CONFIG_CLK_ELIZA_GPUCC=m
 CONFIG_CLK_ELIZA_TCSRCC=m
+CONFIG_CLK_ELIZA_VIDEOCC=m
 CONFIG_CLK_GLYMUR_DISPCC=m
 CONFIG_CLK_GLYMUR_GCC=y
 CONFIG_CLK_GLYMUR_TCSRCC=m

-- 
2.34.1

