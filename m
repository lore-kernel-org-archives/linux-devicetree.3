Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67D843EE1C1
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 07:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783495898; cv=none; b=Ho8sjVNBZRjowVDGdQ7m7ks9nXm4ywOGBDzqIXkTYHqT7jhwltUiR0umDB8vfg3x2EqcVd+5acQLtYwfrl3G9j82gm50xzt4eSEcTS39rfor0Y4vQ166N0CLunHmqlb1ERpFIkp7sQ68b9vzjkh1J1xK8tGMG0IB9/ivrmrzLFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783495898; c=relaxed/simple;
	bh=bRHwrAZC93czbdFOntiYykQyXzYF6wbZB3hH3rMeWVQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MvcFXNsjQqkXOwGUO4o6r+vcpQ/LIGia5Rc6CGuvAksz9dZjFKHVVdjnc2v5j3NZ5J9D/vcLyYgKY/XzwENp4Czyp76oy4LfjgMtx+WY4pQaD7uMy5iL5wzXMXF37f0XOUhuy5QM35Y8eBMeafXIck4rx7Aifhz/1x9hhLMLd8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C/M4JIKG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eqW0kbCw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C/M4JIKG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eqW0kbCw"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66842iKP1625097
	for <devicetree@vger.kernel.org>; Wed, 8 Jul 2026 07:31:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TzGrlXz/k86ZY0yzNouv6JvvoTJVqGivqV74u7X/MlY=; b=C/M4JIKGO2NdUVBX
	Yyc2Ob+dgO752sXwa9lwqIS3Xpd8DWTGhiBfoWgFP9kiC+yspWQGcIvtcGMkcr4u
	cXhlXn2J+Hp5DSM7ocJvD60KZbv6y4qhmzlj3QlOvN+9nOwx9mOlWlKDXp3aN8VV
	EWNLQKw7VJ6DPkWTcWS1HZQM5xOuLYdPSqnpSJW8fg6uh0972TBWt7JDhR3ebwA5
	Js/00Is0Lscvy4qRTMDXIWNymISI04g4OJ8s1hFfyvS+FR4Eu9wZoAwZkKOTjwpB
	qGF57FXByGddRp5/qWJU1AMxxz1+s7WU7Jb6kIPalQzsVBJDahr+ae7DCXDbsnOo
	e3pOTg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f95fd390c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 07:31:23 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-517e054fe07so7658311cf.1
        for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 00:31:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783495883; x=1784100683; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TzGrlXz/k86ZY0yzNouv6JvvoTJVqGivqV74u7X/MlY=;
        b=eqW0kbCw4AlzE1n4nDuDs4U0F0ECD52EmpCQiIl9we8Kvfo7dg6gXFPztsoBOTc67Z
         Gd+QF3xdZ1oyyKTk3VRI32dGBwLM4XwJcHBsgyjIrXfngsP8M0U9GZ0fpGxt9FR4vkE5
         B+eDq/rRqHLI6jQSI936IJa+zsTLLijGf/HnAJGIgfvY3ZSm2GIisXPztFIttFINqnvg
         Gpc0OARvy7acUezP0J1r6lZ1F8rvSRiEIy9umB0ZWHZqXIBjEbytmBWwwc8eiGpx0/T6
         ArZILivBNui60myBIrPR9ctmlvwoRRUI1UBCYpHEo5JgqILVJXH71ol7Kw1g/PcRZWv7
         SruA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783495883; x=1784100683;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TzGrlXz/k86ZY0yzNouv6JvvoTJVqGivqV74u7X/MlY=;
        b=FgtOZtGY23uFlDqRYz8zpsS821NWSN1FSurV2ZOFC9LIdEy13mr9+22jeIzXuc80xH
         BN1IoAVXzLd0QeGvtlRDCqLYRHNOrPAhmJEKQ4IttfjNogFuRFcUOJXPfyS9S64TVdvG
         UJC4m+TJcfNM4ltW5rPzMuvHQWy16NpI+O/HAb9r0tzRmXoD5ZUKsAgvOAqQjn8n4Vfk
         TxlzXmR/4qGxwhDhf17ErdiTgSgDAI8SxohPVwubVB/z0FTXj4iH1ss+182O0ZExRAfN
         5HGGdEq7tS0n/W2DEdMB5H4VNfZ8Xiai1q7gznsWI7QDQESVJfkuetU7t6rSxkG+7UuW
         8aJA==
X-Forwarded-Encrypted: i=1; AHgh+Rpsxlc2dXzMzztwDL00juFpDqW7ldZ8ysuIazPuCLJYu/Nbk4Mjko7eLC4JmK8dM59YNEZoMggbdTBs@vger.kernel.org
X-Gm-Message-State: AOJu0Yx90YZEOIt9Ekr4RA59ktNWDjHpgI2EpL1uU5ITX6JKNiJU4SDA
	Fa8xdRzM4epjnno1YQvPgcZIQAaKLKA4GFVkZjeVOg0D4fg7FQ65fqEKNZpagWXr8yY28JRnqKk
	kZbMY9QUPyA/pPlByMNv/XqzSkMXRVGUsVJbgPI7MTYRw6iK5dZxHm+BWDvS8DtVL
X-Gm-Gg: AfdE7cn1DaufUEJWrPz/760An/uv3pDsYGsRWqWZbSwVGCLtDVT4Lkp8MvCrGMqwwfP
	MW5ZaIAaZTa0JAYcsD8zAg2GMMcuE9uTSBDFpsQSOVTV86YgB+pC3d+n+P+WAFZUXR5VFOzBVYy
	B0cD1+fgIOWxneSz4aqYKjD1lvHxvd6oshQefI1kr+H+/ETtRvDXBv9NPvej0PeAVc2+6jKWzmq
	75lf/RtnywajUMIIR+/9RLwp47sJz1M+E4BcRz3k1Wqyt9HeEMa+FFYJk/CpC+JCgIO4YMe4RRh
	IwhqYivV9OMzSuVWH2u7SyQ5Cl4rmw8nPqgYgkWpgNDTlverUu3zV0psQ6jukhoQjw5knKTJ7fy
	gfvTim6WS9dqMUjERuaHkxM6LJ78MfEs2J8c1aXnIyLrm8xv3yFvyGGbC46XAH8vKV4jB/+ylfw
	==
X-Received: by 2002:a05:622a:44:b0:51a:8c9a:8fb6 with SMTP id d75a77b69052e-51c8b4c2ee9mr16996351cf.71.1783495882751;
        Wed, 08 Jul 2026 00:31:22 -0700 (PDT)
X-Received: by 2002:a05:622a:44:b0:51a:8c9a:8fb6 with SMTP id d75a77b69052e-51c8b4c2ee9mr16996001cf.71.1783495882167;
        Wed, 08 Jul 2026 00:31:22 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:9094:f7db:443e:b97f? ([2a05:6e02:1041:c10:9094:f7db:443e:b97f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e5a572c3sm43480075e9.1.2026.07.08.00.31.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2026 00:31:21 -0700 (PDT)
Message-ID: <bba69f4b-9a09-4e9e-98c7-3833924131eb@oss.qualcomm.com>
Date: Wed, 8 Jul 2026 09:31:20 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/3] platform: arm64: lenovo-thinkpad-t14s-ec: Add
 hwmon support for temperatures
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: sre@kernel.org, hansg@kernel.org, ilpo.jarvinen@linux.intel.com,
        linux@roeck-us.net, andersson@kernel.org, konradybcio@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        bryan.odonoghue@linaro.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        neil.armstrong@linaro.org, gaurav.kohli@oss.qualcomm.com,
        manaf.pallikunhi@oss.qualcomm.com, priyansh.jain@oss.qualcomm.com
References: <20260707192228.14647-1-daniel.lezcano@oss.qualcomm.com>
 <20260707192228.14647-3-daniel.lezcano@oss.qualcomm.com>
 <20260708-wakeful-cyan-caribou-35fd09@quoll>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260708-wakeful-cyan-caribou-35fd09@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDA3MCBTYWx0ZWRfXyZi1r4TY21f+
 GngF3BJBuXxO9NpbLUHVHBsn0OJ/CB2NaYqIeYPPWaUYjzEjhmEKoLZOMO6o/I1Kr3Z2vT++r7g
 HA8xeQpsldIEjpJCeCRY2fTw9oRPKH9vuPmXkxaxkT6XB+/HQrvu4WXn2Gr7TC6zDTuGJNZ3Snv
 zGeuAgjXJ0zTkKLN0ljCHmtBTZ9zcZsNaAYk0sK9K9jzz1oLguGSvh5uP5SjqTD6YTi8qZl5u2K
 YSKPDuDbL3byuqXHWWi5dqi5LqcOaU4WHbx1aD39mC7C1gWRL3zomXxE9XAumt5UEShC2s+If7w
 hqzQVKNLguUeeMnPse2dUdMH/nZCTzNrkpKtAVIJW7FsRzHY/+FNmTHRPau32zJMi1cxYz2SaXU
 uvUBTGESjfb/ztG2wKYPABnsnE5vlJlEZWajtQv2wUfo9/06cnzAXb7bg7UR193dh0abZWTiBFj
 UXaPml5UhSkOpQ8qeag==
X-Authority-Analysis: v=2.4 cv=VZLH+lp9 c=1 sm=1 tr=0 ts=6a4dfccb cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=PiMqHjl-x4LjNog7iuwA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: jZBz1SLOc69JJqMieppkjhrau0J4r78r
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDA3MCBTYWx0ZWRfX4HYi6I864Nmg
 HAkuY2HfQ7mt2jWJRFgQmFd3uAUfReXWfuHWOW+qRc9vzMwnx/mVMioQcLf/lC/4WDyLSyDMnFJ
 E3nYjTwD31K4l8ZKH3O8eLbYtY7OL2I=
X-Proofpoint-GUID: jZBz1SLOc69JJqMieppkjhrau0J4r78r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_06,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 adultscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607080070

On 7/8/26 08:30, Krzysztof Kozlowski wrote:
> On Tue, Jul 07, 2026 at 09:22:27PM +0200, Daniel Lezcano wrote:
>> +static const struct hwmon_ops t14s_ec_hwmon_ops = {
>> +	.is_visible = t14s_ec_hwmon_is_visible,
>> +	.read = t14s_ec_hwmon_read,
>> +	.read_string = t14s_ec_hwmon_read_string,
>> +};
>> +
>> +static const struct hwmon_channel_info *t14s_ec_hwmon_info[] = {
>> +	HWMON_CHANNEL_INFO(chip, HWMON_C_REGISTER_TZ),
>> +	HWMON_CHANNEL_INFO(temp,
>> +			   HWMON_T_INPUT | HWMON_T_LABEL,
>> +			   HWMON_T_INPUT | HWMON_T_LABEL,
>> +			   HWMON_T_INPUT | HWMON_T_LABEL,
>> +			   HWMON_T_INPUT | HWMON_T_LABEL,
>> +			   HWMON_T_INPUT | HWMON_T_LABEL,
>> +			   HWMON_T_INPUT | HWMON_T_LABEL),
>> +	NULL
>> +};
>> +
>> +static const struct hwmon_chip_info t14s_ec_chip_info = {
>> +	.ops = &t14s_ec_hwmon_ops,
>> +	.info = t14s_ec_hwmon_info,
>> +};
>> +
>> +static int t14s_ec_hwmon_probe(struct t14s_ec *ec)
>> +{
>> +	struct device *dev;
>> +	struct t14s_ec_hwmon_sys_thermx sys_thermx[] = {
>> +		{ .label = "soc",	.reg = T14S_EC_SYS_THERM0 },
>> +		{ .label = "keyboard",	.reg = T14S_EC_SYS_THERM1 },
>> +		{ .label = "base",	.reg = T14S_EC_SYS_THERM2 },
>> +		{ .label = "charging",	.reg = T14S_EC_SYS_THERM3 },
>> +		{ .label = "qtm",	.reg = T14S_EC_SYS_THERM6 },
>> +		{ .label = "ssd",	.reg = T14S_EC_SYS_THERM7 },
>> +	};
>> +
>> +	ec->ec_hwmon.sys_thermx = devm_kmemdup_array(ec->dev, sys_thermx,
>> +						     ARRAY_SIZE(sys_thermx),
>> +						     sizeof(sys_thermx[0]), GFP_KERNEL);
>> +	if (!ec->ec_hwmon.sys_thermx)
>> +		return -ENOMEM;
>> +
>> +	dev = devm_hwmon_device_register_with_info(ec->dev, "t14s_ec", ec,
>> +						   &t14s_ec_chip_info, NULL);
> 
> Last time I commented this looks like actual ABI break. You did not respond to
> that, so I assume my finding was right, thus:
> 1. binding is not correct (although driver should be fixed, not binding)
> 2. the code still breaks users

Sorry I misunderstood it was a question expecting an answer but an 
affirmation.

By ABI break do you mean:

  * new driver with old DT will fail ?
  * new DT with old driver will break ?

* If no thermal-cells is specified, new code will fail with -EINVAL
   -> is that one a problem ?

* If thermal-cells is specified, but no thermal zone, new code does not fail

* If thermal-cells is specified, old code does not fail

* If thermal-cells is not specified, but a thermal zone is specified, 
schema is not respected

Can you clarify ?

Thanks



