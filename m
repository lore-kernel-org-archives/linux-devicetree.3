Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794980917;
	b=GVpL4J+EFEcBvpDC+zs4lurAwZdOsfwYeyMYFE0tZmwXaPvpcLvpgiUI0VLJPSlXYNlm
	 a2rlbcuSUIMXGwlY6oagTDBhomWtN4CYFYNK+V8+7209TTRQIrkQSL4oO/NixYjw52lF3
	 YBVvXhQbhD98cWrH+Qibd1i/xoSDT/gG5mWDUwqr5aG1ZbODVNWsx/EKlEueCU1ZV4hQp
	 Oa54/hn1+NOcUnhqGTa5+w7UmWDpSkDS0Cre7+yGlsLwz2WT7rhgthhX/JreM7XwN4DLl
	 30ZmWAu7r2/SjVAzTspHuJbgR/vEVh3WRbh+mFpLeEQi7o3IhMUn5qygGMLv/WI3VMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794980917;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=n6H+e1UqhVYCLF+C1ilQowG+JXqFtAAI3Ttkbc5yOpE=;
	b=dMfg+MXcRMV3yx5ybPQ2wXw5cPyyQY6tTWgblZ0rZP2gCxPIXwx7qBTsGasQshSxis9b
	 rZF+BODFSsZlOoLmfx8KLPk3A0PG/reYAzP1I/9pXjNhRwDZUC5TLc6dhhGoH3+U2eAZQ
	 uwQAzl0jMsQz/9wKY8hnHvW3sF3A1maaxs5NzZzreN0iQEmWFkWI+c6+MaaZENF2uI6Y/
	 HmeVZZXdeGpZugoRlCkmrlXd4V1ZSKYi2o7x1NjTXw1lWhB40gHLSjyzlaal2O3HTx69U
	 /lxe0bTwzFY2PuIyGx1bPxbYHUOpKdD7a8XyeBqZTsOQ916tfRAxxBvJmEYD5kbR/pQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uYlakcfE;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60032606A31C
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 05:48:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60032606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uYlakcfE
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-382f4710a17so408340eec.0
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 21:48:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794980917; x=1795585717; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n6H+e1UqhVYCLF+C1ilQowG+JXqFtAAI3Ttkbc5yOpE=;
        b=uYlakcfEN8upnUkktCyiZk4GEIn4Xm2inOoYSrblvzr2m7b5pQnyZfjYf2QqwS2aAh
         6f2aQ/K9Wv9hzKeXUy/aEfHb/7uSnEMnud58c/QzscCTZzOCUELN8Cwp6sxksoM3iVH/
         wMTQkNLdf0ChKiaEhjnufWbvFgz8siUDaDWOVgg1KeltbEoAxQxkF/BlEEpSijHDA9EG
         QEL7UrSCSXqGCJiuVRdbdN4pax9iZYpZKUUJUlYCRZFi4SyekoFAuaDimQH7zsS9mWki
         4qAMZFX4Sj7yBS8qPgMXWH0w9dYSq2fwumV1WXz2tfUR4d5pGZM64QakAHeu/tSIPDAi
         vWCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794980917; x=1795585717;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=n6H+e1UqhVYCLF+C1ilQowG+JXqFtAAI3Ttkbc5yOpE=;
        b=mQ95e5T4ovR7F1Q2kO1qQ4AV2MpDe12r771Lg02+8+XaBnBW6WyNPt0CDZCdIiAvGC
         HZS/5jAucyQEAaNwRz+a0yWqS5P0CJHR1pQLWxgltuWt28t7/7lgat9v2pVVlQiBDOwP
         WSlovyCNwqlBJhx6FP8zgN9IExs5fQyzeEix6JGA0Zk51HX+u6TwS5RqHTnYYaoeWeer
         MfnLw0f9a4OvqHXbxYwa6oMF5hEqbsAGcLJxzyH2h+Kzvzl8yoPaQStMoxGrcIHGDkpu
         bXIcp9BJxJDhgJrHgS0UisLa3YmTDe5h44pMm08LalN/j28Fz/ezZ5NOn3upyG7bHkle
         zZ0Q==
X-Forwarded-Encrypted: i=1; AL+hErFRwEWbNPi1RIPCAaD5oZG4Zz0iKfyZ2gfPPt+rSdSdIsjJ9lcxqusx/kRVONvWNXC+74vjXXgqVxbh@vger.kernel.org
X-Gm-Message-State: APuU4Z+p99xk32ipMX16YuITaVAIqV2HDF5R06Nx5T5oMqkBylHiTXPn
	o2WAamTy25pYzl26T079ddsYA5bJP6cN4vrj+2/Yf8ZGOb5DPXEpd0Zc
X-Gm-Gg: AZFdTZf34zach39g38EFnruRAdk1mMfajgfeEspu3eZ9np4oHByuMZMIPDKU4dfb3rj
	E5V7iIteQjp4LZ26aPHXr1fnON/ewTkmwBVOsIgKSOsrkm+eykWDmCIJFHQaBE/mHw8EXGF8zmm
	5ZU3C7Rq9fJ7wiYlhDZOt8JpesdEruAFHdtF9Mio8uAebo9YqPg3wtUVooSyndyfmik7dlv6mBT
	N7YIhLbs0o8yRICdM/8D9BamOqsjsd/vYYeZ5E0mk31IBR+iZ+ImzywIBdLeqp+ZpycWYAoT8au
	E5lb0Fr+H9u1dEvf0hRx0L1mT92BuQyNSczxlsr7bDnSYJmEPXvYBMQKiPH10pHGvwtencHO1vy
	ZMPe89/ijiVDOQJfDR5z4gAfCqMQnGcaNwfjUjL6onjcFOpBvUtTfVgtiY3SkrPmegJ+ezQUgK6
	KTbFtwLKQJQ6tD46Ng1b4Rjm4QyCOo7z/G2Zuh+YLOhYGhFR2V1WUmjUaD0ai3grGXNegh9H8e8
	xXp7Ygz1xa2eVi6wrJ4c3jmwjodta8KEt7gUq+jvlzZV/CzV1jZVLnyql4apLMIhXQb11813h2X
	PrsW0Ao23HPLXWVLETvCmbZprPkxcNzarpdv4NlUO0VW11zB3cp3ofuIqxo0VUyGLPIFIA2ZkX0
	v+Zw3j2iYbKlOELLmkeO+DObXtt7WQ8lU+JFh2XzpFONolRhddaotnFsUPPlXjOM1cmKUFG5maF
	AhKw==
X-Received: by 2002:a05:7301:1807:b0:376:77e6:a66 with SMTP id 5a478bee46e88-38280a3d9e6mr1665998eec.16.1794980916525;
        Tue, 17 Nov 2026 21:48:36 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a680032dsm3408116eec.10.2026.11.17.21.48.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 21:48:35 -0800 (PST)
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
Subject: [PATCH 14/17] ARM: dts: BCM5301X: R6250: use gmac2
Date: Tue, 17 Nov 2026 21:47:55 -0800
Message-ID: <20261118054758.132233-15-rosenp@gmail.com>
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

Use switch port 8 as the CPU port instead of port 5. Port 8 is the
switch's IMP port and connects to gmac2, which is present on all
Northstar SoCs.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 arch/arm/boot/dts/broadcom/bcm4708-netgear-r6250.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/broadcom/bcm4708-netgear-r6250.dts b/arch/arm/boot/dts/broadcom/bcm4708-netgear-r6250.dts
index 2bdbc7d18b0e..f5c135f2ad71 100644
--- a/arch/arm/boot/dts/broadcom/bcm4708-netgear-r6250.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4708-netgear-r6250.dts
@@ -120,7 +120,7 @@ port@4 {
 		};
 
 		port@5 {
-			label = "cpu";
+			status = "disabled";
 		};
 
 		port@7 {
@@ -128,7 +128,7 @@ port@7 {
 		};
 
 		port@8 {
-			status = "disabled";
+			label = "cpu";
 		};
 	};
 };
-- 
2.56.1

