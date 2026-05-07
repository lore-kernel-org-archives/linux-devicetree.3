Received: from mail-m49197.qiye.163.com (mail-m49197.qiye.163.com [45.254.49.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 346F333AD85;
	Thu,  7 May 2026 06:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778136070; cv=none; b=BDbXHnM88v1BREXLplkBmZYwRSHs5TO9PkzPpK0JK6uEs0mxuUiSj3Kb+ZgC04tf8nZJtipMRHmvgYyQzHwoD6fBQj8lFItfekiwOVHwN/CmcxJBB3Lrt7cy//tmic9fwGFI+Mz4MqOQDtVe0D8Cp84v7DV0OQR8IerHojOF0u4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778136070; c=relaxed/simple;
	bh=T27QlmveSBFxRGPT1ePedOrPM/kGQ1CBhU2kFnK4fCw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=M/lnVYdfaA9ybbd4dyLzdLQvk64m8UZhI4KVBIsCvpkMcMe6cYtr/KRsGAK2CEh29Sp/N4DeIhiPAPUq5R8L8KZu2uxEaH8l6KNFm9wZtRDceScqdJ35qTnWCLw3M15FvsMWCq3aUNAlRs8+U24Zf6rJ2qutfltifEarwqx9irM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn; spf=pass smtp.mailfrom=jmu.edu.cn; arc=none smtp.client-ip=45.254.49.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jmu.edu.cn
Received: from Vostro-3710.. (unknown [119.122.215.211])
	by smtp.qiye.163.com (Hmail) with ESMTP id 3d7029094;
	Thu, 7 May 2026 14:40:55 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: linux.amoon@gmail.com
Cc: alex@ghiti.fr,
	amadeus@jmu.edu.cn,
	aou@eecs.berkeley.edu,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	dlan@kernel.org,
	gaohan@iscas.ac.cn,
	huang.ze@linux.dev,
	krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	pjw@kernel.org,
	robh@kernel.org,
	spacemit@lists.linux.dev
Subject: Re: [PATCH v2 2/4] riscv: dts: spacemit: k1-bananapi-f3: Update USB regulator on onboard usb and label
Date: Thu,  7 May 2026 14:40:50 +0800
Message-Id: <20260507064050.1881348-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260502051906.8160-3-linux.amoon@gmail.com>
References: <20260502051906.8160-3-linux.amoon@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9e012afe1e03a2kunm6dfa036b197e03
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCH0tDVkxJThodSk1OQkpITFYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKSkJVSklJVUlKTlVJSkpZV1kWGg8SFR0UWUFZT0tIVUpLSE
	pOTE5VSktLVUpCS0tZBg++

Hi,

> @@ -366,7 +366,7 @@ &usb_dwc3 {
>  	hub_2_0: hub@1 {
>  		compatible = "usb2109,2817";
>  		reg = <0x1>;
> -		vdd-supply = <&usb3_hub_5v>;
> +		vdd-supply = <&reg_5v_vbus>;
>  		peer-hub = <&hub_3_0>;
>  		reset-gpios = <&gpio K1_GPIO(124) GPIO_ACTIVE_LOW>;
>  	};
> @@ -374,7 +374,7 @@ hub_2_0: hub@1 {
>  	hub_3_0: hub@2 {
>  		compatible = "usb2109,817";
>  		reg = <0x2>;
> -		vdd-supply = <&usb3_hub_5v>;
> +		vdd-supply = <&reg_5v_vbus>;
>  		peer-hub = <&hub_2_0>;
>  		reset-gpios = <&gpio K1_GPIO(124) GPIO_ACTIVE_LOW>;
>  	};

This is incorrect. The hub is powered by vcc5v0_hub. According
to the schematic, 5v_vbus provides the VBUS for the USB3 ports.
