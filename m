Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5FE140BCA0
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 12:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782822525; cv=none; b=RJFCoaL07Zmkg7b5bvTKcNZ3xCJpkzcPxUe4om/ds83uWP0XNqsm+dfwRtawDHJx5UjagMTjodE0y0Lf5pGb6KCvZU4N6AsNj2ay4oll8XAHu3IMZNkTnrC4D0gQshAYiLPPXTCgoNubblJ6q5wWoVPcbS0VUN083zHgc+DuNCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782822525; c=relaxed/simple;
	bh=mW/QBS1QWFhNlkYNGp/xwFvmKH1UJjEnbQ981I2SMO4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R94f4VaJfqasHHCHKiNxUMZjbx3R3wZxzYlHHdC4N0HLyy5XZw5YMF0o3M32my2CY7iZg9wKi9wIqWuCu9oa2rxNqc8QmC5SfkHSluOSlUIXO2VVP3L06LHByvQr8rk4HDSZ8jOY4U4afcYhRCoMy7SKLiA7Ld1WQbyRlScGu1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Wr5Hj7rr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PR/Filmw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Wr5Hj7rr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PR/Filmw"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U9nC781590619
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 12:28:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gPAZDw/mw6Phn9P0hIFKkIjfUsEicHNe79M3BF/BUVk=; b=Wr5Hj7rrdJTXAmmo
	nYB+chQjtFAaB7mbMqICgO98BtLMp/uQNO7tLOPh1TZ69E5DzSxxkePejzSnDbJf
	Iew5fPMqAAofarVozWUTykTZOZH/ZyDEUSg7r0iIN2rWbnETFhXpGP3wqYCgqXdc
	cXhh5iATitbl2hGRycTgAJ+5xseUTcSWR61sGtjReORlu+sop8JC3efunstQia/O
	TwJTw0tK9gSvIv4sb1ZU6SrH7H/uAILxlGtVZw7p9+Xx2nlRdS0Oo74OQN6mCCQC
	nDp2my+b5GN9GChtd1/YETIdddfrobnRYigZG+8ra/qr10Zta42jXf2YnKG5thWy
	wTYMIQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3y9k3h0f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 12:28:41 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-37fccad2b01so4211321a91.2
        for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 05:28:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782822521; x=1783427321; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gPAZDw/mw6Phn9P0hIFKkIjfUsEicHNe79M3BF/BUVk=;
        b=PR/FilmwyTvWjSPlvbhGNAjgrZy0W+Eo1dHV+7VI49M/yXyWo6eBWelWRS+EMPRlTL
         JPHRwFi6IcjA0YdGmv6CtZlgmEBxRCHF1jCyw0GBXF0+Cn2uFlimfOfRFg2IvyOTixPo
         a+mb/eHUTTi7kDRRR6lHMxWgdvNd84F57/Cdz8lP9xYFQgSC1tuJMs8BQqi1nlmYni6H
         7pOEi0w/tpLYVCjM64ef6boEadk7F4z6v9Ohq5jnO+1hS4Wn3oJ1Ui0nIoBo0P3nbCkn
         JSydvHWlkWipgVfWiko5tS0MkZNVqDIljY+7cnsp8ycY5FROpL9N3C/x8Ul7dKCHX8GC
         cFpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782822521; x=1783427321;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gPAZDw/mw6Phn9P0hIFKkIjfUsEicHNe79M3BF/BUVk=;
        b=oaCtsvH7esyGL/7PDoqM9735hapdHxwsDI0VKWVqXeJLf+qnJVHiwWdE9PZLyd9bG1
         yVrWGwBnSTa0xiUKCaz9OAXMQZK0v6XcmUjfGLLh9hoXEGt6aLKIQeBnxfrjZgTT4+jf
         VrhNvOyj4fF/MCKU3zzL2dyf2d1afKZ296q8lFErzOi7JCayYn+NOeozDi76FmQqFhRc
         RDPP/zfYcn+seQ7tTxn/2q4MOggYODpKTZiuG4hvPSNh0DgP9i45rTjTYIjCPYNDkpBU
         96g1SLhizUuibtZ3ljYmkOEY8iDlyah36yxD7jEXJzAlqqGMmC6ldu8RDzUD6bwyllO5
         /WzQ==
X-Forwarded-Encrypted: i=1; AHgh+RobtFx2LZ06qZJIxw7/LKxhnouPc1apSaoxfY/pO1M8UXZ9M83q+RNdFVOi+nflFEfMLzEwu4AzMdqd@vger.kernel.org
X-Gm-Message-State: AOJu0YwIsZ2nQEziFbpZWk2PK/CbaT3NNRrTmXJWrQXGteu2dUjm5NB/
	00whOVd/pSCJhdo18uWVtsDeVawRoHSZ5aXKK0SKZJyllkEivY+4DpxHZ3Z0c+T6RRYwIWiAI1r
	G6GxN8XBoqYVsELO0RAjvXy29GCuoFY8eIYtsoc8ouA7Gzan/uzIoPT76clTZjwq0
X-Gm-Gg: AfdE7cnCLil4ekLZSYzVaxiuYtw3bPbjQ+4sYuQVbNucl5X6QDhjknUg+UvskOgv0hX
	09NaeBocCsk9wkHK1+3q0I5iqhU6lOz5bCYvl+Rl9dMU2DhaZj3NUQ0Fri+upFpYiqBtxn9kUZb
	BzCAL2CkSaZ4aRs4HAtMS0orlsf2X4YY1Cg17Ii+uJwc9exfFvL94jXzdTvLPIBpuaMIh0NxPT2
	dqwecl/pJSW/4aJxf1087bYEPzJQp57pk/4dMD4/3rSGpWacECe1N+YEUigguy9NoCwTouNDHwc
	AGXKnv9kM3PdbvBDMfRcwMZCqIwXTZIBevaQ2ivXogsxSCCYfglm0PMcYdLyDDUT1KwOyhtwG1V
	+F3ZhTwnIcOVCvNiJmP/d+QIJgregqmjyCIwLlRIaJiYb
X-Received: by 2002:a17:90b:1d02:b0:37f:9ce1:cda9 with SMTP id 98e67ed59e1d1-380527daa2dmr2610348a91.31.1782822520629;
        Tue, 30 Jun 2026 05:28:40 -0700 (PDT)
X-Received: by 2002:a17:90b:1d02:b0:37f:9ce1:cda9 with SMTP id 98e67ed59e1d1-380527daa2dmr2610330a91.31.1782822520175;
        Tue, 30 Jun 2026 05:28:40 -0700 (PDT)
Received: from [10.217.219.87] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38052f32869sm1649903a91.11.2026.06.30.05.28.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 05:28:39 -0700 (PDT)
Message-ID: <df03a3dc-1f6a-4725-a565-939838d3b1ba@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 17:58:34 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] spi: qcom-geni: Add property to force GSI mode
To: Pengyu Luo <mitltlatltl@gmail.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260614083424.464132-1-mitltlatltl@gmail.com>
 <20260614083424.464132-2-mitltlatltl@gmail.com>
 <qwbda435on6rhsbf5o4jqijakanjmnmswnc6g6qsubuqbyvbok@fuoclv6u7tq5>
 <c29776b4-04b8-4c59-8f1e-d766bf982a2f@oss.qualcomm.com>
 <CAH2e8h75xeRVvo+jOjRuFaBko5NNCnBX0dawFFsWBaiTwNd4Xw@mail.gmail.com>
 <99eaf1d1-fbf9-4336-a13c-ae8ab789cc99@oss.qualcomm.com>
 <CAH2e8h6aWW_=pD6JAuFB-VqEZDj9x8gZVh9TdvTCRQakKzm3pA@mail.gmail.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <CAH2e8h6aWW_=pD6JAuFB-VqEZDj9x8gZVh9TdvTCRQakKzm3pA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDExNSBTYWx0ZWRfX3S2r9HI28vaV
 fi35n1KA+rKRnZacQcWhJss7S2N+GJwnMawTbtGWEA7IWjXSa0BuNPE88V46voYqEx3HG3yvtNe
 1TnMwc6n4f/g7jWZ7BxJE7rFAfz3Ktk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDExNSBTYWx0ZWRfX/kr/HLdNu1Yq
 bTbS8nqQL7IDoiZi4V33UhLrsQIE4isUDZefE58ob4O3lr/PQkEY5nanWD169mP0sYeODgi7/Ql
 eTnBFyx5+lbj4/AIB/1IuO0RewieWUmKjOHsBe+0p32qreuHuRf5nHyiJu4DLCTKfTFjWK+Fb0O
 RkAEg4qYOCD9EZiHvAEw2uUSuKPQM8BdvJ/VyiVufFU2GM3vpBgseVakrWxqsCsCIjPVSXUp4c4
 lpi960U6zQhS1Y5MwA80MCdIsSGqrMbMfkvyfsqudBl039QF+2aXWr7C3dNGKENYswTBAKRHCa8
 aVKKPfwsAlHgvkZZ4X8CysAhlT20DiYzl+yfpYMbHRRkd24x465Y/llX8CLPh9Q72+yeY1OR1qY
 NTDum0XXCmtqtrCnG0J1tO101wRe9kMNqxDg3ABqDDtbgK45ScC9nTcK7roApLDqJKrUaCA6IL5
 GeGmxwAEuC4gEZH84dA==
X-Proofpoint-ORIG-GUID: KpzD1IB_J9bePzPTaPN2E_vjxIqNOlxl
X-Authority-Analysis: v=2.4 cv=TeqmcxQh c=1 sm=1 tr=0 ts=6a43b679 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=vMSz-Zg_tl80unGds0wA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: KpzD1IB_J9bePzPTaPN2E_vjxIqNOlxl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 spamscore=0 adultscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300115



On 6/30/2026 3:36 PM, Pengyu Luo wrote:
> On Tue, Jun 30, 2026 at 5:52 PM Mukesh Savaliya
> <mukesh.savaliya@oss.qualcomm.com> wrote:
>>
>>
>>
>> On 6/29/2026 1:33 PM, Pengyu Luo wrote:
>>> On Mon, Jun 29, 2026 at 1:36 PM Mukesh Savaliya
>>> <mukesh.savaliya@oss.qualcomm.com> wrote:
>>>>
>>>> Hi Pengyu,
>>>>
>>>> On 6/15/2026 2:48 AM, Dmitry Baryshkov wrote:
>>>>> On Sun, Jun 14, 2026 at 04:34:24PM +0800, Pengyu Luo wrote:
>>>>>> Some devices (such as gaokun3) do not disable FIFO mode, causing the
>>>>>> driver to fallback to FIFO mode by default. However, these platforms
>>>>>> also support GSI mode, which is highly preferred for certain
>>>>>> peripherals like SPI touchscreens to improve performance.
>>>>>>
>>>>>> Introduce the "qcom,force-gsi-mode" device property to hint and force
>>>>>> the controller into GSI mode during initialization.
>>>> Why to force ? You can directly configure in GSI mode. Note there are
>>>> some configuration done prior to Linux bootup too.
>>>
>>> Sorry, I don't get it. how? I know there may be a qupfw, but it is
>>> impossible for a normal user like me to generate one with GSI
>>> preferred.
>>>
>> If firmware doesn't program in GSI, you can't have this working in GSI
>> mode, its going to fail (and work with fallback). if it's programmed in
>> GSI, anyway this will run in GSI mode. So why to add extra things
>> without any usage ?
>>
> 
> What I can confirm is that fifo is not disabled on my device, and gsi
> is definitely enabled (under windows, check the register
> SE_GENI_DMA_MODE_EN), forcing the device to enable GSI mode on linux
> works well.
> 
Thanks  ! if GSI is already enabled, then why do you need forced gsi ?
My point here - SW should only decide mode based on register read, not 
enforce by DT flag. As such it's not a SOC exposed, can't be overridden 
by user.
>>>
>>>>>
>>>>> Ideally, this should be decided by the SPI controller based on the
>>>>> requirements. Another option would be to prefer GSI for all transfers if
>>>>> it is available, ignoring the FIFO even if it is not disabled.
>>>>>
>>>> Yes, it should be decided in advance and configured accordingly for GSI
>>>> vs non GSI mode. Because there would be limited set of GSI pipes, which
>>>> will actually make must have GSI mode device run with FIFO mode.
>>>>
>>>> Why don't you decide prior and configure for GSI mode ? We don't need to
>>>> change the current logic of deciding FIFO vs GSI.
>>>>>>
>>>>>> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
>>>>>> ---
>>>>>>     drivers/spi/spi-geni-qcom.c | 7 +++++++
>>>>>>     1 file changed, 7 insertions(+)
>>>>>>
>>>>>
>>>>
>>

