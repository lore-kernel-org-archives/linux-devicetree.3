Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 862CE318B9D
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 17:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783011900; cv=none; b=oKgHkwpITwhqOnsoEa8brzIJnGZkmaks01shxStdZVuwOTgXbEK6uhmUfssxXC/jh5yC1AEN1+/vbFgDFfX+nlH2qpkey5z6aXgxQuLvkR+/8h1hZmxXbW8ROD543id0qo2rk49zyAkdIrVyjhbikbs7FRc0il6/ROGMduq08j0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783011900; c=relaxed/simple;
	bh=9tuRvVLOkJDkdB2TUNh8MQAFyNvpa/qW/IXJzIeBcH0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eKefeYb9/2EH1j44lDOOow/tr6oOI29dhJ75LnFclfJ2C4zW5XfnxCYRh/usq60aMDc9iwFAC3bOc/wC/uYYQvWTXfljB72GAlS+tC6zSqKihCovq/PlU+ryq/hQZ5dnsUaMSSi2LOhndMyUgw6RPH6KSZiLMU+yKK4ajXrEDsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IrK+m0Ax; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WS/0xfJR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IrK+m0Ax";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WS/0xfJR"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 662E3Jib683146
	for <devicetree@vger.kernel.org>; Thu, 2 Jul 2026 17:04:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1aKxFR/CdIjnlCVHU4kiwY3NDA03NMLY1DVMh4+N76g=; b=IrK+m0Axi+P5tcqx
	4GG5YONU96qyKpeLs0k9AqbX9rhrxn5z+drnF83+NmF67IpeQlIbry/nZOxm5xBn
	oQ9W1RF8OkplTXRINFAlLrSdrkGXPgtArg4TaJZZdtg9Q2caUTVToWU2W5N1ragb
	QQYFQIlAyEhZiO7TUWv7cDKvuNkrXVNfvTb5YzbGStXbUl3F4Q5wjNvhXMh6O13N
	NaYJ0Vp1nhrZqypgN0s4SvvQNzF4Zle9RrHHZ7LjP1gHLpXZFPMoZL31SVwrHQRV
	pUA0chwM2VaNjf2+65xDhZxsrP6tL5PcJUsh+rYtCWAZSdxQMgBw07JsFPcUE7E+
	9swOYA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5mvwt4p1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 17:04:58 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-847a5f03ff9so2609558b3a.0
        for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 10:04:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783011898; x=1783616698; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1aKxFR/CdIjnlCVHU4kiwY3NDA03NMLY1DVMh4+N76g=;
        b=WS/0xfJR/3LVvK8mbNWrBHYVimpaOldoODMXnl3BcU8ZMxI7qpnfXKvswRsT9F2a12
         D5IiQ7hPe74XCu3ZKvjrE+Zab5dCx1/RvFPQVXPjlCwW029pcJiWMrrejSR/OUQbAN7B
         xB5nYaDKGfscNFtWtpC1aSuvMHEsSLbap7n8rB1xiYMF4eGwYCk8hA4x3XxFv1O6suNt
         dSBrYgvy6op/0iiGSvTs9asploj8kP5vs93SzTiz1UZA5xIzACdmjOZYaiJEqJKaHWbe
         AeZ7BEMQyhHZ92SymqpUxEH9y71Vd98eio8Ur8IjhL+l+zG9mRP3rm95qLhEsi8++S1R
         GO3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783011898; x=1783616698;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1aKxFR/CdIjnlCVHU4kiwY3NDA03NMLY1DVMh4+N76g=;
        b=sVHpkSJ7LK9xq6dHYXbMkyx4J1gRvKYRIXwcXsqN/mPpVsNnyYU44cZTwK6o8pUup2
         J5OXKScbldXcnzS35Z8OaElwY0GsQU7J1gkRmZOKiXVj61OPygyET6vA4prUB9Dl1mH0
         Lrd3Jxd6AN+35UwRa113k6QbguaxFxWHQCfu5meISU0DqEnTh6MxPsSZGiTHeMCfA/Li
         o2vqP/2rAIKA3nqsHAsWGJzRUjleSIEsC2ZtuAF0QNWfsaWA2ct9r4Q759jBt8pZ+AJz
         GnMrayD+/WMmVZGgobRwBUD0HpnAt39grFw6JgcM4wWal3PWmAHm36dVtmQHq6pdN2+p
         y0Ag==
X-Forwarded-Encrypted: i=1; AHgh+Ro2ihQJMpMhe4K2gPE19L649jY69q6rgTLeEkeVBKLfJFHYLML2qLtvC+lDjEDid6Osc/DY2IgwZ9dA@vger.kernel.org
X-Gm-Message-State: AOJu0YzGjZTvZOFoGcTvv3Mrt6tzJnC3oLRJTzBj1+9xuecM/OgrYzDb
	PI1UVz88VFUEOVMf5KGtKjM6a7KZt2n3g0H6Fkng2bZObG28ydny8Kzi+6TqNJ3dB5lrVgOBXaQ
	Bjcm5VLTQN22PNfa3icQZRSmgPP0/imN0j36fYt9PBlicEmNPl7q29C0E8xTBzprk
X-Gm-Gg: AfdE7cnBpVH2n6ALmIktfRcguDFrd5pYK5HlBsR7urzyJZFrOfIEy5oA28S92/Tak80
	zY0FdiQo1/+UXQDUbH1daEQrtG/u3aGvN3i9UK1m0xcdRwQqcs9S96+qAQ2Zoh9MFazfVuPzeAj
	0wuAuNxEmIVuJUO4M04U42v0MdQbkPx+xra6f1l0S1wW3Sbe1Yd1RzAfLJ19f+vEx2Vnz3qbdAQ
	ySFsMkyhRJ+QCnX5bK2JkjJ0JX0f8lYTaL50Y8iUoSoOOyuERIjPsv+X4LcwJ0KkVsQOYES+fHL
	Yzr7uRCItDGTMVentv2WW10+xr/llvlZ48gIdWH37LII8OgrLXq+onF4MJLjofrHvLmaYCwAVhI
	j4qL3yYSbWg91xr7KFaYQYYm8s7S6YhQGHEbTW1XxlViyag==
X-Received: by 2002:a05:6a00:4b12:b0:845:c5d5:3743 with SMTP id d2e1a72fcca58-847c0878290mr6759858b3a.28.1783011898010;
        Thu, 02 Jul 2026 10:04:58 -0700 (PDT)
X-Received: by 2002:a05:6a00:4b12:b0:845:c5d5:3743 with SMTP id d2e1a72fcca58-847c0878290mr6759816b3a.28.1783011897290;
        Thu, 02 Jul 2026 10:04:57 -0700 (PDT)
Received: from [192.168.1.8] ([106.222.232.144])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847cb79b9adsm1729818b3a.27.2026.07.02.10.04.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jul 2026 10:04:56 -0700 (PDT)
Message-ID: <94956a19-153f-4bce-a824-7608bbffc98a@oss.qualcomm.com>
Date: Thu, 2 Jul 2026 22:34:49 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] spi: qcom-geni: Add property to force GSI mode
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Pengyu Luo <mitltlatltl@gmail.com>
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
 <c3922558-dead-48b9-a49c-7d0d6a2dde7c@oss.qualcomm.com>
 <6fbc4521-15d3-40c7-89b3-ee15ad673ff8@oss.qualcomm.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <6fbc4521-15d3-40c7-89b3-ee15ad673ff8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: eQq8IPqIhbuHfRBBdLeU9oY3RXYHZDhd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDE3OSBTYWx0ZWRfX/AIOumu47/td
 Sp553DorJLJuZRNE+Qd0ygYPpkASSLYiyFswe0sRmVJ6mt5KqMId54fh8z1n796zxicA2tiwprH
 WtJzp5uNMZ5UESDYUITj4jXm0e6zWtZwNkKE7rH8PaXSDfIAF61wJHoNicYB3+4RGaeQHJ2RqkL
 ChB4TZHmFtmwuKqkNQqAlttzwBd/Ji0G4YA6Lwx2siBQkr8bgytPBbLsUUkv7zCUCzMAB8hUCoN
 apDNGP7tUf/xPhZq8S88z6y/1SodR6i4MNGjYKrdCdady2WbU7Zs0Hj3nQAS+zU0973MEepnP0C
 QNe6wRv4wrAkfwL7tFi+E45msXR3gpUE8ld9bxbfwq/k9RQirBa5FZTysYygGLHltnPKlFdlxeC
 aTJYbDgJ4z90TzgSYhwt9rjRuM5+9Z6MvvXhK2uRX+4gho0/hwUrzYkn3LEqY1tWWt1EM/4bp/K
 xSS0iKmRehTI01Wl84w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDE3OSBTYWx0ZWRfXx6Dm1Yl1qDmY
 /OQo97B5hR/D0EaN3DSCwifm/dfMUD1Qw1mZ9p+frInorwp3CqlV9R9gZuAQE56CGNaA0VllgfZ
 oSpLi91C2Qbit524kZYkeQ7/Ma7VyUc=
X-Authority-Analysis: v=2.4 cv=N+UZ0W9B c=1 sm=1 tr=0 ts=6a469a3a cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=1q2F+KrbvUZPNaeG7DbW0w==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=CDJIOK5pyNGdDAhtdj0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: eQq8IPqIhbuHfRBBdLeU9oY3RXYHZDhd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0 spamscore=0
 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020179

Hi Konrad,

On 7/2/2026 6:14 PM, Konrad Dybcio wrote:
> On 7/2/26 2:39 PM, Konrad Dybcio wrote:
>> On 6/30/26 12:06 PM, Pengyu Luo wrote:
>>> On Tue, Jun 30, 2026 at 5:52 PM Mukesh Savaliya
>>> <mukesh.savaliya@oss.qualcomm.com> wrote:
>>>>
>>>>
>>>>
>>>> On 6/29/2026 1:33 PM, Pengyu Luo wrote:
>>>>> On Mon, Jun 29, 2026 at 1:36 PM Mukesh Savaliya
>>>>> <mukesh.savaliya@oss.qualcomm.com> wrote:
>>>>>>
>>>>>> Hi Pengyu,
>>>>>>
>>>>>> On 6/15/2026 2:48 AM, Dmitry Baryshkov wrote:
>>>>>>> On Sun, Jun 14, 2026 at 04:34:24PM +0800, Pengyu Luo wrote:
>>>>>>>> Some devices (such as gaokun3) do not disable FIFO mode, causing the
>>>>>>>> driver to fallback to FIFO mode by default. However, these platforms
>>>>>>>> also support GSI mode, which is highly preferred for certain
>>>>>>>> peripherals like SPI touchscreens to improve performance.
>>>>>>>>
>>>>>>>> Introduce the "qcom,force-gsi-mode" device property to hint and force
>>>>>>>> the controller into GSI mode during initialization.
>>>>>> Why to force ? You can directly configure in GSI mode. Note there are
>>>>>> some configuration done prior to Linux bootup too.
>>>>>
>>>>> Sorry, I don't get it. how? I know there may be a qupfw, but it is
>>>>> impossible for a normal user like me to generate one with GSI
>>>>> preferred.
>>>>>
>>>> If firmware doesn't program in GSI, you can't have this working in GSI
>>>> mode, its going to fail (and work with fallback). if it's programmed in
>>>> GSI, anyway this will run in GSI mode. So why to add extra things
>>>> without any usage ?
>>>>
>>>
>>> What I can confirm is that fifo is not disabled on my device, and gsi
>>> is definitely enabled (under windows, check the register
>>> SE_GENI_DMA_MODE_EN), forcing the device to enable GSI mode on linux
>>> works well.
It may work, but it may fail too. We rather want to decide FIFO/DMA vs 
GSI based on fifo_disabled variable.
>>
>> What's the value of se->base + SE_DMA_IF_EN (+0x2004) on this SE?
> 
> I'm sorry, I read the first sentence only..
> 
> I think the enabling of DMA and the disabling of FIFO are technically
> disjoint operations, but shouldn't be. The programming guide mentions that
> FIFO_DISABLE=1 is set to prevent malicious software from snooping the data
> from the RX FIFO while the SE is operated through the GSI.
> 
> Mukesh, would it make sense to make to rework the checks this way:
> 
No, below actually completely makes things wrong.
Overall it's between GSI vs non GSI [i.e. FIFO/DMA]


fifo_disabled = 1 = GSI [Neither go for FIFO nor for DMA]

fifo_disabled = 0 = non GSI [Then Driver checks data transfer size, if 
<64 prefer FIFO else go for CPU DMA mode]

dma_enabled = 1 [fifo_disabled = 0] = FIFO OR DMA [Driver checks data 
size, if <64 prefer FIFO else go for CPU DMA mode]

let me know if there is still a confusion, we can discuss.

> if (dma_enabled)
> 	prefer GSI, try SE DMA otherwise
> else if (fifo_disabled)
> 	return error, misconfigured SE
> else
> 	fifo mode
> 
> ?
> 
> Konrad

