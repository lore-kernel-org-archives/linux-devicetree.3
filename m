Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795549218;
	b=s3892PJEIOnxqSjFAHqUse722hhLk08EzhmznviiY7Q0gQMdNcsNP/P0QVA8PvuF0iiy
	 pu5GEYQFP/b/IsbusQFJUlmoXGN+VIhr3iYmhxZwug1Txrn+DUV6B/AdgoB6CWCP5djZA
	 LnAfuzqqzl8PZrHwa9aZKFK3cKmqo7x6TRtrb5u6OnVolwx7Z8hLBewwOwyqBbGCuwW1S
	 6xkGZQvvjautk0AQAANSCZnnjyTBr46BbXLazdgL2kC2NxRSpFtDDcDl9hVVWY0KI0lMj
	 j4AXUKTBBRXlt4HvkJ3S/2r6YlHefCUAtH0V7SarepGwisovYiQDKnvLL6v0m+UsssA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795549218;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 Content-Transfer-Encoding:MIME-Version:Content-Type;
	bh=0Pk7VcO6MHtXoThdYzAiD55vUiySd54g9n6hkzZ6Qy0=;
	b=F6OlLQiiqkenq9r30c2jXJP5E9ZKnNjCLI+vM7ClAQc6u0f8GHh7o+FDzFMUCPJoXl6M
	 VqsklUeICmCxf+kqyWyRgf8GYWKpMMb0eVpAfoInZjhox2lhvQe0AHM25I0tuPXgyqog7
	 6l9XJCC0dTzzV8FAFJtsBtibebCvMhNnsjrHgmpK3ctAS8BHwyTK4l1cKcqis03S5j3to
	 /o1EnV0mMKXW1qmiGaTar7ftMv650iSknJZX3/CenW4Dv202VvRZ/9KhW53Qr9Qj2ozNi
	 Cmr4C+3FOZrNGPw6P+5oWzsH3aYKvaN/QNVNfL3olqb8fh92Okh66BfKOEyprPbI88g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NP5r8GlT;
	arc=none smtp.remote-ip=209.85.208.177
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C393F606A699
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 19:40:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C393F606A699
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NP5r8GlT
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-3ae81ae52ffso35515821fa.2
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 11:40:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795549206; x=1796154006; darn=vger.kernel.org;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0Pk7VcO6MHtXoThdYzAiD55vUiySd54g9n6hkzZ6Qy0=;
        b=NP5r8GlTST92ylX8PKG2Pd/emE5hCFhCa3yQgXw/67l48b+J/VMF6p70IdWMS4Oc2s
         eJluY+kIkDRgTN/MCm8X2X6QY+cUN3p1WgIRcf3XvrFVPXZ67rBiYiPaUw8A6rYPZK0N
         omxUYbZlpm7nd3ydpAOLqfQpe/5d9ce0+Rj+LCA+5JYnpap9HPKVWihFy7+jZMWecdkB
         NDopGqMopiZTN4x6q07tLX+cRkUwLqV40kF5OsoBBwbdil0U5IUoiMbEEY4gasRmN6HU
         HxTKWV2DDhEvQKlTkzgFmPS2LRvB9WT3V49ylWky5Pb0DydeXjtu7HDkPfNFBPhGFVYw
         cB+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795549206; x=1796154006;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0Pk7VcO6MHtXoThdYzAiD55vUiySd54g9n6hkzZ6Qy0=;
        b=JV9l+zSJH1yMI7k6t/gO8+figBYLDdGGc7e1uFMSJK04lDuU6AnFQK15ntIYgD2ju2
         lBJcJ08LRDn8qxLdNXpluMJAPtPJoTcESb4D0NikyOYoADkr9kLT9kVBhoN8Qap/ma4h
         SO6Olj8b9h72T943OYXy/rUUEnJXxF1qsx2LiJXLMvxeGasFnAWF/7pEMBFXv99wsyfN
         S6jQQnFqea0v5Us/0QMn6P31F/VjVRbE5TFCfG+IO8guOlsdiecvvsMiEnGTkBZzpgqA
         LzjiqA/g5hq2RvI3jRFaOv/gtGo1dhu/2qh4TYxVSG+na2n+q5Nyl5WB34L9MtToEda2
         cI0w==
X-Forwarded-Encrypted: i=1; AL+hErHQtQhHi3x43V1lET/KV518DnOOjItA/0ZQOgaPMxssZGlOlR8Vo1qx3jhu8jCoG+bg8tuFwuNEejX4@vger.kernel.org
X-Gm-Message-State: APuU4Z97ARt5uB2N4U/OECNz4ras9cLZjml1vQoUTpGcTsgJ3+SsS+5f
	DUxm8R3ZrrZ8DhUolaYPwoNbsZWIYUci2cYbS3zuVLed+HjkeGesDaNI
X-Gm-Gg: AZFdTZfPm9Xf/fr0PoB7BAizOg/9rLUwFM6sFBL1rO/DZriO92rOAYTvOlNyDedyLuQ
	w/kGKST2QHDWgiIpc4llUc8D119QwAI6rIe5YLLw5kVNk+gRERGDeJTGwkUzA/NuI1DREWPjqcw
	xOyt7HfMBLNTLxhgRrktBHvNs8qyuklN2ntKnaxUYMA75kburq2OFaBO0+ER8AIYApLdQ3tAI05
	oulxXZLud8eSsBm4kvl6PlpdbYcSTxJ1krGmUZRdYcWpOcrDY4foeR2xlTr2FRejkd/VzvFHKNg
	1zFeECJ2/0YXhKqYReZ69TihOo/eC/uyZx0W4h9Ay/ERBP/Ago9z5lEBqPyAV8+txomSbZEL9qG
	grEsH+83qQUick3HmnSkTyXz3xxj354d9wFUibovyvoPoC4gARAHKCj0zMUKTzH1pankfKWKtgp
	2AMGnB+YKqGXRF2xaLuGsQb5Q34Ksb9OZuZEENm9DTW4ubK0wfcm1Mq2lcbyYVSGM+qefaaaOzd
	xgJYlsI223+xREdPR0wSf9vmA+D97tRNccoCsehiaSi+tEbBeXOyoqz+RJN5AJP5pYYRvKXtfrm
	xI4liUiKMJJpQRLJYu4iYQBcvw+kVBKdGq/DI59JZPdZEMZ6ZZIa7G0=
X-Received: by 2002:a05:6512:318e:b0:5c1:5a83:4285 with SMTP id 2adb3069b0e04-5c1bc89ad5emr5211802e87.60.1795549205624;
        Tue, 24 Nov 2026 11:40:05 -0800 (PST)
Received: from [127.0.1.1] (ip-024-180.users.dtel.ru. [91.210.24.180])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bd043387sm4051662e87.49.2026.11.24.11.40.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 11:40:05 -0800 (PST)
From: Fil Dunsky <filipp.dunsky@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: netdev-bot+sashiko@kernel.org, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, hkallweit1@gmail.com, linux@armlinux.org.uk,
 andrew+netdev@lunn.ch, netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH net-next 1/3] dt-bindings: net: Add Cortina CS7542 MDIO controller
In-Reply-To: <22c76d61-d604-445a-9aba-f52e19f93ccb@lunn.ch>
References: <20261123-b4-cs7542-mdio-v1-1-626d0a0e3b4d@gmail.com>
 <179554724588.3135.13754934088283070222@kernel.org>
 <22c76d61-d604-445a-9aba-f52e19f93ccb@lunn.ch>
Date: Tue, 24 Nov 2026 22:39:44 +0300
Message-ID: <179554918420.4.6608826251937872544@gmail.com>
Content-Transfer-Encoding: 8bit
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format="fixed"

Hi Andrew,

I agree about describing the input clock before the binding is merged.
The vendor U-Boot sets bit 5 of the MDC prescaler, and the kernel SDK
writes 0x20 to that field. Neither source identifies the clock feeding
it. I have not found a CS7542 clock diagram that ties it to the APB
clock, so I am checking that connection before adding the phandle to the
SoC .dtsi.

The U-Boot and SDK sites I checked are below.

https://github.com/futuretekinc/cortina/blob/aafa3821f0934eebe8137726d4e6d5994c1ac3fa/u-boot/drivers/net/g2_ni_mfe.c#L724-L727
https://github.com/drvlabo/linux_kernel_cs75xx/blob/8bb3f7dc796a59d992572a118448ba196f547ed6/drivers/net/ethernet/cs752x/src/ni/cs752x_eth.c#L3529-L3534

Thanks,
Fil

