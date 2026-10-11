Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE123364949
	for <devicetree@vger.kernel.org>; Sun, 11 Oct 2026 23:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791761972; cv=none; b=pVdg4eznbZ74apV+gENlvN+LsW5QjTfeOizKBrPd3UkdokjHYFCv3F51Mtn+/59qp/eTv8FMhdH7KofSXOAmqfF+LXgnRfPmOGxCF41uQy0FOMfSOGzSKTxRyPSuhrV1vKl1d1t5fFkG0kBhLVMrYl+0184tv/+GoFuhysRRvhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791761972; c=relaxed/simple;
	bh=Fh6xgmtXMeEgKeeM2tckh2hC3ODki44UPEmL3B1sIzs=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=t0XjKokS96tluzHtFUoSIUnhSoXRORUWrhiYrecix76CabVt3nbf0cY8e6/76+B88uGrpor49oJTpI8lgyG2PZSOUJe5I8YO5vmlaCFsP6wtS0ZxbvCg0p4/MQZVDN1ISS+hvYfhkJ6oX26uLOy0lBequ7R+Y8+wcqRHs28bq4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iPGiM8WX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iPGiM8WX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31A0C1F0089B;
	Sun, 11 Oct 2026 23:39:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791761971;
	bh=mMRq2b0fdr3ZsRHe/TB9UkxEkGN+QscQbgvWJPeoZrU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iPGiM8WXW3wx9Yc9JL5+4BAxBd4jC5iSuNPGhJ2nYuN0QUNU32arynQNJcqh+PRVq
	 joDgi2UIrVpdmRFhRgCqFGw+QiR6LZOkiHotGS1v9I3L5mrhEgcz0/em9WqSTCCEC3
	 NKRGEAMM9CtWuww7vZMvkHzZ1XnUxn6XN67FH3J1mMz6Z3JKypgDopQmB8lnieXGAf
	 1+znYRjGhvt9dDopFxIzdJxSwh0S/gjnboWAcDe1udjNlYKYpf1Fh/sGeXl+uwdh1I
	 QvuAqKQwkn6G1Xa44rVuG6aQU9v8bgJ7IZXP8cNIbQpwVt32hD+wVsHrbOznTCkBKC
	 23tX6OkKjX8AQ==
Message-ID: <sashiko-outbox-167517@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 8/8] iio: osf: add IIO KUnit tests
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jinseob Kim" <kimjinseob88@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20261011231340.42885-9-kimjinseob88@gmail.com>
References: <20261011231340.42885-1-kimjinseob88@gmail.com>
 <20261011231340.42885-9-kimjinseob88@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 11 Oct 2026 23:39:30 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] iio: osf: KUnit test hangs kernel due to invalid assumption about =
unregister serialization
- [Medium] iio: osf: KUnit test osf_iio_buffer_lifetime_test fails due to i=
ncorrect locking assumption
--

commit ca6325902957e47173f8e4aee82de054cadca7cd
Author: Jinseob Kim <kimjinseob88@gmail.com>

iio: osf: add IIO KUnit tests
   =20
This patch adds KUnit tests for the Open Sensor Fusion core sample
acceptance, direct-read cache, and IIO buffer paths. It exercises
active-scan packing, timestamp alignment, and producer quiescence
during buffer reconfiguration and unregistration.

> diff --git a/drivers/iio/sensorhubs/osf/osf_iio_test.c b/drivers/iio/sens=
orhubs/osf/osf_iio_test.c
> new file mode 100644
> index 0000000000000..4c3fd8cfb2b26
> --- /dev/null
> +++ b/drivers/iio/sensorhubs/osf/osf_iio_test.c
> @@ -0,0 +1,386 @@
> +// SPDX-License-Identifier: GPL-2.0-only

[ ... ]

> +static void osf_iio_expect_quiesce(struct kunit *test, struct osf_iio_ra=
ce *race)
> +{
> +	struct iio_dev *indio_dev =3D race->indio_dev;
> +	const unsigned long *scan_mask =3D indio_dev->active_scan_mask;
> +	unsigned long mask;
> +	unsigned long waited;
> +	int ret;
> +
> +	KUNIT_ASSERT_NOT_NULL(test, scan_mask);
> +	mask =3D *scan_mask;
> +	race->config =3D kthread_run(osf_iio_test_configure, race, "osf-cfg-tes=
t");
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, race->config);
> +	ret =3D kunit_add_action_or_reset(test, osf_iio_stop_config, race);
> +	KUNIT_ASSERT_EQ(test, ret, 0);
> +	KUNIT_EXPECT_NE(test, wait_for_completion_timeout(&race->config_started=
, HZ), 0UL);
> +	waited =3D wait_for_completion_timeout(&race->config_done, msecs_to_jif=
fies(20));
> +	KUNIT_EXPECT_EQ(test, waited, 0UL);
> +	/* The blocked OSF push owns the mode claim until its store returns. */
> +	KUNIT_EXPECT_TRUE(test, iio_buffer_enabled(indio_dev));
> +	KUNIT_EXPECT_PTR_EQ(test, indio_dev->active_scan_mask, scan_mask);

[Severity: Medium]
Will these assertions fail unconditionally?

The test assumes iio_device_unregister() blocks on mlock while the
producer is active. However, iio_device_unregister() only takes
info_exist_lock, not mlock. It proceeds directly to disable all buffers
and nullifies active_scan_mask immediately, which would cause the
timeout assertion and state assertions here to fail.

[ ... ]

> +	/* Publish the completions to the producer's fully ordered atomic_xchg(=
). */
> +	atomic_set_release(&race->block_store, 1);
> +	KUNIT_EXPECT_NE(test, wait_for_completion_timeout(&race->entered, HZ), =
0UL);
> +	race->unregister =3D true;
> +	osf_iio_expect_quiesce(test, race);

[Severity: High]
Can this sequence cause a kernel soft lockup?

When race->unregister is true, the test concurrently triggers
iio_device_unregister() while the producer is actively blocked pushing a
sample. Because iio_device_unregister() does not block on mlock, it removes
the active buffer from buffer_list using list_del_init().

When the test unblocks the producer, it resumes in iio_push_to_buffers()
inside list_for_each_entry(). Since the buffer was removed with
list_del_init(), its next pointer points to itself, creating an infinite
loop.

> +	kunit_release_action(test, osf_iio_stop_producer, race);
> +	KUNIT_EXPECT_EQ(test, atomic_read(&race->bad_store), 0);
> +	KUNIT_EXPECT_GT(test, atomic_read(&race->stores), 0);
> +	kunit_release_action(test, osf_iio_restore_access, race);
> +	kunit_release_action(test, osf_iio_test_put_device, &indio_dev->dev);
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261011231340.4288=
5-1-kimjinseob88@gmail.com?part=3D8
