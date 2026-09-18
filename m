Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3B8B3E51EF
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 19:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789758602; cv=none; b=D9OcKI3IQiTpL0d2R9DfxtAtfB9ONJ5UPslEh9RrxRbJztvzk3X7KnaDWGXrZBAHN5mRnDY2l2vv+I7wTJ0AXMUEcTgVjgp/H2jW3zz7gMwugagp3pRLuU4gkzwP+Qj1HKkBH1g2Esu4gLSymg+W9C6TOF8KIcgvWOFoXJlZ4Q0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789758602; c=relaxed/simple;
	bh=KdrLgBwU7uj2sUXBv87SAmq+OyoVBck1B3UA03FFKQY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=F1woy0e4k3UCPxKFwUsA2glcmOeA3YYNpUf6Utx0VAwt0RpuhC6SDeSSlIIXegXMUrnnx1EULkqlgOZT98w3b48U4sIJIOwvBWzJgI7LDA7cyjVBPcBCZy6hmIx9e2zRD7ez+knL7oI0Ym9jds8VAhKNfpvF55RjGosPh1Ui9kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P27YbsTu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P27YbsTu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 515801F000FF;
	Fri, 18 Sep 2026 19:09:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789758594;
	bh=c15SYXO8JddCkvWIpSGAmGglA27HmapJz+oadvRClCI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=P27YbsTuFXSDzkJ/Pyp3eUPZUU8kV2rLk0MpKURVdzthX7tsS2okYZYc0ATe0EZaU
	 aHE9Tn03qvG5my5hBkdtrrfmW/mVk8lhd7OKgpcp4bPMEcQ7F0zpAVnN+uHUzNHiMa
	 pdn3MRs3rEaMMJfwEzhwkiz8FffyXpIBgS+fpTt/nHUa7YqaEazQ1tJZGCz85mZF9f
	 C3Baw5xy0vaDe0oio2oPJKi0iO3SR4ZOOpCYDPIBI3hCdmpM6+fi/rQDkPVEz40Gjs
	 kR1CxI6NDQepPl9Bc2RP5QMCDVVMp3T2xXLoftG2XwiovuFlyb4vSBm6OEgm30rgIg
	 xKpWE/KMstelw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 7/8] iio: osf: add core KUnit tests
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jinseob Kim" <kimjinseob88@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <6915383a4a73b680e357d1a75106e0cf6e413084.1789753020.git.kimjinseob88@gmail.com>
References: <cover.1789753020.git.kimjinseob88@gmail.com>
 <6915383a4a73b680e357d1a75106e0cf6e413084.1789753020.git.kimjinseob88@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 18 Sep 2026 19:09:53 +0000
Message-Id: <20260918190954.515801F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] kunit: UAF in osf_session_producer due to missing kthread lifecy=
cle action
- [Medium] kunit: mutex re-initialization in osf_test_new_session
--

commit b82aa72688edb8c728c31226b6fec70af9389122
Author: Jinseob Kim <kimjinseob88@gmail.com>

iio: osf: add core KUnit tests

This commit adds core regression test cases for frame handling, sample-cache
admission, and other operations for the Open Sensor Fusion IIO device.
It introduces KUnit configuration and build wiring to exercise these paths.

> diff --git a/drivers/iio/opensensorfusion/osf_core_test.c b/drivers/iio/o=
pensensorfusion/osf_core_test.c
> new file mode 100644
> index 0000000000000..d96753ab2a458
> --- /dev/null
> +++ b/drivers/iio/opensensorfusion/osf_core_test.c

[ ... ]

> +static void osf_test_new_session(struct osf_test_context *ctx)
> +{
> +	osf_test_cleanup(ctx);
> +	osf_core_init(&ctx->osf, ctx->dev);

[Severity: Medium]
Does this code trigger a debugobjects warning by re-initializing an active
mutex?

osf_core_init() performs the following operations:

drivers/iio/opensensorfusion/osf_core.c:osf_core_init() {
	*osf =3D (struct osf_device) {
		.dev =3D dev,
	};
	mutex_init(&osf->latest_lock);
}

By wiping the osf_device structure and calling mutex_init() again on
latest_lock without first calling mutex_destroy(), this can cause debugobje=
cts
to emit an init active warning.

Could a cleanup of the old mutex be added, or the re-initialization avoided?

> +	osf_core_start(&ctx->osf);
> +	ctx->indio_dev =3D NULL;
> +	ctx->buffer =3D NULL;
> +}

[ ... ]

> +static void osf_session_fault_buffer_race_test(struct kunit *test)
> +{
> +	struct osf_test_context *ctx =3D test->priv;

[ ... ]

> +	producer =3D kthread_run(osf_session_producer, race, "osf-session-test"=
);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, producer);

[Severity: Medium]
Can this kthread leak and cause a use-after-free if the KUnit test is abort=
ed
prematurely?

If the test is aborted due to a KUnit timeout or an unhandled signal, the
manual kthread_stop() at the end of the test will be bypassed. The KUnit
framework will then free the race structure, but osf_session_producer will
continue running in the background.

When the background thread subsequently accesses race->rx_lock or race->ctx,
it will access freed memory and potentially crash the kernel.

Could kunit_add_action() be used to guarantee the termination of the kthread
during test cleanup?

> +	KUNIT_EXPECT_NE(test, wait_for_completion_timeout(&race->started, HZ), =
0UL);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1789753020.gi=
t.kimjinseob88@gmail.com?part=3D7
