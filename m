Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 322BF3D8115
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 19:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783366182; cv=none; b=ALt7jvJtiJH1hAsWJdDl8UjSzwGUA6lGtClu4bJylI1/jEh8d/E816Z835p8DC8RZTMOFej2LM7EukbOjvf9dV7TeOhZ9dbSv5rq4FPGVqjmNTJp9SG4ZR8xOI6RKlmwZyQta3NwtZiSZAJuh7HoGCMZcx6Lfyxai69AmVARCu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783366182; c=relaxed/simple;
	bh=w3L9gA3qWCSJOJycfuLUhr74UkEspHCqcITKn7/B1Yk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VK/PIb76d+Rw54IC5zyjY2N2psSYvdOZP8JzH5WifRcXMgdsZgRMeQ954a6/93cmpDu6lsGdlMaRO7YTfrtmRhT/qmqs34nyVzVkCbwTvPK2dWvC3xXX1MbyeOzX86GIincvQFHZTRC7zlPq3S00DKyndYQdot1w1PafwwveYsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OA23AkmY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V/tIcdTw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OA23AkmY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V/tIcdTw"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666FFDLf809697
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 19:29:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1MNHaWIk4PBs4MJ6Wrebqp4A4AMrSu5e1jkD6u1Sr/0=; b=OA23AkmY3caOk9jB
	dNUnlz0tTKUiOmhQT/60BasqZkYmtET8Ptz2FHtHF65SEQNdaHEKbUA7U91OLXLH
	h0IaflwetgJaohLkZydtXvrbHM0m5kLLhYJ/fHuMbIHpSZzDFhW9U17ND/8p3aeI
	tRdo0BCQ2mNQo/OFjrZjokhSiAx+J7MQfQ0cQnYPOzW/VQpDv1dQuCntiiXkOb/B
	lM003tlj7LVU//H9BsGG66yxrbLqwf4J7PaFyLGzCuJDGyB3erUuiQ5g5x/qrngf
	84FeJTr5NnBY7e5yxwajq2xT0gRruMaOHlu74kIz206u/aYC4ozBwquujD79mZEw
	HvPzrA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88hsb1dd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 19:29:40 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e5e38fbc5so306393585a.2
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 12:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783366179; x=1783970979; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1MNHaWIk4PBs4MJ6Wrebqp4A4AMrSu5e1jkD6u1Sr/0=;
        b=V/tIcdTw3wO8CdE+BLX7cMbfXDw4oqcnUF0gB8y8xRuFAcF7PYY3tBBXGXL+OTGL98
         m1c2Q6UIzuohG5KLVhaW6kKY1HzbsTuk+7yGXy0iE0VSTR4DTi0cK6TdTlTDwOmibigI
         Pg8QwVawko2DFfxuYJI4+f6ZIGcubkmJfmOoM6nytuXUG5zFlcA0HRb5e1W+gmvLNbN0
         ZusW6cG+9NkXgNHpEQxBLRhhvj09xb3Hc9j471hVooVrPOtTlwp6OPPo44gm6SvwpzfA
         d917Sjg2lBT/TmIp+qbYpDP3rARTARHoN+ang7jSS9htr8oatFO+gKvYuF2eAj4LtFZR
         jkMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783366179; x=1783970979;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1MNHaWIk4PBs4MJ6Wrebqp4A4AMrSu5e1jkD6u1Sr/0=;
        b=UYImuaGm2yJ6O0FRfXZUdB4KgCt6A23oyWZ+yhUbFbkr+6YRnoPs48me5cdIuJ7aEq
         NN8BIYkyoxsKHzaVwM94v2myyob7iguNKgvoVn31HfJFFx9eUogVTrrc9LZM5M+OQS4Y
         TCGvvBKcRiDrki+ZgGp1qO1BvSKr8hYA9zrswU4uR6m5LvHRKt8atJGBnGuTpbmzCgxv
         bZAJZ6BSnlo9JvsGoQ+6PEgth9An3JJgGHo8/ZQ0jDJ0kvyjqJff1zrEzJiXoz9AIlL0
         y7Ex10Sc5AwuHe/lw9vDhp+bh7T3IHk+9NY6GteN4I3J5//rqSrLHu3LGNZdgbjj8ckw
         1Wcw==
X-Forwarded-Encrypted: i=1; AHgh+RoZfJ2DuA7p4zfG+aIk0erX7dBUkU+Vgnk7EjP75zDpc/6HgJ+dqhJpxEsb+iSxGmLxkgsx/pZXKNqj@vger.kernel.org
X-Gm-Message-State: AOJu0YxxCqONpKuBFMQOM+aif27hGA2cdybZTQOh3FlexAYy9R4VrHT6
	pw8AbT1zmQOGS+d/JTHggIfNMofJ/xrDpn/SxynIGeTo3ajN+XovgsGvwGxjs0r/NrkXwHXUN9e
	rtz8wcM7qk83ITg4pfwhHcnKcNrOh/iyQJKzrDnr5edGkrcD/WEzWhyMr2/v78jMR
X-Gm-Gg: AfdE7cmJbzUqhFeGAnz4/OG4fgykAsDkSlgL/J9bkMUXUVzYBU5Y57h/BHQ8TQmA8mJ
	mVT6n9htyCkwHdbeVrHDFQiM3EJqhVeaivyiK/nGpmlPzwFXBUT9ng2wphvLKjynytIXL6LA9M3
	HLIpQ6gqEibs7Or2veeXg90QJ3IJ4UPrLQhGHqBYfnfuebK/2twpej2fj+RwhpV7/QMK9RdxIt+
	vlanzjPK5OEK5Ce+DJcS3rL5ftErBAm0LXm3KmgQG7NvDsTWTqqpArL8ud4p+ptB1E9tNbgYUzx
	lqBtgYeWWnaJiOSs2CqcVaxUU9ys3+o5W8CvG/fcLArkwa6alRCYpS6eVEgBGnUOWtE8Vpav2t7
	n7bUSMuL+4xXNuvvP0JjqjVRBAYKCHFLICgqnm20+ZLv8Jqnei5QK3QxJ395djhUxJ4mqRtIu1H
	V7O6h7D+uwrma0MkGyN87RkJJV
X-Received: by 2002:a05:620a:4412:b0:92b:3720:bc59 with SMTP id af79cd13be357-92ebb4f9c01mr259963385a.28.1783366179330;
        Mon, 06 Jul 2026 12:29:39 -0700 (PDT)
X-Received: by 2002:a05:620a:4412:b0:92b:3720:bc59 with SMTP id af79cd13be357-92ebb4f9c01mr259956885a.28.1783366178684;
        Mon, 06 Jul 2026 12:29:38 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed13bb685sm3095513e87.46.2026.07.06.12.29.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 12:29:37 -0700 (PDT)
Date: Mon, 6 Jul 2026 22:29:35 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: sre@kernel.org, hansg@kernel.org, ilpo.jarvinen@linux.intel.com,
        linux@roeck-us.net, andersson@kernel.org, konradybcio@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        bryan.odonoghue@linaro.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        neil.armstrong@linaro.org, gaurav.kohli@oss.qualcomm.com,
        manaf.pallikunhi@oss.qualcomm.com, priyansh.jain@oss.qualcomm.com
Subject: Re: [PATCH v5 2/3] platform: arm64: lenovo-thinkpad-t14s-ec: Add
 hwmon support for temperatures
Message-ID: <qfqoes52fjrd5ivq2tqfnua23lkm4qgyrvalik35qb4u2njmiu@5e5wugwoxkzb>
References: <20260706184648.35613-1-daniel.lezcano@oss.qualcomm.com>
 <20260706184648.35613-3-daniel.lezcano@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260706184648.35613-3-daniel.lezcano@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: rr6YsGx1AZ4ynYkSRg0cefgq2cnEg65D
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE5NyBTYWx0ZWRfX7PBvOVCNj5x/
 cxJXupEyzL0/joC5eaxG6RRs9Y79v2ZMQfiOdFG9MtyqcLaJozizFt33DcwlrIZG5Pb+3ncqo3W
 lr8E4YShd1LZigSalY67dz98SYUcHE+viYhbhiww9WDZea4q9SDlqXyuh4JqNIj/zbtNAiy5I8i
 st1RCTBpu7KPH7q/fYw4YDV6hgQLuYy6V+oe4OdyChvqffqvCNJ7nKszsWYgxvFIt4Hgd3cZHro
 0Q+GumtIO9ePEbDs/j6No732z9V/ky+ctVPL0ig79Y82LYikFviK3i5xdMPxmHg2KRnbgXTrYjr
 AmiUiuyegoSUl/5teep5AsOAi+N7zywtdCXAenxzgMLqscJJX7Hd0x1DqOmZPR4vEfUuXjYZ7yE
 9obUZGvJCk6g1GHLFHP6AaZCQ5zrZzGhSgIAO9McA0YoSW8xxBE6/qbOHWR4H+DDbn6V76S3fpp
 alsJ36tVfdoT0jfxmXg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE5NyBTYWx0ZWRfX3+I5IbZ204k7
 XNlvj1fqMrZp5bFL6UcWJ26oUGCUjnY1+30bUcQP9HoeSgHWdYoBINaOkXbvwjg8DD7A5ewg2eX
 s6bOhsjNYkGICgqXqNupYHoFFPQw7JA=
X-Authority-Analysis: v=2.4 cv=XIwAjwhE c=1 sm=1 tr=0 ts=6a4c0224 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=QyXUC8HyAAAA:8
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=n5oyEeUQHuXu7Mk2C9cA:9 a=3ZKOabzyN94A:10
 a=wPNLvfGTeEIA:10 a=zZCYzV9kfG8A:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: rr6YsGx1AZ4ynYkSRg0cefgq2cnEg65D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 bulkscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060197

On Mon, Jul 06, 2026 at 08:46:47PM +0200, Daniel Lezcano wrote:
> Expose the Lenovo ThinkPad T14s EC environmental sensors through
> the hwmon subsystem.
> 
> The driver now registers a hwmon device providing access to six EC
> temperature sensors corresponding to the SoC, keyboard area, base
> cover, PMIC/charging circuitry, QTM module and SSD. Sensor labels
> are exported to allow user space to identify each measurement.
> 
> This allows standard monitoring tools such as lm-sensors to report
> platform temperatures.
> 
> Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on T14s OLED
> Signed-off-by: Daniel Lezcano daniel.lezcano@oss.qualcomm.com
> ---
>  drivers/platform/arm64/Kconfig                |   1 +
>  drivers/platform/arm64/lenovo-thinkpad-t14s.c | 131 ++++++++++++++++++
>  2 files changed, 132 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
