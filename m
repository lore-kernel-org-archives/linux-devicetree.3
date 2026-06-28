Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 980C526C3BD
	for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 05:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782624989; cv=none; b=rGs+Znwws+cPDKNHMo/7CsrZS8eXa/eJMBLo03w6GUNdgrfETMNGPW9IMiSCIoqKJ2PkJ35AY3HXvpAh3SP0rcEBFdgHws0A9hGaqGTk9OwmeLeCu78lKE85B1TeXc68mtKAz2vZH3zQo2/JZCErSjjvnyGUPbvLBA8UwC6N0JM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782624989; c=relaxed/simple;
	bh=ymEFJfivOXGFz6eYiUH5jKjoAEKlokoykwFWhf2PY/A=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=F/RXQysJaLlnJGLCqZaAnDZtrlJ6MY6V7WqXpdSDWLtYL5QBNIe1JgkYt5mEJ++GNpeztSNhfgaZz9oMOgiioQR3xiCm8rwEotDbSXeeOuIj/AdxnSb0Rcca4D/iaS76JMt3utRKCck/Nb6g1V7AMbDltRwrlry7Z5r3VqaXkpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KuhNlLz7; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KuhNlLz7"
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-5bbe617d624so1763672e0c.0
        for <devicetree@vger.kernel.org>; Sat, 27 Jun 2026 22:36:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782624986; x=1783229786; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=I1tFIRVND4gynTV/gwf4DkRJpFlAJZQdun+HCmC1qG8=;
        b=KuhNlLz736sRyiA+JXB4/HIB5h6ilzSPKBloil4rRXFfy0eo02woZg/RoCjrtpK8JP
         0vknKnLIVWkwEyXXN0LK87+2jpBh6RX2bj3Rm6KOdtg30HIsNFKxgirIrSvpKQYnsSP8
         Ru5S4ySAM8Dpxey/9nYAFJ7ZIUvd99A54JlffJJUsmAmHCeMWeVnPaupNfGwycDvFmd4
         zc80yXu2+qe2yFcJsnEZVHIJ/hLsaQMue84/txLrZOzJtUw7e2YS6TAK7f1qHZ/SID18
         SKGktfkgrfYkS0bPpQqsrCHCQtMr4W/decMG9A5ky5VPiKymmaJb/w7xI+CAZfNwC9Eg
         NOeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782624986; x=1783229786;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I1tFIRVND4gynTV/gwf4DkRJpFlAJZQdun+HCmC1qG8=;
        b=dG9OY2+rPQG20mEIA5Gvbu0FSeZx49bm6Ci2oWPwwyaMTk3b8/U2rYtsHcZWeLY22+
         NJabsy4P8JCrE1s+A2ezSUO+9bNfgbwEktf+Vrhj14FOFaOHEllh9sXgcoc7RqCUxmWi
         EYLPIMlAtDUo3Pxf+4U33KOpe41G4ai2eY0Q4EbTET7Fua9NhCe+TeymbEhJzFKnYY8a
         w6xucLhVuDdzMKn+70HFWiofHQjzsCFRwoYFJxGL23bvoPuUwaztmsV3sIfke2YMZtt0
         ZosL0PdnVn7anSlhctoe6f+LhHIWCiUJKAw3k8eGkFLhfllxaT2qrvbkBAqOK50wg8ZO
         5gKw==
X-Forwarded-Encrypted: i=1; AHgh+RrHM9l4tW7jc+iCPvZU+5HNPuoFCdFtSt8dLrewQOJkeXdd2jMoixLoe1BqdxMsfpWWZ3zOM5omFrhj@vger.kernel.org
X-Gm-Message-State: AOJu0Yzc4YsaT2mwwN37kk1umRrEkvvzXY90W1L68OkUX+wioU+SXz/1
	e5bIhllhWP5SgC20jkoBQXago6FMIsS/IQ+JuiuDv+yYQVTe0qsfDg/j
X-Gm-Gg: AfdE7cme3hv5ZUmzv437Fj2+u0jPZ5gtOPBA7j9hxrpRVX/XUUc1xdvLQ44/wGYKtkW
	Mc97/MnB+SX3FWvMM1dY8WV2ndLatcwJibKUQJaDXzpVIG6c2TWZ6bf/xQdevtl07cREltTLSxs
	sj5imlrnaPOsl01ICfkT7iSPVArZ98nFmYakXLRk3WvyJxV0Hyg0/J7lF/4y6JqCK7pUbHjRbbO
	KWIaXOZ4do/0/ne8ZPVzj7LonG/Oy9kI9i1QVoPXeZRcHqIimPbxxJTzuoWFTZZzjWbR+0m6llw
	oAxq+gdgcWzwcd5MYZIqGzUo6e1Uu/J2zJ3KcZRL0IqafcjEDLmi5jQOzkeIgXyZ7UeOTLCBff7
	CzQuOnyhUTrbdFtvYyPFxZ9mCgPkRbvR0mwd9++1jyysdCtD5XYhMr+mLJLVcS8BJM81li28lrK
	lD0S2d6pdzYSYQa7wi
X-Received: by 2002:a05:6122:32cb:b0:575:39bc:c6d9 with SMTP id 71dfb90a1353d-5bd6946cf20mr4789622e0c.3.1782624986520;
        Sat, 27 Jun 2026 22:36:26 -0700 (PDT)
Received: from [192.168.100.153] ([2800:bf0:61:1127:ab87:5602:531c:8dfb])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5bda2dd64c3sm229003e0c.1.2026.06.27.22.36.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jun 2026 22:36:26 -0700 (PDT)
From: Kurt Borja <kuurtb@gmail.com>
Subject: [PATCH v2 0/7] iio: adc: Add TI ADS126X ADC family support
Date: Sun, 28 Jun 2026 00:36:01 -0500
Message-Id: <20260628-ads126x-v2-0-4b1b231325ba@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/02Py2rDMBBFf8VoXZXR2/Kq/1Gy0GOUDNRxK7kmJ
 eTfK8dQurx3hsO5d9awEjY2DXdWcaNGy7UH+TKwdAnXM3LKPTMJ0gghPQ+5CWlvvEQrwBkwKSD
 r358VC92epPdTzxdq61J/nuBN7O3OsGCF/GNsggMfvU5uHDMozG/nOdDHa1pmdnoc0Ipf391qP
 cgshoa832dap8FZ68IISgN6X7I2yrgMyUNAMKNQEUSMBQv7v6aP2z2M0Jxo6S6Jr3QoydTLDNF
 L7bxSGqdNdpHHLxSy3r0mAQAA
X-Change-ID: 20251129-ads126x-fb6107505cae
To: Kurt Borja <kuurtb@gmail.com>, Jonathan Cameron <jic23@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, David Lechner <dlechner@baylibre.com>
Cc: =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, linux-iio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jonathan Cameron <jic23@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6149; i=kuurtb@gmail.com;
 h=from:subject:message-id; bh=ymEFJfivOXGFz6eYiUH5jKjoAEKlokoykwFWhf2PY/A=;
 b=owGbwMvMwCUmluBs8WX+lTTG02pJDFkOm87/OWr8TUV6h2TFyVkWgWe8PC97TNvUG86Zv6b5i
 cKGPN3/HaUsDGJcDLJiiiztCYu+PYrKe+t3IPQ+zBxWJpAhDFycAjARxXBGhvc7+du9PG9rhlvJ
 eE/Y+LeL331J4UynqNZ3bop70huWcTIyzLLSXXn6EJeDy+W6WV4Ty3gX7jW9/IW1TI7V8KXenHR
 PJgA=
X-Developer-Key: i=kuurtb@gmail.com; a=openpgp;
 fpr=54D3BE170AEF777983C3C63B57E3B6585920A69A

Hi all,

This series introduces support for TI ADS1262 and ADS1263 ADCs [1].
These devices are very similar (if not the same), except ADS1263
includes a secondary auxiliary ADC.

I plan to add these features to the main driver soon:

  - Automatic calibration
  - GPIO controller capabilities
  - Channel hot-reloading in buffer mode
  - SPI offload support (38400 SPS turns out to be too high for some
    systems)
  - User triggered, automatic calibration (Datasheet 9.4.9)

Additionally, full support for the (less capable) auxiliary ADC is
introduced by the auxiliary ti-ads1263-adc2 driver included in this
series.

The auxiliary ADC operates almost completely independent of the main
ADC. The only consideration that has to be taken for interoperability is
when reading conversion data in direct mode (Datasheet 9.4.7.1), which
happens only in buffer mode, when multiple channels are enabled.

When reading data in direct mode, all SPI activity is forbidden between
the data-ready signal and the data retrieval. To achieve this a second
mutex called xfer_lock was introduced to block SPI activity on the
device.

This is one of the biggest drivers I've developed, so I hope the code
and the comments are self-explainatory. If not, please let me know so I
can clarify them.

As always, thanks for your reviews and help. Submitting upstream is
always a great learning experience :)

[1] https://www.ti.com/lit/ds/symlink/ads1263.pdf

Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
v2:
  dt-bindings
  -----------

  - ADS1262/ADS1263 now use a fallback compatible
    ("ti,ads1263", "ti,ads1262") instead of two independent compatibles,
    as the ADS1263 is a strict superset of the ADS1262.

  - Reworked dt-bindings keeping up with the latest discussion around
    per-channel IDAC and reference source selection. Reference source
    and excitation (IDAC) configuration moved from device-level
    properties to per-channel properties:
      - ti,pos-refmux/ti,neg-refmux -> per-channel "reference-sources"
      - ti,idac{1,2}-pin -> per-channel "excitation-channels"
      - ti,idac{1,2}-microamp -> per-channel "excitation-current-nanoamp"
      - ti,sbias-polarity -> ti,burn-out-polarity
      - ti,sbias-magnitude -> burn-out-current-nanoamp
      - ti,sbias-connection removed, maybe user-space should handle that

  - Split the single "vref-supply" into "refp-supply" and "refn-supply".

  - Renamed "ti,chop-mode" -> "ti,input-chopping" and
    "ti,idac-rotation-mode" -> "ti,idac-chopping".

  - Dropped "ti,rev-vref-pol"; reference polarity reversal is now handled
    automatically by the driver based on refp/refn voltages.

  - "#io-channel-cells" is now per-compatible to address the auxiliary
    ADC.

  - Dropped the "adc" sub-node and the separate ti,ads1263-adc2.yaml
    binding.

  ti-ads1262
  ----------

  - Split the main driver to make review easier.

  - Simplified the series a bit (I'll submit them later):
    - Removed runtime PM support.
    - Removed gpiochip support.
    - Removed channel hot-reloading.
    - Removed manual calibration support.

  - Reworked ads1262_channel struct to avoid bitfields.

  - Reworked firmware parsing and added easy to grep error messages.

  - Reference polarity reversal (MODE0 REFREV) is now applied
    automatically when refp < refn.

  - Reorganized registers and bitfield masks with indentantion. Moved
    bitfield values to enums.

  - Removed union in DMA aligned rx buffer.

  - Reworked the buffer/SPI transfer model.

  - The regmap_bus callbacks now copy regs and values into DMA safe
    buffers before transfer.

  - Now channels in direct mode are enabled with regmap as latency is
    not that big of a deal in this mode.

  - Added per-channel IDAC and reference source configuration. Scale is
    now computed from the per-channel reference source (internal 2.5 V,
    external refp/refn, or AVDD-AVSS).

  - Removed sensor bias (burn-out current) handling, as we are still
    discussing the approach for it.

  ti-ads1263-adc2
  ---------------
  
  - Dropped callbacks in favor of exported (TI_ADS1262 namespace)
    functions

  - Dropped channel hot-reloading

  - The auxiliary device is now instantiated with an explicit device link
    and inherits the parent's OF node; scale/reference handling moved to
    the parent driver.

v1: https://patch.msgid.link/20260612-ads126x-v1-0-894c788d03ed@gmail.com

---
Kurt Borja (7):
      dt-bindings: iio: adc: Add TI ADS126x ADC family
      iio: adc: Add ti-ads1262 driver
      iio: adc: ti-ads1262: Add channel filter support
      iio: adc: ti-ads1262: Add excitation current support
      iio: adc: ti-ads1262: Add conversion delay support
      iio: adc: ti-ads1262: Add buffer and trigger support
      iio: adc: Add ti-ads1263-adc2 driver

 .../devicetree/bindings/iio/adc/ti,ads1262.yaml    |  309 ++++
 MAINTAINERS                                        |    9 +
 drivers/iio/adc/Kconfig                            |   27 +
 drivers/iio/adc/Makefile                           |    2 +
 drivers/iio/adc/ti-ads1262.c                       | 1835 ++++++++++++++++++++
 drivers/iio/adc/ti-ads1262.h                       |   39 +
 drivers/iio/adc/ti-ads1263-adc2.c                  |  379 ++++
 7 files changed, 2600 insertions(+)
---
base-commit: 7667a80340e99fd45357d0c90ae05813b01bbfef
change-id: 20251129-ads126x-fb6107505cae
prerequisite-change-id: 20260514-iio-adc-ti-ads122c14-d0b92479334e:v2
prerequisite-patch-id: 8be45fbe0c6037e775f6ef0e028184403241866c
prerequisite-patch-id: e76673f5e60ebd0a47584756cbcd297cb87d74b7
prerequisite-patch-id: 7eb0e6028d5a49d311e373be866ebae8e83a523a
prerequisite-patch-id: d5c4c4c78f42e6c0b4f186f1ab7f51aa6acd3561
prerequisite-patch-id: ee187ef4a7632cab6bc76c0588c8e2002ac26b7b
prerequisite-patch-id: 31ce1bee6d2c97f43df79c44e5386bf88a9a5d98
prerequisite-patch-id: 3ec60d0638598ef8d006c12a3a8dece2d6bdc54b
prerequisite-patch-id: bbfa2e76f94d06b60e3458dab448579c627225ea

-- 
Thanks, 
 ~ Kurt

