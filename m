Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792680412;
	b=u6dMK5IElsTvQDNbCbcmO8q4JW+h67o1IcJvkJCciYpeYSGpTge4QDxhVOVHB/GyvnPt
	 dWxStr5d/ceUfyBR2OlzrPPhLqLRTH0+AGbAunfoglyLSRcaRAdFaD+3Qm4+wZj/TMavJ
	 xJZjvNqdqdv0lb63guxpYoyuERXvm5lVt+gqPCAyLuKuulheaHrUQTMdT3q0D5tJkSuYk
	 ioENOpZ88oDX+t3dgME46u6jdCty8lQNIe6eFsVLz/1G+zPLW2WlGr8slWw+TrGe4VI+K
	 9VwIwbErdbMUCYRV6EVCQV0QwHtuAxjRTbyeSwAOqiS9lvqcXfOgldk3YzIu+hlKM4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792680412;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Subject:Date:
	 Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:To:Cc:X-Mailer;
	bh=xBDqLL5GuxOGFYhhyYk77KxsJOi32ML+5os83sQIq8A=;
	b=M1Q60d1YHqP3keuGBDPEXccFDkJMHJY3ncjm5dipRsH0nXw5eJkt3UNR+U/u8cL5PSoZ
	 QLEZVLDwCoPxq9TKGqL3oEonvQUPA89btWBcJx8kLfuH18P8eVHKzdpC6dSpvBESDCVMq
	 45+QCHfojdkOMeXvSE4pqTs6EYtAT4+Q3bOqKQwUz2cuPvP8KZuN6m/RrVfqU7I1c/JXU
	 bSM08f3zzRNN6UoAzev0jy3EskJ/d2cg8Uq5Ov5rBUn/zymclT/JaemT80axGTE3AYpC5
	 78UOlqyIQgo1FYhuqoYLSg/YtERBEpuy373HwuO69a5WMx95fnROqwrjYgKtnsTHPYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=DWOhEbyZ;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE325606A31A
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 14:46:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE325606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=DWOhEbyZ
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48bbb06e746so1215850f8f.3
        for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 07:46:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792680410; x=1793285210; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=xBDqLL5GuxOGFYhhyYk77KxsJOi32ML+5os83sQIq8A=;
        b=DWOhEbyZupY6A6Bx98lfDLMZ+jao4XBWvR2wmr1Pufz2RMFe4QuRJu89Bth2PWK9oq
         abRqseaMgIY0+df6PDZxw7F0a4H5IEWO64EO2WSgCLRZT6YmJESBpyE9WiQ/FJqK9e0w
         IDjXPvsmwieup6oNnAcsxTiMyaBPdS58MyWv9ICRxSyUkQ5qoI7pvJPVglAAeNcJouj2
         rkAWgpadM1mYJC5Mn3vh2bLOwfevicF5wCTkLx1+fvgXOREphrgG/IFxkOUf/5pYBUTQ
         qNMH/xmWQ4NHidqnCPCaQAxtGVmWnQ3i5ZioaX9Fv3Jb6k5JbimnZDgqtG1EsDUBsPU2
         AVLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792680410; x=1793285210;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xBDqLL5GuxOGFYhhyYk77KxsJOi32ML+5os83sQIq8A=;
        b=snv/wTYx2JDXGVPZH09c8T8oka+Fpg8D1CEUO/nH41AFaKYpwr/rt54AINHS2kmEKV
         GvSVYhyv4ji9t/FddBvp9Mt8zMpd9bIBqP8DLcV1Dgepu1ArSGPunpzCMxHW250Tnw5R
         CmH+EXo85Z6pBqDzG1uCQwAsm+pH7S7aWBTHQS9lvKoSy2VCGYvOinFQTxSyGN3YmkwJ
         oACr/5u15oRglk1tJHl9htPzk8cre/2Cd93pbzTHJH0VRAqFenaqDqIWqONrUG8OAYm0
         FbIgFY7GtcRbdURiIDLjwxqOANfaRsEZ7V189gyIII/80eqXmvTKzbokWml9MTXXqgLe
         Nw8Q==
X-Gm-Message-State: AFq9FYLiMTVE8WzjIw2MPwfQXrz/3BQQAkRlqpqKp/pNaXqeLVZbpZQb
	/7W/syrdbjlMmMvNlUOn62GiG62aICrvX/tmVDWh5NwlKoYUEMxL/Xls
X-Gm-Gg: AYBFou0oMbWLlCmlhT5FQZnnMidI7p5vi65NCgLLg2Yyu3mxpxTGDIu7ysjxyCs1C7A
	ZHiCio1vI/I02yU+4Vfg5Rc2PFHICcNuUZSo/1Sz5Oyxs3xDZgBe94whC3d0FAxWELrLUag1oCY
	Xa1RsBRtaakaJugfoUX3O6SZv69xNCGHXpFQy9ZIK1C/eJEzyxN6PTvpvVX/y0DIw3Zm59jE4YP
	aAzmHcKfcr8vHRlaiS4rB7HAnrcz3TlPlCu18fPiPyLojLuRPLmWlPMpLqZKDQeDTu9A7HTU7j2
	09qxzgUCXXKFFO8mxiZJOVaGeKhyLST5BYps86bWayQVzqNN+/qd4WZVsoE/E7dnvWmeW+OjgNG
	cT/7+R85sUAveGOfudr39qEZbtoYIxYS9PZXyP/b8e337YPKROUtXge0mk3+frFsI1TgPUSwysu
	tBCYcA6gm2ayMLGTkYhP/mby1JjiCs3o4el7dcVGbGf5TU+3NJMV035WprtIFbp13nA1JUYFimS
	K90VB/t+Te1B7Q2D69E+iT/HlD/ptKWlnCfwU7RKWepD2vHa7CkgAFTof8aJaIck3xc+K1GL6LZ
	iCCMMkqxYHdOYjriDo5OeNE4lmegSAq/MxVDOCO2BkD18tachgkmbOhe+PQbHqJnqNIIrc00PAd
	5
X-Received: by 2002:a05:6000:4009:b0:48d:ffa3:714 with SMTP id ffacd0b85a97d-48e264c9950mr11847583f8f.19.1792680409680;
        Thu, 22 Oct 2026 07:46:49 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e25828c6dsm13672146f8f.24.2026.10.22.07.46.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 07:46:48 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Subject: [PATCH v2 0/3] arm64: dts: freescale: imx8mp-toradex-smarc: Add
 OV5640 overlays
Date: Thu, 22 Oct 2026 16:46:43 +0200
Message-Id: <20261022-v1-smarc-imx8mp-cameras-v2-0-cfe3d25e7aed@toradex.com>
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
X-B4-Tracking: v=1; b=H4sIANQh2moC/4WNQQ6CMBBFr0Jm7Zh2gk115T0Mi7EdZRYF0hKCI
 dzdygVcvpf89zcoklUK3JoNsixadBwq0KmB0PPwFtRYGciQs8YQLhZL4hxQ0+rThIGTZC7on86
 1kclEbqGupywvXY/yo6vca5nH/DmOFvuz/5vVG2Qj/mo9BUeXe01wlPUcxgTdvu9fo6+R08AAA
 AA=
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
X-Mailer: b4 0.13.0

Add OV5640 camera overlays for the Toradex SMARC iMX8MP SoM and its
development carrier board.

The overlays use the camera connector GPIO nexus, so this series
requires the toradex,camera-connector binding from v3 of the Verdin
iMX8M OV5640 series:
https://lore.kernel.org/r/20261022-verdin-imx8mp-hmp-camera-ready-v3-1-90a30b0b0d55@toradex.com

The camera regulator is supplied by the on-carrier 3.3 V rail, which is
described by the first patch.

Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
Changes in v2:
- Include the on-carrier 3.3 V regulator patch, previously posted with
  the SMARC iMX8MP display overlays, which are deferred
- Refer to v3 of the toradex,camera-connector binding
- Rebase onto imx/dt64
- Link to v1: https://lore.kernel.org/r/20261002-v1-smarc-imx8mp-cameras-v1-0-a0e89182c625@toradex.com

---
Ernest Van Hoecke (3):
      arm64: dts: freescale: imx8mp-toradex-smarc: Add on-carrier 3.3V regulator
      arm64: dts: freescale: imx8mp-toradex-smarc: Add camera connector nexus
      arm64: dts: freescale: imx8mp-toradex-smarc: Add OV5640 overlays

 arch/arm64/boot/dts/freescale/Makefile             | 17 +++++
 .../imx8mp-toradex-smarc-csi0-ov5640-24mhz.dtso    | 15 +++++
 .../imx8mp-toradex-smarc-csi0-ov5640.dtso          | 75 ++++++++++++++++++++++
 .../imx8mp-toradex-smarc-csi1-ov5640-24mhz.dtso    | 15 +++++
 .../imx8mp-toradex-smarc-csi1-ov5640.dtso          | 75 ++++++++++++++++++++++
 .../dts/freescale/imx8mp-toradex-smarc-dev.dts     | 33 ++++++++++
 .../boot/dts/freescale/imx8mp-toradex-smarc.dtsi   | 10 ++-
 7 files changed, 238 insertions(+), 2 deletions(-)
---
base-commit: 7f47e8eafbf55a2ad0697e5d28f5e6cff2fa42f9
change-id: 20261002-v1-smarc-imx8mp-cameras-8b664da20da4

Best regards,
-- 
Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

