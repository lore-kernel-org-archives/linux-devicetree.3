Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794377443;
	b=KqzNh2PADOJiLdeC2SXUnGtqjlkb1yttxnK7fWuNp4DMqwuuKbDVNBPQkJn5maFbn+5W
	 ewCDwMozMMgx/LZt1P9E9pveDAG9NOM+RCi0xho7Gw+Rl65AndDq97Eodk8Y6aslt7dwn
	 zKbFqjHZ6iP9znvIN666mngJD+Ty5wPRGNR7Hny+FWBY3UmxD8329CJIEIc7sjAqM3jc5
	 Tm7agF86Sv8FXhb4Irlli0WACRhCKmBTwxZ8O72VMPQT6yxosVLFw8If3jesy4JcR5V3J
	 JyeazU4cslioNwnhFeBAIfzjJkD7bBfXQ2Q9TlPd/ePuEEjIECljZhqbPdGNm3QuAhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794377443;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Subject:Date:
	 Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=6ru8G+wIXDhbYzwCyjB0a3S3bJNBpEm6tGNjXeNvjrU=;
	b=ZU6D2j8I5PAUnk/FSIcJ8cTvE1yYz6bpWIQbryAN0ONxra/OtZk/tLSO5++FPLKwR0/y
	 vKqlCp9nh41S3uavtF32Qw2C+rHi7CaiLdOjqZ6bh50NLhwi3VXqkJPg4+IbCULuS8hrk
	 SUtWtRPWgHwIQZ1YlM8v7kl9RYiLd8dZm3ydrG8lkMuFR/Pl7tmb5acaoRKsZ6SwMJcfS
	 7u/GQ/ZeqQvl4iHahsH3+2wOUNEcQnwnK6yLO/zsahkOPEs7od985CGGZzqp3ilisdZhd
	 Lq8gOVScj4dNTBZxsVVVcGDEYcfNKEUwDnkxxfQy+TVSCIepq/OpfgP2xwUzr60LRDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nMPUkZWx;
	arc=none smtp.remote-ip=209.85.216.53
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDA2A606A320
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 06:10:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DDA2A606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nMPUkZWx
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3ac91ac8924so1674926a91.1
        for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 22:10:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794377442; x=1794982242; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=6ru8G+wIXDhbYzwCyjB0a3S3bJNBpEm6tGNjXeNvjrU=;
        b=nMPUkZWxTXOw3JvzBF3NOnXBuyHMY3sloUSrbI6h+JLFERmOtcFqAtMKbpwYblcJcm
         oL/1QsD7DVNXt4mceTAqqWgcUAOKKD0EL1O4l0tTv3jjBekPQPgsDC+A5dgN6sP8D2qQ
         c9JQHjN/cxswWAjnNY6/f3ynMQp+toEx/vI1Wy6EvO1AN0XR2+hM3dnkdR+UIFktf/KL
         IpkYiT4oREZ1Q0pYri2nqrU61eqCaVAPQQ4Nej3YMzXfN7SOlHmxTc9SCs1iPvye5xuD
         BzajfxnMjYbXO/meJP2EOfRWVw0DAgjQyfHyXztlVPZvRwqRy9ySrg831xsmIHKN8mhh
         YraA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794377442; x=1794982242;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6ru8G+wIXDhbYzwCyjB0a3S3bJNBpEm6tGNjXeNvjrU=;
        b=Zox3jgPsOkK6ZloTQZUKSy6us4HJf3sVLoYUgDAMBNXY3gNYiiG+QEwd4r7v0y14bg
         o+uFT7qwlKAV3BeU1N1+dRf6uz70nXEKpOrVWLSbTNo+ywcN5mlmXkZV+mTUvwfK2G82
         EX9efosgPRk3nzz9SrWn8qpNQkJQjV5Cjm74SBtCh59o5rONSHKw5LiK41wBAGniQmL9
         6ZquKafd1GvSl5+5ygffj01epTMUT5GS57X8ZoXIwFdtm8K8vXU2R45ArN2U3qXhcVoC
         b5QVKZ5VuFPWFUalOZ96xLGXwSQw38NK8Xhh1VeEpHZYk1Mp405U2gaewmCXRPgwoOOK
         VCiw==
X-Gm-Message-State: APuU4Z+cUHLvtTr12hcpASf5jyKGZPqdT/UnqdFeXqunGat6Qc4JhAvj
	beQMSF3lKdDNZf91RWWVCLFB5K/sZ9rAjRQx0o5QlXuVN87tCs/ayWUbZNBmqQ==
X-Gm-Gg: AYBFou3N8EgwpL0FuyfrZFDqAEI7xFd8SfVxJeRRUfdMQJ9a5WcSb2LosUz3dJDJWMw
	hq4R/L6akJaY2LxkqWuEEdgWS7IzS6rPeOT99zWYW+gMqa65dgaO2WNwx5bZgi2y728gJ/Je05N
	qhR/FcH/Rxp7gYJJGjV7f0Cr8Fs2YQtIOik+GmLxp4nRVEHtzkskM8wRxlYmXny0ueXlXfABrWb
	mtFIAfSPJtqQsuEX2fB6079FuHx9gT8JeMbpCgfxL7Tb0gpJsYM924T49j/Qg5lXSoI3+b13d3q
	cfP8ZXMCK7H8PrIyrG59N7RGQbYhIvLYv63a4xC/PFSO/4BA5SWANSAh8ltNvwjNX4ce/13MsWP
	y3w6Go99n9dldU+424F9qZUjy+1DIwSYEVdInSys+h2rQkG0qfR8494NRxtaBuxFNcluXdnE367
	6vpsrM71ZBsRrKNc7hU3y1EaWJI5NLqnPtyKgq3L0pmogSBs3nQAEQV6W7k+fzLxrFWOiO/rro2
	f0G+Wo5PAF1InWuUey7QYlrLgBTD0yPP8JyzLzF9C9+ZlelNRb4PYMhRHnULSMRIdco11d2J1N7
	nB73r73bdN7sLDvw8nnbxpJ4278q2ObO4F0gjq/5f2nj0bv9JnyDfUtH16L9TzYCRNLN
X-Received: by 2002:a17:90b:518b:b0:3b0:e388:d9da with SMTP id 98e67ed59e1d1-3b182f28620mr1681142a91.29.1794377442187;
        Tue, 10 Nov 2026 22:10:42 -0800 (PST)
Received: from [127.0.1.1] (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b17db7e8b1sm2978557a91.12.2026.11.10.22.10.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 22:10:41 -0800 (PST)
From: Kyle Hsieh <kylehsieh1995@gmail.com>
Subject: [PATCH v2 0/5] ARM: dts: aspeed: ventura2: Add ADCs and GPIO line
 names
Date: Wed, 11 Nov 2026 14:14:41 +0800
Message-Id: <20261111-ventura2-dts-update-v2-0-bce5b5dafc1f@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIANEH9GoC/32NSwrDMAwFrxK0ropsSPpZ9R4lC9tREkHzwXZMS
 /Dd6+YAXc7Am7dDYC8c4F7t4DlJkGUuoE8VuNHMA6N0hUGTbpSiBhPPcfNGYxcDbmtnImNPZB3
 Viqy2UJar517eR/XZFh4lxMV/jpOkfvZ/LykktHSt2fHN9vXlMUxGXme3TNDmnL8eIuWptgAAA
 A==
X-Change-ID: 20261106-ventura2-dts-update-f00bc0510b2b
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Ryan Chen <ryan_chen@aspeedtech.com>, 
 Billy Tsai <billy_tsai@aspeedtech.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Kyle Hsieh <kylehsieh1995@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1602;
 i=kylehsieh1995@gmail.com; h=from:subject:message-id;
 bh=UzoFWGQnfmpYqsdMkcV1qb1KoSKhE64W4DhfwwxJNuk=;
 b=owEBbQGS/pANAwAKAaWDQrcJVsSBAcsmYgBq9Af0PHWv50dwK50Uy1itNGP7amluCEuos33IJ
 m8+J887J8iJATMEAAEKAB0WIQTJHsaNZOdY+THGqJelg0K3CVbEgQUCavQH9AAKCRClg0K3CVbE
 gZRhB/0S77Vr9H7trUM/qwYjhEcN9EtmC6SAmi4fnIDqkTAG+l3Eqye63n8IOtLe7b48MdNSsbl
 qifRmlBhCqswPil5JAdCsOEW9nST16A+6pZEiO0jU5TZoivNh/VZbGrdMnHPKV8N6T/ZgL9Fs0X
 V82DdR1/gQ+yJ83UbiQIQeZuC51KwIenWTQEWWqszLtDl3FIO3CqmuWA4JF/S31uVEfd3cgwWn1
 fIGjKtlB36OGnqOG3ljRqPEsEb4YR+ItMMaQWXB2xIYDcCTA92fICinPRGiIX65S2hZffCOMuWp
 4qP+FkignX2Q2cWH0lhE539UmhWlBfqIMqOOvz8IxtCe9oHu
X-Developer-Key: i=kylehsieh1995@gmail.com; a=openpgp;
 fpr=C91EC68D64E758F931C6A897A58342B70956C481

This series adds hardware description that the Ventura2 devicetree
applied from v10 [1] left out. Patches 1-2 add the LTC2305 and ADS1015
ADCs. Patches 3-5 name GPIO lines that userspace uses to detect the
COMe module and to reset the USB-UART bridges and the 88E1512 PHY.

The LTC2305 ADCs use their internal reference and describe no
vref-supply, so patch 1 depends on [2]; without it, dtbs_check reports
a missing vref-supply.

[1] https://lore.kernel.org/r/20261016-ventura2_initial_dts-v10-0-a546659a084b@gmail.com
[2] https://lore.kernel.org/linux-iio/20261110-ltc2497-vref-optional-v1-1-35c9657f3c0f@gmail.com/

Signed-off-by: Kyle Hsieh <kylehsieh1995@gmail.com>
---
Changes in v2:
- Added the ADS1015 ADC (patch 2) and the 88E1512 PHY reset GPIO name
  (patch 5).
- Reworked the cover letter. (Andrew)
- Linked the dt-bindings dependency.
- Link to v1: https://lore.kernel.org/r/20261106-ventura2-dts-update-v1-0-b085ece9bf57@gmail.com

---
Kyle Hsieh (5):
      ARM: dts: aspeed: ventura2: Add LTC2305 ADCs
      ARM: dts: aspeed: ventura2: Add ADS1015 ADC
      ARM: dts: aspeed: ventura2: Name the COMe presence GPIO
      ARM: dts: aspeed: ventura2: Name the USB-UART bridge reset GPIOs
      ARM: dts: aspeed: ventura2: Name the 88E1512 PHY reset GPIO

 .../dts/aspeed/aspeed-bmc-facebook-ventura2.dts    | 45 ++++++++++++++++++++--
 1 file changed, 41 insertions(+), 4 deletions(-)
---
base-commit: f4dcbba2ec358f7079daddcda7594dad9746326a
change-id: 20261106-ventura2-dts-update-f00bc0510b2b

Best regards,
-- 
Kyle Hsieh <kylehsieh1995@gmail.com>

