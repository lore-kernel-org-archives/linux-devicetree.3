Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795210104;
	b=aZjVfOZwSMkN5Ija1pjWBKzV9VqDAbcg8sfgvL7HCzGstXg/FsSFI4TTJUzjbh9gJID2
	 MdSOwxCla+nDx9hX7rKKt1LVfEiqkvkkft2dRssLbJY+nJYVCznXDzqlxD1xtt91LZ3+3
	 qN/+edyMQw3iTJTmmPJ2j3ia73luRUm36qXgBi5zcp6kzTzjgENXzTp27yGbPLGxVbQTj
	 9QXZihoFRO8p2OtCrG7b3hKINeJ3hH/W0OlEKng9OgrLPQ7eaZfIJlk/I4CJcwKSTQ3j0
	 3S4757eWj7UiGggzTnGcw64XBKtN1aBMNmHo4ytgUDBFz6S9BaGd5thBuYOU+hHUehg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795210104;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=taf0KVPRoF+3JboQGvuM90twCXz2SjYe05359+kTlN0=;
	b=oE2m0I5JTiKR+b5byPh15SNHH7GCP+XOgQZkOrRPL3qbY4CSmXcRaaYkOES8siuJvzyG
	 vZYBzH+IEvbwcUSMu+tTyqYHFw3Sc+v5nZ+30FVFxNaDJwqLk3c0x/cKfMFHJl2e8uGQe
	 QKqRX5gywH02aW9Hkkr5Pqmr9cnXw6xp/pQJRMlDIJfEL3f6imbfvGA9ifQmKEvb3Hgfi
	 1Ts1g6K/8PPu3CvYbgiTn38u+ZZ0rU2A9MJMq8a2U5Ggn83RI2JK8JYS+iRiv6bdwU0gX
	 0fkSTMQ6mT5499N0yepts6ad/pvxHmVnS73D3qbN09lCNRfr/x2kJrmVFYvmclmbfAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FtUSzxaj;
	arc=none smtp.remote-ip=209.85.160.51
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59337606A6A6
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 21:28:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59337606A6A6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FtUSzxaj
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-4bd734cf350so613006fac.1
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 13:28:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795210101; x=1795814901; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=taf0KVPRoF+3JboQGvuM90twCXz2SjYe05359+kTlN0=;
        b=FtUSzxaj+TW/kizwQ44WcHMK7fkrtbh0TBjEM6Y8hwUmZ6hXvEcdUCkpMuuXDvcCyq
         901SKBaL+Wpgkt3RCD5m8t7BindXheyRFBliuiIzuPFw08GphYwdsHbnJGsiYFRrMYjY
         zdfhChHJPWCyG1X6Ck/PnRnMk+AhlS3elu0s1OWVWQFMpulStuS/IoK6h7KvF77SXFio
         WIldfRkJwcp7xwWS+OCzCPV5Errlwco/6D80BEgc8vUEXS/wT9L+MNToNZXf0SpMDXRh
         km2Mrdt7vlCjZ3fYdvteCdzmVJUYI8Q8URDjXnZsC08f6w6Cqg7+a8+F3R2/1jOJegTs
         e1mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795210101; x=1795814901;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=taf0KVPRoF+3JboQGvuM90twCXz2SjYe05359+kTlN0=;
        b=nmCUJfEhRF7K78ysvOR2lSTss3hTLTPgxpQN6qLHFujX5ryjv3/cEKPV9Bv8hGWDWA
         dcQ+M6ocq8QgEzR95I9xsxvd5g2r8u2x06NykJN43ivfFFzH1yxt6wRFgDT5OAYQcINr
         oENKJeWpALpJE9Y2hCnKNP9mbIa4en05wsUTb8gJCVT1TeG30eSCcQFue21NlOb4Fqob
         ppkXB9fqdmtEe8sTcjFxY8oE/CRyWI3Zr4eQvg97/m//B7rEkQuCLMYoRYXRWrsmBfRm
         n9btF58jOltluU6Q5mmRB2949qS6zkIbIEyb+GUY4sjjLNl5YKZtAZNo8k7X/sUtD9pq
         qwAA==
X-Gm-Message-State: APuU4Z9+rY5iDKXEGg3gLFmAywWOEtJTMVol4ALFP/YI6QzIeV90+2PN
	3hG45mrrGlc58sGHk8cWjhyP/xy5Iov6DGHk9VZlU+Um4EypfzEji676u936bnHk
X-Gm-Gg: AZFdTZch+L6kRs1zRuuUfELfM/soJovr3i5pWXH7qO4eSjoIQKgTLdAc8kJgVfCNndf
	e3oOFGsQ5cthvOgkOq9QQqwg6flyQU11im3at7wmbrQC8WAQ+jXTx2na7HtadUAkIKL+OQZO/83
	71+QKS5kTHrxqpX0/lVJTGRg3FvR/glpiYmzHZAJv5edmtjPTcDjrzR/LP6NRCgJp5vSrMUXZ/r
	VcbtXSz08e7N0O2Q56Vg6A9Yfl04bQ+eei+0q+JmIXVPBREv9fMzzvz8iKc7IaBTo8Q3tKtpsR+
	7aowT1+Zze+gXdqwWQt4CsvHtJ5wdOr6OuSqMGh+xUeo1Axfocog9NbZB1zPqtbq5qTgwm6IIWE
	kbWOxbnQ8CQX369pncM87zJmy/YG5oBf/qt3PN10DTXEcu5v3UhppQ6EVt5tAGTkuGDEU+hgLqP
	zIdc09tcLiPCCXc8T2XkR/HxVbMGhGh3JTqX3PcxEXwtBZ4Iq5RJNEVg6D68A/yF5s8SHc3xy7L
	FNGfd1v+CaxbVS6XTz/RiRQq24qe0e+yuZaCleJO8VJOkqoIqR9JpijDxip1ViNG8TD9pv2DkCg
	m37xTrPjmy/5GHeK1Ij5CW8WdXKaPQ==
X-Received: by 2002:a05:6871:eb09:b0:47b:df9f:6c0 with SMTP id 586e51a60fabf-4bc7d6650bcmr4022958fac.4.1795210100955;
        Fri, 20 Nov 2026 13:28:20 -0800 (PST)
Received: from neuromancer ([75.28.21.198])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4bc5b07d766sm3774126fac.2.2026.11.20.13.28.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 13:28:19 -0800 (PST)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	shawn.lin@rock-chips.com,
	linux-pm@vger.kernel.org,
	heiko@sntech.de,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	sre@kernel.org,
	t.schramm@manjaro.org,
	xsf@rock-chips.com,
	Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH V2 0/3] Add Cellwise CW2217
Date: Fri, 20 Nov 2026 15:28:12 -0600
Message-ID: <20261120212815.35663-1-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.53.0
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

From: Chris Morgan <macromorgan@hotmail.com>

Add the Cellwise CW2217 battery gauge driver. This driver is based on
the sources used for Rockchip's Board Support package [1] but has
been updated to use the regmap API and devm helpers.
[1] https://github.com/rockchip-linux/kernel/blob/develop-6.12/drivers/power/supply/cw221x_battery.c

Changes Since V1:
 - Added a default value for the shunt resistor in the binding
   documentation, and updated the commit description to note that the
   min and max for the battery profile is now per-compatible string.
 - Fixed bugs pointed out by Sashiko bot, and corrected units for
   temp and shunt resistor values.
 - Corrected include pointed out by kernel test robot.
 - Noted in the commit message the patch is based on original work by
   Xu Shengfei at Rockchip. I did not list him as co-developed or
   signed-off since I did not have his permission (yet) to do so,
   but I have his authorship included in the file itself.

Chris Morgan (3):
  dt-bindings: power: cw2015: add cw2215, cw2217, and cw2218
  power: supply: cw2217: Add support for Cellwise cw2217
  arm64: dts: rockchip: Add Battery Gauge to Anbernic Vita-Pro

 .../bindings/power/supply/cw2015_battery.yaml |  41 +-
 .../rockchip/rk3576-anbernic-rg-vita-pro.dts  |  21 +-
 drivers/power/supply/Kconfig                  |  11 +
 drivers/power/supply/Makefile                 |   1 +
 drivers/power/supply/cw2217_battery.c         | 826 ++++++++++++++++++
 5 files changed, 893 insertions(+), 7 deletions(-)
 create mode 100644 drivers/power/supply/cw2217_battery.c

-- 
2.53.0

