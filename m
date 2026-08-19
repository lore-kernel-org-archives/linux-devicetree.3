Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65E503D3498
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 22:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787177711; cv=none; b=qfOlpnoJ15gS7jplyn/KqvhY6t7F0bfsbR3WZIWxFcR53FVQkbVl6RI+Gqz/dD+DbQOjsfjk/6KmIO4HaQJ2TIzJ5OmPQlo0JatvVsNg+TrmPdbdglTFD1Rkj65gKWrKSSxFvXDCE0UHcNhhFU4WOJuNYijCNEVuLct6wIw6chI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787177711; c=relaxed/simple;
	bh=WcROjL/haQz6g7cw3nuvCrVphE1LLE6SgjyUJ/kI2VU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=X9M6VyF3dJur0Z88JAb8BnNYG4cYblUqczDk5erL+RK44/Hh/4P7xMMgHldiBULVrsgEnxBKZsdRKzfNGTGecPiVfSXgehDHiiYwxFIWC0OLGJ4HqyEZr7bkAqQDQYSOzVDJprh+lPHTqkprekT9OMZ3vA+5zIRlTfP3D29EbnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qnf8HTv9; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qnf8HTv9"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-49800c6a846so16435395e9.3
        for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 15:15:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787177709; x=1787782509; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3d3lr8bo9K1njPknlh/R/JyEzj8TOBQAUpyeAix5ZDE=;
        b=Qnf8HTv997cbCuxVsTlv5S/e13CLWXDhzwrrlP8M6lI6HcI9HmBjPxFg9CyAJdG1Io
         7DWs0F9JRdB4VU7GMNWRX7svUjpMv/7Y+ena83KP1XMVIkxjW7sMgxpa9vCt/SKQBQZN
         Vz/iBKzpYAyyQ2NaWGOwLoBS8GSovBQfA1UFAmB7K9FABTIQfoUJDaivrbReVH0PhIMB
         N7zSH4Q8N/asG8ItxsxKIjBL/GjEaSKAbwPcq9C1J1iRqMkuKGgreNMfbCnyfoW1Hle4
         vd3CbYX7AaRd5PHUHtTUGPnOtZLxkAblGP32FRuGMZB5+dylsrr4AKsUNM6Ao8yoOIz+
         kO2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787177709; x=1787782509;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3d3lr8bo9K1njPknlh/R/JyEzj8TOBQAUpyeAix5ZDE=;
        b=oiOzJxqvJBXiIYdddZ7RsOiRM6GHJ/1EELb3nkNKkc7duiUDWmwZO9wFT7YZRRMC0Z
         7LXWQosyNiKTQJHfe4uHPhpOWLnj6EoyN2km9pyIFn4juXXGEjoE8H5Y0nKwBB0jXM/g
         rt9StYdNR7C4wdMAbcsOUjd+MHbj66Fsbgg4SImCcFMGW6xzIP0Wc0q3D4D8VYnYbsgo
         fyMDKCi8ZjW4UD4N9NjLMPUFAg4HqHyyxvpYt9GlchR82OOfzhvNbH73Zw+VYQenondr
         umCLE+RUpWnZbhUGH2NeBIdYL4jtk0j4HiSQGXKjIMW8kAr/gzpGG7GkozB3xJQCQuRK
         y91w==
X-Forwarded-Encrypted: i=1; AHgh+RoIjMAT3LrwpbpWrOo8I7qj2H+fSDzp/lBZlgHdMN3wxQhOA+XjlfGr3TK8h6rQNUclfTNCPRJvqdhD@vger.kernel.org
X-Gm-Message-State: AOJu0YxXHw5GcYHrkG52KAJAao6r3/3FDOQQXQzO0vLQlmiY8F3OTljZ
	G8qMsS7NekW0NcuI6b3zMSEWWkZZvJGmb+FShwFtwB36KIOidsa8vhii
X-Gm-Gg: AR+sD12BECRIWAvhdOi+X15BQljSUHQXg2NF75Stf1MKum6hHZygibHXiy8U4/fKSeT
	7RpJLAIr5l5xfJJJ6YgL4fQn/S51zF9H5gUyObfNJ82Z7asMXEuIe+7qeFQqqGQckJp8/Cg2yk2
	KCxgBXbR8DKw6iZ4wcgc8DxiYkTnyjmWXAMEIdT868J6yX91uZK8ZGrFrhPgc58D2O47LiTygc3
	cxN/1WWK6qcsByrKbwJjLE2PURFqJqrMCSoLlIbyU7LP7WzPiXzUNtXbY8j5mvXsrCXYe7vNrm8
	VCP70od3j7lHmwmzRLrL3arOJldhZKERSfCdkxDavJmOxoxIz00V8ZNT+01yZBS7Ekd0GRH4yF/
	eaI+DYERpHNM43JBnKEEwyOop290FDd/5fYEyvSlUjsSuDgTbgZ6L5SMJzTcTJA0sSTQDkFgaLj
	o4wKSUb6vwTJg4Y6ySGGMjZ4pkzQkR++b1bfK0pcqnr8YAKQoobX9TDOeM7DbYm+O4zoVfj3cFK
	jS2f4UKc8xl0eLBjUThHxlCizdvKaCBEjRKPBbLMYgUVNlW+izPaco=
X-Received: by 2002:a05:600c:3b95:b0:495:48d7:f178 with SMTP id 5b1f17b1804b1-499aa1b97ccmr137923425e9.11.1787177708360;
        Wed, 19 Aug 2026 15:15:08 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-213-45-7-219.pool21345.interbusiness.it. [213.45.7.219])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-482b14c46f2sm9732950f8f.29.2026.08.19.15.15.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 15:15:07 -0700 (PDT)
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
Subject: [PATCH v6 0/3] clk: add support for Airoha AN7583 clock
Date: Thu, 20 Aug 2026 00:14:53 +0200
Message-ID: <20260819221458.30040-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
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

Changes v6:
- Address bot suggestion for DT patch
- Add further information on chip-scu phandle
- Add dedicated PERSTOUT reset and PCIE_HB reset

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

 .../bindings/clock/airoha,en7523-scu.yaml     |  20 ++
 drivers/clk/clk-en7523.c                      | 250 +++++++++++++++++-
 include/dt-bindings/clock/en7523-clk.h        |   3 +
 .../dt-bindings/reset/airoha,an7583-reset.h   |  65 +++++
 4 files changed, 336 insertions(+), 2 deletions(-)
 create mode 100644 include/dt-bindings/reset/airoha,an7583-reset.h

-- 
2.53.0

