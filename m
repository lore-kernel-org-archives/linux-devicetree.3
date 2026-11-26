Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795714467;
	b=L+lJniADNCxK2g5AgaZf2kJB7irTahVndLxmSFRZ/z7fWuVfHfKB5+2EqJWk5e5kpur9
	 yMgXv9m5P/MKmU6kJ88UPW8DFMKEC1kddKyQlxXc3wRTcI7wJUKDu7yw44lMz8nIg/6Yi
	 25QqR9Jc14pr4tty5sacYk8jo8ccIWM/2dmC/lFXKgoXgMcqd3e4uF6+akJcwCPmwY2HM
	 oW3wtxEqvdtZQFDbletf8D1rtkR2pyDMHZ4MCLncolg9skrrCxkFYV8sTdBSlGj+dRSeZ
	 E2UgzaJ+msPQpsyGPXd0BRwHowKho9QN942Kt+tIf3d82I14+50OewGAXDL5OpUEF+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795714467;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=kAM7pQYhZdvEW1ETslRXtOjChEJigCxTZT0kkHulOzw=;
	b=PoQjT/1UxEM2SSgEztgswzipdPYwllZ427ZjjpIdO3BndmXF1rkt/fR6ZuNo/bbK2L/b
	 MVRrgnPdbW353tCag/3aDUEBOaU5LzzLHThJUC/6hLd8weVEUIKbDWongH+rn2XQVzqnO
	 dMIsMlIQNI9CX6/8Hwb58tncQDD1Mb5VR93Hh5mTPtrC9NfZNQcmww7D6bN6BY5mSbx1a
	 MXfkssoc30N4eeaM3b2hoBjS0fgpAt3ZGGANy/gz6W7invPI67fJDrst1Xbok6a+/56mK
	 OX8DRd0kvazn6v11aqIz3ZgJnepQcISsCUznnxsuSMVzTK7I7uLlHQ+itwUklV809xA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=c9OGn8pS;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aaUhnfPJ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 298D6606A31E
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 17:34:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 298D6606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=c9OGn8pS;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aaUhnfPJ
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQFuH8n2068559
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 17:34:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kAM7pQYhZdvEW1ETslRXtOjChEJigCxTZT0kkHulOzw=; b=c9OGn8pSyXWiy3jP
	ZlD6X/tWVRdT6GibDnT6G3OtkWv6guKJyfvdsDAEItLIyH/jAC7SQjO1MbcWGo+h
	eUx7Az0fAnd9dpVWGjOvQO6u3mbU5RTjU1R3o+qoF7zSWmg0uMAKuvung9Klb9EX
	LmZYv/GiFXS2trGnD6sGWHm8xRwAmpTNf/ilHfG2KXg90tUK1acTPdcTBfGNXdBD
	/9wFahtAe97F2f2pYsbrWPEGSUJSU7/S/S2aIta28seBHp+BLu8LvMigMqU+iRmf
	0vOHHgQ/mk2Ny8NwB6OjLT8rRHxZaXlOlCTYX5+hOaPQwAacLZjPY/mjfzveXeKk
	Muwg/Q==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j662y43gw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 17:34:26 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b41e8c1ac0so10044799a91.2
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 09:34:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795714466; x=1796319266; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kAM7pQYhZdvEW1ETslRXtOjChEJigCxTZT0kkHulOzw=;
        b=aaUhnfPJdFdxVad2qFVzUzpYaFZwYoFyGAgS+wVk1k2Ux/wHvsgfy2Oo4I4joAYmFn
         dGU+Be7IMAM5VA9U7NE00Uj0LBT6nKV1++82VxSqgAUjbC/+xNSfT087fAXVP7Z+Wfhu
         eCPJm11FPibJ0P9Q1FheYIN2wHpmM9eHw64Y44dTdqvWony2ZvIyU49aZHEfCtRoaSOR
         q2jLijvmFallrqArE6P03wQtzlAPZY+trIKUR2mmoDeRaEQrLwXRM6dMqK6YPEGrM0P1
         /V8qpl9HmV9MuS4smjvzzTscbIhBFjTlbUOYyrlnhDdjh70A4cEkEs0DLtwLZBqjcJEK
         b+qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795714466; x=1796319266;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kAM7pQYhZdvEW1ETslRXtOjChEJigCxTZT0kkHulOzw=;
        b=Trop0iF9kvqe4x1M6X++NR+8jEQPs+8n+jI1KqGiXcBR3UewnOHnfaNHAIGv2kzzZp
         olrfT4gORAFK6GpDNjiweDQIjlD+X3kkZGBxRKhteQ6W73pUawtwSloIRjY7YWZuXyWs
         iqbzYkOaQYSVgxXe5IkSc/kOWfEKGqcDUlC2I4xVXpL7Mvu0b5+MfjQ+jUwxkp5+PHK2
         L0SM1xI7fb+IQL/wXZptxa+mP/iTyyQKBcbAgfI76Y2FcchNTMUJNofjXYd38DUAkB25
         wdt7Gaut52VD7jFYip6lIH4Za/YXbQkqnt42R67AvG2CVgU6ZC6D5btR4mIiRVC7JFfg
         isDA==
X-Forwarded-Encrypted: i=1; AL+hErF9fjwQEemg8GSUhO0oaSx+IfByh6VdymlijMlwgiuIc6+yNRfgnT6Gslx/3HU/ZAMQcTQjNhTHmeAC@vger.kernel.org
X-Gm-Message-State: APuU4Z+5vJu5jYI8l7iralA0skss3evIeFAn0r9hrpQzt+nuJ8GURSMG
	8sy3NwEQRMQRG2+92yGJZJ+dZsbRfCSCK8J7ZnHyLEz7mPIW/92qA04Mu2Wcms/UYmBTXcuuX2q
	7Qh3B48UHZSSYrz3QCuE/s4UVBDx0y3RH80/BIxnZW/XPxo9kSB5dc5jjzBDvAc1t
X-Gm-Gg: AZFdTZdJQbCiSZEImfMUfkHMO42hygvwyiwJ+dy9CkHayWQEKCdTx6ZdbKA2+v8+IHy
	WJ4330/hG2yxKYgLzItbklq8UdiYV61K528OFjP1YciMpvRUkVffdslNre/1S3OJDwxWaxJqFQH
	EGTofIIJzirm2JMP2JWTeub46CEzWNuIdtT/etv2CkY6WWgJuM8lcqhv5IiXPDgJz2//UVLmHqq
	+lBdXJ9NKbYl7WJ59k5Gb8rzG5oFs3ZqMrU7uMDv5GfEx5XnJxgYkL6c+ldPWhYFPwo6ScUE6tb
	RHAacMD1LH2oaRcG9AiFoVoOAHByS/e++0LJ/izbMJpBJJ6C1/3lnOuNhlrdmubaQPv8buQihKS
	Be10MziI8UjQywIonKPayht6xr/PWKAe0f2qHRuJBkDRB4Ur7ARKVzFr6uUd0ko6NRIu2tKBNbX
	slnRbWOMbn2qyhMUz71+KoZKWZ8tJt1v5dsOx49Xd1
X-Received: by 2002:a17:90a:d2cf:b0:3b4:d22:8600 with SMTP id 98e67ed59e1d1-3b41c8fe1e2mr19204586a91.18.1795714465790;
        Thu, 26 Nov 2026 09:34:25 -0800 (PST)
X-Received: by 2002:a17:90a:d2cf:b0:3b4:d22:8600 with SMTP id 98e67ed59e1d1-3b41c8fe1e2mr19204570a91.18.1795714465312;
        Thu, 26 Nov 2026 09:34:25 -0800 (PST)
Received: from [192.168.1.8] ([122.177.242.156])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad0a34asm33227833a91.3.2026.11.26.09.34.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 09:34:24 -0800 (PST)
Message-ID: <3c0a98e5-0696-45eb-a0c2-83f429f6c76b@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 23:04:20 +0530
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
Subject: Re: [PATCH v5 11/11] usb: dwc3: qcom: Enable VBUS override at probe
 for default peripheral role
To: Faisal Hassan <faisal.hassan@oss.qualcomm.com>, Thinh.Nguyen@synopsys.com,
        gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        peter.chen@oss.qualcomm.com, krzysztof.kozlowski@oss.qualcomm.com
References: <20261123104727.1539149-1-faisal.hassan@oss.qualcomm.com>
 <20261123104727.1539149-12-faisal.hassan@oss.qualcomm.com>
Content-Language: en-US
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <20261123104727.1539149-12-faisal.hassan@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA2OCBTYWx0ZWRfXyQpyPJ6v9hFp
 Tp1jrRDofQmEgc99u30/JD0298271ZVCyLlrLuxwIY6scIXmqdJXLj6lvm1noNllk4eBAbunNDm
 CiPt/ocWMCBUdR6hFz+/cDOdWkYHHVRIvPcrOun7jcSjDehP23TK2dCmIGxrNSUpjfv+hf03rxO
 2Un1fJF6xJP7TNOgBj4yFRjsjpJbMpCyZmc1Ruo4tmHm8jg4y505DxZEpfiZhQyIz7/wNQXbRuk
 4rFRObnz6ByMEd79X9RkJf2iEE0fztI0l6o5WvuXp0mA+4sg7j8L5U7+uslCtTwZt9OHy2BaedC
 Spuo9SKxIMRgy5M6p6BX18bi94qDy7S6p+8G1SbcLBd/lrbM/9uV+iE9lUNSrHnD5b2xLQU6a9Q
 h1RJF151N7osLFzpwcWxUgy3bVLxV+WdhWv18IdGehoNAJkgz1iwnQxEd0SvpJlBLVqTNMN3ajk
 eDhPBhfk0bRQJKA0ADA==
X-Proofpoint-GUID: SH-xMRcBvbnCzCHoO1zG7I6nkCQ23DNw
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA2OCBTYWx0ZWRfX3k1OBfxaNplA
 fR9wgkW1gZSmrql0iK+DZq+/pIc8ykO/kyDw1O67l6iY55QQ8i2WlwgeABjbvWDKdKMHH4uWkIh
 /pKNj2pkYSSuhXPgKzC6kfVG4p74awk=
X-Proofpoint-ORIG-GUID: SH-xMRcBvbnCzCHoO1zG7I6nkCQ23DNw
X-Authority-Analysis: v=2.4 cv=W/KtxhWk c=1 sm=1 tr=0 ts=6b086da2 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=EbDk/eETi6Q6sYbTlnF7GQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=fyVOInN8tGEjVan_8WYA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_04,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 malwarescore=0 adultscore=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260068



On 11/23/2026 4:17 PM, Faisal Hassan wrote:
> When the controller is in OTG mode with usb-role-switch and
> role-switch-default-mode set to peripheral, the role notifier never sees
> a transition at probe, so the QSCRATCH VBUS override is not programmed
> and the device never gets a session-valid indication.
> 
> Enable the VBUS override once at probe, after the initial role has been
> determined, whenever that role is USB_ROLE_DEVICE. This also covers the
> dr_mode = "peripheral" case, which previously programmed the override on
> its own.
> 
> Validated on SA8255P with an HS host attached: 20 unbind/bind and 20
> suspend/resume iterations completed with no failures.
> 
> Signed-off-by: Faisal Hassan <faisal.hassan@oss.qualcomm.com>

Reviewed-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>

Regards,
Krishna,

> ---
>   drivers/usb/dwc3/dwc3-qcom.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> index 559de5172e61..22b6c7ca0297 100644
> --- a/drivers/usb/dwc3/dwc3-qcom.c
> +++ b/drivers/usb/dwc3/dwc3-qcom.c
> @@ -964,7 +964,6 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
>   		qcom->current_role = USB_ROLE_HOST;
>   	} else if (qcom->mode == USB_DR_MODE_PERIPHERAL) {
>   		qcom->current_role = USB_ROLE_DEVICE;
> -		dwc3_qcom_vbus_override_enable(qcom, true);
>   	} else {
>   		if ((device_property_read_bool(dev, "usb-role-switch")) &&
>   		    (usb_get_role_switch_default_mode(dev) == USB_DR_MODE_HOST))
> @@ -973,6 +972,10 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
>   			qcom->current_role = USB_ROLE_DEVICE;
>   	}
>   
> +	/* Force the VBUS valid indication to the PHYs in device mode */
> +	if (qcom->current_role == USB_ROLE_DEVICE)
> +		dwc3_qcom_vbus_override_enable(qcom, true);
> +
>   	qcom->dwc.glue_ops = &dwc3_qcom_glue_ops;
>   
>   	qcom->dwc.dev = dev;

