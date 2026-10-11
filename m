Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3586F293458
	for <devicetree@vger.kernel.org>; Sun, 11 Oct 2026 13:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791726408; cv=none; b=OOtTOdQaC2qPeXP0LySMljDid+nqQVSGXNUymQqM77dytHx3gAGyfUreAvcTBN6g58WRawDkEMhtCjBrIEvDU27W5500ZE00afw+pJlaAGFsPwKCdFACKP3NDFL6aAbmdo6jQ+Dga6XTtcN+LPSxGHb9TaI5iAh1hTn5HOGrq84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791726408; c=relaxed/simple;
	bh=+2wHEXv3j44Pv9WYb6jXv1cyjfD+FpFu2ZKPxU8Hw6c=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=ESks2s+tVX6D5lEOSyL0iCIasSUdqsgf/FwhAEE6HnL2T1AHbKOrK8HZwdZ6+gRK9pNJjnFJjmcGo6cnnYoL9+LQEo3RWb+dHDPeLWl5iMsbmE2/vG9bZGAndp7Lu2oeBo74sNWM9xzQ/2+GpwpKeL/67PIxfo+B8gYWnOzOB10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l/EQVQmI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l/EQVQmI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E6301F0089B;
	Sun, 11 Oct 2026 13:46:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791726406;
	bh=7FhevjXoLtUPm/T/KPsXqeL39VIfXX9uCvoFlM/OFJ8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=l/EQVQmIGjI26+lb4zBrQWd1BXYihzgB0srIMrY0Dhvi5vRNzNNOwgqjexZ5xmub9
	 /eqaTqk7cJdRjaDACFuS7/yj0iVytSi5OS2nKwXsFpq1ellmt4waLaxUrqitTIB+Dc
	 fg7CAFDoW3+jAXZkUO4XxgJ4CbvHynF8WlnsYRq6qcj2Ing8P0QqJgf/9eq8r4n9qh
	 l8OWwZf4gsG1JBBIkPUX62vRBpmQJKT32iahTmlo1Tao9W5pe9HJsgc08VKVkF4AgT
	 BtuL8Dibh9C1crB/FSVL9j8kzQRyWpjNlVh5eVtyk6jRn0UvthiUfXBsQc2XehEYjb
	 IRD7pS8VlFEsg==
Message-ID: <sashiko-outbox-167275@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] Bluetooth: btbcm: disable read tx power for
 BeagleV-Ahead
Reply-To: sashiko-reviews@lists.linux.dev
To: "Thomas Gerner" <thomas.gerner@muenchen-mail.de>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <578087018e274b0dcf25a523adc0d5cc590cceee.1791720467.git.thomas.gerner@muenchen-mail.de>
References: <cover.1791720467.git.thomas.gerner@muenchen-mail.de>
 <578087018e274b0dcf25a523adc0d5cc590cceee.1791720467.git.thomas.gerner@muenchen-mail.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 11 Oct 2026 13:46:46 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] bluetooth: btbcm: devm_kstrdup memory leak of board string on repea=
ted initialization
--

commit d78be9f56325d78f88a3903ffe62866de6e22e52
Author: Thomas Gerner <thomas.gerner@muenchen-mail.de>

Bluetooth: btbcm: disable read tx power for BeagleV-Ahead

The bluetooth module on the BeagleV-Ahead reports LE tx power read
capabilities but fails when actually doing it. This patch adds a quirk to
disable this reading based on the board's compatible string from the DTB.

> diff --git a/drivers/bluetooth/btbcm.c b/drivers/bluetooth/btbcm.c
> index 463d59890befe..2d02cc1863d0b 100644
> --- a/drivers/bluetooth/btbcm.c
> +++ b/drivers/bluetooth/btbcm.c
[ ... ]
> @@ -537,12 +542,13 @@ static const struct bcm_subver_table bcm_usb_subver=
_table[] =3D {
>   * This currently only looks up the device tree board appendix,
>   * but can be expanded to other mechanisms.
>   */
> -static const char *btbcm_get_board_name(struct device *dev)
> +static const char *btbcm_get_board_name(struct hci_dev *hdev)
>  {
>  #ifdef CONFIG_OF
>  	struct device_node *root __free(device_node) =3D of_find_node_by_path("=
/");
>  	char *board_type;
>  	const char *tmp;
> +	const char **s;
> =20
>  	if (!root)
>  		return NULL;
> @@ -550,8 +556,15 @@ static const char *btbcm_get_board_name(struct devic=
e *dev)
>  	if (of_property_read_string_index(root, "compatible", 0, &tmp))
>  		return NULL;
> =20
> +	/* disable broken Read LE Min/Max Tx Power on first board found in list=
 */
> +	for (s =3D board_broken_read_transmit_power; *s; s++)
> +		if (!strcmp(tmp, *s)) {
> +			hci_set_quirk(hdev, HCI_QUIRK_BROKEN_READ_TRANSMIT_POWER);
> +			break;
> +		}
> +
>  	/* get rid of any '/' in the compatible string */
> -	board_type =3D devm_kstrdup(dev, tmp, GFP_KERNEL);
> +	board_type =3D devm_kstrdup(&hdev->dev, tmp, GFP_KERNEL);

[Severity: Low]
Can this leak the board string on repeated initialization?

During device setup, btbcm_setup_patchram() calls btbcm_initialize(), which
calls btbcm_get_board_name(). The board_type string is allocated using
devm_kstrdup() and returned, but it is only stored locally as board_name in
btbcm_initialize() and discarded when the function returns.

Since btbcm_setup_patchram() subsequently calls btbcm_finalize(), which will
invoke btbcm_initialize() a second time if the firmware was successfully
loaded, the devm_kstrdup() allocation happens again, adding another permane=
nt
entry to the devres list.

Could kstrdup() be used instead so the memory can be explicitly freed when =
it
is no longer needed?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1791720467.gi=
t.thomas.gerner@muenchen-mail.de?part=3D2
