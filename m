Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F140030C630
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 05:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785131622; cv=none; b=MdToo1W3U5HACsuyinoq19aMGiH0uPqNaYS+ucmuWH/oikEEYcIlMXz/pOGKtEygQus1wnbEFSmV3kx9ytT+WhUhP9C2TYs9VtJF946ZOPPIFfLiXZoA9EZ+R3mAC5vjjkKjjXNBanl5Ezj90h+jaFO0m3y6FKRtaRmwqNGlgTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785131622; c=relaxed/simple;
	bh=kNcygZ+QNmGPyzbzPmnz7mm29UpTUgUTox3crVZpuJk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UtnG2WLgb66BO1Z8RnWqDZVHmgg53yM9aG+wZNU/dHNEXaQgHgPN1e62ponn6wMSR2rQs1Kl/gjhCiZX634vLNiW9Q6FyBpe7GuETNmyugp5VXlKU6zYeP8gLxYruVjiVJchM12U7otR2vS1bZVsW0xv0Uk/ZoGxSN5t5yMaPrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bT/df9H+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QYW0ezEH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bT/df9H+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QYW0ezEH"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66R1fmbt2466591
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 05:53:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pm1/cp9dNkkAv8QlKkr7Suea5x1ZBuhput1vjMRvJls=; b=bT/df9H+WNfR9ZpZ
	6tK6DO22OH/1VIlxAKi1nuOE/EYqY6cJEMOrVx+avDjnK9hgdnwZf/gPf62S2A3W
	BK27lLIoMk2V7N/jeJ8OYEWjfI+8IDVmkOAeuZSl1IaJqVYXK0zwivY+X1A/gGk4
	7z9xZbxUUWfDjQO23Bq4i1GlEmtEcOhGvIwEz/GjA1lGoM+1+Byr4vo3qgmEBQ9I
	mXhAoc0B+/BMADQ6CWELldHnTa/+e7PALvynfcqloyCtB1Zolf/OSZZINASxfv0/
	+bkAyZZILuROTU6sBXtIhPy4dfu4YOdNFxKP3XOOn+1hC2YO37x/hNCgbg5mfqPI
	bpre5A==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fmm574vkx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 05:53:39 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cc86a9ef97so46791385ad.3
        for <devicetree@vger.kernel.org>; Sun, 26 Jul 2026 22:53:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785131619; x=1785736419; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pm1/cp9dNkkAv8QlKkr7Suea5x1ZBuhput1vjMRvJls=;
        b=QYW0ezEHwz350uNv+KsxlCd7eDoUrUJQqt7xL5i7dOGIHyjl6pbHhgJp8xVOk1T+xR
         LcPnp0lK9rzIJQEaVQudXYM4NpxZZY4EIz2js8hq9eWRFQpZS+nNga0VD09UnHczMT0I
         oGWbnt9C9c8r/bOFU69RzzAIwwoGwhg4T1+VrLp6zo3LAL7pH4tziT4T2LrIQG+qG0Hd
         VRf/3RnVu3+jm9ZiHH5WesJFbePLiPBTKxIujUM44CUHUMvbkzhWtOWZHt8nL+oeKYFX
         9QzLa5qiwoSyVKpReRyojlOishkKVIFQVH4HGBwT5sYLgznovv8dGllDwD2LDYYtVG5w
         WNuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785131619; x=1785736419;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pm1/cp9dNkkAv8QlKkr7Suea5x1ZBuhput1vjMRvJls=;
        b=UES1jzxyl+aSQ0jxt22/ClVR4mJBSyadcV3M7ETkKWiHNpbt2ltBy0udbkD9BSSQCY
         ia7MtSICmtriAozpQbnSaZxXaYWaEXZtpWl2ZEb6tYSMsY3D7hkbpxBtmUbjFht8F9a8
         2ZqXbE1IiCKMbFFyn/pAhlnnxtfo1cxvjwE3HsDyXQfBGWRmf/2hFqbI/s9yJjKSKKAi
         lLHpMTr94daYwq/S94mtEfr+f4Mb8RUwZSehzA+nMrdbP1p423urBQ9WR9Vn80tDkLMT
         0fObQbF8zA98p8PIbzkJFhvW9ZwnrilGmiiZ833uMj7u2jr4dzX7W+JGgxw41oHGawOz
         n9Ug==
X-Forwarded-Encrypted: i=1; AHgh+RqQS9k/MWLAQx4SMexNSgK76BHIR6F9ia6CCxvdtYfAKyUblf4f2cGi7r7fl9qzv7/Z6b9ZTKGyiOxC@vger.kernel.org
X-Gm-Message-State: AOJu0Yxg+39kdpFqFbvWpz5GNwJ5U88I6LnZUQg88oXun8JyEYXlv3cx
	5bGKZXzRdwnnKgN+jy/9jv5FDUFQ8AgVCTW2566jerHuCAHbpNGPXqFyxS/wC6ExMGCXLWvpzUv
	ygHgNOwbE9whQy/z9z7MZubK0lhQone+KcR1OqPPfwSj9inQrTrexpwWA64UL5Vv3
X-Gm-Gg: AR+sD13i6wgIsIvXIfY4fXo8ZdZHRI2ogju95edCdAW3ty+jozO0bKp9CJcrzJuzoPQ
	N+Vqh+PK4yTcwuQqjbLNCWjMD8sRqS8MS6LN5o26z5eSzeNcPsPRWDO3kxAtpRiwqdt5BXv2d08
	ymApX78D+GC4WyLYfA5agEBR2eVUHzfe4x7/9VscpmsGPGsP/aOhzDBiMDl2Mn7X9gFOOwfwQIZ
	fqbMnEZJPDKJv5TT158JHI7cWzXhbNVCn6RrQKXAs18AuJMy3WbuZ55U6uyryz1WIkS3VKKIcPL
	heE4wX19ESkduvFu3jT6KQREZpXhtVjJziEUjGfQVvm6u0Nz9zmSpiHPhx7MDaK9XJhcqeRrw9p
	NSRnts079adV++LxXP8iwHPvmjAO/
X-Received: by 2002:a17:903:388d:b0:2cf:b23a:3e6e with SMTP id d9443c01a7336-2cfde880cacmr67725245ad.40.1785131618831;
        Sun, 26 Jul 2026 22:53:38 -0700 (PDT)
X-Received: by 2002:a17:903:388d:b0:2cf:b23a:3e6e with SMTP id d9443c01a7336-2cfde880cacmr67725045ad.40.1785131618442;
        Sun, 26 Jul 2026 22:53:38 -0700 (PDT)
Received: from [10.217.217.237] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde5cd46bsm28828555ad.21.2026.07.26.22.53.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Jul 2026 22:53:38 -0700 (PDT)
Message-ID: <511dfd42-f0e8-48e5-b02c-8429db1a74b1@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 11:23:33 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] clk: qcom: Add support for Hawi GPUCC
To: Dongfang Zhao <dongfang.zhao@oss.qualcomm.com>, sboyd@kernel.org,
        andersson@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        robh@kernel.org, mturquette@baylibre.com
Cc: mike.tipton@oss.qualcomm.com, linux-clk@vger.kernel.org,
        konrad.dybcio@oss.qualcomm.com, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20260726-gpucc-hawi-v1-0-224e7884cf9a@oss.qualcomm.com>
 <20260726-gpucc-hawi-v1-2-224e7884cf9a@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20260726-gpucc-hawi-v1-2-224e7884cf9a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDA1NiBTYWx0ZWRfX790Y/SulpjWk
 04q830/fhCw+uq8o1gRd/u5cQW/RjTaqaNO5ogj6ZNqgH51xd48Czg9z8n6IE/8eY3ky1vvJPqm
 XnFLGH+s4mTSjjtdscctgkHZaENvRws=
X-Proofpoint-GUID: EDnnRoGF05Hq72IxQGVrpcFYzSMWnDJe
X-Authority-Analysis: v=2.4 cv=FOErAeos c=1 sm=1 tr=0 ts=6a66f263 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=I350RTvX4N0ih4XrwsEA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: EDnnRoGF05Hq72IxQGVrpcFYzSMWnDJe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDA1NiBTYWx0ZWRfX92h4R4zzQiFm
 TewEXUgTs0vcMgSpH8UW3uWnR9lD8aoPIJBJy20D7JQXhr7N+hMgBM3klVX3iXOi9rAa3BL5TUW
 e/UClKii+7LzyFZdQZBxs3H0QcDOPQ8kLKv6WKEecxFPQCGL90VG7X6vUqFNKSjcnGuyajDaRLz
 4pFLLMNvjrAoeKUkQch5i6vupw+9dRIVox99qqkzwqaJoz/+paA+NXmemdrdSJdzrbmTYsYkbqX
 PgPE4dMzV5RKExrJYoRFB1p+0kbU6BDLX5NbfFqoVXFHT1lhr5KPQMXHIXDrbMNmBqri2XtBU4Y
 g81fHfh5OkmRgvkaDMKylr4DB0FTc3puOlGLTjgN4dmfqNDNAzsjie6expX0ADvk+d7FC/SI/j3
 kk6i6fNnR6Nr+bJ9IZt6IvErNOHY2uwoI0Cwzn1cIZJ8CC2Q4ii4c2vp/qtsURJ4decfI1nu7xS
 iXoANRLjVJUQlm4nh6Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_01,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 adultscore=0 priorityscore=1501 spamscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270056



On 7/27/2026 11:19 AM, Dongfang Zhao wrote:
> Add the graphics clock controller driver for Hawi. This provides the
> clocks, resets and power domains required by the GPU driver to enable the
> graphics subsystem.
> 
> Reuse the existing gxclkctl-kaanapali driver for GX clock controller
> support and build it with the Hawi GPUCC driver.
> 
> Signed-off-by: Dongfang Zhao <dongfang.zhao@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/Kconfig      |  12 ++
>  drivers/clk/qcom/Makefile     |   1 +
>  drivers/clk/qcom/gpucc-hawi.c | 461 ++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 474 insertions(+)

Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>

-- 
Thanks,
Taniya Das

