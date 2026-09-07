Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52AD14EA365
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 13:04:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788786251; cv=none; b=N8ICRVQAq4qhQn2pToWnototEJu1msKs5CiiNCC0FgavKiK3hQpOU0sDPmCMN9EmCsZIdARgp9G8GBwTCL2l2NgiJ9yNdj53P7bFoNcdMHo1Dm0RuqaASC6e00SKvn9CnSOXW+YMuDw0nnIGVv5TWwiuP3b3/+SXgeNBFhP9YJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788786251; c=relaxed/simple;
	bh=49eWOMRTz8b/nRYqL1sZZ5PDoGraU/KbXkHhAHawsZg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=irAwymrpMXaz6QBGlDpIbH4vBjDJrFbCf/UATmw6zOvjFVs7QhoSJC1KpCicrbIZq5RwvfSg7bfqEZrMTv6ByCGu1euuXsBd09knka+JX8O6n7YXOn1RBXOsdJ6ivmvmSOm9ne2jmCOWQgyzFUGLSnNsTuQvJ7lyzxJYukjvaGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iZhfuJtg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cjk0DThm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iZhfuJtg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cjk0DThm"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687An34a3873334
	for <devicetree@vger.kernel.org>; Mon, 7 Sep 2026 13:03:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	49eWOMRTz8b/nRYqL1sZZ5PDoGraU/KbXkHhAHawsZg=; b=iZhfuJtghjqe30Sf
	NkPTAUBQ1azhCIPyIU5kPudBwzazGbAncmU4S4LrH8geBYwE0YhRSXAjC0tMKESg
	zLf7MAxp19AskYp8Fk1L5z8XqmOA7DWwLk4AdQgMEwGgyA84/+ql3++AdFRVFtbw
	pz+p6pmLxUohExO7iuhq2PK/YQuV9D9WZV9YloS+NR1jTpCCl3nOIL6m/mr9PzM0
	eYDQrgca0H7vjbE6va5X/ktVR2tsNH0WEC1Z6lZ7R3/E6qp0TN7+5s9UBtNbtZhr
	oFG2UFsb4VON8aT24ugpNkcToXQM3bqO964+SREpDSqBrZI6+zsJKBaURmO+7GhB
	3+6OmQ==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghnmj23y9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 13:03:50 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5c5db8b6d03so1212058e0c.1
        for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 06:03:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788786229; x=1789391029; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=49eWOMRTz8b/nRYqL1sZZ5PDoGraU/KbXkHhAHawsZg=;
        b=cjk0DThmdifpiXo5kRtRS0f1PcBrQk2js0OPGlrXMENaAcyvsnvxBDa1ZNW56IQVX/
         uTCjm2O9U5YeSQv9BZ01csNOVaZ4+siz3fHKh0QtuITTgMyU006kINNlo8ShF05zJkrh
         SpomRvlE4WRlwhzI91fw3X9i7mr39zPMpfVbUgJ7FbyZdCoDpcvOBpqASAFRfb3yGcqf
         F28KELdMDqGo63IAnlvhcY9LwoedQHSnd7dlA5HkFhWHiIbcUlZRnLBnd4NRxmqzJyq/
         zGRG5tiuJhP/DRzdmRz3K1bj54XSXa3GcCGxelwBhm6ODZDkWnsdGxWkRR1hXqtByo64
         xk2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788786229; x=1789391029;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=49eWOMRTz8b/nRYqL1sZZ5PDoGraU/KbXkHhAHawsZg=;
        b=gKVVUkoCSWPN9pGJufmuPr9GABJd2Cfd8qpJVinS+OLAb6Nqd7Bxuq6Zz9E9hWbug2
         xAgFgw9u802KK1TAaKZfunssstvGuSEiI9zcHx3x39py0X8RDP7QITR7487/46EHZlUB
         c+MOyd4hzpvY39b2ZVi9tGL7Dm53VrFQyTBMBsQcHqx+jJhnlAmahqvUHzgJOHOx7zOJ
         KFq8yrMuTlN+UbnBkXXLrsiNrvBl+vhnvpkdC4/HeTgjed9st9/2exrfE0oHu7G1mPxp
         4i1ikG9Gkz72gsb5yi4Pp+O9XrjHjjmSEwtnzizumwh/eLDgx5CqyDWDf53S2Zan+QUc
         /o0w==
X-Forwarded-Encrypted: i=1; AKwUvBxpZux57ldK7qV7pYfidOd+8aWAge2AM/saYChAzPZNkV3cYPURrfkFZswt43TeQQiaZodYirGopTE6@vger.kernel.org
X-Gm-Message-State: AFuF++mx4+18pWH0TmzOcMJ47Cze5wPVmFPCjjXuwUP83K6nCDrbKxbB
	zF1EYkMExKmZPyw9IWw1YJUOQWPZeFRfKU5/xTknETmpq3Avsf2moHnWig2FxJgo3qkbwJbrzoj
	pASN7DUgDYHf6tB6JaWIj8qBE75Ypod9t2HfBuFFPZh7Lb7QwAw7pgBKwqcCL2kGu
X-Gm-Gg: AYBFou1ybVRYcQ2VZEeh2QPD2FHNQf/RmwgvYq+lnno/KfIJ8I6eZZmPg0sfzsDhZlE
	78bSe5MjxwK0AW2nYClPhCZxcKxks67X1utIQtLx2610w/Fq4MB8r3okII5t9KUw0YLZNH20Ads
	tJsxNYGfNQB+r6QYOE7NcQaEzdW3SZ6yKEuSTEV/oCyaPi/pcbF5R+97DWVANBBqkG4I7spm4WJ
	lX9ar3Qwj1PVERZjxvFYhOZvQlP76oxomWikpuuJ4vo/UjlTxpe43gM5gD7THpSm8W71m6dInj4
	0tVkuEtRR1ApHu7N6/cWVcvpSElZxtmg/86a3i/Y1JU9ex7M66LqFP6foWYqV3R2cu82LVHWXXo
	lyj/XU5QzkATvAdcvfpWqdUPi3TB0
X-Received: by 2002:a05:6122:4f83:b0:5a1:fbbd:6bd0 with SMTP id 71dfb90a1353d-5c7ed45ea59mr9264682e0c.5.1788786229439;
        Mon, 07 Sep 2026 06:03:49 -0700 (PDT)
X-Received: by 2002:a05:6122:4f83:b0:5a1:fbbd:6bd0 with SMTP id 71dfb90a1353d-5c7ed45ea59mr9264575e0c.5.1788786228908;
        Mon, 07 Sep 2026 06:03:48 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee80eda4sm388303115e9.15.2026.09.07.06.03.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 06:03:48 -0700 (PDT)
Message-ID: <6a485a80-cf23-40ba-b385-fd35cf0e9888@oss.qualcomm.com>
Date: Mon, 7 Sep 2026 15:03:46 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC/DO NOT MERGE 08/12] drm/msm/hdmi: Add support for PM
 OPP table
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, dri-devel@lists.freedesktop.org, vkoul@kernel.org,
        robh@kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, neil.armstrong@linaro.org,
        olteanv@gmail.com
References: <20260828-drm-msm-hdmi-eliza-v1-0-67843277de17@oss.qualcomm.com>
 <20260828-drm-msm-hdmi-eliza-v1-8-67843277de17@oss.qualcomm.com>
 <20260828141602.211751F000E9@smtp.kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260828141602.211751F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDE0NCBTYWx0ZWRfXxGscJuekMlT5
 rDG1oQ+AwL8+36f4/lqq3RwiYyOPxCgatgXOu5W87zgQCAaKhPTs+IZ9/5eVrQ0wm3CiaZBZsFZ
 ILxyoW7q6DVFdkCs7A4mEiorqB0jNFA3JgOGBSJTFLa+bdxlYJ1k+ajKPapQUdNlBgz8viq4fA0
 LbNYPDd7LMvS8Yy30avuRykO5jK99/LPeD2flTGQY3CKmWBCkqktwQJVpQUZ8W3MYljTn9Cj8d0
 w4+Gx4aqyLkx7fAO1gv9VfZrk/vjGV0u2GLKJLpVG1J9IIK4H4yvARlzPw5SSikAvAwh2TcnITL
 hlr/pB9b06aq1p9VzkTSJ/S7NRPP91eQeFfZ9h8n/V3hyXKcGC71nty09d577er53/16057RIKr
 grCktsqTMxdXM1sxq2vizZy2RneZrOncXUIoO++XAxSsJM/NgtcOMXmQ+3byGktFsle1fLA4iRd
 YUmrikoB1tROjysMZiw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDE0NCBTYWx0ZWRfX7D4WG0P7HQto
 nyOqf4ec0I2II66oLoqZ+8FAzy73fELCJ1XrxNhx2PTjeK8nxlFdcnvrNczTICszC+H6Uo76JmG
 zjxWuMkjYA+MQxzGrHcc4DBXFbVMzXo=
X-Proofpoint-ORIG-GUID: yPaF7D-NzQTbnVZHvBYOq29JQl9IFsNr
X-Proofpoint-GUID: yPaF7D-NzQTbnVZHvBYOq29JQl9IFsNr
X-Authority-Analysis: v=2.4 cv=LZYMLDfi c=1 sm=1 tr=0 ts=6a9eb636 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=3ryqjR-gYcLxyyiNjjkA:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_03,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070144

On 28/08/2026 16:16, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] Unconditional call to `devm_pm_opp_set_clkname()` causes probe failure on platforms without the optional "extp" clock.

Ack

> - [Medium] Memory and reference leak of `hdmi->next_bridge` on error paths in probe due to bypassed cleanup.
> --

Ack


Best regards,
Krzysztof
