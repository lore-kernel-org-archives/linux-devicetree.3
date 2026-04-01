Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFECC32C316
	for <devicetree@vger.kernel.org>; Wed,  1 Apr 2026 09:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775035006; cv=none; b=iC4XC5Vbg2o6wSYnztZYwCV8SK/vXP6nSU1N2tPEP+PM4UgdCgHto+gx/d1u0ohu1dQWGlzJCtAjJzmtIyxLDbdFodZfggZ1JDGYZKyrZSO5pgGMFHZdWNhR+QL65p3nxNbRmG8E1Tkw81vT0nwH+ubE8xOQjdYa19gEI7jDycg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775035006; c=relaxed/simple;
	bh=vxiPU/CghZ0V8l3HZJYezZsMM247sES4zEEMkAqZ8eE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cC8TfCtHGvfsc7WJcZUqnwwaWcSGWuBX8g1FO0qyR5Y7FukWnXABLpy66rN46uEteOVwKdcrCk/cDsbcD/KKzhjjEWYoVPytvLGBApx4nIfIwgUWgHd+9eWDndSGFRWBCVc7px2cXVTYLPleODxgCgFwwVdclcqP9GLoNhPPanw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ccgI/hhK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LfE2xvVy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ccgI/hhK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LfE2xvVy"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6316fFNN3103832
	for <devicetree@vger.kernel.org>; Wed, 1 Apr 2026 09:16:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TYLS9EyJfFCFWAF1/cQCFqZ3LfYNSZYdzW4EeWxH2xc=; b=ccgI/hhKYztpf6Rd
	Q4cHjKVPwTja9hvD+Vn2t4ZRzswb26NOo6YQvH9EEa66GYWl+A/a+mNr/1w8oh4r
	irSVYaSoI2R+HOl1oMF1yuySa64C7XnzGc5amayYAxZHagfocceA6Qhiue3rYYPf
	x6KQY95HdjT8pUX9qdxFR8a29KZF9sPSOSqHDM3yQAQCEOLE4darYTRe31SzoEYl
	KzWoZuSMKLaRRBNBE1dSKgs48/lEs0wpe2J9DjNItg8fzcjFjCSor3idiPJp/wmH
	ZF5hWYFIQ39b4guq5LagnnwGRw0ntDM5VNKAsAPflJMi/1imSq8OFmQQCs8op0LG
	dk/fwg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8js23j3j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 09:16:43 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd84cfae34so121876085a.0
        for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 02:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775035003; x=1775639803; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TYLS9EyJfFCFWAF1/cQCFqZ3LfYNSZYdzW4EeWxH2xc=;
        b=LfE2xvVynn3L3iKrA91fA6JmohAorLxCrPOgYekaWTHACVi1TUzEAI5IqcwmFQ2V22
         +OJIBBDGr/KoSPUOU3XRm0vXispooNHov3xus/QkFagsd8rIdgTYdyp6S1pRgU7gP2JC
         CWmVJJjYcVXcNCDmNYSt4Z0vJPHt7n0V0+CyQ7PxoKMCWEdxustd1RYlDWfl24yKk4Kb
         bjyuu2tPrAvWNeSkguxl0m9r97mopwrXQCXcRayRs3vo8MxJeROzHjIlR/6n4gjShLCG
         UVPFjprxKYLC6gCVEcXTqLvDiz6jWpmlbeVm0BxMh5dmxBUHiAcdiKGUq7cwVr1QkAab
         NfYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775035003; x=1775639803;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TYLS9EyJfFCFWAF1/cQCFqZ3LfYNSZYdzW4EeWxH2xc=;
        b=mI8YFPRHDlah0bEZbYaeo8GALQzIYU9nnb4XOU2rsuzEiObivw8lvbeVupKhXV3/iB
         y8umAQ2IYo92z5CvnOalnhPWHXEt/jSyaizxNz16OOEiE1kLQ7XVOji3SjAoz2rlSiwX
         +zNE/zKdhIW0JXXuSjgnoqcEAvq91Q4OnA7IUlnBSURWUrmGEcu/HH7XHeAYgaE5qR0T
         AGN1fx8FYXXEmD9Wi3i/s0RGGcaglMXDpk/uVEBl0oqALlCWa5aJQY7SDRlIDvdj91yc
         u6LJaR+rzrpWptrz9Uf4humwMfeKe68dNIut1qZXc0KV9uOAfmtqqrynyud+dzcTVv6i
         OSJw==
X-Forwarded-Encrypted: i=1; AJvYcCUUtGmJkzSWv24PKXK3dFPeQkEswfAb9FJUBh0hcu70eTc8e+aV+/IWgvjGgTginGWp62uxeohUppQc@vger.kernel.org
X-Gm-Message-State: AOJu0YwQpxuKY1cJAFSNfZoGNPWhmFvrRqD55848pqrQYM7iJnT9ucXR
	ZbBmBo2g+TLHCKPX3OlZ0o7bkK4bPcVU8nUXIkDpgW7/3G09FY7gZ0HRUATjhmlnmeV3aYIg483
	7IUPGKenhVY9y39Ggw4kCNS0a5RRIn8W19CaY6fhX0JXSxdJKGqzzU3XFF0YamJrY
X-Gm-Gg: ATEYQzz1dPw2J/01+OjsqpHTawcnIuDkE9+M6T1W8UvvFzcKaG1LAwDh8c5L3Qp0FC5
	Ip5XxsKDC0uoroyskYbrRbvE6Ab9K7hXwtaVhlQoejAK0wAZXwxcCYonXCIm9lktEl53jzRvlcg
	ULZiP2s7vogYPkeFdT+J1VpSOrK3O0IDSD4ri4hZXOGQ0AIAo7CeKgqvdom7hWwVAPD9lbix6+v
	YsFxymP4GAragn5ZYD+YqoGMh+vr4Z8fNHVnVdbxG/5YWNmd1yJHrJ1gn95jqPoBv0Qz+WYLbnZ
	dZYkHjWwW4fRRRnaHKIu2ArrMdXJs6cGq1+sEStVi6UspylA3Z/JGeD4aLEbdrmEEtaLDtmIKV8
	44tlSQU26Pq8pKFwzTe3u9QQwx9Ef0GK8dfSDzg11/tAphF+2CeAkM1T9KZsMQrTBdw8wmluO7J
	2zI3s=
X-Received: by 2002:a05:620a:460b:b0:8cf:d953:b4ec with SMTP id af79cd13be357-8d1b5ba9ddcmr320528285a.3.1775035002671;
        Wed, 01 Apr 2026 02:16:42 -0700 (PDT)
X-Received: by 2002:a05:620a:460b:b0:8cf:d953:b4ec with SMTP id af79cd13be357-8d1b5ba9ddcmr320524985a.3.1775035002201;
        Wed, 01 Apr 2026 02:16:42 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66bf3e16f80sm2826294a12.25.2026.04.01.02.16.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Apr 2026 02:16:41 -0700 (PDT)
Message-ID: <328acf2d-988e-45b6-9553-240108caa91b@oss.qualcomm.com>
Date: Wed, 1 Apr 2026 11:16:37 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] platform: arm64: dell-xps-ec: new driver
To: Aleksandrs Vinarskis <alex@vinarskis.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        laurentiu.tudor1@dell.com, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Tobias Heider <tobias.heider@canonical.com>,
        Val Packett <val@packett.cool>
References: <20260401-dell-xps-9345-ec-v1-0-afa5cacd49be@vinarskis.com>
 <20260401-dell-xps-9345-ec-v1-2-afa5cacd49be@vinarskis.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260401-dell-xps-9345-ec-v1-2-afa5cacd49be@vinarskis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: fpTztWTUr3Tpb8s9axzdFXBXRm-9x6nY
X-Authority-Analysis: v=2.4 cv=XfqEDY55 c=1 sm=1 tr=0 ts=69cce27b cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=yMhMjlubAAAA:8 a=UHR3rlkMSTzHGIdMw-oA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDA4MSBTYWx0ZWRfX0PNhlChOqcUP
 xLuqJQ8ua0Hvug3sc/kIOY+sAmtz/iZC3dtBYr7dekoMXO8vwAXKxKwDOsRuOZtX/xTMT8+mNla
 SByvEAkh7O/U+6//RS4vgtKDI2th83CandsZ6ThmRMqFU/+QNop7Cutb4GYg7Wn0SWBK9sCIGtQ
 zP7VLMMNjzx56LQOWpoN/E3jQ3PTGw9d1uBwvlZV6xfxiRX1C+ZBY/iu2F3mcgAf/wVALR/5gXw
 s1A/lg1x6qJUiNXBs2wrm+7ltdJzaMbMF/Kd33GeUaIofURgi3B7rUCxW44If5TLI9mNczFtilw
 mdVWsyx4XdmJSxBCXnII3ud62YIlJ6HiWmpUA1s8c3pf4reUvzxwdK5WHx9w1Je50HQdzF9T05V
 5oZyK3RHUmkUza4jfjXY4QHWFim1cnz/BpGftA3otMCzjqqdrynBYLzwQacjZe0ohAWu8hHuCx3
 LSHOX3JOgwF8CubNrUw==
X-Proofpoint-GUID: fpTztWTUr3Tpb8s9axzdFXBXRm-9x6nY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_02,2026-04-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604010081

On 4/1/26 9:33 AM, Aleksandrs Vinarskis wrote:
> Introduce EC driver for Dell XPS 13 9345 (codename 'tributo') which may
> partially of fully compatible with Snapdragon-based Dell Latitude,
> Inspiron ('thena'). Primary function of this driver is unblock EC's
> thermal management, specifically to provide it with necessary
> information to control device fans, peripherals power.

[...]

> +/*
> + * Format:
> + * - header/unknown (2 bytes)
> + * - per-thermistor entries (3 bytes): thermistor_id, param1, param2
> + */
> +static const u8 dell_xps_ec_thermistor_profile[] = {
> +	0xff, 0x54,

This is super wishful thinking, but 0x54 is ASCII 'T', perhaps for
"Thermistor" or "Temp"?

> +static int dell_xps_ec_suspend_cmd(struct dell_xps_ec *ec, bool suspend)
> +{
> +	u8 buf[DELL_XPS_EC_SUSPEND_MSG_LEN] = {};
> +	int ret;
> +
> +	buf[0] = DELL_XPS_EC_SUSPEND_CMD;
> +	buf[1] = suspend ? 0x01 : 0x00;
> +	/* bytes 2..63 remain zero */

buf[1] = suspend

(since it's a boolean argument)


[...]

> +	schedule_delayed_work(&ec->temp_work,
> +			      msecs_to_jiffies(DELL_XPS_EC_TEMP_INTERVAL_MS));
> +	dev_info(dev, "Started periodic temperature reporting to EC every %d ms\n",
> +		 DELL_XPS_EC_TEMP_INTERVAL_MS);

dev_dbg()?


> +
> +	/* Request IRQ for EC events */
> +	ret = devm_request_threaded_irq(dev, client->irq, NULL,
> +					dell_xps_ec_irq_handler,
> +					IRQF_ONESHOT, dev_name(dev), ec);
> +	if (ret < 0)
> +		return dev_err_probe(dev, ret, "Failed to request IRQ\n");
> +
> +	return 0;
> +}
> +
> +/*
> + * Notify EC of suspend
> + *
> + * This will:
> + * - Ramp down the fans
> + * - Cut power to display/trackpad/keyboard/touch row
> + * - Periodically (?) power them back, such that wake-up source still works

FWIW

https://learn.microsoft.com/en-us/windows-hardware/design/device-experiences/modern-standby-firmware-notifications

Konrad
