Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793795182;
	b=Pq+nCnLhOyl3nc45maVlsffaABfORvcIC5j4Kj+DqGGbi37+DL5gUt/tjjZOXerD8j4e
	 oGhGx8dZuRzIOV5oYgtiDr2olCDL9XVue/6+PjPjBr0mKhVJptfT/0EcHpZaAkmDhD8lb
	 MY5qKb0xi+jVqAtP+9vHzmFcv2KHIT1Vw3P2C/Htvvsf7yblHBX03F3+sh0UefzJSHF21
	 VHhKU7Q5A/bADFg9hNICAoWQzN/Ggr32vxWtmdPc8jQOSF0jymEgWRrNhILhAMjvTHZTj
	 GP201u8ywkD0z8rGKfMQ4sgOHD+euy4y7TePgY9SUeBg0kAr3KanzE3IVCBogdaI4uA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793795182;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=VK2mF29MPTHHe+f3apHM/eGxl2KHbCALcUXSoRbY3qE=;
	b=oHnOUpgDpwDIIfeCNYqUhmljgkqiUAxPJYv6qhqOP/Re2mt0DbuYKp0bQslWNJiVQCwC
	 8TrjEylJbpHyZG8ol1J9OIERo0dGffgzsbvEKBLr432MhT0JxjWo9SSreL9JngQJ1aDTi
	 uSYHjh/UOXwfY2gsQeSgYsZfqxaAEq9ilYxg/jGnuNFxXcjPHml06cYjXJ8livIidjK8r
	 AO1zbKAkouKw7n72lcm9GwzCoLnbBTbErGfJ6PLkVAojxi+MwzZjBQRWT87xrEYQZ9hus
	 dbr38lqj/H/K2bZ7Mba2KSRwhoDH9Rq5GYcLf2FGe/i9NNFXB+wNZkaR9PqpEGh+pzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Fx+t21J6;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HyQRJ2iB;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB39D606A326
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 12:26:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB39D606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Fx+t21J6;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HyQRJ2iB
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4BZt9E1700396
	for <devicetree@vger.kernel.org>; Wed, 4 Nov 2026 12:26:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VK2mF29MPTHHe+f3apHM/eGxl2KHbCALcUXSoRbY3qE=; b=Fx+t21J6rHyUMJMb
	GZNednuJA+XbxTEdcMhD+WABGRodwzN8hXZt7g4lHDsSYSKoEglW8g24cxWZcFug
	nVcgFlz7tvADFxgvXDFICY8tiEQyZwnmoDYt8l3NIDRGearB/MJ/12xRTojwXS8R
	jDIh/wYZGnKeY5sr4BKV2/sEalWuUmjWJV2aaLo0jMtZUBOKYkaBy9ky6caOb0g3
	mtDIDX/csZvbhvSnG3ZILY8FxI/X1gsn6LhTpMZdKecop0qGxm/pAABNNzxnIfUE
	f/wg8FBCbYnzLV4tEkfw02jzmwq8l3DRA0USuwTQ5Cnf1UQmqUspE2koHjjUbvfp
	M7jCNQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr3pyg8ak-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 12:26:20 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b0a7cbf164so123899a91.3
        for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 04:26:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793795180; x=1794399980; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VK2mF29MPTHHe+f3apHM/eGxl2KHbCALcUXSoRbY3qE=;
        b=HyQRJ2iBX2PwwVOPnUnanJC9zGDofhaa3aQZgwvVeEvbZBfFDoAop+RD4dcg3hq/2b
         ikEwSbKZsPvktv62Lw91CVKlqJ5L3va7K2M7hq4atmWGGu+Zq2SQ/Ziqf3zTMyZgboRo
         EZk/VvQozGxOwIAEBaEWf8sEBvzJw4to9X/DSCAlzyVAcmHMDUrIl5nm6KtAu9oNpjx4
         sEijJc/qBcYfTorcUfNhKjgu3vSBsqldHlQ4otb2xv37PqJ1TL2H0dmKta6/E5b6AFV1
         xRymKmKxey5qvx0i/9nyF+AJke3CnGqic5xVsSF6sN3EVyroFLVFdw8shZNS4EAfOElW
         oBHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793795180; x=1794399980;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VK2mF29MPTHHe+f3apHM/eGxl2KHbCALcUXSoRbY3qE=;
        b=UIvI2nILWdQQdsxgt/46mbLxgifuql8Pu1++layaIE1VzMrhY25S3VKD15EG9UmQUb
         FCEaJB4HyLdEO8T4uKVa6yjOCUJ1UH3G9G0nj/0BDRGAcH1siwXBIzUaqiTancIee8Nm
         vs/IKd+o3aYtdoQPNA7rhLCxz+a5BqP5WEYYaaQuNgtOUhXM6IAoZTSpXrLGMQRZKZGd
         HTXM5uCcr95nZBxAIrEIuz1wxw/2SBmpp0HNnR/iehVUpJRaL8dhZSetEjCz64pHcHbT
         TrB+OST+uDvtDU0v6BLSDH/Im5Lie4iV07B+1XeYz0pXiv9k58NkNOqYr+aASPm2CelR
         i7dw==
X-Forwarded-Encrypted: i=1; AKwUvBzph4YAamlffbpbgkmuCLYhiY9qTySXzCBXvRGwtlERWNAs6AT+cgGebYBjAweKV3nMmw74OHdQvtHP@vger.kernel.org
X-Gm-Message-State: APuU4Z+fta8m5VcOTJHEB1Zg+ByCE+Y4armaHtCB1qTwNVA92A3kb/ez
	UxWSKBP9DhrKBrOW7thbw0VhdrfLoiQa/VghRpH3TgDTh2Zv4m6SpnBhBKaFY4cP7b+I9VfKtMO
	7DBMsoIabYonQeyGcfSqan7rBajoPkERPFtLECv8DLMN+v8Vn3t8QmgdgmPb4WSiu
X-Gm-Gg: AYBFou1PtCCs8ON/ohJ+CWH1blPBymUQxiJw2uEZLY1SLxt2xDFX1VmEk8U9dXy7aB7
	/CFIlf9TZhoB3NGZiru01YnZv4DbT4kyN8oVJkfZCXrihpLG0TmHGN2o1A9YZOONF2NGqXLO8+4
	/R5wWddNd1VJCJBlNDMMsctvXqxs1vHjwc6exuJpt/0JHlYotr+OiRUVw/jNRoEV2RuFsRFJrTM
	82jlBtFiC4sjW4giMvRDAosqYNJmbNOOW0c6JfYoHDOgi/MEURHeDa7N0XHvVquHUsLIIqL2/ce
	UiMn3l6DEF4PwSbt0sHUKV5bnp5TldAZEGJC8/ydWCLYxTvKjnZbEiOSJ5n2cN45nhXLgcYH5zf
	S3GJo7COGDqp+kJutRcWzJBuoQmhQP2Qdfqn+xJcsrLPnmCSl02rcV3nsdKCl/FiVt3T6YYdpMn
	fuHFqOcA==
X-Received: by 2002:a17:90b:53ce:b0:3ac:7c52:fae5 with SMTP id 98e67ed59e1d1-3ae89835706mr12958243a91.50.1793795179561;
        Wed, 04 Nov 2026 04:26:19 -0800 (PST)
X-Received: by 2002:a17:90b:53ce:b0:3ac:7c52:fae5 with SMTP id 98e67ed59e1d1-3ae89835706mr12958197a91.50.1793795178953;
        Wed, 04 Nov 2026 04:26:18 -0800 (PST)
Received: from [10.92.198.106] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b093d481a3sm3924074a91.1.2026.11.04.04.26.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 04:26:17 -0800 (PST)
Message-ID: <f51b9be2-acbe-4d4f-9f81-bf5b289eab0c@oss.qualcomm.com>
Date: Wed, 4 Nov 2026 17:56:07 +0530
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
Subject: Re: [PATCH v4 02/12] hwmon: Add Qualcomm PMIC BCL driver
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mfd@lists.linux.dev, Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
References: <20261005-qcom-bcl-hwmon-v4-0-50b9a8c730b7@oss.qualcomm.com>
 <20261005-qcom-bcl-hwmon-v4-2-50b9a8c730b7@oss.qualcomm.com>
 <b7bc5c82-6812-4df6-9820-122a4c957036@oss.qualcomm.com>
Content-Language: en-US
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
In-Reply-To: <b7bc5c82-6812-4df6-9820-122a4c957036@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=ZbmIpcVA c=1 sm=1 tr=0 ts=6aeb246c cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=6zRx56OMOPonLltcXX4A:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA0OSBTYWx0ZWRfX5h/hWwdaLTW6
 oE4fW2EZ+WuDrnEkxWuq4RfAYpzevMsrNxl64KUUwi+ckDccbWzW951x1dhyAMjd3WxkDSps0H0
 dOALcfiYG8Bj03g11pftnp0tcEvSRr7UP93MxXvIW5Uri4s5HfO6zUDFZs8mEb32zE+VWP1BpkS
 xNXDsBO95xCTrqM9OSks/5z7rfYFgY/LyTlzERIcZOYZE1ulvD3ZqOImXgqlQKGWEPGnj4ziiPs
 dm+AReLytxzsP0zJg5kOgjSMi81krzqiGIVzpk4SibmikDWXseZ3+8V07wpQ9bt1i759fvXiDNR
 153x32g7+r6WuhmPBrgxj2Roqd5qE9bNHDRsHfUrqqle9jXOoDR+0YneVpkc4UjJq8GIO7+izLR
 Y7w+352l94W7lXPY5+waPCjpkry1DPY9yShaoY9oNsYXpvcKVDtzrkQD2yGgydQA2EaKNZZyA59
 +M/qmeSIy20WG6IirTg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA0OSBTYWx0ZWRfX6Ik6+Y1lV9Vo
 w3ejGyCjrQiwj+oLbZakobJjfF/Yk2KhYHkfnLOrWN38KrDKYufX/XAH8pdwKhq4XRvanslIRuK
 VRQXrb6ClOWDmvLWecPffIOkMg17DVQ=
X-Proofpoint-ORIG-GUID: laUSXkbys8gtUFOT0rDj93vB-9_NRHmy
X-Proofpoint-GUID: laUSXkbys8gtUFOT0rDj93vB-9_NRHmy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_04,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 spamscore=0 priorityscore=1501 clxscore=1015
 phishscore=0 suspectscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040049

Hi Konrad,


On 10/12/2026 4:59 PM, Konrad Dybcio wrote:
> On 10/5/26 2:24 PM, Manaf Meethalavalappu Pallikunhi wrote:
>> Add driver for Qualcomm SPMI PMIC Battery Current Limiting (BCL)
>> hardware monitor. The driver exposes battery voltage and current
>> monitoring through hwmon interface.
> 
> [...]
> 
>> +static int bcl_in_thresh_write(struct bcl_device *bcl, long value, enum bcl_limit_alarm lvl)
>> +{
> 
> [...]
> 
>> +static int bcl_curr_thresh_write(struct bcl_device *bcl, long value, enum bcl_limit_alarm lvl)
> 
> these two and bcl_in/curr_thresh_read can be unified, then some
> helpers can be collapsed inline as they become single-use

ACK

> 
> [...]
> 
>> +static unsigned int bcl_get_version_major(const struct bcl_device *bcl)
>> +{
>> +	u32 raw_val = 0;
>> +
>> +	regmap_field_read(bcl->fields[F_V_MAJOR], &raw_val);
>> +
>> +	return raw_val;
>> +}
> 
> This is single-use and trivial, inline it into the call site

ACK

> 
>> +
>> +static unsigned int bcl_get_version_minor(const struct bcl_device *bcl)
>> +{
>> +	u32 raw_val = 0;
>> +
>> +	regmap_field_read(bcl->fields[F_V_MINOR], &raw_val);
>> +
>> +	return raw_val;
>> +}
> 
> Likewise

ACK

> 
> [...]
> 
>> +static int bcl_hwmon_write(struct device *dev, enum hwmon_sensor_types type,
>> +			   u32 attr, int channel, long val)
> 
> Do we expect userland to program these, or are the default limits
> sensible?

There are some usecases where userspace needs to modify these settings
like in different ambient condition.


> 
> [...]
> 
>> +	/*
>> +	 * Map register value to battery configuration.
>> +	 * As per hardware documentation:
>> +	 * 0 -> 2S, 1 -> 3S, 2 -> 4S (unsupported)
> 
> Would it be hard to support?

As per hardware description, upto 3S is enabled, will remove 4S part 
from documentation.

> 
> [...]
> 
>> +	/* Check if battery detection is supported */
>> +	if (desc->battery_config_field.reg == 0) {
> 
> This is slightly sketchy, but SPMI peripherals always have some ID
> registers at address zero, so okay..
> 
> [...]
> 
>> +static const struct of_device_id bcl_match[] = {
>> +	{
>> +		.compatible = "qcom,pm7250b-bcl",
>> +		.data = &pm7250b_data,
>> +	}, {
>> +		.compatible = "qcom,pm7550-bcl",
>> +		.data = &pm8550_data,
> 
> Are they exactly identical? If so, please use a fallback compatible

ACK

Thanks,
Manaf

> 
> Konrad

