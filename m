Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06FA633260C
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 18:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784055200; cv=none; b=OdjizK2N2Mg25GC8J1ZHYx/Ela8KTh/97Gwa7ueDY1Lxg7lDtwuMmB5iZ/yLKlUCiXcLIbuQLMCu52caCiWxlrc8bgd6tB1fyhkAGsI1eHXyrqeR2xKwLqpFvSbh+5QyyqFaDI8wfRgvtMG2ba+7Y4aWPBpA+oXrdsgfkLS+2QU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784055200; c=relaxed/simple;
	bh=cSCbnH1xPXdFvXoeIkjlw6q74tyyx6jthYZF2YqxS6Q=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=TASrdZVDgPRzwQtrsyE/TAX5ILpWc/ebrfbE8a0/ymUvPLuLncAN3bHHlCto/ye2Sjli5sA4T4mqBdiQcxBtGMrXNN9ouJusjURNtqAFLJSdveE9PZm69Ish0ecddPNqyWk43LgmIJHR3+EKOoEGBK4zo7H0pmaYlHwxRvcC3j0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com; spf=pass smtp.mailfrom=9elements.com; dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b=em8vHOVO; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=9elements.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b="em8vHOVO"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-493f75f7172so30905215e9.1
        for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 11:53:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1784055190; x=1784659990; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=oeiC8iwmB/ylmI7BL0w8nOLqlIUesF4NQaKuVPlJTmQ=;
        b=em8vHOVOMz3MokgSycMztY44Spmj4Eox5mpku18Bdb/1X1yFwWqgcbOMM6i0RWyxzk
         ZI1TJKKa1gr7y4aKWqpD7KMpk52tB26sQsVmgpECaq458NCty+I6DeIdEkSrHjQxlvd5
         kYmwodxkUsfaByr+h8pGOkZ28BiS2UHCDxGdBWQ7rdlFb6Y9qC1+iLpi4rceWKVDv4yX
         YtU8T0E+zevB/DzVDEgX8Hm++XBwZw63vlWYL5csywbN5VcqC2hj21BqREh09Mr7vz1u
         zoV/jQLTfk/ys7sWCM95r0nNdYNLLWgmvvmc8bhRMOH6Oa/jtUiijA+BWuXdp/uDtiyy
         wrvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784055190; x=1784659990;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oeiC8iwmB/ylmI7BL0w8nOLqlIUesF4NQaKuVPlJTmQ=;
        b=nYLMUmVYfqQUXPX6RsWx60OVJTbQ81P8w6tuMnzKx4oouTLmmrAS7DOwmym1YDWgdk
         ec+2QDwmdy4n4U8sr513OQu3Ph8CVJytUc2yMUmgTNOfjH5jQau40kgA5tXFmuC8hGrg
         Qy6UapGizuClzAs+0CeEC4XG2VxD3LV15X3hWXc1cKMTexLTqLDAYWnYeHkN1h4blMGb
         3hDgzf5tXuyTO+6HYBHGNwb2X3hudAGxbpE9DKWMPwQwq9UrGq0OXleHgzUm0WOV2rkz
         d2b9dNzKQ3jA7EUqqiGFZpC80QTiJUDxdoUise9aJEIF9CpEp1kn9SMK3IlWovs5AiqN
         lroQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq2EcF7pOzNwEKUR/kkmj7s32Yoj7zGYhDvaeYZ0TU51CDktVVxzsxiSOx7NKKESr3D+DCPY1kMaYzL@vger.kernel.org
X-Gm-Message-State: AOJu0Ywgi1JQXrpCW/5I2rhqSwEaE/NREqTA+phPO+qF0qc48uJggqjG
	7XJl8i7plnmMMMYMGHrUC5RC6NXGi1bu61w2UiWZRH9+2BvOvLMkrnZlJHhDrELmLAU=
X-Gm-Gg: AfdE7clJxzpor+YXeGRprSo5vik5CY5pVRYldJdEziV4SwQBtzZouKvUcUoR4fxtSh3
	5NNvmDrccqlGIcN1eY7vWhooALCiHtycT2KLqAcKyRNFX5U8GLbX8cCRn/FaqtxfyuX/oUs4wRQ
	Tj32S+IssXUCkvDPd1tugFHR7DgDMyd8Fjgk63tezN47/njggNs9Zs3BFw0T5hvFXlLGnGJ370+
	ZCeveVGZaaZSzwDa6t2JWIB/tdLgSOVkU/NNiVdUaH8pF5Fee+9tOSXKNgDUFG7y2J8i3j0qduB
	wSpPe17S+/6uoJUsHPdNgEcyBFknP5yiY4yas2yRi0EhtiQpr2EtI5Hy9qjPtpBclunfzxi2mZB
	KM3TcSQ1yf1UKHtrqeNc5qqQl8DXdvFZoURoQUqbdP9ZDIJIHDCBPK24GD52AVDqYXVmpzV6LDz
	nKwfSyzrQUyllql8kSHI2LCkGKpzDQHg==
X-Received: by 2002:a05:600c:6048:b0:493:e404:3727 with SMTP id 5b1f17b1804b1-4953c27b338mr384505e9.23.1784055190102;
        Tue, 14 Jul 2026 11:53:10 -0700 (PDT)
Received: from [192.168.254.124] ([2001:9e8:2fb:8201:c26a:83ef:161a:409b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49508725c0bsm94908715e9.2.2026.07.14.11.53.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 11:53:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v4 6/7] ARM: dts: aspeed: g6: Change vuart compatible
 string for ast2600
From: Tan Siewert <tan.siewert@9elements.com>
To: =?utf-8?q?Gr=C3=A9goire_Layet?= <gregoire.layet@9elements.com>
Cc: joel@jms.id.au, andrew@codeconstruct.com.au, lkundrak@v3.sk, 
 devicetree@vger.kernel.org, gregkh@linuxfoundation.org, 
 jirislaby@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, andrew@lunn.ch, jacky_chou@aspeedtech.com, 
 yh_chung@aspeedtech.com, ninad@linux.ibm.com, anirudhsriniv@gmail.com, 
 linux-serial@vger.kernel.org, linux-aspeed@lists.ozlabs.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <5875623c1b20cf5a1abc980eab4c31a47cc58468.1783524645.git.gregoire.layet@9elements.com>
References: <cover.1783524645.git.gregoire.layet@9elements.com>
 <5875623c1b20cf5a1abc980eab4c31a47cc58468.1783524645.git.gregoire.layet@9elements.com>
Date: Tue, 14 Jul 2026 20:53:03 +0200
Message-Id: <178405518338.194693.4399160180155776340.b4-review@b4>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784055186; l=799;
 i=tan.siewert@9elements.com; s=20260527; h=from:subject:message-id;
 bh=cSCbnH1xPXdFvXoeIkjlw6q74tyyx6jthYZF2YqxS6Q=;
 b=mkm+x2rfwdRTX6T+kPimO0xGU4ZCOBNQdoZdkNzfY3dX6Gjkg11WJUNKDAuKCKrynIBxtwo9X
 8eCoafR4SqRDuGXcQsnzwqL52BuI0qAQ9N5syq7ajzX3e5IrjjdojFC
X-Developer-Key: i=tan.siewert@9elements.com; a=ed25519;
 pk=ORQd/zQf+LsAvJGXP1CjQwVO6t6iEOGq/eGUsmRVTG4=

> Use the ast2600 compatible string.
> Make it more precise and enable specific ast2600 properties.
> Still use the ast2500 compatible string as a fallback.
> 
> Signed-off-by: Grégoire Layet <gregoire.layet@9elements.com>
>
> diff --git a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
> index 56bb3b0444f7..7c02633f2bd6 100644
> --- a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
> +++ b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
> @@ -707,7 +707,7 @@ emmc: sdhci@1e750100 {
>  			};
>  
>  			vuart1: serial@1e787000 {
> -				compatible = "aspeed,ast2500-vuart";
> +				compatible = "aspeed,ast2600-vuart", "aspeed,ast2500-vuart";

compatible = "aspeed,ast2500-vuart", "aspeed,ast2600-vuart";

	Tan

-- 
Tan Siewert <tan.siewert@9elements.com>
