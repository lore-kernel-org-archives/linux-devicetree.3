Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EDAF371899
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 03:00:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784602858; cv=none; b=EpRmwncRUvPkFugBOoL4TNlpK19IACwc914mOfA1Vm0zwhoGYDnM3yzQOAFCh89jMom3chNLlojHiQ5eTUQRcpO6qTRVkJCG+rrz2qMY3o6pKLUDlxWsoJvOE/Flugaykk8Q/hlQjzIVzbCFNTSrNfLTDu6xXS/H5zTI9yfq80E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784602858; c=relaxed/simple;
	bh=BZhveWRdA0vCuqwliYMrpCdDaROTmCTNX174bD20LzE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RfNrYVz5HsXLKv3tL45CfkbEiI2wR9Xv9++4hd9rsONcz2bb/UYaO47pYm4vBvRvXgN2qE35ivR2wTDf/L4lyaJGaIsLosgVOIN4ND2RKP2LjVx/EhfOm6pLVWrcz93gZP6snL2j3kCPutsS3UqRjXkIw3V/y02GM8js9uokcyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fFJfc6rs; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fFJfc6rs"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-8487214ad2bso9755835b3a.1
        for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 20:00:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784602857; x=1785207657; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pAe9oJKs9rYe/I0ehLfgHAp50htWUaPZa7ALyKO6fgY=;
        b=fFJfc6rsOy0rQjzMcILzRs03ofVAhWcE1VdveYVpgQ1EubrhEYJcOPZ4Kdg/sk6mUv
         b8dNZ2sPPvEa8QBUFITTtgnO3sBLdXctDZaQ/iTv9cr4tpiFCBPaDF+p5R2WMZlUFHTL
         V5Q3yrSyL06lr/txwufDDmsqE1BxKoQ+RSv3uZyLfgRO6IpReMki1/CI6fd4CRAJcUuL
         v8E9r+iu1O2OJreHW3/jfi4V8XzJGJok7ey9c5fULyco4oy8j+UjoGo+8ZfAySAh3FAO
         84zSflOEXz/go7fGC/OrPLc9alWjALKByhfngyxsObiUp1ALxGd/v2yweTFMBB18GRWs
         sQMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784602857; x=1785207657;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pAe9oJKs9rYe/I0ehLfgHAp50htWUaPZa7ALyKO6fgY=;
        b=DivqSPtPrko1lj9f8h13tXdamBDzie3RXHpvPDFZ1z4xy9m/t2a3FoZkmtKdzi/5aw
         8cZFXfXYCUpVxOC/xR8oZX0foXEJVsYGdsOYX2nlX+/pgz3FS/fwSuLVwopnWmlY5W3o
         T/EQHbvz2md25jmV/7W6VFo0IF8qDnPEsYol2WedmCdQe4qyEflrMcFuTiJr2B9leSXm
         d5vroS+oppEIODBE7jEby+rbEpgj0uZWW4KZFQiA3E/2fxvaok4ylSzTDVN1zk9dl3Y4
         krqwdMuKgPfULu/NoESigrTzK/H3DU5Ntp0uMFqUTzeh1Ub+2Ijb2XD2a5MtRHjoxPaI
         dlIw==
X-Forwarded-Encrypted: i=1; AHgh+Rq43fBKhgkgNizvnvvu/PdtWtrfo8SuDy2aTrAqIg0SPjar9FaX7CFYlyFmaVU4EM5+wx+mN+aHO187@vger.kernel.org
X-Gm-Message-State: AOJu0YyYi/MYTLICVSTxAxT9BhjHFmj1vlNQdf2NUXQXe9FIt3cQWK3N
	85B/uSufZZeo0xyhu+SAaANZLygTwZ/c2fUrlgrRLsegqk7Xgu9BfDQV
X-Gm-Gg: AfdE7cnnRC17vgqRQSymId7j1/SLCdPQ5COHAcwbKvqZo9ZuQq8Qx4I8drByqw5jZ9o
	7iVF5lVlX+6J2ZWfmmAADg1V7Jteb/fBcZDrbB0rbSBFmaip86FZKRYhaFSPLdzsTgInu5FTLON
	hP8X+yvPqbgMgBo5f4hqyaUj6SiEBtaTf6yfmuKRQFu3CxIdPx+nC/3Q0iNWRdETB2r/LAniXns
	s6Ir0rgzyeKk0Uu/axCXdONcPugFH9LLjqcDZqbEMPeGyDTanjXlRzEwGkw5niaYFLwVTiMDT2D
	b/iEJOuFrOOxkiRPLaZEmie5BzCK5ZbQ9r4sdmBJgQq2vviSZk+Y6y9mR4PYp0pvjeVy+g+0jFm
	Sw4ASg/FA3ZFI6Bzn5qIuldoteEmeUrV+H2l4irISR8V4mvMZo6pfFZqigAhHt7Ou2taHRlOAyu
	Azt3NjIto7doqEKPjpHiK/EuAwflpqJNsFVBqt1BOJOsb/KVgymQ==
X-Received: by 2002:a05:6a20:918f:b0:3bf:6c08:2847 with SMTP id adf61e73a8af0-3c3ad973f7fmr18112690637.54.1784602856639;
        Mon, 20 Jul 2026 20:00:56 -0700 (PDT)
Received: from fabio-X870-EAGLE-WIFI7.. ([2804:1b3:a801:a24:2dbd:5df3:bcf7:deda])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a1bb8a4sm44786669eec.14.2026.07.20.20.00.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 20:00:55 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: heiko@sntech.de
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Fabio Estevam <festevam@nabladev.com>
Subject: [PATCH] arm64: dts: rockchip: Enable USB device mode on rk3399-roc-pc-plus
Date: Tue, 21 Jul 2026 00:00:43 -0300
Message-ID: <20260721030043.84691-1-festevam@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Fabio Estevam <festevam@nabladev.com>

The USB3 OTG controller on the rk3399-roc-pc-plus is forced to host
mode. As a result, it does not register a UDC and USB gadget drivers
fail with:

UDC core: g_mass_storage: couldn't find an available UDC

Describe the controller as a USB role switch and select peripheral as
the default role. This makes DWC3 register a UDC when no external role
provider has selected a host role, while retaining OTG operation and
both the USB2 and USB3 PHYs inherited from the SoC dtsi.

Tested by binding g_mass_storage and exposing the onboard eMMC to a
Linux host.

Fixes: 6d9a7bd6a13c ("arm64: dts: rockchip: add support for Firefly ROC-RK3399-PC-PLUS")
Signed-off-by: Fabio Estevam <festevam@nabladev.com>
---
 arch/arm64/boot/dts/rockchip/rk3399-roc-pc-plus.dts | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-roc-pc-plus.dts b/arch/arm64/boot/dts/rockchip/rk3399-roc-pc-plus.dts
index 7e8039b19be7..c733429fd5d9 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-roc-pc-plus.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-roc-pc-plus.dts
@@ -270,7 +270,9 @@ bluetooth {
 };
 
 &usbdrd_dwc3_0 {
-	dr_mode = "host";
+	dr_mode = "otg";
+	role-switch-default-mode = "peripheral";
+	usb-role-switch;
 	status = "okay";
 };
 
-- 
2.43.0

