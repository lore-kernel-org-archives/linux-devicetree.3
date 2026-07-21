Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26A6446DFF1
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 16:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784650775; cv=none; b=TNhuaKUWR+2mB8eEx1EbbLemvLI2SMvXTMyU6H0sep5HqZToBpQfDFpIHLJBAG7j3WWgADx3xEoF5Wx/O1WqniLRrATWKD/Wv/1Lv3Zoxpvo3oNGuzHei2olm1yuKe5zLVT1awil/SQkETFcOoC5DKHeVQf/RGils25oVQaBBCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784650775; c=relaxed/simple;
	bh=GD63EepOL1WUVqIWbQ/pkPgIFcUhv0ajMSyu8YwE7gI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VpLHpFtfaFW+xcogXjplU5v63iw/CqSjxK+ErqD6EqqLaXAcDb+Oy3/puXFSNK3qcMM0VKYdOb7r5esgodJlmwv39ew5acwtCnxhxiqt5DDE611AVHSeLYvkjWuIL0byuxD7feB7MHNK8J/ix1R9NnzMyWYi0sQ/vHFxmNPY7h0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DvvHRGoL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TBWqntUY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DvvHRGoL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TBWqntUY"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LDg3jC1958685
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 16:19:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dTV6MHViCvNQyXCxsNNT5/4KQPDVAbuTpKtQfF4tMJ0=; b=DvvHRGoLDn4/ZEUY
	cm/d2ANvj3Ft4nNNFwuJSRO8WjuRUUCCMEFP9scVMvKffLEtQZQVfg3uEERJiQW8
	FoI0xuJSAuk0LBUSQlIaH+qFJmqf3EcfgvAkZClXoqVitdy3PjD+4jmuap7O5e/7
	Ul64BFk1MY4W8597sS7Rp5/Z3eXX0P2SE7c68upSk60ZfIdVjBlXLwfhvzgYEN1/
	Iy18V5f6P73FgXA6FfaLbE7ulT2i9iXuwr3o/JES+c++v8kdTwGN+Jdhqj0i8O1D
	h/AyAu+PzIG/uZzdUv6f2mBhG2McC4bxSb2LIJqCG0cP4yMRuBo5SHLmnhKxkNlx
	CQZGKA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj1bvufy9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 16:19:31 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c856470fe9fso6756491a12.2
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 09:19:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784650771; x=1785255571; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dTV6MHViCvNQyXCxsNNT5/4KQPDVAbuTpKtQfF4tMJ0=;
        b=TBWqntUYIqiLic0nsIF6vguhkFPZ+DVsMXy2E84glt4WMSp+jzJGoKKO4eWbAg3gr4
         p3Z8rWJs9RRU4goexBBGIelEgQaWV0T1bZGc+EerT/3KhU9yXuqOKf99yDBB4Sg4xP7m
         icjOuCHwvs/lCBdu3qJjjNh0ca24dRfg3quQ2YY8BH22TQFmUGIvVVY60sHeND6GtAqd
         BqqVzc3BBrRw1kRHnlfbcE0YYOw1U+pzZMgrlOw+m6l9QGvQxlcXFzxAOC6CrsdEzD/R
         /V7Ew8M8HaXnfZyq9mY/wPaP8AG5UxkY7o9UZ//v+82yT6HilPsvlLJA+01JEWnrBOCs
         bt5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784650771; x=1785255571;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dTV6MHViCvNQyXCxsNNT5/4KQPDVAbuTpKtQfF4tMJ0=;
        b=k5k2f6AXTURWlW9zHx1RP+rRpuIA5FVHejYp21khqThOwzFU7bQiUvWSfOH2kSY+cH
         TelSVU9fVL9qfRYEeqHV+1VYnuFhuq6ZvIky8ZJa+7a/NgrKVFsdySsRRCTlDkyNrHz5
         Y+hHIEwHK0IeWqiiS+K8SMwULX8Fu/WyOapQwQlMzp06CfyxGRJhGUSHR0YLRhM3YLVI
         yYIygFK9ChK3axLb5At2GQvcYI7pH+0hzzwOAN+7FGBHutBzQQTXC5G7sGEnwdoY3Tfi
         dosK7cbBk17bzmrC6bE/RUBG8/ghrGzsDBMxARZG11Ni+c9halTZczVhnGhNjAY4oE8m
         WrNw==
X-Forwarded-Encrypted: i=1; AHgh+Rpuo2SkCblaiwqCHJzzKXynKR+gf7ZEFdZ9IK6eYWHZMbwwAOlVuxc9jRaq3TmRcHDC/2hKRFy9csY/@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9LN5vAzw9jMMv/DUPsbPxG8T8bd3DJXlMSuseQH7jYeWLUzJq
	dcPbeHSQLK9uEAJs1NOa86qpX+hI3vot4d0DabjIkhb553g30rbfl+18OViJgYPXRPtBfPOK/Vf
	HkuhM/iZN+gM8AZ9sYt482QCsafVzgEAejqcBB6N75VHduKmkgeeVcyOBf1J7G4cV
X-Gm-Gg: AfdE7ck9qQ487fY/CgfI8XHtw+m1trLh774CRvcSGub094D/tEJjeDE8XAZxiJNMxwu
	7S8jNflst/ucDxXiAj0xohyXXC1VjXlM86HOhf98j7Db3uC9B6Ta3abcn5Uiy3ecBL9NznQVIwZ
	iR3NlZ05okztcvVhLkoqNHG02wfBQHNTsfCwPSgac4vMymqtPAYdB2Si4BCkI54VIDd8m650ot4
	4PwjFf+2pUoyuptNVEm3ZV79oACBCriXJfn2XMu5QEoGS8s8isVhMphOXpqnl+jfa+GK0qtXiUJ
	EOXsvzMDY3/9SzWQHddSwc/UKn7kJflfvIMIxB/xmRgfFndt0of+dPnXdOYAZwdmkcFsTcCD96K
	PkNdbCej+Q39ZXyaytqr8M46R9Y9akuAYs+s=
X-Received: by 2002:a05:6a20:d52b:b0:3c3:9698:daff with SMTP id adf61e73a8af0-3c3ada42d88mr19050788637.68.1784650770801;
        Tue, 21 Jul 2026 09:19:30 -0700 (PDT)
X-Received: by 2002:a05:6a20:d52b:b0:3c3:9698:daff with SMTP id adf61e73a8af0-3c3ada42d88mr19050752637.68.1784650770221;
        Tue, 21 Jul 2026 09:19:30 -0700 (PDT)
Received: from [192.168.0.105] ([49.204.17.188])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147e07000fsm792534eec.21.2026.07.21.09.19.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 09:19:29 -0700 (PDT)
Message-ID: <2d87ed0e-e007-4372-a535-6111468179cc@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 21:49:21 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/4] ASoC: dt-bindings: qcom: add LPASS LPR vote clock
 ID
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-sound@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
References: <20260720130511.493295-1-prasad.kumpatla@oss.qualcomm.com>
 <20260720130511.493295-2-prasad.kumpatla@oss.qualcomm.com>
 <20260721-proficient-witty-curassow-e203a6@quoll>
Content-Language: en-US
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
In-Reply-To: <20260721-proficient-witty-curassow-e203a6@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: wcUb6FdeBmBvKBoP8ipYChSdYqj6npfa
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE3MiBTYWx0ZWRfX9d8fwlcYUOtq
 2p9lg/AqZgulKIkvPeSrmtSyDWa4C9Z+Nfj6IWWOJE/KdJw1P0KZ+71xv2hfBz46cbpgp64Q5QN
 /znnwfM//UysYk0QApx/wTNcyqt751Q=
X-Proofpoint-GUID: wcUb6FdeBmBvKBoP8ipYChSdYqj6npfa
X-Authority-Analysis: v=2.4 cv=Sb7HsPRu c=1 sm=1 tr=0 ts=6a5f9c14 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=/JTPBhwEQko7YaD0RKblyA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=886e80D7AWrxDFE_gbcA:9 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE3MiBTYWx0ZWRfX16HOp+A5cLt8
 H2D2j+jqILsnLzq1kR0X/HL3U8ng9pCwTBEwhRr2bpyuWJj8FefXKX50hYTLThGc+uviX1IkQhg
 dEMygwe6iX1S3GtQzDR30d7nqO381VgCpfjw57ce3V8yCKleg5LeACgNKhtGlLBN0YLqkwmahb6
 fpLWbflyYAvZkwOg3ASxAdnujdUjjEGD+ghyO5sSC0L+JgWqQuO6WNDEAipkYh/b8clx/1v11pR
 3maFOiC2JiAXkbERKhesUmbOgl9lfceFlOJajqcw5lyf3eAGt0cCJxKhy8c14hMNkz3h8seq3Fs
 FXx25hZHyy/01/HBUK8ltmHWRojV41GbVbF+9tz5HrrnsLi3r1Wjn2ZVAQvytHSg97QLdhT2KlN
 4AqSUGHi2ZmOb8LIrkIiNJ94c9TrD32Y3PGrQhULfb/ysOCk604fjchm0Lp1sNOGIe16BOp3zv7
 uoyDtgHcajBTWSyoN6Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_03,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 suspectscore=0 clxscore=1015
 lowpriorityscore=0 impostorscore=0 adultscore=0 phishscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210172


On 7/21/2026 12:28 PM, Krzysztof Kozlowski wrote:
> On Mon, Jul 20, 2026 at 06:35:08PM +0530, Prasad Kumpatla wrote:
>> diff --git a/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h b/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
>> index 45850f2d4..ce5e8589d 100644
>> --- a/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
>> +++ b/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
>> @@ -236,8 +236,8 @@
>>   #define LPASS_HW_AVTIMER_VOTE		101
>>   #define LPASS_HW_MACRO_VOTE		102
>>   #define LPASS_HW_DCODEC_VOTE		103
>> +#define LPASS_HW_LPR_VOTE		104
>>   
>> -#define Q6AFE_MAX_CLK_ID			104
> That's a separate patch.

Thanks for pointing that out. I'll keep LPASS_HW_LPR_VOTE
as is in this series and move the removal of the unused
Q6AFE_MAX_CLK_ID define to a separate cleanup patch.

Thanks,
Prasad
>
> Best regards,
> Krzysztof
>
