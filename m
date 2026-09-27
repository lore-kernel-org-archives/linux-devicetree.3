Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82DCE3DF000
	for <devicetree@vger.kernel.org>; Sun, 27 Sep 2026 12:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790510418; cv=none; b=l7qLOh+wMAgoiTsRFDjWx6Cw5g7nW7gXzRL/CsnysYA2rk4BJvRMC6o6Gggygjv5HPQVWzYR12kCOk6pzEY5TlqzJBjQ3w6Rh76EAW9SwWtwkKbGATg4Qnj2yVXIk7qo7K3Dgeft/meeCS32BU7FSx8FLoSu219NXjhEodQsk3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790510418; c=relaxed/simple;
	bh=nKCiZx4XjwrsrPumB4OwMD6zU6lXRfx66u1FDpNRT50=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=BLn4720SgvEopnH3TIjORlXSYffCHiqphaJWRkZkPy8d2n1bQ6x+zY19WHSZVynPe01RNVy7t8Mv1bwS2+MXN9mGUcrvE/zqAOHGDNtqz9GBhQk797FYbRVI8Jf/vbYWDQqKqJko+wMh2v4RH1510lCWEIetSH1D45rKiBS6JBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KXt/JQdL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KXt/JQdL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B841D1F00893;
	Sun, 27 Sep 2026 12:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790510417;
	bh=1Fd4ZEdy9643AGPDg9wai+bP2FxM28u4S4f6FhDZoNw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KXt/JQdLiWmiOpFf7QdjBOKvE2DPiYSkgvN+2z9IuQhmmz6A7LnrVC16PLMqifDFw
	 fGS6eQhfQsRiaue4MAihQleshYXsMpNWx3F1q+r4dPxZmj7+9sBqqNCvNi1YbCt+n2
	 OW/H/8KTKaDbKIlUDy2i4EVgdJ0CcY8t+wpwrkINUpge9eQ4hCtyTJlxXx2cDnsqeV
	 WzwprPpgS9PkFL7h8vYvVn9TPCbm8lOz/v3tG45/mXsF7Grm+b8dAUP9aT//F54oLc
	 iokSXgP6GWHTAkU92ApbfbAXhGWVeRQfTMBUPwK3fyMJF+Smn+IPvON9+GI7/ecWOx
	 bN71C5W2c7EGA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/3] virt: bao: add IPC shared-memory driver
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?Sm/Do28gUGVpeG90bw==?= <jpeixoto@osyx.tech>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <d5b8553918e16173aaf4767e32daeb47b656a253.1790357735.git.jpeixoto@osyx.tech>
References: <cover.1790357735.git.jpeixoto@osyx.tech>
 <d5b8553918e16173aaf4767e32daeb47b656a253.1790357735.git.jpeixoto@osyx.tech>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 27 Sep 2026 12:00:16 +0000
Message-Id: <20260927120016.B841D1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] virt: bao: UAF on module initialization failure
--

commit 2f861bb98100794551d8aebc0473ce9f71733cac
Author: Jo=C3=A3o Peixoto <jpeixoto@osyx.tech>

virt: bao: add IPC shared-memory driver

This commit introduces a new IPC shared-memory driver for the Bao hyperviso=
r.
It allows guests to communicate through read and write regions configured v=
ia
the bao_ipcshmem.channels module parameter, exposing each channel as a misc
character device to userspace.

> diff --git a/drivers/virt/bao/ipcshmem/ipcshmem.c b/drivers/virt/bao/ipcs=
hmem/ipcshmem.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/virt/bao/ipcshmem/ipcshmem.c
> @@ -0,0 +1,358 @@
[ ... ]
> +static int __init bao_ipcshmem_init(void)
> +{
> +	char *buf, *p, *desc;
> +	int ret =3D 0;
> +
> +	if (!channels || !*channels)
> +		return 0;
> +
> +	buf =3D kstrdup(channels, GFP_KERNEL);
> +	if (!buf)
> +		return -ENOMEM;
> +
> +	p =3D buf;
> +	while ((desc =3D strsep(&p, ";")) !=3D NULL) {
> +		if (!*desc)
> +			continue;
> +		ret =3D bao_ipcshmem_parse_one(desc);
> +		if (ret) {
> +			pr_err("bad 'channels' descriptor\n");
> +			bao_ipcshmem_remove_all();

[Severity: High]
Can this error path lead to a use-after-free if userspace has already opene=
d a
character device?

When multiple channels are specified in the module parameter,
bao_ipcshmem_init() parses them in a loop. For each successfully parsed
channel, bao_ipcshmem_add() immediately exposes the device to userspace via
misc_register():

bao_ipcshmem_init()
  bao_ipcshmem_parse_one()
    bao_ipcshmem_add()
      misc_register(&bao->miscdev);

If a subsequent channel fails to parse, bao_ipcshmem_init() takes this error
path and calls bao_ipcshmem_remove_all(). This unregisters and frees all
previously registered channels.

If a user-space process (such as udev) opens the first exposed character
device before the initialization failure occurs, the file descriptor remains
active. However, the initialization failure causes the kernel to unload the
module and free its memory. Subsequent system calls on the active file
descriptor would attempt to access the unmapped file_operations structure a=
nd
the freed struct bao_ipcshmem data, crashing the system.

Would it be safer to defer calling misc_register() until all channels have
been successfully parsed and added to the list?

> +			break;
> +		}
> +	}
> +
> +	kfree(buf);
> +	return ret;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1790357735.gi=
t.jpeixoto@osyx.tech?part=3D1
