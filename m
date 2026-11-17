Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794891907;
	b=RvvM8Dh1VVzWnqIPcoGH/gsQFWL60ovwvj+IVpT46mJJZNdfziuNM8VN7402kSKg/Q3Q
	 hYyxs90IzckZ/1AXjEDRY6IYU52Dxep1Yk8ueQ4HwbiqBcCWg+eLYYOJh2dUO9e8DN2Tb
	 5moKd4r9WQXlBkTcM2BcVb/xN49TE5sXdRcnQeZp34XvR+KBCtzJJcD/y4pbSvRY6o1yN
	 ZnynUY6cFwt427fnn/O/3Wsy2UnOYeDR1kBaOxdW3GOHuvjKwcnZkXnHpQqUJ/o4RfVLu
	 BX8MTeXAbf4PiuNh4Es2VaJCc1X2t0uBQaYWYaICtwiikXg9aL05fh1rACpptovJnaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794891907;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=D3O8HSwk3gV+MgeK/2x8V/O+dnoKtfrQX17a7bHwQ8A=;
	b=us9pH6+myGvqDuVAlAz0aKfC4x3NERqEE9ncnNoNzemPktuMb6g+1ljyODg4pIBerHDJ
	 lGokmaXZLjAFBi+Tb7hJYxqHrfPeFrDB3PAWw5seE7aiAanujOFTQ6Mm8GsadYrQGf0AV
	 m4jeeYOawoekHvGesT/yPO21JJJujHNRb6wVADmFsfFLfsn8PxyJzR4Kar5PGw0AnKdp6
	 hHfqS+fOjaSzoWNHj+X3Xr4R7Z0CDeBXXFzfejhllSE0ws8vcXaYBzMpFLeVPWnTglT6n
	 NEGNFCsxZpvM4g78B/ahtprPVLbvAiEozmiM8NfUh9Ldp4KY1Wi0SdYXBOrVV8fSGSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UyR2Xvr5;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RHkZQaS2;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8462B606A32C
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 05:05:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8462B606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UyR2Xvr5;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RHkZQaS2
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH2aA8P3624139
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 05:05:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	D3O8HSwk3gV+MgeK/2x8V/O+dnoKtfrQX17a7bHwQ8A=; b=UyR2Xvr5mgnBNFXX
	m5z2sk5nqcqjIuG2LbsieBw2xqL10aw688SmCyRstdkHPG1FJZOoKTLWGUZ8iYbV
	AadKpNBqRLG9aJxV715SCdaoPrnYPIm46bwK0akZUQzaycSCspUy5d74C46jmFfZ
	i1KKjkepaYeVferOskHGdIligD/U69dbi5WcQXtrMlMDVJKwwA2AdvDUF0Lr8sQ+
	qJjQR8FoUBZ+l4LG6Xp6lyQUtBn4UoRzU8uhkweKSUBUeQ16pFmNVfRDu/VHyGBf
	RMo43qg1oL8450LO5UkropBDG3sZoHLBrjjJgC5mPb1RjndC4BB4b4tM/BK+aH5q
	B62j3g==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j07rehvba-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 05:05:00 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30c0d568830so5423404eec.1
        for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 21:05:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794891900; x=1795496700; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D3O8HSwk3gV+MgeK/2x8V/O+dnoKtfrQX17a7bHwQ8A=;
        b=RHkZQaS2MZtvr9lY7Z8D8+OkVnghhoESST2B/YndphFb2ect3aUlXAa5fP33mU2q7u
         PE7TNn1kTsZghXhKHEhBL5nerfFkcEjIiOyYZY8ZuKL2j4GGoOFgnqB/rQ+TWe/q6Mxj
         q2JVcQ2YNM0bD7XkP+gfrNVmLUGB9C+prurACA59vOdP1dHRgq/yKVYCfcsoyOTgNQdT
         DxiGNN0RGFQowlqDA55JdwONfRXc6cZXYmnTJk/dohdTgEYmjFq+gJuA06M+ETNbb4es
         /Y0NnGm11O1EULBqhQzVl38t8ujxUXg9RDnoCT+0MUgYpuCR+/L0Bmy+ZSRGJ26Pz3ve
         F7YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794891900; x=1795496700;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D3O8HSwk3gV+MgeK/2x8V/O+dnoKtfrQX17a7bHwQ8A=;
        b=l1bduoMx8sdL82q3Hp9EHHRlebowocVnBUaaPkyewsTjmL+laaZVb3vNiUteo+UAIX
         XdbQMDEHV4k8SFseOcxWobFlbEHG3Qp8v+2Pn04pblG9ZAO2SlxPM2eFjMgQk6lENMO3
         wdjiJ3tzD8YSThjCJ2yfhf3q+8ydQcEkzFkv4/ZPcD6aNPuHl7r6pYUhkkChdIUnPqej
         7uZdB92XbAmz3zbqho7fyY2ccJecIWepp2e5rfSvCDrUmiuzIotmq2xkJfq0IPADfRl8
         yOvunzLxJAmj0ohXq/VNlaUoiV2iZPNmG3cxqZnLlI/ZSNBKcZ8x1PgZi4b0PvHScVEk
         ZrgA==
X-Forwarded-Encrypted: i=1; AL+hErGInSWyt1HWOdSPCJpM64rCrotMiC/4VJ8nhwsDwgr5kcKtogsYpVfMbmFigVqA360RTnp6dfL72/Oq@vger.kernel.org
X-Gm-Message-State: APuU4Z/3twPqGYtzAyGUPWV17vQ2JdZqFChjcg7YBSpqZmu88HFcp2yK
	3xusT0LkZU4IQwsVbQzYSTFOhma/642//1De2mGddJ00Jh4ghezjbUDIpvTBH6L2pRTT2NyvNLb
	jT8jaPzCGycDkw+8ny1BQSxKWVO5PA24mSF/8hwk6XSJqSfgKac95Z0pgveH0FdGk
X-Gm-Gg: AZFdTZdZ/m+rcP5Olsp0Hsw2yxYTGpcn31YPEqvYgT2HGkdsYEaTsE9O0FFHQ4xj8bd
	eDuXmASUYfxxvxXcUXCRRGqmg2adYxilMyn1+Zh+u/mLcRNOz+GKjYFF9Y2iyJesW8ZTbDnT4iK
	cxRVco0sVkVGY0SXDl7tDneVdn0xfJqLm+xYXK1nTMdEmyqVVvyTtj10ldGKGW0EDw6RUqBbJ6X
	BRQ0c6Qv6ABSOhZXqA7CuRxtFn4K3KcmFUlg34BOjLjKh6SzCdnqXApFwkgozhm7ojzN6okdaXY
	riDH+Q1fB/OpohY51KMCEn3paqXHT8oXedroXb8bjem+HRU0MVEwiLRr2XiB4OkMFdf1/EBwA0y
	rTZpubWjuMMZSn2dueP/D4Fz9BmlyBKLgnDjOKI/8rpQzo/FcwFid/zsAF54zx7jLI/gPPeoYyE
	kqsg0=
X-Received: by 2002:a05:7300:de01:b0:36c:a154:db1d with SMTP id 5a478bee46e88-37963373955mr11307805eec.4.1794891899976;
        Mon, 16 Nov 2026 21:04:59 -0800 (PST)
X-Received: by 2002:a05:7300:de01:b0:36c:a154:db1d with SMTP id 5a478bee46e88-37963373955mr11307779eec.4.1794891899424;
        Mon, 16 Nov 2026 21:04:59 -0800 (PST)
Received: from [10.217.198.242] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-381a55555dbsm1297729eec.10.2026.11.16.21.04.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 21:04:59 -0800 (PST)
Message-ID: <d3060950-04ea-4f9b-b160-0e068946e623@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 10:34:52 +0530
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: power: domain-idle-state: Add
 system-state
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Kevin Hilman <khilman@baylibre.com>
References: <20261113-s2idle_state-v2-0-ad604182e7e7@oss.qualcomm.com>
 <20261113-s2idle_state-v2-1-ad604182e7e7@oss.qualcomm.com>
 <20261116-icy-free-lionfish-c3eed8@quoll>
Content-Language: en-US
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
In-Reply-To: <20261116-icy-free-lionfish-c3eed8@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAxOSBTYWx0ZWRfXxdFjzF5YsaDX
 j9PnzlA9gnXfRFBAJFtk6NHTdjYvFL9tihXaS3+87SEeBNjZBeW59oz0h4+vMme5uzgZPCPqMOj
 jMvMbhkt3vcH3U12sZocMAYtK5QtErM=
X-Proofpoint-ORIG-GUID: rflmWPGY13uLtSU68fZM5PjB-_BVO_fh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAxOSBTYWx0ZWRfX00IQ+vpyXmAo
 ntVmcY+PhtDiKMoOHekpvmCPCKFLx56mOPeDNGAeYGZ9rq+T8zuTsd988Vc+frepZkdDCF3YM3m
 yEoFRivIqWwnAQbyiDGKL4J09M1wkB7nPgRQ8ymOlmRnJFxerYXIVtPTREVGJl0D6voXqSciiuJ
 /HoXBqmCBMTOFkQa3PrSAXSYKeswxRqXHv0nSnhoqnrbUFCq7DjNXeE8RNaUL1K2imoApIqzHhI
 l+3Mtfba8KMgLM90KQluTEnu+pwEoO6ghRJjdDg0uhw8E+qChNXqdZGf5i2NtxEUl/Bq6ZNb/WP
 nSz34F/MIsbRe972xxoL3glR29FlPwIKDbU4X480VghFsrTmjxF6E7dOl7S+7IG1f1kpizZnDXb
 Jgm7nqX69mxlc22NhXH9J675UxCIFcORoOlxKyOexhgCqlew+g/2p9Vl288g1kL8+0UZeb8g3lc
 oliOUP/gnCs+dy2lMhg==
X-Proofpoint-GUID: rflmWPGY13uLtSU68fZM5PjB-_BVO_fh
X-Authority-Analysis: v=2.4 cv=R9uWitRX c=1 sm=1 tr=0 ts=6afbe07c cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=IpJZQVW2AAAA:8 a=EUspDBNiAAAA:8 a=CCHPWfvzcojU1fbeCg8A:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22 a=IawgGOuG5U0WyFbmm1f5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 adultscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170019



On 16-11-2026 17:28, Krzysztof Kozlowski wrote:
> On Fri, Nov 13, 2026 at 10:25:25AM +0530, Maulik Shah wrote:
>> Some domain idle states require system-wide coordination and are not
>> applicable while the platform is up and running.
> You repeated the property description. Say something more. Why they are
> not applicable when platform is running? So if not running, when are
> they applicable? Why?

On certain platforms CPU subsystem deepest idle state requires co-ordination with SAIL subsystem
such that both must be powered down in coordinated sequence. During wakeup SAIL subsystem must
be powered up before CPU can resume. The wakeup can take a second or more.

Selecting this state during opportunistic CPU idle can therefore cause substantial wakeup delays and
repeatedly interrupt SAIL operation whenever the CPUs become idle.

Add system-state property to describe the state is reserved for system wide suspend.

I will update same in v3.

>
>> Add a boolean system-state property to describe these states.
>>
>> Acked-by: Kevin Hilman <khilman@baylibre.com>
>> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
>> ---
>>  .../devicetree/bindings/power/domain-idle-state.yaml       | 14 ++++++++++++++
>>  1 file changed, 14 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/power/domain-idle-state.yaml b/Documentation/devicetree/bindings/power/domain-idle-state.yaml
>> index 4dd4f59bbbec..b19952f6225d 100644
>> --- a/Documentation/devicetree/bindings/power/domain-idle-state.yaml
>> +++ b/Documentation/devicetree/bindings/power/domain-idle-state.yaml
>> @@ -45,6 +45,12 @@ patternProperties:
>>            state will yield power benefits, after overcoming the overhead while
>>            entering the idle state.
>>  
>> +      system-state:
>> +        description:
>> +          When present, this state requires system-wide coordination and is
>> +          not applicable while the platform is up and running.
> So when is it applicable if not when up and running?

I will update in v3.

Thanks,
Maulik
