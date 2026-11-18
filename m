Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794996082;
	b=YlTks+76yWsTtxRnf36WBDn2Xgt+c7UlXg0rkJBJfExhGl62NSoZenLM7+hk2oGQJxlM
	 zwJHUXZg+lUl5IGwWY7vXbSoXPrMqmGbK1o7I3UBu+J5I1ryQn5iqIEI7oh5qQNzFgPRu
	 W3XjAO+mi+UzRhvSPFTfDzhZ9Gn/nGj4ebo0xAsV1AZsG2hVUe+/cq9zwsmLAh3eEZopL
	 3bI9bldFYOCEFCWETXvHVKO3FRGH1xgjEm+WFsbZGdqCaOSvvITRZqGR0VIn+adToGRDb
	 GooIHBbI1/ECtifnc9Ki6JfKqSTnSAw4yRfeC2mohCaIMinaqKcwtP91dp0FYwOaQSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794996082;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=p06X8vGtfz134mlSxf5ERVl3kJN9ysuKJStbHDgBjXY=;
	b=gsRBTlvCI2D11AP7uw4QJSNUBFd2GHPvClWI4i68+wdJ/OABK/mX/j1Hp78ILZhWB1f6
	 AUJnmJ2Y6li4amMEkY3SA2xLImGMUaX2F+N5/IXvRxkut7QOk0TPkoc24mp8fg8SE4Enh
	 LLO/hTbdcj5zT1Rr5WddDOSZqw22pYhBUO/8WSwIkDn7mUE7fMnaNqJ843pKBjJ7c/C7O
	 1ltfXOPAVJTLoBnl33hgkqkNTEzFp8xCYh2jAqijnxKTXRLpqmYjYtHF3fV+cT3alRzMT
	 Qa+Ih24ZdRqc6d5AmnWzAEF4jm9S7AIWV9BhC06TOLOrhE3cVxlQtW+iwxp9iDY5hIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=NXWSjALH;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99706606A32F
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 10:01:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99706606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=NXWSjALH
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-49d05d51553so4981855e9.2
        for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 02:01:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794996080; x=1795600880; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=p06X8vGtfz134mlSxf5ERVl3kJN9ysuKJStbHDgBjXY=;
        b=NXWSjALHejmhCRttwQozmx01nKaGgerN7LqPA50/6M/Up0+oOC7WYwnske2NEfpBj/
         YwUYxX8x+tCnf9iOLp55QQMNxSUgR0LDbGsi9DeIQ/RubdWjsMckzmNbxDtBS8N+Pu9A
         Be87Qq6Yqf6fj29/0F93dnvNOcMHwb7Or2RVaOkNyPTovsmfWOcZ6XuHH4ZmEYxYv1kz
         OmXTaDorO35YQvd8ePOrSpHnTlTxN4c6xlkcO52I5y1JFN3PfhZvxiB8M73etRzafEA+
         wqH5dWc/uUSajzaqItwMe4ige1CnmIaqPPR8HmZT1D0L35bwdIae6+w0D68NPj7OSNKH
         G+ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794996080; x=1795600880;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p06X8vGtfz134mlSxf5ERVl3kJN9ysuKJStbHDgBjXY=;
        b=zkQItK9yBCJER4MRqfdvxh/LlVciIsJ8aw8+n6d3a4T2IsDDgmO1N1kxo16ZPpAKRI
         hpwl3purQ2QuJA2ZMU27HCazj4rv3fNcLSfqKwGXKtC8XYmt4ihRwUHSzZTMShHMHX0x
         pJOUSW9Uf15KcbyD43EhHWs6bbIS6HYpx4padhC7+JAxSxufkwtDTjgX8Lkw4bjk685O
         n0BnKaKeOqdXBFkOwooPKXIsdo0HTFOiiZ4JPw17QEzRmzToSGoEEktNn3qcvUsKZ1vC
         df5kPzqd7zfGkqdFJrS7SbMNy1zxo2vsi0p2sCQuJ3O+KEz68hLSicCGSAOqUIqWbm1K
         IQ/A==
X-Forwarded-Encrypted: i=1; AL+hErFh/dx9eTqMMqM9qoAS5aff9IsgR8cyB4bDfdtplOJvMOVnnQWJ4cFPGIa6YhRn/87T54hnYeh0Adt2@vger.kernel.org
X-Gm-Message-State: APuU4Z90caf6agK7WKnjeN5DAetKcfyadjYbXm1kHa8X9utyrxp/R6Rw
	yNYgITNavHdyiaFBm0kiB5AlWyy27r1QJgzhH/DolGmcfdltnhvG8lTXfxB/1TWjbsg=
X-Gm-Gg: AYBFou2BHeUp2BT9B58SGhzUguLuYWepTKdb8r4YMeDklYJMnJDhRe180G2UgIePbBS
	hbRR+UZyzf3mvOxIeG9chyK1ugdqvfDIC0uMa5wjgeUCKV0VNFf8CbT/QmGms1kpCnxhRS3Edko
	f1ZX8EhEfZVzwYQbmD6mIHUzjTzmZXlK/P3F1jeNvQ7LqkXxiMbxddhI+cjS+7gOsAKSgiHu/O7
	ouPOysXH8fy2ZaY5Q4j8D/nmS5QKxofnzIPAUIVKsHBXYY654BI0WlxQNklAY2LenA6nq2aL8Sq
	8iqxx47+JUTmYCz9yPj4JudV5wggupPCGCJ9MAuEYuYrk/RggA42xGQQ5a7CFqs7KrQqBpxqcru
	wpaULS6BN9dRkRy4aeRse+x9LF+r2tjbvPVePml3hPMPWSPBJC/U0Kk1I29X+aEQvU2ZTs6bJiw
	IPkahqDQGjjx78zN6CITkq1D56/ZlBJMtadXIcmuHNqnb7iYjQMNhyz5/G7/uY99mnURmplKK6s
	5/lyOpMa1Iev3rs6etNPrEnubuldh3sRMzFkiDN+MvlPIQzI/ZPXrgxYljv0T9dV3Cao8eDH4Xu
	cQm6h3BUYnRmfegsc0HSqXBoIhMBMj4sDOBfdBfPk1IRX/2C
X-Received: by 2002:a05:600c:4ecf:b0:4bb:7007:4a5a with SMTP id 5b1f17b1804b1-4bb7da2eaa2mr40922415e9.23.1794996079988;
        Wed, 18 Nov 2026 02:01:19 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a65560b5f1sm3910716f8f.21.2026.11.18.02.01.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 02:01:19 -0800 (PST)
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
Subject: Re: [PATCH 3/7] clk: meson: pll: Support active-low resets
From: Jerome Brunet <jbrunet@baylibre.com>
To: Carlo Caione <ccaione@baylibre.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jian Hu <jian.hu@amlogic.com>, Chuan Liu <chuan.liu@amlogic.com>, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20261106-upstream-s7-clk-v1-3-7d501d62621f@baylibre.com>
References: <20261106-upstream-s7-clk-v1-0-7d501d62621f@baylibre.com>
 <20261106-upstream-s7-clk-v1-3-7d501d62621f@baylibre.com>
Date: Wed, 18 Nov 2026 11:01:12 +0100
Message-Id: <179499607255.413320.553972685734176286.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1563; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=Q33DSpltm5vwmAzvC7fHaPbc9BM0xB8WQVVAhH5UiqE=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFl/y3PKLqkKiK4KL9OeNlVYi5vpyrLt++ZICz9b2v0+M
 NKhqSS7o5SFQYyLQVZMkaWGu1r8naTWl1nTdW7DzGFlAhnCwMUpABPhO8bwT/ObRNYFFWbhO4dv
 lmje/SC04FFI1KPbrlWh23OnJe9KCGH4H76H4dc1wYz1vUpzPhXvOsXz0cWI/2B2iGTEnGvxN0z
 LOQE=
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

> The common PLL code assumes that the reset of a PLL is active high. The
> S7 HDMI PLL has an active-low reset, and its lock flag only rises
> reliably when the PLL goes through it.
> 
> Add a flag for PLLs with an active-low reset so this PLL can use the
> common implementation.
> 
> Signed-off-by: Carlo Caione <ccaione@baylibre.com>
> ---
>  drivers/clk/meson/clk-pll.c | 43 +++++++++++++++++++++++++++++++------------
>  drivers/clk/meson/clk-pll.h |  1 +
>  2 files changed, 32 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/clk/meson/clk-pll.c b/drivers/clk/meson/clk-pll.c
> index 44b33051405f..4ac5e45c1e9b 100644
> --- a/drivers/clk/meson/clk-pll.c
> +++ b/drivers/clk/meson/clk-pll.c
> @@ -293,13 +293,37 @@ static int meson_clk_pll_wait_lock(struct clk_hw *hw)
>  	return -ETIMEDOUT;
>  }
>  
> +static bool meson_clk_pll_in_reset(struct clk_regmap *clk,
> +				   struct meson_clk_pll_data *pll)
> +{
> +	unsigned int rst;
> +
> +	if (!MESON_PARM_APPLICABLE(&pll->rst))
> +		return false;
> +
> +	rst = meson_parm_read(clk->map, &pll->rst);
> +
> +	return pll->flags & CLK_MESON_PLL_RST_ACTIVE_LOW ? !rst : rst;

nitpick: exclusive or ?

> +}
> +
> +static void meson_clk_pll_reset(struct clk_regmap *clk,
> +				struct meson_clk_pll_data *pll, bool reset)
> +{
> +	if (!MESON_PARM_APPLICABLE(&pll->rst))
> +		return;
> +
> +	if (pll->flags & CLK_MESON_PLL_RST_ACTIVE_LOW)
> +		reset = !reset;

same here.

Apart from that

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>

-- 
Jerome

