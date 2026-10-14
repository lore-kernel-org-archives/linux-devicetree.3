Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB33F31D72E
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 23:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792020738; cv=none; b=Hvep6OJW8nKzJe/f7WDRBuH7HYspV+GvAlBS6ELYrb0H+2oAPB6HO9235nRiLc1JDXjkIJtdoR4HtvQOwAv/txM5QKfSqHQjnOBwr4WJzxOuE2ikk7eU0EzlIxNhkM1rk3DkTHR8KWdO9IqA5RqBSCzLG7geO7d1QAJZdGCZeBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792020738; c=relaxed/simple;
	bh=heqkHGZx7D+HiL/4a4gehWnxETdPEuidUGvfG+Z8aUI=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=WRzLYUFyrNaQm6U52nkAu2Nqsdd1Fl0of50Hh16dS8NE0L8JWpkrejh1l1oRLBvC0Dp2LLFuStXGcoNcmS+NZ+bhfxhFXrOJmqxjDT5SGV7HcHAbzRxfaNXjSmxGG8X+9ZY1AhSP5RP7YlrKk+oZYCJ2/6z49Xw6BAYypfQdBGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GayPnBXu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GayPnBXu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 268411F000C4;
	Wed, 14 Oct 2026 23:32:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792020737;
	bh=oOLogREmdVry0t3Jhapnl3h+90BMIByJuxeQ8MZzCck=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GayPnBXuGOidRzbY3J923bJFI9XEOqodjdNPjscYQbuMO4bBCMdhsH4Mbduw9yUh8
	 s/cGmZb0Gt+gSigeCUYL67gdr8Iv/uR8tdnGqGMWIoqhJIi3L0v2GquEtxKYLq8vhX
	 F/+xNzV6cdfhISakGX9T0yNIInejnxWrSCY2MQpQjn0F6lAVZ9nvX9b77WdXOFqmbL
	 gQqvsNyL3+cAzI+iILZhMZEsDz0Rf3ZZcL+BcZjFS9OnBLnwDTnT9kcVyw3HIAFxUN
	 KdlJj1EyROgiJnYT9yrNgtgAWu6Q2yDwNDjmoK0qQfa4Ubl0cbcalDKXYw2BhRnJK5
	 z7loEcdK1ONEg==
Message-ID: <sashiko-outbox-172021@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 3/6] of: hold a reference on of_aliases during alias
 path resolution
Reply-To: sashiko-reviews@lists.linux.dev
To: "Abdurrahman Hussain" <abdurrahman@nexthop.ai>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261014-nh-of-alias-overlay-v8-3-0f74f05ac762@nexthop.ai>
References: <20261014-nh-of-alias-overlay-v8-0-0f74f05ac762@nexthop.ai>
 <20261014-nh-of-alias-overlay-v8-3-0f74f05ac762@nexthop.ai>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 14 Oct 2026 23:32:16 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] of: lockless TOCTOU UAF reading of_aliases against concurrent over=
lay detach
--

commit 66550105e7f11866d2d8f8f454161df1bb855fa8
Author: Abdurrahman Hussain <abdurrahman@nexthop.ai>

of: hold a reference on of_aliases during alias path resolution

This commit takes a reference across the walk of the of_aliases property
list in of_find_node_opts_by_path() to prevent accessing stale views. It
also validates the alias value before resolving it to avoid crashes on
malformed boot FDTs.

>     The pointer load itself needs no locking:
>     of_aliases always holds a reference on the node it points to, so a
>     reader that observes a non-NULL pointer observes a live node. A later
>     patch in this series clears of_aliases and drops that reference when
>     the node is detached at runtime; the detach path holds its own
>     references across the transition.

[Severity: High]
Is this description accurate regarding the lack of locking for the pointer
load?

While the detach path holds a reference during the transition, if
of_changeset_destroy() runs immediately after the revert without any RCU
grace period, it could drop the final reference to the node.

Since of_node_release() uses kfree() and not kfree_rcu(), the object is
destroyed immediately, which leaves a race window open.

> diff --git a/drivers/of/base.c b/drivers/of/base.c
> index 57313055d9ede..6a6d9f8439dd1 100644
> --- a/drivers/of/base.c
> +++ b/drivers/of/base.c
[ ... ]
> @@ -1010,16 +1012,21 @@ struct device_node *of_find_node_opts_by_path(con=
st char *path, const char **opt
>  			p =3D separator;
>  		len =3D p - path;
> =20
> -		/* of_aliases must not be NULL */
> -		if (!of_aliases)
> +		aliases =3D of_node_get(of_aliases);

[Severity: High]
Can this lockless read lead to a TOCTOU race and a use-after-free?

If a thread calls of_find_node_opts_by_path() and reads the global of_alias=
es
pointer, but gets preempted before taking the reference in of_node_get():

Thread 1
of_find_node_opts_by_path()
   aliases =3D of_aliases;
   <preempted>

Thread 2 could concurrently remove an overlay containing a dynamically
created /aliases node. The detach notifier clears of_aliases =3D NULL and
drops its reference, and then of_changeset_destroy() drops the final
reference to the node, freeing it synchronously via kfree().

When Thread 1 resumes:

Thread 1
   of_node_get(aliases);

Could this lead to dereferencing node->kobj on freed memory?

Should this read be protected by devtree_lock or similar synchronization to
prevent the node from being freed before the reference is taken?

> +		if (!aliases)
>  			return NULL;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261014-nh-of-alia=
s-overlay-v8-0-0f74f05ac762@nexthop.ai?part=3D3
