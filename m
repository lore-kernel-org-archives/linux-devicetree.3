Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795480837;
	b=2eXBEtsJUK9a8w+kwP6qR/eW8oTFJFd4NE0y1jyKdkAgqInF84Ydy5PVgSeQqkGgqAPK
	 S9cpy1ptOo5KBlccwRfbxloHmgbI65rwcBv2EfSXpFmjAJ7+rx4MPQm1STnbAyRc31LeP
	 A+XHAb+oZThhwbo4t0d7weJzKEjQoqL8Ps6VoSCBJ9M35zwWNxY+VeuTEWUxN+84S3Kdq
	 PlnWdGQcXNL+HmGetjCS89sFNvu1e0Zma5Fw3pGHKJ6GJiZYZBIQ1hBGjbvgVqGeZ9EKg
	 jppu5O+9bc6cO/pIf56U1UF/gTxms88RCXT1Kcs9iW0siIWWiqqYJV57ievC/COo+Tg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795480837;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=1mdTC7iCer+TQwL4f4nmNkxrgPoCgiJ3UcEX3hsjGJM=;
	b=ngDPf6Y+wH0ycJQdMN48EMJPaSf/2eZTObAes3XDpD/GY6JrE1zLGs1AOgLyL0uEh4hl
	 1qHirt9G/taL5/LpzolVZEBpDAk20NwNqTrWY6kadfIpRUSgEka7qtHUh+p25s1zbThsv
	 XQXUAf5/VCqD59BG7V2WZu7aMCR5Vvgqji3yCD7kYLcTtB+2HMNIkLGQwjYeSXVdfkusz
	 Ei75H6B3PqK7Fyzk9namUTGJerar2j2WyOjJ82TB7fBlQG6N2HnJkky9zTUg722ixezuW
	 +fAsbDKH8NJ2CmCa1c6a73FNN1ZGnnL3rtlfDsQdMBZv9+brCgtkSK6zdNW25oP2UeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=D168XNdn;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE7B1606A32E;
	Tue, 24 Nov 2026 00:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=D168XNdn
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8864E1F000E0;
	Tue, 24 Nov 2026 00:40:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795480837;
	bh=1mdTC7iCer+TQwL4f4nmNkxrgPoCgiJ3UcEX3hsjGJM=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=D168XNdnUFYwPmlq3CzrrPtL9YvOPrQ9tdaSOXPGBjSEaNz+PQOhdErK1dmEQt70s
	 PspexX1gF4tiQzxGCkYQnUUYO/nWD8upTgT+fKW/Rv2t5K8uKttQIxrazDQ3mLaU38
	 K5p/t5r3kH4k6wZhQyhJf6PyuJD97IHjwYvY6MgxtTJMkHN4GYxyxT1N6+hPXgI+rc
	 W6/LkjJaIJ9xxo0znFYZaypF1rtIJfynp2ZrVu9n8UUuDk/h0AEXLBbPYHUlYjl/1g
	 B8Fv1y6VVLaNPKchGtUuFtL6PkNPs3PZYf0tVbuFIHSO1KrAeoNSH1tj4cVyjxIz+i
	 MT8SaWKhEnAiQ==
Subject:
 Re: [PATCH net-next v16 04/13] dpll: add basic SiTime SiT9531x support
From: netdev-bot+sashiko@kernel.org
To: arouhi@sitime.com
Cc: jiri@resnulli.us, vadim.fedorenko@linux.dev,
 arkadiusz.kubalewski@intel.com, ivecera@redhat.com, kuba@kernel.org,
 pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 cjubran@nvidia.com, Oleg.Zadorozhnyi@devoxsoftware.com,
 prabhakar.mahadev-lad.rj@bp.renesas.com, devicetree@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Tue, 24 Nov 2026 00:40:36 +0000
Message-ID: <179548083614.3135.11915403348553233279@kernel.org>
In-Reply-To: <20261119225752.41846-5-arouhi@sitime.com>
References: <20261119225752.41846-5-arouhi@sitime.com>
X-sashiko-severity: Medium
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 4 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 2 · Low: 2

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] sit9531x_dev_probe() (drivers/dpll/sit9531x/core.c) never gets
  or enables any supply that the series' binding defines: vdd-supply…
- [Medium] sit9531x_dev_probe() enables the XO with
  devm_clk_get_optional_enabled().
- [Low] The commit message rejects a regmap paged range partly because 'a
  debugfs access would move the page under the driver'.
- [Low] All three new files (core.c, core.h, regs.h) name Ali Rouhi as
  Author in their headers, listed first, and MODULE_AUTHOR lists him…

--

dpll: add basic SiTime SiT9531x support

This adds the I2C probe for the SiTime SiT9531x DPLL family. It uses a
flat 256-byte regmap window, and the driver selects the page under a lock.
Probe requests the optional reset line, enables the XO, releases reset and
identifies the variant from the ID register.

> The register space is 32 pages of 256 registers, selected through offset
> 0xFF of any page. The regmap is the flat 256-byte window, and the
> accessors select the page under a lock. A regmap paged range is not
> used: it reads the selector back on each access, which doubles the bus
> traffic, and a debugfs access would move the page under the driver.

[Severity: Low]

Does the debugfs part of this rationale hold for regmap ranges?

As far as I can tell, _regmap_select_page() in drivers/base/regmap/regmap.c
selects the page again on every access through the range, under the
regmap lock:

    ret = _regmap_update_bits(map, range->selector_reg,
                              range->selector_mask,
                              win_page << range->selector_shift,
                              NULL, false);

So a debugfs access should not leave a range-based driver with a stale
page.

The flat window chosen here looks like the design that has the
page-tracking hazard. sit9531x_page_select() trusts the cached value and
skips the selector write:

    if (sitdev->page == page)
        return 0;

The regmap debugfs registers file for sit9531x_regmap_config dumps offsets
0x00-0xFF of whatever page the driver last selected. It does this without
taking page_lock, and the dump does not say which page it shows.

Debugfs writes to 0xFF are compiled out by default
(REGMAP_ALLOW_WRITE_DEBUGFS is undefined), so hitting the stale cache case
needs a source change.

Could the commit message describe this tradeoff more precisely?

> Suggested-by: Ivan Vecera <ivecera@redhat.com>
> Signed-off-by: Oleg Zadorozhnyi <Oleg.Zadorozhnyi@devoxsoftware.com>
> Signed-off-by: Ali Rouhi <arouhi@sitime.com>

[Severity: Low]

This isn't a bug, but core.c, core.h and regs.h all name Ali Rouhi first
as Author in their headers, and MODULE_AUTHOR() lists him first too. If
he co-developed the patch, should there be a Co-developed-by: tag right
before his Signed-off-by:, as Documentation/process/submitting-patches.rst
describes?

> diff --git a/drivers/dpll/sit9531x/core.c b/drivers/dpll/sit9531x/core.c
> new file mode 100644
> index 0000000000000..99dd5e70dc5e6
> --- /dev/null
> +++ b/drivers/dpll/sit9531x/core.c
> @@ -0,0 +1,318 @@

[ ... ]

> +static int sit9531x_dev_probe(struct sit9531x_dev *sitdev)
> +{
> +	struct clk *xtal_clk;
> +	u8 variant_id;
> +	int rc;
> +
> +	/*
> +	 * Request before enabling the XO: a probe deferral would gate the XO
> +	 * and remove the reference of a running part.
> +	 */
> +	sitdev->reset_gpio = devm_gpiod_get_optional(sitdev->dev, "reset",
> +						     GPIOD_ASIS);
> +	if (IS_ERR(sitdev->reset_gpio))
> +		return dev_err_probe(sitdev->dev, PTR_ERR(sitdev->reset_gpio),
> +				     "Failed to request reset gpio\n");
> +
> +	/*
> +	 * Fvco = Fref * (DIVN + frac/2^32); Fref is the rate of the XO feeding
> +	 * XIN/XO_CLK.
> +	 */
> +	xtal_clk = devm_clk_get_optional_enabled(sitdev->dev, "xtal");

[Severity: Medium]

The comment above says the goal is to avoid gating the XO of a running
part. Doesn't devm_clk_get_optional_enabled() still gate it on every
failure path after this point?

drivers/clk/clk-devres.c implements it as:

    return __devm_clk_get(dev, id, clk_get_optional,
                          clk_prepare_enable, clk_disable_unprepare);

So devres calls clk_disable_unprepare() on any probe failure after this
point, while the part stays out of reset and configured. That includes:

  - the "no xtal rate" -EINVAL return
  - a gpiod_direction_output() failure
  - a transient I2C error from sit9531x_read_variant_id()
  - the "Unknown variant ID" -ENODEV return
  - a devm_mutex_init() failure

The driver has no .remove and is fully devm-managed, so a sysfs unbind or
rmmod gates the XO as well.

Later patches in the series add more failure points after the XO enable
(sit9531x_devm_dpll_init(), devm_request_threaded_irq()), and the XO is
still devm-enabled.

If the XO is gateable and this driver is its only consumer, won't this
stop the reference of a chip running from its efuse/NVM configuration?

> +	if (IS_ERR(xtal_clk))
> +		return dev_err_probe(sitdev->dev, PTR_ERR(xtal_clk),
> +				     "Failed to get xtal clock\n");

[ ... ]

> +	if (sitdev->reset_gpio) {
> +		rc = gpiod_direction_output(sitdev->reset_gpio, 0);
> +		if (rc)
> +			return dev_err_probe(sitdev->dev, rc,
> +					     "Failed to release the reset line\n");
> +		fsleep(10000);	/* internal boot after release */
> +	}
> +
> +	rc = sit9531x_read_variant_id(sitdev, &variant_id);

[Severity: Medium]

Should probe get and enable the supplies defined in the binding before
this first I2C access?

The binding in this series (sitime,sit95316.yaml) documents vdd-supply,
vddin-supply, vdds-supply and the vddoN-supply rails. It says they are
there so that "a board with switchable rails" can describe them, and its
example points vdd-supply/vddin-supply at &reg_1v8/&reg_3v3.

The binding commit does note "The driver does not enable them", and
sit9531x_dev_probe() makes no regulator call.

If the rail is off at probe on such a board, this read goes to an
unpowered part. Probe then fails with an I2C error or a misleading
"Unknown variant ID", and nothing points at the missing supply.

If the bootloader left the rail on, no consumer claims it. Wouldn't
regulator_late_cleanup() then turn it off? It only skips regulators that
are always_on or have a nonzero use_count. That would cut power to a
running DPLL and drop the efuse/NVM configuration this patch tries to
keep.

A separate point: when reset-gpios is absent, nothing waits before this
read, because the fsleep() only runs when the reset GPIO exists. Does the
part need time after the XO is enabled before it answers on I2C?

At the end of the series, drivers/dpll/sit9531x/ still has no regulator
handling.

> +	if (rc)
> +		return rc;
> +
> +	sitdev->info = sit9531x_match_variant(variant_id);
> +	if (!sitdev->info)
> +		return dev_err_probe(sitdev->dev, -ENODEV,
> +				     "Unknown variant ID: 0x%02x\n",
> +				     variant_id);

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261119225752.41846-1-arouhi%40sitime.com
