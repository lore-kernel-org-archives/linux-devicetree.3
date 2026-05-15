Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C86E947DFAB
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 12:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778846411; cv=none; b=fO0C7I6qoMubrlbVpySPk0nywqNpBS3a1adQzKqPy1Cw8F4eVbJSGperlWNOYt91TZudh9cmZBa7mmorhbfjwKrp1jijbAlvLQhIj+yDMq8ed7aZH4R13j88toyQ2aFgTaaYGwHOrI7+I5TvZG0L1dXyULOgZAN4ZEfOPK7J1h0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778846411; c=relaxed/simple;
	bh=uo29vLnQ0BZt3aDeTgW4q5BuCzNrGbj8p2p8C/H5RoQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ke+G9rkXJcsB4S853V6jEKEiJXpTKHKZ3bHRfXq+AwX0wkcrrMKDRvTiUTQ2ubOi5IcugigT5Dac2gPobUFAlvXs645rkYgZcg3zVwAdZlFDdqipWDDEgg/jv5WDwesqBBJXLt6EO6o/hQQLNRoabKduCmgB6BuHCy+k1dcee7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=xgJ2oAnV; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="xgJ2oAnV"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-3939d2bd7ecso6711081fa.0
        for <devicetree@vger.kernel.org>; Fri, 15 May 2026 05:00:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1778846408; x=1779451208; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KUVRwWWJXllkfJL309Dx+vzW9jbLbqXBywSfAZo29NQ=;
        b=xgJ2oAnVhd3prx6hbF+6o8ItrnnxihgXfX1UVjd/ZpCwXFZnluhRhfd3ul7n9GVQ33
         4MVAzwL3P+Lj4/QQVZU4gI6ALD/9ivLJ3kITSqslcpW7ylTpt/sPskt8ih7yd7UZdjGb
         A7RCvl1M37NmO39PXJ0k5kAmqCXmwr8TlNZD3lrqzVSRhQkODVBorY8THw09+/wwnuzE
         HyhYsGj3v+WYxVSe5HAxF1ZdhDidzPhEKTkTSAvjyTECWykNffz2XIGAdHYALAciG9O2
         Ebf1OJPt0SPwZqF9QBMd99zxwVm/Te7E3HBj+n5Qkw3SDbpdViH4kbTZ/piS6b63myjU
         4USQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778846408; x=1779451208;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KUVRwWWJXllkfJL309Dx+vzW9jbLbqXBywSfAZo29NQ=;
        b=PWx7tVcFnC905NziuWgXbwW9WCMkbd4BlkKuN+Uxhgt7Ahr8USSl6PXWRywsNPXyDk
         q22EZp29QbO9ZpunW7nHI7Ed9Vsjk1oJghBungUvcO2rSWhyS5x4FVT6svAeUUNQBMd9
         d6UYf9JuWT93JyNNTy3zDP+cHuxupadVw+W2B9G4NYKEKnSWUtOBotVAyuLGvgtMp4Cx
         CZyLMds7W43tOWfG81XQYeDzvqDqYagjd3ebNZYZ7jPRD94XpXKJa6YjYFXQ6JYD0HAT
         v8zBO2nrgehrs7t6ulfXWzard1TLZdGdexS0zpTPsrOBYRHGHOS3EwDyqB/a9aHEfB3K
         HMtg==
X-Forwarded-Encrypted: i=1; AFNElJ/6yxpTEpmmnOhGUqUTYp5A2uwaKApt+AEUsW8LpTV+8X+qKeNElpCexRaYCsJ6ZTU1YhCq58FH3ecL@vger.kernel.org
X-Gm-Message-State: AOJu0YwnT82wwdVPYA4F3PZVztt4ghw3pF7Cn9yxzRN+geurNlcBBBNV
	ocbSQuIEFBusBpReJjH2MkS13CNz9Utw2fsHn9RQAGMg1zkqXomNcojduw0Ptoy8gQc=
X-Gm-Gg: Acq92OFWZsULjb1+XOQwGbiyzb4/ZLCaj6VIR4/kvFZtAvaTVPsRKc7FXMJZO51Oln6
	0cxw2xq5X0saS2m3+qhpaqu94RvuxdaSBwdk/eoZ0fpYddXmtueHmXxqD823s3zZ/h/LyTKJJ/K
	1BlG/pAAMjUgGwHdLzT8s2ayLNbPxKZuUGeEQ4LD55w0uzjpoXbobH+Be8NN1OHIqLEdZ+HeAO5
	Zu0OwskOjLTZ6zAuZC9NyUnw8MuIT1pMt3u5pA5h8VXbRhkt3lqjQEYyeAxQCMiTTp2knWvNMdX
	rhRvYBdR3gYhmXvvonpDMe23D3QBbTedTmHm+ZqA0wq13gmPrn0MRmk0qrxHu9i6qzKM0L9d/WV
	Wj6gYOOp2pHl1KyKDtx95NQxjPhUJ+KF4OVqAF+0RBskihnlvcjhWnqSu+15e31CfeZyZaAHhsh
	TnDc8AkK176ZRD7RS0D/CYVdsbaxd6T8C9GlQ3IUzKukqf0koRFbMoTU9LF0tn7PGFKIhmNHYnB
	Wo7o810oqIbQONtOvgEfw==
X-Received: by 2002:a2e:9b86:0:b0:393:d582:b62a with SMTP id 38308e7fff4ca-3945b492590mr22094941fa.5.1778846408103;
        Fri, 15 May 2026 05:00:08 -0700 (PDT)
Received: from fedora (d-zg2-146.globalnet.hr. [213.149.37.146])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3945cb015f9sm14679631fa.32.2026.05.15.05.00.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 05:00:07 -0700 (PDT)
From: Robert Marko <robert.marko@sartura.hr>
X-Google-Original-From: Robert Marko <robimarko@gmail.com>
To: srini@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	nicolas.ferre@microchip.com,
	claudiu.beznea@tuxon.dev,
	horatiu.vultur@microchip.com,
	daniel.machon@microchip.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH v3 3/3] arm64: dts: microchip: lan969x: add OTP node
Date: Fri, 15 May 2026 13:59:09 +0200
Message-ID: <20260515115954.701155-3-robimarko@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260515115954.701155-1-robimarko@gmail.com>
References: <20260515115954.701155-1-robimarko@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Robert Marko <robert.marko@sartura.hr>

Add the required OTP on LAN969x.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
 arch/arm64/boot/dts/microchip/lan9691.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/microchip/lan9691.dtsi b/arch/arm64/boot/dts/microchip/lan9691.dtsi
index 235e56bebbdb..ed997d87dd09 100644
--- a/arch/arm64/boot/dts/microchip/lan9691.dtsi
+++ b/arch/arm64/boot/dts/microchip/lan9691.dtsi
@@ -100,6 +100,11 @@ usb: usb@300000 {
 			status = "disabled";
 		};
 
+		otp: otp@e0021000 {
+			compatible = "microchip,lan9691-otpc";
+			reg = <0xe0021000 0x1000>;
+		};
+
 		flx0: flexcom@e0040000 {
 			compatible = "microchip,lan9691-flexcom", "atmel,sama5d2-flexcom";
 			reg = <0xe0040000 0x100>;
-- 
2.54.0

