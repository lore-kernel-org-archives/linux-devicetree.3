Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795654137;
	b=0asPdzc/+ocWlknKXfwhSNA3XbZxdilqlvVnBDfYCKAovfomk9l4W1B01frUPPQaO2oK
	 tHYP8PlEXrDWxrubSfqbGc8BKAJKEN6tRT5Y8p1MmXhShXT9dC354+LtvBKegkAGFLmiW
	 +xxFzCkLFFYAe7sYGMuUBXrdPX6s9YPTHoLGIFGN5i6yUVPIIH4MRoALcM6n1jVCnsvE9
	 tMMEz5/38qHJ/juNfkwQV/CUlCyv/SGJuCRVZ5IDgfm5FasHuD0ZbyQiRE6LboNPykfBe
	 obqN3BlXQxADwEq/y074jw+nA5wShBE0GSJuIYRfJxd4ldryG8pyaA4ntaonMNX0J2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795654137;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=fGevdPLEWYMGm0p0gUQeCib6GTDwvKg+JSOz5ROMOew=;
	b=Bhq+AQFLwO//jc67OGD3Xc124e6TZeabOwyn5SA8Z71WdQYGXXg0GE7Gty1cmCNvB5QR
	 oRWz3S47Y9iZXiCE78Xjcu8cTKCk4Ho31xTFh/53c7hbA2EgpFxl3OdWPR79DmhY+oVn0
	 dJyjYYbF+t3EFN+uiC5/UoUTN69HhEgJua3WxRVHndvcQMJ1InsM1TyobP2p+aHybLNSn
	 BgFA8UiXoG2Q/YK2AR89MpSOIXLlVQwiME2BfXsnmzf4KQzzgPuqgUPYyOpUcYmNXrQwi
	 FiNmETvDTu6GwU3cidTZTR2oTqi/m2CFEN2Exzze38VFcRAq4Sy1Av3+nFQCCz3xFAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aV3TW5wd;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FE0F606A31E
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 00:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aV3TW5wd
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6DE61F000CA;
	Thu, 26 Nov 2026 00:48:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795654137;
	bh=fGevdPLEWYMGm0p0gUQeCib6GTDwvKg+JSOz5ROMOew=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aV3TW5wdRs6aagAvzJMs3VTqq+HEu4Sp44WpwLptYAKYmAnRyh5iyEvDmwqPpHA/a
	 RYK8J/rdQHJHTCxlS8wdUTRNR1gwSkmIRQPoNWtr7558fMuWJUwV86rfVekNZH1Xxo
	 b9iWGnSsz3AQ7oZERxCI1DR0xj4zojouFgHIylBDlIgAUoIqQqCIz8ehlX6Vn8Snz7
	 OdrYg+QfbDrjRzmUPPwppjiUDw2K7ovDqtMOabTKwT2vJ+B8Gult1aUGmK0+eUwgpj
	 lsh79KFVckvC4xr1nS+c+wSlbSOr0G3SnkwOMyWcn6sVivi21T/lCQmPJkwige7c/N
	 /MqOjePtVxS3Q==
Message-ID: <sashiko-outbox-234501@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 17/20] ARM: dts: nomadik: Correct controller and clock
 unit addresses
Reply-To: sashiko-reviews@lists.linux.dev
To: "Linus Walleij" <linusw@kernel.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261126-ux500-dts-after-powerdomains-v1-17-791cd62d8870@kernel.org>
References: <20261126-ux500-dts-after-powerdomains-v1-0-791cd62d8870@kernel.org>
 <20261126-ux500-dts-after-powerdomains-v1-17-791cd62d8870@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 26 Nov 2026 00:48:56 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] ARM: dts: nomadik: i2c-bitbang and pinctrl i2c rename split
  mismatch in series
--

commit 9061c78263d91688b3a0d397630719dc23e3bad7
Author: Linus Walleij <linusw@kernel.org>

ARM: dts: nomadik: Correct controller and clock unit addresses

This commit adds MMIO unit addresses to the Nomadik I2C and L2
cache-controller node names and removes dummy unit addresses from clock
nodes without reg properties.

> diff --git a/arch/arm/boot/dts/st/ste-nomadik-stn8815.dtsi b/arch/arm/boo=
t/dts/st/ste-nomadik-stn8815.dtsi
> index 4eba7c9433688..76db00fcba188 100644
> --- a/arch/arm/boot/dts/st/ste-nomadik-stn8815.dtsi
> +++ b/arch/arm/boot/dts/st/ste-nomadik-stn8815.dtsi
[ ... ]
> @@ -139,7 +139,7 @@ mmcsd_default_cfg1 {
>  				};
>  			};
>  		};
> -		i2c-0 {
> +		i2c0 {
>  			i2c0_default_mux: i2c0_mux {
>  				i2c0_default_mux {
>  					function =3D "i2c0";
> @@ -153,7 +153,7 @@ i2c0_default_cfg {
>  				};
>  			};
>  		};
> -		i2c-1 {
> +		i2c1 {
>  			i2c1_default_mux: i2c1_mux {
>  				i2c1_default_mux {
>  					function =3D "i2c1";

[Severity: Low]
Were the Nomadik I2C changes split across this patch and the earlier commit
"ARM: dts: ux500: Use valid I2C bus node names" by mistake?

That earlier ux500 patch already renamed gpio-i2c to i2c-bitbang in
ste-nomadik-s8815.dts (which this commit's message describes as happening
here), and also renamed the Nomadik I2C controller and pinctrl child nodes
from i2c0 and i2c1 to i2c-0 and i2c-1.  This patch then renames the I2C
controller nodes a second time to i2c@101f8000 and i2c@101f7000 and reverts
the pinctrl child node names back to i2c0 and i2c1.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261126-ux500-dts-=
after-powerdomains-v1-0-791cd62d8870@kernel.org?part=3D17
