Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793839538;
	b=iglVlaNY9xblb7C70EELUHHPvJidIvop0uVaPBDJSZv1VWWy4Kq6WEsf0U21t0q4rZq8
	 wkJMfb/CT3F8shUKfCD64l+0jiAirOHlVyFTJfXQRyAriEXb8JT2220DIwM3ihwJqOk9T
	 oiui+JskHAAwYi7qrejZKrvb6pUlxTNZ+w79pcYF6G8kqGpgy/ksPGQcIQkVOOd5VRoxH
	 Y2xtDR43Iyl6erJ615t0pB+Me2gYia+plrUwAmr+XP7ZDLetloF8zkgYp0b3N1yDS0HuV
	 klMBmxLdm/7eK5A3ljiLqV5fLFJtpisjzwe8Zr/Kn6McYPIVI6LpyI2YZyNzzVLnLdg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793839538;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=zXokrLb7sK/T1oSsUCjK0AvMp+oDfMgAYTJvXTl1MyM=;
	b=SfZYHRc/RcZUJj8L2bsNB+dRtuexH1BgCTUEEZXBKcGFTI6c/UMctVqTutAIfSQQBipM
	 cPTrrZQuk2X0d+MwuRKy2HycoX4vSbR7QHLlP4/hcdCiSltr+h98Thjh+YXN/thzhTx3G
	 jdtdP4pRCMPWXh7c/yQDDauNF9jO1k0y5PBO3pHZvayYjPsa6CKtVEIqqLEExEw5BxoiH
	 +WJE581Oij/IAMAsX6rjfV+duOpHx7zQ87dPCDHq/CKOBQPuvsAS+GvzLw1AwEmlAB6Ka
	 Bbmf2I/YpfOiapLSOqnFilz8ubrRBoqHT0Y3uyLBpPyo3cD4VpPDlM03lNVdMDM9nyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.214.177
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29391606A326
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 00:45:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29391606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2e98798cbddso6599285ad.0
        for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 16:45:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793839537; x=1794444337;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=zXokrLb7sK/T1oSsUCjK0AvMp+oDfMgAYTJvXTl1MyM=;
        b=O41FQ3jxfVG2NO+FWmja6xWnLXDKCdfhtBI6jWao+rr41EYcdqGyzMClnHmKr2onWs
         j8YeYMbX7FbKd+0F044qtYJoInXoE0Z1qgQWpGTSsMu71v8vD4LrpXo/XeM+Gdhb9LiC
         V0SGDNZqy8isDj9rRLNw8xgybTv+CO/ThlPUf+NfCO+nv2Ud4LF2WxiOzxuSTNOS6UJI
         bs8wrEJDdAO3fuMPACp8JRBSEBJkPczZTsOlTlj3OhbxTVUc3J2Lc5ZMznzDFn9pjKYL
         LZE3FF1AtxawEfRAdGUrluQ0ouYEWJ6scJtqFh5e+OcLu//WQhcLtx5pNAkpuxez0y3S
         FdqQ==
X-Forwarded-Encrypted: i=1; AKwUvBwyAT6xJHPIT/X1O5/wO9Dp2yCXr+4Pct1NmPLu5X5NaN4bMbST5InnoQmRD1lGEpAcIin3HJ+YyBid@vger.kernel.org
X-Gm-Message-State: APuU4Z8KyHz7dOXkTGbrXiupoeE9a/9xSf4LFrpdwF/5/Fq9e1BM27GC
	DKva+KcT0FuIwqE7GNBrnX/JgC7P5d72Z4949yyku1d/HNoTjOa79jw+PcQWLbU+
X-Gm-Gg: AYBFou0XqbeQHb8dE9oA3Lb/2jgEFTDPSsE0PLkV41dhqJPT46gW2moXcHNUstj62Li
	nWjX2jOGuNi8gx4k4o4Y753ZWPl6nXfYwDXu3dkRh6DamE8KyBUlFiRV7VsNy3a3850PeLgVk7X
	senx/2D6iQGkhquVC3El851fQN69193u8dnsWa1yh7NTD36hhbJbQoHZrVD5skKi/ljXnhrrHfK
	US+ruMncOyS4mNWk4TYbqO6bLn3vRku1H/0ASqJ3XzES5HP6hvOytrUf9SlVdCd4egdXn9bvQCJ
	QiECzSIUENOYBHNIdrzwNxVnf12tcevt9AUr002s1FUQcLBDTQSKyEBMI+b4LDTUP6Sx+ndwz4Z
	/U5Yv4De0oVGcl5LgpItslRBmXo+AfkHotbL/RwfDCesvTFoEbNMaxk3fhDzaiHefycIKnUl85k
	ODPNK72Kvam10c7uxCdFNqxCIE7cKatRGBJgrF5e+TBlmzWHwSyq7FKyQMwqtGCpqse/1WpV5tM
	acAViRl41puEVUjxZY4eQ++IOWsfF6WosjKBHLacB4DL1uouR7g3qb8nspCoYe5HTWLKymOeTTe
	IAKdg1HseTUcsyITGYTz7RJrjPs4gAL62OIEuZ/C3jcGrddSoc8+hPZk0Fa6p+wsjkJvxo9RK+k
	N8OcUZ5arcnXmOpruq9gmurmKtHA3EUeQ/8ExNNIIQ/Erlg==
X-Received: by 2002:a17:903:1b4c:b0:2e4:a360:fcc6 with SMTP id d9443c01a7336-2eb364bb93cmr170490865ad.35.1793839537427;
        Wed, 04 Nov 2026 16:45:37 -0800 (PST)
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com. [74.125.82.182])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed08fe463fsm11916455ad.24.2026.11.04.16.45.36
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 16:45:36 -0800 (PST)
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso3219025eec.0
        for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 16:45:36 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvByuKyXrk2lFdU5VdOMx6emnVLaw6E/qVNTMKzxdM42YP4ZoByHO2ra29FW4Ui8ztK+PfhD9kBJ4WJIJ@vger.kernel.org
X-Received: by 2002:a05:7300:a945:b0:35d:d9a9:e455 with SMTP id
 5a478bee46e88-36a423b3556mr44653586eec.21.1793839536384; Wed, 04 Nov 2026
 16:45:36 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-sf19a2890-pinctrl-v1-0-4bb83afdbacf@telaak.dev>
 <20261104-sf19a2890-pinctrl-v1-1-4bb83afdbacf@telaak.dev> <20261104-enlighten-handling-a309345b229a@spud>
In-Reply-To: <20261104-enlighten-handling-a309345b229a@spud>
From: Joseph Telaak <joseph@telaak.dev>
Date: Wed, 4 Nov 2026 19:45:25 -0500
X-Gmail-Original-Message-ID: <CAPY4CJ6Hkd8sD=tz8_MTQ=OMvD8Evdhc6G6zYPF0tAZzOXL8fQ@mail.gmail.com>
X-Gm-Features: AclHuK9jO8Qr2MXvkxwK5NuEISMbX4skXJyK2Kf-3m6ima855rFUsEPggdBlzRI
Message-ID: <CAPY4CJ6Hkd8sD=tz8_MTQ=OMvD8Evdhc6G6zYPF0tAZzOXL8fQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: Add Siflower SF19A2890 pin controller
To: Conor Dooley <conor@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Chuanhong Guo <gch981213@gmail.com>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> > +        $ref: /schemas/pinctrl/pincfg-node.yaml#
> > +        allOf:
> > +          - $ref: /schemas/pinctrl/pinmux-node.yaml#
>
> Same format should be used for both of these.

Will do: v2 will put both under allOf.
