Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBC7942847C
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 10:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780481183; cv=pass; b=ookWtRlPmirb5X+/ovNRSVo2GJ1t4kBTED5gVu7m7fH4s/ORiMl48HhM9FHECYXp36ZK/9Rqv0DEVu/kLBkcrL4alm2OQgp/rFxcB6hXvyBwwQkBU8SyN49o7bMYM1digKEorrL3bMwwoJliwXtyd2mYe2o5zuqzCSbJYMXK5LE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780481183; c=relaxed/simple;
	bh=PVRWCeqoQfFcGEkI94WpSvOM/jrm67OKH/kG9CG7SK8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JjGcAOwUDGwb+SWgQ0CJNf+o5XxbKCGNUveiYqx1DXvzr1WP9llPMZbv1OQ2TqQ5W3sNTJ6LaE3HyeBve1zS0fX4Fk+7LO89e9GaODHbdX3XWoZ9LepZFTQtaNdAFjKnBvVZ88lVCf7u1Cn27vLeqdc45oXBfjGWTPCOVvcTUpU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Jr6CD+G4; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Uv1kWKgy; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Jr6CD+G4";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Uv1kWKgy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1780481181;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=szmw41mx+6XBYQACHrQkcIv+dFLdnR82AVyDnrz/Mp4=;
	b=Jr6CD+G4ZCq5DpBh0Na1Lhx0/nU7Mgh49own1itI5AOhHF/ekDzjEsYvBc/gL6GQv6LA8N
	Fn0+P8QIzJkudfk0sCWisSu7lUy1JMYR5V/n351OdLw8iPj1fgFEQcfe5sDMGusA7DF8R5
	91tnGSdsd3kXkmgYb268uMTbUwFmLx0=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-62-2wUp36tEPOikAfLpMEzYVA-1; Wed, 03 Jun 2026 06:06:19 -0400
X-MC-Unique: 2wUp36tEPOikAfLpMEzYVA-1
X-Mimecast-MFC-AGG-ID: 2wUp36tEPOikAfLpMEzYVA_1780481178
Received: by mail-lj1-f199.google.com with SMTP id 38308e7fff4ca-3967739401aso2666351fa.2
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 03:06:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780481178; cv=none;
        d=google.com; s=arc-20240605;
        b=OIQ4KEdJIEEbAZ8gYCMu8zmdDKiPV7rPPnENHNSJBv2Ouk8FsKYXHOef65BcJ6r/PG
         5OVxHb5nNBGdQwyJHn06qF/+wV0GWCCrHkfIBnD/rasvGLT0T7Nnf1g9qzwpyRXSIAyC
         gs5a6w21zey9Oi/pBG5d8mUlkZoUGfhRIvOwCYfdKkwcmqsbDLz8R21B90K/WW9fVdhs
         hMroKCDNfSCyFBWGC/RqacdKeTESJIdGcwFmTxjXLO2E/+6vRXG0AA1LqRc/LMgZn1lo
         FteyaOg9ucP7d/MljBTizFEk85TMrIWamoPBbK0sPs7jkVU3BzwPkFIV2jy4s5/quW/z
         o2IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=szmw41mx+6XBYQACHrQkcIv+dFLdnR82AVyDnrz/Mp4=;
        fh=1QaE+OL9NiJZo9//WvlsHlEmGsV+wA0Pf6gHRDH2wZc=;
        b=H+F0hdGuFfMAVRlJevmWexZUL3cu7/TnryxGX99M1rLKFECluLvgSc9MDLoppX8R28
         QyIhbl/s28OdEIWQ56hcJRHzjF2u9RD2yEBZdH0JrqCuD9+W/UlPohcJh3pX2U2JHzcT
         4yXCh032DAC3cR7mBXo4Ii82KMATCsIyOtQs9NuJzjsdw2KSYV69MgiJ1+66fy3cWuIt
         J58fRqTJ/6zatRsbnl9orj7orKDSkLWYvGqW+giO2lgCRbVkK+cHLWL7mCOmSbkqdKIU
         RQl7cRlV5d8uWz41SfyyuJ6haVmJgx4G2235qnlQZuZ7SfqWlPjt4cAYLhNxXoZkytCc
         ANGA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1780481178; x=1781085978; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=szmw41mx+6XBYQACHrQkcIv+dFLdnR82AVyDnrz/Mp4=;
        b=Uv1kWKgyFHNmjv9vd6r7Yp2ty6AazyiO6Jot01FY4E8JEcy4DpBiRXqTAFyWufE+TT
         X6cM25kTO3Ks/mUQphnLt5aJNo63F5Uq0MvduKZMsjUUZsjxv7hRLDAwFmo6YwMm+15D
         csax9xggtyZ3od040Lgk81SnhDJXyDLI7QOUFa1NsVqwnBIWv7E+SyYnbX7ArjFoCNfu
         jGijwRjJGdEp3TvZHcCWZP0YwIAbmCWfRZWFogmepIGcTp7gbmNqLHqvqS9xFh9H0vam
         b2IwyarqacckRvcQ8znSg3umKaeVhC1SJFUZFN617NvSRRwj4E2zbLmZ3vhX93zK0043
         0mHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780481178; x=1781085978;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=szmw41mx+6XBYQACHrQkcIv+dFLdnR82AVyDnrz/Mp4=;
        b=D4E+6xIgaIt7a3uFFR1emL9bxeErG1N9qDZYAJXP5KPcglJuKd+S3kqyoQn4p8bi9j
         DQZN4ZmPe8Jb73eC6XSsVKCQNg0wdwMrSoEEIBSzcdhh8TzqFdWe5aQ0XB/nJHAmV3gH
         Sx337jycvRhtjTwQaYt4uyWaOJ1V6K92AIxDVMb6Ln4cGqV3mJk5jWPhgQT7NdzZxzwH
         UO38H3w0yJ9I+680kcnyjj8eynLHB1DBZtRGj4atHayxv/dgSaJyLKw0xBE95m9XGCgg
         h+3QvJ94wjd2mjSzGuLSY6opnasUM01N/t4y0Xy447TpKLLcCe1W4RhNdqeCV3M94bbg
         7Juw==
X-Forwarded-Encrypted: i=1; AFNElJ9hthoe1FdTXw36PJ+Fko4jFDYcF7fttuR/8tUSSUJHE2J7Zc07c5vZ+3Z+lWB9AwtPB3yLw2rX1KrZ@vger.kernel.org
X-Gm-Message-State: AOJu0YzgW9jUHqeSCxbpRNUqU1jNHXw2u6v0TlrBbU8adZpHhNcwiyPp
	7cmoAyal60ejWentylcS5QtKPgUILq+lm1FOlrl8vrvYPvrhYVZtpIlNHZ5sihvHksbSNmzAMlj
	JEeFfCvJzAS02jn2nxgBWV29ELtuofFDAF7YfSylaF0DFt2LhHyAM/vaDGTD8oqrqdhWuVz5fKV
	OAiN6t+FtD8zTPdJxSJLLH9vOkHCpDQQmZ7rEh3w==
X-Gm-Gg: Acq92OFUw8rUIjxDxoHSiVLQI2ogvhqzzcl5ieOs5fDx3+f2ij5GwWI5rGboEy/dMZm
	6QcwmIr+b4ZjoH+IXxyxNJD1+NJb1niqsofdDBXKk6w0QzqLMniXxe8+fthNjoM0Kqvb+mLt15E
	jWlhFmn/c7UA0V8zzwG6MRkSS1nqYDhh84jA4O6zknfEK63V4RiQt52UAqr7b/+/gUkM5Jh8npL
	JrlPIrfB6M0MrYn
X-Received: by 2002:a05:651c:315:b0:396:87d2:3b1b with SMTP id 38308e7fff4ca-396ac1f9945mr3945681fa.2.1780481178011;
        Wed, 03 Jun 2026 03:06:18 -0700 (PDT)
X-Received: by 2002:a05:651c:315:b0:396:87d2:3b1b with SMTP id
 38308e7fff4ca-396ac1f9945mr3945461fa.2.1780481177385; Wed, 03 Jun 2026
 03:06:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260603071342.641874-1-ciprianmarian.costea@oss.nxp.com> <20260603071342.641874-2-ciprianmarian.costea@oss.nxp.com>
In-Reply-To: <20260603071342.641874-2-ciprianmarian.costea@oss.nxp.com>
From: Enric Balletbo i Serra <eballetb@redhat.com>
Date: Wed, 3 Jun 2026 12:06:05 +0200
X-Gm-Features: AVHnY4LQCfd00tH5rxiK5efFUUkj2NKbx685IUyczLcBMy4pwr5STR5N8-L7DP8
Message-ID: <CALE0LRvQfsD7MZ2To5S1Yh90pVNKvqNWy=FGpXuGcPa1yEZSkA@mail.gmail.com>
Subject: Re: [PATCH RESEND v4 1/8] can: flexcan: use dedicated IRQ handlers
 for multi-IRQ platforms
To: Ciprian Costea <ciprianmarian.costea@oss.nxp.com>
Cc: Marc Kleine-Budde <mkl@pengutronix.de>, Vincent Mailhol <mailhol@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, linux-can@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, NXP S32 Linux Team <s32@nxp.com>, 
	Christophe Lizzi <clizzi@redhat.com>, Alberto Ruiz <aruizrui@redhat.com>, 
	Eric Chanudet <echanude@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ciprian,

Thank you for the patch series.

On Wed, Jun 3, 2026 at 9:14=E2=80=AFAM Ciprian Costea
<ciprianmarian.costea@oss.nxp.com> wrote:
>
> From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
>
> On platforms with multiple IRQ lines (S32G2, MCF5441X), all lines are
> registered to the same flexcan_irq() handler. Since these are distinct IR=
Q
> numbers, they can be dispatched concurrently on different CPUs. Both
> instances then read the same iflag and ESR registers unconditionally,
> leading to duplicate frame processing.
>
> Fix this by splitting the monolithic handler into focused parts:
> - flexcan_do_mb(): processes mailbox events
> - flexcan_do_state(): processes device state change events
> - flexcan_do_berr(): processes bus error events
>
> Introduce dedicated IRQ handlers for multi-IRQ platforms:
> - flexcan_irq_mb(): mailbox-only, used for mb-0, mb-1 IRQ lines
> - flexcan_irq_boff(): state-change-only, used for boff/state IRQ line
> - flexcan_irq_berr(): bus-error-only, used for berr IRQ line
>
> The combined flexcan_irq() handler is preserved for single-IRQ
> platforms with no functional change.
>
> Fixes: d9cead75b1c6 ("can: flexcan: add mcf5441x support")
> Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>

Adding here because it doesn't seem to have a cover letter. With the
full series applied on top of the current mainline

Tested-by: Enric Balletbo i Serra <eballetb@.redhat.com>

Tested on the NXP S32G399A-RDB3 with loopback and high-rate traffic.
No regressions observed: CAN frames transmit and receive correctly,
with no duplicates.
Frame reception showed no errors under stress testing.

Thanks,
   Enric
> ---
>  drivers/net/can/flexcan/flexcan-core.c | 128 +++++++++++++++++++++----
>  1 file changed, 111 insertions(+), 17 deletions(-)
>
> diff --git a/drivers/net/can/flexcan/flexcan-core.c b/drivers/net/can/fle=
xcan/flexcan-core.c
> index f5d22c61503f..f73ff442d530 100644
> --- a/drivers/net/can/flexcan/flexcan-core.c
> +++ b/drivers/net/can/flexcan/flexcan-core.c
> @@ -1070,16 +1070,14 @@ static struct sk_buff *flexcan_mailbox_read(struc=
t can_rx_offload *offload,
>         return skb;
>  }
>
> -static irqreturn_t flexcan_irq(int irq, void *dev_id)
> +/* Process mailbox (RX + TX) events */
> +static irqreturn_t flexcan_do_mb(struct net_device *dev)
>  {
> -       struct net_device *dev =3D dev_id;
>         struct net_device_stats *stats =3D &dev->stats;
>         struct flexcan_priv *priv =3D netdev_priv(dev);
>         struct flexcan_regs __iomem *regs =3D priv->regs;
>         irqreturn_t handled =3D IRQ_NONE;
>         u64 reg_iflag_tx;
> -       u32 reg_esr;
> -       enum can_state last_state =3D priv->can.state;
>
>         /* reception interrupt */
>         if (priv->devtype_data.quirks & FLEXCAN_QUIRK_USE_RX_MAILBOX) {
> @@ -1131,25 +1129,57 @@ static irqreturn_t flexcan_irq(int irq, void *dev=
_id)
>                 netif_wake_queue(dev);
>         }
>
> +       return handled;
> +}
> +
> +/* Process bus error events */
> +static irqreturn_t flexcan_do_berr(struct net_device *dev)
> +{
> +       struct flexcan_priv *priv =3D netdev_priv(dev);
> +       struct flexcan_regs __iomem *regs =3D priv->regs;
> +       irqreturn_t handled =3D IRQ_NONE;
> +       u32 reg_esr;
> +
>         reg_esr =3D priv->read(&regs->esr);
>
> -       /* ACK all bus error, state change and wake IRQ sources */
> -       if (reg_esr & (FLEXCAN_ESR_ALL_INT | FLEXCAN_ESR_WAK_INT)) {
> +       /* ACK bus error interrupt source */
> +       if (reg_esr & FLEXCAN_ESR_ERR_INT) {
>                 handled =3D IRQ_HANDLED;
> -               priv->write(reg_esr & (FLEXCAN_ESR_ALL_INT | FLEXCAN_ESR_=
WAK_INT), &regs->esr);
> +               priv->write(FLEXCAN_ESR_ERR_INT, &regs->esr);
>         }
>
> -       /* state change interrupt or broken error state quirk fix is enab=
led */
> -       if ((reg_esr & FLEXCAN_ESR_ERR_STATE) ||
> -           (priv->devtype_data.quirks & (FLEXCAN_QUIRK_BROKEN_WERR_STATE=
 |
> -                                          FLEXCAN_QUIRK_BROKEN_PERR_STAT=
E)))
> -               flexcan_irq_state(dev, reg_esr);
> -
>         /* bus error IRQ - handle if bus error reporting is activated */
>         if ((reg_esr & FLEXCAN_ESR_ERR_BUS) &&
>             (priv->can.ctrlmode & CAN_CTRLMODE_BERR_REPORTING))
>                 flexcan_irq_bus_err(dev, reg_esr);
>
> +       return handled;
> +}
> +
> +/* Process device state change events */
> +static irqreturn_t flexcan_do_state(struct net_device *dev)
> +{
> +       struct flexcan_priv *priv =3D netdev_priv(dev);
> +       struct flexcan_regs __iomem *regs =3D priv->regs;
> +       irqreturn_t handled =3D IRQ_NONE;
> +       u32 reg_esr;
> +       enum can_state last_state =3D priv->can.state;
> +
> +       reg_esr =3D priv->read(&regs->esr);
> +
> +       /* ACK state change and wake IRQ sources */
> +       if (reg_esr & (FLEXCAN_ESR_ERR_STATE | FLEXCAN_ESR_WAK_INT)) {
> +               handled =3D IRQ_HANDLED;
> +               priv->write(reg_esr & (FLEXCAN_ESR_ERR_STATE | FLEXCAN_ES=
R_WAK_INT),
> +                               &regs->esr);
> +       }
> +
> +       /* state change interrupt or broken error state quirk fix is enab=
led */
> +       if ((reg_esr & FLEXCAN_ESR_ERR_STATE) ||
> +           (priv->devtype_data.quirks &
> +           (FLEXCAN_QUIRK_BROKEN_WERR_STATE | FLEXCAN_QUIRK_BROKEN_PERR_=
STATE)))
> +               flexcan_irq_state(dev, reg_esr);
> +
>         /* availability of error interrupt among state transitions in cas=
e
>          * bus error reporting is de-activated and
>          * FLEXCAN_QUIRK_BROKEN_PERR_STATE is enabled:
> @@ -1188,6 +1218,65 @@ static irqreturn_t flexcan_irq(int irq, void *dev_=
id)
>                 }
>         }
>
> +       return handled;
> +}
> +
> +/* Combined IRQ handler for single-IRQ platforms */
> +static irqreturn_t flexcan_irq(int irq, void *dev_id)
> +{
> +       struct net_device *dev =3D dev_id;
> +       struct flexcan_priv *priv =3D netdev_priv(dev);
> +       irqreturn_t handled;
> +
> +       handled =3D flexcan_do_mb(dev);
> +       handled |=3D flexcan_do_state(dev);
> +       handled |=3D flexcan_do_berr(dev);
> +
> +       if (handled)
> +               can_rx_offload_irq_finish(&priv->offload);
> +
> +       return handled;
> +}
> +
> +/* Mailbox IRQ handler for multi-IRQ platforms */
> +static irqreturn_t flexcan_irq_mb(int irq, void *dev_id)
> +{
> +       struct net_device *dev =3D dev_id;
> +       struct flexcan_priv *priv =3D netdev_priv(dev);
> +       irqreturn_t handled;
> +
> +       handled =3D flexcan_do_mb(dev);
> +
> +       if (handled)
> +               can_rx_offload_irq_finish(&priv->offload);
> +
> +       return handled;
> +}
> +
> +/* Bus error IRQ handler for multi-IRQ platforms */
> +static irqreturn_t flexcan_irq_berr(int irq, void *dev_id)
> +{
> +       struct net_device *dev =3D dev_id;
> +       struct flexcan_priv *priv =3D netdev_priv(dev);
> +       irqreturn_t handled;
> +
> +       handled =3D flexcan_do_berr(dev);
> +
> +       if (handled)
> +               can_rx_offload_irq_finish(&priv->offload);
> +
> +       return handled;
> +}
> +
> +/* Device state change IRQ handler for multi-IRQ platforms */
> +static irqreturn_t flexcan_irq_boff(int irq, void *dev_id)
> +{
> +       struct net_device *dev =3D dev_id;
> +       struct flexcan_priv *priv =3D netdev_priv(dev);
> +       irqreturn_t handled;
> +
> +       handled =3D flexcan_do_state(dev);
> +
>         if (handled)
>                 can_rx_offload_irq_finish(&priv->offload);
>
> @@ -1761,25 +1850,30 @@ static int flexcan_open(struct net_device *dev)
>
>         can_rx_offload_enable(&priv->offload);
>
> -       err =3D request_irq(dev->irq, flexcan_irq, IRQF_SHARED, dev->name=
, dev);
> +       if (priv->devtype_data.quirks & FLEXCAN_QUIRK_NR_IRQ_3)
> +               err =3D request_irq(dev->irq, flexcan_irq_mb,
> +                                 IRQF_SHARED, dev->name, dev);
> +       else
> +               err =3D request_irq(dev->irq, flexcan_irq,
> +                                 IRQF_SHARED, dev->name, dev);
>         if (err)
>                 goto out_can_rx_offload_disable;
>
>         if (priv->devtype_data.quirks & FLEXCAN_QUIRK_NR_IRQ_3) {
>                 err =3D request_irq(priv->irq_boff,
> -                                 flexcan_irq, IRQF_SHARED, dev->name, de=
v);
> +                                 flexcan_irq_boff, IRQF_SHARED, dev->nam=
e, dev);
>                 if (err)
>                         goto out_free_irq;
>
>                 err =3D request_irq(priv->irq_err,
> -                                 flexcan_irq, IRQF_SHARED, dev->name, de=
v);
> +                                 flexcan_irq_berr, IRQF_SHARED, dev->nam=
e, dev);
>                 if (err)
>                         goto out_free_irq_boff;
>         }
>
>         if (priv->devtype_data.quirks & FLEXCAN_QUIRK_SECONDARY_MB_IRQ) {
>                 err =3D request_irq(priv->irq_secondary_mb,
> -                                 flexcan_irq, IRQF_SHARED, dev->name, de=
v);
> +                                 flexcan_irq_mb, IRQF_SHARED, dev->name,=
 dev);
>                 if (err)
>                         goto out_free_irq_err;
>         }
> --
> 2.43.0
>

