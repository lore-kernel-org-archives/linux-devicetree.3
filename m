Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793000820;
	b=n7PE4Ug7yO3bh7siasxIyNOIJ0MxwlL0BpvlVK4Gr2mAzzSGYi3coDg1qwNpatwXX3N9
	 XhwPexL6TPTdnPRO3EK6FAxoEfu1nZSF1H+9PSWsLXCLX9DOKmE3pBb9LxLqi3rA7OucW
	 AoCFgOSMJqO5YbLCJei6NZpwW3h+4fBCBO1z++CqCLjRNoteSK0kzh/D2YGE5t7sYnbK0
	 WFbNs5ZihfIHMFQvqJI+SsaiQIYFuSAADIFYiORBm3d89USiYdXvpdMAIG+iYzqNxxvdc
	 4RMzTuahj9IdZTUeI0uBQJTg8wt65x0HQRi6mTB28woHKtfGYEha5XheWdHhaeHHztA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793000820;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=kgNgk7mRDAkVIJIniFCRm3A7Q5etj+qhlWnlfW/Xdo4=;
	b=3J0YShRvkrIDRaUouU4V+oT6JItuXxLLnlrDUvKKgm0HYI74nv8QApCrCf+e43vN07yi
	 6iDqEC/7FypMXnrfxSl3XgLCJPi1Qm/VrtvgxG0q1v1JRtIZWnCBKlICv3+xRydPaBYS8
	 ee1pTOSLU+9f4dRIhq9abBpqWFhW2TRPzFY3TqnHphrY11hHfK20SSgSZk5DIb//QKFwA
	 ALMrdxCXXeWwttfCcMgH9E4Y+s9cmdUyNS0jfq06Q7tZDgBR3a4RkWgxz4+fxrJLzTnIH
	 nOD1X4osKG6Qti7hjINBhxvNJ0Q5F9Ds74zo7f5J+7B8/WlAQ4/rPfqTmMcGLA1o/Bw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amarulasolutions.com;
	spf=pass smtp.mailfrom=amarulasolutions.com;
	dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=oVCZUiyX;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 956CD606A321
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 07:46:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 956CD606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=oVCZUiyX
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48df0fa43c5so1617769f8f.0
        for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 00:46:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1793000818; x=1793605618; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kgNgk7mRDAkVIJIniFCRm3A7Q5etj+qhlWnlfW/Xdo4=;
        b=oVCZUiyXw1lfiBhfxo41FJlK1qi2BtYosNra8np9mSh/DJ68mSBGzyPJWYmA4KBAH6
         vU4gQh3R5fMOth/IlDfH/frNDmT+mv0GDkd1K7glrfnahzC1aV+6oBsPSP+alGm4Q139
         9qFU+55MFyqIzRPJ8KSKohV0T6zJkzeEn+cho=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793000818; x=1793605618;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kgNgk7mRDAkVIJIniFCRm3A7Q5etj+qhlWnlfW/Xdo4=;
        b=26M7ikyKMqXNG6a04SSg3x6Pjrpfj5SBb2PA7mhYASqIDGMXv6HvlVzPcphogYwerF
         5XwZYtYmCIKehGoPNU/40qGgDdjQztneOdrE6v5REni1WkvjOlemUz8demKZnj7lS9q0
         pNBMEvQ7hk7mE9xUY/rDU9y4BvK3rUXC2sDSmXTuUVmlupYaQpvzHX/GdJU28z5/uPHv
         iJ9gi/EbWbFxiDq8fy6X0lfTfheYmZok1f/0DRl804aFc1TyjpJwemtq6x0v+hxiD04K
         WBO9FfD+I+Ddc5xdcUD2sdS2fFYgJrYngcAmocCtwjEgY0ZmtjoxA9oTc8TmhrqUEf7a
         JqUQ==
X-Forwarded-Encrypted: i=1; AKwUvBwEYmbBWxnz8DqsAimy/v3CdVgyCG9YoBupw7oR8VsQm5qWFcd4T017TcCkMuF27snQr6JDWBPzgtc3@vger.kernel.org
X-Gm-Message-State: AFq9FYKASYWUri6je5iUqv7tji04z17jOs27jyZnGi1lFDDcwIM01CvO
	G9XOrGpCprRyWU7w2JlttcyLWdf+t6lgdf26j+Q0oTgtBt3B827tW3iuzCj/zvDJq0k=
X-Gm-Gg: AYBFou10Y08d8OQcV9zgx7IUhaBU37JrK3pV5NbOtjQWGkbxZpd8SizU187itFeSzA+
	vuxljF638GhOU7PUc3JCWOyZDiThlQXoi1o1phQ2XaFgn8ZpzYPGpqmVIWUCvniZUVbgccfKvpx
	DU0jdhyJH6gP/y0Pd0ZlZ8Siw5wEAQzK27FspEDgx0pWPhOq5VB2WWWJ+kKDAe4sKLGS8FIJFm2
	iasACuEWCBImTwlMUJLeEgVnrNik/Yr9puScuqyvLBbcdVw70zIuBywy0BR87w089MJ/ITQeP1w
	xL65J9IiocBcAtyk35qS4pyb7CPgnF4A6+fwCccsksJIIq1ThIOTQ1D1yp6t6zQBLK24gTbOzZV
	kSseR/2gSN/HYbul5xnaXLNm91u5dtlOmdhtz1/Ttk4xdHJRNU+S6CrDyoGszcu/l2Bxl6yxgNn
	ut6l7qdX9jB8PgbEA3Nrg+YA5P4e6wB496iUIXMoRtKI+pgaF7PoImSpI9H3DHd5eBnaD7qpgJF
	Z1Y7n2aJlopgqPJbGmlQcdToX2+Ggvkx9hJEW9ku0RkNDRHyvV+qUfR6K4T1TG+ae1uI1EgFjes
	Yy4IU9u6+fMvdEeT6OB1RJ9ajUbmyJX6+0a0Z1ec8hpAdN/N2WVFnK78OtafCy3GwO4gFtTErsS
	WoJ0hNsCTjIDUlTx/pBwwmY5G+Em13uzr/wCpYs/TLcaVXfbhE+vX
X-Received: by 2002:a05:6000:2003:b0:48c:54ec:ea3 with SMTP id ffacd0b85a97d-48e3eb73c36mr12890000f8f.13.1793000817894;
        Mon, 26 Oct 2026 00:46:57 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-79-14-29-58.business.telecomitalia.it. [79.14.29.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e412cc164sm13731353f8f.7.2026.10.26.00.46.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 00:46:57 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	michael@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Brian Masney <bmasney+clk@redhat.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Tero Kristo <kristo@kernel.org>,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-omap@vger.kernel.org
Subject: [PATCH v2 0/3] clk: ti: dpll: switch spread spectrum to the generic framework
Date: Mon, 26 Oct 2026 08:46:26 +0100
Message-ID: <20261026074654.3997494-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The am33xx/am43xx DPLL spread spectrum clocking (SSC) is configured
through vendor specific DT properties. Since 7.3 the clock framework
provides a generic API and the assigned-clock-sscs DT property for it,
so the series moves the TI DPLL to the generic configuration and drops
the vendor specific properties.

The last patch applies the configuration right away, as the clock
core skips set_rate() when the requested rate is already the current
one, e.g. when the bootloader has set it up.

Tested on a BeagleBone Black with equivalent parameters. The
dpll_disp_ck SSC registers are programmed with the same values as with
the vendor specific properties.

Changes in v2:
- Check the DPLL lock state instead of its parent, as the reference
  and bypass clocks can be the same clock

Dario Binacchi (3):
  dt-bindings: clock: ti: dpll: drop the ti,ssc-* properties
  clk: ti: dpll: use the generic spread spectrum configuration
  clk: ti: dpll: apply the spread spectrum configuration right away

 .../devicetree/bindings/clock/ti/dpll.txt     |  6 --
 drivers/clk/ti/clock.h                        |  2 +
 drivers/clk/ti/dpll.c                         |  8 +-
 drivers/clk/ti/dpll3xxx.c                     | 95 +++++++++++++++++--
 include/linux/clk/ti.h                        |  9 +-
 5 files changed, 91 insertions(+), 29 deletions(-)

---
base-commit: 6b4b543fa18757297ac756a6fe6e64f506b7844a
branch: am33xx-assigned-clock-sscs

-- 
2.43.0

