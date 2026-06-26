Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F1E13E3DBB
	for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 07:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782460778; cv=none; b=ly8rBHrVQdOApA6bKFNqRmnmbNZoLafzhPcRdfFldpcGibq5kbr8YGtvs11jBl+K83F2KDz5yB2wi2uW5aOJ3ekwvncMXi0PxLXJoVHRFZwUAaw8/RhghAWMIgkhnyh/lEIYnTTL88PcU5in+hisBfLTUnn6IEhVAdUhBtdO3ww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782460778; c=relaxed/simple;
	bh=sYODxyt2foDNZT7s5ipSpvmDlkzEZeJUT7Uw64IOTRA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Omcd2IHquN+E33qdK0KDrAqkK/8bwIIauc0Vfc9jAtmMSQ787oqZPcdDf/Z60fOZKMrGUbePBYH+7J5etkuOSxditYWf/7hEaPdkoTTAkqw2mMMXKpkR7CSYgJNubTRif0T+HKGt27jMDoG1Yo/wNBOn2OlPw10RIXL/cyEEwfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QQ3WcdOp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YHKSW/WN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QQ3WcdOp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YHKSW/WN"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65Q6W6GN511905
	for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 07:59:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JL6QkyFsiaToiUkSApRBS0AsrnA+UtA0FCtB5uyugqQ=; b=QQ3WcdOpy8FX1X3C
	ViS9CcO4FgYSgsCf+1zcQjsWxCxf6MSUyV6p9aGq4i5kW0FdTUFCBgpLq5H8pbAb
	v5ZtjlFgBJSgcD5cTzkSR2Cqwf7EPJrTOJt1v1sblWWVDdWlDyA8WEa/C44luVbQ
	VihaGly9is2RSCxRWhwONyTuV1L9z1UX5YWAQDJWroGfertabn5alKfsx4bIcX5g
	r3icvzCKCyPrkyiZe3G1b0Crw0pYaCUBCyygI5MfMUuUuEkjgJsaK8Tv4KxGmA/0
	UQdJzxuCVHE+qRAF5RMcMAA6btGmtwDusc6/7lc3jC3obEkIaWJHmoqKSIillsXS
	Na7hKQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f1fct9djp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 07:59:35 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9157ae36434so106218585a.0
        for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 00:59:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782460775; x=1783065575; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JL6QkyFsiaToiUkSApRBS0AsrnA+UtA0FCtB5uyugqQ=;
        b=YHKSW/WNlMtkn4LUbjgTOhLD+ZGzALz8bqkge5GOrjy2xjdBSXdUesD+rNzgkL+Evv
         sWfrn4ZjK7M7sXAC/Ya5eHWnD7CxgQ7fG5eZmt1B1xH/VwEXTIcZjjXjh3i9icMYy1qK
         rsjxl1Pe7vc7gQm7+q05L21RQvwKOpP3tyUo+jXtBUKi6O6nP/NUp/RoHq3bQPnsvHV3
         txdlm2JRNm4k1eooIiX8GmaJobaCXForBtKiKybV7Ira+p5LmV4wrxy5+FCUf8b/jifa
         7B4Hxv2KskEhnHbMDLDclP+/ObYufFgcKQ1sU3IPlUxaZlFU8dwVEYnLL8K7oEMlchVb
         xUTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782460775; x=1783065575;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JL6QkyFsiaToiUkSApRBS0AsrnA+UtA0FCtB5uyugqQ=;
        b=bpeA4kH7WPYIGX15TDYtcG36fGsR4tg0E3UhXY14cLlul1St+BR4Zsgqbf/y0G27/7
         LpuuP0TL4b3EiusqtznlKpdgw4VkO4CJzfQ5iic8duz5zwnNP8Xs/QbQqg3MPQ1Gz5UE
         Vha7+wqts2qiZz4hB49rn5rpaHzMFP6YPchNMwn9bPlqv+zD/ECaiG3/nqsu2uY/CFu0
         L93RFxYNr5rPV5MrNjMkboJLk+5WXWi1TuJu6ectd/I73quZIxhqTUGMsFTHjR42bpcw
         Kv7+mg6ytQUFLoLTG9fz4fU/4XQQ1qmASNj4BKOow2rK53RHyB1vjjTBER5JqLu9B/bC
         vJBQ==
X-Forwarded-Encrypted: i=1; AFNElJ8hB3G8WD3HbX5mxaqQr6/VqoCOpOpBXmZ8tcTIcanrJigLJzp0mUvRPR66XamV3eaI58p7G76ISBbZ@vger.kernel.org
X-Gm-Message-State: AOJu0YyUFq9xYzVdTUPaL1s6iTyWWlb1qNi+/4xwsNL/B6jID0jjIsKB
	4E7fQuzA1HqdRyzjv+sGUxd+fVzCzs1lN7KDSyceWq9RhrlOWxav2bMi5aeGCvJUTtKxr6cxLgH
	owHX4aFoG0pTXl+fk4vGcEJ69gcDaiAn6isZbCwiUJWdCNjhoUKfXvjX4QzRkeVm8
X-Gm-Gg: AfdE7clJrHxBuefIXkwSmXKW9S4h0KyKPD4C64H8ubmPr7sqQaUqdZTI92HTVxwckt3
	f8fKCjVyny99g15BvRYZu/h9G10CptRSbWWmjnJtkAcYLOtEhJuG1o4nIgfJIBcJjm2HpOvJ+ZV
	8F+XVxHByUVfg0oIJW3lYSeq8Qn0AP+5u73RlsEtCL/eASN/U7OZnNIXERtX99c/mjRAvFc16f+
	Hwzrh4ByHhh0SO0AmbXrToYjFEjBMt5pTsGKjhqPjmh2jdMKPj/7Wt5uSX96BO1Wg79P6cEnHJD
	fI6GJ9FBanE00HNTpmzeQKjl/mBEVuxt8kRe0baFj5R2O0Eyj47a5JTGPbsiWp7VpJAnTuVnShb
	EQ/IthZPxyGyOWBwoec7rXvvpaRRNoESNJTQBRV4=
X-Received: by 2002:a05:620a:45a7:b0:8ee:eb50:4f51 with SMTP id af79cd13be357-9293d1b5483mr919784785a.54.1782460775386;
        Fri, 26 Jun 2026 00:59:35 -0700 (PDT)
X-Received: by 2002:a05:620a:45a7:b0:8ee:eb50:4f51 with SMTP id af79cd13be357-9293d1b5483mr919780985a.54.1782460774858;
        Fri, 26 Jun 2026 00:59:34 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:d8a4:9330:ebc2:b0c2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49268fd9e77sm54432355e9.4.2026.06.26.00.59.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 00:59:34 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: linusw@kernel.org, brgl@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, afaerber@suse.com, mwalle@kernel.org,
        andriy.shevchenko@intel.com, tychang@realtek.com,
        Yu-Chun Lin <eleanor.lin@realtek.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-realtek-soc@lists.infradead.org, cy.huang@realtek.com,
        stanley_chang@realtek.com, james.tai@realtek.com
Subject: Re: (subset) [PATCH v4 0/4] gpio: realtek: Add support for Realtek DHC RTD1625
Date: Fri, 26 Jun 2026 09:59:29 +0200
Message-ID: <178246069898.6685.11577448681947659397.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260622092335.1166876-1-eleanor.lin@realtek.com>
References: <20260622092335.1166876-1-eleanor.lin@realtek.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: hfGFKJPD_6r9EU5iqQ3cbw7ekg8KdJHE
X-Proofpoint-ORIG-GUID: hfGFKJPD_6r9EU5iqQ3cbw7ekg8KdJHE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDA2MiBTYWx0ZWRfXyjCYKC9ek1hI
 +9jz8hE8bdUQfcSBGEx0amBb32yf7xXXqI3RuzIG+KK1MY9tb76/sJOp/r0kyt/vv4AJTMm6Qwj
 xkH4sy61lerQbNpgXkUI6qxmdXP7EarUy4tlG8LwNJ8orHn84DczoJsjeDkqgS6X4IpSujP8MYa
 JFEJbqhguQc3TuEyTJV9+JuEppVtoh0gDGl01WJ+qR0V6OoKugXD+r4hPcdRrB//DZwI6CSG7zE
 lcMhg82uTL8VH8cbOUb33qCl1+w8AXz+VG9iNiS/xBb/gMLzIjQ4gqJvTlQl73npjhzsKJj6Hrk
 jSIi1XQjU/d7WEI60OjbfF0phhk1vQBSn67bHRgHnR+TlaJpE4RIlINM2blPk578mc2OKD6t84M
 NkiBS956XS1sFvRTmLDcISG2NhRpkzSx2EkuwujzN+Zi7GhjZUP/dJf2gprFCgiTdqFCzBiZfJ4
 umr1mHo+d/zvksTu2ww==
X-Authority-Analysis: v=2.4 cv=FPkrAeos c=1 sm=1 tr=0 ts=6a3e3168 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=gmxu7H2YFhVDB807_QQA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDA2MiBTYWx0ZWRfX4ZB8ZHdpgACk
 KhoyuOE09Qb8qzrkqY+yZFR7OrArQQjXpK/wIEncq0QNHwHvvh5CsuIrDKO/4R1z6m400kg9SFA
 gl/sxfcpaKZqiVcbCP/v56nXCHnnME8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-26_02,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 adultscore=0
 bulkscore=0 impostorscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606260062


On Mon, 22 Jun 2026 17:23:31 +0800, Yu-Chun Lin wrote:
> This series adds GPIO support for the Realtek DHC RTD1625 SoC.
> 
> Unlike the existing driver (gpio-rtd.c) which uses shared bank registers,
> the RTD1625 features a per-pin register architecture where each GPIO line
> is managed by its own dedicated 32-bit control register. This distinct
> hardware design requires a new, separate driver.
> 
> [...]

Applied, thanks!

[1/4] dt-bindings: gpio: realtek: Add realtek,rtd1625-gpio
      https://git.kernel.org/brgl/c/8f32808e1530b2229e07695fb39c54fee910bd4a
[2/4] gpio: Replace "default y" with "default ARCH_REALTEK" in Kconfig
      https://git.kernel.org/brgl/c/b5d23fcdb12972c522e96f90ab48be8a0d971b0e
[3/4] gpio: realtek: Add driver for Realtek DHC RTD1625 SoC
      https://git.kernel.org/brgl/c/a57e27c43b0315ee86c6896510d69be5257e093e

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
