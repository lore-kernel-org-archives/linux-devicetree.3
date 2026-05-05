Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EC9C481AA2
	for <devicetree@vger.kernel.org>; Tue,  5 May 2026 10:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777976100; cv=none; b=OjAWn1MJG8oGz/ElvsO2N7Y42ptOb4YFym4rATXzHRxr7qZevMMq3aqQo1+mzkSfyQ7Ou6fdjSkjtzrRHPEcRLNVpbueaHW98qZy4FJVOZ5uIfrSRydr2T6niDV9XNr2PdKhG2YYZiWF+8OGOoLeqW+cJe9VGkEj+WlyOsbX/Eg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777976100; c=relaxed/simple;
	bh=+xgY8VbgsO1tV8qwCoQUN+hxw84yhesqu2RZ2QZ5I8s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Yag9aMcy7f+fUdZ5l+OJO9YuEwWG3rttfGMtt9eTPCN+9UUnQD5JDOEJ2yz+/iNXY61KleVnDvuizyb8rHezCH5z9dPE45JHXMRrkMd3iTmuR1fVHSAlbNCF6IFkCUNaDwqkPZcRGB5cv01OJv1xOr3EkDsKyMsrpIAuikSqBTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ihF9bbQx; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ihF9bbQx"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-837dfccd950so902690b3a.0
        for <devicetree@vger.kernel.org>; Tue, 05 May 2026 03:14:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777976099; x=1778580899; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hukAoBkjzE/JQZiJOlkn+RWEhZuaTeJUsZGO9TflGew=;
        b=ihF9bbQxRbD1p4GBgx1XQ6YHantfXSpAnP9ZYiA69TAvbKCpznzLMlGRc5Ff3vUK3p
         uqXdoRU0YyzUktMIW/47TGXNppgsnUmh5eRPiEqhwJRe4vQPBIhWzo/3pKZdeKuyrmt6
         9/E0AUZXz2/8AMYGI5grmzgxcnWQUtJlzvoME=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777976099; x=1778580899;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hukAoBkjzE/JQZiJOlkn+RWEhZuaTeJUsZGO9TflGew=;
        b=sZESTnf26SG4Sta/QBUfCSmWdgmtbwgAZpwm3eKWIN1lepZqnw9ugECJF2Ky//rZz4
         LnKnrp3iVjUrtG/NOYOsEz6CBJ+pnLJBU/nwJ+DT4MAbXnoAqkVhPzH8F1YR9iqMzgo8
         ehha9PRfMq/74Y0HLBnXN0xpc/bdjLTeqHqIR9AQjJiRE6LXH/iYX6X1uAE39NJ8HlGP
         V+am+ZBBWME341y3UCMN1DSi6eNuUWjQMwhqqg9V54pgO7g2Aa6lP5DBiBaKN/QxifQD
         tY8A9m4HjeCjbnoA44ypOr4caEuBXkHqEktbe3dIMu8w7NcnZqOKMD27vgPB9AhnUp27
         gKkQ==
X-Forwarded-Encrypted: i=1; AFNElJ+5rUElGJ4ZvYOmltfJdmftn1+0Te5+f/uDenJm9IkWrpei0LbNs058cOltH/Hb0DawNDYMFyqJgrEI@vger.kernel.org
X-Gm-Message-State: AOJu0YypEK+D3Mz6Tm5h/r0bS0Ca7MVlvMCZ3c3/0QYZleQrORjB2Qyk
	cgFcGZLrnGxbNHWU2hhKiUONj+1dGu/AaGrjgX7BX+dr8POqnCPb0a8AzcxDJngo3w==
X-Gm-Gg: AeBDieshKXHeeNTb4G782ibl4dFTh89Cn4KK9KS1Ud+HK0jTC4NFr+qwpwX81+wufC4
	w7DHi+verKXD/bfnJPiVG7wNBmfVOYC6q805TMoKLy9WxNNCj4I1aLfzQvffl05wbEGAu6q+D0W
	6eNYqtNuCdqeY8Gb4wbRyTzzoGj9Kh1eFu7+dT1GX5YEl7iiE2Rvu0ZrJnOJWfiXHjbx4R2TnaZ
	VCwTVrP6q+k7fjEBYiVhLyNy2iHVahNNiAxjuqOCuFDiuxwcapPLQ9ldWi4ojAXwTeNkAUlXo4S
	EjmE6xq/NMfIMIaAbXGH1twoiL1LSD0UVYSy0+K+3T4IYR7MFwJeV7IZaZnf0glwCuN1s/ZgwHn
	tfnpyZxZoZiubQmAXoy9C6nSaHa6DNV1pV9A++NNLtEx5iX3w8aiUgH64SSDwviQNKVQB2Z0XXq
	sC6kUFSA+hd5LQf5Epo4a+ffj60RuyhFrzeb8mfQMvvHRhs+/ZdAez+qRlv638qP1XAuzmNylX3
	bh8emQv0SQfc3uWwWk0ev/7/nAWWw==
X-Received: by 2002:a05:6a00:188e:b0:838:127d:a168 with SMTP id d2e1a72fcca58-838127da456mr6444355b3a.17.1777976098759;
        Tue, 05 May 2026 03:14:58 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:f1d4:2ef0:7d08:9dd8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-839679c8462sm1666121b3a.38.2026.05.05.03.14.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 03:14:57 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 14/16] arm64: dts: mediatek: mt8195-cherry: Add vusb33 supplies for XHCI controllers
Date: Tue,  5 May 2026 18:14:04 +0800
Message-ID: <20260505101408.1796563-15-wenst@chromium.org>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
In-Reply-To: <20260505101408.1796563-1-wenst@chromium.org>
References: <20260505101408.1796563-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Like the dual-role SSUSB controller block that encompasses the XHCI
controller, the latter also takes a vusb33 supply.

Add the supply for each XHCI controller. Also fix up any property
ordering according to DT styles, i.e. move "status" property to the
end.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v1:
- New patch
---
 arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
index 62e2d7616f20..ca2bb367ee68 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
@@ -1622,21 +1622,23 @@ vdosys1_ep_ext: endpoint@1 {
 };
 
 &xhci0 {
-	status = "okay";
-
 	rx-fifo-depth = <3072>;
 	vbus-supply = <&usb_vbus>;
+	vusb33-supply = <&mt6359_vusb_ldo_reg>;
+	status = "okay";
 };
 
 &xhci2 {
-	status = "okay";
 	vbus-supply = <&usb_vbus>;
+	vusb33-supply = <&mt6359_vusb_ldo_reg>;
+	status = "okay";
 };
 
 &xhci3 {
 	/* MT7921's USB Bluetooth has issues with USB2 LPM */
 	usb2-lpm-disable;
 	vbus-supply = <&pp3300_wlan>;
+	vusb33-supply = <&mt6359_vusb_ldo_reg>;
 	status = "okay";
 };
 
-- 
2.54.0.545.g6539524ca2-goog

