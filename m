Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 594A73803CC
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 05:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782710934; cv=none; b=DTsKbDEe3ZalNP95HjB97aPM04ZtnJzg8dYGIYyspSp0Sqbl36DBqy7moh4E4s1iQGKddlI50gCDqcLCGRdnNx17b0TWqDMn2i/YVrSZzv+QM2mxEEhQiJWqDbpXkbSC6tCoEWWaG7i9WWITUp6qPD0ty3ihdxOA6lrp9wVsxMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782710934; c=relaxed/simple;
	bh=i/ns2A9bAE0EmLPTO/wzo67pfSla/PTMykDg6NWWMV8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p0FOm+98Vnj+uYvkCNgU1ZBYrHCvkE2VSdsbCtggqXA1RLd7hjaKyfBb8NObkD9fflJLu6ozL22r5dNJjcsGS7CfaDYz/LOZjhL6zrEwnG/eTW+f8ZXQ0JSGpZAoyP6dEo9AfUDLxsqgpVYF3iDwX9j/D/XxjKMeylmnS1BNHOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Vu4yylak; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Jj8Y3ENT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Vu4yylak";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Jj8Y3ENT"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T4NHj61737504
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 05:28:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aYdUEeJcaNzG8VXD+Xvkckg03RgLqhj0sXz+olIF58k=; b=Vu4yylakj4YLfU+W
	4cIpQpNvDoqCWpnmBGyUF9qgWxRzFIWLueIn4Cc/D9fpzHH1Y+0e3QCTN6RK0Yjq
	zEgCa2qCE8VYa399s6DrV1fATh7Xx9dmCUcWd4mwTpTp6ZbtJeOh7EzHOzSFsQ2U
	GhYCdbZ7ZaAVewEGSmbPNXcKEOktK7Jz3KMs8c++40zY2wu1a/fDTiXfx1cPcLeo
	ycMR5rkwvixzwVm3MpA+hZ9EWgN2Jbla/KrqE6OtYHkaTUKC8ajsad9cSQa0Xx5o
	zcswG0arSadBZGC3Vq7Jf4zSLSFL0Qn9Yuf7wGnj7vooGya93dzNY5hNQE7rjXJn
	XwbAmA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f279cmhju-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 05:28:51 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-847950bb95cso10910b3a.1
        for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 22:28:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782710931; x=1783315731; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aYdUEeJcaNzG8VXD+Xvkckg03RgLqhj0sXz+olIF58k=;
        b=Jj8Y3ENTXKHCsofnFFjdRcnbLnBEng60wy9GS1OZqqXj6xLn6vdi78EoN8+RWIwOnp
         pRU/+qqbBWjnKO2rTn+EIr8eofqsliqNR/0SffeAdojVlwvt6GSvKP2oirpLKv81vAoV
         obF2NjKZTO13CnP6/TWm94FWkUMcee9m8Pbrv5iWbpI6zWZrOIk+J83uaUV5iRSVsMFY
         3MuP2lGHDanOdvme7mdF6F50vnYXjFUE8y1Axv+oxV63dMrLDGDiI7rLT9lpbJGsqo6b
         kQp22xX6KKchWwBOhySHOIenZ7IoOqefsn6B+cbu3cFhIPD6biKq6y/BpV18m+/LHH+I
         ck9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782710931; x=1783315731;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aYdUEeJcaNzG8VXD+Xvkckg03RgLqhj0sXz+olIF58k=;
        b=gDUY5uuhsv91zkonDbQ0OVpZrE0X4hXqZtgyxT5PRIQYCG85IKqa2YquEqwHw+MLCp
         LAQYz4rU18DQhgQRi8OfUBQNPFWsw00N/60A6j9zJrLeF51sDXalSDidLGSzukJ1dtPR
         O3jrfDxYiz/OkH5u01SZboUJ6Z8sRsB1rVj/SKvH3Jlmd14oaLuNUWCxuDAiTmOvvP8U
         VKp0KRpjaGaNdjzOA08XivXfJVHOqW2JNFyW/Xq/gx4mqIeWIIVbOX9yqIiNK2Y3SerN
         D879BI+s1d1TfmWocqTzcyYl7ijyPM9HOI41sFKUn9f2lj+8mMz0dpzvvcZY48ZD6u/q
         +58g==
X-Forwarded-Encrypted: i=1; AHgh+RqptGdNJbSvFeYRr0eJY3XQeBp66usjWoKx1f4cXlLs3O9dl6GvvCgGb/hnxfTVs/R9fMkBTwTeo65R@vger.kernel.org
X-Gm-Message-State: AOJu0Ywk3tHIwlSk1SCuSpKs2f8eE7ZlxFQ2Q1qxtM7+lL/ojbE+s51g
	kNndbFIX+6yg0pmQNneZKhW8j7vVyiZReKitJQR63jMUPDexcUB+++il88Kxf4nx/Sv40zLfTdH
	7Lq4whqpUqLvWNUdIEVf94fIiU5UVp5ivRGqLIKRC+xG/LCVbX2bNGET7J1rcC6uN
X-Gm-Gg: AfdE7clheB+JfUebJEOjybEGq6ndcWQ3OmhoMhHy4Xj05IWSNOxWxcmVOug41A5dXWG
	MFoPnPpjdUvZt5uwUgXtgoWZSIon5Qo+i2TTNjF0inXjM4fU3cNSjJH1cFmj0rAy//VjSwtC7gj
	UShdYTAjFKFsY2fD9WdRa+aGJk7a7bG8o3uDyFJYjhEIq7kUfnYkRKw5MoWGP6R/YZNVSuuO2YN
	SveGIg3P2kZxU2WHFe4fKCYrqwXvFREekSIfhxuhCIV8FOjkrMjGT2ARNe8g/YT0g5e6+3Rg4Do
	YtjRJv8tpjfwuWg7QpF8QLLDvSRAR9lHT9Y+Qn628y4kYa6GjyGjc7bnfkBGBejvwKRsv+gzKzs
	27fxxB1IGohw+5H8rAVtxtXV1D5n2lkHFJUHWH8wCMK3WDuDrdA==
X-Received: by 2002:a05:6a00:14ca:b0:82f:38df:681c with SMTP id d2e1a72fcca58-845b39a28demr15665502b3a.6.1782710930889;
        Sun, 28 Jun 2026 22:28:50 -0700 (PDT)
X-Received: by 2002:a05:6a00:14ca:b0:82f:38df:681c with SMTP id d2e1a72fcca58-845b39a28demr15665489b3a.6.1782710930457;
        Sun, 28 Jun 2026 22:28:50 -0700 (PDT)
Received: from [10.218.21.154] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-845a3fcc5ffsm10886817b3a.9.2026.06.28.22.28.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Jun 2026 22:28:50 -0700 (PDT)
Message-ID: <6761522a-5de3-4b4c-aa2a-90985031677f@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 10:58:45 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 5/8] arm64: dts: qcom: shikra-cqm-evk: Enable sound
 card support
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260616201315.2565115-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20260616201315.2565115-6-mohammad.rafi.shaik@oss.qualcomm.com>
 <979bff6c-86c8-4192-bb38-4e43e57e8834@kernel.org>
Content-Language: en-US
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
In-Reply-To: <979bff6c-86c8-4192-bb38-4e43e57e8834@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=evzvCIpX c=1 sm=1 tr=0 ts=6a420293 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=dV9RIOcyXjINfkMfKl8A:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA0NCBTYWx0ZWRfX9lqexbB6xrCX
 PNxP5BmYMziBqpXwpbZnpKozd0TvklPMiF5Lrw1QNeFJF+gUxxIU+ly7Vx3rxWsadhwbQEdis3a
 R4kGShyvX2kmwTStG1rVj4RvC91T8qI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA0NCBTYWx0ZWRfXyMRYAnh6HGhE
 dLgoVwwJcNjyrhItpLzp4Yzx+XdpOJdiLoxONiXP60bKKdHIHDBeMIDwxT3pBiGwAwjyx9Q0erL
 yWYV1+PlVPzUwgSSuKTxwiX3GS8JZht3jLy7dV8p7NADl9lb/kjGU0TnmJGBdQJLHrQAKZpErKP
 eKdjvxA6UO5sOaZY1Nws+M+TTNzj1rxSgkg0OcfUMTta21gHhICBr3jqRNDKwr9zxe8F1sDTRTE
 hP5qqSi3MMGLpCjj78q37bPh3IG+SQ9DHBVT1LCNy4W6LkjelmSlsLRCprJX8BC6CxliskTPkNI
 b37neTiH1qmWABchew688/Ymnx/8WvRr55DxZbkkjvFaFYebLCKTSsDPY3RAaSwVXedH9lXpX9D
 IS5n3J2snRjto06hTRAkwrOa1O9Y0q9nXBT6f9bJ2CHH/rLfl/g+Rg26NT38na19tCsQVgUJYJ/
 TiQEJkW9hYnB9Ro9J1g==
X-Proofpoint-GUID: auwtGtyM_NgAP1Lot-o9Jyw6HKpwxtox
X-Proofpoint-ORIG-GUID: auwtGtyM_NgAP1Lot-o9Jyw6HKpwxtox
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 priorityscore=1501 spamscore=0 adultscore=0
 malwarescore=0 impostorscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290044



On 6/22/2026 7:16 PM, Krzysztof Kozlowski wrote:
> On 16/06/2026 22:13, Mohammad Rafi Shaik wrote:
>> +
>>   	wcn3988-pmu {
>>   		compatible = "qcom,wcn3988-pmu";
>>   
>> @@ -60,6 +129,79 @@ vreg_pmu_ch1: ldo4 {
>>   	};
>>   };
>>   
>> +&gpr {
>> +	status = "disabled";
>> +};
>> +
>> +&i2c3 {
>> +	status = "okay";
>> +
>> +	wsa885x_i2c: speaker@c {
>> +		compatible = "qcom,wsa885x-i2c";
> 
> This was EXPLICITLY NAKED as in disagreed.
> 
> When you receive a NAK for a binding, you cannot send a DTS six days
> later having that wrong compatible.
> 

Sorry about this. I will wait until the compatible is agreed upon in the 
driver patchset.

Thanks & Regards,
Rafi.
> 
> Best regards,
> Krzysztof

