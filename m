Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794870010;
	b=IU0aQnWNCv4yOPcVIZvCRpJJEZhMxl1gt0F5N9s2vu7/zYCD1OFaokwGuUfqrq//BKUh
	 iipr0OoChpA8NNDQ+1og7HO5QphSQypf0S34lNr3JV8sGqQSMu+/OxF2A4LiEaLGK1VHm
	 kJZSRoS4sg8JNqUQKQFGE53aIlRNp/+mthcoKsVKHAYK+swqIchk1edw+4GfdM46nhc0D
	 YacwYx3DayrTyQDdiP5Q0CczYJNp7mCWa//wZ6kd2oIh4DoYGHnslKRy6/bj4ZywfS5Xo
	 iTaLk2iflR9fw3bcXz4bOm9VbxOAqNkVfP6vGZmXfObRCEocsy4CghPlD44ad3vhCtw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794870010;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=qec2792BZT8xMgh2a+hcg7RSIyutDzwTcHaSiTYIrKU=;
	b=VA4/5FNa+SeXewxZgPRDZB71EY9fV2JR0kpbtrYJis1sqc4Fp2pdeDTaUpl0ZNcrNgh6
	 m5+33I2e6n3InThgRfxikOioiMZ6PLOZ7m+iFJxlcQBv7SrpQsHTtWKiDugF0ojT+3LdT
	 uhCEHKEjxeW0t0iLeplmRsGLovzxuntb91X0o/6NOmfVXoDbn+1QyPMZFAfkI2h+HMm+F
	 Pc274Ve0BZHKEHd35rzs8HaSvXzN9PnWcFpANq8afCo8qPIoqOd7cs+k0NTVYJUHfKG7C
	 jTxZ2jyZWXSgoViv4eGJbQ+vZVjg7dxDv+JWQ94kIrhqBRFVMHu4tEaaz8gGWaoejPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.128.174
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC241606A33B
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 23:00:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC241606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-8b0ca1ebc8bso40001747b3.2
        for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 15:00:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794870009; x=1795474809;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qec2792BZT8xMgh2a+hcg7RSIyutDzwTcHaSiTYIrKU=;
        b=w9y5YiWMGoDl85TtctsoXEa6Dstn2rbCM1slhH33Js4Z6Vss9xjpY28t8C7xxZCmVu
         +WRWnw24qg0dql7RewHYaq5+30nErNy2fP/2C4uP8KKZzt6x1VBLWhwbt6hnuPrUfXcV
         ngQcgR2Y2kk58QQWOL+ImDVqDSTi7WqYDCxJjjwIByQi6k82YrzWDygPx132lqIeEQVj
         lluyZQXl98b/gL1M7ASVHuYx4RNOaLXieFhuNeftSJRrbcLMJYMs9gs+x1l8ARU+izNo
         CslC2r7MFFNQvF3JM7rkbOotvett5MAmG6KpPcEIY+lgNPnXpZWxVnlQ+f9nWJuWK9op
         O9bA==
X-Forwarded-Encrypted: i=1; AL+hErGwA0dbeu1aOc/UNu7QXLcHrhadsZWOPV+X6rUscn1KQwchIzE6+XInI1vp8zCiCMKE1pTqFHwMAMM2@vger.kernel.org
X-Gm-Message-State: APuU4Z/sRaSgSpOMtuQvSI5NEC5JEU5Uult9F+bWZDrRJaqSUerdUdAb
	usyL0sN4JirVzbA64f6UvjHlpyHiyNfXwMDnU2huEhs12m2sITYE1aux
X-Gm-Gg: AZFdTZeaqRxNECxs7Jzrd88AcMAag/EiTuhV0+CSIJpI3VJ2YRVArPI4tMzTnFlxDTB
	YlKyw582JkR/aRdRhYlHR9HdLwY24fLIhQ/zvhNOwbKGr6msFOYsHogttXy5d2UVmu+jZylkWFu
	VBOWywtov9w0Uci2p+QFv9UH6AOscno/Ij4TSifmB6vPaXI3QgobcIGNae8xV/Xpm0uq3asyWQy
	GJuBYDaJV+310wOQV2AIHj/354EIKVtAV1MgZHh5cBbXh1gntHhfikehVYULEYQ/KduEU0vURw7
	1x9oGLND+hsT73px3ao3eVb9+2hT4vP7k1ZGCL7ZzcYt1uBB8ims+2ZVSgCGW9WCr2WE5AQOZGa
	gVcPoZVvpYjSjWInZhri7o6mnGiXJIdzkMAiQNzpVewfNYLu3JQ7DdCn8+ss4SBh1ftfyCKhr2I
	A1BdrtLb5DIsJh+N4lpcKMczimTAYeNMvLVkTjtmDybwG74hMYI2hSfsI1ggLdduyVnpPEC8Hvj
	wAoSxaq7oCos1w5Sob53bVV2L1RgI+i9xWbPbgAqliZ7vj1zwtvNs3adQrGgAXajNCdqQOIRpG3
	e3+GbbllD7qIVft5mXCedVPt/c6s5dXAjDQb/P2h9aJk5fm0m7LUmBG5WXN1elfJwvnbdZXMIrS
	x2DFXOYV+xE+RJQsK65cDcMuGMkkPc2tp
X-Received: by 2002:a05:690c:e3e7:b0:8b1:867f:389e with SMTP id 00721157ae682-8b4aa0cf270mr66552587b3.6.1794870009077;
        Mon, 16 Nov 2026 15:00:09 -0800 (PST)
Received: from 1.0.0.127.in-addr.arpa ([71.68.170.161])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b4ebc50e40sm10721347b3.17.2026.11.16.15.00.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 15:00:08 -0800 (PST)
From: Joseph Telaak <joseph@telaak.dev>
Date: Mon, 16 Nov 2026 17:59:50 -0500
Subject: [PATCH 1/5] iio: ABI: Move out_resistance_raw_available to
 sysfs-bus-iio
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
Message-Id: <20261116-iio-ad5246-v1-1-ef6b7c06d4b0@telaak.dev>
References: <20261116-iio-ad5246-v1-0-ef6b7c06d4b0@telaak.dev>
In-Reply-To: <20261116-iio-ad5246-v1-0-ef6b7c06d4b0@telaak.dev>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Peter Rosin <peda@lysator.liu.se>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joseph Telaak <joseph@telaak.dev>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux@analog.com, devicetree@vger.kernel.org
X-Mailer: b4 0.16.0

The available raw values of a resistance output were documented only
for the mcp4531, without the channel index. ds1803, mcp4531, tpl0102
and x9250 all report them, and indexed channels name the attribute
out_resistanceY_raw_available. Document both forms with the other
generic resistance attributes and drop the driver-specific file.

Signed-off-by: Joseph Telaak <joseph@telaak.dev>
---
 Documentation/ABI/testing/sysfs-bus-iio                       | 9 +++++++++
 Documentation/ABI/testing/sysfs-bus-iio-potentiometer-mcp4531 | 8 --------
 MAINTAINERS                                                   | 1 -
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-bus-iio b/Documentation/ABI/testing/sysfs-bus-iio
index 5e987c502b13..28ce219caf81 100644
--- a/Documentation/ABI/testing/sysfs-bus-iio
+++ b/Documentation/ABI/testing/sysfs-bus-iio
@@ -2017,6 +2017,15 @@ Description:
 		Raw (unscaled no offset etc.) resistance reading.
 		Units after application of scale and offset are ohms.
 
+What:		/sys/bus/iio/devices/iio:deviceX/out_resistance_raw_available
+What:		/sys/bus/iio/devices/iio:deviceX/out_resistanceY_raw_available
+KernelVersion:	4.9
+Contact:	linux-iio@vger.kernel.org
+Description:
+		The range of available raw values, as the minimum value, the
+		step and the maximum value, all enclosed in square brackets.
+		Example: [0 1 256]
+
 What:		/sys/bus/iio/devices/iio:deviceX/in_coverageY_raw
 KernelVersion:	7.2
 Contact:	linux-iio@vger.kernel.org
diff --git a/Documentation/ABI/testing/sysfs-bus-iio-potentiometer-mcp4531 b/Documentation/ABI/testing/sysfs-bus-iio-potentiometer-mcp4531
deleted file mode 100644
index 2a91fbe394fc..000000000000
--- a/Documentation/ABI/testing/sysfs-bus-iio-potentiometer-mcp4531
+++ /dev/null
@@ -1,8 +0,0 @@
-What:		/sys/bus/iio/devices/iio:deviceX/out_resistance_raw_available
-Date:		October 2016
-KernelVersion:	4.9
-Contact:	Peter Rosin <peda@axentia.se>
-Description:
-		The range of available values represented as the minimum value,
-		the step and the maximum value, all enclosed in square brackets.
-		Example: [0 1 256]
diff --git a/MAINTAINERS b/MAINTAINERS
index 02015eaec312..9cb91ee8a56d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16680,7 +16680,6 @@ MCP4018 AND MCP4531 MICROCHIP DIGITAL POTENTIOMETER DRIVERS
 M:	Peter Rosin <peda@lysator.liu.se>
 L:	linux-iio@vger.kernel.org
 S:	Maintained
-F:	Documentation/ABI/testing/sysfs-bus-iio-potentiometer-mcp4531
 F:	drivers/iio/potentiometer/mcp4018.c
 F:	drivers/iio/potentiometer/mcp4531.c
 

-- 
Git-155)

