Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D14BE2D5925
	for <devicetree@vger.kernel.org>; Sun, 16 Aug 2026 10:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786876581; cv=none; b=t5NPY+aLvdoCz/tQdM0afwROMCW0ieip4D9o+j9DtIMdJ0Fv/vbzZ2Xka8jfV2RbN7ng3Bz3LReS7we2BeX7xN6/SiCzV5hWIqIAjf9N6YFwP3jKBnI3/IHU0YxHQabHMD4Pa/n/tLb9fRpvI72EB2/hiQsgVEkdW/GQ7ai73H4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786876581; c=relaxed/simple;
	bh=pGHrH7fZM+7nTIS//Pd2/WEOo1kXJkpHq8jtQgkSGVM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=RJQoIGJs2KMZKij5lnItOYZW4d9+ugnZbeDin3//hjayG5K2lt5h8n7wQVR3rdMHJYupOtohTZTEzZ6o2QEU7yLqBSQ9B3KkXGyG22eoG5S4KvWChHzYnjXMGxu7XFcCJzdpOcvXxdCAtQ+49S0lf6GCfizH4u0h5O05YIQruNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R+D3x2hA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R+D3x2hA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 699C21F000E9;
	Sun, 16 Aug 2026 10:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786876580;
	bh=th3VLXC96fllnmNsbk/qT4AtK0lO3LZDEy8bqgnUJVI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=R+D3x2hALBbzcir4seW16sswSevlEyUDkiHDj5dVsNcRiwPom08irwHe7+MeFak2F
	 tjkmqr63iiVeoUvf7lqR5HOUJOZMDA8UnHCe0JfVK4OyKj7l2kr2eLrUyZXfjZ7Gek
	 jg066EwweIjY8Q6bInjDLnZlxfpuVaSKavc0AI6zdb3Wh+QpQZfW5022IQOIioYO04
	 AMSOtVYJ1EK5SQh0St0DJhe3mjEMZec1CGbXzUCNaREvur33m11egj3q1bNVMxYYk7
	 RtaJOO1ZwhXj5yT5Z4tLICE7c+bjkJN8X72NAI5Qj1jPOCAH+6ho68kHSTNayVijvj
	 9AD+cQgspppPg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 4/6] spmi: apple: Implement remaining commands
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sasha Finkelstein" <k@chaosmail.tech>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260816-t603x-spmi-v6-4-c5ab87aa447b@chaosmail.tech>
References: <20260816-t603x-spmi-v6-0-c5ab87aa447b@chaosmail.tech>
 <20260816-t603x-spmi-v6-4-c5ab87aa447b@chaosmail.tech>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 16 Aug 2026 10:36:19 +0000
Message-Id: <20260816103620.699C21F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Usage of `memcpy()` with `readl()`/`writel()` for FIFO data transf=
er introduces an endianness bug on big-endian architectures.
--

--- Patch [4]: [PATCH v6 4/6] spmi: apple: Implement remaining commands ---
commit 44a0f7f784234d8f3fc75ad0bec2d3f544e9850c
Author: Alba Mendez <me@alba.sh>

spmi: apple: Implement remaining commands

This commit adds support for zero write and power management commands to
the Apple SPMI controller driver. It also consolidates the read and write
paths into a single spmi_raw_cmd() function.

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
> +		i +=3D j;
> +	}
> +

[Severity: High]
Does the use of memcpy() with writel() corrupt the outgoing payload byte
order on big-endian CPUs?

The previous code used bitwise shifts which are endian-agnostic. By switchi=
ng
to memcpy(), the bytes from buf_wr are written sequentially into the host
memory layout of spmi_cmd.

On big-endian systems, the first byte of buf_wr will be placed in the most
significant byte of spmi_cmd. When writel() applies its endian conversion
via cpu_to_le32(), does this result in the device receiving the bytes in
reverse order?

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
> +		i +=3D j;
>  	}

[Severity: High]
Similarly, does the use of memcpy() with a u32 value returned from readl()
corrupt the incoming payload byte order on big-endian CPUs?

readl() applies le32_to_cpu() to the value read from the register. On big-e=
ndian
systems, the least significant byte of the original little-endian register =
will
end up at the highest memory address of the local rsp variable.

Does memcpy() then copy these bytes into buf_rd in the reverse of their int=
ended
order?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260816-t603x-spmi=
-v6-0-c5ab87aa447b@chaosmail.tech?part=3D4
