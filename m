Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795660747;
	b=0YSJf9Sm29t2GuUMMQHWzAaVmCGIBNMcfMNkIxpoe6c2dMJY8RZCuAVdOIFfYcVcQ3RR
	 93QZekIkDHPd3xRBSqt0hyvyO39h4TmwyFeU6iaSZBtoYhQrhC+TLbVTKs0Qf5o7DccCy
	 qbSk0/yInOhJ9Tx7bHiiuXMpp203rNS26uCcaW/mbVulvAtndsBgG+cmrYBQSRNxrlmqt
	 eLNthqERweAs9+2fxOby03m7+2KknpOM7wLaCIbg5MCjFa/x+Vl8gLlTdK6StxhXy+tKN
	 G5JtgEJ/CVNwQnrRH038mSnX2bQXjDCWKqp1DFR7e2cBsLSFZjEZPfjwL9CcIaKimQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795660747;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ATe77EWktA64DVb1MltUDHzbzMHCrNXC/lvyw7f7T6U=;
	b=LFqR7N3LS9wJkkAQpNIHyOcfUvXhLrNJVGQGTSeeHyk7maFr1ibt2oTwZUsy9f8nwTdx
	 8+StgsD+XWGzlldWuAw0zRfAJVIl0NBvuRF+fKqP3Ck8Ii6a1uGS5qDa5YJd3siPR50to
	 7ajXipITNpeBHmIZc88V22cxTdycgc+FqR8sydlt9jsry4oxIxZ1FULkTgIQX+X5dazK4
	 ZTqzh70AjvBNAfkVVriBPN9lpCUS8uefdhSrAVSsbDV6Fq/3WBtXNxRSziYnUbHNJRv6g
	 SPerhSk2dAAWnD76EAm3SH06prKnNTlu9gW2Xq/iVJtVHqy755GIUCWpYWrZgZ8WRvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=W1JOVHeu;
	arc=none smtp.remote-ip=209.85.210.180
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AB09606A31E
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 02:39:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3AB09606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=W1JOVHeu
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8b9c51097e2so2629482b3a.1
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 18:39:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795660746; x=1796265546; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ATe77EWktA64DVb1MltUDHzbzMHCrNXC/lvyw7f7T6U=;
        b=W1JOVHeukmRYcX1trf6UgcGeNYhc7xHPYQtngKL+AFMuajaytNKfFQhQnaze8CAAQu
         4+NiXflYygX6POL/pSJQfvqzU/BNbJmrgR5sHy/rKgCTjp2NnJMvoEesssumA8jjqSjn
         PYWtnkEI5UWsOSiM+UpEDNI1P3rZ6JcxtVE3LxYo2Be4ZJm09+TjGP9J/8y/CRD5BPDA
         xArkrvR3zqgH89fKOeuaXUZ4EcyOhMoWMq50JQoUAYAYn2AbyuUocF2ByyOgE8laMu0r
         dXwBpBdB2TyTZWsnH5RE7MpXdUf8IaWVD4vrI2M5oitWAYk+p2ZHDw+kzZgPOkwVwR7e
         aSvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795660746; x=1796265546;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ATe77EWktA64DVb1MltUDHzbzMHCrNXC/lvyw7f7T6U=;
        b=pusHVNqym5HqIHYFrTGSv3Hb2G7YYzi26jBBukHajU6Rzav0lFjvHWpFCIgfX77zSN
         Pqfhp0Whi5D+8aeuO+B+mMF61B1/4APW5SutcY2Rb6Iy3CxAlgLbQdXs3g3ye4oyaaKh
         hb0icnf2/732ABRZA0PFqvKaWLTI9CEECdrW+p3lJTlAMYHbfLw+m1huEOaHkw93n8j5
         3EKcI3RC0JSAIr3/o/f0B5FhiiWrMErILR76+ONSCi2x+H0tk9wz8uTbB1ObNczyNL9s
         EI8cW1thrlGoGJZ6TfIbCOWSf5pRK6h24pzv5kmqWCBfoulqXDTkxjSZKuozCAgafDZv
         sKZA==
X-Gm-Message-State: APuU4Z/COplfVmYOb1VWMbbvvw44QdgiTXOqk3HH5zV+lS6ztuoTcEqi
	B8sHwdPYOW/knFLSyLLXOS2YULRc54hkAj3RIqUZh1M85YqfXZ4uMgFxDwS9ug==
X-Gm-Gg: AZFdTZfWDgMRFIQo3bhiX2N5ypJOizek303kE3Y3wW2DyJgrrAUBfIXnYxzm+C2f3m/
	O3tmrEPpMAyh754Z48A2X/8y36rXLcmhw1Qb211PBIKTHcv7tDC2LQ20M3N6Uy/CtC9fFEU1lst
	6IyuXzuMxeigbUYDbcfpkFlLUViVdSjLCiwKwMpGRc5TDTR9OFU+LWZgQe9db/oeSyGO2OYp6tM
	OVn3pwNfCrsR4ZNkW2ZQZVH+Kwx1bsQvVSvcBC+unv99I/KCV1G+fPmIjjZEvmGjiyZQx2pvOHT
	fp/uYpSoifk4QIqX1yy3Zgdx1LB9P3RqPvPTQIYAzE9WOv5ySiBRV3M57De8WQq9gNpu4DQCW9b
	fb9xAU/HyNnyVEY3OhEOr7IslPQlaoi0kg8RR63vdMLKzhDOOsG6J//h68erG1GwrIkz5ZzQg8d
	Ziiur4zqNPKll7f/VIYiqeaa2ZF8onX3v+D9BYrQnB20BfNIJ6ki2bDYgQ1gc5SNZGZ+BJaM897
	w16lbK5dJkhvh6gf5SrLwSRMQGL40vViimAjm8anM8wLRsfaln8oDF1Uizu7dz13A1WVuH4i05r
	HLo9dSP1uZ4E7TeaS6alQZOiw0+MUepKIqIcWbEBegJrJHFqudoq41kUhG4CQ7yeuqJVdTPeheZ
	ZEmeSdDGgaQOrUN5NGDeux2ObypaGqY+rGfTGMQCDne4lgOmjG80CxERwq+OhbTMayD/hAE5i1u
	OJOhrrNYR3mwxhG+hxylbdndE=
X-Received: by 2002:a05:6a21:6116:b0:3e2:1418:aae8 with SMTP id adf61e73a8af0-4014dd566d2mr20975073637.72.1795660746393;
        Wed, 25 Nov 2026 18:39:06 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6d026d6fsm9909018a12.19.2026.11.25.18.39.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 18:39:05 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: devicetree@vger.kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dennis Gilmore <dennis@ausil.us>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Marvell Kirkwood and Armada 370, 375, 38x,...)
Subject: [PATCH 5/7] ARM: dts: helios4: use disable-wp for the microSD slot
Date: Wed, 25 Nov 2026 18:38:54 -0800
Message-ID: <20261126023856.767961-6-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261126023856.767961-1-rosenp@gmail.com>
References: <20261126023856.767961-1-rosenp@gmail.com>
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

The microSD socket (U3) has no write-protect switch, and no pin is
muxed to the SDHCI WP input: the sd0 group only carries CLK, CMD and
DAT0-3. wp-inverted merely flips the reading of that unconnected input
so the card ends up writable.

Say what the hardware is instead: there is no write-protect line.
disable-wp makes the MMC core skip the WP check altogether, with the
same result for the user.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 arch/arm/boot/dts/marvell/armada-388-helios4.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/marvell/armada-388-helios4.dts b/arch/arm/boot/dts/marvell/armada-388-helios4.dts
index f8ac74d7935e..d4ed47ae73c5 100644
--- a/arch/arm/boot/dts/marvell/armada-388-helios4.dts
+++ b/arch/arm/boot/dts/marvell/armada-388-helios4.dts
@@ -256,7 +256,7 @@ sdhci@d8000 {
 				pinctrl-names = "default";
 				status = "okay";
 				vmmc-supply = <&reg_3p3v>;
-				wp-inverted;
+				disable-wp;
 			};
 
 			usb3@f0000 {
-- 
2.56.1

