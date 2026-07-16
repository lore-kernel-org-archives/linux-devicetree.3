Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A90B346A1D
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 09:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784194992; cv=none; b=WvIqz1wAuYO/vKbIt+EZ0/+CqWnCmw64i2KEdaRD0c3EAYrD078FwngveI2U0XHa4YtwPg1EfI06ofkS5sgus3w2Bn+09b3LZkTzYRVZVbyPdCXATL8QhCAtm+E8fu86jCobNaBJ6oKuoLdqgK6V+voeFyN0YkhW5QRDA9APbtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784194992; c=relaxed/simple;
	bh=IybqyH9dOsnszillhjCwklUFt2WEgkET2KYgpRJdRiM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aB47oVl3NhoP/RBKxzLaN/t8LoVLbzykaMl8tlkkRd3rP0rC7P9mAYnKqJFGSkoaptbJD4pMIBV7SA7VoK7KxMMEKrB9pPeEV+yUQ4faT4sLGpqI5eLwwaMNZkFOkBPYmo9sjUuDLS1m0A/20osbgAbZ1sFXOnJgiPsl4rc4e4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lAec+4B+; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lAec+4B+"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2cab973140bso77494605ad.3
        for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 02:43:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784194990; x=1784799790; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=H3kc+neWyehlIpkf7WYpZ3XjGhqaMPOicmWK3YOMAk0=;
        b=lAec+4B+G4DntWlCMQefNUmQBcsZo4FRTI5tuIPn/AcTzrukWBmc02V4qoA9ZasqjT
         OZxFRmfToeWUExKaAX4+I719WSSKOC0fYKK2/Sl74svXh3DfcmUW6YjwMW7u8h5EJKMr
         8Wrd85EisjMZXKzvY7tSFvyRUL2+VSX+JlX4tuOIQstUzLOePyeSJk1UyXdZXS6T39RP
         Sv5GOa/YNtIzKK5i9lDp8QKHqsPb1xyPqgImcM2va/WgYaAYUCW6urUgpFn9+5+o74sO
         orkgx6VpGn4Nc0Cc1PS2+FZVBVKD06WRjQWbR9WBtuAQjW+yapiDOr9566aX5JqZTKQ6
         VL7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784194990; x=1784799790;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=H3kc+neWyehlIpkf7WYpZ3XjGhqaMPOicmWK3YOMAk0=;
        b=VMoRS5ttYIeLV4oNBxNOU/26z26LDSzkQWe62eGFKKrWc8G9I73+A7Ocn1Dqe7YZDy
         ok+YWwKUrv6zH7CXjLfz3sCFn9iQY5DpC7tjnX7zriJBRoVMRF8cHXCgFBKDedD1DgoC
         KUR0mZVkcxMybu7vklukbWjlaqhF68JBhzcITNd2DzBDz+0X6hrvLh8g0W5pRjC8Q0TC
         ALMtmoJuXVblBpzFEDkZL0Ez3WQN61QGmUPbOkOBrIxLB3OFSyIE5VeOnQTkCIGkUN5N
         d6C6i1FE+/WrjqjroWpkblIwaz3dGGDVLbbeb9vbxmumIQj1TXFZQ+QSHCz9nCPC/GEI
         7QPA==
X-Forwarded-Encrypted: i=1; AHgh+Rr7lJbC4ssz57fl7zDwXHkV9q8a3WFfyF5o7aurF1sd6s3HZ0ZXfTMPOmUAL1ImJqpnA+fdcN27tdGx@vger.kernel.org
X-Gm-Message-State: AOJu0Yww8he6Y1x46iiN8gUXZ2KECsBY9agPZS7hmhWo4CdMTGtf+2eF
	rqQo9bwOP+jcYvoaeJWl8MY9S4MQxFwNizcjtz/6/raXzdCcUIljyTX+
X-Gm-Gg: AfdE7ckmgEYQrnN8Av5u6kfMbEDVhohCG5U2J4Uz/2oQuo8D6ZtvknOBL4Kzi61cT3h
	Y9qWcyybonfoA0zRWqsj8j0BTtLRdDm0OSwFfXdXEtiDzBsgQmjleZrL81wuA6Jpq47PMjbHxmu
	xj3fenfTQGxz57l8p35fKTL1Q/8WSDaX4Ui6zoc2xJkNxo0LqqPhdsRTnSvJ3rlbK/sPAeK4wEy
	oGdRKI0XAxSlt+vFTVjmLgRNrTi94Olb3GVIbTsN1cYokmZSSyItpMYZTinqHgPAlDpqitA1NkA
	nSnDHGKS2dJKfWTz+HXM3mXrWSOaRmJbr5LyCNsUvTt+VXguH473UiHmCSrytkjBsA/vGuYb3MW
	ggEnxL3W/K9y3+5dW00Ay5ji5tSP0aIfMvOiFwfiI2atlkr/eLGfBsc6UH4J0EPrGYDQ4rZmwC4
	CcrR6jjhj4IKvyLj1PxX58otAZLuO93qc=
X-Received: by 2002:a17:903:1b48:b0:2cc:777f:d67d with SMTP id d9443c01a7336-2cf03cef842mr61110295ad.30.1784194989404;
        Thu, 16 Jul 2026 02:43:09 -0700 (PDT)
Received: from i386.168.1.127 ([2402:a00:163:2ce9:6882:91b7:8e79:7958])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf1055b1fcsm17449255ad.54.2026.07.16.02.43.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 02:43:08 -0700 (PDT)
Date: Thu, 16 Jul 2026 15:13:03 +0530
From: Hrushiraj Gandhi <hrushirajg23@gmail.com>
To: Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>
Cc: srini@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: nvmem: rockchip-efuse: add
 rockchip,efuse-write-enable property
Message-ID: <6gn64vxmeksjtrp7q7y5jwniszeqrmdurbp4l466tli63aixnz@i6nlxwdjhewh>
References: <20260715110107.409204-1-hrushirajg23@gmail.com>
 <20260715110107.409204-2-hrushirajg23@gmail.com>
 <2363663.KTMopqUuYO@diego>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2363663.KTMopqUuYO@diego>

On Wed, Jul 15, 2026 at 01:42:56PM +0200, Heiko Stübner wrote:
> Am Mittwoch, 15. Juli 2026, 13:01:06 Mitteleuropäische Sommerzeit schrieb Hrushiraj Gandhi:
> > Add an optional boolean property to explicitly opt in to write (OTP
> > programming) support. eFuse bits are one-time-programmable and
> > permanently set once written; write support must therefore not be
> > enabled by default on arbitrary boards.
> > 
> > Boards that intend to use software-initiated eFuse programming (e.g.
> > factory key provisioning) must declare this property and must ensure
> > the required VQPS programming supply (1.8V to 1.98V per RK3399 TRM)
> > is present and correctly sequenced during writes.
> > 
> > Signed-off-by: Hrushiraj Gandhi <hrushirajg23@gmail.com>
> > ---
> >  .../devicetree/bindings/nvmem/rockchip-efuse.yaml     | 11 +++++++++++
> >  1 file changed, 11 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/nvmem/rockchip-efuse.yaml b/Documentation/devicetree/bindings/nvmem/rockchip-efuse.yaml
> > index b80fd8d1ae5b..8a7195245c84 100644
> > --- a/Documentation/devicetree/bindings/nvmem/rockchip-efuse.yaml
> > +++ b/Documentation/devicetree/bindings/nvmem/rockchip-efuse.yaml
> > @@ -46,6 +46,17 @@ properties:
> >        this property is defined.
> >      $ref: /schemas/types.yaml#/definitions/uint32
> >  
> > +  rockchip,efuse-write-enable:
> > +    type: boolean
> > +    description:
> > +      Enable write (programming) support for this eFuse block. eFuse bits
> > +      are one-time-programmable; setting a bit is permanent and cannot be
> > +      undone. This property must only be set on boards where irreversible
> > +      OTP programming from software is an intended use case (e.g. factory
> > +      provisioning), and where the required VQPS programming voltage
> > +      (1.8V to 1.98V per RK3399 TRM) is guaranteed to be present and
> > +      correctly sequenced by the board's power design during writes.
> 
> Devicetree is not a configuration space, and I think this really does count
> as configuration - as the efuse will be writeable on every board.
> 
> You mention the VQPS voltage. If I'm reading schematics and application
> notes correctly, this is a separate input used solely for writing efuses
> and _needs_ to be 0V (off?) during reads.
> 
> You mention "needs to be present and correctly sequenced", who is supposed
> to turn on/off that regulator?
> 
> So you very likely need to define that regulator and can even use its
> absence as an indicator to disable writes.
> 
> 
> Heiko
> 
> 
You're right, the boolean property was the wrong approach - agreed
that it's policy, not hardware description. I'll drop it.

I was planning to model VQPS as a proper optional supply in the
binding:

  vqps-supply:
    description:
      Supply for the eFuse programming voltage (VQPS), required only
      on boards where software-initiated OTP programming is intended.
      Per RK3399 TRM section 21.6.1, table 21-3, VQPS must be 0V
      during reads and 1.8V~1.98V during A_PGM mode writes. If this
      supply is absent, the driver leaves the nvmem device read-only.

and in the driver, gate reg_write on whether
devm_regulator_get_optional() actually finds it:

  efuse->vqps = devm_regulator_get_optional(dev, "vqps");
  if (!IS_ERR(efuse->vqps))
      econfig.reg_write = soc_data->reg_write;

The driver would own sequencing entirely inside
rockchip_rk3399_efuse_write(): regulator_enable() immediately before
the A_PGM STROBE loop, regulator_disable() right after - mirroring
how efuse->clk is already handled around the same window. reg_read
never touches the regulator, so VQPS stays at 0V for the entire read
path.

Does this approach look reasonable to you, or do you see a problem
with it?

Hrushiraj
