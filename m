Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7687C331A6D
	for <devicetree@vger.kernel.org>; Sun, 31 May 2026 19:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780257517; cv=none; b=nNjdjqRSG/VoScVWCLzG9qm+JfNHB4vfsahE4v11cUHEiXjtYHaJZOp83d6m052MFO5oVue0pC68LHlmseVFt1X5Z7x7razGJ2Q19hyx+iYnHMPDJJjvOIESXlsEhbt8RPWme1njMsAzXH0hPWbPgHx/SN0PA9Vj/c6M8IZKkvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780257517; c=relaxed/simple;
	bh=lN6fgVEzxvkD5FRzivriJpyJuNu3ZyEHniYxTYxqcWg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Ej0/7Uo25PS0VhpCbsvCcPh2GQQJCFkW2WoPyAlPbc449Si6YJkmI2zwBVnsPnqepEqRcHUFEU+6nVuITIJbBoXbz9gc+SvEFDGahtyOJ1HOgPVX5k4cYX3Krv3XvvaoVgNxOkwENDUKuFvQE5tNErb6gr90xd4/JdIwa3eDM/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PVM+SeBN; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PVM+SeBN"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-49050ff7cbdso84225565e9.2
        for <devicetree@vger.kernel.org>; Sun, 31 May 2026 12:58:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780257513; x=1780862313; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pCSy1zfOvhUxuZ91rtZd8AGKLsxLUboDSZKK74r6V6c=;
        b=PVM+SeBN1lXdrZuoHecCJ41Kd7eb91Ypc6nXLQ4a94GppGPKR9a+iLpGgcFhxARP9V
         W2y8TQhR7gHF+sITbD7c9QAWR0xlF3Ix/kJt2oGE5iTkmF0hw/+h4yVYCanjmAyON8A8
         6hT9clBCTStoIgPQuCmo1cuTRpoF0iedWWvymdBclhaKe6Yhh/ptZzbzh1d7tTCBOAcU
         wvWG7CAvQ6ycJhkMH7AXxJ/Sn8ybJ2lGLmeBhMgODh+SFbpRgZxLMRUNaWTM60NQOe2g
         UzuH57JKzMpGtwZr0Jw9dK5YYYCNedkLrRVF9crPixRQFY0Ya4ehc/VYiAPViMWmQUsW
         idFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780257513; x=1780862313;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pCSy1zfOvhUxuZ91rtZd8AGKLsxLUboDSZKK74r6V6c=;
        b=euQ8v54aKyxL4W4zajFTPq13cJvofz2dGOFzZFU3Bg2rdomynwiWbYvStId5cREtMa
         ADz0xn9Zo27j8bWwFYfyAxEzWZDZr7+u/z74nuQreYoxFONlFbrLo7Zkh5OfCksNyshW
         59fYHywHg5dDukQ6sr26QRsnEYIFt5eoWbNNO66zarNde70RMiPu2wICNkM6nNKvUSFi
         MwyI85ESYB48e7+9NmM5AYH6zQUGEn1OjE16vc2E6PYvT9z82vW5KhQBc2FdVnklpYFx
         PRXvssgP1rKddyczawF1cziFKKxxFWwUkzRq2JVxa16zaK1cxP8dc18FJ2Kv6MHz79y7
         QmFQ==
X-Forwarded-Encrypted: i=1; AFNElJ8aN77Unub8c5RbpO91Ywxr1ehom4jwMEhW/0JOpPbc+oaoevljy6uZ889bTxH2UeC7IBgd0qEpDZ6g@vger.kernel.org
X-Gm-Message-State: AOJu0Yzrao+eFIdK4RHTytKxoOV8MzalJjTbiTECRnBUZB8aHCIc3n3L
	aiDhcZ0fvb3vX3+eabFV6XkR2Lea+YwftQnitfqNppEJFkuEIu8fM+L4
X-Gm-Gg: Acq92OE9OsGdRvOMmGiZ1q7KxERNLCNSp8yy+h1tEaQeXwCyNuCQmWB8+cuSQ5MxBFd
	QDl+8N17qjvamUsfB5Afom8FC1hDpHtgOruJfkejr8mVWJXe7OcNzKUe1Z0yv4BPHt4moxj7uj/
	rVLiqac/5A61onTA6hD01prXs6WQ2Brm9jT7od+lqLhHQ4s7W6tRPgwMmru914robz1Xf1uTwUx
	iVgYHkzY0q7qAo89qqdvtAKWJ+MMw8aQ7U3NrCb5bT8ZVrbRkWsj7hDQaVA6nYGMzBszaRElkJV
	nJkVwYFMAq2b85m9j+/7JBi1vKjxosLegPh8WDUxxYzOFgdfh9KzszYip3jXpuUjE1E3D292LFr
	aNShwzb3uWb6nME4Z/gBLF4Nq6haTG3Ru8XbAuWL3n4rji8wf2KAu+kG4+LnXDGZxpXaD8axrdM
	/TPz18NxfRn5Y85rgCM67IUa0dywRQEjVMwpACfKaArTgs8wRn+Q==
X-Received: by 2002:a05:600c:c098:b0:490:50ff:7943 with SMTP id 5b1f17b1804b1-490a2923a87mr128270125e9.5.1780257512741;
        Sun, 31 May 2026 12:58:32 -0700 (PDT)
Received: from [127.0.1.1] ([2001:4bb8:152:df59:bc17:a305:8902:fb31])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909d7002e8sm220323775e9.15.2026.05.31.12.58.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2026 12:58:32 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Subject: [PATCH v4 0/4] iio: light: add support for veml6031x00 ALS series
Date: Sun, 31 May 2026 21:58:20 +0200
Message-Id: <20260531-veml6031x00-v4-0-e64f7fdce38d@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIANySHGoC/2XMywrCMBCF4VcpWRuZmaQjdeV7iItpm9hAL9JKq
 Ejf3VQULC7Pge9/qsmNwU3qmD3V6GKYwtCnYXeZqhrpr06HOm1FQBYRCh1d1zIYnAG0SGHZ1AJ
 sRSVxG50P87t2vqTdhOk+jI93POL6fjrEm05EDdqK98JUeufr07WT0O6roVNrJ9LXMuRotpZWe
 wBTCTMK/lnzY8lurUmWCuScoSipzH/tsiwvXImqLx4BAAA=
To: Jonathan Cameron <jic23@kernel.org>, 
 Lars-Peter Clausen <lars@metafoo.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Rishi Gupta <gupt21@gmail.com>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, 
 Matti Vaittinen <mazziesaccount@gmail.com>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>, 
 Jonathan Cameron <jic23@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780257511; l=5703;
 i=javier.carrasco.cruz@gmail.com; s=20260111; h=from:subject:message-id;
 bh=lN6fgVEzxvkD5FRzivriJpyJuNu3ZyEHniYxTYxqcWg=;
 b=Oc/M14tKcAM+r6bvkNzKFkk1WpkSPO2wvRpWWIMpy8PPazqwVQN6YJ9oxStpWHJt2hz+xDPAs
 foBgCZJ40PzDyzYllR61WA1QiVlGiE+QImzthEeCakJFhaYm/50Lt2c
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=Lge8w8xidNSf/INy7JAIbAW+Hezkp3nsBh2OjKL7lLU=

These ambient light sensors with I2C interface provide two light
channels (ALS and IR), high/low threshold alarms with configurable
persistence, and a data ready signal.

The devices covered by this driver have the same resolution, and they
share most of their functionality. These are the differences between
them (note that the x belongs to their names, and it is not a wildcard):

 - Device ID: accessible via two 8-byte registers, different values for
   veml6031x00/veml6031x01 and veml60311x00/veml60311x01.
 - I2C address: same grouping, 0x29 and 0x10 I2C addresses.
 - AEC qualification: AEC-Q100 for veml6031x00/veml60311x00 and
   AEC-Q101 for veml6031x01/veml60311x01.

The alarms and the data ready signals share the interrupt pin, and an
interrupt status register must be accessed to identify the source. Such
multiplexing is not new in IIO, and I have followed existing examples
for it. The persistence setting (own attribute) to trigger the alarms
uses the pattern that has already been used for the veml6030.

The device configuration is in general documented in the datasheet and
the application note. There is an exception, though: the activation of
the "active force" mode that is required for the data ready signal must
be carried out in two steps even though the affected bits are located in
the same register: first ALS_AF (active force mode enable) must be set,
and then ALS_TRIG (active force trigger setting) must be enabled. I have
added a brief commentary in the code to explain this behavior, which has
been confirmed by the manufacturer.

The only functionality that has not been implemented yet is the x0.66
gain (and its x0.165 counterpart when PD_DIV=1), which makes the gts
helpers less usable due to the conversions required. It is indeed an
uncommon gain to use (there are x0.5 and x0.125 gains) with no known
use-case at the moment that justifies making adjustments to the gts
helpers or adding artificial conversions to make it work.

This driver has been tested with the four supported devices separately
as well as in pairs where the I2C addresses don't overlap.

To: Jonathan Cameron <jic23@kernel.org>
To: Lars-Peter Clausen <lars@metafoo.de>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Rishi Gupta <gupt21@gmail.com>
To: David Lechner <dlechner@baylibre.com>
To: Nuno Sá <nuno.sa@analog.com>
To: Andy Shevchenko <andy@kernel.org>
To: Matti Vaittinen <mazziesaccount@gmail.com>
Cc: linux-iio@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>

Changes in v4:
- [1/4] Entry in alphabetical order for MAINTAINERS.
- [2/4] Fix style for device ID tables.
- [2/4] Add missing header mod_devicetable.h and move iio/sysfs.h to
  [4/4] for the persistence attribute.
- [2/4] Move IIO_DEV_ACQUIRE_DIRECT_MODE to [3/4] where buffers are
  added.
- [3/4] Use test_bit() to check the active scan mask.
- [2/4] Add mutex for operations on scattered register fields.
- [2/4] Add shutdown action after turning the device on.
- Link to v3: https://lore.kernel.org/r/20260524-veml6031x00-v3-0-29165609b2b5@gmail.com

Changes in v3:
- Move veml6030 fixes to a separate patch stack.
- Use C99 initializers for i2c_device_id.
- Split driver code into multiple patches to ease its review.
- Rework locking to get rid of atomic increment/decrement ops.
- Fix error paths in pm_runtime operations.
- Use IIO_DEV_ACQUIRE_DIRECT_MODE for single read/write ops.
- Link to v2: https://lore.kernel.org/r/20260513-veml6031x00-v2-0-4703ca661a1d@gmail.com

Changes in v2:
- Add commit to fix bug in veml6030.c (channel type when pushing
  events) and remove dead code.
- Use gts helpers to simplify operations.
- Drop unused gain_idx.
- Build INT_MASK as an OR operation of the involved bits.
- Format arrays to follow the desired standard for IIO.
- Directly return function result as the last operation within another
  function instead of 'ret = x; if (ret) return ret; return 0;'.
- Fix some spacing (double space, tab for alignemnt in info struct).
- Use sizeof() for __le16 reg instead of 2.
- Return an error if the part ID could not be read.
- Spell out sd -> shutdown.
- Use devm_mutex_init() instead of mutex_init().
- Avoid using conditional guard, use claim/release instead.
- Access integration times from the global array to get and set the
  integration time instead of using a switch.
- Simplify read of available periods (persistence).
- Drop IRQF_TRIGGER_FALLING in the threaded irq request.
- Add regmap ranges.
- Link to v1: https://lore.kernel.org/r/20241126-veml6031x00-v1-0-4affa62bfefd@gmail.com

---
Javier Carrasco (4):
      dt-bindings: iio: light: veml6030: add veml6031x00 ALS series
      iio: light: add support for veml6031x00 ALS series
      iio: light: veml6031x00: add support for triggered buffers
      iio: light: veml6031x00: add support for events and trigger

 .../bindings/iio/light/vishay,veml6030.yaml        |   23 +-
 MAINTAINERS                                        |    6 +
 drivers/iio/light/Kconfig                          |   14 +
 drivers/iio/light/Makefile                         |    1 +
 drivers/iio/light/veml6031x00.c                    | 1228 ++++++++++++++++++++
 5 files changed, 1271 insertions(+), 1 deletion(-)
---
base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
change-id: 20241109-veml6031x00-aa9463da064a

Best regards,
-- 
Javier Carrasco <javier.carrasco.cruz@gmail.com>

