Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794559492;
	b=Au3Z4HxA0KHGA+rr3NzsViJBn0Uip2o++hlE+q1N1OAFnR6ZmyQlOwsQG7qLZMAhK44h
	 ob572BMWIBgeTK1O8ZjttS52pZXygr9QxDiU+rPQkPJo1Dl6NapvUiHGVeJR0e05OSRzz
	 IrtKL50Ey6UX9/AeD0hdC+QA1pmZv5Jfjc81b8LErt6HU44ye5KKlXi2rwAq3IDIFjReT
	 gZNvVtRBZPZVfEA+P40YURIM2CgRTnex15kiaMgFDJDIglQxPk/aHZR2Cqjfh6dnnF0c0
	 J5HT15x69EiqE8RDXivSB5Q+uJVoPBFwW63I2OplreTHy4y15lfICJOIM8A9PAu4Y2g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794559492;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=x+fjXvjMRilqC/1PD9XiiBtX4xwfGR8XcMAZq+mM81o=;
	b=hRRbRHoETmHEBH27dxwg2ztyXo06gah9pCYoirZfladTXOeeCUobvflSedCJziOgyCRH
	 FyAStO/aynIDiNRKzPAoTXk6S4Iss2IdVy4sS8WGLqfN3Fho7LV8W89SodjI4gqtEOclr
	 Ft0R1VnV4gdHXwBEGaow7/MtLvmEtwdKhizz28s9xBpvly3umRNLeEEy8R7sbSwdGKP+m
	 7DmrNbH8rVGtG9cSrDVNLnPlm/MHugAZIDxSK0uBg76bc3DC10iK9k3k2HidwdbPRV7y4
	 ODlOZ2iNZ6RTUIh+gJrVcyFYRFGmwTrVErxgY1o4rZKrwoGNTO8CB65FcaAspic0G3A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="LRt62w/y";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.42
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36BD160A3804
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 08:44:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36BD160A3804
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LRt62w/y
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5c0f0e04628so67376e87.1
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 00:44:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794559490; cv=none;
        d=google.com; s=arc-20260327;
        b=d4LfIMVREi0D+XB0bK8IcDLDnM7tdSIHII4LZ7BmYtdu0pBfM25wco9d7+Qu4n03pK
         BdLGhW4CW7Yhd4cUTuNdjjoua/N5EvTacBe02xBlNbWETALQV+Wp9uHOMExvpVLZW0gM
         /jFg58p1oWF0VS2kFn2pXKjCKWk5UmH3azraqF6IhtpK01ebo4czfn1asn6kIrrLxahv
         xkkVdW9MkUY8RXw+cZgpbao5XjajAv+XvXok2i+ydii8dSsa7Pj4EktgvS9P7hBDMUAB
         pVF3bf+4SVpPyPIB5xkVmg52IoQReEsfIJzq1BaykatHnpnXviGAvBrKtXMSOLEDBQ9P
         1dQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=x+fjXvjMRilqC/1PD9XiiBtX4xwfGR8XcMAZq+mM81o=;
        fh=zGryf3581GIDUGTsvzajGOf/d6XO/hkE4jx6My9Z+s0=;
        b=r/6DobwxkAxgpf22IFZvOuW2y+07vQ6QINCg2YwMGBb7cH5ct9ulr8ru8VaRsN8Mhl
         LjyrgdoNVjPYQEctWV165/K0ZEXMu1etNl0ZyDfepBqwpzHmakS8Wb6NSowoeybw9DQw
         ldTRW3heSsbVo9bTst7kUAqHWeEYGWbL3VXFC/6GIHk0g9I5jotNIB7ZzvmBq9/fHINw
         dYw5rE7vWOh6lnOukV40/K6ciHLGJwdqBT/yMx6Q3ycuWz8pUV6yNDFJMT/UB7lOtOt3
         CsOXab7Y4ik49FNEt0OjqRIsBnC5k11c8xvBqwQoH1FLhMpz1R/1CUrUHKeFkIMj+2EM
         5lNQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794559490; x=1795164290; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x+fjXvjMRilqC/1PD9XiiBtX4xwfGR8XcMAZq+mM81o=;
        b=LRt62w/y8VopVF/oeriVfTbTpOD3YUSedXMVVmtyWQ7IlaJIJlofiZIjsrr2kI3F+E
         3N/PhqvWfujU9SJUQgpkcAT9F/ZNFNSWCDRPX7uLwQ6e0zD9cOgsVHbcq7Au0NeZCyKG
         CBCpMGQQWKiXT8TKDKdjEIg8JfNppAhy6ZkvaaiIatrBjZcAUpfdSzoLf1TNDmhMPvkP
         JK05p/4YxTE3GTCgP52/z8f0PLwmlwwk1D0aAUaVEI05jT4fsIIQfndKOg7Rmn7OfpIs
         LU0QlKoo/2etD7RCwKmX7p1SE7LPCuZ97tKLiyGAdrmHhcyu8vEpIzZJ9pyoNsRDJEVz
         wMxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794559490; x=1795164290;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=x+fjXvjMRilqC/1PD9XiiBtX4xwfGR8XcMAZq+mM81o=;
        b=PXg5TMoxc9AGSaOuaJZ74Z+tWs86jgQ/g4nUXUiPRcNImg1JxgVT6zVClJbQWdZSOR
         UCWj8+vv1FB5P4jfMTTrivYl5rtaLrqEz2+YCOgbRRy3UQqgFbwP+W/irBtT4ChhctUa
         z3Dk6vDxx5hf3uzsqtddilX8sjU50ybWcpLCiIHoHSksXhtkiqxHXaGGRYgq1FWKsCof
         wukfu0/X0tz/rEaVKphoXmUcUXJNP9c1Ak0kun11AXwp42hadVvkoLjCa1d0kbX8IL6F
         p4DKO3OT8gMC9w+bUvbId3osJcUHbNr7ZebLJ0VxHEOdIL3p6PUQzJF+md7FjB91Hiic
         DCrw==
X-Forwarded-Encrypted: i=1; AL+hErG10U/dxKSNiZKnFR1yZvnxp8zLhquh/jlYaQKsjpH0iyqDCHNYac8Oy3VCP3edoHyY2hMxd7DA8WO4@vger.kernel.org
X-Gm-Message-State: APuU4Z/5jaD+cbe2oG4eMCGm6XKP1jFBtnqAyUf8L3HSleXah5HHJ/t/
	HPGEJUKDRdzpFPRnb9hCxcfG4Ad2+jZkIfKplOtvec07HvTZTN4WdLTYa3eEZl4Zq98qOwxuF2k
	+GrU4ml3TguqkBNGOKoxj1G5zZSG/nDs=
X-Gm-Gg: AYBFou1LRon2Fby4mjDUkZQNm4q6Ybml5nQE5qcz7HokE0qGk/hsMaGj7oEY2jpOFNI
	Xsb71/+Ko1y4K2TmCx01GnxyzhWANFVuP1ed6S1b20Aab9JjHC++5OwN9k7g0WIrh1nF6em9Hco
	YqfRvZbp/oFFlZVgt3Na2dcshMDdeYGYFZ0zY6TRwBES3cgLYstej0KedLrquEKYPwb3Y9RclL+
	EdWywK9KXRMuZybR0JSliuOHJjxHQjDMTkhWXsqP9uBbYZLdeECMGQu9Ol5lzS8+UxHe03sXCq5
	9Ye2dAC6HTxXp30rWagZCpgK8JOwYynsOkAsn9Wq/76D2TAS2ObKjIUD/xdXHijWffnr/Ht0eNf
	ebQu88RnzrNkPEMu0MSFGXZAKIgo7cHrE0zE7aJPl0adE0eypbKcYSfFt79gMoUmPt4H46bXQyk
	0F0rynMA2PSZG/mW+o
X-Received: by 2002:a05:6512:3e0d:b0:5bf:a66f:e5e with SMTP id
 2adb3069b0e04-5c17058b108mr873253e87.0.1794559490194; Fri, 13 Nov 2026
 00:44:50 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110-smmu-v3-pcie-pd-v1-0-628819ca44b9@gmail.com>
 <10924894.NyiUUSuA9g@diego> <ea8fa04c-4a8c-4c55-b4fa-f37d74267e93@rock-chips.com>
 <9_7qTfdNSViwtNUGq9D13w@sntech.de> <avU2I_QzCiBPVTDC@venus>
In-Reply-To: <avU2I_QzCiBPVTDC@venus>
From: Arun Iyengar <aiyengar1990@gmail.com>
Date: Fri, 13 Nov 2026 00:44:38 -0800
X-Gm-Features: AclHuK8fX0XCl2Od3Qw3inFMre3WawrBORUXKfjsC28PcE94ozVVaEPRCoHPifo
Message-ID: <CAEy9hNX8fmEZsy-RfTDQz8Th-H8Z+o5tQN4WseiK_+RpZkbTNg@mail.gmail.com>
Subject: Re: [PATCH 0/5] iommu/arm-smmu-v3: power domain and clock of the
 RK3588 PCIe SMMU
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	"Joerg Roedel (AMD)" <joro@8bytes.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Niklas Cassel <cassel@kernel.org>, Shawn Lin <shawn.lin@rock-chips.com>, 
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, Simon Xue <xxm@rock-chips.com>, 
	"finley.xiao" <finley.xiao@rock-chips.com>
Content-Type: text/plain; charset="UTF-8"

> And yes, I think the other smmu should also use the same handling.

I'll send a series that enables mmu600_php with its clock; it is tested
on an Orange Pi 5.

> @Arun care to also add a runtime-pm patch? :-)

As Sebastian wrote, Pranjal's v11 adds it. I've tested its system sleep
ops on mmu600_php (not runtime PM) and sent a Tested-by there.

Arun
