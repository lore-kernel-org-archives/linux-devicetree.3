Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E8B844238F
	for <devicetree@vger.kernel.org>; Fri,  7 Aug 2026 15:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786116830; cv=none; b=lB8P5SnMea7o6JTiC/JoS9aElq0GHfHNJPHzS8OIW7Cpp7N4jCqQP3yk4cEybDqC3Rr/EvkiPriIBUxp4uN9jG5dbWJkKRsSpwaH0yX1J+J0KbW8R+bgF69nsZ8qyFUMMSjqtSLsl8sdS9WRyipAEq9hZG2s4BDc48ijtQI8xZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786116830; c=relaxed/simple;
	bh=nDEEQ7IxQ2iYDVwVXnhIcwj8i19VejOj8sFga9xjR/A=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=iug/srYnKoqvF2IWKg8WLrcD90wR6mXH7kpOnS9WGUb4ZpYGx2kL6oN/FnLLO8bVrJ4OEjFKL5YxmeehA9r6c0tLzgktfA0UkOlc5INvGJdIWceX5p7ag5gdTcOdoOQwQFEFP+g/FZ7aVSWKkuyrs+/HE1Imc+3FU94IGgpyPdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RjjKwfrS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RjjKwfrS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEBCD1F00A3A;
	Fri,  7 Aug 2026 15:33:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786116829;
	bh=Aa5DMXfj069PKmTKvgvNVj44TsbPF2etPhxK80Eepf0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RjjKwfrSkjb/1Vfh0XDJnPXUz2kFQxQDuH3oV4Gn1MFru/ArqtXN0y7fC1RiCqcY5
	 L5rVz4QcSDHB5M01eFjjP+wlqUQHVqaUe5dyy8DHDlhwbyp7d2b0XRmNMb1uz7WS83
	 Njda/PvMKP8zZbUjY7Mj0HKHNSdAJf0xdkZeDQRI57pjKHWC2U+tmNcmeNtwOZ9z1h
	 B25hgpLWb9oV9E5DmWDcZBxc2RqJVfMMvObZYx/zRoA4J6AqKplkUlDQeb1UydSgkk
	 y8hGcGAAOiXmnNGsVlQfDbZzMzRD9fx3/v3VaFpp6KlKLQcGVu7tBYOBXM65Dn4gfk
	 b4joZn9zZ052A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 7/7] clk: tests: Add Kunit testing for nexus nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?TWlxdWVsIFJheW5hbCAoU2NobmVpZGVyIEVsZWN0cmljKQ==?= <miquel.raynal@bootlin.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260807-schneider-v7-2-rc1-eip201-upstream-v5-7-8785f9531cf0@bootlin.com>
References: <20260807-schneider-v7-2-rc1-eip201-upstream-v5-0-8785f9531cf0@bootlin.com>
 <20260807-schneider-v7-2-rc1-eip201-upstream-v5-7-8785f9531cf0@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 07 Aug 2026 15:33:48 +0000
Message-Id: <20260807153348.DEBCD1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The `clk_of_find_node_by_name_kunit` test helper introduces a do=
uble-free vulnerability if a KUnit-managed device node is passed as the `fr=
om` argument.
--

--- Patch [7]: [PATCH v5 7/7] clk: tests: Add Kunit testing for nexus nodes=
 ---
commit 46e51b3734a9b5d623eb4fdcf34b7fd8442c735e
Author: Miquel Raynal (Schneider Electric) <miquel.raynal@bootlin.com>

clk: tests: Add Kunit testing for nexus nodes

This commit adds a nexus node with a child requesting a mapped clock in the
fake DT overlay to verify parsing works correctly. It also introduces a new
KUnit helper similar to of_find_node_by_name() to automatically garbage col=
lect
nodes during testing.

> diff --git a/drivers/clk/clk_kunit_helpers.c b/drivers/clk/clk_kunit_help=
ers.c
> index 68a28e70bb61c..ab6b2cffcad60 100644
> --- a/drivers/clk/clk_kunit_helpers.c
> +++ b/drivers/clk/clk_kunit_helpers.c

[ ... ]

> +struct device_node *clk_of_find_node_by_name_kunit(struct kunit *test, s=
truct device_node *from,
> +						   const char *name)
> +{
> +	struct device_node *np;
> +	int ret;
> +
> +	np =3D of_find_node_by_name(from, name);

[Severity: Medium]
Since of_find_node_by_name() drops the reference to the from node, what
happens if a test author chains calls and passes a KUnit-managed node as the
from argument?

Will the underlying function drop the reference while KUnit's deferred
teardown attempts a second of_node_put() on the same node when the test
finishes, leading to a double-free?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260807-schneider-=
v7-2-rc1-eip201-upstream-v5-0-8785f9531cf0@bootlin.com?part=3D7
