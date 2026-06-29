Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E66E83A8FE6
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 06:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782716024; cv=none; b=HrsJZw30wpGtSjlH4Fvn73ztI+tYlt1nUx52nQnumhN4t163JSMxsUoC8GesO+vIMKU1wBiPcrrKUHMC50AdvO42s2eIiCSfWR9pGSUNtPFNDdMZxn19JN5KRm+9baHuc/USWoQQBd+YQRMJXRFdB6mVIcI1zC1mOS8olTRRfPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782716024; c=relaxed/simple;
	bh=wlpu55swFFLrLRJnzJ1mOe+yJSMYqu88AQxY+bCp1jc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SLCcw7E3KiAKfmjqpjqHHWcX4J08Ah9L9sTbhna2RZTtAlzGffJzUTUNbii5925edqukA7EB06hfLGa0avBsB3j4hgee1mpnxos0GCjzZwZnKMpgVJW4MuWmy3HJMVUY4D6XcHBhHEyMMuGQ1g6dgXh6DD8m/ZlbkWXviAgzFdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jOqmZC08; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LTEQgiHd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jOqmZC08";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LTEQgiHd"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T6rDle2135775
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 06:53:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LzI35U/vzeICZsBKQayEqxYqEosNZYnabHdvb9OWgbo=; b=jOqmZC083JuuYp0/
	78SA2PFS3jmYR3P7qJndaG8OFV2oMIK7qRyH8g2yIto0656klRoM+hghIaoOaVla
	tHtLQn5N0fIGUpeDyyalWyKOM/Ttu52NUS78Cntf3HNL1XVuSzm/uuh7AMPhAgxH
	lRSqkoL7IrDhvs0PjNSaLZ7PmTBigLDL3UFno2OzFKWs8QHM8CiYNIAeGY9MCKP+
	n6BA/AGQTjjwNJu2vZ5MbLP0k00EGa2wyZK8A51SGLgF67IXIOT46344H6rdAj9V
	YMgJ6SM2w5lgE9YI8Nr9ytFEXkPZXjtwfZ+UsTuL3opVCXg0UEJ/taK/DP92He+h
	jdIi1g==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f26tun0xn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 06:53:42 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-37fee8a7813so590757a91.1
        for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 23:53:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782716021; x=1783320821; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LzI35U/vzeICZsBKQayEqxYqEosNZYnabHdvb9OWgbo=;
        b=LTEQgiHdnpZjnVe8k1NpsffWOzUHE4yI/T87giKtkOzKdJglDXBfU1ij3xI3O1O/hU
         8dTXwtPAJegNHBh0KC67MiN7UnsJ++sMW6jXfUcq939LmSv5NfMO4HFdU+fXTo11xXgf
         A2jeKeovvCdKqPhmBNfdCnmzzb2AgKfPwl/W1ojgTzE7dry1HcF2+2QjJ9dfehs9Puom
         P7Mw5E5/K2Gbu6X96mP944yIH7MFzakCLbwShpj3kZ7fLEvrctxA8m0s8aQLR+ThLUeu
         yb7rncmP1xUa2m1gCbfaLy+rLGqZe7oV3WyGpczedehB+cATrkN4k6I70Xe9TnCWwZc9
         rtmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782716021; x=1783320821;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LzI35U/vzeICZsBKQayEqxYqEosNZYnabHdvb9OWgbo=;
        b=bN7pRPmAj3QIdtBpUE6s+KaFU7YmCnco7p/6y2Esk6M9FDfarbkfiZkDQ4DJeBSoTp
         q8YIP4Z29pbE8+RLMuQRLaBt97RUrqobfnNrqV8nC/l/bDMKYwiLGU7a6WxXNwfebtMq
         asG5Jw2aqke25GkXEdCWCbdPh8AQYVKR2qtlu2AGyQsD4KTDBjCK5RGM+0KXFee68lEW
         yDaKLsvpPJsfvH55P/9olopFoEmdBG+Lw1QjNydEJjGtyAIbVeP3YX/pAXDX/o2Jd5q9
         Q1J7s7DrfQEe7icObpc/gwVuvg8+ZQSnCU1PSiwUkJm01VBTCJ0xv0iyNnPNTt9hVuZb
         mWgQ==
X-Forwarded-Encrypted: i=1; AHgh+RpZvUaaEL8Sgst2kjZ8HxXfQwS9zpJUAWBtcONwkO1j36RMsaCsfulfUOOrir8Czw8jhzzCY5uwHiPJ@vger.kernel.org
X-Gm-Message-State: AOJu0Yx10ige2tfLgl+2XvXPatpyb30tRPrHXB8NgmqSjZJXEAP9/whE
	H7nNw36L7l+EcIyPF8UrFT5JlRUax4deaJ5so6bwZB4wlXr1l074+fJlmm4ASjogUpTdrtLFpNg
	sQy/ZjKMQa35gKY+esWvaCSF2TbOCOFe+DdObNR5nzCAkgR4nXi0zwO6DdczbynXH
X-Gm-Gg: AfdE7cnlgnHvLJBpf4eaHrnn9wV+NM1Z0fYKe/3JjpAGOSQ+Yn3u/bZbLqq/NVhOTtA
	8Qe27r4q9kYFn64Drwapefkmz+WpaEsPQ2gizxSmJGPv8a9GZvKNLZ/mtO7G1ANSovLHvkc5RI6
	iTJsck0Ah0DVueJpYBl3xfp8XuegYhN8XhDfWi7Fdgayk3lUNRPuqA8dEciJFst3EfKROcc2YOq
	S1p8uISZ068tKJZgT8B5lubIGYuDY+nmVn9xC3r4H4daPqK3MDH+lJl21Cupmf5FJc8aM/dN12Z
	AxkqUDGuF5rp6VGcFYiMrxYvHAosaF2liGqZcihz44mzfODrUTB2Ct4T1pjTR/V7Hq+mIE1rstw
	2qf5WtDPmlqfT06aKCqQpBUGiPGwX4uaIwz4OUQ==
X-Received: by 2002:a17:90b:558f:b0:37f:be6c:f3f2 with SMTP id 98e67ed59e1d1-37fbe6cf68emr5802851a91.2.1782716021478;
        Sun, 28 Jun 2026 23:53:41 -0700 (PDT)
X-Received: by 2002:a17:90b:558f:b0:37f:be6c:f3f2 with SMTP id 98e67ed59e1d1-37fbe6cf68emr5802847a91.2.1782716021018;
        Sun, 28 Jun 2026 23:53:41 -0700 (PDT)
Received: from [10.204.78.62] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3801dcf2196sm289571a91.1.2026.06.28.23.53.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Jun 2026 23:53:40 -0700 (PDT)
Message-ID: <0f3a199a-d9b7-4d8b-a17a-85146c618977@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 12:23:35 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: kodiak: Set up 4-lane DP
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mahadevan P <mahap@qti.qualcomm.com>
References: <20260429-kodiak_v2-v2-0-c3a703cc30eb@oss.qualcomm.com>
 <20260429-kodiak_v2-v2-3-c3a703cc30eb@oss.qualcomm.com>
 <akCGiJU2pIlLEi-D@baldur>
 <s7gon4o57b3fe2kuz5lell7yb4iw6tdmmg7l3emapbqkwx3ml7@irg2myydcmyb>
Content-Language: en-US
From: Mahadevan P <mahadevan.p@oss.qualcomm.com>
In-Reply-To: <s7gon4o57b3fe2kuz5lell7yb4iw6tdmmg7l3emapbqkwx3ml7@irg2myydcmyb>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: qSz50-J5jE_ah8aQaOc4bSgFfBU8DCMY
X-Authority-Analysis: v=2.4 cv=A8Rc+aWG c=1 sm=1 tr=0 ts=6a421676 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=4MOLs5CX9ZFlVaH_dukA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: qSz50-J5jE_ah8aQaOc4bSgFfBU8DCMY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA1NyBTYWx0ZWRfX7iGxqhewPt4L
 Js0unGpEPNTP+8id1B5H/Uyraou7KxuhrwsWyvYsIfWUbdqT2S30mWVbMJJYGendGwA/7w6BX42
 E2FiycPKLU3YVB53zVGbvIjloba7sqTAfQbVtRvkTJZNm40JiXuhcZwgyU6SPJT3Apoafk5YraP
 +yD8J659gyUEg2mI+QZy/8sBGxhwZADmynSBth6+LRGV5ta0MeEa7NMmLoypksgxjDNmGarX11n
 fEfPtpcmQyIJevVNlYdEpye10HzV34B0Bk4xKDxzTJ/iQSBCWH17KmzUxrkyNwPdkogl0W+zp/k
 AbDJRzkC3gt999auNEDfDpiOHcYl9yg2/IaZGhavsiMEMyVt6sM1gVwHgkFZPudt7oHuWx/4GW0
 PoecqQR6LyJ+eWRFiOU3CkZyHxVoaEpvyFVuZR6eGf3lwXMSEcl9vGRWS6mV+MlVjdJDtDcmr55
 QBhjplsM4yeT60kBYSg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA1NyBTYWx0ZWRfXy784L+srMer9
 70jgiReAqpXv8rakP9uIoPPBa43l5eBlKkEmgkE1cwYfT/7s3eLvI9NUXHuqo1RWxw9PqIOgqda
 eoJ1+iurZM9kvVCCnk+zIlqox45hdiU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290057



On 6/28/2026 5:51 PM, Dmitry Baryshkov wrote:
> On Sat, Jun 27, 2026 at 09:28:47PM -0500, Bjorn Andersson wrote:
>> On Wed, Apr 29, 2026 at 12:10:42PM +0530, Mahadevan P wrote:
>>> From: Mahadevan P <mahap@qti.qualcomm.com>
>>>
>>> Allow up to 4 lanes for the DisplayPort link from the PHY to the
>>
>> It's hard to follow your thought process here, as you didn't document
>> why this change should be made. Start your commit message by describing
>> the problem that your change is solving.
>>
>>> controller now the mode-switch events can reach the QMP Combo PHY.
>>>
>>> Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
>>> ---
>>>   arch/arm64/boot/dts/qcom/kodiak.dtsi | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
>>> index 0acc6917d7aa..204513a6bd89 100644
>>> --- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
>>> @@ -5704,7 +5704,7 @@ dp_in: endpoint {
>>>   					port@1 {
>>>   						reg = <1>;
>>>   						mdss_dp_out: endpoint {
>>> -							data-lanes = <0 1>;
>>> +							data-lanes = <0 1 2 3>;
>>
>> And as Dmitry pointed out, not all Kodiak-based boards have 4 DP-lanes
>> wired up.
> 
> As a bit of explanation and context for Mahadevan. The link between DP
> controller and PHY is 4 lanes. Historically we have been declaring two
> lanes here because the DP / USB <-> PHY interaction wasn't finalzied,
> so it was not possible to use 4 lanes for DP. The issue was solved and
> now most of the platforms should be able to have all 4 lanes here.
> However in some cases, platforms like Herobrine use this as a quirk,
> because it was impossible to describe various quirks that they have
> implemented (in case of Herobrine it is a fancy 2 lane split / mux).
> 
> I'd recommend the following approach: enable 4 lanes in the kodiak.dtsi,
> while, at the same time, leaving 2 lanes for the following boards (which
> should keep the board-specific override for now):
> - sc7280-herobrine.dtsi, it requires special handling for 2-lanes
>    topology
> - qcm6490-particle-tachyon.dts, it might be missing a redriver
> - qcs6490-thundercomm-rubikpi3.dts, it might be missing a redriver
> 
> The Tachyon and Rubik Pi 3 boards might be missing a redriver, which
> would need a reprogramming to support proper 4 lanes DP (or they don't).
> Anyway, that needs to be confirmed by somebody having the schematics.
> 

Thanks, for  conclusion on this, i will update the changes validate and 
repost.

Thanks,
Mahadevan

