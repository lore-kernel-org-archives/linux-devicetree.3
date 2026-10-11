Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34754345EBE
	for <devicetree@vger.kernel.org>; Sun, 11 Oct 2026 23:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791761396; cv=none; b=EcU5LbWjnnEokbNEG7rKtU8tCL5WKjurMznN0pXbW9opfU3bsoZngedX2HsKdIEb1TLhc8HBX3BlNBH7327SSkf7CrVxi1vxCOaQKeUIgazNio3jMv1kJmnbUdIPuqJk+jMLSU7GK0DGYduYnG/6HXpMoFyw8wtFkRy6kJrszak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791761396; c=relaxed/simple;
	bh=yLGr5oWYtkFAaFSneRJH2qmZDuEvDHvbVy2zhB0j/Oo=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=r47PO023mE/FnpNCUQBEtS0OfOxZA/YHNkOcvUfkq3+DYRJ+kSZpT1c4WVLdX7JcSNW2aaHYw3jtdy3Q1SNSQbo/5360hIzUQqNumW5jSgX5MV9YgzkGTRloRQdWY6LOoWk+4kdwn6rBFxbSURBm36fGYUKlf/CHj9Gq8wFSCtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oV+0YhRY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oV+0YhRY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9471E1F0089B;
	Sun, 11 Oct 2026 23:29:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791761394;
	bh=26ORxLoZWdWSM7Dx7xk/yJDFEInSVuY+HFgQuUeTO1g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oV+0YhRY4dwJD7BU+4j7vifLQxb4uzpu8VSN9/4f6uHWmyDuBANevKN8hGG8I8KJ2
	 gLkbuyJPzDIdEF7/vZdZChqW1eOtikOZbz4xwPhJiBAfCITvH485tKMPuXNPEbvOMB
	 ep7WTCOuIj5XIZ2/mVQU0Hy/we4fg3ma925x2uTiiKwinU51p4AOmBBsoCxOUzmGMH
	 5ZNcNBpvflCJLAexgeCwNzQ6L2JOBp0d+q0w07T0gRfMu4X8+uLHPGFGyozl9i3SQ3
	 Ekqif+aSta2dYRrODzW8yu2pupRplcGcfBQwVwFkCpiWUnIgBlKDA2NV01N5sHKn83
	 izojfcV8U/kHw==
Message-ID: <sashiko-outbox-167514@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 7/8] iio: osf: add core KUnit tests
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jinseob Kim" <kimjinseob88@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20261011231340.42885-8-kimjinseob88@gmail.com>
References: <20261011231340.42885-1-kimjinseob88@gmail.com>
 <20261011231340.42885-8-kimjinseob88@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 11 Oct 2026 23:29:54 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] kunit: missing mutex_destroy() for dynamically allocated locks
- [Low] kconfig: OSF KUnit tests unnecessarily restricted to built-in modul=
arity
--

commit 168e51876dbdd13bb34af3a59ad653d5632d1c07
Author: Jinseob Kim <kimjinseob88@gmail.com>

iio: osf: add core KUnit tests

This commit adds focused unit tests for the Open Sensor Fusion core, exerci=
sing
capability discovery, inventories, exact lengths, and reserved wire bytes. =
It
also covers sample-cache admission and deferred cleanup routines.

> diff --git a/drivers/iio/sensorhubs/osf/Kconfig b/drivers/iio/sensorhubs/=
osf/Kconfig
> index f955a1f2993d2..316f33be1327c 100644
> --- a/drivers/iio/sensorhubs/osf/Kconfig
> +++ b/drivers/iio/sensorhubs/osf/Kconfig
> @@ -13,3 +13,15 @@ config OPEN_SENSOR_FUSION
[ ... ]
> +config OPEN_SENSOR_FUSION_KUNIT_TEST
> +	bool "KUnit tests for Open Sensor Fusion" if !KUNIT_ALL_TESTS
> +	depends on OPEN_SENSOR_FUSION=3Dy && KUNIT=3Dy

[Severity: Low]
Does this unnecessarily restrict test coverage when the driver is built as a
loadable module?

Since the test object is appended to open-sensor-fusion-y in the Makefile,
it seems it can be successfully built and executed inside the loadable
module open-sensor-fusion.ko.

While it makes sense to avoid OPEN_SENSOR_FUSION=3Dy with KUNIT=3Dm to prev=
ent
link errors, forcing the driver to be built-in reduces coverage on standard
distribution kernels. Could a dependency like depends on OPEN_SENSOR_FUSION
&& !(OPEN_SENSOR_FUSION=3Dy && KUNIT=3Dm) work better here to allow modular
test execution?

> diff --git a/drivers/iio/sensorhubs/osf/osf_core_test.c b/drivers/iio/sen=
sorhubs/osf/osf_core_test.c
> new file mode 100644
> index 0000000000000..fabf19018b200
> --- /dev/null
> +++ b/drivers/iio/sensorhubs/osf/osf_core_test.c
> @@ -0,0 +1,1056 @@
[ ... ]
> +static void osf_test_unregister_pending(void *data)
> +{
> +	osf_core_unregister_iio(data);
> +}

[Severity: Low]
Does this custom teardown path miss a call to mutex_destroy() for the
pending device's latest_lock initialized during osf_core_init()?

Since KUnit will automatically free the allocated memory for the pending
device at the end of the test, leaving the active mutex undestroyed can
leave stale pointers in the lockdep tracking structures, causing debug
splats when CONFIG_DEBUG_MUTEXES is enabled.

[ ... ]
> +static void osf_session_fault_buffer_race_test(struct kunit *test)
> +{
> +	struct osf_test_context *ctx =3D test->priv;
[ ... ]
> +	race =3D kunit_kzalloc(test, sizeof(*race), GFP_KERNEL);
> +	KUNIT_ASSERT_NOT_NULL(test, race);
> +	race->ctx =3D ctx;
> +	mutex_init(&race->rx_lock);
> +	init_completion(&race->started);

[Severity: Low]
Are we missing a corresponding mutex_destroy() for the dynamically
allocated race->rx_lock before the test finishes?

Similar to the issue above, the race object is managed by kunit_kzalloc()
and will be automatically freed. Freeing active mutex memory without
destroying it could trigger lockdep warnings.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261011231340.4288=
5-1-kimjinseob88@gmail.com?part=3D7
