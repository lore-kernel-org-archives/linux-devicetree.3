Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6142B3A6F16
	for <devicetree@vger.kernel.org>; Tue,  7 Apr 2026 08:26:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775550375; cv=none; b=DK08XA9mJThd4c5JCRB5NJCjAx6rYsZZ1bE2ewOPD9RzqbfNywerjaZ3MUTfl0MAjJyumTKQ/tjY+nkvxZAMoqne3oFnuSg9f5/Ok3ifulnUgFbHjUEaqEZfIM2kFghnSiHTwIj8rWNOGSxUqPh3L4xQzDSBfo8SXUijH3Em9lI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775550375; c=relaxed/simple;
	bh=KJIzry4A4nurV1BrjZIQd6f00tZQA/BJAngY3gGarwY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CZgccrLEnQaJIl+A/v20UZZDkMOJL1BM8EJKoADQX3rFOwnXqlohP7EXb+0nbUb8/24O5gpSquS62J74yDIWPI/MnaoI257NMLIEXKNrgPrN0vi5xg6L8CpMlMm4otK0N8miFlAgEKSeYajOSv3EvppOQUD7fSjjK64i6DALEV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L7F/kaEe; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L7F/kaEe"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-43b87970468so3702846f8f.3
        for <devicetree@vger.kernel.org>; Tue, 07 Apr 2026 01:26:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775550373; x=1776155173; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KR1DjVt7yf8BAFWkx8gfMXo+nWfoRdvH9vj0RlDPuXA=;
        b=L7F/kaEe5m64Iagz64rRExv9x0uTrL/aR5iFsS/oWJvFZ5bkc5BNVRPffwQJQHw6ep
         EsuZp32ZlLMtCmYI3Traza3OUzNLFdvtUP94XRrw7qgYayjixVZ+1mqGVYhUdF1FNoEU
         AqRkRu7jyDQWv6TxoOYG7ACQjWWxQUbp6unLrUMLiaVVw17J3lWpC3tq3cuVndcX4/Yk
         Yj/hS5D33qHaRwY+4Ty3/aj+JEQLDn9ZXLsgyRR58F/dMNAMcNA88WUr7779sLtS8fiV
         hoNWDKrrK72zh1VUl5sd893JR7/H8HdGeUIN1+IThKyrHejvEjoegb2xW1gF2YIiNsNg
         zM0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775550373; x=1776155173;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KR1DjVt7yf8BAFWkx8gfMXo+nWfoRdvH9vj0RlDPuXA=;
        b=DycNdD7JkiYTeunpYWzTx3nl9/VbNeiQGVUhSbiCvB88kXcWubldE3c7O8lTWcZSl7
         8pQDDykENDaU8waBCznJhC0R9rSxfZMOoMO1hVZ/bqx4UMec6FjQ1CzRm9WS2+G9IsNE
         ZTR9NxIBO6wD5otQdxtCscKC6b9yzddcFU1mI3dI/lH8Duxjur122xoziq7AXBHJsDih
         R7baOjKyF4Z+MXfxpz7Y+FOCVPoMq1KU9hGAZ9bi5NStMregcKmDOjtFkto28Bu1rOHI
         FUzdemPnGgzqnerX0BMY2QqNane9E7reGDspebuX6Ik4QfbdztvdUi6qyZD9GMxbhXGO
         9TpA==
X-Forwarded-Encrypted: i=1; AJvYcCVThao5RTQLFPT+kMEFGQEaoAEMh4C80MEOAfoKrOOVm9qIPXbY7p9uOfLq21A5e33u9a+kHnj9dDxo@vger.kernel.org
X-Gm-Message-State: AOJu0YxAdAXivzR3ra003gJK0rJEAaFdF/oZddz5pzoLzlBV/PmlvMO6
	Wym0Nb4w5noS0lFAFtKvwyxkRAwqFSsD3xnqKYPbDPXQKU9VEc+TrG9o
X-Gm-Gg: AeBDiev6Vtrd5E5bAD/w/bwBDHL3v2kSsAlhhFQEWkZJJ5K5Kx8Ka/yGQb0D+H8zPWr
	ViYwuQE6gdHwhpn7OPdrGQV8OJF7mK7KOMVYNEe39i56ubcPnvUfRUAYphw0D3ftKMf1VaaIFY+
	/UrDRdU+YHxQs+zIxmgxfzYiH2thTBtfME0T4QbSamQIWZS7YD0ljUS4uhiosEF4E/1o13WgLDq
	ov8EaRBbrnnCA6M5XZ9Y+sSg7wH0NW6D/qPiU/xSAEdPVYIzXRevrKxgWXAZNOs8R7WSG1jIkL6
	J5wwrzOTMkPaqUFkBMAyCqUlv6Pc48+Zp3jwdJjNWyYJJvkINfrNz1RMRlwRY3XY+AH7S1Ot3Sf
	ZNI/X2JFw6PRff2Teeco98skm0g0ge/G7Vf543076W21hHqi/FGGGukp/QRQS1QK/6Tq/8Sep6e
	5AGye7x+DuHMIMmCenAWTj02f/hKl2PoqI9N0p1XurxSf6iDbPaPYSewTmq3c2UchOBRM2NDZ1j
	Tk=
X-Received: by 2002:a05:6000:18a9:b0:439:c2b6:d5d8 with SMTP id ffacd0b85a97d-43d292db1b2mr22596880f8f.36.1775550372704;
        Tue, 07 Apr 2026 01:26:12 -0700 (PDT)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([67.218.239.37])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e4d29bbsm48669958f8f.21.2026.04.07.01.26.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 01:26:12 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Tue, 07 Apr 2026 10:25:27 +0200
Subject: [PATCH v6 7/9] riscv: dts: spacemit: k1-orangepi-rv2: add SD card
 support with UHS modes
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260407-orangepi-sd-card-uhs-v6-7-b5b8a1b2bfc8@gmail.com>
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
index 9c417a483f6bad6e60617cf8d5400ca079588726..95cfb4681ced8f539693717e718a3633c35989d5 100644
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

