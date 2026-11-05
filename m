Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793901050;
	b=UzxhCCQiGsPyMCVTMliEsafSb8G2ki1tfqz/8L4LyX+H1yxJoZeXKwIhb1NLapdcWBvT
	 Uk33nvcO615u7t5BPH2Tq+Hs8vNMHaW97qsbDR1rRnFD4gQAh1w+GSf4uUx4p11U6zlAN
	 dl6+KNmUVtwYdeUkbm9d0EfWf/sIGulQQsNfc84IKArNMkNNcUTfAk9zJV65Zzsu+o9UG
	 Zgy+7TfuTzxcRclqUvs4hmJ9JaaosWYP1imCIjpudz9yATc5te/Qq1ApQie7NhKnZC6BO
	 bpKgwDALKqHZOpW++M42rcCtCA61fCNNpD0w/StjGzSnZy+Bma72PoFPi0qhangFtuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793901050;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=LA8AvLGyexZbtAf4veVlwI7D/EBoHlL13GOji2GbHxQ=;
	b=20+WpbGDzStyN7ekM3lw7TDIbYRJqbQ4mlV20sDJvXT/RWlzUcJEUrjsMU4ABeqJS+C8
	 PGkzRjoXH4Y8Apbn2pKuQo9o8CDaxsICZDKz6lwqdyBUcI2qavtVRuPUpqRe/2EY92f/C
	 VuVDXO3ZilSbezqOmneP8apWgCCBmn3zr1//dwC6kpMngr56rpby8LwIlFOcieK5ij5Fh
	 oZ+Jop9Zh59Znj88jB6fFPAUoeiMB1WtSsVVZBz96fYowE7KjXtQY5tPSoNu7GDA1m86j
	 8rdBLhHpM90Cy/HhHpRNT53ZKR9v5ZmJOueJ0ocDfxmyp/C8Yx5Bau9DPsG42Lfy/Gg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=SbXYVV0w;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98D86606A33A
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 17:50:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98D86606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=SbXYVV0w
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-490f38e9688so893835f8f.0
        for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 09:50:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793901047; x=1794505847; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=LA8AvLGyexZbtAf4veVlwI7D/EBoHlL13GOji2GbHxQ=;
        b=SbXYVV0wWXhKcRNyYeiMFQVb3JDJcyA/84RpfKpau5+rZ/g841SsMIWE5tmxg0LCz2
         fCBeQhaHJvPkTTqCnmsfikbj9n2STDofm+Dt8n6Xf9ySy4koCENTt4MaE2387bGPFocm
         Jj7oZ9JwLaWPidOVmHugtqGEptvaDou8bNuunvpHRJFFz2EkMKDdKuGFDRe7HcUgFVpx
         D69eh++uT+gmwx0c6WUCzbQ8j/rspdOSOhQsohbWbPNRPOnw2WeIDGUvpRQYVx561gkF
         ejhfrHsCYf5tKnyR0LNmI1mgubATz3fb7rAOkALUwKa5kef1z5ftKaRyEis4bZvPPQFx
         7nog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793901047; x=1794505847;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LA8AvLGyexZbtAf4veVlwI7D/EBoHlL13GOji2GbHxQ=;
        b=0mR+Roavpnp20DQmf+wMbH5ys740Q+4ZumCWb0YvByTDavZ1i9m77SxkU/Uah1JKhq
         F73tL+8F7cdcwLWtXtb4R+do/IpVXaFw3XycuHZKa+i1CuRYE+T/sRH8aYOqeQNo5Ue1
         iaWrJl21mmYhFkgSkgV5hff0vBx+y+JdeqUwMCFrqSIHAfrrVOMkRDWn1zgtl54pjGAM
         S2e4vM7R1lC/8mRECP5BhcNN01YlhfaX3JqdtKQuUtTUszbNNLUeM6AMvMw9UQEZM82Z
         3uWQEl7HlyrLYSD/5fS2jPQLaJOyhN93nIn7Um1Ju6N3bG1V42txgK7VnW/WoQHLw5z8
         bJDQ==
X-Forwarded-Encrypted: i=1; AKwUvBz/jT1yONMHKYZWT4yZHp6kpiKmcjG1NZM5YtpX5PCAh3EX1Gb/lvPogmrkC1LybOwFh4EvLuLcc+Ri@vger.kernel.org
X-Gm-Message-State: APuU4Z/4uJBUCEhx+JvxOD8UerAlcrO69s9+pxRC9Td6i3j8w9qEZHjq
	0gmFJjlM8huyT2WSzZN1EehkUZECbemKNRDCpuZABJZuTSwz6tYBYM9Z06zNoQ0imFE=
X-Gm-Gg: AYBFou1t/hLImVDvBj5o7Rmc3m200dPB/7WKJc9+wz+nQjKguWH8ZjtJtfaHbIJhH9R
	0ZY2ha1E0GOvh15/30mL6v5qSsJoogWDJtxx3GxBiGw4E1zWQu/ZIY5En4RIDnpipcM6iZ4E5Zk
	xEM0p0hRMpKA1xwTuGRhdvL/yBQlCT3enyttCc+ra9i4lBSziD4WpysRusLaogLTiY2C4estXvN
	8cCnnxJZMjMDyD3sjpXWSHdJlaBuAcOAc2AM2rsMlWKhlKWSNkH+KTYhMwgFjhA+v+JpZeWmyTK
	6/L/pw3g3hWjLX9slMg31je2HZAbBCcQqVzPDlGpuspqM/92z4KFBQ6jwEcHK1/6xrNDEF8AaK5
	7AxDZX0ACfiaJEU5xBZTq2gjw4BSGEtyqgULxGuG5IHc+XM0Gihm53UiBVLHtR505EOTFaI3DI1
	YdO1rgkPS/ezZBvPs4DCNeLMUho7rYi6hV3jHbSl2+jRDicmwKeaC9JEINppPIOhacLwtv2lmXc
	8myzAV8NZjeW8btA/tA2aTorHvSbM67GhDWBHw0thpg+YxZElNqS7yF56h7zlF4SCSQHKqEmM+6
	qx3vw7SBewBQAI6pniODzGCZQBjtPmHEMUMM7vPqV6TfEs2s
X-Received: by 2002:a05:6000:2f87:b0:491:eb12:e133 with SMTP id ffacd0b85a97d-4927835f4a0mr739128f8f.11.1793901046808;
        Thu, 05 Nov 2026 09:50:46 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fed551dbasm10843690f8f.37.2026.11.05.09.50.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 09:50:45 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH RFC RFT v2 2/3] clk: divider: add
 CLK_DIVIDER_INVALID_ZERO flag
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jian Hu <jian.hu@amlogic.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-amlogic@lists.infradead.org, 
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20261029-meson_refactor_n-v2-2-ff4ac74e527b@amlogic.com>
References: <20261029-meson_refactor_n-v2-0-ff4ac74e527b@amlogic.com>
 <20261029-meson_refactor_n-v2-2-ff4ac74e527b@amlogic.com>
Date: Thu, 05 Nov 2026 18:50:40 +0100
Message-Id: <179390104085.2573818.16461908615505096359.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2894; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=hgYik+Icrd5okmeAAVTfYYP6BAFK/E7hkpa3L1tnww0=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFlvDn6+tSd8/d2dfKabnr0/9+ZojuLnxzpVp+oKOPje3
 5/O/X3Czo5SFgYxLgZZMUWWGu5q8XeSWl9mTde5DTOHlQlkCAMXpwBMZPM/hv950Q9jiq+4WW0u
 twi6Je18bN4hBs7Yuf9YynYukVx3RvoyI8NyJb9zV89lp9wubMhs2XQwac7TDN05otvuafDUtZ/
 jeMsPAA==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

> When a divider register reads zero, divider_recalc_rate() currently
> emits a warning (unless CLK_DIVIDER_ALLOW_ZERO is set) and returns
> the parent rate.
> 
> This behaviour assumes a zero divisor acts as a pass-through, which
> does not apply to all hardware. Some dividers, for example PLL
> pre-dividers on Amlogic SoCs, come out of reset with a zero value
> that does not produce a usable clock. Returning the parent rate
> hides this fault behind an incorrect, plausible value.
> 
> CLK_DIVIDER_ALLOW_ZERO only suppresses the warning while still
> reporting the parent rate, so it cannot represent this hardware
> behaviour.
> 
> Add CLK_DIVIDER_INVALID_ZERO for dividers where a zero divisor value
> is invalid. When this flag is set, recalc_rate() returns 0, making
> the faulty state visible to the clock framework rather than hiding it
> as a pass-through.
> 
> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
> ---
>  drivers/clk/clk-divider.c    | 3 +++
>  include/linux/clk-provider.h | 6 ++++++
>  2 files changed, 9 insertions(+)
>
> diff --git a/drivers/clk/clk-divider.c b/drivers/clk/clk-divider.c
> index f68216c65d3d..6c1523d22477 100644
> --- a/drivers/clk/clk-divider.c
> +++ b/drivers/clk/clk-divider.c
> @@ -143,6 +143,9 @@ unsigned long divider_recalc_rate(struct clk_hw *hw, unsigned long parent_rate,
>  
>  	div = _get_div(table, val, flags, width);
>  	if (!div) {
> +		if (flags & CLK_DIVIDER_INVALID_ZERO)
> +			return 0;

While I think CLK_DIVIDER_INVALID_ZERO really makes sense for a writeable divider
only, to gracefully handle a reset value at zero that we would later correct,
we should still handle all paths correctly. This include a RO divider and its
determine rate path. I'll try to send something for this soon.

> +
>  		WARN(!(flags & CLK_DIVIDER_ALLOW_ZERO),
>  			"%s: Zero divisor and CLK_DIVIDER_ALLOW_ZERO not set\n",
>  			clk_hw_get_name(hw));
> diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
> index dc8e161f9c2c..fe2dbbba49e3 100644
> --- a/include/linux/clk-provider.h
> +++ b/include/linux/clk-provider.h
> @@ -744,6 +744,11 @@ struct clk_div_table {
>   *	big endian.
>   * CLK_DIVIDER_EVEN_INTEGERS - clock divisor is 2, 4, 6, 8, 10, etc.
>   *	Formula is 2 * (value read from hardware + 1).
> + * CLK_DIVIDER_INVALID_ZERO - a zero value read from the register is not a
> + *	divide by one / bypass but an invalid setting which does not produce
> + *	a usable clock.  recalc_rate() returns 0 so that the broken state is
> + *	reported to the framework instead of the parent rate, without
> + *	triggering the CLK_DIVIDER_ALLOW_ZERO warning.


 CLK_DIVIDER_INVALID_ZERO - a zero divisor is an invalid setting with no
 	usable output. recalc_rate() returns 0 instead of the parent rate.
	Takes precedence over CLK_DIVIDER_ALLOW_ZERO.

-- 
Jerome

