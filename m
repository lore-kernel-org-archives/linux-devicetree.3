Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 749D43E7145
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 08:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790240045; cv=none; b=M3YIL9qEJ+FFpst4/V8GdezsRlSPi9NOSgO5jYYPJ4jZXFiTLdtA4DEiMC1ABuywHoVC4Dnkul2yDfhOeykHtw5n2LAagPPFBBEekAndC+zagPQYCYED+OIC0rnBl+fEryj4GBVoioKuatJLVbVZ1eNC+sbrL3x7DwJNiIV6/xw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790240045; c=relaxed/simple;
	bh=vXsA8onEphTPMBeepzop7491JLND9beylCZQUYRa/9s=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=tyHFW22R0T2VdF+idnAch14Q1vGVF/z7AZPZWeMarjvqVydKOotkNEwwcY+LCe1/NGhWEHv/GjwJVmDgUOrDIYWLC9O4MH9iPiM31DdPXRwXAJhNkiTiwbnqSGDSoXeOLicS4K6I51b12EgzKx/Z9V5Im5eGAuuNrwDs2kGd3lo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=LqbjLpMK; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="LqbjLpMK"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49d1ca5b0d6so12182715e9.0
        for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 01:54:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790240041; x=1790844841; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YLnZwUG2MBgLZpqGTzUMzHxGyh6dXv6V+NePiVAKHBk=;
        b=LqbjLpMKvROjquwB9jxrXy2kExvY2imvTRcDnTuHsenhBVfltERJWno289v+iKmBJ0
         yUqkWFM+EFSFkDhphVs6tMb1P9AWqlMdUS/5QOyQM9/h7C+yCLOJZ7lCjjbQe+RHTCMA
         r/UI+7MgH45kl88MOtfb8JtOXg8eB4ONJMqxo32cayOKyu/UkHG87iGnwScfJVP691mX
         vOloPmc5qF53eBOKxUSJjqEumbi5ZfQcrMUaOaypXmtXdPklzDOPfmBXXVEFkITPNP49
         OK6K3F+y4PcdWOsVTPW7EuxflHrHUrB/SnW9+UwP9e4GDh13UiccwX5gI6sLw2MNo8km
         zU+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790240041; x=1790844841;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YLnZwUG2MBgLZpqGTzUMzHxGyh6dXv6V+NePiVAKHBk=;
        b=MZ8qqaUz1mhBBesXWC4wLuFqTte78Fb4kmgdyIBHJn9suFe3qPnObhCCxaY/gsTbjw
         hzCPl7fnOmQfRd9+gL/V6Ki9+8N8m6YCWixeAD1ZiP7cOAL97hasoaFCVdr9DQgOiveE
         IBO8CEZCW7uqAdbVoSchMupXstBKzW9wo7I2UtYdNNHf1nQeXjgsK/8ZAEojVq67Aw0O
         rbQTpLDRMQ/Gh5xNTbwCtpoKVFsMwZBtQ9ZiywSsWpOoxRWFbBnpbuda/t/1wk3mnOhI
         n9046Thdc1MxqkTS23FurZ5NuzYykWUjMHuwCv7HCvCCMSWKqZ4fG1oKms2pj7kSb9h0
         nWJQ==
X-Forwarded-Encrypted: i=1; AKwUvBxeraO+caMlA8j1J+g9hz9nbK88JYn+FgrjH0gUTDdqXJlCJP8ODtYShmk3QdNYPYyR4Gv5VfBdacKX@vger.kernel.org
X-Gm-Message-State: AFuF++lZDXc0v2C2wk0TyfYC8Fn5alRkghLCv1PIdT0n4rMjNb/01x7+
	BoOQoU+8FipdZ1xJMbEMq4sZcFHSDzJI5kVIMJ6DGVQRC/Qdw7/o1oUtNGxzjRLs7iY=
X-Gm-Gg: AYBFou1ghDW6/ZQFEzKwIj8978eW4G9ZKLhSxRqKevYtJH+iu9kwpSzxAKmH4tWA4UD
	NO1D3WAZXRWKFy3CCBwTln/h5Fxa7EGcQTl7G37YHi80sgec8+e9Wy2oARiofOZImJ6XWqV5XJb
	D7xB5NDD3c9ZQQ1xfDLe5uJ9MGMt3H3uOVMDuLlpVnnLxMFy1b876iuKBmFIcZ9Mt/422gJvd8/
	HVe9IPqlghnLLqiln74DbyyKVVoWpMniyYqyv4c2UM/gowo3f3Y2Wm63e1Xho8dTkgbRO3C3ulF
	4AU3JBEliZia3i1XztTEjiv8IIiPkVZ9ib93xtA9GQdILfHO/wM+tVD+sW3w8H2gBgBpTewKy9p
	EZTvMWx2B54zWTsM6+hmnmI67boty1JClKuvAsfUrVJ5VSuHSYPet2GgIwc1hqgSdAXic1LX0Ap
	9/NDSdsdTw4bP86l9Og2woLsMce5Mv3fZ5+KODw5bZUcDvGwvI4dHUkLgu//wJtMqnGugv9UKQq
	YIXLYu94Z5s4CMjTA==
X-Received: by 2002:a05:600c:8b22:b0:49e:6fd2:a45 with SMTP id 5b1f17b1804b1-49fe66d81fbmr28966805e9.16.1790240040664;
        Thu, 24 Sep 2026 01:54:00 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5cd4c8dsm64643045e9.3.2026.09.24.01.53.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 01:54:00 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, Richard
 Cochran <richardcochran@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Andre Przywara
 <andre.przywara@arm.com>
Subject: Re: [PATCH net-next v3 3/5] net: stmmac: sun55i: Make the delay
 step configurable
In-Reply-To: <26334006-a2af-49d3-8f26-18cd44118c6b@lunn.ch>
References: <20260923-allwinner-a733-gmac-support-v3-0-15735155a789@baylibre.com>
 <20260923-allwinner-a733-gmac-support-v3-3-15735155a789@baylibre.com>
 <26334006-a2af-49d3-8f26-18cd44118c6b@lunn.ch>
Date: Thu, 24 Sep 2026 10:53:59 +0200
Message-ID: <1j4iff9gig.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On jeu. 24 sept. 2026 at 04:30, Andrew Lunn <andrew@lunn.ch> wrote:

>> +	 * Correcting them would break the DT ABI of the published DTs.
>> +	 */
>> +	.txdly_step_ps = 100,
>> +	.rxdly_step_ps = 100,
>
> Could you be a bit more specific about what published means?

DTs like those ones:
* https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts?h=v7.3-rc4#n88
* https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts?h=v7.3-rc4#n87
* https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dts?h=v7.3-rc4#n106

On A523/T527, only gmac1 is supported by the driver addressed in this
series. gmac0 is another (dwmac) driver.

If I take the 1st example

&gmac1 {
	phy-mode = "rgmii-id";
	phy-handle = <&ext_rgmii1_phy>;
	phy-supply = <&reg_cldo4>;

	tx-internal-delay-ps = <300>;
	rx-internal-delay-ps = <400>;

	status = "okay";
};

If the information we've got about the A523 delay steps are correct, the
actual values would be:
* tx: 540ps
* rx: 2120ps

So I suppose in this case, the phy-mode is more likely to be rgmii-txid,
isn't it ?

>
>       Andrew

-- 
Jerome
