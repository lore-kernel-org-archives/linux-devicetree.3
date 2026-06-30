Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC6743E275E
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 09:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782813167; cv=none; b=YYqiAktqyrwp++uJMdJdxmosjBtprmD5qyVKLOHtq0JEDd6rb6uQqENuFU9B56fqxI9GD/YGsto3QrWIr0jfStMZYhK5zDuat2hQ5662DPkndW4+Kqi3umasdXee1qsA1kXiZn441IGVl1t959upCLzB7yYy/+ggaA5qDMo//Sk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782813167; c=relaxed/simple;
	bh=XHVFIYZdq7kDCqEYfKMHnS6JrUs1jlCfBepzpNlvLB8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P+C5B53E5j32f0Hr1kg5RgZLhklsgvAYParw0Rfjl8tTLNo5/SqW1UJm/oRketHJUlgHdyeNCD9xxrzNxOjzHUly6CnEsxqYOkkHi01+0vfUfd8KoUqQAaR+LF3znfAqyNBujv8k8/eUZncW5o7+Qd7lZfw/3iG1ClCAtrbAt24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fAdX0uey; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UJy2OeSR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fAdX0uey";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UJy2OeSR"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U9n1rE1573374
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 09:52:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hIHyDpjCFFNejxG5BaRizE1VIsC5hN9kk7je03IArLU=; b=fAdX0ueyfz13bzn2
	6yUJ3bg0/TouZE/4rHKQOVX2Ue+EOxMrSi4XgEC1Qy4+zKrjGIx7ZCts8OUIyc3E
	jR+fZbFLWAYzhxFQRoH8fW/kb4Ou1xFEaqQhXx7NHbZD1C4bCokGUTu3PUcY8KtQ
	AI7BFXAD2Ih0xxfAmWD0RuEUoFxtodj8bXnO7pWHIZO5kFAxTzqhgXLml2J52J7X
	yjJdPCD9aesd3moPDJxk7QAlWZrdNgeaCWFZKV15bBRDLv/5pf9I+QFzbMXe9tGl
	LPdKFqZcft94PafF+ZL45I0xhw4IJpMAfXLtAVqpcs8Rj5lZj0q+ohihB2+c1tHV
	U8o6sg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f46861h1y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 09:52:44 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c889d1eebafso5242958a12.0
        for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 02:52:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782813159; x=1783417959; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hIHyDpjCFFNejxG5BaRizE1VIsC5hN9kk7je03IArLU=;
        b=UJy2OeSRRefYF5XXlUjN09KBQ0ZQ7e4W09Ij6EGfMoM0LAeQ7OzzNtRD3Jgef9ioza
         Q9xJ/e/8qKF2ngz8TddSAFCUG9h55MV/lbvSSe+9tyXD8zKd7IkD5czELgTlgYw7ymRB
         WuJKVFKt0wNGSaFZB9cQz9KmU1bxhzlfeIrWWcpDFuuJTPlyTd20JRv9x1EX0c7pWhHT
         yrl/xoHWwMxFU29Rb4qXBqzA8fbyo14vRZbvWjUCZg0Tr/sYoc5EcK39siECJv7yRmKH
         3gUQ4frJpv3T+9Rp9THpWuZtc/Nb6H9JFkNByPF57XE/yNjh29C4FbEYXP/ECGWzUpxi
         50eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782813159; x=1783417959;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hIHyDpjCFFNejxG5BaRizE1VIsC5hN9kk7je03IArLU=;
        b=H6EFhcL18WbqC4m5TCF3eY38mDIMgSyicKlCzW+BIJO4hNdi2pl83hGIXBFMa3Y8df
         hqtHqGPW/vB1yiW+5vz82Tgom1NQQ0QCremZp7YWJChiPH55Oekb8hXJWewFkxymeIe9
         M5fKjQQDjwNecg/NOT9cUfeNVGPXWSDOkmoDFB+tPa0dhiKpJygmOkVRbYnx4OB9mSEQ
         h0t5b4qHbFXI1ZJzWHzPd7TP/Fz2YVagaZ6rZHIVOJZfy4d6FybqrIqM7Ba951b2Mkhu
         uw20vT/K1DVrs57UzCgt5m05s1IfRXFf9PYgn7cIYx/0fbQ+RZv00IjXbd5oe6TvPktZ
         xLRw==
X-Forwarded-Encrypted: i=1; AFNElJ+oed3MuwZ6g6BQSH/at440JkqJTSPHT4Zdq7SafU5dWx9E548h60x9WcL845OP5JXTfH/SkGAxCjuo@vger.kernel.org
X-Gm-Message-State: AOJu0YwozX59f79PLhlp85tIhhSGBz4ab1cEpjmHJhEtAuowNJBpxqs7
	6Qw5ijTnYsAKS/JYrwTesnyai8hNvzMIO7+283S82t0VpcdY1c+MGRiB3Y476ZRTRmtOM6iDYLw
	pK+kagRzanBpDiDuLbmfN2l071TIBiOv8Us8ZQc/g5fSSu9K/T0ujdQQgtdqjCna7
X-Gm-Gg: AfdE7ck+oM4avP4m6pgHoqWjSZ3mLBeSK0FTCb108yumPPGH23qd3JVKwJDvLj5C9k2
	wjN+PyKuc6DaZwiXv1eymcdiEkj9sM9j6Q2JcgeAInJ/d51IQz0cUM+iKq3bGSnMciRssJPERIE
	6wLi5lcy3h093khLMpxAXovoWjjXfnLuOb2Fa1gZ2rb4dC47HXrK5wMmuamBw5eM0AIBMBQOAmt
	HmzXsaln7NwXN5ULRjcwdOO6PBJzVop402OkkLKCihvnVAiAEQIXTBFGzfazzpemPWDWxhHzFdT
	WZCBi8y9QzGF7sV/2XtqclKITNvTy25FOY8RgyK55obJMdWIr83BNJVyhB2MHggFMFNSBXIe/dS
	sntHNdrkUqmJKmIA65k+0GWjngls7oFmlNfirZhIXvz3h
X-Received: by 2002:a05:6a20:914f:b0:3af:6704:18ca with SMTP id adf61e73a8af0-3bfc527279fmr2374630637.35.1782813159140;
        Tue, 30 Jun 2026 02:52:39 -0700 (PDT)
X-Received: by 2002:a05:6a20:914f:b0:3af:6704:18ca with SMTP id adf61e73a8af0-3bfc527279fmr2374608637.35.1782813158642;
        Tue, 30 Jun 2026 02:52:38 -0700 (PDT)
Received: from [10.217.219.87] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847a03778basm1562456b3a.49.2026.06.30.02.52.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 02:52:38 -0700 (PDT)
Message-ID: <99eaf1d1-fbf9-4336-a13c-ae8ab789cc99@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 15:22:32 +0530
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
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <CAH2e8h75xeRVvo+jOjRuFaBko5NNCnBX0dawFFsWBaiTwNd4Xw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: asbOrHASPeZYfggrdNNg0y6N6gLWWmEJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDA4OCBTYWx0ZWRfX602VU6miMdRw
 OninETaltGfvTi9YPqylHbwrrZ97yJgTi/7VTfR5cf2bSR/kMJ032+jsL18X0T/q4wUPsX6nnFT
 jY1HXvvhz3lEJFjIO9VCOoRtOP2F6npx9XzBCQ1naz+8RFnPvxaLymTRI2vrtRGGfbY30zvfVJy
 2dALaGOHymMdQD+kxXa6DeFVwPvkXXhbzivOLWI7wCdLDyEUDy4cFONSxTXglVfVhM5hPYDGmhV
 s0pp/A4ELzlbM/qD0OPaLUUuJqBOxOuGPV0s2CDmGm4UszK1hrQ+kQScmtD24wGG4z9Yi2LHy0m
 CO+kZEqn7XI1e+xF7QDW/fw6K22WgGxN2uADqoVQmoBZHq8jGv1D2Fud1nG5oCY5YzX4hn/QKnL
 36/DuqX5C+2EQYPd1q1lPcnSG8Gckw+IE+D3kPs9demy/li++gtEZYO5l3NUXA0Z+mcWz8tI+P7
 TC05FnpzN7mPxAvuJaw==
X-Proofpoint-GUID: asbOrHASPeZYfggrdNNg0y6N6gLWWmEJ
X-Authority-Analysis: v=2.4 cv=FbcHAp+6 c=1 sm=1 tr=0 ts=6a4391ec cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=j4H7mO88qUtPRE6yNQoA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDA4OCBTYWx0ZWRfXy+aKjNIU3DQ7
 x1jsGEBac9jS5l1D/4kwkVmhlgTp+icAgaEMLN7GqoKQJesIRHC/f61IHbuhhCEFRcZ7LTDlAdc
 121XBy0+eAodmBvDLen8PZUdASSkYZY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 bulkscore=0 adultscore=0 phishscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300088



On 6/29/2026 1:33 PM, Pengyu Luo wrote:
> On Mon, Jun 29, 2026 at 1:36 PM Mukesh Savaliya
> <mukesh.savaliya@oss.qualcomm.com> wrote:
>>
>> Hi Pengyu,
>>
>> On 6/15/2026 2:48 AM, Dmitry Baryshkov wrote:
>>> On Sun, Jun 14, 2026 at 04:34:24PM +0800, Pengyu Luo wrote:
>>>> Some devices (such as gaokun3) do not disable FIFO mode, causing the
>>>> driver to fallback to FIFO mode by default. However, these platforms
>>>> also support GSI mode, which is highly preferred for certain
>>>> peripherals like SPI touchscreens to improve performance.
>>>>
>>>> Introduce the "qcom,force-gsi-mode" device property to hint and force
>>>> the controller into GSI mode during initialization.
>> Why to force ? You can directly configure in GSI mode. Note there are
>> some configuration done prior to Linux bootup too.
> 
> Sorry, I don't get it. how? I know there may be a qupfw, but it is
> impossible for a normal user like me to generate one with GSI
> preferred.
> 
If firmware doesn't program in GSI, you can't have this working in GSI 
mode, its going to fail (and work with fallback). if it's programmed in 
GSI, anyway this will run in GSI mode. So why to add extra things 
without any usage ?

> Best wishes,
> Pengyu
> 
>>>
>>> Ideally, this should be decided by the SPI controller based on the
>>> requirements. Another option would be to prefer GSI for all transfers if
>>> it is available, ignoring the FIFO even if it is not disabled.
>>>
>> Yes, it should be decided in advance and configured accordingly for GSI
>> vs non GSI mode. Because there would be limited set of GSI pipes, which
>> will actually make must have GSI mode device run with FIFO mode.
>>
>> Why don't you decide prior and configure for GSI mode ? We don't need to
>> change the current logic of deciding FIFO vs GSI.
>>>>
>>>> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
>>>> ---
>>>>    drivers/spi/spi-geni-qcom.c | 7 +++++++
>>>>    1 file changed, 7 insertions(+)
>>>>
>>>
>>

