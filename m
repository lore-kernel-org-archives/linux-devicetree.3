Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE5933B6377
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 07:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784531422; cv=none; b=BXoRpb5xEw63Zsl6l8Wa6nlqEsCWXNMmPXWECvq6BbATpxID4TNx/Uz+yol0tx8Yj1sRFHpzyZJqFddQHWWxrtdF3UJgRklvd/3UcHbuZGLRJof8Gre16qIxbGAyKpfXbTru5p7BXeE5FcqkQH6yjbgQglVB/Ll//bh89EI+SRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784531422; c=relaxed/simple;
	bh=3uFi+fB3UnKxyCIujJDkwLr6xMhZgDeBX7JUOP4TKxg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Vlmwb8yYU4qjqlpoJBE1HO13Vs3G+FFSxu2CNwDW81pTjcw7twO2xliWtR1M3PZnAYlQafHvrC6XeKgl53oIEGswEyM2E9WlPExAfmAVkW1qgBe+v24cbElQScyjJZvPe0evrajB7ma+dMAnd/nzLZ+ySJDikqwm+bAm4k/DaBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HbnxZZA2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HbnxZZA2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E1C61F000E9;
	Mon, 20 Jul 2026 07:10:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784531420;
	bh=AQMzdqGLnmlarh5Uuhk3aucweDYp/KHh60GniFyw4TY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HbnxZZA2LFptAV3bJjbDD2mljCyyvsl61FknS0bOomH8XsmfYuWHS3uWIgTp0TUUf
	 YitgQ21jmwPicOxJ8INe0YREu3/lU8smc1JlVRRjzc1e1z5TkcvHaBf84iYcwTmzH5
	 58elgOSr/DlFEAHTpIw0qESLRQqcry/LGcj62j/BXuvmHvTIV9aq3n4uG/T5wuHP3u
	 RPwSQ/b3k0IGptVEY63rY9gvuNLTyJDDXE5aq3dwXKnxgB6qCCvyJ0iLjufEFYtgA7
	 crjDlxFqbe3kXl6dRiZ+WoJGcAN/e0nRWiSnCg3C381oXrLFvOkuQjsj+IFvSXsKMS
	 tYf6ECByA9AlA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 4/4] of: unittest: cover /aliases updates from
 overlay apply/revert
Reply-To: sashiko-reviews@lists.linux.dev
To: "Abdurrahman Hussain" <abdurrahman@nexthop.ai>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260720-nh-of-alias-overlay-v1-4-f1e5d9889b30@nexthop.ai>
References: <20260720-nh-of-alias-overlay-v1-0-f1e5d9889b30@nexthop.ai>
 <20260720-nh-of-alias-overlay-v1-4-f1e5d9889b30@nexthop.ai>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 20 Jul 2026 07:10:19 +0000
Message-Id: <20260720071020.4E1C61F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] The test claims to exercise patch 2's logic but bypasses it by p=
assing NULL for target_base.
- [Medium] The test claims to exercise patch 3's logic but bypasses it by u=
sing an absolute live-tree path.
--

--- Patch [4]: [PATCH RFC 4/4] of: unittest: cover /aliases updates from ov=
erlay apply/revert ---
commit 1237920f0bd1d803a084dc2f03f9e63aaf5cd6a2
Author: Abdurrahman Hussain <abdurrahman@nexthop.ai>

of: unittest: cover /aliases updates from overlay apply/revert

This commit adds an overlay and a test runner to verify alias creation and
removal dynamically during device tree overlay apply and revert operations.
It asserts that the alias is correctly added and then removed.

>     exercises all three functional patches earlier in this series
>     together: patch 1's reconfig notifier is what mutates aliases_lookup
>     on apply/revert, patch 2 is what lets target-path=3D"/aliases" resolve
>     to the DT root when target_base is non-NULL, and patch 3 is what
>     rewrites the fragment-internal path in the alias value so
>     of_find_node_by_path() finds the live-tree target. Any one of the
>     three missing turns the middle assertion (get_id -> 99) into
>     -ENODEV.

[Severity: Medium]
Is this description of the test coverage accurate?

As detailed below, the test appears to bypass the logic for both patch 2 and
patch 3. The overlay uses an absolute path instead of an intra-overlay
reference (bypassing patch 3), and overlay_data_apply() passes NULL for
target_base (bypassing patch 2).

> diff --git a/drivers/of/unittest-data/overlay_alias.dtso b/drivers/of/uni=
ttest-data/overlay_alias.dtso
> new file mode 100644
> index 0000000000000..32532c80505a7
> --- /dev/null
> +++ b/drivers/of/unittest-data/overlay_alias.dtso
> @@ -0,0 +1,9 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/dts-v1/;
> +/plugin/;
> +
> +/* overlay_alias - declare an alias inside an overlay */
> +
> +&{/aliases} {
> +	testcase-alias99 =3D "/testcase-data/overlay-node/test-bus/test-unittes=
t100";

[Severity: Medium]
Does this overlay actually test the path rewrite logic from patch 3?

The testcase-alias99 property is defined using an absolute live-tree path
rather than an intra-overlay fragment reference. Because this is already a
valid absolute path, it seems of_alias_create() will successfully resolve it
via of_find_node_by_path() even if the rewrite logic from patch 3 is
missing.

> +};
> diff --git a/drivers/of/unittest.c b/drivers/of/unittest.c
> index e255f54f4d760..a9f4a0bb30872 100644
> --- a/drivers/of/unittest.c
> +++ b/drivers/of/unittest.c
[ ... ]
> @@ -3475,6 +3475,53 @@ static struct notifier_block of_nb =3D {
>  	.notifier_call =3D of_notify,
>  };
> =20
> +static void __init of_unittest_overlay_alias(void)
> +{
> +	const char *path =3D "/testcase-data/overlay-node/test-bus/test-unittes=
t100";
> +	struct device_node *np;
> +	int ovcs_id =3D 0;
> +	int id, ret;
> +
> +	np =3D of_find_node_by_path(path);
> +	if (!np) {
> +		unittest(0, "could not find %s for alias test\n", path);
> +		return;
> +	}
> +
> +	id =3D of_alias_get_id(np, "testcase-alias");
> +	if (id !=3D -ENODEV) {
> +		unittest(0,
> +			 "of_alias_get_id() =3D %d before overlay, expected -ENODEV\n",
> +			 id);
> +		goto out;
> +	}
> +
> +	ret =3D overlay_data_apply("overlay_alias", &ovcs_id);

[Severity: Medium]
Does this test actually exercise the target_base logic from patch 2?

Looking at overlay_data_apply(), it calls of_overlay_fdt_apply() with a
hardcoded NULL for target_base:

drivers/of/unittest.c:overlay_data_apply() {
    ...
    ret =3D of_overlay_fdt_apply(info->dtbo_begin, size, &info->ovcs_id,
                               NULL);
    ...
}

When target_base is NULL, the pre-patch-2 code already resolves
target-path=3D"/aliases" correctly via of_find_node_by_path(). This means t=
he
test might pass and bypass patch 2 entirely, missing the intended test
coverage.

> +	if (!ret) {
> +		unittest(0, "overlay_alias apply failed\n");
> +		goto out;
> +	}
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260720-nh-of-alia=
s-overlay-v1-0-f1e5d9889b30@nexthop.ai?part=3D4
