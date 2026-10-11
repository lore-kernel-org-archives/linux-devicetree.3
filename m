Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B134C3B9D98
	for <devicetree@vger.kernel.org>; Sun, 11 Oct 2026 18:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791744769; cv=none; b=MdCwbRjqWHKW7C39p6rtC0mQ5YGHtczdNaPAaOnTURmF5jyY9+jgb/R8sPS/SkL5r3XHDHmxjx3+loCgEkr9BXydeW67iuDtv1o9ak03rdpO4rtn+DUwL+AuLeGf0EfAAjAxgm/4+qvt1l3mmh6ouZ2eDDJ1vAtfvl3u9/9SRGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791744769; c=relaxed/simple;
	bh=yXPQpfc9suKyLzGtUqDK1jBB7VLe8tQS9GLwAXxdCSw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=J5fBIxnEACjR3oyftTT4BsGuwYgNLw4DbyXucmLqQ8E+EDRaxGAOlURJso2biBeYAhbMCYSKbtm6zhjNQeeUZ516Y4Qmk1m7wHHKTAdVkEJ7lKLExg5mgTf8h6lvKQbRhC0jeNstUq2INAb//FA9OwYxO5yHIbRKF+WyDavZSFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MxQ5oVLz; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MxQ5oVLz"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48b03f23305so1024117f8f.1
        for <devicetree@vger.kernel.org>; Sun, 11 Oct 2026 11:52:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791744766; x=1792349566; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MdXQKQEM6Wnboxcp/n/qLe+CxKEtSxSxHHjbqvRr+mE=;
        b=MxQ5oVLzvvMYe8921Dv+Aj4eIgD60YnftXu+cJah+y9ln+pTjJOv6Est8Jza/j5wgp
         GKbMA9hbmcDHtVEtnTNcgd55hTtDAH4Bh/Bx/1NXcMmHOYSuRcJkfhOHXQU3H9UMvxLI
         hrtcfL3nWXqnGfxqMd5z8Po4gJPx2win/9f9Zz/feob8oZjaPvpnhwbxhmC8oPGo++9W
         ifmyq2NUYNN3i5xEsgs/kukVz/RtUUzr1O1zisiGIKFxb6DZcfmVV29Fti41I+IOVHAY
         f/SH6TKpulXMFnk4j/DUPun3ZBU9atyjM32c0hXA4MsKcmfwFKrbzca/86yAJsLqspWn
         NaAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791744766; x=1792349566;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MdXQKQEM6Wnboxcp/n/qLe+CxKEtSxSxHHjbqvRr+mE=;
        b=hyFwvjmIA91PBGYXremGipX8XrL8wjHEDUjwrMlFeKEMKpgxUNlwo0PtLKxAm1My3p
         5z9kPi+gw6pijXeC2tvOa+61kWiPKgEUdwClS2dKhSAcBp6xOyxJc14PO+MZqx2SIqsu
         n5km1ikvPm0RB6PFL+GuRX1QQIzTqI7j4QSZ/fKXUbytRc2jPyIHzkkDKXR9epq5cHa1
         K/O8RFgnwGmJxjizju0cYNxjpuvIHgR80bFqXLiXZCEMPebBQ5hd1Pcfr8xhTMUsRX0H
         aq0xUwyJFhbuIMsh8E355AC+GKd8pza0SvA2e1x/QH7D1guwlz0w+Ms/7CrKAuMBc7N4
         FyoQ==
X-Forwarded-Encrypted: i=1; AKwUvBxmC70QpKSIoG3PXiOi0I0e3IqiUM+5Qf7yHrpH8NT4caPYKuqISg6uT48C6Tx4QAnk8S32ruJztLtj@vger.kernel.org
X-Gm-Message-State: AFq9FYKe5ed9ddbUKdxtnV7KA5ruvNT4WN64qXDFISqp1BfmaCszlDr+
	pZeIMwjuPlgBxxtfhWPqaUXuU1nh8qkb1Ml8NU4EtAOhsr6UVyTUXG1T
X-Gm-Gg: AYBFou0udWOo/dwvUrOGdBdK0FuCSxuYn7wQpFMU8YoOdjCyL5iCffU3tLF270X53R5
	HR9Wcr9LLdsUjaf4HYNH2j0ZwD1OaqZuNa+s48YZzn8YOs7k8pD9j1XAcW43WfAJxiL5enJfR+A
	QJlIBpkkZEbEs8wdJiYcGTfhoBtYys77vkcELdu5CzW3W6+9RzZbpTauhby75uT9xcbnh5FWPDb
	tiRO1wXVd9sgSRzqcqk7nJLF59rUw6mrvVF9UXt/0LbEM9Ai7KvDNs6Y6JtKgF3NDJ9H5LrqENV
	uzj/dbPfpmieYH9IXcmHkhANERHfxl9RcNJ6BpQUuA6NeJ2OOOhBGJDK537+4sfpi8EG9YUcaqd
	OKYAfFjWr3RIBQtU7GHu2Nkp428olGjo+Nh7YSTrsja3niPoyoja7WobrDlWWASlS1JNwN2m9vA
	H9GpsVCYG8Qm2qQHshoU/f8/OJCy8m2YIDS/5BINiUwbL6SyQzCViCzbKESqz/oYg0QGiwTxTmv
	2LFlzRZZm5WFayd4fbcq+ihOBJwqzoc6rphPWlhwjqwVen5CNXGteloImTXF8zBlH7dFnvwRvRl
	1Oek2M5B+jvKZV0G/RyOAA==
X-Received: by 2002:a05:600c:4ec9:b0:4a1:7739:f9ab with SMTP id 5b1f17b1804b1-4a18e4ca953mr139504245e9.20.1791744765625;
        Sun, 11 Oct 2026 11:52:45 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-95-235-252-189.retail.telecomitalia.it. [95.235.252.189])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a18bf2caf4sm257418615e9.10.2026.10.11.11.52.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 11:52:45 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Felix Fietkau <nbd@nbd.name>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH v8 0/3] clk: add support for Airoha AN7583 clock
Date: Sun, 11 Oct 2026 20:52:34 +0200
Message-ID: <20261011185238.52229-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This small series introduce some cleanup and support for
clock and reset of Airoha AN7583.

The implementation is similar to EN7581 but AN7583 introduce
new reset and more clock divisor support.

Changes v8:
- Add ACK tag by Connor
- Fix missing priv->base assign

Changes v7:
- Add further info for DT patch
- Add serdes selection support
- Rebase on top of linux-next
  Link: https://lore.kernel.org/all/20261009070725.13196-1-ansuelsmth@gmail.com/

Changes v6:
- Address bot suggestion for DT patch
- Add further information on chip-scu phandle
- Add dedicated PERSTOUT reset and PCIE_HB reset
  Link: https://lore.kernel.org/all/20260819221458.30040-1-ansuelsmth@gmail.com/

Changes v5:
- Rebase on top of linux-next
- Drop even more patch to reduce patch delta
- Make chip-scu specific to AN7583
  Link: https://lore.kernel.org/all/20260528190000.9164-1-ansuelsmth@gmail.com

Changes v4:
- Add review tag for DT patch
- Fix clock patch to use en7581-chip-scu compatible
- Drop PCIE SCU SSR write

Changes v3:
- Drop .set_rate patch (will be proposed later)
- Drop chip-scu binding and related patch
  Link: https://lore.kernel.org/all/20251106195935.1767696-1-ansuelsmth@gmail.com

Changes v2:
- Add .set_rate support
- Rework DT to EN7581 implementation (clock driver is parent)
- Add additional cleanup patch
- Merge binding with schema patch
- Add chip_scu phandle

Christian Marangi (3):
  dt-bindings: clock: airoha: Document support for AN7583 clock
  clk: en7523: generalize register clocks function
  clk: en7523: add support for Airoha AN7583 clock

 .../bindings/clock/airoha,en7523-scu.yaml     |  23 ++
 drivers/clk/clk-en7523.c                      | 257 +++++++++++++++++-
 include/dt-bindings/clock/en7523-clk.h        |   3 +
 .../dt-bindings/reset/airoha,an7583-reset.h   |  65 +++++
 4 files changed, 346 insertions(+), 2 deletions(-)
 create mode 100644 include/dt-bindings/reset/airoha,an7583-reset.h

-- 
2.55.0

