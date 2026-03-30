Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28ED73B3BF1
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 08:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774859919; cv=none; b=Nzkh8CakxTJu2Jsbpajf8QmerufeM6ZLpWy+BADuXIqC/vqFR8beqac/lpizgU0bTP31VltbR5Ck1nfCsgzp72Vsftf/qXWnuF/SR8LmWFt2lkc+IApxJ+fStIwNrdtfVVLzhGS306OJjbTOjKvA1tDSydAstHobPak5onxdP5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774859919; c=relaxed/simple;
	bh=0EFZ53q2XAEQCbsr9UzobauZinI9NCe/+PQ0fxu05PM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NYXQZNsDVwDJCDLVP9TT/Sl99FPZ4WqC8DOYKrx4Uon49fsLfctRCXaL5gQsMyGxYfxKCODRxnMDNngbsMphmT5EtJx+/qx/30bRXgSZDZgYxvVw9wNZVNtz3SmyKFbsZS2J+xi1AwCatC7Km+3oCMFq8TIyqDzUVge5pe8LSiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dnMcNEiF; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dnMcNEiF"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-483487335c2so44271105e9.2
        for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 01:38:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774859916; x=1775464716; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1LbwR62Ox4pP35TzcC1/kMlb8rYdhZytDukagY2Rkq4=;
        b=dnMcNEiFeYrIQil/90dVJ2OKaDAY5lqJiAhtTrAjNq4i5SkOn8H+Izj7JNnTJl6nRA
         NE7ludU0HQyEr/Djbzrp60tfXFJR5v6Z87WwmUOooftBHt97U38w9bk1l4I9cB7MQcug
         G+UDGzsHzyUAp/rb6rvzn2ON9z4To7kjfidEIP8cBOe7kwO/A24syOHPoCLVLmerohJo
         IiV6zZkBOd+pQ114/ECIgXSl4n5LwBZxJJ7RAotTGuT43hhX7Vox3J81DpysEaJoTNaF
         vPvH3b53Z7kliIhtoFnpfs/7g8w7yPE3orx6KnKCOinPywzHPIo/JHihGeyho0YGwgHF
         GKCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774859916; x=1775464716;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1LbwR62Ox4pP35TzcC1/kMlb8rYdhZytDukagY2Rkq4=;
        b=iskB1BfUxdChKzBCslj6py1vfUSlAiHYHpcF8gb3tcRJPdSZ7h0uXe/rzlwalNyGSZ
         k88miB0uggHk1Qo/dgNftv/DDkzMTfw0z8wGZCAhd7YVK54AcXjdVl4GAq9d2R8cN44p
         9wZXdT9R2QbqpiVp5FDiXShAPG9yIZgaWYr/gl9c/7Qaa1HhsbNO1F66JnowdvOjAiS2
         C4wS1u9b3s0a+WFg39oC7MtDQ7hR847k5xWqXJBRMFFFPN7c7a8xiOnaTY8hJD6DpxFj
         zQkazQYHd2sskq9+AK6nhheUex8PojCZB2HFmPKoW0sQFHGz9DFHTSo2KwtIlAjmk6B4
         VUMw==
X-Forwarded-Encrypted: i=1; AJvYcCXJ5Y2RJC5vXh5OtJ193cx9RsU8pOkSzyE/trE2r1/Pnj7sv1HF3ptimIP+F0vS+JdSYRnVERTtHknI@vger.kernel.org
X-Gm-Message-State: AOJu0YxAABpihvaevdtGLKOkjjrpLj0jsSKgjEmTOHuK2iuZqol/lsOO
	k59fpaiX8zLwvCaC5AzDzFOVYCv37o7/ylvz00yV8wUvBoEBTCLV3PQA
X-Gm-Gg: ATEYQzx+1BEdC5msLDS1z8/oAPhD5ULfvZc97JJ6kyRa/rrI+KhpujuoWwetuz+jSpx
	Udrfr3VHuuunO73PmdWJjFFD5DAkZEEIr/57qN6wsXVEIQfzDCE15AB2FwmXFMkV6WDF01O0BNT
	rqVfRp/D8W+CWeoHuj89GSEK2/+58yt8LPW9IFYVKzO27gjvyjf9N+cGPQkC4Z2yWjRmgPp+FLr
	f2gCXn7n913eCMe+tiEysRv/bzkkC+Rq8fk6bnc6gMRG1i9VngiVCqc9BUnC09Zb1Mdi6x8uPCq
	wG8w4GmVTpBYC8NZogtmRxWkdyojKNmY8PWabqqH1zLejNRc1BvI3f5I085ZkXpDx0lSPb6QeKW
	N/qbivpeYBnpMojkabHTwLmC3x9QRtPZ/S+iF8txHJNmrWznYLqY0+PhCniQaj9YVC7wdzZsj4C
	n5cyv35mX7vZ3h7Lr3HUVooXgwyx8EGdqsGHlXm8HMWdtWWxA1dQc9ATaBbk7iAe1v
X-Received: by 2002:a05:600c:5249:b0:487:386:3714 with SMTP id 5b1f17b1804b1-48727f7bb08mr213736895e9.17.1774859915529;
        Mon, 30 Mar 2026 01:38:35 -0700 (PDT)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([67.218.232.54])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4872712c236sm74063315e9.14.2026.03.30.01.38.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 01:38:35 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Mon, 30 Mar 2026 10:38:08 +0200
Subject: [PATCH v5 7/9] riscv: dts: spacemit: k1-orangepi-rv2: add SD card
 support with UHS modes
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260330-orangepi-sd-card-uhs-v5-7-bd853604322d@gmail.com>
References: <20260330-orangepi-sd-card-uhs-v5-0-bd853604322d@gmail.com>
In-Reply-To: <20260330-orangepi-sd-card-uhs-v5-0-bd853604322d@gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Yixun Lan <dlan@kernel.org>, Yixun Lan <dlan@kernel.org>
Cc: Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
 Javier Martinez Canillas <javierm@redhat.com>, linux-mmc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Iker Pedrosa <ikerpedrosam@gmail.com>, Anand Moon <linux.amoon@gmail.com>, 
 Trevor Gamblin <tgamblin@baylibre.com>
X-Mailer: b4 0.14.2

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
Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
---
 arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
index 9c417a483f6bad6e60617cf8d5400ca079588726..5f823611c969eb0e15546862228ae4f65375675a 100644
--- a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
@@ -140,3 +140,22 @@ aldo1: aldo1 {
 		};
 	};
 };
+
+&sdhci0 {
+	pinctrl-names = "default", "state_uhs";
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

