Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED202175A88
	for <devicetree@vger.kernel.org>; Sat,  8 Aug 2026 11:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786189741; cv=none; b=IecnQt1XwjjIGqZ9Qf8Qt1N+6BbU1A3r4vm/WSH/9eRtJiwe+JiS6mFJicBOxwYLnBFAyy2I4Cix8TSy8K//Q+Tc2ta4KTafHI+q69Zj+PAXbQoBUjPok3PvV99EWzupMyN4NYhZ4Z3S8oNu2gwmTMyl4Xy87u+WOFj1MvhZyw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786189741; c=relaxed/simple;
	bh=l/uPloZ0oD1NJmFo6BqNakhey7KsEo+iQOdZsH8JAh0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=aUqBrcfIkrCksPpWARcpJzNFIISbZFc5JdhTLYC3P5ojojiUt9znFyKhxYeCDqbuIuGNoSrJWI9tuxf2AmwOvj4pZNgnyaKBRk+nx7/V1rRPC1kMC8uk8kHXoDiILR0DzhPB7r9GJhA4F/aw4YPGo2pALfxjitbQdVhRXe1//x0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZrDNUfJQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZrDNUfJQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 597171F000E9;
	Sat,  8 Aug 2026 11:48:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786189739;
	bh=gJ2a8AK/gJJDBTOmQtbQVhVc9qPq2nzR8fWUGMVfK1I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZrDNUfJQkfs1fuGGMtQRlCQwsFDBWNPykTZTemWDpxk8cOlXtEQk3vT5lJyd2c5QF
	 R1VFFlSiJQqefzRmZfKUxOWXS0oW/SkHa7V1mOvpSexM/ww5LwaOfqGUEctE1TivbA
	 zltKIItgn/ikke7bbZ32PASp998fDz46tj0frAF3YhkXkfNO31IFj+jqj5RzVa29eA
	 tb2kf+ENriTQb4YtpjF2lvoluty49+zDkKX0IKHrHolEDuSkFB0roicptk0YFGOAtD
	 Wtee2srW6MMqQaJJ4zZVUIfzGwvv/Ixjy0Jz0XwC7enGvgQHmeeW+3YGBfGACJHJhX
	 IPXHDacHFABog==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 3/6] spmi: apple: check transaction status
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sasha Finkelstein" <k@chaosmail.tech>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260808-t603x-spmi-v5-3-553c5ac2f137@chaosmail.tech>
References: <20260808-t603x-spmi-v5-0-553c5ac2f137@chaosmail.tech>
 <20260808-t603x-spmi-v5-3-553c5ac2f137@chaosmail.tech>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 08 Aug 2026 11:48:58 +0000
Message-Id: <20260808114859.597171F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Missing synchronization in SPMI read and write commands leads to d=
ata races and hardware state corruption.
- [High] Signed integer overflow undefined behavior (UB) during bitwise shi=
fts in command packing and data transfer.
--

--- Patch [3]: [PATCH v5 3/6] spmi: apple: check transaction status ---
commit 138d557e0b3d3f2a65351b5debb754e7d0b8485e
Author: Alba Mendez <me@alba.sh>

spmi: apple: check transaction status

Check for parity errors and missing command ACKs.

> diff --git a/drivers/spmi/spmi-apple-controller.c b/drivers/spmi/spmi-app=
le-controller.c
> index 15721cb41d5c8..b1c127cf5f441 100644
> --- a/drivers/spmi/spmi-apple-controller.c
> +++ b/drivers/spmi/spmi-apple-controller.c
[ ... ]
> @@ -66,7 +74,7 @@ static int spmi_read_cmd(struct spmi_controller *ctrl, =
u8 opc, u8 sid,
>  {
>  	struct apple_spmi *spmi =3D spmi_controller_get_drvdata(ctrl);
>  	u32 spmi_cmd =3D apple_spmi_pack_cmd(opc, sid, saddr, len);

[Severity: High]
This is a pre-existing issue, but this multi-step transaction begins here
without holding a lock to serialize with other SPMI commands.

If two kernel threads (e.g. a regulator driver and a thermal sensor driver)
initiate an SPMI transaction on the same controller simultaneously, can this
lead to interleaved register writes to the shared SPMI_CMD_REG and reads fr=
om
SPMI_RSP_REG?

This missing synchronization seems like it could corrupt SPMI transactions,
leading to incorrect PMIC accesses. This patch also exacerbates the issue by
adding unsynchronized non-atomic accesses to spmi->prev_fail.

[Severity: High]
This isn't a bug introduced by this patch, but does the bitwise shift inside
apple_spmi_pack_cmd() invoke undefined behavior due to signed integer overf=
low?

In apple_spmi_pack_cmd():
    return opc | sid << 8 | saddr << 16 | (len - 1) | (1 << 15);

Since saddr is implicitly promoted to a signed int, will shifting it by 16
when saddr >=3D 0x8000 overflow INT_MAX?

There appear to be similar signed integer overflows during data transfers.

In spmi_read_cmd():
    buf[len_read++] =3D ((0xff << (8 * i)) & rsp) >> (8 * i);

Does shifting the signed literal 0xff left by 24 (when i =3D=3D 3) overflow
INT_MAX?

In spmi_write_cmd():
    spmi_cmd |=3D buf[i++] << (j++ * 8);

Since buf[i] is promoted to a signed int, will shifting left by 24 (when
j =3D=3D 3 and the byte is >=3D 128) overflow INT_MAX?

Compilers can exploit this undefined behavior to aggressively optimize or d=
rop
code, which may result in corrupted SPMI commands or missing bytes in
transactions.

> -	u32 rsp;
> +	u32 reply, rsp;
>  	size_t len_read =3D 0;
>  	u8 i;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260808-t603x-spmi=
-v5-0-553c5ac2f137@chaosmail.tech?part=3D3
