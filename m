Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 622223403EF
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 13:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787147178; cv=none; b=uAPY55oHg+L5dmK468Ck5BDE0l5Y/Bh9/qJzGPztCJBg9/RJtg6V1Vv9dosPGz625z2cuhsZbbmjXZiqUbNVnfbdgqxIJvmm5EcKAJi2XfXQzACfRIw6Vso2HcfURYZS7Usqo49aE0I9bpodyRC4v2QZnj2K4R4uhQ9uoQAOHOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787147178; c=relaxed/simple;
	bh=JrgZgAdQLR6ih2rwHkEx/8hoXoYf0/e5TvS2g/FwOrY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RxMmP82yWoDiYT7k3UsVsWP43Z2ld6RWuCD1gr8FWZ3H0J1VFhv7LZ94vhGb+cP0rvJEY0ioWEMJd1Tc6Yc9oVuLP8Pf8GqW+415lIH0c7UMzklyfgNXAy1sh9QvTsSCX4/onRLv8d2o4PMi+dZgdWVjDVbgIRSVGxL4OfP2gk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RLBqh6n2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P/y17HFC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RLBqh6n2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P/y17HFC"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JD0QQC4114556
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 13:46:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wniemGQFKfKH7IbJvereJvyJXicbs4JLShPnfXg4wK0=; b=RLBqh6n2uJF2VL+U
	iui7KzYDo7dgqNhhMKZgTzlaoybAx1F87ZTXAD+76rfHfAxecYWwXYiZfz3cNCMJ
	6LVcaS9cu7/RL1kKssBsaO1SNzkkrc2yeCxMwwGVDtdyhEVu6QzyDgnDcm5LbL+P
	LHdIqn5AwDx6zUH7juz/8fZFvCE5lgIUTWYn/a4FpHskVE067oT7sKYRQS6YTqBw
	paquzwiSZDp5Hi5YZZKpSOp71q52T6ZSY1RCq2R2khp2fuNLoaxy4PAYfOqFJjDI
	s85eNcTY1e8//eGA+RptGazQYOflpfwDWNcMO3T7VG52rAbtz1gxBG1FnxpOuTT2
	KCASww==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yfmbfnr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 13:46:16 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-930f80ae4f0so6803785a.2
        for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 06:46:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787147176; x=1787751976; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wniemGQFKfKH7IbJvereJvyJXicbs4JLShPnfXg4wK0=;
        b=P/y17HFCc1/y6nXi1KPVpBjgZTVAMTpQjmG3dEfl7nGKebtzTdPpFDzzl74BXpVTio
         WVfX4kfrvKP28llYcOuVgFc2+dGEwj6RjXD01TdDn5Nal5YEcYwe+VS9w62x4ZjSdd+B
         esdg11pEaNQLUlaNXNDW1WAEwuWfk2OZtJzKMZnwgM2Mw9nxGmpvmVKds7k+7g0+niI7
         XXWRKcwed8N2Lwz8szk/MHKmodH9CrR23HjOxWgXEUE1hlRHn1bdbXeVlk+Yhg6IK493
         Mb7Ynqkbj1BG/y9/wbwbVqdJkTbMh9sMEHlsUPsFhO8qKQ8/y5pGiRKctrx/DLP6KQqd
         2bXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787147176; x=1787751976;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wniemGQFKfKH7IbJvereJvyJXicbs4JLShPnfXg4wK0=;
        b=U2oCIu+S18W7k6g4Mk8GjCXs6DErMlsYGGXxv8i8qLvsRLNjs7XE3+8klRdvdZ8qcu
         8MIzLboqfXcRk2be6Lp3nKMlJGJ1zupfV30U+BZrCnAwxuLzfuX13AlEB9xfWJTuTz1x
         1NRxaRlDg0O3weYKBqH6+JQXWRjr719hNU4erW92HZnriIe1HIjXfsCuk+C1VmDR5NK1
         LpuKCeKOR02tKfPJvTqtJk1Ogd9T54uEzHrorKUUWSfkwbPj53GlTDmCaw+f7DoKY20K
         Dj7EuVSC389f3z3u/2sLL5SGnEQjWOoEPmvEThhVAkUGDI9PnMPqo0ceAkjxaj/Tgefp
         +0xg==
X-Forwarded-Encrypted: i=1; AHgh+Rp/cd4b9r3j+VJNKkxtTbImLXv0MhrNZDPpJYHsa3I/U8TwAaRjPbUJXpEYBXOJ41HRQ5aU6lx4yAYt@vger.kernel.org
X-Gm-Message-State: AOJu0YxcamY//8wHfM4p8dff32263xDh3bHWAL7Pnok6YywOwSySeFww
	NephvHM6e/pfFXI/xAHI/UfL/PRZZOjv3miwH0fnPrAIuaKLHE/gtNTo1CGzd/6H4/NuPsR9hsP
	GuZafT27APJ6x/qgmrCcD/EH2K6PeXa8wP82AShAliudTGSZ6dunZO/1vjH1FgYjj
X-Gm-Gg: AR+sD101cyq1OEPA0lA4WOO3uhFdxD+EudoOnF3WhdG98WvjbqN6Z+g4OnvedW6HZkR
	5Px1Sh8CgctP0nptcMupxXlH28Z4Nqx/vKAB9NUkq/7F8E3BY6j4+bIbkDR5afHXDzwObyhZU2x
	7Sr3euI9fkNLpZlkmmDTE8qhYE9qI/o7wiZsmMbR8O0IPBdVHfLT1F3o/mNxmdHFawxGVh/bN2j
	Ss2F22QDhY44LwY5eQZiWcdzQYgJxpDHLJ5NF8IQdne5YYngDsUWKUkC0K0pXKsWlBgcjOa+Rar
	c+B+cCeoZEgKu/bFRZawGePF2jiTj3Pv4kyTdHOKhTNM3cFC8TAdxTNDb/g1qP0nRPfV5qlLQms
	9dkn/j5ZtXHFH0Yd5qtqGWf7J
X-Received: by 2002:a05:620a:839b:b0:92a:228:1bfc with SMTP id af79cd13be357-9371e6bf613mr319215985a.2.1787147175539;
        Wed, 19 Aug 2026 06:46:15 -0700 (PDT)
X-Received: by 2002:a05:620a:839b:b0:92a:228:1bfc with SMTP id af79cd13be357-9371e6bf613mr319211085a.2.1787147175020;
        Wed, 19 Aug 2026 06:46:15 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b478853af1sm531531e87.1.2026.08.19.06.46.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2026 06:46:14 -0700 (PDT)
Message-ID: <6f7d63af-9a4e-45e7-a2f9-e6c97598a140@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 15:46:11 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/7] arm64: dts: qcom: shikra: Add CPU idle states
To: Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Shawn Guo <shawn.guo@linaro.org>, Marc Zyngier <maz@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260713-b4-shikra_lpm_addition-v1-0-3d858df2cbbf@oss.qualcomm.com>
 <20260713-b4-shikra_lpm_addition-v1-7-3d858df2cbbf@oss.qualcomm.com>
 <5756164d-2e42-4eb1-ab18-69c6f784b789@oss.qualcomm.com>
 <fc24d80d-c970-458d-a912-1d5f18a3a4b6@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <fc24d80d-c970-458d-a912-1d5f18a3a4b6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDEwNyBTYWx0ZWRfX1PeodFIumFJr
 VQkeJH4CUjoiP6P3jv25G0P3NgJBQwafVkRlfyBhk3rlNT7EZzxBKBCEq3c1Fcf4yarmJnoWQtc
 joo2BUCQKvSnqCnPCXGs+rD3hMiEuPrL1YGE7003XzZAfq6yb56hcj29qvuHn+pTykqsO9Y14fa
 EQY+8nEhsIVyaNPgmL3kdfRxND4JWzBM5pP9pImyiCFQD/QVFGlmajXb1sPqqHy3xcfVZIFWZf8
 EEcscwDOeaKNxPNJadEWkOKR8JycxSPZrQpGYt+wwxIXWSCc1JKCD0kVQkWLZvSdxROw/AVyULn
 5iSmlRrw5b2duRCWVQ5qSodpjn8xRWyL9J3jL29wzxE3x7tCRbz85Uca7xTiaNKsIWKXajXRVNm
 h7fN9lYqv6SZKhYtxWMHI1wV269wzUNF18PjLM7w+iAmQEjQKyqttZ1utf6lu9x4bnVGKONQl5T
 UYnF6ey26VwxckN8H1A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDEwNyBTYWx0ZWRfX2zcKDnqZT9xV
 CABn05nJ3+He36F2RqF9l3WwMQsiVbNsItw6GYk/seeZ/UtDCXVGtMExgsCCBYBckJqCDfoOGO3
 kjGStx9awY6nSct161ZDe322AzcsgyY=
X-Proofpoint-GUID: JYQAjfbTLuyDWIqQ9RKstfiqX609xYGi
X-Proofpoint-ORIG-GUID: JYQAjfbTLuyDWIqQ9RKstfiqX609xYGi
X-Authority-Analysis: v=2.4 cv=J+SaKgnS c=1 sm=1 tr=0 ts=6a85b3a8 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=L-OJIXmIpk4T1URZRf8A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_03,2026-08-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190107

On 8/3/26 12:33 PM, Sneh Mankad wrote:
> 
> 
> On 15-Jul-26 3:32 PM, Konrad Dybcio wrote:
>> On 7/13/26 12:25 PM, Sneh Mankad wrote:
>>> Add idle states for the  CPUs as well as the whole cluster. This enables
>>> deeper-than-WFI cpuidle.
>>>
>>> Add MPM under cluster_pd power domain.
>>>
>>> Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
>>> ---
>>
>> [...]
>>
>>> +		domain_idle_states: domain-idle-states {
>>> +			cluster_sleep_apss_off: cluster-sleep-0 {
>>> +				compatible = "domain-idle-state";
>>> +				idle-state-name = "cluster-power-down";
>>> +				arm,psci-suspend-param = <0x41000044>;
>>> +				entry-latency-us = <2752>;
>>> +				exit-latency-us = <3038>;
>>> +				min-residency-us = <6118>;
>>> +			};
>>> +		};
>>
>> Is this really the deepest state available on Shikra?
> 
> Yes, this is the deepest idle state for Shikra. It does involve
> handshaking with RPM to allow SoC level idle states to enter.

Ok, thanks for confirming, the number seemed low.

Konrad
