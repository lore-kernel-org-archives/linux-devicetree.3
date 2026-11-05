Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793893340;
	b=3BAvvSAdzCCzSzC25/hD8g5+HbSM8u/6NC1szddRnFjsbVoyaM4DMpMiOJViGVwAg7Dj
	 SHvk2kaKwEkH2PZ8zE5HLZFgeLuJm/p58YqXZKQQsQYDN93PRVr9FojvFxP7z0vge9Xwy
	 e+4n7WzIFsgzNYKwWpHSUK7KxyRg4wYEYlGHNhl4vEXUuelPYx+kVge2Qk4bNzRW9k3gq
	 qTpBqa+wsdcmtW/x1ijF8XwLwYvzGDrBIoTOM3DT9sLcnfWOqVs6EADywAu6yVlaqUuxe
	 kgnVG4JXxjk3cyDnuF3cX+8dmEhzavl0Puq81Y7WsWC3HnbIKUkRC+8Q3kgpcAqLyVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793893340;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=2CBihoP9/32daWWNq0li4KIqQ+dQgHMsac+YuCF0orw=;
	b=Vr0zztiC1XI0n81UxG2eOmZDqZo2IKVROmCNyDi+R0yk7VgK4edUUu9DTwNDmxcmONNo
	 MAxmd4syQPBu3BWE1hMkj9RqFwu8kYfEV01W3LzMKl0W/9kajRjVWJ8nVDNMpQyf6FDj2
	 bt6meQ0OTS56vRmTd4txAS9r4t6gJsT2VgY/8nr1ZHlZWxBUAKZ5bsdc5gQuxx16IxbEN
	 QpNWNu4/jCNF2rZU15TolbAZAmSCejSvkLJjvct2eKrnPMhaQXNh4qXuNB7oTFY9poRcP
	 Y39itnQSO6JaMYGU/PI+7VjSLXCQwHWVjfjNSB0yTCGH4WnQxyvQ8YJaQGzBBvBY6Vg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fTQ6EwNW;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFE62606A32C
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 15:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fTQ6EwNW
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81B1A1F00919;
	Thu,  5 Nov 2026 15:42:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793893339;
	bh=2CBihoP9/32daWWNq0li4KIqQ+dQgHMsac+YuCF0orw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fTQ6EwNWeFkmsO3zJ8i9OTcltRU5ZarBNQ/jJZNS5FEIzwVvq7XKb6IMUjQ0/A5Y6
	 fNdPaf7hrHFHl37CvLusViEnDiWke24wDd3aSxL1T8vzS4/f35NVFjWpdPHja2HKDx
	 A9B8jzwR9EpO6eKcXmzDLGEGTe5/5KuQY9EDhhKz5SLGT3f6UXtTsAbFb3x0mysOL+
	 GwVJP4Soup4JZlwNItk9/uRupWGo/aeNNeCEmGqa3hiOH9OxVZrvDbL13tq8uaZL7T
	 sj41rarImrhH6IEGsKZsokg6ZUD3zfs97UILvaPudzW5Fd3Ek5A8b2XEmnm6PtuIvW
	 StiTV4Lt5RVmQ==
Message-ID: <sashiko-outbox-199327@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] of: unittest: fix node reference leak in
 of_unittest_match_node()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wentao Liang" <vulab@iscas.ac.cn>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261103104237.1373649-1-vulab@iscas.ac.cn>
References: <20261103104237.1373649-1-vulab@iscas.ac.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 15:42:18 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] of: unittest: duplicated of_node_put() calls in of_unittest_match_n=
ode()
- [Low] of: unittest: inaccurate leak description in commit message for of_=
unittest_match_node()
--

commit af0b41164c2a3216ad75b00e05f54e6ed432774e
Author: Wentao Liang <vulab@iscas.ac.cn>

of: unittest: fix node reference leak in of_unittest_match_node()

This commit adds of_node_put(np) calls across the match failure and success
paths in of_unittest_match_node() to release the device_node reference
acquired by of_find_node_by_path().

>     of: unittest: fix node reference leak in of_unittest_match_node()
>    =20
>     of_find_node_by_path() returns a device_node with its reference count
>     incremented. of_unittest_match_node() never releases that reference:
>     failed matches continue to the next iteration, and the reference taken
>     for the last test case is still held when the function returns.
>    =20
>     Drop the reference on all three paths.
>    =20
>     Fixes: 1f42e5dd5065 ("of: Add self test for of_match_node()")
>     Cc: stable@vger.kernel.org
>     Assisted-by: DeepSeek-V4.1-Flash and OpenAI Codex
>     Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>

[Severity: Low]
This isn't a bug in the code, but is the commit message description of how
references are leaked accurate?

In drivers/of/unittest.c:of_unittest_match_node():

	for (i =3D 0; i < ARRAY_SIZE(match_node_tests); i++) {
		np =3D of_find_node_by_path(match_node_tests[i].path);

Unlike iterator helpers that take a previous node argument and release it,
of_find_node_by_path() only takes a path string and never drops the prior
reference held in np.

Doesn't overwriting np on the next iteration leak the device_node reference=
 on
every passing test case as well, rather than only on failed matches and the
final test case?

> diff --git a/drivers/of/unittest.c b/drivers/of/unittest.c
> index e255f54f4d760..7426d13e99580 100644
> --- a/drivers/of/unittest.c
> +++ b/drivers/of/unittest.c
> @@ -1921,6 +1921,7 @@ static void __init of_unittest_match_node(void)
>  		if (!match) {
>  			unittest(0, "%s didn't match anything\n",
>  				match_node_tests[i].path);
> +			of_node_put(np);
>  			continue;
>  		}
> =20
> @@ -1928,9 +1929,11 @@ static void __init of_unittest_match_node(void)
>  			unittest(0, "%s got wrong match. expected %s, got %s\n",
>  				match_node_tests[i].path, match_node_tests[i].data,
>  				(const char *)match->data);
> +			of_node_put(np);
>  			continue;
>  		}
>  		unittest(1, "passed");
> +		of_node_put(np);

[Severity: Low]
This isn't a bug, but in drivers/of/unittest.c:of_unittest_match_node(), np=
 is
not used after being passed to of_match_node():

		match =3D of_match_node(match_node_table, np);

Could of_node_put(np) be called once immediately after of_match_node() (or
could np be declared with __free(device_node) inside the loop) instead of
duplicating of_node_put(np) across all three exit paths?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261103104237.1373=
649-1-vulab@iscas.ac.cn?part=3D1
