Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DB5E3E9F95
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 08:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784018509; cv=none; b=uGFupffTtfPXSzNX0Eh+KzH2w8feEuXBGIaNOykN7j+zSMKZA49vaYI0GOWiYaL8UdM2Wxu8trlwRafTpxsJcvHe8zqrWWOhQvTIEDXkQHnVy8e7IFzDY+X3NnXR3FT4qr3eizRRHkp8YFlS7ujRKCZqoiqSGbxYwzFfsftgqNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784018509; c=relaxed/simple;
	bh=BRLGpqiMHO9di+iyrpc3GE7wsUgvcIxBQ5Cek3Lic5c=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=tx5gkmt9Xlqnv7zWrb2FllgPRaqX0iS9hZlKMT+8uWbop8lfagwBBgHJx6vZhsdTWt76da9AYkfqydkLY5MjET5CYqMv43VF8JdOb93eBVr3b6KiDSUKQ0acopvf8efu4yg2R9Mos39zwpObIF8DFNIlwkxSo1fVGsiGYGJevHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WzvhgkBs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WzvhgkBs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36D541F000E9;
	Tue, 14 Jul 2026 08:41:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784018502;
	bh=lAr65BSD9qdDBH6oQuhsNjgxWWz5SnPW3g1cpwBnscE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WzvhgkBsFkHH/xebRoPCNiCTocbRKaCo60s7UDU7QrI7JIgMb8G97pOW2i1XfqLXg
	 FnVyG/d7qjEAJ6zUOpvRgVwTg2BDuwDU4n7KcSp69PSocmgPyYzqrccPOvyv80iTqn
	 ISEgCb8xH1cvTVVUjGmNT0cJjwu/f/tWv/YRJxdPkxCql9eZYWIr3CklCjSk+fzNra
	 J/XtUFzUw/t4VXvwpIxWFhKY8pieC+D1CaxsdO/TGZ9yFqa68jfMEUM4dw++o3oFAd
	 YNUg5fammYshjgsdAg/PVHFX8/2K0keDoEoN/p6hMb5PtTmyp6ARBpUkLqHMY+inE7
	 Wqe8/+rO2N9Aw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RESEND v6 2/2] arm64: dts: ti: Add audio overlay for
 k3-j721s2-evm
Reply-To: sashiko-reviews@lists.linux.dev
To: "Moteen Shah" <m-shah@ti.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260714082206.501922-3-m-shah@ti.com>
References: <20260714082206.501922-1-m-shah@ti.com>
 <20260714082206.501922-3-m-shah@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 14 Jul 2026 08:41:40 +0000
Message-Id: <20260714084142.36D541F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [Medium] The commit message claims to 'Add GPIO hogs to route I2C3 lines =
and McASP serializers', but I2C3 routing is implemented using a dynamically=
 managed gpio-mux (mux-controller) rather than a static GPIO hog.

Pre-existing issues:
- [High] Adding the `mux-states` property to the `main_i2c3` node triggers =
a preexisting bug in the `i2c-omap` driver where the multiplexer control st=
ate is deselected twice on driver unbind, corrupting the multiplexer's sema=
phore lock.
--

--- Patch [2]: [PATCH RESEND v6 2/2] arm64: dts: ti: Add audio overlay for =
k3-j721s2-evm ---
commit b8739eb8a1b6fedb5e3ae2312559bc8686123be2
Author: Jayesh Choudhary <j-choudhary@ti.com>

arm64: dts: ti: Add audio overlay for k3-j721s2-evm

This patch adds a device tree overlay to enable analog audio support on the
J721S2-EVM. It configures the sound-card, audio codec, I2C3, and McASP4
along with their respective pinmux and signal routing settings.

> - Add GPIO hogs to route I2C3 lines and McASP serializers

[Severity: Medium]
Is this commit message description accurate for the I2C3 routing?

Looking at the added overlay, I2C3 routing is implemented using a
dynamically managed gpio-mux (mux-controller-2) rather than a static
GPIO hog.

> diff --git a/arch/arm64/boot/dts/ti/k3-j721s2-evm-audio.dtso b/arch/arm64=
/boot/dts/ti/k3-j721s2-evm-audio.dtso
> new file mode 100644
> --- /dev/null
> +++ b/arch/arm64/boot/dts/ti/k3-j721s2-evm-audio.dtso
[ ... ]
> +&main_i2c3 {
> +	status =3D "okay";
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&main_i2c3_pins_default>;
> +	clock-frequency =3D <400000>;
> +	mux-states =3D <&i2c_mux 1>;

[Severity: High]
This is a pre-existing issue, but adding this property exposes a latent
double-deselect bug in the i2c-omap driver during unbind.

The devm_mux_state_get_optional_selected() API registers a devres action
that automatically calls mux_state_deselect(). However, the unbind path
explicitly calls it again:

drivers/i2c/busses/i2c-omap.c:omap_i2c_remove() {
	...
	if (omap->mux_state)
		mux_state_deselect(omap->mux_state);
	...
}

Because mux_control_deselect() unconditionally executes up(&mux->lock),
would this double deselect increment the binary semaphore past 1 and
break mutual exclusion for the multiplexer?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260714082206.5019=
22-1-m-shah@ti.com?part=3D2
