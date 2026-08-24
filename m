Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69C0D3ED13E
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 09:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787562681; cv=none; b=l+tWX4oBpyJ0zBnM4A8MvUxFQ9iCwrMy6UW9JQn8zMnZh9DcaN3VJW1JgkxbvyR2ctKkvDZudztji31V8kFxo1elFkVH6xQOMt06eA/VFx8+HGjstLDq6On5MRkxbkfAwpjoAKtNm8Tfz5ORRur5V0Oypr02OlPub5wsFkz6FJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787562681; c=relaxed/simple;
	bh=wiw7AGVlqu9Lcrp2CYxUG/Pe6/zjpMXeDjzPzSeUgQo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dovBE2dpNpYgsTx7YCM4eJn2w9kxFzD2iDx01gF16Qk/6I3+0bnEO8XKMRhf7KKcqe1tt1MeDqf3pNXv+Z3L6vLaazfKEjBa5UZ+PzA0K/gFn7albJsjANJTsMZMiH4XHEaUkrOi+Tos5C6ZTYPwMueyTP5pOgvsmni+LaP8tyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KWBP/0UF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cBruojDF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KWBP/0UF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cBruojDF"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O99Ibp2548490
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 09:11:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sdj/IIFa1G8cJv22IS2RxBEe7lzI0ZkPGsBx8d4NcJg=; b=KWBP/0UFcRqBdNHL
	nSewzdviaQAaBr5RFnDQ2PcmlR4ok5ZoGj9eZQpYGTadeG060xdXtmn9U2v47sp+
	HE/AtOAFd/X7u3Xm7K9BZ/+aOIbMk/MaHtHv4rmNayPosdvKH8cDsvuSGY8jlyLf
	alfPcKeyIi+w1Iav2tZS7lEkgPW6wFH4guieqWGGSirsPH7hZOxdeJgu0r6sUK0/
	yJblmZWKscYwMtgcxxqgu7aiaSrEh43Yebf7pMqOX2VtBSUB3jZ3Ikr+h7b4yRmq
	4Ght9f9YNgE+VsVjv4xs3IA0h4V/bf6jt5LLqHIBYfw4HPlcdlNeZW0NtNBxYQdu
	5fbNPQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g88k7hv1b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 09:11:19 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-382befb9555so793019a91.1
        for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 02:11:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787562679; x=1788167479; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sdj/IIFa1G8cJv22IS2RxBEe7lzI0ZkPGsBx8d4NcJg=;
        b=cBruojDFm7X5FwVxFsGr7ml1zAtD5UKlFIfCmy+2r8P93C+w57dh20B2q94f0rB1dq
         8PX10O1/bdFkRh3btwrXgWYouhKmHEXGlsjI7W7+zcyBYMCQLGyw1OiamfkEFSEoaGMu
         KBSRqBt87N6kgEGOi9UaubZHwbhUqhQrrZoeTKlVXaFvk39vTL9/xLYRnl98BFWLXKbl
         BQfHjvvSkh1X8fF9BpHai29Kpc7UPr87YIxDOzEz98Br6+JXyNclF9r1EvKzGjAYsOvE
         uf210MGs78HbxjHe5ZypazhV4dbbMvrBYoYBLelrMq9UdloZU+k41BKi2Xd/Bx56RCrr
         bsSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787562679; x=1788167479;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sdj/IIFa1G8cJv22IS2RxBEe7lzI0ZkPGsBx8d4NcJg=;
        b=mW/gs68PG9Xkvc0H8DSaSXw2VQZ0aeA/V26ayH0Xblm8FN7FW5/StFnrX38jHxkmvB
         EpR7r+/IE9pf+UhtmZPxUCq3fdI0SMPtTM1yzpapXRz8fpq2Ny/zVh90uPr6RLYfWTVG
         I1SAqMZuNyspXZ+FJlwzPQfUkoQcBazvSBhao2IJByw2yA4Agjx79Inwe0vD2YtTGE1+
         7e8FfhtRM8BedSVNSs1PDmdhAjQ0F3VFDOu91bH1T04V8iG7NOcqCFkeDMpD0fzZcw+J
         59XWqban0M+j4c565v+9iPgrDJuiDFRfXc9p0cKq23gENq0jjLy1m2cNLl/HGnPHGWga
         V2Hw==
X-Forwarded-Encrypted: i=1; AHgh+Rq+Guur3ag1ytNCwgrwKAdGfzyCj0zlFlgJtI4e61L5R3c/uqv5/BDysKx+3tt5HhGht/m1fdkD+Nvc@vger.kernel.org
X-Gm-Message-State: AFuF++mL5U6o7yLa/K94C+9a+3N1d+n4mM+0DsBqlx8KxRpvH4WJdfWA
	sUiGVd76r4OO2kcbkqd91tk2OYDjdGQRgnYiSIuBign/2S2wjyZAQ7lOoZuvepOBezlw4GQi/lg
	g49EvSgIGVKvvyhapdB6Thm2lsFAW4rXYDk56DwSbO496zkl3MFxKgkyBnsIcNsFlSObF0W+L
X-Gm-Gg: AR+sD10pmuuRKJLXpMJdmMJpYEmE1pCMkqI43JSaHpCCfaeBI6C+lzRwObLVqaxNml2
	BdxJOtSBf67B3aRm5UnZbMdII0fbYq4A9ZOaF7i1tpg097S7wlJqcV+6qGxBlAJ7gRPGdCae4WQ
	xc2C5P4THE2y/nm9nk8DvPkwgLNznz+2nZu78Iyktt0prapFnKBicGbmx8M+4qSb1rq6OmJvan4
	D+oLmtoKPVMLnpfoRK4FLtM1njnSQx2hKSxbZ9gJB91vVE8nXBp63ymXDE7hHaO/RPrE1PYnIys
	N5NMXookC/TaSHXmQSpL6Y+g5Nut5eVFEsoZ1oPepXHx+WLplvXoYi5zMpr5BU2hU2xHHtJdXxP
	RLJmxhrq3RWziUAoMgrtfH4fsw9aX7g==
X-Received: by 2002:a17:90b:3b84:b0:38e:ab3f:2c99 with SMTP id 98e67ed59e1d1-395c358b9bfmr18634963a91.2.1787562679000;
        Mon, 24 Aug 2026 02:11:19 -0700 (PDT)
X-Received: by 2002:a17:90b:3b84:b0:38e:ab3f:2c99 with SMTP id 98e67ed59e1d1-395c358b9bfmr18634920a91.2.1787562678524;
        Mon, 24 Aug 2026 02:11:18 -0700 (PDT)
Received: from [10.92.202.220] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-395e4968618sm10951827a91.3.2026.08.24.02.11.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 02:11:18 -0700 (PDT)
Message-ID: <20e19a52-81d8-4751-99ae-c1297c2ca026@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 14:41:12 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] arm64: dts: qcom: monaco: add RAS error source
 nodes
To: Bjorn Andersson <andersson@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ruidong Tian <tianruidong@linux.alibaba.com>,
        Tony Luck
 <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org,
        faruque.ansari@oss.qualcomm.com, avaneesh.dwivedi@oss.qualcomm.com
References: <20260720081954.1858180-1-umang.chheda@oss.qualcomm.com>
 <20260720081954.1858180-4-umang.chheda@oss.qualcomm.com>
 <am69fjQNTv2xJonT@baldur>
Content-Language: en-US
From: Umang Chheda <umang.chheda@oss.qualcomm.com>
In-Reply-To: <am69fjQNTv2xJonT@baldur>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=b4iCJNGx c=1 sm=1 tr=0 ts=6a8c0ab7 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=pc6iunps6SSU6zhADHUA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA3OSBTYWx0ZWRfX1dx/HdJFtBKR
 b5uvQJYCUe8pNEfbosHn8hcV5S/XmJXLSGQu1LvdP2h4UETnY85zSR1uXZW8n71GHnT27e3qljM
 VEIAm1lTUsdwMvPoK/A4ax1zWwcTr6U=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA3OSBTYWx0ZWRfX7lORyQMG99MF
 NuvvvIkttgrJKs8QRC7ep3fTDrlBIOrh+cnW6Q15bTBCv+7BkwBecthpDyyB9RAygyutdOg6y+K
 XkUbiXwcsNiKZWjD8ToKA711N+g28B9MuzPYx6t/9ZsJuYiywdTU3R0waokfXHn5Q3jR3TbN8oY
 eryN4Sqq28SzP6r/MGQWDxVZNkcfhJ7iOCN8SjEczrNUuLFLIib+G34GkypHFbP8SI9Pz2pLj1W
 uoN84V38t2NXdQ4BIL/EnwXZ+R2z+BGbyA7nHv5+Aq0wpjsSLpljt5Gpv+EfAW2NQUncO73Kt7M
 Xlulj/yZjh1XKpqwT88v3AsbdsQK0/9qS4vLeZaMuyKvN2fiSGHUh7tI0tMKugHLiqTSRii64SQ
 xE06BydI5qUcPMdxj0Zfiqu94rQ9PpVIYOWC8o6qxjHosHl0n3zcyaTCtSGjKbQtuOShy64+5f3
 6Y4Z1hyk/9h8ZbiT4Wg==
X-Proofpoint-ORIG-GUID: RnXe6B6GiAiDPSxffVg7jokjUhkUItrF
X-Proofpoint-GUID: RnXe6B6GiAiDPSxffVg7jokjUhkUItrF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_03,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608240079

Hello Bjorn,

On 8/2/2026 9:19 AM, Bjorn Andersson wrote:
> On Mon, Jul 20, 2026 at 01:49:53PM +0530, Umang Chheda wrote:
>> Add RAS error source nodes for the Monaco SoC.
> 
> Why is the subject "repeated" here?

Ack, will fix this in v3.

> 
>>
>> Two processor error sources are described: a per-PE node covering the
>> L1/L2 cache hierarchy using a PPI, and two shared L3 cache nodes for
>> the two CPU clusters using SPIs.
> 
> Please read
> https://docs.kernel.org/process/submitting-patches.html#describe-your-changes
> and don't assume the reader know what this is and why it might be
> useful.

Ack, got it- will update the commit text to reflect what it is and why
it is required.

> 
>>
>> Co-developed-by: Faruque Ansari <faruque.ansari@oss.qualcomm.com>
>> Signed-off-by: Faruque Ansari <faruque.ansari@oss.qualcomm.com>
>> Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/monaco.dtsi | 30 ++++++++++++++++++++++++++++
>>  1 file changed, 30 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
>> index 64fc0d592282..4fbd1dc9a147 100644
>> --- a/arch/arm64/boot/dts/qcom/monaco.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
>> @@ -724,6 +724,36 @@ system_pd: power-domain-system {
>>  		};
>>  	};
>>
>> +	ras-l1l2-0 {
> 
> Why is there a -0 suffix on this node?

Ack, -0 is not needed here - will fix this in v3 to use generic node name.

> 
> Regards,
> Bjorn
> 
>> +		compatible = "arm,ras-processor";
>> +		arm,num-records = <1>;
>> +		arm,record-impl = /bits/ 64 <0x1>;
>> +		arm,status-reporting = /bits/ 64 <0x1>;
>> +		cache = <&l2_0>;
>> +		interrupts = <GIC_PPI 0 IRQ_TYPE_LEVEL_LOW>;
>> +		interrupt-names = "fhi";
>> +	};
>> +
>> +	ras-l3-cluster0 {
>> +		compatible = "arm,ras-processor";
>> +		arm,num-records = <2>;
>> +		arm,record-impl = /bits/ 64 <0x2>;
>> +		arm,status-reporting = /bits/ 64 <0x2>;
>> +		cache = <&l3_0>;
>> +		interrupts = <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>;
>> +		interrupt-names = "fhi";
>> +	};
>> +
>> +	ras-l3-cluster1 {
>> +		compatible = "arm,ras-processor";
>> +		arm,num-records = <2>;
>> +		arm,record-impl = /bits/ 64 <0x2>;
>> +		arm,status-reporting = /bits/ 64 <0x2>;
>> +		cache = <&l3_1>;
>> +		interrupts = <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>;
>> +		interrupt-names = "fhi";
>> +	};
>> +
>>  	reserved-memory {
>>  		#address-cells = <2>;
>>  		#size-cells = <2>;
>> --
>> 2.34.1
>>

Thanks,
Umang

