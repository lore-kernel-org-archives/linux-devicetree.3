Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 015E847043D
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 07:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784705713; cv=none; b=sb5o7h2FH8q3Xh2vCfFcweJHKReTmJuMnvCfipL8/k/kRKuS5yMuXS/eRinGcxWWV7hen0FMXYO3gEH9Gm/NjnoDzmD2PO0zwIUK/jcesztYXtzCOhhXtk5EUOUP0NVr8TqLQvHXLDIxO1tawSuKjH/tHDhQsmEtUd49ikmmmQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784705713; c=relaxed/simple;
	bh=gZToBIqTWCZhF7Nl31vz34AdxDCdRgTT06zruUXDNdw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=iZ/ZdBSsKZbmm+WUS9dYgP/AbAUFavu982znKjRxG8MJcReIT/Oov+Ku0frTLQAAPIc1fToyinXA46ZJu+doUqYNiQvDG/ae8HCfnf/2TQyd1c2XROxzgKps8oWBVXq0ASlS6mju/YiSS6bAPE6Z6l8AR29uUzf+B7XoAC0ZQf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BorE0OPW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BorE0OPW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DE751F00A3A;
	Wed, 22 Jul 2026 07:35:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784705707;
	bh=c7dIQ3CmENrUa+IsCkOqZvRFISR4yAdHAKmmQuZDUT8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BorE0OPWl1zjqpeoR1iyibozD85ksCW6M6oO+yBjLEu6JmIaw/Pspf01CeedYT/7v
	 reJ2+QPfHZm29vMdCGUXskXPlpH76nTAugLKU3LSVTDF3DqX8ACXSSrUZou1WiPuaC
	 1ZHwwvdEf0siaLjxCztDsKfqNji3FvJkwS4YJFg6sJHeMgvYS6FaZfqn2neLbMzLRq
	 yzZ2vM+cllB9nwNHqrn1BnEDgwZhbLWjpJsU4w8HskviVOqdnsdZtWNxnf/uLro7C0
	 sRdDYAmLHQSUcYpHYf84qGJ91rI7xsUSpVoMrOLod7qvmkzZnCzpdNuGfNX3xy8PJf
	 x9fURd6HIFpXw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 7/7] of: unittest: cover /aliases updates from
 overlay apply/revert
Reply-To: sashiko-reviews@lists.linux.dev
To: "Abdurrahman Hussain" <abdurrahman@nexthop.ai>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260722-nh-of-alias-overlay-v4-7-fc96a40d2761@nexthop.ai>
References: <20260722-nh-of-alias-overlay-v4-0-fc96a40d2761@nexthop.ai>
 <20260722-nh-of-alias-overlay-v4-7-fc96a40d2761@nexthop.ai>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 22 Jul 2026 07:35:06 +0000
Message-Id: <20260722073507.2DE751F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] This problem wasn't introduced by this patch, but a guaranteed NUL=
L pointer dereference occurs in the error handling path of `of_overlay_fdt_=
apply()` when `idr_alloc()` fails.
--

--- Patch [7]: [PATCH v4 7/7] of: unittest: cover /aliases updates from ove=
rlay apply/revert ---
commit 546dfcaa5ee21a92732ec54a5aca463b27b6686c
Author: Abdurrahman Hussain <abdurrahman@nexthop.ai>

of: unittest: cover /aliases updates from overlay apply/revert

Add overlay_alias.dtso plus of_unittest_overlay_alias() to cover the
"aliases inside an overlay" flow end-to-end. The runner applies the
overlay with a non-NULL target_base via of_overlay_fdt_apply() directly.

> diff --git a/drivers/of/unittest.c b/drivers/of/unittest.c
> index e255f54f4d760..2f5e4056efae0 100644
> --- a/drivers/of/unittest.c
> +++ b/drivers/of/unittest.c
[ ... ]
> @@ -3475,6 +3475,77 @@ static struct notifier_block of_nb =3D {
>  	.notifier_call =3D of_notify,
>  };
> =20
> +/* created by cmd_wrap_S_dtbo in scripts/Makefile.dtbs */
> +extern uint8_t __dtbo_overlay_alias_begin[];
> +extern uint8_t __dtbo_overlay_alias_end[];
> +
> +static void __init of_unittest_overlay_alias(void)
> +{
[ ... ]
> +	EXPECT_BEGIN(KERN_INFO,
> +		     "OF: overlay: WARNING: memory leak will occur if overlay removed,=
 property: /aliases/testcase-alias99");
> +
> +	ret =3D of_overlay_fdt_apply(__dtbo_overlay_alias_begin, size,
> +				   &ovcs_id, base);

[Severity: High]
This is a pre-existing issue, but is there a guaranteed NULL pointer
dereference in the error handling path of of_overlay_fdt_apply() when
idr_alloc() fails?

If idr_alloc() fails (e.g., due to low memory), it returns a negative error
code (like -ENOMEM). This negative value is stored in ovcs->id, and the code
jumps to err_free_ovcs without initializing ovcs->ovcs_list:

drivers/of/overlay.c:of_overlay_fdt_apply() {
	...
	ovcs->id =3D idr_alloc(&ovcs_idr, ovcs, 1, 0, GFP_KERNEL);
	if (ovcs->id <=3D 0) {
		ret =3D ovcs->id;
		goto err_free_ovcs;
	}
	...
}

In free_overlay_changeset(), the check `if (ovcs->id)` evaluates to true
because negative numbers are non-zero. It then calls
list_del(&ovcs->ovcs_list) on a zero-initialized list, dereferencing
NULL->next:

drivers/of/overlay.c:free_overlay_changeset() {
	...
	if (ovcs->id) {
		idr_remove(&ovcs_idr, ovcs->id);
		list_del(&ovcs->ovcs_list);
		ovcs->id =3D 0;
	}
	...
}

Could this memory allocation failure under load cause a kernel panic during=
 an
overlay apply attempt?

> +
> +	EXPECT_END(KERN_INFO,
> +		   "OF: overlay: WARNING: memory leak will occur if overlay removed, p=
roperty: /aliases/testcase-alias99");

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260722-nh-of-alia=
s-overlay-v4-0-fc96a40d2761@nexthop.ai?part=3D7
