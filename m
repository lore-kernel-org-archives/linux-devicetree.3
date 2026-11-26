Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.167.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1795683337;
	b=gGCCuZ3OzFFbqa2IQqbNgxuwBITbG3w+5nibYl9LaxXtKg/IJjjvrytqpEcQj93eZ/rZ
	 8fQp9VJeS3WKz+5iUvJKLP/XGGahjmpYp7kP+yiGgBlZFnHzrZqc6IiHA8tDlS3pQbOwu
	 u8STV0Hhj9DuZQtV3YLvaVxXa+FqICDPsttFnZdjTgb/V6d7gDTZIg4STL8wyy2UhCZLh
	 vXjodeslKsZBzKcrWrjkCPHYpRt9Okfs47ENo8GrIQrygaGfdtaNsRynzX+CUXWQ83WyF
	 gAcjMhsgrSggpEWjsLW+wrNnvoerBDefG9UoOYCc6FVdTRjv1FWy9FmF6FHzSMAHk9w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795683337;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=QKThXZIRAMEkOiH8X0ve/DDQDh2imYfE9WZ4cHyq7O4=;
	b=qSH9UXoMvjqMRgoW64oitqUlJ2K3xIjta+CUnb+JkXSAavRbYUHEjdMW44sa3yqMBMQL
	 LxkmCKI0NFhit4aR6+7+VXkvYNWoT2g2SOv7QtoZCF5Ssty4Zqb8pb6QPWBqq6uNTUKlD
	 H1ADSMF0dLCdpbA0sCAKje8RW9kKxnH9bexutjlGNlwac722lpfR+j9YY6uR9lraxpOsM
	 OLjVyY57h2LnHS3qjSttTJfqk8uPpfHK8Zm5syHy8oVKaOajNPYwufu/19c4h62Iy3L5W
	 srfG5+cvVSnAnBj077ANuAJUiQno3+df2pfyhz7iCXtZXn3zt5pOmy66NZJdisbCT5Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rfMg87DP;
	arc=fail smtp.remote-ip=209.85.167.45
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8026606A33F
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 08:55:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8026606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rfMg87DP
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5c154a41f8aso523083e87.2
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 00:55:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795683335; cv=none;
        d=google.com; s=arc-20260327;
        b=SCoEAmHvBB/gW2eh+YCQZvjc6xSNkS3kfAVm8YEQuZm7/Kcdbg2SsQP5tcHAjnrZ4R
         NIqEtMe0e3zrtwnzW1nBkEy1TxWuf+uxW+wA5JkZdu/4mbDsgeDT+svKg5GPnOJr5ygU
         8k6+gvxzNaMnPkv1JcUh79LS0JkftTSBw/uUBrXPHFQ8vEuZnV2SaVJam7aBb8BvdnKA
         7S1TNVUlcnDskaIl+mf4kbB1ZtD3O8yOok3QI8+lLvq6LVcKJg7xrv3heI9KZDy5PaHz
         B6tVyuMDporSxA+LWHK00OIMpB7xLp3ogpPTUw4ihSujO6//yTGS/5kGjgCEi74aY03i
         ATvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=QKThXZIRAMEkOiH8X0ve/DDQDh2imYfE9WZ4cHyq7O4=;
        fh=hL+UGGpGNSpshwMbt2y/rw2T1/KjKF7HRgxfnl1W6vs=;
        b=G1JB6MwPmoaRuTb9rDXDG2u4myN8avM3q4wh/SF5Rh1Ncsmlrktpy9Bd0jOxE6BQWD
         7wTMQhAzD2eK3iRPE8rglK+BTodjiWWvcFj96AnrzTVZsnH3W5vmraGOpvd7w7Zj6TE5
         N7fQ79MQ83l6dJy5uReRxit/RQ55R/r9mKH5Zdt3vAOYIW7tTWH8kIkXwpPELDaPbDuN
         Pl0daMiHX+uFMSgqGEn2bI/V5fX5oxQmMG81xEUBg0eMTHaxMrirnYI+G6GfYP3MNq5d
         CAiMVV0qwODreXJCnQFiUk8bUONZaEqDs0OilxzjdvghXAUdKzwRA4hkR76tQpZlNvSp
         U16A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795683335; x=1796288135; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QKThXZIRAMEkOiH8X0ve/DDQDh2imYfE9WZ4cHyq7O4=;
        b=rfMg87DPvIeaAt7WefjGyrL7uSD0uquLqmcawwAuuF0LDc6gm3phN9FgQ1hfcvNK4P
         vZUlpOYWEPZRvkrmo+Mh5OCC14KnFgEHDnbHYBX4t18bjdh2rj5ugU6P0+GkO8jWovOn
         RMvM770R8L//+znfMXxpcv0SQZZi9vdNe75S8ImFMsKJ3Q1QjbmRT2JJOl8FScurQcSB
         0tqg3bunvtmzuZ2dkoxsxh5Ib9cTPnZ3eF/Om7ll6kPxuzPcCWzJbprFtufbqrH4s7/U
         t9YQ1tkr9xcfscV4PTDAcngJBXvdMP87j158ZHdpSixSopf2JQM3kDHgOT41E84eKBAk
         k6bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795683335; x=1796288135;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=QKThXZIRAMEkOiH8X0ve/DDQDh2imYfE9WZ4cHyq7O4=;
        b=GRPb+ady3cK4dP3klZCgZdhOrkSKlUQWD55oLYi40WuAubjEU92RZiiXoAJak0xnFY
         raqm9lHntqeXFObKadqBk1Lx0FNwhuFEknN450zkRc8lSL5yNvCjtc6ERPFC2ePztQmo
         QROBvxgKamaN/5dx7S0S14LUM5VVHhYINSTUDNSOl9wzQoRd6fWTne5ah+YI0i0gJppS
         WaM1PcOgr1nVZrLwUzftJiDxHU8r9jyv2NWhQPHLMvNqoQnH0lhWJTEXXziTTLGVntvQ
         Yvj2xtTyr/nzRD7g5R5VNePKtuPGJiZV5GIBC1tMqM3xWyUxVrNSPgDo0xVakMuU//vb
         kBlw==
X-Forwarded-Encrypted: i=1; AL+hErEBWUW9auqbjI5Wqxp6E0wXwwhPUJjvpAg7M8aZtlVWyOCHt3LWtbzXsJxdy7su9QqoXxEVxGB7rRkE@vger.kernel.org
X-Gm-Message-State: APuU4Z/5KaUWd6jitrf9Mch6DGyxV69Li6Nq6F7FokEqEKGHaZY0C6NE
	osKcXjYZLgHCB/qj+onDlYOLrazNi/6oSFBoWwUWi+1t9cIKzPuViVha0e5/4wmOFT+gXGK8hNQ
	OOJT8tTNinvChXnPEs+EC71Q2u5KItcw=
X-Gm-Gg: AZFdTZdrJFAEA6x1iZJQ9FTckPmTEioq6ypfYDe20BOEQjc6nPt+rQGdZHpZT2TtmWE
	L4FiaePo4ORTJFRAf/yjw3myiKTFRI5cmG/+s99PI/1wDUN7sK+BWMab+8n5xuc1ApFwp8TYTU9
	BsHefD1NDh5cMCP1ZlHPm+xA+P0JoBuHUJNuWFaDsEDuyCqQ3Xd/y/5iLIRMktjl4p5japu5LIx
	jWj9ftFopjw+tUw7g/Gxi7m/hlV6Mwb2PhFGdrvNbOOrUx/S9no7hZjw6vm/GjOqb9JVKztDl4K
	X+GAOQNaURqVmfATbrjXnD2ibAiFEWLMQK8nmtraM4XM3y60fXQOw34JLtsj2Oa8nyS2Pe12J5S
	L4xznWWdrSzry/GrTXiwF8Ahzu82Q+FPg4WS6Qkx0fjcEY4o92YOjOtt4vm2JJIaLEf+LaBE=
X-Received: by 2002:a05:6512:1151:b0:5c0:62:7fc3 with SMTP id
 2adb3069b0e04-5c1bc7ceb5fmr8223250e87.5.1795683334857; Thu, 26 Nov 2026
 00:55:34 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261113-mmu600-php-v1-0-231196049a3b@gmail.com>
 <20261113-mmu600-php-v1-1-231196049a3b@gmail.com> <20261123-quirky-scallop-of-beauty-c662b7@quoll>
In-Reply-To: <20261123-quirky-scallop-of-beauty-c662b7@quoll>
From: Arun Iyengar <aiyengar1990@gmail.com>
Date: Thu, 26 Nov 2026 00:55:22 -0800
X-Gm-Features: Aa3M54pFlibDAmDC24529Pztyl31CflHnU5Me60OGDKTLA2a_3s21NJ2pQ1ALv8
Message-ID: <CAEy9hNX-TiThoXZ9+Q7j=bB7PpNBr7Wjz8_sH7C081HXka4xHA@mail.gmail.com>
Subject: Re: [PATCH 1/9] dt-bindings: net: rockchip-dwmac: Allow iommus
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	David Wu <david.wu@rock-chips.com>, Damien Le Moal <dlemoal@kernel.org>, 
	Niklas Cassel <cassel@kernel.org>, Serge Semin <fancer.lancer@gmail.com>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-ide@vger.kernel.org, Pranjal Shrivastava <praan@google.com>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, iommu@lists.linux.dev, 
	Shawn Lin <shawn.lin@rock-chips.com>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>
Content-Type: text/plain; charset="UTF-8"

Sorry, I missed the report. v2 allows iommus only on the RK3588
compatibles and drops the nested ifs in 3/9. It follows once the
arm-smmu-v3 clocks/resets binding it needs is settled.
