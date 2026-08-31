Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F87725B08A
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 23:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788219417; cv=none; b=bHKkHCQI1Goz9xillJyT35W44f7X61xlHKMC8jtNZBmfD89F+Kp+vRI7ERa3u/AZuRghwe/Iunaqg1MU1n9UylezxnO9SiaUm2aIOg1wYwcY9mpvJ2NFcwUeQ2fyFtLeG7rvmUuMWEK8klTto1rDlT38FacTwaSscu979kji+HI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788219417; c=relaxed/simple;
	bh=jZKfWah1QV3QBd6lo8YFimNx0a/nzRWJ1Gz6msiBdiY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qK4p1sD1KEGNFjKPa99ypkWR2bZzFUt1/W2qM4t+209F+wP8CQxDuMBaF0iqqju4irVYZnB9E1583fghMo69nU32EVFoCxwAM83HXjzk1ekx+lQed1JH0OyIoaspCsQVHqurAaAKgnhm1AniCzAFF75N/JKK64W6RnEmqWcW4T8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K0EFwVDN; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K0EFwVDN"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-84864086bfeso4391780b3a.1
        for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 16:36:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788219415; x=1788824215; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cRgJyzZMBo3Mlk+3YKkY9AJwPGn5QwuLyWn+ecHzZ5M=;
        b=K0EFwVDNKxherp1RvKc/x1igVz3hB+7hWiJglOnbJHMzuNr74TA2eu2ChhXF7U2oAr
         rER/U3ezgJB79SHHLbusQjbNtyCs5jglGhVBLPqvA51NzgBCL26kwzy5ajXtdlduz9GG
         cGZkqDkQrxkygP+zN37v0O+VZ5pr/LhRUZhZ9Ug2vb9/LdoqYMRxrMSZKCitEdAef5UJ
         Vjgj5YiOLSN+qa3ImX9//2GxoQ2ETw2Er17wrlIck78u55fmuKmKP2VmFGzSzdH43UPj
         ASpVvqtLa+nZI4D899mRaDD3oJPK1FU8JLPn6vjZpRau5x2RVTUrP6hBWVDIjOTIxrsB
         w1BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788219415; x=1788824215;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cRgJyzZMBo3Mlk+3YKkY9AJwPGn5QwuLyWn+ecHzZ5M=;
        b=CxHA7iesP30sYqtVrKOMrwQ9ugn6yek/x+xBER0Y7DjLxiZWMtjmTq7HUZDvbsD1Pb
         W18PDo6q6RX6qiY82qp9l0rU7iXioHAuN43EguuKdU7FOC3OLvbNmV0t2IbVikw316BK
         R3aFTZGo6ekJLqmjebIJL35A0gc232GnhZkn4XDvh3lZ/ZEgoEkLMaZWFDhLnR52rkkT
         MllQ4Somyh3HXcknBmwkBovYUm1h7qWtIHt07a1UvC0jfGt/3cVJSB4IpRCGon6+BM7c
         C3JDNat7tJautbRxsfXIypojDnipB/Uh8bu9dAvRcT/gGJouB/aEeZtyRHn0XYiKx+m8
         1K4g==
X-Gm-Message-State: AFuF++lamtk8T3rmMFBiPmDgEDqXbqGZSJrBSKjNyY8am/WP2enJfpZ5
	5+GzzEwbanvHdk6yfNKHiMyg6zA8RuzsnCrL2LAx7SyG1MNt4eIDljA7Ogc7rQ==
X-Gm-Gg: AR+sD108rJjYMbA0ApxcH8QFXTEkGL6Qw3mLrOWJZCnsXH1HIJsvmbwnL3zovAk6QTC
	ESIcLpiMu8ixA8oS0kMzoGMgvECP8wwLfysG63nb+gf4vKblL15vCKDibLk53/qHUWK60dkeB+n
	xyjdEOyK/6j4Qo87XhEwnUxiJpD95nHhXNA5/13GNBkiq5nUFJzakolvdalFGdroVX02khORdyG
	pRm1KihRuLUvuWV4I6uEoLkiafdNFrODwWY5XRTTvQN4KKpBqIGbIHLOyr01V2W1pvqlTrw6yuI
	bBTSbx5380WHGB1Q0R3Y5nEyX7hQqQoH+IhVQLlAXTMnTtqE1DiXWoc8d8Xo4kDIw1x0AFNSKC7
	yNy+r5Q51RFWLiBI/qM+bhl8GHw9GQ6bIQSI4CvlvBzgF0Te2b57B5/ZuLZNAxsTIXxVWheFES5
	H2SmtEWglXmcfbT94WlAqTlYRWK2B8lfttfFt3UEJnVVbsW4KGQ6SC3e7+bj3qs0E8l8BLPGk3E
	s6F9DCFRIfrRtqh6r//+s7o2FlVySvDskDSiy0fW05Vk4ev0eS1g9ukuSeK9ektUkeiJQw3Uiij
	aVtyQCqG7EgEA7o0uk1qfYcZYF6F2DsSq4z/QcY=
X-Received: by 2002:a05:6a00:8007:b0:848:3f07:c5a2 with SMTP id d2e1a72fcca58-85b59689884mr6282519b3a.4.1788219415445;
        Mon, 31 Aug 2026 16:36:55 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-85be8e5e634sm152963b3a.37.2026.08.31.16.36.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 16:36:54 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: devicetree@vger.kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Marvell Kirkwood and Armada 370, 375, 38x,...),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] ARM: dts: helios4: drop unused phy0 pin group
Date: Mon, 31 Aug 2026 16:36:53 -0700
Message-ID: <20260831233653.14232-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The microsom_phy0_int_pins group muxes mpp18 to gpio, but nothing
references it: no PHY interrupt, GPIO user or consumer pins it in,
and the sibling ClearFog board does not define it either. It has
been dead config since the board file was first added, so drop it.

Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 arch/arm/boot/dts/marvell/armada-388-helios4.dts | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/arm/boot/dts/marvell/armada-388-helios4.dts b/arch/arm/boot/dts/marvell/armada-388-helios4.dts
index ae03d42f92a0..e63b8b5e632d 100644
--- a/arch/arm/boot/dts/marvell/armada-388-helios4.dts
+++ b/arch/arm/boot/dts/marvell/armada-388-helios4.dts
@@ -284,10 +284,6 @@ pca0_pins: pca0-pins {
 					marvell,pins = "mpp23";
 					marvell,function = "gpio";
 				};
-				microsom_phy0_int_pins: microsom-phy0-int-pins {
-					marvell,pins = "mpp18";
-					marvell,function = "gpio";
-				};
 				helios_i2c1_pins: i2c1-pins {
 					marvell,pins = "mpp26", "mpp27";
 					marvell,function = "i2c1";
-- 
2.55.0

