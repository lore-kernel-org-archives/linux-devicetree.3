Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E54A3A6EF7
	for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 08:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776067372; cv=none; b=A8kbEhw5j4UCVJlwuxGSmNukYXQvmXPDv2fJp3RqG7Yf0jhuuJH0OEsM0tB5KLSbDm8ESjl8UsqJhJXlrXOEKIipXwbBEO0iQMM396YJxRxW4YR+agfQ7ApdrknjEI+TjOp52x2NXzyaxvUVsnjYvMSBFOhtmKdjEd4cXPjUVyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776067372; c=relaxed/simple;
	bh=1HbIW6/OtwG0nzFhm8AN7DBXkGaNxAyxn8jiZchQifc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jXW95GPGIe6J0DEaen701atUDimaeRATeaSQ0vzK5C4uC0ae7NH5FvDabotWe8DZrFclYevQaUfw64XFeiwd/XORb5kzb/PQlFoxBD3rLmebyJMByBiaXmG6FmDL6sYk1Sgt/mhMfVazbJ7ZQ3YXSd9BLj5DPWqIAIB/o09hdeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=apKxG8du; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="apKxG8du"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b9c745e18a0so471201966b.1
        for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 01:02:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776067369; x=1776672169; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jgUUdQtr/fVKD3Ff4J9UbF4I4wxaToLEFfaMYOrzMgY=;
        b=apKxG8dua0+Xga190aQvovpy84ZW1N7XuS0EZ9F64/AMHegbb4oFTKbX69WS7D5mn7
         6Vd76Xt+CXqH4cj+U5N61mECmrCXXZgZ6f8ZtwdUHYpv25ckeFwqDIVNFw4foU2dakXY
         u5ZxpNYFbUSGeSEiMOsae5UmPboCydpU+emSThEor0ezhcigZ2Ia5FELCtHOYWUQbi72
         XXmdwrKjDkoiVB1o99EaM+NgEWK1+D84S/4U5fgN2//YJEGdTK72I8td682Gx7veJ5wk
         8HsdCWjlO1rOO00KBVGd20WSKAcaypoIT1Zt4oKr19tuiBHgcwu7vG8WKspQQPQkMd94
         UbHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776067369; x=1776672169;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jgUUdQtr/fVKD3Ff4J9UbF4I4wxaToLEFfaMYOrzMgY=;
        b=aPL0rC4+tifUWYvaKQJNBFOU6idmZ1PSQH52rMS7BSNZnr6Ns1W+M3iQ2YYN5QUHUZ
         sy8h6Ck/iF24S/fxeresYUJzvVyaOPHTZtgV/juHAM+/1F6kgsWEAgAWIS7tBGtbE2r+
         2QeY0EPWBBD3uGmtiQE+qP2wP81Tyvsdt9IHFiLJNIMSyAEnH03L1nZS+Qzspu4w6FLc
         bK281FKTdKrwGfDNtB0oGvwFnCId31XVr5eOjzVW89tZmLQrtRmsQrV4mIDy2iY06TL2
         53DiBn73sckDTlpFXhQ5cItFCNFW2gmYQO3zdTBPRAS7IOxf1yQl1mWfBy4WY3sUqZS1
         JTlA==
X-Forwarded-Encrypted: i=1; AJvYcCV69Ius6LuhfGTaoXIXcg4D5ozH0kr8uLQHPgtWlZWUtejf6FjJDuv0hWXR6mqnYwFRKB+7YXAKsAty@vger.kernel.org
X-Gm-Message-State: AOJu0YxcxGiIXvcW3TnDD1n8hHWePLUP/+/PQcp6HHtZ+mmCdyge1vRQ
	4+5vUjd0I9m8eRxOv0PYmZtyY81tXozKd31Ly5o4ajPjmgX6XNd+iEHA
X-Gm-Gg: AeBDieuNwjKpezMBTOItoABGH1XZAKaT9SZW6ZeOz51DuOBj1SwFcdzx83RuvpuUwNA
	uXa+MnT+zuibkEi2fB91c6Tm8WT4SH9tFWcxJQe6gmPR70Gdxop3QwdDqKeDGR+k8UY7pQD+jc8
	CtaEQwbx5etCmJLpqaYra45wIhOop+AXR8cIYubHuj05BAF4TgkiqvL/redBUOVF3vWLVub7ovD
	3DvPhh5DMCPly/ZAALMT9oREuURDu+/fsjxOfi85NYYKIcljlnwtRbzhhh4r2R/t1LLFog0v50/
	w+n6BXkcg03Cdpe+ye7fEYYVnp5hhUjlMYa0x8kui99O9EdIshv9dlRZuJtMh53C6M5I/KRpBhg
	DXH/dJyU/XijrNMzIo3DTKLg5qaxvEic8KcFn1tlSIe/6HbabSPmpWzP01xALrvp3GDS54JH8a5
	ReFlu6q+T9kC9gtsCO78HS25l8hwRRIrIjEz4laEAWT5pGVvSZDVWEZtDTUef8s43buS+YfyMgL
	rw=
X-Received: by 2002:a17:907:60cf:b0:b98:8494:3174 with SMTP id a640c23a62f3a-b9d46265d98mr798014566b.24.1776067368357;
        Mon, 13 Apr 2026 01:02:48 -0700 (PDT)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([67.218.239.37])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63e5c981sm32155932f8f.33.2026.04.13.01.02.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 01:02:47 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Mon, 13 Apr 2026 10:02:16 +0200
Subject: [PATCH v8 7/9] riscv: dts: spacemit: k1-orangepi-rv2: add SD card
 support with UHS modes
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260413-orangepi-sd-card-uhs-v8-7-c21c40ec16d0@gmail.com>
References: <20260413-orangepi-sd-card-uhs-v8-0-c21c40ec16d0@gmail.com>
In-Reply-To: <20260413-orangepi-sd-card-uhs-v8-0-c21c40ec16d0@gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Yixun Lan <dlan@kernel.org>, Yixun Lan <dlan@kernel.org>
Cc: Troy Mitchell <troy.mitchell@linux.dev>, 
 Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
 Javier Martinez Canillas <javierm@redhat.com>, linux-mmc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Iker Pedrosa <ikerpedrosam@gmail.com>, Anand Moon <linux.amoon@gmail.com>, 
 Trevor Gamblin <tgamblin@baylibre.com>, Vincent Legoll <legoll@online.fr>
X-Mailer: b4 0.14.3

Add complete SD card controller support with UHS high-speed modes.

- Enable sdhci0 controller with 4-bit bus width
- Configure card detect GPIO with inversion
- Connect vmmc-supply to buck4 for 3.3V card power
- Connect vqmmc-supply to aldo1 for 1.8V/3.3V I/O switching
- Add dual pinctrl states for voltage-dependent pin configuration
- Support UHS-I SDR25, SDR50, and SDR104 modes

This enables full SD card functionality including high-speed UHS modes
for improved performance.

Tested-by: Anand Moon <linux.amoon@gmail.com>
Tested-by: Trevor Gamblin <tgamblin@baylibre.com>
Tested-by: Michael Opdenacker <michael.opdenacker@rootcommit.com>
Tested-by: Vincent Legoll <legoll@online.fr>
Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
---
 arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
index 9c417a483f6b..95cfb4681ced 100644
--- a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
@@ -140,3 +140,22 @@ aldo1: aldo1 {
 		};
 	};
 };
+
+&sdhci0 {
+	pinctrl-names = "default", "uhs";
+	pinctrl-0 = <&mmc1_cfg>;
+	pinctrl-1 = <&mmc1_uhs_cfg>;
+	bus-width = <4>;
+	cd-gpios = <&gpio K1_GPIO(80) GPIO_ACTIVE_HIGH>;
+	cd-inverted;
+	no-mmc;
+	no-sdio;
+	disable-wp;
+	cap-sd-highspeed;
+	vmmc-supply = <&buck4>;
+	vqmmc-supply = <&aldo1>;
+	sd-uhs-sdr25;
+	sd-uhs-sdr50;
+	sd-uhs-sdr104;
+	status = "okay";
+};

-- 
2.53.0

