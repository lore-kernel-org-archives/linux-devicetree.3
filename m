Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795612073;
	b=aHm6br/5jkUQrHfhKLhI5YQaiUIxzP6VWXUbp2X367gD25XUMkLz5qLEqFeLsW8mGaK0
	 MzHB4SgXegsW/cjEjmJhWbmY2uIDTe4Ovax8YGhKoCag6rXyMH3BQB7jlC1dJWrGSTiMh
	 jZGDPxkQHa9007v42b7DEG6BKJmDSumu8dMa70oNSQNjMfVCV3fxZGfe9eteJCG3mpfah
	 MwA56OzJVvWxudypk0ip62th7MtdHM6Ta3WE0REYdhv64c6i5VCyMiC+SM/A8nCfyCAfK
	 MWPjexP48YHb3s+jaXPaGMzEYrUAhf5NEq+3deO9eKgUQQCuxgJdswv+PtppucEpVqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795612073;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=rbxzpWqwrRbguc2ZFVrHH2aoPrOKmuVFWoTJw1eHSIk=;
	b=Mk5d8y15vMoYYFMszIYsiJwwABmKL+FwZ2vrOSPqws4sFGkVOAkJmrQzfuISgfgPRyeJ
	 XZgoVJBYhGoUQdqtVq/u3PuB1/1Z+Ab9QqeUKd7+jePHbLsJWh7sbWg4uD6fxiYqclUxL
	 GEd8wvivjBh483i9XkQG1fSf7EA6vOXd4n8hfzdVbEjl+JiYU4roNXzW2PSIWU8SjuQfv
	 u2v3AqUk8g1xsLxievP7k8NHk5wa8yZNPW6pudwHNp+4fyr7DO2VfamxcLGz8y7Xlj24S
	 0l/PiZEBfoCIUUPZUjy/WVVQTiJxN6bmn+iZmm37asPVwvgKCLElotkAEM9VbiSR2Qw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ik9OkEdc;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EBF2606A323
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 13:07:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5EBF2606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ik9OkEdc
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48e20ed3b9dso5067230f8f.2
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 05:07:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795612072; x=1796216872; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=rbxzpWqwrRbguc2ZFVrHH2aoPrOKmuVFWoTJw1eHSIk=;
        b=ik9OkEdcz0lBWXP3zQhg/dxf+nRVg711ZuXBfy+HlYOb4kDY/FWHt+10HsOpArGfZO
         jBFqyB5gltkyarPZ01Xe5kl0v8bzel/Gg8iEMWoV7BwjCS5TYn0pM9bnJfiHRGXj/avE
         bc+JduR5pBXQkWa1Xy7BJtVpywXMbOZADSRkJ/XSgrsKc0WCLmOoD9Pdkx/eFtZPeUnr
         FJpcz0+UhBz64iLV+IXJH3d1g2jXf8G2PxJDd5XpQCGI+ZPSXWRvUYmoMhk0mFJuGapZ
         oP3pZTC2N8D5VFtECpr3nPd5IkufySQfxXAnDB8RqyYAh/4XhcxvpOmaAUdM43nAcWfs
         Vuvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795612072; x=1796216872;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rbxzpWqwrRbguc2ZFVrHH2aoPrOKmuVFWoTJw1eHSIk=;
        b=eaPVPYt3bnZKVhpg7rqmP7lFs2NzJnfEXqOc7q0fOtg+Ch0KRbmIYH3IbTSbG/m2jU
         fzcTcJJmACmb//lVi6veaRsp0bVgsmFQaVziJhK8dALYSK3YJo1snZBB0ZTPMdgYuh6u
         voEilUYC+el+QItkOSOE7nf2309pP/eqGqpNpXcUFud79dR2FA37+vvHxnp0J3Gd0RvR
         qr4ky+t5L2kaTZtsGuisTogeL9f/nU1aeC6Z/e9r3GCG0DnvHoJy1BPDdFnLMaF+xgg0
         ne0DQL1/6LREf7fbFa7hRMvcWaljwpqjInztqSOwI79tGlGStb3+OU74GThezU2hESkl
         eQ6g==
X-Forwarded-Encrypted: i=1; AL+hErG2z37TetTjpwgsEL5QWRrAnvj5INIZNlh66HJVNPiKNQGqr2/YNggC5LNm9pstGUPLcj3GBxodRFk7@vger.kernel.org
X-Gm-Message-State: APuU4Z8TQq4vnQ8nqXdCSCEWp7aIiwTwkzmsMsMs1XFNxk9RBzeIumO9
	mKKb4d1+nMMg8h7Shr1VfP2X5wg9NbuTH5XsAfZ0SKXxmj6ZwAeqolrM
X-Gm-Gg: AZFdTZeD12rjF1ToIagOLdjh1iNULgyD5K1/7Uj4LgdHrBFALUA5UEWvC1bC3yD5P6Y
	g4cCAQhBVnc/GQaBYjb5nYRKW8v29IUydofFj0oijYHTQsXQj5Fb8x27aiSaKantkGdKxAqkgtL
	KF9bHSgo4/QLLQyassi2hXCgxO33C0J7gJnbyW7mtQbX/2a01nSHfsJ/i+3SEqaa4JOC3B8/T6C
	yxemfCG6olGLcrOVFnB6Vz894Dp4gP7kg+fj+F4a0gRZsNoOiCvvrg4ZoxX6iOnGa1ZeYWtPSsp
	rzODZx8Tejej9CXINr5dxUiXgfDeuVpTazh+l3n467SBoAlSb26HbbzfwoFVqRK8Nv7J+Ct8FfK
	FyJjscZ82kDnHgp+iMEzsWXlqRvvcLd8/9z2G3/TC31XaZkqSfh5BEcdCqOSpBSx4ldlZKmKCCF
	XMRAwKVRYec382yHXUkTZJmxmkBK4XUcsPM5EvoyDKmyEh2JXsXEakRZetAncQDd0kQkTrW/kfv
	P9gF4NI0HZBmdy5DM7R/xjUCXQooQNr4HlX+GypSPyNZw/XBiCyuMAdg4qeH4dsSzNyUUXhoXSq
	CEPsRbyQ0w5hItEj7vBQeQ44PtAtbij1SLHw8QKeJbHU1zOB1Ce66QkU968rWlaEEAw9bpHjq+w
	0ezo13EEoC2CID7uQx/P9iz4RGwp4
X-Received: by 2002:a05:6000:2089:b0:4a8:647c:f963 with SMTP id ffacd0b85a97d-4abb964289amr35929140f8f.51.1795612071506;
        Wed, 25 Nov 2026 05:07:51 -0800 (PST)
Received: from [192.168.0.10] (catv-78-139-0-46.catv.fixed.one.hu. [78.139.0.46])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b110c50sm33783108f8f.37.2026.11.25.05.07.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 05:07:51 -0800 (PST)
Message-ID: <4ed7e2e27c221ab900b1562c2a578b78c3c663b7.camel@gmail.com>
Subject: Re: [PATCH v2 2/5] dt-bindings: usb: samsung,exynos-dwc3: Add
 Exynos7885 support
From: David Virag <virag.david003@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring
	 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	 <conor+dt@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	linux-kernel@vger.kernel.org, Alim Akhtar <alim.akhtar@samsung.com>, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Date: Wed, 25 Nov 2026 14:07:50 +0100
In-Reply-To: <179560526391.84329.2026344704407829230.b4-review@b4>
References: <20261123092244.1792040-1-virag.david003@gmail.com>
	 <20261123092244.1792040-3-virag.david003@gmail.com>
	 <179560526391.84329.2026344704407829230.b4-review@b4>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.62.1 
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Wed, 2026-11-25 at 12:14 +0100, Krzysztof Kozlowski wrote:
[...]
>=20
> > diff --git a/Documentation/devicetree/bindings/usb/samsung,exynos-
> > dwc3.yaml b/Documentation/devicetree/bindings/usb/samsung,exynos-
> > dwc3.yaml
> > index 8af0143c3e47..f62e3ed82257 100644
> > --- a/Documentation/devicetree/bindings/usb/samsung,exynos-
> > dwc3.yaml
> > +++ b/Documentation/devicetree/bindings/usb/samsung,exynos-
> > dwc3.yaml
> > @@ -24,6 +24,9 @@ properties:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - items:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: s=
amsung,exynos8890-dwusb3
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: s=
amsung,exynos7-dwusb3
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - items:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: samsun=
g,exynos7885-dwusb3
>=20
> Why isn't this enum with the other entry?

I failed to realize that that could be done while rebasing the patches
onto the current tree (as 990 compatible wasn't there before).
Fixing it in v3.

>=20
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: samsun=
g,exynos850-dwusb3
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - items:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: s=
amsung,exynos990-dwusb3
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: s=
amsung,exynos850-dwusb3
>=20
>=20
> Best regards,
> Krzysztof

Best regards,
David
