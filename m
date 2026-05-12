Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B67248BD33
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 08:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778573581; cv=none; b=fYn7HmlFWmIOmplU/iH55st2o1RLotCYlJ/CLZSY3XNP9uBMJ38QNYV6cEfi1CS1t+51cZo3aG7GBFpg+eNtRC8Y4appJUk8/cfJ+J57pNW9y8eM1UI/t17u9eA8YbgV7qD4ELBLekNnwjT4r/t1r51DPgESOWD7OWG08Xe7ZV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778573581; c=relaxed/simple;
	bh=JaPz0PmMqpVFR9VAI2edYIg/te4svJhrVtK8QT4+WCk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iX4m7Tep23C6cm/BmcckZe30Xc9lhcumGL2wXRgUeXgIlUFGD0i831/cey8tjtc43tWFshAlt95vwHgwLuzNEqEIdsAjYgc34JGDJx8Xr751PdzcTZlQ7OX76oxdk92IlZw6lJL7gHy8q99yYGjR9dhMzLj1BPutBpPb3oa9nFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N0Wai86N; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HfSpTYjs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N0Wai86N";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HfSpTYjs"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64C5ZsgA2202251
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 08:12:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ik1ROdqwKoY1UFhbn043GWEcR0Mrm+/8Wii83OHMmqk=; b=N0Wai86Nbd+uxRbb
	xh3m9KfkX+IVWAaGVZZmSIiRomw0bzUb/w+jraSiZqA/loRNBfWwJMmEZCMfU1Wf
	6EteYnbaKNRVyz/DQmC/gouzqVkN3tJMqhWhWFrUrhRSKF/mQPXYCg6nFzCzzW15
	7ZiiU+8eg8L7/9LIby4wWu/J/JjMQ5umRpUfj2bLOvn+i0HsmfIT0+hiUVhvlFvw
	Esx3l9k79jtxraDs9/AzKbb9jEDlWQi9+scIFq19JGDK1MU3B38bS6ddalLnkEna
	IvH5N/Ql6ooFN1FWnjaqy0s/jEM+x93wS4XsKgIxi9QFgzMaAUhdiKK9Y9OORUrY
	6pgY1w==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3nuyj57n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 08:12:59 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b45b74f693so11017645ad.0
        for <devicetree@vger.kernel.org>; Tue, 12 May 2026 01:12:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778573579; x=1779178379; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ik1ROdqwKoY1UFhbn043GWEcR0Mrm+/8Wii83OHMmqk=;
        b=HfSpTYjskwUVpN+PuGtTfn4lJZOQQzfybkGRytUcq0xQrcW/uauFjnYxnrP4AnBnlN
         /Q4I6NJF+zfds3z0fnc5XdXD+85jb2aTxw1asTsezzTEwGOkGAFC9RZbND/dO8BzctsW
         0pmAgs+J98ynO12U2TNnf92sxvfteOqsDydMT77htM/Dm7wQndfSWcTAyURLraUWN/X8
         aa5MC/DMpEW2SGYLO1W57JbPA9i5lwaDNpqrufBcv1qaE36OwT2HrVu4GowuG5oR+SCL
         Fz4fIJHnl45c7l5R/HxEkiVA32HlJGeUM8VlHe7jokeL4vad6YXKEcL4xYbZRt5OFufV
         EYUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778573579; x=1779178379;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ik1ROdqwKoY1UFhbn043GWEcR0Mrm+/8Wii83OHMmqk=;
        b=dt7+UbN6hsELpW48f2gHCnJ1N83GYj2g651QNDXAspKFn1I98WaO52HpjfZGunNYEt
         v3EZ/swYyNmrrOlSs9oy3ehWHCY6phly+FUDuObYAh/Czmg/AqwCdY7sD7qy4FQfjk3P
         ANHIDTJPQKZ2Mn5NMDGqusN8m/q+xPB9wr7hvNRcRqde/48QAIAs1Yaw6jOxKDLSc2DG
         b1zKmuFcrWN6f388bVGOYXGp2A+ZUM0Ux6sfj2CSzPX4Qp5vzAtkeEkMXE/G6FAICJIi
         NUK2+JSsXuN1LTDK9xb9oikpgiLdzY1723rgiKw1XC9I++zMiaBFBDB6kVT10Q1EGJpm
         iC3Q==
X-Forwarded-Encrypted: i=1; AFNElJ+TZpfsOJg5BQoBDzW7IEUpjjcmKtB6cqXF6Cc7X2b5y3wSEyR0X+8ITL/jvWH1JUzoQaGaQdwcfhCu@vger.kernel.org
X-Gm-Message-State: AOJu0YxUbrAhrp0bC8VYUodyl3xnjwfM9yAu6p0MOH/9OrZSHifz5Oz7
	stKcW4bxyJN8aWFR4Kax5Mvm00HnjmmQ6dtv5XPJDj53sCTi0mT1bWkkwVNWXS4X39eVsUtDxzk
	rrNbKBU27u3UsQF2+1Rk7Xwk4awghfsTJsSu66cePkA+kqI95Osq/aW/7v0dQGI3r
X-Gm-Gg: Acq92OHbV/a+VCHftui/vDVmAriL6bL+J4qbtsyNoQ3PN/t8sJfsArrj8yIptKuQ7/5
	rg3Q/4lonfIXqJbCJFGFhyPlbnaWQFymLiRM3JSO+rWaAUcYra+eV9URu1iSGYG8JQ3AQO61s82
	5Ldsk8HZGu0Mou+b1H4OU9bhWZoFoKaD/t6/Hx7T253RK0tm5r8mTfsVcsp6E/24kEEhwdDUSCi
	QyvPu87sZmLl7ylRCSkZ81B+KfV7glS7ILgk5EotktONJYVfgRtKOuWEYk0xMtdCWgrbu3uRsn+
	CYMUxkt2Y3Ifutw0XEC96o+I5+lxtZsUvsmPO/ssL2IFg7WEW/3jYVHwszhe8hyjTo2tHgFAK9E
	PHvELr4lB1tvghSGGc6A+kRoPivxfzlr9en+H8gCUCo8jB55b+fQ=
X-Received: by 2002:a17:903:3d05:b0:2ba:1744:773 with SMTP id d9443c01a7336-2ba7b275e59mr146694975ad.3.1778573578790;
        Tue, 12 May 2026 01:12:58 -0700 (PDT)
X-Received: by 2002:a17:903:3d05:b0:2ba:1744:773 with SMTP id d9443c01a7336-2ba7b275e59mr146694735ad.3.1778573578262;
        Tue, 12 May 2026 01:12:58 -0700 (PDT)
Received: from [10.92.198.185] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1e66970sm127207065ad.56.2026.05.12.01.12.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 May 2026 01:12:57 -0700 (PDT)
Message-ID: <86976303-5f10-4643-be98-54e338471619@oss.qualcomm.com>
Date: Tue, 12 May 2026 13:42:53 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/4] arm64: dts: qcom: monaco-evk: Extract common EVK
 hardware into shared dtsi
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, richardcochran@gmail.com
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260427170505.1494703-1-umang.chheda@oss.qualcomm.com>
 <20260427170505.1494703-2-umang.chheda@oss.qualcomm.com>
 <9ece279f-2f57-466a-9af1-9fc8670c8ef9@oss.qualcomm.com>
 <4a41079d-4e3a-438c-9996-c756206c0c3a@kernel.org>
 <f759f97f-1231-48bf-8d2f-6c13ccc841e8@oss.qualcomm.com>
 <e7c9b78f-f6ce-4f17-88e1-ee8e6620fef6@oss.qualcomm.com>
Content-Language: en-US
From: Umang Chheda <umang.chheda@oss.qualcomm.com>
In-Reply-To: <e7c9b78f-f6ce-4f17-88e1-ee8e6620fef6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDA4MSBTYWx0ZWRfX4Nlsa7sgbulQ
 u3hD8npGSnAUvpo/s6Be1PIMDhhr3TL/f6zlI923hzIOxZkwPtIVm9eOtWZcwJXe2Dz8CgbFHwI
 FV0m0AH8NtmWsYw2zvA8v76iOibaSPd6GCs6OcE4R2xb2stlI4xYTDHoxo2WMFoUvRyFGhU0tNi
 cd9t7nPly0H4Qj9DzuRxV/FSTxzl+ZQC44d9nNrzFltzssgdwmliiM65hydAJck1Dc9jDmT9mUy
 pgrM88ky6O3YXzuY9tZHbpDRbm50HzKjqrYfDVjB20KbTYKvaLrD8ni44gxGxejZrQVRtRH53qp
 crKTnbAjsLml4SARFS25tcemKahudv+bk+MjZxhVFq8uVit8seN/69fnrsH/7Wwxk9lJbucI16H
 92wloYdUOwipOABWXFX1YkEeaik80Z7lHhoaNJ3PZT6t8qYlMEhG2OyOrTBCi8cDePL7Dd90QSJ
 gcMtPfsXrKdPFAnmqlg==
X-Proofpoint-GUID: -QSC2y4svzhLb1kysvlLbC985u7UTjC6
X-Proofpoint-ORIG-GUID: -QSC2y4svzhLb1kysvlLbC985u7UTjC6
X-Authority-Analysis: v=2.4 cv=Y5XIdBeN c=1 sm=1 tr=0 ts=6a02e10b cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=egGItt_2NHUHVmhs1T4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 adultscore=0 phishscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605120081



On 5/6/2026 2:48 PM, Konrad Dybcio wrote:
> On 5/5/26 3:53 PM, Umang Chheda wrote:
>> Hello Krzysztof,
>>
>> On 5/5/2026 1:49 AM, Krzysztof Kozlowski wrote:
>>> On 04/05/2026 14:57, Konrad Dybcio wrote:
>>>> On 4/27/26 7:05 PM, Umang Chheda wrote:
>>>>> The monaco-ac EVK is a new board variant which shares the majority of
>>>>> its hardware description with the existing monaco-evk board.
>>>>>
>>>>> In preparation for adding this variant, extract the common hardware
>>>>> nodes from monaco-evk.dts into a new shared monaco-evk-common.dtsi
>>>>> include file, and update monaco-evk.dts to include it and keep only
>>>>> board-specific overrides.
>>>>>
>>>>> No functional change intended.
>>>>>
>>>>> Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
>>>>> ---
>>>>
>>>> The patch is a bit difficult to view as-is, but the gist of it is that
>>>> the resulting monaco-evk.dts is:
>>>
>>> Diff should be fixed and since this is not even b4, than producing
>>> proper patch detecting rename is trivial. :/
>>
>> I acknowledge it's hard to review the patch this way.
>>
>> I’ll rework the patch to use a proper rename (git mv) and keep the
>> follow-up changes minimal, so the diff cleanly shows the extraction into
>> monaco-evk-common.dtsi.
> 
> Try adding this hunk to your gitconfig:
> 
> [diff]
>         renameLimit = 999999
>         algorithm = histogram # or patience
>         renames = copies


Thanks Konrad for the inputs, will add this and re-send the patch.

> 
> 
> Konrad

