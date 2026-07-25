Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAC65280CFB
	for <devicetree@vger.kernel.org>; Sat, 25 Jul 2026 05:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784956100; cv=none; b=no3VKolg5/95IdFgfH7FSs7eOpxA9zNpozejsiCyzH8A+98AFespjfF1q4E+ypi1rdYBn5td1L3Y3nNfoJXr0d5UKcvM4bhNFmBQbOMsbeA5mzWqXQwG7j83IXqqKOQZL5oKTgh2pYD68qgsqJCg9VXJyip5q4ZwxJP4tVhLmUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784956100; c=relaxed/simple;
	bh=98aWxTEpHex53rLo94zaOMSW1TD3HuKmPnol86vfJp8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=AQCAPW36/bmgzCyv1mOIfCv1iL7Gm2ZNOAIpIJRllhb/PiangGI7W9YzXenLAQcOIVhzRxDX7m/knS4cJYJ14NbXPknCQa4jtqzE3RfgT8Ua8wudJ11AXRZt5t6s3qIzIBoYbLLyJ7/ehlxgc3O03w7V5VB1GtPc0qgoJfwoSWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Hv00ONOU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Hv00ONOU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E72A21F000E9;
	Sat, 25 Jul 2026 05:08:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784956099;
	bh=GN6aqntHEPq5XDOXgFW8etw4HsuTNEBa3VPzvY5PKqU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Hv00ONOULMkkAlpWMUxcUCoLfA508BVmyB1VpzWromTSYnMrnx+zDS95OZxuM7L0W
	 MO8tuW58ZI5U/PWkC9ATIBTKBaW2AbhHH6MiShZhS0j8Hbilk1qWPZjtY0wiXqx76W
	 HH1V2xQsNQ62Qd+UMw2tfC2rtA5O6C7KEuSNZAEZcm8pTmpMYkAyLjC62tYMRsIpkn
	 MwFX2HeZjOg9u+sVyCNimyGq8GHJPskT3u59Lowa8q89eVOB4s1rT/bYl2M0UUCaCp
	 mULbGyYEKvO7I6e954TJBDF6Jb52waBnNB8WfI9GLD33yk2cckpkrJJ6EO/U2hakG/
	 TKuY6r4/A7y9Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RESEND 14/17] riscv: dts: spacemit: k3: add display
 nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Cody Kang" <codykang.hk@gmail.com>
Cc: robh@kernel.org, olteanv@gmail.com, linux-phy@lists.infradead.org, conor+dt@kernel.org, vkoul@kernel.org, dri-devel@lists.freedesktop.org, neil.armstrong@linaro.org, devicetree@vger.kernel.org
In-Reply-To: <20260725-k3-display-v1-14-6de34d80e86c@gmail.com>
References: <20260725-k3-display-v1-0-6de34d80e86c@gmail.com>
 <20260725-k3-display-v1-14-6de34d80e86c@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 25 Jul 2026 05:08:18 +0000
Message-Id: <20260725050818.E72A21F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The DP controller hardware is not initialized before the eDP panel=
 probe is triggered, causing synchronous AUX transfers to fail or hang.
- [High] The custom EDID read function violates the I2C EEPROM protocol by =
omitting the Middle-of-Transaction (MOT) bit, breaking EDID reads on sinks =
that require a repeated START.
--

--- Patch [14]: [PATCH RESEND 14/17] riscv: dts: spacemit: k3: add display =
nodes ---
commit 9b9ee39195ad90a76f056f9bddbdabb8377b67ec
Author: Cody Kang <codykang.hk@gmail.com>

riscv: dts: spacemit: k3: add display nodes

Add the SoC-level display nodes: the two Saturn DPUs, the two DP/eDP
controllers with their PHY children.

> diff --git a/arch/riscv/boot/dts/spacemit/k3-display.dtsi b/arch/riscv/bo=
ot/dts/spacemit/k3-display.dtsi
> new file mode 100644
> index 0000000000000..4892ee6acda22
> --- /dev/null
> +++ b/arch/riscv/boot/dts/spacemit/k3-display.dtsi
> @@ -0,0 +1,156 @@
[ ... ]
> +&soc {
[ ... ]
> +	edp0: edp@cac84000 {
> +		compatible =3D "spacemit,k3-inno-dp";

[Severity: High]
Does enabling this device node cause the eDP panel probe to fail?

Looking at inno_dp_probe() in drivers/gpu/drm/spacemit/spacemit_inno_dp.c, =
it
populates the eDP panel device on the AUX bus:

    ret =3D devm_of_dp_aux_populate_bus(&dp->aux,
                                      spacemit_dp_edp_link_panel);

The panel driver probes synchronously and attempts an AUX transfer to read =
the
EDID.

However, the DP controller's hardware registers (including the AUX clock
divider DP_AUX_CTRL_CLK_DIV and soft resets) are not initialized until late=
r:

spacemit_inno_dp.c:spacemit_dp_bind() {
    ...
    ret =3D spacemit_dp_dev_init(dp);
    ...
}

The uninitialized controller ignores the transfer or the AUX state machine
does not start, causing an unavoidable timeout.

> +		reg =3D <0x0 0xcac84000 0x0 0x4000>;
[ ... ]
> +	dp1: dp@cac88000 {
> +		compatible =3D "spacemit,k3-inno-dp";

[Severity: High]
Will EDID reads fail for sinks connected to this node?

When reading EDID, the driver splits the transaction into a write and a rea=
d:

spacemit_inno_dp.c:spacemit_dp_conn_get_edid_block() {
    ...
    ret =3D spacemit_dp_aux_i2c_write(dp, DDC_ADDR,
                                    &edid_offset, 1);
    ...
}

It calls spacemit_dp_aux_i2c_write() which hardcodes the request:

spacemit_inno_dp.c:spacemit_dp_aux_i2c_write() {
    ...
    .request =3D DP_AUX_I2C_WRITE,
    ...
}

The missing MOT (Middle-of-Transaction) bit guarantees an I2C STOP condition
after writing the offset address. This resets the internal address pointer =
of
many standard EEPROMs, causing the subsequent read to repeatedly fetch bloc=
k 0
instead of the requested extension block.

> +		reg =3D <0x0 0xcac88000 0x0 0x4000>;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260725-k3-display=
-v1-0-6de34d80e86c@gmail.com?part=3D14
