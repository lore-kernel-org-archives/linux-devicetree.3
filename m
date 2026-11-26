Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795660740;
	b=pGC/6ipcbFdTplbQdMKMUCspl74J5CR1UbrQn/R2p29GcmWa92+AmeF5y3H62zdbUjGd
	 F11SEtHywxB/Aob/EdpSFYh7kzuo+xRiVuC2T/Qd4UPbHxtEIJf6oVyeCNjqAX2rmHY31
	 xjMjWIrf/9WeSvWD3SmnYx3/Q5WkhmBcNjuA3KefnmjCIubEG72VUjsKc25TXtNPjnzfZ
	 RLK+RLFwTVgzGg+KSnM44jj3EeNcbe00zkrTdLzVu3AK19IoyBzbleva5mGemhlKYyXjG
	 aKlUJfBsMHYAgNiWJ0/8n9sNML2czNtVAG3ePL+zHFsoSw6zMlwKUAQMrgzv0ETq9FQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795660740;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=coO4Ngf257EjY6b4GluqTxT2j3/irNaUNExRpoNnHT0=;
	b=AqktJEChP7fo4OvC5QZTU6stzYLyIPEfBk4cNllwHHUXlD8w7Bw6vEgjgepDHuZOyCcT
	 +w3py7Fh4XvORaVjQXYG0e7jVUDeKcHer3fdYddHw9ktANi7YPwtZZoIowEOWjggWQhZP
	 wXmzyPBcfxn5Ll+VnQMRbvEpX1rsGqYN1YqWAZaWX9Gw9hS5v6hkCp/pPM6tJ6hRKwhDW
	 lv9caSTficXUA0D+BXjI5GNfqZVAtmk4USEbQ7Lh3glnn7PsEyZXRp8ZOtUVD+HAT1fxA
	 KTAqg4GlRSAciMbezRHk4jG027JlA/HmZp8ir4sonuJWcYxNPleEMua67cM9ttq2bdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oh0QO9l6;
	arc=none smtp.remote-ip=209.85.210.170
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 495CA606A31E
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 02:39:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 495CA606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oh0QO9l6
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-8a06e79e152so3243221b3a.0
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 18:39:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795660739; x=1796265539; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=coO4Ngf257EjY6b4GluqTxT2j3/irNaUNExRpoNnHT0=;
        b=oh0QO9l6P71GJbq8uxDu/gVYB9eu3Sd2jVhzdjQQ5ve2nsNaJuaoqsLOdi+sZDVDei
         JWjg6/V3szg312ttrlmuw3V/JuPQ8vHjY+yi8sc7S1g7UJc3QIzT5B+PCGBB1kR4zMv0
         XmB7MCPLIAjLkDowXxMeev5ftUT9SpZcKXzfByKNp90XUT4mQdSkRmDu+DDpKabgRy/6
         r3gRjWlgOD+jE7RgOtfhSPcA89XSldyPivq9bHrm/9EG5DGTfm/mkECdqP9QU7d+IIlI
         6QPpzG1xcyEXRR/tuGeJYvBH812cYBB6ROZtfbWfb56/4wuFQvdeWXqvz9mvInX54eCV
         PsCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795660739; x=1796265539;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=coO4Ngf257EjY6b4GluqTxT2j3/irNaUNExRpoNnHT0=;
        b=S90cLJg5/5Q/ObAXGj+vLn88KUS2tUNtW5CgAUtFZRocUdRo5aKKw0q2HVihvTCEMD
         LKc8aT08itQu8SPra/L6Gs5W4Z/cRkRPhJNqxSIJwNATHbkUge6QGUgYFi76Jx8Uktbz
         Nx3pRFAoFiAHpmMuCWEfa43IbgExwiH8cTM1jfzCo+M8xtMuwFKFK5J7zCFum2vuY885
         y3rK2+Yu/ktaGwUy37EvQNx7hCqz0Wyih2ih3KW//rLc5gLGP19Nd+z7AXg5Y4ipo/0t
         Yq3cwDNlq6EptM0Dwhwm8Ez7MiZX9g3yYUHUitMKV+vrVI9BYw2ZmPq2JJJakQxY/nt+
         yorA==
X-Gm-Message-State: APuU4Z/pPhhpM21HgJqzwu9d+y14izhQbhqjjLs1+HGxGfH3fmW1uuYg
	beT1GP9qvKM/FIcG720CWgnaeAwX/nSf6iPPawwtrRyVEVpABOztvn6D7oKMgQ==
X-Gm-Gg: AZFdTZfIqP8sYUGSPTeUgnd4FCW9YpaxmLU0LatH/uaoaTa+sETqhRBegq0hpdjDaNK
	geJnMIvmECPO/VVQLV3xkogg7alnpt2m9oLOlsy8V4P9rIyvCxXzhjioF8olxcllOcQxZwDMTWf
	6qQXw/4lseVvXeztudskEnWzJGo6qJ5hh2bUGio8Im/R2xHFpNS0gf2H1+QPeQthREy8qH4+DEt
	n0cnD51dulORI6N0SrRPfH0P3l9W0H9JpHbf9dAKX54l9KSijTVmxwFTIgtQ5wpXHuP3AzbMLqi
	PAWzQ555nykt3RGwWHo7WIjugSFynlQZpzhaQSxAq2eJTmLY/oeE/CPHXXyL5woJgQqHcXj77H/
	nMoVfQJz4yqqvGE4ejGYjfjSM4wnZHdW/DNrg/vNTvxN72l88BW+SYXPO7YCQyIg2/Ofxnk+K5E
	Wq1u6VNJf4GBai+9ceFKNHnPtXxfj9HI9GpsPqedRM1v7L8VvIsnBGng3+Xhv5sr6chNjTWEy1j
	HSAN/yBaSpK7Ts4kXg21C1ceOTT521vE02sCqhOjwNkuojn8gyboThDkvyfM+BKxoDrLlpv9eiF
	ENfws3h99iHTJHa+34/XZIQ39a/cWxcTWWJtbvN+I9ISQXGRKW4n1UorUSGmtMGyLewklGmG94m
	HrSM74mZwbAtm6SVQIj4tXq/kvAK2baoXpFyF4iYiWLlC3ifiiNRhc3Rx+5K/lMe9OWhWEJ0246
	MI6Y44LBNMRTyBXrg0PaVamCO/
X-Received: by 2002:a05:6a21:7a44:b0:3e2:200b:dc24 with SMTP id adf61e73a8af0-4014e655aeemr20431782637.90.1795660739442;
        Wed, 25 Nov 2026 18:38:59 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6d026d6fsm9909018a12.19.2026.11.25.18.38.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 18:38:58 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: devicetree@vger.kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dennis Gilmore <dennis@ausil.us>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Marvell Kirkwood and Armada 370, 375, 38x,...)
Subject: [PATCH 0/7] ARM: dts: helios4: fixes and cleanups
Date: Wed, 25 Nov 2026 18:38:49 -0800
Message-ID: <20261126023856.767961-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
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

Fixes and cleanups for the Helios4 (Armada 388) device tree, checked
against the board schematics.

Patches 1-3 fix bugs from the original DTS: the board revision hogs
have the wrong polarity, the PCA9655 expander uses an edge trigger that
can lose interrupts, and the EHCI controller that gets enabled has no
port on the carrier board.

Patches 4-7 describe hardware more accurately: the fan tachometer
inputs, the microSD slot's missing write-protect line, and LED color
and function. Patch 6 fixes a dtc W=1 node name warning.

An AI coding assistant (Claude Code, Claude Opus 5.5) was used to write
these patches and draft the commit messages and this cover letter.

Rosen Penev (7):
  ARM: dts: helios4: fix board revision GPIO polarity
  ARM: dts: helios4: use a level interrupt for the GPIO expander
  ARM: dts: helios4: drop the unconnected EHCI controller
  ARM: dts: helios4: describe the fan tachometer inputs
  ARM: dts: helios4: use disable-wp for the microSD slot
  ARM: dts: helios4: use hyphens in fan pinctrl node names
  ARM: dts: helios4: describe LED color and function

 .../boot/dts/marvell/armada-388-helios4.dts   | 53 ++++++++++---------
 1 file changed, 29 insertions(+), 24 deletions(-)

-- 
2.56.1

