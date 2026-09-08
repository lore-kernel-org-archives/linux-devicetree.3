Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8C9F3769E7
	for <devicetree@vger.kernel.org>; Tue,  8 Sep 2026 06:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788847485; cv=none; b=iche50wcAFRZXdxvNbdKIftFfOEgW2Wi3JvuL5yRyG/2IxCPiAqKaZjcY5eDy/Cl6wDoXFsfxZkEXgrRrJYQv82Odvk/85xNjUMGktVuYeQyxfoqXCyzFnLsa8ji/gICAd/2/jlOBbi0Cyk17qBZN3JZhaxXqG8UHewDRqKsbkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788847485; c=relaxed/simple;
	bh=PsznWssVyIqIXSXM5IDeRFr2n7xdjfEbEsc54ZDtEc0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IsogJocQeXp9dCtic78n+32zmDmov5JlC/5gsCr7Qkz0I1P0/+ad6fMi1R0tFDLLf2/sHnad7k2jEntUafIXw+KbmSIQgIDp+5hnzcq6wnAoeBEBjx0Et1iQJawOAzpjEZqJFxspqpitx775yBGjDyNfiRxzcvELr0//a3rM4XI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E0s89Rfl; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E0s89Rfl"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-9390dd46b45so247535885a.0
        for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 23:04:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788847483; x=1789452283; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Bu1eV+ojnBTJPL8f3pcCNNrGxkcxWdZpDJsAdQaiRXE=;
        b=E0s89RflFOid8r/z/m1mb+hl0ztcRIeFY3MUE5yMNkTn1ztqOoWlg2nOBuT6PuG5Oz
         EHRQcLpl/8L0beKzwckps+dorfHqm34pbgoU+r8aL66eeu6mYyAVd/jADdhSu8nrBZf4
         7XlwgvznTUWCAVdRw1TtfB556qw0+LiGnqOBM4jdiy6adckc+gLtrqqDjhyFqCnp+sFt
         aau0ImNaDAAd6k3tV0zaAxZTkSyN1G7ndyX32LcGEikw55VF2Xb0p4rwsTXrUIWpX8KQ
         a3XF94CD3KLAW2uP6IsKlLEMO+jcoxzRFIQbVQC7rHBi+MJbd6hm9G8LscsN4+vvzjId
         HaJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788847483; x=1789452283;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bu1eV+ojnBTJPL8f3pcCNNrGxkcxWdZpDJsAdQaiRXE=;
        b=Bddj6XlUwhpoyQubByAlqcdap0Sg3eKIlIkraR5QTsiqCNJI3+J/YX5pbiztyBtADl
         B20VmUyICyG6tf/9cWNJ4qS6fegtR/X03SVgYxqP1jpp2FeKb5kBvfafZQlbgldWxGYL
         qnw74BtaZPdl9f7DjQ0WvfWvDW5edhClV9wMAbfT42LvAQZWPZQlXAT5q/TshCTK2+WH
         bTczksaMR8MTGeXkbD1vOhgUZJC1sASGmDnz+0mTPyNhHlkeIdYJyIESuZLRa6KDO3yc
         tlWVlynsh6c19TF7xmT5W0Dvm8ZBgL50t2PqbrsUWDopHtkCwUz4LiVwb+DrL/wAxyik
         7pkg==
X-Gm-Message-State: AFuF++k1oixA3te5L74QUNv7M8BLKMk4+bQ3eWj6bEK8eE+gQQkAWXOB
	1+jhpfcQhGUiCgwOiuVQT+r9tBl+iqZRi6AoIhVESm+oBWUmR6b49VGuPxtqXg==
X-Gm-Gg: AYBFou3fMUnbvuwfIa14bXBuckXNV7k4nLjw0mmbp3L+6XAoUQwux6BLPZqbSzVl0aw
	lRntLNlAo9nFE6hnzAqGBYPZhxXyTgwyQDk4slcP3DuTvQFTBF7jTN7avWr5NFkwu3J+VJBWltl
	G/MxRSdbwAqC2+pgmiSXAfBr0hIVjiJJ1XdFdnj9w7060NiyzB3ZIGm0P8Lp1LIi6TnpkyXG/6y
	NQVwsfVFfDpj1pI5GDKz65CopCsuxcVvUnWGDDXS5ouUnzFNi1ELBJAAaRTetrCcZ1ty33q2DD1
	NllaZrilJIHCXL0Bagux11g48UXXw2JAvKiMhf8VC/03VlBsYpSh1N/VDyLY5t4wQPRnMq8Cr3T
	ovyMruG+VyukDJi/cXvEX+Fb73VeUo2YbigDFwYde9tG5LJ8Vn6eAqMmkyYOpYCy9ypwzcdabiv
	Hh/IbgPUi/0Wv4XBoV1lfLL4/nKfJJPhVrHQz3E8FyRZ7Tq995wiK9eWOH1ISaJ1mr+XGcJdTNe
	o/nbKVKNjhCEKrfFrnt+i9b+n3pi7b0y409pUu4yEFoE7tZ0A9yHyjWKrcMVc6kUxQiHSQeFwQE
	XGdudTGK3fF3T1H2iQxdwquBxqtOx3L4cB24UDAPAAjxzpJh
X-Received: by 2002:a05:620a:40d1:b0:939:8c80:669 with SMTP id af79cd13be357-9398c801af9mr1048705185a.42.1788847482693;
        Mon, 07 Sep 2026 23:04:42 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-939bcfc56dasm108701885a.6.2026.09.07.23.04.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 23:04:42 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: devicetree@vger.kernel.org
Cc: Russell King <linux@armlinux.org.uk>,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Marvell Kirkwood and Armada 370, 375, 38x,...),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCHv2] ARM: dts: marvell: armada-388: use onnn,pca9655 compatible
Date: Mon,  7 Sep 2026 23:04:38 -0700
Message-ID: <20260908060438.43338-1-rosenp@gmail.com>
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
 v2: rebase.
 arch/arm/boot/dts/marvell/armada-388-clearfog.dtsi | 7 +------
 arch/arm/boot/dts/marvell/armada-388-helios4.dts   | 9 +--------
 2 files changed, 2 insertions(+), 14 deletions(-)

diff --git a/arch/arm/boot/dts/marvell/armada-388-clearfog.dtsi b/arch/arm/boot/dts/marvell/armada-388-clearfog.dtsi
index f8a06ae4a3c9..4a61e9d1a2c0 100644
--- a/arch/arm/boot/dts/marvell/armada-388-clearfog.dtsi
+++ b/arch/arm/boot/dts/marvell/armada-388-clearfog.dtsi
@@ -131,12 +131,7 @@ &i2c0 {
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
index 39b2d4fa742c..bf6d70e2078b 100644
--- a/arch/arm/boot/dts/marvell/armada-388-helios4.dts
+++ b/arch/arm/boot/dts/marvell/armada-388-helios4.dts
@@ -160,14 +160,7 @@ i2c@11000 {
 				 *  6-USB3 power
 				 */
 				expander0: gpio-expander@20 {
-					/*
-					 * This is how it should be:
-					 * compatible = "onnn,pca9655",
-					 *	 "nxp,pca9555";
-					 * but you can't do this because of
-					 * the way I2C works.
-					 */
-					compatible = "nxp,pca9555";
+					compatible = "onnn,pca9655";
 					gpio-controller;
 					#gpio-cells = <2>;
 					reg = <0x20>;
-- 
2.55.0

