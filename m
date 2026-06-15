Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31C2E2FF67E
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 08:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781511398; cv=none; b=IwxABFITpri3hVa01tjHZLlhff2brd752DOsnnb4+A0ooqaQuiInWVqa2BhP39OJtC5aSaSR3jApEkVa1/av5HH1kmcqRbesk4ROsbeJhwdRZo+Mxq2Ih8UaKFTLEoQy1f9+ls2Bpifgej9UuzSxusuDkyIrbNmVfLcWfjdleZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781511398; c=relaxed/simple;
	bh=WQeiERPaY6Shef7hbj5xBNnj39AH9DVnf6MmKY2WS9U=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=RyOY+Rm82VL/p1dTiWSCi7HHf9HWIhNW+PniF+N7SV528QpTbLsZoNKSGRXVnRUgBgnlISx61jwWAGmXIumRpcmrzn0NnegmYIWMur5IBjqyovALlH76o9cDlKFYgr9jpt5bOcu6i/05QTsgADMsk54hOD6m7Y66WFFCYtWu4CA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gnSrvpkb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kflVSAhP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gnSrvpkb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kflVSAhP"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65F6IsJY3346509
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 08:16:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uKAKZLHWhyZbcRvW6UFM6brpCAGbrwtPlsnkYNwsv80=; b=gnSrvpkbiXoNIy5H
	IOylNB5sLFJZO+qza79cW3ddzh0BFOkhbOu7bpBeYiz1q6bfgotHrRftoB20l906
	8/oHUbus8uBFlcPhFgE16WOSIEK3DQUlU8m3Lnx5xJI5ByeZ1MbDwE8Igqkx87tb
	7gfEmTI0mCm3Dgg3wJJ8pyAwV2mGwD5vJJodpAipglTaSO/a7Fg6mdmBq3r3Y7Mo
	nRJZ4YPq+fHCskWv4O1aLYRi/vJfsxIWcu2wbFMG8XEOEFvwLpu6u9uJ10/XNftJ
	r30xq4KG1I8dB7BPsJDJ9Arm9VeCJXoUlZ1FjbP+Zn29a+vlQCsddrn+7OS8Nz8v
	XSfTnA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4es0g86c92-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 08:16:35 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-842b0dd8107so1932608b3a.0
        for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 01:16:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781511395; x=1782116195; darn=vger.kernel.org;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uKAKZLHWhyZbcRvW6UFM6brpCAGbrwtPlsnkYNwsv80=;
        b=kflVSAhPh6zQRTwbd8IOg3naxYaSNcvkn+AAinMcjKLfJFgtGA012abvcR/6W50AE0
         Iq9r1fFYv/QeWt5J4UGQJbpw8dntjUwfZtPN5MAK3tj9KzE2jVQAMyrAEB1LzVkt4LZh
         QbWWxz+TEuPXjgfS4IMxXoEOs6cgvfdt2O6rZ/jKs005RRp6QQ8CSHo2VEcyJfkIZp/J
         n55gXq1QfArbQ3Vgw3qky3TcI8DTp1TYx9vPBC+l/fBzHv1gSNLlJzcWzsD3YwXubQkT
         racYd8N4N9PeUtsXbmWzvn8ZI1HPbAmlKWrqCWZ5BeKk8LrqiG672LQHUrq/zb0/G5B0
         0VsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781511395; x=1782116195;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uKAKZLHWhyZbcRvW6UFM6brpCAGbrwtPlsnkYNwsv80=;
        b=nrV20n+eoYY77pgZfwEQrjjQrODhzFjTwVebNnLyTIcj2LlB2X49dE6MI9kgmYupRy
         e7L2bXXQwhOQnzvaA+5VS1MaIr2oJ8J7x6VUWYx3DACZUnN3oqoRLfdwC6Fu59acwuzs
         MitBqXOfQKaWe3a6s2Rzd6u2cHnTkKZWs9ax0u/CR5CYZ0siuJ1VLsNUFezfzfIo2z6i
         bKEX0P7cNnt/wZ8FJYvBRiXq0T57yl2JDf9jo+/23luku6JR0ywe0pP7Vxd9lR/UNRx3
         b812GFjkalfH6pbO+wk8zbSPkEyDaEw43R0XyIGp+43MfxIanLhCAuqTkDTCfMW4zUZ5
         z7lw==
X-Forwarded-Encrypted: i=1; AFNElJ9KZZaU310+MM+PA6uhyE9Vymuye7IcMLMv0q03F93fcrp8vptEEM7lcZKjknLoOuII1DA9YhSkqsK7@vger.kernel.org
X-Gm-Message-State: AOJu0Yy26t+e40LxypWn6eB9h0Z0O/RC3yxCNjHK9XnCXQBb6AvXfSfx
	vwq3M7rezWjWSzGtR/IKJ7GLZ3L7eEFM7k+c5MWGsFxiOQHJdv3gDVSyPyu1oVFS9wjhymZYKeq
	hIqnLdZa21BiiMsacbGGzY4RPEFNpPPlBzhjzI7iDLVxWxRB62JJc+wecUIav0deb
X-Gm-Gg: Acq92OHlPsHf31b1OnWx12BE5DJMEhoVidcTwutivx5S9FZgiZDJUM06fj/k20EpULa
	EntF3JeiBKxL691RPOlMR0sVNZfyaTxL4SIBN/ht3BjaEt7Jve+yjS6bF0j3FjIl6lxiBPU3nSS
	XWF+N/rCkltgxdJAqWTjOL2oruVJ6VDrahWpWbLfWd0eFpSpq8Wnzg8+HdaiZAPvXt4gTEdVFKj
	MG8Ya52UjIgiOK5ZmoWD1krFaoNYX+oBSTxf7u+ge66TsBBfcF5UIqy4FHajmGCN+5eY6zMNX7y
	74A0v2qg9lT4bNyqtZTxEAcYhhdMhgfRpv4pJ2mzt1py3zGosJWDoF6FGDYj3DDgtOYHMKfFVJL
	/a70Itf4oK646vbieyQnwryJYeNh2Vl+p/Lgurajo4uiD6avPxA==
X-Received: by 2002:a05:6a00:450f:b0:835:3949:3c1f with SMTP id d2e1a72fcca58-8434cf0e0d0mr13804239b3a.24.1781511394695;
        Mon, 15 Jun 2026 01:16:34 -0700 (PDT)
X-Received: by 2002:a05:6a00:450f:b0:835:3949:3c1f with SMTP id d2e1a72fcca58-8434cf0e0d0mr13804195b3a.24.1781511394140;
        Mon, 15 Jun 2026 01:16:34 -0700 (PDT)
Received: from [10.217.222.63] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434afd17f5sm8444410b3a.39.2026.06.15.01.16.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jun 2026 01:16:33 -0700 (PDT)
Subject: Re: [PATCH v7 1/3] dt-bindings: mmc: sdhci-msm: Add ICE phandle
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>, ulf.hansson@linaro.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>,
        Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
References: <20260608041650.541502-1-neeraj.soni@oss.qualcomm.com>
 <20260608041650.541502-2-neeraj.soni@oss.qualcomm.com>
 <dc833e56-e127-47b7-9ea5-58d6d2cc193a@oss.qualcomm.com>
 <c8da8a89-e372-ca87-cdca-396c754ef5d7@oss.qualcomm.com>
 <1a66f1a6-840b-4de4-8e65-a3456b654044@oss.qualcomm.com>
 <91a90c37-f93a-17c8-b4fb-290759645977@oss.qualcomm.com>
 <432f3a3b-3d28-4130-9a9c-61be04eade1d@oss.qualcomm.com>
From: Neeraj Soni <neeraj.soni@oss.qualcomm.com>
Message-ID: <8c2cd2e3-434a-936d-99e1-3e96b399e8f3@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 13:46:28 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <432f3a3b-3d28-4130-9a9c-61be04eade1d@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=OOoXGyaB c=1 sm=1 tr=0 ts=6a2fb4e3 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=FC_baigHY8OP_pc6ZEMA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: FILo9KI2xdQlLBwb35hlJWik0ZKHd_rd
X-Proofpoint-ORIG-GUID: FILo9KI2xdQlLBwb35hlJWik0ZKHd_rd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDA4NSBTYWx0ZWRfX2HgmWkprqacV
 sEgceRaTHbfbXroyQ/dkoUel5+HykhywHXjnU3oLdgO4YxHOqj4XYe5zzI2C9HWz6OLrFnAaS4W
 B1eEFeYAbMEiWjhFf1rdI79quyKtDCLP5CXOwsxl3E7wHOdfJntZBXR17Nkg+/eB57QNFP4cmlj
 fXr3x7fo4NUQWQ+vSbwOp3bQWdh6XU8iesTwWOh7d1MQsD/hS/F7zhoNWAGwf7iCV1Y6G1JPLep
 QEBNtA7qK4DnUNUxg/H9nUPvNwMzxcHZtX4UqrtoApTdl6CizkktWRH45eU86EOa4Guf/TRrZ8G
 6JTbfxgb8ucLqz7RsXHvSAp+4musp4e5wP6WevzD1/UhnmZIOFa2TS6fQGLq1VoFA8G/J/np1/T
 IBgCoREmR/rFyytfQs0RF0qMovTBByvC42XIPl4+sClK0BYTfcfyk0zhw5SO72VZuy6ibshV8kg
 STzMWZXnZlDkFYtU8mw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDA4NSBTYWx0ZWRfXwzhBD7/wbxEq
 /eHrYWTpAH7z2/RUIdpiXCnRWmULkjM6BfKxQtgXeynY9scDLFTfO/RD1WK98osA7nWkRKKNFyI
 hJ8aE45ltANw2rSs8lCL5MbB2uXgAaY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_02,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 adultscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150085



On 6/15/2026 10:15 AM, Krzysztof Kozlowski wrote:
> On 13/06/2026 07:21, Neeraj Soni wrote:
>>
>>
>> On 6/9/2026 5:19 PM, Krzysztof Kozlowski wrote:
>>> On 09/06/2026 10:18, Neeraj Soni wrote:
>>>>
>>>>
>>>> On 6/8/2026 11:40 AM, Kuldeep Singh wrote:
>>>>> On 08-06-2026 09:46, Neeraj Soni wrote:
>>>>>> Starting with sc7280(kodiak), the ICE will have its own device-tree node.
>>>>>> So add the qcom,ice property to reference it.
>>>>>>
>>>>>> To avoid double-modeling, when qcom,ice is present, disallow an embedded
>>>>>> ICE register region in the SDHCI node. Older SoCs without ICE remain
>>>>>> valid as no additional requirement is imposed.
>>>>>>
>>>>>> Co-developed-by: Abel Vesa <abel.vesa@linaro.org>
>>>>>> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
>>>>>> Co-developed-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
>>>>>> Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
>>>>>> Reviewed-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
>>>>>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>>>>>> Link: https://lore.kernel.org/r/20260310113557.348502-2-neeraj.soni@oss.qualcomm.com
>>>>>> Signed-off-by: Neeraj Soni <neeraj.soni@oss.qualcomm.com>
>>>>>
>>>>> Link should go below "---" to specify previous discussions.
>>>>>
>>>>> Usually maintainers add link of patchset being merged here while merging
>>>>> changes in their tree but authors don't add it here.
>>>>>
>>>> Do not see any such restrictions here https://www.kernel.org/doc/html/latest/process/submitting-patches.html
>>>
>>> What do you provide that Link for? What does it bring?
>>>
>> Kuleep highlighted a concern with the usage of "Link:" tag. The link i
>> provided guides on posting patches to upstream linux. Wanted to highlight
>> what i folloed and I did not find any specific comment/line in the guide
>> which prohibits author to use "Link:" tag in trailer section. If there
> 
> This is reversed logic. You need to provide reasons WHY it is worth, not
> just claim it is not disallowed. Adding 100 Links to whatever website is
> not disallowed, so you are going to add them?
>
Ack. I understand your point on Author's responsibility.
 
>> are guidelines otherwise please let me know and i will correct and post
>> new patch.
> 
> The "Link:", not the URL itself. What does it bring? Linus made clear
> statement that you should not add links UNLESS you have a reason.
> 
> So please share the reason. If you do not have, DO NOT ADD any "Link:".
> 
Ack. The purpose was to only highlight what was reviewed but i understand
it was not necessary. I will fix and post v8.

> Best regards,
> Krzysztof
> 
Regards
Neeraj
