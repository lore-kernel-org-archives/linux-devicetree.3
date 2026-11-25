Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795637305;
	b=WnPoNtPstw0b0+ZFip1vXSQVKUhWFy5bhjwGpMacngnqVKa0dPAfMNLtyk8HfjHUg2r1
	 D4q4ZhU52RaKjoUhf0xrp2FLBBoxcCbPZMXSwPjg3pshxFCB9x0wvEghSUIThzewbf4/3
	 cgre/x47yFh99CI/vEjPbhF67UOjtHI7uIAmAFQRC4UXWGLGPdiDVu4STaB78cRE8bFly
	 zWSOZsu96jGANVzamMQXOi9eDTfMlDXRXxub8CEKctbw5fhlPSJhOxlcJJLWKWXGaMKV/
	 fjD3b2BM00yLl6O9k7NYXsQenVpxI3+2JiVPaxVaksUKzV2nZgnqqaUoH5jR9PboMwA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795637305;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=g2sz6a7NAkW2VwlSH0qJO9zVczZnv9QOUY1IGuEHJjs=;
	b=DGnir8ub7gParulCoZcd5MRE/avsqu2BMCVVSGvPk0wKx6bDcdMs7XW98WblW++jJyWp
	 GJA5WPdckRaOkORVm/k1I8CvZEodMj0SpJGcDAXy+hz4ClngsRx0opCWfEBElQNYyYoj/
	 i8EajV5BzQxR2eaM/3/HNOU7rhMElMiS7MLHEDEIT74WJDk+xzj3+uUMCqfx9U2sc+W25
	 CCw62IHH5XIee4+JETQUYw95Crtwh+7VqimlFWeuTooWPYA2II3bF4qTVmgAcixYfEDlx
	 On4fF2nt4P/n32i5O4soDO/0OTOJRc6L/sFjNSsg9IK8gKhcNPFJMSebJAluQ8qvq8w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=SzdBUQhC;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.180
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18562606A32D
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 20:08:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 18562606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=SzdBUQhC
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-8b4c685c751so55300757b3.1
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 12:08:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795637304; cv=none;
        d=google.com; s=arc-20260327;
        b=d5pJ8oxpr9MRCIpsjX3pAwjEaSvdqV07dq6xp9VYZZh3UyaRKGUJZ60uokQ3/3A0pH
         rts2MBvisx6Ik7soAOxgAg80eXDrVVaNUQc2RzbOcNw2G0xI53DMFCjXvW3TUK7RRprR
         4Q1BYtKenqhDrAWXvSjHA16OyyDOyEFdH0JZvqXW+lKnz1vRj6V6iHI10HVFDeh5Dy42
         UMxBjosdlfkwiQXI0yXqP//w+Ew1HnC/tmccRBFNMl2YkGuo4UolFFkq8f+//JvQha16
         UUHbCq6slevfPsbajh1xIA9UjA19L7RNF3CwHRhaSjeT+aKSK5k8WXkI4ydEifdYJo0J
         P61Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=g2sz6a7NAkW2VwlSH0qJO9zVczZnv9QOUY1IGuEHJjs=;
        fh=DCmPKIol5jzoHn2XftQXmptiB2FP8ujhYpC5Qebz0ag=;
        b=ptjw5tpW+PbgGL5wHkVT8PdQje1iEk5Gjq8nSDb1pRRoDist+aietnvvBgUwlAXlWA
         aGljziOPZJLXnXQsnf7XbVNqowlIuZ5lnMAzj5effE3XDAMwIXbgbjy+fc4DBNXzWy6g
         1vwgGgAReujnLzi4GufOZxCNEVOM3WhedBRaARkBKDLQclV0j9+NeIMSYfyqJdVABz+y
         r+u3mX7fQ+lfKwNKce9fnInwenDB6luecULNbvaUaiAgZq60D7JLHZ+AZDwtkmNFkEQR
         Z48Wk0KRMKZ91B21BSYJJuGm17pFl5pjNLkvpkxGWeKVnMRPQ7jzMs/kOidh+KJgCO54
         Whog==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795637304; x=1796242104; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=g2sz6a7NAkW2VwlSH0qJO9zVczZnv9QOUY1IGuEHJjs=;
        b=SzdBUQhCJqf2b1xmvJdwUTWJRZqYk8KZJTkab1RKCRDByJ/NCF6dGEABYYhrJyGV0u
         RMhn7tlV7TQ0o34p1ttPmZotWI9864QWO4eP7vDQVFFJleUA7H52mGQqkyeswywPh4Q+
         1d/rizLBhCX5iHzBOJxpBmKS9LxW4eNRG1gd0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795637304; x=1796242104;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g2sz6a7NAkW2VwlSH0qJO9zVczZnv9QOUY1IGuEHJjs=;
        b=ZIw/I/NYDybC/wQCaaRD61Ck6NY8mI1HQKqosgDxB4nolrL9qPlrk8VmjunxcOR3HC
         upy9dNwP4pmK2m9ItnacX2kw2g9uZ3mfiiQyQ4nrdBThz+mYpz8gPZzDZ7kDrKzpqVeY
         Aig6k/5f1QBs2Vt2Tb6q6s0CZrC/98/HSkHm2C0nymtPpqSa2bSsXm5c/waSRh7CTF98
         jBbUmhXOQobPpsy29Ba2nVzSeu2F1+i/z89i9rkqF6Kfxh/tj7AByl8J84NVfrOPPwE1
         aQk3knrBQkxyc7YtcxyMh5dtaTGGQtgyEvUb9BYm4+eKS9pc8QE4M5aCXC+gGJV72eZK
         2saA==
X-Forwarded-Encrypted: i=1; AL+hErE/2zl+X8IRImQOg15uy9Www2oEk8i2FFi4kJc1A8D0nmqlOf++TPW1h/8FieDAI583Mw0tXTr4J4db@vger.kernel.org
X-Gm-Message-State: APuU4Z/tKvKRYEO7VjJodTfQujD5G4gRjgQCwjBiphixRhw2uRT8iWHY
	mj9lzEShSTSLWvmXBMZDp9Ax/NB7IoQ0mSY2I2sG/jtXJY3VeM7HYw3cDtu7R6e4vEwOSLnk535
	uMzpk43CjLbldhN5AonjcE63HBjxKXuivSH2JG3x6
X-Gm-Gg: AZFdTZd5oHdxc3rhoSLDMXdKN0g+7ToUmY7ssFYkZMem4NQcWrtfNtJkKEqEl2Nu8/K
	BkGFGZGUfzX4u/bQ45oUpTchFfwhVrkjv9pwa7yj+WAk6Posxo1k+KUR9UrgNYKuZwXwpT7Ed4V
	OPe8ra4Ch3PCZr3chq6RXLsWXbPaJAwG2g7Nn1FX1TdLhrBLNDGOD/99xN5kh0U4c7Mc73puMYx
	JdbYalp/D6HA+3pbd6VomsPR4G5ONkSQGXinXWtHBpXsWgVnKYcqAl3eap8Jc3lr3Mas9IHqKD9
	gvNWWY61+L2EC/i7yJeXuZcBHGCaV3InMG1D1sZfgFftqQ499cmEjX9Wi+72UcnltgFQL5uV75o
	HK5tLO5PK08QEC1H9pxicxsj6WZoDUQ9E558brGRBz9tnT1Y1vyH/83lo059iWhqrhkZF
X-Received: by 2002:a05:690e:128f:b0:67d:c8a9:c607 with SMTP id
 956f58d0204a3-67df447fee9mr7204157d50.58.1795637303877; Wed, 25 Nov 2026
 12:08:23 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261024-send-upstream-v7-0-abad13174b43@chromium.org>
In-Reply-To: <20261024-send-upstream-v7-0-abad13174b43@chromium.org>
From: Jingyuan Liang <jingyliang@chromium.org>
Date: Wed, 25 Nov 2026 12:08:12 -0800
X-Gm-Features: Aa3M54oC0J4hEvF8nL8DG0lKyvPdcHpLfWm3L9Zu9MgNC1XuuWU_i9PXhdfqRu4
Message-ID: <CAEe3GZEWAApD0ZvQX4J5Uo8aajEtpVzg6JsGLqB8GKNv6ug06Q@mail.gmail.com>
Subject: Re: [PATCH v7 00/11] Add spi-hid transport driver
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Mark Brown <broonie@kernel.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-input@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	hbarnor@chromium.org, tfiga@chromium.org, fqwqf@fqwqf.xyz, daleyo@gmail.com, 
	Jarrett Schultz <jaschultz@microsoft.com>, Dmitry Antipov <dmanti@microsoft.com>, 
	Angela Czubak <acz@semihalf.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jiri, Benjamin,

Gentle ping on this series. The DT binding has been reviewed by Rob and
Conor, and I've replied to the outstanding bot review comments.

Please let me know if you have any further feedback, or if there's
anything I can do to help move this forward.

Thanks,
Jingyuan

On Fri, Oct 23, 2026 at 5:51=E2=80=AFPM Jingyuan Liang <jingyliang@chromium=
.org> wrote:
>
> This series picks up the spi-hid driver work originally started by
> Microsoft. The patch breakdown has been modified and the implementation
> has been refactored to address upstream feedback and testing issues. We
> are submitting this as a new series while keeping the original sign-off
> chain to reflect the history.
>
> Same as the original series, there is a change to HID documentation, some
> HID core changes to support a SPI device, the SPI HID transport driver,
> and HID over SPI Device Tree binding. We have added the HID over SPI ACPI
> support, power management, panel follower, and quirks for Ilitek touch
> controllers.
>
> Original authors: Jarrett Schultz <jaschultz@microsoft.com>,
>                   Dmitry Antipov <dmanti@microsoft.com>
> Link: https://lore.kernel.org/r/86b63b7b-afda-d7f4-7bfa-175085d5a8ef@gmai=
l.com
>
> Signed-off-by: Jingyuan Liang <jingyliang@chromium.org>
> ---
> Changes in v7:
> - Drop the error counter sysfs attributes.
> - Print error codes in power up/down failure messages.
> - Reject an empty report descriptor.
> - Check the minimum input report body size instead of max_input_length.
> - Clear reset_attempts only after the report descriptor check succeeds.
> - Drop pending work flags when the error handler resets the device.
> - Don't schedule a reset when GET_FEATURE fails with -ENODEV.
> - dt-bindings: drop the address/opcode properties and the "hid-over-spi"
>   fallback; the compatible determines them.
> - dt-bindings: fix authorship to match the Signed-off-by chain.
> - dt-bindings: update maintainer email addresses.
> - dt-bindings: drop Rob's Reviewed-by because the binding changed.
> - of: use per-compatible match data; match only
>   "microsoft,g6-touch-digitizer".
> - pm: disable reset_work across suspend.
> - pm: check deassert_reset(); schedule recovery on reset timeout.
> - pm: skip hid_driver_reset_resume() when the device is not ready.
> - pm: log power_down() failure instead of rolling back suspend.
> - pm: use dev_err() instead of dev_WARN_ONCE() for a failed device
>   descriptor request.
> - panel follower: start with reset_work disabled.
> - Drop Dale's Tested-by from the OF, PM and panel follower patches
>   because they changed since v4.
> - Link to v6: https://lore.kernel.org/r/20261019-send-upstream-v6-0-cb9ba=
4b3d6fa@chromium.org
>
> Changes in v6:
> - Take output_lock while reallocating buffers in ll_start()
> - Don't drop input reports while a refreshed device probes
> - OF: drop mod_devicetable.h, use named initializers, fix alignment
> - Move the dt-bindings patch before the OF driver patch
> - Drop Tested-by from the documentation and DT binding patches
> - Link to v5: https://lore.kernel.org/r/20261009-send-upstream-v5-0-384af=
01da3ee@chromium.org
>
> Changes in v5:
> - Fix request/response races; match GET_FEATURE responses by report ID
> - Reset the device on response timeout; wait uninterruptibly
> - Validate device descriptor and report lengths; fix buffer sizing
> - Honor rtype in raw_request(); fix GET_REPORT off-by-one
> - Use hid_safe_input_report(); forward input reports only while open
> - Disable IRQ around hid_device teardown; fix a sparse warning
> - Use disable_work_sync() for reset_work in remove()
> - Cap trace copies at 64 bytes; cacheline-align read approval buffers
> - ACPI: select RESET_CONTROLLER, use device_reset_optional()
> - OF & DT: read opcodes as u8, use dev_err_probe(), require reg
> - PM: cancel reset_work on suspend, wait for reset before
>   reset_resume(), fix IRQ imbalance on resume failure
> - Panel follower: fix regulator/IRQ imbalance; depend on DRM || !DRM
> - Link to v4: https://lore.kernel.org/r/20260609-send-upstream-v4-0-b843d=
5e6ced3@chromium.org
>
> Changes in v4:
> - Extended io_lock scope to protect the shid->hid pointer lifecycle
>   against races with the IRQ handler
> - Cacheline-aligned DMA buffers, enforced 4-byte alignment
> - Added error rollback for failed suspend/resume transitions
> - Moved IRQ request to probe with IRQF_NO_AUTOEN (disabled by default)
> - DT Bindings & OF Driver:
>   - Required a device-specific compatible string in the schema.
>   - Added description to explain why opcodes and addresses properties
>     need to be defined in the schema
>   - Added `spi-peripheral-props.yaml` reference and switched to
>     `unevaluatedProperties: false`.
>   - Added fallback to default timing parameters in OF driver if match
>     data is missing.
> - Link to v3: https://lore.kernel.org/r/20260402-send-upstream-v3-0-6091c=
458d357@chromium.org
>
> Changes in v3:
> - Add io_lock init
> - Relocate tracepoints to drivers/hid/spi-hid/ and fix tracepoint macros
> - Add tracepoints for sync, error handling, reset, and report processing
> - Clean up internal includes and fix Makefile CFLAGS
> - Add more details in v2 changelog
> - Link to v2: https://lore.kernel.org/r/20260324-send-upstream-v2-0-521ce=
8afff86@chromium.org
>
> Changes in v2:
> - Clean up DT bindings: fix formatting and remove timing and flags proper=
ties
> - Update DT binding example: use a device-specific compatible and drop
>   reset_assert
> - Simplify ACPI/OF match tables by removing ACPI_PTR/of_match_ptr
> - Refactor OF driver to use match data for timing parameters instead
>   of DT properties
> - Switch to fsleep() for delays in ACPI and OF drivers
> - Drop patch 12 as it is vendor specific
> - Add a lock to fix input/output concurrency race
> - Link to v1: https://lore.kernel.org/r/20260303-send-upstream-v1-0-1515b=
a218f3d@chromium.org
>
> ---
> Angela Czubak (2):
>       HID: spi-hid: add transport driver skeleton for HID over SPI bus
>       HID: spi-hid: add ACPI support for HID over SPI
>
> Dmitry Antipov (1):
>       dt-bindings: input: Document hid-over-spi DT schema
>
> Jarrett Schultz (3):
>       Documentation: Correction in HID output_report callback description=
.
>       HID: Add BUS_SPI support and define HID_SPI_DEVICE macro
>       HID: spi-hid: add device tree support for HID over SPI
>
> Jingyuan Liang (5):
>       HID: spi-hid: add spi-hid driver HID layer
>       HID: spi-hid: add HID SPI protocol implementation
>       HID: spi-hid: add spi_hid traces
>       HID: spi-hid: add power management implementation
>       HID: spi-hid: add panel follower support
>
>  .../devicetree/bindings/input/hid-over-spi.yaml    |   75 +
>  Documentation/hid/hid-transport.rst                |    4 +-
>  drivers/hid/Kconfig                                |    2 +
>  drivers/hid/Makefile                               |    2 +
>  drivers/hid/hid-core.c                             |    3 +
>  drivers/hid/spi-hid/Kconfig                        |   50 +
>  drivers/hid/spi-hid/Makefile                       |   12 +
>  drivers/hid/spi-hid/spi-hid-acpi.c                 |  261 +++
>  drivers/hid/spi-hid/spi-hid-core.c                 | 1698 ++++++++++++++=
++++++
>  drivers/hid/spi-hid/spi-hid-core.h                 |  112 ++
>  drivers/hid/spi-hid/spi-hid-of.c                   |  211 +++
>  drivers/hid/spi-hid/spi-hid-trace.h                |  184 +++
>  drivers/hid/spi-hid/spi-hid.h                      |   45 +
>  include/linux/hid.h                                |    2 +
>  14 files changed, 2659 insertions(+), 2 deletions(-)
> ---
> base-commit: ee9c669f9bf5fd2c24206746ded9382fe810df89
> change-id: 20260212-send-upstream-75f6fd9ed92e
>
> Best regards,
> --
> Jingyuan Liang <jingyliang@chromium.org>
>
