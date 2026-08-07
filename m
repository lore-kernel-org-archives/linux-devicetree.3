Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2A11376A1B
	for <devicetree@vger.kernel.org>; Fri,  7 Aug 2026 22:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786141257; cv=none; b=UnOz4CkaSOZ9jsIx9iq67U+t42baDLlGlOakWV+L6W27rU7rVycVgqo7E9dxfGEHs2K/ooCE4GHYmBaHqThCH9Scv1wBGoLAPi/+2SuUXkNqEL0YMz4aovumyg6xPhjQqqbYmykV/RL2357BgXvNMWEI2OypZNCbO6YohPp11Yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786141257; c=relaxed/simple;
	bh=toEIXewZudtNgMfxo/0KSIYSlX45bbmndQ9I2TohXB0=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=EMv/990SSosLGJjlmW8w00uYkK22cw9RzpVms9x3YKVYS6T4ygLkN0aGNtiUoouXNJi55v7PibLzlaqfLUSCYR139Yog5FW9ME1HphCyBT4N91x5HLuOm30h7nfNcNftJoRVtWqowG0nyWe5qx7Hoaphrx4+qbxMMI7rzojUtD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fdh2jHll; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fdh2jHll"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-480001972b8so578256f8f.2
        for <devicetree@vger.kernel.org>; Fri, 07 Aug 2026 15:20:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786141254; x=1786746054; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EhYdbrJNExqm2Adqxwy//2oFBKGBRGKCUdrpPI8D7eU=;
        b=Fdh2jHll+HJL41eK3M6DB6La06V39Zsxd0BUBOId5BFBW0aVXxBITZ4a7yXaJnvEGn
         naRoLbsdmdwf34IcIs3j0txesemeM+R96k7P73nzdgDteufhiIQsxPQli9E7C0K288Yf
         3Y8jqJMpSnFHc3LmvktN1ZfTIhRqqXbaEhs+57fIlsWZRIZQ/2xbD9Y8tqsb3Yz92KDE
         mocNuCATDWO6s3B/SvYVvw3nze9UD40wJ4cAUKhANOAxgVCRY10zkcZjHYTHZNtVptYv
         x+nDhWkGRIIMCed7CM1JgvAedMLGRAorN+twAEMFXczDDAKvbltQcBmwa63reB4Sp7qr
         Rxlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786141254; x=1786746054;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=EhYdbrJNExqm2Adqxwy//2oFBKGBRGKCUdrpPI8D7eU=;
        b=GYb6UwmC4RpOuNNq0vp29nYQZIEgtPb9MH7IqfvKvbbWZt7qK/gccDo8belRFh0xWm
         k7p117VURMMOmKxO3ar1VxNLPBcnGIttURDBflRBRnjNTSY7Xl/CGJfqdJXTHh2pzPM+
         tDw3PbB6ApIqlSrmGzMxrvHbym/ts2DNhIzrRZ5Lkv8hRKA+TFP8/6ObQhJrTrI1Mc88
         ID3tp7TfQUG4sODadX80O/1wdhY1QuGfJ9ccKIy1s2mLK3g8ZaPWn4Fri1WhVZQECe9L
         z45V8Brgn95VIPVwqITr5QTeLE/ukFDI/hnpcH6NANPrR0Rb7SvPf9kBGoyQWNn2gMHV
         zF+A==
X-Forwarded-Encrypted: i=1; AHgh+Rr6meICbd13EOyct+Wb8cPRNhysbwbg7SLxlmjRFKd1a81rZiEJ8qGdfN5HIujkgIJjBgKtyf8Hs24n@vger.kernel.org
X-Gm-Message-State: AOJu0Yymn8GPq+eP7R1CPUB8M8aEXRFOgcz6AYJTu0LmaRQZvCqn57sw
	gdtmtb9UWqVL1HbbfBHGBS6BlPWKkI4zycoNw80xC0b9B6Nfwxmt/CJz
X-Gm-Gg: AR+sD12XtvcTM02KWljFcYhtsXpi3IC8S2mK7nDP4ljCaY+GXUl522CtkyB+8Lt5dp0
	n4L/SQBoFcNBi0kOb1jWqmEHQEoslYQIMGLd8SL5JBIpu+ePUbUl0QZRiyMcikjvYwDmMP2BNQe
	IbjLuwaBXUooK3n/OXFyKbQgig/fVMLe3K5d+Se8JkarryJRINPXCsfoOS371+YsJ/u7jEj35bq
	QT3W0By3PNCbz/6cEE7NdmG7K2Rxj3umON8K5xl0BsmO+9P+jsohC1gAUHzIi7Ut/VdrHBW1mYy
	d9j57KnV8/KzSoagve42THqqXuOF5v89LUE1bl9S0+aXhE+hnNQGa42Y5cNUgcdYnuajr7dNiC2
	PbF2fkG1oaRVoqyppYbXWXa2rA4VBChOXanu+tDUNz4auMgpItv+0320EudP8Rt6vL0Eyo0dn88
	whB6zouS4SWHn68z+74WgO/p2G2Gb1aWFflAC+I9s8vrxVRRtNpxoQU7h+dJB8hqzbuK5RXceyh
	la8T+0XfF5OE30depR0dSwDx2Qg3QeCLV3xrqBBpi+q93qhK13auw==
X-Received: by 2002:a05:6000:18a6:b0:47f:96f9:a99f with SMTP id ffacd0b85a97d-47fec50830fmr36006613f8f.13.1786141253964;
        Fri, 07 Aug 2026 15:20:53 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-87-19-255-168.retail.telecomitalia.it. [87.19.255.168])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-480021f9182sm9581519f8f.28.2026.08.07.15.20.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 15:20:53 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Benjamin Larsson <benjamin.larsson@genexis.eu>,
	Christian Marangi <ansuelsmth@gmail.com>,
	John Ogness <john.ogness@linutronix.de>,
	Peng Zhang <zhangpeng.00@bytedance.com>,
	Lukas Wunner <lukas@wunner.de>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Rong Zhang <rongrong@oss.cipunited.com>,
	Binbin Zhou <zhoubinbin@loongson.cn>,
	Gerhard Engleder <eg@keba.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Lubomir Rintel <lkundrak@v3.sk>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org
Subject: [PATCH v3 0/2] serial: 8250: Add AN7581 UART support
Date: Sat,  8 Aug 2026 00:20:38 +0200
Message-ID: <20260807222044.208056-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is a new version of [1] to support UART driver for
Airoha SoC.

One additional function was needed serial8250_get_baud_rate()
for the driver to work correctly for baud rate calculation.

While at it also try to clarify a long standing issue with
new UART driver when adding new ids for uart_config[].

[1] https://lore.kernel.org/all/20250209210241.2622309-1-benjamin.larsson@genexis.eu/

Changes v3:
- Address review from ai bot
- Add all missing kernel headers
- Improve divisor calculation
- Fix wrong uart config table
- Simplify divisor table handling

Changes v2:
- Drop intermediate patch
- Use .set_divisor OPs
- Use div_u64 instead of / 40 for 32 bit overflow
- Drop dedicated match table and use compatible for type

Changes compared to [1]:
- Fix all formal error
- Use better compatible names
- Drop unneeded header
- Drop usage of irq (it's filled by the generic function)
- General code cleanup and reorg
- Split to patch and add the UAPI map patch

Benjamin Larsson (1):
  dt-bindings: serial: 8250: Add Airoha compatibles

Christian Marangi (1):
  serial: 8250: Add Airoha SoC UART and HSUART support

 .../devicetree/bindings/serial/8250.yaml      |   5 +
 drivers/tty/serial/8250/8250.h                |   6 +
 drivers/tty/serial/8250/8250_airoha.c         | 186 ++++++++++++++++++
 drivers/tty/serial/8250/8250_port.c           |  16 ++
 drivers/tty/serial/8250/Kconfig               |  11 ++
 drivers/tty/serial/8250/Makefile              |   1 +
 6 files changed, 225 insertions(+)
 create mode 100644 drivers/tty/serial/8250/8250_airoha.c

-- 
2.53.0

