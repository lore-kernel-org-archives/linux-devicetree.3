Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CF743E7BC8
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 12:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784119737; cv=none; b=QlI3YhsJBVRemchcB4lyUPGnna1drAaIICM7HuVbgpkRcVDjTDtMdAuJ/6U8OZXta0gWEAGJwcrCiqCzqMffgoXFk6C4eZLPGswQc66uRHspA8trFLIYCtEzzURZ42nqz4k2qBubGZHLlihJlRA86GmK6gpa+PCpBONLMLxG7as=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784119737; c=relaxed/simple;
	bh=MkVGGPEhVwyGab/IZlWHgT1LEIztbcLIPYJhoX3XaFI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Ma+DeWJiGx2RRlhZw2XNH7dSRg4LtBBdLEfnuiw3VahxWE02hl9nDTqjw8QWPzSeTWx/v1v2OoyN4DbCX+Ass3u6nv/IpHk/tiVV/WVfknJMgIVsbgvmmsgCscsd0X4lBqH7CJWVmx3+fUfxcUCOGIDqjnjjR9DMsCma87mzs4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hRvm6Sb1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hRvm6Sb1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A8841F000E9;
	Wed, 15 Jul 2026 12:48:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784119735;
	bh=2MmBc2j/R7RJqEhUB66LPHlDdD1y3qEudIsqhS329DM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hRvm6Sb10an+ipm5+nIXseSFSrgogEd7ofjMkfQb/gYlAezm4KWvkB2L0+idJijsg
	 y2qKefJM7Nuo/5CRzkRi004zXReLhrkZMyaSLQCO/Xr2jmSa+SeiZtTMBKRXwk5KAS
	 5nkr+hlZs2BdcnGv5n1RcNReN1ZM5JgGrERSrnlYV1IT6KJqyjQcJLsCXkQsGLzKAe
	 BjozycGUJNoegnj4zLHdz6DNbuBX1c7IoXDNTLAynKKacxpCTC95zr4p/Y6XiSAL3K
	 Fmdela3guV0WWkMovgDYxyYYs0Z6dqQIoLaGNDKhkjECxez8D/3Iryt8lBvnjLGwLQ
	 khcr2bceGRlhQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/4] iio: light: ltr501: Add ltr329 driver support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Esben Haabendal" <esben@geanix.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260715-liteon-ltr329-v2-3-d18af55edab5@geanix.com>
References: <20260715-liteon-ltr329-v2-0-d18af55edab5@geanix.com>
 <20260715-liteon-ltr329-v2-3-d18af55edab5@geanix.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 15 Jul 2026 12:48:55 +0000
Message-Id: <20260715124855.9A8841F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Use-After-Free of IIO event interface due to mixing devm_request_t=
hreaded_irq with manual iio_device_unregister
- [High] Kernel stack memory leak and logic failure on big-endian systems d=
ue to reading 2 bytes into an uninitialized 4-byte integer
--

--- Patch [3]: [PATCH v2 3/4] iio: light: ltr501: Add ltr329 driver support=
 ---
commit 8ae95bcf91bc6043da3fe9505d6fab5f356128f7
Author: Esben Haabendal <esben@geanix.com>

iio: light: ltr501: Add ltr329 driver support
   =20
This adds support for the LTR-329ALS-01 chip, which is similar to
LTR-303ALS-01, except for interrupt, which LTR-329ALS-01 chip does not
have.

> diff --git a/drivers/iio/light/ltr501.c b/drivers/iio/light/ltr501.c
> index 7d045be78c6df..379e57ac5f5b2 100644
> --- a/drivers/iio/light/ltr501.c
> +++ b/drivers/iio/light/ltr501.c

[ ... ]

> @@ -1531,6 +1556,12 @@ static int ltr501_probe(struct i2c_client *client)
>  		return ret;
> =20
>  	if (client->irq > 0) {
> +		if (!ltr501_has_irq_support(data->chip_info)) {
> +			dev_err(&client->dev, "chip does not support irq\n");
> +			ret =3D -EINVAL;
> +			goto powerdown_on_error;
> +		}
> +
>  		ret =3D devm_request_threaded_irq(&client->dev, client->irq,

[Severity: High]
This is a pre-existing issue, but does using devres for the IRQ while
manually unregistering the IIO device cause a use-after-free?

In ltr501_remove(), iio_device_unregister() is called manually, which
frees the event interface. However, because the IRQ is allocated with
devm_request_threaded_irq(), it remains active until after
ltr501_remove() returns.

If an interrupt fires during this window, ltr501_interrupt_handler()
could call iio_push_event(), which accesses the freed event interface.


[Severity: High]
This is also a pre-existing issue, but is there a risk of leaking kernel
stack memory on big-endian systems in ltr501_trigger_handler()?

In ltr501_trigger_handler(), regmap_bulk_read() reads 2 bytes into an
uninitialized 4-byte integer:

ltr501_trigger_handler() {
    ...
    int psdata;
    ...
    ret =3D regmap_bulk_read(data->regmap, LTR501_PS_DATA, &psdata, 2);
    ...
}

On big-endian architectures, these 2 bytes overwrite the most
significant bytes of psdata, leaving the least significant bytes
uninitialized.

The driver then applies a mask:

    scan.channels[j++] =3D psdata & LTR501_PS_DATA_MASK;

Could this extract uninitialized kernel stack data and push it to the
IIO ring buffer, exposing it to userspace?

>  						NULL, ltr501_interrupt_handler,
>  						IRQF_TRIGGER_FALLING |

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260715-liteon-ltr=
329-v2-0-d18af55edab5@geanix.com?part=3D3
