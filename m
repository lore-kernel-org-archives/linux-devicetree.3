Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794993781;
	b=TEfe03+86dWMY0Euxf+nOTAyyYXfaa/L4Le1XR2s4h+jTFqzL1YO9I2WKjl/o9zZb8xR
	 YVxMdkRKLpUyNS2lt82SZLdJMtWzK8S9fQI0tkPRm4zW4xiOD+K0eFB25KMa0YmnOOm0C
	 gzrawcjpC8mVDHOkotAwGup03v28wTbcspLZ4nJHF6USlLQt5+sdBrXKKIxrz1rmVgsEb
	 Z8s3G0phGnq2Fv1gB+iVy2P+8B19VuIZrqPFz5ewxOn/PgA8u2MYkhoSl5t0JvFml4G24
	 rnxrsFI6b/fgFEZ/j8UZnHNBISa/i3t5JqJ+3WMaB1BjVcIQgwbEQ+kn+D/fqs4t+TQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794993781;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=DhQhJc0zm8azqoJCpNF4hNnCCyesXgkv2N++V0eNTLo=;
	b=EK7pS8ChNVbvK9qJXdqG82UHHj7NBZwe64K6KkZvv34mkiZ6Z5sLW9uRuHovUxU3dAQM
	 DZRPXnqawEQZztHrzVY3gn/YKmm2KSVOAHqdkB+QtcZVoZR9ZetPqZ86ZmcR1swEZC+c0
	 P19LNgbegnMEpV7TcOyc0XEaNQ+0kTTQiARt5f0/Nxrvop1q74rs8DoZs1QZI9EAP+mfh
	 sZIUwCw9ORhS5qzVnT5u9fMIXsQVU/o1qTHNsRY83UjSCBiWVQdBU9w7JCUZBkWYxqaao
	 kA3YFKFpoxypAGV5DNI3w1AG9Lih2K1TIS8IIMTxGqiZVBnraf5TNR1xmjh8eo4VGtQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XuAmpQlg;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C52E3606A31C
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 09:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XuAmpQlg
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 074861F000C9;
	Wed, 18 Nov 2026 09:23:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794993781;
	bh=DhQhJc0zm8azqoJCpNF4hNnCCyesXgkv2N++V0eNTLo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XuAmpQlgvXaSzz+7/8jpxAbKaTCL6iEIfYJsPCVcGchT4wZ4vMSviTQ6jHQIwHKRR
	 GieWlZGh32/LRO4xonV5z5pIm9GWMfV8q2PdchAyIF/NTj2KQv7N0wGR0qjmWysPRr
	 en046z/nmmPDot0onaEao6rqyu224yD6gemkGKWQA9cSB6vsysFxrXk099gkh91SIk
	 8EvP03NpcCgu9ge0Kn4T3B8JI8aGwYZqG/Z3Y/DyUF/RFAD9hbDySdYhwp+YvJHRHa
	 Hlu1IIa5bZA4FIANu6H3fOxbLkFwMI4gGmCReKJn7jK2LBu6jSK2tpanNURV7CnT/X
	 BmMnnCt63Vc0g==
Message-ID: <sashiko-outbox-220546@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/9] bus: Add SpacemiT K3 eSPI controller support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wang Yang" <yang.wang@deepcomputing.io>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261118085742.1817536-4-yang.wang@deepcomputing.io>
References: <20261118085742.1817536-1-yang.wang@deepcomputing.io>
 <20261118085742.1817536-4-yang.wang@deepcomputing.io>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 18 Nov 2026 09:23:00 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential
issues to consider:
- [Medium] bus: spacemit-k3-espi: boolean DT properties always evaluate
  to true
- [Medium] bus: spacemit-k3-espi: status clear race and error masking in
  poll
- [Medium] bus: spacemit-k3-espi: sclk rate set on wrong clock before
  negotiation
--

commit 725541204887e2363d68e7147b0b1af23aa4f9a3
Author: Wang Yang <yang.wang@deepcomputing.io>

bus: Add SpacemiT K3 eSPI controller support

This commit adds a bus driver for the SpacemiT K3 eSPI controller to
handle clock and reset management, channel configuration, and link
recovery for child devices.

> diff --git a/drivers/bus/spacemit-k3-espi.c b/drivers/bus/spacemit-k3-esp=
i.c
> new file mode 100644
> index 0000000000000..b511b164b3cfc
> --- /dev/null
> +++ b/drivers/bus/spacemit-k3-espi.c

[ ... ]

> +static bool spacemit_espi_property_enabled(struct device_node *np,
> +					   const char *name, bool default_value)
> +{
> +	if (of_find_property(np, name, NULL))
> +		return of_property_read_bool(np, name);
> +
> +	return default_value;
> +}

[Severity: Medium]
Can spacemit_espi_property_enabled() ever return false when default_value
is true?

of_property_read_bool() tests whether the property exists via
of_find_property(), so it always returns true once the if condition passes.
Because spacemit_espi_parse_dt() passes default_value =3D true for all six
boolean properties (crc-enable, peripheral-channel-enable,
vwire-channel-enable, oob-channel-enable, flash-channel-enable, and
auto-gating-enable), all six flags evaluate to true whether the properties
are present in the Device Tree or omitted, making it impossible for a board
DT to disable any of these features or channels.

[ ... ]

> +static int spacemit_espi_poll_status(struct spacemit_espi *espi, u32 exp=
ected)
> +{
> +	unsigned int timeout =3D ESPI_CFG_TIMEOUT_US / 10;
> +	u32 status;
> +
> +	writel(expected, espi->regs + ESPI_SLAVE0_INT_STS);
> +
> +	do {
> +		status =3D readl(espi->regs + ESPI_SLAVE0_INT_STS);
> +		if (!status) {
> +			fsleep(10);
> +			continue;
> +		}
> +
> +		writel(status, espi->regs + ESPI_SLAVE0_INT_STS);
> +
> +		if (status & expected)
> +			return 0;
> +
> +		if (status & (ESPI_PROTOCOL_INT | ESPI_RESPONSE_INT))
> +			return -EIO;
> +
> +		fsleep(10);
> +	} while (--timeout);
> +
> +	return -ETIMEDOUT;
> +}
> +
> +static int spacemit_espi_cmd_get_config(struct spacemit_espi *espi, u16 =
addr, u32 *value)
> +{
> +	int ret;
> +
> +	spacemit_espi_write_hdr(espi, 0, 0);
> +	spacemit_espi_write_hdr(espi, 1, addr >> 8);
> +	spacemit_espi_write_hdr(espi, 2, addr);
> +	spacemit_espi_trigger_cmd(espi, ESPI_DNCMD_GET_CONFIGURATION);
> +
> +	ret =3D spacemit_espi_poll_status(espi, ESPI_DNCMD_INT);

[Severity: Medium]
Does clearing expected in ESPI_SLAVE0_INT_STS inside
spacemit_espi_poll_status() race with command completion after
spacemit_espi_trigger_cmd() has already started the hardware transfer?

A short GET_CONFIGURATION or SET_CONFIGURATION transfer can finish and set
ESPI_DNCMD_INT before spacemit_espi_poll_status() executes its initial
write-1-to-clear writel(), wiping out the completion bit and causing a
50 ms -ETIMEDOUT failure.

In addition, spacemit_espi_send_inband_reset() does not clear
ESPI_SLAVE0_INT_STS after ESPI_DNCMD_IN_BAND_RESET, and
spacemit_espi_poll_status() only clears expected before the loop, leaving
any stale error bits pending.  Inside the loop, checking status & expected
before status & (ESPI_PROTOCOL_INT | ESPI_RESPONSE_INT) also masks bus or
protocol errors whenever ESPI_DNCMD_INT asserts alongside an error bit,
allowing spacemit_espi_cmd_get_config() to read invalid response bytes.

[ ... ]

> +static int spacemit_espi_init_locked(struct spacemit_espi *espi)
> +{
> +	u32 slave_caps =3D 0;
> +	u32 cfg;
> +	int ret;

[ ... ]

> +	if (espi->sclk && !IS_ERR(espi->sclk) && espi->op_freq_mhz) {
> +		ret =3D clk_set_rate(espi->sclk, espi->op_freq_mhz * 1000000UL);
> +		if (ret)
> +			dev_dbg(espi->dev, "failed to set sclk rate: %d\n", ret);
> +	}

[Severity: Medium]
Does calling clk_set_rate() on espi->sclk before capability negotiation
actually configure the K3 eSPI serial clock frequency?

In the K3 clock controller, espi_sclk_src owns the 20/25/33/50/66 MHz
parent mux while espi_sclk is defined without CLK_SET_RATE_PARENT:

drivers/clk/spacemit/ccu-k3.c:
    static const struct clk_parent_data espi_sclk_src_parents[] =3D {
    	CCU_PARENT_HW(pll2_20),
    	CCU_PARENT_HW(pll2_25),
    	CCU_PARENT_HW(pll2_33),
    	CCU_PARENT_HW(pll2_50),
    	CCU_PARENT_HW(pll2_66),
    };
    CCU_MUX_DEFINE(espi_sclk_src, espi_sclk_src_parents, APMU_ESPI_CLK_RES_=
CTRL, 4, 3, 0);

    static const struct clk_parent_data espi_sclk_parents[] =3D {
    	CCU_PARENT_NAME(external_clk),
    	CCU_PARENT_HW(espi_sclk_src),
    };
    CCU_MUX_GATE_DEFINE(espi_sclk, espi_sclk_parents, APMU_ESPI_CLK_RES_CTR=
L, 7, 1, BIT(3), 0);

Because spacemit_espi_probe() only acquires "sclk" and never "sclk_src",
clk_set_rate(espi->sclk, ...) only evaluates the current rate of its
immediate parents and never switches espi_sclk_src to the requested divider.
Furthermore, setting the clock rate to espi->op_freq_mhz before in-band
reset and spacemit_espi_build_negotiated_config() leaves the serial clock
unaligned with ESPI_SLAVE0_CONFIG and ESPI_SLAVE_GEN_CFG if the slave
negotiates a lower operating frequency.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261118085742.1817=
536-1-yang.wang@deepcomputing.io?part=3D3
