Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2177536A03F
	for <devicetree@vger.kernel.org>; Thu,  1 Oct 2026 19:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790881435; cv=none; b=DvaHg7/xJSepormJu8eBoxA+dBmlJFDOSQfUX4gSWmqYeD2UlK7VFMlEw9S0CkJ/2fzLGZwxn9Q7PlBdpdQdtGpJdSbrbfVWWg93E32eJlB9tHybTbUHdHpt2Ne122guWa+hZR56myWVAnkRAZ025kSn5/WRnBOfniRMu5F+BTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790881435; c=relaxed/simple;
	bh=GTQrB6fHqvL+6UsnsGE2F005nwTcDsoCe/TNBa4j+gM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=SrRLYVMM7ICWOuqFUbpsq5CV7iqP7GxoTUv5mnBlmZxectboZ7OjT1aqzwgRUHNezb6gutaN1+Y9jN505l/NdA3EYJjPNHu+JuRNPwoC9waumy8976ATyIrBdPFwcAp1zI+ENbIifLOsXRB6kDVEN66UovZV9YbGef4lfxzWsns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=djH2I1YX; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="djH2I1YX"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-4885a1480a2so4127032f8f.3
        for <devicetree@vger.kernel.org>; Thu, 01 Oct 2026 12:03:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790881432; x=1791486232; darn=vger.kernel.org;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JH8rWq/AytgPhFoS61LuGcNOLtYiANYYgdfeoHCVlD4=;
        b=djH2I1YXE0D9+SOJ1sNcUzmwLybWDm6PRB/Y+vVxkHMYiomhSWVMqwLTWrgxb9y+An
         ryLVm67r8jpGpQhvntTzhiAFwrcp9wKaOPgclWvDaaD+fQPD72AcghCjavUtlOoCbCST
         cw6thV5gEZfdsl08/95/vDnsamvmcCER8TKqnePbqJY11fE4V7fR02nZaYuOMDI3gOuV
         UD8+9aKh1mxufH8BwzmMZzeJ+k1+CDKh1rhfBGaBSWpeebmsqE9m8CE+6pM6adFYFFWd
         biyS2ajqNIg7mQgBBmcbkw8bk7ojZJbEE1TYmLENcs5AKvVV7PKahk2fAirkImoOo6PA
         2RGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790881432; x=1791486232;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JH8rWq/AytgPhFoS61LuGcNOLtYiANYYgdfeoHCVlD4=;
        b=GYD9YANOXlVMEHQsiRHTAAPZEmQ3facnCfeWG40pWUJftfZ2yQx0r0zRXBHhkdyWF3
         FJcDCUMo8UlULWHUceQNUHhP7swZ6uOu7DILdBxNf9GWwh/Si+n/uiSpgZirVojb6/4e
         GRtfOC5leaup8MkNYjxiuVdT8a6yktt51DSpZoUJy4gXt1dhdYAstXl54qcnvZmI2YYS
         DVYZUuTCW0A3aUdhTPuc9XavzrReCF0DTBZ/DXP3JcEQp86Sx5kZgVivw020HnU3yWMq
         4WqdrQfRpdQbD8zixXCSxgksso5NgiGh+o+2eyGdiP4oPwnQ6qQCIA2lVp1WAypBfz1d
         Mh1g==
X-Forwarded-Encrypted: i=1; AKwUvByO/eJvM33RQn2orJIOF6IXocWJLrM6I8BnVpBeUhKAOfTgCwpJzHGTvY3UpAN3mITKh7oTm3qiU7iY@vger.kernel.org
X-Gm-Message-State: AFq9FYLBaVYCA6LZXm6t7Lcr60GgDYf3koprgGeuRfUf9YQff6JWUgVa
	//nT8aUwnj1yFxs02PTbQ+hErDdxAUCz/m54mJpZPsA+320uhDP6OTFl
X-Gm-Gg: AYBFou2WrMOJK4z7Q0SZzIc7KpsUJRTnuoJuSMre3VquyMvCNwzSkQUlY28Zhw51CSn
	u2/CB9diL1ldRXteioM4i5cmAisffI6UHG4EwqYAdcJZWXHG5kA3/xJyN7vBeszd9SY9qx48D12
	xNzKQ07YbCVu10uffORFRj0+khbC/wb91KeovrZmgSWXNP7i6XD6pc3nu/b2TCybb6z06gxegEN
	Vb5xPk2Z3R3bFM3LeAkh3GqukvV4wzQE9b/Lddx8/LRohvQ2ZN9lxIC94dwQXrAP1Py/8Iwsa7s
	E1nvigCCqRlbq3nDn7gbScR0bk3dL9k3nFrRvQz5dU+LpOhGoM/mfuwMrmeQ5jjDFsZX5R9hnOy
	lQTurBy0n5ZlTgGKvKAks5hSiZm0T+yP2WxQR/vsqa8qdYvUAX1tPpVt6Hau7EoHzDcp7QgKS99
	202Y1hpc0lo66dl9N3xTR2S14j26mVcwdRjuTDGhGpofQx4ij9J5ZvcX5pQ/Z9/FYFHZmFJT8xm
	wb/bf58i2uIJ4NjIICDYllL3JISjpZ68A==
X-Received: by 2002:a05:6000:491b:b0:487:da0:df5a with SMTP id ffacd0b85a97d-48b12729938mr853133f8f.42.1790881432191;
        Thu, 01 Oct 2026 12:03:52 -0700 (PDT)
Received: from [127.0.1.1] ([92.241.23.201])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b380fada5sm222539f8f.24.2026.10.01.12.03.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 12:03:51 -0700 (PDT)
From: Fil Dunsky <filipp.dunsky@gmail.com>
To: Conor Dooley <conor@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Linus Walleij <linusw@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Drew Fustini <fustini@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org
Subject:
 Re: [PATCH RFC 06/10] dt-bindings: serial: Add Cortina Systems CS7542 UART
In-Reply-To: <20261001-depose-jawed-f58674109fe7@spud>
References: <20260930-b4-cs75xx-v1-0-4617c4463529@gmail.com>
 <20260930-b4-cs75xx-v1-6-4617c4463529@gmail.com>
 <20261001-depose-jawed-f58674109fe7@spud>
Date: Thu, 01 Oct 2026 22:03:49 +0300
Message-ID: <179088142900.827715.5924606072568297915@gmail.com>
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format="fixed"

On Thu, Oct 01, 2026 at 07:48:03PM +0100, Conor Dooley wrote:
> > +description:
> > +  The UART found in the Cortina Systems CS75xx (Goldengate G2) SoCs. It has
>
> Different SoCs need specific compatibles.
> They can fall back to the cs7542.

Right, the text reads as if the one compatible covered the whole
family. The binding only describes the CS7542, which is the only part
I can test, so in v2 the description says just that, and that the
other CS75xx parts and the Cortina Access ones (the same block, see
the discussion on patch 7) are to be added with their own compatible
and "cortina,cs7542-uart" as the fallback. The compatible stays a
single const until one of them is added.

Thanks,
Fil

