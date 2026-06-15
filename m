Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06F033A3E98
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 05:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781501760; cv=none; b=LuVmdKYmUXnZ5vuTGsuGlhs69RRaCOnCdfwNyy+sS8+Qiokl3r61/+4kHLESFMiYUxzTJgQijzAXAGOb7rwUhKVEo3shC9k9c+l+e5kJ+aOGM66kCygcBFGg/kLgswMrwPaKRgxQeywE2AeNHIkXiiWE330hiRKY/7iPZZTzYV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781501760; c=relaxed/simple;
	bh=dqTxwBE0ndeNI4p89sERCO/AVO4VgpAF218vctzv1Ow=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FsKhEJHefIas6entRsVpKaYvAFAlke5KAsnRDx6ZUKrt8sr6hvqGyIjjtkjYtchcvI0aAjQdtLmadIBxa3VBlLVGYHNuWYQ2zIJQXXo+aUaNvuVOSKJSwsR8nP1Bbz9z31pUrnjgowf5AZnYjZg93J4qvExcPQB5wsSQ9PfjY9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Pyo97Pf2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A4/BoHRx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Pyo97Pf2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A4/BoHRx"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65F1kcm53108347
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 05:35:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Al+gKbBHNdbBsiWp1MXXGDUpeRROLny1uWI20QOnrqU=; b=Pyo97Pf226S1bWrY
	MM0AyKyAHjACgId2pBb3v5nowUWCN5KuA93A+PS/yobgF0ZkeDYJIQosiI+hIztr
	fzoUWlCbyi4u8etKj3HqvJvR35K7DZa3+MHmkEXkbZ4SrluOIQkLblNkSwRHhfxq
	TNt8CTKp6K+lFehHpSgvDutwL/j+Vo1wDRhMKGk8Gok3SXdgcNoBKat7VYeBY74F
	/RhZXVc9RFCe7J331l7yxBWMVRpMlKHaXNu8f6r5i8dUf1/dveBVPoLST/TuGGv7
	FH7+qwmZbWTD0QAigXAAigfZFaq4UUjc+no4yTG4YzuzN7sU5OcecevlB+0hDjP7
	epbpFw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ery955n8f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 05:35:55 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-36d8719bae6so2675507a91.3
        for <devicetree@vger.kernel.org>; Sun, 14 Jun 2026 22:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781501755; x=1782106555; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Al+gKbBHNdbBsiWp1MXXGDUpeRROLny1uWI20QOnrqU=;
        b=A4/BoHRx+TOa4oL/A6awisIwOWh5Fy6YTWJPvPLIvaHMPYdQx+4s+fofHANOARhaEZ
         QsyEG3/Aii4+JSLPIELI4b0Hsp2V0HwZfwRFFmcqlgjEGoX3ByRpahX8PKWg4yOsLy6I
         AClIuIN3dyexcBSmF1huVY8xmlvJ8BJuO4C+szMNFhMQob+sxINT5ntnlB/179ycIMDY
         4ywAhoRs8hkw+U6ZWr1tZjOA3FRibPURkaor0YZqNBcUu+49mwqr9NWNzKPLPMfC6Eb2
         QKZ75TKEXA4LDmlcfFKv2n8YO1jKiaD8D44hszLxIAY+a1VB0CN98TNn1JYFq7QApXkY
         Ff6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781501755; x=1782106555;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Al+gKbBHNdbBsiWp1MXXGDUpeRROLny1uWI20QOnrqU=;
        b=AfGzehauf/LIoUfLZCB1AYjfK4Pec/M05kndPniHQa9vFEVb+oU0lQMYU4zLI71CrS
         ZhKUqJHTV0NYpsxjh+v7nYM5AjiX57a4XsPTBdO67BMU0RLl9uy/tKhadVXXFRX/YYP0
         FjqL/5Vl5i6UeRtZUHzvh+3NTC2q/vJJ6NN3SSA0A3sGQ73HxhL8yIvSkkWKEY29FKN0
         GqGzyWTX+4CD+HbMasRWJ9go+dIycY9cU6bK6EhXvf+QDfsFyp7QhhWzSyVdlmixmKi2
         baURZPuvisHSJ8e4xId7Zjn5xA8cv3hNP1nKaCnMkf20kIBvfd6qZv8HExWqZ1YTzFaT
         9ggQ==
X-Forwarded-Encrypted: i=1; AFNElJ8W8Tmqc7aiOxTiVXHYyBT5yWqGgXclQdVwhfwC1GuFmb9s+ktmK1jnWfXDzoy5oQFOdLPikIbFLebp@vger.kernel.org
X-Gm-Message-State: AOJu0YzN9pJFq/CuDmiGuL6wuU+qhy5+FKcajwa8yqTisZMDJ6uEXZ5A
	Yqy70FuG7unUjCPgdWvvy43e2U+SQ76H+xxYg5WkwNlyvI3/jJXcQL498NNQDMVUVpyJhfiFqLC
	B2BRgoLrivGi+h8V+g/4E+jmktaaec0nsoLXD+DAJx1ZC1z28K8Mj0xFxEzgxRu6n
X-Gm-Gg: Acq92OFf1xHe+eXaQGAZskTMu5tKiNEtXLa3wPLSAId47w/sn/pp2KcMt5HlO3Cp89x
	ff8q3fLYyFkG/wx5QWTyPHU4Q/GceK7odcgWwAvqZtjy+RMntT72tyZZAdE5MM9bPGfmkJgqU+1
	N1vfYzgpBNr/E5cvJb1UiT/rxD7LPJdcAi/wNBe8aNLP35vXzWv8aRhJ2y4iuCQip8xbm0DIP3z
	1N9yS50Dn/GW1o4RMWrtJdq4biWOOb2mN1dF4vx+DS+Kq1h8V9hxXExTTdMPdeplRGnNbOFVlW6
	fITnKt6Ul+net2qfQ3f1ZPpSTENb3S0st4pWh3HCEsEmSia+nfDKLo0HXTb5KQo/mou27DER5YV
	Oy8dehwKn9bar0YyvVcR6D1cQFDnPdjslzGMDGADPi2+UjXvv3Ro=
X-Received: by 2002:a17:90b:53cb:b0:36d:8e49:d8 with SMTP id 98e67ed59e1d1-37c2bcefb0amr8644756a91.15.1781501754618;
        Sun, 14 Jun 2026 22:35:54 -0700 (PDT)
X-Received: by 2002:a17:90b:53cb:b0:36d:8e49:d8 with SMTP id 98e67ed59e1d1-37c2bcefb0amr8644729a91.15.1781501754124;
        Sun, 14 Jun 2026 22:35:54 -0700 (PDT)
Received: from [10.217.198.242] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37a1f07bbfdsm11133492a91.5.2026.06.14.22.35.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 14 Jun 2026 22:35:53 -0700 (PDT)
Message-ID: <39bc7472-a643-40bf-bbfb-241433dd71d6@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 11:05:48 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/8] irqchip/qcom-pdc: Configure PDC to pass through
 mode
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Linus Walleij <linusw@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org, Sneh Mankad <sneh.mankad@oss.qualcomm.com>
References: <20260526-hamoa_pdc-v2-0-f6857af1ce91@oss.qualcomm.com>
 <20260526-hamoa_pdc-v2-5-f6857af1ce91@oss.qualcomm.com>
 <ahWQmTr-9a33b9FY@linaro.org>
Content-Language: en-US
From: "Maulik Shah (mkshah)" <maulik.shah@oss.qualcomm.com>
In-Reply-To: <ahWQmTr-9a33b9FY@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: -fS_45cEteSLLVnikyF_TIKl8mu7lOqY
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDA1NiBTYWx0ZWRfX+rJ4mFXfS5ss
 vXHEaUTzbdiL55/4RREZbUu7Mc0OsNdIZhIxds5O5tTZ/h7Pg+9+oKF1fywkc3Pf1xiMsw/4yac
 UaGlznCYVR2KDRz5HP/LTjJQ4JTxkSI=
X-Proofpoint-GUID: -fS_45cEteSLLVnikyF_TIKl8mu7lOqY
X-Authority-Analysis: v=2.4 cv=EbP4hvmC c=1 sm=1 tr=0 ts=6a2f8f3b cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=NEAV23lmAAAA:8 a=F36j7lWHSACE9dnm3LoA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDA1NiBTYWx0ZWRfXwTQhWLINpx97
 6rK0c12W8NbuBGg+rG2y7XjidSo1vUThSfTCMYe+GP2e8k9ObYswM2GwVs05ucHphcQ/GhM8FrD
 A5gIeGUSVKZMhiG77BjZ34b7iMJ76sua42GEHwJORFDOoPQwdTLPL5kBaxGKG1Sy6WbEMdXF07q
 klixJrvVADknCo4MC8BU7Oqkn/XLv5hV/NLOG2nQke92yfOFd+x2MMVphL4FUkf9TchZ1mG/STG
 UZD+VXcEPQWELbuIbHrIFCBCuROF9fb2mW7G+rUKFejOEYTmtjCWvZxoL4D4p5Qsqd4plybMAMz
 iWvJ/3uGCQgulo6w5AO+hUCwpsf1d8I5uAtQm0v2w6q38AU/11LWLgTvLhHnITvssMUSt0XDpDx
 UKfXerLJNvgURsZRcTwSxr+JhyXRJ9zadiIpNwSGo3dAQBEIHhbwpbG+jXMfGiwNnPpmzBsZP4d
 efbNlOgES4GTZwPGpXA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_01,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150056



On 5/26/2026 5:52 PM, Stephan Gerhold wrote:
> On Tue, May 26, 2026 at 04:24:41PM +0530, Maulik Shah wrote:

[...]

>>  static const struct pdc_cfg pdc_cfg_v3_2 = {
>> +	.gpio_irq_sts = GENMASK(5, 5),
>> +	.gpio_irq_mask = GENMASK(4, 4),
> 
> BIT(5) / BIT(4) would be clearer here in my opinion.

GENMASK gives uniformity.

> 
>>  	.irq_enable = GENMASK(3, 3),
>>  	.irq_type = GENMASK(2, 0),
>>  };
>> [...]
>> @@ -184,6 +204,14 @@ static u32 pdc_reg_read(int reg, u32 i)
>>  	return readl_relaxed(pdc->base + reg + i * sizeof(u32));
>>  }
>>  
>> +static inline bool pdc_pin_uses_seconary_mode(int pin_out)
>> +{
>> +	if (pdc->mode == PDC_SECONDARY_MODE && pin_out >= pdc->num_spis)
>> +		return true;
>> +
>> +	return false;
> 
> Can put this in one line:
> 
> 	return pdc->mode == PDC_SECONDARY_MODE && pin_out >= pdc->num_spis;
> 
>> +}

Sure.

>> +

[...]

>> +
>> +static void pdc_clear_gpio_cfg(int pin_out)
>> +{
>> +	unsigned long gpio_sts;
>> +
>> +	if (pdc->version < PDC_VERSION_3_0)
>> +		return;
>> +
>> +	gpio_sts = pdc_reg_read(pdc->regs->irq_cfg_reg, pin_out);
>> +	gpio_sts &= ~pdc->cfg->gpio_irq_sts;
>> +	pdc_reg_write(pdc->regs->irq_cfg_reg, pin_out, gpio_sts);
> 
> Is this guaranteed to be called sequentially, i.e. not in parallel on
> another CPU? Otherwise, you need to add the lock here to make sure the
> read-modify-write doesn't race with another CPU.

Right. with irq_desc->lock held it will be called sequentially and no locking
needed.

> 
> Note that since the irq_cfg_reg is also used in qcom_pdc_gic_set_type()
> it would be safest to add the lock there as well (although since PDC has
> IRQCHIP_SET_TYPE_MASKED it's probably unlikely to be called in parallel
> with another irqchip operation for the same IRQ). In my patch, I handled
> this for all users using a new pdc_update_irq_cfg() function [1].
> 
> [1]: https://github.com/stephan-gh/linux/commit/59ca2a7335ede83e4a7cf02704dd7c469c725c14
> 
>> +}

[...]

>> +static void qcom_pdc_ack(struct irq_data *d)
>> +{
>> +	if (pdc_pin_uses_seconary_mode(d->hwirq) && !irqd_is_level_type(d))
>> +		pdc->clear_gpio(d->hwirq);
>> +}
> 
> You might need a write memory barrier here and/or read-back here to make
> sure the write is complete before the interrupt is unmasked in the GIC.
> IIRC I added this in my patch after seeing some test tlmm-test failure..

I did not see any need for barries and all tlmm-test passed.

[...]

>>  
>> +	pdc->unmask_gpio = pdc_unmask_gpio_cfg;
>> +	pdc->clear_gpio = pdc_clear_gpio_cfg;
> 
> What is the purpose of these function pointers if you always assign the
> same function?

I have updated them in v3 to be assigned only for secondary mode.

Thanks,
Maulik

