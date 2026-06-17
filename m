Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B63B406287
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 13:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781702879; cv=none; b=OKlSJktYk0SKU5P77bzoRDg+LwKtBIjza5VY5JmBNy/a6kEqUTIHTTJGbbXhebxqISxJzkSL6YnSF1ChptH5eGB8KDBsV+pNGyy1fHtVffqsRZEP+Hr85CSBERw+oA6o8MUAcDV7wnWUL4pg5xHdQ4nb2vWhJX6DeSRtK1XoZZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781702879; c=relaxed/simple;
	bh=UNgDj/HhVd5CGFuFsZnB112MTAOb8FrY++RoOaK7DHw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lwUY2nuQ9KAXBMEEQb8frWggoIV259eompuDUe+r/rcFZZY6unW9ibvV4OzkxKE9QLCx8aVb9wlV+mwkjLOZWtUa0yirvigkHYayhCpVvOFrv3r0L4Cka2fswXMlS0lMuolcppRnII+nmhYniDcN0u1x4TrJGgl6OP1uzcQyrrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Apd2xe4g; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QLrtjA2o; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Apd2xe4g";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QLrtjA2o"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65H8V6RP2291343
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 13:27:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TYb/iP1ewlFqUA8W2oRuuluTjLhvk3FAuWzFqY+wmkU=; b=Apd2xe4gqdncpXDL
	1t6SRb9eoh4XQC1uDRlDvHUVz6Z7QKHd2Nw7g7RCVimYpugCfH6I2+U7N1ZYin0r
	lWaljejPz+mXDApBVval0MzQaRMosfkBcbv8TnQv8dJlxd7fKIcT2f82cZhokkvL
	5qpHhiZ+kBxEezBpS5ymhzcksfY69Ml5rTKkfF9xR4DrraHAfSD3BKoKjwViF7iT
	pJZv22rXH2qAocdtJLABC1KtufS0IrIHJsE4xnRF4+v99ZNR0N6dU36hUiAj7yzy
	FTQOUhH0CGjQoif/X5xV9IuZVYNG9KY5rQF9mbv5DqtVNVA+yx+e1N2tVD6aofFj
	ppD2Xw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eueevkcjd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 13:27:56 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8422b1354edso7027818b3a.2
        for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 06:27:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781702875; x=1782307675; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TYb/iP1ewlFqUA8W2oRuuluTjLhvk3FAuWzFqY+wmkU=;
        b=QLrtjA2od8ewv95lN3Q8ybP2NpeEsCv9As0JrwrbQhPO9bSFIao8Im0JUXvZHvAWSG
         8xm7lUq/TaN3y2xAffV1ZzdQGuGRhG2oIh+ZZh1v2YSvCPeQad6Ry2kESuzgO8kv1o4i
         UxyW4qB0/+UvGgibwHZEZz74f0GfY3QLFmVpZXyKIjRzy6FxgvRoQ/CbfX93qt1ITHgS
         3CvU6Hf3N4xAr+tLKzh1K+GfY4kyKFPphlacwbOIq9p5aJHFnNIwHGl98JU80r2mquDZ
         adT2wljaJ9qHxOosdQjH00/XfSUj6IXIOTY99p/fNDRMUOAv7U/ljaaqCOMQJXdkFxTo
         mZyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781702875; x=1782307675;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TYb/iP1ewlFqUA8W2oRuuluTjLhvk3FAuWzFqY+wmkU=;
        b=glLKBPpA43WKgLkLij0QgKNZOxpjCCcM9M3iJTl8wqiQzh5hap/fVsW6lPvGGuz0S7
         ikR3zvJ19e6ekhEu6b6pCxssjYxP3jNh1EJkpUq5ChVju142HKvzi5nDiFeW9EZCgJgW
         +BIC06pw8EQpw2dxkTZISiIP4+gXF3BmMVqJDwUhH6CY4QT5bpjyASElCjrD9R4VWpPd
         OXrdWBPJATDY1SkJivFdq3bI6n/30JVUH6G1RBk8sUOjlKvlUC0Qc5P6XaeuJoDTRY6R
         T4WwHyEzBmdPbUnJWM+yt+u0SH3YRWvMDbfW0UAgGEUdG+T8GPrajsmDJwVidA2v7qNw
         oReA==
X-Forwarded-Encrypted: i=1; AFNElJ9ZZdJTiEpxucCSOV9AWWbqVZQkKYSXV9rkelRtaMoVfBA0B0SDxrFaRkvzWJVVK6Q4P94w1tquwLrI@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5VCDYX2DbOkZf+dd/7fQZmsNi2pQDdRhjD15lYlE5me/1m0Yx
	FgwDpgEol3rT2vGBcWzK3hALAr7dXr/bwyng6WKIBltomi8uAVTLz11/mcg1v7kPzYJFhiVWdpM
	oxOLsmo88Rs6bpkXiW3/DwjtySJlCEhfAypj8B/xsuPzrPJ2f/J7Fof9SHmgYrqn7
X-Gm-Gg: AfdE7clB/7wwALIglO2rfYGGYL6pd+WsHOAQ+u40tkxK+WRyjQ0lMEDabrxI+OHp38G
	Fl8zD63aLqMAL9ERHc7AxdRcD/O0ac78pa/BrQU+SH99YccQT5yX3ZcO+HdK+Zc+NXmRtcZyVWE
	dr7g39sxP6RUrNXkBBH9y/0FB7mLOj/FySOgwUs3iutJOrck2LDq/2a1Qynp5QqT1dtQUGkLfoa
	ou72qHFmDyyn7jy3LnSCHwF0Q1ysKROFTQeZUc3mW5QzCRDUCH3k4BgwmwRkNbFQFcwnjqx71uX
	KO/ZaxfU7UtK46yYoPaIIVTe5F/uECc7naQLPpTvLyd2hNAnlsqIywK+Mqg488X1jOSvtSWbh10
	7Y/KxsvFRcq1N4uPXHQBaEObT5NIV1qbFVwEsNyEeHp2ajC/amql6WtCt06edga3/7QHvBNjD1s
	YkmwU=
X-Received: by 2002:a05:6a00:1f10:b0:82f:50cd:e586 with SMTP id d2e1a72fcca58-84524443d7dmr4092468b3a.13.1781702875566;
        Wed, 17 Jun 2026 06:27:55 -0700 (PDT)
X-Received: by 2002:a05:6a00:1f10:b0:82f:50cd:e586 with SMTP id d2e1a72fcca58-84524443d7dmr4092434b3a.13.1781702875119;
        Wed, 17 Jun 2026 06:27:55 -0700 (PDT)
Received: from [192.168.1.112] (ptr-48-167.coastalbroadband.in. [163.223.48.167])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434afd17f5sm14768044b3a.39.2026.06.17.06.27.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 06:27:54 -0700 (PDT)
Message-ID: <8aa63705-08e9-444d-a262-ae255d5010b4@oss.qualcomm.com>
Date: Wed, 17 Jun 2026 18:57:48 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/6] dt-bindings: sound: qcom,q6dsp-lpass-ports: add
 Audio IF clocks
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Srinivas Kandagatla <srini@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260610154517.134570-1-prasad.kumpatla@oss.qualcomm.com>
 <20260610154517.134570-4-prasad.kumpatla@oss.qualcomm.com>
 <6238983c-6b10-4639-b6ed-d1d25b00e748@kernel.org>
Content-Language: en-US
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
In-Reply-To: <6238983c-6b10-4639-b6ed-d1d25b00e748@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDEyOCBTYWx0ZWRfX35XIJRzMDavq
 Goa3hUsIVmN3jjCxH+FZOqbbKR1Wgv3Byc5zqDIR0ITUcqPGaVYdHx8a8TXoVetKjvrhOUGovzX
 KBtNfW7gworVc6IiAVWp84+ptRItRTs7+4KBcEk0t39GHq7ITF+AKFh7w4Tw4OZkfZav4gJOSrN
 hxBIlG1gcJYgM7HnoSf/HlT2J6189fiKw25wUTD10iPOW/kCwdpOMcr90lQd2hWPdfwB5LffZFs
 pUwo/rL7RAZsDcmhwXci2S1QWH5zo3hBS+40zp6k6DXIKEaC+66VTvObfGxhIsi7SAx30pQnp1V
 F8hXdG3/zBb8wNtJyX+pZeu17iwYNe7qMKZB3Vpq8ifuNb2Eeae9gyUdzAw7ijwrVfbDJnd2zMK
 VC5xVAtbXAtPRNOtiAB4yGv7tY27IH+SWL9VpLIW2eym0B0pMi34k7JIKP7GjcGIWKVHvVRu8as
 6nnepWqtJCVpSsbRJeg==
X-Authority-Analysis: v=2.4 cv=LM1WhpW9 c=1 sm=1 tr=0 ts=6a32a0dc cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=D3hM7nRbATf/MWm6WF+yZA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=P-nLkKpV7BsKi0cTG20A:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: A0whvHmM2ozwQdqOQik1Jflrj1HNKD8R
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDEyOCBTYWx0ZWRfXx6JQBBF0YZwt
 112IyffBIeXRM+TLzFC4Ixu/eRu9Qp7UDf4oojRUAbDM15izgtuwBSsNe74EBHdU4Wqvv+wsc19
 IidN6CCiRpbS404rPCaXkeLDNNKSrA4=
X-Proofpoint-ORIG-GUID: A0whvHmM2ozwQdqOQik1Jflrj1HNKD8R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-17_01,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 adultscore=0 malwarescore=0 priorityscore=1501 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606170128


On 6/11/2026 2:29 PM, Krzysztof Kozlowski wrote:
> On 10/06/2026 17:45, Prasad Kumpatla wrote:
>> Add the LPASS Audio IF clock IDs used by newer backend interfaces.
>>
>> Platforms using Audio IF module backends request the interface bit
>> clocks through q6prm. Add the Audio IF IBIT and EBIT IDs to the binding
>> header so these clocks can be referenced from device trees.
>>
>> Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
>> ---
>>   .../sound/qcom,q6dsp-lpass-ports.h            | 57 +++++++++++++++++++
>>   1 file changed, 57 insertions(+)
>>
>> diff --git a/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h b/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
>> index 45850f2d4..bc860fcbf 100644
>> --- a/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
>> +++ b/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
>> @@ -233,6 +233,63 @@
>>   /* Clock ID for RX CORE MCLK2 2X  MCLK */
>>   #define LPASS_CLK_ID_RX_CORE_MCLK2_2X_MCLK	70
>>   
>> +/** Clock ID of the Audio Intf 0 internal bit clock (IBIT). */
>> +#define LPASS_CLK_ID_AUD_INTF0_IBIT 71
> Missing indent

Hi Krzysztof,

Thanks for reviewing and comments.

Ack, will update

>
>> +/** Clock ID of the Audio Intf 0 external bit clock (EBIT). */
> This is not kerneldoc. Please do not introduce your own style.
Sure will remove and add proper comments if required.
>
>> +#define LPASS_CLK_ID_AUD_INTF0_EBIT 72
> Why everything has "AUD" middle prefix? What is Audio IF and how does it
> differ from Audio on this device? IOW, Why Audio has to be specified? Is
> there non-Audio block?
Agree, As this is already audio, it may not required to use again AUD in 
the macro to represent. Will update.
>
>> +/** Clock ID of the Audio Intf 1 internal bit clock (IBIT). */
> All these comments are pointless - you repeat the define name. Explain
> once what is ibit, ebit etc, not every time.

Sure, we add comments if required.

Thanks,

Prasad

>
> Best regards,
> Krzysztof
