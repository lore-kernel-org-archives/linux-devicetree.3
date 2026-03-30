Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C51C6344DB7
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 15:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774884335; cv=none; b=F47Vs88Wq5xG+IlqATXTv3c/QgYqvuPXagpMgX4d4lm/kyBt2YKDUF9PIPVbC1w6tPFrJ5L3xA9WK/R+KjODfMbVPQZ8qBQPRBHBQmOfFTnN3kPHer6DGAQe9SXKZKAsnxnjA/aKXGawGknuJ7NrfQoIn3HEachB8ZTGrWCVqhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774884335; c=relaxed/simple;
	bh=Zea/O9BbOkwxi/sWJXxnVYPJVPMRlXla7A8hLEVnhdc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jFaqpFxqmNkNzgwDXtU8DsaNjU6B6O8+ezbPguyb0hH6m6fKHe/DLMUe6UiWApIiFUUKyNFiEDweB0W2ZaLwqe4LhHDcNkFkAW4n3RkZy44UAws+queUG5MftpFmVltS9jKa/QkBQgAqu4CyyD8k9Oa5aus3XaYoyXMlFmw4gjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KuGzkSB5; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KuGzkSB5"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b8f97c626aaso863551066b.2
        for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 08:25:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774884330; x=1775489130; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fi+1KAYYwQg88j14KB9Qe0SEuxhGb/RcRHTFnbIZpHk=;
        b=KuGzkSB5SXJ0x94n2J3DBn2no04RyNd5ULeGxQDlUNZCe2eyeOeJJwlg33qFIWxkaN
         Gmhl/BK5+3hlOiv8RH6HeHRYLX+a9RcHN6r5MXycRkxXot2n4WChj7oFHYZUEy2yX3MX
         eyCeGWJK0Q2J3RVuJfQ6LXpRMQ2yOz+Y7zYQBzIcG/BvmGqHLsZoLDqRhYQgb8AhCKzr
         +bLs45KpLwOU9q9CjQVQn1FqXHR3THX6a27ynopGM2u8S/9N70ygKisoerkWqLbEeY1T
         28i7havwUtYRG7F63d4ctK9U+aCm2Y5EFT9EwipypBsOwcgqDjKjY00JeEPFZAOlRuR4
         c5Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774884330; x=1775489130;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Fi+1KAYYwQg88j14KB9Qe0SEuxhGb/RcRHTFnbIZpHk=;
        b=s8f0LwDTxWzrxLH8EEYWSH216J5lm9CzTkKchcVspVFrmQbQESw09kVEiNRvrE9AvD
         Kc0uZ3H0auzvMxGjXPA6w1hkBqWfuQ8oSC9/frMIm6iV59qllSgERAjlDqmJQVxlpgZg
         swVxPzIboc4oD2J9LeB528eEVjH0nci24p37qVTlRS9T8k+hlO9fjLw0OkIJf59Hclpn
         OImOt7iv8Zz+uXM7BQw3KYIpLTu0rjo27s/PgB2dWNLZzsqFspLTWjuuZ7+pjktivgtm
         DvX/zqSC6hrshtT4sLp47HZ+lIsSr95tcxiZUrZ2x9uk2n7jWte/FwiqMWN/fZyuBrmy
         qc8g==
X-Forwarded-Encrypted: i=1; AJvYcCVB4T0C81KJHgfmz36Eino7KCfe09GEj+cQQ+VNcS4O7rfXlg+7TwB5zu8Bk4TT5YCRqrSNDOREsiH0@vger.kernel.org
X-Gm-Message-State: AOJu0YxXDCJGdLRt1PKQNobHLapYOJPp9SlcketWIbeQowTX2YZcffQJ
	up4UkwtQyHMxigrdwZ622IhnKtIqCIO/paAszilRuyBnUng4rSkR56Kz
X-Gm-Gg: ATEYQzwPxzcoCCwn4arcUX3oJPf37PACymKOPRu+49TBf5GHQG2dWrjI4fZk3wWSYH0
	PI3qgsNmk/I6eemIqO2So5g3b0E4p7BWWJvUew//SfXu70MxN+LxXKCgto04IlXgNehQ4m9svV1
	cx4LK+yC3lHXAW+ZYSdw6dnAR2UAFcVDGiVM/x1eUTYgNnfSYx1cnXHV2BH7jL4FmoXTGcB0qTD
	EEfVBgXMICXqyKE/sDau8Vw6pQd7JvdIYGC6MzP+ANdFm6kZduN+KNg4wrhjP6bdNEicfosTW9w
	T8CNIioxq1zLrC7BsSlo/c+RAVyE74TdYCxa2sSBJ3HuwX4DtSJRpOQe/5KoCeXYUr4n6gn7rKl
	f1Y87ECrPTJSRDyQwR8V5T76rHKP41z4/q8bS4qlyVpee2+Qmz1nqYfectJvfBQtJf2RkFPQrSe
	gcztFrB+iIkY2IRhIi9M3mm/l0EhPI1SzUyPM/FtDtZ0uqnVrD2gAk
X-Received: by 2002:a17:907:960b:b0:b99:7697:76dc with SMTP id a640c23a62f3a-b9b50175845mr850255266b.4.1774884329432;
        Mon, 30 Mar 2026 08:25:29 -0700 (PDT)
Received: from [192.168.0.253] (5D59A51C.catv.pool.telekom.hu. [93.89.165.28])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-b9b7b1e33c0sm301058566b.49.2026.03.30.08.25.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 08:25:28 -0700 (PDT)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Mon, 30 Mar 2026 17:25:17 +0200
Subject: [PATCH 2/2] arm64: dts: marvell: armada-37xx: swap PHYs' order in
 USB3 controller node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260330-armada-37xx-usb3-phy-cleanup-v1-2-34d77f1a1784@gmail.com>
References: <20260330-armada-37xx-usb3-phy-cleanup-v1-0-34d77f1a1784@gmail.com>
In-Reply-To: <20260330-armada-37xx-usb3-phy-cleanup-v1-0-34d77f1a1784@gmail.com>
To: Gregory Clement <gregory.clement@bootlin.com>, 
 Andrew Lunn <andrew@lunn.ch>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
 Robert Marko <robert.marko@sartura.hr>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Stanley Chang <stanley_chang@realtek.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Gabor Juhos <j4g8y7@gmail.com>
X-Mailer: b4 0.14.2

It seems that the Armada 3700 is the only platform where the USB3 specific
PHY is defined before the USB2 specific one in the device tree:

  $ git grep -E 'phy-names[ \t]*=[ \t]*"usb3-phy"[ \t]*,' next-20260327 -- *.dts *.dtsi | tr '\t' ' '
  next-20260327:arch/arm64/boot/dts/marvell/armada-37xx.dtsi:    phy-names = "usb3-phy", "usb2-utmi-otg-phy";

In contrary to this, there are 93 other platforms/boards where 'usb2-phy'
is defined first:

  $ git grep -E 'phy-names[ \t]*=[ \t]*"usb2-phy"[ \t]*,' next-20260327 -- *.dts *.dtsi | wc -l
  93

Swap the order of the USB3 and USB2 PHYs to follow the common pattern
used on other platforms.

No functional changes intended.

Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
---
 arch/arm64/boot/dts/marvell/armada-37xx.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/marvell/armada-37xx.dtsi b/arch/arm64/boot/dts/marvell/armada-37xx.dtsi
index 7470d504a41081b32bee45368028189a13ea7087..360fc24fdde2204540ac415852146d3020be87c0 100644
--- a/arch/arm64/boot/dts/marvell/armada-37xx.dtsi
+++ b/arch/arm64/boot/dts/marvell/armada-37xx.dtsi
@@ -371,8 +371,8 @@ usb3: usb@58000 {
 				reg = <0x58000 0x4000>;
 				interrupts = <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&sb_periph_clk 12>;
-				phys = <&comphy0 0>, <&usb2_utmi_otg_phy>;
-				phy-names = "usb3-phy", "usb2-phy";
+				phys = <&usb2_utmi_otg_phy>, <&comphy0 0>;
+				phy-names = "usb2-phy", "usb3-phy";
 				status = "disabled";
 			};
 

-- 
2.53.0

