Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793703460;
	b=FafijOZfb4PzbA9md5ae94SSV+IlHUZsSjgdb33eG1g3jesn8XmedkYV1tM2ZoNKoBi8
	 Th233GUvypCcpQes79gyeeD+SluSlTwQTIdD+usIhyDMsXlHvu4/HyaRlutk+dTebT2BV
	 AzPk8OCjGp2zBMy/x96z3OrBcpQMaaFXLP3XvgtZaH9uY4uZLEl+QPIVQgEspTClqhoMG
	 ryvOHNe67uIu7COynTdeqgedEfF9/30pWx0DRzHY+RuogvU7zn4P/N9BmASc49ocR7+gt
	 hmOkGm7ohXGTLVjhMEMDhZuRQXYzYRAH7eZ1SBRLI8h4hAgg9mAE5g8YuUp8zwgJaZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793703460;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=31Qn9FABkN/3b1h4gQ5wD9w3I2E7zevl/SoiAZ7wTuc=;
	b=JVjciDs4bTlRHBdFDEyPyN6IViOeOQoAZh0Xduf+bJ4IrgFOg6+nc2RSYOL5ntnsqhru
	 gcfYYcekOJEP7Tc2qtQAnxBeCuSN14nkLriIuAD8wo1CXHvEpvtA0HMESvYKthbXezqdX
	 eqx8jFTSeHubbmKfidB4mdCLCn3EP9TGYu9/uienvSW9sqjuz8jHxxcVZVrb9sLVhhivY
	 fop5MxZsgEYOvTIPMrpZzpU5SQbG1xpwXNPH5z+gLKRNz483/4RB+YAKzUxX/8TCRWtYv
	 H80+CEuQBfwywXlB6tX0fT2Y0Vii4IPsCZqHNb4tdwCO4Bp9aYAIhPS7zk07kbLLrUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ld7Y9COj;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D508606BF96
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 10:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ld7Y9COj
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 295341F000C1;
	Tue,  3 Nov 2026 10:57:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793703460;
	bh=31Qn9FABkN/3b1h4gQ5wD9w3I2E7zevl/SoiAZ7wTuc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ld7Y9COjZxgft7HhBJi1M9RCGQ9OoKBzfU9Y+VU4J096DAqAxr9ZSEgZsq9fLC4i0
	 oKUCPi6UQShY7Y6wE5G+iynjd+h84Bo38otXyJLqh6oPqiwryvW4Y+xuwXnJRhE8bT
	 +FD7KHyNY6h8DjGXuXDRQRO2703XLnmB1Bw9kA5Uq2hm+h2RVFeKIFRkyTOg8FyMDT
	 vyIZ7sessF6/BLUJ66wY/Hnjc5Yln5RcJSSd5cYsFkOIHLpnrQwNH3eEHcyKY52j8j
	 Ki2//2t/NIysI6XtXVRgrpPOr9s5YztxZfslpY6DAnrNjO4ii4JAYcvq5CJb8zRZof
	 vFHmIwHNPC1KQ==
Message-ID: <sashiko-outbox-195088@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] of: unittest: fix node leak in phandle remapping test
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wentao Liang" <vulab@iscas.ac.cn>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261103104235.1373591-1-vulab@iscas.ac.cn>
References: <20261103104235.1373591-1-vulab@iscas.ac.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 10:57:39 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] of: unittest: leak of p[] nodes in of_unittest_parse_phandle_wit=
h_args_map()
--

commit 76085e24075478d56a6949c4d7365c6d0d60c538
Author: Wentao Liang <vulab@iscas.ac.cn>

of: unittest: fix node leak in phandle remapping test

This commit releases the device_node reference for the consumer node and
adds cleanup for the provider node references when a provider lookup fails
in of_unittest_parse_phandle_with_args_map().

> diff --git a/drivers/of/unittest.c b/drivers/of/unittest.c
> index e255f54f4d760..f240b1175211b 100644
> --- a/drivers/of/unittest.c
> +++ b/drivers/of/unittest.c
> @@ -578,6 +578,9 @@ static void __init of_unittest_parse_phandle_with_arg=
s_map(void)
>  	for (i =3D 0; i < ARRAY_SIZE(p); ++i) {
>  		if (!p[i]) {
>  			pr_err("missing testcase data\n");
> +			while (i > 0)
> +				of_node_put(p[--i]);
> +			of_node_put(np);
>  			return;
>  		}
>  		prefs[i] =3D OF_KREF_READ(p[i]);

[Severity: Medium]
Does this error path still leak device_node references in p[i + 1] through
p[5]?

In drivers/of/unittest.c:of_unittest_parse_phandle_with_args_map(), all six
provider nodes are looked up before the validation loop begins:

	p[0] =3D of_find_node_by_path("/testcase-data/phandle-tests/provider0");
	p[1] =3D of_find_node_by_path("/testcase-data/phandle-tests/provider1");
	p[2] =3D of_find_node_by_path("/testcase-data/phandle-tests/provider2");
	p[3] =3D of_find_node_by_path("/testcase-data/phandle-tests/provider3");
	p[4] =3D of_find_node_by_path("/testcase-data/phandle-tests/provider4");
	p[5] =3D of_find_node_by_path("/testcase-data/phandle-tests/provider5");
	for (i =3D 0; i < ARRAY_SIZE(p); ++i) {
		if (!p[i]) {

If p[i] is NULL for an earlier entry (for example p[0]) while subsequent
lookups in p[i + 1 .. 5] succeeded, unwinding only from i down to 0 leaves
the non-NULL references in the remaining elements of p[] unreleased.

Since of_node_put() safely accepts NULL pointers, should this loop over the
entire p[] array (and update the commit message, which currently states that
the references were acquired by preceding loop iterations)?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261103104235.1373=
591-1-vulab@iscas.ac.cn?part=3D1
