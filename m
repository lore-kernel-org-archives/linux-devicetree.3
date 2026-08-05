Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CC5F238C36
	for <devicetree@vger.kernel.org>; Wed,  5 Aug 2026 04:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785903971; cv=none; b=ASVOyYUeQ2NStxuXSrfCAGAVMjmCXAQmBaZACxwve9Q1mXH61kWp64f3ZEzw4AHUMhwNgr2Yclfhe1iedAH4vjHlEW16LYIwkE9++b0+3+i1Lnmy31RSq+hZRiLc/tzbT63sPCk1n2sPPc/8O0FjBZNmfkkkuqMoALvaActPd6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785903971; c=relaxed/simple;
	bh=k1eRrppkPbk78wS1A+LF7kMPO48CyQBBrOi7TUXaJR4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=jm/2p74JQtiSfLQ7DL3hy45qEYnT/aSY5THZ0oV0VTf+kFqmr364nKTGMjUUMQLDQpLRtVY0pNS4uY0XbLfDtDdRVXMLDduO1UlQLrpgjn1eHZoSIXuAPXjuKipWVqb+0QbdVwtg1+tqjPIqsyvg0zZlm6cmkvRImmGAQI/RXJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jJX8GALN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jJX8GALN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A42F31F000E9;
	Wed,  5 Aug 2026 04:26:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785903969;
	bh=QCERTeOvmjrQHWUuiHIbRXIrIrjC+sRdWOCc7wFCnz8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jJX8GALN3xMcD/tDMnGAQV0GqIPLUYDfzEG+oj3vr70LZTDKvvcdXVJhBdiQmvKRX
	 Ve3GhaiHCtsGecPnUgqko4ci7lLnEPJnTAkDrQeH5vXYi6mrQ6Hdz746b9XAe2Yk/h
	 q9mXgq6HT7Sft8lQs6UueVcTebTojJMwl6gI5OeO7Emse4z23fTfymFEGE5qrhdK43
	 pChbj/SkRBKO5p9G7AP+xu8i2xFx9bkcdMJBFllyj5VzLfUHFJygwGspxT+sb0WNm9
	 r9T70AAcphqcQnbY8vm5XNIHV4jkwIOwQuAZUD5EGXN27b7D0bvHuEO+oOBbTZBHhJ
	 0A1gh1Ylkw10Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/4] mm/secretmem: zeroize secret pages before kdump
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?SmFuIFNlYmFzdGlhbiBHw7Z0dGU=?= <linux@jaseg.de>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260731154608.153258-4-linux@jaseg.de>
References: <20260731154608.153258-1-linux@jaseg.de>
 <20260731154608.153258-4-linux@jaseg.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 05 Aug 2026 04:26:09 +0000
Message-Id: <20260805042609.A42F31F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Deadlock in panic path due to `free_folio` attempting to acquire b=
locking locks.
- [High] Zeroization loop silently fails because it iterates over an empty =
`sb->s_inodes` list.
- [Low] Missing `spin_unlock` for `s_inode_list_lock` on the success path.
--

--- Patch [3]: [PATCH 3/4] mm/secretmem: zeroize secret pages before kdump =
---
commit 2960931b04ec8dddbd17c954634f6a26336377a1
Author: Jan Sebastian G=C3=B6tte <linux@jaseg.de>

mm/secretmem: zeroize secret pages before kdump

This commit adds a crash notifier to zeroize secretmem folios before a kdump
kernel is kexec'ed. It iterates over the page cache without taking the i_pa=
ges
lock, as zeroization runs after other CPUs have been stopped.

> diff --git a/mm/secretmem.c b/mm/secretmem.c
> --- a/mm/secretmem.c
> +++ b/mm/secretmem.c

[ ... ]

> @@ -187,6 +189,50 @@ static const struct inode_operations secretmem_iops =
=3D {
> =20
>  static struct vfsmount *secretmem_mnt;
> =20
> +#ifdef CONFIG_CRASH_ZEROIZE
> +/* Called far into vpanic from crash_core.c with other CPUs stopped and
> + * preemption disabled
> + */
> +static int secretmem_crash_zeroize(struct notifier_block *nb, unsigned l=
ong
> +		action, void *data)
> +{
> +	struct super_block *sb;
> +	struct inode *inode;
> +
> +	if (!secretmem_mnt)
> +		return NOTIFY_DONE;
> +	sb =3D secretmem_mnt->mnt_sb;
> +
> +	/* If the list was modified in the exact moment we panic'ed, it might be
> +	 * in an inconsistent state that would be unsafe to iterate. If we can't
> +	 * get the lock, too bad, that's all we can do here.
> +	 */
> +	if (!spin_trylock(&sb->s_inode_list_lock)) {
> +		pr_crit("crash_zeroize: can't acquire secretmem superblock lock.\n"
> +			 "crash_zeroize: skipping zeroizing secretmem.\n");
> +		return NOTIFY_DONE;
> +	}
> +
> +	list_for_each_entry(inode, &sb->s_inodes, i_sb_list) {

[Severity: High]
Does this loop actually iterate over any secretmem files?

In secretmem_file_create(), the inode is allocated via
anon_inode_make_secure_inode(). That function uses new_inode_pseudo(), which
intentionally skips adding the inode to the superblock's s_inodes list.

Because of this, won't sb->s_inodes be empty (or contain only the root inod=
e),
causing the zeroization process to silently skip all secretmem folios?

> +		XA_STATE(xas, &inode->i_mapping->i_pages, 0);
> +		struct folio *folio;
> +
> +		/* no need for locks if we're burning down the house :) */
> +		xas_for_each(&xas, folio, ULONG_MAX) {
> +			if (xas_retry(&xas, folio) || xa_is_value(folio))
> +				continue;
> +			inode->i_mapping->a_ops->free_folio(folio);

[Severity: High]
Can calling free_folio() here cause a deadlock during a kernel panic?

The free_folio callback points to secretmem_free_folio(), which eventually
calls set_direct_map_default_noflush() on the folio's head page.

On architectures like x86, set_direct_map_default_noflush() resolves to
__set_pages_p(), which acquires cpa_lock (via spin_lock(&cpa_lock)). If a
secondary CPU was stopped by an NMI while holding cpa_lock, won't this cause
the panicking CPU to spin indefinitely, preventing the crash kernel from
loading?

> +		}
> +	}
> +	/* off to kexec()! */
> +	return NOTIFY_DONE;

[Severity: Low]
Is there a missing spin_unlock(&sb->s_inode_list_lock) before returning on
this success path?

Even though the system is in a terminal state, leaving the lock acquired via
spin_trylock() permanently held could unbalance preemption or confuse lock
debugging if it runs after this point.

> +}
> +
> +static struct notifier_block secretmem_zeroize_nb =3D {
> +	.notifier_call =3D secretmem_crash_zeroize
> +};
> +#endif /* CONFIG_CRASH_ZEROIZE */

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260731154608.1532=
58-1-linux@jaseg.de?part=3D3
