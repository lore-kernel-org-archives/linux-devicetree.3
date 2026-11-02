Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793639935;
	b=uiZjZY7UrXdIR5gANH4DzsLvVEXnhyReWijY8/udJjx31THp6as8E9e/6NWhP5cnHfk4
	 HZ9aTvKWXpfqPC6Eck/001B67n0PmFWNVi1GQBEzwcX/o1qkoOcpjEiFiLmEtTN+Y2hrk
	 IYdCCJmfruXocsgzY6oWVCyqjSmPlIJIGYcfpkBq1EGo7jm1EHaoOSGYP5S4RHJFHrz/g
	 AqeKtbsHF7+r+L4WP3F+AVEZprIQaSdr7GfK40K1N1TXZE0wzKZn9A393bARNpJe5oaBS
	 lcXJBuKA4UbrbTyZ++uXtYUZPbYmAuQr89C0MAdy4d9kZprHNRQZ34cu4atfR3qpliA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793639935;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=DDphUJPz2cWD4JwcRyLV0ZDnGyYMJHlTqCBmcqLDAcg=;
	b=ggzb54mY2iS3sgMwSYlyXTehQabYdIMRYjj9Ug0PBareUQjT37LYQDB6Bvr44gr4pTKU
	 CCCzYWpG8l7wS4DcZvSrHDJmJwuiLB4sumZN6WWJOfK2Qmo5ECNSozQMSCiskwj86Lc4m
	 4N/enIgDT9ojaDZAgsjiko+Uso0pyCCtySeGjCMas5Cv3Wtku/F6jt6LB9/t46/t3hvRg
	 oAvenT7qcvp4RuzCn3mlafT+aTiIyCnufQFUFwNZaKfUE4/INzCDelZ6dk4gxiKgBt143
	 t12YmrlYq1Nx/BNBOy7M3HmD3wjdC7At5sdLs1iZO2vELROZxbZBc5x2MTnoOOv7Kzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ivBzNnke;
	arc=none smtp.remote-ip=74.125.229.7
Received: from mail-dy2-f7.google.com (mail-dy2-f7.google.com [74.125.229.7])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8449C606B0F1
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 17:18:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8449C606B0F1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ivBzNnke
Received: by mail-dy2-f7.google.com with SMTP id 5a478bee46e88-369f126a526so4063910eec.0
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 09:18:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793639934; x=1794244734; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DDphUJPz2cWD4JwcRyLV0ZDnGyYMJHlTqCBmcqLDAcg=;
        b=ivBzNnkee6IPxDDv9791ObM8u2k/gzL9kwCDlIly8mdaZrF7lbmj48GlMGMZpunQM4
         FyB9nZzO7IjSwT2sd4fNk9/76avOBZgqtMrITWPKfpZGbsXBkzvrz9leKUJijY4mxvVG
         7/1+dFdnqY5ZAWMSQbFTHsOsda3Kbw47fzOgIi7IZnYIrhzdykhrfc+VLSwhsbeIa9tr
         LLumJjaibLK4uedWelHWPdJJLhx8iwzuBZjr4ARETXpJEA31lkEopWVVCxr2oHbwQeOW
         8S2PR6kTmbXWoMcFRIop/5fb2JD9A9S3mFItniBAITpSO+B3f1jLIpBnrgluedRi9/ZY
         0hEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793639934; x=1794244734;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DDphUJPz2cWD4JwcRyLV0ZDnGyYMJHlTqCBmcqLDAcg=;
        b=vmUv3ysASKSU5r1DrKVbcaQcaEVs+sRywJyqPpc0tvH/tP9SyaMyJKgDG0P0s8SqUF
         KEF/lvRMhXH939RAtL4hZ/a82ZYFxuLly6YuZubQIbCVZAwLU11zfdDt9NctmF+ur+uf
         R+yOCs+K49uC/JCR8hTvlpoGFD92PNESgsbFdr1ABrl7QFL5iq9sltxJvfHVV1ULFy0c
         LcUJVMz2GFCF70O2gfW2n7y2M3Nn7dO/Dn5bL0bOb1wt1uUXoNB/4NunhEPb1KTVs6RZ
         om5BHxJXBqLh4vv/P+WAFvZOTutlf7uspzKutg4kuZTe8Mx2I6kvH8YhMP9+q6FF+Mcn
         /gnQ==
X-Forwarded-Encrypted: i=1; AKwUvByTHaAbAjbwdE6WZkxlRg38fend96Ec82BSFv4XJWveS+gR2ZCrk2c76HogF7o20sb3CXEtb6Ok4RAf@vger.kernel.org
X-Gm-Message-State: APuU4Z9aUJRCOjiG2SUsm1vw11zG8UmzvruZfTuRZ8dK+SoJfG9DtsjV
	/HlCcnStAMajow/Ll3S2PUBfsK3jRmqkVjv75L8vv+p42BZnVTYWW9Lh
X-Gm-Gg: AYBFou1Ia/iaIbjGBS97k3USqtjxXl9Q0CenYE8Bmg2GUwcSsG2tECzPGosVHEh7WfF
	3+4UMEJkT0SRV+c4LoinNnsiZwK3UwPdfHKpba1Bo3ti8Z2J6fi/v342tCq2QeywS7pm7CS+age
	5w9C/WhVVsp9FG1ZGUB31tzYbLQcCrIcCmiAOvYqY749VtLrS+U0RoR4aVaWq/nfimanA9H57QH
	J856r7+HVaEuqgYWdKyjNbs0bmVnvHGltjwscFQr9+Y0wVhMDhojQTjhH3JFi1cO/izN8ii+/Gc
	HmPqyXhQ2O2cplCghGXoLwhIIYduwnvf+Id0fHPYotScJkMy5aQZ1tjkMsLKryqZD/DkPrvtj2I
	6ecaYxyRubN4QVqyczvHLsDEP/qaczI3uuiktsyvL/QIHhjnZSz4w+9gsXS/aygzHLsAMDaYimn
	Rzl2wELbopPk/XE9cH3cylK+v+1ZKYFnt+JCOnt1AfJnlqs0xBSwpKA4fXm2E7JUHZMIMe035ip
	LXyqOTXICDArySzlaWH7ki8Z9CJRUwXvNorzEgp+stjvLH3odS9RxLSaE4F1+mfdsceELiTIrGQ
	5uxXxK+PMXGCX1szSIFzdN9MsSg=
X-Received: by 2002:a05:7301:7e16:b0:361:fd60:3cd2 with SMTP id 5a478bee46e88-36a4232bee6mr15558588eec.10.1793639933915;
        Mon, 02 Nov 2026 09:18:53 -0800 (PST)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a429467cdsm36978047eec.19.2026.11.02.09.18.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 09:18:53 -0800 (PST)
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
Subject: [PATCH v2 0/6] arm64: dts: rockchip: fix GMAC clocks and USB OTG power on RK3568 boards
Date: Tue,  3 Nov 2026 01:18:32 +0800
Message-ID: <20261102171838.2958552-1-coiaprant@gmail.com>
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

Patch 6 fixes the M.2 B-Key modem power supply on the same board. The
vcc3v4_rf regulator was incorrectly modeled as supplied by vccin_5v
(external DC), which means the modem would lose power on battery.
Correct it to vcc_syson per the schematic.
---
Coia Prant (6):
  arm64: dts: rockchip: fix GMAC clock parents on 9Tripod X3568 v4
  arm64: dts: rockchip: fix GMAC clock parents on Graperain G3568 v2
  arm64: dts: rockchip: fix GMAC clock setup on BPI-R2 Pro
  arm64: dts: rockchip: fix GMAC clock parent on Photonicat
  arm64: dts: rockchip: fix USB OTG power on Photonicat in battery mode
  arm64: dts: rockchip: fix modem power supply on Photonicat

 .../dts/rockchip/rk3568-9tripod-x3568-v4.dts  |  4 +-
 .../boot/dts/rockchip/rk3568-bpi-r2-pro.dts   |  4 +-
 .../rockchip/rk3568-graperain-g3568-v2.dts    |  4 +-
 .../boot/dts/rockchip/rk3568-photonicat.dts   | 53 +++++++++++++++++--
 4 files changed, 57 insertions(+), 8 deletions(-)

-- 
2.47.3

