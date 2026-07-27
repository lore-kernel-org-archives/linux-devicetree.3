Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DBFB1F8755
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 12:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785155990; cv=none; b=YCba1f/4sDQIInYQ/aliBeyB5KVgBgbbwXWOTzYQSuVVm8C1mxvP01fowwY9YwlFNOMkPQ3eOqPJ4KoXXyDUVEHD6rafiWrhhmf51Gbhga+U3JP1tmanLZibR0g7d0rkVupptWRnV9CadkFBzz1tr/Ob2m6ilFRvJ5HdTsobxBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785155990; c=relaxed/simple;
	bh=SPL82aTBEpE4FWboFVnBOBka5nvH9TuR5//Q1kE/fII=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=GiyUUGtXaxZpFRn5AurrX1EAVeiobyp3HV2jowGa8KlUQLOeZ3d57Dj3JY0Wn6C3136CDWVPC6HMaT4+pxwl+eC4IJcZ7k4UrSS82wja8rnXXpQQcvVkTl7HiC/3eCq0+XnpykvkCidtv20jXpNcE7bKuz+vN7wJ/ZhSbL4jOxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LmJkqEWQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LmJkqEWQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8EAB1F000E9;
	Mon, 27 Jul 2026 12:39:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785155989;
	bh=G5BhX/BCMKYNJd9YF9yUHwLkaOmnRZGyNlZyGUjJHDk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LmJkqEWQnwNcGqHY4y7GQ6HqKEZGv04Kk0inGU4EabQgAlG7QyRezkjO89eJl3Aco
	 jQPUTyNWwxNXkbCER6D3tLiwfgFhGiEDYY4exhDnn1noiKJHaiOrBERwRrI2MYluVy
	 GiKZtekGx4LKRJialIIllOYrS7PzIb12nKQDLClabAzW36JQHh9an+fsyDYJuA8NH+
	 sE6Eq5R6uSPZGZPE7wcpK4p3eT7Mn4DckXoVK/NQ9HF3I6q7Q6hGBUA5IXZzKWxZLK
	 MoAsTNtC2x5xCVVBLIco3YPcnkX7c/0I0dEciswz74HCxPQebwMnOnUYPEhkDuZrMP
	 BFG0RYOzXiUMA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 09/16] nvmem: microchip-otpc: nvmem: add emulation
 mode and OTP access validation
Reply-To: sashiko-reviews@lists.linux.dev
To: "Varshini Rajendran" <varshini.rajendran@microchip.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260727122633.117435-10-varshini.rajendran@microchip.com>
References: <20260727122633.117435-1-varshini.rajendran@microchip.com>
 <20260727122633.117435-10-varshini.rajendran@microchip.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 12:39:48 +0000
Message-Id: <20260727123948.E8EAB1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The arguments for `sleep_us` and `timeout_us` in `read_poll_timeou=
t` are swapped, causing the poll to sleep excessively and fail prematurely.
- [High] There is a mismatch between the calculated NVMEM device size and t=
he number of bytes read per packet, leading to truncated reads and corrupte=
d payload data in the buffer.
- [Medium] The OTP payload stream is read from the `MCHP_OTPC_DR` data regi=
ster using `readl_relaxed()` in a loop, which causes unintended byte-swappi=
ng on big-endian architectures.
--

--- Patch [9]: [PATCH v4 09/16] nvmem: microchip-otpc: nvmem: add emulation=
 mode and OTP access validation ---
commit b464c23d34790bae23b36f89796febe703de8718
Author: Varshini Rajendran <varshini.rajendran@microchip.com>

nvmem: microchip-otpc: nvmem: add emulation mode and OTP access validation

This commit adds validation of OTP memory accessibility and emulation mode
status during probe. When the boot packet is not configured, emulation mode
allows access to the other packets.

> diff --git a/drivers/nvmem/microchip-otpc.c b/drivers/nvmem/microchip-otp=
c.c
> index a17f82afdc37d..6b0184423463e 100644
> --- a/drivers/nvmem/microchip-otpc.c
> +++ b/drivers/nvmem/microchip-otpc.c
> @@ -343,7 +344,8 @@ static int mchp_otpc_probe(struct platform_device *pd=
ev)
>  {
[ ... ]
>  	ret =3D mchp_otpc_init_packets_list(otpc, &size);
>  	if (ret)
>  		return ret;
> =20
> +	if (!size) {
> +		dev_warn(otpc->dev, "Cannot access OTP memory\n");
> +		if (!emul_enable)
> +			dev_info(otpc->dev, "Boot packet not programmed and emulation mode di=
sabled\n");
> +	}
> +
>  	mchp_nvmem_config.dev =3D otpc->dev;
>  	mchp_nvmem_config.add_legacy_fixed_of_cells =3D true;

While reviewing this patch, I noticed a few pre-existing issues in the same
file that you might want to address:

drivers/nvmem/microchip-otpc.c:mchp_otpc_read()
>        *buf++ =3D readl_relaxed(otpc->base + MCHP_OTPC_DR);

[Severity: Medium]
This is a pre-existing issue, but does this read sequential FIFO payload da=
ta
using a byteswapping scalar accessor rather than a stream accessor (e.g.
readsl())?

Using readl_relaxed() here might cause unintended byte-swapping on big-endi=
an
architectures when reading the underlying raw byte stream.


drivers/nvmem/microchip-otpc.c:mchp_otpc_prepare_read()
>    return read_poll_timeout(readl_relaxed, tmp, !(tmp & MCHP_OTPC_SR_READ=
),
>                             10000, 2000, false, otpc->base + MCHP_OTPC_SR=
);

[Severity: High]
This is a pre-existing issue, but are the sleep_us and timeout_us arguments
swapped here?

The sleep_us parameter is set to 10000 (10ms) while timeout_us is set to
2000 (2ms), which would cause the timeout to expire before the first sleep
completes.


drivers/nvmem/microchip-otpc.c:mchp_otpc_init_packets_list()
>    *size +=3D 4 * (payload_size + 1);

drivers/nvmem/microchip-otpc.c:mchp_otpc_read()
>    } while (payload_size >=3D 0 && len < bytes);

[Severity: High]
This is a pre-existing issue, but is there a mismatch between the calculated
NVMEM device size and the number of bytes read per packet?

In mchp_otpc_init_packets_list(), the total size is incremented by exactly
payload_size + 1 words (header + payload).

However, in mchp_otpc_read(), the loop condition payload_size >=3D 0 causes
it to iterate payload_size + 1 times for the payload alone, meaning a total
of payload_size + 2 words (including header) are fetched and written to the
buffer per packet.

Could this write a padding or gap word into the user buffer, shifting
subsequent packets and causing final packets to be truncated because the
len < bytes limit is reached prematurely?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260727122633.1174=
35-1-varshini.rajendran@microchip.com?part=3D9
