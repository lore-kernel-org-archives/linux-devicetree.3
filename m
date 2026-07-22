Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06B3736493E
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 01:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784682803; cv=none; b=hXEnRN6FAzzjGCSvwQLNZJUqITqVRb0JZQWoII2VnMG/errfLPm3hm5+0G9UHJkRCFU7AiVNkglhpN9f3e5Coc9TWtNAhlUPzZ20uOjxV9Taixh9eiuvB2E80XrI8gD6he2V3QLJIF6YNQo24vkp+dxnnKR0h2RTAZszpTvEn70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784682803; c=relaxed/simple;
	bh=Mg1nksLB9VZgYvDoxPBGbI8q81ls05cxTnDEpmksDb4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=bLpGFYxHkhaWVIBLYhnd1e1hHw7qLrR8rspubbrey9Or7sW7zs5rvXkegYPQKrfl5xlzI7YeguXPYo6KLzv7oWCtHVlZ1C1piod8Gy5OAG/RuikxhXlWCNzHmlSuDUjkw2tI2TEQW9qlIrc2TAjMOydNo99yEWOZFoB+LkdEXvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BEXrHfQM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BEXrHfQM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18CDA1F000E9;
	Wed, 22 Jul 2026 01:13:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784682799;
	bh=ycbEQwo7ncRPngjcDv2vt5Ntv+5bwl1iUvBTKYRWbas=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BEXrHfQMQ1B+P2s3AQKk7LPWtNScHY9FWz1ZALmn0ZjvUHupRcA5pqYVbFJi3bm4W
	 G7YrwhiOGIf+hyZh1aIiBJhB2AmO7Qp0eua5kJEzoEHn6y1n1WSxiRj3lrCAFtlFS9
	 nawKo3UZ+2oI9K1D4NL7B4RuQ6+lIjr1ZH4DUCJZ9KMONpnhwmKQeM/+LwKfOWmErL
	 hpiBgQ2Gt1Te/ut0LgBb5Q/Fb50uci7o4whJxg92esoAGlnI3+dTg74+7GYgt1NXcY
	 tEE90SA3oG2eBYdQ19cch9SyrQWinYDmdInG04xMa7wRAo1TECdhLXVE++POKTtyH6
	 HVJu9sS2w8Mlw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 4/6] of/overlay: return ERR_PTR from
 dup_and_fixup_symbol_prop()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Abdurrahman Hussain" <abdurrahman@nexthop.ai>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260721-nh-of-alias-overlay-v4-4-8ad097e31e36@nexthop.ai>
References: <20260721-nh-of-alias-overlay-v4-0-8ad097e31e36@nexthop.ai>
 <20260721-nh-of-alias-overlay-v4-4-8ad097e31e36@nexthop.ai>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 22 Jul 2026 01:13:18 +0000
Message-Id: <20260722011319.18CDA1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Double-free and use-after-free of `new_prop` on the `of_changeset_=
add_property()` error path.
--

--- Patch [4]: [PATCH v4 4/6] of/overlay: return ERR_PTR from dup_and_fixup=
_symbol_prop() ---
commit c4400996264f78e84238a0b8d2c87f7489c72180
Author: Abdurrahman Hussain <abdurrahman@nexthop.ai>

of/overlay: return ERR_PTR from dup_and_fixup_symbol_prop()

dup_and_fixup_symbol_prop() previously returned NULL for malformed input,
unresolved paths, and allocation failures, which the caller collapsed into
-ENOMEM. This patch changes the function to return an ERR_PTR instead.
The caller is updated to propagate the specific errno.

> diff --git a/drivers/of/overlay.c b/drivers/of/overlay.c
> index 74aea704835ac..ad4e504825157 100644
> --- a/drivers/of/overlay.c
> +++ b/drivers/of/overlay.c

[ ... ]

> @@ -350,6 +354,8 @@ static int add_changeset_property(struct overlay_chan=
geset *ovcs,
>  		if (prop)
>  			return -EINVAL;
>  		new_prop =3D dup_and_fixup_symbol_prop(ovcs, overlay_prop);
> +		if (IS_ERR(new_prop))
> +			return PTR_ERR(new_prop);
>  	} else {
>  		new_prop =3D __of_prop_dup(overlay_prop, GFP_KERNEL);
>  	}

[Severity: High]
This is a pre-existing issue, but could this code path lead to a double-free
on the error path for add_changeset_property()?

Looking further down in add_changeset_property(), if we are not in a livetr=
ee,
new_prop is linked into the deadprops list:

	if (!prop) {
		if (!target->in_livetree) {
			new_prop->next =3D target->np->deadprops;
			target->np->deadprops =3D new_prop;
		}
		ret =3D of_changeset_add_property(&ovcs->cset, target->np,
						new_prop);

If of_changeset_add_property() fails (for example, due to memory exhaustion=
),
ret is non-zero, and the function frees new_prop at the bottom:

	if (ret)
		__of_prop_free(new_prop);

Does this leave the freed new_prop still attached to target->np->deadprops?

When the overlay application aborts and the unattached dynamically allocated
device node is cleaned up via of_node_release(), it iterates over the
deadprops list and calls __of_prop_free() on each property again. Can this
result in a use-after-free and double-free of the property?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260721-nh-of-alia=
s-overlay-v4-0-8ad097e31e36@nexthop.ai?part=3D4
