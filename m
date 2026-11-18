Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795016573;
	b=VhHizyqUT5ctGZE6COMtOtv9zGpr38E++kQjIi1Y1ZpiGC7ViId1kTt74qgPhEmIwMez
	 DF3ExwhVoAc94LxIXhxE7KLvjnOYlaxSjrDYL27G3ZYYXqQWlz57Li7Pb6HLsyE7nrSCX
	 yBwGngRGJq3eXa4Lnpg11LpIJdyZlW+cnG158seyxhVIpa/3RAP6B0eItFHkSfhBmms5G
	 X9zb+UuMUykw6yhoXvfGH1D58x7w5piUpTZXncZL/xFsQr8rXy5l0ThEes6HJNv4mZy6C
	 vKai/L52Zjklioxtx8RdSGWltJJ5OtJLff63S1tONjOtZHBBDcED43Yt/fW76Z15ZFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795016573;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=AbKMYKWH3iewMgKAxFSkHDiwx9izCcaKX86SNu4jj0U=;
	b=nxbDfGB24xp4dmfPcIumPQHWSxHPLGQ/Msx8Vg7ADmw50Elk+TDVEsCgT1mw4X0cxcO9
	 zCEB1CN1RyVys5zAheBCvyshpWONfkM6Wx8zHbNbkb58xxHPmcODMXTkW325DEl4bIIej
	 xvFPglzwMgmZs1KuYKagVI3RRk1WH4sEsqAUPCc6ULKtiQ+N0G220vsHhGjBW/mEzMzEe
	 vIkwNUh5Am6jhecTtkkMuNswmv2Krf0XQhzTNQpxDrFBIzboAxgYCEkBdbOkVXmXijnDj
	 9duo4s3+XRfunydedeFMh0sZ51Cb4yCGM+VBp8oN6VVbPm0whSAhSv1T5tFutq/IJtA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=FZgEXscd;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1831B60A2614
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 15:42:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1831B60A2614
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=FZgEXscd
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-498f5fa5103so647917f8f.2
        for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 07:42:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795016570; x=1795621370; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=AbKMYKWH3iewMgKAxFSkHDiwx9izCcaKX86SNu4jj0U=;
        b=FZgEXscdbxjNNf1VALJGcNhTT1gSdlqPDvyjoKXNhnb39wzulYXWgnpyk3wqdC3vLh
         uSgJfl5L0BWQkqwPxnnbVRHbNcOkQw4K6A7FyHKL/095TJ0yrb+I/aVqceF/qYMFXdL8
         9ny+CXM9zEVKMEuPyOlGeyJ1xujE3Vv5qT4KDaSX+Te0W1vgJYgweuSjTyYHIiuA9crL
         vsYYXhjH1Kc+XtKoSPuCMqti2K+a9gX7YO6fJla/TzNyAJIyTcQw8xYPR1HsGsCYC/CD
         DkTJLgaJ7DbOHwBUYNMS1Gls54hzPGRWOYVfOvyGhkqd6EdgZHxGZhU8j220h9RdM/30
         kQFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795016570; x=1795621370;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=AbKMYKWH3iewMgKAxFSkHDiwx9izCcaKX86SNu4jj0U=;
        b=QH6O2tJ/6AVixJny1BOmR9dpkBZVj4GioFUeKO/mxcpRNg1nNRTXw8RfsiYpzmpQKS
         kcFTxKWgRl6DdM85/0CAuC6dRxN1qaLZABOzfpNzaPmfEMNwMxLiS+Q5Db8qDPDkU4al
         zxiVz8fu3leqYLx87OvpAFBIg4vbUMo2DlZxxLdxipmwMPnJvQvCE7kJnWrBrHhzut3M
         wKwqOd29IYA/eY+2kFREUQm7ITct/Fai9EctL+qEhY0tHvy22nYseRknnwnoqHUJ8BF2
         RC/2QG59zlX6evuM/w0TQXCsdy9xIzJDQQKrDQ0pcDuGxsSMCHtJCMr2DUG1KLnzSWh9
         jnqQ==
X-Gm-Message-State: APuU4Z9GvT9dwGJgWlpa7QEG/IdZx6SLJCMULQiG1XUU34ZHtLPWmNWy
	L0S1rdAWVhbuMeGQEqgQ1bEWrQFfY02ADEQrxNyOFVNohhurlcUqXaaX35lhfxNkR2g=
X-Gm-Gg: AZFdTZdex2/YcC293M1Oh5Xnw77Agh6OdIwHrK/LP0t2/iUWeKqpzkTSyVIokMMOK3X
	X5U05IVXWtP8RFIoAc0NUCeq+GoOO21b6K0l5S7xOhaouGMzmG7pxUuyaQyK9EOankuLbJYcUgq
	hwWc22CfRc8wRS2GcUirhBTnMmXCtkTc2poOobUzRKWQ8YlDJJX3tAaA00918XFpjA16usNT/gK
	mZbrNekZlJoE5gAuL0zRDUYPEIFsQKD6nq/Ptqm2sK2HdqIGcfglelY6IoKNh7WVriSqBxevzW9
	2IupiMKydwNLzZzSNaKCno/GTgVteFpJtTzDmidqwMLhC/3PzwUJ+clrj4gZy8wyz73oIridiB9
	1/+ca0ygaSub9aLuw3KjZgbTzaECyxprHCmG76opoQFNstJwgOjN3D5PJcVvSt5HWtcb5iawzHr
	FzUM6yPy3xqT2bERoA+G1poVCuVw+iEZNEfQ7Y0ARK2Er9Jvaru7vAvXSI4FE5otQCWd5XgSmfQ
	Jq00nNaQlmjQd4lI2LtZjiKokbVhJrgY1mp779dCuhepo8R6zOwfArfAdOUhm3Ve98cw4gyPflN
	Ivht5uxBU1sbtPKfVml+sKiEj7FyIeJ9
X-Received: by 2002:a05:6000:220f:b0:4a7:8406:1e91 with SMTP id ffacd0b85a97d-4a7840621e8mr4063009f8f.30.1795016570528;
        Wed, 18 Nov 2026 07:42:50 -0800 (PST)
Received: from [10.42.0.1] ([2001:8a0:d6cd:9000:86f4:4e71:9fc8:3183])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a65609391bsm5555261f8f.36.2026.11.18.07.42.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 07:42:50 -0800 (PST)
From: Daniel Drake <ddrake@baylibre.com>
Date: Wed, 18 Nov 2026 15:42:39 +0000
Subject: [PATCH] arm64: dts: allwinner: t527: orangepi-4a: Add PHY enable
 delay
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
Message-Id: <20261118-opi4a-cldo4-ramp-delay-v1-1-9e3368973379@baylibre.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/x3MUQrCMAwG4KuE/3mBZXQqvYr4ENpsBuZaWhBl7
 O6C3wG+A92aW0ekA83e3r3siCQDIT11X409IxKmcbqIyI1L9aCctlwCN31Vzrbpl8OsSZOYXMc
 ZA6E2W/zzj++P8/wBbu4jhWgAAAA=
X-Change-ID: 20261118-opi4a-cldo4-ramp-delay-45acac1e1705
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Andrew Lunn <andrew@lunn.ch>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Daniel Drake <ddrake@baylibre.com>
X-Mailer: b4 0.14.3

The Motorcomm YT8531 Ethernet PHY on the Orange Pi 4A was not being
detected: its ID was reading back as zero and preventing ethernet from
working:

  dwmac-sun55i 4510000.ethernet eth0: cannot attach to PHY (error: -EINVAL)

Add an enable delay to the PHY supply regulator, as was done for the
same reason on the Radxa Cubie A5E in commit 7076938d20d2 ("arm64: dts:
allwinner: a527: cubie-a5e: Enable second Ethernet port").

This is also similar to the original vendor DTS which has this regulator
as always-on.

Fixes: a3606e8a7819 ("arm64: dts: allwinner: t527: orangepi-4a: Enable Ethernet port")
Signed-off-by: Daniel Drake <ddrake@baylibre.com>
---
 arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dts b/arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dts
index 26ce579b42bf..e1cd43ea7e03 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dts
+++ b/arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dts
@@ -319,6 +319,8 @@ reg_cldo4: cldo4 {
 				regulator-min-microvolt = <3300000>;
 				regulator-max-microvolt = <3300000>;
 				regulator-name = "vcc-3v3-phy1-lcd";
+				/* enough time for the PHY to fully power on */
+				regulator-enable-ramp-delay = <150000>;
 			};
 
 			reg_cpusldo: cpusldo {

---
base-commit: 20eef29b7c8465ac98d7dd6d6f2ac07a8d8056ca
change-id: 20261118-opi4a-cldo4-ramp-delay-45acac1e1705

Best regards,
-- 
Daniel Drake <ddrake@baylibre.com>

