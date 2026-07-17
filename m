Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFCC6274B3B
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 17:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784308305; cv=none; b=cRw9MJuyuPD1mvN/ldHdr6P5rZ41ev01h6YCC3wosAlhbqWQocFEHJ3e8iNpE/hsjv6BwFb2ZZ8KcnQQb/kycJU+6U8v4BFmPgohyzfyI5UJueiVYeV7NjYnVW4H6Zhffa7Bx95kcZ6lhynz6yQShhXze5HwtgdMaCljRZoNmqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784308305; c=relaxed/simple;
	bh=E0KJQjW35k3bGxQCa6ug+xdQ4WRiPGZ7WZ0oTkGqhxs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=P8NafBlO1NnrHGkYsSasRa16F56+Mrq4S3QK6amE/0mX/KNo1lEv/AgdfsnUAHWUtWLaqbO2DdN8Sf7pebDdscp7QyQAKOMAy0jXLXenxZk1R/LKYeZkMiAQtb0UkAdAquQAL12xt4S/Pg6vTz/j4xsDO2cL/mvyb4h2wbGf3cE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q79dcRhh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q79dcRhh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C7831F000E9;
	Fri, 17 Jul 2026 17:11:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784308303;
	bh=G4ua4Pt0GD6MDVqSzgItOaMdjdZQXkNfynJaZZkv+0w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Q79dcRhhg5JI43DFRDnT2qhN030Ho7jWuueUTydcIxo9yksbK6f5TZexTtN3I0EzW
	 CR06iMXYHCH7AWVJjH5RQ/VHJb7hOivasXzmcw9gqUFVvFf5fKXbOYZ95YJp/p9jgn
	 3DinoysPeyaHBwhYdQ+lvNeNnHXq32kUo6DvXYLHU790tPxtc3GbY2Xm21fKlCFTfT
	 ylpGRaEC9OvRTv00qq81ju/8UgnvxnBa+RTK4rqhqeuewMpE2ml0IyCm0lDsdqKvPY
	 0jMiMSp5fRJgR05FMTyIN2PIOln2K0MvnhgKqu3XsBM81OVeNXkMSAQE1JCiywxTCp
	 6CHdc/VrNqchA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 3/7] clk: tests: Add Kunit testing for
 of_clk_get_parent_name()
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?TWlxdWVsIFJheW5hbCAoU2NobmVpZGVyIEVsZWN0cmljKQ==?= <miquel.raynal@bootlin.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260717-schneider-v7-2-rc1-eip201-upstream-v4-3-751547e160e5@bootlin.com>
References: <20260717-schneider-v7-2-rc1-eip201-upstream-v4-0-751547e160e5@bootlin.com>
 <20260717-schneider-v7-2-rc1-eip201-upstream-v4-3-751547e160e5@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 17 Jul 2026 17:11:42 +0000
Message-Id: <20260717171143.3C7831F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Potential use-after-free of device tree strings and clock names wh=
en returning clock parent names.
--

--- Patch [3]: [PATCH v4 3/7] clk: tests: Add Kunit testing for of_clk_get_=
parent_name() ---
commit 4b760cb4ff3b2b61c5f90468c3fd87c387504cd7
Author: Miquel Raynal (Schneider Electric) <miquel.raynal@bootlin.com>

clk: tests: Add Kunit testing for of_clk_get_parent_name()

This commit adds a Kunit test to verify that of_clk_get_parent_name()
returns the correct clock name when looking up by index.

> diff --git a/drivers/clk/clk_test.c b/drivers/clk/clk_test.c
> index f47f81b7d72a4..4084559e157df 100644
> --- a/drivers/clk/clk_test.c
> +++ b/drivers/clk/clk_test.c

[ ... ]

> @@ -3637,9 +3637,23 @@ static void clk_parse_clkspec_with_incorrect_index=
_and_name(struct kunit *test)
>  	KUNIT_EXPECT_TRUE(test, IS_ERR(hw));
>  }
> =20
> +/*
> + * Verify that of_clk_get_parent_name() returns the correct clock name w=
hen
> + * looking up by index through the consumer's clocks property.
> + */
> +static void of_clk_get_parent_name_gets_parent_name(struct kunit *test)
> +{
> +	struct clk_parse_clkspec_ctx *ctx =3D test->priv;
> +	const char *expected_name =3D "clk_parse_clkspec_1";
> +
> +	KUNIT_EXPECT_STREQ(test, expected_name,
> +			   of_clk_get_parent_name(ctx->cons_np, 0));

[Severity: High]
This isn't a bug introduced by this patch, but does of_clk_get_parent_name()
return a potentially dangling pointer here?

Looking at of_clk_get_parent_name() in drivers/clk/clk.c:

    clk_name =3D __clk_get_name(clk);
    clk_put(clk);
    ...
    of_node_put(clkspec.np);
    return clk_name;

The string pointer is extracted and the reference to its owning object (the
clock or the device node) is dropped before returning. If the node is from a
removed DT overlay or the clock provider is concurrently unregistered, and
this was the last reference, wouldn't the memory backing the string be freed
leaving the caller with a dangling pointer?

> +}
> +
>  static struct kunit_case clk_parse_clkspec_test_cases[] =3D {
>  	KUNIT_CASE(clk_parse_clkspec_with_correct_index_and_name),
>  	KUNIT_CASE(clk_parse_clkspec_with_incorrect_index_and_name),
> +	KUNIT_CASE(of_clk_get_parent_name_gets_parent_name),
>  	{}
>  };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260717-schneider-=
v7-2-rc1-eip201-upstream-v4-0-751547e160e5@bootlin.com?part=3D3
