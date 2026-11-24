Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795521894;
	b=nWfIt1kvgLM9hOvFxzoCQfArbYJkX4bRQ5QRbPvSv45ybnEZUpZBEfyj3OaKeysMm+JG
	 N2pPlMfP8VkhuAngRCsh9k5h7I8lpvdgarPGCELHsr/NXX3Mb3K7SO4Tw1RJTCnw7oeZ1
	 7vN+SOltuE4ezCg4Y2hb2DaKyV6bBLOK7Q41wuv4a+HrTjh/snSJCfu+7W+3X08Ybjg7m
	 bAyX/j2UqnBv/RqDAtoQFn4FzAZ3qh/lM6Tpol6EHSqbWRjZRjrBbUro6UNzNu4Z2kRN9
	 3P8vJ4vyRg2jnlslUoJEDScDuFpu/H4heI2N+WuHtgwpcKSUnz0GYymy1RuwXlYmbnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795521894;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=tGbWQrDEFsG+CrBMh67TvMJoiGyHK1BPF8UtKJdVMz0=;
	b=4A83fiX9Mi+/Thu5JARMBqs7tU6nwMrfOaCs9IWbmNTU5huH33HSvgT53o1wWZydabRa
	 imYC4bN8+zi4WMg7ZP9ex30ca0zsD6QwtwiGsRDz05NEHFVa8A9oVFj9miAaaxn8L+QRs
	 yL7rDtXRqhFz7OqWRzlfLWyz/+SyxepvOUacF4e4POiN5sqrk1LK2L6OFMZuagJ8wGRYn
	 aEnS/VDKaSJGvoQTzW9fScH5kX2gmJTKovBr54+D9hGbHKQsZVOeu3zHx6qyCPAC8N56X
	 eGn9oO6bUGB5X+95EGXhvrT9nFOzSU+mRZRLCfAZfpic/9fEyVYvUMw6sMnQ3bXWUag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=flipper.net;
	spf=pass smtp.mailfrom=flipper.net;
	dkim=pass header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=ztCxAWJc;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD319606A326
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 12:04:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD319606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=ztCxAWJc
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-492fcbfaa88so2842707f8f.3
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 04:04:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1795521892; x=1796126692; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tGbWQrDEFsG+CrBMh67TvMJoiGyHK1BPF8UtKJdVMz0=;
        b=ztCxAWJc1VAJUL+s946mNlM8AQeOvHWKnVcsbgNxSNGCvdyV1EFBs8mAn8XL+ZORVd
         sdWFEyucK751/D2uMke2PzypxyR7mhA+JNg20NX14tgmi16Go5mPBNKLmD2iZ2F+tO7s
         HRV5B29lda7/fF8BzbP8VBI1WfioyI43Jw7LU0DEUqsBseOBWbLVQm2fMAquAqR/UpTv
         VQzu5c4yorYOibgSj5n18Zjsd0Z1hBY1qjgtbS7XUbcj4My6Ryy3SzNQUcErDiqsj7Ui
         L0rxBhHJKNC6XJKw4lY3ILXNXW+W/gMjQgtOAAlJNlIfdsDZK4+QciwtR7LrkOF4ipAm
         Tc6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795521892; x=1796126692;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tGbWQrDEFsG+CrBMh67TvMJoiGyHK1BPF8UtKJdVMz0=;
        b=HQKGp3de6j11mmiAyCXa9L7uAKhNiweGIc+wNMr2NEb40KvplRVwq8KQVSu5Mc5hOy
         sqoFcmfPG2nrshsEIW8DC5ZJNdgAGsFbDj0cX46TlE3W1prusmIBXcYuGv4+p/R+s52u
         aMGNP5SCnOTQjMKAJryUsNWyGlCD+46SFIO06qaONNyYON6w7Am8U+bFMcdDE7Sw6+9I
         Bp7hFULvwyFXcDgYWQMgvaFHmw0J7PJDW8hDKrsvmVLQsGioZlVXgG4qn5OqXe4yuySb
         IFvfYfvU9ADlc7KnEQE1JYtoesgQ6zpJtHMfDWE0XDJwOdU34r2CaEtA08uB8DzUKYJk
         Oh1w==
X-Forwarded-Encrypted: i=1; AL+hErG+hH/PNOA/ikIGsBqUBCCen5RRuzdd63aFfVJuD8IrnnW7usog2FIAhPQvr7i8jwIjMCRbPWBtcocH@vger.kernel.org
X-Gm-Message-State: APuU4Z88isYCfbBPHUOhPvfLxwlfPN7g4i0S1OJKwuXfzsg/JP4I9jYw
	bJ9ehEDK4uAP2SRayV0/ZKoukEij7gGeJE7OzRkbm1iNLnu61SSPjizgPTCTm1OqSN4=
X-Gm-Gg: AZFdTZfgAQWa8YF0zj/3bO03W7QXtxLdgUxMPVCo2xDnP5TKjxJ2N6viiQrrPHgdNA4
	xTgICJWICniYjpcth2nfunn53w6ERxLWMKlO/IDZELV2m5+ByXk0PjCaz3LUDpjSHcyEFqxqLxk
	tQt/1ogrQe7pg+TsCa7UHwhMEkNFWPNKUmedMLSNTyMa7q2uHI5jyiCktxYUt6V4X1sc483LZhs
	U9PU28OO8i9ibg+LrluzupXh0VVPjuptlRHCep52ubQcwhy+txNKwmLRmS2xAQZuI/rHsPGYXRS
	RUcc6V8pRyCMGvaf+L7VMHSK+sf0NVcB5PAGHHTorWiy4kQic4Tpp8y1K4NOtN3QEZYi30lM/Up
	ojoH4S07EsVg1ggEwayKPT1XBgOdH/g3ReZOT2T25cV5xjuS4Ubr8sbe7yx0RZaPK6EcZe5nqbL
	EXKgwicZZldCyFfLEUMiYyIvx6QEeaSwwwrbO77Wm8XOAJioefLsXOBYuROpYryl0LNTgWK49dB
	FAF1CyXfjgi0zfFS23XiPWLrqSM84076OBDdfMgsEG6jnYgUxvv8tpXppB/mV8OU5cry2hj9Vbb
	vF54e+VmAfAyAomyN3pkmChZkLZCJwiOzc7UM1DSQmWKCbY/Uj23wbwOj2Vw748j2QqdbavZ6ao
	IFa+hICN3
X-Received: by 2002:a05:600d:1c:b0:4a4:fc8c:cfd9 with SMTP id 5b1f17b1804b1-4bb9de0d5ffmr64185675e9.25.1795521892212;
        Tue, 24 Nov 2026 04:04:52 -0800 (PST)
Received: from alchark-surface.localdomain (bba-86-98-194-229.alshamil.net.ae. [86.98.194.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906635c7sm242405235e9.2.2026.11.24.04.04.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 04:04:51 -0800 (PST)
From: Alexey Charkov <alchark@flipper.net>
Date: Tue, 24 Nov 2026 16:04:32 +0400
Subject: [PATCH v4 2/5] net: Accept MAC addresses from longer NVMEM cells
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261124-rk3576-otp-cpuid-mac-v4-2-d403b8a25113@flipper.net>
References: <20261124-rk3576-otp-cpuid-mac-v4-0-d403b8a25113@flipper.net>
In-Reply-To: <20261124-rk3576-otp-cpuid-mac-v4-0-d403b8a25113@flipper.net>
To: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Willem de Bruijn <willemb@google.com>, Simon Horman <horms@kernel.org>
Cc: Ryan Leung <untilscour@protonmail.com>, 
 Ricardo Pardini <ricardo@pardini.net>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2474; i=alchark@flipper.net;
 h=from:subject:message-id; bh=niDymIQqvfRIIXXdqI/TGZmfY9YHOucl+/lAZoeizp4=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWSz1gZXZqQ0/bSZxXNP9Hn06upbPoGeitm9n4su2avFi
 86+E17aMZGFQYyLwVJMkWXutyW2U434Zu3y8PgKM4eVCWSItEgDAxCwMPDlJuaVGukY6ZlqG+oZ
 GukY6xgxcHEKwFR/ucTIcCVAYtO/Sf5nGx6silzcJuR58W9xqaVavUtavJ/e4iPFrxkZNi0sLzY
 7q6F4e63J1AW801YtWhkh7MP7zerfD2eOxefuswIA
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

A "mac-address" NVMEM cell may contain a longer unique hardware ID,
beginning with valid MAC address bytes. Both NVMEM MAC address helpers
reject such a cell, as they insist on exactly ETH_ALEN bytes, and then
discard any tail regardless by doing a copy.

Accept a cell of at least ETH_ALEN bytes and use the first ETH_ALEN of
them, leaving it to is_valid_ether_addr() to reject unusable content.

Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 net/core/of_net.c  | 4 ++--
 net/ethernet/eth.c | 5 +++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/net/core/of_net.c b/net/core/of_net.c
index 93ea425b9248..d4a256521954 100644
--- a/net/core/of_net.c
+++ b/net/core/of_net.c
@@ -85,7 +85,7 @@ int of_get_mac_address_nvmem(struct device_node *np, u8 *addr)
 	if (IS_ERR(mac))
 		return PTR_ERR(mac);
 
-	if (len != ETH_ALEN || !is_valid_ether_addr(mac)) {
+	if (len < ETH_ALEN || !is_valid_ether_addr(mac)) {
 		kfree(mac);
 		return -EINVAL;
 	}
@@ -108,7 +108,7 @@ EXPORT_SYMBOL(of_get_mac_address_nvmem);
  * because that is the default address. If that isn't set, then the obsolete
  * 'address' is checked, just in case we're using an old device tree. If any
  * of the above isn't set, then try to get MAC address from nvmem cell named
- * 'mac-address'.
+ * 'mac-address', using its first six bytes if the cell is longer.
  *
  * Note that the 'address' property is supposed to contain a virtual address of
  * the register set, but some DTS files have redefined that property to be the
diff --git a/net/ethernet/eth.c b/net/ethernet/eth.c
index 39aab0f8035a..b69ef0eb16f8 100644
--- a/net/ethernet/eth.c
+++ b/net/ethernet/eth.c
@@ -508,7 +508,8 @@ EXPORT_SYMBOL(platform_get_ethdev_address);
 
 /**
  * nvmem_get_mac_address - Obtain the MAC address from an nvmem cell named
- * 'mac-address' associated with given device.
+ * 'mac-address' associated with given device. If the cell is longer than a MAC
+ * address, its first ETH_ALEN bytes are used.
  *
  * @dev:	Device with which the mac-address cell is associated.
  * @addrbuf:	Buffer to which the MAC address will be copied on success.
@@ -531,7 +532,7 @@ int nvmem_get_mac_address(struct device *dev, void *addrbuf)
 	if (IS_ERR(mac))
 		return PTR_ERR(mac);
 
-	if (len != ETH_ALEN || !is_valid_ether_addr(mac)) {
+	if (len < ETH_ALEN || !is_valid_ether_addr(mac)) {
 		kfree(mac);
 		return -EINVAL;
 	}

-- 
2.56.0

