Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D035C2FDC20
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 13:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792071219; cv=pass; b=MWzMV9jztcmfX5DDC5ezFcdqPrkIbUtwCXmbz1johdYbl4SIr4TAV58/++0llDJ2oEnn7SWCUsExr6Ws5v1qemp1UE29LGKI4ug/jE7y+2PwKyq2cS4ghM/H996t6b5EN2TjSBSqmj4CPThR4H2SYXkVvQ3ZCJnVGD6BVYmelKY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792071219; c=relaxed/simple;
	bh=Z5Ri9F4+OVBBIEGoV+Mr5BnCUO8uTyNyHHmMRGWppMs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EnJWHAiI2SGKyaI++9774svJ454VwZ87fbkIg+XOINpbmUyZfZ1djWIwdbV2QdeceFWkK0LOlmcCF9oOsim957+j6KNzpxELRO/WACyciPI0mBaDO57ctSy0R/yBy8tdqRLq14bHfKTKP1YyR9dSTR9RiyJeWH1w7d+toaEJSYk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PAuGi+DB; arc=pass smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PAuGi+DB"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-353804b591eso9293107eec.0
        for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 06:33:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792071218; cv=none;
        d=google.com; s=arc-20260327;
        b=CrNBMUgIZzcueuQK3xGEZxTrIRhOnLGfFQfL+5fa5J+xLYAvXOAGEg7RSJlpy5oZuy
         QYT1+awiyZi0wWCkWP5IVgaUBazcx1R957u1UXeK/M3Oj+/CUdW84/kA7oUXXG/4my+a
         z0fleyIhqgcfZFg4LleQSDDzkyOTNqPlkxn4+R1UmRURBP63i02DeAicHe1SVt99Ouwe
         BOrsYeRIeW8Q5OavrlSGd8Uzpq+bt8L0TVHSNjKmmHHHLK2kkyDrmoEIvfoaXbn4+h+D
         0sQ1K/X01xnVtRUVvYLHj+o66A64uDkYbT2SbGc7Hm0wjocKXU7VcAMOt72DxtzzCEv8
         jW3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5OHLy2Mwpp1lBm+AFYiwQam1DsdiOVY0neamvR3LV0U=;
        fh=fqmdaWMYtonAN4r7ojt/x3KZdtqGK9lY2k5R2ULSpW4=;
        b=NfqkUONiVTLXzOQOMr2hlUXdLyUsa3iHcSVEJtEDTgDHe2AEqozIcDhKYsSGModv9m
         yvQdZ847IAN2sw/GBXbqBjhYG/sdvKqD8BFYpyHnef5CgB3Df2XDnTYj5kjJqrSPyEMh
         Luel+ihdz79V6ltBXR74W7agI/4erbM3mZZlN9bP/CJkVvfWFc0zinRQs7789pBrAgBZ
         Zul8DfIK2HvrtXsNYcV7fiauSM+sfX/WZ5K9KP2z32xm/2KafC1iGZYm1C1IPLDmqAor
         Lc+nV75zBRPdFC17FwzO+lY3StPXOGaDr5EiFzlzpM5ikmq95k1zcSlf+rmt2q16Hk3E
         pKew==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792071218; x=1792676018; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5OHLy2Mwpp1lBm+AFYiwQam1DsdiOVY0neamvR3LV0U=;
        b=PAuGi+DBtlHOAXfkTuvEgYPIz9waslOw941falizFo+xSe5yRbqlb0CwWyGRG7sxfO
         rqZ0ccbiXIZV3s6UrBg4hAkW5k10nM4p1zSouygV07q2YjdoIBrZOZG4SLnYrhCbk/k6
         reMDApl7nJGdp3HLpPZFQzwZoZeozOpymd0qETxSV+a8soC6YUhMOHtBhEHUcuF/niAo
         foz+SW23qmoIa0Im0rN6ecC2P6Cc1EzG72j+rXNXX+WXRXFuS+7Y9F4AX6zYo5jqZX1H
         nn249Xm2CiJkoVEWUwbuDy4J/n/XylSd4tpYvN3vBd1ndmnnFYMATBUbchW8GuRTP6pV
         E7Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792071218; x=1792676018;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5OHLy2Mwpp1lBm+AFYiwQam1DsdiOVY0neamvR3LV0U=;
        b=jBhvt5gLIEUSTKKywkXUVJDeQAeBbioz/lfnXzOI+6vrpy2POnaCprIKF6nwgVwGwQ
         NulTbzccvKhoCKZtowGAmCEYx62ptaD9KmYQGJOzAerQ/j35gT+AFvNQfYU0ZJymI4Gi
         u1rbLzANDUJDV0gDjgWYQRbafiCG/mlSjWsrxZRH1upqf3UZiLedt4m7awz9lE0yz4QZ
         qD2DLMqk9WiCd2xYhCmo9OxOEcXTJyZV+R7UjPj/g6SaJGdC3P9oGOx+wN5Z/helm4iO
         oJ7IHkE3z5XIdQBw4koeoWioCoA3gqFsRnHnlRkLz5L8ZBqpXHYqj3t8MG8lCB9S9nne
         DI0w==
X-Forwarded-Encrypted: i=1; AKwUvBzicSjJiQkBJjJUTUulnxP5qKwQnAd1Xoex1bfU8jeow7tpLhmxSWO1SkotNSAeFVjvLDPu0IYn8ONM@vger.kernel.org
X-Gm-Message-State: AFq9FYLrRM0WXgGxLjMnF/gGfZ8+66nXVC1PwPp6ONETogiAWRoL+nJJ
	jVxNKL1fhIE4Qjwyn8VY9q+4wh/GsP72RJfkanIpaP9kQO8TSIsJepL0NMXGXEgUhYoBVqtpiQy
	aeoXl3tzkkYSu4vpEHpY60uC03/V4ljM=
X-Gm-Gg: AYBFou20naoppEt18DA74sc34CQgAZl9WN57vRLjOX8vlyGkmHZPbBC2dLMJtgTa4Ob
	gpXC99Z/EJlsiIepDlnOi1tTXf7ROgVI5m14Mr3+Zvb/QIJ9kloclNEl2GMlYdsOu0/3HbDOeAJ
	85vULzp5sexWrNP/+ZyJ29CGZ9yz4Nc0Eld8491qhMR+AvuzjPLcxGM3JskqvmHSoF+TZQc+fAp
	EVlXCR0rsiH8gq2qTuAoAhZQNcDJZK2Kn9nQTc6/2ISXXJemwcs4sNZSYZtfKyB3ckbbXsxkb1f
	pJ7ohort+HvDArLJD1TZQqmJfeJoHHBU9fdWuIfoIN7GXLC36b9cqtUwrQ9rYag6d3F/ZZr61pS
	COkAljx6yJwHweaBzOm/rN+s=
X-Received: by 2002:a05:693c:638e:20b0:351:7bdb:6eb1 with SMTP id
 5a478bee46e88-3537e03ce72mr25493475eec.11.1792071217690; Thu, 15 Oct 2026
 06:33:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261015130628.184279-1-clamor95@gmail.com> <d3648f08-17b2-4a90-8c23-3036cf71f1e1@sirena.org.uk>
In-Reply-To: <d3648f08-17b2-4a90-8c23-3036cf71f1e1@sirena.org.uk>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Thu, 15 Oct 2026 16:33:25 +0300
X-Gm-Features: AclHuK-Vf3LgaGwxBoiNGM89Hp1VUWFEAhFQiO8r8Dz7zDRcZoB_S-mA-lnEEpc
Message-ID: <CAPVz0n17fZyoR+DPY2fznoFCEQbKeaH_qCSQ4j==_XefuNq5Pg@mail.gmail.com>
Subject: Re: [PATCH v1 0/1] ASoC: dt-bindings: nvidia,tegra-audio: Consolidate
 all codec support into a single schema
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=87=D1=82, 15 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 16:0=
9 Mark Brown <broonie@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Thu, Oct 15, 2026 at 04:06:27PM +0300, Svyatoslav Ryhel wrote:
> > The number of codecs supported by the NVIDIA Tegra audio complex is
> > increasing, which leads to an increasing number of bindings with minima=
l
> > changes. The main differences between codecs are the compatible strings
> > and possible pin configurations. With the introduction of auxiliary
> > devices, a definitive description of possible pin configurations become=
s
> > nearly impossible.
>
> Please don't send cover letters for single patches, if there is anything
> that needs saying put it in the changelog of the patch or after the ---
> if it's administrative stuff.  This reduces mail volume and ensures that
> any important information is recorded in the changelog rather than being
> lost.

I'll keep this in mind, thank you.
