Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793874649;
	b=Y/AIB/KyOCDrjkQ0UcgHJIvbYmAmQGSv51dBlT1ssF8gHKCTuLPcToKcHzrmzly3Bdis
	 Uu5V1bu9R63jRk4jszbH3cjDt+3X3J51tPssXTNY5m/foZXY7u/hJPAUj9fqcDPu9bnkN
	 WnP3NuIZD64ExSfTOQOt0s3w0+0feuZFzBAK/czsc9Vl6JEFzjwSBz/JZkIupvTCBueea
	 CHWx6K9mdsBiHLosFnkyDWw3NaBL0SZPZx/D8Dti6tukR0yPq1KJlRaPCqCbczphida1O
	 H7RHJfqrrcZMKfY0N0w3d2XFOU6kgOxzL++aE1Qn7WtnwnU/HsFEtT1eGz2VKnTrRlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793874649;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=g4eh26VIvLph9rixscA5Qk9+BXI22FApx034GLz9Kzo=;
	b=YCNfFuBHvP/p+UwlLXNqWOvb2sxcHq2x4GIgYftGZSwunSTdvHMR6lccbQRGHkgFp2I/
	 JDJ3A6by+lWVLDUZxlKPr+gxZ8zRbmg0jwl46wt7map4uzy9dbVvlyE0cf4bmpyEdLZ4P
	 hDbOHPRMPb6TeF1h4lbecSr9MQoGNnvzyJOiKraZZtMhxITez0/zuFu2Vc5HFAO0myHyZ
	 ulhvwOjubghpjMcvPM1UDCzUVvZK0Th2G4rR1KcGDSPz7Wb8sAUMTDVAxo7NPSZDs/Sad
	 oEtxwllbsYrbck8DIW4Z8TZbkAptZRTnPJP0wElX0SdwckEBvLqQ9pQjTpszwqI18YA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=temperror header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nwAkK7cO;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iaFFcR1V;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6775F606A329
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 10:30:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6775F606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nwAkK7cO;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iaFFcR1V
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A59tajn3044032
	for <devicetree@vger.kernel.org>; Thu, 5 Nov 2026 10:30:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	g4eh26VIvLph9rixscA5Qk9+BXI22FApx034GLz9Kzo=; b=nwAkK7cO6SzNaNRI
	eWRZfMBrewvD8gZN1WvfIQyNbkUSb4wBs7PsEeYlWpacGKmt8gvqjN0hP1HggBsr
	VfTmzWqzU/Z+HANEZmH6NtLJ9TZrd6ydK94eJRoCcR6ZYc0YKvQwamb9xOxLSmq7
	XySB7fzbxESdJPAYSTFif3208JPPqt7bUOMOd2KRjCF79f/VdCvODj5iS7rmdcU4
	F+nDSYfNqP+pEs8HqwH6P1mo1WmGJmTR30FScrUmjlwE9bi+rbSF5k+Qv3naLvEQ
	2Q08KJjGvVt/gZxwv9/vMzVM7ffI/RH4IWT0LiAO3W4/HpyMWdzc7ugQ4Qk0DvRR
	+8ckFA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr89sv14r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 10:30:47 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ae1d132d52so1747946a91.0
        for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 02:30:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793874647; x=1794479447; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g4eh26VIvLph9rixscA5Qk9+BXI22FApx034GLz9Kzo=;
        b=iaFFcR1Vk8m+zKODmIzMhEgra52DEYtUr+SJsMQPvhXcDaxu8Eiau6WLq6yn6RCu/5
         7eCwNYzNqQzmgDNHK3bdffm9QRqPdf4SPVHbWOyPvNK5W/q/GDj3VoScrf48SB5CTycc
         5ttQwioQ6kztqb5nnfj956Vgjf4IGd4X0qLUL89knBtw12P+kONF9TTmDL7iUEyySR85
         Ym/UA3xKRnV2xOHzOFaxMdnhSvnPw1+rjVOn2rULFPLSztM7etUvGxZKg0+FwPr2vsMO
         qgl2Qs/yQ7SUpKLoy4Z0OuZntWBo5EdRxyOdvNlUl/tfEODQK3GTgF3S8cznK/ZhtP3g
         SesQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793874647; x=1794479447;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g4eh26VIvLph9rixscA5Qk9+BXI22FApx034GLz9Kzo=;
        b=rS4zGmFVIXF3LO89X4dAnGiXSBqaDyfcib9ddPWqFcsLNK8PAhuVSPRIFZNb51PlLb
         v5gjaEnmZrJ0kdCaX8LLpXTHe3kMx8d96WBKiHdvxGCBWn29kEpenn4nSjEpQkDiJog/
         uKlwT0IvLORZV6/KbXV5H1nPMw2GQBk6Je5Mcz+0OLPpAYRueMZ3PGrNo85CiCSPMik5
         6u6n44/eNaeTeDC8+dObh7bytjidGY+zBlUZbqskKn/OlFYNIqWIa8R5amZZzqsQCpxc
         vyIOLGiJXjRJ0mP0B16JQLyKrotJBf1+9K0U34kqH2ikyBl60RG2izhCMCqm61fblUd0
         tXPg==
X-Forwarded-Encrypted: i=1; AKwUvBzClobT01XD1NQHZ1P4ICREw5g2/UH3S+zu4EtiUhZKMM1k6OLodz8L28LocyGKOGLjQEri6SsKWb8e@vger.kernel.org
X-Gm-Message-State: APuU4Z/oLj4Wrdf82HR2o/uzSR0mJbv5V2jFVpWri8dtM2mnQT8zlq+y
	NossGTLko2jt9xTKCbv3/M9rX8VvYZVzSSQxsXiSN4lGWXmPHBq+FRv8ZR8ILxbuZ57z+9G9P5i
	2Wvz9D9CP5uWqTLywo9t/SZnhi1lKRfjYSlX8gKs1M+0h5LdOQujbPZN9BCHyNYH5
X-Gm-Gg: AYBFou3JoxhQ87bfEY1rPvmALEDmLgWx9xM9w3vOGKKAUlcmYijQaPfggW6+IiVpyWU
	Kt7fxK1TzZmSgpDB7K5P/wcQMT+o2bcCpambf8H4SnhBdDKcKAw7DCJLd57V1o+pi5vN7zEb/pK
	Zsng5SRdhmZSw++d+4yFn6CFKPH19XT7wF8OIfOOJaGO/F8mtH64GrjITFXFYns3QO3JN+w8VGL
	w7EWXvO5m6FavXEVoENx06cvtUFcApBe3hT0ppjyMnFSQWHSWcNtfAkYCY5H4b04cB5QYE+BfJO
	fsJfJ+fmbYfC8vb9iiM2emLC75yy4FlK51W7UcYfY1n9l323vo43KkPcRqGDLnSNv5KplKQfXTy
	x/JVyl8OnBl+j0WJA615qecgCD4TtEJXant1t8jM9YLideVr9mICxUQK3Eo9oFFf3y0Or1wektg
	UvxLXRwA==
X-Received: by 2002:a17:90b:4d01:b0:3a7:cffb:8b96 with SMTP id 98e67ed59e1d1-3ae8970ef3fmr15692686a91.18.1793874646670;
        Thu, 05 Nov 2026 02:30:46 -0800 (PST)
X-Received: by 2002:a17:90b:4d01:b0:3a7:cffb:8b96 with SMTP id 98e67ed59e1d1-3ae8970ef3fmr15692668a91.18.1793874646235;
        Thu, 05 Nov 2026 02:30:46 -0800 (PST)
Received: from [10.217.241.50] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b31cd6c0sm3232520a91.13.2026.11.05.02.30.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 02:30:45 -0800 (PST)
Message-ID: <2b5c5216-40d6-41e1-b79a-76c56c702348@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 16:00:40 +0530
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
Subject: Re: [PATCH v3 1/3] dt-bindings: arm: qcom: Add Talos Lyra EVK board
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Ruchira Revdekar <ruchira.revdekar@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261027-talos-lyra-evk-v2-v3-0-658fd5a7ec99@oss.qualcomm.com>
 <20261027-talos-lyra-evk-v2-v3-1-658fd5a7ec99@oss.qualcomm.com>
 <20261027-whimsical-russet-marmoset-f248ba@quoll>
Content-Language: en-US
From: "Avaneesh Kumar Dwivedi (avani)" <avaneesh.dwivedi@oss.qualcomm.com>
In-Reply-To: <20261027-whimsical-russet-marmoset-f248ba@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: SH_I5hS5fzkYZPZsLCVztDO3G8sS6EGa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA0MSBTYWx0ZWRfX6rPcMU1CX9e8
 98NMMJxj1pxWftOl4Ef4Zn9lxJ0FZje6TX48wJE2wlGn8lgBKEN+gsb33nTJo5fjLoT4yTKnnn7
 lWTQa1IpQ9N3OC2eOAhkHr2IKqoEddfmDf+K7a/2PKrt3SyWglSacViMzZmVAkavKwUokj1x8dU
 LeEI6mbnhPZlh7JCmF0tGiM6KnUTIGn68QYox6egHnrZtz8DpF2gD+yzYTzHH55MsZ7mxCx5G//
 TQOMo0s86Pwk95KUXp21J/fQrFWCD5t1MGdAC4Ji/ntQLj4pLwTL4wHZHMg8MfibveWxroa53C/
 KYVESdaHGCJKtOA/YhlzaDDbT1mPMQAbyX2irAJyZWUBk+US8rcq8/YMAkHODYnFGqvKBholO96
 zfBjHAAcIP1q80+NsWLrCfqhlJ9neh7OCeGai0AbuPdyQDTXg5qCCtg3xQZN3svntjkfb2RDR2j
 bEmCfTYt8ubckAHAX5w==
X-Authority-Analysis: v=2.4 cv=N628hG9B c=1 sm=1 tr=0 ts=6aec5ad7 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=OzfGJC1uvw-XEFatyoQA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: SH_I5hS5fzkYZPZsLCVztDO3G8sS6EGa
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA0MSBTYWx0ZWRfX0Ra1aAs6XhHT
 VebvTUMuG9t0q8ixXgN7olnYMpQV8kCfn3z2QWwmSfnQjEyWML5f0oSw1hLLRDtnU07ophniiGL
 zxKbUSG3jH1Pc2NOHsIRfPzVbpA5i38=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 adultscore=0 clxscore=1015
 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050041

Re sending as earlier reply was rejected due to HTML formatting.

On 10/28/2026 12:11 AM, Krzysztof Kozlowski wrote:
> On Tue, Oct 27, 2026 at 05:01:55PM +0530, Ruchira Revdekar wrote:
>> From: Avaneesh Kumar Dwivedi <avaneesh.dwivedi@oss.qualcomm.com>
>>
>> Add the qcom,talos-lyra-evk compatible string for the Talos Lyra EVK
>> board. The Talos Lyra EVK pairs the Talos Lyra SoM with a carrier board.
>> The SoM uses the same QCS615/SM6150 SoC as the existing Talos EVK, so
>> qcom,talos-lyra-evk is grouped under the existing talos-evk block rather
>> than introducing a SoM-specific compatible.
> I do not understand this logic at all. Usage of same SoC has nothing to
> do with having or not having SoM compatible. Every SoM uses same
> compatible as some other device, so we should drop all SoM-compatibles
> in the future?.

Thank you Krzysztof for your review comments, and you are right. Sharing 
same soc (QCS615/SM6150) can not be the reason to omit a SoM compatible.

v3 commit was misleading suggesting that this was the reason for change, 
will fix it.

>
> So if you have a SoM then it can be used with different boards, thus it
> should have its own compatible.

In v1 patch, the EVK root compatible list also included Lyra SoM 
compatible. And as per earlier review comment that there is no value in 
EVK claiming compatibility with SoM, we removed SoM compatible from EVK 
compatible chain and added qcom, talos-lyra-evk directly to existing 
QCS615/SM6150 group.

If there is no value in EVK claiming compatibility with SoM, then is it 
fine that i do not have a fallback SoM compatible in Talos Lyra EVK root 
compatible list while I retain qcom, talos-lyra-som compatible for SoM 
itself?

>
> Again, explain properly the hardware if this is the chosen design.

H/w toplogy wise Lyra is reusable SoM containing SoC and module specific 
components. The Talos Lyra EVK consist of this Talos Lyra SoM plugged 
into Talos Lyra carrier board. But The Talos Lyra SoM can be used 
independently with different carrier board.

We will take care of above things in new patch.

>
> Best regards,
> Krzysztof
