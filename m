Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794814818;
	b=SzNILBFGYFOQM8VPjjuGPoM/33PoXcLhGu3z9NADTKjt7838t8o/IswesQgxeni4YNRb
	 ZgUKbDxszf8jRFdurPmg2jUfh6YpEapdDFkjw7HoGbYKzuj6/682HpeQK6jwcBt8/hs1Z
	 5fkew8ONtnpfSOJXFTq+B75ZCej2nOL5+Y21opMjG6J5cpV4XQRrQ9LR4+4kwREiOxOoa
	 nsHp1UbdM4iz6aUZJXTZKWiaNB0PctdRBmROIhEvb8JTD1XGbEPszcxxiX5QtbJ8jTWuM
	 YiTi2/p39I3ZpDeiPeseJiHoiIq0j7LOQOGtJRjq7kmuy/qKJn2WlXZEpwfFZ2/affg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794814818;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=NqqPkO6TP9CP+I+rGLVpJtch/uB+AU8T9QDkOfxCb7M=;
	b=ebVwicqnF4ZYAkdWY6yXGE5OIrjqpKh/IA1qzI9KqhENoKZMxNepZZyGQEMVscTzWEHQ
	 cSw0j4+E9m+gDk+BZwFmPA1yIDoAx8Kv6DLXuPyqTbg4QbZ6bc35EOXtH91zG/TFNB+9F
	 f4pHjoFqqud7eF1LRsH28beD0uGIjSMBA9pxq8wi0NQYhEj1vtjvxh8dsluniyfc7/Eue
	 Dlcrzwsw6qpyEP+RcXDwuBkuYSNL+JsTRkbT92Br0IJ6rxozZqYZAxgQk4Fgw0yMi+lK/
	 9as+mBj1FHBzrTR9anP2piZ6DZYggCXrdZQgEsIS78SI+M0cfsA1OM9dglyX3xr7F8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=G06NtBSj;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DB1D606F1BC
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 07:40:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6DB1D606F1BC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=G06NtBSj
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4bb6adaf0f1so6608415e9.0
        for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 23:40:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794814817; x=1795419617; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NqqPkO6TP9CP+I+rGLVpJtch/uB+AU8T9QDkOfxCb7M=;
        b=G06NtBSjoTjhJShTRkcPAR6AQMurGbI3UCOUAedyls4HuNZ/+Vjwf+roHnovmdZPJ4
         uRMPnMdqk3fsmDfXq4kxeJVjqrqwkNOQsn1i5fWmH0862jJ5MVtfN9/ZFNc3Vq9mcmKF
         8w7lpDh/4W8YDreTFWVhK5AXxtWIX/3tYmOpOpqTEw+TmL0dy39kg4lxKU5rhKrZdzsx
         R7Fl6YQ5nKyJ6TFg+L32zCK+AhFbWvD0LGEFuV8Prp5X4VI+dgyI54jLUnu4bIPbSgpF
         YFU4LNR3H+T5fGCAJX06AAhGTZggLbgkeWWK5YYf9T98C3wDff22tGH0Bg2pSJOoHNPw
         9WVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794814817; x=1795419617;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NqqPkO6TP9CP+I+rGLVpJtch/uB+AU8T9QDkOfxCb7M=;
        b=Kw1ONtzPM5bekhSUD4gf0NiI9F9TLtQ6yl05PF5EkwDbg0qVxxaGPiz7BCA/7ra9sA
         0ZklYxAv/nPV4uE/BJ0TW9apuJ0KgrhP4ZfBIDO+XThzaB3jp2wLQtMaJ7eUCUy8ivmC
         8NDthtfvQhDvktIrNup4zjV64TuE7gnjUP/Ydo00hnlDkx6yZmKUmov1bW1JM52KXthi
         +CrMg0ldknQarPm7HjooEAAyVUBC5VFijG51K2JxxI5ymKRC8SckTKPHDjJ9E3668C0Z
         YAylwMZByIyY72likQF42ZYgmcUTu05QqHci8l33289lWgVo+UY/rh8BA0fbTqnlY2GM
         LZZQ==
X-Forwarded-Encrypted: i=1; AL+hErHydC0qyEaj+NeHqLv3+FJS3GqE/4+yse96Djq4eGt5+pKZ/VkdXN9xl7qj62nAXe4YbK7O9zqRYyNF@vger.kernel.org
X-Gm-Message-State: APuU4Z9iAcvRofuSnrgEvjUTv5i+/NcER+EkfC0tqrmwrNa6Gt+XfPP/
	t42ot3Uy1rqkGx97x3OD88usVW++fKDu8GWYzBhb2/sD5KOblGXKmwN8JjIvNpCxXSoomA==
X-Gm-Gg: AYBFou2oYmPsvZE+ib+BaVqhMZwNaY6kCQPfxnJy0TwqDH7Mvvdcrf/RuldDvAXI5S5
	iWxXRzBodeTdKsoEQB12Xw5dqLhQqoPeVyyXmv7VHVRwBbPGAxxIf9P1O0Q2f5b3nHwAGZ9wHm6
	vSqITaxQk5NkxtMya0FQh7Ic8FJaB+ce73D93DWGxYpp5OSTp3aF3a3xNfYpo6GxF0u8tY1nF9q
	Ty0b8GnKLf4zZ9LOFtNJEl2mKQ9G+ThJO+/ZRoTHnJLL9aaXEk/UyMwq4+zgZq2hHpTI/YOmdsF
	KW/RoH1xbqtFLVusB99qSkwxNj00pZ21G2e0Wus7FfxHKCz3iOl5pbkWc1tsrweRE/IWb/gguqN
	7M0CqscXycLD/EHKhNbvZbd8n0OwAl3ZU6ray5ZtuB+29BkjUqXdwhyw8x0sBdKZx1aUIlWXUYz
	6OWT0B5ySWeaE+qYJ/0sohr2q41oZbtSVQbK+ghuBf/sQ7vhna8HVrmLcteiPI37FmUEKywElkD
	kqY3JKNvnYHBUw4KGUSYNbETzxFCk2gxSlRExJMmKX+dYrwgeujJN75RoAxEXe5ONaUHBjWhO9Z
	KgJ0ANErW4/Q
X-Received: by 2002:a05:600c:83ca:b0:4bb:53e4:a7cc with SMTP id 5b1f17b1804b1-4bb55a74c2emr200060065e9.30.1794814816575;
        Sun, 15 Nov 2026 23:40:16 -0800 (PST)
Received: from dl360p ([130.61.107.245])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb571cfa2esm259712705e9.2.2026.11.15.23.40.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 23:40:16 -0800 (PST)
From: =?UTF-8?q?Adil=20H=C3=BCsrev=20Tepe?= <tadilhusrev@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Adil=20H=C3=BCsrev=20Tepe?= <tadilhusrev@gmail.com>
Subject: [PATCH v1 0/2] iio: proximity: add Imagis ISG5320A (Samsung Galaxy XCover5)
Date: Mon, 16 Nov 2026 10:40:11 +0300
Message-ID: <20261116074013.355363-1-tadilhusrev@gmail.com>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This series adds an IIO driver and its binding for the Imagis ISG5320A
capacitive SAR/grip proximity sensor, as fitted on the Samsung Galaxy
XCover5 (Exynos850).

  1  dt-bindings: add imagis,isg5320a
  2  the IIO proximity driver

The driver exposes one IIO_PROXIMITY channel (the B-channel signal minus
its baseline) and a rising/falling threshold event. Tested on an XCover5:
it probes, registers the IIO device and reads a stable baseline value.

Based on v7.4-rc1.

Tool usage
----------
Derived from the Samsung vendor driver during XCover5 mainline bring-up
with an AI coding assistant (Claude Code, Anthropic), which drafted the
mainline IIO driver and the binding. I reviewed every line and tested
probe and read-back on hardware. Review comments are welcome and I will
answer them myself.

Adil Hüsrev Tepe (2):
  dt-bindings: iio: proximity: add Imagis ISG5320A
  iio: proximity: add Imagis ISG5320A SAR sensor driver

 .../iio/proximity/imagis,isg5320a.yaml        |  56 ++
 drivers/iio/proximity/Kconfig                 |  11 +
 drivers/iio/proximity/Makefile                |   1 +
 drivers/iio/proximity/isg5320a.c              | 857 ++++++++++++++++++
 4 files changed, 925 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/proximity/imagis,isg5320a.yaml
 create mode 100644 drivers/iio/proximity/isg5320a.c

-- 
2.53.0

