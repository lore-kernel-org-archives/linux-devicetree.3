Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 897E73624C2
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 13:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782307517; cv=none; b=XKnJ2LZLx52Xi1og1d7l8HFxsTf7fYVqd23wVr+H6KXZuaGjogwG9CZImeBErxU7D+Hurvx3mXoNWO54UHjKlwLg2C6tlI3NYwy3X5PG2oi4VaVpoqL9Je4v+VW+bHkG2DbE52p+jnjdPHUmE6mh56UF0jb/FSqZEO+iHpNml/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782307517; c=relaxed/simple;
	bh=teUkfW0N/A/YLuxj0IhHFRqmE3Tbt/Kzmewx9Z5I85k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r1uBIznEgrv2uez2yvlp5BcYWwEeytYgh9i0awXNFKNN7nRcWLpCSiC44G9seLbp/x+gYCJ/AciFlVg07TVw7ZMiZJE5O11KH+P6fQpv7oV/uazqcfC0OFmxMNBDtFzQWapABNnMsb2mLzZJrNuugz8W7GWqq6PbgoQAuXfUKLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=agmYXxbB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gPVPH4hX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="agmYXxbB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gPVPH4hX"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65OANT6N3069760
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 13:25:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rC2z0XqMxmHPRSg9nz1/nDi27TUq/b4lbHiGoXEwpjQ=; b=agmYXxbBwEgf6JD8
	IVMHFNmxN7SkpPqKh1UcRepP8HHS+nwzQyCU56gxqV8S1xT6NvjEIm1nongoCOZw
	V7SsgOcXTKDN1vfx5u9UkMEB005Xk0jHEAdMEwh1/11CaBsgpnmwSWvboZ44EOnu
	d/ATKB2mqma3q1YWlK+KDHglsB0LSFecFMevOfb8gtQ+AWNKfFQ6ockXghdTwOln
	1gZFb+wBVCwWwJCWP1nRnwyf/xPHl11OC39w+QemMek864OSNPwxDg95PAfA1nDW
	CFLprEfj5uD8IEh9epkQPS2TrrehbVbqo7eq5Q4K7SJcGbdGaDlg13RCQph3u35M
	nn8Nkg==
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com [209.85.160.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0d5g0r1p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 13:25:14 +0000 (GMT)
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-43cd2d12617so1901986fac.3
        for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 06:25:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782307513; x=1782912313; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rC2z0XqMxmHPRSg9nz1/nDi27TUq/b4lbHiGoXEwpjQ=;
        b=gPVPH4hXtcU0r3eBHsruBeGwdxiNFYV+4G+DOw+iWfACLyiGv4bcNPkY+8qgPpabOb
         WcU0lCbvgGtXg+FYQqwRl32qoEKBJc5QQD/Qba8HjPsHwERMW0NWg6nCh0q4zjeonpnN
         RBPmxjSQ5+9nH0u7j+iUcyVjehggoE9XD6/5PUQj6Curr7Ynk2moQgWDo5MADzR2M4iI
         EThzaQw0zUWQ0zn4iBMR6fkrORhb2ExgWuMAnTe+Gl8bu2vq2ta0QJLHY8gPbsIpeR6C
         CPHRciWQ5ctvQnjilLyusiV4u/UMapeK7Gh80zeNjiT0YnxErxYXOO55LIiKJtUTZ0Kg
         WLYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782307513; x=1782912313;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rC2z0XqMxmHPRSg9nz1/nDi27TUq/b4lbHiGoXEwpjQ=;
        b=AwexutbAoDPhjRziIJ9OnQlKFBDiXTzfV2e8Ck20S5hQrzGSiCr+MLVmtuFAD7hEW4
         o5m62pSofK0yvwqg6nQMGIZ1M5iXGJjAV+sNLFxGb3qgHMqdY39MRj/z1OHu6OJ6i7Rw
         UGLNgyT8El1X4y7aaCVE1WJ834F1SPOchwxh7OeeIhqyjoicFPr21h2pXC9Wni19Y8Dm
         O288aBXdIUkUE+P9687aKwpGqnCK/0RG2JBvkxm3PLhauuTCeAicJ1NwI+duEVtwnwxb
         MikuHugd/mgGArqnXzNdVofRQQUOOViwkwEeN9KeKd7u814k8Ra2kW2iCtQ1HqpJ/JKN
         XhCQ==
X-Forwarded-Encrypted: i=1; AFNElJ+Dbyd1kHKurhp3XYcKH41dgig0KTCqXonOLgqqEHYIjJIBIh5LLieHbRltWMQpoocBfPzhA2z9x1pr@vger.kernel.org
X-Gm-Message-State: AOJu0YymmnrtsjocLARs4AVxwvtq9ZegwPRGbgLxOhmqQ6QFV/kTI0F9
	FeXYXen01Zj2m1Qx+rG3fy2P6XtyiWTe1XaQALpKpAXtzJiF+2w0/iHjtxQap07Ql094aEqy6n1
	2YBIMsZgQi7Ze6BABhNelnvm+bCFp16jNIITs7s1fVsWsxKmbU47ihTHbGmOo4qshj9/Rfbo7
X-Gm-Gg: AfdE7clJPS8TbQET3y1oLiCnyeCbQXcgjnb/LIh+EDoNjCCQ9+4OL69vSsYgJdZELKi
	6U5oOZvfZk+EpkIfWPcQoOz5yY5fpkeAkljJ/Ndq4teyYKHl85zaN7t4J2kEMbQx5/nqDr375/1
	fi1+nVsl1X4buJu6fnzpoUzt2QfIfSe8bP6Ygqzmu4ZzEonRXfC8q92p6eOcgRQa7hyGn6utPCE
	jkJG2yKxDzXFZuNmUfopEomh0QcBNrVn9O7GK10H3PNZM9teTLrXiKAas8EX/zOzVh/TNsHCGIl
	EvjO2VmrWTkiTJ/GRnSeBdIhFphfPrTRFjdJAbIZHh2x/kVOO0FnIV3R1BcnYNUQu6zcTFuO9hn
	qXqtvn6eAxgtXcC8uc2ivTxtVScAzoezAjkxm1D6r0AU=
X-Received: by 2002:a05:6871:8002:b0:43a:5cd0:db00 with SMTP id 586e51a60fabf-447dcb084abmr2335462fac.23.1782307513486;
        Wed, 24 Jun 2026 06:25:13 -0700 (PDT)
X-Received: by 2002:a05:6871:8002:b0:43a:5cd0:db00 with SMTP id 586e51a60fabf-447dcb084abmr2335450fac.23.1782307513039;
        Wed, 24 Jun 2026 06:25:13 -0700 (PDT)
Received: from [10.218.35.45] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4472ec52815sm10828031fac.1.2026.06.24.06.25.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Jun 2026 06:25:12 -0700 (PDT)
Message-ID: <56861a8a-2b3c-4f71-987c-13ec0e6a7fcc@oss.qualcomm.com>
Date: Wed, 24 Jun 2026 18:55:08 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11] PCI: Add support for PCIe WAKE# interrupt
To: sashiko-reviews@lists.linux.dev
Cc: linux-pci@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org,
        conor+dt@kernel.org
References: <20260624-wakeirq_support-v11-1-120fbfaebe59@oss.qualcomm.com>
 <20260624114008.7F7A51F00A3A@smtp.kernel.org>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <20260624114008.7F7A51F00A3A@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=LdMMLDfi c=1 sm=1 tr=0 ts=6a3bdaba cx=c_pps
 a=CWtnpBpaoqyeOyNyJ5EW7Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=NEAV23lmAAAA:8 a=5omraCXNoM4NwuFcFr8A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=vh23qwtRXIYOdz9xvnmn:22
X-Proofpoint-ORIG-GUID: oVttLaBO4NUfw8bLuYUh5kfgIz5TOkWe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDExMSBTYWx0ZWRfX7gnkMEMYc1lb
 +aUio1fejQmnTCDCUWdEPG+L/rILPEsdmMwq+OzDxZKkuujsxM51pQ0X+lN0lxzTkjRY6nHxWAh
 XCCrzi1OnZX6S2zir5BV0L0C1LBMAy8suDt5ipyL0dJIBOZrQILHghIRZYrpPhoXotwWl6KSb85
 82KOSOGv/GSGwZ8YVdX4qg8NpIESPCvDcyNKs7DdMAkje/V9i4ammMQFoZlcXK3yee4RlTg1BFo
 x+T//gD3iwlmo+1DW5sQC3AKQpCHhA6FnEyGxm6gMklaz+jnUv0GfuXJWRtnprY0twg4PnXizl0
 W/Xxc/Dij9FGZaIMv3GWtYBIxfY7lJVZh0vq+DRs9loPal7ChMfkfvw6KH/NZpA+0rEMmUpglCl
 yDYCYs5QsXL+0cN2g7cLVD7wrYQFUOW7v6f66UbNgKodTMWywtUYjLf41VJLo/taQ3TwuVXlo1w
 pYJ3MrMLPd7LQKAmOPA==
X-Proofpoint-GUID: oVttLaBO4NUfw8bLuYUh5kfgIz5TOkWe
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDExMSBTYWx0ZWRfX8cbxfIddCZiI
 iPOUopUAqjEnWrtPa+oXe9kUBvIUDfV6FaLR99kQqJwmp091fq7LgAz7TNXUXuD5N59ILQT2LUG
 rhc3ON39n828/NSbyehVZ7NKytBwXxo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_03,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 phishscore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606240111



On 6/24/2026 5:10 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 6 potential issue(s) to consider:
> - [High] Hot-removing an endpoint sharing a WAKE# GPIO breaks wakeup for all remaining endpoints on that line.
> - [High] pci_remove_of_wake_gpio() unconditionally clears the device's wakeup configuration and wake IRQ, even if it never acquired the WAKE# GPIO.
> - [High] WAKE# GPIO configuration forces device wakeup to be enabled by default, violating PCI PM policy.
> - [Medium] Calling platform_pci_configure_wake() after device_add() creates a race condition that overwrites driver or userspace wakeup configuration.
> - [Medium] Hardcoded IRQ_TYPE_LEVEL_LOW ignores Device Tree GPIO polarity for the WAKE# interrupt.
> - [Medium] WAKE# GPIO configuration permanently fails if the GPIO provider returns -EPROBE_DEFER.
> --
>
> commit 9e1cd6307066585f1f51b9e7de95ae7950936ba0
> Author: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> PCI: Add support for PCIe WAKE# interrupt
>
> According to the PCI Express specification (PCIe r7.0, Section 5.3.3.2),
> two link wakeup mechanisms are defined: Beacon and WAKE#. This change adds
> support for the WAKE# mechanism in the PCI core.
>
> Link: https://lore.kernel.org/all/20250515090517.3506772-1-krishna.chundru@oss.qualcomm.com/
> Link: https://github.com/devicetree-org/dt-schema/pull/170
>
>> diff --git a/drivers/pci/of.c b/drivers/pci/of.c
>> index 8b18c4ba845cf..0f5effe1d7026 100644
>> --- a/drivers/pci/of.c
>> +++ b/drivers/pci/of.c
> [ ... ]
>
>> +	ret = dev_pm_set_dedicated_wake_irq(&pdev->dev, wake_irq);
>> +	if (ret < 0) {
>> +		pci_err(pdev, "Failed to set WAKE# IRQ: %d\n", ret);
>> +		return;
>> +	}
>> +
>> +	ret = irq_set_irq_type(wake_irq, IRQ_TYPE_LEVEL_LOW);
> [Severity: Medium]
> Does hardcoding IRQ_TYPE_LEVEL_LOW here override the logical polarity
> specified in the Device Tree?
>
> If the WAKE# GPIO is specified via the wake-gpios property with flags like
> GPIO_ACTIVE_HIGH, this explicit type setting might ignore those flags and
> fail to trigger on platforms with an inverted physical signal.
As per PCIe spec WAKE# is active low signal.
>
>> +	if (ret < 0) {
>> +		dev_pm_clear_wake_irq(&pdev->dev);
>> +		pci_err(pdev, "Failed to set irq_type: %d\n", ret);
>> +		return;
>> +	}
>> +
>> +	device_init_wakeup(&pdev->dev, true);
> [Severity: High]
> Could this forcefully enable wakeup by default and violate standard PCI PM
> policy?
>
> Calling device_init_wakeup() with true marks the device as wakeup capable
> and also sets dev->power.should_wakeup = true. The standard PCI core
> behavior usually marks devices as wakeup capable but leaves enablement to
> userspace opt-in.
if the client driver wants to enable wakeup IRQ, and if the WAKE# is described for
root port only, then we can't ask client driver to enable root port device wake up
capability and in suspend noirq we are not allowed to enable wakeirq, so we
are enabling here.
>> +}
>> +
>> +void pci_configure_of_wake_gpio(struct pci_dev *dev)
>> +{
>> +	struct device_node *dn = pci_device_to_OF_node(dev);
>> +	struct gpio_desc *gpio;
>> +
>> +	if (!dn)
>> +		return;
>> +	/*
>> +	 * fwnode_gpiod_get() may fail with -EBUSY (e.g. shared WAKE#), but the
>> +	 * actual WAKE# trigger from the device would still work and the host
>> +	 * controller driver will enable power to the topology.
>> +	 *
>> +	 * -EPROBE_DEFER cannot be propagated here since pci_device_add() has no
>> +	 *  retry mechanism.
>> +	 */
>> +	gpio = fwnode_gpiod_get(of_fwnode_handle(dn), "wake", GPIOD_IN, NULL);
>> +	if (!IS_ERR(gpio)) {
> [Severity: Medium]
> Since pci_device_add() has no retry mechanism, does swallowing -EPROBE_DEFER
> here mean WAKE# functionality will permanently fail if the GPIO controller
> providing the WAKE# line hasn't probed yet?
In device tree model -EPROBE_DEFER for GPIO is highly unlikely. since PERST gpio's
is already parsed in the controller driver before enumeration starts.
> [Severity: High]
> If multiple endpoints share a WAKE# GPIO, only the first device acquires
> it while the rest fail with -EBUSY. Can this break wakeup capabilities
> for all remaining endpoints if the first device is later hot-removed?
>
> When the first device is removed, it frees the shared GPIO via
> pci_remove_of_wake_gpio(), leaving the remaining active endpoints without
> an associated wake IRQ.
in this scenarios,  ideally bridge also will share same WAKE# gpio, so if the
bridge
is removed below devices also removed. so it should not effect.
>> +		dev->wake = gpio;
>> +		pci_configure_wake_irq(dev, gpio);
>> +	}
>> +}
>> +
>> +void pci_remove_of_wake_gpio(struct pci_dev *dev)
>> +{
>> +	struct device_node *dn = pci_device_to_OF_node(dev);
>> +
>> +	if (!dn)
>> +		return;
>> +
>> +	device_init_wakeup(&dev->dev, false);
>> +	dev_pm_clear_wake_irq(&dev->dev);
>> +	gpiod_put(dev->wake);
>> +	dev->wake = NULL;
>> +}
> [Severity: High]
> Should this cleanup block be guarded by a check for dev->wake?
>
> As it stands, if a PCI device with an OF node failed to acquire the GPIO
> (e.g., it returned -EBUSY) or didn't have a wake property, this will still
> unconditionally clear its PME wakeup capability and detach any dedicated
> wake IRQ the driver might have configured itself.
ack.

- Krishna Chaitanya.
>> diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
>> index b63cd0c310bc0..143b0bd35b3c9 100644
>> --- a/drivers/pci/probe.c
>> +++ b/drivers/pci/probe.c
> [ ... ]
>
>> @@ -2775,6 +2775,8 @@ void pci_device_add(struct pci_dev *dev, struct pci_bus *bus)
>>  	/* Establish pdev->tsm for newly added (e.g. new SR-IOV VFs) */
>>  	pci_tsm_init(dev);
>>  
>> +	platform_pci_configure_wake(dev);
> [Severity: Medium]
> Does calling platform_pci_configure_wake() after device_add() create a race
> condition?
>
> By the time this is called, the device is already visible in sysfs and
> uevents have fired. Local userspace tools configuring power/wakeup or
> asynchronous driver probes could have their configurations silently
> overwritten by the subsequent device_init_wakeup() call.
>

