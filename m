Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDC5434C9AD
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 20:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783110974; cv=none; b=sWGS9LYp748V8o1JThoyU3OwCSTf6jQcw1GT23ju2sPVzD6swLJOo7h8y+VcGQBkHcFJPGMtk3Po/8S3vGUSq/xfxa9F+8qQ9zUPqrS4GXY1M7F89YyH+OQ9c2ZJFX1MNUKnnUmdKEi1tOVjeOKTdCgvyDChvfI1W1i5GoTvLC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783110974; c=relaxed/simple;
	bh=uAhue2+JbkAQvny1V8pzrzyN0/Ln5iCfI5DeJLdWexM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RZM0eZT1m9B08DoHnFC2AvsMNO1eUjPVcOjJ+fm8zNtlc7oY1Upd9cphaB/77aWOuMKGA/3UyK1BYZZJdwz9ys15KkXvt9zHynsjH7rO7uEUp8DAO06NLMveiavOw+HG7vRA17WQQnP6+kc5D6eX9gHRjq13zxi8CB2c2ASt6T0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SZxb6vtT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iBV8DqrZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SZxb6vtT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iBV8DqrZ"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663KPZDW1019664
	for <devicetree@vger.kernel.org>; Fri, 3 Jul 2026 20:36:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	taQ9EvWyaan7heG3WK46TYaRVPzXBOWXtP1BA9vKA5Y=; b=SZxb6vtTWsuUX97G
	SzcIb6CGjrgSesGPlc/VNJiwcsqrxlLNsVGeFauhYH4fgRIVWmV25pfpcYn284Tv
	L+NcnawufYpSOTZOWtrx2/CfO1xWv9FPBNaN2FHzkDg7NZoqqzikRV261dd8c4Kb
	IG5lJokMeN8qBCKeXLXTEO8PnABy7osOcXKlQoKbyhwHU80MqpcpbjYogTf8lAM+
	XAerE8rByHdKnfMafJ0YvK/gwSzl98V1D0fvYZFpGL4OqGlh9nTIXstlBMJNqZOe
	IsyZMKeq3MLfXDSwwU4zKpAdMXLFqThg/rnCkZd+nnUpROlaDI2SOygyVXKoQo9I
	l/CR+g==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6ckj1nej-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 20:36:11 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-847a2509456so1473547b3a.1
        for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 13:36:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783110971; x=1783715771; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=taQ9EvWyaan7heG3WK46TYaRVPzXBOWXtP1BA9vKA5Y=;
        b=iBV8DqrZ54mbNmAtsTcDm+Up1pUW3WBNKssybEN+sbVFXrK194uTgMIEHA4MPrvmN7
         D4AkCNxYZSMv3CVhEzWrT2KlFt57HlhbK2+ltBy6an9zKQ2bZsOBVkeDF5oGkyMY7bng
         3xZf9LsV8/NM6U6Yc+bv5npWBVV05kYng/28htqZIAMkomxPH1EFMqPog3eUYgkFyMsd
         YA1FmOtsaQTLkcgmXzuW+IDsJH1FlWBGQ+m8OVDSaW7/ULbBRY+Yw8liJ7aU72slIJni
         Vn1axE2MG+RJ2HllPJzkESYl8tla/RjDliZJcaFV/jWdCbIOd0upayeAAUTxexjIB8Jo
         iuEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783110971; x=1783715771;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=taQ9EvWyaan7heG3WK46TYaRVPzXBOWXtP1BA9vKA5Y=;
        b=pTSgUvPb5gG6vH6MmKBAMbJnH2vwLtjUKuMnYJElL7PKsQVwDU06iXdnaLFyvs1ync
         HwKXs7BpRLXpxzoaPx7Ur/+vTDKqsZD0hBQkzXb0EZvGGONYljV8t1j6QR/1Pb68GUvC
         uCJYFoFkvfUSOx7oHdR64m797vqYMNF2i0HCiej8+qabG2mXM2/IUyrn3z++OadMNydV
         6IxbLByQlLQ6S7sK6LovF++PBM9VdDp87711O1VwPwhHabBnBh8eIMbqFtoNZvUddxsS
         2AoT9h4NtxYcOm1y542lOLkqPn1ww9aIgpa90403LP30yWrcMdh2YhELzR+6pO+3ZsTi
         UYEA==
X-Forwarded-Encrypted: i=1; AFNElJ8RLvPguJ6x+wFmBl2LtbC1X0FQ7iz3+3v9YxB7h1L6Zjwc6qjKkoWiD3sRwUaq3DSANVfngFu4b1VW@vger.kernel.org
X-Gm-Message-State: AOJu0YyC5JRYEqS8Xw2UOUAojHPdZsMUj33Y9vk4fPOlbtZeiBFj/439
	wlMfoqnb0kEak2Se6VzjwKXAumfs0BBhVT/OXsRISSMVIpAWOBlMOJ/2zXe9wirlnY8XUuRqjNy
	QZmbnKoqOAtK6coNM2q92sxz9bUMonyEkAXh7wOB/s8Sr/5pe5cUAsEDa8IOpcGUrcT41Nepi
X-Gm-Gg: AfdE7cm9A51d0QehRDGShbPQQ4xtb07m4U47ujGCkgxivMar5OQ7i+O8nNWPioEiQSY
	Utz+/iE/O/99aZ5hbFOizahWoZ9qlO6VkpQImhm4RCycm/JQX7Z2B8XrR3qXpcQpeAsd6G6YN38
	kkO+XOJVaChvanVPIolM4wk7tt8aCAljVG5s+ytUd8OJzWbHlBETUz6LWNPh95he8NqcKSyk4aZ
	U1eg3X1OclO7XaUJQmq0rWDpTbqKd1gmoVqgNTmps6C8Yjo3vSrZzPCI/cUWkVn5RJsZ2Cjpzs9
	yOuB/HbQJ7vtRq4M+pGdN1S9uv0qhLwrJaHlVwmVdDGb2ym3Uw/812+saTaz7VnWSzqJxPJRuPV
	NtOKeZOexJv2o7x4KHImTq2wnMhbU7sgYTwg=
X-Received: by 2002:a05:6a20:2447:b0:3bf:c223:4640 with SMTP id adf61e73a8af0-3c03e4a33e7mr806124637.32.1783110970894;
        Fri, 03 Jul 2026 13:36:10 -0700 (PDT)
X-Received: by 2002:a05:6a20:2447:b0:3bf:c223:4640 with SMTP id adf61e73a8af0-3c03e4a33e7mr806080637.32.1783110970442;
        Fri, 03 Jul 2026 13:36:10 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0b7b9a8asm24815567eec.2.2026.07.03.13.36.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 13:36:09 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Sat, 04 Jul 2026 02:04:32 +0530
Subject: [PATCH v4 6/9] arm64: dts: qcom: shikra: Add GPU cooling
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260704-shikra-gpu-v4-6-90cf1a52e539@oss.qualcomm.com>
References: <20260704-shikra-gpu-v4-0-90cf1a52e539@oss.qualcomm.com>
In-Reply-To: <20260704-shikra-gpu-v4-0-90cf1a52e539@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Aastha Pandey <aastha.pandey@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783110907; l=1335;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=74nTS/9j7but5S78vS03fz5EaK8dfgZpR5pvQr3ISuw=;
 b=fhhF8bApESeoCdnsnhF6TzHQXTVfkzqJcFK9FQLBZgaMco8/KlnHfQggBrdsaT5VC2tQRhWNy
 UjnSFkiDIsEAWy1Jg6evvcA5ibpUHPzGK0ZoBVjfcDENiYdb8fIeL9R
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDIwOCBTYWx0ZWRfX8VmcI6EMA/ur
 fX4PlIxAXbWEyiYMGO0g2XnA/F2llO5USnHWqe8M6pXdUHjyx4mO+VIR9GpQ8NFjlLwAgygai1I
 uT9UW+PL/zIpInlyUeqs++bG8BCUROQ=
X-Authority-Analysis: v=2.4 cv=E8v9Y6dl c=1 sm=1 tr=0 ts=6a481d3b cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=doS3iEISOceegCkkCwMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: Vi8c9BaPVAMYDjCo6p4Yf6KZ2OO2vHZJ
X-Proofpoint-GUID: Vi8c9BaPVAMYDjCo6p4Yf6KZ2OO2vHZJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDIwOCBTYWx0ZWRfX1xnSfwuP9o84
 pJBSZg1M1AOF8LuWDDG9sO68Zy+mtMdmIYfETn/SYfxdr3bAW763cNdi7kGeF31ApSibL6IhY8L
 HarTRjRN/Bmx/PglqISz2/DmDpHl83XP40wfZs3rJPV9bbO9Po44rsdvFJ6Jm+LpoSYYs6GkR7r
 nCo+1xHcClmmeT6ZujnS8aTA1TbgnaaS1trsVB+z5U91MNkq2AuZPoEGUVIRjS1h764fZI4WmzZ
 TyQni6g0ud3ML8GiSrAYtMYOEjhbOHI/QtZyF1CPvlXLkB/R7aGqrF89pXYHCMK5dSphedJfBxk
 5AgMEw3noPC5lNaB96ITBDuEwBbK+NT85URNXgfo6hXuAy07m1mswCy3sw2upBhnj2bSBVFtdwP
 iNeUyhdS/qNWx3ZnBvAkhEJ+d5S59DPnx+Fsr/r9HT27aCLfH1kP5qJAZ93CtCXXvko0/7TGWQ/
 ra5nFTrwxmYpHm47KZw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_04,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 adultscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030208

From: Aastha Pandey <aastha.pandey@oss.qualcomm.com>

Unlike the CPU, the GPU does not throttle its speed automatically when it
reaches high temperatures.

Set up GPU cooling by throttling the GPU speed
when reaching 115°C.

Signed-off-by: Aastha Pandey <aastha.pandey@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 34261221664b..eeeaa369d3a7 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -2510,6 +2510,7 @@ cpuss0-critical {
 		};
 
 		gpuss-thermal {
+			polling-delay-passive = <10>;
 			thermal-sensors = <&tsens0 6>;
 
 			trips {
@@ -2519,12 +2520,25 @@ trip-point0 {
 					type = "hot";
 				};
 
-				gpuss-critical {
+				gpuss_alert0: gpuss-alert0 {
 					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
+				gpuss-critical {
+					temperature = <120000>;
 					hysteresis = <0>;
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&gpuss_alert0>;
+					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		nsp-thermal {

-- 
2.54.0

