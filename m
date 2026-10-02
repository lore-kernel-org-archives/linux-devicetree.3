Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB8BA4457B6
	for <devicetree@vger.kernel.org>; Fri,  2 Oct 2026 07:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790927810; cv=none; b=E8faNMxgpLxyW/WYqZQvUJrsXJaahgprJ0LxV7JGyP5SocxVWTW/zhOorONVyQ16n1xxSQ/32qPE0O7KtGQa14PlDA6A1Y3vcknaSpGdEc6EQ/++gOBuwVb1jUPUADrODMwchb6LZmfxw02RcilsG1lAJjzscjP5yB24/fvPLk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790927810; c=relaxed/simple;
	bh=ElnfxgFhcmeUn8ZIqa/xzqEbM075lUDvBpB/nd40vQ8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mTK1JGzogxepOlLtkTiXWbHzeLhMY+27/qdl3v3oiFjn5MiGM4gKMk6h0mhnCqTnElkdKOKd6MkxsirVUhJtx/0NUrp9oVpwUMMgqgccukIQOzkaHz4ZAy04pIElg29lXDinJMvF+oft8Q6OFZs6darsZdBFwboprKITHt4fQIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d7l57q+/; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d7l57q+/"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ff9642c57so16997545e9.0
        for <devicetree@vger.kernel.org>; Fri, 02 Oct 2026 00:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790927807; x=1791532607; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9ejw1kEAdsdZspPEoWHlWSDGgAnEWhYDeRavXIDNvZY=;
        b=d7l57q+/GVQxDOY6c+ROwiTfg3eZUbQVaRZ4LAe1idXoxep1Jb8d5RjtNiQPGYQtAB
         ko7cS5wOSTKXstXQaBsy0AQEtUB3MvRbWantJ763vQ5wDHjRmmnOfTFYVE5cFwGYzpt0
         VCBJWT2w0v3w7VYGsQCkQyUVU/2yM5IIMdzi4ujXQDzRNbnTeY+I0u/lhpRaULvi8mnA
         metPgRxr9UybwA/iRVuXpNMkKHdHYBfaca+tOT8luOrMfDyNEihdCSbatwyUVxHRjQ7y
         8vtg+CrcR6RPe2htAYQwc/eb4pc67D6T3QdNjUhBRPFH0Ndmar40XsnzKVuVP3lDF1BB
         USUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790927807; x=1791532607;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9ejw1kEAdsdZspPEoWHlWSDGgAnEWhYDeRavXIDNvZY=;
        b=nob4qp/UH4qLy7WIrBcR2Nqzfx4vwRQ1RutS/T9DuF8Cpbqpw/vvr8J4JYgl0ImEv4
         zeuzZ6TWwhImDntgyVRKIP+nbWOytMH3BsY/B0Qmj2yLF3oCgE4tovQlEAYvYmCF9bYZ
         9tVmYgnL08wxPhRSZyAkXgNV2wDzkhAkwp9rvb37DIyyyZTZ5q7baPdoMRCkZK1vCIkc
         UnQVnCo/BYzxhQzHKD5C/b+k172Xb0AWA7jss0P7QrKV+ShPLw790kewwQ1psnEpLeGp
         Wg9odYUoJZGfbmK20my1Y2vLtUSpNh18Oyv/BLhWGsyVOyrqN7HDie4nq8DspdlYj+tL
         SmBA==
X-Forwarded-Encrypted: i=1; AKwUvByDmc3x106W+IJnLdfFWgH4K2lwgVqQXqiDVLioPso4bbChQAbaI3EpPOZKLXX+BB+BLnCewnoXE+UM@vger.kernel.org
X-Gm-Message-State: AFuF++ml1XyV8SVVlJUNcq/MvqNR58x4F6uQIukIggOLsZQoTFluplwz
	aGD4Xnzr6rhTkRY3LfkVJPENv+aDYoQqierxM0NadHUDnWhhZQEgW73G
X-Gm-Gg: AYBFou3SmR6t65RX73Vc6bA4fsPa7uv/W+zcWsTCkYUdrxZMEgX4taN4FsUzlqRLWgH
	Vqg5AH1xDSl/WkmBbSKtuVCjcReYvyHQ9f8jowOevYsLnCEry14HmPYgIWLEZJoIIFlLigrCcNX
	mjbq/9KizkB+D+ykUQIsAbbd0yoQMXWBq/YTorrL5ojDe1miB8LsFgqGGjVyhwUf5LpnzyJ0PGC
	GfD/KOOBrNEUA464EjpPdWrz1YvWDujdzruyqndw40GBbKACcAr78uG6E26rxOlyYDq/NPWTuc/
	dfVaUrRDV+06v0xzC68pVezNG78kRGvdALVn8xzMy8nj8ALzxtBsv1xwSui/HYB50h0EaGAJcjk
	3LRO1lG1ma122fIQ+Cg8i6BZkqy28EgE4yDbJ+B9S7Vzg7V1nMRi10oPGWmgunbLOOfBgUIoB0F
	cV5qpJc5JeO25orEZgqBb9BNMgKK7ILQKKWh56lCyiHdnqktmZ+sMTSX5wEcHhmLzcQ9kMh0jW2
	pREr0kG/DEVkJ6xbYnesHI3zF8ZIl/QiaUYYZGoKpdYF+Y7UFjz43jZgrRkssfNUxNb1OptJg==
X-Received: by 2002:a05:600c:548c:b0:49e:65f2:db64 with SMTP id 5b1f17b1804b1-4a027534bd7mr31406145e9.5.1790927806666;
        Fri, 02 Oct 2026 00:56:46 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0280be5dfsm63635305e9.7.2026.10.02.00.56.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 00:56:46 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Fri, 02 Oct 2026 09:56:39 +0200
Subject: [PATCH 3/5] arm64: dts: freescale: imx8mp-toradex-smarc: Add
 on-carrier 3.3V regulator
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261002-smarc-imx8mp-display-submit-v1-3-f578c63fb676@toradex.com>
References: <20261002-smarc-imx8mp-display-submit-v1-0-f578c63fb676@toradex.com>
In-Reply-To: <20261002-smarc-imx8mp-display-submit-v1-0-f578c63fb676@toradex.com>
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

Describe the fixed 3.3 V rail of the Toradex SMARC Development Board as
a regulator, like the existing on-carrier 1.8 V rail, so it can be
referenced as a supply by the devices it powers.

Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
 arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-dev.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-dev.dts b/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-dev.dts
index b31de307093c..c28d63293149 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-dev.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-dev.dts
@@ -32,6 +32,13 @@ reg_carrier_1p8v: regulator-carrier-1p8v {
 		regulator-name = "On-carrier 1V8";
 	};
 
+	reg_carrier_3p3v: regulator-carrier-3p3v {
+		compatible = "regulator-fixed";
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <3300000>;
+		regulator-name = "On-carrier 3V3";
+	};
+
 	sound {
 		compatible = "simple-audio-card";
 		simple-audio-card,bitclock-master = <&codec_dai>;

-- 
2.43.0

