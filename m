Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AE99331EC0
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 13:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788182014; cv=none; b=ZVGDt8vR3G5YF4GfIrRubbbgtwZ1AyZFdmfhrXMPdTeLtudmvQDtzIsVtDK64/3hxCfMvdDpepKQZwmbWjlI3VCczwki4x/a2R3o/Cn93P0wl32GmYyNsPEzUX22ZAIZyPOZPth+C80Oif7+J8gqOx+u+7jOlsPC1alEOWXX9Cc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788182014; c=relaxed/simple;
	bh=0rDXFLOnw+spkaY01dmAsiOeo6vrKggkDa4ELKDWYqY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ZtCubQMBjFnyjVndBVJy7WY8efRGw0MocBc2y7x/0Y54yBSlm/o+gdjSlNJyvNfdm8tCd7kzHAw/pybEZaOaMWr0upGCtL1TrlGlC2gYhCeSPl9cDwyUY5cmZrY1dCFJFbdNMzR8NBZw6F6Tq6aNH0/31fFI5tILz1A+CfEtE84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dz0qU8RV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dz0qU8RV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD26A1F000E9;
	Mon, 31 Aug 2026 13:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788182013;
	bh=TXi0mTZJNumQSoCL+7QRJmoHp0H8DR/NeBzMwZZqqso=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dz0qU8RVKhIsZ3GluLVJxVWDacJVs7IMGDhXB+Xq0eUfqfe5c8JAZXlqNvRdbgdf+
	 QViE53nwokt6NXyeUk44swerNqYQIvZA1dmMcO+iTNw5BcGkPBFyJcKQBL4qKBoiyJ
	 2H+F3s/vwYn6vA+9TuTNNYkK6F1Ln8Aakmkm4XMkDzt1FUUaaqSh1yQ+6YBDZLyP26
	 Bf2NGmlCp1c3Msgg+cubd2Z6ueNj1ARAs82+S/G51TVxXhjCivXZanjo/zjgoiA+N+
	 yn6bQ5grqhSHttySNakeMph3HFM4V9r4Wfx0TgP5Lzt9itG8EwjUlIt+B1F+TN1162
	 rtyRwXYtJwD+g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v24 3/4] crypto: spacc - add spacc autodetect support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pavitrakumar Managutte" <pavitrakumarm@vayavyalabs.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260831123113.870832-4-pavitrakumarm@vayavyalabs.com>
References: <20260831123113.870832-1-pavitrakumarm@vayavyalabs.com>
 <20260831123113.870832-4-pavitrakumarm@vayavyalabs.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 31 Aug 2026 13:13:32 +0000
Message-Id: <20260831131332.AD26A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Missing memory barriers when locklessly communicating job completi=
on state and error code between the interrupt handler and probe thread.
- [Medium] Valid AES algorithms (AES_CFB, AES_OFB, AES_F8) are silently dis=
abled in autodetect mode due to missing test vectors.
--

commit 98356c1a6a36e9a2fc851d26cc76a6db9ee5514b
Author: Pavitrakumar Managutte <pavitrakumarm@vayavyalabs.com>

    crypto: spacc - add spacc autodetect support
   =20
    SPAcc is configurable and it supports the below modes:
    1. AUTODETECT configuration - Autodetects the supported algos.
    2. Static configuration - The algo support is defined statically.

diff --git a/drivers/crypto/dwc-spacc/spacc_core.c b/drivers/crypto/dwc-spa=
cc/spacc_core.c
index 910916a1fe000..5d83ceaec4a56 100644
--- a/drivers/crypto/dwc-spacc/spacc_core.c
+++ b/drivers/crypto/dwc-spacc/spacc_core.c
[ ... ]
> 	if ((template[algo_mode] & (1 << keysz_idx)) =3D=3D 0)
> 		return 0;
>=20
> 	if (!testdata[algo_mode].test[keysz_idx].outlen) {
> 		spacc->config.modes[algo_mode] &=3D ~(1 << keysz_idx);

[Severity: Medium]
Does this unintentionally drop support for otherwise valid algorithms like
AES_CFB, AES_OFB, and AES_F8?

Because the testdata array explicitly configures these algorithms with
.test[0].outlen =3D 0:

	[CRYPTO_MODE_AES_CFB] =3D {
		.min_version =3D 0x65,
		.test[0].outlen =3D 0
	},

this check will always evaluate to true and clear their mode bits. This
causes a silent loss of functionality in autodetect mode compared to the
static configuration. Can we add the missing test vectors to prevent them
from being disabled?

> 		return 0;
> 	}
>=20
> 	/*
[ ... ]
> 		 * rest of probe. Accepted deliberately in place of the
> 		 * abandoned-job/UAF risk of giving up early with no
> 		 * hardware cancel available.
> 		 */
> 		wait_event(job->waitq, job->job_done);
>=20
> 		job->job_done =3D 0;
> 		err =3D job->job_err;

[Severity: High]
Does this code need memory barriers when locklessly communicating the job
completion state?

In the interrupt handler, spacc_pop_packets_ex() updates these values witho=
ut
a write memory barrier:

drivers/crypto/dwc-spacc/spacc_interrupt.c:spacc_pop_packets_ex() {
    ...
			job->job_err =3D ret;

			if (spacc->autodetect) {
				job->job_done =3D 1;
				wake_up(&job->waitq);
			}
    ...
}

Because wait_event evaluates job->job_done locklessly on its fast path, can
a weakly ordered CPU (like ARM64) reorder the independent stores such that
this thread observes job_done =3D=3D 1 but still reads the stale value of
job_err (e.g., -EINPROGRESS)?

Would it be safer to use smp_store_release(&job->job_done, 1) in the
interrupt handler and smp_load_acquire(&job->job_done) in the wait_event
condition?

> 	}
>=20
> 	output_zero_len =3D !testdata[algo_mode].test[keysz_idx].outlen;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260831123113.8708=
32-1-pavitrakumarm@vayavyalabs.com?part=3D3
