Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97EA53A6EFC
	for <devicetree@vger.kernel.org>; Tue,  7 Apr 2026 08:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775550375; cv=none; b=QKWH/3V3joltLwptf+YQ/p3PUnhfFkgOE5h4OSFMDGpQvajkQF/no2MIypDWtAaa+NhSrKtCZ+JzVsutjGhoBhsNXsIqKheirtdXNzMdhHYBCYFkGIfiQUysFzq6wufb00jmP8yr1N9VuqwnddjpZeGLsRjrtQ4qAZFHyrKD3O0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775550375; c=relaxed/simple;
	bh=mH1spPeTCHz8roINYMnma7FI82vi0r8vKKTb06yrJYo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iQARmyQ/V+YseLq+LuxHGL9s4OtmuuCBuEALUgPf2GRtr+j2kFA79CeHbKdBkzZb/BmV3727AKMG0kVTKo0MSltuaHfTrPa/YWMfR9yyCmhupeYt8GSmXjaBNg239isb6jiaAPrgs3dT4GtI3gjxS61WrElYcS/iJTV1NvDGl0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V4QI29SF; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V4QI29SF"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-43cf5fbacc9so2251618f8f.1
        for <devicetree@vger.kernel.org>; Tue, 07 Apr 2026 01:26:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775550371; x=1776155171; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MilkKS52ju+/z2QrTRIvbE7nHZSA0fcfW7w+lU+2hFc=;
        b=V4QI29SFk1uzpQ7JvU9GYVVyOvC/8gjwaqaRttcTapoLEeojT4FSsh7KPLLtLmjHeh
         KfT1vj57p3aAG7hg4uslDg2tPjjBxT/osppeGJD+NKdBdcfP3TXi7I0pCpopzZb/9tKM
         EAX6/aLDdDIlAAnTge/FwROFXfgqvj5OPqKFxM/+9Ssh/z1OrqOhgReatJhBdDGaSiwm
         ScAZXIRziyMWHhS279ZNxw9hS57e6eyVaLcpxbOasiR9EdDhJUQnwZP0+i0DILQCMd2j
         qLgkrIQqC4ksiH6B3IyOoyJ//CFfMfZRDErksIvYBWExVRw4xYJzewTWR/3x6EC85+J2
         D5/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775550371; x=1776155171;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MilkKS52ju+/z2QrTRIvbE7nHZSA0fcfW7w+lU+2hFc=;
        b=j/P7jtdkW1jUPpkG6p7n+xqOTA3voowJ6DGkNQKxARi08jit3Ecqol5b78aQmrKWBJ
         Sm8HVrMXrX9N2Mdo91Ong6mcC/zJ+zPPJGawpQK5SkxxxdnrOgVkZqj73Ot0P2bDv9zk
         Q8vHvKUrF8Uda+kwGmULLaceFy34W/9O95r8jYeKUL4MWuf7mlN/YCxFWoloTPbelev+
         7y82f2eNy7ZjzkG/4akDgUgQLHth6UEQPqkQu5ERTkn4f7UCrfAwP99s0xk1UlWPYpUZ
         gFxWzBsBlziyKy99I3FsHTbHKt2Qxf9Nq5HgNrsPhJwtjmWG6UaMS72znc2EzvvGIQQG
         ykng==
X-Forwarded-Encrypted: i=1; AJvYcCWsciHB+quVHQxSpsRt3cnHRFygqfOHJN7Q0n+3PrWF4mXm4d5U7KnYIjKyteA6wf0oakAtFYENHvFN@vger.kernel.org
X-Gm-Message-State: AOJu0Ywdl3RiaSPDnh8d+92DiBW9I4U834vNFp6CzyWCZFxUs99juC5K
	xsNnuDbVW/pgloqUlzEsJzpnyC7/C8B3A/DIZ3/gBggwPgfz/JXU/eGA
X-Gm-Gg: AeBDiet6SvkHr8GkoJqDjFKFBio+GNvPFaiT0Efep43IBiQhzRIuvzDIGGfyunkeVo9
	KhOtwh/TpA79fAwSoF5phTnORF2jopYwk0syPDt0bWFq3+jXC5R11spNK/j8zX99TR4sSW0DgiZ
	qxQBxFVXUSj2mxn5+MvCSZivBfa09ueWSp5IAJ7XAnfHiDdiRjsRsjCwIVZBIjhJJiuowLwuQSk
	0J1YemwFGNmfuoFHmoO9MOTVP3sqCR+AsJQgNGj9dTa+7Av4us6FrxLnO0yu4s0dgC9dQ39LtVX
	WXOip44qafGiOpOuFokV9Gb+NErdRKOXP5dStVMmogfLbR71Ud2/hy3FlYFsALxDlE1PffzAJv3
	wYEdZ8M0lVliDKyJlosvx5kUXeMdPvYyn9FjvZWc+pWrdvJ6tTnGpTDLKkPyjgAdtqLPEp8wbvY
	fln/nZNgJtRZ2687hJLtjomomO5xt5h01GV8GcwA9KsBCqgQCkAPX7+IuKQlNjCCxk
X-Received: by 2002:a5d:5d0a:0:b0:43c:fac5:d382 with SMTP id ffacd0b85a97d-43d2118dc50mr29229253f8f.12.1775550370963;
        Tue, 07 Apr 2026 01:26:10 -0700 (PDT)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([67.218.239.37])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e4d29bbsm48669958f8f.21.2026.04.07.01.26.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 01:26:10 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Tue, 07 Apr 2026 10:25:26 +0200
Subject: [PATCH v6 6/9] riscv: dts: spacemit: k1-orangepi-rv2: add PMIC and
 power infrastructure
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260407-orangepi-sd-card-uhs-v6-6-b5b8a1b2bfc8@gmail.com>
References: <20260407-orangepi-sd-card-uhs-v6-0-b5b8a1b2bfc8@gmail.com>
In-Reply-To: <20260407-orangepi-sd-card-uhs-v6-0-b5b8a1b2bfc8@gmail.com>
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
 Trevor Gamblin <tgamblin@baylibre.com>
X-Mailer: b4 0.14.2

Add Spacemit P1 PMIC configuration and board power infrastructure for
voltage regulation support.

- Add board power regulators (5V input, 4V rail)
- Enable I2C8 for PMIC communication
- Configure PMIC with buck4 (vmmc) and aldo1 (vqmmc) regulators
- Set up regulator constraints for SD card operation

Tested-by: Anand Moon <linux.amoon@gmail.com>
Tested-by: Trevor Gamblin <tgamblin@baylibre.com>
Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
---
 arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts | 48 ++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
index 7b7331cb3c726f11d597f81917f3a3f5fc21e1b9..9c417a483f6bad6e60617cf8d5400ca079588726 100644
--- a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
@@ -19,6 +19,25 @@ aliases {
 		ethernet1 = &eth1;
 	};
 
+	reg_dc_in: dc-in-5v {
+		compatible = "regulator-fixed";
+		regulator-name = "dc_in_5v";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
+	reg_vcc_4v: vcc-4v {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc_4v";
+		regulator-min-microvolt = <4000000>;
+		regulator-max-microvolt = <4000000>;
+		regulator-boot-on;
+		regulator-always-on;
+		vin-supply = <&reg_dc_in>;
+	};
+
 	chosen {
 		stdout-path = "serial0";
 	};
@@ -92,3 +111,32 @@ &uart0 {
 	pinctrl-0 = <&uart0_2_cfg>;
 	status = "okay";
 };
+
+&i2c8 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c8_cfg>;
+	status = "okay";
+
+	pmic@41 {
+		compatible = "spacemit,p1";
+		reg = <0x41>;
+		interrupts = <64>;
+		vin-supply = <&reg_vcc_4v>;
+
+		regulators {
+			buck4: buck4 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-ramp-delay = <5000>;
+				regulator-always-on;
+			};
+
+			aldo1: aldo1 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+		};
+	};
+};

-- 
2.53.0

