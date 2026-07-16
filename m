Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2C0843F081
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 11:42:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784202157; cv=none; b=HsnuPHLJ78ZnUElqgqjzxEvomMgb8sxCnjMKPZFbKNmD/IcLPIPKZd+vN3VWFCdtO+1EpKydtOy/D4asuRyYwb4h/qauamhOLMk1H2RoSNL9CMn2roVKyb3my5cTY52VqFkw5CEV6VkJ8idRnkWYErdMVwsptcihGKHDXsRPX1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784202157; c=relaxed/simple;
	bh=iKQ1H0osuvBBtqtLLX10LMe1QZjp5YdWuDI8mkGlalc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=JirGCrp+Tbuu0lKcUwMUgmbixH+VhEekUdZwyKF8HT0BPcJvh7hm4plk5exDgLiBCOtl3W/c1NpT7HreHBtqVYJURWT6d+CY5BBc6aAPrXPSi8nTk0VrbxDWUREULFIx3EyLvzd3dwOUZZwKLU7c6urmjsPYHvQGWdUEoKT0K7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nFtSq0tX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nFtSq0tX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 507CD1F00A3A;
	Thu, 16 Jul 2026 11:42:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784202155;
	bh=nB9csBfAMwxJFe2SUT69F8LJxn1/k9/HmSOUfoQVcWk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nFtSq0tXd+uBhz8TJtKUL7e7j8jd2iQGoA2YTbkT7p65xsQL3Hnl+RvdaMmDVlz5g
	 fnTZdn7cj1j8C6rK18sT2FD1t0Sp4R04M2oP4M0Z3oilU0DJhO5JNzuiay4w/j8ECq
	 GDe2tuRU/di57BOYHtWswvvl441r6nJpZfwOs+sWCNap3p0mQAdiHD0NOeKVmgaS56
	 KiG51kyRNgabAARezV4aJD1rahu65lJS9bknBS7i+8Ex9pchw2F1k9UOKJQknnz+UX
	 Do0DnxaLTDzCiyYTmsFlQqk37Ivyb+VsD/CMBwhLpqflj6Ijgxj2xoJ5M5NmmvfKPE
	 iXDOn5OhooB2w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 7/7] clk: tests: Add Kunit testing for nexus nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?TWlxdWVsIFJheW5hbCAoU2NobmVpZGVyIEVsZWN0cmljKQ==?= <miquel.raynal@bootlin.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260716-schneider-v7-2-rc1-eip201-upstream-v3-7-98454e83845c@bootlin.com>
References: <20260716-schneider-v7-2-rc1-eip201-upstream-v3-0-98454e83845c@bootlin.com>
 <20260716-schneider-v7-2-rc1-eip201-upstream-v3-7-98454e83845c@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 16 Jul 2026 11:42:34 +0000
Message-Id: <20260716114235.507CD1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] The `of_find_node_by_name_kunit` helper creates a double-free vu=
lnerability if a KUnit-managed node is passed as the `from` argument.
- [Low] The `of_find_node_by_name_kunit` kernel-doc incorrectly states the =
return value is only a node or negative errno, omitting the NULL case when =
a node is not found.
--

--- Patch [7]: [PATCH v3 7/7] clk: tests: Add Kunit testing for nexus nodes=
 ---
commit 5c005eb5dfe6aeb07b97b34ac1e15ba0def6eeae
Author: Miquel Raynal (Schneider Electric) <miquel.raynal@bootlin.com>

clk: tests: Add Kunit testing for nexus nodes

This commit adds a fake DT overlay with a nexus node to verify clock parsing
in KUnit tests. It also introduces of_find_node_by_name_kunit() to manage
device node lifetimes during tests.

> diff --git a/drivers/clk/clk_kunit_helpers.c b/drivers/clk/clk_kunit_help=
ers.c
> index 68a28e70bb61c..151f62ab57c1a 100644
> --- a/drivers/clk/clk_kunit_helpers.c
> +++ b/drivers/clk/clk_kunit_helpers.c
[ ... ]
> +/**
> + * of_find_node_by_name_kunit() - Test managed of_find_node_by_name()
> + * @test: The test context
> + * @from: Parent device node to start searching from, or NULL to search =
from root
> + * @name: The name string to match against
> + *
> + * Just like of_find_node_by_name(), except the device_noded is managed =
by
> + * the test case and is automatically put after the test case concludes.
> + *
> + * Return: the device_node on success or a negative errno value on failu=
re.

[Severity: Low]
This isn't a bug, but the kernel-doc states the function returns a device_n=
ode
on success or a negative errno on failure.

However, the implementation also returns NULL if the node is not found.

Could the documentation be updated to mention the NULL return case, so
callers don't assume IS_ERR() is sufficient?

> + */
> +struct device_node *of_find_node_by_name_kunit(struct kunit *test, struc=
t device_node *from,
> +					       const char *name)
> +{
> +	struct device_node *np;
> +	int ret;
> +
> +	np =3D of_find_node_by_name(from, name);

[Severity: Medium]
Could this result in a double-free if a KUnit-managed node is passed as the
'from' argument?

of_find_node_by_name() automatically consumes and drops the reference to the
'from' node. If a developer chains KUnit-managed lookups:

    parent =3D of_find_node_by_name_kunit(test, NULL, "parent_name");
    child =3D of_find_node_by_name_kunit(test, parent, "child_name");

The inner of_find_node_by_name() will drop the 'parent' reference.

Since KUnit is unaware of this consumption, won't the deferred test cleanup
still call of_node_put() on 'parent' at test exit, resulting in a guaranteed
double-free?

> +	if (!np)
> +		return NULL;
> +
> +	ret =3D kunit_add_action_or_reset(test, of_node_put_wrapper, np);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
> +	return np;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260716-schneider-=
v7-2-rc1-eip201-upstream-v3-0-98454e83845c@bootlin.com?part=3D7
