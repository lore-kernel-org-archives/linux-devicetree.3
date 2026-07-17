Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DF043ADBA3
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 17:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784310093; cv=none; b=kUtVDrCEcrf05BEDUQQoBmC9gk3IWxK+JR8rta+JmImFSEG55QPoc3gtku91cmRpn6NLJvZeIYNmqfK2sc2THyRtcdcIpIdi1aP1mpntrAEr3N5jUNz+SjoSJaKcQIqK4zY3XGJ9ajwwJINsBnO8nrJBsEE0I+wlFmbPEwsrS70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784310093; c=relaxed/simple;
	bh=e0er1miqyKwN2rbYEZgqaiBUym2o6TImtUkpNw/4DRk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Pb9Yd6mWJA7cw6bT+lXVSK49dyflrW64nx4BK81lZsAqS3HwBL2t6vTI+5zPizB/pGseVzrmGZFVe8lEVOUDnm+lHnG7sMlskzpirQ20zPblnSvW2yLUNWreyU7bxspGlhgKBqwWzkrTJgbwj1r6k/UhvOgEslIbCIIgUVq+gOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BUb0s99n; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BUb0s99n"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC6961F00A3A;
	Fri, 17 Jul 2026 17:41:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784310092;
	bh=T0NjGel/BFOdWRbZ/B1VBDgGQRMEY0F1f8v1JWAvWzE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BUb0s99ndEVczfx3Df5QJAz2KxUa/basn0Rl1utyq28mvQyXsPhorTS8eCRA+jGDX
	 I1PgA+51xMKR83KBCxfIGB1Z3oSqQzUwmcxNii8AS4ccorsVpzfxOGGeEYLJzTTbOb
	 RpnmUELEPcQjsELb95k5ULQHkZI9+grRTN5BJ2JAc2BqYKY6WVDtvv7nZn3evD7Gsn
	 edwhqEAsBrXabu/dR+JqpUTGPnSeRTWNGP+51aFPw45myqF1LmX1zdSB3eJcZtXkCe
	 XCFJs7R4nNd8yvwdv6owoxvxhdeV+xuTc9SaF2G4sLNiMXALPPyi9aQGLzkygs/d3d
	 6jPbhVehvYNDQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 7/7] clk: tests: Add Kunit testing for nexus nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?TWlxdWVsIFJheW5hbCAoU2NobmVpZGVyIEVsZWN0cmljKQ==?= <miquel.raynal@bootlin.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260717-schneider-v7-2-rc1-eip201-upstream-v4-7-751547e160e5@bootlin.com>
References: <20260717-schneider-v7-2-rc1-eip201-upstream-v4-0-751547e160e5@bootlin.com>
 <20260717-schneider-v7-2-rc1-eip201-upstream-v4-7-751547e160e5@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 17 Jul 2026 17:41:31 +0000
Message-Id: <20260717174131.CC6961F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] `of_find_node_by_name_kunit()` creates a double-free / use-after=
-free trap via its `from` argument.
- [Medium] `of_find_node_by_name_kunit()` returns an `ERR_PTR` on failure, =
breaking the expected `NULL` failure semantic of `of_find_node_by_name()`.
--

--- Patch [7]: [PATCH v4 7/7] clk: tests: Add Kunit testing for nexus nodes=
 ---
commit abd4c1ecb509bcaa0e834d4c06b41750affacb27
Author: Miquel Raynal (Schneider Electric) <miquel.raynal@bootlin.com>

clk: tests: Add Kunit testing for nexus nodes

Add a nexus node with a child requesting a mapped clock in the fake DT
overlay to verify that the parsing is also correctly working. Create an
of_find_node_by_name() like kunit helper to garbage collect the node
automatically in case of failed assertion.

> diff --git a/drivers/clk/clk_kunit_helpers.c b/drivers/clk/clk_kunit_help=
ers.c
> index 68a28e70bb61c..daaf1cf1546c4 100644
> --- a/drivers/clk/clk_kunit_helpers.c
> +++ b/drivers/clk/clk_kunit_helpers.c
[ ... ]
> +struct device_node *of_find_node_by_name_kunit(struct kunit *test, struc=
t device_node *from,
> +					       const char *name)
> +{
> +	struct device_node *np;
> +	int ret;
> +
> +	np =3D of_find_node_by_name(from, name);

[Severity: Medium]
Will this lead to a double-free if the from argument is another
KUnit-managed node?

of_find_node_by_name() explicitly drops the reference on its from argument.
If a test author passes a node previously returned by
of_find_node_by_name_kunit(), the underlying of_find_node_by_name() will
consume the reference immediately.

KUnit is unaware of this and will execute its deferred action at the end of=
 the
test, calling of_node_put() a second time on the already freed node.

> +	if (!np)
> +		return NULL;
> +
> +	ret =3D kunit_add_action_or_reset(test, of_node_put_wrapper, np);
> +	if (ret)
> +		return ERR_PTR(ret);

[Severity: Medium]
Could this ERR_PTR() return value cause crashes for callers using standard =
OF
node pointer checks?

The standard of_find_node_by_name() strictly returns NULL on failure, and
callers typically check for failure using if (!np). Returning an ERR_PTR()
here means truthy checks will pass, potentially leading to an invalid point=
er
dereference when the caller attempts to use the returned error pointer as a
device_node struct.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260717-schneider-=
v7-2-rc1-eip201-upstream-v4-0-751547e160e5@bootlin.com?part=3D7
