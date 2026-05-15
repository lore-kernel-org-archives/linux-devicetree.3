Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 205D33FBB79
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 15:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778859392; cv=none; b=KwFwmdDO4A5Zba2Ew9FhYdlHrUrYy2qZIiAa3L6U2r4fKjbdGwZTywHlKvcscQBQcJJQ26CMGDqK8BsOMwnG+NkDus85OsW/ilKYPBTVwTPXBw+werXs+IGg6tvQOi/pdpI82mmX+z9szGXPJeTDyXnYC/+EBuC9vna4hCZ5KzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778859392; c=relaxed/simple;
	bh=Ue7Tvvw7GFTqaBvUsscsm3qFYirOrsg+j8q4YjBo1CE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ksHUt14VmMKjbfYcA98Vq54MdUO4VX/XI3bbITrLWpURapbMg7FRa3qsGhaKPQ+vZmPurPVJ0QP7KfY6JQHC35qzLod/dyevDr/PCzj556wLbrJG7LG9HW+xfs2sefSTk0odF9ssC2N12k3CDKm5CuHMY+U6/P2h4QRHYeWuwOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n/NofypE; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n/NofypE"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-67c3cb1433cso16471034a12.0
        for <devicetree@vger.kernel.org>; Fri, 15 May 2026 08:36:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778859385; x=1779464185; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ymIxrmc8NVaPgX08Zo9PR76YEwhybRQaJK3HcXypHmg=;
        b=n/NofypEixIxI4Hbct0To7VQbRDFEBM3uZXNpwdcfzaEmGaVxzmgcONkwVLaa9ciHU
         50EVeEFSjr32FNTaW2TAEUrPTfZ57NXeuEWT4rSO9Vi9pn8Z9kMg0adlqTlGDdtzkn+A
         ZYTW8nkqbOrNoFgdM0HN/HZYZqao5a2fxFpsNVX2u86Rbg5h96kNkovRRjT9VUhl8AQz
         f8vTWhtFSTOJ/zLa4Rq4Bqn5VJHHyHZEaEoZoAGgHDpgVQXPeagaex+U+Vl8+Z+ruAhK
         cgJWAZvqNppsygY6/r/kzLo1OyeTO8/QlQ6glTArp+eiauxYYBQB1Ybm8UOQaqUdcinA
         0myw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778859385; x=1779464185;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ymIxrmc8NVaPgX08Zo9PR76YEwhybRQaJK3HcXypHmg=;
        b=rUHDt92Nab+Z5sDv/K8bJQ1EkfHhPtX2Ug8HgG1eXPdfRIXrDXs6IKuvvKt6tc2wB4
         roxwa9qrxCP7MbLc7hgykixsPSAGi9BpfSmWv5dp+WbWW9Ou0D7b9YHQLdgm92DZBZa5
         HLNuuLFzTbO/qsbZUAGQ00elevO1iuTdAitx5j5WrfEG2OiDNAHZ8Krf2YzbHH/APIDu
         kQJfF0yvzTuDkuvgp5J6V4fdrbjsh52gAydN0pk7/FsPLr6PnElRnN2GQ7ZYIJXQBhhI
         Az9fxYFuDH2ELGgHVwnEmiur58RrdA8+c/Gn/vWyavCXCBid0McKCI8vwjhfZob7NJM7
         6+dg==
X-Forwarded-Encrypted: i=1; AFNElJ+3wBBA+TOUh0NO5UUGBZMSt5DKspv2xGuRtLdLAwY5lkCkly3pehP1ah94IDiaRs7TbF0YyJyatUq6@vger.kernel.org
X-Gm-Message-State: AOJu0Yx61RteubKFn9BZ+JjpXsuqmyfmgl48L3646NUPF5fYGCigztSM
	njk6i5No8nLivgWwYrdc2DfQrJJk1MFpiQTQvs8FwyOYWjOf3kSuKW1p
X-Gm-Gg: Acq92OEJpBpS3Y+A/ZtQGJIG8MJdwstEUdK74YeP00t+JfoDk+7tHpKeY/qFGcMoykP
	L3EYPKlpoEHKckN/JLonoVhdO8Jm/FO5AM03p9VttEZRHuY96vQDrsoI+fFtddcbZZGFnVYvxlV
	wubf1v+68bLFMDKAWLeQ/+5vY1mWHGt8CgZkitQNHKOzZkiuYbMCGxt7ridFrthKtXr4DmHpmln
	/8P6S3NdjnDoUllhev4LnQ6GU7JGvtfYkYSCY87alWXtO/eb3EroIotzlHL3YHUX/JZ+680mwKX
	xC/1gMXCukd/fmR4AaH36IO+Ymxh1LgKKZlRikFpVGbyN+YVaOHWnRAiOwSl4LzKP6qokLUxRcr
	FEdMNaZTe5wcjLbGEYkJ3tAak+nfsZqCX24noK0Ytx2Qn9F/xsInKsw0T71ZKrXDJeb4gYzD2Wg
	==
X-Received: by 2002:a05:6402:148a:b0:67e:2624:b8ab with SMTP id 4fb4d7f45d1cf-683bd682186mr1528958a12.24.1778859385260;
        Fri, 15 May 2026 08:36:25 -0700 (PDT)
Received: from fedora ([2a02:8071:50c5:5c0::6182])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68310d510fasm2205089a12.11.2026.05.15.08.36.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 08:36:24 -0700 (PDT)
From: Wadim Mueller <wafgo01@gmail.com>
To: William Breathitt Gray <wbg@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Wadim Mueller <wafgo01@gmail.com>
Subject: [PATCH v4 0/3] counter: add GPIO-based quadrature encoder driver
Date: Fri, 15 May 2026 17:36:13 +0200
Message-ID: <20260515153616.157605-1-wafgo01@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260501200749.20029-1-wafgo01@gmail.com>
References: <20260501200749.20029-1-wafgo01@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds a new counter subsystem driver which implements
quadrature encoder position tracking using plain GPIO pins with
edge-triggered interrupts.

The driver targets low- to medium-speed rotary encoders on SoCs where
hardware quadrature counter peripherals (eQEP, FTM, ...) are either
not available or already in use. It complements interrupt-cnt.c by
providing full A/B/Index quadrature decoding instead of just pulse
counting.

The strategic question from v3 -- "why kernel and not libgpiod in
userspace?" -- was already discussed in the v3 cover thread. A
reproducible benchmark on AM64x (kernel counter vs gpiomon/libgpiod
2.1.2, 3-run sweeps from 1 kHz up to 200 kHz) was posted there and
is also mirrored at https://github.com/wafgo/qenc-bench. William
accepted the case for a kernel implementation based on this, so i
will not repeat the numbers here, only the link.

Changes in v4 address the detailed review feedback from William on
PATCH 3/3 of v3:

Counter ABI / generic semantics:
  - Drop the private gpio_qenc_function enum, store and exchange the
    function as enum counter_function directly. function_read/write
    become trivial accessors.
  - Support the full set of generic Count functions:
    INCREASE, DECREASE, PULSE_DIRECTION,
    QUADRATURE_X1_{A,B}, QUADRATURE_X2_{A,B}, QUADRATURE_X4.
  - Add COUNTER_SYNAPSE_ACTION_FALLING_EDGE to the synapse action
    list and report it from action_read for the function modes
    where it does apply.
  - In QUADRATURE_X1_{A,B} the reported synapse action is now
    direction-dependent (RISING_EDGE when going forward, FALLING_EDGE
    when going backward) to match the Counter ABI semantics.
  - Restructure action_read: default to NONE, handle the Index
    synapse as a single early-return case, drop the per-function
    if/else cascade.
  - Use a dedicated action list for the Index synapse with only NONE
    and RISING_EDGE, since the other synapse actions do not apply
    there.
  - Migrate the Index feature from a custom "index_enabled"
    COUNTER_COMP_COUNT_BOOL to the generic COUNTER_COMP_PRESET +
    COUNTER_COMP_PRESET_ENABLE pair. The Index ISR now loads the
    preset value into count when preset_enable is set, like
    intel-qep and other drivers do.

Driver internals:
  - Change priv->count from s64 to u64. ceiling now defaults to
    U64_MAX instead of using ceiling == 0 as a sentinel for "no
    ceiling", which i think is also more clean.
  - Rewrite gpio_qenc_update_count direction-first, +/-1, with
    proper saturation at 0 and at ceiling.
  - Introduce CREATE_QE_STATE(prev_a, prev_b, curr_a, curr_b) and a
    single 16-entry X4 transition table indexed by the macro. The
    delta == 2 "invalid transition" path is gone, the table just
    has 0 in that slot.
  - Use default: in the ISR switches instead of listing every
    ignored case.
  - Drop the now-redundant enabled flag in the ISRs. Gating happens
    via enable_irq/disable_irq anyway and enable_read derives the
    state from irq_get_irq_data() so there is only one source of
    truth.
  - Simplify enable_write: no !!, assign directly, split the two
    branches by return.
  - Drop the no-op events_configure() hook from counter_ops, this
    one was just left over.
  - Do not register a synapse for the Index signal when no Index
    GPIO is wired (no zombie entries) and drop the corresponding
    !gpio guard in signal_read which was only there to catch the
    zombie case.
  - Declare priv->cnts as a single-element array and use
    ARRAY_SIZE(priv->cnts) for counter->num_counts, for consistency
    with the rest of the subsystem.
  - Rename the Count from "Position" to the more generic "Count",
    since positioning is only one of the use cases for a quadrature
    encoder.

Documentation / style:
  - Add a short comment to the priv spinlock.

Krzysztofs "drop const on scalar parameters" note from PATCH 2/3
of v2 is also taken care of in this rewrite -- v3 was Acked-by
Conor only and did not carry code changes yet, so the const scalar
parameters survived there. In v4 there are no const-qualified scalar
parameters left in the driver.

The follow-up scope which was discussed with William -- COMPARE/FLOOR
components plus OVERFLOW/UNDERFLOW/THRESHOLD/DIRECTION_CHANGE events
-- is on purpose not included in v4. I will send those as a separate
series on top of this one once it lands, so the diff size stays
reviewable.

Changes in v4:
  - Major review-driven rewrite of the driver (see above).

Changes in v3:
  - Pick up Acked-by: Conor Dooley on the DT binding patch.
  - No code changes.

Changes in v2:
  - DT binding: rephrase description to describe the hardware, not
    the driver/sysfs behaviour (Conor Dooley)
  - DT binding: drop redundant example without index GPIO (Conor Dooley)

Wadim Mueller (3):
  dt-bindings: counter: add gpio-quadrature-encoder binding
  counter: add GPIO-based quadrature encoder driver
  MAINTAINERS: add entry for GPIO quadrature encoder counter driver

 .../counter/gpio-quadrature-encoder.yaml      |  60 ++
 MAINTAINERS                                   |   7 +
 drivers/counter/Kconfig                       |  15 +
 drivers/counter/Makefile                      |   1 +
 drivers/counter/gpio-quadrature-encoder.c     | 739 ++++++++++++++++++
 5 files changed, 822 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/counter/gpio-quadrature-encoder.yaml
 create mode 100644 drivers/counter/gpio-quadrature-encoder.c


base-commit: 3cd8b194bf3428dfa53120fee47e827a7c495815
-- 
2.52.0

