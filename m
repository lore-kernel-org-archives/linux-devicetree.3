Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792673493;
	b=hxTMtCbDO0eSTHehXZOHwyalz+Vy3WTtDSsXfeIjmulFx5TsSddEcHRAZrgtkoOrqXrI
	 7YamU2rYv9YLnLnQ519B5bxRHomgJWKB5DEhPDeB/+Mn/7goWD6HNUYn1y4AK33vWzyRU
	 EnNf3BtrT2yJBOFVoQnBxTC7VCeWZ3hZnAh7XTJWU6+JddCn6zq86eQPng4HGWdTPbW3z
	 DAAeBpSvzGplk/GXr/YWykUNit1EauMN0dMcY14uIcz8zxAwSDDYjv3yGfIs/s6AUhS53
	 zJYOONeQ2P46q2DiYwe6Z/u17EIkB0YbBeKw//lfe3AwDHz8JQKGaqFufCk2Ea2wUuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792673493;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=UC1n9q3EpmPuUpvBqt4fP3LiFXC+thJA0wBcCFtVB2o=;
	b=WgQSR0bC/AQP7LqtQSg4r/ZQpS63htr8VQxqxFoVf+iR1Um8T2He122L8Y60ASm+Zpvc
	 b3DcyCiB9D0ta+KjoHrt4yIQgImiXbNFEHJ1sz7r1PEvzVThsCcnKMR6yEpF8l1YCKgmP
	 kT8cYEks0Va9YF8orycsiFDwWtin0od7zSbWzVDy85ap0h0VuhdnNosMLU3HzYd1WJjFi
	 NhvUKbhnLZEC2eyRDggSEvrbgd+t+LI8Dux/hX8WTiOT9aTxlP0BQYRXh/UaBBFBqA/3w
	 88I1ElE2mRr9o2ER2dUXclTU6mwaV43DT4iEeG7S4hzXM3GhO0hfeoefkTPsOqeY2OQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=AkeELCE3;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD021606A331
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 12:51:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD021606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=AkeELCE3
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso16566535e9.1
        for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 05:51:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792673491; x=1793278291; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UC1n9q3EpmPuUpvBqt4fP3LiFXC+thJA0wBcCFtVB2o=;
        b=AkeELCE3sWsU1rOvCd4inWtQzOkmV1djxnvyC0OXF6tvKMkXf8xs1HmivsgstqroCu
         UjGYI+vQj726+wUPSYTgeqGmQ8Y7GjOfuN8JnzY2ZM5pcP/aN9AuTOZc07F+MmSgXAMq
         keMBXIb2uLAZKrOGe2iVal1dyIEbnjcaisanFDcr9zHixGnvHVQOHqD/vKCM6sdmuD53
         WeOyO0SFZxJxq7tusNLCvubWqtM40i3KhLMWcKosDZ0HnpiILDf2rXs00puYK5uMuD63
         MNF1lxFJCDnlIPAuc8eByykvb4LJ6dUtjEE1WnofRfyjVlWHj7NDHh2cMIc89+tnFCbL
         Dhkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792673491; x=1793278291;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UC1n9q3EpmPuUpvBqt4fP3LiFXC+thJA0wBcCFtVB2o=;
        b=kq9HAUIDlSZHf9h9QB8MGX7u12wRgYjNk/B3UUeMkztyUBbV6pzYMTrC4HjD3kW+Ey
         66DaXQmUoK6OZMvmhFnwRMCDd+ZKsrwjSAYNZL1Q5Z7G11xvlLG5zSe+AtI4vRDT4hgI
         4tk/gWbMnT/d7jmbxhIYMnA+SPgus0XPGPDbSaDedWX7tZLf285cO8DrVgnYfNIkiuGO
         iUKUVa0SpvcBbneXuuaeEX9LlNZvEJBAP6SEjueOynGScfxmh2NpWKe8tKyoxz/jRbHm
         x/gxIfMnCWql9lh6ZjpxjXbvl8VqMgGCO1LgnHZbN0YGYrrV9CZ0TnFkySr9nwM1DQWW
         5hzw==
X-Forwarded-Encrypted: i=1; AKwUvBwhT8/fKQ81jfGh3qzHtWC2QxuG5AiG3eZvCA2rBjZ4LJNu7DbK35fYLuUwIPKTLUhsk0XhW5Cszy98@vger.kernel.org
X-Gm-Message-State: AFq9FYKQ4OYwUbscpzO8s7329r237yigbbqzZ1QL7ZtBo9ADPfhwSLih
	SRKO+65YbyE+KaxLf0Mpc3ZhADQwnODshhY1Lym4tNkwpp4NTKYHmp97
X-Gm-Gg: AYBFou0IVGJcwlbdIhKcvuOEgIeW1mrN6UzRgJNlAX2UscwjZsk5MeQ0m4OVRVRXQZF
	HooGlabst/UCvMWI3ddg0hLd5/lJ0SMaZOWxV3gpXB6ZgKyyfXr4Ugiyhl1WbdwIPZx6TbUQcy5
	PCfPLie83dYCMPA+dBNpOQ15IYFGa7Ra0CNJoqTdL21ndQVBmbrk+myKGLOZJUldt2V15DbiGL3
	9CkzJvjrLuErwhseHcBkfAmQ2BW8as8c6PN70GNLnUqheJSg/+RY0VuCdtU7qCyuyWlmBXjbfk3
	OECxKMFfOZ+y/bMHh5rJTHervzjondvP9ie2aTYXDeaUnopfuxfsftlxETcXY7U7EHZa8k6HEh2
	7feLUwHogvsVx6Ay3j5UwAweAW1cy5j9+ny7w9YvrvDvxboRGBC7tt4yRAsmFQ7N0gw5gVuxMgJ
	o9DRcA+tGJ+0Zck/k1LIJsZhp5vcaed+hlGBdD23D8v6H6Zj0XAa+m4UmqV4U/+/vynTaOc9D5r
	5ScV8jaY3yvtG7Q6HzVfYLCw6htztlj68Pssi9ZFihTq25a0PMH7m9OSiGxB/xYpxA9gAvvSmaE
	Jgd4Q8aPVJ9aoA7Kps6X6MFaXZ1XLy3VDl+4AAZkWlbJ7jJoNkaMPSk=
X-Received: by 2002:a05:600c:8b6a:b0:4a1:9831:a69c with SMTP id 5b1f17b1804b1-4a1fdd3bc69mr97539725e9.30.1792673490763;
        Thu, 22 Oct 2026 05:51:30 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a203a0f243sm64112995e9.5.2026.10.22.05.51.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 05:51:30 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Thu, 22 Oct 2026 14:51:06 +0200
Subject: [PATCH v2 2/5] arm64: dts: freescale: imx8mp-verdin: Add NAU8822
 Bridge Tied Load
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
Message-Id: <20261022-imx-nau8822-btl-v2-2-b4221ed43650@toradex.com>
References: <20261022-imx-nau8822-btl-v2-0-b4221ed43650@toradex.com>
In-Reply-To: <20261022-imx-nau8822-btl-v2-0-b4221ed43650@toradex.com>
To: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
X-Mailer: b4 0.13.0

From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

Combine the shared NAU8822 Bridge Tied Load (BTL) overlay with the
Verdin iMX8M Plus Development Board device tree to provide a
ready-to-use DTB.

Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
 arch/arm64/boot/dts/freescale/Makefile | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index a4f26aef77fc..3821e3f16210 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -738,12 +738,15 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-mallow.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-yavia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-zinnia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dahlia.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dev-nau8822-btl.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-ivy.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-mallow.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-yavia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-zinnia.dtb
 
+imx8mp-verdin-wifi-dev-nau8822-btl-dtbs := imx8mp-verdin-wifi-dev.dtb imx-tdx-nau8822-btl.dtbo
+
 imx8mp-evk-lvds0-imx-dlvds-hdmi-channel0-dtbs += imx8mp-evk.dtb imx8mp-evk-lvds0-imx-dlvds-hdmi-channel0.dtbo
 imx8mp-evk-lvds0-imx-lvds-hdmi-dtbs += imx8mp-evk.dtb imx8mp-evk-lvds0-imx-lvds-hdmi.dtbo
 imx8mp-evk-lvds1-imx-dlvds-hdmi-channel0-dtbs += imx8mp-evk.dtb imx8mp-evk-lvds1-imx-dlvds-hdmi-channel0.dtbo

-- 
2.43.0

