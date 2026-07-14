Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57AB23FAE1D
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 08:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784017040; cv=none; b=HFGNzvnZrNblsotZESonRznAVk7e6tbb+mAnnHBeWTZ/8yuMGWJ+kVQvJ0uZf5O/v0iy0hingGEtGYeaIMbYOmyUW8njG5jnDtnhRgXk664nw6jWJyzDWqnABu27QlR2pE5xNl+iisj6uzzumUbhgy2NuCqnPeuBK4xjJPiRU5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784017040; c=relaxed/simple;
	bh=2jerD9lp0NqmFadJflPzVzFJZXVG6Vk0wzFQvxAJI1I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PWV8kh748nlqNBmxzCHqk4714CrGxIClAkr8LBDCYPQJYQEFCE2mHm730+t5yi2+yl0UZ++5kjAkPC9N34QtIwwgPMHOCrqpsoeJTcM79dQ0iEvHCiNzlpyCE7tr7iCnXcxxqqaQW2bG6TVgblmLj8RqETNACAOiQDxfzyFqC60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DR6MD1YZ; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DR6MD1YZ"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-69c600f76ccso1144094a12.0
        for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 01:17:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784017030; x=1784621830; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=d3Jk1bl127PhKyfuEwshrZ5NXnlXbFwCFha2daTO4m0=;
        b=DR6MD1YZdoWG8DBaywLt0KxG4YNXtHqPmjv16NnXLkKmHitC6DHJawdUvGEM9chVmA
         F041h4q7EwwZzVy3yp7tutxGUxfpKUxLEkybX0BiUOtI+fxUuvYk+0RWbytUH3RQE5nx
         9tTVnM5kStOLH7VyQcsAH1ulBBGEXfHyHpA2ub9zZsUaMdGB+oLoNdBB3AYqZuJ07LZ8
         p3fzujkAGHPWYreiiUeJxRFVuTpWniMK1qn5bMCx0N4is1WU6aQjb7SBYC9QN3+l84oW
         a8qwjEa8TplNA9qkMfbcytlN/vCLCbA+qdpRUwDz54+kGwXsIipJTfNmNww9o6gWJMiv
         5IHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784017030; x=1784621830;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d3Jk1bl127PhKyfuEwshrZ5NXnlXbFwCFha2daTO4m0=;
        b=Erv7gMAawoU161nUErogszwz8QuqSIWJqC/Lmkv7APyi+zq4t2iU1hflN0bu0UxjuK
         /VuobtcHs5OJBU+eygK1hBBmgxS5bud/dHW3tnyLbd/YyisP/RAAy8/Rf5c13Y6YdvHX
         le5ZcpMT+q8BB45aHxnV4p8OIipnSiQrKOEX3IHX9asVCiqdzOuLNCJv8pP1ZVDEKju5
         5Q3s1Wy+cTE90MB82Ka12mONHV81Bo5CGD4aUmlohLB5wb4Hd4zvE4uRxY+nsLHTsICH
         6JA0CrdQjvCOQN8m0hUicqOIQhf/OPg/CPhlAWBTInlSMAKemHjK9Xoh5WrPgfgHouek
         p1jw==
X-Forwarded-Encrypted: i=1; AHgh+RqaVyEmTNdWbRzbLCugvoKLLuVH01WfamwzaFmTyU+r3xY+oTXk/b8o+wtbl+jvpL/Xt1+e/suxaJ+K@vger.kernel.org
X-Gm-Message-State: AOJu0YxP495JXjXXDsJ7RxDFiVpF8pL/lQfml2XZIeDOHxMBqrTWDzSh
	6Nba/ZQLkg2JGHd9ZSUtDUM4OXj8Dj4YsIVf56kdNcq9/yvmAeCXerJI
X-Gm-Gg: AfdE7cm6pLkuVY0ZD9Hn3b/HEJv5hWDmU3aXOo6AOtfTiCJAfwVJpEb8YMKxYuTaaSy
	ky32XtPHJfF1w0t2PvsrwldQekPBhj4yCvNymU6pUVT/vN/5hCRqe/dqWPF53kwZbEnVjlAVYIl
	D/lt8wNvyUb2mMEoxkzwA/5qGf66xf4Z1cvZbACCXwIkIuKuLnAQY16hnbHfcilhANPExD12lip
	S4N9yGw5PTnS81WeUgiWNyXtCbh+UcY3hzaXgmrq1UQBN9JIdL54fpJBQYyc6on99Ml0InkKDwZ
	nLwyEEHY37152ILT2HHESLO5JRPRNgwuvv09zhcHWGzQaduSSWGlfCXZ2p3gj1PLvjMiWeN8tDN
	0t00+9oM9WySnpxqC6OWn8Qt5kU9RMllyRy/LgeIRug+BcS42RqIO2EEchBkKVm5xqzumEhd+t/
	cKZQQuxjyAy6/UvkHXB3p+Y5w8gwJSM9kZ4rt1dfFPITVq0w==
X-Received: by 2002:a17:907:a4a:b0:c12:b227:614b with SMTP id a640c23a62f3a-c161ea6a243mr573738866b.27.1784017029849;
        Tue, 14 Jul 2026 01:17:09 -0700 (PDT)
Received: from DE-PF5B95TD.embedded.cmblu.dev ([87.129.199.250])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15e353d2f8sm723085166b.34.2026.07.14.01.17.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 01:17:09 -0700 (PDT)
From: Wadim Mueller <wafgo01@gmail.com>
To: William Breathitt Gray <wbg@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 0/3] counter: add GPIO-based counter driver
Date: Tue, 14 Jul 2026 10:17:06 +0200
Message-ID: <20260714081709.17846-1-wafgo01@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds a counter subsystem driver that does quadrature
encoder position tracking with plain GPIO pins and edge interrupts.
Compared to interrupt-cnt.c (pulse-only) it provides full A/B/Index
decoding and exposes the counter sysfs ABI.  Target hardware is
low- to medium-speed rotary encoders on SoCs without a free eQEP /
FTM / etc.  Benchmark rig: github.com/wafgo/qenc-bench.

v7 addresses Williams review comments on v6 [1]. Main change is the
reworked index GPIO handling, rest is smaller stuff.

Tested in quadrature x4 mode (both directions) on a AM642 board with
a real encoder on GPIOs.

== Changes in v7 ==

Driver:
  - check the enabled state in the ISRs before reading the GPIOs.
    This also moves the reads under the spinlock, so concurrent A/B
    ISRs cant evaluate the state out of order anymore.
  - dropped the spinlock from the simple single-field read callbacks
  - smaller cleanups from the review (b_irq_users increment split
    from the zero check, current_state variable gone, ternary in
    index_pulse, GPIO_COUNTER_NUM_COUNTS_MAX rename,
    GPIO_COUNTER_MAX_INDEX removed)
  - index GPIOs now live per Count (idx_gpio/idx_irq/has_index in
    gpio_counter_count_priv), the n_idx based arrays are gone
  - enable_write: dont resample prev_a/prev_b when Count 2 gets
    enabled, that would corrupt the quadrature state of an already
    running Count 1. Also sync the direction from the current B level
    on enable in pulse-direction mode, otherwise the counter steps in
    the wrong direction until the next B edge if B moved while
    disabled (both reported by the Sashiko review on v6).

Regarding the IRQ enable ordering question from the review: I kept
setting cp->enabled = true before enable_irq(). The prev sampling and
the enabled flag are done atomic under the lock, so the first edge
after enable_irq() sees consistent state. With the other order there
is a window where an edge fires and gets droped.

Binding:
  - index-gpios (array, position selects the Count) is replaced by
    two seperate properties index1-gpios and index2-gpios, matching
    the signal-a-gpios/signal-b-gpios naming. So Count 2 can have an
    index line without a dummy entry for Count 1.
  - dropped Conors Ack [2] because of the binding change, a fresh
    one would be appreciated

The 2D synapse array preparation for a future pulse-direction mode
on Count 2 is not part of this revision, that was flagged as
follow-up material.

[1] https://lore.kernel.org/all/20260707104501.977372-1-wbg@kernel.org/
[2] https://lore.kernel.org/all/20260629-trekker-estranged-754e9bfada16@spud/

Wadim Mueller (3):
  dt-bindings: counter: add gpio-counter binding
  counter: add GPIO-based counter driver
  MAINTAINERS: add entry for GPIO counter driver

 .../bindings/counter/gpio-counter.yaml        |   60 +
 MAINTAINERS                                   |    7 +
 drivers/counter/Kconfig                       |   17 +
 drivers/counter/Makefile                      |    1 +
 drivers/counter/gpio-counter.c                | 1011 +++++++++++++++++
 5 files changed, 1096 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/counter/gpio-counter.yaml
 create mode 100644 drivers/counter/gpio-counter.c

base-commit: 3cd8b194bf3428dfa53120fee47e827a7c495815
-- 
2.43.0

