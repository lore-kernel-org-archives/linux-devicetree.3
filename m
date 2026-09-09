Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69D07576ED8
	for <devicetree@vger.kernel.org>; Wed,  9 Sep 2026 14:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788964393; cv=none; b=nLKk+qQ6w/C2suTQKdemgRaRP30AS2Z1ICHI35+KnhzCGiQi77P49lZeLsex47y2yBnGbmMiFMwvfmtgmRuJ+XF9FE9gwliRNHV+208wUiV1lPp5l8C94+NroHX/L0gYUc+3S6NJnANbAtaFm+oTRUTOh9G3BCOwlL/TS7QlGo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788964393; c=relaxed/simple;
	bh=vtgwGwGKYciXl1ZfA8Cfnlkt1aPpSxSpMwqMKkh2mtU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=MFHg7TE0R0M+GGBO0XSOKiNbzCbzIGVIl54pQIffU8aPcMyXh/RNIabQ8GcJxS0CWCkB3/PkYreIAskqDcjUa3WIRKVkXried6enPIZYzfgVslLFPrye+qFJd57DEEZbjZNvu9U2fgeX2Izp0GOLee4zzkwL7NGMIULZS2TQ0Vg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FjzNAMmk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FjzNAMmk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F9041F00A3A;
	Wed,  9 Sep 2026 14:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788964392;
	bh=P0EPq+UOSM378S+5zByLOMmuIlYsI+/T9A5xlqKYeAU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FjzNAMmko0Eab/BUIwHuRg+MHGz4cC+7ouDmYRZF6aweNxdJpUowbrUzlt8N5z1Pa
	 1dKkliEbMh27Zz+CQWi4oEhx1MKjfhh06IpkhBmK+JinmY3dSTpsrgILjrOmiFZyZQ
	 1x89oAoaJCDq9EBa1BKNdozz0/QeLZ/R6fKNBhyNXumZhgCtPbf+aEjw++Axfmos2u
	 FAyfNeIDWEDUQdbvax0h6JJqUNonzJkHvwWFLzq5AuS6sWeSgZSC2f+2pL3KIP3rBv
	 qE+b6hMCP7c3n97R6T3zgJbHJE5UM5DQO4BGh6JEc0w+m96ySMA8B1KIsFe1G303qk
	 6GMhre9nTFF/w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 03/10] iio: dac: mcp47feb02: Return len when
 disabling EEPROM store
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ariana Lazar" <ariana.lazar@microchip.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260909-mcp47feb02_refactor-v5-3-8b67bcab93d1@microchip.com>
References: <20260909-mcp47feb02_refactor-v5-0-8b67bcab93d1@microchip.com>
 <20260909-mcp47feb02_refactor-v5-3-8b67bcab93d1@microchip.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 09 Sep 2026 14:33:11 +0000
Message-Id: <20260909143312.0F9041F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] This problem wasn't introduced by this patch, but suspend and resu=
me operations clobber the user-configured channel powerdown state.
--

commit 835e4538da01c3026ccf6237cb4357a864fa680c
Author: Ariana Lazar <ariana.lazar@microchip.com>

iio: dac: mcp47feb02: Return len when disabling EEPROM store

This commit modifies store_eeprom_store() to return the input buffer
length instead of 0 when state is false. This properly signals that the
buffer was fully consumed, preventing unnecessary write retries.

> diff --git a/drivers/iio/dac/mcp47feb02.c b/drivers/iio/dac/mcp47feb02.c
> index bf78618ac2c89..2ee981393aa1a 100644
> --- a/drivers/iio/dac/mcp47feb02.c
> +++ b/drivers/iio/dac/mcp47feb02.c
> @@ -469,7 +469,7 @@ static ssize_t store_eeprom_store(struct device *dev,=
 struct device_attribute *a
>  		return ret;
> =20
>  	if (!state)
> -		return 0;
> +		return len;
> =20

[Severity: High]
This is a pre-existing issue, but suspend and resume operations clobber the
user-configured channel powerdown state.

Looking at mcp47feb02_suspend():

drivers/iio/dac/mcp47feb02.c:mcp47feb02_suspend() {
    ...
	for_each_set_bit(ch, &data->active_channels_mask, data->phys_channels) {
		u8 pd_mode;

		data->chdata[ch].powerdown =3D true;
    ...
}

Does this unconditionally overwrite the channel's powerdown state during
suspend, causing the user's prior configuration to be permanently lost?

Similarly, looking at mcp47feb02_resume():

drivers/iio/dac/mcp47feb02.c:mcp47feb02_resume() {
    ...
	for_each_set_bit(ch, &data->active_channels_mask, data->phys_channels) {
		u8 pd_mode;
		int ret;

		data->chdata[ch].powerdown =3D false;
    ...
		ret =3D regmap_update_bits(data->regmap, MCP47FEB02_POWER_DOWN_REG_ADDR,
					 DAC_CTRL_MASK(ch),
					 DAC_CTRL_VAL(ch, MCP47FEB02_NORMAL_OPERATION));
    ...
}

Could this force all channels out of powerdown during resume, ignoring any
user-configured disabled state? Waking up a DAC channel that was explicitly
powered down by the user via sysfs could drive unintended voltage to attach=
ed
hardware upon system resume.

>  	/*
>  	 * Verify DAC Wiper and DAC Configuration are unlocked. If both are dis=
abled,
>  	 * writing to EEPROM is available.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260909-mcp47feb02=
_refactor-v5-0-8b67bcab93d1@microchip.com?part=3D3
