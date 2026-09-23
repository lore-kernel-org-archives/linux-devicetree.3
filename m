Received: from mail-ej2-f10.google.com (mail-ej2-f10.google.com [74.125.228.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B14D52CCE9
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 13:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790169480; cv=pass; b=hIj77Oy0rla0fkDeeeS2yqgodn7d9woDaP6q0bZk+LrzLr8+sIpSFzv6l+R8WBmonztFku60FJ0hfY88QWKIAVAee9+E9Y17NeVlu4rO9b/ZIhz2fYFtzce9RX2qLuJm41m+JwWBxzAxFLXUE3lDq/vF/8VSBzLoMSKiCYYnKvw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790169480; c=relaxed/simple;
	bh=DvrVvCJTQQOy2Ljw0fC6mFfv7ZDXIe713sZSc7YfmU0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UXmRyvu+UBExTH0D2bnRDhFD1qMJBal8HXQ7hJhVyFUYWpZYhxqTIkelvTcz/kMG9yXoo2CnwlBEQ4bDzxs7ngAlqzUKX8R6yZcufDMYri447XPTqdJTA+8bL+QdyjryhRTkGcN7r6Ld83bf9atJx8C26v3A+rEQ6jVuwa4tGnU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JEks3zyT; arc=pass smtp.client-ip=74.125.228.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JEks3zyT"
Received: by mail-ej2-f10.google.com with SMTP id a640c23a62f3a-c2551bfabefso70021366b.1
        for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 06:17:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790169476; cv=none;
        d=google.com; s=arc-20260327;
        b=gEmub3BY+Y6EpRBvspEtwgcr3pxGHHyqK3w6KMzo+86Rz/yufmp03JAlmGowz2iyOn
         ZHfWTU3q9tKuIWD09KUuyjqm5XT1q+/4Vx1d6fHkgNWUSrd/8q5P4uVzPt59jpUNwTgo
         YfbDq5GUXKKnA3pCswQNfCXnAm22TPSEsgN6YcKo1y8Nc3XWaJQwECWRYmwi0DdLx0YL
         LMjNyyXp5DBUY82dHBfCsWvFRc/Gb2XspQET7NrE69DIc5Kxy0VL7isLB7vQ1JDgNCWm
         xir0SapKh3vDF6cu3llZ+vmEYIH3H0FDgYL+/3lHZ1qU8U60M1i0pAbGbYxZuxWVHV3Q
         Xqdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=DvrVvCJTQQOy2Ljw0fC6mFfv7ZDXIe713sZSc7YfmU0=;
        fh=c2MPqBrs6Ihh6HjiT0QxkNkx9gJQoeQF3KmVHWDqjlw=;
        b=WLLHWOzqnX7jMmLP4FtBoUrJ3J4lWpw1Ox0kX/TaZAsAYtZ/+mpZphlpxGIrR/OJHC
         wNBwYTAUVU6MHyqVhc4Cya5A867Wz5ZnA2hGWuOpar3KcVmh7Vb/A0T1pok8W3PaNLsZ
         7AH2DGtbeG48j+7UF+O2cawASHXjEvhmQ3XS1k8QXo/doe9yDB4wSFLPLZhE/3rCI3x9
         mQI5lsDdhWttU0nPA0mH1ORC24MgQjVSM6GejXaWC/2lViH82HPFa4eF4w6Px4HYiNJt
         pbXqFPVL3TKnqHGO+ej+EX9COTjVwx3EmzbkEtLjRQRdWI0hPWfyQp//tMuG/l4ohFPD
         wVxQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790169476; x=1790774276; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DvrVvCJTQQOy2Ljw0fC6mFfv7ZDXIe713sZSc7YfmU0=;
        b=JEks3zyTKMevzI4WFusqHT1XBVoTE1QsMGne8r7dt0EIly1YMue8Yno7PA4WBVcy7c
         P+cuWtNuDyks0uJNgxI2ZtWH2lMy4luPF8Dr66MNfEfmAIMMcDxjbdvakiWS8/QfNNys
         0WiNQU1z67kNKE0+gvBOchxLnsr9g1ilrqwtjGiOSQx9B7HBawpEP2MiBbRnGhlSsYSG
         afPFKXlu2GCsuLBBAKLF5Dfk6itSZQhZ1L2XwvLbeQG8mUQdpSmDS5TU8mgS1uLILpr8
         kk71Wmxev1ywODGNWUQl92Ncj6NySLZpTNWGKmUwUDyWMvYcpZkMpb9bsnVlHRrfeUMR
         u5vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790169476; x=1790774276;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DvrVvCJTQQOy2Ljw0fC6mFfv7ZDXIe713sZSc7YfmU0=;
        b=MhamXRfPXLlBmduHqXFOPwQjfLgPDgguDr7U/899BVown+Q9BIPbbKhBU9zoancAb5
         8XGxz5Bp7a6TbJUic3cqT2faPBzgoj+QNDecb8gJA/7uIOvYE4wQ2Y0oe1qpklwpUeyt
         zW2FLDBu8xkOpqCBgF+ApF9YdSp8oNLtoGhzwzWrQ+fCGf/Nb0xk3etm4NksXFNBO6mX
         SrFgjBV9Tq02btXA0a8Kdf5JSLhC1g21jIvs3z/8DXhUpJiCwV92qqUiVTDQf4VzBR9V
         z3ij7TYb7K+QnQJrEZacrrcLY10fhLcJPBTq/9CM4u45ikkqRoEXuYdnvgFn5Sj6raxg
         RWdw==
X-Forwarded-Encrypted: i=1; AKwUvBxqYVhZiRA38pXwnAHukSyeXCytKNJNm1l/r4aMRP4thbxq7vep1ZquCFiAHxUy8XusaNsARzv/2DaD@vger.kernel.org
X-Gm-Message-State: AFuF++mOmvA1VHAhzHGC+PhwT3JZrgBnTdy4R+gLrvfVfqmEPyJSWKe5
	Bs8lP9m/ZPLc2muOkO9XYHkO/e7KMslBBuknoA0IIIBE6+8/2ZdTUYWICTlHTc7R9jCuoyag4iW
	KwR4AlxoIxr7P4BnxH5nKIU7d6iekdMU=
X-Gm-Gg: AYBFou11Qf9bFLoOsCp7jHkqf0xDHxDB61QnIT8n416HNVgoOjo6N+Rie+emBqBCPbb
	56IZiQ+wqDiSGU3rEUxgSP1Y7UuUZwDYJQZdnYj9ljkzN3+6B3jloFEAyQ6ITjocIaVgx5zHw9t
	+s4KRANdCAce6gCZXE5D+WR2YFaVfQqiO0XuEHUva4vyfTdeCAC6WESthvQdzmqvxGeqYCNrT0U
	Hk5lPG3yBPLPS6KAzfdV9BHgbr17FIZnCJxql3+RrycihQaGPiiUtnXx3xWOo6zbsPi1cXBUCZU
	sdoNYcG3Hi+B3VY9uCs20WU1Fm3nrjDMgweaayOQOT5o0Q8WhDqYnuvIAxT2zi4nZy6Y
X-Received: by 2002:a17:907:9409:b0:c25:8e4f:6d84 with SMTP id
 a640c23a62f3a-c2aadc98eb9mr212676466b.2.1790169476343; Wed, 23 Sep 2026
 06:17:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260923-qcom_xpcs_nord_emac-v1-0-4b1c682af70f@oss.qualcomm.com>
 <5135e15d-b6ac-476c-9a7d-b7d64e4eed5c@bootlin.com> <arOtU15iv5CWPUEu@oss.qualcomm.com>
In-Reply-To: <arOtU15iv5CWPUEu@oss.qualcomm.com>
From: Coia Prant <coiaprant@gmail.com>
Date: Wed, 23 Sep 2026 21:17:44 +0800
X-Gm-Features: AclHuK-Nd-SsXdAr_w0eePSBz9cFeJT2YpbrMeoFm4kjMm3oXLxfgGRct4bNM9Y
Message-ID: <CALj3r0gAaQ_CoS5_9Mmf5HY+Fu5_e74fbb+r0LstafMhagHx6A@mail.gmail.com>
Subject: Re: [PATCH RFC net-next 0/9] net: introduce Qualcomm XPCS support and
 add Nord Ethernet plumbing
To: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Serge Semin <fancer.lancer@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Richard Cochran <richardcochran@gmail.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jose Abreu <joabreu@synopsys.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jan Petrous <jan.petrous@oss.nxp.com>, 
	"Jose.Abreu@synopsys.com" <Jose.Abreu@synopsys.com>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, 
	Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>, 
	Shawn Guo <shengchao.guo@oss.qualcomm.com>, 
	Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>, 
	Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>
Content-Type: text/plain; charset="UTF-8"

Hello,

Thanks for the RFC. A few comments.

XPCS_ID
-------
Is 0x00000030 documented for Qualcomm, or is it derived from
NXP_SJA1110_XPCS_ID + 0x10? If it's the latter, it's a magic value and
I'd rather see it confirmed against the Qualcomm documentation or a
register dump from real hardware before it's used for platform
identification.

Non-existent MMDs
-----------------
Returning 0xffff on reads and silently discarding writes is what a
floating bus / unimplemented feature looks like, so I agree with that
direction. My pcs-xpcs-rk does the same.

Structure
---------
pcs-xpcs-plat is itself a platform glue driver, for SoCs that don't
need any platform-specific handling. Adding another abstraction layer
on top of it to cover Qualcomm would be glue on glue. Generic, Qualcomm
and Rockchip differ in power management, address window size (2M vs 8M,
...) and MMD redirection, so they don't share a probe path.

Pushing that into pcs-xpcs-plat would also drag every existing user of
the generic glue along: they would suddenly depend on GENERIC_PHY,
PM_GENERIC_DOMAINS and whatever else the Qualcomm path needs, or they
would have to carry per-platform branches in a driver that is supposed
to be platform-agnostic. A per-SoC-family glue driver, the same way
dwmac-intel, dwmac-rk, dwmac-renesas-gbeth and dwmac-rzn1 are
separate, keeps each integration self-contained and leaves the generic
glue alone.

Would it make sense to take that route here? My pcs-xpcs-rk does the
MMD redirection through a custom MDIO bus; maybe the Qualcomm glue can
reuse that idea directly instead of extending pcs-xpcs-plat. Happy to
help with the generic parts if that's useful.

Best,
Coia
