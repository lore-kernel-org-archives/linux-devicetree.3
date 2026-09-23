Received: from mail-dl2-f12.google.com (mail-dl2-f12.google.com [74.125.229.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83750429CFC
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 05:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790141130; cv=none; b=GCcl7GpnApObKlxUn5Bp1OKO+EgeYpEaXgSgvnIHbD2IbP8exyxlMiI7jOhhusms7G3y9Cy7JMnJk9+6Lx8PUKaeDe8nnbtMrM07m+2YLMdFuTNbVDE8QVzNjn4+KzLNdDSZwRp5cS5rs6kXg/sj07ELXW6MZBktvWlgLPkzfQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790141130; c=relaxed/simple;
	bh=I/wqOkw3aQ/Ls4RKsrHTDGcOzyOKHNIBEpq23pj3EmQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aZvVUcxrzT9isAR1tPqrThgzZxV1ghy6YN02Qx551bHCYy7u2SPPoHlL3bEHYG4ffh6yJbUt2aW+LnvDQNv1TeqTrWxdqxkVLzsrmJxJTEP/NvJGMiiMp6eJhslEBYg01RoyZ3K75uJ3DdMNX1hlHZEJeeFKMSOyruGfkR+MBC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sRoWlt+c; arc=none smtp.client-ip=74.125.229.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sRoWlt+c"
Received: by mail-dl2-f12.google.com with SMTP id a92af1059eb24-142dd025d06so441093c88.1
        for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 22:25:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790141127; x=1790745927; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+kzJR8k++x/AUghqCXqQ6tGrTm69KLHS6yLDY8MNUo4=;
        b=sRoWlt+cDUUve+36v6/RYliqoPrQ7Ms2zVTtyd2DBwKh1WXhSSXhQJxFb1WdvF/dgC
         faGTTHWniyFSzaSol5Y6JeDGz3z+Wxi38VCuBPJdqIF6mO/KaDRVOHHc9O1n5SjaADvM
         dR35fP8qpkyU3eBc0C8Fhc2IYKcLmeh5HKmtrTcTdN/V75qlJ80wmmp8U7pIYbnDTb1w
         0IH1uAZQU7jxJflijVZ8BgK9NNKsxp0nlFlUjSRbyamSA9R7kLIQGudTOpyxEWwCng/P
         RhQzv9ParDUhVuQdBARODYQxTaBtmxR3fTiDJ59fcxPnLCdB/wXRMUSTQ+PKORwhIOfv
         QSYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790141127; x=1790745927;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+kzJR8k++x/AUghqCXqQ6tGrTm69KLHS6yLDY8MNUo4=;
        b=ZA0wVEPJ9Ypuk26+NQwm2APfVqJzHfl/8FYxDhWS/0MoHD18waTgtSJUxys8hd6jHv
         G85/DX9z5+xWHZi6zIUZk3opkPDUH+5QVoYn72ysL7+7uQdK+z0z0AhFXYuN6SJBEiID
         cU5xJOD0I149tP4EcRjJbjOj00Hg/DznQiQ0a/YTwTmZI0BGJ93TGIOXggEsHkUIvxBb
         nQkc2aqqbq9/PPYSETwxdBwk7bjJN6xANb8gl0crQ0vK9CSRHG0OTLPm4VQzBVIZayVo
         E+sOD214adApX2/DdoTcTBXlg/3Up34TEy+je0aH5OSxn74wcorfFcbmD8faVU4jwMhf
         3Uiw==
X-Forwarded-Encrypted: i=1; AKwUvByYIIuYKObQkND03WE+PV8VTCwKaSHPkjWmm3uFUBZgFiqR8aQhgM5lDjUBAiI6utAknA17AewEU1n5@vger.kernel.org
X-Gm-Message-State: AFuF++nF4QzInemzhNQMDyKgyRmyveUqoxb5ajZ9fe0nBtF2aY8QW1Wx
	A6Y1EjfOiZLFB7eKu0Aw+26e0csDYkdriU9/XecdX2MjRFfOL1XTDMV5
X-Gm-Gg: AYBFou06vgNs1cbfL7y/J0IVSW43MX9kIO+C4YsFJzH75bgZlGG+VLPNObqnKAtAu1H
	9mNX8WQ5PtvcKVGG8By07OAccT7a8/1J6jUF0ZUtSEeeOul4fzl/5BuGNa1bQ7gLjNxEznW/ITv
	yuwuasDpMy5Hcu+G+6hexeqp8obvSp7ghTeYHnd103jzk7iCS3gu1H6R+da4GsN3EyeppT70vpf
	vizIOQd0n93JGXkDPtKKNo698WGaMhmZL1ShjX9elgohb6pGe5vEIUQhDqLVjD+aRfAcZFcAItD
	QnMB9b0ezAlo5K3flnp///8qrpibRnfJE9QtKP+AjtgXZS/EEPETDnTIaoL1Cno1ThdmHIn55oV
	ggaVWgVLJLYZCsrm6CXveO8rPNJkxmomppegoBsVDtUo4qdmWxA8BlrPXjef/82wmf4YJkY+TRk
	rBx12wawZxqLoynM/XX2VgiO1yh5x0x4DGxCkC9XUlFiNKLuORvd8XogPE/n3i3MLyDPvoarZCh
	0lGEw+6jb5IOFd2OsY=
X-Received: by 2002:a05:7300:1c1e:b0:33b:c29a:7c3b with SMTP id 5a478bee46e88-33e8901a281mr1702352eec.0.1790141126681;
        Tue, 22 Sep 2026 22:25:26 -0700 (PDT)
Received: from [10.25.133.25] ([165.85.205.162])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e96e48e3esm3414262eec.26.2026.09.22.22.25.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 22:25:25 -0700 (PDT)
Message-ID: <6b1637d5-ce36-4702-a404-89ed6c65155f@gmail.com>
Date: Wed, 23 Sep 2026 13:25:20 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] ASoC: cdns: Add Cadence I2S-MC controller driver
To: joakim.zhang@cixtech.com, lgirdwood@gmail.com, broonie@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, perex@perex.cz,
 tiwai@suse.com, p.zabel@pengutronix.de
Cc: cix-kernel-upstream@cixtech.com, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20260922112134.4167305-1-joakim.zhang@cixtech.com>
 <20260922112134.4167305-5-joakim.zhang@cixtech.com>
Content-Language: en-US
From: Chancel Liu <chancel.liu@gmail.com>
In-Reply-To: <20260922112134.4167305-5-joakim.zhang@cixtech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

> +static int cdns_i2s_mc_clks_enable(struct cdns_i2s_mc_priv *i2s_mc_priv)
> +{
> +	int ret;
> +
> +	ret = clk_prepare_enable(i2s_mc_priv->clk_hst);
> +	if (ret)
> +		return ret;
> +
> +	ret = clk_prepare_enable(i2s_mc_priv->clk_i2s);
> +	if (ret)
> +		clk_disable_unprepare(i2s_mc_priv->clk_hst);
> +
> +	return ret;
> +}
> +
> +static void cdns_i2s_mc_clks_disable(struct cdns_i2s_mc_priv *i2s_mc_priv)
> +{
> +	clk_disable_unprepare(i2s_mc_priv->clk_hst);
> +	clk_disable_unprepare(i2s_mc_priv->clk_i2s);
> +}
> +

It's better disable the clocks in reverse order of enablement。

> +static void cdns_i2s_mc_adjust_pin_config(u8 *pin_mask, u32 slots)
> +{
> +	u8 mask = 0, num = 0;
> +	int i;
> +
> +	/*
> +	 * Wired-out pins may sit at any index among the 8 data pins, so
> +	 * scan the whole mask and keep the lowest pins until enough slots
> +	 * are covered.
> +	 */
> +	for (i = 0; i < BITS_PER_BYTE; i++) {
> +		if (*pin_mask & (0x1 << i)) {
> +			mask |= (0x1 << i);
> +			if (++num == slots / 2) {
> +				*pin_mask = mask;
> +				break;
> +			}
> +		}
> +	}
> +}
> +
> +static void cdns_i2s_mc_tx_config(struct cdns_i2s_mc_priv *i2s_mc_priv, bool on)
> +{
> +	u32 irq_mask = 0, clk_mask = 0, i2s_mask = 0;
> +
> +	irq_mask |= FIELD_PREP(I2S_CID_CTRL_I2S_MASK,
> +			       i2s_mc_priv->pin_tx_mask_adjust);
> +
> +	clk_mask |= FIELD_PREP(I2S_CID_CTRL_I2S_STROBE,
> +			       i2s_mc_priv->pin_tx_mask_adjust) |
> +		    I2S_CID_CTRL_STROBE_TS;
> +
> +	i2s_mask |= FIELD_PREP(I2S_CTRL_I2S_EN, i2s_mc_priv->pin_tx_mask_adjust);
> +
> +	if (on) {
> +		/* Transmitter data underrun interrupt unmask */
> +		regmap_update_bits(i2s_mc_priv->regmap, I2S_CID_CTRL, irq_mask, irq_mask);
> +
> +		/* Transmitter clock enable */
> +		regmap_update_bits(i2s_mc_priv->regmap, I2S_CID_CTRL, clk_mask, 0);
> +
> +		/*
> +		 * Transmitter enable
> +		 * Transmitter synchronizing unit out of reset
> +		 */
> +		regmap_update_bits(i2s_mc_priv->regmap, I2S_CTRL,
> +				   i2s_mask | I2S_CTRL_TSYNC_RST,
> +				   i2s_mask | I2S_CTRL_TSYNC_RST);
> +	} else {
> +		regmap_update_bits(i2s_mc_priv->regmap, I2S_CTRL,
> +				   i2s_mask | I2S_CTRL_TSYNC_RST, 0);
> +
> +		regmap_update_bits(i2s_mc_priv->regmap, I2S_CID_CTRL, clk_mask, clk_mask);
> +
> +		regmap_update_bits(i2s_mc_priv->regmap, I2S_CID_CTRL, irq_mask, 0);
> +	}
> +}
> +
> +static void cdns_i2s_mc_rx_config(struct cdns_i2s_mc_priv *i2s_mc_priv, bool on)
> +{
> +	u32 irq_mask = 0, clk_mask = 0, i2s_mask = 0;
> +
> +	irq_mask |= FIELD_PREP(I2S_CID_CTRL_I2S_MASK,
> +			       i2s_mc_priv->pin_rx_mask_adjust);
> +
> +	clk_mask |= FIELD_PREP(I2S_CID_CTRL_I2S_STROBE,
> +			       i2s_mc_priv->pin_rx_mask_adjust) |
> +		    I2S_CID_CTRL_STROBE_RS;
> +
> +	i2s_mask |= FIELD_PREP(I2S_CTRL_I2S_EN, i2s_mc_priv->pin_rx_mask_adjust);
> +
> +	if (on) {
> +		/* Receiver data overrun interrupt unmask */
> +		regmap_update_bits(i2s_mc_priv->regmap, I2S_CID_CTRL, irq_mask, irq_mask);
> +
> +		/* Receiver clock enable */
> +		regmap_update_bits(i2s_mc_priv->regmap, I2S_CID_CTRL, clk_mask, 0);
> +
> +		/*
> +		 * Receiver enable
> +		 * Receiver synchronizing unit out of reset
> +		 */
> +		regmap_update_bits(i2s_mc_priv->regmap, I2S_CTRL,
> +				   i2s_mask | I2S_CTRL_RSYNC_RST,
> +				   i2s_mask | I2S_CTRL_RSYNC_RST);
> +	} else {
> +		regmap_update_bits(i2s_mc_priv->regmap, I2S_CTRL,
> +				   i2s_mask | I2S_CTRL_RSYNC_RST, 0);
> +
> +		regmap_update_bits(i2s_mc_priv->regmap, I2S_CID_CTRL, clk_mask, clk_mask);
> +
> +		regmap_update_bits(i2s_mc_priv->regmap, I2S_CID_CTRL, irq_mask, 0);
> +	}
> +}
> +

The TX and RX configuration look similar. Perhaps they be factored out
into a helper to reduce duplication?

> +static int cdns_i2s_mc_hw_params(struct snd_pcm_substream *substream,
> +				 struct snd_pcm_hw_params *params,
> +				 struct snd_soc_dai *cpu_dai)
> +{
> +	struct cdns_i2s_mc_priv *i2s_mc_priv = snd_soc_dai_get_drvdata(cpu_dai);
> +	struct device *dev = i2s_mc_priv->dev;
> +	u32 rate, sample_rate = 0;
> +	u32 slots, slot_width, resolution, ctrl;
> +	unsigned long i2s_clk_rate;
> +	u8 pin_tx_num, pin_rx_num;
> +	struct clk *clk_parent;
> +	bool is_master_mode;
> +	int ret;
> +
> +	rate = params_rate(params);
> +	slot_width = i2s_mc_priv->devtype_data->data_width;

Is the slot width fixed by the hardware? If it is configurable, it might
be better to obtain it through .set_tdm_slot().

> +	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
> +		is_master_mode = ctrl & I2S_CTRL_T_MS;
> +	else
> +		is_master_mode = ctrl & I2S_CTRL_R_MS;
> +

The master mode is already known in .set_fmt(). It might be cleaner to
store the master state in the private data and use it here. This would
avoid an unnecessary register read.
> +static const struct snd_soc_dai_ops cdns_i2s_mc_dai_ops = {
> +	.probe = cdns_i2s_mc_dai_probe,
> +	.set_fmt = cdns_i2s_mc_set_fmt,
> +
> +	.hw_params = cdns_i2s_mc_hw_params,
Nit: Remove blank line here.

Regards,
Chancel Liu

