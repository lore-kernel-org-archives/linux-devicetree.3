Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EEAC394499
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 06:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790319265; cv=none; b=l+ZPmXfWcEFs5nL+mnHpneS9W6hvJ1djl0zNTOVGgiuoPGWxTldb9xNxCXdTyF+f/l2BcaU14WDhlMd8snhBZjmrlrJm9Qw9TUbJlbc5Uq4uzmB0lWyHYIudZBbYTPkXG+e6+23O7/AolVF2sH8rBz6F+fnMvHeq0g64RHjVe0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790319265; c=relaxed/simple;
	bh=6m3l0ZisEGyMDAfHjdJBC9AzASQpNoTWX7mc19FC7PI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=n3WkFgJ4v4QKEIhHqoj7L8UKdbAZBIB5/PJ045KssWPq3HpLjH5LooJJARu/APaeGtpXr3xbWcZy32A31Dti9TeaJHEFsOlGbuek9dIJPWs5KRAcQTOutfdnvNIhobj5erPg8UPRjxovnNvBvQ3HFxNJjRxTVLL9f7S/EYOdMVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qP1m987c; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qP1m987c"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e71cdb22bso3712705e9.2
        for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 23:54:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790319262; x=1790924062; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lIi+33qeuEkwNBz/fk+oqvqVziUPzN6OFpjduAUkZHw=;
        b=qP1m987cYOgvyCvTnYGefnQPnwT0zBkvfvzzyO4F9wRk6nCRw+0y8VoyYsW3nd7+oC
         sJRqv5mL8j9GraqZxlU2LtsFWZrLQobCShYl2o2gKanxKBssiNNoZneTWXYsQSa/F667
         o3R2wuOIg5HNBLZvS8nT1LXIjBpSTKUc7Na1jfnXvhiHiQmqLcBglKGkERF97aH/Qj8i
         5qE2F42QLOM5ybALYbVmrMGJQreLRfJG2FTU7sE0lzzmd/UrXY1MSB9FhiZwiKBb5Nh2
         IKCchohOr8vo1gvA/kdf0ofTbmI1Fk7cqCN+KoZMG7DFNXMY6Q14QOKxUUqOIRNWIg7J
         U3sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790319262; x=1790924062;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lIi+33qeuEkwNBz/fk+oqvqVziUPzN6OFpjduAUkZHw=;
        b=M08yA4Cmc8g5u+GNcE9y5ekVGx3xg/rfNJN23Z4D/xAu2khDD9C/0bpBH9+cype/Bz
         ItG/A7KQ0XUOkT6a730ixhGe1AHdloWDrTCM4Bh6fcSMhiTmd+AGfNSfjjxdTUxCOnXU
         ENeqhDnKQ6Xp7iquWgFARUXqjOvge8VAaq4oGnz1NmIRobU+y/teNreVmJkgVzUz2K+d
         SSUJxGw5+STlKGBKBT7VyLbo5hSaFqVyL/GyzFxFj6Y7iSulwd118fPQw6rGH/Ff202X
         S0uymYjQ/LndpZB1ce/gOB30ilTyN+aYOj+uZAlYUDNSX3Y4lb4l0rxnKDa6/HtrSC2y
         73yA==
X-Forwarded-Encrypted: i=1; AKwUvBxLp2daGEp5vMOH1DsthaE9s1w4+KjXDZZ4dzh+3IdukpgQ511K46Pa2TSr7vHQA3De8e7sYTqRZmJP@vger.kernel.org
X-Gm-Message-State: AFuF++nynXzOD7Potogjb4i/pitVGiJHCOukB7+gkxgr50QavJcVzdCe
	46+zx167Dbd6AgKzaMuDWilgcSOG28PqNOBrtCWmhi9J87LImAPkAnH7
X-Gm-Gg: AYBFou1HSPZuFiyArjEd4N/DdDreCiwTKwYVOOlHKkSfD9x+ICXesbIZI0AIgwCaPHH
	bEYn30rsATQ+UJYp/IG5hJ3+jMWyXtGP+QTc+6Tk5IfYOnWXhp69+tksBZml7YrHyK2TJBMRC+B
	00HrwnipYhdJJvXwp/cVMIcXimOXVUaxTP3Awwzq34/2/O8tj6wiEm7YUBh3geb5h5XYlSrU/Tp
	MnuK5OmaB913cs16yrWsDvcH6w2Mpqt46SBwEyAELvHa4KZnBPYKuUR182XnUvH9EvCRfMyaz1m
	i1uxkPJHRySfR9BwW1DdcuyrdqfF7abDgKNH+hg4SOIDZ4Gx+mOZcoIEaVHvTDQuoFlq1+P5yA5
	RzKXXwGQJMHnoDgyvPnqu/HgEgtpeEPbPzgjkzroMmZ5GltMaz3sXLITcXGM0NBAzfbfyu96GJ/
	hjLJISAZNG3MeW/9SDEXnDIIl8edIt4RgruVk8wOaayy6bVva7hAmtmmSFjJPh5Fkk8+q6dO87m
	6SIaEFqrBSAwee7+U2IOPTLtK03TPXgCWqI/u4jfsdTvMWJB3TTMGDHFhJRg8NEIx1vJpabBhCf
	BrEvqkw5VV4uC/LgBPTMMJjYCOCVGcazC16Br9boEjOre0KZpGs1Eun9s0NnEL6Ub+Uka/66uB0
	J4+7Wrc4CcvQHSxP/IvA=
X-Received: by 2002:a05:600c:8b4c:b0:49c:fa20:cbfc with SMTP id 5b1f17b1804b1-49fe66eb0f0mr80244325e9.19.1790319262338;
        Thu, 24 Sep 2026 23:54:22 -0700 (PDT)
Received: from cypher.home.roving-it.com.com (78.45.167.195.static.otenet.gr. [195.167.45.78])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49ff43ad975sm14424155e9.13.2026.09.24.23.54.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 23:54:21 -0700 (PDT)
From: Peter Robinson <pbrobinson@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Cc: Peter Robinson <pbrobinson@gmail.com>
Subject: [PATCH] arm: dts: bcm2711: Add emc2301 to the CM4 IO board
Date: Fri, 25 Sep 2026 07:54:10 +0100
Message-ID: <20260925065418.2248731-1-pbrobinson@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The CM4 IO carrier board has a emc2301 fan controller. Add
it so it can be used on the CM4 board.

Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
---
 arch/arm/boot/dts/broadcom/bcm2711-rpi-cm4-io.dts | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm2711-rpi-cm4-io.dts b/arch/arm/boot/dts/broadcom/bcm2711-rpi-cm4-io.dts
index 8e45de01d2ad1..4f81fbdb85b56 100644
--- a/arch/arm/boot/dts/broadcom/bcm2711-rpi-cm4-io.dts
+++ b/arch/arm/boot/dts/broadcom/bcm2711-rpi-cm4-io.dts
@@ -107,6 +107,20 @@ &genet {
 };
 
 &i2c0_1 {
+	emc2301: fan-controller@2f {
+		compatible = "microchip,emc2301", "microchip,emc2305";
+		reg = <0x2f>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		#pwm-cells = <3>;
+
+		fan@0 {
+			reg = <0x0>;
+			pwms = <&emc2301 26000 0 1>;
+			#cooling-cells = <2>;
+		};
+	};
+
 	pcf85063: rtc@51 {
 		/* Attention: An alarm resets the machine */
 		compatible = "nxp,pcf85063a";
-- 
2.55.0

