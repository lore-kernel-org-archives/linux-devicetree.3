Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD33538D3FB
	for <devicetree@vger.kernel.org>; Mon,  1 Jun 2026 09:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780304572; cv=none; b=I5yl5U6raWPWw02W+WHYFbIK7sqilW7iX0aVcjXGJwXIgQd2LF88vBuqG0krFzwS4/EKyrFCEbi+qF7n5Gmygg9f7UKADmExsVqodBeUsF2s2IQ+I/VFm4N33UgBPk3NvOBpojmfksjFzxvOZE6UdyQ1tf5vYB2yN9x1BRqarQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780304572; c=relaxed/simple;
	bh=4dH6hzvTjnW+GZA3+yzP2/rz0qP6WSKvqY0caaPpiBo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m8lWZHjGz2Jqtr6FBJLvgQnJTsbeM1nJrufibV2v41mhQUUiyXsPRW8KZ0s275Ql4XmJ2zQMtcjoF0Cq5eq537F6Xd0vl0NZWzHNqWrIBkYv89+JBdPvll2cr1zAZANFYL0Sgkr+0SfDZhTB/Y7zSbPZL7jNKGzdr+86tCXr9Gk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O5ot2mph; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Uq+WGAsq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O5ot2mph";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Uq+WGAsq"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6518dtRM4111164
	for <devicetree@vger.kernel.org>; Mon, 1 Jun 2026 09:02:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dS24bvMnimy4PR7Q5DeqliRbUmxNl+ULW60N717m0To=; b=O5ot2mph9Ii9OZ1U
	7Oe6dbxnNSnS5PZbp5A6e6S6UUl9QIEjiYDWroUKON+hT86eUuwxgbqG20BV8Akv
	b5JcP3ZNJ2+Yb/EyNDQk4WzmmAQvFkveEHj8hxzYFWpCbCsi2jw589DNiLmAbRNi
	31277feDw4wVvRuYwZ80mewh1BUJj9qzimaW2hm7z8QzfxImfXwxJAbMTxN4VFZl
	TEx88LR41kdS7Mq9aEj3HmDbil4FoBV0I46csYbc6GcljXDsO3ipIjvY5sAm0SfT
	/3u4LE/h9YbGOKuTSOG4n7Rfk62GPkRVcJzJ4iyTq8Pf9Q1Tpf4F7Y3Tl2I8fkWy
	KqEyFA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eh6s3r3c5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 01 Jun 2026 09:02:50 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2c0a99db8dfso18600145ad.3
        for <devicetree@vger.kernel.org>; Mon, 01 Jun 2026 02:02:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780304569; x=1780909369; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dS24bvMnimy4PR7Q5DeqliRbUmxNl+ULW60N717m0To=;
        b=Uq+WGAsqFGYJ5UBBrk1wtZ6trlag+645ipIXxV7Zir8rbEir9q8JRg+boG3uO78qCD
         oO5u+SaDg0DFszmvDQ5IvCLOJrMoSlPjgZWwS/JEtckiLn12hRrXJEfbHoEfumfTDfQ5
         1EAV/vGDPNGVcXkEcn2C3gS7lnIzRMXnHd7yizRDRyE0dMO+CJVdDyMaBVQB7MSahFjC
         wIdjV7CWi1OumpGqTRkP0s4E3glXG4+RAq6zBaF1Od1tG0mzeB0E4+w56CrTfAy10hIT
         zo4GlzAAaXPjRhJIkkxmKxV34jA98ViorZ6nH9igTVly3+rDuqTWK7UiRHtifmqdGri6
         +8cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780304569; x=1780909369;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dS24bvMnimy4PR7Q5DeqliRbUmxNl+ULW60N717m0To=;
        b=qxb5mGdvUYbPgK7SIL4WPc7K7NEJYIuh/P2rYSU5+Q/3PDT4dSvLH4IQ1YJRIBBWv4
         fDAjDvsryZKZ6tG7I9/OIXjHpofMIt3+3LEDOqEo0OSf1B56oI5Zxj6GaIaygsbczEJc
         HoKmQPt22qwU0PSMYCtOR+n13zVhVMn1Mr3c2jv1LUcbPzqH0C+agUFev4YuRpafFwGr
         Dpfrn8oAC1uNZkFKPUUa+sSCPJ0XPlZ/uREr7AwH9Wd00Vz5R4dBRHc8hrem4PKvnJOH
         sZWu0cBfLjkNbKtDYf26BffW5mOCmeMKJK15CAug7cm6NS3ZaA9AuzME/6IR1L1zidku
         zllA==
X-Gm-Message-State: AOJu0YyvK5K7dYGIyOjaFPcUViENjmb+ur9yqJuX6OzL+qfbCmkdvH2v
	OsElsluuypc2x14S6Fsf52C9TWQzFmZr6uY+6ybkuaDmGMVv/st6riWomG1TfjCrKag5GWsrcii
	qHxGt12Fkkr7RUlCwi5IjiMSIjOogs7SF+1CmmzTMJo/fJfIIC7eqeKdgQd1Ho6m1
X-Gm-Gg: Acq92OGM37iC6U7bqp9SF6fW/+DkFlpzN5cLixi6xM0B6e6RcAP6qLIUhA7XJQqligb
	tWvTCpPv6C4gvao1zN/IG+DI62MuejCrFiqWIrXD+d4r6W9xgp9sxZYHv/acKqpt8blVDcAG6Bp
	NCFbUsR6LlWhckvo2os4EUZhxVuRWbi2uuI0NJPT+9cnivMa4IcnSmBLSerPfLvkfjCKRUE9GOC
	Xrp9Cqhw+sK+cnWvX3yzLtjyTf1+qgellZpbuzMCtspdT4NDxQGNzEdQwXqfPHMu23gyIoN54LE
	VXuHXNiSKE++agO2dwzimlUlpCIwzYL02j2pQEuANUSAmI2vckGB/OiXsJL4qHHfu5Ddq5c3CnX
	2ZzmudPKCq1zWbhZPJvYFvaPz8X8J3WM/rkm17Vlniv1OYvbd9h2okeQQTngsMJl+4Q8Ikc5mDS
	uThW8njpsGVAuSd1XK30J7
X-Received: by 2002:a17:903:3585:b0:2bd:ba75:81c4 with SMTP id d9443c01a7336-2bf367cbd56mr111929655ad.13.1780304569356;
        Mon, 01 Jun 2026 02:02:49 -0700 (PDT)
X-Received: by 2002:a17:903:3585:b0:2bd:ba75:81c4 with SMTP id d9443c01a7336-2bf367cbd56mr111929095ad.13.1780304568792;
        Mon, 01 Jun 2026 02:02:48 -0700 (PDT)
Received: from [10.133.33.9] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf23b011f7sm130112305ad.41.2026.06.01.02.02.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Jun 2026 02:02:48 -0700 (PDT)
Message-ID: <e0a89628-84ef-4299-b25c-9d4d3c5c7b85@oss.qualcomm.com>
Date: Mon, 1 Jun 2026 17:02:46 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/7] clk: qcom: Add generic clkref_en support
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
References: <20260527-tcsr_qref_0527-v4-2-ded83866c9d9@oss.qualcomm.com>
 <20260528030538.F0FB31F00A3D@smtp.kernel.org>
Content-Language: en-US
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
In-Reply-To: <20260528030538.F0FB31F00A3D@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=AP3YypGC c=1 sm=1 tr=0 ts=6a1d4aba cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=RwAibasCBCaYvBehKCwA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDA5MCBTYWx0ZWRfX+PR8UH4LgFb8
 /045xflaBP9/KQaKhPhFi/jXgHA8SDo6n5YWQWVX1R5kswBWJxXhjYEI2pfxGwbuTOPAPIa3FKy
 dgv3FIjSpK19fRViZSXg9jt0YyfKZi4Oj51m66t29YS5UR3ds3jRHbgz6O9MJUKBeV+zu/BIgY4
 zD0xUKoK28WOHz7BRtrzOIGPACuNxIM4RreaHLVFchfDYu0mMG9XuFyd2on4VgV2wlBlgydbg57
 zBJVmeRD78P6ckC4Ds7MvIXwr7BndIwX4OHQzbyRqHcWX05Cfa1o5cW6Wg8Vh/LkU/EsWsCNs5I
 +oSfLxAd33Y9B5R898/43CkSiACg5PzzbiIA+xS0GkrLlEZtD+85tIPw1JOFEX7jcuzNSwM229g
 xiQrdEahTU8KBfKp9M32p0YbhDSjRZzyRL144mw1k3U3PjKIzT35bYPu/ZWzccu7tFOkG2yjLcc
 tDKzuHd3viPpzhXTjpA==
X-Proofpoint-GUID: UDR4lHND8cuZUYbZrZdlFEv1s2Te8K71
X-Proofpoint-ORIG-GUID: UDR4lHND8cuZUYbZrZdlFEv1s2Te8K71
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 suspectscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606010090


On 5/28/2026 11:05 AM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> - [High] Unbalanced regulator disable during late init for clocks left enabled by the bootloader.
> - [Medium] Hardcoded resource mapping and OF provider registration prevent API reuse in multi-functional drivers.
> - [Medium] `qcom_clk_ref_is_enabled` returns a negative error code on failure, which CCF interprets as true.
> --
>
> commit 958034c0adafc3f72b4d7e46df81935d74404f7a
> Author: Qiang Yu <qiang.yu@oss.qualcomm.com>
>
> clk: qcom: Add generic clkref_en support
>
> This commit introduces a new clk_ref clock type with custom clk_ops for
> QREF blocks. It provides a common registration and probe API intended to
> be reused across different placements like TCSR and TLMM.
>
>> diff --git a/drivers/clk/qcom/clk-ref.c b/drivers/clk/qcom/clk-ref.c
>> new file mode 100644
>> index 0000000000000..213c0f58bb36e
>> --- /dev/null
>> +++ b/drivers/clk/qcom/clk-ref.c
> [ ... ]
>
>> +static void qcom_clk_ref_unprepare(struct clk_hw *hw)
>> +{
>> +	struct qcom_clk_ref *rclk = to_qcom_clk_ref(hw);
>> +
>> +	if (rclk->desc.num_regulators)
>> +		regulator_bulk_disable(rclk->desc.num_regulators, rclk->regulators);
>> +}
> [Severity: High]
> If the bootloader leaves this clock enabled, the common clock framework
> will call unprepare() during late init to turn off unused clocks. Since
> prepare() was never called by the kernel, won't this
> regulator_bulk_disable() call trigger an unbalanced disable warning and
> permanently leak power?
>
> Does the driver need to sync the hardware state during probe by enabling
> the regulators if the clock is already on?
clk_unprepare_unused_subtree() calls unprepare() only when
clk_core_is_prepared() returns true. Since our driver has no .is_prepared
op, the framework falls back to checking core->prepare_count, which is 0
if the kernel never called prepare(). So unprepare() will not be called in
that path, and the regulator imbalance you describe cannot happen via the
unused clock cleanup.

- Qiang Yu
>
> [ ... ]
>
>> +static int qcom_clk_ref_is_enabled(struct clk_hw *hw)
>> +{
>> +	struct qcom_clk_ref *rclk = to_qcom_clk_ref(hw);
>> +	u32 val;
>> +	int ret;
>> +
>> +	ret = regmap_read(rclk->regmap, rclk->desc.offset, &val);
>> +	if (ret)
>> +		return ret;
> [Severity: Medium]
> If regmap_read() fails, this returns a negative error code (e.g., -EINVAL).
> Since the common clock framework evaluates the is_enabled callback as a
> boolean, won't it treat this negative error code as true and incorrectly
> assume the clock is enabled?
>
>> +
>> +	return !!(val & QCOM_CLK_REF_EN_MASK);
>> +}
> [ ... ]
>
>> +int qcom_clk_ref_probe(struct platform_device *pdev,
>> +		       const struct regmap_config *config,
>> +		       const struct qcom_clk_ref_desc *descs,
>> +		       size_t num_clk_refs)
>> +{
>> +	struct qcom_clk_ref_provider *provider;
>> +	struct device *dev = &pdev->dev;
>> +	struct regmap *regmap;
>> +	void __iomem *base;
>> +	int ret;
>> +
>> +	base = devm_platform_ioremap_resource(pdev, 0);
>> +	if (IS_ERR(base))
>> +		return PTR_ERR(base);
> [Severity: Medium]
> The commit message mentions reusing this model for blocks like TLMM on SM8750.
> If a multi-functional driver like TLMM tries to use this helper, won't
> devm_platform_ioremap_resource() fail with -EBUSY because the parent driver
> already maps the register region?
>
> Since qcom_clk_ref_register() is static and callers are forced to use
> qcom_clk_ref_probe(), does this hardcoded resource mapping prevent the
> intended integration with multi-functional drivers?
>
