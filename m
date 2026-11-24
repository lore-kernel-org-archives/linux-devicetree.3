Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.128.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1795557969;
	b=q6I0wqpMns/ZLFG8vFaZ0MBJcISPT86wamChB6oY/dwXKwsEC6p7IT0UF7M2OYqU9Yqn
	 GrTiDh5c+6IQQRRzQljqBfvfyB/cbpTW0ANyJOgJ15FNe0MU+xhddNSF7vlCFgC4FrS3j
	 btvXMC7Lyoi43pprKXYziRLOJoA1C+HCw2LpVOYmFc16ApRPDUzbuzpuIpd3KnogeB0wP
	 QbVdJMDebD+v+X8a0bEm3K788N4C4wm/G+tJPRHyaoHJCp6eY6jPwR7xApzf0IMeaALVw
	 gJRWw761HtEVuTL5Kr+al59gbhe7c/fchYjoT06v1PFI/dBUNpSI6zfxOwRdnT921bg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795557969;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=csthBXWoYuqZlipfPcre6aDWuJqEg0KlKenjY0/u3Xc=;
	b=U6nXYsJrPIR3Glmm5tZpJYxNXAeYlOPxxdCz6eqpbGtUiApdLdWJQuNz4Ak4Bvrw4n4n
	 yfb3qc6g6XHz9Ek2Ac9Em7lQFe3tEWsAqJ/q4kbaIFh+KDAYRPlL0tpRsCJ1jT53+O7Kv
	 0hEk6FFcBNrdY1uHu4AGzN+JIsVyS9CVp2mSwvZXh0/6LgCkh5aD/P0/HoQV0Rv+Iak5V
	 UIh16EuAjNt65q605mdFp7lZlyln58Zkm0XkRXdJRGYsNUHjH0HMoDqPzs29iaQe8t3HS
	 6KFTZXwOmmQ7arppT4UXdcYUoDHu4WsMh+8tD3UaZiWIeXlVk8+bVKmsU3rNG3NQh1g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=googlemail.com;
	spf=pass smtp.mailfrom=googlemail.com;
	dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=d27cduBR;
	arc=fail smtp.remote-ip=209.85.128.179
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2074D606A327
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 22:06:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2074D606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=d27cduBR
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-8b4c685c751so44525747b3.1
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 14:06:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795557968; cv=none;
        d=google.com; s=arc-20260327;
        b=NbQYLEu+lrteir9Ccr5VTLNHtyuETa4p5c3WQoUDklV4gt09qILHvVytBdqdJdqpe9
         jEmWUX6DqxKyqn3ZixHi9xgWd6h7qYOukx3cJAKmDxO1tBgcOfIwunWeF+WRjSosC4F1
         EEZfvqoTqVAL3FtJAuCdzHBbob7gz1unFNLIc3fNJYf8aVH1Sud8O7s2AorOx2nDFS5+
         ezVpVFVAmpPQ2iIRx7jC6sAX0U5zQk5ApF/A0DnTmhozKfQ1GOAJ5l13Lzk2Lhn4M8ha
         OVClRAa4nJYc8EmodxZErGVJBtNV26WaeVEjV7KFuEOJ/ALO2xi2jWjQn2B8vrXKRDIc
         YjwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=csthBXWoYuqZlipfPcre6aDWuJqEg0KlKenjY0/u3Xc=;
        fh=s+nkO0ILZJxX0kQW65wLBHVfGo702tYwZmO+JCi5biY=;
        b=K8F+eSWPNVXE7fOWMaW6ZD6GD/YkEtHZNE65IORonggHtR/TeXQEGpke4eI6KWwIMy
         1y9y3B9JfngBtgidBj9LibyFTp51AK9Umsrxm9p4JjdqCyHOHr4rz+WT/k70jcjbgEi6
         85QNLsXdYPQGtruN8wjMrylViGLn5RrCqEGnml6yDXz3HDJlBhQo9MWccZaVffNDDOfr
         4iw66qtL362cli26z+gsbGt0CsTo7UW8EVOZ0S1vhPS67UhSNPzzQ7lz2e/mlPQIssYl
         awCRWvVKUc2+Dxi3NzthP7wCuFSVuyGTyMXQ8ffY2olH5QbFS+qWJnjkx86F0f2+HA9R
         YqCQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1795557968; x=1796162768; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=csthBXWoYuqZlipfPcre6aDWuJqEg0KlKenjY0/u3Xc=;
        b=d27cduBRSCI4Fx7E8JEwH4YkEnonereNTCPDQf1MqytROJcGGGMvHL3Zr80JbXggHB
         E0wcnOWFhVTUKUD0qU4PYjj1VflQoE5ZSxKEd+KccQRNVtKdw9S27TVP7NcGTKSV7/KC
         2oqwPsUkDnZNq1Adzg5tpDhVrgwbH5B3i08sVQv7zGMCmfaxhcJiAAg8b726Rpsr5klY
         lGfmGJlIEYS/AL74iTCcBG4GzGy14qSYjXFjr17lVGwMVGoX61/OvSCSODiZDouWm5XR
         fGn7on9CLOGvLFpcz363wjCsxy9b9KK6GE9dxwc6kQlypkH/RvLMRh0ly0GRsC4yElhb
         ZMJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795557968; x=1796162768;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=csthBXWoYuqZlipfPcre6aDWuJqEg0KlKenjY0/u3Xc=;
        b=btVwrHc17jgZDgOhJ1xs3bIIggYdqOJDTaFSjMw3OB30ghIfHC/Otil7t3IA9YxUYf
         ZkRsrZWWeMFLCU+Damvh8ATvIib/8HRM1eq3LHNr1kG36LO5v1b9pi1A/GK4Y9baWmw+
         Tr5xVBdPjgaEC2aNuSKMAcLnWlDFH0LzpzoXo9izPX6iNPwjTrkHZKOVCe6VKGDeOHHG
         if6T9xlHSVVMy0ootvbOCjM+DLlkuAWUwUXSzxt37wmGwqDCa05kniwUADy0xTpKLEGu
         dMhbu0tX/FJ5sE0Vv8PXFz/C+X4UGi3jupk0FvuML7BCdSJiJdfpZlZRR6kZYm4aX6M7
         j/uw==
X-Forwarded-Encrypted: i=1; AL+hErFLvig4JDULCtbvY7Tt1ccpWOc7mlTgbM2wD81/WX+dvnkAwV4ac633Xbldp0NX5CZAN/6JEj3Hb++D@vger.kernel.org
X-Gm-Message-State: APuU4Z/nSkvXnjMy7Ddn8bSzCLBnBpRSBGruiX1jEWMAAhnw9Ty0ljdk
	WzFIidrRZL43K5c59YgZtPl7S4gQnycfDqpRsETa7Zt7k6mUvW16qfbUdh3l+TfG3ig0ys2m5MF
	ecuX+9qUxQLH38jNysVzpPL4IxakMqNA=
X-Gm-Gg: AZFdTZefYCeXUBWi9cKKASuQYy6A/JZD3y+ubcIFX2QHgEpCLKb0jagcZGHqeD9psmC
	eMKC8lYRJUGorFmKClBMrCBbFYkcwMeOkzrW2ytdwVjN0NjHktLHFGDrJotjO3PfAEuI/Il4QNM
	u2swo34IYVJ6X26TX319WzxJ5glOW2oZwEg4o0xo/CxNMnj5giT9cxTY8nfdrqNyEBX7s67EYZb
	+/W/OVLzpAuPzCBvbxUCkw2EZwp+IDXL3j/wZ9e/bUZ/tnaowniS0Y3IbfzDCw1gxTIT0S7gp9y
	OmEq1cWKkGpvacEEtnixPPsoz4JZX+WxbgVdiARqkiUYWBASN5sfwVgUqWY9NJpQhkhmhqzPVFf
	4rCN8HwJyErf1O5J32SsO0izMaObCLH8B2iYEcqpJ5pVHJvX/9aqXNQgq7d1YLOozD115mg==
X-Received: by 2002:a05:690c:4806:b0:8b3:33cf:1ff8 with SMTP id
 00721157ae682-8b52047e1abmr62214977b3.51.1795557968035; Tue, 24 Nov 2026
 14:06:08 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261123-meson-drm-create-hdmitx-phy-v4-0-3fb94f5534ca@aliel.fr>
In-Reply-To: <20261123-meson-drm-create-hdmitx-phy-v4-0-3fb94f5534ca@aliel.fr>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 24 Nov 2026 23:05:57 +0100
X-Gm-Features: Aa3M54obAOudEtwcvYkDuGnJHvL3A4XdBNW-oHonc9K3rZo32rUzvFY7EEi7VPQ
Message-ID: <CAFBinCD822UPQrrd_8ZbVRUVCVJ-3pGN69vbZBxUE+0yeMcysg@mail.gmail.com>
Subject: Re: [PATCH v4 00/11] phy/drm: amlogic: Extract Meson HDMI TX PHY into
 a dedicated driver
To: linux-kernel-dev@aliel.fr, Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Vinod Koul <vkoul@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Ulf Hansson <ulfh@kernel.org>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-phy@lists.infradead.org, dri-devel@lists.freedesktop.org, 
	linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ronald, Hi Neil,

first of all: thanks Ronald for picking this up!
I like the overall approach. Before I dive deep into this series I
will finish the code-review of Valerio's AUDIN series.

Two quick notes below.

On Mon, Nov 23, 2026 at 8:38=E2=80=AFPM Ronald Claveau via B4 Relay
<devnull+linux-kernel-dev.aliel.fr@kernel.org> wrote:
[...]
> Overview of the series:
> - Patches 1-3: Fix compatible matching in meson-gx-hhi-sysctrl bindings,
>   add the new amlogic,meson-hdmi-tx-phy DT schema, and allow the
>   "hdmi-phy" child node under the HHI syscon.
It's been a long time, but I think we've been asked by the devicetree
maintainers to have reg properties for the nodes within &hhi
But I can't find the message at the moment.

> - Patch 4: Add the new Meson HDMI TX PHY driver implementing the HDMI
>   PHY configuration ops, along with the temporary legacy creation
>   helper.
At quick glance your PHY approach would also fit phy-meson8-hdmi-tx.c
There seem to be minor differences:
- two additional enable bits in HHI_HDMI_PHY_CNTL1 on GXBB and newer:
HDMI_FIFO_ENABLE=3DBIT(2) and  HDMI_FIFO_WR_ENALBE=3DBIT(3)
- newer SoCs seem to have HHI_HDMI_PHY_CNTL3..5

Meson8/8b/8m2 HDMI support is not upstream yet. That's why those SoC's
won't need the backwards compatibility code. So if you need to tweak
the driver: feel free, there's not much you can break!


Best regards,
Martin
