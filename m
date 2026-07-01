Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F5E648BD2E
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 12:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782909666; cv=none; b=NbrebJOFpHphuL34DrX9UWLQV8kzVFB6ZafUEpHndVFp0eaewNBlpJjKQG23BZkf202o4shmwvSe0viy33TcFnaiaMkrZD/M1qAslZYBYEcmz+e6Tqc+/eQoRloD0GHhVl+tg4ezqbyleboPPqo8nYsmgJn22+u9aC+3Z9lm16c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782909666; c=relaxed/simple;
	bh=vgTU6IpqehS35f26r2q57NqAGrF/RDXF3lubDqCB+Bg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PZq9pTvw70WCQTad25xMR6e+hGBr1BTyc1u8GZIXF39qCw19Nd25E5spHeQzgSOUxvkzh/Gow+gNfY7RKStQKl1OBFy7plmuf0xqRRHWOWqhRNZ2BYhPfrsimjK81P2Sc/In9kQ7eSkcbQxblpbBQ2X1CQ28XxZ7XQlepnhnuFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=TN1ZWTze; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="TN1ZWTze"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-476a130c138so623237f8f.0
        for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 05:41:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782909663; x=1783514463; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r7ceLvJFGDWzpb591woUgz7GBOYPJ1IlL6PiiR38W78=;
        b=TN1ZWTze2VHgBIj9VQJl1YyqSOGHdQoTEMVPzVDk1UDuWakuTIbpezpR4JOHIxkBVr
         vG/Iv8koTasHF0QlDQSX8zefzwlYRMzhQBp06o07LeV7S4uzZhNF/Ojqy+p7u7+irOdM
         H71kB+/H9BBsLYpNhVXE5K/WBLl1PiiF+sKN2saDrJqYi3YSeVT7pv7Y/rGa9d76NW+E
         MP4t4c1LKj+NlxOOdi25RlK89GEtRCbenceDyHsobRLuETYw633GVsUIA6w98vHRX9qz
         kai2Oi024kL28DuVgrnj3dWaxCrfEAFNfksfe+MUgoQ/y8ed0eAoshje10xQDJOstgBX
         CZQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782909663; x=1783514463;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r7ceLvJFGDWzpb591woUgz7GBOYPJ1IlL6PiiR38W78=;
        b=XLSmQJ90ezLOfq6Y4zSewOhrCA7eur/vOcvFoDFhIRlJy5+X5N03JMLXabTD7ttXsd
         GCO821Qy803uYQcHDS45eMtRuFJcAk+bq16NwhZTwqiem7SPzAC5S93A89xoU3VOV9z0
         kPwoz+Xvun6XCc9Y7IAFeW5GVsYCe91fTpVNwUx3ms/1kRd7i5pYrEW141+yvGwC4PnS
         3XlLzHOJpN04s9rPZILl8uZFyXjjU0J63LfxjRPADhfH+D5yApyrAcTlt9hxYo83GtO/
         NS25yfUnRbhE25QM05i3HbovSumy1lA7EVLJICWXFCAxfEwen1JzpBHogXKjtrRE71G0
         ycRw==
X-Forwarded-Encrypted: i=1; AHgh+RqgAzd+wZCZN1+BA4sPdZfe3rMtvzv60Dy5W+mMS2h+ZcPONhkmbxUHO1o0DDL1VbBO6U85yuIIA1x+@vger.kernel.org
X-Gm-Message-State: AOJu0YxBaJMfHTWmrv0o/Vs4vhI1LiNCA0Szz/mnq2yDUrgZp1FeWH5U
	nhwmYfB7EdhahS4beS9zGFZzhrdfOqqrSZPOsutLUuQdHRdKdGkZkGJmoijnG1POvwI=
X-Gm-Gg: AfdE7cmNyErT6vApGRPBfYOsOE3VJ14jvULtbN82G+TBxF35X/ItZGOwBQiVVd5uxEv
	gzsrALoqITYHezJecuKSiWuMwH0zG732ReyZLouX5jo+gFYvH8LHOhzrTHGsLGwqgPnLPaTgaeB
	2breoUmZUcHYxjjUgnRz+85zilwfcWfBBEqUotcswLlNhRxJFFO5Vzgr+8v/jScVF3ipK7/Aev7
	NpIcp+6S4IPZyfquqmOxo/j8qFjdZTkokk0kzysFvrX9zpL2UgDW1EhBwaCfAKYaj8Lsgo5ih8a
	SiIxdv/GTK1FflKirbnoSx8w+i+sgJFeYyjO2R7ss1YklGgsozMLEYOY/MCMM5L08mtQZZeTgyf
	zJjHO6xgOkBC6toJKlrMwM4cjFlWZiy+qr0cGip2lLcHYLKYnnbvAYyFmqTZpF45f1d5orHFYN4
	U1bwnUI1Ln0nDTZDqzNDb+
X-Received: by 2002:a05:6000:46c7:b0:470:2fb1:3db5 with SMTP id ffacd0b85a97d-477b52962ebmr358057f8f.30.1782909662884;
        Wed, 01 Jul 2026 05:41:02 -0700 (PDT)
Received: from localhost ([2001:4090:a246:8638:a73d:f626:6582:90ca])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47563d194b0sm17422911f8f.1.2026.07.01.05.41.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 05:41:02 -0700 (PDT)
From: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Date: Wed, 01 Jul 2026 14:39:23 +0200
Subject: [PATCH v7 11/11] arm64: dts: ti: k3-am62p-ti-ipc-firmware: Add r5f
 nodes to pre-ram bootphase
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-topic-am62a-ioddr-dt-v6-19-v7-11-e9db8b16821a@baylibre.com>
References: <20260701-topic-am62a-ioddr-dt-v6-19-v7-0-e9db8b16821a@baylibre.com>
In-Reply-To: <20260701-topic-am62a-ioddr-dt-v6-19-v7-0-e9db8b16821a@baylibre.com>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Judith Mendez <jm@ti.com>, Daniel Schultz <d.schultz@phytec.de>, 
 Andrew Davis <afd@ti.com>, Siddharth Vadapalli <s-vadapalli@ti.com>, 
 Paresh Bhagat <p-bhagat@ti.com>, Bryan Brattlof <bb@ti.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>, Devarsh Thakkar <devarsht@ti.com>, 
 Beleswar Padhi <b-padhi@ti.com>, 
 Francesco Dolcini <francesco.dolcini@toradex.com>, 
 Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: Vishal Mahaveer <vishalm@ti.com>, Kevin Hilman <khilman@baylibre.com>, 
 Sebin Francis <sebin.francis@ti.com>, Kendall Willis <k-willis@ti.com>, 
 Akashdeep Kaur <a-kaur@ti.com>, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, Hari Nagalla <hnagalla@ti.com>, 
 "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1228; i=msp@baylibre.com;
 h=from:subject:message-id; bh=vgTU6IpqehS35f26r2q57NqAGrF/RDXF3lubDqCB+Bg=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhixXrqOMLZ/SpPQcPUy3F2Rk3LwuqBFyOC34z/l3E1l28
 oVtX+3ZUcrCIMbFICumyNKZGJr2X37nseRFyzbDzGFlAhnCwMUpABMJmM7I0KZ15LlN4vNVXPvu
 v/t0m2nK6YWn6idE/mLv5npdlaZYXsXw3/vkTmO2mFwRP4V/C6/HMifyveY+mHhfyWKCxflsE9/
 X/AA=
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41

For IO+DDR the wkup_r5fss0_core0 and the
wkup_r5fss0_core0_lpm_metadata_region need to be accessed before RAM
setup is done. These are used to read the lpm metadata region in which
data is stored to resume. This needs to be done before RAM is in use to
avoid overwriting data.

Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
---
 arch/arm64/boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi b/arch/arm64/boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi
index 8f7409da83392d2d1f160a9645ef4d68f7aaa1bf..04fcd5115b9d95e6e23c4e43782c06501a0fa601 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi
@@ -40,6 +40,7 @@ wkup_r5fss0_core0_lpm_metadata_region: memory@9ca08000 {
 		compatible = "shared-dma-pool";
 		reg = <0x00 0x9ca08000 0x00 0x1000>;
 		no-map;
+		bootph-pre-ram;
 	};
 
 	wkup_r5fss0_core0_lpm_rest_region: memory@9ca09000 {
@@ -89,6 +90,7 @@ &wkup_r5fss0_core0 {
 			      "lpm-metadata", "lpm-context",
 			      "dm-firmware";
 	status = "okay";
+	bootph-pre-ram;
 };
 
 &mcu_r5fss0 {

-- 
2.53.0

