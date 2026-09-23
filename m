Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CB6C51C327
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 20:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790195060; cv=none; b=hOOFI/dI4Y41a/dTcHW9y8RVG9uTuc5anB/xfhBM7tNV0anYV78hrYliu4tOt8/0M9phLkX/4EzSzWaA9G1lZbNjydKbZsyO6CETgouAoZBW0V8MxCnK5XV+2Rfqj7tcpQz8DUvsMWTB2FfNu2gFZPxfHT4K+IVmsKSlLqKIfXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790195060; c=relaxed/simple;
	bh=2SROqPyd9QQ+VPU/gOrHVIpSVesBu5BbgwK6pmvqt/g=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=seWmpH+0x7b2n9spArOUZbt1gP5lL/MQZDQhyRzLmA5RFMytdyYZj7qAZpo9FPNUyjaUuQ04P9gMto2Xz1FSuGU7guCf9Mf5JibvBe0DpuwUNpF4ywLBKdMLjI+r4JPvLTa9czXPBWz74+6FuywLe0aNEDUzPEXtSpeh0WtrXCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ohn97AMv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ohn97AMv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5A851F00893;
	Wed, 23 Sep 2026 20:24:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790195056;
	bh=6mcVRLCQ3ft3GR8ZHTESrJhRXejsrx4RrxQ9hZpP+qs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ohn97AMvH0NnvpGtVasI2fM4NaXpFnDEksLIS8Kh8rySJNk+HpC4FNDa9BHxKadzm
	 H+L8b9rGpPjbRaPgJ+zhyWhynHdTwzwxsuRzpYLi2lan/d4vptVbulJy56Qx9uxRU8
	 gbbfaBvAfLjtHcK5e0YZqZZYtLd06u7DIFsZofrC31kzlYwxCCxGoeHiU9B4FA5bLE
	 k6VETCN6i70BbRygG2mHnlBeNc9c+2Q8WvIES69ZbRGKer82fq5kZdQh74Y5egN2vO
	 lGhtbxmtLzUAOvTjW1clE3saNeYjMQy3ypuKzht7JYm506xmbld5Vh9F/4r9J1Mf+s
	 YwQDT7gdajTew==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 7/7] video: logo: add ppmtodtlogo host tool
Reply-To: sashiko-reviews@lists.linux.dev
To: "Max Pedraza" <maximpedraza@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260923201035.51007-8-maximpedraza@gmail.com>
References: <20260923201035.51007-1-maximpedraza@gmail.com>
 <20260923201035.51007-8-maximpedraza@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 23 Sep 2026 20:24:14 +0000
Message-Id: <20260923202415.B5A851F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] ppmtodtlogo: silent output corruption due to unchecked file writes
--

commit 4ad00a19ffae8a59e9289c4ee762366d9f29a5de
Author: Max Pedraza <maximpedraza@gmail.com>

video: logo: add ppmtodtlogo host tool

This commit adds a host tool that converts a PPM image into a devicetree bo=
ot
logo node or a binary blob for a reserved memory region.

> diff --git a/drivers/video/logo/ppmtodtlogo.c b/drivers/video/logo/ppmtod=
tlogo.c
> new file mode 100644
> index 0000000000000..7fded9ce9ba37
> --- /dev/null
> +++ b/drivers/video/logo/ppmtodtlogo.c
[ ... ]
> +static void write_bin(void)
> +{
> +	put_le32(BLOB_MAGIC);
> +	put_le32(logo_width);
> +	put_le32(logo_height);
> +	put_le32(logo_clutsize);
> +	fwrite(logo_clut, 3, logo_clutsize, out);
> +	fwrite(logo_data, 1, logo_width * logo_height, out);

[Severity: Low]
Are we missing error checks on these writes? If the tool runs under a
disk-full condition or encounters another write error, it looks like it
will silently produce truncated binary blobs without reporting an error or
returning a non-zero exit status.

> +}
[ ... ]
> +int main(int argc, char *argv[])
> +{
[ ... ]
> +	if (outputname)
> +		fclose(out);

[Severity: Low]
Could failing to check the return value here ignore buffered write failures?
If a flush fails at the end of the program, it might obscure disk space
issues and leave a corrupted output file while still exiting with a zero
status code.

> +
> +	fprintf(stderr, "%s: %ux%u pixels, %u colours\n", filename, logo_width,
> +		logo_height, logo_clutsize);
> +
> +	return 0;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260923201035.5100=
7-1-maximpedraza@gmail.com?part=3D7
