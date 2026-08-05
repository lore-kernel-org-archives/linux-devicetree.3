Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4620041F348
	for <devicetree@vger.kernel.org>; Wed,  5 Aug 2026 10:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785925876; cv=none; b=hjtBUKX5U8fd19wy0Ks1eDLPNxX/KxiBRuy0s03t8i07tUTNP4y18m5XZYBZcPXLfjlVkk8YiIpTySBPRPhFfyYHE9liaf1qiG9f8SrGTDp3nXDWAFOuttx37gc+PhRB7R8+Yjko4HFsjwG4B+FxTleZgeX+lIdJPzarRSJDksI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785925876; c=relaxed/simple;
	bh=IbS1tzKCwTCwbC4+z7xUK304jUiJLp/mgiK+OotHNpA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WqJ06DYvWVrVrUpqjgWt5v2y6bxZqzVVrJvmwVJddthgYRX1BeXl5RbncRD6ZfCOu8m9QajB0flTpu8umT6Zu2OhOhzAbnMl4fVcLmiOrr/92LGIgsH41f2xdK46HdqNDVX+s+Tri+S/AuBLa74d1G0qlr6CN9idaB00d2Uc3Wg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HSU1LNPo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SBRqaw+c; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HSU1LNPo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SBRqaw+c"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6758dI9T2468186
	for <devicetree@vger.kernel.org>; Wed, 5 Aug 2026 10:31:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5VwHPSQfD6Ni6iXWGzaCLdB7B/fgXzwnuYcxeqPSq0Y=; b=HSU1LNPoiif2fPWP
	nkEpVsULcDhoFyT96jZd9fvnbOM9k5IhBWv/7VuAfZ005IUT28sxkJ4V1AmyIVs8
	n9lEqEjM+SgbwlE+4mzcQXhdzQIqh7wia7PzM6f5rhMkjk3gOPjnG98XylufH3Ry
	pNM5VTYIg0ZVJCfATR11yi/WjLK3DBqgkhMaGA4A8aVxdgM6i+l5W8bA7r/STnP7
	jqsijS8sX6HseJr0pW5eXMzWE9GYr/VFLiWIzqy5K9f0+Tqs1M0jUeq7N0KhROAc
	CPBsrWjxVC/RQAvov1Tjd5DNBk4YBN1bt1ZmmoU6G5FFc09AFYWNsiX/Kogk5NB9
	fGuuyA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fum56m48r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 05 Aug 2026 10:31:13 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c1c7f135bso12634651cf.0
        for <devicetree@vger.kernel.org>; Wed, 05 Aug 2026 03:31:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785925872; x=1786530672; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5VwHPSQfD6Ni6iXWGzaCLdB7B/fgXzwnuYcxeqPSq0Y=;
        b=SBRqaw+coKdSE2+vwPncHwL5HaKAfSAvRe0Ow154bSl9wGoKE5x0tfIbYM6V59PCkv
         2iZM3lYJZe0QxdXeBOYJwze3W5W3CMU/GO0cE2/ymfvl1NjKYjiSDAhE4OYWB8VPhe/o
         RA17OgbVXN7aA5Ta6iEX8sVSNS8hER/3MWoaQGbEcGVVCtzr1mnd0uhgGZhsnO88Cjad
         EvyniLZedqUZTtsktAK2cqxDJ6Htb6zGjv6/XPkGyXiyEvLXSgzE/IoeH2BHiDkIoj1E
         66QsB0U8L2u4spmBfPtkUU2dN/MnGfXWtX8zHe+tHM7ZLRZtbUFvy9xW01p0eiTd8GZ1
         lbmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785925872; x=1786530672;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5VwHPSQfD6Ni6iXWGzaCLdB7B/fgXzwnuYcxeqPSq0Y=;
        b=HZfKkaabnSAVd6hmJPfquUlBBBRLcpUVTO7eKotfYBriYx1EXOEPQTX69CvhkK62V8
         HdtMWL9AKyPm9BhwGyLqz1T7REsCMzEI6MFRgYsXluEQOZxcRfpkOhV4pU9XUsAHkfnk
         Aj9/TfHoRadhih/9m4+4Hw1SIG1pDzo+vDwz3c0roPAccwOR+b/5zDy/3n4JyliNYiCP
         3qdYHn319ISesJg9LyQwesSsQFwimS/r+qvPjuhhR2HcxP5lLsqdOnn2FqSkmEJHaQ41
         5qPaMEQJxW0Nk6laEgaHTAlv/B7+ilXHRaEaJyP58s3+FuMw+wc+DDEEtSq3AK7Umtxi
         z76w==
X-Forwarded-Encrypted: i=1; AHgh+RqVFAcwHOGWwmvgb61ItEVNCEHwDdCvwNkL2u45Hi39r4GIdSG3WE/5VEiruF0aLkP6u2mGbfSSe4XV@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3/pDOWlOJBAB075taite49I/YafxpU8JXOAbGpA+KtS0qEjIm
	pURXeNzHMwXpxiOOGlIrWsniHF9H2UUhk6q1pU1OMtMXxJZBIbPwNKTCJDKGK9UTZIwYjl5GyyV
	nK4B8GVNOBGGUibXB9VrAPQ4ip825I96ZB6VLOniK+7GcI555P/IOkOhq+NDYDqOzS5kqc0l7
X-Gm-Gg: AR+sD11NfZfW7oZ5sI5Ye7YeQvY3lpzWNeWB7JfTiKe/3Gqn304bA/OSKDMiodgonjS
	zVfMWpQF0BrTpfR1S/u5DCSzyr/7K03oJJJp7kteWb8jRAfdeIDhEHHigbvPfCsU39n2nQsA6m3
	zyjSFywYx5V9w6jZE7G4kBfw9795NR7LUOHTASDXNN5n++zst2FFS0l5zWonHSQSwjt92IO9L29
	DWzOb8oWpEUYoG43O2I/lpKgiXeWt0whMcKgZa6WBmhL7A+pm0qPeDliIh/yTydVVSgJcHIQeGs
	4goAp3EgKbO0SDT3JLEWhafs4PXEEw/ON49HBdlxmXqwrTb0UTW140oK0f+mroL/dcWZAGB5K3M
	YPHeSo5LZfSBFqN5WVAH0Aj5JuPzjf5GuBpe9KFy0TXlP9EveIwXHT1JyM44=
X-Received: by 2002:a05:622a:5585:b0:51a:329:e802 with SMTP id d75a77b69052e-52ce62ec0b8mr60446451cf.41.1785925872403;
        Wed, 05 Aug 2026 03:31:12 -0700 (PDT)
X-Received: by 2002:a05:622a:5585:b0:51a:329:e802 with SMTP id d75a77b69052e-52ce62ec0b8mr60445771cf.41.1785925871932;
        Wed, 05 Aug 2026 03:31:11 -0700 (PDT)
Received: from YUANJIEY2.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9087ff9d814sm22259706d6.10.2026.08.05.03.31.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 03:31:11 -0700 (PDT)
From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, yijie.yang@oss.qualcomm.com,
        dmitry.baryshkov@oss.qualcomm.com, abel.vesa@oss.qualcomm.com,
        krzysztof.kozlowski@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, yuanjie.yang@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com
Subject: [PATCH v3 3/4] dt-bindings: arm: qcom: Add Advantech SOM-DB5830
Date: Wed,  5 Aug 2026 18:30:02 +0800
Message-ID: <20260805-hamoa-come-v3-v3-3-20463c43eae1@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260805-hamoa-come-v3-v3-0-20463c43eae1@oss.qualcomm.com>
References: <20260805-hamoa-come-v3-v3-0-20463c43eae1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: kW-riV9Iv_F9GIB-_oZluyMPNSLxjjKn
X-Authority-Analysis: v=2.4 cv=Co+PtH4D c=1 sm=1 tr=0 ts=6a7310f1 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=JItYRnRW4wSoxD4qVAwA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA1MDA4MyBTYWx0ZWRfX/D8Yiu7C6eeR
 VTcuPjW6ku9qthuhPWUSg4h9q+b5wfUCb9Pzi+yZzXFC3GrjTf9/ACxIznv8UPIxBATVJbYb9Ul
 ZWhUcEzajCQjG83Cp+CW9RTAskc/gDo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA1MDA4MyBTYWx0ZWRfXzM1KPYxXjBkf
 6JQXqbygdWearzs0t5U2RjZUC6Je0ecP+O8cp6f8up5GI5lHBvpdMQ90vrQUVQUHZGf9g1q5Vpz
 tbEYuVVe/9jjQkSgtgWNAWmzRroMDSaOzQH9UAKBkZFvwMElhQOk89XeQJkOzQwgyK7yW5ygVAJ
 j4bNR1LzbSLzy6oLoGl5+P2cv1wpBzHXI0hKaobpHcd7zHFd7fkk7s6Jyen1m6gQfdC8qFNy8tT
 2o2GeeZhlb3Px6CTwTyN3pmOUOTDA97e9XblB5FgapM5u8BsCyyFMK9bh8A02e9RQdrZIHlNguh
 ctqls9yr59uDOtRJQE7SVtD8oo2gqa8fO3nfaLfnaLItha2arz/HUGrUQ7g5o98o83GVx2Cfqp6
 EUlLm1t0J6++HZHEgggu+FwQoKWL3HucHVW/f0d1YTmGxIjLHBPLB6HH8730YZOBbYnf5T/E9Zd
 upl58Bj/SC0m0zP/3qg==
X-Proofpoint-GUID: kW-riV9Iv_F9GIB-_oZluyMPNSLxjjKn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_03,2026-08-04_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608050083

Document the device tree binding for the Advantech SOM-DB5830 board based
on the Qualcomm X1E80100 SoC.

The platform consists of an Advantech SOM-6820 system-on-module (SoM)
mounted on an Advantech SOM-DB5830 carrier board. The SOM integrates an
IQ X7181 EVK SiP containing the Qualcomm X1E80100 SoC and its supporting
components.

Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index f244f547d511..e207feb987df 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1223,6 +1223,13 @@ properties:
           - const: qcom,iq-x7181-evk-som
           - const: qcom,x1e80100
 
+      - items:
+          - enum:
+              - advantech,som-db5830
+          - const: advantech,som-6820
+          - const: qcom,iq-x7181-evk-som
+          - const: qcom,x1e80100
+
       - items:
           - const: microsoft,denali-oled
           - const: microsoft,denali

-- 
2.43.0
