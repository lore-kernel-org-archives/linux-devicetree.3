Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9465937418A
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 07:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779781794; cv=none; b=tiRKcmBh8wFq8sFcJwzpmPtzB1IVivs1WCtUzrfWz6VwnbL/QdRDOFChZ97+yRiQVWEO7lt5c6i0jbIFlTnAnr6obujcHlSG2BkR4DA898uX00BBge1qPyomRVovC8AMsfkD5PmYhOtGJa8QcMx1M2BLBzKtEzAf3E3IpNplpTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779781794; c=relaxed/simple;
	bh=zYDcoWtKvxNaOxBHLQ7d+N4DN0rtNNf1t6/JMX1tQpE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Bxq/a66frdP75llNl721LCsHrOaYEi12aD+9wJP7ctUAoPF+D4ichSizkhSh7luKy36Kgi6i84cIFlPtdbazZOg1i19rgkTqots6HfqmgrovieAvl4ufscUqwl0pQMOx91AeqfQLK+78hWRiNb030QTG59TpJguJLwpC1tHhUXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZSS6P5cv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YMRU/YS1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZSS6P5cv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YMRU/YS1"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64Q2lnSQ3658101
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 07:49:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iDdMCPAN6y+N741ZL26u6GKshLsbUTyy6PlMeEsOE9w=; b=ZSS6P5cvT74FyYP3
	pNoJ5twoaqZRHB3nNkhG6qY83Gox/QQNUB/ALo1kqH+wVkgxusY8c5oqqUWg3NWb
	dNn/uGyYc4HlcRROuiqATmh/RSAdO+pethAFmaULe6RbsbvabbK8R0Et7W4AFHUJ
	bJuYY9wttvYq/QqWQVcEoi+VT4arvvma+nirONn/JuYI6p8pWynRIGmg/CeZONUG
	FRyiX0YfHJ97lfBmR2tyGS7eMzMdxZmgxRDi5JpzFv07Dc1M9awmGt0TEijkv3yY
	R+VDA7liGxL0j+bDNPG2NqX/35rJk43AMTLNcU/vDTtJU7REsxhK8HP9whxVGInh
	aHo4eg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecqynapej-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 07:49:51 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ba224c3ffdso237596145ad.0
        for <devicetree@vger.kernel.org>; Tue, 26 May 2026 00:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779781790; x=1780386590; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iDdMCPAN6y+N741ZL26u6GKshLsbUTyy6PlMeEsOE9w=;
        b=YMRU/YS1b2R1uYaNpgghkN9sWjj21rEgwcykMXr06k1wzvsL2qpPi1KRigww+YvQ/a
         4fvOyxhYdd8PhUTeheo/Bc4yExtdos/BPnqWZLH5MZV3aJJd3K9qcpHMBrTH+H4XW9e8
         FDJengMHMC0QAfdzXQPu/w9qa4wR3np4X1TWeWcKtgHSd89fxPq9ZDlQscHlqU4Y/v3U
         VvPpsn8ZtPTe0qjq8wv1rKUNPNXUKJ8T2Fyi0G2KtDTMzwtIrTD8pJf+AkMnD1jhOaWP
         V491klSQWvoccnGxAZmFPB6Km7VYvalGTMQ8tWgIjkKpIvG2SHcJBi9jQfYa9/8+1N71
         6KPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779781790; x=1780386590;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iDdMCPAN6y+N741ZL26u6GKshLsbUTyy6PlMeEsOE9w=;
        b=NFBZtW1vT2DYRmEgZ7YExMLudL6oRhdbBuFOA/BBSNdS/wE93SOCjQk+0Qtb9pe1dP
         00nStriWeC7/TNeeuzM+KTm0NFTwoiCdhn9aboPkr2Uk7zB/Uh8tNzWZgso4fkG2gGVR
         nQhRn4cu6xTkTorLbyOMrF7ESjh0bu54Y0q36ThZOUlTTfHYeGqtT5uFV5Yfsf3qE9kn
         sHfbfY8HY7sw04TynB8FtiIGf0hVFyN8sH0ncdMCgDnVMk3WTHX4a6+o48vu0edamq9S
         gfvFriekCwJbJgrWRNDy4RSXGRV+ts1FhC72wK6NzumZ1fbyr9i7mY6BDJilpkqxxEvj
         gs3g==
X-Forwarded-Encrypted: i=1; AFNElJ8X55HzTWOjqxXWhlFxOepyuNjGMKPa8vi7z2VckCH4JguFFysPsyDNrVpAnDcgSOwYzE6NRp0lzVeI@vger.kernel.org
X-Gm-Message-State: AOJu0YxBuA9H8hQrBv9Mvt67XA9Z5YKnW+q/pwVn815Hp6oRkgXfiC60
	UcKSJJY7pvEbiwqKt/9dVvg0bvJqb6vKp05dTMMaajCNfbG8chvRZ2vnL/g+pO0JbSSEKt85r6p
	u8n0wd9aeKBi6TMHmFoWOBEaGV9yS2aOI9RpgE3nwyu0E85K1Kf0SMlFpxt/POt9j
X-Gm-Gg: Acq92OE2QTKF1oRZFoLNB5x07B/fO2eJBlcIXmyOtuFzkfofzlCqF7MLuz4OFvHlbm7
	1k+G6E2kXmmzPUsmEDYh9Go3rcyGJEb3UfKuW/JzwKPU7AZhMzM3UELkZ8CWDzhr2TRZB8xEvRE
	pSy5sMBMg4j9R8k8gVWTtDALs0at2Gr2d+0PYQWwqR41WdNx8+dxQqRmDM+o1yBKlKCi9ndX275
	1H4eBXdCRDtLrxpPC+6IsOyagQxc6hdAyOyU37X+hZ9/T3b0lZjixf+gOkd+cPemCAVuwAkNx6p
	hgy4xrMm3YPNc+Wrpqi5yRQl3VKuJeGNlD78omKfPlRzYoETAMb32qt8slHpVi5M320FBIARlmP
	YXQSaDLZ19c+Ka64fF3eTRZ7Ib4wJTMvK6CrkTBZzrwqxdL8kgNY/i3Z/BjI=
X-Received: by 2002:a17:903:24c:b0:2b9:fb0b:b727 with SMTP id d9443c01a7336-2beb0675f69mr185476515ad.39.1779781790383;
        Tue, 26 May 2026 00:49:50 -0700 (PDT)
X-Received: by 2002:a17:903:24c:b0:2b9:fb0b:b727 with SMTP id d9443c01a7336-2beb0675f69mr185476195ad.39.1779781789881;
        Tue, 26 May 2026 00:49:49 -0700 (PDT)
Received: from [10.151.36.45] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb56d750asm114864315ad.33.2026.05.26.00.49.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 May 2026 00:49:49 -0700 (PDT)
Message-ID: <ea236655-2683-43b0-987f-2726233087a8@oss.qualcomm.com>
Date: Tue, 26 May 2026 13:19:44 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] soc: qcom: Add CDSP power management driver
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Praveenkumar I <praveenkumar.i@oss.qualcomm.com>,
        Manikanta Mylavarapu <manikanta.mylavarapu@oss.qualcomm.com>
References: <20260520-cdsp-power-v1-0-85eb9501a1cd@oss.qualcomm.com>
 <20260520-cdsp-power-v1-2-85eb9501a1cd@oss.qualcomm.com>
 <20260520-mottled-space-pony-ac82ac@quoll>
Content-Language: en-US
From: Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
In-Reply-To: <20260520-mottled-space-pony-ac82ac@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Wpwb99fv c=1 sm=1 tr=0 ts=6a15509f cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=crtforWdF1l5ZpXxUA4A:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: Dq_7hBKhKwZP3cSRZL2yXoQvCwGo-iR6
X-Proofpoint-ORIG-GUID: Dq_7hBKhKwZP3cSRZL2yXoQvCwGo-iR6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDA2NyBTYWx0ZWRfX9SkRhAjzhKmf
 4qD/9bVhxkpCweXI4GriEvz+HsVmfd1OjjFwaWl3wFhcjMmMvx6Dsb7L/uB+zNNFoNcFsj1aFl1
 aqzYmMLfsLOsD++srJ8Jkdz18vPfsh/bESK4SfDgJWMs4AGZ0kboBD75zGSffpmpPJ9Xg4fzfZ0
 hFqpg+sDwwkOupZYFCoFMVS8BEwbb7JQCeMePJjkgN7xJtt8TakJ8nhCr1j0TbKjfILjSyaBkwG
 c/onigEg7XRo8wGCdmsde4dXKRt52iAbTfiXM9GSqP1CB2ChNJTGkfSAFR5n/NHUNBze1UFWEFk
 WKBc5sT0GMlaufU6ICya/z1LvNk2XW3kBHfWQRrK2niC9IONyghuThUnCLN8qw5czGUaxeOSFkJ
 fqSFG+tiaw5J3lie+AB+BvaYskS+gKwyN88pYfWj2sxvYcQ8wwUk75bfhi9hsz3qDM+kvyNCKqX
 2MP990yDsEebaVtzFhg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-26_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 suspectscore=0 impostorscore=0 adultscore=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260067



On 5/20/2026 4:20 PM, Krzysztof Kozlowski wrote:
> On Wed, May 20, 2026 at 12:35:10AM +0530, Vignesh Viswanathan wrote:
>> +/**
>> + * cdsp_power_probe() - Probe the CDSP power management driver
>> + * @pdev: Platform device
>> + *
>> + * Acquires the PMIC regulator consumer handles, registers the virtual
>> + * cdsp-vdd-cx (and optionally cdsp-vdd-mx) regulator providers, maps the
>> + * MPM and RSCC register regions, and registers the DCVS and LPM interrupt
>> + * handlers.
>> + *
>> + * Return: 0 on success, negative error code on failure
>> + */
>> +static int cdsp_power_probe(struct platform_device *pdev)
>> +{
>> +	struct regulator_config virt_cfg = {};
>> +	struct cdsp_power_driver *drv;
>> +	struct regulator_dev *rdev;
>> +	void __iomem *rscc_base;
>> +	void __iomem *mpm_base;
>> +	size_t smem_size;
>> +	u32 smem_id;
>> +	int ret;
>> +
>> +	/* Allocate driver context */
>> +	drv = devm_kzalloc(&pdev->dev, sizeof(*drv), GFP_KERNEL);
>> +	if (!drv)
>> +		return -ENOMEM;
>> +
>> +	drv->dev = &pdev->dev;
>> +	mutex_init(&drv->lock);
>> +	atomic_set(&drv->power_state, CDSP_POWER_ON);
>> +
>> +	/* Get SMEM item ID from device tree */
>> +	ret = of_property_read_u32(pdev->dev.of_node, "qcom,smem-item", &smem_id);
>> +	if (ret)
>> +		return dev_err_probe(&pdev->dev, ret, "Failed to get SMEM item ID\n");
>> +
>> +	/* Create SMEM entry for DCVS */
>> +	ret = qcom_smem_alloc(CDSP_SMEM_NSP_HOST_ID, smem_id, CDSP_SMEM_SIZE);
>> +	if (ret && ret != -EEXIST)
>> +		return dev_err_probe(&pdev->dev, ret, "Failed to allocate SMEM\n");
>> +
>> +	/* Get SMEM pointer and validate size */
>> +	drv->smem = qcom_smem_get(CDSP_SMEM_NSP_HOST_ID, smem_id, &smem_size);
>> +	if (IS_ERR(drv->smem))
>> +		return dev_err_probe(&pdev->dev, PTR_ERR(drv->smem),
>> +				     "Failed to get SMEM\n");
>> +
>> +	if (smem_size < CDSP_SMEM_SIZE)
>> +		return dev_err_probe(&pdev->dev, -EINVAL,
>> +				     "SMEM region too small: got %zu, expected %u\n",
>> +				     smem_size, CDSP_SMEM_SIZE);
>> +
>> +	/*
>> +	 * Initialise the SMEM channel header.
>> +	 * Zero the entire region first so all padding and reserved fields
>> +	 * are clean, then fill in the fixed protocol fields.
>> +	 * apss_state is set to 1 last (after wmb) so NSP Q6 only sees a
>> +	 * fully-populated header once APSS is ready.
>> +	 */
>> +	memset(drv->smem, 0, sizeof(*drv->smem));
>> +	drv->smem->hdr.magic           = CDSP_SMEM_MAGIC;
>> +	drv->smem->hdr.version         = CDSP_SMEM_VERSION;
>> +	drv->smem->hdr.request_offset  = CDSP_SMEM_REQUEST_OFFSET;
>> +	drv->smem->hdr.request_size    = CDSP_SMEM_REQUEST_SIZE;
>> +	drv->smem->hdr.response_offset = CDSP_SMEM_RESPONSE_OFFSET;
>> +	drv->smem->hdr.response_size   = CDSP_SMEM_RESPONSE_SIZE;
>> +	/* Signal APSS readiness to NSP Q6 */
>> +	WRITE_ONCE(drv->smem->hdr.apss_state, 1);
>> +	/* Ensure SMEM header is fully written before NSP Q6 reads it */
>> +	wmb();
>> +
>> +	/*
>> +	 * Get voltage regulator consumer handles.
>> +	 * These are the actual NSP_CX and NSP_MX voltage rails.
>> +	 * The virtual regulator ops pass through to these handles.
>> +	 */
>> +	drv->vdd_cx = devm_regulator_get(&pdev->dev, "vdd-cx");
>> +	if (IS_ERR(drv->vdd_cx))
>> +		return dev_err_probe(&pdev->dev, PTR_ERR(drv->vdd_cx),
>> +				     "Failed to get vdd-cx regulator\n");
>> +
>> +	drv->vdd_mx = devm_regulator_get_optional(&pdev->dev, "vdd-mx");
>> +	if (IS_ERR(drv->vdd_mx)) {
>> +		if (PTR_ERR(drv->vdd_mx) != -ENODEV)
>> +			return dev_err_probe(&pdev->dev, PTR_ERR(drv->vdd_mx),
>> +					     "Failed to get vdd-mx regulator\n");
>> +		drv->vdd_mx = NULL;
>> +		dev_dbg(&pdev->dev, "No vdd-mx regulator, MX rail absent on this board\n");
>> +	}
>> +
>> +	/*
>> +	 * Register virtual regulator provider.
>> +	 *
>> +	 * Expose vdd-cx and vdd-mx virtual regulators so that PAS remoteproc
>> +	 * can consume them via cx-supply / mx-supply DTS properties.
>> +	 * The enable/disable ops pass through to vdd_cx / vdd_mx above,
>> +	 * making CDSP the sole hardware power manager for the NSP subsystem.
>> +	 */
>> +	virt_cfg.dev         = &pdev->dev;
>> +	virt_cfg.driver_data = drv;
>> +	virt_cfg.of_node     = pdev->dev.of_node;
>> +
>> +	INIT_WORK(&drv->dcvs_work, cdsp_dcvs_work_fn);
>> +	INIT_WORK(&drv->lpm_work, cdsp_lpm_work_fn);
>> +
>> +	drv->lpm_wq = alloc_ordered_workqueue("cdsp_lpm_wq", 0);
>> +	if (!drv->lpm_wq) {
>> +		mbox_free_channel(drv->dcvs_mbox_chan);
>> +		return dev_err_probe(&pdev->dev,
>> +				     -ENOMEM,
>> +				     "failed to allocate cdsp lpm workqueue\n");
>> +	}
>> +
>> +	rdev = devm_regulator_register(&pdev->dev,
>> +				       &cdsp_virt_reg_descs[CDSP_VIRT_NSP_CX],
>> +				       &virt_cfg);
>> +	if (IS_ERR(rdev))
>> +		return dev_err_probe(&pdev->dev, PTR_ERR(rdev),
>> +				     "Failed to register cdsp-vdd-cx virtual regulator\n");
>> +
>> +	if (drv->vdd_mx) {
>> +		rdev = devm_regulator_register(&pdev->dev,
>> +					       &cdsp_virt_reg_descs[CDSP_VIRT_NSP_MX],
>> +					       &virt_cfg);
>> +		if (IS_ERR(rdev))
>> +			return dev_err_probe(&pdev->dev, PTR_ERR(rdev),
>> +					     "Failed to register cdsp-vdd-mx virtual regulator\n");
>> +	}
>> +
>> +	/* Register DCVS interrupt */
>> +	drv->dcvs_irq = platform_get_irq_byname(pdev, "dcvs");
>> +	if (drv->dcvs_irq < 0)
>> +		return dev_err_probe(&pdev->dev, drv->dcvs_irq,
>> +				     "Failed to get DCVS IRQ\n");
>> +
>> +	ret = devm_request_threaded_irq(&pdev->dev, drv->dcvs_irq,
>> +					NULL, cdsp_dcvs_irq_handler,
>> +					IRQF_ONESHOT, "cdsp-dcvs", drv);
>> +	if (ret)
>> +		return dev_err_probe(&pdev->dev, ret,
>> +				     "Failed to request DCVS IRQ\n");
>> +
>> +	/* Setup MPM for LPM */
>> +	mpm_base = devm_platform_ioremap_resource_byname(pdev, "mpm");
>> +	if (IS_ERR(mpm_base))
>> +		return dev_err_probe(&pdev->dev, PTR_ERR(mpm_base),
>> +				     "Failed to map MPM registers\n");
>> +
>> +	drv->mpm_regmap = devm_regmap_init_mmio(&pdev->dev, mpm_base, &cdsp_regmap_config);
>> +	if (IS_ERR(drv->mpm_regmap))
>> +		return dev_err_probe(&pdev->dev, PTR_ERR(drv->mpm_regmap),
>> +				     "Failed to init MPM regmap\n");
>> +
>> +	/* Setup RSCC for power mode detection */
>> +	rscc_base = devm_platform_ioremap_resource_byname(pdev, "rscc");
>> +	if (IS_ERR(rscc_base))
>> +		return dev_err_probe(&pdev->dev, PTR_ERR(rscc_base),
>> +				     "Failed to map RSCC registers\n");
>> +
>> +	drv->rscc_regmap = devm_regmap_init_mmio(&pdev->dev, rscc_base, &cdsp_rscc_regmap_config);
>> +	if (IS_ERR(drv->rscc_regmap))
>> +		return dev_err_probe(&pdev->dev, PTR_ERR(drv->rscc_regmap),
>> +				     "Failed to init RSCC regmap\n");
>> +
>> +	drv->lpm_irq = platform_get_irq_byname(pdev, "lpm");
>> +	if (drv->lpm_irq < 0)
>> +		return dev_err_probe(&pdev->dev, drv->lpm_irq,
>> +				     "Failed to get LPM IRQ\n");
>> +
>> +	ret = devm_request_threaded_irq(&pdev->dev, drv->lpm_irq,
>> +					NULL, cdsp_lpm_irq_handler,
>> +					IRQF_ONESHOT, "cdsp-lpm", drv);
>> +	if (ret)
>> +		return dev_err_probe(&pdev->dev, ret,
>> +				     "Failed to request LPM IRQ\n");
>> +
>> +	/* Setup mbox for DCVS response */
>> +	drv->dcvs_mbox_client.dev = &pdev->dev;
>> +	drv->dcvs_mbox_client.knows_txdone = true;
>> +	drv->dcvs_mbox_chan = mbox_request_channel(&drv->dcvs_mbox_client, 0);
>> +	if (IS_ERR(drv->dcvs_mbox_chan))
>> +		return dev_err_probe(&pdev->dev, PTR_ERR(drv->dcvs_mbox_chan),
>> +				     "Failed to get dcvs mbox channel\n");
>> +
>> +	platform_set_drvdata(pdev, drv);
>> +
>> +	dev_dbg(&pdev->dev, "CDSP power driver initialized\n");
> 
> Drop. All my comments from your regulator driver apply.

Ack, will address.

Thanks,
Vignesh
> 
>> +
>> +	return 0;
>> +}
> 
> Best regards,
> Krzysztof
> 

