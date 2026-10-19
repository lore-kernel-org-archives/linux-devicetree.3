Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C50AF4E73C1
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 12:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792411203; cv=none; b=IzFZREn2/eCY8pQ3+eUTB+BBI/xu5gJb7gI7/JM87tfz5njsCCX6N0zHDmokocqRly8znYC9KT/1SbWIEG2aohDqlWlZb990rPxYUqYhQmPpxBV5A3/rVICpm8VL0S+6zepKOEDId1DtFkweix96QfMYZFNNJdi84MWQp+IDd2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792411203; c=relaxed/simple;
	bh=FcqLpKSfKJ1yko+5OFV+nW7H7B0lBHV0bW98aHKRh3c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=vEJiPjWGyGNtitGxoxejoD1uPuHZQ3KONO+neMDjNSXRKGb45SJWuIrt9KluTqFgOm2bAqTNhV22opU25BXOEutntx+k4/BfaJFUxXExnqH8iF9pEx6E5grkjF0r8Q7m5grqs8qZGzZJUNWMI8cTgvrdlC3UWoKqT2xRTdNpv+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Lajoh6zg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XGFc6+0C; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Lajoh6zg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XGFc6+0C"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8Orsp1665586
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 12:00:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6w/w7NyM2M/WyE9YFhQuhHJ6Ubd2mIWba5kyEyLKMtE=; b=Lajoh6zg6aeyfvP4
	Sa5jc/Rmq4UMjtfNhnnjO80rfSIba2GV5TaiOWau76x3INtb7/usAcQRd5Zv+r3c
	vG/LFFOKIGetdbNWidFyyiZpa8ichrbiSxW/JPSfleiKhdI83HYr/6wBqu3Okj05
	YHgkcypdjQCOcxRBctbhROuOs8fsWmlNVR7r4Y0ayt4ExE3XhMX3lD6c0egctb5d
	9xeoUOzlLUSrcWZlCtxKXNudhBTOQQXVQYWKEvFIEsppL2LxtdegQwYF64omDzYa
	eEHkEjOLxlhZPc3qYNGrCiCa0ZBEUDnpF2NZmahPzUuAUIYsrhsPderw7RC0AQkJ
	8gCSvw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf3n0y4q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 12:00:00 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-530cd3dff25so2657211cf.0
        for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 05:00:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792411200; x=1793016000; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6w/w7NyM2M/WyE9YFhQuhHJ6Ubd2mIWba5kyEyLKMtE=;
        b=XGFc6+0C5KfPdctG8Z81tRBNg4V0qAUwwlJD27mm9XaNSzChxs2ifOyFwRXZhYnCdq
         H/iuEeVN8yg6QbtKhzLBxxG6jSpXCeu2j0WYKe8Gu8UZ5UAvvmUR+JPGl6F/sQePd/Fd
         y/1ymhV6uau9mgunvhE/PP+kLSGbQjJGORBAYDkIH5OHAKo12gY8el0LjisJsgm4FpwJ
         KbYlJ47rXgVHmnNjGF8X97HjkREmv2C90RUjmLLrFhW0EMRX2nEwIivRKxn5dGIvrMSQ
         jWckeVvYC0gOSyirOAj46hyG1sj8hu4O1nujh+vMOv2TsOKYDmq+z5siH6bsjI2//GHS
         0fOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792411200; x=1793016000;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6w/w7NyM2M/WyE9YFhQuhHJ6Ubd2mIWba5kyEyLKMtE=;
        b=a9QpjEXa1fZfiMZSb8dIJLckpqeLP8KkjokpfGutxgpsVo9qffhY0aACWwbBZnkB4C
         u/ZcecFJb3Cqx9agWVmWVeQ0uIds8WfiBbCIKj/bUuS9bzII3AWS9r+t5KtB30YvQ2vv
         A4Ir+lwNDwcNgKlqQgVOsGP/VJ2Lj/uIHadb+N5MihEFi2tMwBCAEHyNp0VgBl84XryK
         Rg6FJyzUq849obvcbWQ+dgJhvUUqBmFE0/zmUX8C4qULWlvIBgcSvNZ3NRY5+Gee8GzY
         sN3Ghm+bfP8SKVMkkhMIwWi1yeHI6Fpq6EY1oBP02GT+2xopoAdG+2nbGnUhJQSbsN18
         ASLQ==
X-Forwarded-Encrypted: i=1; AKwUvBzRW+nd1/4g95fN1C4v30JsiClvEGfir/oLiZCwmmJdsufDJZ3TGMvZfcnu8wK20NwrB9h9Ww+4P/7m@vger.kernel.org
X-Gm-Message-State: AFq9FYKgNUvMoW/05iZFH9axTB9tX3y0mPb+9BkFhqKR7XgjpNDqRPlL
	25yfHhHYip25Lt2+1i6C0Sd8NvGlN9eyfew2rfXU3yeiT6fWnY7SiCnCKnwvw+XzkXE/FON4zzf
	YWV1NRJFazEx1lLx0G+I3uUlBFP2e0MN3l/mR/Q5MwXn/oYYyB6D7OGG0W3y81Qa6
X-Gm-Gg: AYBFou39WephunvBlq0aW6BXp4355OKtMymvbkZN5O7tenspy9EOzc71tmMWKTadmCZ
	V6SGXSU44ZHV07PomXTFDbFGSEE6IQTkKQLw0bt4CWBj9DuEIz5qACZKn2VfyFeJQ1MX3uGvoqZ
	JZ9zWiBr92uAV/eR8344GXg3LVDcIxhHma+JJzpI4P3Skt+3R0qKdR5MjfUX7J4R2w/kwqDbQhR
	JjMnrrUReG1l15t1JDZeg4QJEIbTMkL26gZjI2d8rro5QOkuz7utmir68KQgB2L5X8mQE4eESgY
	6kNv+r98u6bAd8+RXuPlMkQMjQ9F6+9KKJahkYVfruwtVIrmdkX6dAh3ypzsjX2oEmuB2zOfuy6
	fBTV0ohr699DDzSpHF1ArTg==
X-Received: by 2002:a05:622a:411:b0:535:162c:2e81 with SMTP id d75a77b69052e-5364616cceemr134121081cf.5.1792411199608;
        Mon, 19 Oct 2026 04:59:59 -0700 (PDT)
X-Received: by 2002:a05:622a:411:b0:535:162c:2e81 with SMTP id d75a77b69052e-5364616cceemr134120601cf.5.1792411199024;
        Mon, 19 Oct 2026 04:59:59 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c40912ce122sm364995966b.32.2026.10.19.04.59.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 04:59:57 -0700 (PDT)
Message-ID: <0829d45e-a55a-43f6-a9f3-f445337fa00f@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 13:59:54 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/8] regulator: add Qualcomm LCDB driver
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
        Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
        Kiran Gunda <quic_kgunda@quicinc.com>,
        Subbaraman Narayanamurthy <quic_subbaram@quicinc.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, mfd@lists.linux.dev
References: <20261019-sm8150-display-card-v2-0-86c05068efc5@oss.qualcomm.com>
 <20261019-sm8150-display-card-v2-4-86c05068efc5@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261019-sm8150-display-card-v2-4-86c05068efc5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA0NyBTYWx0ZWRfX71cEW9J3Ybmu
 jsmpVdV2Yk4nUq29W07rS4FJ7FnK3cxzFCaXsc29XjkqMX0BN5v8NPrhsG7l/hF8Ai6WydOziLd
 pPfCfSec4dQH2Bxiu6pbarSIj+Z9IP4=
X-Proofpoint-ORIG-GUID: r5J5FLMfoXyzboMSLBNXiyQCtBMd5Ra4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA0NyBTYWx0ZWRfXwfeqi8S8Wv8s
 k3pn0ItM28RCBqa6hYcg7BbEIDk0vTfscBzhWin8GY5dE89j71qOwyi3ppO79VVfWr6ENDjLs7X
 hdM2+KpXvX4jpqcsm4op10HKYbS/xl0yDDqh89KPKvqex5m+/14YAHErTnlLmnjXGuyXRO4JvuQ
 czx5dBEU5jNl4CTyZXamozlrjpFdRI+B2Bfs53jsB/9tUfPxfUdREFLSeYIGZ6HdmcjUEK4cBhc
 ctoKSXYnrbdm1ta6/f8EC6dbNf9IfCtvf2RAd4wBnel5p8uGsF2MaM+7YXUNZR5sPa7WACdiWiy
 UWF0b4E3DWZp9Tf2JOi1fNu1aVEHk08MKMpucXupF8h5IJ+Rb3wkNqI0QZsu6gjjnGVG+MOWiEp
 OsV2IZ3W+fFYzmDK38qJ4jhQLNKSF37452Li4EyJwYXRT9RUnT2goMXpqYLOQ7fHDSkktyaNCVT
 ShuDKcjA3O6AbyqjcAA==
X-Proofpoint-GUID: r5J5FLMfoXyzboMSLBNXiyQCtBMd5Ra4
X-Authority-Analysis: v=2.4 cv=Zf2IpcVA c=1 sm=1 tr=0 ts=6ad60641 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=6RkV1gTEqpm7dquCeG8A:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 phishscore=0 priorityscore=1501 bulkscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190047

On 10/19/26 1:25 PM, Dmitry Baryshkov wrote:
> LCD panels on boards with PMI632, PM6150L or PM8150L take their bias
> rails from the LCDB block. Without a driver they only work as long as
> the bootloader has enabled it and nothing turns it off.

[...]

> +static bool qcom_lcdb_handle_sc(struct qcom_lcdb *lcdb)
> +{
> +	guard(mutex)(&lcdb->lock);
> +
> +	if (!lcdb->enabled_mask || lcdb->sc_disabled)
> +		return false;
> +
> +	qcom_lcdb_module_disable(lcdb);
> +
> +	if (ktime_us_delta(ktime_get(), lcdb->sc_time) > LCDB_SC_RESET_CNT_DLY_US) {
> +		lcdb->sc_count = 0;
> +	} else if (lcdb->sc_count > LCDB_SC_CNT_MAX) {
> +		dev_err(lcdb->dev, "persistent short circuit, keeping the outputs off\n");
> +		lcdb->sc_disabled = true;
> +		return true;
> +	}
> +
> +	lcdb->sc_count++;
> +	lcdb->sc_time = ktime_get();


GPT:

The commit message says to restart up to ten times within one second,
but sc_time is updated on every fault.

Konrad

> +
> +	if (qcom_lcdb_module_enable(lcdb)) {
> +		dev_err(lcdb->dev, "failed to recover from a short circuit\n");
> +		lcdb->sc_disabled = true;
> +		return true;
> +	}
> +
> +	return false;
> +}
> +
> +static irqreturn_t qcom_lcdb_sc_irq(int irq, void *data)
> +{
> +	struct qcom_lcdb *lcdb = data;
> +	unsigned int val;
> +	int ret, i;
> +
> +	ret = regmap_read(lcdb->regmap, lcdb->base + LCDB_INT_RT_STS, &val);
> +	if (ret || !(val & LCDB_SC_ERROR_RT_STS))
> +		return IRQ_HANDLED;
> +
> +	/* Blanking time, a real short circuit is still reported afterwards */
> +	usleep_range(2000, 2100);
> +
> +	ret = regmap_read(lcdb->regmap, lcdb->base + LCDB_INT_RT_STS, &val);
> +	if (ret || !(val & LCDB_SC_ERROR_RT_STS))
> +		return IRQ_HANDLED;
> +
> +	if (qcom_lcdb_handle_sc(lcdb)) {
> +		for (i = 0; i < LCDB_NUM_RAILS; i++)
> +			regulator_notifier_call_chain(lcdb->rdev[i],
> +						      REGULATOR_EVENT_FAIL, NULL);
> +	}
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static int qcom_lcdb_hw_init(struct qcom_lcdb *lcdb)
> +{
> +	unsigned int val;
> +	int ret, i;
> +
> +	for (i = 0; i < LCDB_NUM_RAILS; i++) {
> +		ret = regmap_read(lcdb->regmap, lcdb->base + qcom_lcdb_vreg[i], &val);
> +		if (ret)
> +			return ret;
> +
> +		lcdb->uV[i] = qcom_lcdb_sel_to_uV(val & LCDB_OUTPUT_VOLTAGE_MASK);
> +	}
> +
> +	ret = regmap_read(lcdb->regmap, lcdb->base + LCDB_ENABLE_CTL1, &val);
> +	if (ret)
> +		return ret;
> +
> +	if (val & LCDB_MODULE_EN) {
> +		lcdb->enabled_mask = GENMASK(LCDB_NUM_RAILS - 1, 0);
> +		return 0;
> +	}
> +
> +	return regmap_set_bits(lcdb->regmap, lcdb->base + LCDB_MODULE_RDY,
> +			       LCDB_MODULE_RDY_BIT);
> +}
> +
> +static int qcom_lcdb_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct regulator_config cfg = {};
> +	struct qcom_lcdb *lcdb;
> +	int irq, ret, i;
> +
> +	lcdb = devm_kzalloc(dev, sizeof(*lcdb), GFP_KERNEL);
> +	if (!lcdb)
> +		return -ENOMEM;
> +
> +	lcdb->dev = dev;
> +
> +	lcdb->regmap = dev_get_regmap(dev->parent, NULL);
> +	if (!lcdb->regmap)
> +		return dev_err_probe(dev, -ENODEV, "failed to get the parent regmap\n");
> +
> +	ret = device_property_read_u32(dev, "reg", &lcdb->base);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to get the base address\n");
> +
> +	ret = devm_mutex_init(dev, &lcdb->lock);
> +	if (ret)
> +		return ret;
> +
> +	ret = qcom_lcdb_hw_init(lcdb);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to read the initial state\n");
> +
> +	cfg.dev = dev;
> +	cfg.regmap = lcdb->regmap;
> +	cfg.driver_data = lcdb;
> +
> +	for (i = 0; i < LCDB_NUM_RAILS; i++) {
> +		lcdb->rdev[i] = devm_regulator_register(dev, &qcom_lcdb_descs[i], &cfg);
> +		if (IS_ERR(lcdb->rdev[i]))
> +			return dev_err_probe(dev, PTR_ERR(lcdb->rdev[i]),
> +					     "failed to register %s\n",
> +					     qcom_lcdb_descs[i].name);
> +	}
> +
> +	irq = platform_get_irq(pdev, 0);
> +	if (irq < 0)
> +		return irq;
> +
> +	return devm_request_threaded_irq(dev, irq, NULL, qcom_lcdb_sc_irq,
> +					 IRQF_ONESHOT, "lcdb-sc", lcdb);
> +}
> +
> +static const struct of_device_id qcom_lcdb_match[] = {
> +	{ .compatible = "qcom,pm8150l-lcdb" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, qcom_lcdb_match);
> +
> +static struct platform_driver qcom_lcdb_driver = {
> +	.driver = {
> +		.name = "qcom-lcdb-regulator",
> +		.of_match_table = qcom_lcdb_match,
> +	},
> +	.probe = qcom_lcdb_probe,
> +};
> +module_platform_driver(qcom_lcdb_driver);
> +
> +MODULE_DESCRIPTION("Qualcomm LCDB (LCD bias) regulator driver");
> +MODULE_LICENSE("GPL");
> 
