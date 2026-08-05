Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 166973DDAFC
	for <devicetree@vger.kernel.org>; Wed,  5 Aug 2026 06:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785911389; cv=none; b=Lv0jXOuSkopAFfCBBA2+c8WdGD/EHKL8GxjlFFRlG3r1Binv6dnm1EyZiCPqhXWEXO5yEY+57IsKsWth0FNlaQgMMCtGzWgMSt16pzuY6ljahEGj1m6O8EdG4OYarN9RjnW+c+zEFj568/FI6bJgavwfLLzatU2KjQma9qay8GA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785911389; c=relaxed/simple;
	bh=kD1AtV1IXgU+rEmbAxswgg5f6SHwOdcp4YRjYg7KNcU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TtGbWb3Ga1gsRJt39pKDf3IOpH5EbsgKu2aluY+coAC2euJSfGRuOgKbCwcNt61VXeXhe87dRPufi6fJaRQ5p6PeOVxCuwXsEaaUNHbQVKdDpXKd0klSpi9csW6YjqIRrQshcJ/GrjJhUBdwu4061UfEtO6IOHLpZINAmu+ecIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I1FbPusE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aHqgCfAD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I1FbPusE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aHqgCfAD"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6755l1Zl3143292
	for <devicetree@vger.kernel.org>; Wed, 5 Aug 2026 06:29:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tf9Q0sWvzlnVpeS8vAA4rJPPXWRvGO905jPZFHYDYQo=; b=I1FbPusEYTbDPPuH
	cvIYbnK8OnhsXqt0d+auldqeCPlUOlhKuPmZlMrXDD+1psvsvqpY9i9jU1ZOj+2T
	RqjEIUr/tMyGe5g5Rzibw5X6LEs+un5bGezt1yPSxQ8mVtsmbeR585IROJDdJPCt
	1/Fu0fW8RPvv9/z8Yd09lJiRPxc5f+fZEB+2WBLOyj2/c1Ozs2KBGP3Sg5RQfLAi
	+QlJdEwGiTC79j6am70pTFlB7lqQkMe6aNbr8P3Geyl5AJpYekoH5NTQvqup13iD
	0dVAUFFMSzW3OiSbGYup32t8elgSETG9iRMB2wM5CArCJLZGsO78DJvxW6t8s1q3
	Sn4nZw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fuu3uh4uk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 05 Aug 2026 06:29:41 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38dbf293831so1232125a91.3
        for <devicetree@vger.kernel.org>; Tue, 04 Aug 2026 23:29:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785911381; x=1786516181; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tf9Q0sWvzlnVpeS8vAA4rJPPXWRvGO905jPZFHYDYQo=;
        b=aHqgCfADR08H/gKiNMJiytKBCKkHLar1pGkp4gBUj2Hzq3GZE0sBW/HxqZITT/E78a
         W9DfkT2c7xa9fDXQELZcbvVtTbk1eEwG2/JKCr3rktYO4YL7hTDJgtzhYP6b366eoNyy
         dgRYJoO7k+4EIEGsVUXYpjj2DEXejzQxox0xlBtbnOkmPdIWQeaT60Ac3g+rjBWfZd/y
         QRgl9ayUHBAEYf3jNFw1NyXRUwhqlTlJJ2mSUum+D552KMSq/nwl/2sQ5NuHE/geYglq
         VaHufOMwd67PQ4mm+Q/Ne6t9YPu93amY8KCmBeG8hWHqwvVKVhjsrkzf2V9u2thk3AnU
         kJCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785911381; x=1786516181;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tf9Q0sWvzlnVpeS8vAA4rJPPXWRvGO905jPZFHYDYQo=;
        b=d7NBAJzc7YeO0nTyMdiWSUsh7JOBUD7QghMYh1Ps5kQ7yHAI+fTXW0S2elLjVpEeVX
         JKkoUS7y73E4C+WZgJrXro4iwoBAoqcvGdLw9y8K4Tsmr3QSDKw33cpyMnVSQKyF1E9a
         K2zMxB0egOwF2ZLfJPRmKxO84gmovo3YhAMKu3Y44ABK+kXgtM/jws+Aa9KJzZRHuCLU
         7t7XGUhSbEYHjVvyafNTwi8LW/qF/n0zu4v9i2HBR5ZPnOtJfWggWPvBNm07Gefaccrl
         x/r/NNGG1joyjMkTQ22U3ID33f7o7AXpaVpmkQtLu3XaWscxPNlrjnevZh2NEQyngJ/d
         c4hw==
X-Forwarded-Encrypted: i=1; AHgh+RpmvSwa9ngdNA+6UdgA2jEg9jOiWDzgQ84AUACJRwnJMYBC+kaH1FKaGANfoWr9Q8Ld+1MU61umF/kg@vger.kernel.org
X-Gm-Message-State: AOJu0YyUP4rAeJleJI/9eGSdjgvir+FZwFXFbZ4vD1GOwqXlYORaISr6
	KQh4f+U1j+RWLBDePTUmIJEcPlkbOlH5QYfoFp2cJX7JxXN+x8e3FfkPDAV+QKTmqA7MP7N+LyB
	hJDB0V8ZFGV+DhRhuHw6yhZE/V1tfCca4m488V67Gbb/NbIn3b8jbyJq/WJUEl+N5
X-Gm-Gg: AR+sD10XiMwh79LYuXvyNnGqskwgeqG3cyDiIaZXEfmLmAIiw/YtcXT9DhBP4vqlTMB
	myTzYtPFQeCy9226WFSFUoFq3s1YrTcXa8H0o5ankgKkytApsPYP6xz3T80glg264GFsPYvspel
	c+7v4YHsIsXsiumE/gs6e5PSu06Pbs/SJovfdyeQyyBwb/ECM4CF95Z6+24xIWCyMvr9zNRxEGN
	gCLWK9HuhuAL2jKOTP9qi3CPPcSGU8Yy/t1MM1S1ZQTLJFXkJ+/nMHWClRNyT05O4wEMY8oKWX6
	5wp7lUjIC+Wd3+43qydY5EaklmMWswdtu/yxDAgeEFVOCsPI+eaHLo/QZ87H3jkyUKbF9ipDoHt
	vneKila6+h3mMs5/dASG7BRHFG0cJ9JKM0oI=
X-Received: by 2002:a17:90b:1c0a:b0:38d:f096:a1dc with SMTP id 98e67ed59e1d1-3903c58a715mr4480790a91.11.1785911379380;
        Tue, 04 Aug 2026 23:29:39 -0700 (PDT)
X-Received: by 2002:a17:90b:1c0a:b0:38d:f096:a1dc with SMTP id 98e67ed59e1d1-3903c58a715mr4480764a91.11.1785911378992;
        Tue, 04 Aug 2026 23:29:38 -0700 (PDT)
Received: from [192.168.0.100] ([49.204.17.188])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38febfdae56sm3598635a91.2.2026.08.04.23.29.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Aug 2026 23:29:38 -0700 (PDT)
Message-ID: <7089bf29-acdd-49c4-a32e-82e266019910@oss.qualcomm.com>
Date: Wed, 5 Aug 2026 11:59:32 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 3/7] dt-bindings: sound: qcom,q6dsp-lpass-ports: add
 Audio IF clocks
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-arm-msm@vger.kernel.org,
        linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
References: <20260804070307.117119-1-prasad.kumpatla@oss.qualcomm.com>
 <20260804070307.117119-4-prasad.kumpatla@oss.qualcomm.com>
 <20260804201645.GA1781336-robh@kernel.org>
 <8e362b9f-c19e-477b-b01a-74597858edfd@oss.qualcomm.com>
 <b814a4be-7c20-45e4-8abd-5e67a6a3b5a1@kernel.org>
Content-Language: en-US
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
In-Reply-To: <b814a4be-7c20-45e4-8abd-5e67a6a3b5a1@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA1MDA0OCBTYWx0ZWRfX4IPC7V6QXkJd
 FBn9hSDW0Z2fqiZqurja+P1FsbbtdZHmnAZhYZvl5QU6eYlmCnuShkO8VTeTXHJoihXVY4QnDrZ
 TqMUMiByyssJIS9ufkRmGNeamgz77MY=
X-Proofpoint-GUID: nXC1mVSMib0i0cbPypTuf5qZ_ygt5ZnJ
X-Authority-Analysis: v=2.4 cv=B5aJFutM c=1 sm=1 tr=0 ts=6a72d855 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=/JTPBhwEQko7YaD0RKblyA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=F0gcz5h779UazcyIt8cA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: nXC1mVSMib0i0cbPypTuf5qZ_ygt5ZnJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA1MDA0OCBTYWx0ZWRfX9gNcvCfCqYug
 vwFoays1mBOtyWhF97Bt98lYQKgg7mWE54etVms3VR/WgIOASbfhRf9ydN28mkddujYmZs+6VTD
 GtGTukSjU3rhZSoVYy7PtNMSiO0yTb7r5LBKkGMXbFV9/j9bpLyc2OS11il9N4CYY/OXCVhtZEs
 kdf+0ZCj02OmJds8KzGrU0WUZf9AHkxwIv+wya0Q6GTb973AIOjilkl1YMp/drNz/CYGBMQFKpr
 2kyIGIZXt/2MSTcc/9wivPRoobsDkEMe3ZnML/UZ8f69Z47HOJSLrn/nhDPSQHfpdMFIghg/84e
 wxolUjkOJgjZYtOF1oa/Ix7AXX+3EfKn+jeU0ncjxs2CrZ0tu0PR2s9NbKYgRGE6QYE33CAIQeU
 +uI3THWw2PRIGftYvF41TywIom7Ikk4pxvgPQbZUawFeI2IzxcYPiLnVllSHVPnuFb4rweGA6Mr
 I53Dp0Ir4UVI9tffiBg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_02,2026-08-04_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 impostorscore=0 clxscore=1015
 spamscore=0 malwarescore=0 bulkscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608050048


On 8/5/2026 11:40 AM, Krzysztof Kozlowski wrote:
> On 05/08/2026 06:40, Prasad Kumpatla wrote:
>> On 8/5/2026 1:46 AM, Rob Herring wrote:
>>>>    #define LPASS_CLK_ID_RX_CORE_MCLK2_2X_MCLK	70
>>>>    
>>>> +#define LAPSS_CLK_ID_QAIF_IF0_IBIT		71
>>> LPASS_ as saskiho points out.
>> Hi Rob,
>>
>> Thanks for catching this. The change has already picked, so I'll send a
>> follow-up patch to correct the typo.
> You received several sashiko (6!) replies immediately after sending yet
> you did not respond to them leading to Mark picking up this patchset.

Hi Krzysztof,

Thanks for pointing that out, and apologies for not following up on the
reported typo sooner. I had noted the issue, but unfortunately did not send
the fix before the series was applied. I'll send a follow-up patch to correct the typo.

Thanks to you and Sasikho for catching it.

Thanks,
Prasad

>
> Best regards,
> Krzysztof
