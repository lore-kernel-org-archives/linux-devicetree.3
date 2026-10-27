Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793107078;
	b=LGwXA/jVF154+KYQfL/JRpCNQQyLTiGHlLBn2nCYAVOloSFkY80UeD0jrvoYtJPHtW23
	 KvgM8NL6pB0+mQb05QgKfeCEqrgpddi9g0yaNHhEXrViuqOrhFoWhoRVN9A7/ANTCR/oT
	 j83otp3XNHBLuL9GAZmWWUSIihZxzASLvbkRk0CVQ3Fhiln2xojMnoQw5U4hmF+rePcmU
	 r06t029ME8rVaO5GW08mHvC2hkBqf3uFFb6T6y0PDBH7Hky/gucupVckjzQtNuYmff7CM
	 ll6jAX72cx5CDnjjFeMw35kGlAnL700fAhoqLeaCmFRLiaV0RYy+KI11iwIwbQW396w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793107078;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=v5imkjHoPJbbt+/z4S2k7d3KU80DTB4+TLzvQNOFtwo=;
	b=s1Qm+4ZBOLX33Xy3IhcJxIpJ+rj15aRhrciJjtgcp6ARIR7IeG0VJoeBTjVWKeER7Pgh
	 +0eBM63r/2Yj0asVlMrAZi75cpKUT8nywj28lMX4dsFz8fcmwTLyGdRKhBgdcMkAIiyrz
	 kyHjHLudeZBjqYBRWlRbAsmbsFdnOYO9yJxt3JJIFeuTSnslMk/qtnIHhq6YRi33bZ4o1
	 1awidJxHb0sJyillhhIi6fzgxGh1BAKDgkx7ag6M1o0NkI6J904olcCNt/IgbSWN+wpT2
	 sqsZFbu2VBohamHWQYdYmbpIn6P04mHD0GQs3Qukw9Bc8WtE71+zdvgQEnri6xBNNxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=s0WvgH8Y;
	arc=none smtp.remote-ip=209.85.160.51
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55A78606A326
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 13:17:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55A78606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=s0WvgH8Y
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-47b47de8b4cso2107542fac.3
        for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 06:17:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793107077; x=1793711877; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v5imkjHoPJbbt+/z4S2k7d3KU80DTB4+TLzvQNOFtwo=;
        b=s0WvgH8YRKiJDaQJb+/kYIoeelgJyDsCiNXBBqBdIn7cwdLU1FGzubr0w+UjIhMbQH
         KPwDA482RpwlZSUK5dVYxAlWXwYABc2m7JkbGRRUolTWReUl9y+ZY92AVGtTxMcyXNRc
         ndMnDD28EyMX2NaQgOazSi9pZoKO3oi+cUXLQrxuHgUjXwjRSiB4C6M/Y6v/VI7haCJU
         3xVYYWQOwv4yAMqaMnEcVMWly6ebxpJfcRAemuLAWbhTO/Bjru4jVeiaPftBJIP8upMu
         I8lLTINJ2qc8g9qLqYjDGdLMXfQtc/dcLfVu+MFU9eEBcDl4lW9S6fDLd5cij0ecMjNG
         cqHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793107077; x=1793711877;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=v5imkjHoPJbbt+/z4S2k7d3KU80DTB4+TLzvQNOFtwo=;
        b=2yXirC/HGcu6qlrjjDdRQQwm3lx+qJUizfSg3EaujqKqGxGJ1NGCN1EzTm4BAXsCQ8
         k9Zfz30a41Sig7no+udDBYAEwI9htGPCqeujhAnEu2lPujGAjOPw/mbSKWCWPYbjsTGs
         bWqmWKkXVAzcmj/K3HnmryGawo+drTz34sNs5G9ZjS0cCRvjFt9ZkXHqDSieTrWKir4a
         WF91ey7s4qQj2jz2kka6ZHH3s7pqXgcnozLwDidBScv8XjGylHHCL0COgSNBv9tjYELW
         PY243p8NDu6y0RQ6wqtLr4c6O/kHYmW25qgj6VukgfWBes7WMtXqRoTduaQruIyN25DQ
         vK5g==
X-Gm-Message-State: AFq9FYLslyPv1p8YXPqWEqxQYhoPs1rFAL/xP5mvdFjykN1UcI2umVvW
	aS8YtPBcz5fnxgFzZwDi4EqseTrDJefUC/9S6/gFz/ndz9eUmsBvyfEpGAzBQeYO
X-Gm-Gg: AYBFou163Qyb4ETM7qHvO8y1OwgKhebGntDU/DV05V1dLYj9VZUY6SN08H6sV0VU02n
	VxeM1a55SmrhmiiduoRjqLODOqlZras1nPgeGbHgpV93Z7iquH6ywpTT2MgXRosKIJm1iJWGSDM
	bLVUwbnBnZHdvNQOAIPteQMrxO5KcAgutuHHO0qXVys6DCo8fuG+QwLQXE193rlvIElMFwB1K1k
	/jc78dSnMATpD/bivAXu3bsqUvxe8SIHrdlcIWdWkQrNSs+jPKcoxVKBYAovjFbtOTqN5VzNK6D
	1wL9q9jbRcpIvRvkg+7F8mOn9jXxYwEMcq2u2N+14NK1cJLoHkeYRRYDLcJi4i19s0q3MF40/4M
	RlrWyo44iMkcxz4JV6WmkOlPjwFF23Rz116ondrOSVl3JaaCOqZ/dD0S52IWuJXPAuAY6OllLzQ
	54vKQY6qEg/L8ZQSSKd7bN9QTtmfU6L6dV/GiiCwLwM8BDASIKg6Ub6WfpTVWX2K4wQjpBD4h5v
	z9wIrQLqVqMU6atWTsfAL6twIsP+Lv0AC7EUbpSF4/5s3/hbmHs8VuuD0H2B5YbJEFoa4nMPMGz
	Pg==
X-Received: by 2002:a05:6870:9f16:b0:47b:df9f:6c0 with SMTP id 586e51a60fabf-4a83f1b8661mr6536028fac.4.1793107077365;
        Tue, 27 Oct 2026 06:17:57 -0700 (PDT)
Received: from neuromancer ([75.28.21.198])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a8b74c0a7fsm23412fac.2.2026.10.27.06.17.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 06:17:55 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-pm@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	heiko@sntech.de,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	sre@kernel.org,
	t.schramm@manjaro.org,
	Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH 3/3] arm64: dts: rockchip: Add Battery Gauge to Anbernic Vita-Pro
Date: Tue, 27 Oct 2026 08:17:51 -0500
Message-ID: <20261027131751.1724448-4-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261027131751.1724448-1-macroalpha82@gmail.com>
References: <20261027131751.1724448-1-macroalpha82@gmail.com>
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

From: Chris Morgan <macromorgan@hotmail.com>

Add support for the Cellwise cw2217 battery gauge to the Anbernic
Vita-Pro.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 .../rockchip/rk3576-anbernic-rg-vita-pro.dts  | 21 ++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576-anbernic-rg-vita-pro.dts b/arch/arm64/boot/dts/rockchip/rk3576-anbernic-rg-vita-pro.dts
index e66803b5399c..5c61467eaa03 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576-anbernic-rg-vita-pro.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3576-anbernic-rg-vita-pro.dts
@@ -954,7 +954,26 @@ hym8563: rtc@51 {
 		wakeup-source;
 	};
 
-	/* cellwise,cw221X battery manager at 0x64 */
+	cw2217: charger@64 {
+		compatible = "cellwise,cw2217";
+		reg = <0x64>;
+		cellwise,battery-profile = /bits/ 8 <
+			0x5a 0x00 0x00 0x00 0x00 0x00 0x00 0x00
+			0xab 0xb5 0xae 0xc0 0xa9 0xa4 0xcf 0xaf
+			0x96 0xff 0xff 0xd7 0x9a 0x83 0x70 0x69
+			0x65 0x65 0x65 0xb8 0x81 0xd9 0xaf 0xd9
+			0xd2 0xce 0xcd 0xcb 0xca 0xc7 0xc8 0xc5
+			0xc2 0xba 0xa8 0x96 0x8a 0x85 0x7d 0x7a
+			0x7f 0x88 0x92 0x93 0x94 0xd3 0xff 0x5f
+			0x20 0x00 0xab 0x10 0x00 0x91 0x68 0x00
+			0x00 0x00 0x64 0x3c 0xa0 0x89 0x00 0x00
+			0x00 0x00 0x00 0x00 0x00 0x00 0x00 0xb2
+		>;
+		monitored-battery = <&battery>;
+		power-supplies = <&sgm41542>;
+		shunt-resistor-micro-ohms = <2000000>;
+		status = "okay";
+	};
 };
 
 &mipidcphy {
-- 
2.53.0

