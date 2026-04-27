Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A83A3D75A6
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 19:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777317008; cv=pass; b=J6Il+B9/t9CSCF/cM3DaO40hAcCLnc6wTVOqDNNpTq+tj+p1ZdACtqwgsTgwO/lNdk8RbeAJk9VPnH7X+HZeqeOAKxpxmzl09fIuY48ioVN0guqCkFrKZRdw6o2es49WnxXeJSj7ZRiRvDTpGeH1m7TUqYkLqhRWqqvhtd3ZKn0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777317008; c=relaxed/simple;
	bh=3fMZwSB6yeTz6IO9hqO0yo8wNfXO4Sj4anHGhDxgOT4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fSHVlfAueeypOmgIqYEXw5DYSvP7q7bDO1b64hpvy3wixRZhj1zJZx1zVM6ZoYS7jI81L/DoLrdBB8w6U6zbjFzr1O+dz14TT/cA/hwXVlUeauIofxYnTy2r/rPsq7cy/vtdJMTEbq1NHXDvXYfuIiFzJPzXxZNErq6FeryqLi4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aCT3LFAG; arc=pass smtp.client-ip=74.125.82.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aCT3LFAG"
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-12c637089ccso1580339c88.1
        for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 12:10:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777317006; cv=none;
        d=google.com; s=arc-20240605;
        b=CztZlJe+Rhg5RXUpKcNo/ig078qDEzFQsW2/NC9jGsIiaQVi9rcQT6DtRkLmqlci4T
         3ccZgHtP1Km375uiSg7yBe3z5GYj5yIX2Q43rVlBt6PkqKEB01ccsiWHxoxtY844vhYC
         EXAsROKXPg6rJeWt682NjI8hm3TruqYb2LXwoRiBsL3vPevBNC3CAWAMFDqFQIYA83ym
         HZmzuwUf3YkuIOuqdXK2s2xAiMeZMb5mNqSd+BGGJ1f25P+ms6keI7DvyKpReKocZ0L0
         GylbQLzVibTj4RUfxPnGXn4Qbv36GyqZZQ4MR6jhIMEELgcl/01fQlzDaemcjsaeAXAM
         Afyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=3fMZwSB6yeTz6IO9hqO0yo8wNfXO4Sj4anHGhDxgOT4=;
        fh=s+4CUl95W7Fh+G7wqMaBpyWR2LGddW1ZQcqA8DmdVQM=;
        b=AfShg/t9vNolkRfUMfxkoDYwDXf0v1F82UjKe/HIDMthfVFCHVR6xmSUdXZjiaDhza
         H13EtjQ3vtny1hN+5k/Nkb15n2xzFt53UDd/Yb+eQUeWmHUYCHUzuaZej5k94CMzyEEn
         UkSvpS07U7su90gBdx1Yu1Wg/9+XDHblDPImip9hkQSaoKPOB7YHGZtD53IRLwn9/up7
         l52QM9Iy7Ze8SQUE0ehF9YfcBkAF+hkVSmr5jjG58tDlVR2iJl6UypMdX/z/CYZ0mRSH
         mGRC68QQ8ajsZvs6J6CYislxteYHZo+UWUnPl3q5WtyVhM7rulH/YFNqKs1xczM2K9ZP
         3sZQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777317006; x=1777921806; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3fMZwSB6yeTz6IO9hqO0yo8wNfXO4Sj4anHGhDxgOT4=;
        b=aCT3LFAGvTHRgzs0Z/copgVnDVeHC+NGE6WsCS/XQ9sGBvA4eSxFJmeGLYxsLF3lIt
         e0ozJzMNsr99ulzChi5qUwxDoxdI/VQZnAtDGQH0s7TBBNk+bZYL7Ac01l7EbE6L0stg
         kEaqhd92y5sgGqIZ4SOcqulzn4Ri0hlHS0TzQVvhxSQGKEI9equcfKa1cfw8koYl71zc
         N+cMrT6NnvCh2niYqnM6G+lHMn6bihNuuF18MOPd38Bt1QRUxukunWUZoNVPU1OmuK0Q
         mEIitC/FwiPyCi5HZDpotutS6dqCXqMAtETyrTZyOLrY9kupBAdKO3rwFeWxmtLste7b
         xLSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777317006; x=1777921806;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3fMZwSB6yeTz6IO9hqO0yo8wNfXO4Sj4anHGhDxgOT4=;
        b=ql19Q1HBH2G+/z0tK/nhf4/UryJ/yWEpqtatPKs7eINk1d6QCXBB5NpUGyydpu/xCR
         g+LvVGa5sCLyodA97z0TRYAjJmrha6P2XNvjeK3Ts5NrZpNU3gYN9hVmav6/5I2O40gp
         avEZBXQHpN6kJAMppnKOAumIOSwJxHYozLYohWBIwY17vRK4ovu5jADtSZTi+zO5YET2
         iALSSaE4RcMsceWYzvohK0c5w7QlJ/Qk3CvwR8Ufxnv0Y3coYJbLq05KjlkktoFoXBJP
         HL2XL5gDVLON8qeCwZFJ/u0ch1vsLpkSeiJGWuub6pkylP0dXp2t15XZBvHvEymwX2rc
         c+7g==
X-Gm-Message-State: AOJu0Yx1OWAlWUGsWMLQSOEdcmpBTQSasEunCvT/T7MHgcnK9utnUj+O
	Iqu5JplTjdyAqEvhP92IRYgRzChNlAd+xQklONh8czAkbnpQLF9uWfmzEl0yZyjhl6FPZZ52f2S
	00Y3doi5JES6lFOHhYis7dc16s99/BVQ=
X-Gm-Gg: AeBDievJ/5P0wUaXoIUwFfBYpypyrvB6+7Idn94GWfE0gxHE7lUYU66mcaIz7Geltp4
	HSoCgvEQr6coavTv3brPgr5OiQuGEYaWfDQB7xUT9P21i5iQdqb3nmi0aLJxLThCwCxQr898vp+
	hq4ew/ynAbIi/rYPaPth7lPlUqX5DYHO8M0JQGf/Acay2HDFcao+Qt0x/L2XoyeyiSA3tz+R+OE
	zRFLI0KPK4uDx0WOn3uodUagvdvBvdvV9WU404E+8EMYh3eKUdilqQEZrUlr4fIfYxdXwPxbf9H
	kWrp4gDRy8qljEGX
X-Received: by 2002:a05:7022:6892:b0:128:d4db:4464 with SMTP id
 a92af1059eb24-12ddd9db078mr59639c88.25.1777317006086; Mon, 27 Apr 2026
 12:10:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260427115443.3224840-1-eagle.alexander923@gmail.com> <20260427-smartly-sullen-509e3d5e1967@spud>
In-Reply-To: <20260427-smartly-sullen-509e3d5e1967@spud>
From: Alexander Shiyan <eagle.alexander923@gmail.com>
Date: Mon, 27 Apr 2026 22:09:53 +0300
X-Gm-Features: AVHnY4KGmGS5TTBcR6l162yPSyCbez8-gBuRN0yPlPZAIlbqIQAvx_FlaKL7f_Q
Message-ID: <CAP1tNvRHqoq==tehB5vKxH41BXG54Y9s+JMZt66o__SMTekHeg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: regulator: fcs,fan53555: Remove vsel-gpios property
To: Conor Dooley <conor@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>
Content-Type: text/plain; charset="UTF-8"

Hello Comor.

> On Mon, Apr 27, 2026 at 02:54:43PM +0300, Alexander Shiyan wrote:
> > The vsel-gpios property is currently documented in the binding but
> > is not used by the driver. The FAN53555 family of regulators supports
> > two voltage selector registers (VSEL0/VSEL1), and the selection between
> > them is intended to be controlled by an external hardware pin (VSEL).
> > However, the driver does not support dynamic toggling of this pin via
> > a GPIO, it only uses the fcs,suspend-voltage-selector property to
> > statically assign which register is used for runtime voltage and which
> > for suspend voltage.
> > Remove the vsel-gpios property from the binding to prevent incorrect DT
> > usage and to reflect the actual hardware description supported by the
> > driver.
>
> From the wording/justification here, I disagree with this patch. The
> binding should document what the hardware can do, not what the driver
> can.
>
> Maybe instead you should make fcs,suspend-voltage-selector mutually
> exclusive with vsel-gpios?

The main problem here is that this feature (vsel-gpios) was never
implemented in the driver. So, the patch consists solely of removing a
non-existent property.

Thanks!
