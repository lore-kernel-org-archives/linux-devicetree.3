Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E80CE43DA59
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 06:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790317682; cv=none; b=ft9iz+jkg1bCc1AW1WO11amJ2mOk5hW1nw4X1hNlce17qux97MCv31aJCm3b9ew6anyMyRecxXoyCrWEj9SjbEQD7qMPEIBuIygIAU57HHI1ujXiZfcPzGUR2TEoypzN+Yv1lFPyBBrYg0tSstYw0IQnfIimn0qVlGcN0SBYRD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790317682; c=relaxed/simple;
	bh=1UP5yKoX+fvbfCIbOKQyxCI3D+Ojick4EL7j8EBWB7I=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=AplXmtzOLCaz8vLupe2p8ZjsQ1kyZO2q7EgEThmmY+pJZPG8E0eAUka7fBVW+AI5rXlsj0NEULihRonfMWu8el0Qom/jLILu+fYyEV9vBU+zK50FffGEgmX+iYYU4CVaEe+nfV607c6kjXvaHmYfSSzuAUg6i9N3ny6JmpI1jI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DSJZm2QV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DSJZm2QV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C78D01F000FF;
	Fri, 25 Sep 2026 06:27:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790317679;
	bh=2HsnxH9n//cnrXyE9kMa/ZmCzOgr9dYQr0BQIiu+740=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DSJZm2QVajhmggqTD2KBNf5d9RciUokODPkV7i7DoXkNBYjAbJ89akLWKT7sOjWeH
	 zsoZQsPPQhjuQ5smh8mINZja2wuNvj5dUZ1MWusWWvI2ihIx7li55I2zR2jpxEGR/c
	 wTfg7xS134qiMHnIS01ar93iWUr22aR48gQbXAPYzVBB0HiyOtnchNFTCUwMkrTe+l
	 /ydvdCn7lkX+dfwxyfwA4UeXN0/cnLD5RQuD54KgIz6tGcz0Fpdpzldl0yfPQYxLMp
	 fiwSmZArxKTmC5JBfgbHAfbjZT0b7MGXL5j9rzhobNRg5J9qb93x5/jIlRTjVwUhCL
	 iCjuwZC/73NsA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] Bluetooth: hci_qca: Add WCN clock management for
 pwrseq-based power path
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yepuri Siddu" <yepuri.siddu@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260925-bt-wcn-clk-enable-v1-1-30bee88c4de4@oss.qualcomm.com>
References: <20260925-bt-wcn-clk-enable-v1-0-30bee88c4de4@oss.qualcomm.com>
 <20260925-bt-wcn-clk-enable-v1-1-30bee88c4de4@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 25 Sep 2026 06:27:58 +0000
Message-Id: <20260925062758.C78D01F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] bluetooth: hci_qca: unbalanced clock disable in error paths
--

commit b40a50081c6337711ee58ffef1a77bff3162c4ae
Author: Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>

Bluetooth: hci_qca: Add WCN clock management for pwrseq-based power path

This commit extends the pwrseq-based power path in the hci_qca driver to
acquire and manage an optional WCN clock. It updates qca_serdev_probe() to
acquire the clock, and modifies qca_regulator_enable() and qca_power_off()
to manage the clock state alongside the power sequencer.

> diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
> index 7089e9b639b2a..489a059e519a6 100644
> --- a/drivers/bluetooth/hci_qca.c
> +++ b/drivers/bluetooth/hci_qca.c
> @@ -2265,6 +2265,8 @@ static void qca_power_off(struct hci_uart *hu)
>  	}
> =20
>  	if (power && power->pwrseq) {
> +		if (qcadev->susclk)
> +			clk_disable_unprepare(qcadev->susclk);
>  		pwrseq_disable(power->pwrseq);

[Severity: High]
Does this code unconditionally disable the clock and power sequencer without
checking if they were actually enabled?

Unlike the regular regulator path which uses power->vregs_on for state
tracking, this pwrseq teardown lacks state tracking. This causes unbalanced
disables in two paths:

1) The module is unloaded without the HCI interface ever being brought up.
qca_close() calls qca_power_off() (since QCA_BT_OFF is initialized to 0),
which unconditionally disables the never-enabled clock and pwrseq.

2) In qca_setup(), if qca_power_on() fails (e.g., clk_prepare_enable()
fails), the error handler calls qca_power_off() which performs an unconditi=
onal
teardown despite the rollback already executed in qca_regulator_enable().

This can trigger a WARN in the clock framework due to an unbalanced
clk_disable_unprepare() and cause an unbalanced pwrseq_disable(), which cra=
shes
the kernel if panic_on_warn is set. This is reachable by a local privileged=
 user
loading and unloading the driver, or automatically on hardware initializati=
on
failure.

>  		set_bit(QCA_BT_OFF, &qca->flags);
>  		return;
>  	}

[ ... ]

> @@ -2324,8 +2326,17 @@ static int qca_regulator_enable(struct qca_serdev =
*qcadev)
>  	struct qca_power *power =3D qcadev->bt_power;
>  	int ret;
> =20
> -	if (power->pwrseq)
> -		return pwrseq_enable(power->pwrseq);
> +	if (power->pwrseq) {
> +		ret =3D pwrseq_enable(power->pwrseq);
> +		if (ret)
> +			return ret;
> +		if (qcadev->susclk) {
> +			ret =3D clk_prepare_enable(qcadev->susclk);
> +			if (ret)
> +				pwrseq_disable(power->pwrseq);

[Severity: High]
Does this rollback leave the power sequencer and clock in an untracked stat=
e?

If clk_prepare_enable() fails, pwrseq_disable() is correctly called to roll
back the sequence, returning the error to the caller. However, because there
is no tracking to indicate the components are disabled, the error handler
(which calls qca_power_off()) will attempt to disable them a second time,
triggering the unbalanced disables mentioned above.

> +		}
> +		return ret;
> +	}
> =20
>  	/* Already enabled */

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260925-bt-wcn-clk=
-enable-v1-0-30bee88c4de4@oss.qualcomm.com?part=3D1
