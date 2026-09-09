Received: from mail-lr2-f12.google.com (mail-lr2-f12.google.com [74.125.230.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B0A32C3757
	for <devicetree@vger.kernel.org>; Wed,  9 Sep 2026 13:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788961643; cv=none; b=cSSdXvLJXXdZ1QmV0+SCXk51HupkNA+s7l8uQBpFfG/1jVLtmAWUxw+O77v/8L7uoEQurQnnUyJDq0HoAOBqFJBJHXAJUiHFy0OGe7IxqNMghHq+BJ2EKhnYbalsouv3YARTnrPtO+kro81lLiteC9IT02XxgJACIrglV0MfV+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788961643; c=relaxed/simple;
	bh=SO6IThhDFr344N2+D1nK6HNO8BusJuqYj4UNDj3MiSU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RMWQgOGv3CXaAFi2DZVvqyEi8p+4NlY650kd9O1PeLwZHqhYghbltFiC23wAkBaxESUMU+4kbo+0qwmr49fKK634w4nAtWjPDniEARpobvjdro3wRnkhpRb5gUj73EMlXddMEbZXfsG97qW4nxhaRvhBXxRGZacHUI6eVMoDlEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UkObzryS; arc=none smtp.client-ip=74.125.230.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UkObzryS"
Received: by mail-lr2-f12.google.com with SMTP id 38308e7fff4ca-3a354118856so2001391fa.1
        for <devicetree@vger.kernel.org>; Wed, 09 Sep 2026 06:47:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788961640; x=1789566440; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Pkp/eQf09LCqXaqLSVyyyJ0ciI7AzbJ9Q/c0YuMCG0k=;
        b=UkObzrySYdCOVpI5di8aGj5wirHhYgSO4mju2OAPsCH+kT12TiMvE3PYYMeyH/2kl9
         P1VdbqcPAajDJO85SNHxLaNDXKOgbSQhR2edqaL33GLjZrjerINls0AQ3qw1hIRkF0Oo
         unxHh1DhVo/BQIOjZZAL3Emog51hw+4FpExmOop0rXXljToEn4vwyL54vJhFiU0aV6p/
         7q4WfX9b+MsXaG1YquRjOhcE3zkCqZlGrOA9dKvE3KUMmp54aoaY9vxbdOWV0J3h9nex
         bHczYajsLFdDLm/6UeVN4+UoWpkel5pfFLNpB5iK3lSV9R1NGPc2O4vA/WUqcdoeP8oZ
         m4ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788961640; x=1789566440;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Pkp/eQf09LCqXaqLSVyyyJ0ciI7AzbJ9Q/c0YuMCG0k=;
        b=HhsLA3RwG9AiY2f8o/VvapR/S0GtNvZ0+gmnbvGRBe24LJ0IMh+CRf6duUHALlAEcm
         1Ud4LKJNllXqB7dOD6lXZ6Xb/HJWtFkyNgOj5dSmj/wU29bv/j7As9SnR38azfhnslXp
         +If4YSLjx3P6bozR0PknySnSDNJAv2XeEaD5/birLT26hri1kJcWXDvQFNuaQ21Qf3Jq
         CwRMrlojYtsVzr1oB5hLyokglTUaiCZgi7O/Vy3rm/o68VBnlpemPdjmMXZSAZl60XM6
         2KSaeHba90TrY5Pa02j/afjD/CNQo5np7b7ojYoLyCXwF/kwU2b9bmqXLmK+gpAj4twW
         IpOw==
X-Forwarded-Encrypted: i=1; AKwUvBxtIIN3vphHhESRikUwunOJ2+P+/vKbUSgFiN5wASh6v6x5vSzjB2Wme8OUed6tGwdK6Y/d1jiA0SxS@vger.kernel.org
X-Gm-Message-State: AFuF++nvbvRlBPmujwOiTGl5OABagohig/ksX7QgMJq+5VW93BtIR9R1
	fzl2vg+8Flf91Hkmug9/Ak7yzW5hfJuLpy6aBsWRdwJoOIm/ihM31iJm
X-Gm-Gg: AYBFou18NDk9dE+IC3cUBXpP/9wOMlZD0Y626qvTHIfrNO+LdOqGuQJ+FTJ7mdIiRhd
	csPnwMNucP/TTBIs2c1jW+jBnTtysDje+8li48wrY6sUorJMCG36yyM6RV6oqrGD3W8wtOdg73y
	ZRb8HoXabuvux7EbSPrXkIeQXhusvDqGu63WuoCYzADkFe03KdFK+rcNeFlOm4+cDxr71JNMVZJ
	i5ejl7AS1ua3ogl9KCCzmR/a+5giSrwV3V9029JqMKZHNtvPk6kQxHWQ9pMqn/Sc7Yoow7q6M0L
	alRfRWySlpunqHzJ85Pa0SUCiW31aLIH0V3idWYBfSNMb8Dx8UXUQdsDavVE+JwkD9BMH/tILME
	NUbx6Evn4K4egefLyxVtiGAXdNkstMtUHUDQllreIVOQfwkJQQy6fvjHPG/wFCGwQrwWDymKOLj
	kSee/0U8RlIKSTf45C0sAfE1r6o/mOqm/hC0NBRD8ZBhfIImACj+d0APXNcUnK9mKuJwfTHaFPf
	32mj3rvNzLEEDHSzK7MHSRp
X-Received: by 2002:a05:651c:1511:b0:3a4:8913:a259 with SMTP id 38308e7fff4ca-3a58d59a433mr1654671fa.29.1788961639878;
        Wed, 09 Sep 2026 06:47:19 -0700 (PDT)
Received: from KAS (94-29-32-34.dynamic.spd-mgts.ru. [94.29.32.34])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a3705cd8d5sm42008571fa.37.2026.09.09.06.47.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 06:47:19 -0700 (PDT)
From: Andrey Korshunov <razor1702@gmail.com>
To: devnull+hystericaldragons.proton.me@kernel.org
Cc: HystericalDragons@proton.me,
	amadeus@jmu.edu.cn,
	jensenhuang@friendlyarm.com,
	heiko@sntech.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] arm64: dts: rockchip: Split out the common NanoPi RK3528 parts
Date: Wed,  9 Sep 2026 16:47:16 +0300
Message-ID: <20260909134716.879-1-razor1702@gmail.com>
X-Mailer: git-send-email 2.54.0.windows.1
In-Reply-To: <20260907-r28s-upstream-v2-2-21ab570fc91c@proton.me>
References: <20260907-r28s-upstream-v2-2-21ab570fc91c@proton.me>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Mon Sep 7, 2026 at 4:13 PM CEST, 安容 via B4 Relay wrote:
> +&mdio1 {
> +	rgmii_phy: ethernet-phy@1 {
> +		compatible = "ethernet-phy-ieee802.3-c22";
> +		reg = <0x1>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&gmac1_rstn_l>;
> +		reset-assert-us = <20000>;
> +		reset-deassert-us = <100000>;
> +		reset-gpios = <&gpio4 RK_PC2 GPIO_ACTIVE_LOW>;
> +	};
> +};

This is carried over unchanged from the NanoPi Zero2, so not something
this patch introduces, but it is worth fixing while the node is being
moved, because as written the port depends on the bootloader.

of_mdio_bus_register() reads the PHY ID with get_phy_device() before
phy_device_register() fetches the PHY node's reset-gpios, so a PHY that
the bootloader left in reset is simply not found:

  mdio_bus stmmac-0: MDIO device at address 1 is missing.

I hit exactly that on a NanoPi R28S booted with mainline U-Boot
(generic-rk3528), which does not touch that pin - the RGMII port never
came up. Describing the reset on the MAC instead makes stmmac install it
as mii_bus->reset, which runs before the bus is scanned:

	&gmac1 {
		snps,reset-active-low;
		snps,reset-delays-us = <0 20000 100000>;
		snps,reset-gpio = <&gpio4 RK_PC2 GPIO_ACTIVE_LOW>;
	};

with &gmac1_rstn_l moved to the MAC's pinctrl-0 and the three reset
properties dropped from the PHY node. Then the port comes up whatever
the bootloader did, on both boards. Armbian carries the same change for
the NanoPi Zero2, for the same reason.

I had an R28S series of my own out before I saw yours; I am dropping it.
Happy to test this one on the hardware and send a Tested-by.

Andrey
