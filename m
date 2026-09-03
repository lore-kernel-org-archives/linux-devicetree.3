Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5651250C2B7
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 21:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788470586; cv=none; b=cspzzQhWq3dkGRv4BltxsSBOTHE0Xy75QQffMpYLD2J2bZy+1GqwEnKryJqfpuVUJNbPnzMR9h8wEKgNtfMUW3JCj+s/PG+LrftI316zUwCWCg7wbf/0tukfHDT4saqNfDz8n8hj0MFUCDRvToDzFWSoyRcz2kL5l1vfMPz4D6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788470586; c=relaxed/simple;
	bh=a/g1Bgoc8m2GZWAyA6ea07NNNyPWeW0dKxGEvEwhx2E=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=sXaX/774F2MLWm/XTmwg8ECxFzvmITWTwi1O3RVAog3SkhN+nEtSHBOT4XxZb5FMs8lrTLr/xwtC/3fmr49DMDlPY13TlybLnBRNPFXk7ODz0dz/P8a8yEe+lfNKHDAeqYIOhGLir/bT+HyFF0dvANyWPHlz73oBZixzh75ZbfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q9tbRYur; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q9tbRYur"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FF2F1F000E9;
	Thu,  3 Sep 2026 21:22:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788470570;
	bh=MGcch3TdDIcGlZlXsn1Yb98DefiewfNyFurJQ05lAq0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Q9tbRYurggMkkW/NI1BO9tzVt8qrDu31LgdqmRf0RxVqgQsN+Br112rHoPDqSSxyv
	 E1sbkiDAI5BP+iqt0OCtmnqpSIczHmnhLj2ZfntMekskfk2rySbg82j2gKT9ZKDkMi
	 mF8xdO3DQKjWZq/I3CHjPtbht2CPwRsj3vF1z3HT7TvArI5bA9JtqvKf5+YpN9IpIn
	 rdBbrlPmkFYNmeTMEKXYP4Cj27BJXNDaAxZ5yyfXGVqOsokFNrz283jZKfbdvHpvqC
	 cAvuwDjFwV9GJrnXpoUhZUVwfTPoPJa2IYLATc3bi59xSsQLE7lB9MKbyZUU0PZaJe
	 CP4nonHuyd1tg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 3/3] arm64: dts: qcom: qcm6490-fairphone-fp5: add
 ST21NFCD NFC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kristian Brox" <isyourbrainfoss@proton.me>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260902-fp5-st21nfcd-v4-v4-3-ded2f1c501be@proton.me>
References: <20260902-fp5-st21nfcd-v4-v4-0-ded2f1c501be@proton.me>
 <20260902-fp5-st21nfcd-v4-v4-3-ded2f1c501be@proton.me>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 03 Sep 2026 21:22:49 +0000
Message-Id: <20260903212250.3FF2F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Leaked NCI device and potential Use-After-Free on IRQ request fail=
ure
- [High] Double IRQ disable causing permanent interrupt loss in ST_NCI
--

commit f44916e46bbad8ef743764748ded612267568862
Author: Kristian Brox <isyourbrainfoss@proton.me>

arm64: dts: qcom: qcm6490-fairphone-fp5: add ST21NFCD NFC
   =20
Enable the ST21NFCD on i2c9 (0x08), IRQ TLMM 41, reset TLMM 38
active-low. Compatible is st,st21nfcd (raw NCI).

> diff --git a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts b/arch/ar=
m64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
> index f41ad446a39e2..b028d1bb25d4c 100644
> --- a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
> +++ b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
> @@ -933,7 +933,23 @@ redriver_ss_in: endpoint {
>  &i2c9 {
>  	status =3D "okay";
> =20
> -	/* ST21NFC NFC @ 28 */
> +	nfc@8 {
> +		compatible =3D "st,st21nfcd";

[Severity: High]
This isn't a bug introduced by this patch, but I noticed some pre-existing
issues in the st-nci driver that this enables.

Does st_nci_i2c_probe() leak the NCI device and cause a use-after-free if
the IRQ request fails?

drivers/nfc/st-nci/i2c.c:st_nci_i2c_probe() {
    ...
	r =3D devm_request_threaded_irq(&client->dev, client->irq, NULL,
				st_nci_irq_thread_fn,
				IRQF_ONESHOT,
				ST_NCI_DRIVER_NAME, phy);
	if (r < 0)
		nfc_err(&client->dev, "Unable to register IRQ handler\n");

	return r;
}

If devm_request_threaded_irq() fails, it returns the error without calling
ndlc_remove() to unregister and free the NCI device. This leaves a dangling
network interface registered, retaining pointers to freed devres memory (phy
and ndlc structures). Any subsequent userspace access could dereference
freed memory.


[Severity: High]
This is a pre-existing issue, but can a race condition cause a double IRQ
disable and permanent interrupt loss?

In ndlc_close(), ndlc->powered is set to 0 before calling
ndlc->ops->disable(). If an interrupt fires during this window, the IRQ
thread races with the shutdown path:

drivers/nfc/st-nci/i2c.c:st_nci_irq_thread_fn() {
    ...
	if (!phy->ndlc->powered) {
		st_nci_i2c_disable(phy);
		return IRQ_HANDLED;
	}
    ...
}

drivers/nfc/st-nci/i2c.c:st_nci_i2c_disable() {
    ...
	disable_irq_nosync(phy->i2c_dev->irq);
	phy->irq_active =3D false;
}

Both paths could call disable_irq_nosync(), incrementing the IRQ descriptor
depth to 2. Subsequent enable_irq() calls would only decrement it once,
leaving the NFC controller permanently unresponsive to interrupts.

> +		reg =3D <0x08>;
> +
> +		interrupts-extended =3D <&tlmm 41 IRQ_TYPE_LEVEL_HIGH>;
> +		reset-gpios =3D <&tlmm 38 GPIO_ACTIVE_LOW>;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260902-fp5-st21nf=
cd-v4-v4-0-ded2f1c501be@proton.me?part=3D3
