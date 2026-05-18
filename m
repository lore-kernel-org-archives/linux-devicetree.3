Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5CE3396573
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 20:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779137901; cv=none; b=qRoOPGFruQlt0IL3Ky/UlX5tPV6/nPZnEru8VmPg+pJjX6kuxvIdQAjjUL4zEpq4pLmquvQXyKG1L1L8mhIqyip6ai/9P5D3i8dJWJ9UzIFGxnL+29bx2amN4hLpcjRAnZi4NOeYGIKxfhx1U8n+89Suy9+MFT3kyXixr+WRR1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779137901; c=relaxed/simple;
	bh=qArf86A+F+FiTL3URgZ2brdXqvgo2QuVMUNnoXQwmus=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Mg7p9dBkr5VOTVgiHgQgU6/aLwrqUjR1eBCnlLJwsSYfsKi/gc7XQqqM0d84py67I8wdHodkNScjrHBLAeV5b1QX3pB/X994IE+l/y8EHV8j03O/pt536TYQh+BDwNqI2I/z9tb5DfqXind5CmlZwnC2rn7flP9fylc/VCHo+4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aAxR1LhY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aAxR1LhY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49435C2BCB7;
	Mon, 18 May 2026 20:58:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779137901;
	bh=qArf86A+F+FiTL3URgZ2brdXqvgo2QuVMUNnoXQwmus=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=aAxR1LhYvRV/S4Phr00BDKfy/F3yudJUh75crW5e/0JUjsLUKR3AFeibldFPfqEFB
	 lfWoQwQcNwF4agV/VIgG+va1sxEc/p0kNrMu+tcnugFdkYkoHhYxSMYX3mvZnn/tSm
	 DPpGadflQUwhFF84HdwZAnX5Rq4oSaY5P/P7wZL5Bj3Wkf/k1ApHgRkHPy+ABgyayc
	 8PJ4hBXsfNwVTOobLUaAoS1PQ0K2QzqCg9YEKY2Pdz+7zSnnVOl9uxxg2l9jtEiq5X
	 INsJFPiLGOFe84zyiFjupP00dhaDS587uIRi+LQHw9Fczrxp42CvrZH1KviU5U4hS+
	 T6NxyvyCQdUDw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/6] usb: typec: add Qualcomm PMI8998 role-switch driver
Reply-To: sashiko-reviews@lists.linux.dev
To: taygoth <taygoth@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <6fedbcd344505b63de72037f69ea94f916255f03.1779127507.git.taygoth@gmail.com>
References: <6fedbcd344505b63de72037f69ea94f916255f03.1779127507.git.taygoth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 18 May 2026 20:58:20 +0000
Message-Id: <20260518205821.49435C2BCB7@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Race condition and Use-After-Free during driver removal due to mix=
ed devm and manual cleanup.
- [Medium] VBUS regulator enable count leak on probe error path.
- [Medium] Silently ignored return value of hardware initialization in prob=
e().
--

commit 2be57d2a22cd876c2f33d5adcda09af34cd9c497
Author: taygoth <taygoth@gmail.com>

usb: typec: add Qualcomm PMI8998 role-switch driver

This commit introduces a new USB Type-C role-switch driver for the Qualcomm
PMI8998 PMIC. It translates the hardware-detected role into a consumer
switch state, and enables an optional VBUS supply regulator when acting as
a USB host.

> diff --git a/drivers/usb/typec/qcom_pmi8998_typec.c b/drivers/usb/typec/q=
com_pmi8998_typec.c
> new file mode 100644
> index 0000000000000..77662b4f1b0c6
> --- /dev/null
> +++ b/drivers/usb/typec/qcom_pmi8998_typec.c

[ ... ]

> +static int pmi8998_typec_probe(struct platform_device *pdev)
> +{

[ ... ]

> +	platform_set_drvdata(pdev, typec);
> +
> +	pmi8998_typec_apply(typec);

Should the return value of pmi8998_typec_apply() be checked here?=20

If operations like regmap_read() or regulator_enable() fail inside apply(),
the probe will silently succeed with an unsynchronized hardware state.

> +
> +	ret =3D devm_request_threaded_irq(dev, typec->irq, NULL,
> +					pmi8998_typec_isr, IRQF_ONESHOT,
> +					dev_name(dev), typec);
> +	if (ret)
> +		goto err_role_put;
> +
> +	return 0;
> +
> +err_role_put:
> +	usb_role_switch_put(typec->role_sw);

If pmi8998_typec_apply() above evaluates to USB_ROLE_HOST, it will enable
the vbus regulator and set typec->vbus_enabled to true.=20

If the interrupt request then fails, does this error path leak the regulator
enable count by missing a regulator_disable() call?

> +	return ret;
> +}
> +
> +static void pmi8998_typec_remove(struct platform_device *pdev)
> +{
> +	struct pmi8998_typec *typec =3D platform_get_drvdata(pdev);
> +
> +	if (typec->vbus_enabled)
> +		regulator_disable(typec->vbus);
> +	usb_role_switch_put(typec->role_sw);

Because the interrupt was requested using devm_request_threaded_irq(), it
will not be freed until after pmi8998_typec_remove() returns.

If a hardware interrupt fires right after we disable the regulator and
put the role switch:

pmi8998_typec_remove()
    regulator_disable(typec->vbus);
    usb_role_switch_put(typec->role_sw);

-> interrupt fires
pmi8998_typec_isr()
    pmi8998_typec_apply()

Could the ISR attempt to use the freed typec->role_sw or perform an
unbalanced regulator_disable() since typec->vbus_enabled is never set
to false in remove()?

> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1779127507.gi=
t.taygoth@gmail.com?part=3D3
