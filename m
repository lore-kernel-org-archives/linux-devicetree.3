Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793818191;
	b=ZCQgEcTAaFrtwyoBdPLjN1WTINauDDbfBeevXu/EWSoFDFdii5MYVvocQPRvkb45AJFP
	 bJbzsjC134rjuF9imYGdDL4gyMi9sJ1S8wrHftGEZOnphHZEDfmcpMRv9fZF46Kr4sn/t
	 ku2y35K2zHeHc6v7u35HjkC8OYBo6/E/RuX3IjLx4LogjCZj2QePK9oOMaeVpY1NpvXyS
	 kWQlhY7WmyY4MNnZdnb1zIaLqTfFLMqnGva7BDwj0F9WqeSS6SkLWhvcdMHlj3lcIN+yO
	 A+P0Lc3Fjp+kjeK00ame4VUpNRuiwOwBG6tVLtsa+3OXn+BIE6qMJZLRKjFvYTASsog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793818191;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=XM+1MxKuYOPT02jOfzOilpXq5XRcgJkWhammrA4i8L8=;
	b=N6vkf4OPf0slMp6pTH6yyXS6oAJNpWNvH6smCfFHxmbxaItp4cKjQRpMuu1esQlZRJvr
	 MyNKrFB7aalTZ3lY4Lv+gTo0nDjtx8L4UTwUHQynfKnQV/UXYVnK5L47dgpkp5jbiH6+2
	 FjaBe6xBJ5yxDdanCP3ilv066VFOILVdmXapoHcske7BH5zdvEwpZtHHBpVSzxJx7WhBP
	 +VBVThlMw8fgkvp3Yw77OF0oLSFBV/IC95r1jew184UB/1/v2NTGBf0MdepybT0/XMFaa
	 xS3R8V734WV9Pv6CWWaQNqIryKlRw+edHK6fBa7VQbi6VvQboTwBZTGgYn03FdXQufA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=05pD6O3R;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 615FB60A2629
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 18:49:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 615FB60A2629
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=05pD6O3R
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a2d6d01ecbso6608655e9.0
        for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 10:49:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793818190; x=1794422990; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XM+1MxKuYOPT02jOfzOilpXq5XRcgJkWhammrA4i8L8=;
        b=05pD6O3RiElyTExOgex5tBJahBNwds0FfURJpsi1kmuICtcOLYBDz3wa+JFtc1hDrI
         0MHhG7pa2vP1lbLCqBHlISreOChjl6YOC3gTpIO2882NRGPle8rhtOHso6A5JkrhxB8F
         B1Oz1dqao52CZ+rJFqfvEOvwiG0AfIrgR0UXUF3YQoIHu/c8LGSJ6chwkZkkjz8gxK0K
         ExHJZKBTV4oUi7OUvFlPzngpkuSCoI+VCp7AeF9RK3GnD0FMwJfn5HRM3kGi3UroUvGN
         awrZvJUgLZoDh+cdNceOjHNesxiPer1DXcQyaZXug9ZYDfIcBOYIicLBdpQJOu/EKtvC
         iU4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793818190; x=1794422990;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XM+1MxKuYOPT02jOfzOilpXq5XRcgJkWhammrA4i8L8=;
        b=nTeZeQhPvhLwUq9XwEGv1uQrn9Rh4Z3IPAYG2IxT1K7rN+QF24Cn0d0sP1I+q/3Hic
         jTjsQZsw9dZZLsK1wkzKlrNaGAwiVGVutvG/9FbEEv+/FeX8g7y1xoA4XYH2upVOZMvK
         Hp9ILKJuRHyMtAdSKbem/JLRCRAHsF/JLoDYyf2re6OUVxXogJ9t+PzlNXo6ITLHf8zd
         d2AT2dfsinbSS7GMQi4oKmBunLgP2i05lJP7SDlVFsrtr6JCjwzwegwLj2VNp9R+B0ap
         S/kAh8VXGyHOFDKOJeExVBq2OnfLDFWi+uHNN8mdnoOaWfSe0OtAjo9QoVcosGgDTcEU
         gtZg==
X-Gm-Message-State: APuU4Z++pgUly3X4GaFpQxSrX3JmgoheRC49ALDlSuyjtIreQ3j4bD8A
	Vo5MB8mYGXfvM9vNYWDPsN+RWVVdPMKk/HHxYOMX0FYgxXydx4Aqjmc4
X-Gm-Gg: AYBFou3MGvpB8SHfA3PE5qVVAYTJAR0UOC7CIK2GbKAfQOwjA0ewx6Ra8qqJ/W+yHLu
	XnkJOH6LBlCGTdna43iTVOGnWvl21lvHP2CKTiiWr69Gr1dIRvLFwMOtPpkD4JOG95w1aVf4egP
	ph+CaIwTT6lELVCRegbVsLAGYauzn9jDcOXLhbwU9C19twaTA9BSVkbn3qkd7NAU4hT1HbszW8L
	bwGOMKPe1BEf1rroDewUR2tFl2cxkHpuwdgYLENve/AiOmG+tjbanbABhbve1V/z9NomyLV80Ac
	G41uZgIspJVm2g9YXia14kE279czHFsYdJ2nh8xWY3PgnfgCp9drsljHHI6sY6Fi34rjdZW7RnL
	gWoBUZ9aixvq6Lzno2iVFy4i9jOVMpTbBifCqBct7OSQCMZHMLZ9dkoKjifHGY8M+0HGJ5q4wlK
	bzFCI0cylchecuUZYF+iE0MC6piysFa+GOJd02vI87WgS+c6Pz1vthZeeAlwIKLv3rR7AkiIx4N
	JMdpzzRU7fycGOR6tRnb4Qz0sO1S5pgrHByzhpsV2dIdpMOPOll18575n13pf11heqA7a3EstF2
	1PDlBRt0XzGQH3Jky4aEpIaRVeUwjU8PR+YpuidyPzJbIwP9bJ3Yj6OoI/9IcN3Jhx3BEsS8YuH
	VdEKkOLYwloVg9ENr5Mtnw4dF/THGYNAb9fI6p2g05ra9GRPnqZgkTNSBcRUcnu27LH69Q7bnhB
	ADCkjOjWGocudfmPbMJUnxyi0fXTXdMaQLNxaycY77wpAhTbqOBUdcA6XNvm/BT2qvn0ViC8uNa
	sde+bsit/ZdSUxMeBRLA2fb+LZ2TLd8bihIqYNb5VUC
X-Received: by 2002:a05:600c:3b09:b0:4b1:4017:c4f4 with SMTP id 5b1f17b1804b1-4b14017c507mr197486915e9.20.1793818189742;
        Wed, 04 Nov 2026 10:49:49 -0800 (PST)
Received: from jernej-laptop (APN-122-103-30-gprs.simobil.net. [46.122.103.30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b56fca22e1sm5081745e9.14.2026.11.04.10.49.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 10:49:48 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 2/2] arm64: dts: allwinner: h6: orangepi: Enable CPU frequency scaling
Date: Wed,  4 Nov 2026 19:49:40 +0100
Message-ID: <20261104184940.882833-3-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261104184940.882833-1-jernej.skrabec@gmail.com>
References: <20261104184940.882833-1-jernej.skrabec@gmail.com>
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

The Orange Pi One Plus and Lite2 lack the CPU OPP table and CPU supply,
so the CPU never scales its frequency. Add both, like on Orange Pi 3.
OPPs above the regulator constraints stay unused.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi
index 2948369cd659..b7351b1db97c 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi
@@ -5,6 +5,7 @@
 /dts-v1/;
 
 #include "sun50i-h6.dtsi"
+#include "sun50i-h6-cpu-opp.dtsi"
 #include "sun50i-h6-gpu-opp.dtsi"
 
 #include <dt-bindings/gpio/gpio.h>
@@ -65,6 +66,10 @@ reg_vcc5v: vcc5v {
 	};
 };
 
+&cpu0 {
+	cpu-supply = <&reg_dcdca>;
+};
+
 &de {
 	status = "okay";
 };
-- 
2.43.0

