Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795201207;
	b=EnmygxEvh2jN2/Zm/8/sm5dO7GrQn6BwVVBafD4fS2vBl9edlZZnhvse60YDrliECSd3
	 7tsTqpNoPdiESEBUg+Ts0pRc3qJouwU2cU5iQrkY4o8GHpcnT+Vv/bn2uGPRiwLxV7oEE
	 ZIC0t0Zb5v7m8KaAYr72rOmKRAzDIGNk0J68wUZXNJ4MEfW03Z4Ny2R54x1baONmLNZFR
	 GpQw0z+NbYn6PnWA3dJ1t3KcNSnioRGx9R7pzhMcsAF//9MbYSvi0l0DVlxsF4+bc3fAv
	 +jeNgpLgNHzWejm//D9SIIquA0dHYEIU2HvTWZ6Xs5Azjhu1XgfrscLDrovEe6Y9CdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795201207;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=HLK3d7iXciTA3gYlWpBInCkheLbOB6EwrTlus+ykLsk=;
	b=nMjNIcQKxN3Ec4BGOQRBbcG17kQmDl4Zfn04OtDTqp/TvKq/bu+JPrr2tgDu+hF2g1Xv
	 6iQY9eXqHzHxuNLg+jhHo9aj7KSDW1bp9JDRLF1Se9l8wONCrgLUs5XJErb/WCn1muVHQ
	 aExvS9eJFS0VfyTmM7cp70+W4PSRWM0v9o1ohuvV5R8onw7Cy8vluqxfME4kWzsuz3vkM
	 lu3hNRjw4UHuI5QOi+24cIjeJbWhd5LXHMLIu1h9fj+ygXCEgNMJmVVYVTuksAUwFj/HX
	 bEq0Z+76NjCRLmiYlHWxY9rIRcMIxVpHcDZLRHwQaZipRcQruz6GJbWg3QfqCt8Dcqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="IzVVT4y/";
	arc=none smtp.remote-ip=209.85.218.54
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F143460A380C
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 18:59:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F143460A380C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IzVVT4y/
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c505186727fso219962666b.3
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 10:59:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795201189; x=1795805989; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HLK3d7iXciTA3gYlWpBInCkheLbOB6EwrTlus+ykLsk=;
        b=IzVVT4y/3rbXHh6TAeSjFM3cC/AXHTbk+EhYy6zelufBVD4aPc/hWkjoxi1Rmb0jVk
         s8JQtdeHZNZNToyzuRKfrDqtxBtvkSgIcKgvDajPuk9h3TBzAJFbNAbDi2xvVdbfPNjt
         vlhP387H/b2+Jl7MMMbGvXvpSU6EK1dgwwo6qLb32LTYeFMGZkmpvM/PneQqIL8ZLlOu
         w38ix/s2fEZxKMfzh11UOfkdk2e63A3zZV5mnnWLwOmMLdh1YoetQvFl9H8lPkUpKtlq
         ZQUFx3enbC0FIlisEq+y4S8VXTVhJvqt1f86dPpdDm+/xHoNrFTkiN9cJgXlbapmrHdz
         xY2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795201189; x=1795805989;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HLK3d7iXciTA3gYlWpBInCkheLbOB6EwrTlus+ykLsk=;
        b=Uu+MTazUDkdVWvERj6mwASyVw47r/2nKRURsTGpBgE4W/+14CDULt6DnTMBAFrXF+J
         pxocyspY7wF6sWvP+kYBdd3+LygVvRyJa7pVkswjIQV7o3EJoNnO4YBvmByLwDIoH5FY
         +YSyMR3aEEeR2fQOl+hKPveGWN7JMsgtyC4uzugtvcrBieIwuBIyfo6yPVHMbkuHmlrE
         Mfzm+uJX01s7aPpyDGe785lZnA4N2OBiOhXJdzFp3YDOSnjoalP27fG/Vaeu2rNZfv28
         vZkZLcuts9+tK6cIpmG5/xmmEAgigxPpL91V7GRyCF0w7YyyJjs7W4x3ky8eiyKTEjgT
         W3RA==
X-Forwarded-Encrypted: i=1; AL+hErHizbvOFEcH9fXLP1PJh3K8lnH+5G50a6XKd9vC+6p3Yn0Gf3esB8R4rvciFLINLQnax1hvxKNO8VDe@vger.kernel.org
X-Gm-Message-State: APuU4Z+Xb38QlNXWq74/CukCb5cyLxH6527PKGHric0cWZh/XPokDR2x
	HzVeRqc8649yv/wCk/Biu0cDVUeFybo4K+KW4Fq21ce6ptWaiMY/+CAj
X-Gm-Gg: AZFdTZfEXoJsIvWJKDOdOvO5/2XfZDs5ElPXrZfDalg50kTWmCvgj1y2eIBqkQNb4DF
	T+Wc8+svu67kVjrQCOASBeHPuHk5cEAQpy4ObGcFCi6RD+47wFzGZKQgBl/qsSrCmwVPHUx2YOf
	/bGRNStaZFps7Ewl19r+yU0nFdgM9uzI1RtqYIEyaPMBD23ZYcic5U6u9s9ULZoiHpTTim8MIEp
	9qxS6e8T7Xz0V42IDw6SS561tO+vPbydepEGoq5HxFkHCilN/NDk89SdzJRqWMWPxs5LDfFT55v
	LCo6/YEtDe42Z8OC0+JXxRTwG9jXXHrXyEvyvw6CCSlO4ZybSGL/AtiFF2kTsJ8V866vH47yYVc
	kCvvc+/WAYXuADPuXgfOb26Wsuh7JgCjuQPB8rIPwM1JADG4/+n1MignAbA0qi9DZR607ShMPTA
	nuuZhHuQiR0LmzkPqylOqBJzpqsyfHAyMmBvTiHwiv2hwzQ7kpDvlsR5iPlQalFKKZBT0QhVh/F
	EyVX64nxLn0J9YnzVaukzRrfM8pXq2kzZXz6B7Bd+iM9lsgWENQx3/ViVw3k2KXg44ye40j3PbT
	BB41rbWoAdl7uo4/GP68wZFc1dwf59PHZXZvluWXrMVRcVXylEE492ti7wS39q9XJ1iWL38kYse
	ll/gWQo8=
X-Received: by 2002:a17:906:f583:b0:c51:3c8f:55e8 with SMTP id a640c23a62f3a-c513c8f658dmr365847966b.46.1795201189284;
        Fri, 20 Nov 2026 10:59:49 -0800 (PST)
Received: from antoniarch (84-40-238-230.cgnat.inetia.pl. [84.40.238.230])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513b02de1dsm125205266b.85.2026.11.20.10.59.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 10:59:48 -0800 (PST)
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
Subject: [PATCH v3 2/3] ARM: dts: am33xx-l4: Add missing DMAs for I2C controllers
Date: Fri, 20 Nov 2026 19:59:12 +0100
Message-ID: <20261120185915.150228-3-apokusinski01@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261120185915.150228-1-apokusinski01@gmail.com>
References: <20261120185915.150228-1-apokusinski01@gmail.com>
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

