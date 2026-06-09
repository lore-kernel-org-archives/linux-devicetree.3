Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E16748C415
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 15:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781019777; cv=none; b=J0lnerZ+7y7lca9tHuwljyNW97pfkMxNaArzEl6r1Rp0YK2faLWyY58z6ou+h47MqzlGSGM9nS82iX5KGlzD/BpPSXuMrPL2Wykf7RW9HMpS58ITCNQXlfLkBSZSKy8Pkhgu2Hy7yU5YjEdGvMr1b6SzZbKgck70Fn4vuaDX+Jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781019777; c=relaxed/simple;
	bh=gqr5ohazsZyTasddooxt15i9sIDUHi6ZxT2bvwDtjME=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pk4Nx7bUlbGjRjm0yiH8i97/y5G0VQU69pPww8pH0xFJMwoEKH9knHlyjj9FJwDh1jeJt9ZFs+2YrNf2TzTCO4nR0NsvDtUaXllqESPlxRNvnE4i7ATcnnmhXpI/DXDQzzG1k1EPa9Xkd0d1M0cajSqwACF02CYOSPiGC5/A0e0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D39SZ7a8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HZhSzPiF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D39SZ7a8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HZhSzPiF"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 659CmQTt2625109
	for <devicetree@vger.kernel.org>; Tue, 9 Jun 2026 15:42:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8cHJxOBc5Xe8d7YrcCfFV5AL9qZw+skq3zLnjeLTEDs=; b=D39SZ7a8IjOskgri
	S9RCiOP/R1kujtUpFKg2zm/nyS6LoKlIHQVf7mDN332toLJm+U40U6uK/R143VBD
	3eBsqTnEIkyiIPv6pZ6j46q4N53+1pQdxLAxDKdou4ShDBg+UF1M+ljfxSS0BwF3
	Lol4Le8d1s4KEX1PKIFizOZPDlgBetoRyQ7u10R6u+V/TF1RF35G4bNDeKAQ5n70
	1Egg+LIt68GjvbjWtmQP1OD12cUm7KDcX8kB+HzsjUdM243t6NtJAT0q9WjgkkIn
	x4TD+IPgtYzob9ZMs0w9VdfYJnI+/qJae1HtNtnv39HO9vmrv+RcR60iGbB/p5WD
	v4H/9A==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epddsam57-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 15:42:54 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1370417c0bfso5121273c88.0
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 08:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781019773; x=1781624573; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8cHJxOBc5Xe8d7YrcCfFV5AL9qZw+skq3zLnjeLTEDs=;
        b=HZhSzPiF03w+nzTTaTezEPcoJGYJUadkrbMLbG0PIWF55fSbnFxtnGVyaTia1ngXWp
         /i7fZlCrfo5XnNHR3kTN7RQnq7NT5JAisCFTMMCOH2C+7uBFjpxE0DOCYH/QXp2cfpbw
         fxvFEfZ36fFE3iugRTaESfFaAnR62CmwtG1aB1rRjYsBs24XPS+Rvf/pfP5hzuxaqqZV
         /dEbcFxntfmVVdkeM5jZO+GN6VNzgTiYI4jJpPadjIBxyfDB5l/4exeYJbhFKv2E0d/B
         3T4JL9DJaeHjz0QNx6ZbpdAdRrO2lWO9XD0rA83Rl4DRMOfGUh0OzcaCq5F9q9lYDtNL
         Etfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781019773; x=1781624573;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8cHJxOBc5Xe8d7YrcCfFV5AL9qZw+skq3zLnjeLTEDs=;
        b=dvtMZnQCwRyyYoerWCOSE1aSYS4+eq0zGshdS/UCDou2VhT32IVY3spEPf6gQOTvTP
         cv9SNY8q6gOPQ7BQEPTUbfhgxFZKybWM8H4m6JuFOkwLTFwlJMwtgVvaQryup97Z9wtT
         RkGi8AMzpBpoiAP3e61G0HjYsQvy/Fgj3xtGWVMBxBQ9+75DsX6OezZUcAYYSG2uoH+D
         pMKJS4hLuC+aM+Q4v39BO2VNoumw36Xu/D1RiBKgipIK2CS0DUTOdMD0az7Oe6AT8uZJ
         +vGkcp0JjxUfYoVZpOw2N9h45jCf8GrgDBPNCQnj4DvijUBxcA2d4P+c2itGF3hqK4nz
         FjYQ==
X-Forwarded-Encrypted: i=1; AFNElJ/3BdpWqpywVcnEZsCvQbblyWy/O2BbgQfTaqmf39hz+ZdzmrdM56b57gr6PsqvpC4o76Wq3JohgDgu@vger.kernel.org
X-Gm-Message-State: AOJu0YxR+Myff6g+ZMIayv0ZqhiGXuR0VZMhvWRU0Gg4q+EaDxzY3kjz
	nL++vw2XFinOPl0G4TlyrIZyYP4cs8GhoAW970Z/lebReBEppHT+QRL6lyOtEM0J1nAToxbIJ2h
	PmfZOEOBGR0dDdw2inn1yTUvGs2J7sBCVLkHjLe7xPpsi6Y1HxSUVyp5eBjIWeF4Q
X-Gm-Gg: Acq92OFQ0SZW5cRBKDaaG2EI+K5tX2Z/jGxLgAhWR91g6dpmca4KGtDeo1pPJR+sNht
	09Ih0YPr7h1wcGAD640qk2BEyMf2cCGu41LFkw4nGD6iqOu/Qn+1B6rKd+Z14lz5mlv8bdmYtlJ
	R5iVKWr2gxdqeIOJpiyWe9I43CBm+POfxLvyI5vWHiRlhB5VujLI9T3zJCdEXsweLBrt0XD9asv
	VMiFCU2OMgM+vCRzBRXqLdaIUEh6fNIKDGYkyqYX1AF/3MAuG5ErMP6gjRa3SPZ4OBTluEeuN67
	wWieqdcBqZgtibCBz5kmGQxOxnq5+lNHtquAHsuZB5oqlzd/G6b6LVnJadUt3hWlLrrIRgsW9F8
	/3NFVz3OUKKe7ba95rgUUU2rn8ZjbVxK4laHblNbC3L2i+5VkGMQhaeLZUbiPzbTDcckp+rJA+A
	KU3eQHgQQnt7M0Cc0e
X-Received: by 2002:a05:7022:3d03:b0:123:3c24:b15 with SMTP id a92af1059eb24-13807d94f3bmr9505287c88.19.1781019772989;
        Tue, 09 Jun 2026 08:42:52 -0700 (PDT)
X-Received: by 2002:a05:7022:3d03:b0:123:3c24:b15 with SMTP id a92af1059eb24-13807d94f3bmr9505263c88.19.1781019772510;
        Tue, 09 Jun 2026 08:42:52 -0700 (PDT)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074db85f60sm26793961eec.8.2026.06.09.08.42.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 08:42:51 -0700 (PDT)
Message-ID: <dc655263-99d1-4dc5-a5b8-f2d64af36421@oss.qualcomm.com>
Date: Tue, 9 Jun 2026 08:42:50 -0700
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] remoteproc: qcom_wcnss_iris: Add support for
 WCN3610
To: Bjorn Andersson <andersson@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
        Kerigan Creighton <kerigancreighton@gmail.com>,
        linux-wireless@vger.kernel.org, loic.poulain@oss.qualcomm.com,
        wcn36xx@lists.infradead.org, mathieu.poirier@linaro.org,
        linux-remoteproc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260306004344.10968-1-kerigancreighton@gmail.com>
 <20260306004344.10968-3-kerigancreighton@gmail.com>
 <4f94c20c-d06f-48e5-95fb-5380c84a1b99@kernel.org>
 <ecad737b-ea4c-4f32-b519-f338cfd6d48e@oss.qualcomm.com>
 <aieCcYXkmDqfb0Bj@baldur>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <aieCcYXkmDqfb0Bj@baldur>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 6QqUoXKK2_MMZsdHCe-scp6mMz7CualD
X-Authority-Analysis: v=2.4 cv=EI42FVZC c=1 sm=1 tr=0 ts=6a28347e cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=P-IC7800AAAA:8 a=kV-QE96C91QsJRX880IA:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-GUID: 6QqUoXKK2_MMZsdHCe-scp6mMz7CualD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDE0OCBTYWx0ZWRfX6QFLRKAnS09I
 9rzDEk/8pVW2Bi5rWqQ7CbeFjzr3NYJ9IzyPfmwqLRnJ/ODI/ZlBQX87QwZcZUDuSl3mkDI7sqQ
 0O1XeAd6dhiDCAcRv4cS12RgMkJ91HVx0i5A0Frg0JV95CVyqWPlr5DEexFGdnr/cBDCEsfo0/+
 6pddnvhge6RxnwDH7HbQJj1KDEzxbzNuYCjLzyArlIMNOSZJxyGQP47nvjyVS6MxkRdBWpCf6Ei
 Sn1Go3N00lx/94vGvkGjMSD+CT3EJY4QMDE+fHdkg2Pf3El+/o/COqd07M1hdvrPhpo507vj5sU
 hDyWzoNeUHTAs8otjQMHhsamW58Nc8LDMXMQHF9fdr/cCiRLX4JTdq0je+d5q34lCmYxyElg8Ze
 cWKpPckYHIHJRntB5cjE52kna7ZZnu40+yhOMh/ZPFShvHOiDfIyutGhFz+ADKPIc+jR+GqneM0
 gOzWnnGmpY+cn3AgKEg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 adultscore=0 bulkscore=0 phishscore=0
 suspectscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606090148

On 6/8/2026 8:04 PM, Bjorn Andersson wrote:
> On Fri, Jun 05, 2026 at 05:33:22PM -0700, Jeff Johnson wrote:
>> On 3/5/2026 11:25 PM, Krzysztof Kozlowski wrote:
>>> On 06/03/2026 01:43, Kerigan Creighton wrote:
>>>> WCN3610 has the same regulator requirements as
>>>> WCN3620, so in qcom_wcnss_iris, we can use wcn3620_data.
>>>>
>>>> A separate compatible is needed for WCN3610 because the
>>>> wcn36xx driver uses it for chip-specific configuration.
>>>> Specifically, it sets BTC (Bluetooth Coexistence) CFGs,
>>>> disables ENABLE_DYNAMIC_RA_START_RATE, and disables
>>>> STA_POWERSAVE for this specific chip for stable
>>>> functionality.
>>>
>>> This goes to the binding description where you describe the hardware,
>>> how I asked.
>>>
>>> Please wrap commit message according to Linux coding style / submission
>>> process (neither too early nor over the limit):
>>> https://elixir.bootlin.com/linux/v6.4-rc1/source/Documentation/process/submitting-patches.rst#L597
>> This series is sitting in my patchwork queue.
>> Based upon Krzysztof's comments there should be a v4 that moves some
>> descriptive text from 2/3 to 1/3.
>>
>> Bjorn: Once v4 lands, do you want to take this series or should I?
>> (Need to know if I should wait for ACK of 2/3 or give ACK for 3/3).
>>
> 
> I don't see any build-time dependencies between patch {1,2} and {3}. So
> I'd suggest that I pick the two remoteproc patches and you pick the WiFi
> patch.
ACK
