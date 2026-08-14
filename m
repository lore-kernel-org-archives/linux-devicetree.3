Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A8234195B5
	for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 07:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786692760; cv=none; b=OcDfOQ4QVuPZCAIb5l5o3m8CLxOrBrr2az7v5mw8auAQQWLq3qDmQGVtsJ1hUSwEXv5x4PpFomG1WSPxH8mVE2B0O5PaHLRlLVFRpxaXz/UHdGL3Ovl+wkt2iKNCaa/2QVSO0T7oDJkBcv64Xz5EaPuBg4srzmxlZ7rR6sIbEYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786692760; c=relaxed/simple;
	bh=gHxGYWhnicYORaElGwhsc1d3PMvje3as8cNJCACI2hM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Q0fVJE5NXvcmZhvSGIp9mw/Rw24pSzNTIn6Z1llD88etlRacPJLLVEOBRsEJvxHeqjfKT5Z6KDt65hvsK9cAexJO+/KGrQwpwl5mGFKvCsUmb17g1RSrCRC8iZd1VjvgJZcC+HkMP1bDybQRhZlnQKz/oRVHLEqMbxLBqlpAtKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZqyQF3qY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=biUsmutG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZqyQF3qY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="biUsmutG"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67E4iJL3292030
	for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 07:32:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Sx6lBFvEGNhy/q5sHRGfQDQiM//S9qhbvL0j8qSm5v4=; b=ZqyQF3qYsoI0iga1
	P0dUrddoNGW/Ab0986gmxFI6kCZjk9D4aTCdcl93gkZ2gOTsEG6zttj+vk3n3sHB
	yUvoH3WK4ACmQpd0rPzTZ49Sq1QiErQrMef5rdf9kgWxLaNU2+lb/iJezrienF7i
	i8g503thezTB+pMyNyqOu3rcpyv+IFNrNZrbpjVstKQp0oDTBsaaB9yL/mFzalz6
	C8V9gcQnN1b7BIZl4McYrwLCnDa47eZgfZwEtiBoImeoOqnJQuCnuoDybPbU9FMo
	09GAHagxNwe4H5BATQW0FFiMJ+VQJ2l0JFX2lUGIoh+Cvz4VCKD2uMmkBKbIllAn
	85WIJw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g1v8prjus-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 07:32:12 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cd01a14e81so11322355ad.1
        for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 00:32:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786692732; x=1787297532; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Sx6lBFvEGNhy/q5sHRGfQDQiM//S9qhbvL0j8qSm5v4=;
        b=biUsmutGWzySCJfQ8FqlX7Xo4V07x5LwsyNCpoG+jfuacZI5uHHc+qZxgl2LTIMIiA
         3H0AY4zpSLSMjAzF1YJdbflBnSpuQNkMyMvmCeS0nXJVJIwAk1qULnE2kD+hsYB+VNHY
         y7UyONEnjMGPlxiYV/jh0N3eCulvETaY33CO/wJGmkg7c5nyBpP3W6Fh/xV1r8jlQTtA
         256wsbDvZ9ug/1Jim6k30u+z9HMA1N8qk6P07nny7PmQIICLZbftwzbC/bXq2EftWnFy
         E/AR3OIzMf6I9bXSncv/NjosefxE7++0nS4nS7OdmVDFcDEz7W0Hn0Vhi0fH+0wiKeAh
         M27Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786692732; x=1787297532;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Sx6lBFvEGNhy/q5sHRGfQDQiM//S9qhbvL0j8qSm5v4=;
        b=DD0lok5rkxTe75GJQ2H+DhIJElxKi7+9mCRaHNSMjYWK6OYG8VcEnsnmB5m3Msujvp
         G8kVU1ZwdpIxExm1WwvQZNCLwmWcBYt9KK3pTPg3E46NZdEFRh/P+KPUCno0UVjU0/ww
         uZds/uT6agIweIWRR3+fHmSJojStlLHbwpMurtIgMp7XjApaAeyzQEnIPAPqLhnU+gcL
         NGrKYh0r6+lUL0tlkR/xgR704ljClztftF5f2DPrkeD0gh7hPtKZMr0YDeGQkl+ZGLoh
         +l1oNcHnLgtX0GOC2S0MeuDOmsXlwBmmlePRg6T68BcqvjX9Hku1M6Bp3nROr2x9itPP
         L4cg==
X-Forwarded-Encrypted: i=1; AHgh+Rrz+1R1Gbu/pOv14+1gmJJfy38hHJpLJhsLWNZrKWqMus/+TXczehgTk6kagxQCpkLziF0Wh8od3mWy@vger.kernel.org
X-Gm-Message-State: AOJu0YzVVi59WqGjDflL/xZ4nXMzQagZUBx/3YQjdHI5qPtGaldVjTnq
	6jMojZ6FD5pHt4Ce7W5T+zl35MtqpCaVNAz6sZF7764LWaDHSrWDICtLvPkl5zYiWBY0TjhX3Mn
	1tANunNwZih0mTKOzw7H8ZLqqUwwaTfl1Klh1snvenuOav4pgpzb9WCJTb+gMYMy8
X-Gm-Gg: AR+sD12CojGc/rqWfxTzawj2/uL5hSixigYEp0CU4lzKCr4lS8XUjZ0NREWeoyIFhuh
	S//k7FIrqrBza2+oHCMidQUz8DADKvOlvriGxsg36mQCxSA8WFLrHKpQv22gLs+/v8Hz5ZlEmmq
	N3xxsFfeRvFHqvCrcjwTXduzTreBMV0DC3DdW0BY/vnGpsBzuTgHzi77eY9uGNmpN2/jCSV256t
	kTP5CnpxrjsNDAY7jBaqKX7Sg3P44aQZN8JdP938VBF2hPJBC13HXWEaqwE78xJIy3oeOK+1n4X
	HH9B7nnKJ5rjYRGgW5hVSrvXBHO1qA/GAM+PfzkNsIJR5zlTFOoM5ilSgVmc9qjcJb+i7yRyYTl
	Xp6P514qwHOIKhAum+jBmI7UIXroGBXCLA0vg+oAx5PTuOnI0ldWYZ8BHtJBCB0MMlfj4fKtnl2
	yxIG2YrSh8BltSQ978EAc6/H4=
X-Received: by 2002:a17:903:2c0f:b0:2c7:ebfb:618f with SMTP id d9443c01a7336-2d3b0eec2f6mr47931095ad.14.1786692731589;
        Fri, 14 Aug 2026 00:32:11 -0700 (PDT)
X-Received: by 2002:a17:903:2c0f:b0:2c7:ebfb:618f with SMTP id d9443c01a7336-2d3b0eec2f6mr47930065ad.14.1786692731101;
        Fri, 14 Aug 2026 00:32:11 -0700 (PDT)
Received: from hu-hardshar-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-320ea804233sm1062280eec.26.2026.08.14.00.32.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 00:32:10 -0700 (PDT)
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Date: Fri, 14 Aug 2026 13:01:32 +0530
Subject: [PATCH v2 01/15] soc: qcom: geni-se: allow selection on 32-bit ARM
 Qualcomm SoCs
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260814-kuno-soc-support-v2-1-3079794f0f73@oss.qualcomm.com>
References: <20260814-kuno-soc-support-v2-0-3079794f0f73@oss.qualcomm.com>
In-Reply-To: <20260814-kuno-soc-support-v2-0-3079794f0f73@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Taniya Das <quic_tdas@quicinc.com>, Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>,
        Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786692713; l=973;
 i=hardeep.sharma@oss.qualcomm.com; s=20260204; h=from:subject:message-id;
 bh=gHxGYWhnicYORaElGwhsc1d3PMvje3as8cNJCACI2hM=;
 b=I0K2b/N6iz/Hf/cAEZCNxofz9Q4I9Wd0lnRLDoR4xw7gpjXX9Y5mTLDuaUuwduG/xIi8+eCO4
 Fhxl4TnLyFUAy1u4Qn15sFvcwtEhWmOFc2g9+d78zMwYmEfpYDN52DO
X-Developer-Key: i=hardeep.sharma@oss.qualcomm.com; a=ed25519;
 pk=IvwPDKA2xr6jWaCIBBY2ran/H0124QUzVfun+CtEikM=
X-Authority-Analysis: v=2.4 cv=K4MS2SWI c=1 sm=1 tr=0 ts=6a7ec47c cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=6t05LGSwh5SlIrDCal4A:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE0MDA1OCBTYWx0ZWRfXwalfbKIQr+7x
 r+5G+wl1q2VB9lG+lFqu/EQKfl2j9Pe3VJVULot64V0AdC+qdgyy1pOwZIGFPKej137TdsjEOEs
 BCsVsvHzrfEBK3g0XOytXerCdvzKFVDlBRcWx5tPPqnllodopncmrTlKmq4BlBM4OQVGteIlAEI
 LDoUgSL3rBYp6wm1KxLiNJ/AiCzv1V2QjRv73JdK5+4tuKkkUSHLidqBPnur1jz00EbD6km8Fb8
 iZivDL6jrRtwbDDf0utKiDk3J5M1HYIeEOt9sf3ntc1PMxaakhQHz0EhFWxZIKe6WwJJENCWxCi
 YNS+0V2U625JBueU3+p3/1RoBnvrXHvtLlTo3E445MQ0MTcoqU6CQZ31GAN6KCqtreHb9zYDwGY
 dqsf+d7uYoOGsXD1scqNfVF8Be+4gy5jGevbi2+pW0EGgy5JUzguQCMamCTKBZv24ZsvIlantj7
 vhnC6fCexDCnL+8GRzQ==
X-Proofpoint-GUID: cT9tl3pZhyCXCZyopHvUk_xgdcBc_utv
X-Proofpoint-ORIG-GUID: cT9tl3pZhyCXCZyopHvUk_xgdcBc_utv
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE0MDA1OCBTYWx0ZWRfXyi9DIYF7+xFW
 tVzifxl4juUV30hh/LpZI5vzcEVlVaS6Y7Khd3Z09m2Dm3K6obilklPkS92Y5BDE+lz4gSF2W+E
 hIyth1WfyhEVJi7eTW4oE1Heg5V0OZs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-14_02,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 spamscore=0 adultscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608140058

Kuno, a 32-bit ARM Cortex-A7 Qualcomm SoC, uses the GENI-based QUP
wrapper for its debug UART. Drop the explicit ARM64 dependency so the
driver can be selected on 32-bit ARM as well; QCOM_GENI_SE already sits
under the QCOM_SOC menuconfig, which is gated by ARCH_QCOM ||
COMPILE_TEST, so no replacement dependency is needed.

Acked-by: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
---
 drivers/soc/qcom/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
index fd4d4ecd2df0..5b3c9d31fd7f 100644
--- a/drivers/soc/qcom/Kconfig
+++ b/drivers/soc/qcom/Kconfig
@@ -39,7 +39,6 @@ config QCOM_COMMAND_DB
 
 config QCOM_GENI_SE
 	tristate "Qualcomm GENI Serial Engine Driver"
-	depends on ARM64 || COMPILE_TEST
 	default ARCH_QCOM
 	help
 	  This driver is used to manage Generic Interface (GENI) firmware based

-- 
2.43.0

