Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB3022D060C
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 02:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774578408; cv=none; b=IYE3NARRhTJT4dEGfS8WHfzhTF+bqtVictBH4Wyucl4nAPbv78Kyy2tDfrNMFR8jbS+jhRQRCJZrzmPvgARN9Jja9n+LpXrnujFLcwVH87Ot2w1y2L/6v3WZF2h7pzHr+eFLEcAYYQ7ZaM77ml8MN2s+cdfvdGsnErmQGkKCyxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774578408; c=relaxed/simple;
	bh=gRsfR88L961MVdN0pn3ZB8R3CPNZOcWVnUe2rgHqP2E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GvVH4sMCkfOFyUG6jC3HGaGbBxwx5MpMDha/SoZ0/XGNFivftbJoYtlC+ZPBorEeosPHRYV7JMYmv8Wj+q8afWAeeFIuaO1o2qGMYVu5FFk5u4WChqzL1QIk6bo92A3SJ/FElkarpD/B/yth/oiJRznIUUiLclsEgOP48ZMWqwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ijogxYkh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F0dUz7fj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ijogxYkh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F0dUz7fj"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62QIeUCZ3341199
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 02:26:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mr75J9G/ncvFwrFLFXiIQ+xMfwcAoQbyzeRnxKyVIu4=; b=ijogxYkhf6qwDB5+
	/7dSdUigh31q/DPbluTSlsNhWatnX+ngR7VuOJCykV8ZKzwZU0PRpdw4/bkyFA5d
	Cl30M4iUrEiCiuRXXlL0HAJp9TdHIC71gcKU6n0KKuAUHxs0sytMSQxZR9+wxpop
	wgr3rFZEOunWKbJ5TxQ5wJmIJuc1cR4Fpg0ofjWJfG/l5jpuVWs/23673zJeHzI/
	gEIYGKEkxjovsXeeqPuvQXilzLNm4qAQTEC6yl9b5+4aExUMPStvSdTJvMHHHbKa
	UYCSPJCTxcsaZpg3Fk977KgeMssTx4jjnf7TsQQ/IZ3MuDGnIYqWgi5PAo/P29In
	qlXWmQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5a9q17p4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 02:26:45 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82c70d1f65aso1212827b3a.1
        for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 19:26:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774578405; x=1775183205; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mr75J9G/ncvFwrFLFXiIQ+xMfwcAoQbyzeRnxKyVIu4=;
        b=F0dUz7fjGnmMNUmo/SwMvRXdOgXGAojSy8SOa0mzewbcEcE/58X+7qKg84yJvwwvyz
         A9BC7NdbupvrG1xcT4328mjZUSHLUjjs4DQ3e/u18tbXpeoDwxrW9rReHJz3WRuKXeQS
         VB69hK9Zn761o3gqR8T3Cgmg31ETlewnRIAj+BTSJ3p4WsAXZKAmVGBUhgwXONshwWzP
         7ZzPNPVpaVyhpJDWW4Wx3FGG9CVAjG6apUHOJ/iQe3Ad6HBBvyxGBpEWyYVG0lTuQlqF
         nxyMN6HrEj33E/EsuEZ4KbtHTt0+19pcojDYYQY+l6HOnM9BJaJaUiWiR7Lq/s3cf7cn
         4+GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774578405; x=1775183205;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mr75J9G/ncvFwrFLFXiIQ+xMfwcAoQbyzeRnxKyVIu4=;
        b=tBPHUaKhLhjMnoT3r0nlAedfOFoJeUtRKR1b6MPcp6kM+eDLtdCj0yaaaHFQVSZxB8
         cErd8M+DsV2ZdeaicXAI0xeQMPmt1xxOgvJfRfyLNrxZiiOmfST0bSg53vZfJNCkHTGN
         +gl5QBSd7E1lzUUO/SQsHldITblqF0LWfxiqSpndia5YCc8tAadHDEzZVpvCYa2tbJTF
         cX2vM8q/AkK8sinia47s6KdosvnjAp/BbjnlmTPSKnrzqcSfMWSMU5PUqnckL291PmCh
         kkGxno87XyX3VuE8goUNwiQoq0YPnz0P5KRvd5jrVWk5ma45LYZvFD8m24G8hnjh2cre
         s/rQ==
X-Forwarded-Encrypted: i=1; AJvYcCW1WbKODI/YB93YKiQgx1CxxX32DROFctVkvNEGnIp1myxX7rEbluZhKFG8YoVhr2mMYFvCe1FD255F@vger.kernel.org
X-Gm-Message-State: AOJu0Ywh+xZUaTgyIU7Lj/8m9XWWOJToJPVsXHEfyghxBpGYnjM5qUHU
	yv6rpo5mUDji099i2r9qEsufNOrTn0wyCt1G0tDclUl10jO4YfzkRw8sZApcdhhk6w8TW2cmRlm
	o2df0E15Z3i+EZmSzUAaMyIu4BcX4M+qA2ZSz49d1mNse2PSrLXEEtstReVz/58Yy
X-Gm-Gg: ATEYQzx1YOxucFj/m/DaywSpYhEty8SVWfeQhO2hCGm+GkCHa58OR16+AID93QjlEWk
	UrvXRzmZOvTVzcQJWI4g+0OSl4QfD0T8c7B3JUTNraSCcMLtm5B190RKV7bagjr9F3AEXeDNyI9
	sTJaz0VDjMoW72et0Vbwv/Z+TxTALNbymWsnMFuZXYC13jVXNSAud6Qca/gaiJVQMU5PyraFecz
	afwniJ6cmvqcf4WzRpuQp6Sxe4sY2uAQR0+22ESH0KgjrWkRhEhAw52bv6FTV344oHPzL2IjOH6
	wcFfTlk8w4XesSE0ufIjJDn0G3WE8IWsT2be/Peu5XvI+j30AYHPO0Y7iGbKvXgBimB4t+3cjH/
	ydoJhLVAFN1Q9DgvoXlKiSOZ1tvSUpDWngfIvJdd/g1ojSKL/BIv1xnsKQE7gc7KubA67H9mzHg
	xZ9QBxr37ufA==
X-Received: by 2002:a05:6a00:2282:b0:80a:fc3c:f839 with SMTP id d2e1a72fcca58-82c9607f0a8mr688670b3a.49.1774578405318;
        Thu, 26 Mar 2026 19:26:45 -0700 (PDT)
X-Received: by 2002:a05:6a00:2282:b0:80a:fc3c:f839 with SMTP id d2e1a72fcca58-82c9607f0a8mr688629b3a.49.1774578404805;
        Thu, 26 Mar 2026 19:26:44 -0700 (PDT)
Received: from [10.133.33.33] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82c7d1e6a15sm4696446b3a.1.2026.03.26.19.26.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 19:26:44 -0700 (PDT)
Message-ID: <65611581-97c6-41ae-8b20-42c194c31915@oss.qualcomm.com>
Date: Fri, 27 Mar 2026 10:26:38 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 7/7] qcom-tgu: Add reset node to initialize
To: Songwei Chai <songwei.chai@oss.qualcomm.com>, andersson@kernel.org,
        alexander.shishkin@linux.intel.com, mike.leach@linaro.org,
        konrad.dybcio@oss.qualcomm.com, suzuki.poulose@arm.com,
        james.clark@arm.com, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        devicetree@vger.kernel.org, gregkh@linuxfoundation.org
References: <20260317032639.2393221-1-songwei.chai@oss.qualcomm.com>
 <20260317032639.2393221-8-songwei.chai@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20260317032639.2393221-8-songwei.chai@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: rCPl_16RJOd7Q3t4f_I12_qqC_oWE02W
X-Proofpoint-ORIG-GUID: rCPl_16RJOd7Q3t4f_I12_qqC_oWE02W
X-Authority-Analysis: v=2.4 cv=J4GnLQnS c=1 sm=1 tr=0 ts=69c5eae6 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=BNsjwqSjcop3XK1me6cA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDAxNyBTYWx0ZWRfX/a7sqRcCAIuG
 G0U+sgRB/mpiOfECjqoKVoHcduO5zLRLv9IoC/CWDtfAQAodQ/YQFWxneQFFIs5pet5P1yL3DJP
 AhXPhArMehLsdT8qfYFbzv5ESp4QAY1ZYI6f0S60x7xrsTcPYBP3Ti7SDZ9kLPX15vPkpUpR93M
 fk9a7DmU+UYlTzBpBfrmTVj5p10ZB0PF3I2c18jcTzF7ZXJTfdV/RfJE5BT5CiaVQbMb7EneXra
 5lO37hdZM+IzlBnA9J87XKMJaqrMjvKEiI+pYkQVcrnJcWEtCY7LbNVs+rH3f5LbpOwF3NbktOI
 lxYnW2O6hRBnwgkgduXUN43pt7+0vZQ8ppGvKWbmV6w8PgeZO4DUsv5XOOYfaH9aWCzUpTXJ6Tz
 4YIO9/pUO2CzGZmOvPWWyhpwaPzk0X2ye/NHmFegUPl8XCxGenOfP+dGk1M0JvI0gNmbhA1Zofm
 mHxfl+052aoQaIVN12w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 phishscore=0 impostorscore=0 bulkscore=0
 suspectscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603270017



On 3/17/2026 11:26 AM, Songwei Chai wrote:
> Add reset node to initialize the value of
> priority/condition_decode/condition_select/timer/counter nodes.
> 
> Signed-off-by: Songwei Chai <songwei.chai@oss.qualcomm.com>
> ---
>   .../ABI/testing/sysfs-bus-amba-devices-tgu    |  7 ++
>   drivers/hwtracing/qcom/tgu.c                  | 77 +++++++++++++++++++
>   2 files changed, 84 insertions(+)
> 
> diff --git a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
> index 5370882333bc..1dcb8fb71cd9 100644
> --- a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
> +++ b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
> @@ -42,3 +42,10 @@ KernelVersion	7.1
>   Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
>   Description:
>   		(RW) Set/Get the counter value with specific step for TGU.
> +
> +What:		/sys/bus/amba/devices/<tgu-name>/reset_tgu
> +Date:		March 2026
> +KernelVersion	7.1
> +Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
> +Description:
> +		(Write) Write 1 to reset the dataset for TGU.
> diff --git a/drivers/hwtracing/qcom/tgu.c b/drivers/hwtracing/qcom/tgu.c
> index 4539415571f6..e28e6d27cf56 100644
> --- a/drivers/hwtracing/qcom/tgu.c
> +++ b/drivers/hwtracing/qcom/tgu.c
> @@ -410,8 +410,85 @@ static ssize_t enable_tgu_store(struct device *dev,
>   }
>   static DEVICE_ATTR_RW(enable_tgu);
>   
> +/* reset_tgu_store - Reset Trace and Gating Unit (TGU) configuration. */
> +static ssize_t reset_tgu_store(struct device *dev,
> +			       struct device_attribute *attr, const char *buf,
> +			       size_t size)
> +{
> +	struct tgu_drvdata *drvdata = dev_get_drvdata(dev);
> +	struct value_table *vt = drvdata->value_table;
> +	u32 *cond_decode = drvdata->value_table->condition_decode;
> +	bool need_pm_put = false;
> +	unsigned long value;
> +	int i, j, ret;
> +
> +	if (kstrtoul(buf, 0, &value) || value != 1)
> +		return -EINVAL;
> +
> +	spin_lock(&drvdata->lock);
> +	if (!drvdata->enabled) {
> +		spin_unlock(&drvdata->lock);
> +		ret = pm_runtime_resume_and_get(drvdata->dev);
> +		if (ret)
> +			return ret;
> +		need_pm_put = true;
> +		spin_lock(&drvdata->lock);
> +	}
> +
> +	tgu_do_disable(drvdata);

need_pm_put flag is not set when reset a enabled device. I think we also 
need do pm_runtime_put after we did tgu_do_disable for an enabled device 
because we have pm_runtime_resume_and_get while enabling it.

Thanks,
Jie

> +
> +	if (vt->priority) {
> +		size_t size = MAX_PRIORITY * drvdata->num_step *
> +				drvdata->num_reg * sizeof(unsigned int);
> +		memset(vt->priority, 0, size);
> +	}
> +
> +	if (vt->condition_decode) {
> +		size_t size = drvdata->num_condition_decode *
> +			      drvdata->num_step * sizeof(unsigned int);
> +		memset(vt->condition_decode, 0, size);
> +	}
> +
> +	/* Initialize all condition registers to NOT(value=0x1000000) */
> +	for (i = 0; i < drvdata->num_step; i++) {
> +		for (j = 0; j < drvdata->num_condition_decode; j++) {
> +			cond_decode[calculate_array_location(drvdata, i,
> +			TGU_CONDITION_DECODE, j)] = 0x1000000;
> +		}
> +	}
> +
> +	if (vt->condition_select) {
> +		size_t size = drvdata->num_condition_select *
> +			      drvdata->num_step * sizeof(unsigned int);
> +		memset(vt->condition_select, 0, size);
> +	}
> +
> +	if (vt->timer) {
> +		size_t size = (drvdata->num_step) * (drvdata->num_timer) *
> +				sizeof(unsigned int);
> +		memset(vt->timer, 0, size);
> +	}
> +
> +	if (vt->counter) {
> +		size_t size = (drvdata->num_step) * (drvdata->num_counter) *
> +			      sizeof(unsigned int);
> +		memset(vt->counter, 0, size);
> +	}
> +
> +	spin_unlock(&drvdata->lock);
> +
> +	dev_dbg(dev, "Qualcomm-TGU reset complete\n");
> +
> +	if (need_pm_put)
> +		pm_runtime_put(drvdata->dev);
> +
> +	return size;
> +}
> +static DEVICE_ATTR_WO(reset_tgu);
> +
>   static struct attribute *tgu_common_attrs[] = {
>   	&dev_attr_enable_tgu.attr,
> +	&dev_attr_reset_tgu.attr,
>   	NULL,
>   };
>   

