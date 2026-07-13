Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08E8B383305
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 07:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783927733; cv=none; b=c94ppWm20Eg4sc5gLEI35mimlMdS8NDPnO0zjp4FN4RPAjMQzoRRDfHNPFuzcKmdrjFMRjo+w3Vlw6OigX8bImhbBWEmLkNnRTQ61+6WmhKG0m8VzdMkPdg4gMrOBwwzS6nYeWiOnihGOvWHkX6wP5v2rIWnYVjPwxYbUNfQcZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783927733; c=relaxed/simple;
	bh=rGDsrjx6/tEefZaGByxTg7MZGD+3gZaunHci4Ij2f20=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dE/mFFb8i8+DXYLOcj8syBWtaNLLiNqpDNZSFjf5Jh8/WySKXt29MHrheb6uxjA1jKqtuMGs60o+yaiyx6ByORp+SyLuz1KV5arLOl5weJUdF/spP+iEtUdLO6XAnuWv0jvDdCeVmpaOJHaL7Zyw76ZhNqFcvjg95cOnA1NO7cY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k3BCZdCm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CyhWVq44; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k3BCZdCm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CyhWVq44"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D7KbOP774692
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 07:28:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rOCzC1B5qGhA0DDlrlvVv19f/QDxmZmVqlO5kCPP8do=; b=k3BCZdCmCzGgeTAI
	bEUoMtrGCwWJGfuUqy946ZPHK/PmRpxmbJsjcpySR+SyFYCGRiXBBdoRZP/q5FzA
	yEiL+ecuNVCDOHmtY+mS9QnL77qT3C1ycou5tPUPhmw8wp9/tYDQK9FHJculwhh1
	TWu3Hzw1QER5CDwBrGlv8IHs4vGBUGliOCmzLmqlY2CfttsYg7Nu6cyf59X0IvTw
	dLI8M5Q/Xp3ijTwEWGhrCGVo6/IKJdqWmT85/wUluOgCnbYvia+hkwL8rBtgOgUH
	DmARoohC3Hut6PYyyVM2GGYAbYIkQVlpJ6Si6gvXRP3vjIkXhf9mwQnXyaFSpwiv
	QTPIpw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcuj000wg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 07:28:48 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51a8c689b5fso41208751cf.0
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 00:28:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783927728; x=1784532528; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rOCzC1B5qGhA0DDlrlvVv19f/QDxmZmVqlO5kCPP8do=;
        b=CyhWVq44BfHtuvEFjHLqzDCNPjJoKCXAF4K/oroApBKdLo71/lyOT3XFjbm5yqRMNJ
         f/LQQcA1xg9DPKKMRXf8/NZK0smQcToV7cHcVFbkg1FPvGcT1agWCmi6JolHwpHIruSk
         Z+ThML2NZRqPWVJVQXViU/CRuqyYHAC+OtTJSk8VztZjPOR4bekIbdHDnzb4Y8us25ig
         VC/+1vYCpMgVm4s85lIeZEwAp3mP8DSnVm2yqiBqFpoHO2x26c4XrqK6Nx2WHrKhP5X5
         lPz1w3XmZxyLIYtHdAwOVBIvlidrww/UNGnLociaJoRBG9XNFHayhe/Z96g1CHV3P7jY
         N6vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783927728; x=1784532528;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rOCzC1B5qGhA0DDlrlvVv19f/QDxmZmVqlO5kCPP8do=;
        b=OIxFxR3E6CpMZfdLe3xklaFVzkJd2P1O15QH0iwy/UeGY/6AfStIzOHNTOTo/On1F2
         yTcwiZELO/IVNYVXv/lG+YF65zxMVRbIjKCJ1gD+JuAOCir9piLyKh4ldtsRPOaU8krB
         dqtf62Okfnz0j3oJOn0wo+HNZ5jrbRDuL//ErE2f552lpHfDBxfablPirWUb8/GAnDal
         Z2AgprXP3FoLgRfctlJBup5aPxWcYSgaw68eq43kRPN0tEA+gfqn1Ra5IwIRrJSXNzr9
         VCyvBsxfIZdhmM9FhJ7T5+YM43GZmQ2nAWhnctnYfVImoH7Mb4kQXBJEkbEqHx5dgrkr
         rBeg==
X-Forwarded-Encrypted: i=1; AHgh+RowMv3lZi86jKTIgOrvzoULmL5KghhD7ezsa431Nq85gikOL21KLE+6s1VbK4oR/ly/Cr9+NicjyDxW@vger.kernel.org
X-Gm-Message-State: AOJu0YzJHanQqPKETyoFGArLDrx/GKTSOZ4F048cwfu+RK9HvVVotVQH
	w6KzlAfoPXFM88uwBxhqvIcNpkMG9g4Tzoj04pYMyuJLAWcuFRWEqPrhQ2KOyovUoslZGxQDhU4
	LkqRUbbo+i8ZBQTJxNvESPMpbhz5XtMKCzslb83YCyz+DiOrdNq/PV+K61Fa/Z4PZ
X-Gm-Gg: AfdE7cnTNxB8KjpjZhyVW7XbI6LCwlzKB3ZgbMwmPtbus/EXUVHUb4Z+tEfMcFV8Dzk
	F+IlWorAVG8spC3pJIk/D3JIbVUDKoW6eBG5S3ZPn9HPCVgGCTh9JFek/fGxn6Wo9BNVH16Q9n1
	QF5f9DNNJuVlehgOu1eKmeurUuxHkNCsKdt3CYzMNnlVhX04PwwL++SodBKKJ6Pep0rMD7fzlZL
	yiY1/Zeiid41NiAlW5zpCsIcuvG357ddrwr1BshfpsgN0hAAASgp5XyQBv+GbON/8+aSxVermDO
	AX+NO6g/VOVNA7vY/YORSMWEWdOYHR8KQgaUcJ8lzb9YNIopqMQVf0bedPU/cvJIM8xIkt7YCBB
	DIhOyUdBpim+mp4f++THYERSwFu4810RQMz3rOg==
X-Received: by 2002:a05:622a:1207:b0:51b:fdbc:86ce with SMTP id d75a77b69052e-51cbf1fb365mr80402161cf.52.1783927728168;
        Mon, 13 Jul 2026 00:28:48 -0700 (PDT)
X-Received: by 2002:a05:622a:1207:b0:51b:fdbc:86ce with SMTP id d75a77b69052e-51cbf1fb365mr80401841cf.52.1783927727629;
        Mon, 13 Jul 2026 00:28:47 -0700 (PDT)
Received: from [192.168.68.120] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-69a19d79906sm15112119a12.14.2026.07.13.00.28.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 00:28:45 -0700 (PDT)
Message-ID: <f484f295-f454-4a19-bd3a-cd0db5d5f970@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 08:28:44 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] ASoC: codecs: wcd9378: add TX/capture codec driver
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>,
        Mark Brown <broonie@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260706192229.144137-1-jorijnvdgraaf@catcrafts.net>
 <20260706192229.144137-4-jorijnvdgraaf@catcrafts.net>
 <d643de20-50db-4f5c-a803-f1737da253fe@linux.dev>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <d643de20-50db-4f5c-a803-f1737da253fe@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDA3NiBTYWx0ZWRfXwX+Sy9JWMN3k
 tkWrj7Q5WCp4ogqSIZfFaMzxSJJCiZDtXa3vYl3F8GKGkxjS3PEj3tD7vsWJIz7JAX4oXBgHmcR
 1QE1/OwuTBM+GxR0/3QzBWZeNCx2kZY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDA3NiBTYWx0ZWRfX+1kbEZyJgGox
 2y0KbWpUxBQex4YNKKl7v0gI2n44fE4UpoypaKftTRgupBxeUJqJaKk2QoPZE/sKafhb696aaBY
 KuRIN4/JZEscwjCwVHqowNSqoJatxsDvR5Y20jEParwpgD0BdjW3NV5JZBThscRZ7z6BOCkyYgU
 D1fBMfqp8Vr8rrn87hUpBtEmlLobIkUmc2AwoIKF3Jy8U+hhZ/lH/4vNZCaNiiAckE4AG946HzU
 EiKsNHZ3phCkqZZ9a9Cp8VQU72PfVJkVCRx9f4TkUwwyd0zAMN1CnnFlbt3NXhjrqPDk9usQHRR
 ZKD4hhhrD8gAZgBN+yIxiz90Q3Y9SOnM9H7OkGIUNcg7wd9v7OwawUa4GsxZrw5BXRxZ9BLkZWK
 5uU4ZSBO4cuMIJECEnk00Jyb9Gtn5VoBGjm29yMQ/cZ7tsiGgs9SYbZjGkh892gRPNHdOdo3DPl
 nq/7pKhrE6ZYnNaK6mA==
X-Proofpoint-ORIG-GUID: E9bwry3LtkKejqFSlmsmQrV5WY3m88gT
X-Authority-Analysis: v=2.4 cv=DbcnbPtW c=1 sm=1 tr=0 ts=6a5493b0 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=et_PxPiEQ3Igji31-sgA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: E9bwry3LtkKejqFSlmsmQrV5WY3m88gT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 phishscore=0 suspectscore=0 bulkscore=0 adultscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607130076


On 7/7/26 12:42 PM, Pierre-Louis Bossart wrote:
>> + *
>> + * Qualcomm WCD9378 audio codec driver.
>> + *
>> + * The WCD9378 pairs a WCD937x-compatible analog core with SDCA-style
> SDCA-style or SDCA-compliant?

This codec is SDCA compliant and used on X2 Elite Windows laptops.

This Codec can be configured in two modes, Mobile and Compute, and this
configuration is fused out.

The codec IP is the same in both modes; what changes is how the
host-side SoundWire master setup.

The codec itself has two modes of working.
1. mobile mode
	in this mode the codec is enumerated as two slaves(tx and rx) on two
different soundwire masters (tx and rx), like any other wcd codecs.

2. compute mode
	In this mode, where the codec is enumerated as single slave on primary
soundwire master. Two Soundwire controllers(primary and dependent i.e tx
and rx) are aggregated and they act as one logical SoundWire bus with
four data lanes. The primary alone runs the SCP control channel,
enumerates the slave, drives the bus clock, the secondary follows. The
secondary drives some of the data lanes. There is a hardware sync
between these two. This is a new configuration on Qualcomm Soundwire
controllers called multi-master.


From Codec pov, its exactly same IP, I have now SDCA drivers working for
both playback and capture, so Am hoping that we could use the same SDCA
driver for both of these modes. I still have to give it a try on a
mobile platform to verify this.

Am hoping to send a version of this driver sometime this week.

--srini


> 
>> + * function blocks (SmartMIC0/1/2, SmartJACK, SmartAMP) whose built-in
>> + * sequencers perform the analog power-up/down autonomously: capture is
>> + * started by programming the ADC usage mode (ITxx_USAGE), requesting
>> + * power state 0 on the function's PDE, and letting the sequencer ramp
>> + * the micbias selected through SMx_MB_SEL.
>> + *
>> + * TX/capture paths only for now; RX (earpiece/headphone), MBHC and the
>> + * SmartAMP function are not implemented.
>> + */

