Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794377458;
	b=bVXnF3WMinUn7EQWTq1ASpEdKyS6ZCiJYwmSLyA/hl0Nl1qBDYSZsLP/TVCTHKpD1vEj
	 f/phX9i2kFBuLmEoDCG6HLOLuo/y2zt08/EEaMmPzMBjM7jswggPJF5NtrBg325wf/84K
	 dyFEMzeVBsiItBnYopASJzowlJx6U5x6ACgTue+yJdyxj4dMDgh8NLtL3D/BC2DhexIdg
	 WWh08TY/REzjVAWLnu0BJ20qRgmAMoHOUnD+pLo3B3Jq46VZnwMhdxmNuzoxs2MCsjBXa
	 2xESb0YXOGp5pOnr0O+b8mZqgO0kPGd9asFfjvqOu4MpD9Z86ixCdujVwBE2WPclJEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794377458;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=fK4euQL/sXyPal5+J+hrdUFIpsb4ZufsR9tCvoLGNPE=;
	b=KOuv8bMizAukl6+yjL3VtckXCi0nePjnl2YcAt0JZyZiWqoxvzWyU0sAQqQywjcw7j/l
	 68X+7TqSnMA6f+O2R+tsqPkl71AXMJZJXIjGZ6WLZXftLzgT4/EBTGMLlNX/2tZCKjYZ0
	 mDmz/ybMeUgSArEeHC2cYSaUvxp/y5dTc/eE+fYVEry5JQO5rLjdMEBuPglkA2sCT9Km5
	 qX+j2+iAE2Qxz+DJ8QBnxgGcLdKFUZadv3XLwDnXgOGIbJWHx800QQb5mPd1/fWOZ0ef3
	 Ghzu9c/Cl6fM++oZOtzSRsIcFh27MEBg+RmIfeOGz7XkPvX3efZNQ+8hGctDSDpIBuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DMXffora;
	arc=none smtp.remote-ip=209.85.215.179
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 113B260A2633
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 06:10:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 113B260A2633
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DMXffora
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cdab6ae1ee9so1313946a12.1
        for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 22:10:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794377457; x=1794982257; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fK4euQL/sXyPal5+J+hrdUFIpsb4ZufsR9tCvoLGNPE=;
        b=DMXfforaP70umyE3P04GZoti074NwGxMlo9cq8jyCjiDHk9VqMDQ5hBN4cf68KK4qc
         f7AYVrDUwk3X7XyxBxwOBC2RL96daNd3d5LrNoLT4siBnXYbhH7MceJakAvlK1O4c86I
         oMsWYho0nCKS0jdXLdMcKm1TyLIs3OLxdW53KmHJtbncdP+SbuEWGolgQwy51pZkga5H
         p5r6bUSM10QOjdCPC3Vv7ijFu3+Zwwzy6pLa76aT/W+ifbk7a/VENFonw8SeGFQaf0Wp
         kXh2DuiS7MkkZYnYPZ7Ab8sJRwvQlFrkvT92VwPbYLiG8KS/UtWeQ1fdIWFBDY7VxqIi
         DGRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794377457; x=1794982257;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fK4euQL/sXyPal5+J+hrdUFIpsb4ZufsR9tCvoLGNPE=;
        b=y5by4YOGH/Oo+aQxOwgKgarGGzjyg2jmBqlfbtwZOsig8Nblw9No5wolg98AZIyHv6
         h3NBDDb221hV8gFuZ2KNUapALr+oMDx3Nj5SiVVEb0g+EN6xDMMJ+msLGeq6vFeXCZwh
         kjyBWR74gAhzEqg1fCWhI3piDlGIwAaxCKpFR4w2FWbzwoXzeaRBLU2PQoGJmLApg06a
         i+lMoH5AlM2RJgn4D4Jv6Rb541ikvKRrZzy5nk45aPAc9idlUd04r0xTZ3a7jaoxQtyz
         iouvrM5sJjbg1hDs87wgzBlJvAKQnQRIJw+QDKjTQDa5Gp0QJQ7v/wm3yGabEtf8FCu+
         3Rlw==
X-Gm-Message-State: APuU4Z8F4yadrRtehMah+2O6Nz27NeMoFxBh0+uKmMcMsicg7V9loTkq
	oFs1WGslj/p0+y7MQ9VfqFZrmo/73twdcMpc1fwvR1tdCuQkO5Eo+0xL
X-Gm-Gg: AYBFou1pBP8oCkaMwoTFvzHud1kXa2b9Zdn/lTT/vo+lAWSNWAu4CSJUEUG8jiq3vIv
	3CM2J3jap5S/7C0ptlqJ3YPXpRE2vk/mG+ij2KrQF6Tdvifaj78dMgYiZWcZKDZqn48NQZiO8Rs
	VhAplnPYX7dPInnznHXM01huPkhkDF5wfzZ3GgSTr9+tGAaoddu6s6bmt3jBggVab8Z7/Coa6tR
	B4yFPN07SI+fFHGyziWDUaPkNl+bm80XhXrTd9aNkhVD1Jvfc5yPjk/bmgypJ1x2YKUwzHhrvWZ
	j2Ki4sdOy0hrUGgNhjiwy9e9N5aV5vfVMDup1cp87HaK0BJLiaTn07RvLE03VuZN/UaJL7eN3QC
	e1SEQth17VeCZzQCnfSo6MSFutx4re31Wrtlhk4EPppEAW7aLQj4SCWI8knNVzXpbIX2WWELe3b
	vaGOyzEj3MhS6132SZd4/M9ikAHdxZCu02eGP8zwdIA72VA9MCblJ/yyMBZ21lj7LrWgFavJTI+
	Eoj6yHzcn2/rGPfuO4G+lCLnUu1osaAUd5Dqtrow9Xs3/k8LszFHWtqiDRMpIG2IGHgn+v7b9an
	7aZ4fTuVYeMkKhQ4Zsj/zeQ6x/hb+NASl76qFmZGDX3mpaGmibh/B4zvGwHc8eZW/PwH
X-Received: by 2002:a17:90b:2e46:b0:3ac:aa8d:19eb with SMTP id 98e67ed59e1d1-3b182e0f256mr1318971a91.3.1794377457428;
        Tue, 10 Nov 2026 22:10:57 -0800 (PST)
Received: from [127.0.1.1] (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b17db7e8b1sm2978557a91.12.2026.11.10.22.10.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 22:10:56 -0800 (PST)
From: Kyle Hsieh <kylehsieh1995@gmail.com>
Date: Wed, 11 Nov 2026 14:14:46 +0800
Subject: [PATCH v2 5/5] ARM: dts: aspeed: ventura2: Name the 88E1512 PHY
 reset GPIO
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
Message-Id: <20261111-ventura2-dts-update-v2-5-bce5b5dafc1f@gmail.com>
References: <20261111-ventura2-dts-update-v2-0-bce5b5dafc1f@gmail.com>
In-Reply-To: <20261111-ventura2-dts-update-v2-0-bce5b5dafc1f@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Ryan Chen <ryan_chen@aspeedtech.com>, 
 Billy Tsai <billy_tsai@aspeedtech.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Kyle Hsieh <kylehsieh1995@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=993;
 i=kylehsieh1995@gmail.com; h=from:subject:message-id;
 bh=xxMp1/Ez1x0+u4gEwcM37HZ9S+6j5lTG4LB8OtJfTVM=;
 b=owEBbQGS/pANAwAKAaWDQrcJVsSBAcsmYgBq9Af26OzcycIkzFNsHXF4FJMNd5XIH5LUASwIA
 6mD6yK5pEWJATMEAAEKAB0WIQTJHsaNZOdY+THGqJelg0K3CVbEgQUCavQH9gAKCRClg0K3CVbE
 gTq3B/9YCHNGgux2LFrmmQhjhNtjCf3sYPpiQCl+wbB3hl5P18p1+BE5tmoWffF8zEbIEKFp1Hv
 Muo+kaAZc6Thx/QsJRcIw9MOsWo1b1WSIBjmYzbdc3uw5wB4s3hdzNqxyZVfKShvw6+238sUSyh
 QLYHpqe7rTQJprLHTtyA9qKJ7EYSckZwx/D7VkPys1Cn3AveHyIChLsITJ/cmhKUFI6bTMTt+J/
 O1SAOCk4wMJHgCLjMaTptjyC22H+MA61k8WCHvULsm3WWZAz1zWZIOh9hdBF/tegK/YTW29XOY3
 K8jE3xCp+6coF8UfdN3+njmgO2NoCDOoUYBXeOpg5lxz76Em
X-Developer-Key: i=kylehsieh1995@gmail.com; a=openpgp;
 fpr=C91EC68D64E758F931C6A897A58342B70956C481

Line 10 of the PCA9555 at address 0x67 on I2C bus 10 drives the reset
of the Marvell 88E1512 PHY. Name it FPGA_RST_88E1512_PLD after the
schematic net so userspace can reset the PHY during network bring-up.

Signed-off-by: Kyle Hsieh <kylehsieh1995@gmail.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dts
index a5e6cc94b280..aa83233f1710 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dts
@@ -2486,7 +2486,7 @@ gpio@67 {
 			"FPGA_TRAY37_PWRGD_BUF_R", "FPGA_TRAY38_PWRGD_BUF_R",
 			"FPGA_TRAY39_PWRGD_BUF_R", "FPGA_TRAY40_PWRGD_BUF_R",
 			"FPGA_ISO_CARRIER_BOARD_PWR_OK", "FPGA_UART_MUX_SEL",
-			"", "",
+			"FPGA_RST_88E1512_PLD", "",
 			"", "",
 			"", "";
 	};

-- 
2.34.1

