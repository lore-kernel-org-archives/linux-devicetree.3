Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793395046;
	b=R5PaaRb9ReQcF9Vy16n7oHno3m4igCM0qRT9KCH4AgbOxEN19IVqeg0mIB9A9OvYpFSj
	 BQK8GXBuJdoHqEtkK5WJU2jFB94W1U8tI3VMr1eiBGjL3CknZ3JSo9YftK59eW+sVVSDI
	 kOnJriZ2ld3oWGhad4v2vj/03D53l2GqFExEaZHifBXphFo5Zzg87a01bs85gHyiQ9B0o
	 2ZyKwJFmlHIhY5jZqHQYhzs0/g2RyNPl4iJSrzXVZGKbCr0309G60UR27tQF9Z8Z0UlET
	 5tHWC+HCUPw53e/Wln55WnKiWcZU8+5Qx/RNiSNhgS/Nd668Hntz/HIFEe4d2siM7hw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793395046;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=x/QiM3kznT7Wu13IKF37WvOthsj/0oserWKR8GN/KGM=;
	b=sC85iTOq2FJup2mVMy1AEVXH5mvZvXBJ2wy6adicHmYoRwOz6xqeqJVXbD9nAqofCOPZ
	 g2aRjtZAmQ68kmH2OllRaSA4DZNq5tSY0r/6RedTDuJguVpbgDVmCrzDdekEOOqfWkE/R
	 p6v8ASx8EVKHmdjCDHKGdK1P7C4C+vVHSQCNipApx8WTausmxqJPsjwLbZrO6ccGDYYah
	 L/5LV+utALfe6y9rZrfvYuLPFo6KJmZtZxxilQdbIOIRz/xsH8XmZrBj5BMNMm5fbuGpv
	 TQjClON+Mb+uvm/WWI2QoWiIr7KtbanEBexSkOE91WeCi0WMv3q2Vh+zgud5R9hD7ww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jGhR98c+;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OMMrCAZX;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C5A2606A31A
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 21:17:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C5A2606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jGhR98c+;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OMMrCAZX
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69ULAgVP3852970
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 21:17:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	x/QiM3kznT7Wu13IKF37WvOthsj/0oserWKR8GN/KGM=; b=jGhR98c+jZQZ19n1
	EGXUDDWVe1dFey2lsm6xqJ8+g886G9A7zzqLyQ5Q7Ze/91w+4ILdPec9ULtbfm99
	DTntH+4FIDCTIv4tlWBBf9M//bXNajzo+PTLphFt6/SQu6CH3nFoetyEjH61g23p
	NCzcnuoODUEgUTqEHqvQwwhPutPDQN2+PRJsAQEPhhRw3EnkjoXKaS2mXTk0TKCJ
	prqKPxTfbwBTOXz6+WqKP3Va12hcMtXenvCIRTWGqPI2qtCA3JvkJ1q11DqzAlXA
	6Y+a9EAkLOJp/Bv+KA5rRsJo+mUP4TiDDSg1C5y3as7C3ubLtKsNKnZ7dh20Jl61
	jNGfnA==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn2x180hb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 21:17:25 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7c10b8abe29so824063137.0
        for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 14:17:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793395044; x=1793999844; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=x/QiM3kznT7Wu13IKF37WvOthsj/0oserWKR8GN/KGM=;
        b=OMMrCAZXwk5nukc8v1G1eCj7EwW3mck/ZHGYeDfPVvKaIOvCa8g+UQjw77b2VsA4uo
         keGV7LfCMT3UGtNeZmQAFmU9Pew1FWpY9+WNACC5EERa+A2v3jM7B5yGrchdSdC+dvxh
         TtGRm2/iuTAztqiMt3oP/A8NKg/GgdmHtxo5lX+J/GPZtN7mS+OcPkbjlCSc8SA2uV3K
         M0EvLB4+F94z8A+eEOvzP2sII5W0QiHi491jgaBzlR/NeP96DL0pPJZryZodei9d/4N5
         40WdXd6KIzjW2swxw8Y9xwBYpMxFnbGQ0D6uuvKf+2FyswEDMwxTVZXx8H4ZopmchB+j
         l68A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793395044; x=1793999844;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x/QiM3kznT7Wu13IKF37WvOthsj/0oserWKR8GN/KGM=;
        b=l1k8fpNQeLgWuwBYEfO5F3jCpcg5lBOLzEDsS6JWiaOnG+bBYYJ1jmN6mQ2JTIoxjT
         peSaGc3iJC6OYgawtv2RA5odRbMXefnYOdVUvJ0xcnSHg7llyeH+oFlPCQk80VMUqHYY
         NH7JASaH5oGJPNplHyVjNVXkXrJ5N2v4P967oYyXmUunR0KU9zPrD48SYTZ2IR2PuzFW
         8NDQ5Q+AFA04XmozmqlZZY33yipVYyR/n0Rssfni1rMI4W14NrxAf6uhvzf0ne3+xLEr
         eBg9DshPZLUKUfInHPA3b0wIfO2XlhjL2kK5tflEAPcSt3RSNNAQfXW+pVMz2p8h04Yk
         3QxA==
X-Forwarded-Encrypted: i=1; AKwUvBxV7EoDZHU7z+k+hfvppK1rnMx5gw+u2d7UCrVXDrIK2atp0yo1vjAKWXXKKMpjQBIVM2Xvzi9jU2BU@vger.kernel.org
X-Gm-Message-State: AFq9FYIFk6chobvP80AC4hyNHvjnu9Ec7ljgL15jd08jy6gYac76wbuW
	AW1ARlJSgWN1zVICIrUzyHA6LcVcscNCpLb+YKTa0Coh5k+APWeNgisjPKvkgYjOqQFc/s1rN1X
	CiAVxjV/GDj+7CtjsW39qKkAcGbAt8A7Vp+dGTmi003f2esJ03LLNYadaw7K9Uubo
X-Gm-Gg: AYBFou3Lgijx2DOTdKX3Y6Fzfwq5nRE838NNT9nC4//yPj3lZugE1qfGLfN/1k4fINz
	PTKcufJsCeF0ZrzN62YnZwYYvRbyWoGsuvvE/dzJtPEEYNmCwHSZkyPUaFfyDLPkeirH86a+RGI
	3FfsN8YzbMMymp2I1q2b+PM7g1m7eKz8y54U7qSlSksJ4xmHoCjLCfvmtqIVi8I069rV9RmoJQS
	u9aRxFZNFdDaVamzbH+mAvu/QXP+KMJhUxpfrKvpB4Ircl5JZEu5NNilJM9ZdqToWwbKsy/fNZH
	q9g1EpFavm7RbSjLQHuEoM2FLMcTU0+qpIMwltF2S8QXz6ZEnLufgxI6RXPV0lZKPQVPR2swhSN
	zavLHluryhwIHXzSSxSJkGl+Tq7skIXXxEtzcHrAvqNuoueFNwjhfADChNWys/u84hat4Yhb2xD
	A=
X-Received: by 2002:a05:620a:4611:b0:93e:c12c:9dcc with SMTP id af79cd13be357-94421760e17mr640134785a.76.1793394581350;
        Fri, 30 Oct 2026 14:09:41 -0700 (PDT)
X-Received: by 2002:a05:620a:4611:b0:93e:c12c:9dcc with SMTP id af79cd13be357-94421760e17mr640132085a.76.1793394580963;
        Fri, 30 Oct 2026 14:09:40 -0700 (PDT)
Received: from [192.168.68.120] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4aa81a896fesm178757295e9.10.2026.10.30.14.09.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 14:09:40 -0700 (PDT)
Message-ID: <23ac857a-b340-401b-ac24-77b89da2aa8e@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 21:09:39 +0000
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
Subject: Re: [PATCH v1] arm64: dts: qcom: purwa-iot-evk: add missing DP2 audio
 link
To: Le Qi <le.qi@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@oss.qualcomm.com
References: <20261009030404.1981995-1-le.qi@oss.qualcomm.com>
 <01b4728f-a78e-4932-96fa-795283e91cb6@oss.qualcomm.com>
 <55e20ec8-d6fe-4613-b7c0-d748f2e5944e@oss.qualcomm.com>
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <55e20ec8-d6fe-4613-b7c0-d748f2e5944e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: AlJhf7B2rjTrBcbq9tawBwAfsxZ0qfP_
X-Proofpoint-ORIG-GUID: AlJhf7B2rjTrBcbq9tawBwAfsxZ0qfP_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA4NCBTYWx0ZWRfX1tueYhBjdUT6
 rYi6/LCvOgrFC6VnnNuAYkwh1WAFQYliBHh+w6jmfJqmfFyFKo5GYop0d91KuDBoCIyS/bNgOD1
 qODZ1e3xSXjUgmB+NvnBGNAf/Gte8bvqs7gqgCWV25IyV16n+us2sTd+ikkhx8uSlwqb4TIonfc
 2hd1oky9ofOj346E12AfzKLqgsw+fBYwH3C1qX9Dt5HCbUY+76+GbbNCS+UQhx1/now298tk5XG
 bLwnLdwTOImqumc7tg5Xqe8fJ6Hhw3ndk9aQsnaf+wyc0YDBPNZe+33Zwx+ti8HiXmxJwjXRKqQ
 VOdNmMEgluWkjq2ny1Jaa/OM9wCiz43S9ndesZTKGZ0v4iyzRRiq5AzrhLIzeqp50ZrhozKEGic
 UUm8kfcLsdSL3mXfDOhfA1ZHw+zvWhf2K2lUGbV502OrnocJ7RJ0zSO+B7jKwZFEWVwwyDOF3NJ
 n+9XipCdv9AqJseS/rg==
X-Authority-Analysis: v=2.4 cv=R92WitRX c=1 sm=1 tr=0 ts=6ae50965 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=cwMTcsmotyg-k-KcDEcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA4NCBTYWx0ZWRfX3AGt5NEqCFMp
 FlHtS3q6felQJFbsHVa/fn0KchnUszMHfG8PwT/ot/PrnZ6kgAPyoj7AXe0EGEwpnUBNPK4jPYx
 4KCGO+aa+xLy3R581YjslqXE6kvGBZ8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2610300084

On 10/29/26 3:27 AM, Le Qi wrote:
> On 10/20/2026 6:14 PM, Konrad Dybcio wrote:
>> On 10/9/26 5:04 AM, Le Qi wrote:
>>> The DP2 DAI link is missing from the sound card definition, preventing
>>> audio playback over the third DisplayPort interface.
>>>
>>> Add the required codec, CPU, and platform DAI configuration to enable
>>> audio playback over DP2.
>>>
>>> Signed-off-by: Le Qi<le.qi@oss.qualcomm.com>
>>> ---
>>>   arch/arm64/boot/dts/qcom/purwa-iot-evk.dts | 16 ++++++++++++++++
>>>   1 file changed, 16 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts b/arch/arm64/
>>> boot/dts/qcom/purwa-iot-evk.dts
>>> index a811d8ca2dbf..93cefffd1f46 100644
>>> --- a/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts
>>> +++ b/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts
>>> @@ -641,6 +641,22 @@ platform {
>>>                   sound-dai = <&q6apm>;
>>>               };
>>>           };
>>> +
>>> +        dp2-dai-link {
>>> +            link-name = "DP2 Playback";
>>> +
>>> +            codec {
>>> +                sound-dai = <&mdss_dp2>;
>>> +            };
>>> +
>>> +            cpu {
>>> +                sound-dai = <&q6apmbedai DISPLAY_PORT_RX_2>;
>>> +            };
>>> +
>>> +            platform {
>>> +                sound-dai = <&q6apm>;
>>> +            };
>>> +        };
>> Srini, can/should this be in the SoC DT?
probably not,
1. because the dai-links do not have explicit disabled status, so these
get parsed
2. sound card itself is board specific.

--srini
>>
>> Konrad
> 
> Hi Konrad,
> 
> I think it is better to keep this in the board DT, since the sound card
> is board-specific. DP0 and DP1 DAI links are already defined here, so
> DP2 should be added alongside them.
> 
> Srini has also agreed to adding DP2 support in the audio topology.
> 
> Thanks,
> 

