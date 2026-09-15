Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 688744B2CC8
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 16:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789488133; cv=none; b=QBrBFYE4iyhTl1aN1TYPFb+KJfhZ/NBlxwMLMzAeFWhrE553MtuhDyzhxIBNHMtfifOsqgWeAFXsL8+tUzUfo9jLV15q8wFtAF+3pjCeTnMFAVJFKTnpF7ZURkK3sa8TUNEzDOIm8A5Gy9QtD9YMXPecdL10wzd6I+M0myU7//w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789488133; c=relaxed/simple;
	bh=NKJuB0TIpLrtUCM0wUQ3aJBmWdnBf3WJenqkw3nEnrU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NC/qVSrsOb28+kwMGVlA42KcKpE6yAPgEDfikxXjx5IhaqxV1eKEcOA+dZPUdY1kg7AYzQZpBxZIPLW5fXMo5+vyWWgKtwTRflJ4i1uDAZTTQgWlYgJ0qd1vTbxTNhwySV5urBHpBXye6zQkwhfbCHFwlQYlzQw69KWMo64+13w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eycpzX0V; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GLZDE79e; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eycpzX0V";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GLZDE79e"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FFAuLw3349679
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 16:02:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	siGkS8tDMM+UyATikY5KKD95rNCtSbqtQYlyLRx/Exw=; b=eycpzX0VnxykGJNS
	EGyXe31E4ta5U+T4OafNRm4SfX1w/Yy3tHqqklKVLnR0f8SEdqgeBxstJGqnAtqQ
	yu9wKqyYDEDwHcTDeDZiIw5iomem/kVVz7MFsfXzjadCiAXVMMOh8JDPSwSCuryE
	dTS847DBS0+ewmjo1q7xah/LjqiRpu88PjLWJP6ga/BKj8qSGHtu1SlbSdRYMLcm
	eBp0M2Ko0an+f+/+iAMZ9Jr2CpzClirqCsy5qfDgKUBPX1bhEkIiC+Brh5jDrQ3v
	XRoouy2cIZD3f5gGim5wqpDmmS/F593l1GMR1RPK5XAA5aS9pvoJ8Yal/PWS1XWk
	ycCb2A==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpx4sby13-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 16:02:10 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2d7443e0f0bso85104695ad.1
        for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 09:02:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789488128; x=1790092928; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=siGkS8tDMM+UyATikY5KKD95rNCtSbqtQYlyLRx/Exw=;
        b=GLZDE79eqAsBTa4Zb5SwepVYwKnF8OiN+EgBISHQXJSG20xYo4EEw+ngUFSVF01zCP
         1g3v1N0HPNr/jxo63y5m+vx4b04MUPo7NwhJZFmg9XyOO+psn9WFRjhtCokV9KC/sPcB
         Dj+On+R58SGzBcGLHq8LH4eMBr9U8G/1/ueB+Jeze6rCcnYAx39P8wKyUcA8NrIbNsOn
         GhVU4HX+/jbhB5XyQiOe8cy+/YfeMtDE3PZjG0TX6vBnwS/7Y5zk+CJoHOZjiqTYH3VY
         3zjUjDmyXn5PnF2GfwOEH3tvORLRLOd3oxfywDCZZ/B0eMZ5s3ZtRjXZCOnGeUqKzNaJ
         sO+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789488128; x=1790092928;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=siGkS8tDMM+UyATikY5KKD95rNCtSbqtQYlyLRx/Exw=;
        b=wnjm4ct1FczGukO7T6d3ec7gGJs4pNv6abvSzlCYNM8QSQ7b8BkQkNUZKyO9U5NuqU
         neyBbNCk6BlO5wREGmnQkdbLXU5/Z590eDSja4dbybziInqqI1j5cK2DRtyjEkyk7NTU
         RRTZ0PfOYqdLLGYmpFGuhfrKJblhDC17FYN6oxdg2n/O1k2mZWXv/Vn5Id8M5NmmIKhc
         PwXzd5QICZbqVBWfk6Q6jgXXUg7rBX3FNI7vJ0+fvfh4BUPlCnWIT04vVP/6ZLFzvn2I
         6jVwpiO3Xhdk7RXYF1yN0Mu56dj37IXFUrpv6ctbPF8ydmj0KpyKK00SIv90BHl6D1Oe
         GM4Q==
X-Forwarded-Encrypted: i=1; AKwUvBxbnI28/Z3vP1VwsKUsYDGP5mGhyvNBJ7WREN9f6rp8Eo1rm608hQlAV2mYU1BhIE6aKcT6jncEAe86@vger.kernel.org
X-Gm-Message-State: AFuF++kK2F12i4pva3tE1dgM0H41nHNdAhEuh9xkEXFXucjmbaU4H67Y
	WE4yROKpxbN+yN41SztyRsYK5rEvM2tUs8d0XYxxuxJF4O4JauksDB/7+dkke6CB5mMmdQn9VCt
	a5XMBO1YNsP2+re0LLzMh9HX6e8kTB85dqB/3Mey7GgFPz68RYSkjkxFQjKRJ+YfT
X-Gm-Gg: AYBFou0fjgjmecaV/USHcgl7Q166U4hlr6mIckAduwaAvprMCQOZrAEFJN6GEBEFGl4
	djGLBDmGOi0ZO79SGDpBJYcFuuew/h+FuHss4XOtrTT3CFvMIZO2ZVNbaMEo7NRBGZnn1mMddMK
	PHV2qtvCyh40GCnX5rxQApxQs+GsdysygyLOJysBxiss+sQDRgDBgwTPrCTM5NQSyx+CXqgbrr0
	wUym8NHiF+J2RBb5GwyAUsR59qIN//UidjL6CgcWLRzS7bUmiWjFcv9IUAg0OxGDF9uUmkPkChP
	VriKpD2odxzdElzYBryhwbm2Zadb939g7AyS3xIxNq0mLoYYuKbRpXLc2DkiPJ2znfrOS9nyr/j
	wD3iKkI3O9ePvTYJ0aVuNU7ksrnzMBS7cc9nSHeFV
X-Received: by 2002:a17:902:d488:b0:2d7:f0:896b with SMTP id d9443c01a7336-2dd6c6c0d27mr138819895ad.13.1789488127808;
        Tue, 15 Sep 2026 09:02:07 -0700 (PDT)
X-Received: by 2002:a17:902:d488:b0:2d7:f0:896b with SMTP id d9443c01a7336-2dd6c6c0d27mr138819005ad.13.1789488127162;
        Tue, 15 Sep 2026 09:02:07 -0700 (PDT)
Received: from [192.168.1.5] ([122.169.220.106])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd2ccadb4fsm69974165ad.2.2026.09.15.09.02.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 09:02:06 -0700 (PDT)
Message-ID: <f67b20ec-4c5d-4fb6-aa91-f3ab616e80b4@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 21:31:59 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 4/5] ASoC: dt-bindings: qcom,sm8250: Add Nord Ride
 sound card
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Lars-Peter Clausen <lars@metafoo.de>,
        =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>,
        Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
        Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260907-nord-asoc-driver-support-v1-0-997d3b20cf43@oss.qualcomm.com>
 <20260907-nord-asoc-driver-support-v1-4-997d3b20cf43@oss.qualcomm.com>
 <aqFzPyDT_va9VP-i@QCOM-aGQu4IUr3Y>
Content-Language: en-US
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
In-Reply-To: <aqFzPyDT_va9VP-i@QCOM-aGQu4IUr3Y>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDIzMyBTYWx0ZWRfX7yqnFVpu86nJ
 7Ank+2kM2WxCKK5HOzhtqCH/E/wf3CvgNjfqDce2e3oK1lLjhUIEN/6mxvkgDGy+G28/fNnwrgg
 B1y6L9kXFAqhRRg2wRgb6TQ6sOI66Ag=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDIzMyBTYWx0ZWRfXykgbAixqonuj
 D9BRJ1QZoL6dLqqbCZDFrKqOu56cZJUjrI76siaZASsyJAZoh2DcJj2fM+UB5WSvxtuHM46wkQw
 B86gpNgYSzdR3UoszQ7y+tb84ScFjCk6MbrRsmb+6MkEJhtthkAZwl6fZbsee+6kIzYedh23WhG
 uoZ0Kn1A06mZEy+sdk3kOJcK6opwXqn+EQI0CteF3gu8kdMdFToQNMLhl5gVaZGf31amju62u33
 rM50Ub6/4bsuhvlK4iTlhxEpRTyZ6gVb/Ytn1iRIiTGja6KLm0KQ+gLYWnRfltOWGsmBbrXNEyp
 27Q69s9rX8r9jlhLZP4Wpdj+xRz8fUNmNrJeJl5XKsr62533nTshuH3CuIHLMTqKv0tYGf7RH5z
 OuZuagnnoOQNF0MF0eW59Mw+jMtwmvmx9uNtD7im2nZ0E3ce2jeMktpJybx3ljzRBP+aWA6Ie4x
 qkvdWFWY7tPQsU9Gd2Q==
X-Authority-Analysis: v=2.4 cv=HsDjiETS c=1 sm=1 tr=0 ts=6aa96c02 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ww153nmMuBeTcjqybhOiGw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=xBKF7SBF3-SEUEZML9sA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: HSonJgafaw0mZ0mkS6pL5DuQXGKtTsiC
X-Proofpoint-ORIG-GUID: HSonJgafaw0mZ0mkS6pL5DuQXGKtTsiC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_04,2026-09-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 impostorscore=0 suspectscore=0 spamscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150233



On 9/9/2026 8:24 PM, Shawn Guo wrote:
> On Mon, Sep 07, 2026 at 11:39:45PM +0530, Mohammad Rafi Shaik wrote:
>> Document the bindings for the Qualcomm Nord Ride board
>> specific sound card.
>>
>> The bindings are the same as for other newer Qualcomm ADSP
>> sound cards, thus keep them in existing qcom,sm8250.yaml file.
>>
>> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
>> ---
>>   Documentation/devicetree/bindings/sound/qcom,sm8250.yaml | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
>> index 1536fcd96d68..bdbaa8c822fc 100644
>> --- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
>> +++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
>> @@ -38,6 +38,7 @@ properties:
>>             - fairphone,fp5-sndcard
>>             - qcom,apq8096-sndcard
>>             - qcom,glymur-sndcard
>> +          - qcom,nord-ride-sndcard
> 
> I wonder whether we can make it SoC specific like qcom,nord-sndcard,
> so that it servers both Ride and RRD reference boards.
> 

Ack,

Sure will move to qcom,nord-sndcard.

Best Regards,
Rafi

> Shawn
> 
>>             - qcom,qcm6490-idp-sndcard
>>             - qcom,qcs615-sndcard
>>             - qcom,qcs6490-rb3gen2-sndcard
>>
>> -- 
>> 2.34.1
>>
>>

