Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEF6E46F4A7
	for <devicetree@vger.kernel.org>; Wed,  5 Aug 2026 13:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785935764; cv=none; b=bKnSyLk8+YHAAa6dW40ECbpy5GyO2K6yYKyNC7rJqY2/bkYA3z8MoFLktgZBfy/fvMcmjE50K/kVJJJIhzqSuzz3StNp/ozZ9qTYdTr7cxQdiOcNoXAfSv1rlKPFsLSXrAXEOtvP/q3GyruEUYaCwOaVUYcen0Sv64tbV5mnioE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785935764; c=relaxed/simple;
	bh=MCHR5bHaUz1jgjPvf2+S+pxP7wSBueHnoUoV9aIhEZg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B16KXVcxDsKHu8NMdF7UIgM2hVDX/EG4ltVU/1TaBdRtS6BF8ZZFJdCa6+i1XbdTqdrLtyDh+Rrr+mNlr6ofzELZEtjDbFg9uNwnNbB/P4UvhyKaSD/UZhz8LCkd6IQKAE89w4ELG1MBkwmgzHs8vjjw1S3HUggS3nHjyZXjFBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a0KSbExV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BnZlZyhN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a0KSbExV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BnZlZyhN"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 675BviFl3131769
	for <devicetree@vger.kernel.org>; Wed, 5 Aug 2026 13:16:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	S5PD355OhZIEocJcFj+xdm1rv7mreAZ7LtNr5C3z80E=; b=a0KSbExVtEUhh16q
	GT3IViHBt5wdStuL5u2Q9f7VysY5hQA1HAXTOIKoVlDind3/KIA2VeFpZCvmptH/
	PEfp6dFhR01VfkokdCiqNYVlleBPt0kkC10Xn0GV1WA5RwG4eZIvH3gjqkuSFOUm
	QPe08jZONHJrm/wLASA0hdiL4UOavAkofJxWWi9OkeqWSZPt63V2hxHms1shZD+Z
	5XQT8nvyFxQDgBmtkHR38Fx+PP5g/OkQ1+C+PiQUeoWalHiXDk57QtUOHsz2bmsP
	UC/3ObqOFZhiJ+N3FZLXgeuDcpESQlD8RHDVHAgUXSB/V4+UYcbldfP+QIj3oaox
	fCSCGg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fum3qcs63-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 05 Aug 2026 13:16:01 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cd01a14e81so14262235ad.1
        for <devicetree@vger.kernel.org>; Wed, 05 Aug 2026 06:16:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785935761; x=1786540561; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S5PD355OhZIEocJcFj+xdm1rv7mreAZ7LtNr5C3z80E=;
        b=BnZlZyhN3JAuPQms1MBF52VL2LJ/Qz8ZSvhwXU1pxdiJfwuLNurmWzFh7wbdEZdpRc
         z2ztmZKST0nlnfWe7KKnfS+QM+hEyWu5i0Yuej7YzcXq04I/ZP4TklB89a8LNEAieFUl
         gq8A7xFkw/1deDyXkc7NNJNcquwQf7shU9roFvSQlaiFgteSpZsLZsFJ7vBSD1QphT7E
         /p8PlioQb629Zi6I5EKQzEJXQZb+xxuwFKxGHC4jib0s3Ri4vU9Lqp6qmS4Ke1BavLkv
         an8nUgilzwDjcawqQwuXKcUHqislqL1DE0xb86tBhVXuZPGC2lds97Qyp1YqxpoXThYc
         m5CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785935761; x=1786540561;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S5PD355OhZIEocJcFj+xdm1rv7mreAZ7LtNr5C3z80E=;
        b=lNSL6jVa0bNWsLGkwwq00IiKmzL6uEDfatkfDC2QtCYK9Xt5kKQpLkt7g8QGojnY9d
         njMIpxTF4f4fFUBVBM1Mxa2Par8imza39aFN0opOx4DvZvD84gakj85+1kRrbHv3OsWO
         g2QUNEPbyFU+gh+0hlplZakF9AYl6eurdFIqogtSkeDwc3cIXQ0Yc0klkhG3rJPSxI17
         XMcTyxyUDLMmu3dHBsWtMCkZIit+CNH9IM95qbvWaf2xYrF4P8wNmCsoq6ipkQvAuTXe
         qqL1BtphNmc9Yxu5+jxagmxkYZKornc3TcHVObXNLkM6P8hhj6I5RpF9SoG5isN/xlfg
         ZE5w==
X-Forwarded-Encrypted: i=1; AHgh+RpAX4UBM+KOy+c7dMM7kNjj2c/ooMP86ni0F9Z3lumu+aSJT4e4sYJOcseJ6yu7gLAfr8efqrUTqvMF@vger.kernel.org
X-Gm-Message-State: AOJu0YzNjuPqRFJlJKWy0a2Hd1lt6AxanP4QqeQrkiaBUD2rQ9iDu3u1
	BO8Fp5h1LOgUMRUKbdbjfhMrnNtm1PHXMoStWpUe+ThvIOEMXK3fUiKnoBstjLQvUru8CBnCpHJ
	6iXhhUdiu0zCxxOvJQTG5KCaBGCUjzPoyS1Rjr2x5XKkWQLCdowWGsPJ+eI5UN3UmqQQ0CNSl
X-Gm-Gg: AR+sD12MxVSPiyoXZ2ARXdQNXrtuNQ4SjUyihrE/W2UA2pMTB6Jv+FC9iDZmEoJjda6
	nFnA4J2Vh/ioZuCYoXhSpP7Sbpm8DUY+6jzIiVfRHiRoRbU8XPGECtQ895yyrL523wl7dxBfH1h
	TwQ7XDTiO8Du9wzFDr0lXqGtyHfU9P7oxRgI0786tc65yYhOeG+mAoBkCN0OLCZGKk6+8KXfCvp
	QipW7mCTTlzqH2e+KQNKcu8J7p3yUN7mErvD7QssbH9sR0aR7hSpVHKns/9DtFpjzD4RULZAHU/
	mz32cucyTs7YFrB7h/JN8VujdMruQvDfCtv/wNBFUurAVF3G1bZcoKGLiihzdk+scuDjKmnkU5u
	+cz0IYV/pcxtRb650QWCNRJA=
X-Received: by 2002:a17:902:ea01:b0:2d0:8b28:517c with SMTP id d9443c01a7336-2d0ca712ed0mr69851325ad.3.1785935760706;
        Wed, 05 Aug 2026 06:16:00 -0700 (PDT)
X-Received: by 2002:a17:902:ea01:b0:2d0:8b28:517c with SMTP id d9443c01a7336-2d0ca712ed0mr69850635ad.3.1785935760206;
        Wed, 05 Aug 2026 06:16:00 -0700 (PDT)
Received: from [192.168.1.6] ([171.76.80.242])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d0a9f9362esm17387865ad.12.2026.08.05.06.15.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Aug 2026 06:15:59 -0700 (PDT)
Message-ID: <6b59bf0d-c98c-4004-a117-7f5dde20d625@oss.qualcomm.com>
Date: Wed, 5 Aug 2026 18:45:56 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/8] platform: arm64: qcom-hamoa-ec: Add fan RPM query and
 LUT calibration
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
References: <20260728-ec_add_more_commands-v1-0-771abd65ee1a@oss.qualcomm.com>
 <20260728-ec_add_more_commands-v1-4-771abd65ee1a@oss.qualcomm.com>
 <20260728181543.AB3131F000E9@smtp.kernel.org>
Content-Language: en-US
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
In-Reply-To: <20260728181543.AB3131F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA1MDEwNiBTYWx0ZWRfXxjubqCbZFR9X
 uzS6YCKWdKzzciS9oBk6wMbc7urL0F5WmkuFkLIm8cJDkjc9lvgfwMOL86a2VzchEe44NQqH/Pl
 Dr1Pmf+hDHguowYOsJSrsdQyO4b5aVckCpIPMJ2wQReUo4dW51T0JLmzwcpBJ4+PXrrzstqOH32
 ADW8aj9SjqRc4PmnNxa3anN7Ek2yYzQIRxH4TwFN5/P2+VXM8UPe3Lj+5cb4MIPAQDxItqyDCfk
 8eJoxQgX16bNeCYW65djt8qATI6TSPnYYjMbw4HwHDHAgx3FpHt+Y9g16Iddas4A+lipxTtgCdr
 DXfXm9A3r2SNh3XHQPgvPo+N3PE6XvDcsJlCRU7L92m8Fxce6ibotTG5yUJKmWeWSwWWUuOj1R7
 OvWnzXUpt+uGw78JeYdtGtJnlGobHCAQUrXndo7TEPfrCPczFQIO2LWHbSwQdyl8rLXkZNvv4qL
 ofPoPZR0QbY5al+WhDw==
X-Proofpoint-GUID: hgdB6FkDGjOzCWjI-acR16QlBEKNICut
X-Authority-Analysis: v=2.4 cv=LsiiDHdc c=1 sm=1 tr=0 ts=6a733791 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=UcsMPGGDBby+oECK+wqMZw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=MTEsSbWAnu0fgz7AP8kA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: hgdB6FkDGjOzCWjI-acR16QlBEKNICut
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA1MDEwNiBTYWx0ZWRfX7UtPB0A45FbM
 Ay73d40DEGF8XBd+nLkErBjDtSshTBRoyX1vogkxmXJBRrhcQEUdR4MbaufFe+oJq6wmSmUjIDc
 vKHgX/VEPwLlgJad0s/Zak0Owk+MkSI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_04,2026-08-04_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608050106



On 7/28/2026 11:45 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] Race condition between suspend/remove paths and `fan_calib_work_fn` can cause a 10 to 20-second hang.
> - [High] `psy_work` can be queued and executed while the device is in suspend, leading to I2C transfer failures.
> --
> 
> --- Patch [4]: [PATCH 4/8] platform: arm64: qcom-hamoa-ec: Add fan RPM query and LUT calibration ---
> commit e49733d2c63b28585a159eb3f465f9613c0aec7d
> Author: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
> 
> platform: arm64: qcom-hamoa-ec: Add fan RPM query and LUT calibration
> 
> This commit adds EC command definitions and handler functions for querying
> fan RPM and programming per-fan LUTs mapping SoC temperature to target RPM.
> It implements a runtime calibration work item to determine the maximum RPM,
> and programs the LUT once calibration finishes and upon power-supply changes.
> 
>> diff --git a/drivers/platform/arm64/qcom-hamoa-ec.c b/drivers/platform/arm64/qcom-hamoa-ec.c
>> index f6ff77d4e8f69..d0c45d9970eee 100644
>> --- a/drivers/platform/arm64/qcom-hamoa-ec.c
>> +++ b/drivers/platform/arm64/qcom-hamoa-ec.c
> [ ... ]
>> @@ -665,6 +1097,49 @@ static void qcom_ec_soc_tj_work_fn(struct work_struct *work)
>>  	queue_delayed_work(system_percpu_wq, &ec->soc_tj_work, EC_SOC_TJ_TEMP_POLL_JIFFIES);
>>  }
>>  
>> +static void qcom_ec_fan_calib_work_fn(struct work_struct *work)
>> +{
>> +	struct qcom_ec *ec = container_of(work, struct qcom_ec, fan_calib_work);
>> +	struct device *dev = &ec->client->dev;
>> +	int i, ret;
>> +
>> +	reinit_completion(&ec->calib_abort);
> 
> [Severity: High]
> Can this race with the suspend or remove paths and cause a long delay?
> 
> If qcom_ec_fan_calib_work_fn() begins executing concurrently with
> qcom_ec_suspend() or qcom_ec_remove(), the suspend/remove thread calls
> complete_all(&ec->calib_abort) to signal the worker to abort.
> 
> However, if the worker executes reinit_completion() immediately after the
> suspend thread's complete_all(), the abort signal is erased. The suspend
> thread then blocks in cancel_work_sync(), waiting for the worker to finish,
> and the worker will block in wait_for_completion_interruptible_timeout()
> for the full timeout per fan (up to 10-20 seconds total).
>

I'll guard against this, probably by checking completion state before
reinit or using a separate abort flag instead of relying on
reinit_completion() alone.

>> +
>> +	mutex_lock(&ec->io_lock);
>> +	ec->calibrating = true;
>> +	mutex_unlock(&ec->io_lock);
>> +
> [ ... ]
>> @@ -690,7 +1169,16 @@ static int qcom_ec_suspend(struct device *dev)
>>  	struct qcom_ec *ec = i2c_get_clientdata(client);
>>  	int ret;
>>  
>> -	disable_delayed_work_sync(&ec->soc_tj_work);
>> +	if (ec->lut_cfg && ec->thermal_cap.fan_cnt) {
>> +		complete_all(&ec->calib_abort);
>> +		cancel_work_sync(&ec->fan_calib_work);
>> +	}
>> +
>> +	if (ec->lut_cfg)
>> +		cancel_work_sync(&ec->psy_work);
> 
> [Severity: High]
> Does this allow psy_work to be re-queued and executed during suspend?
> 
> While cancel_work_sync() stops currently pending work, the system-wide
> power supply notifier qcom_ec_psy_notifier() is not unregistered during
> suspend. 
> 
> If a power supply event occurs during the suspend process after
> cancel_work_sync() has run, the notifier can immediately queue psy_work
> back to the non-freezable system_long_wq.
> 
> This could cause the work to run and attempt I2C transfers while the
> I2C controller is suspended or the EC is in Modern Standby, potentially
> leading to bus lockups or suspend failures.
>

I'll switch that to disable_work_sync() so the notifier can't requeue it
mid-suspend.

>> +
>> +	if (ec->lut_cfg && ec->lut_cfg->send_soc_tj)
>> +		disable_delayed_work_sync(&ec->soc_tj_work);
>>  
>>  	mutex_lock(&ec->io_lock);
>>  	ret = i2c_smbus_write_byte_data(client, EC_MODERN_STANDBY_CMD,
> 

-- 
Best Regards,
Anvesh

