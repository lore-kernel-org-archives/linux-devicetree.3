Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.142.180.65
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795877995;
	b=TEBsa5N63thV3/QbnyVpLQDM9+VF/QAUNKuSnI7sSm4ecbIl/H72ZJ/lgZzgylp5lULE
	 Lqbk4whQflz6usFUNKl2QpJZVuPK+8lyNLe10x+2NiE9PGyAj8lM6pow2XPqF/M2WoMD0
	 q770te1BtPe7ynzwOCPZN4htNcoCmdEz/Mh48xFgvTIpdWurlmcPbtLoow3kQoU/tHyFe
	 RoG2Bq5k9EQaNfgphG2g1lQwajPK+/j3ZbW+MvbIK1F6uca2W20gW1wEcs76B7EYL/I6v
	 sZ49AFpFugoucn6QJDwwmhD7m/dMROIaUd4eQLCGT1KQqu5FkkFi9iKdEfZJnnFhx2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795877995;
	h=DMARC-Filter:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=0SgVYpy3U1JTUre4VHytz/rdMzMvnSOCjF5XdP7a+hw=;
	b=DE6NGSlputuGACvUr2IzkBSB55HnkhK0UHNwgeGX3/pFnNLyjxBjrYk+0tGcs9ZLi8fj
	 wbN8lMANZmv+JPSN4DWcCPSeiyQ/xcCTJplNhYygVH/ASaOoS+rt3WEomaa/rYXmW317l
	 E5Co6roGmGlJKMohKJyDTaHEuwiucDyR9pyr6ctR1IIuSusZ0SdDOTFtxd0558A7g59QQ
	 t7Owl2i7AFw5DdzJUeE0pPgGUuHIAbsXUbh8nAau2VReJ0OTLxGW8JTz8Tu7A0OH5BMja
	 puLshgF9qQuCN2umne6bnl/IqML0XsI5jKRtYv24zvVWjFBSGbLc4OqkDQ1mIjECrjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=makrotopia.org;
	spf=pass smtp.mailfrom=makrotopia.org;
	arc=none smtp.remote-ip=185.142.180.65
Received: from pidgin.makrotopia.org (pidgin.makrotopia.org [185.142.180.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E615606A31C;
	Sat, 28 Nov 2026 14:59:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E615606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=makrotopia.org
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256:X25519MLKEM768)
	 (Exim 4.100.1)
	(envelope-from <daniel@makrotopia.org>)
	id 1xXJu1-000000003e5-20pg;
	Sat, 28 Nov 2026 14:59:49 +0000
Date: Sat, 28 Nov 2026 14:59:45 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: Enzo Adriano <enzo.adriano.code@gmail.com>
Cc: andre.przywara@arm.com, jernej.skrabec@gmail.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, wens@kernel.org,
	samuel@sholland.org, Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
	Junhui Liu <junhui.liu@pigmoral.tech>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Pablo Mazzini <pmazzini@gmail.com>,
	Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>,
	Alexander Sverdlin <alex@sverdlin.org>,
	Jun Yan <jerrysteve1101@gmail.com>,
	Lukas Schmid <lukas.schmid@netcube.li>,
	Cristian Filipescu <filipescu.cristian@gmail.com>,
	Norman Herms <dockseed@proton.me>,
	Alastair D'Silva <alastair@d-silva.org>
Subject: Re: [PATCH v6 2/5] arm64: dts: allwinner: add A733 SoC description
Message-ID: <awrsYdpvQe15l8KX@makrotopia.org>
References: <20261126-a733-cubie-a7s-dt-v6-0@gmail.com>
 <20261126-a733-cubie-a7s-dt-v6-2@gmail.com>
 <p3YaXlLJTguQBGnWyMpb1w@gmail.com>
 <9ab5f851-1b56-49ed-bfdd-46abdbdda1c0@arm.com>
 <20261127-a733-dt-v6-01-reply@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261127-a733-dt-v6-01-reply@gmail.com>

Hi Enzo,

On Fri, Nov 27, 2026 at 01:06:50PM -0500, Enzo Adriano wrote:
> Jernej, if your "emmc" meant SMHC2, I can also drop the unused mmc2
> node; no board enables it.

Please keep it. The Xunlong Orange Pi 4 Pro has an eMMC module socket
on SMHC2. Alastair's posted board file does not enable it yet, but
the socket needs &mmc2 (8 bit, HS200 at 1.8 V, hardware reset), so
that board would be a user soon after yours.

While at it, the mmc2 pin group misses two signals the eMMC socket
uses: the data strobe on PC0 and the reset output on PC1, both
function 3 like the other MMC2 pins:

	mmc2_pins: mmc2-pins {
		pins = "PC0", "PC1", "PC5", "PC6", "PC8", "PC9",
		       "PC10", "PC11", "PC13", "PC14", "PC15", "PC16";
		function = "mmc2";
		...
	};

Without PC1 the hardware reset (cap-mmc-hw-reset) has no effect, and
without PC0 HS400 cannot work. On the Orange Pi 4 Pro the host
controller probes with this node and the pin group above; I have only
checked it with no module plugged, so I cannot report a card test yet.

For transparency: an LLM coding assistant helped with the analysis and
with drafting this reply. I personally review every line before
submission and test manually on the hardware.

Cheers,
Daniel
