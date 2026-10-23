Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792767361;
	b=owIpSsEY3o1FzJJIetVnAkD+8KY20glIARlu4nIeA4bPBfz1OAXc8sDjvEoKSgmIcF5m
	 8d+PR5A4OGYgDUpCnM2ZJV4xwb9FUZgfiOY+y11Sv8K5rpu9l55rF9NTmSoA7RugtsmrT
	 +ZjGrbAQpYf2CkCkhCCzYi1t+ZVfBVh//ddv25aYLJ2KK3xbnTEZWaZpat4ES3ZvDta5s
	 5ygsgfzxdliFImStIMEQou9oOGz4RAK5VCbz3WDV2LNiHfuNxXu+RxFYyX5DCFR1B/p5b
	 iz5stSKhEGJroqa8hkDpozeant26ooj4XYrFyxbKdwKvMs14WraFLAoDwSk7RS0DQ0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792767361;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=vB7EoyrHbZim2ck9/2V6ztNSVsZ7Bq2SjbvjQSXWvH4=;
	b=rAubW5Z+ZFoW6jgM0+AZHJ8HSmZIkHOei3xn8RmIemtVsLGa2VjiSmyDKmYQVOQucCA9
	 B3Sot+nl4mBlF34N8R/ONLwn9duQEcFs8EwuRLC2dxne6Nzeat2SqS8a5ezOo+W0xxK11
	 iwHr8ERK5ToFwq8Ap1dnzYjiw5jmAR1rlruKi2tY0QG7Ml9sCEcSmBy8JX7tVkhjcPb6l
	 DRM6t0Z53Z91Lrr0rFVTKIw4+BfaGe8WHPjKIC4Her2WTFL2q4DeXn7f3yheN3lEGVUuC
	 l03PbpbUEBT6GfhOg3Sjzfi8kFwUDW66uJRN/w8Fx0mzfBp9oAOskWICDLyKOLIcogA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amarulasolutions.com;
	spf=pass smtp.mailfrom=amarulasolutions.com;
	dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=GOR+0AnC;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6432B606A31E
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 14:56:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6432B606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=GOR+0AnC
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a2072b9832so10443325e9.1
        for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 07:56:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1792767359; x=1793372159; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vB7EoyrHbZim2ck9/2V6ztNSVsZ7Bq2SjbvjQSXWvH4=;
        b=GOR+0AnCNVrcZjEffNum74HOdwjgnPDBXe1iRLRP037zO06nFiOqSSqD6DnLgLZtMI
         2bZKwe5rUezmAubDWZ0BLdgmW8OhsBjGp9wMLvyX2WYKQVhP5Th2Dn8WKNJcKcjpZ5qc
         9TlwU7RZxqhQ9grYFc+vCMesanO3amPd/4Hjk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792767359; x=1793372159;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vB7EoyrHbZim2ck9/2V6ztNSVsZ7Bq2SjbvjQSXWvH4=;
        b=n9G8P8wRwrd94RCeAIHJ3G0OzVQ4XC2cZWTy0za9WQGR95DHU2ILXyJQfhubnVZ4a8
         HzjRlf0iL3wZU7gl5qM2G60t7gI7RP/6hQKh2m3mPfcZSC8zALfwJVHOEcMAvIzzAkEM
         HAgiG4X94THkFV0CF0USKkSSJgJCMu7uATQgCxUQlvrMr611AYHTz3zleC55zzTmyZFQ
         IOxshBVqXLWaBFNf6nB8c2iMSzqY9cZPLWDOaCZegg+hjZftEZcV/IdKeorgyyUna+OV
         hVlrroMZlBWiM13RC7EFPc47zmz/zynLcggjuj+wPPcyA7clmf0qe38qLiNm0/eF+nzh
         kw7w==
X-Forwarded-Encrypted: i=1; AKwUvBxOGIWZeTc7amcEG93NKlaP2U3QqAE1KjjIaH8ykmOyIG7g3Nj48Jm7gZ9Em+qynmZBUeaFFb6qLYPv@vger.kernel.org
X-Gm-Message-State: AFq9FYLndxgu9sFY3luAhwst2fFuQYTpxCW8MvnT1vmKEuN6ii9ru9LU
	SzpBv/e8buuZ7KvfRqAAjBuT5dEmhuQSGIV+qclpVf2Yu8lN016aaBvQRefRnftY5MI=
X-Gm-Gg: AYBFou1pl9/NuHXEdVEF7Ob+4hAhTdyJ7wCttsM490SPpU4zhB53RBi3+6Fq4zJsCmb
	BtqwVlLedQILeCyuxWghsXMJ2tXreC0aLKYeJPdgXoU9Fm19hN09NThteA7feopfsb8SL12kwaY
	pypJ8CWaiFugCa5MrqQBqx8xGMFVkIbnIP5Dv/BsQuRAuy4Nigi0HpHoY61JpoKEF8k7Yq25t9e
	aDaaag8W4BAxZo/CGp3Oe5F6sjAQRvuWmgYdmEQgq7ZEosFzxwGw1BAx+DTKmXaiDs7WdSQ5dqA
	7FwcJ+OXhhB9BJqpNQUFtsexR2rchdkiCEKznMqLWQEbNouecqAOenEzAxqU+0n2S2TEmCSqHiG
	wvu3rFbo+E3Wnr2gKV7QDjSAftksqIVUPVxThPOI8kKVnRt2LPRZfrqmzbEHuP01V+3QcpShJDR
	7A+H19qf8Wh5WPx1hQTxES/dDWVsoYt+du8Tge518ga1jNxhfBIWjoKJTX8LiS86b/d5aBpjYAy
	1U7K+y7MpEZeC7to5U+Zf0o3o/iarMP09UprcfW50NLB0EmhDSIdho/AkEpJvsEv/NCeewzNK8x
	JkpU1Ja0wT1cUfQpdnpL+XitIA0yqM0CouxUPwXNHtGti6TVHxLwoCz0xt3+ejZrC+D50a/nvWl
	AsXr4liGfVd86aVHyzIgREbGvykQMp8XbGOTQtrGkQ0rh43tTuDTB1Q==
X-Received: by 2002:a7b:c303:0:b0:49e:795e:ba89 with SMTP id 5b1f17b1804b1-4a204bc31e6mr73887275e9.6.1792767358753;
        Fri, 23 Oct 2026 07:55:58 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-79-14-29-58.business.telecomitalia.it. [79.14.29.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3d42f884sm226760f8f.57.2026.10.23.07.55.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 07:55:58 -0700 (PDT)
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
Subject: [PATCH 0/3] clk: ti: dpll: switch spread spectrum to the generic framework
Date: Fri, 23 Oct 2026 16:55:29 +0200
Message-ID: <20261023145555.3578469-1-dario.binacchi@amarulasolutions.com>
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


Dario Binacchi (3):
  dt-bindings: clock: ti: dpll: drop the ti,ssc-* properties
  clk: ti: dpll: use the generic spread spectrum configuration
  clk: ti: dpll: apply the spread spectrum configuration right away

 .../devicetree/bindings/clock/ti/dpll.txt     |  6 --
 drivers/clk/ti/clock.h                        |  2 +
 drivers/clk/ti/dpll.c                         |  8 +-
 drivers/clk/ti/dpll3xxx.c                     | 98 +++++++++++++++++--
 include/linux/clk/ti.h                        |  9 +-
 5 files changed, 94 insertions(+), 29 deletions(-)

---
base-commit: 734bef548a96e8774d6eef5dfa2026c6edc4e80b
branch: am33xx-assigned-clock-sscs

-- 
2.43.0

