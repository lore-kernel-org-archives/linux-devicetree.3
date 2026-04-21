Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E8CA35979
	for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 06:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776753680; cv=none; b=IIjfKOYxk3hgFf7z436hZ2JfqAY/bOnTKxaFxUr4gF/ZPj9/WECpY8t+BfEwRg7tAsl59C4fZGC+tL4dpsZQUvKUl8mGHNN/I12ZJTrX0S2FrhZhXZY5XNL5mKIxr3G6GmlyQlIAqWSwee0JgQqQl1EuLb6AqJjUS02c0eBilaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776753680; c=relaxed/simple;
	bh=PlNAEK2MREKPKi+CUNE87aVBIoieZmPQ2s/p2webbR4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FvDUkEI1xyGGFI04sJNCIRvpCgIKtnfRa3azBTb5Ke+0cIQeFw8EBQSxvV9ORv837rcsEysuHqXmEPzhEkmk8aWE/0mmJSJBY2k5egPu2M0gHEG7U/u0Y+1y4Q5CcJYWDd/RDz/dvcDnQjNRbXTE0mtj/FUKjLs6y9DYz34o3l8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ReAmCie4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W8mCDWH1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ReAmCie4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W8mCDWH1"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63L1po1T2755827
	for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 06:41:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5aSPEr1jMglDPSkMIfvoub1Dfs4pzrG5Kt/zN9avIW0=; b=ReAmCie4h5iLL+NH
	Pc5vedg1a2P0YBZHbqCNk715m0TG6Av7aoIvks6QkcxYe613fTh2kNsuZiY5LtRY
	sllneh2QJRVbMkbvQ6ZWWxh8EHr3wW6pIti3BT4R4GitV/FDD9lRaT9XxhRC44/U
	EcJ/UN8+vipMm5uCuYTsLfE2EgjIR/3EanEWh7UDvqjKXj1rsq3DaxpvN96w/UkX
	9AlRQHxhYLF9+qY0EscnY1narDJ9BVyiyDQAOFcUBWgT1PXiodu+YwGiXDkPfD6/
	Ur0kqARUXwiRji4KvD9sEdb17eA3kDwvQ4UHPGgICA89GcTwQAomUp4Q7R+W09tE
	GdCDow==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnh7xm4pu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 06:41:18 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b4b81c632so89954361cf.1
        for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 23:41:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776753677; x=1777358477; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=5aSPEr1jMglDPSkMIfvoub1Dfs4pzrG5Kt/zN9avIW0=;
        b=W8mCDWH1vsP9nr+8ebdge3nbJakupYKUO3eaOQuQsSC2tOv+9CrK2kPCvd42OUATzK
         XYRWU4APv9XFpuhfhKpO2GVMcpHv/3IxIiP4HLuHZQshsW/filS662MGjfeTCro4Euby
         4424W+JUgcsYyYRqKaro5DDru3TFbNjy3msMTZkgbj3VK6dFZ/lgHQIf9NHR3Ou63nry
         axvWVjaAavykpBjdI1ciFh1lfSZf4Cfh5xOhzMVar+XC9ad1D1MbAMGImeCLrJJqH5RM
         4Iq9z+GXA5m8f8LnKLhhdcrz4ttM0nKWb4H7Y8XdG3PNKjhuoydi4bOID8hRs/Yvaqbf
         BJCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776753677; x=1777358477;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5aSPEr1jMglDPSkMIfvoub1Dfs4pzrG5Kt/zN9avIW0=;
        b=G45WgcfDnGtgrxuPjOlgA6nwWk/vb8jcoGMzYT+c/WuhJcbYLV4ja/bHpsTcdjXslb
         3wg0U7SqsC27feaq4bPSEXS7frjkdqSymabGrM4Q14BCfxFCS2V/JuCF0GtfnNedZSie
         7n9Nxql5yjWgOAMPb2wqFNgwzSnv6na4tc+OMdOJmWab+i7KU5fgzGrXd2RQtNmA5GV8
         Ytwf4SIAYa1+rk0mfhq9c1J9FoPEZ9IDMhjvtgWGsVFMGtLxa4kwu5Rqon/9LkxoQTSZ
         u0MvwGJteyMOamB3otdBfLM3PvRjMe0O3T+M7LvqJuGBChq9scXFDBhCWdB851SqUDy0
         kRhA==
X-Forwarded-Encrypted: i=1; AFNElJ/ryTYAyGyqwV/QmxfE84lbg3NdulOGQLeiyKtTj+VbfcWu96oaAlxR1lSxK/YZi6e2x43NBLmuAEfJ@vger.kernel.org
X-Gm-Message-State: AOJu0YxdPXjGYXnKsrMVjzxNJqa1gAcOkqSe4jmr8l9ftcHoM5MgI4Ua
	rHS0JUWZBkPPZlOvsMdQJ38C5Yu+6qOkpONkHteHAoS2S32qgZ7c3BUlfNtLIFnhs1k+n9OGY01
	tvGuockhmepMwFobX2e1tTH30meZ2sw6HHNDRx0fn2jUrLEoUnI1S95058hsJ7oB+
X-Gm-Gg: AeBDieuXtO2fvmFDtgx0Ct6c1LnxpHWWbBnQo+4SqtNSaFz37gtxzB+oPiZ0ei1ZP9j
	YO760lEI8YAwk6iqNiwqfC9D8ylbL7Kdr4Q246rPieg49I/PYFFsBfXWtlRdwe5P+Q9w6f3sWU6
	BSEXX6P7aQUBSvpYY0zDqnVEDLUIFgyH3M0IExYgmUR11awKlubv2Rq+iMhzITMpzf2NhhC06Vf
	+rLzJuVJAyllLmBXGxHhIT6UugzgkPMV6gOoi468c6mVvVpd6fYKeC8kj3KsFX+oCjx9PKGRTsG
	qQcQBZB42XtMIBo2DKwomI3sBqeBBRCfENjuyS1uQ72nz0TXNI76gvCkRSbR6nSQuoNXvI5oY/K
	v0ARCUrkV6ZKNMmHzVj94EU2NdCZTlsbN3l2LkWcQVtjL8ItRSI/h1ZRd6Yc=
X-Received: by 2002:a05:622a:1113:b0:50f:b17d:7e57 with SMTP id d75a77b69052e-50fb17d80e4mr30180381cf.24.1776753677571;
        Mon, 20 Apr 2026 23:41:17 -0700 (PDT)
X-Received: by 2002:a05:622a:1113:b0:50f:b17d:7e57 with SMTP id d75a77b69052e-50fb17d80e4mr30180101cf.24.1776753677157;
        Mon, 20 Apr 2026 23:41:17 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4891cca5743sm135449345e9.9.2026.04.20.23.41.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Apr 2026 23:41:16 -0700 (PDT)
Message-ID: <b0ec6352-164c-4492-a0c1-b29a07e5e7e5@oss.qualcomm.com>
Date: Tue, 21 Apr 2026 08:41:14 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: glymur: Drop fake PCIe phy 3B
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260420133616.88740-2-krzysztof.kozlowski@oss.qualcomm.com>
 <bgcrs7ijonskkobvidzoldixqy5ctmvp3hdzntsvfpj4wvjfgq@inlchk3nhogy>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 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
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <bgcrs7ijonskkobvidzoldixqy5ctmvp3hdzntsvfpj4wvjfgq@inlchk3nhogy>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIxMDA2NCBTYWx0ZWRfXwIybrK1dYmQ7
 B3R8qPAD/UC6DpGFL+lh5pVd/CV1lo2ztcq7SY5IFnyT7V0gxaHHun2VMiWSo+WbS6b1EJcVMcU
 yWG/v23JRE/S/COUVEw0uHIHxgUyQ+pU0Q1kKLqeEmYszB63JLgWGPPjx2rg8jHxgm18Q4YVmZ1
 rMKLCK84vdTCpPmabStwIOIPuh3mWfQ/aakSofgY1Qeis6SjzzdbjCz7ak43hyVwNTGW0deqh1r
 lCh0IFH1QmQOox68Mv40BirCIgPmaGh265G4Ddgq6Iu/RTSldSOlsgwhQPTKFGEqRKEF2pmi0As
 +2NW/2AZnKDytuBkC/1sBRNNIquTZKi9c3neKtbtmqKJpT3dNgiO4e0TJSSL5ebyUNDxr1TYU8W
 F+QkXuOg9RGf4qhyHGXDQOrt7H7UZeBjseb2gw1jfxbFDyrt8apYQbGtl7jZ95E5u8XEOm8xsCy
 dV9GFGo6ER85djaENRQ==
X-Authority-Analysis: v=2.4 cv=BPmDalQG c=1 sm=1 tr=0 ts=69e71c0e cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=iykdOGEOP-tOZIlZroMA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: UdsTesA9KJxjbPe9NqUaMlSggdSWPY9W
X-Proofpoint-GUID: UdsTesA9KJxjbPe9NqUaMlSggdSWPY9W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_01,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0 spamscore=0
 lowpriorityscore=0 impostorscore=0 suspectscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604210064

On 20/04/2026 20:02, Dmitry Baryshkov wrote:
> On Mon, Apr 20, 2026 at 03:36:17PM +0200, Krzysztof Kozlowski wrote:
>> According to user manual / programming guide there is no separate PCIe
>> phy 3A and 3B, but one 8-lane QMP PCIe Gen5 PHY which consists of two
>> 4-lane blocks.  This is also visible in memory map, where the 0xf00000
>> is marked as the main block with additional sub blocks for each 4-lane
>> phys.
>>
>> Describing the sub phys without the rest is not correct from hardware
>> description, even if it works.
> 
> Is this the case for the other bifurcated PHYs?
> 

There's more? Oh damn...

Best regards,
Krzysztof
