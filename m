Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794645515;
	b=HhWYC20m/fMzclp4KnSe2jS/HKeO9QZxL8cFMV025KKqPYDAH+EUbwxFxgOsPG7qaWZJ
	 AlLSC8zKMxTGl8Y4pn4CSkMWx59OOHwzfNWGRYE/oLu7T+8rERG+jwoDinusvSe3B4UfS
	 gz7DiUaAQE2mufSsImLGfCFM8Sal5Ypq6WWf8pJNJhXa6fJdpu7m9A4Xn/FsLnW9fR+TS
	 UVLPkw1sxuWk842jKcLFRWf8m9C5NjfgE2n3HKYUIydZS/aDaKBg5GOPRGtGn/87TgKy+
	 wc4hqQUonokN3lR2wbm6tQtIGfRv2ZrFSkqFZGsK8MdlhVDqp4bjPd5p0mDsRTRySew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794645515;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=YYFVJGGbyI9lOzoIR2dS97Q3Ec0TWi5IYxjDhkHBa8U=;
	b=VSMprD/LqL7jXnZoUy9B4ZgirHTqnZaPwQEWhTQta2YwVsOLFd83ynW987p8oJ0GEZSC
	 koz7YyUI76dr32A4rwPmE9xGXPc702RVjxWq6qNMgc3kVfhdQ7fkAWJEAAMqSkd1nJBCB
	 nJEX3jEND9+Ojq/6oXbC0498IkUvsht9RPeG2Ygy4+Ha5CkKWT9P3t+/Pp1vzv50jdrJs
	 C/Eo2xF2xXX9/LqRewRPEZO8/p+qZ5MsZWnvW460eNoXqoVBJ6HNvTjzP2cvoh6jD16HD
	 cKs4xxd5LPRI7Xylajwi/Hvz4O2V4+N2kxZLvgNg2ePmNNfHNRG6QeGJaIPSushcUtA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RJvV71qL;
	arc=none smtp.remote-ip=209.85.167.52
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A896606A88A
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 08:38:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A896606A88A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RJvV71qL
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5c1593fd141so2123272e87.0
        for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 00:38:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794645514; x=1795250314; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YYFVJGGbyI9lOzoIR2dS97Q3Ec0TWi5IYxjDhkHBa8U=;
        b=RJvV71qLB4A5+TxPVIrOLati6BchBPyqQWwB81OvQdBLtvmVhWmZbposYFQ3X0KQwQ
         ikbJOPNhi+fmRKqb8dxHA2mkFMXyRjVqBlz/6Xn5CEUJqPwXT4kf6N+R2gj4A8aBMVB6
         YrEMvRdiPrvdWeesu775bVTSSEfISf2wFjFFMecE8Ty4W7Bx1SBRCD7tB5NcLihcI0Qo
         /qxqsnsiQ+fid9GjsApiF0LJYm5u4B0MTe9zUGHecVbqVmiMZx9eYu1oKcNtk6hh94+3
         BBUlgxVn1aU1CI4P8qXE3hOc4H7extgTx6/uW4btcz6fJT/6qdTSi/rH6+gxFUmub3Tf
         69Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794645514; x=1795250314;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YYFVJGGbyI9lOzoIR2dS97Q3Ec0TWi5IYxjDhkHBa8U=;
        b=Wo5k9e86EZMjtQMhU//O2ar6GFrXjePXZEen0atoCElz/bV9ZshGaCq6dw/MWOeJRM
         aK0irFqsVbehCXJE/Owv9hXzRobHKqabkeBv0WhzQyuntZbUwqmfW/NOv8XFroLpMoCl
         Ctm//ojomq2DxCeyPwK39WZVj3jg+MG0Z0AJUiF9Iw2WfKFQtcZgwj3bciqXuIrrxF4s
         AL4wfrnqFiBe27A0Zf+I0ARv/VsAr3aWXfrue2sp+VSngodK/e16z8jYSdVIaR8umt3Z
         ojWZC92n0GH9LYyreFUkmxyTOR50v3MQWUV23pjNFb5Rqh1GbW8hbTYuhqap7y+41RaD
         Rjxg==
X-Gm-Message-State: APuU4Z/VHgPUQt9jMDub+U2s6KDhoVHY7AZvgWqBbWgA4z0kS+OQkB/C
	2yWjS+rpOulrvKK/84gR5hIshx0vMORAokU/+V/0NQRIhOoU8Tz3OdFa
X-Gm-Gg: AYBFou2/eebby2pXlPbWmniOt27E8zTFhY4UiL6S32vR7jdx87knb4yTG8b697ri8bL
	PNEWADXDPe9OFNwzPRYxRCCkohfEJY9MMhZXLw/7cCoxojbejMDn6Ge5lASe0Y5qDiaJcSeLxiX
	R1Lg6i/XSWtYUMlRiTkiwDkSlTTj8krtu63j3rrF+P2GQMnx1coZYYRVZHZN7O5DPnU/sweTQHE
	Rab5nh4uRrcMG1gTg+Kv7Dgb3DUemr501TjCdNtaxj/3CcuxIzHuJzv6Tk6kdEmxS0dcVuBBFaK
	aCzabA9AD6l9BL/YkmUinb9x78LgGuZK2MA6i23pDl8er7Nn/2TdCpVdRFhdDAqrspnV+u3UVm0
	or/zopZ+Twhd032A2Bke6PPhEwoM9y7S0zt+DShOdCPPe/VNmHBDojPdmi1bQg6beTi37KjOrGJ
	43VNFUFmbtbFXPEhWxHlIYWNuI9+6liWppYU7apK30LklcO8jCZJEKL7Ate8z5uOExymxTENDva
	ak22CtwNyHSEtcWOE6FZyl7XP6mFnRH1ftz7oiSKYtA9t+esWnHkOZN8TVWSBUDmxYFO9tfc+XJ
	ULivfiQTcyB1vx+D5Qzr5ENSQ8mjyl7eRjeEwShBlw+HkB53NV0aVbqKSNhMHPDj/YeI1QKr/V1
	OWlVCve/PmNKHCuh6hWPaa2Tbb59FIwzZoMCRpADRqxcaYRVn2a99i/QUR0c=
X-Received: by 2002:a05:6512:401b:b0:5be:516e:5728 with SMTP id 2adb3069b0e04-5c170774474mr1723810e87.32.1794645513336;
        Sat, 14 Nov 2026 00:38:33 -0800 (PST)
Received: from yantra.. (nekmmqusxj170dz200l-1.v6.elisa-laajakaista.fi. [2001:99a:d7d:c300:b551:8edb:536d:8395])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1713565a6sm1527803e87.78.2026.11.14.00.38.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 00:38:32 -0800 (PST)
From: Rupesh Majhi <zoone.rupert@gmail.com>
To: Andy Shevchenko <andy@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Eddie James <eajames@linux.ibm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rupesh Majhi <zoone.rupert@gmail.com>,
	Paulius Zaleckas <paulius.zaleckas@gmail.com>
Subject: [PATCH v2 0/2] iio: pressure: dps310: data-ready trigger
Date: Sat, 14 Nov 2026 10:38:26 +0200
Message-ID: <20261114083828.18059-1-zoone.rupert@gmail.com>
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

DPS310 can raise an interrupt on SDO for each new result. Document it
and use it for a data-ready trigger, so triggered captures follow the
measurements and are stamped with the interrupt time.

With pressure sampled faster than temperature, scans with pressure
need the trigger handler fix [1] to keep up. Without it they come at
the temperature rate, as with any other trigger.

Tested on a DPS310 breakout (0x77) on a BeagleBone Black with SDO to a
GPIO, level-low and falling-edge, with [1] applied: one scan per result
at 1 and 8 Hz, also with the rates at 8/1 and 1/8 Hz, stamps steady to
0.2 ms. With pressure at 1 Hz and temperature at 8 Hz, one temperature
result a second comes 2.4 ms late and the stamps show it. Without an
interrupt nothing changes. Not tested: active high, which needs SDO
strapped low (0x76), and ZTS8032.

If the chip stalls, the case the timeout reset is for, the trigger stops
firing until the buffer is disabled and a read resets the chip.

v2:
- interrupt on temperature results when pressure is not in the scan,
  so a temperature only scan no longer waits in the handler
- limit the trigger to this device, as the interrupt depends on its scan
- local regmap pointer in set_state and probe (Andy)
- rebase on iio/testing

v1: https://lore.kernel.org/linux-iio/20261110154254.39092-1-zoone.rupert@gmail.com/
[1] https://lore.kernel.org/linux-iio/20261113230241.82046-1-zoone.rupert@gmail.com/

Cc: Paulius Zaleckas <paulius.zaleckas@gmail.com>

Rupesh Majhi (2):
  dt-bindings: iio: pressure: infineon,dps310: Add interrupts
  iio: pressure: dps310: add a data-ready trigger

 .../iio/pressure/infineon,dps310.yaml         |  10 ++
 drivers/iio/pressure/dps310.c                 | 139 +++++++++++++++++-
 2 files changed, 145 insertions(+), 4 deletions(-)


base-commit: 7c054db85b5a3ce4d5465cc5cc682cc44ae9eabd
-- 
2.43.0

