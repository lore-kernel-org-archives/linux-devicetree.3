Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7286234B1A6
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 21:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784670392; cv=none; b=fW1Vr+u7Wl32jGw3nCH/x31fWcASelUkSW37sh/j13evol4L6yR8gl7nbElIZPg3E/ZObwU8PkR+qBfiBW/HzKI7Z7xFfWzd1pfLUJP0f001i/ywwl3ncspViTZLiLUoxb873hqeNEgwtQQPRKX6jY7CZQYuunRlrXKOcVR0Fqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784670392; c=relaxed/simple;
	bh=x7AlrBh2KH2cVx8D+eoSZL0k5fFHITp6GUwnbsXiNtY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=S5g/XLoK8Mcf1ca5xUgk/10sli4dZ+kK/rtuD+8QdyypRp8dpS2+uYp5jmEQFoUJnzcXGLpldHip+0gWmv7qBWX4VZBMRrjcN4+HGm9GGLVW8f7ofEymwb+8CDD2+pANSs4UndMSJaxsw7C+wPA5yi72l8MO84PHdTW4kKxAkes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q02MQYca; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q02MQYca"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE0EA1F00A3A;
	Tue, 21 Jul 2026 21:46:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784670391;
	bh=R2RMdsLWpv94+pqRA2smAP2Ja8Alf8mUdqx4KfgHchA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Q02MQYcabSWOINRd7cnOxNxjwpslO3l32HE3cGOz4w9OIE6rXvOafL1CN124NAbDp
	 8B6UXdMtQHTGYAlX9tjSud0JeWL1FfgSPgtBAgP7i4EYuz9riOujH99Rse7sx7iBy4
	 Ei1BWHEZzk3MnesLawxdGz3qbzzA65fQvW79nGeewnlDzZAgy9ZIjK89HS0KVzp4T2
	 CiIQ8tt7lgD4Xl7zR970Pjr0tMIK8WJ2UMDFXLTgVsPPYYFnOu1MyzSeIBh0DLKS9h
	 r2OjnFs4TygsU8I7p9EGThaHxGiwbby/gLeyr2WtPFzGCBmyLA8mxKIyjgTnySYEmx
	 9W7kILHgWRTMA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 4/4] of: unittest: cover /aliases updates from
 overlay apply/revert
Reply-To: sashiko-reviews@lists.linux.dev
To: "Abdurrahman Hussain" <abdurrahman@nexthop.ai>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260721-nh-of-alias-overlay-v3-4-7001028fe2f5@nexthop.ai>
References: <20260721-nh-of-alias-overlay-v3-0-7001028fe2f5@nexthop.ai>
 <20260721-nh-of-alias-overlay-v3-4-7001028fe2f5@nexthop.ai>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 21 Jul 2026 21:46:30 +0000
Message-Id: <20260721214630.EE0EA1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Holding a device node reference across `of_overlay_remove()` cau=
ses a memory leak and unexpected kernel error logs.
--

--- Patch [4]: [PATCH v3 4/4] of: unittest: cover /aliases updates from ove=
rlay apply/revert ---
commit 4a0912943dbf2d4f5c928768a852d7834811ba59
Author: Abdurrahman Hussain <abdurrahman@nexthop.ai>

of: unittest: cover /aliases updates from overlay apply/revert

This commit adds an overlay test to ensure /aliases updates work correctly
across apply and revert when the overlay grafts a node with an alias.

> diff --git a/drivers/of/unittest.c b/drivers/of/unittest.c
> --- a/drivers/of/unittest.c
> +++ b/drivers/of/unittest.c

[ ... ]

> +static void __init of_unittest_overlay_alias(void)
> +{

[ ... ]

> +	/* hold a ref across the revert for the post-remove check */
> +	target =3D of_find_node_by_path(target_path);
> +	if (!target) {
> +		unittest(0, "could not find grafted target %s\n", target_path);
> +		goto out_remove;
> +	}
> +
> +	id =3D of_alias_get_id(target, "testcase-alias");
> +	unittest(id =3D=3D 99,
> +		 "of_alias_get_id() =3D %d after overlay apply, expected 99\n",
> +		 id);
> +
> +out_remove:
> +	ret =3D of_overlay_remove(&ovcs_id);

[Severity: Medium]
Does holding this device node reference across of_overlay_remove() cause a
memory leak and unexpected kernel error logs?

When the reference to the target node is held, __of_changeset_entry_destroy=
()
observes a refcount greater than 1, which triggers an "ERROR: memory leak"
log and skips the OF_OVERLAY_FREE_CSET flag.

Subsequently, when of_node_put(target) drops the refcount down to 0,
of_node_release() logs another memory leak error and returns without freeing
the node memory.

> +	if (ret) {
> +		unittest(0, "overlay_alias remove failed, ret =3D %d\n", ret);
> +		of_node_put(target);
> +		goto out_put_base;
> +	}
> +
> +	if (target) {
> +		id =3D of_alias_get_id(target, "testcase-alias");
> +		unittest(id =3D=3D -ENODEV,
> +			 "of_alias_get_id() =3D %d after overlay remove, expected -ENODEV\n",
> +			 id);
> +		of_node_put(target);
> +	}
> +
> +out_put_base:
> +	of_node_put(base);
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260721-nh-of-alia=
s-overlay-v3-0-7001028fe2f5@nexthop.ai?part=3D4
