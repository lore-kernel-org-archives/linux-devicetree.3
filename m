Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D7D03093D8
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 03:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784777663; cv=none; b=tRctUjN2u2TH7Vqyjo9zbWG9EWe71Wh68PzJ3Ohw2bMUkQsBQgT8TfVNQD7SUG11svCwkO63JjSv74C4vqwVf8/o2Khr/8wQiIafHWSLpmscw9b8kb++bz2eE4cjDfO9lO7glEhd8/4+/SNKVpv48K3079itLlBlR0+yxYzOsXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784777663; c=relaxed/simple;
	bh=hPn9KSq+HNMnYAGxi/4x28X3RVXZHVvKUbe+lDwgVG4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=NsLTjENDL9c4cxJWHWqmQ8jOfz01YB2GaJpuTnnZuBQLNtmI9e/Nl2Sqq9HklyJUOnrqgQAYxcyjYtJjZddWXezvzqdZ1t5b5dm4jVh8RfWyJaq8czFT+LQc6QZy2oyG4pzE4A8uJy6oKA7TEFI9xjlTtrlXuQpstVZuOnpF5u4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kY9k5XuX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kY9k5XuX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 503EA1F000E9;
	Thu, 23 Jul 2026 03:34:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784777661;
	bh=HZQGJhm0IXur5E3N9liesdJRrBCyfvdh/HLfGkW6XW0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kY9k5XuXwOXrb7f79xduakABDyuJ6LNbavtyTHPkUEd1AhM2hfWbB6ahm2szlr/f8
	 ODZtisI4kDnwwOGTtCGs4vE8ieZL0m9JIAv7Jd8itGCqgmKjR3E9y3evHDZAH3wFNP
	 r/jEaa5ic4y8eGpNROBEP4z4xhb9UZEP2mFyr3HacCsvdCtadiRv+FuE9QdHy0W3ak
	 6hbWGNSZ6T/J66SE1G5DoKUHEcNxol+TWKGJQ236iP1kI21qqYW/ZhPEh7yC5QO8kt
	 RaoFooutvrXraBF15DbSUXdB42E3w8h7LS3daocy46wxIpG2DQNOXhV/kGKCqQr15q
	 7lSoZfeJXcq4w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/9] of: update /aliases lookup on reconfig
 notifications
Reply-To: sashiko-reviews@lists.linux.dev
To: "Abdurrahman Hussain" <abdurrahman@nexthop.ai>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260722-nh-of-alias-overlay-v5-2-2abe2bb9cdbc@nexthop.ai>
References: <20260722-nh-of-alias-overlay-v5-0-2abe2bb9cdbc@nexthop.ai>
 <20260722-nh-of-alias-overlay-v5-2-2abe2bb9cdbc@nexthop.ai>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 23 Jul 2026 03:34:20 +0000
Message-Id: <20260723033421.503EA1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Lockless iteration over `aliases->properties` in `of_find_node_opt=
s_by_path()` races with concurrent property additions/removals.
--

--- Patch [2]: [PATCH v5 2/9] of: update /aliases lookup on reconfig notifi=
cations ---
commit 9797d916f1b83a48a93f588ed426470feb4bed4a
Author: Abdurrahman Hussain <abdurrahman@nexthop.ai>

of: update /aliases lookup on reconfig notifications
   =20
Registers a reconfig notifier to mirror /aliases property changes into
aliases_lookup. The notifier chain covers changesets and overlays, matching
the /aliases node by name and root parent.

Link: https://lore.kernel.org/lkml/1435675876-2159-1-git-send-email-geert+r=
enesas@glider.be/
Link: https://lore.kernel.org/lkml/20150630172131.D4E6CC4041A@trevor.secret=
lab.ca/

> diff --git a/drivers/of/base.c b/drivers/of/base.c
> index 6f79f593fc779..612e2cd31688d 100644
> --- a/drivers/of/base.c
> +++ b/drivers/of/base.c
[ ... ]
> +	case OF_RECONFIG_ADD_PROPERTY:
> +		of_alias_create(rd->prop, alias_alloc, true);
> +		break;
> +	case OF_RECONFIG_REMOVE_PROPERTY:
> +		of_alias_destroy(rd->prop->name);
> +		break;
> +	case OF_RECONFIG_UPDATE_PROPERTY:
> +		if (rd->old_prop)
> +			of_alias_destroy(rd->old_prop->name);
> +		of_alias_create(rd->prop, alias_alloc, true);
> +		break;

[Severity: High]
This isn't a bug introduced by this patch, but can this concurrent property
addition or removal race with the lockless property iteration in
of_find_node_opts_by_path()?

In drivers/of/base.c:of_find_node_opts_by_path(), aliases->properties is
iterated locklessly:

		for_each_property_of_node(aliases, pp) {
			if (!strncmp(pp->name, path, len) && !pp->name[len]) {
				if (of_alias_value_ok(pp))
					value =3D pp->value;
				break;
			}
		}

Concurrent property modifications via __of_add_property() or
__of_update_property() manipulate the list pointers without memory barriers.
A lockless reader may traverse to a newly added property before its contents
(like pp->name) are globally visible, leading to a crash. Additionally,
__of_update_property() repoints oldprop->next to deadprops, which can divert
a lockless reader into the dead properties list.

Could taking devtree_lock during the iteration, or utilizing the newly
synchronized aliases_lookup list, prevent this race?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260722-nh-of-alia=
s-overlay-v5-0-2abe2bb9cdbc@nexthop.ai?part=3D2
