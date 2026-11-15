Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794776649;
	b=2eujxLpCRLTm5Dk9/HQX3HY4zAj0cZn3D8QNc5CYFKWHVeZdAm9w7WTgeTtlTWlzhQ3E
	 zsX8NJd0p6PDJVJe2oFJ6LKVazE0fpYWzHm0aPdvfnp02f4kDm8f2MrVS5NAFHdwRmOkG
	 reysvFvdlYx58+LdNsiFmltAo80eR1cCK9ORJKQOpsgxaBIdgtFNOapTlPy/C1YTcNXnv
	 Of8xLKzTySeV2JGsifK5Noin+/9n63AiJDJJ2niUIgudr1XtD9FcPBy+BgcElqQi4IeYs
	 KS+72rHw2Mu3NX7NROERk5kFPceTx4AuwJbIt1oCLia8INT8HJMQJQPHxX6PCHwj/lw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794776649;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=xF0N7wIrKZN0ZDKjgQRiE04//Cg2OzQF29jjEwloBSQ=;
	b=vEOFIYTS5iv9TU4sqanLstrVOV/ev4Gjz+gEbTUh5/fIX+X8rCklINugGkBcp07rPZ5A
	 hItZfUUKmwoMFOBL01kBaDdH6JYtE2roV7DOz4sdppIuS/ItEVATDNZT0dij19wU14j0T
	 /hbZVqDavVkW9H4XI3G/Lxm4vBJYsCbON7NKfGoceHfrGLAIs69uv2rO3f2U1zIDjwfKU
	 +nDp9ARC9/qIONs5pJR+sgQ2Cp5r/oKAQpQFWOeaDPmGCT873IrnuOtzwfrEggPDsrD8A
	 ISP1AGTGIsRAxOj287ph2k2fUPyY8WRCAMJ0FEJ5OlGmb9GQtv0LP+G3x46NHAZizqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nZ78Q9ba;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="MXARMSj/";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C730606A32C
	for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 21:04:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C730606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nZ78Q9ba;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MXARMSj/
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AFIRNQr3620141
	for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 21:04:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xF0N7wIrKZN0ZDKjgQRiE04//Cg2OzQF29jjEwloBSQ=; b=nZ78Q9basjtzbufb
	bsGuc5p9DB0g1PCj+faIJPTKWjoMfCYXmUiPHibTlP4jWRRRbiTTM3ubyUQaiKuQ
	ygGtlWFw5d9Z9zSmkTB/6WrZ7B4QM8cUdq6ECTiyasT57LQ9Rn//EliSQ9b3XqB2
	3kylkqLUMLEOca+6q5ypWJoTC/enUbrZ3qpS4OyVxqvD3xCh3WUqBsZicI6KuZRM
	0ELDEvMNwzP/VjZbChoQcwZI57Ov3ctC8DC6r7a+yiV5AAf+9qYXUjVirIrRFJrq
	J73jJRDWNUJ1+5JtpJnL3hUsQQ0noyljMJ7R89a7wannUyX2m/C1mQJ/A3qUJtQJ
	eu+zxg==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhjqktrf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 21:04:08 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-9806e283b0eso2344659241.3
        for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 13:04:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794776647; x=1795381447; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xF0N7wIrKZN0ZDKjgQRiE04//Cg2OzQF29jjEwloBSQ=;
        b=MXARMSj/UQW1iD14BO3VGCZEZbg2RKbFpYl5uOVBayL92sueDW2Gbjj04+HOnpWK+V
         kj0p6rhUHC9XWZ6ktOyvB61Fb78qvOWg1T2UDAWFA60Yu+wKIjP4Yby6dCDLp4g94OaU
         WeR/NcSP6drn0brwqH0AUyhWsURVFdRMZA475jIj4qpVnGp+dcswko0RuQ+gQwVg+rJZ
         uQtuazvQwS1RjWKDOiMdRzxIqlrVUDw5W9m/QcQKp+HrEqV7pIkSYJ64kL7oizuDN8l0
         pua14L0/BAhNXG6J4Mi5OcNxQc7O10vbCad5AMbLmbtcOvalYveMygL4JanJDR7tjvKl
         i30g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794776647; x=1795381447;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xF0N7wIrKZN0ZDKjgQRiE04//Cg2OzQF29jjEwloBSQ=;
        b=poCp8rNst1lYDlvp8P0LWmqTUUn9eN95okrEYkWYIvs7MRmDyyLHG08/po/W/hfVRG
         IrMIiT1yaPuLKPXPx3Wegeyr8c+b3leY7xU9sRp4FxV0IuW+lYsmjPBodF3oNnkPBUWi
         uw2sQIvBfQJyBi2NT6YpVLxb5zSB00CHQZIPBWLT6BQ6pEs0HH0UJQ2KGqT/nLD9rKx2
         eTXQA+lKYND92WgH9nZkKapwfvZOONOJM+poDrLcn6WhEA9Pu7xR8U9VOHKC3dKXtJlt
         blELS9YLpOBR2azJOtfRwSEjHpXJD3tLvCiTaBs1FV3ak2zyB6wQUC9fYmvn8CJCaejD
         p6/w==
X-Forwarded-Encrypted: i=1; AL+hErEEv11zxHqKtg83aVP8uNY0QjD/MLw8cK4qDJ9MojriEKgcGfXC4s1mgPP3/5rTzWMVJ7mu9od9fpk+@vger.kernel.org
X-Gm-Message-State: APuU4Z/rwdB33hE2LhOHVOmmVlPGsNLzrqTkmmbhr61l7bAfh+/rF6E1
	skq8jE+5dzSm4/IWYA0awZIGJKhWutc/4AiQSgJA7Eq6E9uGtSiLlXoekzqlEAaosFffvXxJLyn
	Ja/4QxQwDT0zTwXomZei27b171Q9tkydAVQo4Si2llSfhFXMqKPP7vptVr19Mc3Lq
X-Gm-Gg: AYBFou1fwKKSh8grSTVar82RqP35YB7Gr8MhI9fcm/tH0yL/N05i+/7t6nFbIAOskIl
	JUZoEbCmXdpe35qd71ub8XrMECy98RzWWyCUbj0HDVsItjNXDsaiB1omWSSIRw1CoBmdkvkP5pV
	S0abFjetqMCzRLZA17LoYeb8Y8HAcF7UfNsWiT1R7HpI/mbl4dZIp4LtlNkiBm6RQi6fjN/7Rqi
	1m9xFDGwrvj1b9HhtF+aq65Lh3QcvD94lfr9FZ7pCbNgMNoiSUS6qDvKhQj/l/lfIImMXqa7p4I
	yc2zRqEbpHLZOr5VYiD2IQRpmxbk0tipBBTkHGxN16Xh6GJhJRfMTKQ5Qrqr88Sh2Nk/0DRi834
	Yi9l0PoW3vctUJ+igvE/9c6cHaBT8GuOXxZvCu0KKiMGj1hplXmpE//NjFi/n12d+P1GqInd83O
	Gz
X-Received: by 2002:a05:6102:a4e:b0:7cc:2086:34c9 with SMTP id ada2fe7eead31-7d64d43bcc7mr3103470137.2.1794776647523;
        Sun, 15 Nov 2026 13:04:07 -0800 (PST)
X-Received: by 2002:a05:6102:a4e:b0:7cc:2086:34c9 with SMTP id ada2fe7eead31-7d64d43bcc7mr3103456137.2.1794776647090;
        Sun, 15 Nov 2026 13:04:07 -0800 (PST)
Received: from [172.22.9.204] ([217.110.90.56])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb65ce005bsm156345935e9.14.2026.11.15.13.04.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Nov 2026 13:04:06 -0800 (PST)
Message-ID: <43da6a90-3a5d-4a2d-b2ff-7f007faf7abe@oss.qualcomm.com>
Date: Sun, 15 Nov 2026 21:04:04 +0000
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
Subject: Re: [RFC PATCH 08/23] ASoC: qcom: audioreach: run VI module in
 calibration mode with per-speaker events
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Alexey Klimov <alexey.klimov@linaro.org>,
        Ravi Hothi <ravi.hothi@oss.qualcomm.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261023171433.820092-1-srinivas.kandagatla@oss.qualcomm.com>
 <20261023171433.820092-9-srinivas.kandagatla@oss.qualcomm.com>
 <179476416982.140154.6938504071664790577.b4-review@b4>
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <179476416982.140154.6938504071664790577.b4-review@b4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: y7mwyeWc0ju4hvd3zNUfEK8Ok6ZxcFBm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE1MDA4MyBTYWx0ZWRfX0PV49l6tyCnt
 pgB22liyFsJnEKcNVbX00c1D3y6KZg/HvjCEg7Ud4IGngklcreCs0+HtGPr1qiqpn/x67hYikod
 yTIKzCo5kIE24ywYwL741YHgxyjemuYDJtG+8q0qYmfHNyMp73dBxYU7tg2XY8J0YdfDOhcO22M
 QUZc0SN1LDjUMO/rozyVGg+++R1vp31E+QcNJyZ1VE5ZmWfknBHMBIwxnAJLyp+grObSvVGzCpI
 kkZr2dcqy/TfGItX4UgK+rhLqNaMipsZgPC0edSGgqrvxNhHM+QhzEqERb29GR+WYz/j+TAvB3J
 DQ1WDoi2OiIykm7ct2Z3g2Gztwm3c8fu5ny1KOohjofLbNifgZpebo9WJwdkHzd7Flkw0i4lFb9
 fti7Q4NcsrNcoa5zQewpstZgRi30WaOMyiOirRD4VhkFaqCxuCeAis9LLpq4QD8WzKAQ74BN5FZ
 ISSXwGAFIHOuDwkI9zQ==
X-Authority-Analysis: v=2.4 cv=TqJzFzXh c=1 sm=1 tr=0 ts=6afa1e48 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=hzUeyGCwRGS7WCfWEAyTKw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=tHvR0g-A6sjxE3NzUXEA:9 a=QEXdDO2ut3YA:10 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-GUID: y7mwyeWc0ju4hvd3zNUfEK8Ok6ZxcFBm
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE1MDA4MyBTYWx0ZWRfXx+lXS8xDAdQq
 TMGBOJw8rhEdgiW71qEP2nzQDctdOmZqkc2KKhl0q7WtRu1M72hdx3GTzai9GzK3BXowoyLaST/
 hviDGfgTWLNQicFH+liTV1kGMWz8a/c=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-15_06,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 phishscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611150083

On 11/15/26 5:36 PM, Mark Brown wrote:
>> Put the speaker protection and VI modules in calibration mode and
>> register for EVENT_ID_VI_PER_SPKR_CALIBRATION, so each speaker's state
>> and measured resistance are reported on their own.
>>
>> Number the V/I channel pairs consecutively, as the VI capture packs one
>> pair per speaker without gaps.
> 
>> @@ -1483,9 +1513,20 @@ static int audioreach_speaker_protection_vi(struct q6apm_graph *graph,
>>  		return -EINVAL;
>>  	}
>>  
>> -	op_sz = APM_SP_VI_OP_MODE_CFG_PSIZE(num_channels);
>> +	/* One 32-bit V/I word per speaker, so channels == speakers */
>> +	num_speakers = num_channels;
>> +	if (!num_speakers) {
>> +		dev_err(graph->dev, "Error: VI needs at least one channel\n");
>> +		return -EINVAL;
>> +	}
>> +
>> +	rc = audioreach_register_events(graph, module);
> 
> What unregisters these registrations, or does it just not matter that we
> do this a bunch?
These events get automatically removed after the graph gets closed which
is on every stream close.

--srini
> 

