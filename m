Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 253583793B1
	for <devicetree@vger.kernel.org>; Fri,  3 Apr 2026 14:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775227260; cv=none; b=rY9IE+x8S+mKUB1ZkNX1Cqxk5P+5UrkR+Hof8HsyR6IryXGa8gupHczchQc6Qur03I1XIP/AXw+/MWHzjT/TXGqqqvy0bHOzyYAxmYdQunYxJS8ntqSJwkfTUCacLkFxR1fcTgXiiOjU4lIInRyOm/QHLz0KsVeiQQoPScRxPG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775227260; c=relaxed/simple;
	bh=hqDimrSMzepFthCtzmR0fJb6vVYY2mFGikCgt7E7+tM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u0Y62Fzomuruojh8dFZhprnj64jKFBuqkyuSNSRsK5Ww4vuQjr0/kAEq8GakuRcJ5Wo96D7vc30FPVIZ0K4zWp8kz0VLiBKzbuWviI25UPMBqozHKqwHhp6IM0Z5q9Q0CYzkCWcHLfooCGQLL1N2N0a1n/q3HlAWhS9e5lqJEGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dN9Z3Axb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d0lFZFjh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dN9Z3Axb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d0lFZFjh"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63373qvj3449814
	for <devicetree@vger.kernel.org>; Fri, 3 Apr 2026 14:40:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fkEap+7cVRiLD3H7Kd8AKQiASxfaidJM15fB8m3Xao8=; b=dN9Z3Axb9sGFmQtw
	rf+NadN5/VRs/kJn8urz3yGOUOUhudfMs5jkbsE1clbjQSRHMm3PpSy37bPqUgc1
	MzV6Y5mzGG0mBEfQDwLJW3DF79M9nsdKcEoNnlU03gkF5ky5Zg5YnZGgoHPtDtV6
	mXt1CgaSZbRcmUq4E6/DawKrOwX6o6rFaKcxzCHLI/CsvIj0CfIRbZtPbjMg92lp
	eIg2AUiNfzptKPjtj7pqEdOQ+FAaK3SGcxNwR9pJZFxkapkvY2w9hyxqKlJOg8P7
	nvDuOX/1jtr44icwP4p5XKCCpYB7qnDm5d9jXnyXaEWLDYAQCTDFIr+LZSJgh3wk
	doRHwA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4da8u598x8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 03 Apr 2026 14:40:57 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50937cf66b5so83409341cf.3
        for <devicetree@vger.kernel.org>; Fri, 03 Apr 2026 07:40:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775227257; x=1775832057; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fkEap+7cVRiLD3H7Kd8AKQiASxfaidJM15fB8m3Xao8=;
        b=d0lFZFjhlzNTLUR0l3ouvYQ+JCfHFhyHaidb16CtRjHAhXk50pFfyK5TjQ+fgBaGlm
         E4b29iRZ9XRWbaD9pS9UKzKpOL8KbAV4bYojNCDmlLtec5xujnT5NvaB99ZkT1ikBeBg
         PPeTDmXJlhG+HCyCr0VkPUVPgcNGJuK2JoHtS61uwXe4gXiCL2bd89zmmRimnaney6ZJ
         FZ4hxX4RxkMCF4WHT8z/dtlNxFzNnOW5b4emk8I3556oKrm1jMiXhEa8g1iUt8dp1zhD
         H9mXS1VcYGDSl5Vl0+dDvvkJokGIqtKaakeSrg9kiD4pgfY3B3tTsfqAdUFZBPEYdGDb
         CzMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775227257; x=1775832057;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fkEap+7cVRiLD3H7Kd8AKQiASxfaidJM15fB8m3Xao8=;
        b=SU44OpDySwbLcR4oyIsuxKumlwVu7HU/VK1I3u/JKwuOTHItHvt9qlboBro4xVfgNm
         LSWWnzRVkY7iSJwiSBwjVyWyvUcIuksq4uiLGJlfoOxvDw9c3L57kygQwFXsrRtN+IR8
         KZk7jQxRRDzM9CcqwEevhvpwMbqmcCitYcXwl0jIQvzNHO0eX+pvyKtPecTYDMvfKprP
         r3/tqy1HFKulklemEPi46tUHcY0ZhMQomQ2qqA2HRtOQlY8bNJHXjw7S5cvuEJ4bHXB3
         B417ws/LgzDozRB1N33/nLdns6sW9EOu3pk/Ia9mhuvu5CvISRh0Z+v3h4QRvthTA/t+
         ng6Q==
X-Forwarded-Encrypted: i=1; AJvYcCXzHu6MCUfnrilquRTtj8rAP/v/pRA3slJHheNEyb5cXMIYTUbqMEEUMPU8gZ0/fUmoG/aA6yYzQTLk@vger.kernel.org
X-Gm-Message-State: AOJu0Yzp+dKhHgvI7O14NvgF6RyIqZ1P+EzGnUtUCjwXoZNw/ED+/i7Q
	Vr8tmS6T6pWM3QOONmYSruihxD3wwvUNQiVX2ScE+RXj9gvnaz2OroShEbKB9iZObEhGUMIZXLL
	ds1hKmVFLD2jzJJkuTlRnDsaC1a/DfnGU62uYZMqxoSTpiTxIvAH6bHV92QqSU67O
X-Gm-Gg: ATEYQzwzSlZ7DZiPXVMfeq0SBh6ZXCA3cM8Mnpe5CorHqwMBzg08F4T57q9IgHWry6f
	/8rS6B8V1o1bnXwRruzAPTXF9mN9CEa9IMpwALRjW9jr6EaWZ0F8oupqvMbvj0eUhfFxV/JceML
	YUEqjDQr0a7/JtTbsRyGzffcQnV3ijzvxvulMjECLjr8t7eWj34BsfjNWmHo4vLCCujs7zvHMTq
	EoaMuP85jZmg42CYdu+poNJUFNbqrcvtXZHIwjU4tq5gArpD0Y0tg8j77kEIr9v64XVSFTQqL7r
	TCAcFL5SAi3U7x+WxuKxv0QaO3hKB8IR0DR/cvAphC3j0shYy3CCymMMjIM6cRKVDrsa9RxaotH
	2iKQ+P0/9bR974FeAT0/D8ovd+oU4GT+0xKsrCcbTeB2jYwuWrr7mXV6f+iY9zK2NdVstnrZriP
	xu6Br2kSya
X-Received: by 2002:a05:622a:986:b0:50b:3c78:de09 with SMTP id d75a77b69052e-50d62a3dd40mr46478411cf.34.1775227257327;
        Fri, 03 Apr 2026 07:40:57 -0700 (PDT)
X-Received: by 2002:a05:622a:986:b0:50b:3c78:de09 with SMTP id d75a77b69052e-50d62a3dd40mr46478051cf.34.1775227256925;
        Fri, 03 Apr 2026 07:40:56 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:ae20:597c:99b8:d161? ([2a05:6e02:1041:c10:ae20:597c:99b8:d161])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488981de7fesm22558685e9.9.2026.04.03.07.40.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Apr 2026 07:40:56 -0700 (PDT)
Message-ID: <8c548166-af30-4b5b-be2b-15199322d343@oss.qualcomm.com>
Date: Fri, 3 Apr 2026 16:40:54 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] dt-bindings: timer: fsl,imxgpt: add compatible string
 fsl,imx25-epit
To: Mark Brown <broonie@kernel.org>
Cc: Frank Li <Frank.li@nxp.com>, Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        "open list:CLOCKSOURCE, CLOCKEVENT DRIVERS" <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
        "open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>
References: <20260211214947.3705328-1-Frank.Li@nxp.com>
 <aaiIdS0zRPBY81aE@mai.linaro.org>
 <ac9ztfwZMrZZgTeP@lizhi-Precision-Tower-5810>
 <77a77b79-a489-41a8-98c0-00242cbdf24f@oss.qualcomm.com>
 <3ba9e33e-8d58-469c-9c21-5861c0f6c5eb@sirena.org.uk>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <3ba9e33e-8d58-469c-9c21-5861c0f6c5eb@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAzMDEzMSBTYWx0ZWRfX+Vr78Yx6oNt6
 FGyTjedY3gncgcX/mic57SdQGqkChnA5jEXViCKZPGMEIXmlWmfQuHMXW1gO0+a1d6UPfAQYz9O
 hJyzg0luOWC9jCKU0Ya+RI349YtHwuaM/WYMvRCA/0Y/CMzIuuFov9v9IAvHXhZiT4euBaAb6Bo
 dA+vEN11HUc12dcLn7vKzr6WG3Z9FBAVO/m7NiRYrub7xr80884wJ5v84lGoXEsNOQv/pwDgXTO
 UXFoRKNJxantaDEoaqQiEb3MpkYVuZYe0CfD2JdJ7ts1idyWZOSkBd/zBzf915kMCW3yOJoH0QL
 sDKyQ6nWgaFfKwLCuY/24lLTpSpU7tqx/QshQRWa0bApJ3QLtUdMWEx8rd3JMK0PtwRHK9RKXyk
 0wY4mdk/ewKArn7ZlZAUeHB+pTjq2MJaBSztKm+6nmlolweH72rK8QpruRdyncRT0zaY6aKccPZ
 SwM9L5GtdM+gEHXbL5A==
X-Authority-Analysis: v=2.4 cv=W5g1lBWk c=1 sm=1 tr=0 ts=69cfd179 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=pdw9z0OCORkzPJei4WQA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: t7csZdihGrGveM20r5z25KaFxzBWLgcU
X-Proofpoint-GUID: t7csZdihGrGveM20r5z25KaFxzBWLgcU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-03_04,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 clxscore=1015 phishscore=0 impostorscore=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604030131

On 4/3/26 13:43, Mark Brown wrote:
> On Fri, Apr 03, 2026 at 10:15:49AM +0200, Daniel Lezcano wrote:
>> On 4/3/26 10:00, Frank Li wrote:
> 
>>> Can't find it at linux-next master branch, anything wrong!
> 
>> The patch is in timer/next but may be linux-next disabled my branch
> 
> I have a timers/drivers/next branch in your git tree in -next but
> no record of anything else.  That branch was last updated on January
> 20th.  If you want something else adding let me know.

No it is ok, I had a confusion in my branches. I updated the wrong one. 
Now it is fixed.

Thanks
