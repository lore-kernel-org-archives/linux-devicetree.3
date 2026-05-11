Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA975386557
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 21:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778533931; cv=none; b=tTut1GbEzj4H2O/HDg/h0p0it9V6IaMnwSO2hsER0JJgZ/gMY2gqZgguIFm7j87Iqp377nuwHqoBdFSWN8DG/r75WpJrE0l+FJphv6tz//69vQ37d9efpbFLUfBQyoQqe6vyHoru0BsPfqm4NICrQGmA6zWQCgCjv85vM8GSqhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778533931; c=relaxed/simple;
	bh=nMfOcuzlsfj2HLu/5CLOguRtU+kQcstna688hRyKC7g=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=tV72PtfKn5RBm9371+BiuMeYrWzV5zeHu5L4form14uWUp98rG7spV/X6tCgnPKH5CfsZ9iHOsg2iiye3Wc7RH8A4BSNUPtgIVeCB5MpDXEMt3qlAK1TRArrndqahR7Fyu5pzAXh5LQR72DozoODoQQt+V3VRqF2v+ClcQYmqPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mNvN+yeF; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mNvN+yeF"
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-7bd8cb26219so26293497b3.0
        for <devicetree@vger.kernel.org>; Mon, 11 May 2026 14:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778533930; x=1779138730; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZhOGyLGPA7F4jxHPPar9sCu285p8q00OlGRJQCy53po=;
        b=mNvN+yeFtpHOCv1bCkB8GNdgBPEWi1wIX6R38F12u42ZjxUBlKCMg9h88mDd+d8DPW
         atr4PuAPt2W2b3CLRU7mUN1Mp39JJqKer0HyXpEy56XlcAlkFSwHEwauWiQ32H34iWo0
         VpFramousXeTLD17bR9l3wsmCKSrOqPSSwjSuJQh+s7Oa9M8RTL43OIqM2F771KxYpOr
         7iWNUW9mwYSXhsxK96+xl2gz1Zt66W/I+LzZGrxnHd/aL4XQAoVDJLya8ZrXDsLBxOgE
         W5nA5gcudlybHApOB/Smo8r2O1fW+HIEryXB+ZjsXByPMMptLl6jKThZRbhqw1eKuChO
         4pPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778533930; x=1779138730;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZhOGyLGPA7F4jxHPPar9sCu285p8q00OlGRJQCy53po=;
        b=P77DSnBvJcBxZygN/pO3ME/BUyZEtSjPkpiLHnfJz8/c1E9rGkC6+swYbU5djRfMpB
         I818m3arJbk1PhqziehODPHLhzTWRjnj9+AwaGHisL7yVZzOHtHeXG0S2Vw5CSs6DaTl
         kQEOGvpjoWe6LxPAWQm/NFLLkITSV3J4Wy52kpQcrwYL/kvE6SoPKucb6RSlHRDeHO+U
         aAFNE3Q18kSoR7Zkly3BJTtUkKSVv+PLaWtxvNPv4YL+k16oKgQexn4Bo7CoFFl/mjaI
         iHx40HZ3f9hwPZ3rZaUg8i97dAS70I7of96VGm9T1RMAwXduZm8agDMwkLQ1nhPPuBva
         nqqg==
X-Forwarded-Encrypted: i=1; AFNElJ+5ve2rbu5kY3M68K9qO605MTjKCb4IPLzbkHspQ5BhY3sxPzIgV4d2F4x27SnBH8T7BXagPvdVwNZr@vger.kernel.org
X-Gm-Message-State: AOJu0YyOhTL7YYm1wcKMS17i6tYjPsPh3JUIo/cmLewpMspwGF7HMecj
	M8BL/naFYDVeutWv8Jwb2Mt3lf0uMnmKDSn6V+0HoCXdG2XM7vbyXT0=
X-Gm-Gg: Acq92OGrxcYqycMyQx2nXxJ87giyCmexT4jOx30Tr8hqIKWl/y47itbS5Qwj0JIxp1n
	ys2ZL7uxsk171sBlII+h1uvNXViIN6RZDk/Q4x04qxQ+i5ZElbbDMKzpahLCJ2J/H/aN12Xztg7
	+Ax2rLWDzVgXHGS9Lf0+qD01006Nx6rSqAMyVJeXPxnPL8/Fs4hMBNRtRyCxFOkk7DwgEFcxCOn
	3krK87vz2LWjBYw8q7nvwz26iugnqTf68I5EWO2dUp8QKtTrfJwz5/xeQMnFsY9BbezTad9318W
	bF9/kk4Lk5QARRTXLgHiToyt6TU8q/JHMNNEf1AoL2Q0mv86Kd7QWsOc03Hw9tjhEp3Wk5IaqWJ
	2tbcKrPnaLfHKNAXtqQD015lZtimv+sT8bIRIPxVnkkb3HxqdwF7fKIFMC91BbBwvjQvpIGeIGy
	GYBCE1Ev+kr+ylHB9XMvBNvbHj4vbcPKo5wJt8EkEvyzZSr9KbqGw/K4Xw
X-Received: by 2002:a05:690c:e3c4:b0:7b8:926e:3ef1 with SMTP id 00721157ae682-7c56093e1b6mr777907b3.9.1778533929508;
        Mon, 11 May 2026 14:12:09 -0700 (PDT)
Received: from alir-mac.sitimecorp.com ([12.1.37.172])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7bd976fd09asm114553617b3.41.2026.05.11.14.12.08
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 11 May 2026 14:12:09 -0700 (PDT)
From: Ali Rouhi <rouhi.ali@gmail.com>
X-Google-Original-From: Ali Rouhi <arouhi@sitime.com>
To: jiri@resnulli.us
Cc: vadim.fedorenko@linux.dev,
	arkadiusz.kubalewski@intel.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	cjubran@nvidia.com,
	Oleg.Zadorozhnyi@devoxsoftware.com,
	devicetree@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ali Rouhi <arouhi@sitime.com>
Subject: [PATCH net-next 0/3] dpll: add SiTime SiT9531x DPLL clock driver
Date: Mon, 11 May 2026 14:11:40 -0700
Message-Id: <20260511211143.19792-1-arouhi@sitime.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds a DPLL subsystem driver for the SiTime SiT95316 and
SiT95317 programmable clock generators, along with the associated
device tree bindings.

This driver has been through multiple rounds of off-list review with
Jiri Pirko and Carolina Jubran.  This is the first on-list posting.


Ali Rouhi (3):
  dt-bindings: vendor-prefixes: add SiTime Corporation
  dt-bindings: dpll: add SiTime SiT9531x clock generator
  dpll: add SiTime SiT9531x DPLL clock driver

 .../bindings/dpll/sitime,sit9531x.yaml        |   82 +
 .../devicetree/bindings/vendor-prefixes.yaml  |    2 +
 MAINTAINERS                                   |    6 +
 drivers/dpll/Kconfig                          |    1 +
 drivers/dpll/Makefile                         |    1 +
 drivers/dpll/sit9531x/Kconfig                 |   17 +
 drivers/dpll/sit9531x/Makefile                |    4 +
 drivers/dpll/sit9531x/core.c                  | 2583 +++++++++++++++++
 drivers/dpll/sit9531x/core.h                  |  282 ++
 drivers/dpll/sit9531x/dpll.c                  | 1147 ++++++++
 drivers/dpll/sit9531x/dpll.h                  |   90 +
 drivers/dpll/sit9531x/prop.c                  |  345 +++
 drivers/dpll/sit9531x/prop.h                  |   39 +
 drivers/dpll/sit9531x/regs.h                  |  359 +++
 14 files changed, 4958 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/dpll/sitime,sit9531x.yaml
 create mode 100644 drivers/dpll/sit9531x/Kconfig
 create mode 100644 drivers/dpll/sit9531x/Makefile
 create mode 100644 drivers/dpll/sit9531x/core.c
 create mode 100644 drivers/dpll/sit9531x/core.h
 create mode 100644 drivers/dpll/sit9531x/dpll.c
 create mode 100644 drivers/dpll/sit9531x/dpll.h
 create mode 100644 drivers/dpll/sit9531x/prop.c
 create mode 100644 drivers/dpll/sit9531x/prop.h
 create mode 100644 drivers/dpll/sit9531x/regs.h

-- 
2.43.0

