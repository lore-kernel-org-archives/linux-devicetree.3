Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44F862D2481
	for <devicetree@vger.kernel.org>; Sat, 21 Mar 2026 06:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774073367; cv=none; b=rrTBmIyCc0Jm2yaV/U1Z0+y5M2hZDzGLsCuvGyr7HHPmtBYYAQs3dGH7LFxaZl532wfO/qMjD6mXj0BcISFT4gzMyfWM0BFMFgHZGGmUfytzvtjvNvnXpGTA6KkODqOFTy7zhjDVq2A4YJrM+zJ8e2JzhPDP4kDy8cUymFP7qVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774073367; c=relaxed/simple;
	bh=pbTYppHZrautnSJvAY6/Xio2GoDuVyueigQEZWiKDKo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QLLBQK8F6pGWW+bZO8WoQPu1RYco+AdyaQKVNSc9yGw583YoI9I3PNSBOKkp7lPQvXMEO6YildIKzUY5wTzsV7D8kue7JRR0/FFelR4vcP6Sjw1lauksPYQZBuLfFeDI36S4ultgpT6WgRDLXr1aGP2ay0dqKzhuRL3/baSdma8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jg5WcoTw; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jg5WcoTw"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b9382e59c0eso183024066b.0
        for <devicetree@vger.kernel.org>; Fri, 20 Mar 2026 23:09:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774073364; x=1774678164; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=npxM1GwTVo8Raut0ki2fSD3AbxxZgvtDYF9h8ekmQO0=;
        b=Jg5WcoTwOoo5NOE32yZppbMlZN/289I9Xxe9BNAuZ7VeX5yad26YZiwnKdt8QRlWCj
         71hn7ftPC8AERk+hZRFQTxWWh8YD4c7KaOeRKtpgNKdyOSWmqZ7O3wxyo3ALdU46pNpR
         fVsZPeSEBeMDtCUtBF7sWM/TDaQIOs29DSU3QuRkmFfLoTQDPzm3Ls7zvay0iLdy+Am5
         +4FPFH+ZI7uygo+qeNBLhlRvvEEXumXkAQmXQxzt/TY9BfA8wiJd7nTcXFJ2trjOYPXr
         s7ElzbufrJnNxRzme2IBS8/oQKDsLhsohH43Sk46fecYndyGk/Tl7ShROv2uNeFqkqGl
         Lnwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774073364; x=1774678164;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=npxM1GwTVo8Raut0ki2fSD3AbxxZgvtDYF9h8ekmQO0=;
        b=Uas49bIcZvA3L9pjMzqwixmiIZxS5PX/tBHei72muXLYmv/QmNCg8dpXL5RE0zFYFx
         ZIZ6g5WCZik6nwmxrc+4ufpyMGL6SboGWn8jMw6/sGnWCV7VRKQBEFr+IlOvdU1mnXV5
         BJq3CZF2h/VjDlvCJIa1ZeVBu1Tym+Z1knUYtLgOhuDy+HSe8TLGMDVRyKao3h3avJB/
         3NTCRUCNzwYhguv/7GDPzVd2+sV8/gGb/Qg02wvr9MOmdRc6cesDMCJ2knj3IA2or8sc
         xCdchwTKVv2coRo4Y/0f3dHPSTJw28Ie+fG6gSLg7g1wJPUKek/aBkMDQLHpws9E4Cc2
         gdiw==
X-Forwarded-Encrypted: i=1; AJvYcCUyyxOJ3IedGnVdsq7Mw3HTZKTWVczFBm58Xty5aFxn0/PVe2g00bIOryYQ8dDnM3h1EGfdB8Es1PN8@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9zsZR9zDkkCdB1hAJt3oHa4vI6AVCQUOM/+qelqjSrYsuVHjr
	aOTwddGNwHSt6oQpI9zECn1K2RoFv8BeBxtiTPkFnc+RLEQm64e0QreU
X-Gm-Gg: ATEYQzwFSqh/c+mMbaDRi5eU+o2SVAmF+hsoU+IUQBe9hxS9mJi+oBDgTqacq/DT3ZG
	OOr8KuNLeMIEOodXD8CHqtN+hhvOW+vM1DU65bvNRX95NS6iNrMCdT8gmP6RjyE44eLJ2zyzqfz
	UayhHAsisDPzEhLVeg5/A00e3NXTTF1Vx0ikpLAl8EYbMibT8qWFy6QcrcTAs/hzF6BLqP7pphG
	i0m8p4EmRr10qlwFp4Qw0bi/Wl5EFt8tgRC8WCfdKRt2WrePj5gnv2+5OXWladHxifcKp5CH4Wh
	wpaLsxg0je+ebjrKR4V/kqSYNtrkZYb+KSd9go2Ycq6XleCz58YMbNsbWGB8KeVXF+pT2qDsSoO
	ORNb3YB/E4gTLp/GtvRhT9aExmgKx8XT4Pki1f+drC+Qtw9Bli7eTk08dZQU2Ff9wmIIXW/2rMH
	/1mgD3rw3yjkET2J85faLiZ3iDB8qUk+EBIEc=
X-Received: by 2002:a17:907:394:b0:b97:7157:e1d8 with SMTP id a640c23a62f3a-b982f362ce4mr278337366b.31.1774073363501;
        Fri, 20 Mar 2026 23:09:23 -0700 (PDT)
Received: from foxbook (bfk214.neoplus.adsl.tpnet.pl. [83.28.48.214])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9832f88d02sm241345266b.14.2026.03.20.23.09.22
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Fri, 20 Mar 2026 23:09:22 -0700 (PDT)
Date: Sat, 21 Mar 2026 07:09:19 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Magnus
 Damm <magnus.damm@gmail.com>, linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: usb: document the Renesas
 UPD720201/UPD720202 USB 3.0 xHCI Host Controller
Message-ID: <20260321070919.1687f991.michal.pecio@gmail.com>
In-Reply-To: <20260319-topic-sm8650-ayaneo-pocket-s2-upd-bindings-v1-1-84e4ef564022@linaro.org>
References: <20260319-topic-sm8650-ayaneo-pocket-s2-upd-bindings-v1-1-84e4ef564022@linaro.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 19 Mar 2026 09:49:32 +0100, Neil Armstrong wrote:
> Document the Renesas UPD720201/UPD720202 USB 3.0 xHCI Host Controller,
> which connects over PCIe and requires specific power supplies to
> start up.
> 
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
> - [1] https://lore.kernel.org/all/20260220-topic-sm8650-ayaneo-pocket-s2-base-v5-1-1ad79caa1efa@linaro.org/
> ---
>  .../bindings/usb/renesas,upd720201-pci.yaml        | 61 ++++++++++++++++++++++
>  1 file changed, 61 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/renesas,upd720201-pci.yaml b/Documentation/devicetree/bindings/usb/renesas,upd720201-pci.yaml
> new file mode 100644
> index 000000000000..8b8be572c930
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/renesas,upd720201-pci.yaml
> @@ -0,0 +1,61 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/usb/renesas,upd720201-pci.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: UPD720201/UPD720202 USB 3.0 xHCI Host Controller (PCIe)
> +
> +maintainers:
> +  - Neil Armstrong <neil.armstrong@linaro.org>
> +
> +description:
> +  UPD720201 USB 3.0 xHCI Host Controller via PCIe x1 Gen2 interface.
> +  The UPD720202 supports up to two downstream ports, while UPD720201
> +  supports up to four downstream USB 3.0 rev1.0 ports.
> +
> +properties:
> +  compatible:
> +    const: pci1912,0014

Hi,

AFAIK that's the ID of uPD720201, while uPD720202 is 0015.
At least that's the case with mine and what hwdata says.

Regards,
Michal
