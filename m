Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03A49345CBE
	for <devicetree@vger.kernel.org>; Sat,  1 Aug 2026 21:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785618402; cv=none; b=COIOipdlPpNI8J0E+dRZjLhHEqMXBDV+SXIUPn5KVuJ707NEM8wVVhswbwyQk0ivxUHCH2G87F29/rI1r2IMHHUWXzk0RgH7uiIkx4E3jfxSPy0Esa9ROIDsh2o8jXEzIk0LhxsO74o7Ogs4ExXinObewPW0fOcriV2aFpwkows=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785618402; c=relaxed/simple;
	bh=WC6DSX0cu5JdXItM+v3bb6TN22zsnLS9Oy1rcs1bxus=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Yi94nAypMN01k7epbawwxvpL89TCZPsRQGalZf2fCCEQJYdg49onhaclTc3oeDfXVHo283X7Jy9sgu2wTODJJh+NLSHXy96zKOjpXFsOWPI+NS7hvRKoP3Wc6I7CqpcOVE7khrFFcaKl2pwvp5yvd3jmMfokRDIgIBHGopDorWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IM7N9HK9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IM7N9HK9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7879C1F00AC4;
	Sat,  1 Aug 2026 21:06:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785618400;
	bh=/MtS3PfbTKhMjtJsCqQst18xckvl7HB0ywKlRy+Y5Ek=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IM7N9HK9aDtXwaPfLO/2iKW6/EOWL5+iD0xY3EyDNKOKI2rb8eMPSfaJiZDEtm+W2
	 bCI02MXZheoPOtWdy+EsIPX8zejztpkCugq3pFrHLGVTmJr3mpzI8bH9iREn3RCdya
	 vL3CPg+E2zP1e/ZyqP6DURCr43JIItv8wCd9YeRntAcJto7Q0OukCOz9UF1HUHvWI+
	 DxH7aoeBWydMr+lsdGJr/0ziZqPUrh/mBTQ/VozXL4bG5YJH18C6CHf17wB808EiIg
	 3FMUdckRscMCyNBEM2C7J16p8usQd+gLfzugli6lBamE9RIRF657OXPKLMeNKQUO3W
	 ktbixI5tYq6qg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] ARM: dts: ti: Correct white-space style
Reply-To: sashiko-reviews@lists.linux.dev
To: "Krzysztof Kozlowski" <krzysztof.kozlowski@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260801210404.383925-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260801210404.383925-3-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 01 Aug 2026 21:06:40 +0000
Message-Id: <20260801210640.7879C1F00AC4@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Missing space between the node label and node name. The commit aims=
 to fix whitespace issues, but inadvertently removes all spacing between th=
e `uart1:` label and `serial@2531000` node name, resulting in `uart1:serial=
@2531000 {` instead of the conventional `uart1: serial@2531000 {`.
--

--- Patch [1]: [PATCH 1/2] ARM: dts: ti: Correct white-space style ---
commit 10cfc1fb15e4def453f73e2d4191b76cdd9e2e46
Author: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

ARM: dts: ti: Correct white-space style

This commit aims to correct whitespace formatting issues in TI device tree
files, such as missing spaces before brackets or spurious spaces, to resolve
warnings flagged by dt-check-style.

> diff --git a/arch/arm/boot/dts/ti/keystone/keystone.dtsi b/arch/arm/boot/=
dts/ti/keystone/keystone.dtsi
> index ff16428860a9b..22c8b8b04340d 100644
> --- a/arch/arm/boot/dts/ti/keystone/keystone.dtsi
> +++ b/arch/arm/boot/dts/ti/keystone/keystone.dtsi
[ ... ]
> @@ -123,7 +123,7 @@ uart0: serial@2530c00 {
>  			interrupts =3D <GIC_SPI 277 IRQ_TYPE_EDGE_RISING>;
>  		};
> =20
> -		uart1:	serial@2531000 {
> +		uart1:serial@2531000 {

[Severity: Low]
This isn't a bug, but does this unintentionally remove the space between the
uart1 label and the node name entirely?=20

>  			compatible =3D "ti,da830-uart", "ns16550a";
>  			current-speed =3D <115200>;
>  			reg-shift =3D <2>;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260801210404.3839=
25-3-krzysztof.kozlowski@oss.qualcomm.com?part=3D1
