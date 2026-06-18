Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D06DA390222
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 08:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781770768; cv=none; b=KaVNds5N3OG4ARdmzUrIbHcasPo/jkIF61RG5A7ShcAC/OKlQ17B7PWNNHFOC8apWd7u87+Xr4k4Hp31Wqo0bdjULjv6YKIZnpBUKC2sgvrDgrsSZo5A2U5yeMQJqV76R7ju2Yaobw/tcx+hNUTr+8ZNmF2Ed7T+qZeNBlZ1lAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781770768; c=relaxed/simple;
	bh=casli13flH9PnvbWb/Fb1QuAj9WYWOB35EA5rARxoBU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QC6/wQYDVFW2ouucV+JhTqLhc3AgcFSyu9N+VrgLJZhkgI0ZpDC7n+0YKLBDlhFAKR5lDDxjG25NK4XncVzcvv6w9pkH7ijWsr6t7ftPlYv2Lguyod7hhI22rCRPNCcImmzM5y9WOsJj1ZZ+/jsnhluUs9kkMntBU9xF8LK/Csc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C2iwSgfs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bDJhpieU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C2iwSgfs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bDJhpieU"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65I8Dr5d2246930
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 08:19:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eTNkagoIOzwO6/2hJOr3P2E7MmuHJTIWk3HLRdjPF3U=; b=C2iwSgfsUZn7IBYK
	mpdA+1mkJtjaVHDcMqIF9GEV9xHO6C82ocYz06yq1d+dnLMRAObd8XGCxMwSc4aF
	9XtJGMTD457LCmTmTEJpm9fO932BPk1oJMCysja7SbXfScbzu2sTeQh7CckgsRxQ
	DvCMplfgNw7K0Pb4bHnwEjtgcW7WOjhMAb9aqujdOk3DD03j6N5lmQrrxiqqLhbm
	q+ojNgXy+Q8YB/1vrancbYMC34x8K8gS8bX69CeCMcQLkVAJusZbdOqsqKhAWJCy
	W3SlB4MFGs+Iz2+gCZoxej630BR7xPzbgnVaEur36RqmyW6AaO5AuMqCIzkrQxbi
	cGxDNA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4euw9vm03c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 08:19:24 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-915a547f4b3so18895085a.3
        for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 01:19:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781770764; x=1782375564; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eTNkagoIOzwO6/2hJOr3P2E7MmuHJTIWk3HLRdjPF3U=;
        b=bDJhpieUmyZfqVn7YlIaberwO1cMieX/tsme6A19Zbs4enSsuvxBfBVUBbFeO4irU6
         w4dtksHod5rMj7j+G/jncxikTZgpDFFf3tuO6ldrIwQolWhsk2Nm4yOC8KoITTX1wp7Z
         fx5iyHPWLfPsxBi7q25KB3O8c0OM/EIN8JBHJRqA1zlRED5klS5TZ5z6/53Dm94mipal
         A+UGihYLU28y3kTI90FrbKZZ5AgTK5tRI793XfFTyL5ufw5mzG1RuWB6lgWsmc5F7Gl7
         sJV9socv+NsGVPn5qTYAk2N3a2kD6CiVeQ5B+Ta+1s+RPZaHf37iOAriuFyHZcd5OE6/
         +BSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781770764; x=1782375564;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eTNkagoIOzwO6/2hJOr3P2E7MmuHJTIWk3HLRdjPF3U=;
        b=hRbsMltSGh7ZUVpqaZRdFJCt6rMsU6Fqlv1VLCZq+fD9EhBztf2TRf1fqC8+yA72nJ
         EV+lnO+9T8bji5qpkXtR0VPaovtjCEqvSPn32ZvJBGYvH/wrJfK67Ykh57ffiGMFtgiR
         GVSOv/dnr4xs/PHqVEK32W+en+tP3mUQLlrifTt0eE7Pbu5ca9+n+Z8JBEXK89tyVJ/h
         P1yG+AfjFR4W/1570J8bPdSaCWuIY7YMxxZZUHl2YlzuRpeMe4f+XhHjH9XwCgAUoYw/
         svFJAgBP6sinJiTxJjq5OliG9+EQeR+grpeooCbVhfUi4/MWvCDQKJDDhLWbW7Tk4GOY
         fo0g==
X-Forwarded-Encrypted: i=1; AFNElJ+PH/+g7grhVhOZ0tmJcrZyMTPdCH2nwmKtXLDkZx3hOdsrQV7qkEWfy+qDPDvqMLVfs00ZuRW2Xu7M@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0kEkHwnSVy2lVT6996NWsnjAFXB3cLjg4k4RQmF/puAMGkziS
	ICXNqpYrOyEy7wpAkKRSJqtFi25JD8goxtWJR+i6S2dCceKd1IH7leHihh6PenYur5g1f2AsSts
	OGMCY4/k/jMHss5d0aUb3YwvVoZVoPX2qz8MD/Zs/VI3EAcbX30zrJye0jGTW5Gj4
X-Gm-Gg: Acq92OHKUWo77H5PmolgqRvNMlkIFD+a8F2zWztqsOCdzBBqI7UwPjCzgNrOy0SBR5p
	fRQ+xCqFZYylS7Xgdqq9HkmLDhiXR5EH6bB0BGPPyoRy4ddwAWz8Y3v7Ut6LKsqpp+Y9lksGL2+
	g/CT7NGVsjohasK7yBEyeVR3JsHD9yebxJ5uc3PrCIKl+Z5ltbpcKbSerBl8oKZ+ipQkXjVQM+8
	Eix85aK3rhcch8fmqHIoXep37bDa3R5GybLwxNmHLbGyGSDDUXHMKbxqXkeJN9W6HdBsJ72t1T6
	Qp81ZbE/fQcmgWCmnoXv+cBSoHgIMkZ6hcdlu5U42l8AI+Qq7psid9c8KBYcTgDYnZ6HwPNqWsC
	G0Qe5cvqz/XbbR5tTUAEW2YFmYkOPrW7e7Kw=
X-Received: by 2002:a05:620a:6c0d:b0:915:4ca0:1210 with SMTP id af79cd13be357-91f2a9c581dmr253478985a.3.1781770763877;
        Thu, 18 Jun 2026 01:19:23 -0700 (PDT)
X-Received: by 2002:a05:620a:6c0d:b0:915:4ca0:1210 with SMTP id af79cd13be357-91f2a9c581dmr253477185a.3.1781770763432;
        Thu, 18 Jun 2026 01:19:23 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb5318d8dsm875237766b.26.2026.06.18.01.19.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jun 2026 01:19:22 -0700 (PDT)
Message-ID: <c90884fd-a354-45f3-bbfa-77c58d8d3b1b@oss.qualcomm.com>
Date: Thu, 18 Jun 2026 10:19:20 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/8] irqchip/qcom-pdc: Configure PDC to pass through
 mode
To: Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>
References: <20260616-hamoa_pdc_v3-v3-0-4d8e1504ea75@oss.qualcomm.com>
 <20260616-hamoa_pdc_v3-v3-5-4d8e1504ea75@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260616-hamoa_pdc_v3-v3-5-4d8e1504ea75@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: pBkLXkv8gaBfMCUCZjs2iIOvP4rh5FeF
X-Proofpoint-GUID: pBkLXkv8gaBfMCUCZjs2iIOvP4rh5FeF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE4MDA3NSBTYWx0ZWRfX19TvcWlO7g29
 +xLmVP0gHjlK9WOjhuVUSoSkIwivpqHbl5tCXzNpV3LpUAX2WrYhUI/TgehPQxb0SRPcWwOC2ns
 pFtY7tuvR1/qXrqjUKVEw3wkKEGjLsJzi8plNvygx7IYe72DedNMgULTAQ8HAo1H9g1VXHxCEqT
 YwE02zuHhHUc4t5hHky5+M30GUDydFr4HI/k6Uxf1myDryGVhqkM2782aI5ovvnfRvvRyBC7PpH
 zgJpGmVUruATA4Qq1pGWI3JucErp3q0c7f3x43apcAPvl9sLXX/RdKx/VfguAlrzpgFjCWPYo7x
 GuVMGXZBQCaCU9mV9HXwQ+jGQvhHvo7mQecZlSPewSs1VDOXCB2yXvvLc8elQWr3URzHErJukU+
 CyTxu9RdDxoq94IoEaV9ht4QmQm3G0fuwjlTavEGBzvYrB81jtLvCa37SwSjChQP8w8GeqCvIUE
 5hLPUMZ5Ik21t0gxWww==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE4MDA3NSBTYWx0ZWRfX83fqLU1TS3SI
 Xw3PaQQclzrWgr+lITjow4WEkJqRPBq/KOCvN28s92hiw2HtVXOVJtr0qEhjokZoE0UOlYjbrED
 YZGSEeFDqB1WVEfaEBZcZqo4k8TKxfU=
X-Authority-Analysis: v=2.4 cv=YJKvDxGx c=1 sm=1 tr=0 ts=6a33aa0c cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=ZhBa3tV6RTI7cPQeaSoA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-18_01,2026-06-17_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 adultscore=0 impostorscore=0 clxscore=1015
 suspectscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606180075

On 6/16/26 11:25 AM, Maulik Shah wrote:
> All PDC irqchip supports pass through mode in which both Direct SPIs and
> GPIO IRQs (as SPIs) are sent to GIC without latching at PDC.
> 
> Newer PDCs (v3.0 onwards) also support additional secondary controller mode
> where PDC latches GPIO IRQs and sends to GIC as level type IRQ. Direct SPIs
> still works same as pass through mode without latching at PDC even in
> secondary controller mode.
> 
> All the SoCs so far default uses pass through mode with the exception of
> x1e. x1e PDC may be set to secondary controller mode for builds on CRD
> boards whereas it may be set to pass through mode for IoT-EVK boards.
> The mode configuration is done in firmware and initially shipped windows
> firmware did not have SCM interface to read or modify the PDC mode.
> Later only write access is opened up for non secure world.
> 
> Using the write access available add changes to modify the PDC mode to
> pass through mode via SCM write. When the write fails (on older firmware)
> assume to work in secondary mode.
> 
> In secondary mode set the separate irqchip for the GPIOs to perform
> additional operations only for the GPIO irqs.
> 
> Co-developed-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
> Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> ---

[...]

> +static void pdc_clear_gpio_cfg(int pin_out)
> +{
> +	unsigned long gpio_sts;
> +
> +	if (pdc->version < PDC_VERSION_3_0)
> +		return;
> +
> +	gpio_sts = pdc_reg_read(pdc->regs->irq_cfg_reg, pin_out);
> +	__clear_bit(pdc->cfg_fields->gpio_irq_sts, &gpio_sts);
> +	pdc_reg_write(pdc->regs->irq_cfg_reg, pin_out, gpio_sts);
> +}
> +
> +static void pdc_unmask_gpio_cfg(int pin_out, bool unmask)
> +{
> +	unsigned long gpio_mask;
> +
> +	if (pdc->version < PDC_VERSION_3_0)
> +		return;

These version checks should be unnecessary now, given the function pointer
is only assigned for hamoa

Konrad
