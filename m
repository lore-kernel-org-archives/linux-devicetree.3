Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795166437;
	b=uxqNjErCxHReLpuH3CV8xb+P4wxqImQE7g3QfSUu5V5PQt4/uIOb8AdnA9uyYq8zKZ9L
	 ENoxx7LUhO2hyhBinr3ZyK95zqpYaZiPr8buzKHHJipcjWjE3QVCTMD3bOjz6814KYcdK
	 Oevn43y7YQIAUJzTQE8qiW4+aVeJDnxl+rqhARlLTw4qc4Jh8b0vF7r+dPl7KIPa0EKVA
	 E3wZbJYHgJggY6DjY8/VwpOPBo21zs2TnOyj7vYYhuJo2EG7OVWePEO7UyUXoM2pUEnsl
	 2xAKO+zY8lqBUzinYGtg+ICdFaZlccKDatD0pWnvqlsXRob0v/xXmJoYcdFUKU/0xoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795166437;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=wcw0ND+GzCK33jb32w8A00FDx0OWOEPXUg7F9W5QCHY=;
	b=wakbnOEtoL0BIEWZ+9pxei6S+qkn9mQTOwbQFDsr88XjQoHslrB0pwJIIf5xi1qDyLSY
	 aRQNC54BbqNR/qUYQnd1bP/u1HarzhQAEkr5oXQ4sHzXhftI9c/XdcP/lyGWs/Gk1QAiS
	 4BPuFhfHpvuKTUd0b2/LPmvMKnTTPbzmXKzbCZ+qOwROaxKL5kQBitLXbInZE12xFDCZT
	 ZLN9oMB8s1Iu7qfjobfAY/X7OJWPM+bRXFNrqfveaFQgP2/9I0tumxk0KCQiLOMEqGCZl
	 erQ7bcDf90yy/rDbBs4F3qXNKqbrgbsZu5bAW6VuPX5Ps3oU6rgrERwhVYONdoBL3tA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WxzCL4+v;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NDA4mbaA;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0CCF606A339
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 09:20:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0CCF606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WxzCL4+v;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NDA4mbaA
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK7fu612695649
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 09:20:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wcw0ND+GzCK33jb32w8A00FDx0OWOEPXUg7F9W5QCHY=; b=WxzCL4+vHkMZN1nK
	IpHOYxmmWVnEJ1NemOahvFUnVyhLBkfZ7RWwbIyO+pif/cy8xVw/yRiwT7KRWJGs
	sbo9lkSjIeN7eEiypwN7f0wQHTjr4TIO0Ybv26FDvPaTx77f85m76x1L9o8eXD7n
	exX9RTZTTXxCyPpHhb0S6aftGtXK8uzJMUnICfvHJnjX4e97wREqI/0lWzFwTcZc
	kr7ZxE5R5dnlq8pOEkxUy87A29ueKsdFB4JufOunLfi1DUDWQpEe0KZMmKGbucDn
	Vj3ol8fV704BWLW9HW2fAH9pBFMaNA/rQujoiBbCQ6Qv1+PMa+fm9ifgztZ70s+7
	jobyFg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j27au2xv2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 09:20:35 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8a0619b1fe5so738474b3a.3
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 01:20:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795166434; x=1795771234; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wcw0ND+GzCK33jb32w8A00FDx0OWOEPXUg7F9W5QCHY=;
        b=NDA4mbaAHTplyBEbOeZF18QsQIGVplHyuDVN1ypPWi3+KJqJ6f+djltFAQwWy3DWoa
         bgVBubI/Uq8U6qzAntqDk1CyJRdAbKiYhnocpbl+Vws4Lm3WkaLvsqqJlMwuL6fC1YSX
         4qs2UqDT9Sr161RxQWnEWhpvGKWU0/hMLx2+BbyeKWBqkvqKa/W4YRv4L8KC9BN0s+qN
         nCI3iy4mQkKSDgqaxWvyC7N121RcWGdZp/7Ogt36LzSzAmdLamxpJt/O1MW4pvds/W0i
         gCZ/31i1rV5szC9ZZA8SuqaD7Y+UVOR2XWqxkmHW1ihobQU22i2CHXKkUishFSUuw/BD
         qfdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795166434; x=1795771234;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wcw0ND+GzCK33jb32w8A00FDx0OWOEPXUg7F9W5QCHY=;
        b=A3G8mw22lsqTrdv1aL/ZbF0xv8G2BH41a17GY5cc8kqTYjcwbiIC77SVynMf07ZKTb
         9uNXbYrEQAnwSFrTUJ2bh/cAxpqxTPJFhIKx4hNBCV1jDWG22NcmAFn954X1wf7ZqX/O
         +AnpOJeUylatad4Gu4mjw0RvOiwbfbHz7xL5R8zxJTEABGsA+8dUCwC2TYPHH3Ljw3NL
         grLh/jE/PNDhPt11TP7bfMNeSIzU50GrExLt5UGOjSac/Zbd56RYzzQ6DrKMvLB4ediO
         lpKC1qplbF9HlO2vvozMdfee2eEhEC0vhA2ix28QJqc9p5rbzbpcnVck4NMM4gpOuNHI
         KKHw==
X-Forwarded-Encrypted: i=1; AL+hErF7MlwdlMobVnuA+0hCC23M7d9rpcEIsZTZSKDQpqWAF0SZYdmlLp7wafT3+X9vqYhLX0SY+M08nHXR@vger.kernel.org
X-Gm-Message-State: APuU4Z94soU5YUuBzDd4O4Mp6h+YajiFnIkKiRP/848kZ34lfWD1ECzZ
	IsBMACeu036odLQlPkoqXvTFIPPdfzeNiL/EiRB3wEulnx+dUAE6fFtZkDRTnujnq6zqrhkNGgh
	gfy5raA99HOGQvOv0K5vzrcQMUr35Kgsq7B+TrM937AD75lgG48I0xtZBgd2sCI/j
X-Gm-Gg: AZFdTZd+yRrEnhZiFaBcloezP0bFvK16aKNN8yUbvWCMnjs3BKNrkRhI4ZWzXjrtPty
	rJ5BybqvL+KeoHm+WKg2kfhmNd/EECBqrQ/UgBFvHRD2akSKG1EeAEeTrSh+Cu1JV+7PA7WQZ23
	xLknE0hAORyA3DflHl6hJeqqiL9SF5umdVibi5L3De87ctT1PHTrBa+2iWA5KyYvyoGR0WHIZ8N
	30xjelq7hrNmhIX2XRG9N+rZzCyvvLllPL+WyWQtbrHqaVcQhEGa4xmCydYKRqnBwgiB+Ve4Re7
	qujD8SAtK5M3DkNpIHrFv42IcRHrz227W/Rkw36xBuKFGhr6GZ5B2242Nz2eWWv5RJPlFqGnUnA
	WNW09WDqKMdFjwTObVN3lIK7k95UqRVwvMcA5wiZVKJ2J4ieD6sbxRivC1O170TDhCRHX
X-Received: by 2002:a05:6a00:b86:b0:874:705d:f63d with SMTP id d2e1a72fcca58-8c87c38b5ccmr2207864b3a.31.1795166434486;
        Fri, 20 Nov 2026 01:20:34 -0800 (PST)
X-Received: by 2002:a05:6a00:b86:b0:874:705d:f63d with SMTP id d2e1a72fcca58-8c87c38b5ccmr2207839b3a.31.1795166433996;
        Fri, 20 Nov 2026 01:20:33 -0800 (PST)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c873c1cfa0sm1186994b3a.48.2026.11.20.01.20.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 01:20:33 -0800 (PST)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 14:49:42 +0530
Subject: [PATCH v2 2/7] iio: adc: qcom-adc5-gen3: Explicitly assign enum
 values used in hardware
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-pmic5_gen4_adc-v2-2-94d0e1fd6847@oss.qualcomm.com>
References: <20261120-pmic5_gen4_adc-v2-0-94d0e1fd6847@oss.qualcomm.com>
In-Reply-To: <20261120-pmic5_gen4_adc-v2-0-94d0e1fd6847@oss.qualcomm.com>
To: Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>,
        =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
        Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Priyansh Jain <priyansh.jain@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Andy Shevchenko <andriy.shevchenko@intel.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795166413; l=1103;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=OeUK1LlAVHR+3dWtPipLhOdiDli8ETGZqQ9NaC67ymE=;
 b=UOC7miGD6bJJXRuGg4fOcSL+CHhXt7dJhjl2cezWjwXwuEqSS6IRwc0GFCp1Tj67Te/sgWv6F
 tZucRdomXcAA4AttWYp1wBRsrfzAzd9bE0L0BwpFtDjewNuqKZ39Eqy
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDAzNyBTYWx0ZWRfX6q6B/PM9nhMJ
 vjXSH4ZTfF3q0tnnvHU3Xrk7CB79rl8VJXGOAtoZhp8U/o4nOLx3k40T8JuDhPzXtymz48lKE+K
 DQeRvY3CJ6Hc7kGiygLbjZ7QCEGJlSmRbshMmLVHKhm+JmutBwjW5iXKF1cxO2ZVA1pVyxPCcxY
 uibcXBQmjl5tL0zWcUa0hUd3xDnda3X0eP61l0NvwbKsyC7creh877Y98x514n4s/C8ZJJcqSRP
 9BzElugctOlcpyLasHos/dVPDLx47A3sr1V2LlKYko1BzYNl6tRdsaXTY0fapLILL+l8fXoif3J
 qvDXIzjtodJEew639ynKPNtQ5I6gsz4I5tbCAGfHvwZ1Fx6p0sGlXs5+2kVQ+dhSVM7GVXGG7MK
 WzWKTFlF/kOB0s/toyewb3dLRHzmILPYNoIY6fA0mOG68FEAkJ8Gnh9FniFoDbjA5lhPdP0eks6
 c5hrJz77PBRIiI1vXWQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDAzNyBTYWx0ZWRfXypUYBiBXRPfy
 xrDbjP+uTsXVpd0VC96SZWPKk3hWmuSxCCE9/p/ZDzhdW38ehc8zk8Ej1qtA6ioEkFl/23gRb3Y
 3fSh5GRU8qCr+bHKsVZVFokEzfsh2B0=
X-Proofpoint-ORIG-GUID: 6Lwc78tXSLrklR8EWsPcSbh-j2tt7wDr
X-Proofpoint-GUID: 6Lwc78tXSLrklR8EWsPcSbh-j2tt7wDr
X-Authority-Analysis: v=2.4 cv=KuHYSmWN c=1 sm=1 tr=0 ts=6b0010e3 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=se6siFrRNr6BEeX4t94A:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 spamscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200037

Give explicit assignments for enum values meant to be written into hardware
registers to avoid errors due to later additions in the middle of the
enums.

Suggested-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
 include/linux/iio/adc/qcom-adc5-gen3-common.h | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/include/linux/iio/adc/qcom-adc5-gen3-common.h b/include/linux/iio/adc/qcom-adc5-gen3-common.h
index b3e2c2f50e8f..ec7238e93396 100644
--- a/include/linux/iio/adc/qcom-adc5-gen3-common.h
+++ b/include/linux/iio/adc/qcom-adc5-gen3-common.h
@@ -104,16 +104,16 @@
 
 enum adc5_cal_method {
 	ADC5_NO_CAL = 0,
-	ADC5_RATIOMETRIC_CAL,
-	ADC5_ABSOLUTE_CAL,
+	ADC5_RATIOMETRIC_CAL = 1,
+	ADC5_ABSOLUTE_CAL = 2,
 };
 
 enum adc5_time_select {
 	MEAS_INT_DISABLE = 0,
-	MEAS_INT_IMMEDIATE,
-	MEAS_INT_50MS,
-	MEAS_INT_100MS,
-	MEAS_INT_1S,
+	MEAS_INT_IMMEDIATE = 1,
+	MEAS_INT_50MS = 2,
+	MEAS_INT_100MS = 3,
+	MEAS_INT_1S = 4,
 	MEAS_INT_NONE,
 };
 

-- 
2.43.0

