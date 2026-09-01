Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDB1D40860A
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 01:45:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788227167; cv=none; b=eHXYWDd8OEPq/Gqbb8Xn2w05OoY9LT4w0b+6j9g1XAkBSaI+wyN/xCcAskT8ejYNM4UENMjlbbMQ93+wMyjc6JmOLajEp0PYs/GC4WD7lJaEYY8Ip021usyh+ptr+j2asAy02qSX0b4KKIcDnq7n/ZsZiUUaMznHmpOkHljVuf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788227167; c=relaxed/simple;
	bh=dcnWSLpnk+pC4HWRba/LQwoCl9VieDbmNrSq+pKB6FI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=q5rquA+u8b0zZOuOKo5DP6dXRmqUjR6u3p4y1kCtWATMCVk9/MUvqczUiS+8KTCndZHE8ywmKnTzwSw6si+GJhEnTmyGGInkN9eblDh9Adm6CbTFWBBhhkdiaAV38g+SxKB9mgun6XostaA9NeOOc7CaQnG32OzR9GMIVe9Pt8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nZNJeab4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nZNJeab4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83A8D1F000E9;
	Tue,  1 Sep 2026 01:45:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788227154;
	bh=BoflPduLlKWgGhluHf71RnRV+e0luqUPZJVkrVf1TXA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nZNJeab4cD8TvyAXIEvsmtuSGWKcFBI+NC0olvP4RJf1jEoxdeUtJM42d1ALKs3r0
	 fsCa7vmQHEYvYSpN662lPFScmLlaIoLrM1nBeARM8OCJ2lTwUAMyoNSl8yzKck+G8i
	 WfDsv/zZczNF8WdRmkeQzNnKtAc4Np+/S/ctWv58/63hsVSgcAD2W7+UuRMIYAJQti
	 UJ2iQqPp9GUZciutal/4XcU4p7MBDS+mWOH2T3U6p0G0QJvGVorc7dX6zoq25zc0l1
	 tl7ZTSsOg7doCEDcQ7a7GPx7If85j4aIp1H2VRKwSvMTmihmNdKzUIEoSZRjKT7tMN
	 4nzWLRgri6NmA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 05/10] of/overlay: only treat a positive changeset id
 as registered
Reply-To: sashiko-reviews@lists.linux.dev
To: "Abdurrahman Hussain" <abdurrahman@nexthop.ai>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260831-nh-of-alias-overlay-v7-5-02754604805a@nexthop.ai>
References: <20260831-nh-of-alias-overlay-v7-0-02754604805a@nexthop.ai>
 <20260831-nh-of-alias-overlay-v7-5-02754604805a@nexthop.ai>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 01 Sep 2026 01:45:54 +0000
Message-Id: <20260901014554.83A8D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] In `of_overlay_remove_all()`, passing `&ovcs->id` to `of_overlay_r=
emove()` causes a deterministic use-after-free and leaves freed memory in t=
he global `ovcs_list` and `ovcs_idr`.
- [High] Lockless iteration of `ovcs_list` in `of_overlay_remove_all()` all=
ows concurrent modifications, leading to a Use-After-Free.
--

commit 5e44e19c9c02429165243b3c23378b30ba40fdd3
Author: Abdurrahman Hussain <abdurrahman@nexthop.ai>

of/overlay: only treat a positive changeset id as registered

of_overlay_fdt_apply() stores the idr_alloc() return value in
ovcs->id before checking it. On failure the stored id is negative,
free_overlay_changeset()'s "if (ovcs->id)" check passes, idr_remove()
is called with a negative id and list_del() runs on ovcs->ovcs_list,
which is not initialized until after the id allocation. An allocation
failure at that point dereferences NULL.

> diff --git a/drivers/of/overlay.c b/drivers/of/overlay.c
> index 08d5351746be6..9b9f198a1d70a 100644
> --- a/drivers/of/overlay.c
> +++ b/drivers/of/overlay.c
[ ... ]
> @@ -860,7 +860,8 @@ static void free_overlay_changeset(struct overlay_cha=
ngeset *ovcs)
>  	if (ovcs->cset.entries.next)
>  		of_changeset_destroy(&ovcs->cset);
> =20
> -	if (ovcs->id) {
> +	/* a failed idr_alloc() leaves its negative error in ovcs->id */
> +	if (ovcs->id > 0) {

[Severity: High]
This isn't a bug introduced by this patch, but does this check cause a=20
use-after-free and list corruption when called from of_overlay_remove_all()?

In of_overlay_remove_all(), we iterate over the ovcs_list and pass the=20
address of the internal id field:

drivers/of/overlay.c:of_overlay_remove_all() {
    list_for_each_entry_safe_reverse(ovcs, ovcs_n, &ovcs_list, ovcs_list) {
        ret =3D of_overlay_remove(&ovcs->id);
...
}

Inside of_overlay_remove(), it zeros out this ID directly through the point=
er=20
before freeing the changeset:

drivers/of/overlay.c:of_overlay_remove() {
...
    *ovcs_id =3D 0;
...
    free_overlay_changeset(ovcs);
...
}

When free_overlay_changeset() executes, ovcs->id is already 0, so the=20
if (ovcs->id > 0) condition will evaluate to false. This skips both=20
idr_remove() and list_del(&ovcs->ovcs_list) before the memory is freed,=20
leaving stale pointers in the active global list and IDR.


[Severity: High]
This is also a pre-existing issue, but could the lockless iteration in=20
of_overlay_remove_all() lead to a use-after-free?

The iteration of ovcs_list in of_overlay_remove_all() allows concurrent=20
modifications:

drivers/of/overlay.c:of_overlay_remove_all() {
    list_for_each_entry_safe_reverse(ovcs, ovcs_n, &ovcs_list, ovcs_list) {
...
}

This iterates the globally shared ovcs_list without holding of_mutex. If=20
another thread concurrently calls of_overlay_remove() on a different overla=
y,=20
it will acquire of_mutex and remove or free that overlay.

If the freed overlay was concurrently cached as ovcs_n (the 'next' element =
in=20
the safe iteration), the loop in of_overlay_remove_all() will dereference=20
the freed memory when advancing to the next iteration.

>  		idr_remove(&ovcs_idr, ovcs->id);
>  		list_del(&ovcs->ovcs_list);
>  		ovcs->id =3D 0;
>  	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260831-nh-of-alia=
s-overlay-v7-0-02754604805a@nexthop.ai?part=3D5
