Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FB0D4FC342
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 12:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791896283; cv=none; b=qa07d5hVYpTqRLw3lnRi2UGv+m3ESOQ7qji0YDR64NhYizmIUvSMIKjo+o49zFfAAfj+O8R5DIosKTMi2fyQSuLHi55Nbc8ubrG9e7u1srXvDMzUNNEvUwR+Z41s7/OC7GUmcR+opdf1gZneJN5TkPnu7hDXUBM3CpAZRrNm52w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791896283; c=relaxed/simple;
	bh=+oi137C5v8lhZ9D/rjwYIKeb/nW7GuQAEUI5HDYvogI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tsFWlHuS6GpGIfYutaktYLTOaBp7WMefZ/wOD3Vfp753XeUrXHKFFWehHCPfZ2dS5R+vFJCxa1lR+NdOrubGQmGvxKYwyQ8QN9hcHkBIJ8nW/LCesq3raJCr3Z4dJpHkstbcbUqSFEZLec+0+QhG8fJpndYDHQRMN25bqYq+4rA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=sYWalRoB; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="sYWalRoB"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c2e4df2e26fso385921866b.2
        for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 05:57:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1791896278; x=1792501078; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uKoZOiY22/hh2HRABqFxwdun7S2utwDjGnieV/Qjm4Q=;
        b=sYWalRoBeFGMvTE3WHoK+RNVkaAHq2TEOz+F4n0Frm7Up/Z0EwSvvjO6gx3GqDn9FS
         fuy7MmDxrwi9OXXtSDCZMLRLc7/1ca0HVfWPyf78FBJ97l5pxilTiA4IX2+4C1AO67CT
         qyS0wdxYmZoSEzufJb+KAP247vDnmkFhime/dlqiS18OtW5vJB4qHYSEvGSIcv2LK8Y4
         qh7YyZ3i2ct3ys0OeWyNINnSQrv6TcmgfnbzoiaBBoshC6P1Ydoj426LZCyiR2Uv0W9z
         43eklAvPBpTo7UgEMAQpBAXegl86GV48B/01L/t+u/0ikFUfqikvNC/js9a4Vns/+hvx
         nxDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791896278; x=1792501078;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uKoZOiY22/hh2HRABqFxwdun7S2utwDjGnieV/Qjm4Q=;
        b=LuABGggZOOLpFWw/fHJ4FkE5OYo1yhMl1gEaWRzSw0EHAENGFKR4xqszcXlpOpzcpg
         Jj6bBN+CAwpiddh5fYuuMAKBo13tjZb4lZHC7RLsUDSaCLApg8qRqlnh28nTd4EReuMo
         Tz9kgQKNmK2jCaHPeijl1FcHxPT1aqhrErfarsvK2CujxlE+P+OAkj8fg6CgbzmJ+ZQN
         gyLBc9+uTvl8mu6p/B3eHF3e8xe+wU9oIO0yIeLSQluT0xkiaZ/xQ882J3y5xQVNc+RU
         Rg5UrX7wgI5gOdyn9gMcyaNhes8l7Rx5UXopAJHYXxwyoww1PgdgSB7Aye0lHzNPL0Tw
         3y3w==
X-Forwarded-Encrypted: i=1; AKwUvBzaYVMGouLWrs1zF8ajE4yE7P8dXUr7OZ+Q/19eXSv3Pk3kn67csiGo4beOjma27qDEX7sKvyBT+Ou5@vger.kernel.org
X-Gm-Message-State: AFq9FYLOJnF17u+9KZGyJCgKBevjQsp/5bcfEEqphaeNkuTPpLcqu0uU
	1fsZEYm2gSPw/r1OtAavI/V19YoO3pFXGyc2STOtXnL+PSYX4PO0ZiT+2FmgQC2ZXqdaMM91ei2
	rIhJe
X-Gm-Gg: AYBFou0MtwVzJJI5DxKldQeHhvyR6MTmQr/gsZ/0KEMTFZA6MePrdnBUslRWbHVxMXl
	ZUZcLCwo1GkELeZDVFjB24rqtQo8Y7FqDWtWnSpLEoR39kiYOdzCgfxPyl6x/TgqN/EDN4GSk0Z
	0P1vftJXIuX5h6Y56bjAsUpgWpTJyhXmObrByguV5VtiDO8azSdQ76rvZwYBQNXOfdtBKqTTaiz
	Zq2RhojARnQhOdcPd8gwoRPsBuJAlB9p6a5b533ipPZ2QUKq9YCvT6KT1bXgTJqgrY1bH4hH2Oq
	J4n6pyc3kMdbrfCQsI7l5rSJ0Q1mFC0SAL95+p+a5/6onEGYc8gKStVNaXATCgr9FNYPR+JaHgl
	CIFWrbZVPMoPUYpEym5oek0qOe98qQGqjYE1vGat+0q7Z+taB7+B7kiKnBam7UUSUqQ2UxN2jug
	pxN2A/X9iK+PPwtortn16P0Fw8Zadk+PxQmGv4BaLEKqAXBswfiZ7vFNT/0TpuT5BA6FVITxFDi
	qM+FkI9NlSUBJ/ZdY5mpLA54Bb32HlMS6JXZd4Wdmb8okCx/dncenV1shub9vUbg+2YLomJ4NGl
	u4UxEoLeK/xldLQQL6OlPUUMLLIhFgc=
X-Received: by 2002:a17:907:8692:b0:c2e:2720:8f68 with SMTP id a640c23a62f3a-c31aa01b41fmr1097966566b.46.1791896278346;
        Tue, 13 Oct 2026 05:57:58 -0700 (PDT)
Received: from threadripper-fedora-workstation (d-zg2-045.globalnet.hr. [213.149.37.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9ac9ecfsm605985766b.74.2026.10.13.05.57.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 05:57:57 -0700 (PDT)
From: Robert Marko <robert.marko@sartura.hr>
To: linux@roeck-us.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Steen.Hegelund@microchip.com,
	daniel.machon@microchip.com,
	UNGLinuxDriver@microchip.com,
	nicolas.ferre@microchip.com,
	claudiu.beznea@tuxon.dev,
	lars.povlsen@microchip.com,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH 6/6] arm64: dts: microchip: lan969x: add fan controller
Date: Tue, 13 Oct 2026 14:56:30 +0200
Message-ID: <20261013125735.1542349-6-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261013125735.1542349-1-robert.marko@sartura.hr>
References: <20261013125735.1542349-1-robert.marko@sartura.hr>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

LAN969x provides a PWM fan output and tachometer input in the DEVCPU_GCB
target. Add the fan controller register region to the hardware-monitor
node and use the combined LAN969x hwmon compatible. Declare two PWM cells
for the period and standard polarity flags.

Board-specific fan configuration and pin routing remain in the individual
board device trees.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
 arch/arm64/boot/dts/microchip/lan9691.dtsi | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/microchip/lan9691.dtsi b/arch/arm64/boot/dts/microchip/lan9691.dtsi
index 52c22dd1a15d5..cf98b35912245 100644
--- a/arch/arm64/boot/dts/microchip/lan9691.dtsi
+++ b/arch/arm64/boot/dts/microchip/lan9691.dtsi
@@ -523,9 +523,11 @@ sgpio_out: gpio@1 {
 		};
 
 		tmon: hwmon@e2020100 {
-			compatible = "microchip,lan9691-temp", "microchip,sparx5-temp";
-			reg = <0xe2020100 0xc>;
+			compatible = "microchip,lan9691-hwmon", "microchip,sparx5-temp";
+			reg = <0xe2020100 0xc>, <0xe2010348 0xc>;
+			reg-names = "temp", "fan";
 			clocks = <&fx100_clk>;
+			#pwm-cells = <2>;
 			#thermal-sensor-cells = <0>;
 		};
 
-- 
2.56.0

