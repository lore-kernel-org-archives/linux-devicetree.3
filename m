Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795802814;
	b=kpbWB5M1muakkcZvQGj2K6ByDLVCMdWNTkuakE603iMvLZ+YNi2BGnU7Xhfg4zGq/r9E
	 a/qLO7flM/m+1G1CQaxAQO3hA/pG20oyo3TOgUPLaD1WePp32EdkYwkTxDRAlzu+xvHZI
	 3MXm3trfzTIdQ8gFeEBc9+HS84jOek1EkcoP1ee4AYgvT0eyftH6LlHI+dZnhFIzz0Tgk
	 QiQlmoaVOY/syIzF3XERpBUnFC69+iPcx9Zg7QUT9mFGU9Ho3EacqvpHUaZ0PTOJTE/me
	 GJTz73R1bM2JDT4q9MaWl9jhtKNntxH4wzqswu+kTSacosneHHt45hespoatxyriP4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795802814;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 Content-Type:MIME-Version:Content-Transfer-Encoding;
	bh=JMhmizF9rm/NvUf9wXz1bzC79f1tk9PLdnrYZqqxQsQ=;
	b=Au/An3ZFP1j7ZNmJYRvYfH1Fx+/wUfmteRkrf6FMoQY3GsjXWGjD9hxVe/SOSar+gWtl
	 FJ3xYsxI1Vsx4u3vFy5wDRbGnHi2aiAMIrrcdVZsf10ET00CpP+7pCWGPyohyWlSopS4f
	 tpewoNx7jfRmcwV90wycCvlGXxTTmIvakTk6uforA5l7cM+wdsEMXOrovndCZOEhpPAiK
	 fXygqBH1ZmUuAu7FnX1iYw2GVvyhBSYK5/A9mou7qoBdqFjfAN3xTijIftNHoAeofVeNO
	 AkuFHfc46t4y0/yJrA9wpU2Nc/KFiJbJD7hKyBRfCb4JtB0z8cuS8M6SN7ZI6inJ9LQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=y9TTNwVj;
	arc=none smtp.remote-ip=209.85.161.48
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76537606A31E
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 18:06:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76537606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=y9TTNwVj
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-71ad099391dso4011808eaf.3
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 10:06:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795802813; x=1796407613; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JMhmizF9rm/NvUf9wXz1bzC79f1tk9PLdnrYZqqxQsQ=;
        b=y9TTNwVjP6UCmujUMGevJiEol0AFP2ky/lNt5rQkZNqfDtyPQhhWpcRFKHicGdhgtg
         USPGFmEp6lLjnKVzq0KAJ7E7zLCCHNdQ+lFzNMNu4JP9vgPbAeOs7iOGBuXKAEEK4ZJT
         emmzmgphfL9jW8KmUU3sHoVnpNfJrK9OCye+FQMb36vnUnB+OIE2OugGUIwieK+Idtub
         HVegVKuQBjrv/w/ZGFuogmr4POtDyN8FXdgqkG3QVpwpoQ+9iuVcxfts5p+Vk3yrV4Cg
         LAvV4R3Dc5ZmAmOvQAJJQzVH8EsK6rZpOXsI2g9D+fa1fTYvaEK8YbLmGLHGHdf2ejm/
         ahhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795802813; x=1796407613;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JMhmizF9rm/NvUf9wXz1bzC79f1tk9PLdnrYZqqxQsQ=;
        b=QfPetli4t5VTTdN1nrR0RMQy6Lj23saL6vV9W5ImZwEKDsHr6Tbftaw2jbqGZy6vil
         BMVLUTP9AaFiwxZrtW+sdHCLXq9crx2E+dP/igexqpWI8O54zF1UxSAQFRNKJ9fybCEb
         Yo/TWd4tW3xamd+AyuPsWDGFhwZX6/2J68LRtkcHHB6fiMBnH0Qx6LlGgF5P7PBoQHUR
         zckdcYrgaRe/U+493SUUeSoVxmMtdsCz00C4GPIHnJpSQXwL0jbRvGJBVTfsG0XvvWY1
         Krzs95xLpts+s7na8fcFi9vwZByyt0am35ldiB9mUEcyZuXzYT+nPcTWu3fstT24/yll
         zStw==
X-Forwarded-Encrypted: i=1; AL+hErFMSdohaIGrv0bBfSkk/kEkkBWuemgRXoo1K+HuOklhVoZLUpwfjPNvCx9zou34So1ZEAIoSdCpoqJK@vger.kernel.org
X-Gm-Message-State: APuU4Z/4HXY0/t8WTiK2eqpvOur9awdITGxcUdwjrVbI432S9llcP3z8
	iTItcRfs02KkOWBWL+BNTw35p2JmjcQGTNtMs/DIkfNB+GB3Vt5JBgoL
X-Gm-Gg: AZFdTZdpTZk9khewLyc4qVrsfHqnKlwHOi+vEvyVyvz3rJQVwHrEx4y+8kSMGKjrnFq
	iUixc+Kk61ndx1PRwuJs5MmIzqquSdYKYUpokulCMgyev8i7aXALLKOPkmD0eXMWdzLUXwRpGsW
	BDWyXc1VuT3z84NgRPj52/NY2q47u4T2/JtL4c4cXo75qirsagwbl49ibVE+JOsxkddvcXQ/9/w
	C5O1J0060ga9DaRe9XbuPEyM0RzUIt3pbeTjfJi3x5YyLUJI+oFsuBfKzdIcoKpw8oayShPGCjY
	WK0/ird4OrSu0THaOuhmg0Zs8QMrdSChldKbCR3h+1RnDhfs0lt6AjO5osxDmFNXD/qugqab1L7
	wx+HAtY9ziMvsACrWYcCyjv2jATKyT8tTY9s/YQSY35Q+d3vOLWZJMkjD9RcmVZikxyW1Sd7qR6
	n6GumPQ7bmfHUw27SggF01liXpDncFpV37LrhXyEwleTIIWpHNqBvz9bI2JjjGFsssB6FwJJ60t
	y+EuXHU2NjOR799pXtmlgMOy9f3TeeoMAmqGDqRqDgsbcFbwOUTwCpBXocDA39QrpzflfUXB6Wd
	8Dk8pWEVxdjJnAyx2Y10sBZE0bb15C39bI/WtQVDg/2J8PJjo1ZIdjT/TfhvFmAO8JPbtszn7I2
	/72s49g==
X-Received: by 2002:a05:6820:a74d:10b0:708:c97f:5541 with SMTP id 006d021491bc7-71b394868bbmr14209997eaf.37.1795802813364;
        Fri, 27 Nov 2026 10:06:53 -0800 (PST)
Received: from AMD.home.internal (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-863168f6d33sm17220715a34.18.2026.11.27.10.06.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 10:06:52 -0800 (PST)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: andre.przywara@arm.com
Cc: jernej.skrabec@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	wens@kernel.org,
	samuel@sholland.org,
	Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Junhui Liu <junhui.liu@pigmoral.tech>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Pablo Mazzini <pmazzini@gmail.com>,
	Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>,
	Alexander Sverdlin <alex@sverdlin.org>,
	Jun Yan <jerrysteve1101@gmail.com>,
	Lukas Schmid <lukas.schmid@netcube.li>,
	Cristian Filipescu <filipescu.cristian@gmail.com>,
	Norman Herms <dockseed@proton.me>
Subject: Re: [PATCH v6 2/5] arm64: dts: allwinner: add A733 SoC description
Date: Fri, 27 Nov 2026 13:06:50 -0500
Message-ID: <20261127-a733-dt-v6-01-reply@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <9ab5f851-1b56-49ed-bfdd-46abdbdda1c0@arm.com>
References: <20261126-a733-cubie-a7s-dt-v6-0@gmail.com> <20261126-a733-cubie-a7s-dt-v6-2@gmail.com> <p3YaXlLJTguQBGnWyMpb1w@gmail.com> <9ab5f851-1b56-49ed-bfdd-46abdbdda1c0@arm.com>
Content-Type: text/plain; charset="us-ascii"
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

> But it's still compatible to the D1 MMC controller, isn't it? As in: a
> driver capable of supporting the D1 MMC IP can also drive the A733 MMC.
> I think the voltage regulator is a separate problem: it's external to
> the MMC IP. The vqmmc supply property is documented and usable, and the
> availability of the regulator it points to is a separate issue.
> The same as the H616 and A523 have the voltage switch already, but are
> still compatible to the A100 and D1, respectively.

Agreed, and the manual backs it. The A733 User Manual v1.00, section
11.3.1, lists SDR 200 MHz at 1.8 V IO for SMHC0, but the SMHC register
list has no voltage control. The Port F pad voltage is chosen in the
GPIO block: GPIO_POW_VAL_SET_CTL at 0x0200_0070, bit 0
VCC_PF_PWR_VOL_SEL (0 = 1.8 V, 1 = 3.3 V, reset 1), section 18.14.6.3.
So vqmmc for mmc0 would be a regulator provided from the pinctrl side.

On the A7S (schematic v1.10, sheets 4 and 7) both Port F supplies are
fixed rails: VCC-IO, 3.3 V from SWOUT2, and VCC18-PF, 1.8 V from CLDO5.
There is nothing to point vqmmc at today.

Unless Jernej still prefers dropping the node, v7 keeps mmc0 with the D1
fallback and no-1-8-v on all three boards. The Port F switch can follow
when it exists.

Jernej, if your "emmc" meant SMHC2, I can also drop the unused mmc2
node; no board enables it.

Enzo
