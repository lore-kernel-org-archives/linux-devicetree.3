Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E843230D416
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 20:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783110225; cv=pass; b=P4+JLZr0QOIG+aagqE5KwBhZV/zJ83JLNY2Y5jn9vaIEx4aSuYJCDIi4MC/fg4WF6GQ1lgev9WFZnzgNEzV/b92v1x3/Vh9+DROAxYjyc6gY8Dyb+CTXUmbPf/eJe2bfJQ4E26cZS6mcU1RoGfg/1MFLGW8SKrlMfu2zD3DFAVc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783110225; c=relaxed/simple;
	bh=mRs+IJvtl+S/Pu16c/TYvy9/SL0ko1Fkla/ifix+DNU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NL2wUH0xYaBmmaBMzQTOMk2dTVYGf6ND4CLDnTIxsgfoWI0CmBtVVFHxuRvDS+I1MNFSnG1AocD3/OrQARvkPu4YRinz7N8g0FqrLe/pp7TBgWBXFMLJHFwEoSxexRqkyKyLM9x6p3ylXYaS0ol7cOKXcX5VpIkSc3aX9AS9mnM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OIQgH3uW; arc=pass smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OIQgH3uW"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-846970f0acaso819675b3a.3
        for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 13:23:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783110223; cv=none;
        d=google.com; s=arc-20260327;
        b=J42Ep+PYwwUWp1uBwkXhRV42jnV0DlmQqajKRLV0JLQtGddVxDldqhNUyvltHW/Jgq
         q/0FM40kvrZWRQOZoUs7zqiQY68oRlCDm0vykeyz1gC6l7WWj6ooBN2HIzXkb0MQvtNB
         vYJKi4K/iE7A8tk3Z0/ZFOi6sanBk/GcC7Q6AXkwm1xgvnfLDzDp+xL3we14L4jZw8iz
         GSIIbxA7AiPlDgbhfsNRpxxinQaOUnFLdxJB2zii0VTYF48IxV1sxOpuCZn43N6R2DXZ
         uGe7p1n8jH/Hg0LplCA7V4IUD4pIiGl4aRcOjMj1jt0YCs31RMT0gM8xib0w1zZn9KvX
         iSbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=mRs+IJvtl+S/Pu16c/TYvy9/SL0ko1Fkla/ifix+DNU=;
        fh=T12zzIjmFFmBztSaBeRoamcxfHnJAW9w6c0ILz1D5BY=;
        b=FPc2gmCuuWjUNJxL+CMVcjiWn1WnXOjKXQv1N1HG/v4CBkNYwN3/DHjzePriwQcFrm
         My58FHrZkgeKixgPak+v2DylMz1sNjTcb+GcljKG1XALyWKOjTxYDrIRC+Ijy4GzBMRk
         1MREkjxrV98D6V9rDm/KMra2q/1UTUXRcIf4FN8JHVTAnZEk1UkLPjDLnMX3C6TAgMAk
         UaHBsz5UyCgvml2z4nBK0XRzPn0W/vdKZ8hS+PYi8eBJYBwytQ0ZK7avBaAL3kjlb0/U
         tm1NSQ5KDkWaXrau5s2tHsK9azeaV4yg/i8+B0Hx+zxGb0bWZ4FqJFkXE/vK0hd6PzGH
         hjFw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783110223; x=1783715023; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mRs+IJvtl+S/Pu16c/TYvy9/SL0ko1Fkla/ifix+DNU=;
        b=OIQgH3uWq3gI9mdimOwCuKN7rzk8KxrxHKlFhg6WjGwnS9ki6alxDoqpIuE4y8Z8ET
         BNdM3QdSZAX5/gSrz7pLvd28uzs7fqngiAWeHkjWaShHpoAyMyuLgYcHmSfDdzBRelYm
         hiXi90yefAHZdJoPMyRJrAM3vfcSh3MOBW4Yg2SA7CPEFZ9ZLPLG7MCgqqMew+S8LE7f
         StzTOJZZSKDAvISwPzJBbd+MfhirOCl5N84Da6phWOYqmWrONq6i4YeZobkkQMG3IfD/
         3O6Wz2X0OiM6sWfSOtcdddx5i86Iw6eg0bSwBgEovLX4jeLs3hVLMSb1yD8XcE1bI8hV
         gmuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783110223; x=1783715023;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mRs+IJvtl+S/Pu16c/TYvy9/SL0ko1Fkla/ifix+DNU=;
        b=Ecedr94y+C7T+NezTkzS0FK78/dl2kmdivUVhV6b/XpuRh6w84jAiOoVcSzyAukRE0
         Y72ZB/fNrpyJl0RYlKabWB9erWKgBnvj/kccqj0Em+3EDH7bgw+MGYBFEfiiAwOYKQN+
         6SKZr4U/wJfDz5Q7CTX7NykTVhq6Ldn9w8bgBuiuy/4RlEeDsqc80uP8+jn66yQNCb1/
         0a4L83yAXTgjRfmFxNlQgNrWiKKtR4rXA9CPilUGznxUeBCRP/k274g0fopbRCFgJEe+
         3qJDyZRSm9/Bu/cT56TiibGKs7KGWHwNwYO3JkQDwp+g8jAaZubsjnLDMRlC2Jg+jJw9
         VWhQ==
X-Forwarded-Encrypted: i=1; AFNElJ+7r31rIewl7Ziz2UFbudUZkeT3CQln2ienIDxBk+U9Q73p/8PTuR9BXkl+MdTG/Kq+i6XXlNghF9lZ@vger.kernel.org
X-Gm-Message-State: AOJu0YxCaBblBRVyWRIEErhcDHKjowymArVQR7BZyQR0zaTU9S9tJ9er
	leOX8jDktSBhZafyeejTWLr1exTCMy5lOd6meBCQ97ENSmKAG5W1cbSOalLMIDUbb5xijULfF2H
	k/jq7jY5Vg3X+YwykTodS+4DuJqETJKY=
X-Gm-Gg: AfdE7cn2dW6Jbw4zCsv7nC+vi7aY0+JHVbwD73E3dVApm6Nvw0tnnPB+qxY2XP25fK4
	wHcDILp7YMd/5znZmShBNPGPv2F1wXae5Mxdg6tAMBA2BUSwLN8WhZhEB3GwUhBV5bD78JabTnf
	et/s+ZCzf/ClMoR79WKbX0S7FKHyMx37IEMDKwyfwd2DL7eOSpwrxTyZz0IjtsapfiQBNC865sa
	kxm2j4TNJzJOuIt418ZPGNEao3pb3kVxg1Hk8e+HaED8KNGpJSjJkxlCmqVhIAthqJ162SgG9vY
	8KHXkh2qzk6vnhZ4/XYSAohB8qUUdK287Mr43h3EaKT0wNux3Qs6KA3InutbaoI=
X-Received: by 2002:a05:6a00:1f09:b0:847:80f5:c612 with SMTP id
 d2e1a72fcca58-847f6dac812mr791279b3a.15.1783110222915; Fri, 03 Jul 2026
 13:23:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260703-nanopi-m6-v1-0-8344a1559519@gmail.com> <DJOWHH5K7P76.3JPJVO47K1SZE@cknow-tech.com>
In-Reply-To: <DJOWHH5K7P76.3JPJVO47K1SZE@cknow-tech.com>
From: Joachim Eastwood <joachim.eastwood@gmail.com>
Date: Fri, 3 Jul 2026 22:23:32 +0200
X-Gm-Features: AVVi8CckAXJDSb96QzP_ICWB4DkiCnysZhniMzHMp6xtZ-2xIzGSQUlvFXbFqdo
Message-ID: <CAPSPb=tZ1FenNfEM5P+DWcksKvpQjyQQjAWTRdyxb7=YYxY_rw@mail.gmail.com>
Subject: Re: [PATCH 00/12] arm64: dts: rockchip: Add NanoPi M6 board
To: Diederik de Haas <diederik@cknow-tech.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

Hi Diederik,

On Fri, 3 Jul 2026 at 13:30, Diederik de Haas <diederik@cknow-tech.com> wrote:
>
> On Fri Jul 3, 2026 at 12:07 AM CEST, Joachim Eastwood via B4 Relay wrote:
> > This patch series add support for the NanoPi M6. This board is very
> > similar to the NanoPi R6C and R6S boards which are already supported.
> >
> > Main differences:
> > * M.2 M-key slot with PCIe (Also present on R6C)
> > * M.2 E-key slot with PCIe and USB (from hub)
> > * 1 additional USB 2.0 port from an on-board USB hub
> > * RT5616 audio CODEC
>
> This seems to be the M6 (2405 aka 'V1')?
Yes, correct. This patch set is for the original M6 board. V1 if you like.

> Because there is now also a M6V2 (2603), which uses an ES8389 CODEC:
> https://www.friendlyelec.com/index.php?route=product/product&path=69&product_id=319
I did notice there was a new version, but I hadn't given it much thought.

> Is it useful to already take the 2 M6 variants into account with this patch set?
Yes, I think you are right.

How about this setup:
rk3588s-nanopi-m6.dtsi
rk3588s-nanopi-m6v1.dts
rk3588s-nanopi-m6v2.dts
This mimics the setup for the R6 series boards with rk3588s-nanopi-r6.dtsi
and rk3588s-nanopi-r6[cs].dts.

Note that I will not make the v2 board part of this patchset since I
am unable to
test it. But as you said we can take it into account now.

If you have no objections I will integrate this setup into versions 2
of this patch set.
Thanks for the feedback!

> https://wiki.friendlyelec.com/wiki/index.php/NanoPi_M6#Schematic.2C_PCB_CAD_File
> https://wiki.friendlyelec.com/wiki/index.php/NanoPi_M6V2#Schematic.2C_PCB_CAD_File
I did a quick comparison of the schematics and noticed the following
differences:
* New CODEC; ES8389
* A new "User" button connected to a gpio line.
* Different USB 2.0 hub: CH334P (may not be relevant for DT)
* Different USB PD power solution (not relevant for DT)


best regards,
Joachim Eastwood
