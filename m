Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B15D4252AE
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 09:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786007259; cv=pass; b=fY04OWxhTjNFb5SPdQW1kpcAgU26zya9R6oAKOGSP6SfSPBM9tGHWa+uELVDAOP1KJ5rfS0nmeIyTfNtLSSKkpxNzUq7BYNwHPdYC1a3ZqL4SfjTC1IgMCUXDxGNl/HwO9RGCQqm8MTKr1swpiAItqh165DDTGoXg46vcfx+JcU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786007259; c=relaxed/simple;
	bh=97rOPPnf9LFesVvm7EtFynTdfrnteKSmS3LA7bTlCDY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XjBTr3/usuKlkZ9F6h8XO0TpVsRQYJiqyXnubZBy5msNoP7qMk1qwU4pJokh+ssaidmVOxdV+zoVmLK39dFCmchItCEr+d+zs4Hn+T4jXNATfFhhIfaJiONXWpWaXikvYhxn680YszB0/Ddv/VCHqi8rnsGIeqyR/kxYSA5XDTc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dnj0bn3M; arc=pass smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dnj0bn3M"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c15cf78d1a2so226119566b.1
        for <devicetree@vger.kernel.org>; Thu, 06 Aug 2026 02:07:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786007256; cv=none;
        d=google.com; s=arc-20260327;
        b=NStJ6rTZzN8vAHN9XkQHvWjYB1L5gBaBwr5X8xPa8JEXEQ24bs486XqLsHUCNaj5j4
         iuBtesDVc7tozYn8ydAgmsPl5O5Mgw65WsDxiMiEtBNpSn59P/MpeN47O/OYZU50BVMY
         XuS6St/EG8R9FeL57T8Qya2Gyc3VnvOKx18azkqvyNbLTvNb0J6Gip6RBrzyTlfTuC+0
         8DcCuAKaOeLPRQsbKncGdgZkSrLDdFMEsE2XfvkYK8c2oz9gOtMGYa4a6UGYonwgdCIh
         Vu1ntfKMBrKCttX8cbWxEX0v5oFqpVS2YQskPp/VURRkla8wVy2OhQ6J+nBQ8B4CLD2L
         goJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=97rOPPnf9LFesVvm7EtFynTdfrnteKSmS3LA7bTlCDY=;
        fh=fPS+BbdRWNCNIjoTRgKsjS3VRa0PSXjOLP8LmLlI28E=;
        b=l1Bxer5bV794hbf8vJ7Jk10Bt2LqkS7CPxYKvg6GaxrkFPvQhME2IKheAL+cdAKh1I
         rLxAFoQ87C/G2KGXwHdfWYSRjh9/DxNQCLtvFRT0lghy9W4Xdrs1+Df5+Gw9I9ywLBPw
         F9oQeQvqDF/P4oBmF1jfS1JP5OecjlcSKMym/S6K84qXPswEGwgaX8uwjRP7JUsQS+Ep
         e2qCJHPyZ4A34hUutLAkvkBzGKEVYJy9AeuvG+ngiHcn217Sm9/RXDnB/eCj7DIUp0tF
         2TxKKv3xf7RoVJzRFPoesvODo3ayPPKuf3CYClgQazDHljC10LDVdqgZ9b5z7/3c2VUW
         II7A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786007256; x=1786612056; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=97rOPPnf9LFesVvm7EtFynTdfrnteKSmS3LA7bTlCDY=;
        b=Dnj0bn3MByhFpoQS86b06vX9EIS09gFeERYNig0VADCUI8phflJGHsB9qEHs1eG8uj
         iQhjTDc7gVrKgKHgVN6a/Id6pzDcPQ+6IL/EfKfloueKZ3SGU2MSyP4QLOSoBZYCQsB+
         ULVA6SPk1vehWBsbuUm/lidjUHAaxpYXN1+XNIfm5P2U3CLNkDOxkbE0MOKR5uWnTysV
         4denr8ZyiXHq0r0XLI8CMFg4ujyIuaf8tR++/gbZvSEN0WoSynHVV1+wVWnPI/C/Z94M
         toYjEyfZkW78sABXOkSPSCWVK26qQvBUeg7ffuqCJgnWT5Q1vy3pIfm7to48wnEEgr/Z
         LV/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786007256; x=1786612056;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=97rOPPnf9LFesVvm7EtFynTdfrnteKSmS3LA7bTlCDY=;
        b=bBP5xm+Ds0gKuz9S0l37sb6PIKqv1RTEV5q4F0YXEC2uNkyfPsIB6h5riHS05UsdrE
         k+PMOcN12TOEwiCQ6MFUwVmGdrjJlYqExYjUWSHBdAM2tM4BVHjSFE/HTcPwKe2xl2NW
         LVNkzWH4/FDlg1HAE+lawLmCOhlBsUYkFOh0r9I742d+0l4CDo2TOWcag3LZnk8q7hCe
         Mh2yyFC0BfycrzD1fNNlyR50Be5iT4HDis0V9rDRx0/1WcyT7c28Lr80ct4CyPKlCUaH
         ivqnAZfQRcA5RHZg8iAJrXX39MdjT7nJLb7NwYc5cyVlwOgACYVUvXLM37Qv9gBWwQgW
         4vUw==
X-Forwarded-Encrypted: i=1; AHgh+RrDaTFHDC0KzbnTnjIKLBWQ0xty0aecuwXuMK+yAt36lC1eo+S/PAdHg+aQv9P67spP5hn+Xvn3rhbY@vger.kernel.org
X-Gm-Message-State: AOJu0Ywt/0sd/TGhC3y/QUuAbYHN1uXDLw1kse2XC5KmPhD82zwkyxYj
	NE3JUMbkJNHNP0s7q9hd2PNDEWCF1FYA0bABlD90HRzqGX/8V3bPKEbGodo9wx7Wr2wdCK0KUBM
	moKv9aPMVjhISOKBGDXVnFLyTf6pMaj8=
X-Gm-Gg: AR+sD12gKORILtwrHHT1UMjCES/EVhjW6aOIQG1dYCwXf7wcZjk0aL4odSZ/ZEtIEbb
	mDR3PrZTNxeAYdEwU31b0Tskl7sP15v1PRTdF8sJEBhqBNU3tS578YOprsC1Jda1MpBaPyRO3b1
	dW0B9Rc4m6Q733zhb8Pm4vFMYjVfathgGouhQUN2nQDA0FB1DA/QUFeQhUD8szZ+5dYQrwfWtQd
	TqR9/gFpdPWB/cMB4h6g/UVkv7jV1U/FHSiLz3QisH4qeJkaHJiL+3/laJux0AwRv76vIosaiRR
	1AcJTK0DLeaBDsXIRl8wfDX/9iseOMAbC+hgXK3YXErxXQ==
X-Received: by 2002:a17:907:a0a:b0:c20:2eee:97be with SMTP id
 a640c23a62f3a-c2039d216dcmr646342966b.7.1786007255234; Thu, 06 Aug 2026
 02:07:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260805085540.452260-1-a.shimko.dev@gmail.com>
 <20260805085540.452260-4-a.shimko.dev@gmail.com> <64da17b5-2ba2-4dcc-9b8b-251b208e555a@lunn.ch>
In-Reply-To: <64da17b5-2ba2-4dcc-9b8b-251b208e555a@lunn.ch>
From: Artem Shimko <a.shimko.dev@gmail.com>
Date: Thu, 6 Aug 2026 12:07:24 +0300
X-Gm-Features: AUfX_mwuSOKOGcIjuRBsl8lw_MRKN2MonZGRndlFRTqw0YlRneDZ_RHIgO4jI4M
Message-ID: <CAOPX747DY2pS2Of2+ysi5pT7gFmbhOqDPBLgzHCr308jZxtqXg@mail.gmail.com>
Subject: Re: [PATCH net-next v6 3/3] net: phy: add DAPU Telecom DAP8211R(I)
 Gigabit Ethernet PHY driver
To: Andrew Lunn <andrew@lunn.ch>
Cc: netdev@vger.kernel.org, Heiner Kallweit <hkallweit1@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

On Wed, Aug 5, 2026 at 3:40=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:

> Reviewed-by: Andrew Lunn <andrew@lunn.ch>

Thank you for your review.

--
Best regards,
Artem
