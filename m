Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E595B2309AA
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 12:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779800110; cv=none; b=deMxV3Wu+x4xt6TW4mIQkoPR8z5BiKM3I5TMB8hvdMKDFwKT3pazLieg8lUUZV8ZnQdjx9GGiHFF29VrcWsY1jwdV6pcrxm+bNkwt2dtcdIsm5ifY62yYlwtEJ8lcLDmrKnhB1wfDT6djHZeKdsbshLsYrB0LwZ/P8FdfMhWldk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779800110; c=relaxed/simple;
	bh=SBo8GaUsBUS3ajwUmdyP4g2M8m2Uhtq9FfllT2EErhk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qLon5RNdzDOkZZizuydjy/6UVz4sjPQCN2ORMG9bzxvOEac/pQkQXAcl459Tw8bmXk15WwrphBJI1nA+YjpVJ1RNwWYQJISvzv3LZBtfd0rXOVGusk5aTpb5dlfXpGp3r+vtq4Q99ZCZxvY0v3W3uWWWyhsYtEPTRyoSpMloeZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oGast7wV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OEGb63ZA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oGast7wV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OEGb63ZA"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64QCsN4K2705414
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 12:55:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dPtRSKjvVo2+z3vqCe90SWb6oDiLrj9MENz2zwGAmeg=; b=oGast7wVAdofn/2p
	CMLkS+djPUe6o/y+oz2exELY8dgGXqfBzqezAfcTi5SmgMloAsQ3myby9WEusups
	XuX7u+4cBAEKifIR5DOZRQrdKptVNU5//YNi4mRA186Gw9WYgqMtAQhwfpkkIWdr
	RY1i/zdydcvPnF2wxbfYx3qNgnwRg0VrizdwTbKZHONo2TqyB+SMxY6Setq4b46n
	QI9Xs8TlhRefVU9tr+7sflhp+fuRPKC7W4JAlKvtSHyMKWYKuT6J6Akwg/Dwy/gN
	JkM4t6QUIVKvHtlz7bhCsM1/hqacvbxxd4PjCSFFsoyW0Guz9AfhFmQzMqPVnMN6
	oTacTQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ed5vghs9n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 12:55:07 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ba86e35aa1so169028025ad.1
        for <devicetree@vger.kernel.org>; Tue, 26 May 2026 05:55:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779800107; x=1780404907; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dPtRSKjvVo2+z3vqCe90SWb6oDiLrj9MENz2zwGAmeg=;
        b=OEGb63ZAv3/RdF5OfZVvLfe+APSC2Ky6LVHUBxDXrqDRKtDomYQ7DJT7e7Zz4k115w
         qOXJPoA83s48DAO0EoA4m3XXbMBUgaxwEXu2hFYs7YpQC1c/SYvRhtfV2KduqVzzEZO0
         Z60qmePuCo3yGk08gTBlN72mnOMO9n8mD6Y4OZQgnM1VRTVkHZXFTarQFRmYBIZqSngf
         AiaBQqh4HZ89uIuw/LzNpH+xe7KE1rEMlgFXCF/wUjKoVHi2cX9QA8vzbcObI6QnGMOg
         684Wqh1SJLAF9JEBKtcUJF1JyeSpfx243ztOvyw48nnk6hZ+0GZuFapj/76pRgN7/Uql
         nY6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779800107; x=1780404907;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dPtRSKjvVo2+z3vqCe90SWb6oDiLrj9MENz2zwGAmeg=;
        b=TDiW8LO8WZ++4ba4eorKtdpEyXe2ubmXpbCczAfvE9V3MNEScnMcHGTBayLhyvFrtp
         szUWovKO+IunOb6IXlWMZ3J+yBnutT9Z4HSRTV6mIoEoQk40b0HSGMBpyLedBOXNkViW
         PT1CMflIiSQLgxD9tsTlouA2kX488u2hu8w1KQA6e70re6fLXthMXx4FkpfFKlOxWXmM
         4aafVLxIgL9Rz27XfZlbpED/cz+vF0VStDNfUee1Pbm3Wkwh0V2HlQUusb57OatFJN8j
         6QIkZxecq8CyBU4dG0ONqo7u84c4DlkDuV8P36dlws7z8u2SKLHRo9S2ZoVfXsatyqR8
         rs2Q==
X-Forwarded-Encrypted: i=1; AFNElJ/k5LdMDy88Wik62LsuMBzqduT474caNytuZV/gmLOsG45K/iyj/ZJ+/5sHSVMMwosSTjeeF9C3A+BT@vger.kernel.org
X-Gm-Message-State: AOJu0YyCwmXrgDzmAFdLEgDYlpdcBf/YD3+mu/blagrA19dp6hKmoLd4
	Kk9RKS/CAxy+uGiFg7tEh6OP9lsBjlTIQZsKYVaoZW1147rjQ1cMBDbhKDj+yIZfvBRhpx9LAtJ
	fOLIxl4KxMiTw7PYLaj30Ee9UmGNeIYznngFJ8CAkVzk5svDmBB4bP7crWJ3z7iKo
X-Gm-Gg: Acq92OF9uNR58VjYtAQmH14z7Y49Cet043zQ8mRCG0InBGnoZfvZR2wVo7gNzYeTRnw
	o28E9WZ84X2z0uL/4c3W7WZ3jBMZdqpVnhbc9zRWTLzno3lSxb3mpEqcf6U7gIACf67dBp1IKhG
	SxxLcdCKW0TkWNb5SrF+rm96lnBnvBbSNMROiA0dC1OvVvy25rs3l7qOnhQMcwXt1JWVpaUteK3
	IKMBefTvG1rRstJo0RmVGm3WZ7n2p7XhSSkjJ9aYQdVpBU1S5RHZcORXNFupTceQbSpBZFrSnBW
	b/E1kgmP8wvOB98TyEOmUvzGchi2aZk1EBTT2mKoz7GCLC6EG/pBKdVhPr/96fpdkwgo9MzinFY
	bXEAbCKiXXD75/QinA+QuvDfWkHq0USsDUecm/Lf0+E17vJE+pS2s
X-Received: by 2002:a17:903:1ac3:b0:2bc:7d1d:b677 with SMTP id d9443c01a7336-2beb065f97fmr207160555ad.36.1779800107062;
        Tue, 26 May 2026 05:55:07 -0700 (PDT)
X-Received: by 2002:a17:903:1ac3:b0:2bc:7d1d:b677 with SMTP id d9443c01a7336-2beb065f97fmr207160105ad.36.1779800106591;
        Tue, 26 May 2026 05:55:06 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb58e4fcfsm129000165ad.71.2026.05.26.05.55.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 05:55:06 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Tue, 26 May 2026 18:24:44 +0530
Subject: [PATCH 1/2] dt-bindings: clock: qcom: Add the definition for the
 USB3 DP PHY reset
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-shikra-gcc-usb-resets-v1-1-6d9e7fee2998@oss.qualcomm.com>
References: <20260526-shikra-gcc-usb-resets-v1-0-6d9e7fee2998@oss.qualcomm.com>
In-Reply-To: <20260526-shikra-gcc-usb-resets-v1-0-6d9e7fee2998@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=IrYutr/g c=1 sm=1 tr=0 ts=6a15982b cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=8KYR8grS2LNeUGeHJPkA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: VMXlKEGR9qZf7Dhhm0q1IS5xWyegcgYK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDExMiBTYWx0ZWRfX6jJaKNc5fRDv
 RIVKItxYle8N6kBCfOgoggMtfbYyttf6/6gRP6XeMmKtkHXb4hsRdwwZUmR0y8AfFfGZ0592GfG
 SE2FZJ8xPwyBIlcIMedWqipLGZ9rQbsXwVmu0bq/0s0E/ZM3Ke+cy1k+pCqeA4JWzTCEJCrUfFG
 HjbXXtf1GA3EYDfxPgEqYDNwfxOjnymBePZ6autUxwwhQQO2ftKzEDfTkk26XluuRN9+aOeLkA/
 Kc1MFLYaSfuBZAzxM8emqUUod7QF5Nb1UuPudzVI2SuZyi+isIgBtldrWF2yM1r9bj3LwT9LvtW
 RZ/EHuGsrUQM1zeRBujYRXFUwp9ElmL7M8DvhXDb8HWUzKaCP9gCxI7M3CsqJMBASXyTb7JfZfy
 9DHm47eytraVwDZj8o9gjJ+HYpVxD1IfbxQYcPi/tiedHuSTsQKP8aWOuYdWU61CaX4k9SNokYT
 Y3LRcQSz0Sr6kJoU65g==
X-Proofpoint-GUID: VMXlKEGR9qZf7Dhhm0q1IS5xWyegcgYK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_03,2026-05-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 phishscore=0 priorityscore=1501
 clxscore=1015 suspectscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260112

Provide the GCC USB3 DP PHY reset definition in dt-bindings for the
Qualcomm Shikra SoC.

Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 include/dt-bindings/clock/qcom,shikra-gcc.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/clock/qcom,shikra-gcc.h b/include/dt-bindings/clock/qcom,shikra-gcc.h
index dc55e5652caae247359f869a998f81a785a82e0f..d3abaf541a33beaca4d5a2a8a0930f2a45ef8524 100644
--- a/include/dt-bindings/clock/qcom,shikra-gcc.h
+++ b/include/dt-bindings/clock/qcom,shikra-gcc.h
@@ -258,5 +258,6 @@
 #define GCC_VCODEC0_BCR						21
 #define GCC_VENUS_BCR						22
 #define GCC_VIDEO_INTERFACE_BCR					23
+#define GCC_USB3_DP_PHY_PRIM_BCR				24
 
 #endif

-- 
2.34.1

