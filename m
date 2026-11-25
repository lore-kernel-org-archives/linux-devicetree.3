Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795632501;
	b=XEyWQuK+fH4+QQRoW5ZCysfGxYUswd/e/rXzF1vfioeLTv4cQXVO+0D7Vef5kO3FmUAH
	 XlvFOZlj9nhgx2x3W1a7UY7rlP3KH7Gr1QLJcOfGe6AEx64/txUtydB3RSM4gFLG3WhHx
	 xQzCMfl5O7xRD93twZHML9XEDtUeNtM3KRsWQ4lux3dHLO+/RdDq3p4AvF7NMnOMC+It/
	 nPWTNHg7oKJYmfIf/PxgW43XB3iC37qXPyLbS5EvHZpmYlfD93venlP8EXSg+eGKzPmER
	 o95f/xPgtPO9XfL6ro2dD6UV2ZHUvcJ8oY0JFF3/GPmHYZyzdyr8+U4QTVz+CTMFqkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795632501;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=HLK3d7iXciTA3gYlWpBInCkheLbOB6EwrTlus+ykLsk=;
	b=qUuAyFfj7iCQ1oUZSPSTk6SZsWmr0DhhKUVfM8dlCiDF3LFPSxOsrPFx9/PRVxkQxTKL
	 c8omvNdf0D3D+CKcuh25vbowLL8qOOz3et7p7XmEt/yckEDVKzJd720aeTDSMgxXYjRUx
	 zMKz1TidE+zL8QgQEmrK96PAoSQWzazUypmtjgeoxvwiNuGlDXDQKqKQ9qCSLYCr6mF18
	 TKJ8+sT7+NN1yNzBvBCwmJTg8VTiaAawnSu720PJertAdABihrGNaTGhG+j5ih6sXyUtf
	 MvJTgwigc0wf8rjoMA1xHWgzd3ZNLnDlen6KpqoFHljDJTLKyPzTIrr0hUJeRW08aSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Jxwh8KOh;
	arc=none smtp.remote-ip=209.85.208.53
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86BF6606A680
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 18:48:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86BF6606A680
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Jxwh8KOh
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6b87a1a2babso12805869a12.0
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 10:48:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795632500; x=1796237300; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HLK3d7iXciTA3gYlWpBInCkheLbOB6EwrTlus+ykLsk=;
        b=Jxwh8KOhQ3Dae/jpvU9vqBu1U4h7oCjt+9cRvOeg/9BA1/3ExI9swTZ/M0sYHqBBDj
         c2i4gWGAZ5RkbYoOU06qw3aQ7kan1huizoyKOfyhlPhyRswyCamHMI0WY7oTqtsoRsKe
         whb1zatqu7xCt7ksj4q4PPV5rutttpu5mlCJp2yyfSug3Ow5NWLyvQsshoMYAUqQK6ck
         OCby9sx0XRkeMEaZnUmqFeXuUl8e8QJ+tTASqBkSwbS4mCsoVUSJRDNEaMbh7STS2xwB
         Kebhf+L3FNSfhw4nebvnDhJmkqBLv+brIqP09suqGkbqM3oTjFyEpDzocjE13qUa1mKQ
         hJTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795632500; x=1796237300;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HLK3d7iXciTA3gYlWpBInCkheLbOB6EwrTlus+ykLsk=;
        b=0Wi5opLx77dPW7JBQwXQO+8CgdWFWVvvGwSjFmxr2z3Vd/9Z+dqnJXgot8qBhv6ei2
         WR5DCJDfZrwuUByyiBk+ga1ZMt6eqWKaZCrnRtGpmnpiRz5dFABwVd2wUWO5cOlu6zr+
         VZL+ipotCo/+t59+nGtm3PrHJz3onzKSynbp4qN1TkqcixgKPQAikqMUG7BAIOET/QI8
         W5fCNLuo6F6xUAZeUt4sX+yKA020QLeNA4hI1qUHhkbFtocM2zdVvi2rZ/aJQ/n53st/
         fYtQPbAF2Ms40oPZFJvC8w6APVReHOdOdAgHfUA9PWAHN39yUaINtpK5fEJFSuKsKcRH
         bgWA==
X-Forwarded-Encrypted: i=1; AL+hErGP4RV7lZ3NyHjrbsY25DR0o5Uf+iCjZv3nAdGt07EuyfnOb6XlhMvGTZXzOYlTW7G70NWZITM2gc5t@vger.kernel.org
X-Gm-Message-State: APuU4Z8bO8H/yJHIlizSceV+228zKsywLL0Mbdh89NsuqXj7ZH7SMHLW
	+kCwMvOdghPuQiWlPezXIh369M14lcD4iRF9mxy0NRfaeq/mj/qGhUSx
X-Gm-Gg: AZFdTZeSb+gjw/SlqsLgeUiiNbcoYvpXB1e1QGtcdQjNw5pi5s0QKYtSUZQaMnmwpga
	5yUjVuy1+qE4k8NhwK+2odDt1j810lEfMmc0EadJCE6SjfkIH0VDImejj6ZShLvy18EAe26GpmW
	/qsnbeczlUeVQ/i+3YM2GiypNV1qLQ6y4vKfsYKBEX7FkWclFWaNyR9VuKTGNoWDACMy15QXJwW
	T42Wcvvrs5QvDrOE0BbDUSKlZ5J1ph82GFAdHIY74j9ZSCQlKjUyF4M01Hry1/ISAdHZoU5Wyp4
	Na1z5O0nfc57eaOyxM2YRLxtoqGdexID9/KfUkowfrINYUSFlL5/lM0ZtmPONHsjhfFIEnTq9IM
	2c9UrztyzAQY/Mqlpt9V8xcYKWFIa6D3bFRlvFNfzuRxtdJKOTGCayiuEONHHU4J/5lOvNGjSkU
	IdLWKcWSXQDhyUmxM741y4jdpnG+aLXLPV2v5p95OitY+28/dGKdBWQeMCeG09go8CqgBmkzwRy
	wYOZ5VwDFPKm7msbKQGvfyt1tqhBQmjSDgsYj8SUnCJtOxIUkWmhdjJwUwP7qOJ+wo8rH0un69w
	/h3nHu+VlwM+NOEPbnwcLz5e5Gj67VCYxuvIrunGD578OavPOzzzzuWeqfw=
X-Received: by 2002:a17:907:6d0b:b0:c41:1781:a2af with SMTP id a640c23a62f3a-c51317e3353mr1702989166b.9.1795632499856;
        Wed, 25 Nov 2026 10:48:19 -0800 (PST)
Received: from antoniarch (84-40-239-22.cgnat.inetia.pl. [84.40.239.22])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afc73d3sm677226666b.64.2026.11.25.10.48.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 10:48:19 -0800 (PST)
From: Antoni Pokusinski <apokusinski01@gmail.com>
To: vigneshr@ti.com,
	andi.shyti@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	aaro.koskinen@iki.fi,
	andreas@kemnade.info,
	khilman@baylibre.com,
	rogerq@kernel.org,
	tony@atomide.com,
	jmkrzyszt@gmail.com,
	sumit.semwal@linaro.org,
	christian.koenig@amd.com,
	phasta@kernel.org
Cc: linux-omap@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	Antoni Pokusinski <apokusinski01@gmail.com>
Subject: [PATCH v4 2/3] ARM: dts: am33xx-l4: Add missing DMAs for I2C controllers
Date: Wed, 25 Nov 2026 19:47:47 +0100
Message-ID: <20261125184750.57866-3-apokusinski01@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125184750.57866-1-apokusinski01@gmail.com>
References: <20261125184750.57866-1-apokusinski01@gmail.com>
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

The i2c0 and i2c1 controllers on AM33xx support TX and RX DMA
requests. Add the EDMA request mappings and DMA names for
both controllers.

Signed-off-by: Antoni Pokusinski <apokusinski01@gmail.com>
---
 arch/arm/boot/dts/ti/omap/am33xx-l4.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/ti/omap/am33xx-l4.dtsi b/arch/arm/boot/dts/ti/omap/am33xx-l4.dtsi
index 57a45609f9f5..89fb1d1eb049 100644
--- a/arch/arm/boot/dts/ti/omap/am33xx-l4.dtsi
+++ b/arch/arm/boot/dts/ti/omap/am33xx-l4.dtsi
@@ -239,6 +239,8 @@ i2c0: i2c@0 {
 				reg = <0x0 0x1000>;
 				interrupts = <70>;
 				status = "disabled";
+				dmas = <&edma 58 0>, <&edma 59 0>;
+				dma-names = "tx", "rx";
 			};
 		};
 
@@ -1189,6 +1191,8 @@ i2c1: i2c@0 {
 				reg = <0x0 0x1000>;
 				interrupts = <71>;
 				status = "disabled";
+				dmas = <&edma 60 0>, <&edma 61 0>;
+				dma-names = "tx", "rx";
 			};
 		};
 
-- 
2.56.1

