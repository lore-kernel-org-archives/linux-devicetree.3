Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C3993DEADB
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 09:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787218422; cv=none; b=ur+YOX7/k1X3GSPE8KDpoo8K9D+Zc6/Z8Xkcwm3exmpWrb+BHhhGhp4v8/urbRwZfmOmiPGZWEql0frHdKLyGs5PO5XmmuYeJE6ipYaEnuKu8nrwQuV/GWQQ5wFC/gbe4R7UxhlqLtvJ0CQfxJiXxDpjy0FckwLHY+cnCqqzbOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787218422; c=relaxed/simple;
	bh=2TvY78aW58bc7XKEls1mwmZcIy0os8x6VNatgIJCW/0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Dxs7nmQZ+u0x9X3z4RsbSi/SOjv3to/YN0yeYUH4HUIyMperVwhhADZEAUyBlT0M77IVBSFOgik2I27HgQVo9/4++VkmUzMXjIIZTqLkpv29iQnUECLkIjDTtVxdva9OdhsRQabP6jpronRpSo2alRFqgty5ycTDhZl7SaCJhSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ja4JV8nR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ja4JV8nR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08D201F000E9;
	Thu, 20 Aug 2026 09:33:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787218414;
	bh=6rbh+vxmgocaE4RM1vX2Y5aziDTX2+CHvtANim7Tg4w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ja4JV8nR6zSjy45W2LQhg85OoLV2vX2qylMYXYsYGW8hEsszHIePC/ekfOVkreIFl
	 nm/WEc/3y/gigamx70ksFNzhR6R7yUS468rdNbjYoB5W8La56dFvNSzB57aZSdWMTA
	 fOCzTgbmk4lepVkADVi/T+ZRydwSCwiC1U4rOrpieGorthcez9zH2ESYweCWwpqO8f
	 6E4LEC24rF8bZDyj8ycbQkvwIKdI6uK0qACG2wQfvgBS4rCIymnR+Es28fTC46YH2g
	 I6yKEAjt33PGiORYaFYLhos+WxGVagH7rjBAgLM8DVyozZUVdfvRafYxPkY8SsdAkJ
	 npbGuZgh/eNvQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/7] rust: crc_ccitt: add CRC-CCITT abstraction
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ayush Singh" <ayush@beagleboard.org>
Cc: ojeda@kernel.org, conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260820-gb-uart-transport-v1-3-282da14ab7b7@beagleboard.org>
References: <20260820-gb-uart-transport-v1-0-282da14ab7b7@beagleboard.org>
 <20260820-gb-uart-transport-v1-3-282da14ab7b7@beagleboard.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 20 Aug 2026 09:33:33 +0000
Message-Id: <20260820093334.08D201F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Missing import for `bindings` in `crc_ccitt.rs`, leading to a compi=
lation failure when `CONFIG_RUST_CRC_CCITT_ABSTRACTIONS=3Dy`.
--

--- Patch [3]: [PATCH 3/7] rust: crc_ccitt: add CRC-CCITT abstraction ---
commit 07276b496fabcc3fbd341c5cd0116734faf9ec26
Author: Ayush Singh <ayush@beagleboard.org>

rust: crc_ccitt: add CRC-CCITT abstraction

This commit adds a Rust abstraction for the CRC-CCITT library functions. The
module is gated behind the new CONFIG_RUST_CRC_CCITT_ABSTRACTIONS Kconfig
symbol so the C library is only built when required by a Rust user.

> diff --git a/rust/kernel/crc_ccitt.rs b/rust/kernel/crc_ccitt.rs
> new file mode 100644
> index 0000000000000..6042ada16967d
> --- /dev/null
> +++ b/rust/kernel/crc_ccitt.rs
[ ... ]
> +#[inline]
> +pub fn crc_ccitt(crc: u16, data: &[u8]) -> u16 {
> +    // SAFETY: `data.as_ptr()` is valid for reads of `data.len()` bytes =
for the
> +    // duration of the call, since it is derived from a live shared slic=
e.
> +    unsafe { bindings::crc_ccitt(crc, data.as_ptr(), data.len()) }

[Severity: Low]
Does this code fail to compile when CONFIG_RUST_CRC_CCITT_ABSTRACTIONS=3Dy?
It looks like the bindings module is not imported in this file, which
would cause a build failure when resolving bindings::crc_ccitt here.

> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260820-gb-uart-tr=
ansport-v1-0-282da14ab7b7@beagleboard.org?part=3D3
