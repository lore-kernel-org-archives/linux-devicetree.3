Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7623F358D32
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 16:47:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787158054; cv=none; b=tHXPxw6fR5R5O2mjDx+h7BDemz7jusavqHQVAzx9lsNyVKB45e92DpP2ihbhLKwv6TJOPvKwmyaWZcfZwMPQfjJiuG2qT0mTrFGu9+iPmNTCKp1o2z9FQvZt2I/THnOwI5s4ig8FjdsXOoPed0uPPH/FjYGJlz8vXSsEsTODYdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787158054; c=relaxed/simple;
	bh=e9GgHCNPuid9gUGeBM7H98wjkG10SfaVLnePkn00HUc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=VG6b8fMjZhKyRyzU6+kWuqSMcLStCS4GN36bsSKth8jMq74DUx3VlM85q8ny9KqMQNoGbEEsR3ARfArs+++Xg9EMGca+Kyo+CcmwxK586omrvkItKG05CUbAd2JT+FHyHQtyjV8+nfLGARAqHZPLFYHLx+MY2jlWWbex/jL9rWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N6x6saeA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N6x6saeA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9A881F000E9;
	Wed, 19 Aug 2026 16:47:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787158052;
	bh=XUGhEVRS1sFUBAIFtxnimd8w63S9FmBkWDt47LBNFZw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=N6x6saeAIESeXsEpL4jK9+LNUg/pQOcA7Hzf0kIXwbrJX+EILy5EVsVEn6WDwMr2r
	 yL3EkGa8KjDj0MmMFsUJibT0bSpgI7dcKUHpvwlFMfhilb8I4oZhIJVuaNLxsUFMJg
	 GeLF9znAc8jkZyUmIqczNqHSOPd6SOzRMYvxBXsbxHIhjO1O0yabhQktHCizWPMbnL
	 /FQI5HDbU7jPZcJcoa3lLVrg/jYJe5RSzlHQVHtVfrG3TxajVmsEzCWfl34RE4oppR
	 t384hl0V3bjb/xSU6reKR+GvK/cFligHZLSQa8O65q3cpOJxzjjO7CVS2atK+ji405
	 9g6NEzCbaLfhw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/4] usb: typec: ucpd: Add ST UCPD driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Marek Vasut" <marex@nabladev.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260819163410.119755-2-marex@nabladev.com>
References: <20260819163410.119755-1-marex@nabladev.com>
 <20260819163410.119755-2-marex@nabladev.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 19 Aug 2026 16:47:32 +0000
Message-Id: <20260819164732.B9A881F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 10 potential issue=
(s) to consider:
- [Critical] Stack buffer overflow in `ucpd_pd_read_message` due to unbound=
ed reading of incoming PD messages.
- [High] Uninitialized variable `ret` is returned from `tcpm_set_vconn` on =
early bail-out paths.
- [High] Resource leaks for `fwnode_handle` and `typec_switch` in `ucpd_pro=
be` and `ucpd_remove`.
- [High] Invalid use of `IS_ERR()` to check the return value of `device_get=
_named_child_node()`.
- [High] The threaded IRQ handler is requested before the TCPM port is full=
y registered, causing a NULL pointer dereference on early interrupts.
- [High] The IRQ handler remains active after the TCPM port's workqueue is =
destroyed, leading to a Use-After-Free during teardown.
- [High] The function `tcpm_decode_cc` maps CC voltage states incorrectly w=
hen operating as a Sink.
- [High] Manual software generation of a GoodCRC for invalid or truncated P=
D messages inside a threaded IRQ violates USB PD requirements.
- [High] Ignoring the timeout when waiting for the previous transmission to=
 complete can corrupt the hardware state.
- [Medium] Data race on port roles (`pwr_role` and `data_role`) as they are=
 updated without a lock but read under a lock.
--

--- Patch [2]: [PATCH 2/4] usb: typec: ucpd: Add ST UCPD driver ---
commit 2b9c556a7989ba29cde859ea3a479a2ad6876950
Author: Marek Vasut <marex@nabladev.com>

usb: typec: ucpd: Add ST UCPD driver

Add ST UCPD Type-C block driver. The UCPD integrates the physical
layer of the Power Delivery (PD), with CC signaling method, for
operation with Type-C cables.

> diff --git a/drivers/usb/typec/tcpm/ucpd.c b/drivers/usb/typec/tcpm/ucpd.c
> new file mode 100644
> index 0000000000000..fa7c0ffbfd577
> --- /dev/null
> +++ b/drivers/usb/typec/tcpm/ucpd.c

[ ... ]

> +static enum typec_cc_status tcpm_decode_cc(const int cr, const int cc)
> +{
> +	bool sink =3D !!(cr & UCPD_CR_ANAMODE);
> +
> +	switch (cc) {
> +	case UCPD_SR_TYPEC_VSTATE_CC_LOWEST:
> +		return TYPEC_CC_RA;
> +	case UCPD_SR_TYPEC_VSTATE_CC_LOW:
> +		return TYPEC_CC_RD;

[Severity: High]
When operating as a Sink, the CC line is pulled up by the partner's Rp.
A LOWEST state (0V) means unattached (TYPEC_CC_OPEN), and a LOW state
corresponds to TYPEC_CC_RP_DEF.

Does returning TYPEC_CC_RA and TYPEC_CC_RD unconditionally here cause the
TCPM state machine to fail to detect chargers correctly?

> +	case UCPD_SR_TYPEC_VSTATE_CC_HIGH:
> +		return sink ? TYPEC_CC_RP_1_5 : TYPEC_CC_OPEN;
> +	default:
> +		return sink ? TYPEC_CC_RP_3_0 : TYPEC_CC_OPEN;
> +	}
> +}

[ ... ]

> +static int tcpm_set_vconn(struct tcpc_dev *dev, bool on)
> +{
> +	struct ucpd *ucpd =3D tcpm_to_ucpd(dev);
> +	DECLARE_BITMAP(bitmap, 2) =3D { };
> +	enum typec_cc_status cc1, cc2;
> +	int cr, sr;
> +	int ret;

[Severity: High]
Is it possible for this code to return an uninitialized ret?

If we take the early goto done path below due to ucpd->vconn_on =3D=3D on
or an unknown CC polarity, ret will be returned without ever being
initialized.

> +
> +	mutex_lock(&ucpd->lock);
> +	if (ucpd->vconn_on =3D=3D on) {
> +		dev_err(ucpd->dev, "vconn is already %d\n", on);
> +		goto done;
> +	}

[ ... ]

> +	if (cc1 =3D=3D TYPEC_CC_OPEN || cc1 =3D=3D TYPEC_CC_RA) {
> +		ucpd->cc_polarity =3D TYPEC_POLARITY_CC2;
> +	} else if (cc2 =3D=3D TYPEC_CC_OPEN || cc2 =3D=3D TYPEC_CC_RA) {
> +		ucpd->cc_polarity =3D TYPEC_POLARITY_CC1;
> +	} else {
> +		dev_err(ucpd->dev, "unknown CC polarity %d %d\n", cc1, cc2);
> +		goto done;
> +	}

[ ... ]

> +done:
> +	mutex_unlock(&ucpd->lock);
> +
> +	return ret;
> +}

[ ... ]

> +static int tcpm_set_roles(struct tcpc_dev *dev, bool attached,
> +			  enum typec_role pwr, enum typec_data_role data)
> +{
> +	struct ucpd *ucpd =3D tcpm_to_ucpd(dev);
> +
> +	ucpd->pwr_role =3D pwr;
> +	ucpd->data_role =3D data;

[Severity: Medium]
Should this state update be protected by ucpd->lock?

These roles are read concurrently under the lock in ucpd_pd_read_message(),
which could lead to a race condition and a GoodCRC message being transmitted
with torn role bits.

> +
> +	return 0;
> +}

[ ... ]

> +static int ucpd_pd_send_message(struct ucpd *ucpd, enum tcpm_transmit_ty=
pe type,
> +				const struct pd_message *msg)
> +{

[ ... ]

> +	if (ucpd->tx_pending) {
> +		regmap_read_poll_timeout(ucpd->regmap, UCPD_SR,
> +					       val, val & UCPD_SR_TXMSGSENT,
> +					       0, 100000);

[Severity: High]
Could ignoring the return value of regmap_read_poll_timeout() lead to
hardware state corruption?

If the hardware is stuck or still busy transmitting and the timeout occurs,
the code proceeds to unconditionally overwrite TX registers, potentially
corrupting the ongoing transfer.

> +		regmap_write(ucpd->regmap, UCPD_ICR, UCPD_ICR_TXMSGSENTCF);
> +		ucpd->tx_pending =3D false;
> +	}

[ ... ]

> +static void ucpd_pd_read_message(struct ucpd *ucpd)
> +{

[ ... ]

> +		if (val & UCPD_SR_RXNE) {
> +			regmap_read(ucpd->regmap, UCPD_RXDR, &rxdata);
> +
> +			/* First two bytes are header, rest is message */
> +			if (count < 2)
> +				mh[count] =3D rxdata & 0xff;
> +			else
> +				mp[count - 2] =3D rxdata & 0xff;
> +			count++;
> +		}

[Severity: Critical]
Can this unbounded loop overflow the pd_msg stack buffer?

An external device sending an oversized or malformed packet could cause
count to grow past the 30-byte payload limit before the length check is
ever reached, overwriting the kernel stack.

> +
> +		if (val & UCPD_SR_RXMSGEND) {
> +			regmap_write(ucpd->regmap, UCPD_ICR, UCPD_ICR_RXMSGENDCF);
> +			break;
> +		}
> +	}

[ ... ]

> +	if (!len && (pd_header_type_le(pd_msg.header) =3D=3D PD_CTRL_GOOD_CRC))=
 {
> +		tcpm_pd_transmit_complete(ucpd->tcpm_port, TCPC_TX_SUCCESS);
> +	} else {
> +		struct pd_message msg =3D {
> +			.header =3D PD_HEADER_LE(PD_CTRL_GOOD_CRC,
> +					       ucpd->pwr_role,
> +					       ucpd->data_role,
> +					       pd_header_rev_le(pd_msg.header),
> +					       pd_header_msgid_le(pd_msg.header),
> +					       0),
> +		};
> +		ucpd_pd_send_message(ucpd, TCPC_TX_SOP, &msg);

[Severity: High]
Does generating a GoodCRC in software inside a threaded IRQ violate the
195us tTransmit USB PD requirement?

It seems like this might lead to connection drops. Also, for truncated
messages, it constructs a GoodCRC with a zeroed header acknowledging
corrupted data.

> +		tcpm_pd_receive(ucpd->tcpm_port, &pd_msg, TCPC_TX_SOP);
> +	}
> +}

[ ... ]

> +static int ucpd_probe(struct platform_device *pdev)
> +{

[ ... ]

> +	ucpd->tcpc_dev.fwnode =3D device_get_named_child_node(dev, "connector");
> +	if (IS_ERR(ucpd->tcpc_dev.fwnode))
> +		return PTR_ERR(ucpd->tcpc_dev.fwnode);

[Severity: High]
Should this check be if (!ucpd->tcpc_dev.fwnode) instead?

device_get_named_child_node() returns NULL on failure, not an error pointer,
which would cause this check to falsely pass and proceed with a NULL fwnode.

> +
> +	platform_set_drvdata(pdev, ucpd);

[ ... ]

> +	ucpd->orient_sw =3D fwnode_typec_switch_get(ucpd->tcpc_dev.fwnode);
> +	if (IS_ERR(ucpd->orient_sw)) {
> +		return dev_err_probe(dev, PTR_ERR(ucpd->orient_sw),
> +				     "Failed to get orientation switch\n");
> +	}

[Severity: High]
Does this early return bypass the tcpm_put_fwnode error path, leaking the
fwnode handle?

Additionally, it looks like typec_switch_put() is missing in both the
probe error path and in driver removal.

> +
> +	ret =3D devm_request_threaded_irq(dev, irq, NULL, ucpd_irq,
> +					IRQF_ONESHOT, "ucpd", ucpd);
> +	if (ret < 0)
> +		goto tcpm_put_fwnode;
> +
> +	ucpd->tcpm_port =3D tcpm_register_port(dev, &ucpd->tcpc_dev);

[Severity: High]
Could an interrupt fire right after it is requested but before
ucpd->tcpm_port is fully registered?

tcpm_init() is called synchronously during port registration and unmasks
hardware interrupts, which might cause ucpd_irq() to dereference a
NULL ucpd->tcpm_port.

> +	if (IS_ERR(ucpd->tcpm_port)) {
> +		ret =3D PTR_ERR(ucpd->tcpm_port);
> +		goto tcpm_put_fwnode;
> +	}
> +
> +	return ret;
> +
> +tcpm_put_fwnode:
> +	fwnode_handle_put(ucpd->tcpc_dev.fwnode);
> +
> +	return ret;
> +}
> +
> +static void ucpd_remove(struct platform_device *pdev)
> +{
> +	struct ucpd *ucpd =3D platform_get_drvdata(pdev);
> +
> +	tcpm_unregister_port(ucpd->tcpm_port);

[Severity: High]
Could this trigger a use-after-free if an interrupt fires during removal?

tcpm_unregister_port() destroys the internal workqueue synchronously, but
hardware interrupts are not masked and the devm-managed IRQ is still active
until after remove completes. If an interrupt fires during this window,
ucpd_irq() will queue work on the destroyed TCPM workqueue.

> +	fwnode_handle_put(ucpd->tcpc_dev.fwnode);
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260819163410.1197=
55-1-marex@nabladev.com?part=3D2
