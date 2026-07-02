Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2DDC36896D
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 18:34:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783017246; cv=none; b=VfrDApUYUUk+TrYVwzGZCKNbK3LDLyoHcG8z3MLElQ503dDfPV3K0cHPZ59nyXIH/FVVn36/vqrEYHCLaNdLeZ3fKmA4t6kp4WVJAYh6vYyy8Ham6OkaC90fIKpfx0OLpuD8gwDnpQUQpYtWSGGfZkAmUNYKrOrXLJD2hy2qknA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783017246; c=relaxed/simple;
	bh=fxW+iu9BUPCZXeQFvC+j/ZitcPQfoyI6TpduPY3UXn4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ho4u9h52ePKUoZmsyz6O+0CGanbvQl9fl/cKD8cDQjqz2bobagl7FXnNhMt3BnteKlxSVxOlDuWe9hDvqE2NQ8rr/fbBS71qQnWW1HGL11hMRker6ambjxTvRC65jRCsVwa0Djp2lKG4Rvp7rPRJf+BWxoYbZOi5+RiCxcJKI00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CAsQPQal; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bdZM5Gmd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CAsQPQal";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bdZM5Gmd"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 662E3LRM548952
	for <devicetree@vger.kernel.org>; Thu, 2 Jul 2026 18:34:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3Ee2FPXxrwPb2CXHUr1Seq75adNwVKOEJ7OQhb6iGK4=; b=CAsQPQalx6/1PUgN
	b99cC+MvSzQy5FFHztpz6bwVVE9BVwhW9bTAsjVF9U9N7bS6TbrBy9UaA7kIdXgW
	yHPlix60A/a6PxQubeJqQP8wuRJGLFwNUnqrvTDZ+6Wmu0iGNvR0Tx/tEZ3f/k2d
	Y0Q9+GTvw6s9hdDkY3dMLjNx8ucaDYbh4L/9gfSchXAM1UWUnrEHBTpmJUfw92tV
	nHsFZJbgxDtC3P4KSz1wowaUkBEoO6Ph6LmRGPkDshZjBc3rXGeXMLR7Bgnmu4gy
	6BtgAbzXMVJjq/yReZEG/MUa0LvOsV0tzu8PIgcy7ZJgGRCrGVY4X7PG/O9p7HjT
	J5JSkQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5h98k85b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 18:34:03 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c88ab059052so1099526a12.1
        for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 11:34:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783017243; x=1783622043; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3Ee2FPXxrwPb2CXHUr1Seq75adNwVKOEJ7OQhb6iGK4=;
        b=bdZM5GmdLmNhFfQlIEWR0Ff5N6ovhPdlwOO0IgM2GHYu4RwLd2q4K3MtsezwAX3kdt
         KrmDFKYen7Ycdo+As/QY9iPNvPNGLoAEs75RNAwQG3yBOamA60O4CPAnXKxabCNuYZz0
         eTbKQqYW33h6wUDtOjfqF40k8A3XjZ9MEacvCPPsNNihrScPRUD+0fZJrHW4daw+04av
         GmND9o80+ull5tOzCUf2F3EIZjWC298aewx4bRpyAs2tHKsZbv1IqTznCy+f80UPflF0
         cPUYC1SJ0KNd7/JVLVUuPI2Alsr/TozbF2qO+hZUFuV63mloFED68HJHSC0DFZuSuRkS
         iSRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783017243; x=1783622043;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3Ee2FPXxrwPb2CXHUr1Seq75adNwVKOEJ7OQhb6iGK4=;
        b=UF0sWdag9DPuFJ6T2NJXuQ65auJ9B11jT6lCWrUeR1yiYP/qziibg53Z7bcacvEiZp
         BA0lnd6txS5EPUOqbBYPhQj0xMKygl5B3+y8FWnGA9mCbqe/X3rpCA4VXazkHp++MhuM
         TLEsIceWj+YoD7W3+dOCGe6E+1/ue0vKIw6H2l9WQXT78UwFjHXGkxh6cGDfiYJxYmGT
         j6deZqWzlPVeBYTvoaevhwo2mDYMrTrgN3HpXUg8Efc20oOPRNw7B8zXVZsa4nc71guu
         RhmcduK8xZWnkVt7ojoEe+jKvcuKuqkhALwPuhdQqGMCJHMYn2LCrBR+IgYR8ZsIh2BP
         hV1A==
X-Forwarded-Encrypted: i=1; AFNElJ+ToO+AudQi5JztGmMp7Frp3b6nLdxcmJu2Vm2PfsIIEi0fIuF2m/OKsdiz7xSQNvbmIukSS6EizkZT@vger.kernel.org
X-Gm-Message-State: AOJu0Yyvbi/DQ3SmiKHT3vMedJYSEJigKNSW1uUN2JrOuwLekUsEwE4l
	LWbVdKjgME5Ue7ixTBY3RuKY6KYEcpJU1guXAgd/mPmng9fS7kT0kazKFU0WMzVx0kgY9uzYirZ
	fgSZlKY3F/HzaxER/6Wx1M31JRaZR2CyMfbKdYb3cUyVWURrNhpVuEHBfias0GGNK
X-Gm-Gg: AfdE7cki8SrgV7ACsRY3PLMREImiUyzRAD4+0BSTEml+jxksrvZfwkxNtNoIaEvG93G
	D3hRBqJtrxtrwxISbUsJTlQFDA3j4Ejl0QI4M/8fVzJMILGrA7EuGDkp73RVI3QiaF98XtjOEZV
	JQN3CN7KQr8Vm4ZPNezN/0tm0++NvgqGJFIx6TUpVdqMH0dftK79erMjXxmMmvocLrdEozjY74L
	XwfSaSfeyFDHqMCXk10naj21Urxc08P1/1J/qxbd+vcJXipForchrFtP84I6P49N8GJRSHjPVL9
	Rda1AjMLrC3uiMtuAOw7xG1U4hB2kB//My1mf6f3s8YnWoPxjnM7eC0rfJ3lQNAPNDwn/ZNxZUU
	8LO7HHzhmMtWhZPhSUgKL8TU7WZyq5xRBKy+tKNHMIQ==
X-Received: by 2002:a05:6a20:72a0:b0:3bf:8a0e:dd99 with SMTP id adf61e73a8af0-3c01c8d1863mr946313637.17.1783017242966;
        Thu, 02 Jul 2026 11:34:02 -0700 (PDT)
X-Received: by 2002:a05:6a20:72a0:b0:3bf:8a0e:dd99 with SMTP id adf61e73a8af0-3c01c8d1863mr946268637.17.1783017242451;
        Thu, 02 Jul 2026 11:34:02 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c7ef5b3sm15704735c88.1.2026.07.02.11.33.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 11:34:02 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Fri, 03 Jul 2026 00:01:34 +0530
Subject: [PATCH v5 12/19] clk: qcom: gpucc-qcm2290: Drop pm_clk handling
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-shikra-dispcc-gpucc-v5-12-cc13826d4d5a@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: y9lNF7cLMvcDH6yDMxFL8Vl9McjVvBdO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDE5NSBTYWx0ZWRfX2dkFVR49YTwO
 wQQrn0sdoj/zUSOe+H5EMxLvfgeSPXx0l5TcL1poc5VXOE/zamUjigfmefKlAFlS0KiJj3ALkCu
 OYvxl/t8VFe804v017pZwp+zkoqxlbfkhS5G8JkmQvs2GcK8kqqiPdFXekqFOpXZZncJ1c0BmCX
 sCOs1Lwzy2bLUIDy/Z41/NkTvjH5tQ9hSSAACdJXk+JH1FK+rgDgCmrmYjHp3jt5GMy2uet0tAR
 pgW5w9IuToTJpXjRrTXBOtCTDpagw5IQTTUfIKp85naRzH3tACETNsFjo01DIfMxvELcaPNUHik
 8qubosaNJ1nGPLko5hfDr6ytWRji6o0zrXrv1Ws4rGMrfC5mvSi8YoM3OMFVCQFo7+NZsYo1jJj
 SZzQmMOQ3HPwPk6/5troIB6Fl8H7HVe6oHqmbiRPf6lEIt+jaSABRTuNIfizYckV/2mKymuYa0k
 moxRAPb/xMDmN3TFXRw==
X-Proofpoint-GUID: y9lNF7cLMvcDH6yDMxFL8Vl9McjVvBdO
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDE5NSBTYWx0ZWRfX8iHA9swVCG5+
 lQmMzbGHlF4aI6PGg6zRF3ivtPUtd+JP8yY/DlznAF3fC9AjYI0ob4WkIFkY7qrikML0XM1NcG5
 iPJzc0LvvTdZOzQjN0aOiFyG5DKGW7U=
X-Authority-Analysis: v=2.4 cv=bdFbluPB c=1 sm=1 tr=0 ts=6a46af1b cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=au4WXa36JUhwBKN8UdYA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020195

Drop the pm_clk handling from QCM2290 GPUCC driver as the required GCC AHB
clocks are kept always enabled by the GCC driver during probe.

Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 drivers/clk/qcom/gpucc-qcm2290.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/drivers/clk/qcom/gpucc-qcm2290.c b/drivers/clk/qcom/gpucc-qcm2290.c
index 4e97a02d942ad23af561ec6ce1ba0a6f61bf5a69..f14b4620090efea139316ad833e034536caa5199 100644
--- a/drivers/clk/qcom/gpucc-qcm2290.c
+++ b/drivers/clk/qcom/gpucc-qcm2290.c
@@ -7,7 +7,6 @@
 #include <linux/clk-provider.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
-#include <linux/pm_clock.h>
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 
@@ -385,16 +384,6 @@ static int gpu_cc_qcm2290_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	ret = devm_pm_clk_create(&pdev->dev);
-	if (ret)
-		return ret;
-
-	ret = pm_clk_add(&pdev->dev, NULL);
-	if (ret < 0) {
-		dev_err(&pdev->dev, "failed to acquire ahb clock\n");
-		return ret;
-	}
-
 	ret = pm_runtime_resume_and_get(&pdev->dev);
 	if (ret)
 		return ret;

-- 
2.34.1

