Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BA22405C22
	for <devicetree@vger.kernel.org>; Sun, 17 May 2026 04:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778992754; cv=none; b=I6C+THwNfE1u6VCWbZyYnot/MYOk0WIYJx+xNcU8frTYAZjbw4iIfTrfPy8rQiAxYo8LbqqsNfAVSXw4eJc18GEDkjbXvD2atcqbSxREJsAZI+uSFHCiCAkl/n+4I2thWQqnOcVt0TCjZZrMmD4l6l/Us2wEPVvf0l8B4YbW5mM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778992754; c=relaxed/simple;
	bh=B53Eth2f9zx7Ds38V+i6Tl5WwFoLUCpbyhLtK9uDXwA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r+7nkFRr0QOW2y3ZUhqds0ZUeSlxJe+Anoo8a8qOzQ3jG6zaSZflcfYKTJdYAEbqj+tybQ73v3oBU+LZaiF9fMNd+S6U/LvBih5vIlJu6IInbd75aVBxMhLAnpsvpg680J4AGMg42icThfn2ykGL08VU7ZWTfSM8s52NaS+mLLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F2TNqyPL; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F2TNqyPL"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-c801b30188dso434545a12.3
        for <devicetree@vger.kernel.org>; Sat, 16 May 2026 21:39:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778992753; x=1779597553; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9YiFxSU/JN6ra5dSPQegj5u+vVdgZzmNJtIRWj7eJHA=;
        b=F2TNqyPLYmFkC7mXZLNodbFbfPWJRrX5JLf5cvNQacuDtRx3DOUuHzARLzQF+GWBsP
         ILGeJxR/Zw0KU/LhZ1x5C3S+45hf1tQna5aJbVDKQU7oOmoSZU4INhpQJ7vjEqMWbt6j
         1R2cqUljhIHDxyP7wxAsyXOzJcxGFgdj5YvJhX6WgmLFV7eeugzlvaH4W6tpnEWrIY7f
         +TZSg9augzzhEQjrR0uNENEjx14bY+5mFMaHWTN7vgZO06xZIShtECs4U2CK/3Or7IFB
         13JBcTivaffuPUXpu5MpEctY7NbTisaEFQ7LOIywrBMo7/qSHsOLdIKEs7sU+SO3CvfP
         Ix3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778992753; x=1779597553;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9YiFxSU/JN6ra5dSPQegj5u+vVdgZzmNJtIRWj7eJHA=;
        b=K3OY5wjmjJ9uLOREd2FDkLLuaPqMGXBcMeP5Wzj+k68Uqe0glLzYU47d3Zc1cmnwwK
         8PkCUYr9HuiPKL8xpe+H+etzVd/0Vkazh7KCESocPRkOKyh8uX2i8BX+4YxlkHbTC0lo
         wRsGEfIfZaTfUfHW6sCotZehZcF0E5xjMrbHcxfd1sBxUZl3HtcErI/p4+Yh4SMkwn0V
         pb3DqtD7v7RcFBuxi9Ps5gLRyrqtzwxteaLZtMGt7iG9SF7t8ag9TszZReaITXaLFbXV
         6CzIjCXDs+hLbI4cGvZLiZQzzra6nSrfwahZrkdLayZMexLcn0a1EdLBa16FNd+yT0d+
         cCyA==
X-Forwarded-Encrypted: i=1; AFNElJ+9zWIgOPNgjv17s3kUKX/6ApABBiTHzxjxx0q8W2En4TkkPI9ZIIVpFHzxNZ0iETpdqkiUnaL7QuIi@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0gJBRdiVSFNfF3rwuabc2mtOJ7wRU5VCICL+eWf4JMG6s0Gpu
	x4DScrmyI/8RYie62l87LGcpYFdRX9duaCG8TYAtY3X0eoostRC77bYV
X-Gm-Gg: Acq92OFb9P+GGAVjBvxqr5Mfvg8+IdalUt2eWLalZHm12tZIlorRwjKSREaUEoIu8EN
	3Ham/B7i9lPwTBvFiV75sfyenXYRlc/+YxiNo/4ZgYeeZqqMnlnyC5hlpZ+VBY45jAf3Lw1ZGVV
	IC+3hA+345KpKa/381qQvEIUAAP7VJDvQDang34FdzY0oSco29KgQTZHRGdHUq15eTmVS3KH9uP
	KSqzRokF5BKskMTK3hMb64Geb9bvk25547kVy1WN9IutsCc6Pkob90Q2fYZ3mAGHiAT+IZKGKTV
	YatgviIMEX4uARLuBbEQ2RLkSxdURUoL1xre5qmZyll+TXbDayS9MlblDMoBU1a1DQrhkLT++Qx
	uLjogENrNRixGI2q6Ms45+Ctq4Qhw5oxXYq2P4N2I1Q92W6Qg+e6XwsdYS+Y3KlvNzDddzq0tBl
	/EFPLy7tz7uhBjfQ4uORyHymqID75VtDIiXQ==
X-Received: by 2002:a17:903:907:b0:2b0:5ae9:ee4 with SMTP id d9443c01a7336-2bd7e8ae548mr112810025ad.5.1778992752826;
        Sat, 16 May 2026 21:39:12 -0700 (PDT)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5c05f287sm143282535ad.24.2026.05.16.21.39.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 21:39:12 -0700 (PDT)
Date: Sun, 17 May 2026 12:38:39 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: sashiko-reviews@lists.linux.dev, Inochi Amaoto <inochiama@gmail.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, 
	linux-pci@vger.kernel.org
Subject: Re: [PATCH v2 4/5] dt-bindings: PCI: spacemit: Introduce Spacemit K3
 PCIe host controller
Message-ID: <aglF_fbl--RgS7gQ@inochi.infowork>
References: <20260517014841.254085-5-inochiama@gmail.com>
 <20260517024848.4F346C19425@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260517024848.4F346C19425@smtp.kernel.org>

On Sun, May 17, 2026 at 02:48:47AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> - [Medium] The binding completely omits the `interrupts` and `interrupt-names` properties for the host controller.
> - [Medium] The schema omits standard legacy INTx interrupt routing properties (`#interrupt-cells`, `interrupt-map`, `interrupt-map-mask`).
> - [Low] The `phy-names` property lacks an `items` definition to restrict valid string values.
> --
> 
> commit 7b8ba34456e71d6a9cf1028caa5504d64e8f58ba
> Author: Inochi Amaoto <inochiama@gmail.com>
> 
> dt-bindings: PCI: spacemit: Introduce Spacemit K3 PCIe host controller
> 
> This commit adds device tree binding support for the PCIe controller on the
> SpacemiT K3 SoC. The controller is based on the Synopsys DesignWare PCIe IP
> with some extra link and reset state control.
> 
> > diff --git a/Documentation/devicetree/bindings/pci/spacemit,k3-pcie-host.yaml b/Documentation/devicetree/bindings/pci/spacemit,k3-pcie-host.yaml
> > new file mode 100644
> > index 0000000000000..46147a37a9ce6
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/pci/spacemit,k3-pcie-host.yaml
> [ ... ]
> > +  reset-names:
> > +    items:
> > +      - const: dbi
> > +      - const: mstr
> > +      - const: slv
> > +
> > +  msi-parent: true
> > +
> 
> The driver implementation reads and clears interrupt status registers for
> host-level events, and references registers for receiving INTx events from
> downstream devices.
> 
> Should this binding include interrupts and interrupt-names properties to
> document the host's interrupt routing?
> 
> Additionally, should standard legacy INTx interrupt routing properties like
> #interrupt-cells, interrupt-map, and interrupt-map-mask be included in the
> schema and example to support downstream devices that do not use MSI?
> 

The driver just does the interrupt cleanup as it requires, and no
additional interrupt is needed

> > +  phys:
> > +    description:
> > +      PHY phandle from the Combo PHY, the lane number does not depends
> > +      on this, since the number of lanes provided by Combo PHY can be
> > +      1 or 2.
> > +    minItems: 1
> > +    maxItems: 6
> > +
> > +  phy-names:
> > +    minItems: 1
> > +    maxItems: 6
> 
> This isn't a bug, but the phy-names property lacks an items definition to
> restrict valid string values. The schema allows any arbitrary string here.
> 
> Since the driver retrieves PHYs by index rather than name, is this property
> necessary, or should the expected string items be defined?
> 

The driver just use index, and the name follow generic DesignWare
binding.

> [ ... ]
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260517014841.254085-1-inochiama@gmail.com?part=4

Regards,
Inochi
