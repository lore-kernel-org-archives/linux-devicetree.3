Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793206119;
	b=S4aMzU5qUDaxXNuKo2pfXJGsk5+afJ07eoliPED5xF+lbY/WRRpyHk0X6DsplhhNHmJh
	 AsIYhFMzpEpzacWk+hGQnIs5VssmNpmLtODbglkB0ZSipk1O76p9pmSFTuCFcahW9hHSb
	 v30wuWRP9j2cGa+RfAkffjRFJpSmK3uA7oQbwiYZrNbtULOON8SscUCyKm9gOJTG+ZEhr
	 pUNQ2eo5IcgnXEYox7CfdZ6j0qdTG5mppPh3tVBk6eZYtjvU7U/l/m/UlhylZUahTegQ8
	 OZUU5RMOs73VPMir1PV+A97c6aX1Ng2M+WVJPFTZKVBDbnLhiY4frUYn+QGrZoZ/Z7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793206119;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:X-Google-Original-Message-ID:Date:From:To:Cc:Subject:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=3TKL45EGjOvSJq9RcZeBcdQfOCRHkAFNmFcBB7UbKPw=;
	b=z/58eTAl2gMZiSVWMLiDiWf/98LbV6ElKNQztQjJY7aGnDVnS3gw1E09HmbIhBVO6CsQ
	 SfSg+1sL3Wh0NwbtHqYxcnD7YIYyeZ5S1ry/Ew0klyn5vAxELzt4gqFvIW6McL0SkPfiu
	 DmlUPlR5GvYufKLTm1dxLdTb+A/TretWKBG94G0L03nbYD3yMBj7dJpTnPNaCUZk/J9Sd
	 i5R3JU8dbqleSHpud+r3HrI3hwTS85hlY/xQkKakQeG4bTEtLBhxLWlpiZANwfRkxUtq1
	 GO1/Aa9rfR5V6eE3K9At8u1d91zCouITPpGWEzlNJtxKxHoVNZ5qyRqReCu0u3cmFEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AWZCxGkZ;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B2EB606A31C
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 16:48:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B2EB606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AWZCxGkZ
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a215e64962so13500965e9.1
        for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 09:48:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793206117; x=1793810917; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3TKL45EGjOvSJq9RcZeBcdQfOCRHkAFNmFcBB7UbKPw=;
        b=AWZCxGkZoQdesLGQrrnvsYGQNrqcDiUUTccIA8g+LjGGdy9Zlpf6SAWSqBYBU/N556
         XqnM1yNS1SG4KQqokLrnmkSge8vkg7/p2+IbdcbgIc25S1IyhSjnUNQvZtezTHBCG8uD
         52Xw4fOgrcqrE6th6EPQdWEWwPgtZ2ftMMJMNlOxYeldBQE8F7+vwnKuUJc1AWvN0FYb
         9Yi1OsWmdqEUOLdCLt2ILHohZj4gq1CX5ARDHWnF7DEjqJcJMPN4HqxhnS/h+Nq108O5
         8wGK3UKv4j336bEvuU5MhQiP7ZwmAEYyAZYRe0VeoPgrzoafGwnzsKbwFXMmIo62SRdE
         wYoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793206117; x=1793810917;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3TKL45EGjOvSJq9RcZeBcdQfOCRHkAFNmFcBB7UbKPw=;
        b=2PXGUkoBgzmVLXQJd/8ymdqeoBcZxZzxr0QACKzuXHekjVEtg79H/UudwJcFb8zHmc
         RQr1T3sY0hx6ol10GGImdBwK8H82aJYC8HRyVEldXKf+2cX56JbH3abr4VmVni6gFZD6
         TdVjjpF+pK0d5Ho5bdeXwYFOgkoGOwPKsSQEtC8EMHFmoBHeK8KcnnlMfniyKCsUJZex
         RnWoOHbsNxql3ZA8GNtOuI6kUcvZpkw0yMPWDJ4U7Gl2UXfLj1QZNxBLZ89zxyI95rM3
         hWD25ii4oEnM8TXsZl6mHObnlxuyjMCluNvJNH5pNSxUxa21AWwl54LuoYtY1SmEtVVZ
         2jvA==
X-Forwarded-Encrypted: i=1; AKwUvBys5Q2dN+fjnke4tF5V9NdGFELEWiMGDI8UKyWXzt9SCzxh3h5Ee5dH69R4hBdLxdDdVZ3SBCmcKCoL@vger.kernel.org
X-Gm-Message-State: AFq9FYKCmlK/VSJu8CJPiZftIsf8gqUmzDWlbGtNVO5Z4AAJAGkj8o9T
	+9xCLV1xNTBaLxOTclI3uwVpCnnCKwEjLvd2M2s5+vWkNFwQON43dNli
X-Gm-Gg: AYBFou3JehjJUTpHrXzlDxhsw2b6sy/764AdOjPipxVAQkA7SdJan/wu0qxOJ9OqUu+
	vR02nqPKCfdmhPnW/VGt2BmEzvGzszguuX2xuGDX1mUOwd/9w/7GIeJNYWEFX8mxpFRI1fUtSkP
	zc9z3vWwUEjIVDowD4gzfLDKaiS8il8xqn2nqHGwCC7V4zzqxqYVMCAieA916forXj4UJ8xitmO
	8lYP7bBJq+wh/OIjU1osrDx8ZTHON0NA/k9xwiHdumznaWY9P67zsGFRx+dQv1OtlM2y0PbelLI
	7vWUw3no2Qa5WFz0EnAs7a6syilfLOfiHtCsn8AXPAjwgzm4DkI/AF35UzAgMosiXCSY2xuAOQq
	MB5N3qvn1tL4QR7hnR6D+0+rB97kNpqRYsTfoLOX1/l+UlRvj+KPA/cT1KT20ej0PQTBNYmZjkv
	WRKSkZsK8SeNpBEnKewOdkjuTR/mWRlWToquALb2ibNuQ9xG3agCq+qGO2mPi3e2DReZNvGCG1B
	Bw4y8PX1NGtGhVD/8D3n+gE6JEqkdpac0Cu5Zap2hjPgbQtkfgmsftQix7PmDSD887PcoeVmOPJ
	Bny6kxnt062L7ts1HfGz39YRLATkj9WXN1v56GF3bGZ837x2r/ddPVPth2ZzXpOK76Ky+bf+8BP
	bn7spzS7dobaIYCyKVsSWYTJiJvHuUBxGHN1IEw==
X-Received: by 2002:a05:600c:4452:b0:4a2:fe3:121b with SMTP id 5b1f17b1804b1-4aa4eb767d1mr22034485e9.28.1793206116486;
        Wed, 28 Oct 2026 09:48:36 -0700 (PDT)
Received: from Ansuel-XPS. (93-34-92-187.ip49.fastwebnet.it. [93.34.92.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa7f322c46sm4600155e9.2.2026.10.28.09.48.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 09:48:35 -0700 (PDT)
Message-ID: <6ae22763.2bb6edcb.3bc160.a0e2@mx.google.com>
X-Google-Original-Message-ID: <auInYOnHl6n-3ggU@Ansuel-XPS.>
Date: Wed, 28 Oct 2026 17:48:32 +0100
From: Christian Marangi <ansuelsmth@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Chaotian Jing <chaotian.jing@mediatek.com>,
	Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wenbin Mei <wenbin.mei@mediatek.com>, linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2 1/2] dt-bindings: mmc: mtk-sd: Document support for
 Airoha AN7581 SoC
References: <20261027144002.10606-1-ansuelsmth@gmail.com>
 <20261028-academic-blue-earwig-72d3d1@quoll>
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
In-Reply-To: <20261028-academic-blue-earwig-72d3d1@quoll>

On Wed, Oct 28, 2026 at 01:51:16PM +0100, Krzysztof Kozlowski wrote:
> On Tue, Oct 27, 2026 at 03:40:00PM +0100, Christian Marangi wrote:
> > Add dedicated compatible for Airoha AN7581 SoC integrated MMC controller.
> > The MMC controller is based on the MT7988 with the difference that it does
> > have a single clock controlling it.
> > 
> > Add the dedicated compatible to describe the 2 register requirement and
> > permit to define only 2 clock (the main one and a fixed clock for HS)
> > 
> > Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> > ---
> > Changes v2:
> > - Also add compatible to restrict clock-names for source and hclk
> >  Documentation/devicetree/bindings/mmc/mtk-sd.yaml | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> 
> Your driver part suggests it's fully compatible with other variant. Why
> not expressing it with fallback?
> 

You mean something like 

   compatible = "airoha,an7581-mmc", "mediatek,mt7988-mmc";

? (my concern is if this would be problematic with the current if
conditions in the schema)

The driver is very liberal for the clock configuration as it does use lots
of _optional... But it's not possible to reuse one of the current
compatible as they all require additional property that Airoha SoC doesn't
have (either additional clocks or single register)

-- 
	Ansuel
