Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.2
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793641500;
	b=4Um1fXl9CipHlg53tP23HlDPvzsVnubLZBCtA0aWJUFAMqYtRPT1bRD2cEiVQXEq/p0k
	 FyRIiT5m6I/VCrxk6r9EjJeyrnaFeYTuq3H0wUtdXOxp+y9sRj7wNibkqT5CP0njGRTwy
	 BGyNCtvnT4H2K40dtcuv04vAJHCy+ElpKhEfA6B+lQi3XVwlmpDF89rQmuT06Txq1Yfxv
	 Cu6hBNlvIViFw6nDn3lF91qM0dDD+uDtWngsVDH9pIP47C/yetnp9fS6zLzsEwbh6ySEo
	 DgyYWDjOqL8IH8ImcwmajG9YhaN/05ZgcuX1t/djeCthf4gJtEjN0CKad22FSpezXzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793641500;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=3bh0GJU6K95rJPMyXBJ2rNzUcBtGgKH7isTHX83efNg=;
	b=ZnyArP8CJctM9fBzSi6VUpR3S/bkG63T5pC6Vvp1zH37+baYIne20oFQT/hkAGI+gKjL
	 iOutcKYbhb5Xn0q7KULFHbLG07L3iDd5ALk6O3tTYtNuyNjmvAMEvbTgoSBoBwp1vtn60
	 XZYon6MIbD99ebEkOgl18DnN1C36jcIf6+1lST7+phL3gVLK6Rix9jP7uIaVAi5+Z7Vxa
	 u8I/tbpUVEdUZ1l5dMP8PRYeatB55N3ji0H6WUdM2LBjPPSyVh3WvuMw5hUoF6eDx4vv7
	 NSPRkBxgaUvhKuuyq09BIzAXDitJVt1o8B3CkbqNn2UsH9H0fCYfCXsVIL+008fvSOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vIg5cy0n;
	arc=none smtp.remote-ip=74.125.229.2
Received: from mail-dy2-f2.google.com (mail-dy2-f2.google.com [74.125.229.2])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C48B7606A333
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 17:44:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C48B7606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vIg5cy0n
Received: by mail-dy2-f2.google.com with SMTP id 5a478bee46e88-327b1d5824fso3084246eec.1
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 09:44:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793641499; x=1794246299; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3bh0GJU6K95rJPMyXBJ2rNzUcBtGgKH7isTHX83efNg=;
        b=vIg5cy0nFrEe1qNau4YkNVZixJQaGLrUM7tRy8LdgRHhoroN64eKsYDKXobYSjyF0k
         LYaBdONSBFVSTLRLzSXGxYprkrlgwiWw5PaC+gf6sDAb3joRFgVOY41nKFgtEWk6h9Xb
         QRdnoA3jezQMB9gcgkqoOBwJEfbAgCaVxqOFFflw8jRWWjx1bUEEMrAKb1xIsSHRf0Zs
         GxF7AN70XuBOq6s/En/ES3RYbfX38qap7GZk3O1ONbp1zGUuvG1qE6a6nS542UTl2OGO
         pkggaHps1xlNjLo7DZSnbZ2cePWxSsGLInLmiWQ79/gQodkkmEQJ9cLgXDt7eSpYqkPa
         IDfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793641499; x=1794246299;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3bh0GJU6K95rJPMyXBJ2rNzUcBtGgKH7isTHX83efNg=;
        b=CHHmbRbAnDHhOsy8BvHcczKxfF8veavkS5Of5SkibIeTd6D6iyvzu1TgT44PwrTOQE
         dG4ioeu0Ryfv+s6OEqrXabH7PKaqXzH2rsFlW53PkbdMVFkDVxiaXLW/QcctLnuvHQjh
         e3wXHhx2X6XXt4TON9OIx/B9ICjMIvDVrrk0xr+LkgAyrCQmkh/xeIeyMSFp1SwKeyfI
         HvGgzSVinkaeitp6HrohlYtNG2f3IwB4REYDv+WmJPFuU5uy/S54zHdgeK54jEZbntiF
         p7DWQIHhJC328fQ+W/vNT6KP3aH0lUFDtuHXDHWoxn7QTn/SvPkD8cS0xaSKbEL6kM9L
         +9ew==
X-Forwarded-Encrypted: i=1; AKwUvByf+ZZpcyiIoRmpg/uvhSPby9equ3pkm6VKQZQAO6gmUOP+jXwZiHXI3NaYYSStW0R5nUisDEmF8YIG@vger.kernel.org
X-Gm-Message-State: APuU4Z/VMZXPIR2lsI59bq8i8DB84MeZBgIH6fbgZKmYs4guQUFjedfP
	n8rgS443gqXrKzZ91OMJLl0NoWYmJm+EW1mdReMMSMKReJwvpPFjGJ+5
X-Gm-Gg: AYBFou2+ESRZ5AoNmI0f5SuovLhHKKMaq9ucd0eP1xJUdhU/hZIFpInTwO2QJh3txIw
	STD/1TDV8BZCk0CZnKPOiLJdJkdg1QKMZ87+MWoNF0FjAbSum548KafRPLeaaa7sE2IOO4LlDgu
	aOS+mBEkcJAU4g+sdu0P/dbZQS2fP0fvKU/VEwEPzGDa9jPfLoSeW/b0M7ETpBvmhcM69rcQSI9
	hhDTiysDf+F8VwvxbC1XIbTpcPsn9YKX6XejKp+xt3I3AHJdOhctCC7mvjxuQioETiyveObedkD
	6v4/UbjQDdMJbrg+1QXCJueHjNm/0HAEhEEWR5UY38MJiQ+Shm51vQS/ijQmhEVpZyPwut41gZa
	8OeIkBbMThvLGn5i7yCQScFAXpMFKsxkE9F/M3b3Sf6Myy4m+/UHao5PCZIgS0a5MNbdNI9HSWK
	RIwan9sCKqi1Fg4wa/jwptShncZYxeETayCGDuKoLSf38MQbG3Xo1ViUMoiD/qAoGCL3ziiaNGV
	GNq7JOMVAJGeqj0nJWtFaC7rqKIpusX8KMXj9TPRSDjpkIs/RmSCIvuUT7jhFiQFzsdVtcwmcut
	lKjCDylmPCQo5Lc8maDs1II0kPk=
X-Received: by 2002:a05:693c:895c:10b0:369:f05d:6c5c with SMTP id 5a478bee46e88-36a4240f66emr17419811eec.28.1793641498907;
        Mon, 02 Nov 2026 09:44:58 -0800 (PST)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42935b4asm53290803eec.16.2026.11.02.09.44.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 09:44:58 -0800 (PST)
From: Coia Prant <coiaprant@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Frank Wunderlich <frank-w@public-files.de>,
	Peter Geis <pgwipeout@gmail.com>,
	Junhao Xie <bigfoot@classfun.cn>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Coia Prant <coiaprant@gmail.com>
Subject: [PATCH v3 0/6] arm64: dts: rockchip: fix GMAC clocks and USB OTG power on RK3568 boards
Date: Tue,  3 Nov 2026 01:44:44 +0800
Message-ID: <20261102174450.3000397-1-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
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

Changes since v1:
- Patch 5 (USB OTG power): Reworked the power tree based on the schematic.
  Instead of tying usb2phy0_otg directly to the boost, model the OR-ed
  5V_OUT rail explicitly. Add vbat, 5v_boost, and 5v_out nodes, and fix
  the vin-supply of vcc5v0_usb30_otg0 to depend on 5v_out. Drop the
  incorrect phy-supply change on usb2phy0_otg.
- Patch 6 (modem power): New patch. Fix vcc3v4_rf vin-supply from
  vccin_5v to vcc_syson so the M.2 B-Key modem does not lose power
  when the board runs on battery.

Changes since v2:
- Patch 5: Fixed vbat min/max mismatch (both set to 3.7V) to satisfy the
  fixed-regulator constraints.
- Patch 5: Fixed vcc5v0_usb30_otg0 to depend on regulator_5v_out instead
  of bypassing it.
- Patch 6: Updated commit message to clarify this is a topology
  correction rather than a runtime hardware switch fix, as both rails
  are always-on.
- Cover letter: updated the summary for Patch 6.

===

This series fixes three classes of board-level issues found while
bringing up several RK3568 boards.

The first four patches address GMAC clock parents. On these boards the
DTS lists SCLK_GMACx in assigned-clocks but only provides a parent for
SCLK_GMACx_RX_TX, so SCLK_GMACx keeps whatever parent the bootloader or
the hardware reset left. Add CLK_MACx_2TOP explicitly so the GMAC main
clock always comes from the internal source. BPI-R2 Pro additionally
describes clock_in_out wrongly ("input" while the port is a fixed-link
with no external 125 MHz clock); switch it to "output" to match the
hardware. On RK3568 clock_in_out does not change the hardware clock
routing today, so that part is a description fix.

Patch 5 fixes USB OTG power on the Ariaboard Photonicat. On battery
power the USB port is dead because the 5V_OUT rail (which feeds the USB
load switch) relies on a boost converter that is not enabled. Add the
vbat, 5v_boost, and 5v_out regulator nodes to model the OR-ed power
path from the schematic, restoring USB host functionality on battery.

Patch 6 fixes the M.2 B-Key modem power supply topology on the same
board. The vcc3v4_rf regulator was incorrectly modeled as supplied by
vccin_5v (external DC). Correct it to vcc_syson per the schematic to
accurately reflect the hardware power tree.
---
Coia Prant (6):
  arm64: dts: rockchip: fix GMAC clock parents on 9Tripod X3568 v4
  arm64: dts: rockchip: fix GMAC clock parents on Graperain G3568 v2
  arm64: dts: rockchip: fix GMAC clock setup on BPI-R2 Pro
  arm64: dts: rockchip: fix GMAC clock parent on Photonicat
  arm64: dts: rockchip: fix USB OTG power on Photonicat in battery mode
  arm64: dts: rockchip: fix modem power supply topology on Photonicat

 .../dts/rockchip/rk3568-9tripod-x3568-v4.dts  |  4 +-
 .../boot/dts/rockchip/rk3568-bpi-r2-pro.dts   |  4 +-
 .../rockchip/rk3568-graperain-g3568-v2.dts    |  4 +-
 .../boot/dts/rockchip/rk3568-photonicat.dts   | 53 +++++++++++++++++--
 4 files changed, 57 insertions(+), 8 deletions(-)

-- 
2.47.3

