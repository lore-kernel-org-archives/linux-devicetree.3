Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82E223BBFDB
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 10:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784285672; cv=pass; b=IkhMisEyCSuhZZ0ghCUb/Fi3KFnfHUgzyt6EzFQLpQF1txw8fNuu5cfGAeQlHj0ewB1osg7XiSHWt134qneg2aTrKqBwTLhv52Lmc1FEPOh0fzT93mY6r+DDiT2oHxNib6gGl8GXWAFmJVZqJsXC1xozj0fcf9sEgF/Ly5yMS+I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784285672; c=relaxed/simple;
	bh=nrUOAzZP+2PovXelAOxDB+zIxV92Uw5aftCZN9sCZRo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e5cS2+851/KeEN+jpLr7O/Rz5Jpopyy54lD9PgJtXw+Ac2/NT4Jxu6i67vBNfIzjBq6zCI/nZ+Unr74XicPuhJeka84YBatE14Rtxcf8CG4Irbwboxz59+zecW5b1/Gil2XZVcRoEgjJaGhNMdqc++0HEIn58kdCithNUi0lP6s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KT6sTnVB; arc=pass smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KT6sTnVB"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c15cb6f5c12so1340808566b.0
        for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 03:54:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784285669; cv=none;
        d=google.com; s=arc-20260327;
        b=QnLXUrPYekpaUJXCDUt8qemPQJ/qLZme50ZyTb53nUtfUO7Xl+MNHpdqDfGjxxmojq
         +4gD1q/oI+0udIGwJu3qkjMVOFX1B+5M0kWoNgNCboEKINgoqv5IoacnbfYzTd616pGh
         gMFGaVwg6P3yU8ImK+hFcfGIUM810JXIu00/PS9HeduwPOaFoZtKPZIj2nkYJbSD1ghU
         uGsJMVHHGMwlWoXqOULPfYM4F5wpaugAM0u2eFE8PBUb1RW2vWGEuAlEnpNYgJlQlX6r
         fepTp+Kdn3rEVyokvd6IGqGnATBBCVNRmL9mN2F0Heeabz8fNDMMzfrhjYxG6sx+r8YA
         3bxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nrUOAzZP+2PovXelAOxDB+zIxV92Uw5aftCZN9sCZRo=;
        fh=K2nsWfUNMG/RRUpdkVgb09AQzS3yjfizkFs+bZEUzX0=;
        b=coYNR1we1g8q5WVhKiRqrqWS2+NTILsaVJUQpvRm1B8L16tl4LHfaftzwhd93JFHSz
         g3bVTl9SElAeJnNSG5faji1bmwk2x8+lIXjHPLGUmz3bcBBb2iGk7HH5pQnJptabJ5CD
         beUGaHgvtRhZNIDTuzbr3TXDGwuOCuuww8MStoq9cY8A8lhnPv6bW+nVlRANQiIkdcY7
         49+7jeg1X6WxbiO0HrgC5hDdFeAXfXvRhkCbgFcvKa5qKeSaOACiwpI/7/prwxEZzb4D
         JR8rU/iI8OLean9zAVvbTWCwTD9I+olTKrUi1s2QxNw5vkDQ4E0JqYba0frTjaKZITXT
         jwLg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784285669; x=1784890469; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nrUOAzZP+2PovXelAOxDB+zIxV92Uw5aftCZN9sCZRo=;
        b=KT6sTnVBbr+LRGt99Z4DtIUdyXuId7DARTg0iHwVDGrN5Irv1lv1SMMxJgb+1sgcAX
         PGfK+GGomZIblZtvvbX0GsJkyiIrKi9DqqWYy3FApy+5QRr+ZhY4cltnnFljS3cpuYAc
         uwySH4tXyu6ngffucwwQIpA1UQC5S8jWJjiaiRdFW/UYgLzRTut/3HT44UFu6tdbzdst
         HhgvS2/zCKG8YFQQKEWAub3SSbYbg/iNxGTgqtUYJLcUglONHSFoy6GnWohQLlPgxBBJ
         vdarJYomLSKBrhNRXTGFxj+U3UdneDl08B1EdlUDYyM4undQr7Ra29x0wxaaMZ/8j0HS
         x9HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784285669; x=1784890469;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nrUOAzZP+2PovXelAOxDB+zIxV92Uw5aftCZN9sCZRo=;
        b=tTrS+hCrFSIqjmngCEU/qg1uY3HZN9/Wxc3uYJxlNi6F7W9jYUWMu+ba1KGQ/6xVT5
         ZmsGCohqs3kltIrC4NCwxfYJ9Sz89jUQ9C6VMH8pyJc8K1eYbhly5dZAPxc0b0o5es9D
         hfX1AsTHR2zPgamZ+hI5YWb6fZtzWQgBwiURUjHBtXT5ga5WQ9igjc+NQMjkuypiwDzl
         Nzb5gxwQ9ynCj4EOZbDePHMqvnweDTrZZEpGDyx2X73gaN1dq2nG33viLkgvXaBY4swK
         XDULAlOWXDO89MG6OZv4IgLUaMphQesGMo795o0PNLvXftX3xsQw/dgRgDMcrDwGUxRx
         krTw==
X-Forwarded-Encrypted: i=1; AHgh+RrPfNGsnbDcU6qaHY4vYh4Td5G+mCOzVia0q8vEXr4B/2R3P2ga52t5rugZDUaRj187KQy2MkvW2qOf@vger.kernel.org
X-Gm-Message-State: AOJu0YxWTxJLmRrpY1C+GwdFGU0554W5pRks0YP6N5+tE1eEPY7UY/TY
	zpLXzZ5Bb+UgzKFkXp4JQJeXnHBov9s7y+ZlPbdpTHuhFWBhwdbb453ua2BgFzCUbsPnjQ3+Qdl
	dNlQY9oFF9lrGrD2ze2C7MmEDxPjBXO4=
X-Gm-Gg: AfdE7cnGpmBoVmrvmtjf5/4AXbzjqvBivn6yZz988Ju8HhQo0c2ttPpkffGtII90Cr/
	DG2y6AfOuvwLlEMnecRhJCXIUtlJ66V7uSQ1Rrtn/oYeq9V1pWMhWk9HvJUOEynDmkyAny+pN60
	NwUEIRHE8lPjlO+Gr9/nK94auQVoiC8Pk4IB576Xv2w3sTNEsqJDzwMvi820bUoLntaSwKFNHYd
	3vLuMLRSrN7q0vq0miCjFZhxz3WCvLcCFzh1CVrAgznhF+jJfl4HNQmpdps6bNA0ZtBxqGibw==
X-Received: by 2002:a17:907:3d4e:b0:c15:feeb:3e45 with SMTP id
 a640c23a62f3a-c16b4837b8bmr90457866b.52.1784285668347; Fri, 17 Jul 2026
 03:54:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260716173325.653164-1-a.shimko.dev@gmail.com>
 <20260716173325.653164-2-a.shimko.dev@gmail.com> <178422864835.973481.10210790720231842764.robh@kernel.org>
In-Reply-To: <178422864835.973481.10210790720231842764.robh@kernel.org>
From: Artem Shimko <a.shimko.dev@gmail.com>
Date: Fri, 17 Jul 2026 13:54:14 +0300
X-Gm-Features: AUfX_myeFyDWKB8pzxvQLcYhFuIzm8JDbRrBR034Mt1Z7dCwsamuZ-myBwWoMsQ
Message-ID: <CAOPX745M-8_oCC+OSi3AQE1gfNmqndXW-eVHzeSO3dbgN-uy-w@mail.gmail.com>
Subject: Re: [PATCH net-next v3 1/2] dt-bindings: net: add DAPU Telecom
 DAP8211R(I) PHY binding
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Paolo Abeni <pabeni@redhat.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	linux-kernel@vger.kernel.org, Heiner Kallweit <hkallweit1@gmail.com>, netdev@vger.kernel.org, 
	"David S . Miller" <davem@davemloft.net>, devicetree@vger.kernel.org, 
	Conor Dooley <conor+dt@kernel.org>, Russell King <linux@armlinux.org.uk>, 
	Jakub Kicinski <kuba@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
	Eric Dumazet <edumazet@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Rob,
On Thu, Jul 16, 2026 at 10:04=E2=80=AFPM Rob Herring (Arm) <robh@kernel.org=
> wrote:

> My bot found errors running 'make dt_binding_check' on your patch:

Oh, thank you, I will try to fix it.
--
Best regards,
Artem
