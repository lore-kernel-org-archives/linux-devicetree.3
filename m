Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36CB770836
	for <devicetree@vger.kernel.org>; Sat,  5 Sep 2026 00:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788566661; cv=none; b=iEVutEOdqSXjNEMt4egVW8s5Vu4ycpYUOf5KKxH3qeg65B6qBz355Q7En5Uwo6NjXM8qjIItUskITK+FxxNpcAaRQp9Xmt8eNrelw2362/oTbNL0lOdKVh3O+FffAeUq3zFbEzqivpi5Bz39K88iqLxIJNfXD7/9l+cgp29MnfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788566661; c=relaxed/simple;
	bh=u7Y9DpTbLT1QXKT9NULVSoWd53oeRToOrHQD5cTZpJM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gYDFn0GQAKq6+FN6Wohv5OQ1L6FNmsv4YfsGBF1+Y2k/fpdFWCn1o92VHGW03UdfzMfQW+AUxLyFmfX/f4xVPYhceRqOM7bulzhxB36bP2d0sZRoN7Nd6+oQr5Jz6hp/jSElcYoPtKP3faXUXQqZa2/HSug6uTZnPQWzCEuxiXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ECyfDux/; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ECyfDux/"
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-91041ee9230so14868606d6.2
        for <devicetree@vger.kernel.org>; Fri, 04 Sep 2026 17:04:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788566659; x=1789171459; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4RGLSHOixg+9K49QmcrmGAtJTwJQ8BvkUSf74DteswI=;
        b=ECyfDux/n94dsHc4HxbF3epIOta+pgOKK582+9f+KMxRBCoEv0TrjK02W1zueYeahs
         srlPzoY09qztLkG1sy9zk1ByoHV3jzv4yWdPX19gYwMeqSsFIkfn1S48V+c0SjlfS3Gb
         6t6alLdiCNx/1QE7U++K6zb92vKjigWm1LH0we2M7c0Y2o0MK6cdMf/VdVRTww6arsce
         PhEJex8KQ/+8sovYyRjADPjkuaMBgq8aGMRiKHHQK98fnbIBKpQjfioztMKkZS603iH2
         G5IQqiAYQvYT2U9SQghMH+KZ2L/1EDGMAi8N8RnLR2QXpYJcf0NQiBL4Brd2ou8mtlk/
         IFDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788566659; x=1789171459;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4RGLSHOixg+9K49QmcrmGAtJTwJQ8BvkUSf74DteswI=;
        b=p/RJl52RPefaVtGI93TN1b7eBfNyEq4/poxn/puoJT2lQqVYR9TXDeYtxVIXoWZm4f
         CbjLfsf6kqr2jO/m3x2knXcsX13TaRFq27UnO0+Te2UFISasweJgKASUbb6UqLLvyYXN
         tEV/9Y4RjVX4NaIrGEDLm1pWcOTsY/XRp5dayfnYUXo30u8wRv5RLmer0LrB+uO/8Aov
         90lX6c5kJUNm3Vw+A3o7PrUH1quTDBS99XeAlL0dq4rNVTA0zSeHyZHHg5qD4VTRFS6H
         2FhpcQ3t5aIKy6u4ObdVwpG3bNE+frjtNwNgqF1/df6sC87/x3ScYwLFQDSsTW645IBb
         zCWg==
X-Gm-Message-State: AFuF++nD/e4YUHEeG/1maDop0q5xU2CWbzaIz96kU6bMOj/UT5O0NQph
	vxXuHIMCIi7e3AmXEvi676BNj3CY1q+2OYSyRVj+oZLbT4Eq+15uJJXDHXZcxA==
X-Gm-Gg: AYBFou0PBR777M5Q4adakOMSDP4UPsJu5WIdnyF+/KrJTNByFT6aQEGiJZpa1r8+ZfJ
	FrcyY9z+DbhuIT2fDFIhKMNyJeztrGz7IiRQRKaxSqvhsyzFaNH4wOPbjlaAK7lNjfEUy51JC9P
	PQRqCBylQplh66pXdFnJO4g5QIYYpvv37tv1+wyXef/YnmC416u5lKiMVQqGq4DzNV9vD6eRPii
	FeneU8RQbykYRpgdrNvJXnVVeOULJNcatj6GzIOfcuEfXW09Way5UAW4zQFpw5DDx/61l9FFG5Z
	T0x4rqE5FRaXjrKIh2b2ey1PjCAN/SC6rkYtcp/44n3o6We2orHmJLk6q4DqdXs7KJIsCg8QrpC
	As0FXDlccyZIK9xXzLeZ6dF7XOvuNQvsClzcPR99jrkKZnjctirr3Ba0bzY7TpLFTfRHLoY7uLV
	2YwHgmn2owLADX1Kx5V3n/yqHInRf5zR+/f+ro7URfovZB7gI6dRxRzGXO3MgCPwXLDDB6hyrIT
	ld8WAgdRT3LvZHzikpL1xaqee/FLi2jxJhpKQIe4Ub4yXHXvGWtBprIKaRAqEf1E07ZZnMD8ss1
	XGIVCxPp9JAaLJv9JuxkXpU+YNOVYS5O2Kyg9Q==
X-Received: by 2002:a05:6214:5990:b0:907:aec2:6cdf with SMTP id 6a1803df08f44-9103ef729camr138630826d6.8.1788566659120;
        Fri, 04 Sep 2026 17:04:19 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91040664be1sm32861156d6.18.2026.09.04.17.04.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 17:04:18 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: devicetree@vger.kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Marvell Kirkwood and Armada 370, 375, 38x,...),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] ARM: dts: marvell: armada-388: use onnn,pca9655 compatible
Date: Fri,  4 Sep 2026 17:04:15 -0700
Message-ID: <20260905000415.153682-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The PCA9655s on the ClearFog and Helios4 boards are
register-compatible with the pca9555, and the gpio-pca953x driver has
matched "onnn,pca9655" in its OF match table since
commit 6d49b3a0f351 ("gpio: pca953x: Add support for the On Semi
pca9655").  OF matching is tried before the legacy I2C ID-table
matching that the old comment alluded to, so the restriction no longer
applies.  List the real part and drop the stale comment.

The I2C client is now named "pca9655" instead of "pca9555", but the
expander is otherwise identical.

Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 arch/arm/boot/dts/marvell/armada-388-clearfog.dtsi | 7 +------
 arch/arm/boot/dts/marvell/armada-388-helios4.dts   | 9 +--------
 2 files changed, 2 insertions(+), 14 deletions(-)

diff --git a/arch/arm/boot/dts/marvell/armada-388-clearfog.dtsi b/arch/arm/boot/dts/marvell/armada-388-clearfog.dtsi
index 6321425eb9c6..34f63b6fbc74 100644
--- a/arch/arm/boot/dts/marvell/armada-388-clearfog.dtsi
+++ b/arch/arm/boot/dts/marvell/armada-388-clearfog.dtsi
@@ -92,12 +92,7 @@ &i2c0 {
 	 * 15-SFP_MOD_DEF0
 	 */
 	expander0: gpio-expander@20 {
-		/*
-		 * This is how it should be:
-		 * compatible = "onnn,pca9655", "nxp,pca9555";
-		 * but you can't do this because of the way I2C works.
-		 */
-		compatible = "nxp,pca9555";
+		compatible = "onnn,pca9655";
 		gpio-controller;
 		#gpio-cells = <2>;
 		reg = <0x20>;
diff --git a/arch/arm/boot/dts/marvell/armada-388-helios4.dts b/arch/arm/boot/dts/marvell/armada-388-helios4.dts
index c1c1b16392ef..562fa2e34da1 100644
--- a/arch/arm/boot/dts/marvell/armada-388-helios4.dts
+++ b/arch/arm/boot/dts/marvell/armada-388-helios4.dts
@@ -195,14 +195,7 @@ &i2c0 {
 	 *  6-USB3 power
 	 */
 	expander0: gpio-expander@20 {
-		/*
-		 * This is how it should be:
-		 * compatible = "onnn,pca9655",
-		 *	 "nxp,pca9555";
-		 * but you can't do this because of
-		 * the way I2C works.
-		 */
-		compatible = "nxp,pca9555";
+		compatible = "onnn,pca9655";
 		gpio-controller;
 		#gpio-cells = <2>;
 		reg = <0x20>;
-- 
2.55.0

