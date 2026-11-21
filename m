Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795220813;
	b=UZEhtVSOxFdOMBHUgTVbDGMYL4utcBlIptsKC6BfVLA1OCLjB3cBe2QCqhp761aeQUBK
	 /K1t27n5hYdqoJi/DyCnmPr138GxZfmldpa+pxFIJDPzX+vhQW386s8RgSHQDWQJxehwc
	 WH0GYBFMfZjbEtsEE7vO91X+7oyqtK/Udmum0rzmG0oMWvrK5GbIcCKCaC0luo+tPrdbU
	 pnNz4ntXHuwoVCjqRTbuV4WngueAAZa7MV+qaRfsReFvozsmInVOdIK+N2HaPYpz24TtJ
	 idMD/iqINAduSiDrpqhPtWXAO3MpTe1VDVcU6cKJJDQ/Egxdpb5rRVE6/yizP6g+YHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795220813;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=/b1q6dU2ghEuyKkVha/xXxlJqHV7VS5GmIlgXY+GTpc=;
	b=5OXMZT7XyCXtGuuigWAIFM1mK81RdgWmn2Hgg3jqi1Q9PoU7tFk5PiwgkpdqLlg4QsKv
	 ou8H9ufQ5mVeg15INkMwSrCnTbdUjGgMN/DShcDAR+mc/ciCRyj2pMeZg7eCkm1FdJEFZ
	 d1zEl2HeRghycbU26hbyC0UZRp7XSMFQLEq5VVTeR+fg9U2GtAT9i8BJNveEQY3bE54Ci
	 zNJG+0hh+acfRUvcyLDT3PAG5v3UXhCazMS9oLFEUryBZlYNHtei4JJeRuddgJa63tob5
	 99xrkBIEZu90I69QgOxgjiIVRYFurzPzYWKhHer1xLBWuFkKP89SPZ94zDKnFG7huGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sB4WF5gD;
	arc=none smtp.remote-ip=209.85.210.179
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38B0F606A320
	for <devicetree@vger.kernel.org>; Sat, 21 Nov 2026 00:26:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38B0F606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sB4WF5gD
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-8b67f25e6e1so817111b3a.0
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 16:26:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795220805; x=1795825605; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/b1q6dU2ghEuyKkVha/xXxlJqHV7VS5GmIlgXY+GTpc=;
        b=sB4WF5gDSa3TjZ+X6E/RAPUAZ5s50Al0OxsDLP3uh7j1RXmXLnHpAjMDkLXMRo59hm
         gI7FmEEueBAonsIA8Sz3/kGMEIYeu4Lr72eCRg75h9nqsLCjRfkyJJYLMrkVeULN5NuV
         OF5mSPLVCfB0KhdBGgfqSsRrhyrb8XBBfULbkuthe3BEQQYM3qNivY4g6I01A3UqMHjc
         oj96l6aGMSjCpUyMMuzrgoqRbKzT/903hP0HUTQADKY24N7X613KaoU65UxYiObZnnQ4
         SbN7FxmU+FthgD6KlA+cui6X/0vHbu+HaBT03TTYYQOyp6l5eUk8OViLdBGHpVJU4TnP
         3iBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795220805; x=1795825605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/b1q6dU2ghEuyKkVha/xXxlJqHV7VS5GmIlgXY+GTpc=;
        b=qd5qjJqvvv/GQbImX7RtAVroddnaBefL9kD3opcUzrb1dwkI80tFAbJpP1RQkgkGBh
         Wh/zT/m1iF3txMfIqrj6L9vcx2zzXIAkPnv2TSrXbMJYVlwHrf1j4gFjcyibwh2kfn/e
         93eiRpfviTTnDnDI/N/TxyBISQMN7HyGUuKk69BIqIdeLIKuqAuqXvhnp+Ws08PnblnA
         cklK8yeF4gcjuDqWhWCpu/RWh8Kub3t83vEfxe/ZxG00o0SpIvQStIQ4cYdsBVZXhUTR
         27220wYBCODm3Aw7ctxziAoN/KFVM2Gj+NIZatWV84rb6T88POXjzcAiFizGNY2RoU3i
         lTNg==
X-Forwarded-Encrypted: i=1; AL+hErHYeTLNGtge0RLHEz0Aehr++y2ok/jBj4WDa6GGLGc2WNZPeLvbfmkJ0XNe3PhQ2kDbUDoqIRl5I8ks@vger.kernel.org
X-Gm-Message-State: APuU4Z91PAWyrf+No+pCulOKxIxn+5Bo8RvvThUAHcNNt3DBaMtDVnb3
	q8b2m+E1B6PAY2iATwvBmXOGVrvFY8Wx+ApoDToUtYmGAS+r2m2ZfjGW
X-Gm-Gg: AYBFou0J6YvVh6OpKxY2y0w3QorMYRSGgpailY2ful90z9DXXk2Y3n71FloL5WxT4Or
	o+iSlVFQC8LmJzoHJQ3/0UqYDrWaNCN8XUMcMpYzA+JzF9ghSyZQ5EANyXhhD7FysGdEMlaaDmX
	/xdMs2S34YeJ3kZrjn4kVWbqHImkZ6vIDp7oHVw4MYqT/5dk4ZnmcD9I4OZ9hjhlUvi+hsNaXCj
	Ey0s3RIlSxgk7/sky5TT/f8HfDWj4Cx8en/91r8m2Ft0ntDnnVgtHcgerx2RPHH4Y2O+LXRlpgb
	OYOEVodBjcipJ+xZSMuNxd0Vc/5oyCAgQS9Upy9WP1a1BiuOWDICnxn6XZbmhyq6vMFowIYfVRq
	ir5JvuR98j6RRrxWPum56pAnLB9ML0CFzK+i/eV2MTpwYl/nYqX5lLcFxaaNGfmA78yseMDjZIG
	A58+Vqhmmdr9kqnYB577dFkxnZSwK9zrui258pOptd74qj4xulb+VQs+mPsFhfC7c5PIsezNYdi
	WByHLsc8/T1wNqD2pd0Gp2ZRG+LYCg/uFD56k5/Yl7JD9bsANbalOBP7juMfutu0MsLqpPHPYfO
	xeR9OPy3trh2O3q2eqSYIXPivd+04rxszClwpf1uwM+qGJbAg+cyTIh1Ur0M2MeYQMQxR70ib41
	qcibSi30S5s4uWm3hPjoH/R9oA8SrT4gMzhdQxdaiomsE+twQbWoHWj5K8sDH1wxF6ogmhzYuW9
	YXrQ==
X-Received: by 2002:a05:6a21:139a:b0:3fe:81b:5194 with SMTP id adf61e73a8af0-4014e45f92cmr4701665637.62.1795220805565;
        Fri, 20 Nov 2026 16:26:45 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6cfc8829sm1925230a12.8.2026.11.20.16.26.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 16:26:44 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH v3 13/22] ARM: dts: BCM5301X: R8500: add nvram node
Date: Fri, 20 Nov 2026 16:25:53 -0800
Message-ID: <20261121002603.25254-14-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261121002603.25254-1-rosenp@gmail.com>
References: <20261121002603.25254-1-rosenp@gmail.com>
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

Add it and assign its et2macaddr cell to gmac2, so the MAC address
doesn't have to be set from userspace.

The nvram partition follows the 512 KiB boot partition and is 1.5 MiB,
as on the other Netgear Northstar boards.

gmac2 connects to switch port 8, the switch's IMP port, which the next
patch makes the only CPU port.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 .../boot/dts/broadcom/bcm47094-netgear-r8500.dts   | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm47094-netgear-r8500.dts b/arch/arm/boot/dts/broadcom/bcm47094-netgear-r8500.dts
index 76d562610654..d312afdb750f 100644
--- a/arch/arm/boot/dts/broadcom/bcm47094-netgear-r8500.dts
+++ b/arch/arm/boot/dts/broadcom/bcm47094-netgear-r8500.dts
@@ -22,6 +22,15 @@ memory@0 {
 		      <0x88000000 0x18000000>;
 	};
 
+	nvram@1c080000 {
+		compatible = "brcm,nvram";
+		reg = <0x1c080000 0x180000>;
+
+		et2macaddr: et2macaddr {
+			#nvmem-cell-cells = <1>;
+		};
+	};
+
 	leds {
 		compatible = "gpio-leds";
 
@@ -94,3 +103,8 @@ button-rfkill {
 &usb3_phy {
 	status = "okay";
 };
+
+&gmac2 {
+	nvmem-cells = <&et2macaddr 0>;
+	nvmem-cell-names = "mac-address";
+};
-- 
2.56.1

