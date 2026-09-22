Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EDF355C33B
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 15:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790092311; cv=none; b=eJbii4f2Z6QamkIWVMCnbqj7d407DWQSKQhBuENI6OhUb56w5w7/sOeWE8xiI/y5u5rZAxpBfLGwuwPku9I5cq6yxTY0Jjj0yB3wA3XhyjTYUf7T3IVm/OYMrBl37+Y/NN8KLTLZotD919ZcmFaW9vjCDrr84o/9vkbl7qsBZ4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790092311; c=relaxed/simple;
	bh=h1Jirh2njNXWwpEhevaaC+b4awoAc2Rjo8bbL4rz7r0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JzjL3VeyjZGfBD3PJvNsMsADSyFA5sYSsAJL0gISILBaWuG7bdJGeNqDUe9Htm7nKHvyi7gvCFpOd8qRgeiAzEXFbdIvo79DqM8DIMNBfIc1szODAjeBKwgqogf6w3sbW5EowcnYwmdObuWopxF95kyiiloqnLjBmZYIq6Dhls8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T7JebKBj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VgE+xdf9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T7JebKBj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VgE+xdf9"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MEijCB3924021
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 15:51:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZIlFbcfWSSBPJOpXWFjbHK10Sw2EK6VtX9GqIx0bZ50=; b=T7JebKBjMDSTjcvT
	jvvm6qlOAFp3Opw7JH9XLLvMpxwQ5Jx8SIE6WCmEtK8wAZHPVPkKurHVgh/qpV2o
	af1yerBOqUz8i3e4pe+Ia4j6jFrQX91Kds7/kehSZJVYzUc3KJgQoWA4BJqL8DDU
	z/NSwxieaNJhA9DuHu12joKB/Abvrn9nXKbJz2jnstzcVS1uO+Pq8nJbKDDId+Vt
	2YdLVB93mNnV+gMqTyH0I3xV7VwXGVrJ1jvEzXeu2bgkYHzCycNoSkXBnKy/rUVp
	ht6KQCMYQTaBvyEiZ3nLCL3GzwTDag/ZwEzA/0sOWBjZn25Z5QqN1v4zd7nnZSyE
	tXaQOg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guuec0exm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 15:51:48 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-9106a836457so56886d6.1
        for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 08:51:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790092307; x=1790697107; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZIlFbcfWSSBPJOpXWFjbHK10Sw2EK6VtX9GqIx0bZ50=;
        b=VgE+xdf9DIjpZNi8EZhYGbKI/PkBnvZ39yh9RnOxL+zcWVL3N+x4EEUekCfm7oggpe
         JE1SkLUftYfLDzJXbJFRNv0+fjYjO5sQlD5yNfwCjxKv7d4ytsdwOwtsKgG322VgYECc
         5Qu5AG3/4vu1Ru+fieoh81eaS428F+dyIit55IcC2fcHqa9owTKsHJbtp3KWcCINQNFx
         fkEHndar0VGah3FuG7XOXvAyj6NaHBgP61/Glgam1pu6vbErJFigOnTLg2nCoMspzp/V
         1TsBDkKzp+fgaGLnRwCbn9VO06HNwf1ZHQo9kKU68h7ytbzrEnWU8IgzMGJ5JnmlcH8y
         Y+8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790092307; x=1790697107;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZIlFbcfWSSBPJOpXWFjbHK10Sw2EK6VtX9GqIx0bZ50=;
        b=unqqXeX6kxXQDlMPiQwCOcwuzlAXzfKT7KJE6V99vLTNL1xo3EIWHDrRly/R78VSLs
         lHxniQKg0/eTmLYvtJVqK9EjXK98kAzdcIO2RLadBB3U7IinExTckBm+c+dfi3t9KFcA
         jWRLPq12YI4fsbzgn1M2OKHWnZhZIhMjSuivZxBAIUtuCu/PTMqfyvnFZQ5QyficBg++
         Zfhf/+NC6Pph614ST2MTW/37J7DK2N3eQjEH7+zGaLLzjvIFvEeHRZKUdz0zqPJBq8Ap
         Yj6MIUh3LOaZpseH2vMsgZpVZ8KJ/fZqTVOtrOGjZJJLIH9yJpakCFLPZhI3wcJZja9O
         WWKQ==
X-Forwarded-Encrypted: i=1; AKwUvBw6BfyHtXC2Kv0Zxqc0igsK19NJMYvw6wDMVkSHhOFzqPU7FXMuhtbEhDR2cOKwnN+mR1vznYYK3zFU@vger.kernel.org
X-Gm-Message-State: AFuF++lEdhvaLuBVfhDO8EDonh26Ca5moR0GM+0eT/Pp1kEuBJmzQ0g4
	uyC+yExpdjlnFKWm5JKwcM6FgA9Kg/6wRZq+gdZ9Df2kG7uBB11MmamaoAznrDTxYVMwe4jFmYM
	FEx4/5p3puEaas6lIaBCLb/j8ygJ1qB+fTNiZGxocbAfCn5b/Hanc6TdIHdTNU80P
X-Gm-Gg: AYBFou32SqKYOj3bYsXwOv3NBSGfVyk3wMPpW53MD5D2ihXXP5NENwBkbeDjYRdpQP7
	RHNNGsbvwlX/ObmfLjvoua0FEqceNIyytK5DQAMhVc2H87yICDOCIMypXYApMjww5QEHkhEji39
	qEk5pzrlmqe1oi/v0fIfUAp9NZvbe6ukYzyY186Eqi0wVT4eVJvA0xBlrTyeSnyWb6JGRnsDqrt
	VHd850q0a52d5nAsEqCcVJ2VIWeXQqEKTaCpgUkcxj3l2SxFYD9qRxreW5xMAfjz4XWIJC/p2gQ
	MvY1RcopPsglT+WvDFapHvJRcK+S+91KcBNAVM5yX19O6LP24RpolTuF1eor6Qcu0ar+TeUz9cP
	8PiZkF1Mq0PtWjvVsUEw3oQ==
X-Received: by 2002:ad4:5ca8:0:b0:912:127c:d7f6 with SMTP id 6a1803df08f44-913fc9782acmr62342016d6.4.1790092307323;
        Tue, 22 Sep 2026 08:51:47 -0700 (PDT)
X-Received: by 2002:ad4:5ca8:0:b0:912:127c:d7f6 with SMTP id 6a1803df08f44-913fc9782acmr62341686d6.4.1790092306971;
        Tue, 22 Sep 2026 08:51:46 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aaa440db2fsm1379520a12.3.2026.09.22.08.51.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 08:51:45 -0700 (PDT)
Message-ID: <29671684-020d-42e5-b7e2-f7882fda5ffe@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 17:51:42 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/5] arm64: dts: qcom: shikra: Add CCI definitions for
 Shikra
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Suresh Vankadara <quic_svankada@quicinc.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
References: <20260917-shikra-camss-review-v8-0-9b9596221cfa@oss.qualcomm.com>
 <20260917-shikra-camss-review-v8-2-9b9596221cfa@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260917-shikra-camss-review-v8-2-9b9596221cfa@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDIzMSBTYWx0ZWRfX8AomETClqSkh
 eLjRwHx6EHrAwpTgvIHHfBa41f7P0h1TcgoAb5LrSUqMvxuJvvP+XGd33lDRixiFMQ2OvA1C3NG
 WbHDITXlrTl6mD28TeD+kw06Hc/WgFSNIxQZmFr440WjA7mT3Wk5UUXCQH4axuoK8jCpRaiW3+z
 LssTD9PPfn61QLtPJ3Em93TydEZMjJwilwv15fewCVbR5dMwAcROPc40f5IFQLrlOMFrZ6MYqMB
 B0+v1fJXsLXsIXQjeNe0XX7eAb0Kf6m3g2eeXjt1gP0XW8qm7Xk13iNMGRmQ4uwxrmW8xwXvXy3
 ke9inr3fAtY8o7aXjw9eYF3Ke8+exM6NtA52qsegQTuZt1J67Cf8X/KsaoeKm7ktxwipvDinktS
 Ua05pc2HUgM9v7DQ+7/Hu0kf8ysPi8z/qImGWiFQJuCk9rrxl9n719bTxIh3DORt54yxvFNTstQ
 hYM+XBqcrrypkFmQYeQ==
X-Authority-Analysis: v=2.4 cv=VKdIDNPX c=1 sm=1 tr=0 ts=6ab2a414 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=kTwRDD6jQfcqJCPQX_EA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: lxR7VAftcwV8fEeUYVkM-OzeBgaz74Fu
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDIzMSBTYWx0ZWRfX4ZqIYmIwcJDp
 b0mA+bc8ikCikQg17OvJkW/xEER3Imp0EApjxPCFLYJnwc07mhimMpgFjUTS8DySXjxLeYUatBL
 5Fu+F/7QMIMa29+D6B4+dB/ePOxBWBc=
X-Proofpoint-ORIG-GUID: lxR7VAftcwV8fEeUYVkM-OzeBgaz74Fu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 spamscore=0 malwarescore=0
 suspectscore=0 bulkscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220231

On 9/17/26 1:41 PM, Nihal Kumar Gupta wrote:
> Qualcomm Shikra SoC has one Camera Control Interface (CCI)
> containing two I2C hosts.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
> ---

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
