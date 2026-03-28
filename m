Received: from mail-dy1-f195.google.com (mail-dy1-f195.google.com [74.125.82.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82C2B2EB856
	for <devicetree@vger.kernel.org>; Sat, 28 Mar 2026 09:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774691310; cv=none; b=DU8IUA9ocF15rdkqwyGE0Iqc/OW7N6cCAlGdHJ1bShk3RC/DFV5Lkd0q9+kZzxxLGYCqv6Z1F8LTUsnZ9qjeky99YX0Zzf9a/48lbuiN2EaxqYh4Rpx+eDc4nmoRGOqeFMuqjr2L/zHslmqhCq4y8dWCeBgfbwhbb+yntmznzx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774691310; c=relaxed/simple;
	bh=H0NsGRh1ZLqqimD4Zi9vPUYMg9ZH77e8pUdX2q1gGgY=;
	h=From:Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:To:
	 References:In-Reply-To; b=Q6OIGTTbrnl4XGbQIJVOJTzvJiSpEb19ToI9nMG0tsK7aiZhLJXI6/bywm+r1tekc/Af3EAhs4aPoJjHFpkkycQs9xnNs6xVNFhW4Qf9BMagjJ9vXhBgWvK5KWj3F83ZlZbc0GGBsdhDcNsLfYtsyuqJvjU9dA5UsInH/s0VrQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eXMZ+ZMl; arc=none smtp.client-ip=74.125.82.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eXMZ+ZMl"
Received: by mail-dy1-f195.google.com with SMTP id 5a478bee46e88-2bdcf5970cdso1855563eec.0
        for <devicetree@vger.kernel.org>; Sat, 28 Mar 2026 02:48:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774691308; x=1775296108; darn=vger.kernel.org;
        h=in-reply-to:references:to:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tRlWsjp96tD6U6Z/Cd/j4p1pGmRJaWjFo7e47fa1C/A=;
        b=eXMZ+ZMl7sw5pk8rITM/ZHRIW9fG4x2xSaxYstxM0qXmmO/yTNlFRkkgItaLMBeox0
         H+1Bd/yh69vGmLbimCFPCigBbHa8r2/vQyAdo0VfRDRixMP/yGI0zLBt0BurAe171Fwg
         C+wTfN00pdxz5HxD6Tla7u5Cd55JzGTOz9k0bLJ7bZiH+TjA5vM9TnWr91zAYbWlDvis
         32U9bvjqzKhNKEgClnHAXdCR0+7rG60BNBvNu/Z1B/UnAplEHsyPU8f3g/vB5Wz5qSpr
         eaf/OCuNWHyFdQxxE4iFmrz/D5ope+bY4ix0qlAGWIhIIPRDRz0xOaPjgVaXjw2zT0y4
         +o6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774691308; x=1775296108;
        h=in-reply-to:references:to:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tRlWsjp96tD6U6Z/Cd/j4p1pGmRJaWjFo7e47fa1C/A=;
        b=kg+YiXG97FqcQ+uASjH0a4e8hntvsKz4RTklIqtLYSMjT2h95uB3CtosPYyvU3ziJI
         pUgx0+Oal/b55ONK3RqLay88cl27zV9mC/4f0WN4eh3HVgGZJOClf3hPVfF1DdIYM0IN
         u3sgtAvBAnYDIMnvv3lIAKiFagFU/fzNEDd1d6J23sgzNOrFaAakg/U3QjZ2u7nYvyoD
         7ABxlQV0N6HRMHDDjp7fyU/P0eWmYGuTDNwldA9egtdFwrNmPr/YoXMWkzQR4vo1Agw3
         IBR3mihAytFooLVpjztSKi8hhE3vkoTcBiAKDxpjBbz74B70WgpjfS/DziCmeeiiOOdM
         SGZw==
X-Forwarded-Encrypted: i=1; AJvYcCVwirDUUVFJiBBdF2QbkGV7yDCiV8y4x90xOnr2jbMb8zZmYHTAoMapYMs0AFuhWC8UeOGj9FjVcS6S@vger.kernel.org
X-Gm-Message-State: AOJu0Ywk3nieHyfPVZS3XJlhGkIJg9jwOVmdR7te/GkPSo0v7IWgT7x+
	wYgrlJOf7vwc6xFTM58FUrvNLYI0qHjy2dGVgQ9dyT/GdAMuBnOiiBfW
X-Gm-Gg: ATEYQzwwXH7wkmr7ZB75xC1TFz+RwhquCM5+4qBgvu1zbm5zRu/f3DKhEdRMuV+EkH7
	Hw1Lv2V09IoXOf4hTTUeq5y6Im5L4Yp8LKhPTGVNbM+tV9udoya8mfwIxGmUeC6tg4qibxoJwkc
	L4RP+AcgYsioEJaxjXhWzh8WIU/yWUJr/ypnB4UiEaHmqJaR3xkf0ImYSMtxSUwxY+4A+aQW3w7
	2a57l0ccrnCwvAm1bgckfBeT8VKCESIX88CfFxy6/u+RpW8WAtcMpyltTGeLpU4onHHZRCnv6iY
	9HCWACeb7wgq59sa9ROAvmTxazPu+F4mD+LWIcckHesEHdO2g5TLGYnrOhDHg7dUpbh89//BsuV
	j+qQqfqGnagPQaaHduePdTvCaQ3CEjrEsfBxbMReEJ5q/66PpZ9SH7EGDmoGrnSy7pUcFhdF860
	usJJfz7Yx7HfeoPv7l7w5mt2ELcVE=
X-Received: by 2002:a05:7300:fb8b:b0:2be:9c19:b34b with SMTP id 5a478bee46e88-2c186dd2a0amr2428508eec.4.1774691307454;
        Sat, 28 Mar 2026 02:48:27 -0700 (PDT)
Received: from localhost ([104.28.227.186])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c3c3bda147sm1742844eec.5.2026.03.28.02.48.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2026 02:48:26 -0700 (PDT)
From: Troy Mitchell <troymitchell988@gmail.com>
X-Google-Original-From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 28 Mar 2026 17:48:24 +0800
Message-Id: <DHEBKA3QHPUT.2A9BJLPBXGQWG@linux.spacemit.com>
Cc: "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Paul Walmsley"
 <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou"
 <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>, "Yixun Lan"
 <dlan@kernel.org>, "Vinod Koul" <vkoul@kernel.org>, "Frank Li"
 <Frank.Li@kernel.org>, "Guodong Xu" <guodong@riscstar.com>, "Michael
 Turquette" <mturquette@baylibre.com>, "Stephen Boyd" <sboyd@kernel.org>,
 <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <spacemit@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
 <dmaengine@vger.kernel.org>, <linux-clk@vger.kernel.org>
Subject: Re: [PATCH v2 1/7] dt-bindings: dmaengine: Add SpacemiT K1 DMA
 request definitions
To: "Krzysztof Kozlowski" <krzk@kernel.org>, "Troy Mitchell"
 <troy.mitchell@linux.spacemit.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260326-k3-pdma-v2-0-ca94ca7bb595@linux.spacemit.com>
 <20260326-k3-pdma-v2-1-ca94ca7bb595@linux.spacemit.com>
 <20260327-silkworm-of-algebraic-aurora-e9bd1c@quoll>
In-Reply-To: <20260327-silkworm-of-algebraic-aurora-e9bd1c@quoll>

On Fri Mar 27, 2026 at 3:28 PM CST, Krzysztof Kozlowski wrote:
> On Thu, Mar 26, 2026 at 04:17:16PM +0800, Troy Mitchell wrote:
>> From: Guodong Xu <guodong@riscstar.com>
>>=20
>> Add the DMA request numbers for non-secure peripherals of the K1 SoC
>> from SpacemiT.
>>=20
>> Signed-off-by: Guodong Xu <guodong@riscstar.com>
>> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
>> ---
>>  include/dt-bindings/dma/k1-pdma.h | 56 ++++++++++++++++++++++++++++++++=
+++++++
>
> Also, this is not a separate commit.
Could you please clarify? This patch already contains only a single file
(include/dt-bindings/dma/k3-pdma.h).

                                    - Troy
