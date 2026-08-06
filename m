Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 627EC377ED9
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 01:37:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785980222; cv=pass; b=p7rhw7ELVMi+3iQUNGnJnDgcd+AEFTfTucfU+008/4gB9kjyuf448Bzdb5Pz5s5dq1un8owaC5sjnicqWoqxQwS6PbEUvoZSnoxDzC4C3chueANI3IQ3uotlgOKfhv1/1g6Bc+nZGVgUvC/W34C0x1BQbULB3Iv4VZjOzftW7Zo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785980222; c=relaxed/simple;
	bh=HRyDszTddmkegZPbqbF/UibEB7wszONa/Wg5VtrCDCc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t08tqjH4jsHKgUCt+81o++WBtGOoAHiPhbrDx7NsSYdPbsBCJuXFJJYSwkL6dCQez7Z/xf+jog5nDu6bHSfl4ESRTRvizZPi2c36pzbA3QwatbhPOVlSpN2KYjC2vO4FDcUWBWQIEq4gGif13xr5Cx/lZKZ4YWvMJxGc0gAhHp8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M1xZgLgq; arc=pass smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M1xZgLgq"
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-5c2dbaf828eso585213e0c.0
        for <devicetree@vger.kernel.org>; Wed, 05 Aug 2026 18:37:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785980220; cv=none;
        d=google.com; s=arc-20260327;
        b=X/MxnBVnedHwU1Kb6i6zeEUKkCEe4jE+qlsrWpZy9I8k8dxfHfRsOnSXH5sa5GNx8O
         ptnvBbaLByCVellGPybEp1heX3t4/UhDbQ6KdSUnnGITx9PyDLim0JkwzeUQcgkMkCby
         kIVEKuJ4cZzcSnPM4I7SLvkaSSMxZC003euewukLPrSwwmnPm94cVBW9NBjfvHSqasfF
         3LJu2WqreYzDbOicPs0wBQzK+gPXhnasb2DNHKFXxx1yvv/NdqGJ1YQ8tDEck+gStSWI
         RJ3oGn0/4irXypNHVzt7ADplt2nIoffsiiMkdwp6XEzgJOuzT8FTRWyFklGe8g2C0MZP
         hjpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CmtSbhR0umzoPCNMklVcndk+0d6Cbu71OPbe5cqrdZM=;
        fh=oLp8h++TrFV/uWufNiiSuFJJR3MxpZzGGbWn6oVbrEo=;
        b=I2gTkAiO0rf5+EtSp3BSixzWa4etIVjSBh49E/nBys4iPq9ndW1eNZCiq3RXdO8PkJ
         TgyvwELYH5I6HPSLiIXPrDtNqY9CFWvPTh5WKs/2lf/NdR5BRpxwbUI97AHDrpdO1CmX
         gYOBQl1l/tfuKG6Lhl9WfD5yOw1D54da9ujACFEX5R3gC07KVYpt9Wfz6FWFz9Fn4uUM
         jiGS6v+OOQp9tJLQ7LGmBjFJVipBBLpQConMvQNO/ClNmSJwkzVR5ni9182t4kHMjxnq
         5qKMg79JGRGX7af+N/sZd+i2UQY//Ljo4HEfuEk4aEuP6oA5df1PY8Kx2tDfPky346T6
         +gag==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785980220; x=1786585020; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CmtSbhR0umzoPCNMklVcndk+0d6Cbu71OPbe5cqrdZM=;
        b=M1xZgLgq/OM47q8liorINFQb/B1dl5WWK/SLET5KCnsRDxYXRn+z5bz2hxM3jQTpba
         twuBT06S0LBGq/1Gvblf3+Qb//TCIwPH/YpfIhsL2wcLUvNVPMOmPVFRZeWkkBGuvE5H
         SONxju+GJVPO1q17gwp6qpZBTbjffpl9h/rQQkFvmsY2Otfi1Qj/KEoOeuJqUhQVdkCV
         gp3CMRXbaWPAiAKbkwsEwVVt6Yg7gAODl8aP6PZL+upseYSeL7MnNxTJzYWC+vdCOUL3
         2Xw2xfBw1JRQCC6+8h6OJvuRPdhjOtAfXzQThbQci7PS47RT/G8lRRQUf77ufUVef6yL
         uA1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785980220; x=1786585020;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CmtSbhR0umzoPCNMklVcndk+0d6Cbu71OPbe5cqrdZM=;
        b=YF3GI1/Qdu1+Om3Wn9vJyUOkq4VuGltTjpc5sSQ4fKz6f2zgHETlbqhWAVPvEhotfK
         6TsBeWyrSmcwbimafod6a3MoDtl0s+b6bBxGkdkIlJPybPzF4TJDDC5JRKHF5Wu7p6cq
         r6KUC9TyQPKFVIVIqrqi4y8DKzhZ3Hjjh7bVre8uSWnWl5f7XCiMXe05eJgo4fYo2ZWk
         N+sDxmXOzUaMV/UchY0unfDsodfzfc/nDz1dPxGlGCCDMDnDsLOyrZtk0Po1dWDCdYFz
         B+PFFkFU94QTrOa0jmoHrn+rkf4Bjf3oOZmWM4WR5Q69EBebhv+yNunXsJHIK6Cp+lo/
         VKnQ==
X-Forwarded-Encrypted: i=1; AHgh+Row43nZxiELSx5A7Kl4zPryDWpo5fjGjv4na30U17hSHj6aXbS33M63I71J7/RYDmrV8xLoj3xXYdda@vger.kernel.org
X-Gm-Message-State: AOJu0YzbQ6bCWZhGkS7ZieJM8cDPzIVlDxIMXPI6G/U0Fh4ANTTh0MgZ
	Wfcf7U2uDewRiq8czrMb6OrJRf4jnKMJhbD7//o6z5FMDlKDBOXWonJon/VXtPCEwZy2ybJkgXY
	LhHcaInuaQNCnyIZqO6jRU4Y1xsF6B30=
X-Gm-Gg: AR+sD13WfYC+bUBnIG66gPcL2Vu9xUoryiV7vgioQcUB3URu+xAcplF9faYqwUnfmTL
	qIr1kkdhZSzhDTqrhV3+Fb+f/PZBU0Smowuqs+zc9LScbtKv5kG5Vh/vOPKwA2/ai/0O5y3Xb0Z
	vvZPe0spVQszXlW86gnko64RkBLQcbA2mWqy00IQKaKeLpiYZ5Oz2WP7v0U9T1vYTXNVLhxBtqN
	zUrXdZVCwZf9FLkWAt1kyU0Kz5KzOjXj1QbrX4+PxeJeEqzLYv0hK5GIUYkHJD2E9y2OxdxBflw
	KAiln79FrAxDh5zhcBPUnipbukD4YbXK7E2BVCuMbeF4DlGzYNeSygaZqAUoBlpBEIW08BJAxJ8
	4ACS+ZgOtcjS4o4uAJ7clJDJ/SmoYqCbQ+OXcFAl/CH0psA0J+nsPd3cgtv7wo7iz2VIn4icSU5
	DQJqBi4njG1T1JKS+cgydS39HGQ6agdQIsbaBw
X-Received: by 2002:a05:6122:4f8a:b0:5bf:bb66:414f with SMTP id
 71dfb90a1353d-5c3d93a8410mr1586273e0c.11.1785980220218; Wed, 05 Aug 2026
 18:37:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260804-submit-acx00-of-dynamic-v1-v2-0-3eef49ff1d8c@gmail.com>
 <20260804-submit-acx00-of-dynamic-v1-v2-5-3eef49ff1d8c@gmail.com> <20260805141737.GA715959-robh@kernel.org>
In-Reply-To: <20260805141737.GA715959-robh@kernel.org>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 5 Aug 2026 19:36:49 -0600
X-Gm-Features: AUfX_mzQwafoGswTs6dpUFv2c34FSJlAsZ9bjOHCBKQRghZLcM4QQZUZyorkfog
Message-ID: <CADvTj4r7qwdb4+-k11HD7d_8kYhJX3=XE1ftaRKP+-xpSiST5A@mail.gmail.com>
Subject: Re: [PATCH net-next v2 5/8] dt-bindings: net: x-powers: add AC300
 EPHY control
To: Rob Herring <robh@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
	Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, Heiko Stuebner <heiko@sntech.de>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, mfd@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 5, 2026 at 8:17=E2=80=AFAM Rob Herring <robh@kernel.org> wrote:
>
> On Tue, Aug 04, 2026 at 08:27:03PM -0600, James Hilliard wrote:
> > The AC300 exposes its Fast Ethernet PHY control registers through a
> > separate non-PHY Clause 22 address. The manual defines that address as
> > the link PHY address plus 16, giving control addresses 16 through 23 an=
d
> > link addresses 0 through 7.
>
> That's not a separate device, but just a second address range. You
> should make 'reg' have 2 entries.

I tried a different approach in my v3 using ethernet-phy-package to
instead of ctrl drivers with the AC300 control address specified by the
ethernet-phy-package register(internal it's doing a + 16 to get align
with existing conventions).

>
> >
> > Describe the control endpoint, its required VCC1 supply, its 24, 25 or
> > 27 MHz input clock and its SoC SID calibration cell. The actual PHY
> > remains a separate ethernet-phy node and supplies the MAC-selected
> > interface mode at runtime.
> >
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > ---
> >  .../bindings/net/x-powers,ac300-ephy-ctl.yaml      | 70 ++++++++++++++=
++++++++
> >  1 file changed, 70 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/net/x-powers,ac300-ephy-=
ctl.yaml b/Documentation/devicetree/bindings/net/x-powers,ac300-ephy-ctl.ya=
ml
> > new file mode 100644
> > index 000000000000..8a616ff3e89f
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/net/x-powers,ac300-ephy-ctl.yam=
l
> > @@ -0,0 +1,70 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/net/x-powers,ac300-ephy-ctl.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: X-Powers AC300 Ethernet PHY control interface
> > +
> > +maintainers:
> > +  - James Hilliard <james.hilliard1@gmail.com>
> > +
> > +description:
> > +  The AC300 Fast Ethernet PHY has a separate control interface accesse=
d as a
> > +  non-PHY Clause 22 device. Its address is 16 plus the address of the =
link PHY.
> > +
> > +properties:
> > +  compatible:
> > +    const: x-powers,ac300-ephy-ctl
> > +
> > +  reg:
> > +    minimum: 16
> > +    maximum: 23
> > +
> > +  clocks:
> > +    maxItems: 1
> > +    description:
> > +      AC300 input clock. Its configured rate must be 24, 25, or 27 MHz=
 and
> > +      determines the corresponding EPHY_CLK_SEL value.
> > +
> > +  vcc1-supply:
> > +    description:
> > +      3.3 V supply for the AC300 I/O, bandgap, Ethernet PHY analog fro=
nt end,
> > +      and internal digital LDO
>
> Sounds like this supply and clock would need to be enabled before
> accessing the "link PHY address"? If so, then 2 nodes is really a
> problem.

I think having the link node depend on the ctrl node was preventing
issues there AFAIU. My v3 works differently though.

>
> Rob
