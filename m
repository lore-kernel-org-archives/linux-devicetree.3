Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794980906;
	b=3DZ8ssKchFEEfBTq1X4QuPKNqJOGxl774A303+aj1Ii0JOFaXQ71xy732TjOW70xjYQd
	 mMeQLJ6QCzA0OIJsQDloNCKx2moi2pUk/MHY+6VSEncZiX7PkbrC4NjI151oB7PnN8zLO
	 oHtNeexsDqZIMTplMEyXyaRzO5LwHSiNShQSP7ne+aFrYOp85/j2iEvmLlzkRrwaSaZL9
	 Ar/rL5gh6/f3m3Urv3L5itFe+m2oF9ZKiuas1D93YCUIpxOC4wc2M255D4btn4Wfnz9jt
	 72oNAEKkrkweZcmZMxturFflI251Z+/MRkpPDm16LzrpVzxfvqFl055x6rCrfaxC7Gw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794980906;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ibwDa8hDIqWz6KJ5BGcs/jqLMptJO7R0iDPAOR5Uhsk=;
	b=GzNM8BXtrYF5h8LevodHx8Sy8iP42TfiX3r529UHiWpafGEPM3YuIEqPzLwVFdasS6nv
	 6QVcJ5FrAh4yw/bQ/vqVwkDtR0Kjt+1lujBxQojlsriMAqKyY0+OqsKvwQ5JiBF5m19xZ
	 NE79hTQ5mX4mHmLfB0gk6aIRRr1lRA+ONdORpuL+BeXNqAJ7ZCNwLsSgKaHxZFz0IuJMj
	 Mx9cDTwTew5vSuC4nRk8U5bKNwX/W4HJy/3pXJdDiHoKi7uh7Q2C8NyhnFSvgP+lJOKX3
	 s/qO9sQFEvLvyiqGk8Fy7OuIvc+crN6GqQROjaew+OBNT7muXgwvzLE/5pln72724YQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yeXk7goR;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8AE2606A32A
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 05:48:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8AE2606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yeXk7goR
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-382ecd5cf2cso225620eec.1
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 21:48:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794980905; x=1795585705; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ibwDa8hDIqWz6KJ5BGcs/jqLMptJO7R0iDPAOR5Uhsk=;
        b=yeXk7goRft7aSWEzRysdUCmBdqldCCw1Q9c4+IMHgkmWLMGOXkFjFGqzEfXWfJJhY2
         MVJRKLw7hV8rG9kVcyetXD8ZnpFLb4CqAIhdIq3R05B6DyUnYOA8eO0HivDzKJgHP8kZ
         g5J73ERbRbm+6BnsPzB4vPqe+q0oIpq+YrcwsTTWLkDm7olHXLJrn3KO9U0l9fY2ytqy
         cJcnLJKFjO8Q/7dNr51i62xP2quZW3ZCiuSgoSNWTnCOrbSPHzKV27gKrC3zsFLtFrLn
         5jpkljw22XIqUqvjJBhXW25slJBdrjPzPPn8i6x+H8/U/++5K1ZMcmvBawGUUEhhYjgm
         F+Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794980905; x=1795585705;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ibwDa8hDIqWz6KJ5BGcs/jqLMptJO7R0iDPAOR5Uhsk=;
        b=E7XxXP07zGJW7PxUcE3aOJPtWlVPG+wDqXGjfsQBVlisyL+y7qL2Y1fFQZBTQWwtth
         rwTLxsO2ce9FYIy2qYUyYd5n3p5H6r3cKEBdYFUytLbtyEktiPG6C9t59yt+7wUfW/ck
         xknTu13HxafySugM3hvAowUHLXeZPerZ4hebJ7/sAWpqqG+yf+EpQ4c+YE+XaUstpg5F
         KE8k35xf6RRbBbZ47SjqPKdhcIM2DsBgXfLg5Z3DeAil1YQmfDIl8WlbEQtvuoUm0JJw
         ByGh4RmKoUEzfrUmAlpBFDM7g9mVdwL8KdUemB8EzVPZoVnHFSuV5d8pSvQLcQOEgrjP
         83ZQ==
X-Forwarded-Encrypted: i=1; AL+hErEYVHUj47o3U4WxR3J8ApgOy5qlpOHhaSxTskDkjRsTpboVaiu3peYZukwEWiBLRe+eITRxn8wb7N1Y@vger.kernel.org
X-Gm-Message-State: APuU4Z+/IBxg5K0IYWKgqucojyoUj7L4DdFFyl9YJD8t3e3RHI4i1ywP
	GpfYdYWhPk4yjSUNaNGwxW49T6rFdld5a3MtuyB19mFgXDXVC1RUQQic
X-Gm-Gg: AZFdTZeCzPP7xBr4imAj4/UE77qB3lWh8xMimTCEVd5L+ujL2Imrw6XIAkY0iPK0lOp
	swEwyRZVmkFuQWZdOdAo60vtnyDgZ1Qe6wVa8ajVbHiH3SypGIHP6Dkr3e7+rsm/bm7WaMFPZj9
	o2ltF921wzSWBs29p/mpIIM/xo6eR1buRiDO0R61S30ea6bQQ5r5Qi20TaAUjiFlWf25l+pC08/
	DfV3bcCiUuBX0ODWegWyNd7cVblFMdZmn1GNK4VT/AgifA3sXxm0NSq2S7QiTrQfOS9THUHCDzr
	9os3Daz/ALts19GULWT/rb/vlpltx84QSxlf6rmodEmVv3vHsu8kFWfMZxT7gXEltSyFAS6OqPF
	IcPx/GvxNJ+R8t2MKBVHVZCJCUUBtrz64a196941yC6phmTjhLuoqA/jpdFzWY+QBs5mskvWEtb
	Ih4yvSrvqKqoaNHX3QrfFfID0rh7u8OXpHKXwB2rj7iFVk3zDs8jQkP8gQHd1LxWKaXRBOvi9rM
	k48bctBounm78URcwbALBqmUEBGD+GbJHwFfIk86lqpBZm5gGTWX5wEcBBL0kFAtAFrhZZpKCXU
	v+RERFQZeT42l7P9rSkcvvUN+QdsiMjB/T8WYbEVEaNTQ0mK1nVm7Bw8oF9wi5HE8SsDzoBYgfB
	PfMi05Uqy9RS21sPeVZKb8sMOOZi0SLGZVTen5ZOPEKy6d/ewTxzqJjQCXwS6Wk1p0Yd2mipTq4
	s7ys2hqLxUOz/hLGCD8LGD3qg=
X-Received: by 2002:a05:7300:7b1e:b0:36c:a3ae:936e with SMTP id 5a478bee46e88-3810e418910mr4614737eec.5.1794980904748;
        Tue, 17 Nov 2026 21:48:24 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a680032dsm3408116eec.10.2026.11.17.21.48.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 21:48:24 -0800 (PST)
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
Subject: [PATCH 05/17] ARM: dts: BCM5301X: EA6300: set gmac2 MAC address from nvram
Date: Tue, 17 Nov 2026 21:47:46 -0800
Message-ID: <20261118054758.132233-6-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261118054758.132233-1-rosenp@gmail.com>
References: <20261118054758.132233-1-rosenp@gmail.com>
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

Describe the et0macaddr nvram cell and assign it to gmac2, so the MAC
address doesn't have to be set from userspace.

gmac2 connects to switch port 8, the switch's IMP port, which the next
patch makes the only CPU port.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 arch/arm/boot/dts/broadcom/bcm4708-linksys-ea6300-v1.dts | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm4708-linksys-ea6300-v1.dts b/arch/arm/boot/dts/broadcom/bcm4708-linksys-ea6300-v1.dts
index 03d5546a147c..f8dd08cc7cca 100644
--- a/arch/arm/boot/dts/broadcom/bcm4708-linksys-ea6300-v1.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4708-linksys-ea6300-v1.dts
@@ -24,6 +24,10 @@ memory@0 {
 	nvram@1c080000 {
 		compatible = "brcm,nvram";
 		reg = <0x1c080000 0x180000>;
+
+		et0macaddr: et0macaddr {
+			#nvmem-cell-cells = <1>;
+		};
 	};
 
 	gpio-keys {
@@ -50,3 +54,8 @@ &usb3_phy {
 &usb3 {
 	vcc-gpio = <&chipcommon 10 GPIO_ACTIVE_HIGH>;
 };
+
+&gmac2 {
+	nvmem-cells = <&et0macaddr 0>;
+	nvmem-cell-names = "mac-address";
+};
-- 
2.56.1

