Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1081872618
	for <devicetree@vger.kernel.org>; Sat, 18 Jul 2026 23:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784415939; cv=none; b=GJrDgL4M67rOUOD4dCCPvTlhhOav04eoVkxLDyrJHn2M3Wym35WOO0e5ElTRrmkrZjJDkEKYye9Y6XdUSyGzmRk48WNOliDN+ToORPGIZjqUC3RvSCkzSDeYE3OuSpw245SBm0VlEssfuKyy6mOTN2s9hexnHRqsgK2hSm24/As=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784415939; c=relaxed/simple;
	bh=hCFXzP+nMYm/qof+IV0EHWabuZV1NjhWN6zmAK1t5P8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TqE7rFo/Zy+8MXxpN1rvgxqMpietwqEv0rpFAJUNDpP48qJXr0MgO/ty46oVfWtKBy1gMf9hUyotg0pXzReynzPxuLJuHPPAho0YxBbGxe3IzNNXpZ3vEB0jCjztH2UtHZEnQYx7sIU50K4UaVcerqYT/+QHnexVsmJ0RW9ev3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VkVhlDeG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LEadsGuS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VkVhlDeG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LEadsGuS"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66IN2BLC3059381
	for <devicetree@vger.kernel.org>; Sat, 18 Jul 2026 23:05:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wRKQ5pXg21yJ1hMXPtAg7ySESJu3pGjBMk8RjKfSal4=; b=VkVhlDeGpcdFWlss
	2oXUfvMitNlPdnS1Pj91E4hyDSnKRaiYg+cLbMxRvxJfMLZQ3RXoTTXbtBTLusNl
	+oVHq2apfKNrOZx6O7nVjVWAk29DfkcuyaOt34mjH78AOK+rDO6DVjFdigT3s85J
	2Q3E1sYU8lnHHJi4l+Y3pmivxTI5/UA6Nqo7+GRvS+IO4bR78AoNeXArYesx8HcI
	0HTXeghec/8zj+1ypld+8tgPQeTINaMMYu7xelGJkvIffowcmiT2rtBzPENlLrXL
	StjzqeGoyhtWltXJMBLwf28vTnVyLz16SkZfeagpNdpA34/VR+5/fGveJKSbNcjM
	2aD3gw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fg2aasq12-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 18 Jul 2026 23:05:37 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8484f26852dso5508814b3a.1
        for <devicetree@vger.kernel.org>; Sat, 18 Jul 2026 16:05:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784415936; x=1785020736; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wRKQ5pXg21yJ1hMXPtAg7ySESJu3pGjBMk8RjKfSal4=;
        b=LEadsGuSxRnMyzpputtWfImYw/FeHkoFdJZcmNLL6KJWL2yj93ia4GZReF1eGusspR
         7WwIyiT2lx8cyzXhkJcOQ9oqEvcJ/QOG6uVya+POxrjOy0Q/uLLfBjNGZpe2ATRAlc/l
         3K1llee3PWaWhoKK4uk/1CE25hkaGLB1xc/KWVmR0Dp3nQO74Uaii8rN6NCxunmEPoHn
         eAzH+A5t319jaKN68ocLdDyGaRbQyual/ik6RzMK6F3SKIndWzFWOi1Goh7IIx5glIU2
         xwDEjHO13PW3e8EwIid++XCZyU71miICzB4lB3tn6JaSe3Y/HcJYJg3zB+ufw4HtImUe
         xkvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784415936; x=1785020736;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wRKQ5pXg21yJ1hMXPtAg7ySESJu3pGjBMk8RjKfSal4=;
        b=iRKiNon6HWZIQgMfN+K22W4XWf2j3FpNDb7f4Yzc0Ztz9yRGtb/MXtZ7WpEYOJFPPJ
         cnsgCwSkYPYAzl0vva8n9AVWgAEfu1LLFrALCfNp/ojh3TGbbaGgaOVC/9IMvROVA4qV
         CFNB3Q2qHvcigOdOCiD9LYc05pbFvgettHDj7QeAGIbRyBTNbMfMLqpPxT+xItr7QJ0v
         hfamVdB1IgHhQxJZdANCTR3YfawCOidVkPverTjixAoFNuehHHXri5dFo9xWbuaRQFFy
         wX0d4JvmQGD5mEqGusQAYqmboUVWmVvfXd1YUyzRBx9O2p/4h8dDLJ/xlHTV/SsqboEX
         3aXQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq77tPmZaDvzFrX4wC/LW+3p2F+A7hGWA63CiIRqRilCdyJSS+bFVuqZflziP5Wt9KgFSXmFbGO4eJ8@vger.kernel.org
X-Gm-Message-State: AOJu0YxJWb7wiTuXdHzQf73X4KHWrN7jTTHBFm+Ul3ZYLbvLEPoHOP/K
	K3xrfQqG0VBIq/V+TMw7KT3pwoErrlJARmDWtxWFaTxOYGCRA6IIRQJ4C+WpOwFDIbzpwOT03fH
	lTSwm3Jcz+gfNzlVLyvU3DoBTUd2nCkd/h1gMbSTVT79CVTa2uoH3rEjWJdZTWci/
X-Gm-Gg: AfdE7cklqGkVYJwCvhR1A9exfGI1fIAbN/PK3iwW5Q63eHIziJ3rOvwBhqPS0fC9Zap
	9fYzxaFjHUsq1KE+WP98Hyy6Wp2JEFFEBsgoyQBMeIJKwWATOxFa6Qu1P9nIPogBDN3sC5QBh4M
	boPNDcgyz9nSRz0r/yGUf0ZKPMYtrRB8Co62Gqh/cRIOwDIupZQxmiHUZDmlCO6ye2BkPlPVkko
	YymCJV0TTrregbVNtXGrSi0HGhJGRdZO/bkNphf3B4b/q6H1gmVqe0rq7D0GSyQZk7nQlLuQY/a
	hP+k8i8ZyPooD2Tcy2D8s7QfxWJ88w8eckmAUuUP7O2t2wog79ZjM1TRJFMUoxUqiY9E0mUvTNn
	ADxQLT8QSN9Nan94Q
X-Received: by 2002:a05:6a00:e19:b0:847:8dec:1427 with SMTP id d2e1a72fcca58-84c29263726mr8487412b3a.8.1784415936257;
        Sat, 18 Jul 2026 16:05:36 -0700 (PDT)
X-Received: by 2002:a05:6a00:e19:b0:847:8dec:1427 with SMTP id d2e1a72fcca58-84c29263726mr8487393b3a.8.1784415935798;
        Sat, 18 Jul 2026 16:05:35 -0700 (PDT)
Received: from jic23-huawei ([50.35.46.84])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84c2adfdfd0sm3352876b3a.25.2026.07.18.16.05.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 16:05:35 -0700 (PDT)
Date: Sun, 19 Jul 2026 00:05:30 +0100
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Chris Morgan <macroalpha82@gmail.com>
Cc: linux-iio@vger.kernel.org, andy@kernel.org, nuno.sa@analog.com,
        dlechner@baylibre.com, jean-baptiste.maneyrol@tdk.com,
        linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
        heiko@sntech.de, conor+dt@kernel.org, krzk+dt@kernel.org,
        robh@kernel.org, andriy.shevchenko@intel.com,
        Chris Morgan <macromorgan@hotmail.com>
Subject: Re: [PATCH V17 3/9] iio: imu: inv_icm42607: Add inv_icm42607 Core
 Driver
Message-ID: <20260719000530.62bad145@jic23-huawei>
In-Reply-To: <20260716182637.24310-4-macroalpha82@gmail.com>
References: <20260716182637.24310-1-macroalpha82@gmail.com>
	<20260716182637.24310-4-macroalpha82@gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: agCLU12ShflEULi0iryHBzqJDdZFiEzs
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE4MDI0MiBTYWx0ZWRfX7zX9vCnFugYs
 0j45GspU1hvBAks0KY+9PgqPCs2cUxDue6nwvmmAQSt5Jwz6ZpUjcHBDD6lX5Cpz4wmWWfcgknZ
 p0KHbeuZ9Lf1mDJHF/hF3DHO0iRWGhQ=
X-Authority-Analysis: v=2.4 cv=b9aCJNGx c=1 sm=1 tr=0 ts=6a5c06c1 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=qC1CW/w66vtJz1P9yTJxNA==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=pGLkceISAAAA:8 a=69EAbJreAAAA:8 a=QyXUC8HyAAAA:8 a=K7FbP7-zQIep73dBFt4A:9
 a=CjuIK1q_8ugA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: agCLU12ShflEULi0iryHBzqJDdZFiEzs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE4MDI0MiBTYWx0ZWRfXysGMOSdqVbZI
 ALk6XyFD8dkBq0pQW2A2Mr2QFy0Q29UjrsyZoAI3OBamAdwxxP5cCmD6G6pFeJ+DIdoqHV8RZzB
 onWaRw4fTUiVuTGCgZpDHB+vJrX4Fu/PBfxiZhNhiAAYI34jwGtoketl1UCnw1a0iNf/vhUxrOJ
 6FYVrCAPLk2uwyMAwUr6irMKVYdeDNjcll5eLBsZJPJegQjgJ6XMK9djdCNN48ObKm9opNszzKd
 8I0GJVOO14oJPmA+EXU7APKpZTrkeeQ+NHQPIWS6svnCEjkN3CV4TvBX5MYl6ySHs/Jp2l5/tmJ
 abT3/m3s9XUaukBQ0JcRROmOk/pLHfAMOxjhQ51DS1GjhNQRczRekEVinM+JwjF5V6xRywOrBTJ
 nHGdHUl4kAoEZrNc3N0WQ8TKttAtrQd4JgfqHAfzUSO2chnbYczXEkbkcRf/DeP3j1S7dOvMbvo
 9UVCOK6ULh1yEGMkjmA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-18_07,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 adultscore=0 malwarescore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607180242

On Thu, 16 Jul 2026 13:26:30 -0500
Chris Morgan <macroalpha82@gmail.com> wrote:

> From: Chris Morgan <macromorgan@hotmail.com>
> 
> Add the core component of a new inv_icm42607 driver. This includes
> a few setup functions and the full register definition in the
> header file, as well as the bits necessary to compile and probe the
> device when used on an i2c bus.
> 
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

Hi Chris,

Just one small thing below given you are probably going to do
a v18.  If it had just been this I might have tweaked it whilst
applying

Thanks,

Jonathan


> diff --git a/drivers/iio/imu/inv_icm42607/inv_icm42607_i2c.c b/drivers/iio/imu/inv_icm42607/inv_icm42607_i2c.c
> new file mode 100644
> index 000000000000..8f74bf38aad1
> --- /dev/null
> +++ b/drivers/iio/imu/inv_icm42607/inv_icm42607_i2c.c

...

> +static int inv_icm42607_probe(struct i2c_client *client)
> +{
> +	struct device *dev = &client->dev;
> +	const struct inv_icm42607_hw *hw;
> +	struct regmap *regmap;
> +
> +	hw = i2c_get_match_data(client);
> +	if (!hw)
> +		return dev_err_probe(dev, -ENODEV, "Failed to get i2c data\n");
> +
> +	regmap = devm_regmap_init_i2c(client, &inv_icm42607_regmap_config);
> +	if (IS_ERR(regmap))
> +		return dev_err_probe(dev, PTR_ERR(regmap),
> +				     "Failed to register i2c regmap\n");
> +
> +	return inv_icm42607_core_probe(regmap, hw, inv_icm42607_i2c_bus_setup);
> +}
> +
> +static const struct i2c_device_id inv_icm42607_id[] = {
> +	{
> +		.name = "icm42607",
> +		.driver_data = (kernel_ulong_t)&inv_icm42607_hw_data,
> +	}, {
> +		.name = "icm42607p",
> +		.driver_data = (kernel_ulong_t)&inv_icm42607p_hw_data,
> +	},
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(i2c, inv_icm42607_id);
> +
> +static const struct of_device_id inv_icm42607_of_matches[] = {
> +	{
> +		.compatible = "invensense,icm42607",

I'd expect to see the data here as well.  Look at implementation of i2c_get_match_data()
and consider what would happen if there was a slightly mismatch between which devices
were listed in each table.  To avoid that fragility we normally just put
the data pointers in both places.

> +	}, {
> +		.compatible = "invensense,icm42607p",
> +	},
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, inv_icm42607_of_matches);


