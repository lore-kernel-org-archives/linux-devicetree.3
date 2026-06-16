Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62B07428837
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 10:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781604622; cv=none; b=Yyhm1573tmc4BSsnvyP+TpGh4SUCUbg4BhNvAWzh1AiDKtMEr7IPFakBR/+GyHQAz5qehT27bCi/Gnywx84hwx4Sk0jXEN9lsrxLH2/mqkqp3ms2sX121QuHuaNp3Qj369tU3pNRKzK/+hMO4PVU0tTScezKmuzl9mVr8M3TIXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781604622; c=relaxed/simple;
	bh=ufIc8ZHUf4Xrb8lSB6Ws/u1L1tyTF4Z3lOrI6M1Jtms=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GtoLs5qxzSXaa75Qo0Na6VNGhyUj+eJvNBv287z9AxAECZVIAAHXNSzLx1mZsWUIJzVTf5RgGep8Mm4cQ6094mNOIPjK46HcTkSF1qGiW8Zlfetvna/h+rhDOqG/8WkFlLpgLOgfpcRHR5NhpVGT2RN+FsAsbqbHSUzpooueG9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JL1y8v5o; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Vq2eDI14; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JL1y8v5o";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Vq2eDI14"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65G6fXI82901582
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 10:10:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	isNgOMfZ65NTVt8FlgRDQNF31fC0tCGiPVqqs5w87EQ=; b=JL1y8v5owgkaqKiz
	ua7YLb0l2jDRlQvR7Ja1JNmeM/T0wY+NcJPxcnJEGNV4QNbgCkraByEoOXDqo2JQ
	QA/9k7+VOVJFCl1N+0bBh1d9ruTH7ZcAlYV7ngB6dbhX6kwiF5xIK+iPQZSzU/nK
	2wawpfw2r8ah5rSQpEJDWmKxQUMAflPG6XWluusV4xYyU2KMsRyOkXQ7alkqulys
	mejl/YSXN4D5LLONspAosjS+WC/gBwB9hfYZJkyacTYFDNpQ1mAEkeyIhXkt/ea5
	+Mr4VeRyMFWq6M5FPGFAi0MfhJIGx+9/e+INzScVMpbMGtbil53xJ9Eskfcevb4K
	klNjkQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eu1ep8ue5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 10:10:20 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51759082206so12043991cf.3
        for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 03:10:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781604620; x=1782209420; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=isNgOMfZ65NTVt8FlgRDQNF31fC0tCGiPVqqs5w87EQ=;
        b=Vq2eDI14NYwA3fmO/itATCMrXO5YG2dbUw5F05WYEApbyHbC+vi2ky7g8tC9RLpAsE
         +Datp3hbSe5o9xJaB810UekTqa0WZulDCzEME9LA6bOCUq5a34MyNfINwlyXUZJPATuC
         oCto4ZuECrCq6st0Mp8vOgys2om7WzU35npJZ+LvrFd+KxY3ZMOI1y+0famjEV51qDRX
         V65e4CfQvLQLInOW/VMxMuBCNhcpmKOblmjRh1RVVQdPgZmxFPxmhi+4F/UQsjiY44ZF
         HX3z5rjRza8/yHfexCffmj3Gd6Nhkml6mj890iMJLOWFqggeJkdgY4UxdwyzvqEHzDwJ
         Co1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781604620; x=1782209420;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=isNgOMfZ65NTVt8FlgRDQNF31fC0tCGiPVqqs5w87EQ=;
        b=PtsP8yqiLjaBctMEL+73KXw0UM2Qj1rPCApqcHhwxz0w0rVg1jOf9zQ3bPIvt4/TZm
         WoK4aWcLyo9dt9PRcm7lG17EBgVw2X3aKFEHvC7aUXTFvH2NnIJZybS+63v7Qya+9ckH
         /+ewEbTiwrvQ9EGa9YlfCkFNHD9DQx6nmd8nEsEsMV8pccy1k7hrtemYNf/mmXW9D8qZ
         5mmxXx7Hls3H9G0YAeL65RDnZML7PEXtxidQp7B1tn7rkQfdb+cDmKzFX67lIDIGFCiL
         xxMIzCCcTDiBCT5G9q43e1e014z84qldCV7v7/2oHRxgofclGESPq9/1tEZp9+BpFNFD
         0XHQ==
X-Forwarded-Encrypted: i=1; AFNElJ9q4rvkL5KzujyLU8EzPPHQvY2wvxGtndRHb3LpkwxYBKPPMBRITBgmP1j3Z6Rm1sHfBYegPbmZZ3LN@vger.kernel.org
X-Gm-Message-State: AOJu0YyMSH/8bIDjp5lLqVbZsuh8mKnhgkVhKFtEb3OWG/r+rRqBiZ1i
	pjfc8Cey4o15CJqKwfMZekKKJfJI/kF8t4/F+MPpsmqlNqE1ysjdjZsqR64QPUH4HadKTfQJ5sP
	zd/leWpRGncT9sl7IsSSTpbcqGa3IDFNu3F+1K4chhhIETjmYlX57VwGZOppvRjBg
X-Gm-Gg: Acq92OHCo29FuMHcjXS5hwczUnMN7AuntiTqj83Ud/5DiybwfAMfelBTfDQz5/uL041
	np87qH/ZFsVKh3BMYFPdE1IUMNwlcTTA0sX6fPAP922TPM/B9w8XDhNe1KCQ45ENia8+q0ylmV4
	dcRS+vPBAZ/F3cOnzMkX/0SCBigqyUbZ+fkzj7FdIp72trAetfavOhfsv1TmXkHIqB12YxGb1Je
	Fc7vep7K+OaHXpyd1z5tzZYhX0AgCtLIp2VzOvBcemFDqitQ7UDEt1TL//SF5bUlEdg+fen+SjD
	LL4WYvmwaxsdM6YgfPzaquNGpCU9ozptITTYjJYF+sG9VKTjplekQS0JxDGyUds6Gnxnj5JMUW+
	xXpKGl+nxPuT6a/e6UshWmyc2lX3vZ3it79722wE9bgCOjg==
X-Received: by 2002:a05:620a:8011:b0:91c:9d38:30ac with SMTP id af79cd13be357-91c9d3836a4mr141779185a.4.1781604619594;
        Tue, 16 Jun 2026 03:10:19 -0700 (PDT)
X-Received: by 2002:a05:620a:8011:b0:91c:9d38:30ac with SMTP id af79cd13be357-91c9d3836a4mr141775985a.4.1781604619074;
        Tue, 16 Jun 2026 03:10:19 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0463a2d1f4sm100157166b.51.2026.06.16.03.10.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jun 2026 03:10:15 -0700 (PDT)
Message-ID: <7478c540-a5fc-4238-bba0-5b04547f57c7@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 12:10:12 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] thermal: qcom: Add support for Qualcomm MBG thermal
 monitoring
To: Sachin Gupta <sachin.gupta@oss.qualcomm.com>, Lee Jones <lee@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
References: <20260601-spmi-mbg-driver-v1-0-b4892b55a17f@oss.qualcomm.com>
 <20260601-spmi-mbg-driver-v1-2-b4892b55a17f@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260601-spmi-mbg-driver-v1-2-b4892b55a17f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=I/ZVgtgg c=1 sm=1 tr=0 ts=6a31210c cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=MUhxgwD4z-eir1BWSc8A:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDEwMSBTYWx0ZWRfX4Fpw0LagkzIj
 kiXu5bkV6oUppXygqJWdaclpnCvJH3M/1aKGqzYD9VuqoLrUmNszuw8lzB89PYFfrocTinCGfdj
 41iUEiC28vDLCKXUSyaP9kFxxB89/AA=
X-Proofpoint-ORIG-GUID: Q-1rd1x-wKH2_q1loKfVnxuIjb_lH4bX
X-Proofpoint-GUID: Q-1rd1x-wKH2_q1loKfVnxuIjb_lH4bX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDEwMSBTYWx0ZWRfX737JFihFHjec
 m5jlh0WCldb2puwljx+e/JUj+yyh/yVOV0eYhZDATufGgIpkzH52aCL67NzWX54gOPJzovhMNKC
 9jIPC0nt4RWL6IO5eJeQES4jAr8QYE1Hh66FsnKfWRq/uB8JQxndOHGr0XUkIpRc9eUrTv/BIp1
 Cys27U/i1o+OK/U5Gnc395qDuRR511Y3Kjpo0OIZ3tKoJDARMF0KqfvUS+Kyqf6tLKeXFI/3tlL
 k89m50LwQlTUWGIrxR0o1XcRhsIfac70TtsJlqiddQhvAK0wvqVWuYYSFiH6B7ssEe3ONd1F2TQ
 DbB7Flz/OqaMjwO/antAuKSuqZnjPZP6n9k48hWxZJq6DIfV5GUUPtJw7aQyWOk22d8rgB3/owj
 LqSJWFxGL6nswW0Hy2GGpsiBgBGdm2ukKoGIWQGOroUOuporXrmcQ7G/rU1HgyNpJKnwWLYflYV
 EVKsLLU9KICrCEcq6WQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_02,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0 adultscore=0
 malwarescore=0 spamscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160101

On 6/1/26 1:01 PM, Sachin Gupta wrote:
> From: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
> 
> Add driver for the Qualcomm MBG thermal monitoring device. It monitors
> the die temperature, and when there is a level 1 upper threshold
> violation, it receives an interrupt over spmi. The driver reads
> the fault status register and notifies thermal accordingly.
> 
> Signed-off-by: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
> Co-developed-by: Sachin Gupta <sachin.gupta@oss.qualcomm.com>
> Signed-off-by: Sachin Gupta <sachin.gupta@oss.qualcomm.com>
> ---

[...]

> +static const struct mbg_map_table map_table[] = {
> +	/* minT	vtemp0	tc */

The struct is defined 2 lines above, the reader can tell the names
of the fields
> +	{ -60000, 4337, 1967 },
> +	{ -40000, 4731, 1964 },
> +	{ -20000, 5124, 1957 },
> +	{ 0,      5515, 1949 },
> +	{ 20000,  5905, 1940 },
> +	{ 40000,  6293, 1930 },
> +	{ 60000,  6679, 1921 },
> +	{ 80000,  7064, 1910 },
> +	{ 100000, 7446, 1896 },
> +	{ 120000, 7825, 1878 },
> +	{ 140000, 8201, 1859 },
> +};

Please add a comment stating this map is not PMIC-specific

[...]

> +	/* The HW has a limitation that the trip set must be above 25C */
> +	if (temp > MBG_MIN_TRIP_TEMP && temp < MBG_MAX_SUPPORTED_TEMP) {
> +		ret = regmap_set_bits(chip->map, chip->base + MBG_TEMP_MON2_MISC_CFG,
> +				      MON2_UP_THRESH_EN);
> +		if (ret < 0)
> +			return ret;
> +
> +		ret = regmap_write(chip->map, chip->base + MON2_LVL1_UP_THRESH,
> +				   temp_to_vtemp_mv(temp));
> +		if (ret < 0)
> +			return ret;
> +	} else {
> +		dev_dbg(chip->dev, "Set trip b/w 25C and 160C\n");

Should this be an error print, returning an error condition?

> +		ret = regmap_clear_bits(chip->map, chip->base + MBG_TEMP_MON2_MISC_CFG,
> +					MON2_UP_THRESH_EN);
> +		return ret;
> +	}
> +
> +	/*
> +	 * Configure the last_temp one degree higher, to ensure the
> +	 * violated temp is returned to thermal framework when it reads
> +	 * temperature for the first time after the violation happens.
> +	 * This is needed to account for the inaccuracy in the conversion
> +	 * formula used which leads to the thermal framework setting back
> +	 * the same thresholds in case the temperature it reads does not
> +	 * show violation.
> +	 */
> +	chip->last_temp = temp + MBG_TEMP_CONSTANT;

Will this work fine if the user tries to set the max temp supported
by the hardware (i.e. is there headroom for max+1)?

> +
> +	return ret;
> +}
> +
> +static const struct thermal_zone_device_ops mbg_tm_ops = {
> +	.get_temp = mbg_tm_get_temp,
> +	.set_trips = mbg_tm_set_trip_temp,
> +};
> +
> +static irqreturn_t mbg_tm_isr(int irq, void *data)
> +{
> +	struct mbg_tm_chip *chip = data;
> +	int ret, val;
> +
> +	scoped_guard(mutex, &chip->lock) {
> +		ret = regmap_read(chip->map, chip->base + MBG_TEMP_MON2_FAULT_STATUS, &val);
> +		if (ret < 0)
> +			return IRQ_HANDLED;
> +	}
> +
> +	if (FIELD_GET(MON_FAULT_STATUS_MASK, val) & MON_FAULT_LVL1_UPR) {
> +		chip->last_thres_crossed = true;
> +		dev_dbg(chip->dev, "Notifying Thermal, fault status=%d\n", val);
> +		thermal_zone_device_update(chip->tz_dev, THERMAL_TRIP_VIOLATED);

Should the assignment and this call also be guarded by the mutex?

Konrad
