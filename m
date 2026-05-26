Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D72E3D9DDB
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 10:38:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779791901; cv=none; b=fhWwg2njgw3nmcjJNKZ3O83eMs35M0gxI78pbw1lhkfV1QjPWFfg0ZkiSD4YBJmStaGR9cmGttwQsLCxzJBSW7zJMqyyvrCR76mHAqqx6NtXPVJXk30uaIf+rLczI1Ku0qGazwenDIPyvzmMaFgk/VBGxxaUsj1XH+HlWBtIYKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779791901; c=relaxed/simple;
	bh=3AsWJ4Svz8UeRuAJNdgmKfdmyzwau44PDmzkRSLizyo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=sP+ghdbh3L0ArUnn245iy6EgCaN+fGHQphBz8JzB2ZGSTOu5w8aYF3vbxZCkAIjZNAHHbWNLfdC76X7FWo5JMCnuMi/iN6zS/qC1zOvGGv9P0OYvqZnXQ+nSf4wlpHq3VdHMhfqBUJAWVYBXW7dJkIDPGziMyNIYkU+e6M4eC/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dnAY+GbD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dnAY+GbD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFEA71F00A3A;
	Tue, 26 May 2026 10:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779791900;
	bh=Yza9zM3aDrCy7bLpPrLiqHCCyGSJ9g8w8AOAUQlByvE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dnAY+GbD+fYlTFjkOkQi4lix5ikxau3eKrpQnys/xnUs34w/1jKAUER5UYIepwwxZ
	 y34RMhe8Ha8UCO8vEaR4Q1gB+U/XVeewhHPcILAX6q1otGw8/5GB2DHMDWDrtKVwyT
	 7oH29E/43or/XaGaazJuVfsOBsskmC+QojXU30xEr+ZXMdBan5Qod8NPfRiRV94Z6O
	 p4hih63/F3ds0qCedB+emrLfYDZcmLhDZN8pdJomEVVsg0bpflYRiF4/NXR/F5dsug
	 Le0AtCMcqW4DmP8YXKi4UFLCpTv64SyhyYB48kV4xEZGZbf0O3+TMIBfL7vbEE3jky
	 fBPApUvfH6x1Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC RESEND v5 5/6] arm64: dts: amlogic: Add video
 decoder driver support for S4 SOCs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Zhentao Guo via B4 Relay" <devnull+zhentao.guo.amlogic.com@kernel.org>
Cc: linux-amlogic@lists.infradead.org, conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, neil.armstrong@linaro.org
In-Reply-To: <20260526-b4-s4-vdec-upstream-v5-5-33bc817f93f4@amlogic.com>
References: <20260526-b4-s4-vdec-upstream-v5-5-33bc817f93f4@amlogic.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 26 May 2026 10:38:19 +0000
Message-Id: <20260526103819.AFEA71F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] The patch silently introduces an `optee` node which is not menti=
oned in the commit message, and places it incorrectly at the root of the de=
vice tree.
- [Low] The newly added `canvas` and `video-codec` nodes break the expected=
 unit-address sorting within the `soc` simple-bus node.
--

commit 9f1bc8bd76d58f7598508700fcc37888ae1dbf0f
Author: Zhentao Guo <zhentao.guo@amlogic.com>

arm64: dts: amlogic: Add video decoder driver support for S4 SOCs

This commit adds the vdec node to enable Amlogic V4L2 stateless video
decoder support for S4 SOCs. It also introduces an optee node and a canvas
node required for the decoder.

> diff --git a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi b/arch/arm64/boot/=
dts/amlogic/meson-s4.dtsi
> --- a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
> @@ -96,6 +96,11 @@ saradc: adc@fe026000 {
>  		status =3D "disabled";
>  	};
> =20
> +	optee {
> +		compatible =3D "linaro,optee-tz";
> +		method =3D "smc";
> +	};

[Severity: Medium]
Should this optee node addition be explicitly mentioned in the commit
message? The commit description currently only mentions adding the vdec
node.

Also, should this node be placed under a firmware node instead of at the ro=
ot
level of the device tree?

>  	soc {
>  		compatible =3D "simple-bus";
>  		#address-cells =3D <2>;

[ ... ]

> @@ -907,5 +912,34 @@ emmc: mmc@fe08c000 {
>  			assigned-clocks =3D <&clkc_periphs CLKID_SD_EMMC_C>;
>  			assigned-clock-rates =3D <24000000>;
>  		};
> +
> +		canvas: video-lut@fe036048 {
> +			compatible =3D "amlogic,canvas";
> +			reg =3D <0x0 0xfe036048 0x0 0x14>;
> +		};
> +
> +		video-codec@fe320000 {

[Severity: Low]
Does appending these nodes break the expected unit-address sorting within t=
he
soc simple-bus node? The canvas node at fe036048 and the video-codec node at
fe320000 appear to be placed at the end of the block, after mmc@fe08c000,
rather than being ordered sequentially.

> +			compatible =3D "amlogic,s4-vdec";
> +			reg =3D <0x0 0xfe320000 0x0 0x10000>,
> +			      <0x0 0xfe036000 0x0 0x20>;

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260526-b4-s4-vdec=
-upstream-v5-0-33bc817f93f4@amlogic.com?part=3D5
