Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795078539;
	b=PY3QygFmFr19D1QeSHd1BgwowEFOhZ9xtQVTPFTjtBsmxYHrt86QovJRrc7a2RTszTAt
	 y6qxrciNwJaKtyHXcIsgGo3ut0VaAiGmaeRnGghZ1LwVw20Oq1miLy4xMMIZ89j8s6Cy9
	 1ob1LIGNwu+bJfaLSXJFHYKoVrxz4DT8VyUKjHTqFyOgwHy5gtGvo+W0KEVCGRbebe5nn
	 1rpO7/A3wzh9zjBx0FkS5NMGbT8gF2uWEYiXLC1Q3sgugK2NpRRO/eJT4H40GLb+VgZmB
	 7viUVXq5nDV6a6mZ5EamBofDlDBQJoBvl54jNA/jjbOVqBinbiaGoRV3NGvSwHgjoMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795078539;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=/b1q6dU2ghEuyKkVha/xXxlJqHV7VS5GmIlgXY+GTpc=;
	b=Ugd6EXO835WsdczUXX2R2iNK6W5dziKDwC8HkHUER8hPymVmi45iODXImA+sqo9f3yyg
	 e5wpuN355XWS+F5aR2djso82u003t0HtOgcsDvAZBbKTxw6JGzbZCysBXniylgQvCQRNw
	 uZtLm/fF75IKH08/66Z2ypA4TC48R2RBAeiLqS7b9RxLsn6z9dQyuxWsPy1LSONsCE8IB
	 j1oyUlUWPJbq48L8aH5yUm+ryVFHtr6BxcQ9rUgceWxpslHz6t2UAFbHnBUdhHVG8N67s
	 XxMq4B1xx5TuN6edDmUgK+6keYSLprGOdqigHqy9hP4bzvsFYXp5Az0KDFT8mC3Mjyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pMIxb5Bt;
	arc=none smtp.remote-ip=209.85.160.171
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D237606A325
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 08:55:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1D237606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pMIxb5Bt
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-53639b8903bso9613481cf.0
        for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 00:55:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795078538; x=1795683338; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/b1q6dU2ghEuyKkVha/xXxlJqHV7VS5GmIlgXY+GTpc=;
        b=pMIxb5Bt1tqSxiOAYVVVN+K7JQ5UU+7gdqGjE2a+H8+wSnyci9VUL5G34HWFMTHA38
         SnVcxCGtRTrHmFwmzRjOqYu2RTbo/Hqf11FL7WppoGiniyp5T6/0ziJTrp1iV0iiGDmg
         /1/Efqfrgx0BMSyksiD58MaFateAmcM6oL7tpVp4+CREo2ExX/jn5aXXYOIxrNmdWmAU
         pykK5eaHlyYBVCpeqc45IzFzRCndXUtLZMtmy+y5mdRGty6xpbCO+/EgQ5d1y7h9YPIA
         bMNaNDZTQFzu9lLANOI6/L/tLzVukEoanaQE5NiOS36CRIZNQ7S6SYlPhDpycyQ0cS0P
         t5rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795078538; x=1795683338;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/b1q6dU2ghEuyKkVha/xXxlJqHV7VS5GmIlgXY+GTpc=;
        b=qa4jJo3idiBWXijJn5nQKYamjIKPtGHNsPjOLM83biK6VTJJCzeRMQrHHo0KYS9gN/
         Q/AfzlJHfYbimL3ntwJDsggOW39EePAVToJXBjsYigX7U1104btDW/UbPPAuHnrmRqja
         IMdoOj6l+4r9osHZX6j4n89zS4TFkLqsQTfkDG+Huzb/pLRhQjk30jkaM/65nm8grfpc
         wj0Mh3EK1QTgH4LVCOmAfprIJddVUuy1wwyWwHWIVgtbQrs7L85ss3aKFjXUjbE4uD2p
         CIg7hyEGssrwG41s4QBZe7KxWJbzDDS+bbTTz0MNq1zuVFiOaauSV4E2UizgCo+OyqIJ
         zfkA==
X-Forwarded-Encrypted: i=1; AL+hErEsZqHEXL8TpTYZeTw/JVRkZV7f0pXM8ywNEmqD6/1+9ka6oHN0afXGxxvtf+siPU9pn5hcsoyNrXNx@vger.kernel.org
X-Gm-Message-State: APuU4Z8+4XEFS/Cwg0/PhnTv7jq0WQK2ZWnesqs88/utdN7l3717rsO7
	Jrama+9Fp2bZJszgWj2CCqjVGuEGWksV7Cu3N1jDKSWrjri3G9MRedUX
X-Gm-Gg: AYBFou3VjqrRRKxir0a6biioFp5y4SBgn+Yy4WZIK14dAxpQ1nVj2r0jlzX4GzOLpaD
	BC8pdFibjjKvEnlkmHriY9L63KQ5NMbzRqaQAv0Sm1ikWPJ2ed8by8+0Eud5XoqWrwfzMcnY2p3
	ygYcaOOFmdqnlQQ8NkMlp3mEF/RC2CXUV964bD7QqLQ2N1oblhXkqUiCYazj2SSOGcXbQ97KIF7
	N/x+aPITgbRFcfYP1udJZAzYWGKHZmQoBNiNFILgReCa3CS92SQKASHrZyy8uX+l1yqu/RyC4Qh
	1FsBGnIhNLm/P5lcNHAMDEzHN8JteBODdpCHyDjQSHqIt4QxsPivt5rXKSn3OUKRYLPS2+KfKOt
	Sj2wM6vOeF4nhuKsEfJT7SqkI7PlNyEGwHrt5d6ko+2bDG5W4MYuvdcIAGsQL8HZbhHqyKH5OyX
	c4Ea6FIt8AChY8cCSonnnyyN56OE4V+42XnWmwjmQsI5PFMkq8EqyG57QK9DrfL6FPSGhT9oUKm
	WYrLsULSnNcJPUt6GM3I2CIqnOFi5EhhCvGNK342+fnRbTDpGae/0hTSuf+HAWbHYP6EXXVLBTN
	qpgtQYtKfuRp6A7aINHAYUCDoNK8EiNcLgBbV61BxjypNSRFNlUjqfGo3q09350qBuwsTpYNm4n
	jo6euKBlTjeWrWQbIOwByOIdO//nyu2msCI+gjfJ+qv6C3WRt8lj/+stYLWHp7Q0v3eRhFKAB+F
	4Vfg==
X-Received: by 2002:a05:622a:353:b0:55b:8787:dc2e with SMTP id d75a77b69052e-55d6fc98a3bmr5106731cf.33.1795078537921;
        Thu, 19 Nov 2026 00:55:37 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d66bcbeabsm19578151cf.18.2026.11.19.00.55.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 00:55:36 -0800 (PST)
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
Subject: [PATCH v2 13/22] ARM: dts: BCM5301X: R8500: add nvram node
Date: Thu, 19 Nov 2026 00:54:43 -0800
Message-ID: <20261119085452.75708-14-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261119085452.75708-1-rosenp@gmail.com>
References: <20261119085452.75708-1-rosenp@gmail.com>
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

