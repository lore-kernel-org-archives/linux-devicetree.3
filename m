Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE4443B27C2
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 09:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778577912; cv=none; b=qxDW4IT+vSyfmo6lzS6whAPjMbaUVoaqoqI/c6i4GqI7h0MkIS3UXSizilcI/5nWu43wZB/T0TEeJzoTW49vg+a9AuI7psWSiZfjbHVtcq6M7GCmT9iRijjmcsKLsliQf42PVjJhbDCiz/1piwJaI8sPmap7E2XCkKdJvB6203o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778577912; c=relaxed/simple;
	bh=Te4JIbpLP2wsOEm0mgCN6GLdQddstzF2t9Hyh9Znah8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Nfqniplrb2bJOqSm73ZoHIzPrK7A6rN2Y6YRn0ICGhX6NcxG0TxBozCmI0nJAzY7KkBM3sPZ4v1ZsRGt7z8xonGu5ThaAybtUBs2BNveKop3yDs7zDLncI2AsUAnuqwl1kd0pCUMQh3IZYt2PUgZAxhCsNqW8AKiXVI3kV+vgkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VnYhAbS8; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VnYhAbS8"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-48d102471a4so52290145e9.2
        for <devicetree@vger.kernel.org>; Tue, 12 May 2026 02:25:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778577909; x=1779182709; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4BQTc4T1OOXSNZ2RCg5v8h0CYbT+t3RxhIuDD3tfTiA=;
        b=VnYhAbS8AsJ7oP6+Nook7+wh/J78mrFkUSTPQvLUAtuLGuftdYsMswR09vJdcpqELG
         a3lCpgADNclqKbgxL3DjbrLLjg2J/7sm1kd9Ahk24iUMG2UkgXprj3XBUfQIB8e46Scv
         fu6pRVUkO14jA3lL9kFFT/4B5rHitVhXDbdHnuqC7I/Q1VkfuOJJ1aE8jJ9nhXFaxCf3
         jemnMmBSHXILlRdp9rZtFJbCMJPwAAFdxhBzi0URH1fhGbAD0fmY80Tvu+I4TTt0NzqB
         OaZIpKOCyB8V0QOKrXK8crsYvY1LKTop+yRCwVG6RQZxbQ7DVMOc3xIqWL0quBv1rlGq
         z0UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778577909; x=1779182709;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4BQTc4T1OOXSNZ2RCg5v8h0CYbT+t3RxhIuDD3tfTiA=;
        b=Q+yrjNsYjJeSntHkis76R+VzZ06O0ptlh12Goh3in0470EzDFLY12xZlh7GBLeW7A/
         /+/BoXybifIAkYDh6tNhmg3qb83Eqk7jDyR/70iev4QjQrGqwy6ieKsk7RUAPnzbSvpk
         nNVs+ouNkCEbsdAYErIROHK+8M51ql6pQ4RajFrXPg09C7H62sddIOjySyQ6rPw/4H/i
         smIYz/LX+wXg4iJQCKocLgJCfGlEh/gLdbyk+orqJOlFcFyyFEKIdGVIA/zLjRf4mXgF
         WJc+/Z4zd699VWz1FrLne4AQFfAJ3trDWRpCaVDJ3zigk5g2sqmP5duc9WsACzs4KX71
         FbgQ==
X-Forwarded-Encrypted: i=1; AFNElJ8xTZoKOz5btsnxVNzkF5n9mRkSepg3hCGcC99NfAEY2QkBUfQHLpHkNYyQMGzhQYJfdwSr/2tiBFif@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3WX+ZL5UeEnGZJv3yWM5QHhj2y2hpNASPhVpMfAKR1oURNxYG
	fsyXpXdnn9LXsglfEoDXfHzt4yHJcfKst0D8J/Vhmc7MrQQvB+UM0rfF
X-Gm-Gg: Acq92OF6mrAph8Y7ZWZl1YkQ49f5pUxnbpAUZimylyg1VVmNZaByP9rUKoQUVVwsG7w
	/Q7xl0MNwVaWQrVWAqZDyuzsh4yGVDjinAAgSUWwmczl1e0b2pzIh+EfWhhHWytGcwTcQkzUbRi
	jWnNZl9CU027lm9ypT1HHWTRah1DNPaSzLqveDg5uSXwtIKb2DjTZsEovDAJo1NthPKkbCssAvf
	JNL7VVDIHMtxTmgniTxhf+62zk969FW8eXUzrUfcWHhXYk8DASYQx/I9Prp/yxODx/z9YXeFDXU
	R52seCfd6rukHRnsjoCUbn15sWCRGnJteghxBN1T5khkoMytPrSRb88n51X6ycuDEYBtMPd3mJb
	0QogN/kww7tVy8sNR517tUmkn7NnFXbQbIYDQx242TC1e5FCeWyv7wvoN4GIW0+UqKSQZ37sjMT
	0E0a1SzuiU2yyZJh0ENPKQpxEeZk6oBw0UDZQ8UFAp8GZTZXoRO4N0ogUy/WzRNM3zKI5u6bHQ4
	lqmKmOyKVcZemLl1L16ZJXq497mVKTNVyYvvDzblFAj
X-Received: by 2002:a05:600c:4686:b0:488:aa33:dcbd with SMTP id 5b1f17b1804b1-48e676b6882mr288356675e9.26.1778577908947;
        Tue, 12 May 2026 02:25:08 -0700 (PDT)
Received: from thinkpad-l14-ju.lan (ip092042140082.rev.nessus.at. [92.42.140.82])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e904bf792sm59883195e9.0.2026.05.12.02.25.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 02:25:08 -0700 (PDT)
From: Jakob Unterwurzacher <jakobunt@gmail.com>
X-Google-Original-From: Jakob Unterwurzacher <jakob.unterwurzacher@cherry.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	Jakob Unterwurzacher <jakob.unterwurzacher@cherry.de>
Cc: stable@vger.kernel.org,
	Heiko Stuebner <heiko.stuebner@cherry.de>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: rockchip: fix emmc reset polarity on px30-cobra
Date: Tue, 12 May 2026 11:22:09 +0200
Message-ID: <20260512092225.34835-1-jakob.unterwurzacher@cherry.de>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Technically, the reset signal is active low - it's called RST_n after all.

But it is ignored completely unless RST_n_FUNCTION=1 (byte 162 in extcsd)
is set in the emmc. It is 0 per default.

For emmcs that have RST_n_FUNCTION=1 we failed like this:

	[    3.074480] mmc1: Failed to initialize a non-removable card

With this change they work normally.

Cc: stable@vger.kernel.org
Fixes: bb510ddc9d3e ("arm64: dts: rockchip: add px30-cobra base dtsi and board variants")
Signed-off-by: Jakob Unterwurzacher <jakob.unterwurzacher@cherry.de>
---
 arch/arm64/boot/dts/rockchip/px30-cobra.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/px30-cobra.dtsi b/arch/arm64/boot/dts/rockchip/px30-cobra.dtsi
index b7e669d8ba4d..90751b04f95c 100644
--- a/arch/arm64/boot/dts/rockchip/px30-cobra.dtsi
+++ b/arch/arm64/boot/dts/rockchip/px30-cobra.dtsi
@@ -35,7 +35,7 @@ emmc_pwrseq: emmc-pwrseq {
 		compatible = "mmc-pwrseq-emmc";
 		pinctrl-0 = <&emmc_reset>;
 		pinctrl-names = "default";
-		reset-gpios = <&gpio1 RK_PB3 GPIO_ACTIVE_HIGH>;
+		reset-gpios = <&gpio1 RK_PB3 GPIO_ACTIVE_LOW>;
 	};
 
 	gpio-leds {
-- 
2.47.3

