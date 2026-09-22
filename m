Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42D17541E5B
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 17:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790096889; cv=none; b=tEhPpPlskuw3GXjQDUXFWi4WIMaqmD9JEPyaKRrPsO7NsY0SyUm6gF1mgqTAGWoqKoxJ+fnDohW8Z9M7Ejo1O0ox1wiaHfKvTXMhLadGow/ytVjuwyBtFbP6BkvLTzGxga+33Ao6AJEu0KB4ypzakYNI0KBU6o50FH8NM0uPcsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790096889; c=relaxed/simple;
	bh=oB5H7xmmsDGwSrUthg5w1JANDnmG/YCERnbMBWlpE3U=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=oSUR//xgl1Jkxb0L1FvuHDJng4749GA22Kuj5f5wXNjrbL60xCSrDc0qy9gX+2TdWKJCoFa8kTZLweBs2DdbUS0ASOejFIoc+wbtLlvGE1EHhLZXV/jKz9rJlm32xkpQ3UrWGxfLWc2NvhLmWY1rmqNWCwMTrjLqrBKjXgtGnWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Bg5xrMTs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Bg5xrMTs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC76C1F000FF;
	Tue, 22 Sep 2026 17:08:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790096887;
	bh=tF2Z/iLS1R+C5ksggZumSjADuKGLwYVXKpUUk2/yIW8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Bg5xrMTs3f4let1nvjkwdHzxs/ouMBlUTwwFbEDgiKAAxwf9x9fjjsOC6CQuukRhF
	 Qn1qnV0c3KtuhbXnb2XWhhtPaX98wCcq0LC6K6GoblwQzE6UaNybLlSUpVNJd1ZWF7
	 v7SvdaefsY50Ou7qcTMNLxKmMMckbpnrlK7QrQIEV9GnLWpWFoAf4csdrMgz4M9Gya
	 Bqq9cIuehP9tjPqdmEkH+6PRuf0yKmPGZG8j0D2DGkwCXGNURYQv9hoIktPz3eY3Pk
	 YmmU5NXry4q1jySbrI9PoTcDTjT9vOHvUYZqsRGXklYa6O2pfJohc0GaX5GMWJ9uYm
	 PvD7aY10SlpEQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] arm64: dts: ti: Add k3-am62p-wakeup.dtsi for AM62PX
 efuse GP_SW1
Reply-To: sashiko-reviews@lists.linux.dev
To: "Judith Mendez" <jm@ti.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260922165714.425576-1-jm@ti.com>
References: <20260922165714.425576-1-jm@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 22 Sep 2026 17:08:07 +0000
Message-Id: <20260922170807.AC76C1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] dt-bindings: invalid fallback compatible causes bus fault on AM62P=
 WKUP_CTRL_MMR
--

commit b27457a62deb29b29e55d04f2bdab0cbcd3ef0cd
Author: Judith Mendez <jm@ti.com>
Subject: arm64: dts: ti: Add k3-am62p-wakeup.dtsi for AM62PX efuse GP_SW1

This commit creates a new device tree include file for AM62P WAKEUP domain
peripherals. It adds an efuse node for the GP_SW1 register, which will be
used to determine the AM62P silicon revision.

Link to v1: https://lore.kernel.org/all/20260915001304.3781247-1-jm@ti.com/

> diff --git a/arch/arm64/boot/dts/ti/k3-am62p-wakeup.dtsi b/arch/arm64/boo=
t/dts/ti/k3-am62p-wakeup.dtsi
> new file mode 100644
> index 0000000000000..c56fb3890c983
> --- /dev/null
> +++ b/arch/arm64/boot/dts/ti/k3-am62p-wakeup.dtsi
> @@ -0,0 +1,25 @@
[ ... ]
> +&wkup_conf {
> +	gpsw_efuse: efuse@230 {
> +		compatible =3D "ti,am62p-efuse", "socionext,uniphier-efuse";

[Severity: High]
Does this fallback compatible cause a bus fault on boot?

The ti,am654-chipid driver probes and calls nvmem_cell_read_u32() for the
gpsw1 cell, which delegates the read to the NVMEM provider. By using
"socionext,uniphier-efuse" as a fallback, the driver in
drivers/nvmem/uniphier-efuse.c is bound. That driver sets word_size =3D 1 a=
nd
uses a byte-wise readb() loop in uniphier_reg_read().

Because the efuse@230 node is in the TI K3 WKUP_CTRL_MMR space, it strictly
requires 32-bit aligned accesses (readl()). The 8-bit accesses performed by
the Uniphier driver violate this hardware invariant and cause a Synchronous
External Abort during boot.

Also, is it acceptable to piggyback on an unrelated vendor's IP compatible
string just to bind a generic NVMEM driver?

> +		reg =3D <0x230 0x10>;
> +		#address-cells =3D <1>;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260922165714.4255=
76-1-jm@ti.com?part=3D1
