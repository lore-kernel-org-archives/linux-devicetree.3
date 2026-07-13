Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 658F937A83B
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 11:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783940976; cv=none; b=BDCKTBn5HEh06fZMpeVnE/J0YYRfbo4pf5puVhu65sIq3NN0yBxiiwvjWLZYMLZJNDA5VEwEBa4LvNSj0bRd9REvqz8mxRAXHA8e/fmtOX+3jX5uSuwFozsE2CtAgawbQ2qtOH7W6+BMWrz3jCSTs5jPjklV5LzFwF/hj+Idl1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783940976; c=relaxed/simple;
	bh=oTzHapr0m4GWqMHoVKB+zUrcoOxplD5vE8TgFIaEGB8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bl6BWaibCSBlGDPq97RiR6oO4YL+9XE6kpYPq1zzSdSLEBTk8zh83qUZDioG5Wx4/VbmGvPVW3bRDEbQSYzK63gcmchyIpmSuxFemW+eyxOUf398d0aIXSnT44Mr9OJ+me29nz1TYKJYPr1TNdpPvHRIFbjVY5R7g/gKtbagNHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NrlkrMvp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i0B1+N5r; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NrlkrMvp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i0B1+N5r"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D9dWvV952929
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 11:09:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kXlfaTZwrb8382Qn5XcQieyV+sy0vh/kCq17fdwe73s=; b=NrlkrMvpO4alWrcd
	yYHvTnL+HuWLGPjTsrvCXLnKlx/BNqQ/gPvunnKV+eG+6lfObU9DkW1L6Wg7zNE/
	RPhqNKO2uFB5EUCK786ra8NZdIX9O2Dy2ViOlcCa4X13+Mb//dKSJ18Gp/AxTvVH
	huIu4Ofs2bDIJQt/nYIiyWcz5Ruogsmr7bsfOo25M8WjE1rdGRe0vNWDypeOnhII
	i/WF4o3Y9jvP/SfjLqa4eifRBTRx0/svXojI7KipPhykulkWiQc+TfLMtsnGxoLN
	uOhu1JHXgQTGMZkoObtCgDDMBmiw4oUkfQbppG7kUcgC1vlRtbFXCxWpN+6655e1
	YX21VA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcwk3g9ya-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 11:09:34 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c075c1e25so31897221cf.3
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 04:09:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783940973; x=1784545773; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kXlfaTZwrb8382Qn5XcQieyV+sy0vh/kCq17fdwe73s=;
        b=i0B1+N5rNqzGbMHy464SQ3zYXrHAg/Iypj+nSeXeDidR0NM9zGxXfD7vOHoKHp2fb+
         j/Xha3kPY2BqBt2PqSO+JXh2rhtCg/0uoW7QgO4k0kTzgfdYVbpDajTz6ocOZ27J9Azw
         XryWWiPgGr7sxiSLIX87BaeDLyX49TTv59UyxeK5N57uDRdXYp0NdaxAKjf3kykvYB4s
         HBBwUMXJ3TcQmC+oA+vxVKw8C4USkW69XowTNuOAHpg4Vsgz1y72Ea0+jk7sr+wMKTPc
         wP3/HV+inhRRunvIaCcoyqbvtar9ZOmYHCCvWrHbDhkYnceEUtVU8C6atHss451GZwN8
         fZzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783940973; x=1784545773;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kXlfaTZwrb8382Qn5XcQieyV+sy0vh/kCq17fdwe73s=;
        b=p+Nspn5v3OgwJhmV0tIdVKbniUJzqYdwsMat7Pp3X6uHQTfqVEDKu33GhTouwPFS8L
         bDLzKjMlL2jZpvaW+34l2V+U9W1pjpNWXiuQG6e3pWsfUXbeyujs8GIe/T9KwD0f8Koc
         ZmrWeGnH8o/dfReMdlGxsetUIVA60x2SnaxHYVT5DGzyAv3UJqwu/RK65oJrzdldUPs+
         j4HiNBNhD19lcfio1UFFhvqdQr2i3N03uX0WW4A8eFwAifcZAyM/TRKAjqGpVLPSswOt
         VIh4LkXYvsJmEQP45FlnuPRKjxcU3T++KdRVHrwCzh2iyfTI88/sPonbayflPWpe3WgN
         uaPQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrx6SHoDSORKJ//sbRtzRRHBeuvygmVNJLnRi/4gEvaiOMFMVX7AbGrOEadJfjK73CiTFr5PN/Uekah@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5+jnDTaEi21q3RMY7rtr3sMOrEQYpCLUZ8JeAh4PmWb2x+M/n
	6R2FQUiMSwFhq1dpZqLPsYs+wqLIBaCqtuuusNeM/IV8pKK6SrLFvH/8+4v9rln3/tDeGbEXZ3G
	ZdhVcKczNrM0J4mawzxEvU7HdUautmrudbq/m6qkYI1bjBAwuMAc4qfK8Xznv1zXw
X-Gm-Gg: AfdE7clCOvanldymqQK5OV1OTHjqVHLiaKNDn0dosvU46kaR74ZRXB7JlwUt6WIuH+k
	Xpf0Q8RaweF65/jE2QE2gBG3TW+GGBhgGXe+WUPIUeLo4OdssqlEYhS0z1NO0PV2b2+0ebn0wdW
	2w7XWoSyIbIAncdjDRYLwje/N7PlKhDxSUS+aA/jOI5bTpOr6DOKF3EQkQxx2YDZkEGQJx5I/OA
	egaIwwox53i0lI7AxwiTNKlHOy2plaWJwvAquWsA2jk7BIrKTlFTPTrDBaByYk+FjiyQgdDDAfP
	m4758Zh5ocw969ApFuxWvYq36+4sgTUlVGdbRu1vfJG3VX/DEftZsTTYR/p8a9IYtzd49lQKCAS
	rD6GDx+OpipHQnCvQDOPWWOIzvmIcVtrbFGjNoOeyIhg=
X-Received: by 2002:a05:622a:109:b0:51c:10aa:9cd with SMTP id d75a77b69052e-51cbf145dd3mr87094061cf.38.1783940973609;
        Mon, 13 Jul 2026 04:09:33 -0700 (PDT)
X-Received: by 2002:a05:622a:109:b0:51c:10aa:9cd with SMTP id d75a77b69052e-51cbf145dd3mr87093571cf.38.1783940972784;
        Mon, 13 Jul 2026 04:09:32 -0700 (PDT)
Received: from [192.168.1.73] ([92.247.57.178])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69a19cd8971sm14591344a12.5.2026.07.13.04.09.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 04:09:31 -0700 (PDT)
Message-ID: <5213fe39-0c8e-449d-90db-5488fc4180a8@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 14:09:29 +0300
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/5] media: qcom: jpeg: Add Qualcomm JPEG V4L2 encoder
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: linux-media@vger.kernel.org, bryan.odonoghue@linaro.org,
        vladimir.zapolskiy@linaro.org, loic.poulain@oss.qualcomm.com,
        mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260706071113.383215-1-atanas.filipov@oss.qualcomm.com>
 <20260706071113.383215-6-atanas.filipov@oss.qualcomm.com>
 <akviE-ANATfFPdYZ@monoceros>
Content-Language: en-US
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
In-Reply-To: <akviE-ANATfFPdYZ@monoceros>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: rxo5Bqcbh5_oToLWzvUxYH1KwCVfQHTE
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDExNiBTYWx0ZWRfX6JPRk81Mudbi
 D47LQOOdg8d6d71bK5M60k2jbuaZ832/qCPrP7WymGoYm1TnuFhEfzkFYVnUWwhvm7KqpZ6h8Tr
 SdYBvoLxBK7BgaMqT1o+0VmsgG8xCIE=
X-Authority-Analysis: v=2.4 cv=e6c2j6p/ c=1 sm=1 tr=0 ts=6a54c76e cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=ybD9qRDIDfZaXNPQ7Ca20A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=hFMuEfU6_yxUS0q6VWUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDExNiBTYWx0ZWRfX+hEUPvJRsUxN
 kwdpXweD6NGp/vSiYEM2JUeSZm/kX9w1g6zdFide2AVwoXPC03Jl9bxSkcKwtcJoQNjnF4514iS
 tPr+ck4YQgZK8K+qEfsHcNmNKpZQutxyKSm77GQE5oHPG3+ie8Vu6Kbhb3lC9m94uTxt/v5Xytp
 YqLeyPba9VsXR2KVg30hKxJUjmOTD2ggpHfybKwbBCr8T3ZwUxOm0VVjdLSIGPacEKlfN55ie48
 46qJDc2aInyGvUiTw10Eryg51sZaSxyUdbLKGudGdl/Hpg/CsUYx9HpDG0ievXWMvF+BvV/YXih
 otN40Dh/QuKA9BXvLCPYk5PFJINqukLllGZ3o5hjidgBcYIFPfQLCMsiq+HsVSBznEiN4UxQNM/
 anVQjG5GIQqqfrQK0Z6Gdf9tw/EsOWGL0expTU2KuQWu6Bu6kx8HsJisWDlazynM2X+pJZ/MOuf
 9AonbvUy4M6BU+Pbfzw==
X-Proofpoint-GUID: rxo5Bqcbh5_oToLWzvUxYH1KwCVfQHTE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 phishscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 malwarescore=0 impostorscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130116

On 7/6/2026 8:13 PM, Uwe Kleine-König wrote:
> Hello,
> 
> On Mon, Jul 06, 2026 at 10:11:13AM +0300, Atanas Filipov wrote:
>> +#include <linux/mod_devicetable.h>
> 
> Please don't add new users of this header. Only use the
> <linux/device-id/*.h> that you actually need.
> 
> Best regards
> Uwe

Acknowledged. Will be fixed in v5.

Best regards,
Atanas
