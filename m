Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3E45363C72
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 18:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783017228; cv=none; b=lQzmK3zchXESSPOzH55sE7wuYwKLqo0H9nxb4MrIeZ/M+A2ll/+Hv6sYWs6nPRiZ3v+HnS7mCRMrmCxPD7t/E85YXhQ8ChVpMeJoxAR42LwttsOLVfEXCiZ5ZSBvPvwr2gKGlhFX/OQCdRTsgDbKE7wFWqsPFTYOal3dSgxX9Rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783017228; c=relaxed/simple;
	bh=dc+tPFXb8nH2BbNiIpPTtY7ziV1I+rcpbfq0MoU3rsk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TqZNGTsYTJmS2B0HivUbl5rQHln06PuJcKIOMPGdEXSTPT8okO17mDkk2zVGlCsXkQGoyTYNGlQ43L2FUcGTkdIizVPOgGMA4AhCpR24ORZlTEs+bJ0fyPKvo7asqeSBAuOYZpCCA9FCusfTv6RcctxRwWhVZV3YjuVrJHk9WcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gj7kV06e; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SCU6Teib; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gj7kV06e";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SCU6Teib"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 662E3OkD516226
	for <devicetree@vger.kernel.org>; Thu, 2 Jul 2026 18:33:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bp9MMoZ0uCFdttdfaI4jFzKn+Nevlh+VGo9/D9m1NIg=; b=gj7kV06eHHeTn4kk
	Iwwibf6l2AXx5TYGHrZZ+h3BfY8r7v0uxE1sjbdjgXYTSE8ZB0mSTEYGNagHZq/r
	GnFFybYJH8TbIyhR3SM+ML0hcuseZnmCOWyjVKFkRpD9oaTQ4JtFOqt1fhyHSILY
	juZ58+QCRm/w25PZjNi+Vcr6H9JuZ+MRnNT/uXB10k5zlc09lK4mmTNr1hh+6oxg
	78zmdweJXY//XBUQ8Scl5VvHP4mt1sQNUepKe8/DYCTYrV3ibcBxoUgwSeq2eLpZ
	jWjiVDZlUkB8cSR+AweTuyig7i5uAAfBIiqOc/k8Dfho61+OVy4pLA8JA4Z+MdoI
	xxTneQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5npra8gp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 18:33:46 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c88ad1558f4so3025012a12.2
        for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 11:33:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783017225; x=1783622025; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bp9MMoZ0uCFdttdfaI4jFzKn+Nevlh+VGo9/D9m1NIg=;
        b=SCU6Teibu4jMZM7VqVCV/ryCx+99h3XvuSjWrR9LUk8jniXixCZpOUIE61BEWyQrlS
         bbUkXAhnqIyWbkIxxkmdC9dQeuNTFnkqPZDt6KYYEvDBDZ86rPvz8tE98w3LXkw0vp7x
         zjui8Ay6s9ETO3S2cHWQuKKU+QbqDzJ0qcVM6R9hQBcpJeVwKGtlaogOoWwiWTzsUnrg
         bMI3fClxwNCWU14mYnB6cPIomzg92TCihsHV03fvW+ZGul7hTVEZ+p+E8F6nT+BFOt5+
         6SauaS50RBX9P+yxwICvu93ZOOdnhNVf79hjE7ouYF++gr7KBKl6I58oBo6yhnwDnGKr
         dwww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783017225; x=1783622025;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bp9MMoZ0uCFdttdfaI4jFzKn+Nevlh+VGo9/D9m1NIg=;
        b=V6yPxe/L8OQRhSBCkKGTBDrYGjXFowHXklA9mL8SORhOTVzQuYO2DbZAXrMzRFW9uc
         hRoJjOpfB6PnvoLZe9kvl0sGrV2fALpT7FkUchcuq74D96WkLF+WK4Hv5gu2LApJZyse
         rzJRb+cZ6BLIPtbbe4vS45PiZGKs1TXRHnYfB7EZ4rjkGLElXJc0n1BjtfocY1FFCVnn
         +o37ncPvJ4WkAI0jBBGrWy9WDtrJ6lfcepT2jVEeBLgdBZS3s+vEZacObVRuQscxAEvc
         DY7DELYCTjYNzFKjDhBW+vaVy1iqqCpINshhFGxEsRQSr3IHTTWPn+m32Lr1VtpxI5Bg
         BAMA==
X-Forwarded-Encrypted: i=1; AFNElJ/DtBZVunSLegPapZIc9+sCcp3WIpLo6Q23nRVZ8aZc1QFTvANbE8VhToqBrWbQMtGfvYAN5M4IRwbI@vger.kernel.org
X-Gm-Message-State: AOJu0YzXPx9kULMCUIYNhBduDTBGy2gUmQK1BCGgYt1GD4zYOYgSdS4t
	C6i4+bLEQuJBLtFXhVbSV8PLI+8QzFIq4v8mcrZX+EbMpGt406UfHIodxM5ItUN3rHDfaFszD84
	lztEl5ziFH1zmAHiQGZ8v1F3Y2FT0NlKhpic0MMJfTPIFnn7AAfEx/f25VmG4BEaK
X-Gm-Gg: AfdE7clYhcU1LIcwjSuRrKNr4bUwNTq/YWOoOZamyEvjfabQmvtx5mjtLi2eLglMC+D
	Xg61l8A/xpixrRzdPY3YgD2tjV3uw5DdMSpK87JD0yRi/KH0MpxShmk4Miv8bm20Kj7oYglu477
	5gUcLeuVgva7RxD/V+rVJ3nKP+xHnA973vFDb64ug2rewOwZFe7GMI4QPvAfFUMKPUU05S+qt1z
	yxHOVndhh3bC5pG6mhta7vU+ROr15Ebmp4Xvi+ML4vv7bMXC4fFw2TyauH/Nu0vAuvwZMQwTD/+
	2x3VXtSe+CYYRyuOHLea4VSQ4c2Ymj8pBwnXpvkIckNkZpmxt2R19dCpWoMS8fknKpoTG1odeuK
	UWeDIDLfyldfCA1raNuqpJ6dVAmzRISkRwHlmrQpUIQ==
X-Received: by 2002:a05:6a21:898d:b0:3bf:edfb:62f0 with SMTP id adf61e73a8af0-3bfedfb6d70mr7814581637.55.1783017225433;
        Thu, 02 Jul 2026 11:33:45 -0700 (PDT)
X-Received: by 2002:a05:6a21:898d:b0:3bf:edfb:62f0 with SMTP id adf61e73a8af0-3bfedfb6d70mr7814551637.55.1783017224917;
        Thu, 02 Jul 2026 11:33:44 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c7ef5b3sm15704735c88.1.2026.07.02.11.33.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 11:33:44 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Fri, 03 Jul 2026 00:01:31 +0530
Subject: [PATCH v5 09/19] clk: qcom: qcm2290: Set POLL_CFG_GDSCR flag for
 DISPCC and GPUCC GDSCs
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-shikra-dispcc-gpucc-v5-9-cc13826d4d5a@oss.qualcomm.com>
References: <20260703-shikra-dispcc-gpucc-v5-0-cc13826d4d5a@oss.qualcomm.com>
In-Reply-To: <20260703-shikra-dispcc-gpucc-v5-0-cc13826d4d5a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>, Dmitry Baryshkov <lumag@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: wMvrLWOlqYjRi3VkAe0Z2Lud7NJsOwWY
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDE5NSBTYWx0ZWRfX82pR7dkEcRL9
 VaLoNBc4m8H4yUeh7SAINaNnGgERUmASW+hsN/3dkG+WMBKvW0zY4rUVQLsVragMSfc+jZ9aWHk
 h3nJfNk2IJo+H4tfJ+6MFam2sLyWi98=
X-Authority-Analysis: v=2.4 cv=NsvhtcdJ c=1 sm=1 tr=0 ts=6a46af0a cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=WgD0fBIP9JuU60yQWEYA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: wMvrLWOlqYjRi3VkAe0Z2Lud7NJsOwWY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDE5NSBTYWx0ZWRfX80wxWeKQYFQY
 Kx/C76eRyl9AS0NjpPL7PCiI4hvUsvjy58veyPkF5KSv+kjJTNhgtTl4C1KG4BKxexTC2G99YEb
 7Z9mjuaYuA5800TV6Ihggrgm7rXNmfaoH7rfoIwSOjAEHJNk7QvFQbol8risI/cKKnaYZOe+40k
 jbut8P230ne6hVjhTihBs5pgltd0sRF7goXbu0e7kNJ8B1MAL8sujHO0oJXiE7FUeTblII2rNRD
 kIRNBwhaSQJn5i6eaT6lLmjXevRo6DA2xnxUuTIrKQrVLKISyt8IuqtCSz1PgH2zSytN4aEqblC
 xlibM4gDuNKhmiHg+PoG8pmG/gqP7fhEXkso1P9h/mRlwf8zU45kin0E9G+sOW3+MNl8nYKcgbx
 bEomvWIXE6vIyxJ6+6sL3868s9AUI+NUwZlRHsT4YVszB4Q0e7MyUfJMPl6j8VCMkRDzyB5+pHF
 JXCKUn/Jv3to+FW+S3A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0
 malwarescore=0 adultscore=0 clxscore=1015 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020195

On some targets, the GDSCR status bit may not reflect the actual state of
the GDSC, instead the power on/off bits in CFG_GDSCR must be polled to
determine the GDSC state correctly. Set POLL_CFG_GDSCR flag for the QCM2290
MDSS GDSC and GPUCC GX GDSC to ensure the correct GDSC status. This is not
applicable for GPUCC CX GDSC, which relies on gds_hw_ctrl status.

Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 drivers/clk/qcom/dispcc-qcm2290.c | 2 +-
 drivers/clk/qcom/gpucc-qcm2290.c  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/dispcc-qcm2290.c b/drivers/clk/qcom/dispcc-qcm2290.c
index 89a6cdd26217381cd44a515766363cf94d0aaeeb..6ee074555099ab72106cfae7c21adbd1b4a0fdac 100644
--- a/drivers/clk/qcom/dispcc-qcm2290.c
+++ b/drivers/clk/qcom/dispcc-qcm2290.c
@@ -467,7 +467,7 @@ static struct gdsc mdss_gdsc = {
 		.name = "mdss_gdsc",
 	},
 	.pwrsts = PWRSTS_OFF_ON,
-	.flags = HW_CTRL_TRIGGER,
+	.flags = HW_CTRL_TRIGGER | POLL_CFG_GDSCR,
 };
 
 static struct gdsc *disp_cc_qcm2290_gdscs[] = {
diff --git a/drivers/clk/qcom/gpucc-qcm2290.c b/drivers/clk/qcom/gpucc-qcm2290.c
index 66dea9d2a0e519dfc64d977ef107b5c875da3869..3b130f69bb93898ce49654f2366851a7c1c94524 100644
--- a/drivers/clk/qcom/gpucc-qcm2290.c
+++ b/drivers/clk/qcom/gpucc-qcm2290.c
@@ -313,7 +313,7 @@ static struct gdsc gpu_gx_gdsc = {
 	},
 	.parent = &gpu_cx_gdsc.pd,
 	.pwrsts = PWRSTS_OFF_ON,
-	.flags = CLAMP_IO | AON_RESET | SW_RESET,
+	.flags = POLL_CFG_GDSCR | CLAMP_IO | AON_RESET | SW_RESET,
 };
 
 static struct clk_regmap *gpu_cc_qcm2290_clocks[] = {

-- 
2.34.1

