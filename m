Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A19F7364029
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 10:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788259216; cv=none; b=qHPCjRSYal8zr6cUPvdv1qR2qX+gtw2iRvVh5xBOIwafl02h1oU10WZDBQr537h+t+RWmsq3CU2G+bC9C3gaAH3JPQt0/rcB2Arb/3+34TGL5AtMVxAYGnm4wK5LO6VrmAh7tX7X0Wna0d2YLZb1eLl+cyWnixoePibyhpXzoks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788259216; c=relaxed/simple;
	bh=5UH82Og6uIPJAzx3Dths0hWvSvdZk+h/Agpv1SjxEy4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=NORebLLU67D6w4PO4lbxzhAGH6fcCdkmENW//ZTPRe6Fm8ixPIXuMQIvcXo6e6EbXmP+1K+VlPUi+AnlDZK0pBdVay13FLcvIYHN1ARQp09q8KNS6zCgyj4H6WEyCJX/4FILuai1m/UJUee7kqNld72KVjrzmBg7y3lKejogbeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FNZ3PtYC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FNZ3PtYC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 543841F00A3D;
	Tue,  1 Sep 2026 10:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788259215;
	bh=tvdjxNnG9K7Kn36V6200wRzT1a0uVnvsW7fsf4/fUos=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FNZ3PtYC7shuHSigP43DPJf5/ej+JRYB0ZRpb2HiQ/M41Akjgey5DJQMrYUClegi4
	 K0FXCIHT2Fq3yq3I65URVdtszH9sD+nWWMOnV4/vcXeJStxUbZBMcSucv7uCQ2MeMz
	 dkPA96McIo3V58FjdXK9LVhScScG1rNs04F1AOhS97XyaWAsZSrRPslZLls+85b9E4
	 p0m5rrak7Q/RCQdxsJbGlB4t7Qlyrcp4KiVsaLR7s5EL0kIMKjg6K+w8ObRl1UR4mE
	 fqyWl014mbB1+SC+pb+Lp6/auhs7V144xTh7bzyJ+hhKp5cXg7hcGUiit1kmBfYo/D
	 fT/hqrD88C3jg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 4/6] spmi: apple: Implement remaining commands
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sasha Finkelstein" <k@chaosmail.tech>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260901-t603x-spmi-v9-4-09e702e3b153@chaosmail.tech>
References: <20260901-t603x-spmi-v9-0-09e702e3b153@chaosmail.tech>
 <20260901-t603x-spmi-v9-4-09e702e3b153@chaosmail.tech>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 01 Sep 2026 10:40:15 +0000
Message-Id: <20260901104015.543841F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Endianness bug in `spmi_raw_cmd` due to improper mixing of `memc=
py()` and `writel()`/`readl()` for FIFO stream accesses.
--

commit cb6fc258a7a80697550d0e3d62f761cda4b89087
Author: Alba Mendez <me@alba.sh>

spmi: apple: Implement remaining commands
   =20
Add support for zero write and power management commands.

> diff --git a/drivers/spmi/spmi-apple-controller.c b/drivers/spmi/spmi-app=
le-controller.c
> index b1c127cf5f441..9843dc871d6c7 100644
> --- a/drivers/spmi/spmi-apple-controller.c
> +++ b/drivers/spmi/spmi-apple-controller.c
[ ... ]
> @@ -86,6 +85,14 @@ static int spmi_read_cmd(struct spmi_controller *ctrl,=
 u8 opc, u8 sid,
> =20
>  	writel(spmi_cmd, spmi->regs + SPMI_CMD_REG);
> =20
> +	while (i < len_wr) {
> +		j =3D min_t(size_t, sizeof(spmi_cmd), len_wr - i);
> +		spmi_cmd =3D 0;
> +		memcpy(&spmi_cmd, buf_wr + i, j);
> +		writel(spmi_cmd, spmi->regs + SPMI_CMD_REG);

[Severity: Medium]
Will using memcpy() to write into a u32 followed by writel() cause an
endianness regression on big-endian systems?

On big-endian systems, memcpy() places the first byte at the most
significant byte of the u32. writel() then applies a byte-swap, placing
that first byte at the highest bus address (byte 3) instead of byte 0,
which would corrupt the data stream going into the FIFO.

The pre-patch code avoided this by using bitwise shifts to pack the u32
in a CPU-endian-independent manner. Mixing memcpy() and writel() violates
subsystem rules for FIFO I/O accessors.

> +		i +=3D j;
> +	}
> +
>  	ret =3D apple_spmi_wait_rx_not_empty(ctrl);
>  	if (ret)
>  		return ret;
[ ... ]
> @@ -101,11 +109,9 @@ static int spmi_read_cmd(struct spmi_controller *ctr=
l, u8 opc, u8 sid,
>  			return -EIO;
>  		}
>  		rsp =3D readl(spmi->regs + SPMI_RSP_REG);
> -		i =3D 0;
> -		while ((len_read < len) && (i < 4)) {
> -			buf[len_read++] =3D ((0xff << (8 * i)) & rsp) >> (8 * i);
> -			i +=3D 1;
> -		}
> +		j =3D min_t(size_t, sizeof(spmi_cmd), len_rd - i);
> +		memcpy(buf_rd + i, &rsp, j);

[Severity: Medium]
Can this readl() followed by memcpy() cause the inverse data corruption on
the read path?

Like the write path, readl() performs a byte swap on big-endian systems,
meaning the memcpy() will extract the stream bytes in reverse order,
corrupting the responses received from the FIFO.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260901-t603x-spmi=
-v9-0-09e702e3b153@chaosmail.tech?part=3D4
