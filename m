Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794575467;
	b=N2VKwT6kVAIPjsw+A9JK4jlVvDC06h5KuEN1QxP61noRlN9pmeCtxFe1DbCMgfLDhKMU
	 Jn6grwLKafz+2bMjg1763zgyN0JMMOaJLw4+5f2kORPMHc24vK0t0SmlkItBte6Pm3c7V
	 lBdxrqgDnKARDfdmzsBSILjonZh7h0QiRgBq0qF48iG6GT4q/nBpX9cxP2lpWRiRdmtbM
	 MgAQoP6NF6LcUJAEFbbvaTN52zMOm7sVZkaVYXT81u46WKCf7OsNVFeSg09uCLjTgDfJ1
	 nHCAkKLNgxA8DCzfqH7QsrhpLQ6hXOtrJ56KpdjSbAclRMqOqNRc68fe1UWecH3OTlw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794575467;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=5EDfhwWxpQ0St5vx2S2w041m36SjyznpiiNP0pqBT+Q=;
	b=fiFtARSAkyaT66/Tw/49Ih6S+RmHa4xIc2Cl+9ibauIKglWFz4M2wh5RlDvgqO1M5QxI
	 H8sS+umQUGJgORP50vjLrBn2CZ+R1mrhi1jA/CharGJ/aql1u+lv5/btB9ZjwR3elxfvv
	 s2sRd/IXqzI1Os6MaTTHewmG7XFiO1utrggPp4fj0nv9NOmQ/CkxyvLZW8w+MzymglY62
	 wEjAOH4Mk2l0gq8zVyrm0jiDllXDQVLdI41dLNFrJOjbKRU8EWqsOfMf+e/oueILFQp6G
	 FhWbVAp+ddL3hc9FKzvonBjuBbL2o/wBWF5hJTM67nHtUCahcjdoD4h0DhNk+PcNyhg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="AfU/hl7w";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.179
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB18C606A88C
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 13:11:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB18C606A88C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AfU/hl7w
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2e946155442so14502675ad.3
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 05:11:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794575466; cv=none;
        d=google.com; s=arc-20260327;
        b=q9J9ojrOzC0FaRwTWj+takJQp36tyk9kIJSBVKdO72d7h6UrKjKGFRqF1x4xqP3URM
         gnEcyXQGdddXOPZcTdLsuH5b1zCPrd5+mF5gQUsxLbZvc9fIaMC1EFoO0VK8+gvUykAd
         7KxJe+ZIp08a2tV8j7wS9eanAgPJOLLuH8jt0yeIwTQcuOwocbwIzOrfuVIOcliEBtEn
         sldsW66DglZStzeIjHmwnXUpX8snN2vh4muf5YZphvkQPGh/Wb6RzreDG3fDkQNZ2VdQ
         ZIk+ybxSg8NAH0ADdlD8fi06z40eOI8+3AVyitQpr+qovlrR2FQpkkNmF+LQ6qUE/7MC
         K1Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=5EDfhwWxpQ0St5vx2S2w041m36SjyznpiiNP0pqBT+Q=;
        fh=5P/i7Wv4xBxpIvbAjRbh/tVh9xK0fdp2pPI3BfNCgQQ=;
        b=MFyTyGrPQ7lrUhDMO4hyY8Rj8bWKHLvoYYsE21L9Z/MHg5UAedvrHE0OwTynmrlei2
         unf6/m8279Se8cp5OyHEU6Gmch65/dIu+0tepbmr9/CZUQ46lfnBDHW+E0cNoYnkWMGL
         XpWY7ZaCyigLK0MS3X6Xlffkzonpufpsswe/a9LZXks1Iz8LjApTTwkANg90GhWieRln
         /qDn+z+DBNd62lZcyZ5Y7jBjtlOLZo0oIKdBJTdnyLFh8r0iWR9GlW1teevIX8kl3DNs
         SpXCgmz8YGtDrcMTA9Z02wQFH+OFmdkRWkxcJuDA8OO53LEsBKFgPci1JeSAoDZpdvov
         4g5Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794575466; x=1795180266; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5EDfhwWxpQ0St5vx2S2w041m36SjyznpiiNP0pqBT+Q=;
        b=AfU/hl7w5UnA6r6MFc4vCpTbJ8iXugoSKtKGfvL9TlPJUbJVAZoDpuE6Q7tzICMYTp
         y3K01h+7zlBnGuN4np/gTkAM8FycVZnIJ+p1hiDpvdz1R9zQ20WViOqkOl8mZfqWtrJI
         XuGyrfZLDgmoOiVQ7U2YV39vDQNjKJZHIZuHoVSK3aEnZbItNejJnGXgCVcFf115hEGo
         NgfItMzTb4UzIpLQ0NebOxnQYWLE8iFOTKRruC4HbxGeFiS0qXMsg1VZKvzxh687iEs6
         EnFFdZ1SNaVjdV/LXGqixxvcgFxjlwltMmcuKSydj3gjjyyvyuJd1WwemfJgaYVAZKXA
         ir2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794575466; x=1795180266;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5EDfhwWxpQ0St5vx2S2w041m36SjyznpiiNP0pqBT+Q=;
        b=pCofx4ZXSI6N2wbSzwzsp4Y/I4g5QoJlbgViw4IM3+H4SXvQzw1wrhkBD7xpmU3hCG
         3kunf4pIGQn0zgroBTCMrEMEtWaZtT1nO5+4y9iUVNIR5Ho78RTtmeoUiagskLlLHyV6
         mQhUlY6jfW31fCiD2mICibr0x1kA9vrpVWKgmh3O/VRjcVT4eaOFMh3j3hEQLEV03JSP
         6ymrnTCv+cpiZzEdAUPk98S1YcymIb1MtGQg6XspEB20PG+j6kXVb1e8QM1IFTOHvHqc
         HXNtmGa4i/FGCywgEDgcsBdF28toQut/nzgtHLDRnOnQXMpDcoMluTpI1tXOtd9i1w73
         x8RQ==
X-Forwarded-Encrypted: i=1; AL+hErH8MnZWU8MGNpRM5S1ZpxbPWh5pOPLegcTf7jlTKWMWXoARfhYYqevgS5svURszOp5WE8j7XAzOb/ks@vger.kernel.org
X-Gm-Message-State: APuU4Z+Wb5NEXsmTKgld3ljT+NNrcH+6lHX22Oo44DNbzqU3lzIjnOKG
	f9Uy/Bd7+isQ1CKNBAXx+HuyaJv3Z+zAItbTch2ssVJsUKb3lJF3i2zYWpMGeAc+hsq3fDJrIDn
	+AE30B0JX2xPVZHXm7BMMu9Sb0cgRUVxn+hH/6Q==
X-Gm-Gg: AYBFou282qqnLVxf4oonEeMaZRQuw+DLZCZ8CYJp2R+3kMKPrrn/z+xltsLP+WQJQIj
	F4GKsrpd1wZ8yyEhqR4UNK+jNmTUzbUfeVLbBCQOH5cl0IJmPI1PnwMVyp+/TEIAbrqZmlW7aF6
	MNZaMCjilxmi4ibAXjpaGh8f1/Ti3jtGuAPyc23pIK0oqF3nPuhZJ8oquv9NJEPBin6xuH5vL4e
	Dp6hGFa36Sy72ZtrDzH+gJNoHwnbRT7odh+kfoKAyWMD3xhS4qnEGhlEPuvE/zKElu2QarE4yT0
	8Pb/koYe5awwNhMubUGYZN6/c8Lb6aCrodeCpqGDrqc9xRATPHrG6n8Gs32M91IMlxLaTIApos8
	+8qniI/ZmJvxFQ39f3x6K48Du+oRC5yOZgikl
X-Received: by 2002:a17:902:f683:b0:2e9:776c:d52e with SMTP id
 d9443c01a7336-2ee0dcc305bmr25926855ad.52.1794575466293; Fri, 13 Nov 2026
 05:11:06 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111-sm5714-fuel-gauge-v1-0-b9d163fff6ff@gmail.com>
 <20261111-sm5714-fuel-gauge-v1-2-b9d163fff6ff@gmail.com> <20261113-fuzzy-awesome-shellfish-2d93c0@quoll>
In-Reply-To: <20261113-fuzzy-awesome-shellfish-2d93c0@quoll>
From: Asdlerto Korry <korryasdlerto@gmail.com>
Date: Fri, 13 Nov 2026 15:10:54 +0200
X-Gm-Features: AclHuK8kGqcZvYySC7U7ZlVIw1LS4Jh4WgXC2LRiX4VpQIIOmS6OUnujk91mNpY
Message-ID: <CAARotke5983-NFonNAnLbpzhEU2QZ=mt9CSNi=CdBxVshcpD_A@mail.gmail.com>
Subject: Re: [PATCH 2/2] power: supply: Add Silicon Mitus SM5714 fuel gauge driver
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof,

Thank you for looking at it. As far as I can see, this series
(<20261111-sm5714-fuel-gauge-v1-0-b9d163fff6ff@gmail.com>) was sent
only once, on Nov 11, and I could not find an earlier posting of the
SM5714 binding or driver on lore. Could you point me to the one you
mean? If I missed it, sorry for the noise.

Best regards,
Asdlerto
