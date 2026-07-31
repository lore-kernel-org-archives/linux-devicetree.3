Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD7D14503F3
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 16:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785516027; cv=none; b=m907lmdKd6xm4f0pAS9ljIPHPt2Ln/3Ax6zT5TaEnPkbHxYzh+CPXwfLksZMv+rYC5JczHYwj9mg2VwvyLpTMTa2JVeY9hEtnPl2rNshOctoRG+M4Eyl71CEzgePMe7Np+8fgoDc9ASlaoB4xJxSyXbHjUzbcFo5vWIdNpH5SIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785516027; c=relaxed/simple;
	bh=YZ34yMNZCvEiMBqaOqvansc7ml7jJ2ZCL6lCwrJO3VM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=t2ZNy+J8OawiPl47ufJTKJX+Gh8y8ABbwAv/tXOEB0pby5RAn4liC6OoD3Y4OCyLdPctBgGJPIdrnzXRhuELyrOzpSbOdDIT/59kd387/FOMrXrqq8ButZGI+Wk/RAbL1ntGs3I6ip096Ews7N2lQvrP3frCwo+UR20VjtVghjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M/CORSaG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M/CORSaG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06BA81F00ACA;
	Fri, 31 Jul 2026 16:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785516025;
	bh=mfJSmNg4cx5T1Ackm9F2twrNfdlaqavT17kEgtqpQUo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=M/CORSaG0lRKSdn5YPGDWNfEOoPaWyGgdPbC6mt/cmZh7j+VeebwkyroV4ensHBH7
	 aAES+1ppkAHpZ68gfCZ5I0HkBPK027DQnPa/qAVOEd0v6OvdYeTGtR3VybSTQzPCzs
	 9jUk1b77YWsOLZTi/E4bTahWspp3pXZqTsI+IP+L4QglnQIPh/pyzVdSmSyJvdq7Up
	 XGrGZU8x5EgixloLei7Jm8At4oGaA2U02OYmYID4Cx2uWIRVkhem43qfKHC4UAqFKJ
	 07+RcvK8Wmjs33u3d9VHuFJheLJWCOPr8bMWMAv8xMzt1ZQKN0zvtpeDKFsg69wkna
	 0RZmRGOC/so9w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/4] mm/secretmem: zeroize secret pages before kdump
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?SmFuIFNlYmFzdGlhbiBHw7Z0dGU=?= <linux@jaseg.de>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260731162739.158320-4-linux@jaseg.de>
References: <20260731162739.158320-1-linux@jaseg.de>
 <20260731162739.158320-4-linux@jaseg.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 31 Jul 2026 16:40:24 +0000
Message-Id: <20260731164025.06BA81F00ACA@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Critical] Deadlock risk during kdump due to taking a spinlock in a panic=
 notifier.
- [Low] Missing unlock of the `s_inode_list_lock` after successfully acquir=
ing it.
--

--- Patch [3]: [PATCH 3/4] mm/secretmem: zeroize secret pages before kdump =
---
commit e5fefbd7f9b60fca2237ceaf3f2f3cb2aa75df03
Author: Jan Sebastian G=C3=B6tte <linux@jaseg.de>

mm/secretmem: zeroize secret pages before kdump
   =20
Register a CRASH_ZEROIZE notifier that wipes secretmem folios. As a
result, when CONFIG_CRASH_ZEROIZE is set, secretmem areas will be
cleared before the kdump kernel is kexec'ed.

> diff --git a/mm/secretmem.c b/mm/secretmem.c
> index 5f57ac4720d32..07f3905f47cbd 100644
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
> +		XA_STATE(xas, &inode->i_mapping->i_pages, 0);
> +		struct folio *folio;
> +
> +		/* no need for locks if we're burning down the house :) */
> +		xas_for_each(&xas, folio, ULONG_MAX) {
> +			if (xas_retry(&xas, folio) || xa_is_value(folio))
> +				continue;
> +			inode->i_mapping->a_ops->free_folio(folio);

[Severity: Critical]
Can this free_folio callback deadlock the panicking CPU?

The free_folio operation maps to secretmem_free_folio(), which invokes
set_direct_map_default_noflush(). On x86, this eventually calls
__change_page_attr_set_clr(), which unconditionally acquires cpa_lock
(when debug_pagealloc is not enabled):

arch/x86/mm/pat/set_memory.c:__change_page_attr_set_clr() {
    ...
    if (!debug_pagealloc_enabled())
        spin_lock(&cpa_lock);
    ...
}

Because this crash notifier runs after other CPUs have been forcibly halted
(e.g., via NMIs), if any of the stopped CPUs were interrupted while holding
cpa_lock (such as during module load or vmalloc), won't the panicking CPU
spin forever here and prevent the crash dump kernel from booting?

> +		}
> +	}
> +	/* off to kexec()! */
> +	return NOTIFY_DONE;

[Severity: Low]
Should we unlock sb->s_inode_list_lock before returning?

While this is the panic path and the system is about to kexec into the crash
kernel, leaving a successfully acquired spin_trylock unbalanced can trigger
warnings in static analysis tools or confuse readers.

> +}

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260731162739.1583=
20-1-linux@jaseg.de?part=3D3
