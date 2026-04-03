Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0ADB314A9F
	for <devicetree@vger.kernel.org>; Fri,  3 Apr 2026 14:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775226892; cv=none; b=SnnKcNmmwdlWMLklxtouZgCJXls/EB/awYT2ElTSZ7hEUw6Qu76u/ASlAcE9LauMiz0SQ1nlkxNr1nisdHGgp3BjZcR8O3+i/6gaw3R8RRxXfls0AG5/0DrrvPzpRuZHp6poPv4Oo0M0ijsazbwTyrtR/3dvM+MNQ7QYYYNFu3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775226892; c=relaxed/simple;
	bh=7lETszO2TcBPuE8qBti4VGMJRow2riST5KFUx5uY85M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZLcVNeswdDofw4AZjDswhN/4QIFFA1sd+WXNuAJk1KmGv4qXsL0YiyZrqa395/kB5fyoGlqdWcmCR7hVXvoi50dX36lm3wp+//zbuhElMOCWH+H5pmP3ZZifzD5nKTVYfHmRgMXFh0TtKw2y64H/OA8dWa9casHu0ErDiFthHV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=D7Iof4QS; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=TDiDcLdV; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="D7Iof4QS";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="TDiDcLdV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1775226890;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mfQkfXvruFLjBEtgSvUk56xdMUuIiWCjbR168BWqGQ8=;
	b=D7Iof4QSGB7/9ujh+BlN8QvksJjnm+7G2LXBpb7N199liZq+oM7URmLxQfLYUTcQROFR8j
	QGhEWm53bn6p/6M8OlK+M9OExui1qgMM8OSI7D3axvtj42KXEmSw6XKfnqJNetEomC4Lg7
	VCSR9MFqeC+gxVe1wajeZIN/EPYD1bM=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-114-TOIWxADgM5CGMUGSamyiVw-1; Fri, 03 Apr 2026 10:34:48 -0400
X-MC-Unique: TOIWxADgM5CGMUGSamyiVw-1
X-Mimecast-MFC-AGG-ID: TOIWxADgM5CGMUGSamyiVw_1775226888
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd7ea0bb20so499401485a.3
        for <devicetree@vger.kernel.org>; Fri, 03 Apr 2026 07:34:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1775226888; x=1775831688; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mfQkfXvruFLjBEtgSvUk56xdMUuIiWCjbR168BWqGQ8=;
        b=TDiDcLdVHmfGzVDa78w2BG3jQoQHRIJvAKrnT71S42PNb58VLmFF/V82REDAV72qyx
         PCZhe1mVYCXfwFhfipcdKHLJY7AxuqHjuhzYyAMCh/y9lXXgniqF7tzK33V2GtoYDi1X
         4EKMW4ki+EL37YuPEfPxTbSpLIWSWZ8D5luX+NAwN8QlN/3+hgOyPh8aCDdvFw3d2x5F
         gcC6byyAblJIv7m3AO+LDPDNSOHunKkxUtaLG6W5Vo1q3j0zJc9CoymoQGqZTgdJCC68
         GO49FkPBJlS44Zr/x47DcSijzFu514f9J2BQaM/o4tlulsl1w7sMmPXZXd3KmKea159A
         wlBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775226888; x=1775831688;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mfQkfXvruFLjBEtgSvUk56xdMUuIiWCjbR168BWqGQ8=;
        b=oRq7FUqtjdzPhqZ25VM6T1c/W2h7ODbjpp5gTduHcvlZr90EcHPXKnD5r1HDk4fyBi
         j5HuqOnKNmuc0DUTPXdQtXFs7uE23o8zvYmRuwJUkDB3NnIGNS+Zk8EGnEQEExqjDK2G
         KFWW8uc8KnOUcckWddzhDLyBLajBpTEIA18+AukHOIYbjm3h7yW/fsuA72iKVIHkWyf0
         BZ2rrYU6OGiBvy+w/l9flGwNmOOaEiGW5QXHwUTx8RHkVa1d5owZUEtuA2IlGF+Xm7f7
         +zIlgLOo1W19ftk3O6RfHzteO3EiENORyskhQI2BqEdEFpSDDuBd9gFd3H/AvjaVBsm9
         XNqg==
X-Forwarded-Encrypted: i=1; AJvYcCWjar4oGPGwYlOIqbIkE6+k/STKXOd1ztanwUpRip7yQciS4iey+xdLxC62LtFWNA4kKpqgxExU+ND6@vger.kernel.org
X-Gm-Message-State: AOJu0Yzqry2s5vBVQ8H55WZQJmBqFS8Y9T8fDJl8QezFowbpJZeVAovZ
	IEasJDR4B9zRnBBhQxo+eyTeOJE7w6QnDOL/lj8an2LBdsY9UZsD2JkjkOX1q9P98HRJ/1KZmYA
	TtLUoofskrWnXTlE4xk8HodMn0ZVxNjYRAC1VPYwGzeeNMCDwkMdVP+O28td8ER8=
X-Gm-Gg: ATEYQzzUnrLr7OHfKTDAlwFIpXPlU/BEmWs9aCv+SFy16CCtcYVtP7aSjLAQfYK8QGm
	mHxRN2nF9lbLcF40wH3eYK2uNFXEnqIepS4BvX361fRAqaIMmaglqHGks0+Tsh79qSBhNASryVw
	ULRDFKqzBPNxvw9xj+FmZyEwd83Y4WVtWzB6HBTqBR0VYGtEggYcLXQ1xkduA5j1ejvyLZDM2LN
	fajAVHD3WKgReVon6qx1wzzDYML4os0OZnFWlfrZYNxD6OeXDY56mZ7gPGQXeZrXnbWorLNVhio
	dP0/I1LkkO6O66RdJry4oAoquEjwdZF5dQq5zBKPMp75G8clRH9yLNi81w4T3IOsZK7W8MFmCND
	Bv7bpxGVB+HGB+0aImGRhiFyPSIVtEkLswu7itieOMFnqBz7rEs5D7VLK
X-Received: by 2002:a05:620a:4402:b0:8cf:e946:b2d4 with SMTP id af79cd13be357-8d41c2b913bmr448643185a.69.1775226888136;
        Fri, 03 Apr 2026 07:34:48 -0700 (PDT)
X-Received: by 2002:a05:620a:4402:b0:8cf:e946:b2d4 with SMTP id af79cd13be357-8d41c2b913bmr448634385a.69.1775226887456;
        Fri, 03 Apr 2026 07:34:47 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8d2a8c29f17sm456198385a.42.2026.04.03.07.34.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 07:34:46 -0700 (PDT)
Date: Fri, 3 Apr 2026 10:34:44 -0400
From: Brian Masney <bmasney@redhat.com>
To: Yu-Chun Lin <eleanor.lin@realtek.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de,
	cylee12@realtek.com, afaerber@suse.com, jyanchou@realtek.com,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-realtek-soc@lists.infradead.org, james.tai@realtek.com,
	cy.huang@realtek.com, stanley_chang@realtek.com
Subject: Re: [PATCH v6 04/10] clk: realtek: Add support for phase locked
 loops (PLLs)
Message-ID: <ac_QBGY8VxcvuVlY@redhat.com>
References: <20260402073957.2742459-1-eleanor.lin@realtek.com>
 <20260402073957.2742459-5-eleanor.lin@realtek.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260402073957.2742459-5-eleanor.lin@realtek.com>
User-Agent: Mutt/2.3.0 (2026-01-25)

Hi Cheng-Yu,

On Thu, Apr 02, 2026 at 03:39:51PM +0800, Yu-Chun Lin wrote:
> From: Cheng-Yu Lee <cylee12@realtek.com>
> 
> Provide a full set of PLL operations for programmable PLLs and a read-only
> variant for fixed or hardware-managed PLLs.
> 
> Signed-off-by: Cheng-Yu Lee <cylee12@realtek.com>
> Co-developed-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> ---
> Changes in v6:
> - Add the headers used in c file to follow the "Include What You Use" principle.
> - Move to_clk_pll() from clk-pll.h to clk-pll.c to limit its scope.
> ---
>  drivers/clk/realtek/Makefile     |   2 +
>  drivers/clk/realtek/clk-pll.c    | 164 +++++++++++++++++++++++++++++++
>  drivers/clk/realtek/clk-pll.h    |  42 ++++++++
>  drivers/clk/realtek/freq_table.c |  36 +++++++
>  drivers/clk/realtek/freq_table.h |  21 ++++
>  5 files changed, 265 insertions(+)
>  create mode 100644 drivers/clk/realtek/clk-pll.c
>  create mode 100644 drivers/clk/realtek/clk-pll.h
>  create mode 100644 drivers/clk/realtek/freq_table.c
>  create mode 100644 drivers/clk/realtek/freq_table.h
> 
> diff --git a/drivers/clk/realtek/Makefile b/drivers/clk/realtek/Makefile
> index 377ec776ee47..a89ad77993e9 100644
> --- a/drivers/clk/realtek/Makefile
> +++ b/drivers/clk/realtek/Makefile
> @@ -2,3 +2,5 @@
>  obj-$(CONFIG_RTK_CLK_COMMON) += clk-rtk.o
>  
>  clk-rtk-y += common.o
> +clk-rtk-y += clk-pll.o
> +clk-rtk-y += freq_table.o
> diff --git a/drivers/clk/realtek/clk-pll.c b/drivers/clk/realtek/clk-pll.c
> new file mode 100644
> index 000000000000..44730b22a94c
> --- /dev/null
> +++ b/drivers/clk/realtek/clk-pll.c
> @@ -0,0 +1,164 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2024 Realtek Semiconductor Corporation
> + * Author: Cheng-Yu Lee <cylee12@realtek.com>
> + */
> +
> +#include <linux/regmap.h>
> +#include "clk-pll.h"
> +
> +#define TIMEOUT 2000
> +
> +static inline struct clk_pll *to_clk_pll(struct clk_hw *hw)
> +{
> +	struct clk_regmap *clkr = to_clk_regmap(hw);
> +
> +	return container_of(clkr, struct clk_pll, clkr);
> +}
> +
> +static int wait_freq_ready(struct clk_pll *clkp)
> +{
> +	u32 pollval;
> +
> +	if (!clkp->freq_ready_valid)
> +		return 0;
> +
> +	return regmap_read_poll_timeout_atomic(clkp->clkr.regmap, clkp->freq_ready_reg, pollval,
> +						(pollval & clkp->freq_ready_mask)
> +						== clkp->freq_ready_val, 0, TIMEOUT);

I would put the "(pollval & clkp->freq_ready_mask) == clkp->freq_ready_val" on
the same line to improve readability. You can go out to 100 characters.

Also should the delay be greater than 0 to avoid tons of constant
retries?

> +}
> +
> +static bool is_power_on(struct clk_pll *clkp)
> +{
> +	u32 val;
> +
> +	if (!clkp->power_reg)
> +		return true;
> +
> +	if (regmap_read(clkp->clkr.regmap, clkp->power_reg, &val))
> +		return true;

Is the intention if there is an error, then it marks it as success?

> +
> +	return (val & clkp->power_mask) == clkp->power_val_on;
> +}
> +
> +static void clk_pll_disable(struct clk_hw *hw)
> +{
> +	struct clk_pll *clkp = to_clk_pll(hw);
> +
> +	if (!clkp->seq_power_off)
> +		return;
> +
> +	regmap_multi_reg_write(clkp->clkr.regmap, clkp->seq_power_off,
> +			       clkp->num_seq_power_off);
> +}
> +
> +static int clk_pll_is_enabled(struct clk_hw *hw)
> +{
> +	struct clk_pll *clkp = to_clk_pll(hw);
> +
> +	return is_power_on(clkp);
> +}
> +
> +static int clk_pll_determine_rate(struct clk_hw *hw,
> +				  struct clk_rate_request *req)
> +{
> +	struct clk_pll *clkp = to_clk_pll(hw);
> +	const struct freq_table *ftblv = NULL;
> +
> +	ftblv = ftbl_find_by_rate(clkp->freq_tbl, req->rate);
> +	if (!ftblv)
> +		return -EINVAL;
> +
> +	req->rate = ftblv->rate;
> +	return 0;

Add newline before return.

> +}
> +
> +static unsigned long clk_pll_recalc_rate(struct clk_hw *hw,
> +					 unsigned long parent_rate)
> +{
> +	struct clk_pll *clkp = to_clk_pll(hw);
> +	const struct freq_table *fv;
> +	u32 freq_val;
> +
> +	if (regmap_read(clkp->clkr.regmap, clkp->freq_reg, &freq_val))
> +		return 0;
> +
> +	freq_val &= clkp->freq_mask;
> +
> +	fv = ftbl_find_by_val_with_mask(clkp->freq_tbl, clkp->freq_mask,
> +					freq_val);
> +	return fv ? fv->rate : 0;

Add newline before return.

> +}
> +
> +static int clk_pll_set_rate(struct clk_hw *hw, unsigned long rate,
> +			    unsigned long parent_rate)
> +{
> +	struct clk_pll *clkp = to_clk_pll(hw);
> +	const struct freq_table *fv;
> +	int ret;
> +
> +	fv = ftbl_find_by_rate(clkp->freq_tbl, rate);
> +	if (!fv || fv->rate != rate)
> +		return -EINVAL;
> +
> +	if (clkp->seq_pre_set_freq) {
> +		ret = regmap_multi_reg_write(clkp->clkr.regmap, clkp->seq_pre_set_freq,
> +					     clkp->num_seq_pre_set_freq);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	ret = regmap_update_bits(clkp->clkr.regmap, clkp->freq_reg,
> +				 clkp->freq_mask, fv->val);
> +	if (ret)
> +		return ret;
> +
> +	if (clkp->seq_post_set_freq) {
> +		ret = regmap_multi_reg_write(clkp->clkr.regmap, clkp->seq_post_set_freq,
> +					     clkp->num_seq_post_set_freq);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	if (is_power_on(clkp)) {
> +		ret = wait_freq_ready(clkp);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int clk_pll_enable(struct clk_hw *hw)
> +{
> +	struct clk_pll *clkp = to_clk_pll(hw);
> +	int ret;
> +
> +	if (!clkp->seq_power_on)
> +		return 0;
> +
> +	if (is_power_on(clkp))
> +		return 0;
> +
> +	ret = regmap_multi_reg_write(clkp->clkr.regmap, clkp->seq_power_on,
> +				     clkp->num_seq_power_on);
> +	if (ret)
> +		return ret;
> +
> +	return wait_freq_ready(clkp);
> +}
> +
> +const struct clk_ops rtk_clk_pll_ops = {
> +	.enable         = clk_pll_enable,
> +	.disable        = clk_pll_disable,
> +	.is_enabled     = clk_pll_is_enabled,
> +	.recalc_rate    = clk_pll_recalc_rate,
> +	.determine_rate = clk_pll_determine_rate,
> +	.set_rate       = clk_pll_set_rate,
> +};
> +EXPORT_SYMBOL_NS_GPL(rtk_clk_pll_ops, "REALTEK_CLK");
> +
> +const struct clk_ops rtk_clk_pll_ro_ops = {
> +	.recalc_rate = clk_pll_recalc_rate,
> +};
> +EXPORT_SYMBOL_NS_GPL(rtk_clk_pll_ro_ops, "REALTEK_CLK");
> diff --git a/drivers/clk/realtek/clk-pll.h b/drivers/clk/realtek/clk-pll.h
> new file mode 100644
> index 000000000000..00884585a242
> --- /dev/null
> +++ b/drivers/clk/realtek/clk-pll.h
> @@ -0,0 +1,42 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (C) 2017-2019 Realtek Semiconductor Corporation
> + * Author: Cheng-Yu Lee <cylee12@realtek.com>
> + */
> +
> +#ifndef __CLK_REALTEK_CLK_PLL_H
> +#define __CLK_REALTEK_CLK_PLL_H
> +
> +#include "common.h"
> +#include "freq_table.h"
> +
> +struct reg_sequence;
> +
> +struct clk_pll {
> +	struct clk_regmap clkr;
> +	const struct reg_sequence *seq_power_on;
> +	u32 num_seq_power_on;
> +	const struct reg_sequence *seq_power_off;
> +	u32 num_seq_power_off;
> +	const struct reg_sequence *seq_pre_set_freq;
> +	u32 num_seq_pre_set_freq;
> +	const struct reg_sequence *seq_post_set_freq;
> +	u32 num_seq_post_set_freq;
> +	const struct freq_table *freq_tbl;
> +	u32 freq_reg;
> +	u32 freq_mask;
> +	u32 freq_ready_valid;
> +	u32 freq_ready_mask;
> +	u32 freq_ready_reg;
> +	u32 freq_ready_val;
> +	u32 power_reg;
> +	u32 power_mask;
> +	u32 power_val_on;
> +};
> +
> +#define __clk_pll_hw(_ptr)  __clk_regmap_hw(&(_ptr)->clkr)
> +
> +extern const struct clk_ops rtk_clk_pll_ops;
> +extern const struct clk_ops rtk_clk_pll_ro_ops;
> +
> +#endif /* __CLK_REALTEK_CLK_PLL_H */
> diff --git a/drivers/clk/realtek/freq_table.c b/drivers/clk/realtek/freq_table.c
> new file mode 100644
> index 000000000000..272a10e75a54
> --- /dev/null
> +++ b/drivers/clk/realtek/freq_table.c
> @@ -0,0 +1,36 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +
> +#include <linux/bitops.h>
> +#include "freq_table.h"
> +
> +const struct freq_table *ftbl_find_by_rate(const struct freq_table *ftbl,
> +					   unsigned long rate)
> +{
> +	unsigned long best_rate = 0;
> +	const struct freq_table *best = NULL;

Put variables in reverse Christmas tree order.

> +
> +	for (; !IS_FREQ_TABLE_END(ftbl); ftbl++) {
> +		if (ftbl->rate == rate)
> +			return ftbl;
> +
> +		if (ftbl->rate > rate)
> +			continue;
> +
> +		if (ftbl->rate > best_rate) {
> +			best_rate = ftbl->rate;
> +			best = ftbl;
> +		}
> +	}
> +
> +	return best;
> +}
> +
> +const struct freq_table *
> +ftbl_find_by_val_with_mask(const struct freq_table *ftbl, u32 mask, u32 value)
> +{
> +	for (; !IS_FREQ_TABLE_END(ftbl); ftbl++) {
> +		if ((ftbl->val & mask) == (value & mask))
> +			return ftbl;
> +	}
> +	return NULL;
> +};
> diff --git a/drivers/clk/realtek/freq_table.h b/drivers/clk/realtek/freq_table.h
> new file mode 100644
> index 000000000000..6d9116651105
> --- /dev/null
> +++ b/drivers/clk/realtek/freq_table.h
> @@ -0,0 +1,21 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +struct freq_table {
> +	u32 val;
> +	unsigned long rate;
> +};
> +
> +/* ofs check */
> +#define CLK_OFS_INVALID        -1
> +#define CLK_OFS_IS_VALID(_ofs) ((_ofs) != CLK_OFS_INVALID)

Is this used anywhere?

Brian


> +
> +#define FREQ_TABLE_END    \
> +	{                 \
> +		.rate = 0 \
> +	}
> +#define IS_FREQ_TABLE_END(_f) ((_f)->rate == 0)
> +
> +const struct freq_table *ftbl_find_by_rate(const struct freq_table *ftbl,
> +					   unsigned long rate);
> +const struct freq_table *
> +ftbl_find_by_val_with_mask(const struct freq_table *ftbl, u32 mask, u32 value);
> -- 
> 2.34.1
> 

