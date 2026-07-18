Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3C8A382287
	for <devicetree@vger.kernel.org>; Sat, 18 Jul 2026 12:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784379436; cv=none; b=J/R5DoX46AQoFv2hTSYybD2YJ2E8/aLxIN72lMuUvtlcoxgs6q8zGGzBkZIN13OoSnI87MBetKwwUCGiJhSrF8JFSWHCAN3tW/rDZSwYDJpeZhco0T0CbV5wV33hjli+lEImjQOxXs8zzGZYEZz/fVTqI/rn09+iVKIESfsf+sA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784379436; c=relaxed/simple;
	bh=/jTDJO9KspNxdxYq4mtRdVNu5us04CJIaEmoBmYE69E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UE9xnn6Kx/BvEil5yUCkM14l1nO0wwW6FYLwnJQDwh9Dl6jHSagSlQqRTYWlcMC++76BEcJpuziidJIZY3pOyXMOWm1nt5hIy9gBd1lnuHhM3qBsAo/uPwkuKY6KGZggAkbF31opUn3U2GkUfiR1t8jPXhdK2toJFYQ3wTXL96c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Csqhf6+r; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dCz8wb6R; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Csqhf6+r";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dCz8wb6R"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66IAHQvS475524
	for <devicetree@vger.kernel.org>; Sat, 18 Jul 2026 12:57:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y0KMHDR2aiF0aBEdbSdNagjZc6RJmwinGEkBwK7ConA=; b=Csqhf6+rZiEaiw7P
	kqeW7q9E47mFHVNmOCAxSUJrF7GnsudI60jnMM0cxQXzDzmAEiZXWQZu6kSKz+cc
	5TJ+BUpRsKr8/LTqLYjP19UESiOh04b8/CWq22N8KY5ssV2T1nv0YIlTacc9FbRg
	64VoeEBadMRa1YHqKI+SD9Snev8HeNW4g5Ejho+4biaK37imF6JY8U+Gpi4DlSGC
	bMnLBWf+b2AR5MpODFVGiVzACT90fgTQ5+AE8PUD/xe+joZWaCLQC6tHs/pwIzWY
	hlk17kwy1zcUHa01tR5o5kDrq97xCpgVgZaBWXzMJY35tYJkEGPHvAXVyqHpfbqI
	Bdl4Mw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fg2bngsq5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 18 Jul 2026 12:57:14 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-381abcccbf4so5232694a91.3
        for <devicetree@vger.kernel.org>; Sat, 18 Jul 2026 05:57:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784379433; x=1784984233; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y0KMHDR2aiF0aBEdbSdNagjZc6RJmwinGEkBwK7ConA=;
        b=dCz8wb6RmzEAgl08Vw9usO7iM8ZpixsppyBLYhpAV4OdUt1Ibm/FI1wJp2LNAd/vOu
         tTRS5lHkKlD1Z4LOr8O0qBgnxJDBOewcSEbh/d50e+SwuxbybwK0DJ0nrTHaAL/9qBz7
         +ZiPigjsM1B1/5/IDKuiUZAgCBW5r93zaA6l3YTq8UiXXdR/EIuD0PvD+r9xqJnVslTa
         8IRnRjxa99+a5JkGVjHuZ2fOYoXsgHcMbFoDc4j4Q2T8ZNDU2xEfakqNaoaSI2AsWAUL
         DHGKsJKlm0qV3P+0XXOlIxlxXqOCvP1EiMV4esc5dyVvHuCSfHejYCP6N6AiMCMTqORV
         b+KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784379433; x=1784984233;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y0KMHDR2aiF0aBEdbSdNagjZc6RJmwinGEkBwK7ConA=;
        b=AoDBGiWP7UGdXpjQLOPiG20piBh5l+1v2LSecohfbvhPji+vraw2mpQZUdeMcbtPK+
         h8TXpaJJOKK2+DLfC2y91zKGKC7qiGImeR5MVjlr986ruInbLTXV1TsDg86C/DXUzR1o
         GRebdVIS+88tIMcz7N+CPW+LhYJnXDxUalOzsAbCgwDu54yuSZQBgLA6ZeqkKOImuZ/o
         MjZoSvGFid69kIv31OpbSh/6N3VpGz26a79HlMX6YJ0hTgZQbV38wP3LSuh/03PSRDWh
         Cpb4LwcUu/q6rpsaEvQWjtnJv3xCWX21Gq0q+thr37xfw/wab3JrH4QB83+KDd7/ixr0
         SR2w==
X-Forwarded-Encrypted: i=1; AHgh+RpyCTe+e+ld/GbbYsZEHn7xgB+Px4mlsw/Q0/chmqxBMV5BPvXFl7jtZUJXcJUrp8n/DbK3sWDxqxCB@vger.kernel.org
X-Gm-Message-State: AOJu0YzU+ou04+452DEBqUIheM0xkeO6Ksa8DrAUjZU9sZ6Dxg5hjx61
	bn6UOHg03appZTpVPvIYHRHnJ1uD8bVByOfXXHbJBliElq3gh2948043rVkwBc0dRK8UjM0hcFn
	1NXPlphNeCFtryR/gjA+90xoBCQr8pMMf1gyIAI2K3Kqd31+9s+4za4FJ0akKxLCR
X-Gm-Gg: AfdE7cnBECrsCH76W3nrDe8A01tWNAGdODtit3CtBHw+nVV7yxiIDZ1Pinu7UrKVrq7
	Eq1gx5/AUy/Mj0SEWI6WLA0kgYz+I1og7QNzoQmskAviegnp7IXpG5wRlhGL46XLggZuxgf128q
	rzHk9X3/9W6kaDHpObG7D0WYdMB6LcCiwuQaRk/UVgJmJ+WqtW3ZU1Jo+0nR+GX6WDlY/4D2a6U
	yBals2j/jHdhepiRrafkKiTZTBHq7QSmamKDJtBy47dcq+SLj9UNDbl0owkMVtY2lPDPLNMzYu8
	djEAkoxdi8mH1WF+xkHtbXkuyjuO0Mi5cI8qcYz9XpxkhjAMXtujQCLDr+bnfE/Eig64ujY3owq
	Xnbnil7YRflfveFODl1EFm98+I6D9rdY=
X-Received: by 2002:a17:90b:518e:b0:38e:6ba9:5203 with SMTP id 98e67ed59e1d1-38e6ba9529amr562490a91.22.1784379433553;
        Sat, 18 Jul 2026 05:57:13 -0700 (PDT)
X-Received: by 2002:a17:90b:518e:b0:38e:6ba9:5203 with SMTP id 98e67ed59e1d1-38e6ba9529amr562457a91.22.1784379433125;
        Sat, 18 Jul 2026 05:57:13 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13ce2a18a47sm14238910c88.8.2026.07.18.05.57.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 05:57:12 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Sat, 18 Jul 2026 18:26:15 +0530
Subject: [PATCH v6 08/16] clk: qcom: gpucc-qcm2290: Drop pm_clk handling
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260718-shikra-dispcc-gpucc-v6-8-62703e05ef0f@oss.qualcomm.com>
References: <20260718-shikra-dispcc-gpucc-v6-0-62703e05ef0f@oss.qualcomm.com>
In-Reply-To: <20260718-shikra-dispcc-gpucc-v6-0-62703e05ef0f@oss.qualcomm.com>
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
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE4MDEzMyBTYWx0ZWRfX0sx6MVmSu8A/
 iumx4ldu6phL29FpmkMIhPhTetZ63dCigGcTl8PKB78Mg7eEgOIkgu7hJyv05xCyvNlOHgbRWoW
 +M4HLCVNSHJe7wJDpDH4KXIyvIBaXUOUOGwRwJuuooUmT2pLHkcQmGzuBZIiwlZq4DGAMrvf3QH
 j+Ybd7As8zWguFUVsGs4KngGUe2Pb4yhrnURFB2xFGsjBN/beLdhYpi0PfKl2mOr+qgP323HRyU
 8eisrt4BzRbgc+VI64EH54rL5jh0gadOKW0XYcetzFiHgKE9KeRsEfQFW5UTVc597v9rN/kWugv
 k5A0mlHBP1U0204fn1XlFeBS2OJMs1+EoRSiq9dcr24HUMS5NyBfxI2nip4+XYDo6GkeWqem61x
 2P+Evmnh9N+FHPWAv8G4T6AOTzWi108BH8lAQBZ7qqDof8S122RvUbg18kwJ2WmGkulbTfdBdU2
 GvLucstBK1mppQRQ/5Q==
X-Proofpoint-ORIG-GUID: _c13ecPsonDSvrk4BWxUZpwPBr2gZoEV
X-Proofpoint-GUID: _c13ecPsonDSvrk4BWxUZpwPBr2gZoEV
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE4MDEzMyBTYWx0ZWRfX18maoig1d1kG
 gCq4ji1PZUDcTQq03VV2wDFM/2QvQ1WkeMWVUUaS5D4dMxjs/UV/pAVoSg2+eUOMu0JwmuSWioD
 LPnXcw7fWppmPwSI/nJV+lohf+JDWK0=
X-Authority-Analysis: v=2.4 cv=deOwG3Xe c=1 sm=1 tr=0 ts=6a5b782a cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=au4WXa36JUhwBKN8UdYA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-18_03,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 malwarescore=0 clxscore=1015 phishscore=0
 suspectscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607180133

Drop the pm_clk handling from QCM2290 GPUCC driver as the required GCC AHB
clocks are kept always enabled by the GCC driver during probe.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
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

