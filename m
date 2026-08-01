Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5801B2E1F06
	for <devicetree@vger.kernel.org>; Sat,  1 Aug 2026 14:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785595213; cv=none; b=WVfuhvLT9wX67nqbpzYpuIqFvEZxBjf27k1nq8omoeJgTMZa1gBJ1kOnyTbEob67/eE1/K4yRlNvxVHkLqqMGjqpBeTKBsm3wxuk5XSTSZFJDgilw0Cij7TiFgZxa/4YL6KnVF+r9NmZ1hsNnCPssPAKjJgg2UZ9YzJLklmD8ms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785595213; c=relaxed/simple;
	bh=sGDq596Ovv6LR3XKa7fiXXFjU5SI8CRjK3EmOFCri94=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=f26U7sHXYzdf0PCEz/2QmvCGhHdDnWdjuq/6pRj5QoAFL+vVhvxKJ44/CubsxmYiL2qPpPeoBJYOrkfFATJhDUAzusKYsuHSGMwfnRxwmzBkjU3LTMNBhQBkW4VQClmxQgmUqUULzSz3m5u3HT1ugDjA81kBjegoWvvqShIi6EM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MraJaKJA; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MraJaKJA"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4954f5e8020so3045745e9.2
        for <devicetree@vger.kernel.org>; Sat, 01 Aug 2026 07:40:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785595209; x=1786200009; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sGDq596Ovv6LR3XKa7fiXXFjU5SI8CRjK3EmOFCri94=;
        b=MraJaKJArKLE0UABmi3vpP+qu//EMW0tA5iUFghservfasAEayQ1CmPQxLUYAdqfVe
         84kV1bjuncLLDl4Ura37T3IgsHn6M0StLDx4jkDZtUcbVMWpgp7r2ojOfDOueR3tfez4
         iyrK6vNz7xrqExMZDzB8bjmYJdwzn5MaQGVYAkgXwDyoeKYTSSMYG2g0SBHpoi2AVyJi
         McJmW/Cm4X5HKbydUURUhhAuK/p8JvgV/Wu/Nxdz1+89JijxMX6FMZZbVUFW5Oq237Dc
         ahqzBtCWnFJ318IZXxajP2mspcyryPn54GU9dDYOOayi+lpfpJxEVgwHiHXFWbnhmPz/
         00Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785595209; x=1786200009;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=sGDq596Ovv6LR3XKa7fiXXFjU5SI8CRjK3EmOFCri94=;
        b=j5AO4NYovQiUtUxYxCS0qKrmlk+1Ac8uJ+cX6246xdZmL30nNkbSWm9Cf215LSK7Aa
         G2km5EdnEn0HZjcS1V7zRYskOb6Le7nTJ3DQzARQuW6WlYz4M5Yn6xAd7yvHHZVPbt7V
         fVs5SJz7D2KS8ESuZEX3XsEC+ytdb5MzgcGoKdsYfx2Vike1+FsnTusGnnrq7XdY+OF3
         hcS7eHITQy9X7wYr4owKg7+cqokR+WMYytpi/U6x8HG2HtIpIoRj1bjAbTTx6TLhGJT8
         ob/uMXobpGuF/43GD5oaPpiVp4zik8ZNpcvJYDZim657pKBP5bAm1zzJ2kugwo0uUmpi
         KsZA==
X-Forwarded-Encrypted: i=1; AHgh+RohCMHtnjDpNyVzsdpv4iWcYPbUFAoiAXFrfS4FpNsPmNOjRrbcjioJu/mwn4u1QoTl5uj9KOhnbRpn@vger.kernel.org
X-Gm-Message-State: AOJu0Yzrhokmrc3oART34FyhY/+B/ky8kVARQAH0NKjg8vLn01zise4f
	46ZUVRLDcms9HzU1iR/lTl2jdgsfyiC/wSTIm4ij0NPG652R3XGY+l5e
X-Gm-Gg: AR+sD13B8GvdVpqmIZKc0NxB9S1uuVXGCWyLtGHkwK3ObgCRCeklE+JSCWu9wwZcDEK
	cljLpSbLO9oMtsxo47vvWSl0RqeIqkBS+T4gM5aM2AjR//+AvSowGFcV12dHeCSKZT3ogCMx3AR
	Q9V06L0R4Ay5pRDuCr35+sfFPrffVfN4ZJCxkKirX8ZoTwkAN5amTSnHR6/wdh02moVRus9/jfV
	lrV31L9Ovwe076S7rtowSsa06IhxY9MWgmCtB3ccn80Ncz9oZSK7eFBmWaCvarsu/y6LhIg5/5l
	v9GvZXOI6LsXHfgYMuTu2U6yZPOy8Igekhek7HAriHZFvq9pXRhtQwecQ+aedPuxSHACS0t8xOo
	85UrzyN23eaE3aUs0uGlKoWxk+bon41ZBNccshl/JMWBviuHUrOLwLKDEnUTsKCzesCosM2BHGG
	nSPBly2UfhB+HIcG5yYCuxfqnGOVTB5gZDCWP0Rv/Jb+jrmw2E/mTn1N0z84srcpjJ
X-Received: by 2002:a05:600c:c4a3:b0:493:a613:56b2 with SMTP id 5b1f17b1804b1-4980c64b5c2mr44983635e9.8.1785595209415;
        Sat, 01 Aug 2026 07:40:09 -0700 (PDT)
Received: from [172.23.0.7] ([64.188.68.34])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4980878dcb4sm97739755e9.13.2026.08.01.07.40.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 01 Aug 2026 07:40:09 -0700 (PDT)
From: Neko <nekodevelopper@gmail.com>
X-Google-Original-From: Neko <neko@altlinux.org>
Message-ID: <0e1a65ba-68a9-4517-8050-87f0eb9f8a86@altlinux.org>
Date: Sat, 1 Aug 2026 17:40:07 +0300
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sm7325-nothing-spacewar: Add ultra
 wide camera support
To: Danila Tikhonov <danila@mainlining.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Eugene Lepshy
 <fekz115@gmail.com>, Achill Gilgenast <achill@achill.org>,
 Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht
References: <20260801143125.267054-1-danila@mainlining.org>
 <20260801143125.267054-3-danila@mainlining.org>
Content-Language: en-US
In-Reply-To: <20260801143125.267054-3-danila@mainlining.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/1/26 5:31 PM, Danila Tikhonov wrote:
> Add and configure the necessary nodes to enable the ultra wide camera
> (Samsung S5KJN1), connected to CSIPHY 2.

Tested-by: Vasiliy Doylov <neko@altlinux.org>

