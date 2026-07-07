Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2331D35F184
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 05:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783402484; cv=none; b=BLqqv2aPQ3YAjgHaicoFJl8LmXx0b88LOmMX7DAPvoJ9cuQXkywzuYr5pW/FkeLz+H6FhaE6GYOsReZs/SygIJqkmFPBlVuI2OIrgQi/hzOi9ycAleldlDU9Bw9FrV76vHMjF4m1NX7mMcJ9pQRXJwT42vSiA7kOY3c9bNOu6Mo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783402484; c=relaxed/simple;
	bh=6gUJmEQ7gh2OVod4PlGCDo2UYQU2TxUMTLZmwW4INZQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Gw1tDQgTFNg+an6m/atyG1apN7xwSQeon+EQT0TQdDMuCNchLlEDFV95SSgbUA+o2rEyWmJ2bwJAzeLCrRSdeo613Xz5HohalRW5J2yHXnV40roUAsVhvhoyVmkJNSIAf4gWDknLjPxZu7BNjnuzgFG28Xqy7nLtdkvk8xBvAnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=goKEBfAs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BIHnlfEq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="goKEBfAs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BIHnlfEq"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66748gpE2585220
	for <devicetree@vger.kernel.org>; Tue, 7 Jul 2026 05:34:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J5y61QSWVlQeeop/0EzUtwGiLotqpcy/KmZCwpdQ1Jw=; b=goKEBfAsewj0Z2Cy
	UGR1y5P3xcYq7gCpS0Owxr6dGO+uI1+0NmVs2aQ4qQ1azCJn79x28aNGe9xUAtVS
	ot+dTVw55poQ0RfvHkvhyV5Xoa2pxqcbZF6+gBKN/nB+WMqDfG9HLLzFmPMbsiyH
	OfJ2EBdrE7HVwD8ttZzsw2VcYR7UhBmcTNVSDV4tnTkBsa0/I6pKqCEKKxJmpnIs
	b5KLFUHwqI6Wv8dVn7+y5L4eTJN76rUlkd2HOqmjVu3HS+Kfy5dM+MgQHb/bzMCD
	JfHIeirUnsTXwPE0tzD5EKp516daVqJiz2BGvz/xc+2XKMCRneSXIMQk5aFSKYYV
	wlNdtg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8t15893q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 05:34:42 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c85798977dcso5788630a12.0
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 22:34:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783402481; x=1784007281; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=J5y61QSWVlQeeop/0EzUtwGiLotqpcy/KmZCwpdQ1Jw=;
        b=BIHnlfEqDSAfhCTzHDFfekQXEkoHNzZm0pGt+DCZae3xC65P+3zrdFiNSjJwDrzeaY
         qjqlFKRkPKHGCdfylhoQJ7R5nIFdz/6xQ2huhpNKzUD/apN0tmOKE9BBAKBMQ0fhdl8C
         TM325qzAbFRPgbAgOYdo1Z51oBZpIEuR4BbmF5SaCROTh4qxbqjaugKvp3EMXjqcQdAa
         BIwwLO4BRHggpLPFapOReFUsY/BgP9ZSRF2QaxwR553I0NJyTw7f6EU/cb/yCV3fInbk
         cQG1DXaRxjcf1Bukmau9GWjm5psGAblB4Td/sqcKC8Rlz1N3QIwEXIoKxhKuzkxzBGpv
         p03Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783402481; x=1784007281;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J5y61QSWVlQeeop/0EzUtwGiLotqpcy/KmZCwpdQ1Jw=;
        b=KeVG1LtdDI1jbdp1TxkL/xGVys/3IKO9xRl9DbWLTKO/57P/Qly+qKjuZzARZsBp9P
         DFsWiT0LZlytwuRg5VJxTZAiAThQwryJiIBahKCTzKRzEFgwoGMgtVNr7UDY9vn6RNRA
         ee6ZssbwDaE82JBnl5sh71XHt8QPbRRVfkFFL3QBuDH1w0uw7+VVdoFwy2eCB+gSMzQB
         gppS74qRfGOBWAP+JgtyIyxkA29uEz8ufEO6As2oi32eWXiWSSOB0Jr6CV0slqcZHLs3
         0d04Iu2c6Hes5lEKLcCJzH07lzonE5oPLgOMVy3xrJV5DbXF6k8RLJDuMEgoTdqaBiCx
         9fQQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrye4U/4zTICShCpKT6x18UKJueXHVPPVkRjMVLYZGIFv6WmymUJbS1bdPegzsguJIPE+iKIVYyjPEu@vger.kernel.org
X-Gm-Message-State: AOJu0YxdaD7MCd6RjEiY3v3Zvf8EgeLtmQw3jlGkQpvLmlYCzBuKkXVi
	Yvc1b39neReLYR0xYlkj+B+txerKvW2cVJxHfT0GZ2xZn/6NtQfHl/UX+vmI1MmZXys0lQinG67
	SS50EJ1onNPdrgl6SC+z0Dz7CV8VL5Y8/Hr9F3D3B0OS6JoujLsx8aMCigOKWB6Vo
X-Gm-Gg: AfdE7cko+nPllQr+a133ALKijsbcxkkB65/5CVZp1VKKwdtjAj2VVDt1SR5pqentKLu
	ZNVHY8E54TjqTcL5gQuVTUp1mOfFRP6bBxz/VFG0zsc74wQLgEIYAtiQyjT7bSgYRpHsdojQm0F
	YAcvEEekOASK8eT7eHGiS9lU1iKFUNaY4+11PwK0AuSzyt3ykIhg7Gpj6d8l4zFIJfwZT86PEaP
	DqBFofnUfgQdLkNg+cqXUchrI+huGQdJvfzaxUOSY7eTHfS3rhPtLJ62Ni9IWJu93PYoFi8+iMB
	jHbiRrg2W6AMT2GC4TnxDlGF3RhZ3dE1HfuLsZaudeNd8/frWMnTDGv6tQmjlbDEHajfv8mLi8l
	3Ye7zaaeZ/xoNhq6NL00Vd+RBTLWYlvOVmaoM77Ac
X-Received: by 2002:a05:6a21:648a:b0:3bf:a9cb:b799 with SMTP id adf61e73a8af0-3c08ef902e9mr4691647637.54.1783402481080;
        Mon, 06 Jul 2026 22:34:41 -0700 (PDT)
X-Received: by 2002:a05:6a21:648a:b0:3bf:a9cb:b799 with SMTP id adf61e73a8af0-3c08ef902e9mr4691604637.54.1783402480647;
        Mon, 06 Jul 2026 22:34:40 -0700 (PDT)
Received: from [10.217.223.121] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca5afeb060bsm398917a12.14.2026.07.06.22.34.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 22:34:40 -0700 (PDT)
Message-ID: <cb8f0ebf-8afa-45dd-b2fe-724af7e0b73f@oss.qualcomm.com>
Date: Tue, 7 Jul 2026 11:04:34 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: glymur: add TRNG node
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260424-glymur_trng_enablement-v2-0-0603cbe68440@oss.qualcomm.com>
 <20260424-glymur_trng_enablement-v2-2-0603cbe68440@oss.qualcomm.com>
 <814cff7c-fc03-42a0-93e6-852598943ac4@oss.qualcomm.com>
 <0debc1fb-f6ae-44c6-aa87-d5ef3e39b47d@oss.qualcomm.com>
 <b4794e93-0fd3-4559-9ecd-02d679bd06b5@oss.qualcomm.com>
 <b5287c07-24b1-4011-9805-529f6f51c22f@oss.qualcomm.com>
Content-Language: en-US
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
In-Reply-To: <b5287c07-24b1-4011-9805-529f6f51c22f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: pKjIGOiVij67z-UH3qz_Ue9ux_OiUTFj
X-Authority-Analysis: v=2.4 cv=HstG3UTS c=1 sm=1 tr=0 ts=6a4c8ff2 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=FNHKQYERf4qwuPYjk0kA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: pKjIGOiVij67z-UH3qz_Ue9ux_OiUTFj
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA1MCBTYWx0ZWRfX5IzVaoEjJ+B4
 SSrd3DBXw7HAKr4of7lRnLyiV1eFW9d3t1rbAoEymt5nuZEhUNFsfY1mjX+jrZXcJXnY0rJx/XK
 speaJ8luAwdCVQgnCms4AkyG2VlU9ks=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA1MCBTYWx0ZWRfX6qQ221xX5XXd
 a/mr7OJvIVwWFu1G8o3flwilI5P1CPBCJlfzBwZDiNvqi7+lxbOY+8cknpEPc/vOU4BlCiAJ2CQ
 F4o4zy+h+dFVjd9AcuBTpgP2efElYTWIHU8g8qFOc5WFmpuEJvlixbxvdqyMAWc/OfJAb588buw
 Sje7aq/ipKpUU8Cp4FMSomLWJY4+sYwK+Ia1JYrq2mTOutSwjDuWiuoyPUX69hNv6CFhUjZ7/ha
 /Gd94gidPgkfUP7/vzoqbPPyDonczWuBQXr5OQ97hL3v439Pe81o3cWK194JrkiG51Z3UQFoLbG
 WMeer/sOZThCT4uA85pFDKBI3eqLkzzQq4jV649y0FsoKzQ3n+OcMF5JEjCK3ZqpeWQJqqdzy1A
 euuYiSLJ/5d4jBJyEvWE7oFFvpfQVwV0/tQ8/jPyK3MJMG0nqlTln03Kwr4thF2rqvRCuho9lfj
 V+S6us914lX7H596aFQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 spamscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070050

Hi Konrad, Bjorn

On 6/18/2026 5:50 PM, Konrad Dybcio wrote:
> On 6/18/26 1:58 PM, Harshal Dev wrote:
>> Hi Bjorn,
>>
>> On 6/9/2026 12:06 PM, Harshal Dev wrote:
>>> Hello Bjorn,
>>>
>>> On 5/18/2026 2:06 PM, Harshal Dev wrote:
>>>> Hi Bjorn,
>>>>
>>>> On 4/24/2026 2:05 PM, Harshal Dev wrote:
>>>>> Glymur has a True Random Number Generator, add the node with the correct
>>>>> compatible set.
>>>>>
>>>>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>>> Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
>>>>> ---
>>>>>  arch/arm64/boot/dts/qcom/glymur.dtsi | 5 +++++
>>>>>  1 file changed, 5 insertions(+)
>>>>>
>>>>> diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
>>>>> index f23cf81ddb77..64bbd5691229 100644
>>>>> --- a/arch/arm64/boot/dts/qcom/glymur.dtsi
>>>>> +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
>>>>> @@ -3675,6 +3675,11 @@ pcie3b_phy: phy@f10000 {
>>>>>  			status = "disabled";
>>>>>  		};
>>>>>  
>>>>> +		rng: rng@10c3000 {
>>>>> +			compatible = "qcom,glymur-trng", "qcom,trng";
>>>>> +			reg = <0x0 0x010c3000 0x0 0x1000>;
>>>>> +		};
>>>>> +
>>>>>  		tcsr_mutex: hwlock@1f40000 {
>>>>>  			compatible = "qcom,tcsr-mutex";
>>>>>  			reg = <0x0 0x01f40000 0x0 0x20000>;
>>>>>
>>>>
>>>> A gentle reminder to pick this patch for the 7.2 merge window.
>>>>
>>>
>>> Another reminder to pick this patch up in-case you've missed it.
>>>
>>
>> Gentle reminder.
> 
> Bjorn and I were both out at the time, after we returned it was too
> late to accept new patches.
> 
> Currently we're halfway through the merge window (where Torvalds
> receives pull requests to create 7.2-rc1 out of), during which
> contributions are not accepted. They will resume in ~1.5wk after
> 7.2-rc1 is tagged, targetting 7.3
>

I believe we can pick this up for 7.3 merge window now.
A gentle reminder to pick this up.

Thanks a lot!
Harshal 
> Konrad

