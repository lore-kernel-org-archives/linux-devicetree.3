Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4350834D3B2
	for <devicetree@vger.kernel.org>; Sun, 20 Sep 2026 04:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789878191; cv=pass; b=VmOttZHpsxr5e1KfIgLUvCzxyN9+7uxSWf+HEglm48+yKeUbF466nrpIAN4CqHvxofAnInIM/ZsZNMfYIfaGZudycQYDS8MGEyEenG6cVsLYA+sDN1qAolCNpeoBFtAQMFcpGYtpWevxd/+WMcCDK8EH0j//PQaVvAeM+ivAxDw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789878191; c=relaxed/simple;
	bh=AA68aMrswykmX+faf9hL7AMVgYZ0rqnpXfsUi4nLrBM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HhCvyUvHp94u5sreGccKDSt4nGlWmaThLvEl6m3PrgoM9vpwuMoFZqNXvC0Z9jJvOaH9BlFYifnA/OaV1aUEuRjpjwEc3MX1ms1vBtKohVj36PHyVkzbCVIKyyYmp86jNPJmS94QkUwUyzU1ppyPSUHygAZZ3r3/iJmHofZF+Jo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W/dl1CPN; arc=pass smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W/dl1CPN"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d747ec6188so11839115ad.3
        for <devicetree@vger.kernel.org>; Sat, 19 Sep 2026 21:23:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789878188; cv=none;
        d=google.com; s=arc-20260327;
        b=Fttr9zKIG74rpfHRpNGULNYnQbrRQZ0zj3KYgMM90v5CE5O5lc70DGeRkos/PfZWCb
         AHCN+PBOQJJqEMPPIU2vheDXJxmid0dvJoepCkB29fEIs0Wrts8hBYWH78QnUdcy1TJY
         alcgYgij6tPp8n3OZSb/+zlwL5pJ/e9ELdHprzBDbdRl5ndYcdoC7ed/eojkiFICbp8T
         xR6CiPyS8VuQWDBHFp/4KihdCzUk9eIOYJGL9fg1ktpVyJJCOFS8iC2zM9RicnEozU2h
         hv+CBpwCq/sLtYJVZaAdDeDbaVjO+BM0NoH2SRAwEJDt1ELtN2NwrliJ4g2q1JhRyzky
         DFyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CAqXU4QnYGB1y+rl3e3B29iEETQt0S+AEjq312CuHLI=;
        fh=R/QvAQ7KjkL9lj1qWijB/nZARYuDMMUU/6kChQ6Te0k=;
        b=FwRgIH+WBo15gqFJ1Rj+5q5JXlESSRMuF9Y5E8x3W03PGDE66C4/y4d48jd+mSi/re
         1U5q3yEz+XRwfrJINwcpo4NhvctIhmudKT+TikdZKshtUauova8tzF1WSwlRXnOV0yc6
         kbNr3y6C42dfJ19W4jsGJdaDsJdUrBEZWUgwnapDqjNkIPTSy93GeRPZ3TYmjGrH/dSu
         4Rc5reSvzTLva0goyDjq2+Honj5tDwKxPJ9wY1EDX5FNyNomJWf2t8eFz5ctjs6ks6Ly
         1y3Zq/d7Wp9pW9pyKwBUTMxi90yN9ir1TIA34P0fCh4ioPjsCrpWkVb0Wy8mIrOpZkFX
         RktA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789878188; x=1790482988; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CAqXU4QnYGB1y+rl3e3B29iEETQt0S+AEjq312CuHLI=;
        b=W/dl1CPNEowRGf3nXAA45lGXiL+KQ2ugCE38ruHDEMLcYVVQPpQzXcuqDFD8LwpYqx
         L7TJKTCvDRnzusRUkblgZHoeNDscG1CNN+4ijSWJ40OrId1h9TLKeSiUaeqYYHaXDiw8
         u7mlSY14AH4OoiLQJBnDOTFbVQdHhBHsplvfA77JVicBXc6JJj9vClQ2yExMSjRMBGcN
         FTcSmii9uep5OxF9os7/m4eCF7ADQ9QHBNTEoJ6gVCr3srDQuooKYyEl1KkzT6Q0ZFSj
         IfJnDmZnJa4qkS8kfB936vR/JVVUyf1KZPBFy5ZW54JA3H+kEInMT1pEHhuQTQqXnL9U
         CmFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789878188; x=1790482988;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CAqXU4QnYGB1y+rl3e3B29iEETQt0S+AEjq312CuHLI=;
        b=wr5C9NR+xGhyDX0kjJl5M7kl1GoUqRkdvufYqOW6J9y18DGel5aZ3Lnhxti99KITEp
         KMYd/vcbxMPcfzB0JrfvUkWxDVc9drV7sQhQe5wU7cH9pndSOPqqdatZIF8QBdx40V3m
         yi4XK6c8x+50j0xzZoF7Yib13ZR5FQdi+E3hqDCiKjjdN58+OWTKeWl5hwdjooIwTBob
         a8RUdtP2qYuGRc+RxLUSEvKTrimVTxaK29LijbWLheXDFDvSHS4mbiTWbGQAA3UU6/+K
         1FHSQUpAWlHUNXox2ADRyE3ftCbcK+V0V10+L03okELJhEbj5uFxT7Ham2s27UT0UFnx
         fwuw==
X-Forwarded-Encrypted: i=1; AKwUvBxeuwRvkhT0fkLXQG/PW4EWeWUzZBQlEawid8BVzAJNz3ty2ilGnLEjTbL7N/N8LGYp4F5sCAUUZebo@vger.kernel.org
X-Gm-Message-State: AFuF++lzfOseG80YC2jN0dH00UMSRFNcO7W4+wprPk3b3AJUSRsKvpAC
	omf3IfCmJIK7rEQQGOOm0Me+6R2lpzv0lM+2pQQqbpWwGFNMcbvgDhZ69JtESNmPGKF3tvCR/0x
	Pdir40zLx17SuM4hedk4ITD0IY8z95tA=
X-Gm-Gg: AYBFou1yF1ZzI1qipWWp017dGa4Us1tUjNvPhBbVTXMHt7fJCk6yBBY47nTDuGEPIVD
	FT+tLY9ueieKsQF52vtPQZ0+xwCHLI9KoVFmz+JIVtzqJXOJJWih0v9v/OQNE+BI95u9o4rwp3s
	bIaFGqlc6CwiTj78ZHIXzicbRru46Dxl2REWkkUtVUQzQ4OKEAGtHJz5ADs4mm+271aAgGm/8Rw
	BhRXttcDkeiDO1YWSYbLOwG5ti+Ccj8CnsLiW3GeGEBtxCjG0oQjH9vWLAWNzbRefYBDnaAbnzI
	IOMZ3ghmUn+Cc6cN+R1rnqLc1TiiNHN4/MdkmWzJcfgaGAtHDNrG6cpZr79y15aciekbWq5p6YR
	vjM7Ui/2Hz8LZwVNsqYAf1zuuOA243EloU8SoxJS3
X-Received: by 2002:a17:903:2349:b0:2dd:c100:424e with SMTP id
 d9443c01a7336-2ddc10044e2mr49362715ad.50.1789878187454; Sat, 19 Sep 2026
 21:23:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1789753020.git.kimjinseob88@gmail.com> <20260920030512.50f4f988@jic23-hlaptop>
In-Reply-To: <20260920030512.50f4f988@jic23-hlaptop>
From: Kim Jinseob <kimjinseob88@gmail.com>
Date: Sun, 20 Sep 2026 13:22:58 +0900
X-Gm-Features: AcwNN1VuWoGeMmwFK8SO3q72J6yDJn0kccWHOWzv4mbLn2uAKQlLLK8lfaxPlsY
Message-ID: <CALMSewJ4ATy9eZ_GrHs-+Q+9yosiwhu3rtQUfxAbzOmR4R9cNQ@mail.gmail.com>
Subject: Re: [PATCH v10 0/8] iio: add Open Sensor Fusion UART support
To: Jonathan Cameron <jic23@kernel.org>
Cc: linux-iio@vger.kernel.org, dlechner@baylibre.com, nuno.sa@analog.com, 
	andriy.shevchenko@intel.com, linux-kernel@vger.kernel.org, 
	rdunlap@infradead.org, joshua.crofts1@gmail.com, u.kleine-koenig@baylibre.com, 
	julianbraha@gmail.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, devicetree@vger.kernel.org, corbet@lwn.net, 
	skhan@linuxfoundation.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> Any reason not to push it one level deeper and put it under IMUs?
> I'm not that keen to grow the top level menu for this as all the
> other entries are about type of sensor, not one specific sensor.

Yes, I agree that adding an Open Sensor Fusion entry at the IIO top
level is not ideal.

My hesitation with putting it under imu/ is that Open Sensor Fusion is
not intended to be an IMU. The current Linux profile exposes
accelerometer, gyroscope, magnetometer and temperature data, but the
hardware/firmware architecture is a general sensor hub and fusion
device. Other OSF hardware variants can aggregate sources such as
pressure sensors, GNSS/RTK-GNSS, motor encoders and LiDAR in addition
to inertial sensors.

Would drivers/iio/common/opensensorfusion/ be a better fit?

There are already sensor-hub/common implementations such as the
ChromeOS EC sensors and Samsung SSP sensor hub under
drivers/iio/common/.

That would avoid growing the IIO top-level menu without classifying
the device itself as an IMU.

Thanks,
Jinseob

2026=EB=85=84 9=EC=9B=94 20=EC=9D=BC (=EC=9D=BC) =EC=98=A4=EC=A0=84 11:05, =
Jonathan Cameron <jic23@kernel.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> On Sat, 19 Sep 2026 03:24:38 +0900
> Jinseob Kim <kimjinseob88@gmail.com> wrote:
>
> > Specification status: OSF-D2H 0.0 spec-1 has completed project technica=
l
> > stability review, has been adopted by the project owner, and is publish=
ed
> > as a fixed specification.
> >
> > Canonical specification:
> > https://github.com/opensensorfusion/opensensorfusion-protocol/blob/ca9c=
dea1ae550c2b4d6f29f87877adae99470744/spec/osf-d2h-0.0.md
> >
> > Errata process:
> > https://github.com/opensensorfusion/opensensorfusion-protocol/blob/ca9c=
dea1ae550c2b4d6f29f87877adae99470744/errata/README.md
> >
> > Current adoption/publication record:
> > https://github.com/opensensorfusion/opensensorfusion-protocol/blob/0cab=
ccf63ac01d0eb82dd9882739ff58eed4a76c/reviews/publication-record-20260918.md
> >
> > The specification was frozen before adoption/publication, so its embedd=
ed
> > status snapshot is intentionally historical. The dated publication reco=
rd
> > above establishes the current adopted/public state. This is project rev=
iew
> > and adoption, not an external maintainer approval.
> >
> > This series adds the Open Sensor Fusion UART receive path and IIO devic=
es
> > discovered from capability reports. It exposes accelerometer, gyroscope=
,
> > magnetometer and temperature data through RAW/SCALE and buffered scans.
> > Device Tree describes the sensor hub; its individual streams are discov=
ered
> > at runtime.
> >
> > The receiver validates supported descriptors and sample scales, keeps
> > discovery open after empty or unsupported initial inventories, and chec=
ks
> > repeated inventories before allowing new data to use registered metadat=
a.
> > A supported descriptor changing meaning faults the session until an
> > explicit teardown and rebind. Existing v9 cache, scan-layout and buffer
> > lifetime fixes are retained.
> >
> > Based on Jonathan Cameron's IIO testing branch:
> > 69fa76f0af3414cc189c3b0b807cb59e327ecc00
> >
> > Changes since v9:
> > - Publish and reference the reviewed/adopted OSF-D2H 0.0 specification,
> >   errata process and dated publication evidence.
> > - Tolerate reserved padding, validate descriptor/sample scales, keep
> >   discovery open after empty/unsupported reports, and compare repeated
> >   capability reports.
> > - Fail closed on changed descriptor meaning instead of publishing data
> >   with stale metadata.
> > - Add focused KUnit coverage for these lifecycle and validation cases.
> > - Use managed UART/IIO/power teardown and dev_warn_probe() for the
> >   controller baud-rate warning, addressing Andy's probe-path feedback.
> > - Split the former combined UART/core/IIO driver patch into transport/c=
ore,
> >   IIO registration, core KUnit, and IIO KUnit patches following review.
> > - Use validated/unvalidated terminology for framing/CRC results through=
out
> >   the stream/core/transport code, tests and diagnostics. CRC detects
> >   accidental corruption; it does not provide cryptographic authenticati=
on.
> >
> > Prior validation on the identical source tree:
> > identical source tree evidence reused; no builds rerun for DCO packagin=
g.
> > - All eight intermediate apply/config/relevant builds.
> > - Independent transport/core and IIO module link/MODPOST.
> > - GCC/Clang W=3D1 vmlinux and modules.
> > - GCC and Clang KUnit: core 16 + IIO 2, all 18 pass in each run.
> > - Core-only intermediate KUnit: all 16 pass.
> > - ARM64 Image, selected OSF module and Pi4 DTB.
> > - Targeted DT binding/style and IIO documentation.
> >
> > The terminology-only diff was verified mechanically. Wire semantics and
> > data-path behavior are unchanged; the receive diagnostic key is validat=
ed=3D.
> > Hardware testing was not repeated for this terminology revision or this
> > post-DCO packaging audit; previous hardware evidence remains historical=
.
> >
> > Human DCO is complete. No email has been sent.
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
> >  .../bindings/iio/opensensorfusion,osf.yaml    |   52 +
> >  .../devicetree/bindings/vendor-prefixes.yaml  |    2 +
> >  Documentation/iio/index.rst                   |    1 +
> >  Documentation/iio/open-sensor-fusion.rst      |   77 ++
> >  MAINTAINERS                                   |    8 +
> >  drivers/iio/Kconfig                           |    1 +
> >  drivers/iio/Makefile                          |    1 +
> >  drivers/iio/opensensorfusion/Kconfig          |   27 +
> Any reason not to push it one level deeper and put it under IMUs?
> I'm not that keen to grow the top level menu for this as all the
> other entries are about type of sensor, not one specific sensor.
>
