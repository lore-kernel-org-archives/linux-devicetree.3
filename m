Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795547249;
	b=2APqKMlSZUgbi+ityB0uEVLB/pzbCszCj3DyzuTPVcyqdk/xTSaluTteYyAjdhaudXRs
	 /sLRY3Bdlw8RIToA1iOvhEhdvcg7N0Tan2Fu7VJfo8QW5GKc4Ecxnpt7ek5VTCFrJZQcp
	 1JD+JrFb6zhA7nyHp1K8ztub8x+MA9bF4L8fX6S36dEKSl4BxJDeJ7i6lXu3ZgqH0idR/
	 AHRugfvt7zyuQsFkaEqnblnUrjCBkLf/T17IhwN7BfPg3z0+DFrbZyW7YgJHnoPskpi/U
	 MmZ7dhSNeQK3fr6FFdNeFG9kmQjKSju3u7SsvUD1Spm0Q8gmHqtu1JT7z7HjnUVeNeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795547249;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=CJanrJs7yvb1YJUtPV1YKZ7EHe5Q1L9dfnGc1BuHClg=;
	b=C8mnqFNub6ywr5moZXeMhfQJ8fhKeAJo7XQfmQBSX4yj2jKdKBxNIOxWAQaiD4hIZto/
	 V7swpiyMm0hmXIAiYzjYlqQNqKcTUhvg6KEXEWzl11EzFwVgXLAn9FqwJaPI5u9sBI3HQ
	 XrBlyp+Vn3seqSYVmfft6fmggjLkk7WuNe7PNvNRui0hG9HBDZkWR7pPRjPq75t4Um78e
	 hMTOXg9ipwFpaM2R/MKPw3LM/YjCOjnIalVyWckVaMe7B4J3HqjyMmxTAArIdQMugj+2I
	 NQA6rk4EuUrp2NleIxcZQtrAL8ieWCuykiGGke945NjNRO23OavyGrft5xsMGiroJ9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RxaVxQSJ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FCDB606A33D;
	Tue, 24 Nov 2026 19:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RxaVxQSJ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7ACE61F000D3;
	Tue, 24 Nov 2026 19:07:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795547249;
	bh=CJanrJs7yvb1YJUtPV1YKZ7EHe5Q1L9dfnGc1BuHClg=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=RxaVxQSJcH6bKP5rkh6k+DOLFTTgJcsY2PWxjpD6tz1wUXzxAJLsDV74+KJ49wu4o
	 JeXBFzbpq60p2oJA6DqJEfBNYZU2RC4Lt0rQ1yt9RogATf8LkjK3w3p1ZTVhQZjqFw
	 c1GhKFYPJp3NpsOm+qKWqTbjFhfxVzo7TNOgnT8ba2n2hmsY9FuMojNjvUc8eRwJWW
	 3E1PbbWdYVThx4fls29o4uE+zASBiF6COJbOa5S5WLb5VPaUGKauptSxBeIQztxyAj
	 P5EfcfBsTwc2DkduT/YVw7e2K70StKnS/cztH8+xIuvkZEC8S6J7egaIPR5brJjpLG
	 tl4faJaG5OIrA==
Subject: Re: [PATCH net-next 2/3] net: mdio: Add Cortina CS7542 bus controller
From: netdev-bot+sashiko@kernel.org
To: filipp.dunsky@gmail.com
Cc: davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
 pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 andrew@lunn.ch, hkallweit1@gmail.com, linux@armlinux.org.uk,
 andrew+netdev@lunn.ch, netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Tue, 24 Nov 2026 19:07:28 +0000
Message-ID: <179554724805.3135.16586449147336941619@kernel.org>
In-Reply-To: <20261123-b4-cs7542-mdio-v1-2-626d0a0e3b4d@gmail.com>
References: <20261123-b4-cs7542-mdio-v1-2-626d0a0e3b4d@gmail.com>
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

- [Medium] In drivers/net/mdio/mdio-cs75xx.c, a single transaction
  timeout can leave the MDIO bus permanently unusable.
- [Medium] cs75xx_mdio_probe() sets MDIO_CFG_MANUAL while keeping all
  other firmware CFG bits (lines 105-108).
- [Low] In drivers/net/mdio/mdio-cs75xx.c, cs75xx_mdio_wait() polls with
  readl_poll_timeout_atomic() (1 us udelay steps, 10 ms timeout).
- [Low] In drivers/net/mdio/Kconfig, `config MDIO_CS75XX` is added after
  both `endmenu` lines (lines 292-293).

--

net: mdio: Add Cortina CS7542 bus controller

This adds a platform MDIO bus driver for the Cortina CS7542. It does
Clause 22 reads and writes and keeps the firmware-programmed prescaler
while it switches the controller to manual mode. Transactions are polled
with a bounded timeout, and a pending flag makes the driver wait for a
timed-out frame before it programs the next one.

> diff --git a/drivers/net/mdio/Kconfig b/drivers/net/mdio/Kconfig
> index d44278f26fabe..a20fec8058da9 100644
> --- a/drivers/net/mdio/Kconfig
> +++ b/drivers/net/mdio/Kconfig
> @@ -291,3 +291,16 @@ config MDIO_BUS_MUX_MMIOREG
>  
>  endmenu
>  endmenu
> +
> +config MDIO_CS75XX
> +	tristate "Cortina Systems CS7542 MDIO controller"
> +	depends on OF_MDIO && HAS_IOMEM

[Severity: Low]
Should this entry go inside the "MDIO controller drivers" menu instead of
after both endmenu lines?

Where it is now, it falls outside that menu and its "depends on PHYLIB",
and also outside "MDIO Multiplexers". So it shows up directly under
"Network device support" in menuconfig. PHYLIB still applies, but only
indirectly through OF_MDIO.

The Makefile entry is also added after the mux entries rather than with
the other controllers:

obj-$(CONFIG_MDIO_CS75XX) += mdio-cs75xx.o

This Kconfig hunk also leaves a trailing blank line at the end of the file.

Sibling platform controllers (MDIO_AIROHA, MDIO_SUN4I, MDIO_XGENE,
MDIO_ASPEED) also use "depends on ARCH_xxx || COMPILE_TEST". No ARCH
symbol for this SoC exists in the tree yet, so that gate can't be copied
directly.

[ ... ]

> diff --git a/drivers/net/mdio/mdio-cs75xx.c b/drivers/net/mdio/mdio-cs75xx.c
> new file mode 100644
> index 0000000000000..0761d3cefaa4f
> --- /dev/null
> +++ b/drivers/net/mdio/mdio-cs75xx.c
> @@ -0,0 +1,136 @@

[ ... ]

> +static int cs75xx_mdio_wait(struct cs75xx_mdio *priv)
> +{
> +	u32 val;
> +	int ret;
> +
> +	ret = readl_poll_timeout_atomic(priv->base + PER_MDIO_CTRL, val,
> +					val & MDIO_CTRL_DONE, 1,
> +				       CS75XX_MDIO_TIMEOUT_US);

[Severity: Low]
Is the atomic poll variant needed here?

The only path to cs75xx_mdio_wait() is through the bus->read and
bus->write callbacks, called from __mdiobus_read() and __mdiobus_write().
Those assert that bus->mdio_lock (a mutex) is held and must not be called
from interrupt context, so sleeping is allowed here.

On a timeout this spins in udelay() for the full 10 ms while holding the
mutex. Because of the pending handling in cs75xx_mdio_read() and
cs75xx_mdio_write(), every later access spins another 10 ms before it
returns -ETIMEDOUT. A bus scan or phylib polling repeats that.

Most other drivers in drivers/net/mdio/ (aspeed, hisi-femac, ipq4019,
bcm-unimac, iproc, pic64hpsc) use readl_poll_timeout() or
read_poll_timeout() instead.

> +	if (!ret) {
> +		writel(MDIO_CTRL_DONE, priv->base + PER_MDIO_CTRL);
> +		priv->pending = false;
> +	}
> +	return ret;
> +}
> +
> +static int cs75xx_mdio_read(struct mii_bus *bus, int phy, int reg)
> +{
> +	struct cs75xx_mdio *priv = bus->priv;
> +	int ret;
> +
> +	/* A timed-out frame must finish before programming another address. */
> +	if (priv->pending) {
> +		ret = cs75xx_mdio_wait(priv);
> +		if (ret)
> +			return ret;
> +	}

[Severity: Medium]
Can one timeout leave the bus permanently unusable?

priv->pending is set before MDIO_CTRL_START is written.
cs75xx_mdio_wait() clears it only when it sees MDIO_CTRL_DONE, so after
-ETIMEDOUT it stays true.

Every later cs75xx_mdio_read() or cs75xx_mdio_write() takes this branch
first. If that wait also times out, the function returns before it
touches PER_MDIO_ADDR or PER_MDIO_CTRL, so no new frame is ever started.

Nothing else clears pending: there is no bus->reset, no retry limit and
no controller re-arm. Suppose the controller never reports DONE for the
timed-out frame (START not latched, frame dropped, MDC stopped). Then every
access to every PHY on this bus fails with -ETIMEDOUT after a 10 ms spin,
until the driver is unbound and rebound.

A Clause 22 frame normally takes tens of microseconds, so a 10 ms timeout
probably means DONE will never arrive. That is exactly the case where
this guard turns one failure into a permanent one. The hardware
documentation doesn't say whether a completion can be lost.

The Kconfig help text says:

  Transactions use bounded polling and recover from late completion.

That covers a completion that arrives late, but there doesn't seem to be
any recovery when it never arrives. cs75xx_mdio_write() has the same
pre-wait. The other patches in the series (dt-bindings and MAINTAINERS)
don't touch the driver, so this is still present at the end of the
series.

> +	writel(MDIO_CTRL_DONE, priv->base + PER_MDIO_CTRL);
> +	writel(MDIO_ADDR_READ | FIELD_PREP(MDIO_ADDR_REG, reg) |
> +	       FIELD_PREP(MDIO_ADDR_PHY, phy), priv->base + PER_MDIO_ADDR);
> +	priv->pending = true;
> +	writel(MDIO_CTRL_START, priv->base + PER_MDIO_CTRL);
> +	ret = cs75xx_mdio_wait(priv);
> +	if (ret)
> +		return ret;
> +	return readl(priv->base + PER_MDIO_RDDATA) & 0xffff;
> +}

[ ... ]

> +static int cs75xx_mdio_probe(struct platform_device *pdev)
> +{

[ ... ]

> +	cfg = readl(priv->base + PER_MDIO_CFG);
> +	/* The firmware configures the MDC rate; retain its prescaler. */
> +	cfg |= MDIO_CFG_MANUAL;
> +	writel(cfg, priv->base + PER_MDIO_CFG);
> +	writel(MDIO_CTRL_DONE, priv->base + PER_MDIO_CTRL);

[Severity: Medium]
What happens if a frame is still in flight when probe runs?

Probe sets MDIO_CFG_MANUAL and clears DONE once. It leaves priv->pending
at its zero-initialized false and never checks that the controller is
idle.

A frame could still be outstanding in two cases:

  - a firmware-driven or non-manual mode, which MDIO_CFG_MANUAL implies
    exists
  - a previous driver instance that was unbound after a timeout

The first cs75xx_mdio_read() then skips the drain step. Suppose the old
frame completes after the DONE clear at the top of cs75xx_mdio_read() but
before the poll. readl_poll_timeout_atomic() would then see the old
frame's DONE, and the function would return that frame's PER_MDIO_RDDATA
as the value for the new phy/reg.

That could give a wrong PHY ID during the of_mdiobus_register() scan, or
a wrong BMSR value.

The commit message says:

  After a timeout, wait for the outstanding frame before programming
  another address so a late completion cannot be mistaken for the next
  transaction.

Should probe also make sure the controller is idle, so the first
transaction after probe gets the same protection?

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261123-b4-cs7542-mdio-v1-0-626d0a0e3b4d%40gmail.com
