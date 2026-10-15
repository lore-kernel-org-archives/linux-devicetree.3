Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E19283C10A9
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 14:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792074823; cv=none; b=eNzaBMsoveON05We23IPHxH7x6wddtfTv0J5eGRuGxnvu4IKFDEP3Twz6RWPMFWef137RuSYEebyyj60ndEEUOSrmxzgUbivukwcMHRIdzGTzIZpLISNbgCpFgrXQ2aAm3NJ8qHbfLzbFk6497yTHcRhAhj9g+pIOSWKJhl4YFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792074823; c=relaxed/simple;
	bh=K5NTIEDtDfh9VNC1qqBCzREC+FQyn9ng7cT1odY9Qe0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZEasiBgnplHU6S2CrZGY0HomIyriiBtNVqFz4lc2p5RPVe+VBfqAJB2+/Rvanirinn9TtZczEa6WbWBXIxp92hqa9auOL1uqCT2rjrbeDt0fzT8iFEKOHCQLHXzDy9GPdXs5IwyYjYpQn+/pryDh9EzIz9J+vwZC3Bq3mEPyLU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S1egkdP/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AE3JhPdJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S1egkdP/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AE3JhPdJ"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69FAPuhI1596377
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 14:33:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ff20c9tqU73dV/ltb2Ju5ec206efY0r8cQQyXKrYbFQ=; b=S1egkdP/s8sze7PO
	11YisQ/WT6eAhgjUGs27qG5utCsO+aYJGuOg5EQRatKSFhlxUXW6IF+5c86zrmFd
	ZjYbqE8l7NT2z/qtW5A+HFzxMpPuG7Wv7ysb8I9M+32VzSJTXqbzP9d+B2d58Vx6
	Il845XCQvPKaOVqI9fUbQldJMzWc1gRzJ6wp4Inn6mp66Jw/qWnVc1S0G7CRcFiP
	Iu5GyO9QqlJ/00DJsyVn3aaKld4TrNpQ8RaiPWcXoVMiEIjfdRGhDHAw4+fxb62F
	aP2gjDWWtmgY6j5bfjrHk3RDZJqgXtMtZ97PE2yQRHZSvrsUQo3LI291xXLwUcz3
	6Fwzjg==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4haw2v8yc2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 14:33:41 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5de7ad7cdbfso213186e0c.1
        for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 07:33:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792074820; x=1792679620; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ff20c9tqU73dV/ltb2Ju5ec206efY0r8cQQyXKrYbFQ=;
        b=AE3JhPdJRt8ns1xOSexzqw8DAeDxEdS5YZ+4D6PE+si6OCVtqixfLHGbvpultf6Mzz
         v39VZfl/78HBZEkjjdZEJQSOColSLkgnHPhjwFJcW1nO83MSGRC0XvtKcdi1bojJKAO8
         U6SQtwJMScxlFHb0aC+N8gjqF2CY8chNq7W5d2LodzsYw864pU8aPxHwl5WP+SdJrfm8
         DLJm43ggrk/d7a7GwRe/B2zFGu3K9YEdo10l40G20XojVV9nEAKSNSDyavuwGTy5JACE
         6QArpDkSnzDzl38akcVh8fyIv0XXr5dxToXEotFWPr1hEnEJzkoXDoWyvxgmxw4P6948
         bJTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792074820; x=1792679620;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ff20c9tqU73dV/ltb2Ju5ec206efY0r8cQQyXKrYbFQ=;
        b=aU3UWNWcpzYlTsRkrvIk2bEfNIjtmp0rHKKT7uC2P2zHwrGJdt3aBZG2ZZASJQoLC2
         u4JR3BYXcSMLzkzX9Ptf35YCqAvwXreSC/LVZp70PZKmC59zkZaQS9vHsc8KEyID8WRz
         sq8GC2h+s1537TFkWlgmsnmCjb05lv1LUZ8hF5huxHVGHgc5985fGgWNvThnPjWsq5w7
         qbZhbCRy29mwPXanU8E5CZC1vLrJhVS9cnItgqceuWyL9J8f18m911Lhkyo3TN3R+iEC
         tivpVV9PYYttrWkBEGLANEtVFwliL7poyYptY/q4hhw1c/gJUwM0Gzpnzsr7eunzqPWL
         d+5g==
X-Forwarded-Encrypted: i=1; AKwUvBzZi2hgD4+TsIGHnqk/gazXTNOsS1DEVrVXnka5SJ1MiqIcaB0xmsbDClBamW2hnhOB2tpknQwUY4n7@vger.kernel.org
X-Gm-Message-State: AFq9FYKHW8WDPkXgutSj/LUL22u+LSxwEyt/2GH+EDs3gSTyb0RKqIt3
	hFnELNtiwRg5yXdGm7lXtriPXIgR/fU86AHJaNR8aOXanXG3xm1BKqZn0tXMX9oOElEk/Yt/8Qt
	gmQlJOIsPu18787BzUqMi0MfPFPz+tH7IiLbzQKbDXzL2CrkeE92ZMC1DRiOnwBNeHlxFIcoD
X-Gm-Gg: AYBFou1h7N1nsZP5pcCOnNOyXtzV85AWB382P5pimlwyFE0HTSQdwhfCBY0GKNAaJGm
	48k2HlRfFViZk9jQWdH454jU9p2kFgTJF6HfzQ5twEhFs+JodhrUPzgyy0gE2A5H8y73hSirnFL
	Ki+s5xmWio2d+fIJGnzFaJdU9R+IqDc6UWFD8HwTlb07DKI32AkXoNH7AMQd+ZEkvhCvh5ud8fH
	SAuPoeGUR+vdQBnS6Zh55+ULbSnhbKi0+DC4eIrYd9ymkR6FJQX+AEfH7vUjyyJHXDzXmrcfARh
	M5NqzaefvrBIPutEAs1dPGiX1YCG88+7/hpMJ628MBOBfHQ8m3WT5b+rWTTGA8OH82zfDvaY2Xh
	XdTytVtgwa4SjKpB7DhXheA==
X-Received: by 2002:a05:6122:a5c2:10b0:5c9:fe51:53d5 with SMTP id 71dfb90a1353d-5e91f242088mr4128534e0c.1.1792074820075;
        Thu, 15 Oct 2026 07:33:40 -0700 (PDT)
X-Received: by 2002:a05:6122:a5c2:10b0:5c9:fe51:53d5 with SMTP id 71dfb90a1353d-5e91f242088mr4128519e0c.1.1792074819630;
        Thu, 15 Oct 2026 07:33:39 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b2038ac6c1sm2663838a12.35.2026.10.15.07.33.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 07:33:38 -0700 (PDT)
Message-ID: <df64e5e3-0585-43c2-b6bd-844abcc4ea9d@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 16:33:37 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 5/8] usb: misc: qcom_eud: improve enable_store API
To: Elson Serrao <elson.serrao@oss.qualcomm.com>,
        sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
References: <20260929213513.2401005-1-elson.serrao@oss.qualcomm.com>
 <20260929213513.2401005-6-elson.serrao@oss.qualcomm.com>
 <20260929214304.E1BDF1F000FF@smtp.kernel.org>
 <547e3087-cf24-4071-a9e1-5740113fe613@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <547e3087-cf24-4071-a9e1-5740113fe613@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA1NyBTYWx0ZWRfXw8sbz7l+AY6R
 CnSSFq9g1VZeX0aeHUXDEdeQcolNeEsPpFw2xSYutyNcEHsT4Rq8BnRdHwH9c2mBu4HmGxmXMc6
 BvnU5AfurUUqILf0mf1VBk1fbLXRTNbiXXNBQ6VhepcmNGGEkgnjMYtzIR1dmalM3PiuOR5zmfU
 hqPhZldxRzrj2bAPvvyDdBQoGI1xBGSclFUowCnB1lnWB5ntBuF23o/gdvhMwmeZTJYBHIrTqek
 nq8ga6s6vNztBtGFoc2IgLzGHR4crvXjzU5j7Q5ukxR952XgUxmR8QEKL++JkRXEfVxi6byXrzi
 ceaTaBHLlWSMVvgwl4xoQHAJMLo5OGkrev3Aey1C6z1EaQ7rSWFB95EqZOsd0On456jd0SItOVL
 A5gnQpfslFWTCXztoUmHihwzU+kvEtpECeNbO9y+6D+tc6wKDUtPVaayTfWJD4kRw5je0f6bKbB
 pi3urWRAdc2oROrxZwg==
X-Proofpoint-ORIG-GUID: 0mjvYOj9mL1tDjUWO7cDtuXo0Boptrhf
X-Proofpoint-GUID: 0mjvYOj9mL1tDjUWO7cDtuXo0Boptrhf
X-Authority-Analysis: v=2.4 cv=G/CJgNk5 c=1 sm=1 tr=0 ts=6ad0e445 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=s2oEdsPTHuEvHUgcdc8A:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA1NyBTYWx0ZWRfX0N7XvstFiy8A
 QQ1xz5jgGb8/79ulOQ8nI5CCV+Jdaa5N6xNXYC/0NWIxNFjznEjqTzRrOd6jPJfwFr0To2db34M
 58UkIDGWLsgtoW8cz3esg2V8wYQcB9o=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 bulkscore=0
 impostorscore=0 suspectscore=0 adultscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150057

On 9/30/26 12:45 AM, Elson Serrao wrote:
> 
> 
> On 9/29/2026 2:43 PM, sashiko-bot@kernel.org wrote:
>> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
>> - [Medium] usb: qcom_eud: uninitialized software state blocks disabling EUD on boot
>> --
>>
>> commit 16556b4a5664eacf6eb75fc1fe5031d31c087dc0
>> Author: Elson Serrao <elson.serrao@oss.qualcomm.com>
>>
>> usb: misc: qcom_eud: improve enable_store API
>>
>> This commit adds a state check in enable_store() to skip redundant hardware
>> operations when the EUD is already in the desired state. It also improves
>> error handling and logging when enabling or disabling the EUD.
>>
>>> diff --git a/drivers/usb/misc/qcom_eud.c b/drivers/usb/misc/qcom_eud.c
>>> index 48e474bdf818c..e227d05cfecd4 100644
>>> --- a/drivers/usb/misc/qcom_eud.c
>>> +++ b/drivers/usb/misc/qcom_eud.c
>> [ ... ]
>>> @@ -164,18 +164,27 @@ static ssize_t enable_store(struct device *dev,
>>>  	if (kstrtobool(buf, &enable))
>>>  		return -EINVAL;
>>>  
>>> +	/* Skip operation if already in desired state */
>>> +	if (chip->enabled == enable)
>>> +		return count;
>>
>> [Severity: Medium]
>> Will this early exit prevent users from disabling the hardware if the
>> bootloader left the EUD enabled?
>>
> 
> A bootloader-enabled EUD has never been supported; the driver has
> always assumed EUD is disabled at probe. Supporting it would need more
> than syncing chip->enabled from the register. The driver would also have
> to take the PHY votes and bring the role-switch state into line for the
> active path. That is a separate feature and outside the scope of this
> series.

We definitely want that usecase to be supported too at some point, but
clearly outside the scope of this series

Konrad
