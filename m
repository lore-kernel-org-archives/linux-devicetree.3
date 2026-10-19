Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74BDA1AC45D
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 00:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792368802; cv=none; b=PW5j/czMgcYTAILnY5dh0Ojll8xa9K9F0zB32EKHfmLpju0s0iym/n1hePimgd/6UPVpmPRhQhDwEbNYYj8BKZDhHlnTMhg47ghlFk8JOFEtTbOQ6PvHlVTp8qCCRVfOB1D1gmDibygX9MHebyEvQ2tAzxh+U74gWqix/jKbryM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792368802; c=relaxed/simple;
	bh=knf+1wF9ksJgxjHb4wumyiicX5OX4gIFh9hhKLR9xII=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EHS1BaZACsbJcKHeWr7K+ORpJCfFvAIqDGexEi9bMX6SyydBoIr5khqrpvb9phYCR/aWNXSWR8eJXCf1+2hEIMOtpmomltKEqo8/bpXoq+hcKOGEvp2uXk2RZaaqbUaPAKkQlqF4a0PfUs4oJRsMjcLu4+YZNKLBZor0EBye7mw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QkmkcQCJ; arc=none smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QkmkcQCJ"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-3550c917fd3so1790546eec.0
        for <devicetree@vger.kernel.org>; Sun, 18 Oct 2026 17:13:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792368800; x=1792973600; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fmCKVuEhcyinCJJCJLug0EcJL3YbcTgm8cMUgb76yLI=;
        b=QkmkcQCJyS6d41rPG9LU1Ov4luGbPAd1t6J+2phi29Bp1qSnz3VRJA7iAZi/Mn1sGv
         75GbsItHf9CPKicpXA/P6+BpfUz1NEyHmNPRzU19Qo++cmxu9L79kmgv9A20q7Igzx6X
         Hl7gGLNXxaBhwOB2uaKo5jCGMQNm03pD+XZdmwQdU57vgc1911BYoyeyEj2DKhhsK4QF
         YAezqfJNEMz2WZRFJKdGANP4dOVUx14w0je8wrPPb0DRXKr/5xh5AC0rQ431XxRs3TRn
         x/5R0qwPMcL3ivxyHx3RtBMe+wrNVaGd6N1MVgx5isvBSOvGuq2qkuvgGDStdpIdlSW7
         Igfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792368800; x=1792973600;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fmCKVuEhcyinCJJCJLug0EcJL3YbcTgm8cMUgb76yLI=;
        b=fSWYP76AdJhPbvIVsMYwBAba1xkLmckIaBWIURLZUjqbKXO7y5do21Dw86++T5qAMQ
         XNxedVR5TXcK705usaOA2p6uAIY/E4DOKkx1Lyc+LmeQcnFpOJ87+92gWXaV6GcfZ0YU
         rw84shWsEfpXRXpYFav+WgtvB0RFTG1Y0rt3ia4fBzy5Q4l60c8mCO/HErxN+a48wco8
         LLA0aGvkeYPYQdfc4jABIIFJ/l9pM5AySwlMVPcVE9309RMLtxXwp+YbrlYoSxts6mOV
         BMO97rhTx8UBD1zYtHCfKERESpCumBITMFpUulRAg3+y2+jn4buaDwqpEOA/3Epxh46V
         nNnQ==
X-Forwarded-Encrypted: i=1; AKwUvBzf/TvsoU+RxzPE3ktdb2jSfeLuSE84V4BvkG8hF71wyEM/Hv83m/5jpBjsfHEefCmpzhtfLY93Hje3@vger.kernel.org
X-Gm-Message-State: AFq9FYKvz5hdjxEnLqrzn44tJWCdkkst2N8WMqOM2+gXKzAco3J/OPQY
	CwdlLkSk+JCOhIU/G58vCkxFSDfo8QXOs49WdCYGhRCNpP62k+YrVotl
X-Gm-Gg: AYBFou02NsqEpruvbkovhlOLTFKcVFNoaOLDgAfd2xljxO0ZZ/ASF6rD9BS5Uynt9a1
	toqm2+UoTtkezGA8uvu5sCSPzC/uyBUpyZpJdLyn4OWwqxuuG9ioiS/OUd1cRJmWreSkAKnBIMp
	K3nVV7nVEDCuWGCjO8+mRAFbeanJGi4ZqBa2Jvjh3WRAlej1l2CcFGCU/WrguVmrosSfzkiLc7F
	Tdzi9HDnKE9KIX57VkSEQtAMvuz3lge+T8xv2VsXqYzHQGwAFc2jU7tK7wPzsvBGDhj/uyBDuCJ
	J4pZsFeKz0uKvTnnFNSgHiUmExH6F/zQjZiS5JtlOhLpKMUHmdxjE5ZdA0fjixBALKcFEEG0qpZ
	kigPnK7pjGhcobnjLNMemyIICyJhGuWDOFbvWwyoKVkpvKscz/atnu2fcNcETu9w7cRU1qcAciA
	735ug+auwF498ju2+FLVpNFAOZ818DSYIyxKxzELfPNgZNrFOnIaeyJEwIgCwcVkqntL0uYU2Mn
	9Q8JrIPhBIKYkhOJGqt/Sg=
X-Received: by 2002:a05:7300:7a9e:b0:361:1dd6:531b with SMTP id 5a478bee46e88-361a2052bebmr8300968eec.26.1792368800338;
        Sun, 18 Oct 2026 17:13:20 -0700 (PDT)
Received: from stephan-Inspiron-15-3520.. ([2804:5d20:6009:6701:9a49:ae2e:1b25:b04a])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36082f7f6e0sm30631371eec.27.2026.10.18.17.13.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 17:13:19 -0700 (PDT)
From: Stephan Costa Barros <stephanbrrs8@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mike Looijmans <mike.looijmans@topic.nl>,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Stephan Costa Barros <stephanbrrs8@gmail.com>
Subject: [PATCH 0/2] iio: adc: add TI ADS1299
Date: Sun, 18 Oct 2026 21:12:45 -0300
Message-ID: <20261019001247.483005-1-stephanbrrs8@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds a driver for the TI ADS1299 family (ADS1299, ADS1299-6
and ADS1299-4): 24-bit, simultaneous-sampling biopotential front-ends
for EEG, on SPI.

This first version keeps to the generic IIO ABI: raw reads, the gain of
each channel's PGA through its scale, the sampling frequency, and a
kfifo buffer fed from the DRDY interrupt with a software timestamp.

The part has more, which I would like to add in follow-up series, each
with its own ABI discussion: SRB1 and SRB2 reference routing, the bias
drive amplifier, lead-off detection (through IIO_EV_TYPE_FAULT and
IIO_EV_DIR_FAULT_OPENWIRE), the internal test signal, the temperature
sensor and supply monitors, GPIO1 to GPIO4 as a gpiochip, the CLK pin
as a clock output, and daisy chains. The binding already describes the
hardware for those.

A question on structure. The driver started from ti-ads1298.c, and in
this subset the two are close. What differs here is the PGA gain table
(1 to 24 against 1 to 12 with 3), the data rates (no high-resolution
mode), the fixed 4.5 V internal reference, the ID register layout and
the 4 and 6 channel variants; above 0x14 the register maps also part
(MISC1 and MISC2 here, PACE, RESP and WCT on the ADS1298). Most of what
would follow, SRB1 and SRB2, the bias drive and lead-off on every
channel, is specific to the ADS1299, so I kept a separate driver. If you
would rather have the ADS1299 as a variant in ti-ads1298, I can rework
it that way.

Tested on a Raspberry Pi 4B running 6.18.50 (Raspberry Pi OS), with one
ADS1299 and DRDY on a GPIO edge interrupt, the driver built out of tree
from this patch:
- every value in in_voltage_scale_available and
  sampling_frequency_available written and read back, and values outside
  the lists refused;
- the internal DC test signal, routed through debugfs register access,
  read at gain 24 against shorted inputs: -0.08 % to -0.41 % from
  VREF / 2400 across the eight channels, as with the out-of-tree driver
  on the same board;
- a 10 s capture at 250 SPS: 2497 samples for 2497 DRDY interrupts, no
  gaps in the timestamps, and buffered values matching direct reads.
So on 6.18 the driver was run and tested as above; on the IIO tree below,
the same source, unchanged, was compiled but not run.

The series is based on the testing branch of Jonathan's IIO tree
(git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git).

Stephan Costa Barros (2):
  dt-bindings: iio: adc: add TI ADS1299
  iio: adc: ti-ads1299: add driver for TI ADS1299

 .../bindings/iio/adc/ti,ads1299.yaml          | 221 +++++
 MAINTAINERS                                   |   7 +
 drivers/iio/adc/Kconfig                       |  14 +
 drivers/iio/adc/Makefile                      |   1 +
 drivers/iio/adc/ti-ads1299.c                  | 897 ++++++++++++++++++
 5 files changed, 1140 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/adc/ti,ads1299.yaml
 create mode 100644 drivers/iio/adc/ti-ads1299.c


base-commit: 19c5db3507633edc21b4172d99f573c2dfbf42b1
-- 
2.43.0

