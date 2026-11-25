Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795602843;
	b=uj5NY4iewmfG2FvKTMkeXKDTfvQpxO0zEUHTkohRZxqCGE2+Of6eLIVA3EiD9IoDq0wf
	 5Eyd5z/BAPdYmPHdXxgaUq2ieGN2vD2dXaZN12CElbtHDEmhcsbAte7rJO0b6eXL96pKC
	 BKHlIdhNr4X1iuoObR2S+tctsnYZLxLbycW0ly+nC4PWSjThKgOm+INE91MzL2AEsKciZ
	 Kae0XHC7Qn7Krt8/WlVgzULD2XKzsi1L0abJf9JOYlVm22mkKi/Gm5bh2AEcpYpDYI2cp
	 Jmxvw5cmX9yCc07jzGKhFBqgBegVrRdkIUlld8RPAMagwckzUKz1Mul2CrUpL0/22lg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795602843;
	h=DMARC-Filter:Received:DKIM-Signature:Received:From:Subject:Date:
	 Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=/vZ/NUO91U7RmjEEQoND7bMbRcAjPQeJzuPnx5wjuNU=;
	b=xS7hvi+HLCQNSVdNZt1wRgaYja+7CpTK9/wWmrVGkhFs2kZyCluPLfRqjHTu12b0rlRO
	 4Nzqgx7fDDKjhZKcQuBQEQu6ZPPaTP3aFUobc571jCyeyo36UmbQlNB5Fpnm0w8y8liMF
	 of4NT0ssMkCoF0NhjYhLXBiESwYAPJkoant/5711ygw1HejuOlvxjWWxxfMhhPsgjU08A
	 CsKVoyWni33jbW0BtE6Sy4Me+4d79KaRbINj/6VrpP5x/pd532atPnBoDUVk7s24s2qjG
	 vJh3pgRex+2HnzLkwC+sRohjCjHMnL/ci8ndaFo/ztFDEZR+23N7Pl+8vTdsYOOpVoA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=RzNVdPKf;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CC9C606A329;
	Wed, 25 Nov 2026 10:34:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7CC9C606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=RzNVdPKf
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 0E4AC20220C;
	Wed, 25 Nov 2026 11:34:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1795602840;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=/vZ/NUO91U7RmjEEQoND7bMbRcAjPQeJzuPnx5wjuNU=;
	b=RzNVdPKfVzAoES/QYo3vaq2536/eoZ56Hcse5qvzAHrwxuDS1++EcMAFojo2VklUQm9Gio
	KBVIFNvceztK5XV6hpQ/hZ7nKrp8U0puDIIgvLx28uYmU6ifwAwBIntuzxqGTHCaGKbqzs
	joqJqt/OneJb6JNFPgP9518g7LbyZJMRh3KFKp6FrVmwHDuiUTqcd9MIS3NJJq6lcs0ebh
	vUk3qETvkGVhenAnvQnxnBd4thKF8MMLeEbGZiE6cJDY0hOCCKs9MgIsielcjzuvstoV2O
	NhYG6QALtIxbNwKV9hGwkPaAjTLHJ+ahk4ttstTLco7vT2dwmK+XC1BBD5WbtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1795602840;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=/vZ/NUO91U7RmjEEQoND7bMbRcAjPQeJzuPnx5wjuNU=;
	b=DS9rVM3VsRzwqwMCnxcNvzePbFGs0a+/i1VuV0Bi3QBxmp/iy9dY1kfhTSMooxr8kMkDDd
	GUMpspvZb/Ru89T5sD35OM+P2UAV5E7iR1dYeKCx9WJJVsaAVYFfMVy15dOOY/Vx61JfaS
	BkZom5Ni2yKvePGAnRD9DrjP8B5Y/hw0k/AxcWoXJ/Xfe8H/gG4DdbXp3SrYZtl35D2q6k
	yZXt4kvu+iLrQbrNZM/l3a0LfgHB7BoBVk/St1Gmxw+SAu9Yw13HIArIJhNDj0ExKtjELj
	/H9VfVGiCGBPH03GoFG2HQHa5jc41LUbA8jEG5Bay8hAoDcJY7r+0KrPlrlK1g==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=relay-from-drehscheibe.grey.stw.pengutronix.de smtp.mailfrom=f.diener@pengutronix.de
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1795602840; a=rsa-sha256;
	cv=none;
	b=abO8ki4S/2xozxmRMYPKdTjHiy4sj6ZvjI4uuoluOA4pL/5xUAQn4rFJzEI3aiJfLVYUGy
	Eac+rfZ39ualJsAJsDCxflk0R3Jwp5WwJdrWUZ//kldJeUCrL3KmPsfG8SNoPI8Zj5rU/P
	wIPqEbQDDAmaQUbZ6RYENyKc9EhjG/mK2P+RkEkbwE64RWQYFS7fh8kvVajMvsv4byTetf
	g/bv3lOjuNeMM499H8Q6U21mtXg7zEGZ8gAjQkRryPBObLxeVmrMBVdpxDvMSyeCpa+j/C
	hXH5YZ4hiCmMQiGWhYmWW5U3zx0Yuzhzax7gIZuHULMLjhVncge/OB3kFkrNDA==
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.2])
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <f.diener@pengutronix.de>)
	id 1xWAK7-001P9N-1S;
	Wed, 25 Nov 2026 11:33:59 +0100
From: Freimut Diener <f.diener@pengutronix.de>
Subject: [PATCH 0/2] Describe ROCK 5 GPU and NPU regulators as post-init
 providers
Date: Wed, 25 Nov 2026 11:33:56 +0100
Message-Id: <20261125-rock5t-regulator-deps-v1-0-6a3470ad1855@pengutronix.de>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMTQ6CQAxA4auQrm3iVPmJVzEsYKZC0TCkHYwJ4
 e6OsvwW721grMIGt2ID5beYxDnDnQrwYzcPjBKygc5UOUdX1OifZULlYX11KSoGXgxdIKK6by5
 11UBuF+WHfP7fe3vY1n5in34z2PcvNLSp1nkAAAA=
X-Change-ID: 20261124-rock5t-regulator-deps-1d2227b83768
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Midgy Balon <midgy971@gmail.com>, Chaoyi Chen <chaoyi.chen@rock-chips.com>, 
 Diederik de Haas <diederik@cknow-tech.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Elaine Zhang <zhangqing@rock-chips.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Freimut Diener <f.diener@pengutronix.de>
X-Mailer: b4 0.15.2

This series addresses failed fw_devlink sync_state-only proxy links
by describing the GPU and NPU domain supplies as post-init providers
in the shared ROCK 5B, 5B+ and 5T DTSI.

Related discussion:

https://lore.kernel.org/aixze8zFboY3huSf@venus

Tested on a ROCK 5T with and without the series. All three device-link
creation errors disappear, while driver probing, runtime suspend and
resume, power-domain transitions and regulator reference counts remain
unaffected for the GPU and all three NPU cores.

The modified binding passes dt_binding_check, and all three affected
DTBs pass validation against the Rockchip power-controller schema.

Signed-off-by: Freimut Diener <f.diener@pengutronix.de>
---
Freimut Diener (2):
      dt-bindings: power: rockchip: Allow post-init-providers for domains
      arm64: dts: rockchip: Mark ROCK 5 domain supplies as post-init

 Documentation/devicetree/bindings/power/rockchip,power-controller.yaml | 3 +++
 arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi                | 2 ++
 2 files changed, 5 insertions(+)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261124-rock5t-regulator-deps-1d2227b83768

Best regards,
--  
Freimut Diener <f.diener@pengutronix.de>

