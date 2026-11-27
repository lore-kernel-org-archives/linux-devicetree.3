Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795791277;
	b=od9RKyrWMWft9jDIla/InUNdqyRlR+CUcIkfac6SqKoOPhPx0TkfToAjD3QifHhhw8Je
	 dUgSNKeQQoMvMe5/aqbhYflgVIzZ2+gQx6oiX57cFnM27DkH7REyu4T05EuuJvhnFQA6u
	 39eaPXpc/CcuErbYu9QdL/UKqGq28PzYcVZe/c7vXCBoqlcIpfRXUSNw32Zer4f05//dI
	 NZBjT45VB3+ZHYezxqgF9sz05nFclTEZfiDdRWkWVWPKn3LWenRIvGAcwFQ7bxp+uWqUt
	 pZ38+/J4HDFAGveKPKbmzyzMV2WxmF+W6PCi02xsxlrDVAZhXOnIT6dj5Z5yaIRBjtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795791277;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=SXH1zIVRj+Q3VwOmk7BHfXhp1QrzFmDJnc3rVMFxfIc=;
	b=5DGHjIUQVXniJ2dPVBl87b2AL2uOx7opgC4S6sv/Bk0uxGDrHg0sGNNTbjbFGh7rxWnE
	 /FzaAgVQU9hlj//SpBglIFt8yqo6ZfNHd9JB3C/k7VNiRlQQfe2pjx/20f2e4aI2i4+6S
	 UlGGWaR7bEoCOqwzjDQDYs19U2dloDE3DkvjVgiF+kkWmQm0oB69kPI4PWooBO4nDyr+8
	 KapouHplB7vuKiLDH3SjLXiRgoPwn5Lrno2waRmwBW1rfEDJUoyd5r7/drFant8Q1mdCc
	 hL8+8jccjKp5qOKMV1lZUTQgit/MDVJimp4ANytgRgIQZt5tcgDatWVl4r2c2AKjxPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fOjGfMnF;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB28E606A321
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 14:54:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB28E606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fOjGfMnF
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-4a68190a2a7so6955031f8f.1
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 06:54:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795791275; x=1796396075; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SXH1zIVRj+Q3VwOmk7BHfXhp1QrzFmDJnc3rVMFxfIc=;
        b=fOjGfMnFaW36gM86CXslowU1BzK/v4A+WDcBbTjfhZ+rNc72cdan4L4cfify1+1saF
         DBHCatuJmKztS6vCn4E1yTcWKWoExE1dRi1DFsueQ4VYUNkqJyCxRVd+SvZDxDQKq8Rs
         4UQu6StiJokIcbadYqyyxNKMMJ5SEqd2LI+1ZfM6CwViCTVm+LjXvVoqeo275KkFJfM7
         e8CW6QTpKsNceMfaphZjXDbjhZFtDLSxNlbjn8D2XBFcphdV4ozlL74UfjvqMNED2yTz
         tPkH088xEFLatv8lS4Gsm6dyKMmrq4s814RuxU6L33x1WdxbV8ZEXOCczqDs7k7U9pQ5
         BkSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795791275; x=1796396075;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SXH1zIVRj+Q3VwOmk7BHfXhp1QrzFmDJnc3rVMFxfIc=;
        b=vSTgGRJ+tyo4dMuffNXdAYq++RjBzYfls2TYAV2uufXjkrVNBF3LeMi/NVo13OC4hB
         n9ia9IzUog+LFr22OAi2aT1jigAFhrmCTNddDoVtLdoZaLqvLmqeL0RzhKQqJX4XFqd/
         p93+u/Haf/5lmvtdM6bk0ml5QVdRzT9rkT65kEPQbr36uunpV1djzJsWSvXNdaF04ou4
         pVY4tqQ7p11RkZrV7JfJATydh4XRGoOp/JQV3hQTey5xwd16fubSAM7WSVEnYT4UVb5J
         40zXW/zhtLdYQupdFjwjpm4I8U+ybHPAZg8u4sP4AOQFJDzHHJCk1e+hJTDJdmKHMNPA
         ZuXw==
X-Forwarded-Encrypted: i=1; AL+hErEpxX1v4nq5YKf95sLtb3Ad9CvA74FKUpCDD+gkN4pQPt8L1gxRI9+mPEmhK2PBfAyUYxbabEV/NYYD@vger.kernel.org
X-Gm-Message-State: APuU4Z99JTptcewVYjkBrQZUKVZi4W/kAFb0v+Pbnp9+X3OJOzNAuPli
	oBuv4H7ujVxpLPaqhqEIcit7V3YdMJwdBHSyu+Oz3uyNSSOpkrqosOy3
X-Gm-Gg: AZFdTZf1GMBeYDgstpHlOj4uR6ry7pilOoL5STtL6yeSWn6UYNQY2M+D+88ytnbh2UH
	n7+3kKF6U+tens1pqN8nsSrNmxGkMVkBm5dlNEsk8URBiB/RxV2alZYDqt+76B6GqcXLsCVn3qd
	J8/xztVPOfb2PI0rVipswboLJuv6wdND12j+ZFHl11ozFqU+yosNRYcKbLZZaVWUuDSMyADaXWD
	Dw/ewXS2MqvW+dTumZMVRsHneyjrBOhnWL0ZJxZ1vtQZhOnvnEKNt/LsLhdcajDpHfEdqiwsD6N
	FmfHSxzbAnFdzRyOt6SvSJ7EMejUmLKB7fF9K7/wuZdQJ6GabH1bUA6gNDy4Rq+qcpNCdxYHDY0
	u/hsRkdTdFR5LkVlM4BlEMivm0/+qVDTz9aRaz9pMF2s0nYWq5bPT7FRNrOyoRGZDbAUM++Os6a
	JXt08gO24rbQUtSGZkpeViVpeWj2WTmogkUCHbiaRzjXEu1NudBnjVm3w45kDQS0Cy6p3JIvTHC
	Ib6MLKF+uH4HuQnN6yRChDMo0znELXKf/0VDO63wP1CrAVTxSdbbuDRVDshpgCvEUzwEbWgN/bq
	Venc9jsxoreWhdA63zOATiNEWCrBsbeFoVGbUKa/7aq0yESpPmC0jmo90hur+ABhJYQDDL+Ogt/
	/ozw=
X-Received: by 2002:a05:600d:a:b0:4bb:aa4f:c01d with SMTP id 5b1f17b1804b1-4bbaa4fc151mr122964855e9.1.1795791275057;
        Fri, 27 Nov 2026 06:54:35 -0800 (PST)
Received: from emanueleg-nb (host-87-4-46-207.retail.telecomitalia.it. [87.4.46.207])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88442693sm633589105e9.1.2026.11.27.06.54.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 06:54:34 -0800 (PST)
From: Emanuele Ghidoli <ghidoliemanuele@gmail.com>
To: Sebastian Reichel <sre@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Emanuele Ghidoli <ghidoliemanuele@gmail.com>,
	Francesco Dolcini <francesco@dolcini.it>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Rob Herring <robh@kernel.org>
Cc: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v1 0/2] power: reset: tdx-ec-poweroff: Add Aquila IQ8 support
Date: Fri, 27 Nov 2026 15:54:22 +0100
Message-ID: <20261127145429.2060162-1-ghidoliemanuele@gmail.com>
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

From: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>

The Toradex Aquila IQ8 module has an Embedded Controller from the same
family as the one on the SMARC iMX8MP and SMARC iMX95 modules. It
implements the same I2C programming interface, with the same power-off
and reset commands, so the existing driver works unchanged through the
toradex,smarc-ec fallback compatible.

Patch 1 adds the toradex,aquila-iq8-ec compatible and updates the
description.

Patch 2 allows the driver to be built on Qualcomm platforms and updates
module description.

Emanuele Ghidoli (2):
  dt-bindings: power: reset: Document the Toradex Aquila IQ8 EC
  power: reset: tdx-ec-poweroff: Allow building on Qualcomm platforms

 .../bindings/power/reset/toradex,smarc-ec.yaml        | 11 +++++------
 drivers/power/reset/Kconfig                           |  9 ++++-----
 drivers/power/reset/tdx-ec-poweroff.c                 |  2 +-
 3 files changed, 10 insertions(+), 12 deletions(-)

-- 
2.53.0

