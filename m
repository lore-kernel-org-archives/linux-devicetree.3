Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D37BE20D4FF
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 13:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782740161; cv=none; b=Gb6VkFhnSXHPzhe9+GLiysAPv7J4Twt1O3FyuyM18qhKQQv6GwtVix4hb4qEtZDyuwM21BeOr8tk4e8URSKg/Dys+yTDSwY6iIPvkAaEjHgvoPl39TTRRkqt5XcP+uGsRLq3m6NGHd989Zz8hdcJ04KexrVqJ3ozbTEbKX8/E/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782740161; c=relaxed/simple;
	bh=zqrAv4ptgcQDDabtUqrMSNTpUU2PxpRKSgX2iLRPyeM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WYjRs1G8v5jufXiXmO2gLZi84fahBDBdrgB8/9PASXUG/izhha2faBCcwkoWBfRSif7u9Glj2JW16+H8IfEKmwhgh8lwCF/moPs5PpXx6/bKuzitKMiD06NFfZCjCjIRmwo4riQM0nu7vyozWPKxfqlE2kEKvu/0H7f+szM1sjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BAUHus22; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BAUHus22"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4926f8e02e8so20225665e9.0
        for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 06:35:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782740158; x=1783344958; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=RBM+1nAZz4BwsUG4gfSKzLFy6PeoM2OFZ8wfEYkLDpg=;
        b=BAUHus22URUgc6vBRNzRs52RNxaC46SCFKUYBEJQsgAjvynGGvuQ/Fw55zKg3PHD77
         I+iCBcGT1VPTj9VHFPu2QRkMOLGomEf82qzwoPhWoosFuMvv+JJJ0R3WGJ2uI4eH2KUl
         jWx+jWZaQm/S9cuynT5/Hgg3BkSfgyzkpUEHcE1c5soMAoILr1Kq7aVqkg+tQzJdS2Q5
         qgCKBjYX6/elDsrM08FW1ok5oj3KzayS+JBFvZq7L2vPTKyxWx1SWY7+TLjcvRN2+lb0
         Zu/FuWy974mdZRq8QBzNtJo8WyeDO3hZtp/CopNb2yZrUBhqaokXZMeuNhvyx52d6/vf
         YvMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782740158; x=1783344958;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RBM+1nAZz4BwsUG4gfSKzLFy6PeoM2OFZ8wfEYkLDpg=;
        b=XC9/y8hu5m0158V7TnlGxyd7vsNwfLKPl6/TSTHTxUNOV6/Mtn3Ga+9ppwiTnyXsPX
         VWP2kv7X8zkn6EgI4AKMHMdNj8y31ORDCz7bBBUDz9Fe/S75OUt5JQiv9u63IH+ejuhS
         RHaAgGlL5O0ymEsTkbAPpdv77/f1yklO/mYXjefqfkiqjnxJwkV04THCzYYJ+vBq8hH5
         N/Plhc4tPolpjFfkZjYXemf636RB55wHUWJYwHE0q+Nxa3nSDcdHP7HhCEvdI9PjbShO
         D1O8FP1WGPyxcs2pYnjurb+tAjjR+Bpb3S0b9kVf79s9FZLLZ0D8omEcWz6abPZJ8w4B
         FZXw==
X-Forwarded-Encrypted: i=1; AFNElJ82L4+roTzcLV8JwR6AoYsxYBFDt8WqT/dNBRPWOEpRmzDT0IXWuCQldw47Z3zAHWGiaH2tq6saP2YT@vger.kernel.org
X-Gm-Message-State: AOJu0YziZonhhMREwsK+C/youeLYsipf5J/qa55iPJNcEMgD/JYqi5Nh
	dnGUDaDu4NhrjOffEkvWrVSPr20NEkuAA9MDR5XHNd5K2w86GqPc9PKW
X-Gm-Gg: AfdE7clRM6GqF5UKWiXE7M11soZ11q0Hu/1FJeqYakq4xOH1vV8ADNtjwtTFF+zSoNN
	z5J+G41n86kpSn9eYQxfbHvE1fV2dUNvQ6EZJQaRLd55tJvBz71grKInISf8IpnlwSNXpy1Xuuy
	nRg7Y1XE3xbCO8ng3yO4e8GbV2UypU/zu2SXVPmCbRGTFkqY1gQz1NHIpENTujW1tFD3WO89FNg
	ii3TAU+ViMOj5yhGt1eS5SiTct5M42yUatm4L8jUHl17thgNVukghfjnu60eaBOhSDqt/YAWARC
	SpaLG+An0JPFdOzU2oUVApSQpCW4PgWvG7FJyUZZc4t+Oih+9JelAAXws2fFprQImMvhNQUUgqW
	3nliFdRb6LywfmihbH33R9CtCi7tLhgVblY/vE9o41VZSU/sgAr+o0n9tftSbJVmMwJYX2VTqNF
	On7KGNajss7jRUmyG03Dwr0jNQy/cdj11y9xEyfkzj7RoOX0bQMiEfqk8p4inEfqkw/MKArGO2R
	gjOYGzL
X-Received: by 2002:a05:600c:524e:b0:493:b2c1:b302 with SMTP id 5b1f17b1804b1-493b2c1b445mr34652035e9.16.1782740157956;
        Mon, 29 Jun 2026 06:35:57 -0700 (PDT)
Received: from [10.128.11.240] (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47327c47122sm13954850f8f.34.2026.06.29.06.35.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 06:35:57 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <2496717f-12b9-4d33-b6db-1db278aee8e2@gmail.com>
Date: Mon, 29 Jun 2026 14:35:55 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v11 2/7] phy: qcom: add the SGMII SerDes PHY
 driver for SCMI systems
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Vinod Koul <vkoul@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 Jan Petrous <jan.petrous@oss.nxp.com>, s32@nxp.com,
 Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
 Romain Gantois <romain.gantois@bootlin.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Christophe Roullier <christophe.roullier@foss.st.com>,
 Bartosz Golaszewski <brgl@kernel.org>, Radu Rendec <rrendec@redhat.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, Drew Fustini
 <dfustini@tenstorrent.com>, linux-sunxi@lists.linux.dev,
 linux-amlogic@lists.infradead.org, linux-mips@vger.kernel.org,
 imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
 linux-rockchip@lists.infradead.org, sophgo@lists.linux.dev,
 linux-riscv@lists.infradead.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20260629-qcom-sa8255p-emac-v11-0-1b7fb95b51f9@oss.qualcomm.com>
 <20260629-qcom-sa8255p-emac-v11-2-1b7fb95b51f9@oss.qualcomm.com>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <20260629-qcom-sa8255p-emac-v11-2-1b7fb95b51f9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Bartosz,

On 6/29/26 12:28, Bartosz Golaszewski wrote:
> +config PHY_QCOM_SGMII_ETH_SCMI
> +	tristate "Qualcomm DWMAC SGMII SerDes/PHY driver (firmware managed)"
> +	depends on OF && (ARCH_QCOM || COMPILE_TEST)
> +	select GENERIC_PHY
> +	select PM_GENERIC_DOMAINS
> +	help

I think PHY_QCOM_SGMII_ETH_SCMI is missing a dependency on PM. I get a
build error currently:

WARNING: unmet direct dependencies detected for PM_GENERIC_DOMAINS
  Depends on [n]: PM [=n]
  Selected by [y]:
  - PHY_QCOM_SGMII_ETH_SCMI [=y] && OF [=y] && (ARCH_QCOM ||
COMPILE_TEST [=y])

drivers/pmdomain/core.c: In function ‘genpd_queue_power_off_work’:
drivers/pmdomain/core.c:936:20: error: ‘pm_wq’ undeclared (first use in
this function)
  936 |         queue_work(pm_wq, &genpd->power_off_work);
      |                    ^~~~~
drivers/pmdomain/core.c:936:20: note: each undeclared identifier is
reported only once for each function it appears in
drivers/pmdomain/core.c: In function ‘genpd_dev_pm_qos_notifier’:
drivers/pmdomain/core.c:1133:39: error: ‘struct dev_pm_info’ has no
member named ‘ignore_children’
 1133 |                 if (!dev || dev->power.ignore_children)
      |                                       ^
  CC      mm/truncate.o

- Julian Braha
