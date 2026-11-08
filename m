Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794166181;
	b=4O36BzhbQDm8s/7g0mtkxdn3kGhp3M7gIsvjH6CgUbC/LYDUle8weK8jXUnn8ubWhwey
	 2A2rkmeKDdWM2RS0x2rL4v4bc6TaxdybU3SgJ2MMvIgBnqIUXSepuV19jKR5OIgM5Kc1f
	 vkxpRLvHXOYpHUzx8nCA3fgSOogND/cVNamXGKXfHJ+3B0GVjj6gO29YT6jQrXfT55VpR
	 eJtNWh/qyzYm8aVBlpPBXWyLTq8Gv9e9J3/R34juEkzW8Wph0xAGCYnuN35Lvesg+8BQh
	 RUTIZ+VRcAIu/m2gf7Wmfl5SfnSGvwd1MiYhju/M/JGpJU+35pE8hNBjNYR0e/Iujkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794166181;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=G84wSK0nUUfLUVTY4c0GD6hajZc/iWKJjasXJCCFPjQ=;
	b=yOEV6CaAQimLFkboQBWNS2jJOaIaE7KuiK3iiIcNwRdJQijCHUBxqB3yf6gV0YYIDZZf
	 KI2FeGKEBvkmRTXrL+M8AZjJEGqyKnA5aa/SF6Nzsts3ZyRJB0L+x7sWpwG7upG2oVnfE
	 PM12RA2PyI4W9EuC41v7T0bVeM0gfrELg2vbdjj//HEeec05sxK82icialXNNdxAwZmgO
	 Z12UUo/T1LNR5lJfSBTUnC+cRl81a9JlAQuGkNGX3nceXL+EDjN+RFDyumgxYfE/9oSmS
	 nVUUfmfZkYl0OWOtYvx3InH/5HLgQUy58kJmmHwtWA5Si9DdoKqi3bHiw08P10CDKfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=diMutTdP;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E06C606A332
	for <devicetree@vger.kernel.org>; Sun,  8 Nov 2026 19:29:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E06C606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=diMutTdP
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-372cba0ecf9so17632eec.2
        for <devicetree@vger.kernel.org>; Sun, 08 Nov 2026 11:29:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794166180; x=1794770980; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G84wSK0nUUfLUVTY4c0GD6hajZc/iWKJjasXJCCFPjQ=;
        b=diMutTdPzaIdRwJ1lWztRLVLO88l0kujylEJez32p0TfnqNlWN7/HJxPLwLGXHRYbT
         srqdJWx53HEudaAU7kQrTSzCfV/mHA7UeHoLuXaNSAtlsKC7sit3owrJxb77c4bJAXvA
         6dRwXOOWMkh0Z2h702h9labUVhgtf+b/gG1Tr7FSxJf81hFOSWRE7E4xTTYkgkFPpIOi
         48z0jVxL8KIw6ofH+s+l0FxocWKkczvwjpgPmI/IVj3M6zOkUmZXavmyADvkKyPBYH+p
         A7OtHCIhSaN+USc1Fp+mcACnw5SZ9azFn9z5JfYqv+J6yEUi6lngPJBuyYT3z79xIRzA
         Tfdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794166180; x=1794770980;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G84wSK0nUUfLUVTY4c0GD6hajZc/iWKJjasXJCCFPjQ=;
        b=Ad4UmpgHeDmdLLS+j86yalj/kRB5G0jGbgMlW/SoLpTUW+oQH39au0kNoh4dm7o++j
         o6hZmvJCut6pUpjJloTGFcT1qSGVQ3xeA9519yvwelP/EK4kRg7tK6BMfNIazXD+7SPi
         Kg9rZmi1RIM8p+asYpuKgyt8lLnC+psLvz90jWtdC7ckiIrDztwGeVcQ9JxYjGqVanET
         CHBy4yBUPVFO7XOiydUSEu99y68IFY31dxHMVtjKl9BeI1eYLkpvRGYk7jmnKA1d6/3T
         u0gNu01FDzBE7M0wwwb5VgF6v+O7SHIuzFVcGIcUM67Zvz3HMcBSAK2szv8Nj8UjWbLw
         rmRg==
X-Gm-Message-State: APuU4Z9/W3BBDtLg9MD1knUEG8yfkSOg9AV/0NK4+edDiYytGncQ9geR
	EAOpOucfvbxUbwbtohdqXhBbxxQ1PmNN5vga639nYbIXA7dy92f0YKVh
X-Gm-Gg: AYBFou2vPXQY8C3tOaUo3F01NkP1NsfIVcRIYtiBtwyPlnT8+ITQcYIglNtbYGP3L+2
	oJmKI1foTUooBGoQCL2141tF983KknI/dRoW6zCM7kS9JS6CFoOE/m6pahEw/L6ODNUyzRRwQhD
	wex54EjMwJIETGf+Qozu0Pelo+v6o4+0vOfEGLdUiN6A49DHRmU4ypb+EFv8DGe0d3hIdDtS3x2
	7jcf+og2q5lvjA0hmeNEaxocFRiE9rEZxljX4HErEzADTrN/U8Tl6OD/rsJ/BbOQERE71aRvgl1
	1FQlPtZgsOpkK/OouACcMNTIC2aHx1qJDlrQ0C/xrIfLj5XxPRqs4D4e02kAEljosNH+g3yrf/n
	QrHjz3tl9I0y4Yu1w7bKSjfGMEEkCvi0NK7Qt7Nl6gJcbcCiUbqHGOntqyd0N70mpwl/1REwJlc
	lWZxPsO6GLJk1+PPC2tmQsDZKwJnE4VvE+tm8x7nkZKy01kNT7m8kPalC1aCKp3e/GJ7v9HlYRU
	+fezJJNWrtfhyYOkXlfFDf3+d4IMUDJ0cQro5cYYdzytDgLC+gbyuWQ6hHIfAm5UCFOGerkjOLR
	hFlJxvu4r2zE+iac1adEzKNdAREL1dupVaqCUtZcdh/4xl3EVspMg7x/NITk
X-Received: by 2002:a05:7022:7f0b:b0:147:d430:7322 with SMTP id a92af1059eb24-1b39fe73395mr4649246c88.1.1794166179643;
        Sun, 08 Nov 2026 11:29:39 -0800 (PST)
Received: from [192.168.1.11] ([2401:4900:881e:93af:b6d8:a723:b13b:3c1b])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3755eb6efsm8800387c88.4.2026.11.08.11.29.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 11:29:38 -0800 (PST)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Mon, 09 Nov 2026 00:59:17 +0530
Subject: [PATCH v2 1/2] ARM: dts: omap36xx: Add unit address to ABB
 regulator node
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
Message-Id: <20261109-ti-l3-noc-v2-1-509e8485a1f3@gmail.com>
References: <20261109-ti-l3-noc-v2-0-509e8485a1f3@gmail.com>
In-Reply-To: <20261109-ti-l3-noc-v2-0-509e8485a1f3@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Santosh Shilimkar <santosh.shilimkar@ti.com>, 
 Sricharan R <r.sricharan@ti.com>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 goledhruva@gmail.com, m-chawdhry@ti.com, daniel.baluta@gmail.com, 
 simona.toaca@nxp.com, j.bhargav.u@gmail.com, linux-omap@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794166167; l=884;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=mRJd2FscObSZq+5xKtM7LxfhPVQc620l8Gz6i2pWC0w=;
 b=TFOH4hkxM3D01wuR6L6Kuij4EhR1doZYnCWknkMwEvOXQXqR2Xw4A/iEi0VoxsMIDTuZfEQK0
 B89GT6/5jwlA6EA6BspnldEkt9laFNj8tzSyfMhmgkj5HCm6tLrKqeG
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=

The ti,abb-v1 node abb_mpu_iva has a reg property but no unit address,
which violates the devicetree rule that the unit address must match
the first reg entry.

Add unit address to the ABB node in omap3.

Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
 arch/arm/boot/dts/ti/omap/omap36xx.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/ti/omap/omap36xx.dtsi b/arch/arm/boot/dts/ti/omap/omap36xx.dtsi
index c217094b50abc..6df66eb7e7eeb 100644
--- a/arch/arm/boot/dts/ti/omap/omap36xx.dtsi
+++ b/arch/arm/boot/dts/ti/omap/omap36xx.dtsi
@@ -92,7 +92,7 @@ uart4: serial@49042000 {
 			clock-frequency = <48000000>;
 		};
 
-		abb_mpu_iva: regulator-abb-mpu {
+		abb_mpu_iva: regulator-abb-mpu@483072f0 {
 			compatible = "ti,abb-v1";
 			regulator-name = "abb_mpu_iva";
 			#address-cells = <0>;

-- 
2.56.0

