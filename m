Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795771054;
	b=Ci2uh10ilxsRdaFzoKway0ZpCZLk/6yhCAQ8Kx0n90iXAggzHZBbp78f/7oSF/LoDOVc
	 7e+2/qBStRLlnLGBSoLyoX9tOMBsRG7iZDDTCrKQmu1GzOWLfoiU7kiAMpgoX7AOdPt01
	 4XAH+e9Yq2HfvL7JhkjXWBHCv0Uyz2RhxwaoKFQSpCpZ2G6uq3PABnTiS1/yHNN+dnUvT
	 +Wvo5CS6nZJfzYYWaAK6LDHMBaOaw1tgmfngQ9seEypPYeCX3z99V6Y5j+6v2IVRgdPpa
	 iYNQkBAlDDi4PfelMVu+BcnRN95YtEfLtlcCxRz+8lK9QMcmMV4C3vJcP+d5mA6ZgVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795771054;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=iJDwnblXoPc0E7sZTKvXtcZa2lLf2LQdU3Jx0B40YZ8=;
	b=fVeFpQLftalfn4oOZSCY/tzp3rTuXmjSvbPWX3FlhTJQHjKKmgWMBMC7ExATKUcPGZFo
	 91KFLbnn/XeCNr3UHhnWpdDhWaPnFXSEs8qPYDXG/gOCfUz1AOHQPK4pOmwZnx55KHYsx
	 gyja1SxgTiQpzDMIbYsSYaUf5ZCQ2YRnSxKm9pYDSf0X+3WlcsyegOL/M0RPDOEml6/Q9
	 6/6Lg3BGEIFbl1btcXpwS62JG4++ppUuZ7inJtOg2NczhnfO8YmpEDcFVZdonybPgK4HW
	 b8+byEA+dP+z3g2iNyhvsxeuy/g95/9vUvH8gPPfaR8klmaO5rjGgz7cd3VPxwNfOEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=tuxon.dev;
	spf=pass smtp.mailfrom=tuxon.dev;
	dkim=pass header.d=tuxon.dev header.i=@tuxon.dev header.a=rsa-sha256 header.s=google header.b=aI0lqB3a;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CFA5606A323
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 09:17:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1CFA5606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.a=rsa-sha256 header.s=google header.b=aI0lqB3a
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4bb64ef5a00so63899835e9.3
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 01:17:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1795771051; x=1796375851; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iJDwnblXoPc0E7sZTKvXtcZa2lLf2LQdU3Jx0B40YZ8=;
        b=aI0lqB3aCQ/4qBvwVRrDv3T2pKd7GIXvwQaW/Zh+LDPEWa17gOnnrr1BRlBIiBDLGi
         3xPfRxJaZjTyG/xvFc3dneK3xD/vNNrfe7lzCHKDtGApXlb18j3sVqNfkNpyZlK6n953
         YXQWqBLq6DgnAMebNL03Z+0dRUS7k1lzTKtoLXWxp18A2ag/Vuu/j9v/pXqDglpge3+U
         0aSVeDRd0euIBB0pClkJqh+3k8ujN4D7hiwgn+JHi6wQmvh/EL4Kk4CFcoCmmj/IueNy
         dsgWcm41bUvXD8zNf1yL+83BWKY+VC6T4IQuzt9lZYBAlNR/nIKXUaaUworjOtwk/D1z
         Ktag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795771051; x=1796375851;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iJDwnblXoPc0E7sZTKvXtcZa2lLf2LQdU3Jx0B40YZ8=;
        b=IKeTEDsjj6OPGndCUE/tqwrwpZPnUD+uJwVtRa4YOLDrJ4mbGEixXcZCllqy5/0WzW
         TUGwki/MAlYzBsX/xJ3yq2YZHaapjPL9VXxP8V0HdLaExfcfvrOlim8Yq9fj8A5KA9a5
         QFXwUfwfSHTc2YPBZ2tKGzkp63JcrFl+TICUpA8iWq73QufCxKtv0l3cpqmd3e/cGseS
         Mh57uOSFzScVQj9FDVoXtAHHD3VDviHoq6ZZ9gxTogXm6aSTXFmGIsmCv7aM29XWGVUk
         0WqXzCvTcQfICS+vkJoTtECxAqq9fJQU7Ewp7UNPuyZ0EdUlD2i8u0l4i1USKWZPvlqY
         oZOQ==
X-Forwarded-Encrypted: i=1; AL+hErF2zeGl6y0YR5PCNau9UJRC75Ei0sfE2E3Wzj5/ixUF/GTB0czbcoSnZJYin+KV8hVUElkqUiRX1nWp@vger.kernel.org
X-Gm-Message-State: APuU4Z8tYyZMFKPXPkrgSTnV8ympk4A/9uHFcD1qDDm55APyr5p0q1rZ
	p/+SwKS03INtI1iaovqAoSw1ZGJPbognm/r03IwhS8WL5Wd1TMu3y4ZNayOuRiobT5s=
X-Gm-Gg: AZFdTZeSzIIegwsoGQ+synF7AU/6gF8fZLDetHEHaYqKE7P9tFCGAGZKOy+FK4t/ZrE
	z+ja7sQlJ1s1xCvV/GjIibOSbgyWR52nUB/rJWF+IfJN1cD+1CAcKj6QTo9lfs3DlK+f058rtnf
	wwX4p8wv2WEQSsHQvmk9Nppt9Xaw2ie5hJbIT1hxJ0xv9qFA6NGqhjpgimNheBOXl2Xz8+S/P+W
	6xmG/7nCf6UMDWFxmkGrAVXkXVyUSpdKw47F7qA4OKE2CcukvEhj9UF+ddM/pES3YaV2RAQTz/y
	PIp6NPJPPNXDINdVdczknbxIBRCPqzZBwvXv4Z02aaUf3MHcuyxajUwcMKyc+Idt5eyNro32TOl
	GuB6UGkmyBuLBaz2RK1HnWSOp66SCtupMR7hZPon/32Bh1I9kwVAjv//N95FZllg8UK83yxlfdo
	LTCEyapmK2ZzxLcWif8aUEgXP+heTTYIJ+YOPTnS0G4Ayv9TNpxcpI1v4nW/1gX5PEFYCoIQb4K
	UWxQea9d9/1DQzsjaIPBmCVLWh9IjJAbnvRBiV3G5g2m3hENAZ8qZPSg2dW+9JMmwZnE3mS2q9E
	/Slmz/w8Pk2AgaFRnjUwVRwrtBxIpwwJ9/Nc
X-Received: by 2002:a05:600c:1389:b0:4bb:7347:d5c0 with SMTP id 5b1f17b1804b1-4bb88826937mr438432725e9.9.1795771051464;
        Fri, 27 Nov 2026 01:17:31 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.114])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8526cbd0sm896151645e9.0.2026.11.27.01.17.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 01:17:30 -0800 (PST)
Message-ID: <5c05644b-fcf2-41e7-a012-338ce7eec8d2@tuxon.dev>
Date: Fri, 27 Nov 2026 11:17:29 +0200
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/7] i3c: renesas: Drop comma after OF match table
 sentinel
To: Diogo Ivo <diogo.ivo.sx@renesas.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>, Linus Walleij <linusw@kernel.org>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20261026-divo-ssgrlpcsrc-2966-i3c-v2-0-2e76b87209bb@renesas.com>
 <20261026-divo-ssgrlpcsrc-2966-i3c-v2-2-2e76b87209bb@renesas.com>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20261026-divo-ssgrlpcsrc-2966-i3c-v2-2-2e76b87209bb@renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 10/26/26 13:35, Diogo Ivo wrote:
> Drop the unnecessary terminator comma on the compatible table.
> No functional changes intended.
> 
> Reviewed-by: Wolfram Sang<wsa+renesas@sang-engineering.com>
> Reviewed-by: Frank Li<Frank.Li@nxp.com>
> Signed-off-by: Diogo Ivo<diogo.ivo.sx@renesas.com>
Reviewed-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
