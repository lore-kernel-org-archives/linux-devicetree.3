Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B13D346AFB
	for <devicetree@vger.kernel.org>; Thu,  7 May 2026 07:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778137711; cv=none; b=EwNKMCaG3uGSlLSDNSBwvewhm6yk2Hvf0y7CLe3NoK083QSchf2Tsd7iPRJ1M7BfA490l6riZjeL3pHIFVGeD+NG7hnYwrhvzhBQGVcSKU1ekarWxILj5qWFdssQA/oV9kQ8UvkJy+HK0ZI2Ea7jrHndKQCufQbUs064ODZBHZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778137711; c=relaxed/simple;
	bh=ped0zn8zHtOguB0QMsTA6lPQ+hYAYtaBooH+PhpHol8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CFVPyMIkZ5TrFGQjpYeHB1q58FLddDLAP2Gxry+KZnNLxb77rWJSbONE3INe6c1Z4VKUzbW8eJ52Zez3c3pyg7GPG1a7+rU1k/d7Irm6h1Hcl7V9q/h2J+JGEb+/hy3rhQq8UNwLMRnMWWlZWPGzV47RNggYpjxWM3UL+jp5s1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GCPoOWjB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kje4w1hG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GCPoOWjB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kje4w1hG"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6473eVSV026493
	for <devicetree@vger.kernel.org>; Thu, 7 May 2026 07:08:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DY52uMyj8x8JmaVfiE6AN1KUCcHZtly5LcTEKGv0U4A=; b=GCPoOWjBoxXq/hvr
	aVmio8Q8JrmhZt1pyiRm1DS2Zlx3pcIfVI7graWIXoCY23KYda0sCDqb41+/AmBU
	683Py2lNYEourrxKrSdW4c4UTmELN0emoF0AoxANBsgxt9Ar1YqZCSs1A9xiKHQ+
	hnvOBqzRHocS9GAUY980MuU1+8OM6tsy8XV4g0UFVxkmEEgZuU1fxDfD2cTnYEu+
	NhiPv8wAuYy1tA+fYMF8p6c9KdpFwOpju+bZtjokrqZI5zXiH/uKcaizcIMLipN6
	RTwJJIghDso29aUV30bH7nVrMmAy62OPY0Rblna9ZdRb2AgLtnDq68On7ksXj0y+
	KFCUBw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0k1t0n7q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 07 May 2026 07:08:27 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8ba9baef44cso9409596d6.0
        for <devicetree@vger.kernel.org>; Thu, 07 May 2026 00:08:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778137707; x=1778742507; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DY52uMyj8x8JmaVfiE6AN1KUCcHZtly5LcTEKGv0U4A=;
        b=kje4w1hGSvctEtMDrrmE3qneyuZ2r4zXM0zTIGDOKJNROz07ig8fI8P+rtTpYsLuGy
         zzdECd6qPPD7IwEtN/GqidhOb6HM4qBmPmfgRELUz4q6BCFmU4+aMNvl9yTnnQ8+nqv3
         viRjtGiQmQmpeOc9HX32zfxXZvU+1v0CjAbfCthdDYiEkt0oDJjbC9yVU7Q6zKYH1UUa
         be116xprypypOAqZsrLiLS10/lb+KvYobRpzyC269Kjds4CkzBo/rzRTwSEsD//UAf1i
         kVx0MoyLfH9iGBjkHWxf2UosuAO2N6Kx9yy07c9TEoKUdSiCJBamj4srGJETv01uc9W6
         AtrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778137707; x=1778742507;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DY52uMyj8x8JmaVfiE6AN1KUCcHZtly5LcTEKGv0U4A=;
        b=mF506lkvvIqroVXKJ755UMH0kEcrGYzrj7jA3gOblCXgjCQgmT/bEgk2KnLFtFiHRS
         h8l1Wni9nFaRNL2stehtmEjapM69pFd585zwCTGvPO6b54UuRupdf1TDEHD3+KjsJYxn
         t0wxQ9nWJvi1mzq4q+qgJfIGI+Ok+XAAWT3atVIO5MTdVsJ90+NsCorn155oA74J9ibh
         EvqOWP/rUcPW2hMON/yg3WjyiiagbgnDmAWmaY54gM821rtjL/o2IFvVOfGBVb+mpn/n
         YP489YO3t2OhdcztkDLSt2DSQWlL/LCeTTn5Ai1nPqXDuPR+sgnsfgkXE+bfsbZtX4nx
         a+iQ==
X-Forwarded-Encrypted: i=1; AFNElJ9LzyvucqIADNScrjutbLCbJTfGWSCgFHOEkBV6YzZc0+ebdKP0GoB407yDyaxTGjtQFjXDg/7dA+Hv@vger.kernel.org
X-Gm-Message-State: AOJu0YzQlwTvNbsO+Vn6a3aatdOi/hfK+RGk/oFky2o2MlqSvv3C2KCS
	B6UKnizQwf960KYx5ay7L5TDJIRhvgDtUTVS1Gctdi/y+fBWxLUqLm9W0bea4T60NqLykfR1dfM
	QePUng6juM1LJOmI1qgQhFiS5ptysDl6WNNw1FAF4Ba+D0M+ZQNTBq1wtcesTqr8A
X-Gm-Gg: AeBDievUkqdzFuAh0tl9Vp3W0R8gzt9okHA8MF0IlZ/BHxhgWgaNZPMKUzOLOPyQ/iA
	NXnqCp8xmXPE7ReMkaAuuTjwNgXgFTuQaAOKLtdkNZGhQ5k7BFDYZM2AJpDChx8iz7tUBH2iDjd
	po23s9CVJqTyhS9cWZoHoXQN65cA7LsAN8pXyxGRA5s/ecC8t7458rUsXBBbZfyWxoOwtjD8SuL
	5rsSP2V0E5BocZLeuyL3aca+SZt0I3C1P6XGYFQArjg5Tg5rPSdyqriaCQnAzarZY58N81wUh4c
	Zf3jm62yJhlU1eMWrmj3+N3rY1T8AkqSxEbZd4sAtEMse6gpIwUxAYE6iV95QsZVIjpoA6gJzIc
	76ptmycXcsMKb6hZsVU/Dc7h6gb3nX+75l1X7wxzCgNcHCLT5JNeL0MAJG/asfWxJRLmAMKIeRQ
	PJMH3norMZEOggCij1eAhu0Wyxuqs54iwn35AOu/bm6gbBHsMZ3+LdozBx
X-Received: by 2002:a05:622a:138f:b0:50d:65ec:a071 with SMTP id d75a77b69052e-51461bea647mr96643211cf.5.1778137707202;
        Thu, 07 May 2026 00:08:27 -0700 (PDT)
X-Received: by 2002:a05:622a:138f:b0:50d:65ec:a071 with SMTP id d75a77b69052e-51461bea647mr96642751cf.5.1778137706707;
        Thu, 07 May 2026 00:08:26 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a86aa338aesm4296784e87.43.2026.05.07.00.08.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 00:08:20 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 07 May 2026 10:08:10 +0300
Subject: [PATCH 2/4] media: dt-bindings: qcom,qcm2290-venus: add Venus on
 SM6115
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-iris-sm6115-v1-2-0b082ad8eea8@oss.qualcomm.com>
References: <20260507-iris-sm6115-v1-0-0b082ad8eea8@oss.qualcomm.com>
In-Reply-To: <20260507-iris-sm6115-v1-0-0b082ad8eea8@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=995;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=ped0zn8zHtOguB0QMsTA6lPQ+hYAYtaBooH+PhpHol8=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBp/Dpg+89AtTAZ+p0GTGj3HsNhLOa2vbwG25Q6X
 SbBwZrQ8QuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCafw6YAAKCRCLPIo+Aiko
 1cA8B/0TI9p7676sBpqMniKHxUYJrhvkKisA/Y1KN3RiYa89rIH9n8ocbnKFF995SWrgsv7oYYR
 CKTyEIuUYztgNIhfMdg5PGgGqCwCSHoHMpf/AKIUUsfXH5N6YvjSA69XHCSC6YaJMbVojaSl5fZ
 QfIkcZOcozsvmFnQ9BJtbZflv9N9TJt7qsj5ZtJ/UB6ek3hkQBxkWzpgWUU42DZWUG2dxe2AXSo
 HC1MMcmZb+b9tVh36raU/pKpzvhZsZWYv2Qyf6jYVnCySYl2i/iJi5dNQk+62T7P2SrV4EHyuOe
 zIS2NKukgyTeQmnOo7XQBABMqTtqVjzWQj61xam8WuhioCO0
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=EoPiaycA c=1 sm=1 tr=0 ts=69fc3a6b cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=Qhf5OHDhvhXNivbLZvoA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: bjnZJr9iGgpo8TFLdfAn6DH5WJiPNxqp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDA2OCBTYWx0ZWRfX5t6FzWZVE1PS
 wBndflOr8a5dcKAyKuo3TxtP/VEkNe7T4724WKe2qoR2rHuVA3nmhn2qN8ZOpS/Y9IUPLNpTGNZ
 lWjUPEWhvc2GaefIfpf4euZHT3VkLDrmafHnv45e8Aw3ZGRr6zVxM0VASu1bFdkArABm+hoP2k4
 v3W6xGVjpmQZFWY97kVmNYuOYJWLtVL4veTeIpN995hqH0NxqbpMwtXuBWJGWQpmVZ4R6+M6JWp
 3ltvi4lGkPH0qzDxUjfszDYhE5M/a8r8nicj7yGhKeB7ZYDPTcbD3E7fiRE4nmBiKhkIjw6BlE8
 IwSNDToOcNllFFQ3nAWoqTiJYTVKY7q2BMWVELAKAqK+hunW4PIgIyfsLKKyfzPwb3vjECXRtC1
 LqJ4wGW41j2+PKiinhm9gAGZV16WpmGhcI4/74IRCnSzChpXVRnQs22PqwEAHyaob53fjBNLNth
 al3YFwkffoBTUQ0AWtA==
X-Proofpoint-GUID: bjnZJr9iGgpo8TFLdfAn6DH5WJiPNxqp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 phishscore=0 malwarescore=0 priorityscore=1501 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070068

The Qualcomm SM6115 platform contains the AR50_Lite core similar to the
one found on the QCM2290. Define new platform-specific compatible, while
using QCM2290 as a fallback.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml b/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
index 7e6dc410c2d2..5c5933082f82 100644
--- a/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
@@ -18,7 +18,11 @@ allOf:
 
 properties:
   compatible:
-    const: qcom,qcm2290-venus
+    oneOf:
+      - items:
+        - const: qcom,sm6115-venus
+        - const: qcom,qcm2290-venus
+      - const: qcom,sm6115-venus
 
   power-domains:
     maxItems: 3

-- 
2.47.3

