Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794175500;
	b=U/2J6PasuXGzd46nKt/uIB/6SPmf4+6LonukyhuPHM1DhAbBAarNmMZV75cthypJ/gGU
	 btJiUl7NcBC8BHF/J25fzpHeZK0FEnVFE+nFSYxm+BZKvQOM3y1QdAmus91gTzroeVfSl
	 49xtqLDJNkq4RUaq5/iSKdCE1wAGDYr7reDo4qBEoyDCsHyogXAPG4Y9nhB13U2QebHh4
	 8IHtJsMKrPH6lcbaOForUiEuWzwmxkVmyRapVz0h597BGIlUOykY27/0RsZZV1s5IILO6
	 Z843vVd50gBpUafJy0OBhTpdMYa9AIBr2aS/HqszcqkdVplgYBeIv0i4MKmIYezasxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794175500;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=H/CcamKTQfMjaSJiajoERENx/3ROWxMLBiv4UmCbwv0=;
	b=Jf5G2yjmF0w/CsAcGXk4FylLfxhyOnfiOf+bjKUErtlZMtWi3dANdBSUP+M7ahli/mVW
	 1xo5zOqodmDxRYTE9eWS5HKVutynmT4oLoXjCsMcMIvfVgg2MGtn45NrhD4r1RK4NTg8x
	 N8g/KRW2BFBttlosQ1717+JJJf5jMi9utaUPtUglvqy4bmPZ4sgfZr+4Fp0ppDijyUKnL
	 UBoGCgW8maTFoYwVwo8RWtwzqh0XumI8sWRma1FxW4haC6Uv1l9R2o0cvYL1LjTle4MuF
	 qTwtm6NZcp7smjpXh24TM/u7ONlMaMWlCbuEm4l12tUROM4UCmeRXYmKaXJcf+aUQ+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.210.173
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96182606A331
	for <devicetree@vger.kernel.org>; Sun,  8 Nov 2026 22:05:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96182606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-8b5c3288e6cso95446b3a.3
        for <devicetree@vger.kernel.org>; Sun, 08 Nov 2026 14:05:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794175500; x=1794780300;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=H/CcamKTQfMjaSJiajoERENx/3ROWxMLBiv4UmCbwv0=;
        b=ollkQOt2phDHLMuARjnMGwc7O4yfeIkMZOJwfnVGvEZlapU67ShtpzrVXO19/4Dz8P
         7Ty4D4MDCr+5XNKUauxD0KoV2n9xQTsnS5wGzGhGlvpKy5fmeEEbzSBnaMF//8kiuCPu
         dS4s8yX0TQ67o/zacpjepBlAkMSSCgqfT8BUzhvR+e97v6W0WaOIP1SKvOEauig75sIf
         3xBZ0DEO6KOAGR6bg17LtDaPz7KgsWj5XYeuW1B7aWwdrUW3hlz0nYEo2nUFX5TAwfjz
         0IKwP1PTldKG4aXK6zjnASRjaxsRMXqtjFtvgYJQwJsuP9eGeYMlt0MST9xPcl6vnecA
         AD2A==
X-Forwarded-Encrypted: i=1; AL+hErHQKlmt/EkPdAZWAr4oH/a/dxLQY099NQ9jYrmf17lkdlC7iG0t6T+eS1rMNy9JyWUzli9B/4oP/S0I@vger.kernel.org
X-Gm-Message-State: APuU4Z/j1FsHk4X/MTnLgi4rupMgv7KFctZJJPqluBXzdUizfuic3sei
	wa9jNDQAxHqE/bxN/nVmkyZ6kVMYDnrQPM9j8rugfYeNuMEhNJS8lL/Use8WbwLn
X-Gm-Gg: AYBFou2IekE0Vy5VBmVTagR0TdZ1cgLnLUvm2w7BhgR/KR8+LOuZB8sR5P/450VbVaw
	ECcUxVbxm9Mx2C1JFJFJc1zeLhIRgbap6EI6ctjr4PKb+agMW9nXQQ7rO+DClpGJUfhqqG5by3J
	JfWfzers9/2V7vnj6hsCpxkxw/g8oXG6Ik8ESYRR+VRTb8g+vKdcceZU+YkwhoE+Y1wEyDFTPXn
	vzCOj/oS4HCsVxej5bQynPDIZjgoE4+FNbKGOML7x9Wz0emDWmyzJl5K36rcAw4cKzbEVaxOGON
	u3Khj+Sp7sf3gDOfDDpkoAb4fZSuWRO3Qy5jlkmmJbVk2C9tMLaE4/I/vA4QKUcE+q5amsdhXfY
	CyBMYm7/+gOryM1tdQKdBaXbty3QakCoIodjl7crQz8lV/J6JSbx78Xq4yKNWe2ojF2DmtxLtWk
	P/6j4dYxFRasYBw/7wScT2MlgFuChFAXe30HQn762dhsGN52Q3SZGw/JRP15p2ZE+r5xX1YyH29
	HMr/Z6A6HE631n8eHoMumoY6iC6utqcLhZmYpwot1HugkYv7KF6xD08Ai90nkKtxAMVR2uDZ1/Y
	PUBrhMh6ymeIUd8ZslMWWZYaFzRQpGjJZJUwxvr70E5RunIRJ4mGG0pkA4DEzPz3Xd9AC20GYd3
	ZUHpdlrtkzTG9x6fSfT5whP8lOAhNz+CVYBjglTbInwA=
X-Received: by 2002:a05:6a00:1701:b0:8b0:5438:86a4 with SMTP id d2e1a72fcca58-8b66c3f23cdmr2141978b3a.16.1794175499966;
        Sun, 08 Nov 2026 14:04:59 -0800 (PST)
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com. [74.125.82.182])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8b646bd4af6sm722404b3a.2.2026.11.08.14.04.57
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Nov 2026 14:04:58 -0800 (PST)
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-3720addb068so441592eec.1
        for <devicetree@vger.kernel.org>; Sun, 08 Nov 2026 14:04:57 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHyuICdcbZheaN+6WLlTL6t2ckEca+cIF9s0k5MgTWDtG++hvkLioVw/r7Os8iDXRsL5a2IYlgIvuzT@vger.kernel.org
X-Received: by 2002:a05:7301:9f03:b0:370:cc56:b61a with SMTP id
 5a478bee46e88-37258c2acefmr5845036eec.39.1794175497365; Sun, 08 Nov 2026
 14:04:57 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-sf19a2890-sysm-v1-0-a4fac07df823@telaak.dev>
 <20261104-sf19a2890-sysm-v1-4-a4fac07df823@telaak.dev> <au4Hc7LAXH-ujDPj@monoceros>
In-Reply-To: <au4Hc7LAXH-ujDPj@monoceros>
From: Joseph Telaak <joseph@telaak.dev>
Date: Sun, 8 Nov 2026 17:04:45 -0500
X-Gmail-Original-Message-ID: <CAPY4CJ6PzrCkNuHEib8WrYoYw3eeUuK6rCeBYPQg+iPzbVEECQ@mail.gmail.com>
X-Gm-Features: AclHuK94cu5PMN_CR3MHF5B50stfHn_PtAIMtZ8wHEf1hN8qZJlhM6zrg1Ysdd0
Message-ID: <CAPY4CJ6PzrCkNuHEib8WrYoYw3eeUuK6rCeBYPQg+iPzbVEECQ@mail.gmail.com>
Subject: Re: [PATCH 4/4] clk: siflower: Add SF19A2890 peripheral clock and
 reset manager driver
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Chuanhong Guo <gch981213@gmail.com>, Yao Zi <me@ziyao.cc>, 
	linux-mips@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> Please don't use <linux/mod_devicetable.h>. <linux/platform_device.h> is
> good enough to provide of_device_id already. If you insist on full iwyu,
> please use <linux/device-id/of.h> instead.

v2 includes <linux/device-id/of.h> instead.

> Please drop the trailing , after the list terminator.

Will do in v2, and in the gpio driver, which has the same.

Thanks for the review.
