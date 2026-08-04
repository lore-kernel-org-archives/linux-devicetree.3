Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5B0925785C
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 12:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785846474; cv=none; b=AM+F/19LKr0jUsMmShuMdKAhT2k5YAst7HScFk+IlkkB6fCaSOND0zXNvxFVrNVns4DjLYwlO7EqPLVAJAn4vjTPgFiscdJ5VUDg9wLuXimLcF5rxlYrs5LBLQC/fd9yu5jNOvDKyY8r9H7xQmDC83eMvgVIqiivdaQG/RfExUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785846474; c=relaxed/simple;
	bh=rn06rqpAMSngvdZo2UbspE8z7ZPEG/XODVeJlxPyrIs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=hodbpqlzfuYj31dXKO7BO8R8jHdXqWWde2gUyr9wPY1cfTcJJ0inbNzWswV/8QDpSLGlw1kRqbXTZHBgLtbrQ9id0VqKkdeLVYTCmIP3Eun5AYDs3JaWivVjG1JJHfhHO7eKTwt1cfDrmiMPZcfWN5eWzcb5Gm29F9ai8aIqyWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KOfLb0Xi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KOfLb0Xi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E79AA1F00A3A;
	Tue,  4 Aug 2026 12:27:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785846472;
	bh=AjBMexgwqRFhnD4nZU4CtdNwDsQHReIvEfmjtQpTKCI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KOfLb0Xi/lBY9i29riTYfX6YqS09vmV4R8/WQ5X9KLqv8biMh8twfMRsNK4yz5+Nn
	 CaAXZV96YDLGzen0v0kSzCMHFyW6hJLYpJzYv5nrnAk4Y0kXo4Qr18UfQ3hFVcB86X
	 qFS0USrfrQ47u8KQqLRKtp2Bvp1L6oavLJ7o4tDj06voCmAw5W092rJqYf3bSv7YsZ
	 S/fVSeuvzakZoynoh8Dn0cDpOCJ4YlOM0tNR8ivXLLc1CpuPtCfoauwQM+/Jd+JTbw
	 XHJsPWOeZZVtG6vvCWPqOM/KW4QUphUHeGfUXaqX4kdDB5o/K0pHtBX8+UWx/9sfjX
	 kF9JhCRVKGEsQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 09/17] nvmem: microchip-otpc: nvmem: microchip-otpc:
 add tag-based packet lookup
Reply-To: sashiko-reviews@lists.linux.dev
To: "Varshini Rajendran" <varshini.rajendran@microchip.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260804113338.261782-10-varshini.rajendran@microchip.com>
References: <20260804113338.261782-1-varshini.rajendran@microchip.com>
 <20260804113338.261782-10-varshini.rajendran@microchip.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 04 Aug 2026 12:27:51 +0000
Message-Id: <20260804122751.E79AA1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:

New issues:
- [Medium] TAG-based packet reads fail to bound the requested bytes to the =
actual packet length, leaking adjacent OTP packets.

Pre-existing issues:
- [High] Concurrent OTP reads cause a hardware race condition on OTP regist=
ers without locking.
- [High] Using `readl_relaxed()` for a FIFO data stream causes data corrupt=
ion on big-endian systems.
- [High] Global static struct `mchp_nvmem_config` is dynamically modified i=
n probe, causing a data race if multiple devices are probed.
- [High] Mismatch between logical size tracking and physical offset causes =
out-of-bounds hardware reads during probe.
- [High] Incorrect arguments passed to read_poll_timeout(), with sleep_us s=
ignificantly larger than timeout_us.
--

--- Patch [9]: [PATCH v5 09/17] nvmem: microchip-otpc: nvmem: microchip-otp=
c: add tag-based packet lookup ---
commit e6e6046319784f7ce1cf86169392921f7f8bb397
Author: Varshini Rajendran <varshini.rajendran@microchip.com>

nvmem: microchip-otpc: nvmem: microchip-otpc: add tag-based packet lookup

This commit adds support for accessing OTP packets by their FourCC tag,
preserving backward compatibility with ID-based lookup. The driver supports
both legacy ID-based offsets and TAG-based offsets by reading and caching
packet metadata during probe. The nvmem stride is also set to 1 to enable
tag-based access.

> diff --git a/drivers/nvmem/microchip-otpc.c b/drivers/nvmem/microchip-otp=
c.c
> index df979e8549fdb..a17f82afdc37d 100644
> --- a/drivers/nvmem/microchip-otpc.c
> +++ b/drivers/nvmem/microchip-otpc.c
[ ... ]
> @@ -140,8 +190,29 @@ static int mchp_otpc_prepare_read(struct mchp_otpc *=
otpc,
>   * offset returned by hardware.
>   *
>   * For this, the read function will return the first requested bytes in =
the
> - * packet. The user will have to be aware of the memory footprint before=
 doing
> - * the read request.

[Severity: High]
This is a pre-existing issue, but are the arguments passed to
read_poll_timeout() in mchp_otpc_prepare_read() correct?

	return read_poll_timeout(readl_relaxed, tmp, !(tmp & MCHP_OTPC_SR_READ),
				 10000, 2000, false, otpc->base + MCHP_OTPC_SR);

The sleep_us parameter is set to 10000 (10ms) while timeout_us is set to 20=
00
(2ms). Since the sleep time is 5x larger than the total timeout, won't this
instantly return a timeout error on the first sleep cycle if the hardware i=
sn't
immediately ready?

> + * packet.
[ ... ]
> @@ -154,12 +225,11 @@ static int mchp_otpc_read(void *priv, unsigned int =
off, void *val,
>  	int ret, payload_size;
> =20
>  	/*
> -	 * We reach this point with off being multiple of stride =3D 4 to
> -	 * be able to cross the subsystem. Inside the driver we use continuous
> -	 * unsigned integer numbers for packet id, thus divide off by 4
> -	 * before passing it to mchp_otpc_id_to_packet().
> +	 * From this point the offset has to be translated into the actual
> +	 * packet. For this we traverse the table of contents stored in a list
> +	 * "packet" based on the access type - packet id or tag.
>  	 */
> -	packet =3D mchp_otpc_id_to_packet(otpc, off / 4);
> +	packet =3D mchp_otpc_resolve_packet(otpc, off);
>  	if (!packet)
>  		return -EINVAL;
>  	offset =3D packet->offset;

[Severity: High]
This is a pre-existing issue, but can concurrent OTP reads cause a hardware=
 race
condition?

Looking at mchp_otpc_read(), there is an outer loop that accesses the hardw=
are:

	while (len < bytes) {
		ret =3D mchp_otpc_prepare_read(otpc, offset);

When multiple consumers call nvmem_device_read() concurrently,
mchp_otpc_prepare_read() modifies global hardware registers without locking:

	writel_relaxed(tmp, otpc->base + MCHP_OTPC_MR);
	...
	writel_relaxed(tmp, otpc->base + MCHP_OTPC_CR);

Could this clobber the hardware state machine and lead to unpredictable
behavior?


[Severity: High]
This is a pre-existing issue, but does using readl_relaxed() for the FIFO d=
ata
stream cause data corruption on big-endian systems?

When reading the payload content in mchp_otpc_read():

		do {
			*buf++ =3D readl_relaxed(otpc->base + MCHP_OTPC_DR);
			len +=3D sizeof(*buf);
			offset++;
			payload_size--;
		} while (payload_size >=3D 0 && len < bytes);

The readl_relaxed() macro performs an implicit CPU-to-little-endian byte sw=
ap
on big-endian architectures. Should a stream accessor be used instead to
preserve the byte order between the device and memory?


[Severity: Medium]
Does TAG-based packet reading fail to bound the requested bytes to the actu=
al
packet length, leading to a leak of adjacent OTP packets?

If a client requests a read size larger than the actual packet payload, the
inner loop in mchp_otpc_read() exits when the payload size is exhausted:

		do {
			*buf++ =3D readl_relaxed(otpc->base + MCHP_OTPC_DR);
			len +=3D sizeof(*buf);
			offset++;
			payload_size--;
		} while (payload_size >=3D 0 && len < bytes);

However, if len is still less than bytes, the outer while (len < bytes) loop
will continue and issue new hardware reads for the next sequential packet.
Could this undermine the packet-based access abstraction by returning adjac=
ent
packet data?

[ ... ]
> @@ -215,6 +300,20 @@ static int mchp_otpc_init_packets_list(struct mchp_o=
tpc *otpc, u32 *size)
> =20
>  		packet->id =3D id++;
>  		packet->offset =3D word_pos;
> +		type =3D FIELD_GET(MCHP_OTPC_HR_PACKET, word);
> +
> +		if (type =3D=3D MCHP_OTPC_HR_PACKET_REGULAR) {
> +			ret =3D mchp_otpc_read_packet_tag(otpc, packet->offset,
> +							&packet->tag);
> +			if (ret)
> +				return ret;
> +
> +			if (!mchp_otpc_is_valid_fourcc(packet->tag))
> +				packet->tag =3D 0;
> +		} else {
> +			packet->tag =3D 0;
> +		}
> +

[Severity: High]
This is a pre-existing issue, but does a mismatch between the logical size
tracking and the physical offset cause out-of-bounds hardware reads during
probe?

In mchp_otpc_init_packets_list(), the loop increments the size and word_pos:

		/* Count size by adding header and paload sizes. */
		*size +=3D 4 * (payload_size + 1);
		/* Next word: this packet (header, payload) position + 1. */
		word_pos +=3D payload_size + 2;

The size pointer increments by 4 * (payload_size + 1) bytes, while word_pos
increments by payload_size + 2 words (which is 4 * (payload_size + 2) bytes=
).
Because word_pos grows faster than size, could word_pos exceed the hardware
limits before size reaches MCHP_OTPC_SIZE, causing mchp_otpc_prepare_read()=
 to
poll invalid hardware offsets?

[ ... ]
> @@ -236,7 +335,7 @@ static struct nvmem_config mchp_nvmem_config =3D {
>  	.type =3D NVMEM_TYPE_OTP,
>  	.read_only =3D true,
>  	.word_size =3D 4,
> -	.stride =3D 4,
> +	.stride =3D 1,
>  	.reg_read =3D mchp_otpc_read,
>  };

[Severity: High]
This isn't a bug introduced by this patch, but does modifying the global st=
atic
mchp_nvmem_config struct during probe cause a data race?

In mchp_otpc_probe(), the shared global struct is dynamically modified:

	mchp_nvmem_config.dev =3D otpc->dev;
	mchp_nvmem_config.add_legacy_fixed_of_cells =3D true;
	mchp_nvmem_config.size =3D size;
	mchp_nvmem_config.priv =3D otpc;

If multiple instances of the mchp-otpc driver are probed concurrently, could
this result in invalid private data pointers being registered with the nvmem
core?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260804113338.2617=
82-1-varshini.rajendran@microchip.com?part=3D9
