Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7BC130F958
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 15:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778771607; cv=none; b=Xfot98yvT5TXp0ThMasEiwfjZDHXZknPyhv/G4b5dQRDyWCosnJaxTkZ87JyAbO2O1l5aknhwVcIoUSt3iFy4WvOBJNZotB+ZuLBBPrsauoXkutrkVeru7lhcNkvN49hs5TVtgYBmcFUWxDyiDG86T6f5MYC/qzk3e0LL8V8YzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778771607; c=relaxed/simple;
	bh=uMb4ZbSplRAY7kyHR/j0eXA2cPzF5uZsroIjreRVzS4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=oKCsfgCusfQYsx57wTo2FLFFCmUg/Z3/jeuL7d9A2hEZsRAKGeUFJC8AwGvA6ChoJe78Xfv9EOxr/5ImFFIIuz+6kSx/h1eo5QGo8xOaOXeLxEXddnVTrWsLf1ADIKpZRB04COHRY5WULKNsGHQ7Y1hsD7PsKdsX1rtSDaskLbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b=BIRCIgPF; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b="BIRCIgPF"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-48a3e9862f0so54536375e9.1
        for <devicetree@vger.kernel.org>; Thu, 14 May 2026 08:13:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1778771596; x=1779376396; darn=vger.kernel.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GMG+MYf2mIEZOo4k7BKQu+vHso1LCBH/45mKDm5C2Qg=;
        b=BIRCIgPFmkwlES/ERB5xv17HgmgDjY3cSxS8A29mi+lFPdb8hgElSRZRNYxVOkXM8U
         ez5t38fzXnhI8ehcLycNaw2VqC89e4d3kemKxyX3jV+Nw0aMHo433zrCnuEjSB4BnEtU
         VkEGTCmtC3O/RLk1AOjZEq0KbkDgECbmlr5u59jznSSu6OLbJwrGu6DxEovBuQX+Sz0n
         A72vtWlX4PjSagtjHcNVCZ+veEA/FrYBBaAhcGzpPdspAvU1fznPgE8hQNF1b9wbp231
         BDY8z6Us7KoiFunXgSo8kzF6ujwjE57bV1yvJt1etmrkmu7zRgNn3TN3utz8MfjgHpyP
         KReA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778771596; x=1779376396;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=GMG+MYf2mIEZOo4k7BKQu+vHso1LCBH/45mKDm5C2Qg=;
        b=W1Xi5lpjhRA8k4z4g7TYF91pzGsiAzPlNcKR0dYsRrxDPV546WErMyo0WvUqj1ECf/
         zLNLkiO+nYyciDoHzrpqVd9PT3f7GF0bkeqzRawbA99V3XFsQv4twiJda/7LbCN+DlZK
         zuYf3fyCTMxi8oxWSHTLs9ymvcZxdKMKyaI47Lzf0Ngijdi9Bqofip2g+joW9S1E0n4W
         hn44/k0WhPmVrW4ZE9So8DAND1QB7zGQm5hZSX6eMUdAb1OHJnmtb10b2Zmfoqyiv0j0
         Zcv0UpwUtd5GiFygOyy2Gdxp+V1qQtMbbTNoot2pMLe1D9PzutbnxYSChd5d9Ok14E/P
         33KQ==
X-Forwarded-Encrypted: i=1; AFNElJ8WmB2ZD0nD6Dx87XNBi+hCt9MnK1ikBPDbBqR49i75DFLe+v5otQl4uA0RLeRWl8/a/SiHU81J8aV1@vger.kernel.org
X-Gm-Message-State: AOJu0YydbBHaGMwrjgvpLQrBs9Q+Ep9A5fzJmeSCS7hLQELHi06zWEdL
	z3pLsvPa8cTwP8xoMGko9G4WREpREvb19IZdvK4Rm3VQdS/gXAup6SIqNo3Uq8xNWA/lcUcwH3y
	0Lz7B
X-Gm-Gg: Acq92OHF6Jes0qak4LupUmo9Qv7zY518rujQUUhJ/rpZagbPkfn9slUPVZwHuDDoBbN
	kWG2ZG3VO/t4i/QAZp6TvQsoetvDTrYxA8s9RQo62VxDVJlgrlL73FcIhNFtJqhymJgGzs+4yHA
	TIt2aohgAxEeUSP21KdOXtXDfPxnP/vDkRZCxNHZ/7uIpQqftYXNBuWcmy6V6kEKZpWMvJ0khRj
	eJPl4I62wv9SEZizqc3Zk2Rvp6jPyHz/YMpRNEcV6NKVSEjddI+KL2eIdhlUcUBIJ0GhOAj0m00
	U1rxLQc6MoF7uWOlMx5jRjpzicwMeymPdLTTPEVcP+ExA8vg9qP+3yXicxiQI2metssE8Qg/tlS
	IeLlC5rENWvO0x3ZcSqfHSNGKGxfkOmWirQtf9EyqFCeUMRud9SmmCSs+5YOdj6nCp5vMK4Jloa
	Cnp8WqC1deZIr4wgM+uEM=
X-Received: by 2002:a05:600c:8906:b0:488:aa33:dc8f with SMTP id 5b1f17b1804b1-48fe486cca4mr514625e9.0.1778771595855;
        Thu, 14 May 2026 08:13:15 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:8f63:bf1e:b5:28d8])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-48fe46f4647sm3184745e9.14.2026.05.14.08.13.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 08:13:15 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jian Hu via B4 Relay <devnull+jian.hu.amlogic.com@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,  Stephen Boyd
 <sboyd@kernel.org>,  Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski
 <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,  Neil Armstrong
 <neil.armstrong@linaro.org>,  Xianwei Zhao <xianwei.zhao@amlogic.com>,
  Kevin Hilman <khilman@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  jian.hu@amlogic.com,
  linux-kernel@vger.kernel.org,  linux-clk@vger.kernel.org,
  devicetree@vger.kernel.org,  linux-amlogic@lists.infradead.org,
  linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 05/10] clk: amlogic: PLL l_detect signal supports
 active-high configuration
In-Reply-To: <20260511-b4-a9_clk-v1-5-41cb4071b7c9@amlogic.com> (Jian Hu via's
	message of "Mon, 11 May 2026 20:47:27 +0800")
References: <20260511-b4-a9_clk-v1-0-41cb4071b7c9@amlogic.com>
	<20260511-b4-a9_clk-v1-5-41cb4071b7c9@amlogic.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Thu, 14 May 2026 17:13:13 +0200
Message-ID: <1jse7u6n3q.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On lun. 11 mai 2026 at 20:47, Jian Hu via B4 Relay <devnull+jian.hu.amlogic.com@kernel.org> wrote:

> From: Jian Hu <jian.hu@amlogic.com>
>
> l_detect controls the enable/disable of the PLL lock-detect module.
>
> For A9, the l_detect signal is active-high:
> 0 -> Disable lock-detect module;
> 1 -> Enable lock-detect module.
>
> Here, a flag CLK_MESON_PLL_L_DETECT_ACTIVE_HIGH is added to handle cases
> like A9, where the signal is active-high.
>
> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
> ---
>  drivers/clk/meson/clk-pll.c | 9 +++++++--
>  drivers/clk/meson/clk-pll.h | 2 ++
>  2 files changed, 9 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/clk/meson/clk-pll.c b/drivers/clk/meson/clk-pll.c
> index 1ea6579a760f..5a0bd75f85a9 100644
> --- a/drivers/clk/meson/clk-pll.c
> +++ b/drivers/clk/meson/clk-pll.c
> @@ -388,8 +388,13 @@ static int meson_clk_pll_enable(struct clk_hw *hw)
>  	}
>  
>  	if (MESON_PARM_APPLICABLE(&pll->l_detect)) {
> -		meson_parm_write(clk->map, &pll->l_detect, 1);
> -		meson_parm_write(clk->map, &pll->l_detect, 0);
> +		if (pll->flags & CLK_MESON_PLL_L_DETECT_ACTIVE_HIGH) {
> +			meson_parm_write(clk->map, &pll->l_detect, 0);
> +			meson_parm_write(clk->map, &pll->l_detect, 1);
> +		} else {
> +			meson_parm_write(clk->map, &pll->l_detect, 1);
> +			meson_parm_write(clk->map, &pll->l_detect, 0);
> +		}

I'm not a fan of this code duplication.
Use the introduced CLK_MESON_PLL_L_DETECT_ACTIVE_HIGH to compute the
first value, then flip the bit.

>  	}
>  
>  	if (meson_clk_pll_wait_lock(hw))
> diff --git a/drivers/clk/meson/clk-pll.h b/drivers/clk/meson/clk-pll.h
> index 949157fb7bf5..97b7c70376a3 100644
> --- a/drivers/clk/meson/clk-pll.h
> +++ b/drivers/clk/meson/clk-pll.h
> @@ -29,6 +29,8 @@ struct pll_mult_range {
>  
>  #define CLK_MESON_PLL_ROUND_CLOSEST	BIT(0)
>  #define CLK_MESON_PLL_NOINIT_ENABLED	BIT(1)
> +/* l_detect signal is active-high */
> +#define CLK_MESON_PLL_L_DETECT_ACTIVE_HIGH	BIT(2)
>  
>  struct meson_clk_pll_data {
>  	struct parm en;

-- 
Jerome
