Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794815722;
	b=eme0dKezAdkKoQEqjbR1LT/C6LTw1djFrzxJiZKhL4stRyqg8+C2E7XapxVLSneW08m9
	 XR66qzxIEtGBGS0YJ/JSXiqBsBO3BEjHDFnmV2yTn/VU8tqVZ5J6wVIrvQToQV4nNvSep
	 41PCmNIa6N2uSd4CwLyHZJtoWp5yJgeFWsgHLtbGfHefdIMFPU41h1KE6bl5SNg02Vips
	 Bn1hGsVTixVtl6tFYUvEOUdw/Lt0PzeQLpDhnkJL7xsj0XHbpCB5EH6bBD49DzjGEnTTP
	 U2xhkxDnPSn1Nxm3abtseMXrz9Z3VPhwQmvCSEP9QtmMsgnTiu9A7aYNkkUYySOVfbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794815722;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Pssg71LWdCQxl/L7C/4N5Wwh5nUrjx9m06X46tmlYrA=;
	b=b5HcBc1MjK0qUVgrsafFZxXVxkXkWpc8o3vnFC4MT/lNnL/XSM6SN6GqYrFV1E71wYYy
	 fcPEeSaxXi2/nFTe1F45ct4nAAuou7osD0gtvRbxTdnHKG8dG3TDiW/QP/SGz5hy+7JaB
	 oU/cgjsbDmjpQehM8GtYscQwmnxWsiYBBHHhqFT+HvfQfdpaI/bU+tbQPMaqrlI12bbwR
	 POykNUjuH+0XP3z3TnGW5vJvbOzwBJvRN8VrLLYBkkrDQ7Fl+AcCX1gZaD77o5v/cjMoe
	 lh8k05goes2aLdMmOu7x7ixVo93HtlHQd0WE9Qn1gU61HmZNByOBlncFVIz75jWdgUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nR8K73r8;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ECB4606A32A
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 07:55:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0ECB4606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nR8K73r8
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-37f14feca60so970604eec.1
        for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 23:55:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794815720; x=1795420520; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Pssg71LWdCQxl/L7C/4N5Wwh5nUrjx9m06X46tmlYrA=;
        b=nR8K73r8vOcuWUhBEq64W9YSpUa+v/PRgUPwKyfQG1jvdduWSKsd8TFWcZSP8AmJwO
         DzTPGXMtQjjAxJQng3M/aE9AcguqMLs6MRhRGmOwXPiU83PMi3kBv2CUKtYa0AxKh9P1
         yn5tpIKaOLxzs+zpuBD6qXO6ratdv89JvDLMHvNW6Xsf/fMKt3c+ubA7gqFdN+4cc673
         ++MlPj5KbIVQltV7TU3FEjdn0I/NTXHiwA3XSol8mpn1qqI7JR2ssnko2xR6hHWFXdu5
         PXar660OPuNuRlOkJ0bNTpmhN6CEDPOcC4dDisYaEpbSWkVXIAGk7180sB90X3uKhTE5
         YNaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794815720; x=1795420520;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Pssg71LWdCQxl/L7C/4N5Wwh5nUrjx9m06X46tmlYrA=;
        b=C6KdkIYpzC+f0p5f6r0P+hXUaX7mA5rn9KdbiehfsCDItahg4USPEoDsVBhc2KzMCB
         C5lJ3tTK1j3K4kAAXuaZxzQCV2137Au96RWdoXmznQCzQ5QEYifiiv7pO+NcxzQqbrgw
         XtkowK/YrapBhgeX0hA3UM6X10SjK6MPjkxIZxPAjVHTHqI795zfhQ2AyfgvF0tXprCO
         AMLkVMk6ov9ukMTuitPFouuzOp6vUfYt2WhIcvjdmwCjyvqMaBrhNfiWx4P2ZRzQo/GN
         RifJgiplZ+eK6yii6it9Wt/q3RJmIjyBzG+ZjGy6vls780wD2QvsRTYSWfteRhaEsiFq
         ALYg==
X-Forwarded-Encrypted: i=1; AL+hErEviHIVDuLts9Wjn8+2TWaJv8kPsk9pUcYMPzil6l9i9WDwdivJ53dgmXd0jo0lAJLTpubfv4SZhido@vger.kernel.org
X-Gm-Message-State: APuU4Z9h5Et7ZZbSlS4u4O27P2ghPkFg7iMKuNSYKQ8yNh5DbnSw12Ji
	Okn3qjKJRFnB4GClqya3B6FbAJdipJZ/RSzswsaZWYeynvEs8C2oTqMS
X-Gm-Gg: AYBFou0DStmzZix5s28B55KMVe52YxAGOxGcbhgx+LTQOETjIMbXM1irjrsqN2p+aJd
	q8t3csfFJaAVacGyGUbx7Ik0uJ6efJHmmWqDcEEzJxT/G0JM2oiTcZC3Uc8bJLWvTmxFfRrGCEz
	SomUvhMZKrpOc7RZRihuDXEIadBW0bjSZLjFq5b2pbbaTFnjnv9RADxhq9LaeyiV9sb1GYPh9Mh
	NSCIh3vQ0Kw/dsKvFzrXDeMiAgsUlayGPJNQP/DEzWLz+0U7nVyYUUzvVTSMWkbyME/Ogxf5hCL
	ROFxUulOcnaHpGpF9CMt866+9LOPRHpFOlvUm1A77XLfr19m2JN6uJ45LDA/hmlFA7ZYaCxyYsW
	C9X2DVfjPdEwrwPSSaqvtiGnTpk/JGnigIkrSBUb0BKGPt2a2chJSWM/xYfptZeEXVP8jtHgukT
	YBErBkWAH5hiDZd72M46tmMMF+DkSHrb1bvlfch5wO6ibs5FBcfKL6W1FhBuXlODD2Umxmpj09H
	oUEw7ia6G+KBv1DeBebf+s98Y0HnWVXCFKwh/tdq83wMWOJDcQSxeA+l1pgAbvVBVx9jlLESxZw
	lAEP93E95T8+57L/VQMXqFMfVgNRTvQ6ldl4bXwJgCk5z/AoJVUm
X-Received: by 2002:a05:7300:cc83:b0:37f:79f1:1a1b with SMTP id 5a478bee46e88-37f79f11a78mr2072488eec.22.1794815720090;
        Sun, 15 Nov 2026 23:55:20 -0800 (PST)
Received: from duge-G3-3500.taila331c7.ts.net ([183.192.223.84])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955f02ff0sm31398803eec.16.2026.11.15.23.55.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 23:55:19 -0800 (PST)
From: Jiayu Du <duge1256@gmail.com>
To: srini@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dlan@kernel.org,
	troy.mitchell@linux.spacemit.com,
	me@ziyao.cc,
	aurelien@aurel32.net,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	p.zabel@pengutronix.de,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jiayu Du <duge1256@gmail.com>
Subject: [PATCH v2 3/3] riscv: dts: spacemit: Add K3 eFuse and temperature trim cells
Date: Mon, 16 Nov 2026 15:54:23 +0800
Message-ID: <20261116075423.1519438-4-duge1256@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261116075423.1519438-1-duge1256@gmail.com>
References: <20261116075423.1519438-1-duge1256@gmail.com>
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

Add the K3 eFuse controller with its AES_WTM clock and reset. Describe
fixed-layout cells for the temperature calibration parameters stored in
bank 0 and bank 7, using controller-relative offsets.

Signed-off-by: Jiayu Du <duge1256@gmail.com>
---
 arch/riscv/boot/dts/spacemit/k3.dtsi | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/spacemit/k3.dtsi
index e89d2cc5ca8c..b548f5029d59 100644
--- a/arch/riscv/boot/dts/spacemit/k3.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k3.dtsi
@@ -1439,6 +1439,29 @@ saplic: interrupt-controller@e0804000 {
 
 		/* sec_i2c3: 0xf0614000, not available from Linux */
 
+		efuse: efuse@f0702800 {
+			compatible = "spacemit,k3-efuse";
+			reg = <0x0 0xf0702800 0x0 0x400>;
+			clocks = <&syscon_apmu CLK_APMU_AES_WTM>;
+			resets = <&syscon_apmu RESET_APMU_AES_WTM>;
+
+			nvmem-layout {
+				compatible = "fixed-layout";
+				#address-cells = <1>;
+				#size-cells = <1>;
+
+				soc_rtemp_trim1: temperature-trim@120 {
+					reg = <0x120 0x1>;
+					bits = <0 8>;
+				};
+
+				soc_rtemp_trim: temperature-trim@19a {
+					reg = <0x19a 0x2>;
+					bits = <4 8>;
+				};
+			};
+		};
+
 		mimsic: interrupt-controller@f1000000 {
 			compatible = "spacemit,k3-imsics", "riscv,imsics";
 			reg = <0x0 0xf1000000 0x0 0x10000>;
-- 
2.43.0

