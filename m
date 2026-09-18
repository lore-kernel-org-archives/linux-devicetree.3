Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4074148F85C
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 19:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789759701; cv=none; b=gR7+n6taaGKfhH5aPjN1ZQEBmdiX00NTNyJNEiOhJOgJecnYMBKPtEsfE3A4aVIuWdhFHXiKUAjh/wyHEorXvU9WEi29YfxURm6uk3TJcmoPQJelwjIXrJ6R35Sz98RsW7F//wJwrwdjaK6W3+PXWKne6+Q7vtY+2pYajVk9Kxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789759701; c=relaxed/simple;
	bh=6cv/ICuCuoNPSD/MirgQeB2LbKI1BIr2i738Vj7ApC4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=EKBJm4tSuBA1J5ZCYSDzdOFw4aVCFBicaiTPT3VT6h6XuGJK7eDVuyLDe7Ay8g0bR6pFPKeqwdmnc0BLeFqEbG3SpCErJRSUeW+MAhMZsijD3VNWhKV+QSx8gp9BqeAA/4yrpsYiH5EWhZcQlZoP/SJ1AdusILR+XmjCd7+4Inw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cFIVUzL1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cFIVUzL1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D75EF1F000FF;
	Fri, 18 Sep 2026 19:28:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789759694;
	bh=/vV1h+f0GIlzOKYwhhro9otapnXsv3oWAaxIO2pN9jA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cFIVUzL1cme/ZIwg1Fwxn4/uwu38DuRrxGRi0fYF4mvrsSbfUic5XqgyjVLCGgsbk
	 1ZfK39vFrtCzqW4lJMLbncUWqouPOkCRu7pQjqmZorT2Kj8MFgsN/Hb5CzKLS836z6
	 l96/OWeXDm+0Zu0+GVfUfyahh7tMstLLAoDpzqDeMj94/O0IGw8hfyUlv96vxYSHw6
	 qRr61EatGpvu5o1o+31eAY+FCipZr8MxfupBwKri9SXozMhex37nBA0JqiEvJiPiqR
	 AeBzkQasK/zzlYEUSwmuV/U+8nXs0hCK8qbup3Wb9Fc4IisLedYSxTpA9ELEdKiIK0
	 m7XuPne+Gr6lw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 8/8] iio: osf: add IIO KUnit tests
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jinseob Kim" <kimjinseob88@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <59251baa5b1f53a72ac7a09afc334398e2e84db7.1789753020.git.kimjinseob88@gmail.com>
References: <cover.1789753020.git.kimjinseob88@gmail.com>
 <59251baa5b1f53a72ac7a09afc334398e2e84db7.1789753020.git.kimjinseob88@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 18 Sep 2026 19:28:13 +0000
Message-Id: <20260918192813.D75EF1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] kthread: UAF in osf_iio_test_producer() on KUnit assertion failure
- [Medium] mm: missing memory barrier in osf_iio_buffer_lifetime_test() cau=
ses test timeout
- [Medium] iio: memory and device leak on KUnit assertion failure
--

commit 8655dd7dbcb0e7d37056c4f127c9412727c35c55
Author: Jinseob Kim <kimjinseob88@gmail.com>

iio: osf: add IIO KUnit tests

Add the existing IIO active-scan packing and buffer producer lifetime
tests. Extend the test build wiring and help text to cover both suites.

> diff --git a/drivers/iio/opensensorfusion/osf_iio_test.c b/drivers/iio/op=
ensensorfusion/osf_iio_test.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/iio/opensensorfusion/osf_iio_test.c
[ ... ]
> +static void osf_iio_check_scan(struct kunit *test, struct iio_dev *indio=
_dev,
> +			       const s32 *values, unsigned int channels,
> +			       unsigned int mask, bool ts)
> +{
[ ... ]
> +	buffer->scan_timestamp =3D ts;
> +	ret =3D iio_update_buffers(indio_dev, buffer, NULL);
> +	KUNIT_ASSERT_EQ(test, ret, 0);

[Severity: Medium]
If this assertion fails, the test function is aborted instantly.

Since IIO devices and buffers are registered manually using
iio_device_alloc() and iio_device_register(), they require explicit
unregistration via osf_iio_unregister_sensor().

Will bypassing the explicit cleanup permanently leak the IIO device, kfifo,
and associated memory? Should KUnit deferred actions (kunit_add_action) be
used for cleanup instead?

[ ... ]
> +static int osf_iio_test_producer(void *data)
> +{
> +	struct osf_iio_race *race =3D data;
> +	const s32 values[] =3D { 101, -202, 303 };
> +
> +	while (!kthread_should_stop()) {
> +		osf_iio_push_sample(race->indio_dev, values, ARRAY_SIZE(values));

[Severity: High]
If a KUNIT_ASSERT_* check fails elsewhere in the test, KUnit will abort the
test and free the race structure as part of test cleanup.

Because the test aborted, kthread_stop() is never called. Will this leave
the producer thread running and accessing the freed race memory, causing a
use-after-free regression?

> +		cond_resched();
> +	}
> +	return 0;
> +}
[ ... ]
> +static void osf_iio_expect_quiesce(struct kunit *test, struct osf_iio_ra=
ce *race)
> +{
> +	struct task_struct *config;
> +	unsigned long waited;
> +
> +	config =3D kthread_run(osf_iio_test_configure, race, "osf-cfg-test");
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, config);

[Severity: High]
If this assertion fails, the test aborts without stopping the running
producer thread. Can this trigger the use-after-free regression mentioned
above?

[ ... ]
> +static void osf_iio_buffer_lifetime_test(struct kunit *test)
> +{
[ ... ]
> +	atomic_set(&race->block_store, 1);
> +	producer =3D kthread_run(osf_iio_test_producer, race, "osf-rx-test");
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, producer);

[Severity: Medium]
If creating the producer thread fails, the test aborts immediately. As with
the assertion in osf_iio_check_scan(), will this leave the IIO sensor
permanently registered and cause a memory leak regression?

[ ... ]
> +	KUNIT_EXPECT_EQ(test, iio_update_buffers(indio_dev, buffer, NULL), 0);
> +	/* Retain ownership while testing unregister against an admitted push. =
*/
> +	get_device(&indio_dev->dev);
> +	reinit_completion(&race->entered);
> +	reinit_completion(&race->release);
> +	reinit_completion(&race->config_started);
> +	reinit_completion(&race->config_done);
> +	atomic_set(&race->block_store, 1);

[Severity: Medium]
Does this code lack a memory barrier before atomic_set(&race->block_store, =
1)?

The test uses reinit_completion() which performs a relaxed write to x->done,
followed immediately by the atomic_set().

Could the continuous background producer thread observe block_store =3D=3D =
1 and
execute complete() before the delayed reinit_completion() write takes effect
in the main thread?

If the delayed write overwrites the completion status, will the main thread=
's
subsequent wait_for_completion_timeout() block indefinitely and cause a test
timeout regression?

> +	KUNIT_EXPECT_NE(test, wait_for_completion_timeout(&race->entered, HZ), =
0UL);
> +	race->unregister =3D true;
> +	osf_iio_expect_quiesce(test, race);
> +	kthread_stop(producer);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1789753020.gi=
t.kimjinseob88@gmail.com?part=3D8
