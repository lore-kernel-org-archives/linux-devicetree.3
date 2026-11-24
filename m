Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795496482;
	b=AOFjuokKv7LNitxn1sjsQ9oxDBSlTQ5KlI71xvgnTYhCw1fYcjNsQUhBX86BuZlinaFw
	 uynnhkFLpFZGv/vcOs8R0GdnLpjdv4jwxugvli1+7U/yb0VWe+WHXuSaSpiWciOegkoTK
	 kI8+wZ4nDjs8T+o9A5AJp6fQUZ+qmlozpaWBu8aD/D2Tub6R7PkmxN0H/ycTGG18w3I/5
	 9dXP4ZoMKONYtEMKkAXnuYgTIUcgRkL/7oDZtWTVzmwjG0xngDz3/RjwU9jfFD7yB7co0
	 vrPZKLg2h3tYWe5PVbLyVg3LXad5vOnvypkjGjUy9NlSZLNKRC7nba5rl1u9WKhLVqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795496482;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=sITgWxD5iXuRoxacaW1y/ZEl91KWtEOEir54BjnX2Ms=;
	b=4ZdRm7VEulhjEZfyUlYw0JRKytzoEl2+x52F8CJbZ7Mu0HVVi7QvyHR1CvHmzSZ2TymX
	 So0VaXugMh3g4z009tm2y0tgV8uXysJ1wTChmRzvNNBpzTWK05nQWdYUKVYkY+6LxsAVz
	 DbeHeAYHfpZgan5nIxLcbBO4LjMzEoEVYFskqnAuEnbDFJyg3yDOY/OXxCdYUeM6NKyit
	 cVvlE73VX1XFl0JugaG0Nk1i+1tAjNds6UA6gx6Lo2Euu2/dgsuJCp4K1quJlfQIQLZN7
	 uuswPqo3UCFvNrwhRBgFxr8srVmxm76oAKw9QwL45LbIYJ90nxnV65rcv68srk/rXIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=u5UXp9OA;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5421D606A31E
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 05:01:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5421D606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=u5UXp9OA
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so38918325e9.2
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 21:01:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795496481; x=1796101281; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sITgWxD5iXuRoxacaW1y/ZEl91KWtEOEir54BjnX2Ms=;
        b=u5UXp9OAtY9R3Tu6ra8aHem5hACKbhfVHyr+QcpVIcfTulfIjIIzKI3QaoiClWmPoW
         FpG0syLG8TjSSP7rM5t8vrccjmWkOr9w9vjDC0O5356VGLiKFPUt9I5egRVsA44W7gqo
         pJxJpgFTfESSsUyh7bXZP8MKapKCgG0PjUJ6LnrURI6wGJw5VccVeqEGSgh6Y+0GWpdM
         s6nvWH6C1uicnnNJQRwQAxjmsKiPLQZqR1s1Toyrh4dYWmkb9NwrUu+NkhSxPlLz57U8
         w4PeWxBiDapMjnc8GtiFvYsCthY6rjoI77d4v9/JVDqOrub8uZ/8vl26E8NXSZztiAR/
         3WjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795496481; x=1796101281;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sITgWxD5iXuRoxacaW1y/ZEl91KWtEOEir54BjnX2Ms=;
        b=iYDuibaOzkv6PEZhZXX09zWJcKlJZi4vOHl4lrzmy/GsHIJgu34dVNIKR23+qm520Y
         3NKkaIKnIsPv4QsyWMOZueLcpkAkDJd0y45NVFGPNd3T7I1xPCyJmIG+GseCt4o0Gwhj
         yWTULyda2xIEuLMDRwrg+z7uvr4vtzrPzou4FM4TZA+3FV3eoPFpWstAYWP5J6ATttHP
         vBJMPkgGc8YylnCC4pdDcN7OrG6B3CN3lxnNO08vh8RBrQb4gchPHye9LH8UB3eJnnXH
         kTml+2A1FiDK8OXoKIrqVvEV68RQm1f28oMRST3QJOgttvmN4/G68aCDofvr0mZNKlAW
         t+cg==
X-Forwarded-Encrypted: i=1; AL+hErEwHvdQCeaAOKDBXjqNd4TOpwDXnQS3MZJ4SQyM2Ulj+mm04xeB93ue65dVSdAd06kSG7zC+G9SCqqC@vger.kernel.org
X-Gm-Message-State: APuU4Z/45J825J48Gt/VSD9mACLgIwnK1d949bpOnUUPfIdAZLN7Vryx
	zR7fyz8qJnSCaQtHPOpcKFebkkghYO1LIyCIxeHqinK+jfd+P+QqEJpP
X-Gm-Gg: AZFdTZdhqs6fNvjfcji+9oY7aD4VhvJKnPt092A+6t6aCAmF1TfzdxPtRiZPq7l5Y3z
	99uR73xrVISGJGzNg0fF4Zp2ANyND4oSCRCUcCl8RYC6nhJ6M1XIeTLddlwt2MAkJWf1icILRkq
	UFp2k6T/1gSxTJ3L8wzb/PvJboLUiG4jiumwbEicxngjAsM5Bi7stSpfkava3he8fnd9KovQoAg
	54XIc9l8n7/vGzJ8a7cmLFbpUujV7Omb8oG9bERY02QnPPdWMJKYnl+erXYkDiamzF2YSH3H0LX
	za4KNwXNik9SE96NPlfhq2Nj0jW/mQbhYrxUEwH1hHp5Kq658qJW61YqAf6IWUWxKHzUD5HcmM0
	m7DHRUOeVsJYLGiUweqjgLrjkU2gfqnC29o/AqDaeRxwp7tcZqPO/te80gxzGTkbNBFNICxlzRq
	kkq+qLksETH83VqO07KUdUhYlyBa8JIJ9DmUEH5aYny9RPHTxMq9PM0/kOlEKxZCWNZBqEIr/c4
	4e5kzwA8YQ3ttoMUuxY4Bz7tnf/KPtyAQ/VWPQ+xmT9tuKPRDPd7uZ/tNfCiPEZUIE5U0eknTiR
	a0PvLU/0OjA1QEwOLvYYRmGRDLmWhan35r0X9epJLuLVOKm+2uPKu2CusHT00kNkt/7u2SG2wW8
	ELUhrRYbevm7/AV7Cmrkg3Kg1HsF+09iZ8vIOqfw3ZBWWtK42WGIJVQjOjP0v89cDreYgLXUHH3
	oB+o4hzVmJYvYlBk9Ttl7PkauKQ/m61YJYom+5CVgbTYJu/Wfk1v2oVEqmnWu/mE/GMV6Capw1i
	Q==
X-Received: by 2002:a05:600c:3113:b0:4bb:5f45:c97f with SMTP id 5b1f17b1804b1-4bb88816b2bmr291844445e9.27.1795496480513;
        Mon, 23 Nov 2026 21:01:20 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a00-1028-8388-a84e-f512-85ee-fdbe-0621.ipv6.o2.cz. [2a00:1028:8388:a84e:f512:85ee:fdbe:621])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88442693sm353489155e9.1.2026.11.23.21.01.19
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 23 Nov 2026 21:01:20 -0800 (PST)
From: Josef Schlehofer <pepe.schlehofer@gmail.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
	=?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/3] watchdog: max63xx_wdt: Support a WDI pin connected to a GPIO
Date: Tue, 24 Nov 2026 06:01:15 +0100
Message-ID: <20261124050118.87944-1-pepe.schlehofer@gmail.com>
X-Mailer: git-send-email 2.54.0
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

This series picks up Pali's patches [1], which stopped at v3 in July
2022. Pali is on Cc.

The MAX6370 on CZ.NIC Turris 1.x routers has its SET pins connected
through a CPLD, but its WDI pin is connected to a SoC GPIO. The driver
currently cannot use this GPIO, despite turris1x.dts already describing
it.

This series adds GPIO support to the driver and binding, and updates
turris1x.dts to use the new wdi-gpios property.

Changes in v4:

- Address review feedback from Rob, Tzung-Bi and Guenter.
- Fix GPIO direction handling and remove unnecessary locking.
- Rename the property in turris1x.dts.

Tested on a Turris 1.1 running the Turris OS build of Linux 6.6.142
with patches 2 and 3 backported. The watchdog works with periodic GPIO
pings and resets the board after the pings stop. On v7.4-rc3, also
tested the binding with dt_binding_check and dtbs_check, and built the
driver for powerpc, and for arm64 with and without GPIOLIB. GPIO
behaviour was additionally tested under QEMU.

Patch 3 can go through the powerpc tree once the binding is in.

[1] https://lore.kernel.org/r/20220705001023.14660-1-pali@kernel.org/

Josef Schlehofer (1):
  powerpc: dts: turris1x.dts: Use wdi-gpios for the watchdog

Pali Rohár (2):
  dt-bindings: watchdog: maxim,max63xx: Add wdi-gpios
  watchdog: max63xx_wdt: Add support for specifying WDI logic via GPIO

 .../bindings/watchdog/maxim,max63xx.yaml      |  6 +++++
 arch/powerpc/boot/dts/turris1x.dts            |  2 +-
 drivers/watchdog/max63xx_wdt.c                | 24 +++++++++++++++++--
 3 files changed, 29 insertions(+), 3 deletions(-)


base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3
-- 
2.54.0 (Apple Git-157)

