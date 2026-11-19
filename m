Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795078536;
	b=mA+X8xBHWWBZgIwnIjY2Po6SMbqnA6nsl7lacR9E/0ra7DP5qJ8KqyZqSnBtQTWATwDx
	 9lV/PPeNG6BjQ5WmNgIcKcgYfnRmzhdcm/bqwN/R6fjCYr++drYu0cxpsXFspU0CveQJY
	 ZTSXy9HZRvsA3qDLUhoOSkA50La7wD0bZCmre8tYPGQBEP/MoCuasRdDH3J5o/Sqcqa2m
	 nvzsZFfX3Y9mqYWh6bgYVnEzG2ds7hkPqdiS6QO6f/RmfvlNug1RTD5FjFuc2aCHCuy/q
	 /bNdxdBiwH4ZyNNsGEp+p7+dq/neSutGl9tVZaE+COFL44b33psqlHsTd/vn0KIdb9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795078536;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=yqFUUo+SlYOdbp1g0P3rZs/PIDm1rBIRBb+JwPIqgwo=;
	b=xVNDxbIopsa0sC+jnOu6Skw6x703YwM+BLbYEpy0MkoZeT0MIQ+Xm7T9gJDK2ks4OoTO
	 3lpLBtJahaWdUvS/fE5VnWMo5H1wDx7ANk/guTwd6oiEv3KC93mUReRkAQ93AQUYfYuVF
	 Ld1i2ZuYx+XHQiX98nr78IlZbqhUl7xuUeFm5HMKrVhJ0bwykPpLgLq95sQYWd0XU5x52
	 gzqjfaqlimRLsHnGKRgfKtrzB2A+HSubPwxTB8zuflhC/e0/zR5a7z6f60QCCNpkuF2cG
	 up7uHtUpVxNZ4yyyVF/f+yNnGhUv/uT/Fpjn403ye5O7eK6H1rtUbefsPpLIhHMv1ww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PU7Dhtia;
	arc=none smtp.remote-ip=209.85.160.175
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D869606A320
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 08:55:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6D869606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PU7Dhtia
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-5430f70c827so28607641cf.2
        for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 00:55:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795078535; x=1795683335; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yqFUUo+SlYOdbp1g0P3rZs/PIDm1rBIRBb+JwPIqgwo=;
        b=PU7DhtiaYHZcWjwQLyZ6vWuCswXQXtcsjFBv0VtieQW1zxGvSZq5p0TDNbtOKqSQB7
         /9cIEfz5Bs86e0DdZK8E0bcJkyLEi09BQmsel8gxczTn760SKoQXAUmiZlQ8RfoUN4ld
         nTuEYXDUNIpc5k4ijcx/uEd60vA6Loj3ckYpaBqM22qncNt8ANVSxIHn3CCTb6d/gx2Z
         riNpv149YYeF820yDHVoCHifFOQvaNyy6e4lR3ExMsivCVYdIoaCrHXUU/mycIxqc05f
         WG7c7pQA7y6ijWNp1sJrsPLYKUSEunnhCwZ53wTHoNdPMO3oTe8GrUOyBX6hxHCCOkde
         Fhbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795078535; x=1795683335;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yqFUUo+SlYOdbp1g0P3rZs/PIDm1rBIRBb+JwPIqgwo=;
        b=WDiMFP7k+jlBH4aOmt8PC7yfCmqzvWyLVx3cK4fGPD+UyG/tvHEDbj9lo7awskY63G
         d7l8+ZaAHMqGE5MDIwWZEV/eV0MmlK8zrTlDw/ZAvEy2mWaAkLoovYpbgm8DhXIw4umc
         yO48pR+0BW9UTqhrMmAulOuWNLSEwsIinu0YfNMxFbR+5Mpz56DloIJxlDuGmUYNLgol
         SFuasLio6gFr3VHZLvL8vd+JFCwf5vRePKYylt5ZtbN8MiAogdH8YMEpN1iV3OH+PAxw
         OD6SA+uloks/bpK2hB0ZoZVA4FIThkYRvwQkCNZ0IAue9++hnDPvXnW2xjOBLCwGhXa2
         x0ew==
X-Forwarded-Encrypted: i=1; AL+hErF8KdBJ0nsRbc/eCGFx1ZR2e1YKJWN3jRodcJN9mqWTqmAWuo/eRtAMsEdHlIu54xak3z6S+uzAsS0e@vger.kernel.org
X-Gm-Message-State: APuU4Z/ea+I0zmKOnZfIy5tV1L0bw7XPKa/3F6hJBDN3JjInbtDDm0mv
	Z7RhgKZ4x74DA23sHiCmiQ/FW+HzFxSHIec3k/U7Vp9Bkf0WH8uRTguj
X-Gm-Gg: AYBFou1kdQRuob7xEDJT78JekWQ4ZKHd+ivMN69/Cb0j6GRabp66zVp03rABVC5rI6i
	GDg37mE6tMnH1wUU5g1IWOdxcYowSwgRNaTRFJbG9zqDZHnbu0ORaUxGSDYz5Ql+gJPv6M7sGgR
	PW7akKB+e/kkcOgS7DpT0EITNW9x3W5z7AahS8TbVxbxkdhcVkvwQzMVqjRRcJ36xphHX9jh/Sk
	vG2sI6HemOYORscpr/36scuGKg5zgBPU0qIYPcei+UfzmuL8F8+SHqp+RL41SdZZr5u4Bqv8EZp
	6cIvQQuGWqxU6gJtGYk9BV7ZpnzvR5JI8Dc/Ctxb2CCvtBH6mPicesJ77SbqAWs6pwvmAmK08ZJ
	TysbNcBtSnNWrlpBiMbYvppbhe+uuQ0n93/K8XEsCCbmsLnv/9hv8zpcy6AB8u6uNmgq3IkHhPj
	8RxGuGQ3VKjG6XS2r2zURn1ZHeDiLbigi5Y9sxop6zLi7i+hnvBGKV5H5LZr3QMeKTKJl9r1nG7
	X8A44x8PTUJ5UTpoWqL+2EKZmCzK9hBc0hcB2hYpg0V6RrHiyC0sXv+S30e1dO2ykDH4TZ1ItNd
	CNxdaQ/0/j6YoT8hwwGnU5PWXB+30sMjhUWBtl3kW9fOuPhHWhy0YILvq4WmPP+qs4+QPNnoVEs
	reJhQD+0459XPf/ZFUbbdG5NCCogyXmXA1Qdp744noCzMzr7asQBHWbgl3pHUT0rsde6hcmGQmK
	LiRw==
X-Received: by 2002:ac8:5a95:0:b0:55d:535f:fb26 with SMTP id d75a77b69052e-55d5a569337mr82885291cf.40.1795078535259;
        Thu, 19 Nov 2026 00:55:35 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d66bcbeabsm19578151cf.18.2026.11.19.00.55.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 00:55:34 -0800 (PST)
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
Subject: [PATCH v2 12/22] ARM: dts: BCM5301X: EA6500 v2: specify switch
Date: Thu, 19 Nov 2026 00:54:42 -0800
Message-ID: <20261119085452.75708-13-rosenp@gmail.com>
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

Add labels to clarify which port is what.

Also set the WAN MAC address from nvram, which is offset by 1.

The port mapping is taken from OpenWrt.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 .../broadcom/bcm4708-linksys-ea6500-v2.dts    | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm4708-linksys-ea6500-v2.dts b/arch/arm/boot/dts/broadcom/bcm4708-linksys-ea6500-v2.dts
index d9e4f84058e3..8b3074684e78 100644
--- a/arch/arm/boot/dts/broadcom/bcm4708-linksys-ea6500-v2.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4708-linksys-ea6500-v2.dts
@@ -61,3 +61,40 @@ &gmac2 {
 	nvmem-cells = <&et0macaddr 0>;
 	nvmem-cell-names = "mac-address";
 };
+
+&srab {
+	status = "okay";
+
+	ports {
+		port@0 {
+			label = "lan1";
+		};
+
+		port@1 {
+			label = "lan2";
+		};
+
+		port@2 {
+			label = "lan3";
+		};
+
+		port@3 {
+			label = "lan4";
+		};
+
+		port@4 {
+			label = "wan";
+
+			nvmem-cells = <&et0macaddr 1>;
+			nvmem-cell-names = "mac-address";
+		};
+
+		port@5 {
+			status = "disabled";
+		};
+
+		port@7 {
+			status = "disabled";
+		};
+	};
+};
-- 
2.56.1

