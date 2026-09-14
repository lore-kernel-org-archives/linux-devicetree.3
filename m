Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6E571862
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 09:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789379551; cv=none; b=BpFfYFhV3Y2pUCcfAgfLg2XUNkSQa5HbuhxPWuovAAxpGB3BK+TUggzN5NDQhorJoyv1hpQOGqHsVmD5NPBKy9UzeSt+Tmhv5ZZv4F9bBys5BPAtJ1smqV5JzjYCvclcjG3DPUV8FzFhPzsupe9b/mIRxAbP+hU/CqNjRrO03f0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789379551; c=relaxed/simple;
	bh=gYSk7WRjwa3i2xFl6nX2ItD3hdUB+DDikrZdgrf2YO8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=YdIJTSnaoVD2++XGuVeKL0s135o99epevarLOV98/pqvY/f+fKHIkCb9RNtawt+3aATYDwn5AMTyaCMfmV/hINRi6LCXMvicJDM6gT1CYk0Tvw1PkfCrEPWGHeUuYJS4002KL9zvtZw6Rqdzf+z3TZwYlMwTAAQkwwgmDoTUTR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OCiF/MLz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OCiF/MLz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41F851F000FF;
	Mon, 14 Sep 2026 09:52:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789379549;
	bh=YvFlmVWzB+s0Ad224fRuFsl5cakqGrL65tXE5eH0SZ8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OCiF/MLzISk92D8zQ+TKhITQFxfcN6nA6+Fm9aUkU28Z8H0eCsKvLSPW7DhA0aCJS
	 eHzjK80o2w10L0oyXfFn7U7Kq53B6ayATLiFixO1ImLad2mT7861B/VqlMm6+yw3tP
	 QokSRQVOX0edqo6No9TAOT6Zi/COzHnHilY+THFqw4BJ0w/VTUk6YeRYmIe/nspmN3
	 HgX9h0JQlbxZkVL+q96paILXdSXzzx6PKOWOmdmf9CIrQ3eLjOv6LSmVUSc+8a3gFb
	 LNyfT6n+mVp2aGxRUJy3ygDwf/xjOt6XaJA/hmvTMqTdcTNvWqMVqo8+RphSmQMNj0
	 7J2wusmqfZvpg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC v2 04/10] cacheinfo: Expose the code to generate a
 cache-id from a device_node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yin Li" <yin.li@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260914-mpam-resctrl-dt-knp-support-v2-4-bf6645bb2f65@oss.qualcomm.com>
References: <20260914-mpam-resctrl-dt-knp-support-v2-0-bf6645bb2f65@oss.qualcomm.com>
 <20260914-mpam-resctrl-dt-knp-support-v2-4-bf6645bb2f65@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 14 Sep 2026 09:52:28 +0000
Message-Id: <20260914095229.41F851F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The newly exported `cache_of_calculate_id()` API is conditionally d=
eclared without providing a static inline fallback, forcing callers to use =
preprocessor `#ifdef` guards rather than `IS_ENABLED()`.
--

commit 8b22a5b7c500764e08eb7b259467554e27f1adfe
Author: James Morse <james.morse@arm.com>

cacheinfo: Expose the code to generate a cache-id from a device_node

This commit exposes the cache_of_calculate_id() function to allow early
parts of the MPAM driver to set up resctrl structures before cacheinfo
is ready. It extracts the calculation logic and adds a declaration
guarded by CONFIG_OF in the cacheinfo header.

> diff --git a/include/linux/cacheinfo.h b/include/linux/cacheinfo.h
> index fc879ac4cc4f2..c33bb3c8bd633 100644
> --- a/include/linux/cacheinfo.h
> +++ b/include/linux/cacheinfo.h
> @@ -113,6 +113,9 @@ int acpi_get_cache_info(unsigned int cpu,
>  #endif
> =20
>  const struct attribute_group *cache_get_priv_group(struct cacheinfo *thi=
s_leaf);
> +#ifdef CONFIG_OF
> +u32 cache_of_calculate_id(struct device_node *np);
> +#endif

[Severity: Low]
Does this conditionally exported API need a static inline fallback for when
CONFIG_OF is disabled?

Without a stub for the !CONFIG_OF case in include/linux/cacheinfo.h, any
future caller using if (IS_ENABLED(CONFIG_OF)) to guard a call to
cache_of_calculate_id() will fail to compile due to an implicit function
declaration error. Should a static inline fallback be added to avoid forcing
callers to use preprocessor #ifdef guards?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260914-mpam-resct=
rl-dt-knp-support-v2-0-bf6645bb2f65@oss.qualcomm.com?part=3D4
