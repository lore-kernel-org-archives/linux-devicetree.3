Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795455765;
	b=m0xy7swUheCkbcOY80vgUDYeAhFHoSTC+7EGUuOqaPtVKYqLq4llhSNzaLkGNaA3wr5V
	 G0d+aZMxNOvzZX6DLFv55sfQTjDX1E3W0VrF/J/6LTcf1F4Yk+odx51QRmC7L8g6TcWGY
	 ER3ltJzyKiK3RcwizCa7QH6/x1CFRjF7A5Y5GqkM5TRNcpv+wZRFj5U4hyYXoKWHr7b7L
	 +XtMO7HpgvI48dVRV9UGdqDIq2YlDqLBmrEmo80GKK/KCQcBA1mVFWS1DvNj7dVnW+/TO
	 mJvJpV4gurZcmVG0j7GzOXBHJO+unbf1AEpXJbFRuSGZdtWvUWAoyxJQI8wQYitXYbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795455765;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 Content-Type:MIME-Version:Content-Transfer-Encoding;
	bh=/dhg4VNb7Bf6y22l9FV1//VBS5m2KJB8FreMv5POxa0=;
	b=cml2lfsob5RaM0MlabQb3zBdV6sLCdLnlWTJ7H9ggvHhoAAO5FgmW1BnZYDLmOwDpU0m
	 yJKHsCu9jYyeGNq95O+Y3b7TdVKisU3JQHdxRxTcEDW/cQ3DCRC1X9ghYQEy5+Y/lU4mK
	 DR+ozTmJA574hX/Be3neq60LWoZpYj3U9UVDiN+2XBy0AI7u6YRh202AMusTmN2Uyqe2H
	 XYPkLZyOZEDWHEGZj5BPj6FmNfkg7kBEf2H6q7RQGKNaiaPiCVPBuk+iJolxwuyWnskaI
	 SfN7VVgbYiJBy3c91jFVxISF8XMSykzKQc+wctJSX3tnDkpSIL/02oICO7WRKHGdedA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E9a5dG0A;
	arc=none smtp.remote-ip=209.85.210.50
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01463606A321
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 17:42:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01463606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E9a5dG0A
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-86156cf8a7eso3442252a34.1
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 09:42:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795455764; x=1796060564; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/dhg4VNb7Bf6y22l9FV1//VBS5m2KJB8FreMv5POxa0=;
        b=E9a5dG0A8Zas0RMvbh14eJmIiXI7Xw1Wfc1G3I3dW3SQrILdc+q94BfohcPZeHsNiF
         VWNq1BSOcinTp+5s8ErMAw92IhPIdZDhgpTdulX34XX5py62F/E59U4ZyY/0KISGNhH/
         b8Cm/kAc8XDV2YbX4UEBXjMhElcBiEbXL56Gf86c57s1pbkZ1xVpSuGzF/AtTmE3qouD
         LPwv6slg+7UDePPqqKmKKpEnghiHWNsdkl+Bb/ogbm4hCbVcjIBQB68KuB/KdDa0DVaX
         bFXQc+zw6Fhh1i7ZW32Hz6pDRuysg3cqKb1ebkrw9KW2rD7OT90+kXnwuui+YyBDIKlm
         0y5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795455764; x=1796060564;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/dhg4VNb7Bf6y22l9FV1//VBS5m2KJB8FreMv5POxa0=;
        b=M0GUvfGxifziXZPNjCHGAo65C4hu2sag2oCnGfOl7whJY2BFxLYW8gtqPl0p/riT63
         v97HQma16AgZO45fg3VBo2zPXjRmMGG3gq15iGJr30I3NUS3hZneOnSKWuHvUPq1Onrb
         0QCC06GctrjVbdMZruhCrTmpZYECdWsnVuq1zGFmpaAYuKlsDxUhWlIqc+B5CuLR6v2R
         RjWxiLu0DaXf4reRJwL6HhiUJ9nBkczUNseq5SjnTSBSJNvMThZ3rFt7udaL8B4rVM7t
         7PCsZrM8ufqGdUzY4wYly38i42goYeZm8IBJtXDSzQLdoZKYfnG3O84LduGumC4eoqh7
         3A1g==
X-Forwarded-Encrypted: i=1; AL+hErH9yQJ2Sl67kqoG4PDRBg9ePI03ei6dxfzPKp5XWzi7Grw42MksGThS8prSYHIGaskIMs9+iprI26FH@vger.kernel.org
X-Gm-Message-State: APuU4Z8th/pOipHF2FasIOe/C/xEuh65kVOoO8nNX41+FxTcksvdoQhr
	eO6HySgK4TQs5JgV9Y6Jt/F9Edl6PBafFfLQ0xjYiYqQFvXlC40rEc3M
X-Gm-Gg: AZFdTZcj5po7IwUZjR47IY+GkSYQkktFN4rzU/+nWRVSqAMSaMCECPOPouxOM9YcngX
	WXNzrOpqG5QeKAyVjeOFieFJDX9N7dIBwvKSeij+V6eqMlxfadiJZcOkxnp+l1GgP+MiA+1Wa0R
	ZkAAAgPAEtjU49au+KEqewA9jD6+zL2p68vULB8Sv1y8yUfhzsJDqHzjq60bL5YMxL8NZV+LuSN
	GznydO9f2DWBTxpALX78StCptphiLSPmd62wx1Cg5aowihqbICGx7+jmAAzin8qVhFqLHmJFnXH
	ZgLj9Ngy6hPnGaqrOX3n2QoniIH7kVXh5s9s3gTVa6HmOQvO5gMTRRLnBXKOiHqyC4SUEiHO1Ca
	8VK3mWhi+b5vX4F6YwN1U4sXAyIopKsz5PzrIMvpqDxPcG2VMEFuUmI4mYdEsOmBj+WpGCmOYMb
	XWgnn8hvS15+oVJCOsD8rpCkQLzZxAgODAoqdT2sgk3hoGErhMKSdo34E4UzLtQ+/KGpF10sx5H
	pXD7KU12wylqBSutBA0g2pMWJxXfrU6M/7zaq0Ta0RdIQ8SOZOc5s1LXx0A5x1wezVTf6BmZn9y
	a2A0AGYnp/QRdix0yNh2F/b6N753fC4hXou0JaycLu1vnZ0O4jbGII1fYXT3cvLvqgCxMePakf9
	vVc5A
X-Received: by 2002:a05:6820:2204:b0:71a:e0db:7131 with SMTP id 006d021491bc7-71b327d5b77mr9724862eaf.63.1795455763890;
        Mon, 23 Nov 2026 09:42:43 -0800 (PST)
Received: from AMD.home.internal (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8631692d9f7sm9343058a34.24.2026.11.23.09.42.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 09:42:43 -0800 (PST)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: andre.przywara@arm.com
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Junhui Liu <junhui.liu@pigmoral.tech>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Pablo Mazzini <pmazzini@gmail.com>,
	Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>,
	Alexander Sverdlin <alex@sverdlin.org>,
	Jun Yan <jerrysteve1101@gmail.com>,
	Lukas Schmid <lukas.schmid@netcube.li>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v4 1/3] dt-bindings: arm: sunxi: document Radxa Cubie A7S
Date: Mon, 23 Nov 2026 12:42:42 -0500
Message-ID: <20261121-a733-dt-v4-1-reply@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261122004008.0ee8e16d@ryzen.lan>
References: <cover.1795034153.git.enzo.adriano.code@gmail.com> <428efa99fdd0182e8bc9a2ed88b78d2cbd36fa45.1795034153.git.enzo.adriano.code@gmail.com> <20261122004008.0ee8e16d@ryzen.lan>
Content-Type: text/plain; charset="us-ascii"
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

> Can you please add the A7A and name as well? I will send the .dts
> patch shortly, but having the name ready would reduce the churn and
> avoid conflicts.

I added "radxa,cubie-a7a", "allwinner,sun60i-a733". Both strings
are in Radxa's Linux 5.15 Cubie A7A board DTS. Please let me know if
your DTS uses a different compatible.

https://github.com/radxa/allwinner-device/blob/6d911d1582dcccdb5a4c38be8d3c1ee851019795/configs/cubie_a7a/linux-5.15/board.dts#L5-L9

Enzo
