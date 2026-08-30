Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D57623A16AB
	for <devicetree@vger.kernel.org>; Sun, 30 Aug 2026 18:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788114599; cv=none; b=eshEZa+mnJMsp/fs8/TP/VoRqB+oafh/xNbpNWWSVKezF+rwI1qDqWYU88PXthPLoggtjzQBAwxqUDXN0h6sFxcaZG2oFuC7MpByAid1sJ/L8neEMSqVwYLWJSPB1fbRM8WUoeNoKeJr7DKz2TwmTQkYDN9hlaQu6iMvx03GtDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788114599; c=relaxed/simple;
	bh=xi674D62beioQOgA9UvJ/BBKWUh2SR0FlqhBDxlRaog=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Uk0Z2fI/4t7YX1zuh2BpsjvbzlI70s38bBcNG4GzA7irAO3qK2drA0pUVLD67RG1BsborLb/6vMZnrYs12794GyhhYBV040r+ZxTnelV29iW2LHkZxDudxk8NiqBBux6HqM34TJHVaP4mdRci+gAibm/NUk0yl9llChHRUvD0Ec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O4K+RBx6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O4K+RBx6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43FC81F000E9;
	Sun, 30 Aug 2026 18:29:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788114598;
	bh=kkNn6CbfSLzD9OnYWut/0okU7g3jOVtE0IUtLQuhjTc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=O4K+RBx6AZRvnhCywmsuoA/yqgwulRIElpqQ6LHk2V+gZlrcByV/VmwXeEvfACOsw
	 uxnE3Npl/nEVkaSibmBzAVXlv6OVmdbedjtXhHWEmA93i8IUiKzFoKMC5ChVe3fyVY
	 zsFpV7L02/pTAgnRp3DUyADed9Qq8cpFV+UUgNwjW5rXdWg04feeoAXKxfVAyUMeSj
	 GxyfUChsdYju7wySuwIB7cKY82GW0NmusvpX2mdOuLbCfjrpYSMKSbRj+haKvP/3AV
	 pS4xqMK3q5lHZ9vAIpV5nkogLL0zTiE7CBSNh5vkwjG3WPn0CcO/YxU66e/mztPkS3
	 LkpEiZgieujqw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] dt-check-style: Handle indented fragments in
 indent-consistent
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sven Peter" <sven@kernel.org>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260830-b4-dts-check-fix-v1-2-e7c1b2774730@kernel.org>
References: <20260830-b4-dts-check-fix-v1-0-e7c1b2774730@kernel.org>
 <20260830-b4-dts-check-fix-v1-2-e7c1b2774730@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 30 Aug 2026 18:29:57 +0000
Message-Id: <20260830182958.43FC81F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The error message for indentation mismatch ignores the newly added =
fragment prefix, leading to mathematically incorrect and highly confusing f=
eedback for developers.
--

commit f969e2d48b468cab099652ff63ddd56c43afbb19
Author: Sven Peter <sven@kernel.org>

dt-check-style: Handle indented fragments in indent-consistent

This commit updates the indent-consistent check to account for constant
indentation prefixes in include fragments. It adds the fragment prefix
to the expected indentation and includes test fixtures.

> diff --git a/scripts/dtc/dt-check-style b/scripts/dtc/dt-check-style
> index 2afc05fa66023..f867cb6d80709 100755
> --- a/scripts/dtc/dt-check-style
> +++ b/scripts/dtc/dt-check-style
[ ... ]
> @@ -498,7 +499,7 @@ def check_indent_consistent(ctx):
>          # The indent must be 'unit' repeated dl.depth times, exactly.
>          # NODE_CLOSE lines have depth equal to the post-decrement value,
>          # which matches the indent expected.
> -        expected =3D unit * dl.depth
> +        expected =3D prefix + unit * dl.depth
>          if dl.indent_str !=3D expected:
>              yield (dl.lineno,
>                     'indent mismatch (expected depth %d * %r)' %
>                     (dl.depth, unit))

[Severity: Low]
Should the error message be updated to reflect the newly calculated expected
indentation? Since expected now includes the prefix, printing just=20
dl.depth * unit could be confusing for developers trying to match the
indentation required by the tool.

[ ... ]
> diff --git a/scripts/dtc/dt-style-selftest/expected/dts-fragment-indent.d=
tsi.txt b/scripts/dtc/dt-style-selftest/expected/dts-fragment-indent.dtsi.t=
xt
> new file mode 100644
> index 0000000000000..84ec8eb734688
> --- /dev/null
> +++ b/scripts/dtc/dt-style-selftest/expected/dts-fragment-indent.dtsi.txt
> @@ -0,0 +1,3 @@
> +# mode=3Dstrict
> +bad/dts-fragment-indent.dtsi:9: [indent-consistent] indent mismatch (exp=
ected depth 2 * '\t')
> +bad/dts-fragment-indent.dtsi:10: [indent-consistent] indent mismatch (ex=
pected depth 2 * '\t')

[Severity: Low]
Does this test case intentionally assert the potentially misleading error=20
message? If the message in check_indent_consistent is updated to include=20
the prefix, this expected output would also need to be adjusted.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260830-b4-dts-che=
ck-fix-v1-0-e7c1b2774730@kernel.org?part=3D2
