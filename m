Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793956812;
	b=ua0d2T7y3fduwfsycKNfB3CEe0HGox6Fu7vlGWXKk+hzLCLy/rhkNxExuVBK4/1ijYiB
	 rac2fijUgFMJ6IJ++1cVs+ZV5yUs9Vv2tdtcpTz7QZcjF95UuUjZEd+Ofi25dgxS8cKrQ
	 k9Km4eC5SJBFLqDhFvdfzA82iOZ+htQaukr6nV6NzftPjtQ516k2IMV64EsR+cY/FVCgt
	 4i2visVo4tEkBPVQ+vOxY5OmxGdaPRPaAJ/s9rbssRdlajshrtaQlSmQAU5hy3SPVZQoA
	 g8LIj4/okV5ZffYVgHoVXt7YBmFurrW3IccOEdEagh9T6H+GjcBWdS+/e/uWNL8Nh6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793956812;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=BKerVZtCZFwecLdtYHkc8Z2DgusctMkHx27dYOPZMso=;
	b=jsPoQQRRdX0TPXd/0gyLQD21zmonupSllb8QQjp2C50evVm951j+02cPwZe+h2xlcJCA
	 HW+x05uxIZJUz6TsPFa58AwHhU5ufwa7muAArxWHjwtHu233MwPqdsKOGGRHHPB9yKDar
	 OvyEyLGVSSJ213eQH9zZy+JDkb+1eQ768idd36iz7vHJKoW2+ImlsjxIjfn1RWDePJNg6
	 3bsG0N35HtyFwAQ0TUUaEZuFfdw9A83R7sb4KxEUaWeBk4frdP90N/cgRxmWmMw8h2Nn8
	 DN09DU/075cTth0EuTjdi2NSvHOK+EL/Ep+qsDU7omAG6X8F7zDsbOKrpds0jWghk0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YB9MA4lw;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B922606EE8A
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 09:20:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B922606EE8A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YB9MA4lw
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a35ac4475dso3092885e9.2
        for <devicetree@vger.kernel.org>; Fri, 06 Nov 2026 01:20:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793956811; x=1794561611; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BKerVZtCZFwecLdtYHkc8Z2DgusctMkHx27dYOPZMso=;
        b=YB9MA4lwBxStiouVrtcdnPQGCzOVF1UehqAaZuv7DxdSERaz23YPJ6PkrQ6A7eVaP5
         IwnwJxuVEDeupExS+TobQjHDN5w2HoGk3KMn3TLst1/zC81sx4oLVPclabeaX6OH8Mxy
         X1a1QPiF1UXmmF9etMn+YLF3ZhhqCcYg8q3lCORpQy/uiZW950/aWuxPkGRPh2nGPo64
         XGyU1NcfwR475BTyWg/SogOWWJ3jJamrMLz43TuzM0u4hLCPz/Knt4ok0UKT+ez/8VWB
         5E4czxvdNEdggWuCLaeolQT1Kq6NvGaAL9OdKEdY0bMcgCoJmmlZseDtkgQeduWYjBIH
         /ReA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793956811; x=1794561611;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BKerVZtCZFwecLdtYHkc8Z2DgusctMkHx27dYOPZMso=;
        b=Xvc8aLauozmr1ryZBS07R6NW0ug8HTZi3iUUG4YgxODRerFtazzhjiUMnLAQuIfnjv
         nuQyO4jjL2kcCZPk38NqpGwN8iJLR9Dj+VYPps/zNSAI99D2JUiEHdCZbFFiogaty0eq
         XNTHLXxSOPTQe9dcVA0B4vcUJmI3zgr/k2b2+QD8Lpl2Uz7xTgRIMtJP0JeR8YDC7IAz
         J6EJliHFFaVQS6Ljtynn2mw6NYLe5wmA24LdKrSxHV6E5DFaRSrS+FlDmd9ptQa4b5nW
         f0Qofy3DZkQaaF5MzJb6Rl37yldFxdFZpf3WoC4G3dgDBnYEV5kZsP+l63VRYOJLuAct
         3r5A==
X-Forwarded-Encrypted: i=1; AKwUvBy3xB1GubVgaAsSGm1tGPPMn57nQ8+1cOnY7ngv1yCIsta2/YbyuD8mctOIo08i4yFQixnncQIl8eCp@vger.kernel.org
X-Gm-Message-State: APuU4Z/09aoeCSSjAuovQdYmYMJiiEJNQRcOVtMXwnVfUTbOJcKVY1yL
	O2os3U0i2nH42aGKfbzi9/UuNnwYlNmxL+rQEN/NRAC81AWB5zwP9VP4
X-Gm-Gg: AYBFou1X603oXB5nCX1nvN4haXXCyVAe+dN/uLZ/G8MN1iDJHaql9YEF1H5ytbGH0Q9
	+ToA9nwdpsg+x98b6KGeUZyl3rWkZibxyrIyEfqBEnZezD+ONVkMxFMtaReRjpxqmO38LISyilH
	xaAhjXf9bAcujTaqvQGD/GfwXFy0ch1d1N7jDmakT61s+G8U1sVU1z2+bW2mbjMOgjmw6PSETH1
	/j+Ys9T5BU/OvCEpICQo+KfYJIpmur1ZNxcNiatfYTeZWsFCcfWZR8Xz2P6Ny3RDqcdb7jpORRq
	VWBAbi3+Yy52/T8JjmpFBwlN2JrMdCuf5Ew+O7xx5LEsJ4Q0poNtaXl/1Emv2qK2CZAstv1J7lH
	3KVYdOC9ABb9HAXYzXjS1TKi5YELCyhqOgGDt5fjrkDWW1Yw0cuDpC0mR/jlJF+5AYdamXcjYmK
	6n0oszM9oBBrKEtxdi3pKn5YeMrewFdvY6qMB368GYaWRRUjmi6Mzuy1SBenNpVILV3ilpnuvEx
	TAIlI16BoZCyKFdvsI7sWhMXHbErA2TJRP9T6D34ariT3pUaL+eLSwSsSuI8lYC2u6bbQ8GQ/+U
	4xw1KQ2Fdgx5ECzi6CF4FppmcXEmrBGVzLHEMzrxai9+jJcreLM1ob5vcG0hxN0jLdlglV9tgB/
	HM1BUl7lY+w==
X-Received: by 2002:a05:600c:4e8f:b0:4b6:540d:6317 with SMTP id 5b1f17b1804b1-4b6df3fd1cfmr29585725e9.12.1793956810406;
        Fri, 06 Nov 2026 01:20:10 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b57203a98fsm108358935e9.4.2026.11.06.01.20.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 01:20:09 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Esben Haabendal <esben@geanix.com>,
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Pan Chuang <panchuang@vivo.com>,
	Hemanth Selam <hemanth.selam@gmail.com>,
	Antoniu Miclaus <antoniu.miclaus@analog.com>,
	Nikita Travkin <nikita@trvn.ru>
Cc: linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/4] iio: light: ltr501: Add LTR-659PS-01 prox sensor support
Date: Fri,  6 Nov 2026 11:19:39 +0200
Message-ID: <20261106091943.35783-1-clamor95@gmail.com>
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

Add support for the Lite-On LTR-659PS-01 proximity sensor. This device is
nearly identical to the LTR-559ALS-01, but omits all elements related to
ambient light sensing.

---
Changes in v2:

- set IIO_PROXIMITY channel to scan_index 2 since driver will not handle other
  id properly
- add IIO_CHAN_INFO_SAMP_FREQ for IIO_PROXIMITY channel
- isolate missed ALS register calls
- add commit to use read_avail operation
- convert to use modern chip info match
---

Svyatoslav Ryhel (4):
  iio: light: ltr501: Switch to read_avail() op from manual attribute
    registration
  iio: light: ltr501: Switch to modern match mechanism
  dt-bindings: iio: light: ltr501: Document LTR659 proximity sensor
  iio: light: ltr501: Add support for the LTR-659PS-01 proximity sensor

 .../bindings/iio/light/liteon,ltr501.yaml     |   1 +
 drivers/iio/light/ltr501.c                    | 383 +++++++++---------
 2 files changed, 184 insertions(+), 200 deletions(-)

-- 
2.53.0

