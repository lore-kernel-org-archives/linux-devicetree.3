Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5033043DA40
	for <devicetree@vger.kernel.org>; Thu,  4 Jun 2026 20:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780604461; cv=none; b=KCq66dzMNwPOqlrPKQfhzQ6xpBNnCxFfOa8gDkI/3zwzclpCFq0wnH7wHf3axtJ7SksJkE+1cxZw6h3jTpziZ7OAUYlupG5AYeaOl8iqMwLcZR5s+wkmzy6eURiukTu2yFUOetlqFKTnasEeW6BLmSK4UiR6bCpnCcbL0CvqA2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780604461; c=relaxed/simple;
	bh=L61hJtY12uF/pzRq8lWfif5l+zawxDPfdRCujTKkYJE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Uh7FxIRz8Klft6YwcmSm4+twCvAx/OV5LPTtsLpHNTidv33wVUEkrhGpoxwwa3pecdZuV2F7QdvclIz4/0pUyVDC5Ajt3aEBCl6a5aRLbRDdDatpPIUDOifc7XdBbEPLEWuDJyXOXlCN4gESoJLwqueagydFHZ0PW92IDvzn5jg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qH8DoBCT; arc=none smtp.client-ip=209.85.210.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qH8DoBCT"
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-7e61e25199bso481745a34.1
        for <devicetree@vger.kernel.org>; Thu, 04 Jun 2026 13:21:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780604459; x=1781209259; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BSjRTgvqZkDXu2MLipTCwmEQqCL/hU0TCzAIiZ1kK58=;
        b=qH8DoBCT//lco7FGKFgbg/dc6Q85q6AGpomIiVF8e0gRLBH6VOEuOoN/uJnklU6lAm
         1s27MOM0aR9yA0o+SPwr3mRt07rwP2SUeEvrQr1TkgTt0iUjIND0gSPxCL3C708BhxBc
         TpCHJsbYKNlBJSiLbcjI3xrPvN8mgRmV6xofFLiWH1hRCVRwwDtj7dDlmy0pOoSLz2Fv
         y3VTdaxshF5doolFXdCgUbOpX2phSsVZEz20F60ou27DwuEb+6NB/jXI37CK6tvr3oLJ
         Tea+rXxq37UjBSPiRrm7z0jAn+jf93A4HKqYoL51YOGfT1jy0la/HDtZTZ85ntINkm2S
         OJgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780604459; x=1781209259;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BSjRTgvqZkDXu2MLipTCwmEQqCL/hU0TCzAIiZ1kK58=;
        b=UzjpiotrLqjgemlL8IPj+leTMjxV2CBv07rRh7AKQBxSt1A+sz0Ik7SeVqIQOKPBWK
         T6cj2wtZv6CtzhV6SO0pH53P8vxKvJ1TOPkKJ4Av7ysmWBcY/tWaPAO6PS6aZX6xkX4q
         jeUrZt/5KXnlUlOmJuSFiP5xGF8MAHdi3Yh/8b8HhV6eQN9q8sMBq4B2opFoj6jwA63v
         IAnFvKKSnprp6OAJ446hIX/PDUsO4Ik095F6hJxBC3Hh8pFzW1BoQ99ga4FpUPw4U+rw
         p2rjbZkR/5pOH8NGwMuhSo0bqnfU9Q42i+TULwUMFlROLaAkAraeXXNU07hiRW1gBRpz
         lHpg==
X-Forwarded-Encrypted: i=1; AFNElJ/Q1Iuth0refLzdOkbg2xgT8XYyneCaGdnQmZ1nTqmAzY+2YkPt9Zz4WHOWVbwOnhzAaJAjGe9PQsF3@vger.kernel.org
X-Gm-Message-State: AOJu0YyNoJIVDTGDKP8FpnH9r4nV8NmsP0yQ9KUIWFP8S5m1yM+APGeo
	nVNqCD1MM93bXbTlPNZZqJiNxt+18lgLKCCWTaAY5Rt+1genttJFGj53uiUk9hBo
X-Gm-Gg: Acq92OHCgdrpY5ilyiSlXES/qYDCEuQly0hmYXmdeMo5TOVOy2Ot+XqJ+7M6PCEQjRm
	uOtD5Jp1X0k02mzPhS23Q3z+nr/QLtGyp09XyXHBh97dVflzmNVAMTmWOSCWb0jYBTeF7up2Nvw
	Um/G5+/kPSwbSOslcPtmS0cRddTDha8r3R+M9UTEwvXMsCsdLu8MdQNaew9gr3Gii+4vPXPvu9d
	KvN4jzNUelx2cru1aaGWBhXNkjKgmqSxQ1mm81OWjfGR08uGzRjwDVkXtzGN6O2z+IPye73BTSo
	bTG2VFoMQCXIIh5uQIYis13QrFU4ovGKF765HnzUfmn3eVMHDO4EaqzE2aTfLHRdglVd/nbz5uT
	McgubsmbUutJvMnYoXUGNkRUfmXEVRFROIWkUvQ/gocTbTGrOJJMAisB6/c7doq2gz6nTfyZM5o
	GQHaVZ+L32sr5qWhaU6/GMBXlbwNPlbNE=
X-Received: by 2002:a05:6830:2781:b0:7dc:da80:42b8 with SMTP id 46e09a7af769-7e70ca13f4emr137409a34.18.1780604459351;
        Thu, 04 Jun 2026 13:20:59 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:fb0:1bc0::54])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e6e796c675sm4541800a34.24.2026.06.04.13.20.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 13:20:58 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-iio@vger.kernel.org
Cc: andy@kernel.org,
	nuno.sa@analog.com,
	dlechner@baylibre.com,
	jic23@kernel.org,
	jean-baptiste.maneyrol@tdk.com,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	heiko@sntech.de,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	andriy.shevchenko@intel.com,
	Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH V10 9/9] arm64: dts: rockchip: Add icm42607p IMU for RG-DS
Date: Thu,  4 Jun 2026 15:18:31 -0500
Message-ID: <20260604201832.60656-10-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260604201832.60656-1-macroalpha82@gmail.com>
References: <20260604201832.60656-1-macroalpha82@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chris Morgan <macromorgan@hotmail.com>

Add the Invensense ICM42607P IMU for the Anbernic RG-DS. Mount-matrix
was tested with iio-sensor-proxy and reports correct orientation.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3568-anbernic-rg-ds.dts | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3568-anbernic-rg-ds.dts b/arch/arm64/boot/dts/rockchip/rk3568-anbernic-rg-ds.dts
index 8d906ab02c5fb..b770bfd5268d8 100644
--- a/arch/arm64/boot/dts/rockchip/rk3568-anbernic-rg-ds.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3568-anbernic-rg-ds.dts
@@ -871,7 +871,13 @@ aw87391_pa_r: audio-codec@5b {
 		sound-name-prefix = "Right Amp";
 	};
 
-	/* invensense,icm42607p at 0x68 */
+	icm42607p: imu@68 {
+		compatible = "invensense,icm42607p";
+		reg = <0x68>;
+		mount-matrix = "-1", "0", "0",
+			       "0", "1", "0",
+			       "0", "0", "-1";
+	};
 };
 
 &i2c3 {
-- 
2.43.0

