Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 150F63A1CEA
	for <devicetree@vger.kernel.org>; Sun, 18 Oct 2026 09:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792316831; cv=pass; b=MSLyBsxkG2Sl1ED65BNr1ro0T5qytvd19xzeie3r88MUFUAp6njCOdLc21eQPNAdUvlbIhGdydGT7AGa+fpek6eAOxS71+ZfIrZJDcOWopOSdNqLdpvcaRzG8c9Q/QaoG1ab6lrgCYgMhw3NgIMDHzYU4IKBxotGH77nOX0r6p0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792316831; c=relaxed/simple;
	bh=UN4K3bSJ71N5QveRWSG/7Yxfwh7QELJyj6YausPDmkY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rllU5XxIWklEMaKV4HusyMj0moUjYNwXYwaf9oDcEdAjDaHVim0sd7XUgsdvKWMqBEAWBs9zE2dPDnY8POv0tv8JwqNYKgE3kMGBSn0hPLHzeawkyZ3HUEFc4Ck/l+O9Uy8OIjOV/vH32NmPkWAkVZSNgi0+BygvAVkUXNouY5o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B45DobkT; arc=pass smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B45DobkT"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso2751469eec.0
        for <devicetree@vger.kernel.org>; Sun, 18 Oct 2026 02:47:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792316828; cv=none;
        d=google.com; s=arc-20260327;
        b=GHCae6o+IYgt6Fk6yRGpDJdt4mrCRcPnX8kytGRAqbfcfRT23A+KFPLmUQ2Jg+agTz
         WSzDpSZj5FrT+0sOVygmo3MQmRfc3q/iTdSijORC1I1SiRCq8XcI4/1eqZI8Xf9cyqXi
         dG608iLORnz6TWUEIkuQZLEgdPVi8X6xu8kVJ2HQS9Alhu/t8AY8fUF3BaStOSvjnzi5
         C08V5ix+Pew5+pJ1sy47Ptv352cRSw0EnFTjtn6Hpf1R7l8Th35ea2tA3InJZleSKbQS
         Y9GbojC/wR8UuNC+UdVgX410VW8jStTLLW8DKHKH/fn/toi0l07Kko8FP6bPbEkil0pD
         8hdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wqVM+Dir6IA0H5/+vTX3FKWkOia/C6P0aBNw671rlPo=;
        fh=mxtIawqadGCY9cEHYbOslGb90z3ttYNjfpipWME88o8=;
        b=KMHUjY7Xijs7u1O84Io1D/wALxWw/x1nTeGRvpN2DGYoOu4uK8zI5HsSrQNEhRZZgt
         1FcJC3JcqMyICt108GtXZnHZTxQH5CrrEnraSRyXTxIKLbXiWfJzqMgpSBL/mAib+gpp
         qnuGUMrTxm5qOEN2LNtv2wVG9UA9lNgYt9KJDIUx4EtCyAXqfwtiDQgvehPu/X0l4Wu6
         EU2ijkiapqXMRnVW58fsA9bNco54SkA8MhYa+lJaSJ0BV87JQFTKv5GmrR5FEYcWUyTg
         2F6pPmS1wCtjcgTWmNXNgfWn+/JJu7jtPfVpSs3BnTFcCHWAL2V45rQYP4yQMOPZPVTf
         +kMw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792316828; x=1792921628; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wqVM+Dir6IA0H5/+vTX3FKWkOia/C6P0aBNw671rlPo=;
        b=B45DobkT2Ehurn+wtKbSROEhuInigesGjK50GxYZku1+PBqB5fylY7jC9xORlvFePQ
         dRwE7DnZ/o28SyItZRe0H+UbBo+p7cS4g4doqPxKk/Cuy9pqjO7PwrYEyj8sor8oIbzJ
         uGij4+rij8X3O1x8POiF5pE63p5+gdAM8C69OuWytWp0ojfd1b4DaOqZDdw+9PAbrYX6
         zmbb/LT7VI81119Qikf9qcUjcJiSiKwWOoLJ+BalB2Eje7UmEqS+6/9IWsy6VeODwNvG
         yFe4UfCw2lL1jLaVp4AabvYnkZG+iBbUoxewyKipeoF4WBw+XphHGqxJy99PFKauSHHw
         HFMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792316828; x=1792921628;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wqVM+Dir6IA0H5/+vTX3FKWkOia/C6P0aBNw671rlPo=;
        b=0XOWT4C1EIDLSE9mfNqv2obC36iNLVZKuOahVbROnzW3iH/IPUiiDTBHluDtlp2Tvz
         y+UIOTDiBIKt3PgRJ6KacLbmjPG8ydsnp33kxaq5vx9Pzj3VOdMSncq3cp/A9xKI+xBL
         5JiciwKEu+bwoBLuD6exSXYmbB5gyXjRZ78y6UmEp6iIkRr9vpjtlbxpS5TfEm8gBccz
         YIyCHfocrkOGaSMCRTMS+bIuBF82AWVaGPP6Mq/v8nj+IA4uNVpvaZdm2H8go/GqlZcH
         s0vvB5r6X0Rh4P4NNnbkt1pZkZ3hSZmZpGl/mEkVyl/odhwZ4csa9EBblWs/0zfPs1NT
         xoxg==
X-Forwarded-Encrypted: i=1; AKwUvByPiQo/PegN0/Jy3PIlt3Vc0+YhjA0lBCP7ZSgbZRNLIHiH9bTtC1tFqpC/NGbi0ZkXmEXf3YqRWUMl@vger.kernel.org
X-Gm-Message-State: AFq9FYIaVCGFx4ZSGNG9koTr+KtxxcaIYmDOLKD/iC45rJc2lrfBWIl2
	Cd2ZLZiYWGKgC7Sx1s9HvxamGMtKG6n2Q7O8hZobBCbYls4dt2uaJtFaVciBDvgW4OiiBANjBFD
	W8pAOI7RejgzrX418G/mFTrFRp4kL4h0=
X-Gm-Gg: AYBFou2e82L++5E6HzKhIN6+qx/sWcfqJCKDgnvx1QM9RkR3iRghalh95Ms5UMY44lQ
	+2OFh2sQ5szd1javfzM3lGzrUkWbkZ+dQfzjbQJ0DbaXPLuhAsiiUrqdtvOtbS0mFo25zZvby6y
	VYqZOqA8wjl/D3tozg5+lKWD0geUojI1DRcPHiVh0ih6xh+lbkLV+2Vf7j12MZTsUhUodLyI7Ee
	idv2IYGcr5RLsok4bUa30E2z8I7FcnvNvTFXCU4hETjTOsYacxsDXU1KlEsK2fx9c9NX3TB+Tkl
	l8lYfavnGZ1fy/fo7hwbSlji80E21lCkQIxjeKy02zitczsEby53eO6UW9QSnblTEb1ghY0cuew
	16r0SEaJ4gAl/gwps/9xPlzZZOohyKR3PO5gtLCkMutY5MxDJhQQ=
X-Received: by 2002:a05:693c:860a:10b0:351:727d:b9c2 with SMTP id
 5a478bee46e88-361a18634bcmr7945595eec.17.1792316828034; Sun, 18 Oct 2026
 02:47:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261011231340.42885-1-kimjinseob88@gmail.com> <20261018010201.4b427c3c@jic23-hlaptop>
In-Reply-To: <20261018010201.4b427c3c@jic23-hlaptop>
From: Kim Jinseob <kimjinseob88@gmail.com>
Date: Sun, 18 Oct 2026 18:46:56 +0900
X-Gm-Features: AclHuK9u8xRFkOblgjIxx2Du_9jPdrJ4Qhw268FvpslDoMIezVpcmynAFFby9aY
Message-ID: <CALMSewJZbDbEe28v9VJ7sfTTNVJfvfcryS=0gpARAvc7g3MP8w@mail.gmail.com>
Subject: Re: [PATCH v11 0/8] iio: add Open Sensor Fusion UART support
To: Jonathan Cameron <jic23@kernel.org>
Cc: linux-iio@vger.kernel.org, dlechner@baylibre.com, nuno.sa@analog.com, 
	andy@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	neil.armstrong@linaro.org, andersson@kernel.org, 
	prabhakar.mahadev-lad.rj@bp.renesas.com, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, corbet@lwn.net, skhan@linuxfoundation.org, 
	rdunlap@infradead.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jonathan,

I investigated the review comments on the two pending OSF KUnit patches.

The revised Kconfig allows the tests to run when OSF is built as a
module, using the existing composite driver without exporting internal
symbols.

I validated the following configurations:

OSF=3Dy, KUNIT=3Dy

OSF=3Dm, KUNIT=3Dy

OSF=3Dm, KUNIT=3Dm

All configurations used the enabled KUnit test selector. The existing
16 core and 2 IIO tests passed, including actual module load/unload
testing.

I also added deferred mutex cleanup for the pending-session, receive
and IIO test fixtures, and strengthened the producer/configuration
synchronization. The relevant cleanup paths were validated, including
assertion-abort cases.

The unregister concurrency test depends on mainline commit
84bb0fc46ccf, which is not yet in jic23/testing. I therefore ran that
test on a separate integration tree containing the fix.

I have prepared and validated an updated, signed two-patch KUnit-only
series based on the already applied OSF driver patches.

Since you mentioned wanting to review the KUnit tests further, would
you prefer that I send the updated two-patch series now, or wait until
you have completed your review?

Thanks,

Jinseob


2026=EB=85=84 10=EC=9B=94 18=EC=9D=BC (=EC=9D=BC) =EC=98=A4=EC=A0=84 9:02, =
Jonathan Cameron <jic23@kernel.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> On Mon, 12 Oct 2026 08:13:32 +0900
> Jinseob Kim <kimjinseob88@gmail.com> wrote:
>
> > This series adds a UART/serdev receiver for the project's fixed OSF
> > Device-to-Host 0.0 protocol. Complete capability snapshots create IIO
> > accelerometer, gyroscope, magnetometer and temperature devices with RAW=
,
> > descriptor-derived SCALE and initialized buffered scans.
> >
> > The receiver validates the fixed OSF0 envelope, CRC and exact known
> > message lengths. Equivalent capability reports are idempotent; changes
> > to a bound supported inventory fault the session until explicit rebind.
> > IIO samples use host timestamps.
> >
> Hi Jinseob,
>
> I'm going to do something a little unusual which is more about the time
> I have available today and desire to look more closely at your unit tests
> to learn from them.  So for now I'm just going to apply the driver (so
> patches 1-6) and leave the last two on list and in patchwork as still nee=
ding
> review.  Hopefully I will get time to circle back to them later this
> kernel cycle!  In general I'm keen to get broad testing into IIO so
> want to learn from what you have done there.
>
> Jonathan
>
> > Changes since v10:
> > - Move OSF under drivers/iio/sensorhubs/osf/ following review.
> > - Use the OSF GREEN compatible with the generic OSF fallback.
> > - Clarify complete capability-report snapshot semantics.
> > - Use designated decoded-frame initialization and drop decoded reserved
> >   fields while retaining reserved wire-byte tolerance.
> > - Reuse stream reset and simplify core/serdev locking and lifecycle.
> > - Use IIO buffer-mode claims instead of a private buffer lock.
> > - Simplify scan storage and channel declarations.
> > - Fix KUnit worker/device/mutex/resource/completion lifetimes.
> >   Generic IIO self-test extraction remains deferred.
> > - Synchronize KUnit fault observation and configuration completion with
> >   completions and thread joins instead of short polling/deadline window=
s.
> >
> > The IIO buffer teardown serialization issue found during the v10 review
> > was fixed separately and is now in mainline as commit 84bb0fc46ccf
> > ("iio: buffer: serialize buffer teardown with mode claims").
> >
> > This series is based on the IIO testing snapshot fetched for this submi=
ssion:
> > a22dc7ebb21a6bd4c8b63bc2c1dd46a24945aae7
> > Runtime validation used this testing base plus the eight OSF patches
> > and the exact mainline IIO core fix 84bb0fc46ccf6a545b8fdf57cda83770186=
ed8dd.
> > The core fix is not included in this series and must be present when
> > running the series on this testing base.
> >
> > Fresh validation of this source:
> > - GCC and Clang W=3D1 kernel builds; module builds.
> > - osf-core (16 tests) and osf-iio (2 tests), with KASAN, lockdep,
> >   DEBUG_MUTEXES, DEBUG_LOCK_ALLOC, DEBUG_OBJECTS and DEBUG_OBJECTS_FREE=
.
> > - 200 production module load/unload cycles and 200 test-enriched module
> >   load/unload cycles using identical driver/test C sources, exercising
> >   20,000 IIO buffer toggles, scan subsets, timestamps and unregister.
> > - DT binding/style/example/schema checks and IIO Sphinx build.
> > - Clean sequential application and relevant builds of all eight patches=
.
> > Physical board tests were not repeated for this revision.
> >
> > Canonical specification (fixed revision):
> > https://github.com/opensensorfusion/opensensorfusion-protocol/blob/ca9c=
dea1ae550c2b4d6f29f87877adae99470744/spec/osf-d2h-0.0.md
> >
> > The fixed public specification is maintained and adopted by the OSF
> > project. This does not imply Linux maintainer approval of the
> > specification or driver.
> >
> > Jinseob Kim (8):
> >   dt-bindings: iio: add Open Sensor Fusion device
> >   Documentation: iio: add Open Sensor Fusion driver overview
> >   iio: osf: add protocol decoding
> >   iio: osf: add validated stream parser
> >   iio: osf: add UART transport and core receive path
> >   iio: osf: add IIO devices from capability reports
> >   iio: osf: add core KUnit tests
> >   iio: osf: add IIO KUnit tests
> >
> >  .../bindings/iio/opensensorfusion,osf.yaml    |   55 +
> >  .../devicetree/bindings/vendor-prefixes.yaml  |    2 +
> >  Documentation/iio/index.rst                   |    1 +
> >  Documentation/iio/open-sensor-fusion.rst      |   81 ++
> >  MAINTAINERS                                   |    8 +
> >  drivers/iio/Kconfig                           |    1 +
> >  drivers/iio/Makefile                          |    1 +
> >  drivers/iio/sensorhubs/Kconfig                |    7 +
> >  drivers/iio/sensorhubs/Makefile               |    3 +
> >  drivers/iio/sensorhubs/osf/Kconfig            |   27 +
> >  drivers/iio/sensorhubs/osf/Makefile           |    7 +
> >  drivers/iio/sensorhubs/osf/osf_core.c         |  460 +++++++
> >  drivers/iio/sensorhubs/osf/osf_core.h         |   75 ++
> >  drivers/iio/sensorhubs/osf/osf_core_test.c    | 1056 +++++++++++++++++
> >  drivers/iio/sensorhubs/osf/osf_iio.c          |  288 +++++
> >  drivers/iio/sensorhubs/osf/osf_iio.h          |   22 +
> >  drivers/iio/sensorhubs/osf/osf_iio_test.c     |  386 ++++++
> >  drivers/iio/sensorhubs/osf/osf_protocol.c     |  215 ++++
> >  drivers/iio/sensorhubs/osf/osf_protocol.h     |   99 ++
> >  drivers/iio/sensorhubs/osf/osf_serdev.c       |  151 +++
> >  drivers/iio/sensorhubs/osf/osf_stream.c       |  230 ++++
> >  drivers/iio/sensorhubs/osf/osf_stream.h       |   53 +
> >  22 files changed, 3228 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/iio/opensensorfus=
ion,osf.yaml
> >  create mode 100644 Documentation/iio/open-sensor-fusion.rst
> >  create mode 100644 drivers/iio/sensorhubs/Kconfig
> >  create mode 100644 drivers/iio/sensorhubs/Makefile
> >  create mode 100644 drivers/iio/sensorhubs/osf/Kconfig
> >  create mode 100644 drivers/iio/sensorhubs/osf/Makefile
> >  create mode 100644 drivers/iio/sensorhubs/osf/osf_core.c
> >  create mode 100644 drivers/iio/sensorhubs/osf/osf_core.h
> >  create mode 100644 drivers/iio/sensorhubs/osf/osf_core_test.c
> >  create mode 100644 drivers/iio/sensorhubs/osf/osf_iio.c
> >  create mode 100644 drivers/iio/sensorhubs/osf/osf_iio.h
> >  create mode 100644 drivers/iio/sensorhubs/osf/osf_iio_test.c
> >  create mode 100644 drivers/iio/sensorhubs/osf/osf_protocol.c
> >  create mode 100644 drivers/iio/sensorhubs/osf/osf_protocol.h
> >  create mode 100644 drivers/iio/sensorhubs/osf/osf_serdev.c
> >  create mode 100644 drivers/iio/sensorhubs/osf/osf_stream.c
> >  create mode 100644 drivers/iio/sensorhubs/osf/osf_stream.h
> >
> >
> > base-commit: a22dc7ebb21a6bd4c8b63bc2c1dd46a24945aae7
> >
>
