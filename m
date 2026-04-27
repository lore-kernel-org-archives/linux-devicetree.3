Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68B903090D9
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 12:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777294001; cv=none; b=gFqrhqYRgtl5SwtnVO1piql1gCIv6P9mDWGl3pAF+6s/y8cxxVv4hOjjV56ZwWTW5PMf0VL92VM0AponTxG5tqWFZqLB1IUlWpXzin2KYf7X01BSIXeRjct1hHCaZKZXy5QKLnUBHhFFiLoefNF7HnpAXRLkjppVw6FUXuk/N9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777294001; c=relaxed/simple;
	bh=8W5y78VKUavviXikxj7dAYRekuTy1qq9Xl81Z8IQtNw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rbEStpR+h73DPYsWAMLJ+lgXnyufl+cfD3N1YG84SHZTSRZRPVcrzgYzznI1OaQPXyPTxB+J3uleMQNV0nhlD4A+INqn8Cj4XIMKWRq6EUjl6yloHpv24uv4Ybsw/cvt3QmZZGSuiPNt9RuyFktFnD1WY6Molfzc9tXX50PD3HI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dOvuZIMR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G+6r4IgR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dOvuZIMR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G+6r4IgR"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63RA3npc3123625
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 12:46:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lCJ9j9cXMZuO871EpV/2lp8v7oOXkTCu0ysZH6cE8Us=; b=dOvuZIMRDKj2fsPO
	rey3TLa65b68eWZrdBiA3kmksbE2ZUzz7/xMoOBH/YtCghhCPQyHO+GJsA7ektCr
	TJpgi4cTerxyjmPDs5gtz3LsNSgN6EMbX3+vKB9xCEB9d8Kd69g9G03iCkdVJuo8
	K9I3LhBxl2hp0GRyUEc8akNzqzaaCtfN1iV90PS9QfdMoh0SZ3bCGQdHvDJNDFBC
	z3kzrOz9yONT0JW95F2awgIaZDHATPlmgSmmH1S7Z6u7dIfBBS4RM9ZKetlCVCuv
	+Voa0ibEC2Ky3SvcxxyN8FjHVR5Hx7DBrcGyqzYy58pg7SwaPGMnJNAX58VcDlxY
	TUA3Dw==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt5qgghps-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 12:46:38 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-953f6e0f1e0so12873623241.3
        for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 05:46:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777293997; x=1777898797; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lCJ9j9cXMZuO871EpV/2lp8v7oOXkTCu0ysZH6cE8Us=;
        b=G+6r4IgROX4alcWPUNrzlQ+vIlheTjWOTFZ0sDtKeas/mRDwZ0VHuBC531QcVbn/zn
         oIQokG6VerEAvYVGdo0VFZMzWOvAogfKnSr+c6ZhhEXOjNFF+jUqqHO4LPefiC2yH2BJ
         nVYopGf1zuBDvioQlipsX4loYqw/k+CLFKCwnhOa4YcyURqrJGkTGx/DDpHnsMcjZkN5
         54AJN6HYH8hR6KO4OIXuxYCafFHwxNp11cncMHx1Ib3CO4OtzJ2K+NwPT8LOY8f7oaUm
         18C997GPVkqalfuSZyOjigLX0LN6dg5SKC2OOTNwKww5Ot5pm2s+cMWtTmn26s9OFE+o
         nhvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777293997; x=1777898797;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lCJ9j9cXMZuO871EpV/2lp8v7oOXkTCu0ysZH6cE8Us=;
        b=a0ouhzqxXMbeOiOMElBd4hh1IAV5cQQkg/eL/YGRTRjGGjn+3PtZeSV2rjHZTlYLuP
         hVUnIXI1dzRZb66eUZvgQ3dB4LXaUDFUYPrtdQWSqQy0G4xYkSrWotukIUfPgLwLx1rV
         ENd2+gbIHlpbHkHy+NsT7fQsu0GT7zaPTYBYjhpD+MTZ9R7+pyuPTRM8f1iu6K4wy696
         wXDP92ONHHvGFdUQiI7+snlcE72kfiWYA2GSkhOuJTJS7v1jSDsUB/8Kzc2EHBFllJlJ
         cz1XVY5y+3OKRDhltKVDlm8t5smeLwBkGZPJeBZXQdsb0ydLgyyg1SgIfx5IODo3NFVa
         67HA==
X-Forwarded-Encrypted: i=1; AFNElJ+kp1OGUt3Juk+eIM0F4TEoMKFGHPWHjZTeNT+N2q6qJDAEWfhYuo05xCP/eTY1oT96lsTtuzmQwqIz@vger.kernel.org
X-Gm-Message-State: AOJu0Yyrvexe+Hrqw3jsKbhp8ZFEObSPfQujUdvf+IC31Sb82ZbN+5lN
	wpiOWq73aQlZSvVOJsq18wflNT548P6O00BZCISoWifNo+7bD3Nj8PuqVkcbzL+y34H2iSwZHXl
	GdIxIfBSC6iAL0WSLyxaiDu/uJjyYvkdp64LqbheUZ4dFOvDj6k+9wdPmaurrviLL
X-Gm-Gg: AeBDiesCR/yTW0SgTBOSIzllnVHUewr8CWoDGnD55pm+2tdwKGhE/9z7xuDNBL4z244
	RB9iDfamnjy0IH49QGfJi6JpaXGMlyfU7/nbRkAkMMbLk65CFsIBN9JG9FNE6NjfZ9MjXXMCM5c
	hKhOVv1K3mdUev+kWck+PX8uScrOH4DQQwse5KO/QA35+oaIqRZKnLzEBWeGiOJhNqWbUXS+wn5
	PDqayQZ5V6l1yWaM2DC43gVQcHCJqY2DBssI+urru0rLCcGrvAG7fy3BjvWDuWqHnqTiJvrkwqK
	JLxhTZq8uFOfSe2ege6PtUjjps7ytcs6o9MpLUW1VVKaVgr+fINY5DvJTOu0Brtiuj6WD3GjJfz
	J/5lms2+Y/0K72CShjK5mmlAotPQnXNHQ+iow9Hjm9I+ymlNZmO5GyWSVh6RqCPe5zLcTGtaq4s
	Qf1q893mv+T3TuSjJoZRJLZOOmuBU=
X-Received: by 2002:a05:6102:2d09:b0:605:17b8:16dc with SMTP id ada2fe7eead31-616f6ef7d62mr22668418137.20.1777293997359;
        Mon, 27 Apr 2026 05:46:37 -0700 (PDT)
X-Received: by 2002:a05:6102:2d09:b0:605:17b8:16dc with SMTP id ada2fe7eead31-616f6ef7d62mr22668384137.20.1777293996955;
        Mon, 27 Apr 2026 05:46:36 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:653f:4d28:6a78:a6ca])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba454d1bd19sm1091496866b.37.2026.04.27.05.46.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 05:46:36 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 14:43:28 +0200
Subject: [PATCH v2 01/14] media: qcom: camss: Add support to populate
 sub-devices
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-camss-isp-ope-v2-1-f430e7485009@oss.qualcomm.com>
References: <20260427-camss-isp-ope-v2-0-f430e7485009@oss.qualcomm.com>
In-Reply-To: <20260427-camss-isp-ope-v2-0-f430e7485009@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        devicetree@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        kieran.bingham@ideasonboard.com
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDEzNSBTYWx0ZWRfX+iUvkAJUPA/T
 JxZ+HplUUMxNh04xMYofUioaU9uk5zNx8yWvs3ENrJvjlb1mpD+n/RFnecPLkxYxw16XCO+xjPL
 jrWUmA7/+gYn8kYl2Pky84yuqHoNh+SflESJbEzgAqXIXhaaqJP3Fvc+GPs7DM1ale0aMueko63
 Otc9bOELfr5DORB4UbbQ/jQ35gixmnToozZtHkGSO/MElJGRTb9wdUuTBhax3Abo/gt0Z1LQ+8C
 TIZTXQbDTQvDNOavo3n3VaRoM7Mj7CfkTrOlnJa05DRDyWlKbjd5D9lJEupL3B8qCWXJqoKzTzB
 1vJjMtzywSm3XVl1obGDx54XEhvAL5nCLU3WHmP4zTp0zcn6xRvnwTJxSLjJjZO3Y9mubOL5w+C
 aV7dIZqBxCKgdkpA5z2pH38rVfNcRs8wEe2KshJCZzAHLSRznxsnb5/j9dNhVUGgW+E/o8mUreb
 xNrZYUwGRHbZC1VWEWQ==
X-Authority-Analysis: v=2.4 cv=V69NF+ni c=1 sm=1 tr=0 ts=69ef5aae cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=5bRy6lfvdnCUHtv4pvsA:9 a=QEXdDO2ut3YA:10
 a=o1xkdb1NAhiiM49bd1HK:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 8CqA_oMlHfUFLEwHSj-iQWr7M_otKaas
X-Proofpoint-ORIG-GUID: 8CqA_oMlHfUFLEwHSj-iQWr7M_otKaas
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 suspectscore=0 adultscore=0 spamscore=0
 phishscore=0 priorityscore=1501 bulkscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604270135

From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Use devm_of_platform_populate() to populate subs in the tree.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 36c601c595053ddad8d327b1416d7ff587920174..8f2b1d3cd9f289895aa439443d2a18bb036fccde 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -16,6 +16,7 @@
 #include <linux/of.h>
 #include <linux/of_device.h>
 #include <linux/of_graph.h>
+#include <linux/of_platform.h>
 #include <linux/pm_runtime.h>
 #include <linux/pm_domain.h>
 #include <linux/slab.h>
@@ -4608,6 +4609,8 @@ static int camss_probe(struct platform_device *pdev)
 	if (!camss)
 		return -ENOMEM;
 
+	devm_of_platform_populate(dev);
+
 	camss->res = of_device_get_match_data(dev);
 
 	atomic_set(&camss->ref_count, 0);

-- 
2.34.1

