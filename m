Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794916572;
	b=WE5yN4SR3VJe+D2CW1Z2Ci7VcajbdB6pY9P8nJ8uKP0b3zkjArQ35Hirz6jQyzKULoCO
	 K7jChG30pT7HuPhIaV3+e9QlWipuokNb6n/ld6zP3sYNuCXFgq1oTT5z4oOYp/kacrHaz
	 gPZugIbEScKbJ6XH1CBJQPiwDh9nOTVKkg69BYRjRpxgNYClsB8X9VnU9tYRjScNCBVU+
	 eU9Hspjk0kQQw+xllP0NUUZQcOXPFguZDzEE0sDAJH0fLmEYuLfxKnAqO0EoZO5Le+pAp
	 PJrc6veo4H6Bffc25X6H6/wQEdIEG4iB/cfOFZRy0IBhjrl9J8Qj0BpkLxwlOLvDFGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794916572;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=af42I4RXVuvy5hP/yWtAKoVHqG7XN75hAmt6wFExsqk=;
	b=zNoeu+fyZrmxEC0YvrixhNYi9xULb09B2P912AEu6pykbpBEgwLUxs3Nqa+gE+DjmHdg
	 rQRe/46H2y4LDWIqOlQexMLMgg/iZI8tHRXfX8HEjtYRJP/q8Bke/gkxD0Z645F4/Kjxo
	 2O7+szSD3av/4MsjSVY77RrKR9BoCgNglM9aiTAp6ALkbaS2VxGYrB3sHvZhp6ksmWTQx
	 LlRllu/OdSYHZnn/gUOY+gfdZlP0hAAQGBhDrWeFFOgi+qC4ngyG5CBEyV1XXiQYFvPUF
	 AZ74OODNM++sKafVWdAkhGFpBOjMn+DnwkxV4N1qNTsfdKvocnna8J7cCRli9IfLI1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ouCCopzJ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E695B606A886
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 11:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ouCCopzJ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76B401F000C5;
	Tue, 17 Nov 2026 11:56:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794916571;
	bh=af42I4RXVuvy5hP/yWtAKoVHqG7XN75hAmt6wFExsqk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ouCCopzJc2kxUN/8skTNZyn5DyZgnd2r2HZSj19SBs6WXaj+C/MLpZJm9ttDqSBOQ
	 naqbb5AWedhf5nCxH7DWO6mnF8on1QGOEHRn+JrWMVHB90aGv81Mu6WT9JXIfcv9vR
	 pkV7+M8SPhLFAzaPLD7uAHC7WBjafaT0z0kEuwXKFMph5nNcVH/Wc3eIVimJ5Jy11P
	 y3ZS1KyovkLl5ps4EB8hFs+1eVxUKCpXo7hl1IwKnCUbVpl1RhbYfiGK37w+KmVTc0
	 bVaL2JpQqwenwk70LvdW/TC37Ory6f744kXrnkbhRxaUR7hdnhZGgQ2L1zumH2ghd8
	 YiuJWWwu/BkkQ==
Message-ID: <sashiko-outbox-218743@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RESEND v5 3/4] nvmem: mtk-efuse: add CPU speedbin
 post-processing
Reply-To: sashiko-reviews@lists.linux.dev
To: "Roman Vivchar" <rva333@protonmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261117-6572-nvmem-v5-3-9b561a8a83e1@protonmail.com>
References: <20261117-6572-nvmem-v5-0-9b561a8a83e1@protonmail.com>
 <20261117-6572-nvmem-v5-3-9b561a8a83e1@protonmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2026 11:56:11 +0000
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
- [Medium] nvmem: mtk-efuse: prefix false match in
  mtk_efuse_fixup_dt_cell_info()
--

commit c5f5a828d690918eacfadf756d8f32a95a9237dd
Author: Roman Vivchar <rva333@protonmail.com>

nvmem: mtk-efuse: add CPU speedbin post-processing

This commit adds a post-processing callback for "cpu-speedbin" nvmem cells =
to
convert numeric CPU speedbin values into bitmasks for opp-supported-hw.

> diff --git a/drivers/nvmem/mtk-efuse.c b/drivers/nvmem/mtk-efuse.c
> index 980c29d013375..d2e5c69c580e3 100644
> --- a/drivers/nvmem/mtk-efuse.c
> +++ b/drivers/nvmem/mtk-efuse.c
> @@ -70,6 +70,18 @@ static int mtk_efuse_gpu_speedbin_pp(void *context, co=
nst char *id, int index,
>  	return 0;
>  }
> =20
> +static int mtk_efuse_cpu_speedbin_pp(void *context, const char *id, int =
index,
> +				     unsigned int offset, void *data, size_t bytes)
> +{
> +	u8 *val =3D data;
> +
> +	if (val[0] >=3D 8)
> +		return -EINVAL;
> +
> +	val[0] =3D BIT(val[0]);
> +	return 0;
> +}
> +
>  static void mtk_efuse_fixup_dt_cell_info(struct nvmem_device *nvmem,
>  					 struct nvmem_cell_info *cell)
>  {
> @@ -83,6 +95,13 @@ static void mtk_efuse_fixup_dt_cell_info(struct nvmem_=
device *nvmem,
>  	if (cell->nbits <=3D 3 &&
>  	    strncmp(cell->name, "gpu-speedbin", min(sz, strlen("gpu-speedbin"))=
) =3D=3D 0)
>  		cell->read_post_process =3D mtk_efuse_gpu_speedbin_pp;
> +
> +	/*
> +	 * On mobile SoCs, the CPU speedbin is a number. Convert it to
> +	 * a bitmask for supported-hw usage.
> +	 */
> +	if (strncmp(cell->name, "cpu-speedbin", min(sz, strlen("cpu-speedbin"))=
) =3D=3D 0)
> +		cell->read_post_process =3D mtk_efuse_cpu_speedbin_pp;
>  }

[Severity: Medium]
Can this strncmp() check match unrelated cells whose name is a shorter
prefix of "cpu-speedbin"?

Because sz is strlen(cell->name), min(sz, strlen("cpu-speedbin")) evaluates
to sz whenever cell->name is shorter than "cpu-speedbin", and unlike the
"gpu-speedbin" check above, cell->nbits is not checked.  Any shorter prefix
such as "cpu" will get mtk_efuse_cpu_speedbin_pp() attached, causing reads
of that cell to fail with -EINVAL or have their first byte overwritten with
BIT(val[0]).  Using strcmp(cell->name, "cpu-speedbin") =3D=3D 0 or
strncmp(cell->name, "cpu-speedbin", strlen("cpu-speedbin")) =3D=3D 0 would =
avoid
matching shorter prefixes.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261117-6572-nvmem=
-v5-0-9b561a8a83e1@protonmail.com?part=3D3
