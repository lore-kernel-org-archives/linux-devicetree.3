Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 051BB22A4E1
	for <devicetree@vger.kernel.org>; Sun,  9 Aug 2026 12:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786278377; cv=none; b=ZxN4r97N+Hp+ZvmeTxrwyq9cus3F+Dl+J5P5cFvXW7IvK143Ld2Ap1WUB9xRmKHgzbp+tys5Fky2xKXS4QsyEapX15ug1np8zy0XKfbpoIXTxAujDhhll5j/YEVuCZYrPPDL5jVHAKUG4rwDWWlmlVRQpBMiJgjTF1Y2qVPLLx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786278377; c=relaxed/simple;
	bh=Njvam0GHbBQZzMx1o3AC0+7x3gFT+OzNUYyzp4QxyLk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=JT1n4KqT14yPoLV26SdFHxwoJ8c3T0PaWYS8K/RcWF6B9f39+QWn66L1UYDdy4PfhvymUC9U6GoAeoPFu4I3V0kALxFMsk1+iwnZ+uzQrXfQvAPNVYbouXdF1x6hB7AepUlNswwr39HjrV8CfxcIydoVsADueGQIs4/W5GFo4qY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gyH5oEID; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gyH5oEID"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 489CB1F000E9;
	Sun,  9 Aug 2026 12:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786278375;
	bh=EsimSTY4prTTB4ruLLLECXinjDNJjLTYeaJ6kzqMSb4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gyH5oEIDVuRvcMOen22PCrEkD40xs3EkTDY7FOObyllL0qYaJFdZ+nQ6bmyBlGXYu
	 gqLKvEEC3RxTb3MgU8fQf6Uo+tsCDaQh8JuYJOR+AUoqcocN1+lZiQ/MZCIxAxuM0t
	 JRuBKhLKvo5ulup7Uty+vAWJy4JpWCXtBt2NeUybaRpwHG3Fg6IZBSAa+qXRD6GBcm
	 GdLUxXrOnk0NUgZkppqvvOapOlEfJfxBRXXRBPNwek1huNHjY22dC0moap3RWp1wDl
	 SGIWFDjdbHtXoy/PDC9uQd2AU61ZeK2AD7GB1lnDvKw1zEiLFKHyUiZeUruKluioFE
	 Vqcr8/EatTvDw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: serial: 8250: Add Airoha
 compatibles
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260809121449.574277-2-ansuelsmth@gmail.com>
References: <20260809121449.574277-1-ansuelsmth@gmail.com>
 <20260809121449.574277-2-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 09 Aug 2026 12:26:14 +0000
Message-Id: <20260809122615.489CB1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Alphabetical sorting and schema structure violation in the compatib=
le list.
--

--- Patch [1]: [PATCH v4 1/2] dt-bindings: serial: 8250: Add Airoha compati=
bles ---
commit 27d01f216d527b904216459304a02e2d8c5f87e2
Author: Benjamin Larsson <benjamin.larsson@genexis.eu>

dt-bindings: serial: 8250: Add Airoha compatibles

This commit adds compatibles for the Airoha SoC family's 16550-compatible
UART and High-Speed UART hardware. The hardware features a custom baud rate
settings register.

> diff --git a/Documentation/devicetree/bindings/serial/8250.yaml b/Documen=
tation/devicetree/bindings/serial/8250.yaml
> index bb7b9c87a8072..b6f7e093d8d7a 100644
> --- a/Documentation/devicetree/bindings/serial/8250.yaml
> +++ b/Documentation/devicetree/bindings/serial/8250.yaml
> @@ -110,6 +110,11 @@ properties:
>        - const: mrvl,pxa-uart
>        - const: nuvoton,wpcm450-uart
>        - const: nuvoton,npcm750-uart
> +      - const: airoha,en7523-uart
> +      - items:
> +          - const: airoha,an7581-uart
> +          - const: airoha,en7523-uart
> +      - const: airoha,an7581-hsuart

[Severity: Low]
This isn't a bug, but are the airoha entries inserted out of alphabetical
order here? The existing const compatibles appear to be grouped together
and sorted alphabetically by vendor prefix, meaning airoha should likely
appear earlier in the list.

Additionally, should the items block for the multi-string compatible be
moved? It seems to break the structural convention of the file by inserting
an items block into the middle of the standalone const block, whereas other
items blocks are typically grouped together after the const entries.

>        - const: nvidia,tegra20-uart
>        - const: nxp,lpc3220-uart
>        - items:

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260809121449.5742=
77-1-ansuelsmth@gmail.com?part=3D1
