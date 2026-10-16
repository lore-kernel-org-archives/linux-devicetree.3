Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8A732EB874
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 01:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792113772; cv=none; b=IpIYpdld5jeMuGUVqNj2FtfDC60KwpLicvTbckSID+qpGnsRdR71PO3qL4W+U6eLHDKlRDJ00N17bXMj+1NkA9GpvvePoi3AIxIyapQhl3y1WoFv/h0OU6pvIYZZ5iGQTPr5HsLrct+qZhmHlFj4TIuEX7GyMsAmfBBpJ7//yHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792113772; c=relaxed/simple;
	bh=rz5mfMuLquktYc5UT06H8blAchlq3hj5vRBS+fii45c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W77qa6KSRyzZr+h+7jhptIe641V+6+EtmKtJD80rwEDOuT7ltOmkUeCEBsyWzWzLNNRwntGzQyqvm6OwrcuBKV4peVGFVCPkNK/ex30skbtgjDKpUyv2hGlX8P55+vw5C/my2h/czhLsWqpNYjYsTG77+CFJ7RwkuGkxKv/4HPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PIHlm/5X; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PIHlm/5X"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cbedd5aece4so279484a12.0
        for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 18:22:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792113770; x=1792718570; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gL3pDn4jj9S8lXM0dBJ6XEBotoeqvIua7Rj4E6jDdyI=;
        b=PIHlm/5XTZnbxnJm4hISlIgh1CsqqDrpFzsReQD/YTWR1E1HJz6+z/tvtnB3w0PzSi
         IAfEsgbEXu6b8P9z3XRp2FmITi5peUkTtx+xq9mwJz9pl9wGqts6sQrtaBsmd8l0tH4d
         f+zZWOJ0q1P6b/Qcwgbv4mZoTL7eN767KWMR1SNYPt2XdUuyMzASepuSjaXUUVXr3a5y
         eIQ1tachO5jZnF+Tm2kY8F4cymJFo1mjDDsR/6fvG6VU8BrYq6fw/kFQpeavheCbFcAA
         Dq9gySqTV1D+Ow50o3DbehV6QLKt+D/24byLv5qmqqv+7QXrm0+wsk1qDmslOKJOUdjT
         lDXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792113770; x=1792718570;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gL3pDn4jj9S8lXM0dBJ6XEBotoeqvIua7Rj4E6jDdyI=;
        b=px+Wt7kMu7oDR37nObpIBtACHDnJDHn5GMC+UvegtNmw8mFVHdFz2opLojx4KLIRq1
         5L6OgbiQMmingEl1qL8j/QP3odBb8rOPa4AnHPhsDZV4KkkDDpEzqSYwNsETsd/koMYM
         AqqXbixqKxMBfZa+eQm3b1NDJEAUADWEpKEzqRXfON5hGdjn2rEiBUAcwSSyMEIEnad8
         Xo8HT/jO2F9HoEwFdnCKV5O1m+AYaJq2LbXIyV/5/gZ0XdITPeYNvtgDjdePfUUPmf+N
         ykgRJDGnI1gEkukvuLUYphDuskB4xFqhGA8kwRbS2+3Jyitv9vY1a09WFIc/Ebbtok0A
         gHYQ==
X-Forwarded-Encrypted: i=1; AKwUvBymQRB+eECExKbTNhz3Xu4bZbzMts5AGZF+RXNZFTVaXTRWGFd2Gu1LzU6IwQTAvPUGwKRONnaHa6g3@vger.kernel.org
X-Gm-Message-State: AFq9FYLfebDvELpplvmEfAz+ceMJ5afI+1aLb2vWeHfN4oEkd5v9AAj6
	iQBjZSQYRkAX+O6RvTePHPSjn0WRIeHXGeYb3hO65A//H+EcDjB1Rs0w
X-Gm-Gg: AYBFou1XjGaZ1QHGQJAaW2JZmabJdAX27ygtgflcQyRc0sdg/s2TVadLEn8Kcxo10az
	fikJaEUdbweucLepOTXFpxVbwScrtzFtKGVbUcRlNNPkNjkbauxQ9dzbVyxwxlJmTwcv0bGiS5c
	a1aQ4iPqz8GclU8X3Si0W5a8lOs+R9LVgSoesZMYAyWFlvz+3j1vYZy/bCQX0qJoQC9sAIItQaJ
	JVh06QhQ1hauLqC4VQJl3PciLU6RMzF1mJXOxlySOwLKNQqxMRs7B/jK4H98MopvgfaXaCW7MBp
	6u9owvN0EeFYM1TOwhw666P5JVqNYU37K73qaYkoihxBIjlwGK+ckmXKgyNuooRVKsafZlvB2vG
	WiAEP5dszLtJLb5pjoTL3TbXQzuZ3vIzsGwQtvhiLuWjvXP1rThtSdSg/Jw9WDeu0tdiOR77wGC
	KFdK9MoHISTgxNVwv///g3HHYT+V17DoXEDdXqzNy8JZnvBsmyjDYZR+uN7uSYpjOS0p4tlmaR+
	nvtYEQFcWqqt5nic9846g==
X-Received: by 2002:a17:90b:4b87:b0:3a8:337d:228a with SMTP id 98e67ed59e1d1-3acbb68a083mr1147343a91.6.1792113770137;
        Thu, 15 Oct 2026 18:22:50 -0700 (PDT)
Received: from l (ec2-56-155-112-168.ap-northeast-3.compute.amazonaws.com. [56.155.112.168])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acd05fb680sm474327a91.2.2026.10.15.18.22.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 18:22:48 -0700 (PDT)
From: Liu Yufei <lyf98405@gmail.com>
X-Google-Original-From: Liu Yufei <lyf98405@gmail.com
To: Jonathan Cameron <jic23@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Joshua Crofts <joshua.crofts1@gmail.com>,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Liu Yufei <lyf98405@gmail.com>
Subject: [PATCH v3 0/2] iio: proximity: Add Vishay VCNL36829 driver
Date: Fri, 16 Oct 2026 09:22:16 +0800
Message-ID: <20261016012218.40223-1-lyf98405@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261006100943.78971-1-lyf98405@gmail.com>
References: <20261006100943.78971-1-lyf98405@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Liu Yufei <lyf98405@gmail.com>

This series adds support for the Vishay VCNL36829, an I2C proximity
sensor with an integrated VCSEL emitter.

Patch 1 adds the devicetree binding.
Patch 2 adds the IIO driver, which exposes the proximity reading and
a configurable integration time.

Tested on Orange Pi Zero 2W.

Changes in v3:
- driver: Collect Reviewed-by from Joshua Crofts and Andy Shevchenko.
- driver: Use dev_info() instead of dev_warn() for an unknown device
  ID (Joshua Crofts).
- driver: Wrap the write_raw() arguments on a logical boundary
  (Andy Shevchenko).

Changes in v2:
- dt-bindings: Collect Reviewed-by from Krzysztof.
- driver: Address review comments from Andy:
  - Use a Datasheet: tag in the commit message.
  - Drop mod_devicetable.h, sort the includes and include what is used.
  - Drop the i2c_client pointer from the private data and use
    regmap_get_device() instead.
  - Drop the unused i2c_set_clientdata().
  - Enable a maple regmap cache, mark PS_DATA and DEV_ID volatile.
  - Rework the integration time validation in write_raw().
  - Use reverse xmas tree order for local variables.
  - Document the power-up delay and use 3 * USEC_PER_MSEC.
  - Warn and continue on an unknown device ID instead of failing.
  - Join lines that fit within 100 columns.
  - Simplify the Assisted-by tag.
- driver: Drop the i2c_check_functionality() call, as
  devm_regmap_init_i2c() already checks the adapter capabilities.

Link to v2: https://lore.kernel.org/linux-iio/20261006100943.78971-1-lyf98405@gmail.com/
Link to v1: https://lore.kernel.org/linux-iio/20261003050453.413700-1-lyf98405@gmail.com/

Liu Yufei (2):
  dt-bindings: iio: proximity: Add Vishay VCNL36829
  iio: proximity: Add driver for Vishay VCNL36829

 .../iio/proximity/vishay,vcnl36829.yaml       |  55 ++++
 MAINTAINERS                                   |   6 +
 drivers/iio/proximity/Kconfig                 |  11 +
 drivers/iio/proximity/Makefile                |   1 +
 drivers/iio/proximity/vcnl36829.c             | 298 ++++++++++++++++++
 5 files changed, 371 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/proximity/vishay,vcnl36829.yaml
 create mode 100644 drivers/iio/proximity/vcnl36829.c

base-commit: 52c36105f76e96b638152a42e735f2e7767ed946
-- 
2.53.0

