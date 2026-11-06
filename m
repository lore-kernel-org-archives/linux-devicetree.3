Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793992473;
	b=tAkwF50m+ICOlj6CqrVtQjGH/UBd6oB40D7BcqG0Am15tZJ2lLrn82kgaVGIUphI6UgI
	 dL3RH9wPtljP+geoFdm3ZPDRpD1Pm1QlA0bK3H7K4Osd0Ls1VP+J0BQs3shFJHzVZrzt8
	 2ri2XgUFzqRLJCepW/VmeNGY6zuCLSCe0bhF2g+Smovqa5EkErMu4QsGkfQ59I8mbE5n2
	 +aiav3XtLdqe9aIuZUb9Kc4mc1u42XgEtKXz0Yrp2GPCQuKWa4UTbtjjw8NprH71SUMXe
	 LXKcAmGZrlIlj6kJMzMJZtIlSdRdxjuU/Flu2yz+ENIrgkkePGAxRlcprvCpUbd/Zvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793992473;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ny7CBnpzaEmqmRZNMZQTuMsTlRnHeslB+C3vtjdk+QE=;
	b=huPZjVBxScw4EhYiyMplJI7txQs5sZn0iAIZSih0FY6rqI/i9Sw1NG8+1YXDEHX0mX0J
	 Xd3ff9iQhn9hN7XAdG0iAl+nc03ChOXBDD/SnZ0Q5x4QTUcFHkF5bk07/vETtIi7JX/mN
	 YhEAYyIquzDcCjIMXfoYXZzKj4UHF55VmMsmprovsRpP71llZIomno29PnL2r56EqLiJF
	 K7sD6w2rDiXsnwglrbSno3OPVfbZGgwyNvl17BeeNgXwW1fQWV9B5WHKAfauSf51LV34W
	 JLOSk1sIqEx+mgBDAK9VdfH4p3xp13EAptiIrgQdmklp2ROU6mvsYBEXtHqZfTjypCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mg-crea-com.20260707.gappssmtp.com header.i=@mg-crea-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=B6GYI6dl;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A1BB606A32C
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 19:14:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A1BB606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mg-crea-com.20260707.gappssmtp.com header.i=@mg-crea-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=B6GYI6dl
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a208d93758so10553545e9.3
        for <devicetree@vger.kernel.org>; Fri, 06 Nov 2026 11:14:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mg-crea-com.20260707.gappssmtp.com; s=20260707; t=1793992466; x=1794597266; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ny7CBnpzaEmqmRZNMZQTuMsTlRnHeslB+C3vtjdk+QE=;
        b=B6GYI6dlXSvHyTGhyRFO5S2jaPx3hf2P1YluVp2quvZLGc7kf34BHwcGQouH+BohH9
         gRCBTUvtOBJZ2t63Q2ZNxjjPpYr3e9v8/mqD2LbXAiLJilee4HLye0Pc72q5RFYr0b5m
         d05nZNrI1aJ0/ecnDi1RT6NrdfG/UN7Kcfv3kjOBbcSBxmbDIEJr8ZGI56JHHeA/BwoT
         GBEs92I+HJzXrqU9B1prrc/JCyXu9iFuy70HqZxdHmLB3muxwPXSl/6ha3eoLmMXK31n
         AGQRc6Tnxt2H2IQx5XRXVRl/hGDv4niG2E0OnSGIA0OknklYFzci2i39qPrVRJVLDkCn
         3c3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793992466; x=1794597266;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ny7CBnpzaEmqmRZNMZQTuMsTlRnHeslB+C3vtjdk+QE=;
        b=O1AwokPcDVEKllsL3i85E2An7BqbhqeyXwCXFg2Z4gs8r2gyL3Z1Z4oG+Zm0dgPMEN
         FJiHLufY/IPC7xyKciLVdlEucwJbNyn24L2iYSCorCDyYJHpu1M84GC57FgC9MsDiWYl
         XpoO753TaX6FrpTj9jacTnf5kSU8kSHyBsqLp7T47HM2C3CRIL4ISM6L4ONBJyTklAiW
         AqvIlkjH5Cp4AwYxuyrENdE8FZpve65rPg65Ou+xe0eUYQrGh6J5n8gfkUFFjSeVeI03
         +TUqs2v05CadbdDqxLevHgSVDDSQRQ1CkZOaUyi7YaUkRRkiYE3ZGnAY8tKaYKKFxxcm
         al5w==
X-Forwarded-Encrypted: i=1; AKwUvBy+HuXLVV24EAuZyPpdY9b41QoIbpMJbeM+HnrTToW6Y4Agl+uZHqZ86CAfpkd4cCZr77JgU0A47vQH@vger.kernel.org
X-Gm-Message-State: APuU4Z9y4H6R/yPwrjrNOFHMVq9AGiqlqmSg174kAkU+odZeXgJxdeP1
	znmsdkfwV4YyLvgEblKPiDc5tk1JTqNvG4i9pl1GBpCr/3axHQJ7oMWZ6p5QyDGncEE=
X-Gm-Gg: AYBFou3akuwjgn9JN1dBeM8XZNB9RWFck2KSi0HpVpVHC7TwjpDpkrEitJlVDtdBhRJ
	3r74bFn4ZvW/tXJAxOFas7CG0JwamGWNaON08YoSZPlT3BsDrAzYikwVBv92V5kXxA6kL4UuJ/S
	lv0wBmdLQ/nl3sdWGLqMd5SuVptK+Phb1ooEXXdF+vbSdtwEw9U+e4IYMJCF+7oZfB0KGKzGxHZ
	EooerNf1NYv9KDz7gW8tiHwchA512PGxuolL+ay5DQBwbdEMZolaVRV6a8OdONine9YDtK3TqPi
	/lgDCqjIfzPrASfIlZDwxdpTdHIVQIuAIJOUbT7HAaJCeZlOFI0ZQEh6i4B8QIWsiST/ODwNJi6
	VqdvwCr7Fxce2FD26aT/dCEy5URieZBF0r/hbPue4G8MsbX6HjPyCBW/Z2o4+cktgxNEVZOCsOn
	q8JuQG/NPIuSfTexyFhkfm6BxAXQerJpTBB3z+gkpqjyKAThpLhuYWcCQHn62XHYS1OjVdXrQUv
	6xMbwE4f/iIZusYYVrKAOrAgdu/Ucvwqugn+IUQKpd8AfQmLL/AZqm00m03iCWmaMrzhx1bZ4O8
	n1ub7l9QpEpAmCdf/EiQ9CI5wxDlWXm4ojtGSfJQAyjeinygfSCM9hWgqbsiBA==
X-Received: by 2002:a05:600c:5295:b0:4a3:59c9:a756 with SMTP id 5b1f17b1804b1-4b6de973c5fmr58007235e9.6.1793992465400;
        Fri, 06 Nov 2026 11:14:25 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:9d2:5a71:30ce:e69c:9ae:c94a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7efb1b64esm670335e9.13.2026.11.06.11.14.24
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 06 Nov 2026 11:14:24 -0800 (PST)
From: Olivier Louvignes <olivier@mgcrea.io>
To: Paul Cercueil <paul@crapouillou.net>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"H . Nikolaus Schaller" <hns@goldelico.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/5] drm/ingenic: Add a driver for the X1600 display controller
Date: Fri,  6 Nov 2026 20:13:08 +0100
Message-ID: <20261106191308.31303-1-olivier@mgcrea.io>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <71aa432f71144f446dba2037ab5664eea3569fdc.camel@crapouillou.net>
References: <20261106112000.1612-4-olivier@mgcrea.io> <0a2e8ea782fa819a547e0a3075303bd74a7fde72.camel@crapouillou.net> <20261106143827.15926-1-olivier@mgcrea.io> <71aa432f71144f446dba2037ab5664eea3569fdc.camel@crapouillou.net>
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

Hi Paul,

On Fri, Nov 06, 2026 at 04:06:50PM +0100, Paul Cercueil wrote:
> Is there really a point in enabling the clock on-demand? Why not keep it enabled
> always? It makes the driver more complex and I don't see a real benefit.

Fair enough. I have nothing on the R1 to measure what the gate saves,
and the PLL it divides from keeps running for the MMC controllers
anyway. v4 enables the clock in probe and keeps it on until unbind, as
ingenic-drm-drv.c does, and moves the timing block to
atomic_mode_set() as you suggested first.

Thanks,
Olivier
