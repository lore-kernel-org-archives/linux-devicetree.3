Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 419DE39792F
	for <devicetree@vger.kernel.org>; Sun,  9 Aug 2026 17:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786295297; cv=pass; b=r+Jt86yBy73XZ4+cuIXSHnqR+d9NMEzImJJd5PsZRMXCZOkjzlf8iOGnsYgCy6hSSyvBNVRqYIB/qVuIGWnFPs86/Ql0U3t+s7pUlj96SDc/tyB3Pp129gDxdI7UJUu54x3v83B73UhweJ7RRzPqfbwqm9aHLvAlD4AHgtTD2Dw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786295297; c=relaxed/simple;
	bh=vE6SM6kyLtlUp8Szi7B5r+qZKdKoy0TT2JHe66YwcQE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T4Dnu92heHRmsmgvBanJNIxoS0x8zHo0Cp6HGLMtzA/7Xd+p173gCcRrE9rk/yK6e/Pb+vld2JHAhvalBVnitHPUTVWMTtndZCEYKc7qoWPBSuLI7Ln0/q5rJGgfAXoIiSE/93J4sXZvDVJycj4GLbT3OakmbaOqJd/wVy1oerM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fg/e7hYZ; arc=pass smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fg/e7hYZ"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6a157f90752so1292606a12.3
        for <devicetree@vger.kernel.org>; Sun, 09 Aug 2026 10:08:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786295294; cv=none;
        d=google.com; s=arc-20260327;
        b=dusImbTYWAiupu8LcUGdUP10MzUzw7R3Oir7XdKIInVtdHHJb8yGuCtwboCfhCXYnI
         qH3M14Vun8BrHFuNKAk9P81PPgEdwhp8CYCHF5WMrSRWIPtMxq4sM+r7XOa3jMHdpi1v
         1QQSktZ/otKhc6+4xRHMc3LpcoBQ8152zLBajJ02Wvz1Uv7rZ8ZprwwSbrf8u1mTI2n9
         eD5XteTEnx3KRp1KbcaQF+/IFnj3bsu63sFr34eqO1Cx8H2tFxwBDsjoBiduF5aIEE1m
         ARy/eLkZjvoFWp+5SmXRU2PVme+8OqpZ19JBULfAdB9ZSDBMklRmmMUOjCD7b1P+D5eT
         IvBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=8l7N5DEp4BhX7FXyEm1h5RGW0uDs9b178Mc0RCItNl4=;
        fh=7MTfccf7C4vkwYWBMrsv/Dt0FUn4OB2UtSczjE5S+Pk=;
        b=LSrcT126q4z5itsMx33V+wo0eNCZT+bEr8sbHHTn/ZD1lCiBsTP9PCeDgQgL86l+G/
         KbvxWrsN+4qRsjJYjHiICXRuSrgLUPufKspR1c2sSRPpIUNq6f8N3VjnnGJqp3j9A3/D
         A+dJDgP3Zg2brhhLs6TbIaLuh19dIEgEtf+pCRId/EgQRikZ2KaoCCyTK4Xoy6wlVUHB
         Jww4FtSekYlifb2SeTjD3MzviFP2uNopvbLxPXMErVn82OTwym7Ty7m6/sUeiFt/+A2J
         9EGH6kfKr/WEzQhbhD68GxXtNnmPTqSU2Rn+siNDD47CqkXdeVq/s96jaFrUDDKWcPw2
         fv2g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786295294; x=1786900094; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8l7N5DEp4BhX7FXyEm1h5RGW0uDs9b178Mc0RCItNl4=;
        b=fg/e7hYZ4CLfl7b7kANBz/93lUNiZF+l1FJG49cVAHBQ3vSj/zI/pEAy8Ry9I6rEGK
         cu4ZQxXn+7GikmwtHYnXcc8I8xvROKj/RuNuCAR+/a7N5iUCcf8fue2SIRX7kIfAHqpH
         6VvnHcFbOMm0JXadx8V5a3oAAq040RGoigHoU19UklC/zC/JTT5cxH8qxMM76B10LSLa
         Sqsd/4v+v91GIM9pdS/63cfwXu3U0fqp6xOYfZ231+SBTQm07b8OAbnfaITic9B4WGQ8
         lBJ0iSZzjBl1r1QszAE0dPbeNlTPzjbddSibgSbH84m7MS23/IGAW8RS3mj3fTyAowZs
         er+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786295294; x=1786900094;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8l7N5DEp4BhX7FXyEm1h5RGW0uDs9b178Mc0RCItNl4=;
        b=ig9eyGoFNZDceeApmClqt4ReqL9ASRZv/mkOFtM76/F56nDXXej/BAV2EgMPcf+/0S
         HPckxS76MtR5e6D83JDa0pF6gOzDOKxmUt5V9J4G+t4QRjUIW+0xrRhfEVgJxQvVktRe
         Z/6MAUwTayEkDb4UkaMHQ8tuMxwkzeyTWrOJe8GTbpjWU4+uuinP7MEeqk5DJX1KkTQk
         NbLk68/WXCOjexis6JEQSE4B/eJvFShGCVuL/KuVwHu0JV3H7zU5A89JdEcoewiC+NWF
         G2FA4dSoHe8mRHOOSnBr1+sBTSIx2bfzv2Yzu2foz5w2/uTuuaIszGj3gILrfYcvHf63
         WYTg==
X-Forwarded-Encrypted: i=1; AHgh+RoUalFwT4i7rH6VLsQmduidbEIDOeXmrbVaMhFqS5b4Md2tCrOPZE4brCXjkzKW5Vhf96eGn6jB5B6b@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+MVbbBbsu0ZvVgzuDhcZ0rlqxBPcW/dB3L2PpMQrdXIbwjZTi
	DEXUz/jh3jBGFuz10aRX5IWqKmZirylljPOOfh7yZgArx7vaaLk8HxzzXr0S0aPvPv4wWVJ8ChC
	kzZz4E3i/W2Zpqv95qkEL0oUmx0knKps=
X-Gm-Gg: AR+sD11QLTT9nupwlTGlzQEoaN/ZsvM0+zwX+M5QmAbz+W07Rm199XoJPm3zRf4iuY7
	eZJIEebd7fByaRHIY5p5LMtkQkLhCez9ruRrpl8PUhaBczwnCpHz5YixCcB02qpsCYXMWwp//fC
	2YL2hpa9wqcaF5gLFSRt9KhsDNaduCCt1OucL8uggj6oCWkmtQssRDCAyl3g2TxxIxvPIqQLfp4
	ItqhJLZ8fHb3+t+AdKkkOQcw4x3ulaVjLhJBJfcm4Ld8zgGrRtMTi41J5IErm4oXZDGOUfxioSx
	veytblf2OroG1suNPHFKSfnPKl8++a+D8FXOOQ2GkZxRD1i+5RJUKHWxKHQ8ZnhB00/RisoC1HA
	=
X-Received: by 2002:a05:6402:52cc:b0:69f:cb2f:7a9f with SMTP id
 4fb4d7f45d1cf-6a1f24a6398mr5908345a12.0.1786295294390; Sun, 09 Aug 2026
 10:08:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260809160643.33991-1-l.scorcia@gmail.com> <20260809160643.33991-4-l.scorcia@gmail.com>
 <aniv5B4jz07mI70D@buffalo-ssd>
In-Reply-To: <aniv5B4jz07mI70D@buffalo-ssd>
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Date: Sun, 9 Aug 2026 19:08:02 +0200
X-Gm-Features: AUfX_myTNLmmUZQ4XLSt8EOVRxvsoxIzUMQsNPl9nlvxlnEuIvs9heC-YuaZVok
Message-ID: <CAORyz2KJMY6OvFQEB2GU0P7CkxothuXOCXgCcRvtiUhhPaK1ig@mail.gmail.com>
Subject: Re: [PATCH v3 3/8] arm: dts: mediatek: mt6589: Enable toprgu reset controller
To: Akari Tsuyukusa <akkun11.open@gmail.com>
Cc: linux-mediatek@lists.infradead.org, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-watchdog@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

I apologize for the mistake - if a new revision will be necessary I'll
correct it with the Acked-by tag.
Thank you!

Il giorno dom 9 ago 2026 alle ore 19:04 Akari Tsuyukusa
<akkun11.open@gmail.com> ha scritto:
>
> On Sun, Aug 09, 2026 at 06:03:27PM +0200, Luca Leonardo Scorcia wrote:
> > Enable the toprgu reset controller feature for the mt6589 SoC. This
> > allows generating reset signals for the 12 subsystems managed by its
> > top reset generation unit.
> >
> > Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
> > Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
> > ---
> >  arch/arm/boot/dts/mediatek/mt6589.dtsi | 2 ++
> >  1 file changed, 2 insertions(+)
>
> I provided "Acked-by", not "Signed-off-by"...
> https://lore.kernel.org/linux-mediatek/amEBgRmQktZ44jc1@buffalo-ssd/
>
> PS: I am also fine with this patch carrying my Signed-off-by.
> Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
>
> Best Regards,
> Akari



-- 
Luca Leonardo Scorcia
l.scorcia@gmail.com
