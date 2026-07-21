Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4F0137FF49
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 11:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784633406; cv=none; b=HsPhr36TQEjwdZilRFZ32RaRemm5HkOXsb6LcNpTJDqgDa8ptg6Ip9qC4Oe21j/Na33+RfNEr29ns5PSnm1pNQo/IBJuJEAemrLF7LI9yUjOB95fzWUAG/tZnlg+fE3/3W/MHrUirTj5UUcVjgaF4dXO/5ROZ0lD40CjLDeQxtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784633406; c=relaxed/simple;
	bh=ai6jPq8Wtn1ummFuqvNnpq2EI6Wg3aANfgCXYu780eY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NJXIaN9rNxgjOYNaA/yKfrRMOaAOLGE1g5r/YBpU5LuiYIPLTA2D4V2Qv9twLQBD58whFlJuAKJZ+I3CEaqiN8dUtdII+6j5sAIaNz0k6HagHUHqMQJhqiGh+qRHVe0QGXsujQJwGe1yY2FjF2ktOAtacNrJuQaNo2YpQnApuQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rvUZdufz; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rvUZdufz"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5aeb99bc721so1215058e87.1
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 04:30:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784633403; x=1785238203; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hJp9wJTddQB51y4t9E/fwU9/+8UJoIvDaCNcWbFBtuY=;
        b=rvUZdufzCnuIgu2LMg6/u+UjJEBnKy8jo+JLIDwBkpq2iVyYp2lTqW5pK23pIC3TUw
         tzZ41ues4oy71bdW+urIcdLSY5dIAnAC1bs9Q6VPGy6qb6eOcdMCtsV05loOSe8VwYNq
         xOgpx14f2M/rvoIiaiLb46KqratKjAalUAHJFCmB5Y+kshJc3wZfuxmv0j9/heD4DlfJ
         uOXmOCaZaSJmZN0N0UD2RFId06gWdE/enk0L/HYrdqzZO14udzrn2S+qsYA1YUzfU7jK
         FZmYPUcPApBSwdYYTlZ0Izey8a1F7bTukBlqq7O1nq8yaYz+4FcNc4w3s2oMumi7d3+6
         VXfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784633403; x=1785238203;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hJp9wJTddQB51y4t9E/fwU9/+8UJoIvDaCNcWbFBtuY=;
        b=hhoQOeSccA1rtid5cMj2EXhNkj1r1evXdHOFcIMxuVUYApo+lWAi+mnVs/7OZb4LDL
         50PZvMZSh/pu7ekesfbMhR2NWI+wBMmGbWorU4n/LzIJkqfLJUGcmbgEHjW95bWzlaMc
         uJarWssgxOgYQxZhFqhY7Vefeyru0iP/OVT0IGWOafMRNjGHguUXJLttA0irdFqrBFba
         IZ6yxTDCXGEOS8lx0mpB1J3JLs0h/N23M7bbITPx3oAFq53ezVTFEMO9x/kAA1//rz9W
         +PsgLIoVMxIWa9EAJoASuzn2ccXM1Pgdai2kTtywhETca9FcQfc+wpOGvRQIGNwNDY2r
         AEaw==
X-Forwarded-Encrypted: i=1; AHgh+RpAQoxWUyf8YfVfecIUI9PTnWygaTD4ly6nSb11U7/XUffvrznCyzMKbS+q8TaqlRkWcc/FPXWfWtJM@vger.kernel.org
X-Gm-Message-State: AOJu0YxoCWYdFOBlUZxoRr7UkQ2tGqi84y9bWPZAfS2/cUDH/l5wJhLd
	j+dKwUmFNSuixjX/o9/3KtAuv7yu/ejYy0eAIAFFx7pyEGED6A/r7uKqswEsoqffVcE=
X-Gm-Gg: AR+sD11HzwzXyoj8sz0t8hXgsxOCPP4l5Zr+gaGdSCFHpvVofviRKaJa16YHxiA3ybh
	I4HzAMbH+9ysY4c9JHkxk52hZP/FJ39U8MQszdJnEYBcE5No3JPrz6Rf6x8Mu/cGboBEBeW5IFO
	gkFYRauEJts2CKbsdmy1LO1RPlzv9SqvEQOA0HFzwS+7sAZEnW9o5rlhS+fWpCsrYZb2FbDhhgN
	1cUfrXGwYZJaMrmGXjTw6dZ6a9BoNRtBOkKeyF3PorHvVLXKhJl5KXb3uQGQtPgHse3Hggev2tE
	xxsDX6XWSmBvI8z5Dws2wUHngQpAF5ghFvzLqHBLf1Fk9j/SWQvKMevVtY9HRctdRXNFgaEYCfB
	u95hifOcTESiiULud49DOA/LkN0z9st4coFSyNMxNwp9CG2SKOpElTHfeB7GBHktI0b5ybksJGT
	Wyz5NwxQZQHzaZdcm0J4VVeGx+GkLk2XU3zsuGBZxXQCL10bOe1xWf+XERNqgQKobylEo=
X-Received: by 2002:a05:6512:39c1:b0:5b0:2ba4:542d with SMTP id 2adb3069b0e04-5b2a4a79881mr367879e87.3.1784633402587;
        Tue, 21 Jul 2026 04:30:02 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b291d0fdd6sm2868216e87.0.2026.07.21.04.30.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 04:30:02 -0700 (PDT)
Message-ID: <ce8538e1-3755-461c-b699-87d570436122@linaro.org>
Date: Tue, 21 Jul 2026 14:30:01 +0300
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 2/2] phy: qcom-mipi-csi2: Add a CSI2 MIPI DPHY driver
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: Bryan O'Donoghue <bod@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260720-x1e-csi2-phy-v13-0-160c31958863@linaro.org>
 <20260720-x1e-csi2-phy-v13-2-160c31958863@linaro.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260720-x1e-csi2-phy-v13-2-160c31958863@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/20/26 04:11, Bryan O'Donoghue wrote:
> Add a new MIPI CSI2 driver in DPHY mode initially. The entire set of
> existing CAMSS CSI PHY init sequences are imported in order to save time
> and effort in later patches.
> 
> The following devices are supported in this drop:
> "qcom,x1e80100-csi2-phy"
> 
> In-line with other PHY drivers the process node is included in the name.
> Data-lane and clock lane positioning and polarity selection via newly
> amended struct phy_configure_opts_mipi_dphy{} is supported.
> 
> The Qualcomm 3PH class of PHYs can do both DPHY and CPHY mode. For now only
> DPHY is supported.
> 
> In porting some of the logic over from camss-csiphy*.c to here its also
> possible to rationalise some of the code.
> 
> In particular use of regulator_bulk and clk_bulk as well as dropping the
> seemingly useless and unused interrupt handler.
> 
> The PHY sequences and a lot of the logic that goes with them are well
> proven in CAMSS and mature so the main thing to watch out for here is how
> to get the right sequencing of regulators, clocks and register-writes.
> 
> The register init sequence table is imported verbatim from the existing
> CAMSS csiphy driver. A follow-up series will rework the table to extract
> the repetitive per-lane pattern into a loop.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---

<snip>

> diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h b/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h
> new file mode 100644
> index 0000000000000..7e55ae0073704
> --- /dev/null
> +++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h
> @@ -0,0 +1,97 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + *
> + * Qualcomm MIPI CSI2 CPHY/DPHY driver
> + *
> + * Copyright (C) 2025 Linaro Ltd.
> + */
> +#ifndef __PHY_QCOM_MIPI_CSI2_H__
> +#define __PHY_QCOM_MIPI_CSI2_H__
> +
> +#include <linux/phy/phy.h>
> +
> +#define CSI2_MAX_DATA_LANES	4
> +#define CSI2_DEFAULT_CLK_LANE	7

There is no 7 lanes on CSIPHY, this value is bogus, also it was reported
previously.

The 'data-lanes' handling is broken in this version of the driver, since
it does not follow the description from included video-interfaces.yaml.

> +
> +struct mipi_csi2phy_lane {
> +	u8 pos;
> +	u8 pol;
> +};
> +
> +struct mipi_csi2phy_lanes_cfg {
> +	struct mipi_csi2phy_lane data[CSI2_MAX_DATA_LANES];
> +	struct mipi_csi2phy_lane clk;
> +};
> +
> +struct mipi_csi2phy_stream_cfg {
> +	s64 link_freq;
> +	u8 num_data_lanes;
> +	struct mipi_csi2phy_lanes_cfg lane_cfg;
> +};
> +
> +struct mipi_csi2phy_device;
> +
> +struct mipi_csi2phy_hw_ops {
> +	void (*hw_version_read)(struct mipi_csi2phy_device *csi2phy_dev);
> +	void (*reset)(struct mipi_csi2phy_device *csi2phy_dev);
> +	int (*lanes_enable)(struct mipi_csi2phy_device *csi2phy_dev,
> +			    struct mipi_csi2phy_stream_cfg *cfg);
> +	void (*lanes_disable)(struct mipi_csi2phy_device *csi2phy_dev,
> +			      struct mipi_csi2phy_stream_cfg *cfg);
> +};
> +
> +struct mipi_csi2phy_lane_regs {
> +	const s32 reg_addr;
> +	const s32 reg_data;
> +	const u32 delay_us;
> +	const u32 param_type;
> +};
> +
> +struct mipi_csi2phy_device_regs {
> +	const struct mipi_csi2phy_lane_regs *init_seq;
> +	const int lane_array_size;
> +	const u32 common_regs_offset;
> +};
> +
> +struct mipi_csi2_genpd {
> +	const char *name;
> +	bool scaled;
> +};
> +
> +struct mipi_csi2phy_soc_cfg {
> +	const struct mipi_csi2phy_hw_ops *ops;
> +	const struct mipi_csi2phy_device_regs reg_info;
> +
> +	const char ** const supply_names;
> +	const unsigned int num_supplies;
> +
> +	const char ** const clk_names;
> +	const unsigned int num_clk;
> +
> +	const struct mipi_csi2_genpd *genpds;
> +	const unsigned int num_genpds;
> +};
> +
> +struct mipi_csi2phy_device {
> +	struct device *dev;
> +	u8 phy_mode;
> +
> +	struct phy *phy;
> +	void __iomem *base;
> +
> +	struct clk_bulk_data *clks;
> +	struct clk *timer_clk;
> +	u32 timer_clk_rate;
> +
> +	struct regulator_bulk_data *supplies;
> +	struct dev_pm_domain_list *pd_list;
> +
> +	const struct mipi_csi2phy_soc_cfg *soc_cfg;
> +	struct mipi_csi2phy_stream_cfg stream_cfg;
> +
> +	u32 hw_version;
> +};
> +
> +extern const struct mipi_csi2phy_soc_cfg mipi_csi2_dphy_4nm_x1e;
> +
> +#endif /* __PHY_QCOM_MIPI_CSI2_H__ */
> 

-- 
Best wishes,
Vladimir
