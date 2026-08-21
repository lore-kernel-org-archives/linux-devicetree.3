Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20517486E68
	for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 16:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787328565; cv=none; b=KUXvWVtCyrPRri0Sn3eFS82YLF3uQBj+eVxufBoZyaMrWI1ePhbUR/qCwQyKPYlcNjxF/6AdRAOzG8NFUXtqWUSZ+Iocp5P1LjG6KgW+Rloy/BfatnLKkp/9EcmXXcVu7ZIn4LxWbDTNGb/nDu/wB5iJkh1yUHxS4zQM9Te/YC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787328565; c=relaxed/simple;
	bh=gHxGYWhnicYORaElGwhsc1d3PMvje3as8cNJCACI2hM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gVr4eWPV0R31V/5hTBjbYAHlE7MNX5ohYLy4jhC9xpnTd+7eL16hzLrJGHhwCtSisoMgh5srCrFcn/hp8gt6GZonSQnDcjYU5QF2Z4tCEhsol/yTx3OnnfKQYd6m4d1ne7TBVKpy2SQMak/N5MjQnOeF0tkrL2T4zI2iyphwLAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NYWY0oMx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=anwZT0cX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NYWY0oMx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="anwZT0cX"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67LFmVhH1875186
	for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 16:09:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Sx6lBFvEGNhy/q5sHRGfQDQiM//S9qhbvL0j8qSm5v4=; b=NYWY0oMxw+QLdiJo
	szf4Io4ug8e3+O/mIiPbVMM5c/2BPdee8O1E5qJAnkta2E2HgzBMhKX6jPFcd0lV
	lGm3udZmOC0tefQvPJFyRxvdhq1knlg1reSDMqL0N0vs19pQT7AMMyd8N4XGSeAH
	J+DgvQ3/3Q1sfUYPvpzvCvtI/dtxRjVXq65/Ufyj50g2bGE24zS5PQD61Bxlvd4s
	E09nXbAhQRfHaTirqbfKfoDMjyChElU1Yu6ftq8Q4eEXpjYU3hKzMUKExIXMqukr
	9Z5uLF6/I1ipqHOPrJWKaOhSQkqnMuUqMAW5Fx41FwZPJqxFzvgFjBblZypiEs7P
	+ECtBg==
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g6gdeacfc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 16:09:21 +0000 (GMT)
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4b2d1eb484aso1939573b6e.2
        for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 09:09:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787328561; x=1787933361; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Sx6lBFvEGNhy/q5sHRGfQDQiM//S9qhbvL0j8qSm5v4=;
        b=anwZT0cX4MNvJJ1LhVASj+H19+8iSF2FKYZ0G7QW4dF6XGhMftGZjig5TqJh8M34/p
         zxVthY10v13COb1kcowm8wFcytw9OfLEkU31llDgOQuZi/LqypkvjrvjizfiSNxR9IOD
         hJpZYdl+RISstZMAFcpp0Vpby9QE+0jS4zljP6UV9JLLef0bG+AMKDVYq7dGXubRPW6O
         GwFwGWJHGF4duIFn2IvHSFcs/rGWoKfo/i1Kkk6UVRQP4wX3SMLaVUT0T1fmqG5ukYGh
         sYKzGcTMGEyEHvCvEuJkVO9NfluDdrb2Z/dTpRECbWkKC9NuKNKjs9yF5Xl0ZUbroJ0k
         JBaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787328561; x=1787933361;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Sx6lBFvEGNhy/q5sHRGfQDQiM//S9qhbvL0j8qSm5v4=;
        b=D4WnE9POBzcR+ACT6GZ400PGLFrLBQptsg/Lt1jXnlyJi4Klnf14gCzr6MAD6ufgv3
         VZEAdoUrQelwERSlj61lLbDdIEDvA9c5yeCulTA2XjLB4caYevYz65r6hRr1Tfx7I0xD
         Ixzd04UZWq/XG5/NL8eLdofrvz+VLwsSvFFccGJ+tf+E08QoKC1/ByG3BQRt149bNJxA
         l8RIASLAO+aI8vjpD9nlUy4DGGTs7SjM0w4OzWKeSBIIXm0Xzl4prXOvrC7gkpdspCq3
         cpWD61/yQTwlCbGn/rplVlDVrLLYSh7NTLlA0L8y1/v9llvM4uUj6EbZZBThICqcUvIw
         6FXA==
X-Forwarded-Encrypted: i=1; AHgh+RovZ1VQTLWpG2cvBy6Nh61y1iXhJiEMf+sSeFQzmGJghl8bnW+Ock95GFZDFWFC08YTF7icIOhldenB@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6ajyc/omNpRts5duKTVdnblZFbXOz6zh2HaWKwFMws1cwoDZo
	VvQZhRRPTui5VFBq+XTGmaLHvt2JvcFGGxVNeIXvSlk629OOSD+rp7fg/G41032rayn3/IKkcX1
	/eFMqkCMG/il2CIaZfHvMsC4AdIGxbnC0P2kLWedOjl3AqATawgEJF9BnVIsmpKGY
X-Gm-Gg: AR+sD106MsoDNJgJp4fZj7e3AZo9H/pL3K/oHSKLIp5Y1GScf/m19ccXif+BjCrBpaC
	tHFP8WPKruovOiVryiXEt2U4a/Ty+Xl8THSmbreVlFh9w5tLgKEsczEWsl+5os+eSCLhTwBUKHV
	deht752R7WcIUzCTeL9R3bkdqu66WKM0obn+uoe78aFfCZdSDl/CjjdUep3LYCZTfIfkKYM57MG
	ebMYv7EBUJn7YJvouRzQDYubjSY6w19X1BYD3dQovJGZHooAkCoXO38iai0qupe22rWcg3pR9b7
	HwmLhLmHW27gkoiLYwS5j4MHJUhqFBkI5Qf/Vlu/Zg+inwf6SxtG+eiIcoRh4pG/60K9tDuIiMf
	kd+9OjUDGye6MnX2cAyaJM+XQOY5/ltWDkGZgn4jzUm1q/yLITrd4h14zhQM3fyp54k0kPTjMct
	1MoITCwH80TSEWcJZBBauW2sk=
X-Received: by 2002:a05:6808:1394:b0:4a4:866:c395 with SMTP id 5614622812f47-4b2ef3079d1mr9005009b6e.13.1787328560687;
        Fri, 21 Aug 2026 09:09:20 -0700 (PDT)
X-Received: by 2002:a05:6808:1394:b0:4a4:866:c395 with SMTP id 5614622812f47-4b2ef3079d1mr9004887b6e.13.1787328560203;
        Fri, 21 Aug 2026 09:09:20 -0700 (PDT)
Received: from hu-hardshar-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4b2d6d34c8esm4804321b6e.13.2026.08.21.09.09.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 09:09:19 -0700 (PDT)
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Date: Fri, 21 Aug 2026 21:38:54 +0530
Subject: [PATCH v3 01/15] soc: qcom: geni-se: allow selection on 32-bit ARM
 Qualcomm SoCs
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260821-kuno-soc-support-v3-1-196e2b306368@oss.qualcomm.com>
References: <20260821-kuno-soc-support-v3-0-196e2b306368@oss.qualcomm.com>
In-Reply-To: <20260821-kuno-soc-support-v3-0-196e2b306368@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787328540; l=973;
 i=hardeep.sharma@oss.qualcomm.com; s=20260204; h=from:subject:message-id;
 bh=gHxGYWhnicYORaElGwhsc1d3PMvje3as8cNJCACI2hM=;
 b=4s47+ystpTmuQ1rGl9zmtQ2TkeJgm/KBhTGCUovSPNHKV9O35WPS3bN4aQd0VIeR1yIiv559R
 UNXDB+NH73zAksFBSuiERuQP6ZxsPQORcPPodjzf0EqvrTjR6vodKD3
X-Developer-Key: i=hardeep.sharma@oss.qualcomm.com; a=ed25519;
 pk=IvwPDKA2xr6jWaCIBBY2ran/H0124QUzVfun+CtEikM=
X-Authority-Analysis: v=2.4 cv=BcroFLt2 c=1 sm=1 tr=0 ts=6a887831 cx=c_pps
 a=yymyAM/LQ7lj/HqAiIiKTw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=6t05LGSwh5SlIrDCal4A:9 a=QEXdDO2ut3YA:10
 a=efpaJB4zofY2dbm2aIRb:22
X-Proofpoint-GUID: hxxQQD9TtPourAT9E7i2qRjNZPrFy3Ut
X-Proofpoint-ORIG-GUID: hxxQQD9TtPourAT9E7i2qRjNZPrFy3Ut
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIxMDEyNiBTYWx0ZWRfX8s8IpDaOLHU7
 WLJRTOpyblnTXLJZ7Cj0SRhJLsc9JWbsVkduZWv+XzSZeFVrprlhTt9NlCE4nKJVmLMPD0bmXAS
 7QGRzxFqX4L9lNu/jZ+4mw6U1vGpWY0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIxMDEyNiBTYWx0ZWRfXx+lF/mmlDh2j
 BZA7kHAMVWRgWO/uaJvJbrcf/UDVCevqk8gqrBfukLW4W/UZSOzd+JY6Tmo1YeaYxEkuv164jds
 o+TMVTk9gsdmqojjJGIKsDTvi2zEn3K5gi78RmkSloU3L3xZfdFwS97cvFfAVmfP6GDyzRBK2UQ
 /JKwTS081IbjNvxumVXIofQXbJx3O4gl8Nv0xoa/i30Ay165zHOLyYBpKLbfsu6NS126DgaWOFy
 xyNqamrvBVbcSXhGG1rx+6SFK/XBfB9MLUamZzBIkBGDBKYlKySJDvDylSfQYkaJCdw8u4HfzuT
 pH1AgZ5KvmsB1xkYkPI/x88ZFy541YBW6HyQ0Nzs+lMWrVrrBvPM8FlGIUZCEQchgfJaOfKsvmf
 MVoVvFuCD5MSHE9qqqeqC6XJpQihM0E7WgAu92K8ZBpTyW81sOD9PhVPgLaKHcxBQDezDAzpzrn
 UbxWnOQMejbpmu7nu2g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-21_05,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 phishscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608210126

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

