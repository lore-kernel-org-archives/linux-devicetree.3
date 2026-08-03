Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 817901DEFE8
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 17:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785778687; cv=pass; b=KFtl+XWbX5KojLUF/FGVCf4/gQ0lKBKS6vwMcdqxxSg/UdyZjYLC2NzBDkDMCB0Tli85SI8W9SRLHrra66BhBtx3atN9vsiqIC64m+Fpz5fY0tLY91KE6ZiniZd5VrfckwG84TjaUAPk148tFDkDqF1YFK2/S6Uw/rKAUv4dRy8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785778687; c=relaxed/simple;
	bh=fED54AglBaOIWY4v1dlfH5+jBD/TkjG4+OlNhKcmKpo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HY0WRixetEc5sv6tE9Y000h96jbC3tUbjZmo8UPY2KgzkG7JomU7Yy3LLgtHvTKirOBawqJ19ihmgBZiDI2K1ZPZwvpdHU8DkVpyfBB3Iag5YgJxYxlds28XW02QFY75P0/y+IkQwx6+1i37Z4cezqZTC61u+COg+ZRusFXBTLg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=MyjGPyhz; arc=pass smtp.client-ip=209.85.160.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="MyjGPyhz"
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-446f87b6de1so2172028fac.3
        for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 10:38:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785778684; cv=none;
        d=google.com; s=arc-20260327;
        b=IEJqvJ/NWBpO0AKkgBJF/1GC0Gwz49wYXdPwobuRN97xCppZmohmDoDUocF+O+uhIX
         6sAjab3+nsei0Ma5fSxb6ExrBlkuMR/FINYiQ2FWGWcCAw/cVZEyejCSpMj49RazS5ta
         Mla38Lq6sxIBsOWE7Fu94sRt77cye7fl6LHejvzP3z372zVphQ8/+cz/v3O49Jy7y9JH
         DHWxIU+bpTuuNXin6pmiQam5eOAqfMlW4xwDN5/I1DrHOEx0jZ174EC2xpayTmKg78xG
         7uV87pMqM/tnw+thwSU+hzxvQsZnKQwg9lQHgNoUCZjzipxOQhfBbOs2KUtvQ990i3EK
         jdBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=VthlhOGQJXIygUP5DATqpLoeK2ok5Ycn3uncSQhsgaw=;
        fh=jtoX8Z2oIJAk5inQ9dePRViZukXYUCtburlc4zx09SY=;
        b=eqXHlnPmmcNYs7ITORhyiDfSjD1Rz/w0XnDqHfFrqAhJ/DrvbPpD+9odmNBSUBDUqo
         LtCgJTXY3NnpB7pdvlvk4MgHDmhicXlbtVDiIk3o7n99pClfXe4HHspvQn701i1uLH0n
         ShhAd8SDWfVBXQ9MVSP86DJTkUi8lfghlRuQ0kcLdV1vPOcHhf4e29ju2GI3WxgFV5Y1
         xb5jLY5zmxUzHpFFxmmBsAHfUIagTba/8r/ZUFNYsz3IAeOnkXsPO0D25LPI/X5OpDhS
         AuFnWxzd7VfXY7plqeLuqfOk1qkyCv8OUrekxOOD4Z/Pd5mhGF8yu5nic5pno5dv4P5Q
         Xwsg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1785778684; x=1786383484; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VthlhOGQJXIygUP5DATqpLoeK2ok5Ycn3uncSQhsgaw=;
        b=MyjGPyhz9IEQeeCZnfIqry2IA2geqLHoXnqyaFmyxXmO2KrrOD0GP2dS4zW2uxE06g
         kn6wt9kXAZuBc0uBJjRD/gd/0nkzpBSbxTOKjqcK4updFn6OujssRnrIL4+s2kgLh02X
         v2N09kZWhaeumFJUeBnhqn+EsgTC4osIyzg/yh32+VeKtmox9V1HJ8dOIPTtX55Zq6AN
         oXFyurATip1gZWEket9FPGnN3XxeLuZa+BWL2dI51Byc4sV/SmADvL13EKRFgxuTfZKu
         i+qtHnPQCcubdSOI7kXksmWKMDCe+nINc3z/Jpw1uy3vutYIvyC0xjnJVBxy28Z40+d8
         CVLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785778684; x=1786383484;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VthlhOGQJXIygUP5DATqpLoeK2ok5Ycn3uncSQhsgaw=;
        b=VIl2NC5TlYLpwfzshhSQCJpqMkGbpVXljf+TYBks/Gn0RPV6H2oDzszQc9neSMgpTj
         hax5iTvw51tGLml60+dFYGdFPxxM644um7yN2O9uVXUzGMBYNZHGDvI8H6gmel4QE0SF
         iaMOU4Tb0TlKjJnbyqZUwmP1an8OnQqOnzJtPzadmg7Q2SA6Lkmv/UFEocJYTeh8x1KZ
         94ziEzZgB8/cCStfIj/s7O/ehjdpXcTPP6It6Yd83uXYGSLA4jpXIB939dk3CDuFmVEl
         0Pd82KSBNXmFOWEvzHhtOHw5iXsEMnv7uhRabOSrVYiTfAXCjLMdWYIX1Dg2Z2g0/iKN
         036w==
X-Forwarded-Encrypted: i=1; AHgh+Rol99o3NfQ38Vz69EOsk/yw6aRes/6rE9WZPqhUdlY5ZJPZJprZG+OsQlxMX9t3P9kqis1RQUW74ufb@vger.kernel.org
X-Gm-Message-State: AOJu0YwcdQwvhfgtGUCxfMq0zLxXTsaMrYWepu5hBrLhcF9HXCrl89v9
	olgvvGHXlthkDT2uEgcecPTGozsdq3Zs+gQ8DHW9uJTl6emYJfcW94PpOE9hs06DiSLDrw0pU8x
	vOZ/LQpiDqeoZO3Ewj/q7ZHNutPXARKQzOilrmhgpkg==
X-Gm-Gg: AR+sD10RRZrPDgM5KewS83doSnvTgcN+aRUUNAQfUobxBuTPuLe3OuRNhvos5NfpzW4
	UQXRofvyVmejjSDPwGii354RfrE3QN2iB4JFXDLQ28mzfvvgMhhrg1E+EhsuMQ9S8M8XDUX9HvC
	/PR2gCyyjVdJGjtPTEbAigufbaGWp0TnKB4MOOFjByW0gHkTSzEAM4yFjvAXI4//biqf2yEtrad
	NIZUdDxb9QQKwF1t7tHzap1YZeCSQEoC7pfyJOzra1bAMoGMDIPtMg/S8M1K0e0EUuzG4TJG4OZ
	JTNBiD40kUJC1firdtjxS/wu9g4rgJS8bAE2aJT4JhBC4G9qDEcurwMQbhHtDGx+oW5R/QyxE8I
	iVQrjt8WeJT+ulDRyPTA4i0pkgLzLkxi3ZJmANJxyhkGm1CNE6e3JaBGsbFbtLV3SfcyzlQ==
X-Received: by 2002:a05:6870:a40b:b0:43d:38f1:854e with SMTP id
 586e51a60fabf-45905a60abamr15360483fac.16.1785778683768; Mon, 03 Aug 2026
 10:38:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260730021525.166811-1-lachlan.michael@sony.com>
 <20260730021525.166811-3-lachlan.michael@sony.com> <20260803005333.GE1927055@killaraus.ideasonboard.com>
In-Reply-To: <20260803005333.GE1927055@killaraus.ideasonboard.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Mon, 3 Aug 2026 18:37:47 +0100
X-Gm-Features: AUfX_mwaiSbRzqab_uNN2X92ncFvn27Hn8KT8HTw6Ek2_UImIpmFCT3Z9AQg1yc
Message-ID: <CAPY8ntC1T4_orgvxBRqpqux4V90d5XZ-3KZZKoqnCPkbf6wE0Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] media: i2c: Add Sony IMX908 image sensor driver
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Lachlan Michael <lachlan.michael@sony.com>, mchehab@kernel.org, 
	sakari.ailus@linux.intel.com, hverkuil+cisco@kernel.org, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, kieran.bingham@ideasonboard.com, 
	jai.luthra@ideasonboard.com, Ryuichi.Tadano@sony.com, Kengo.Hayasaka@sony.com, 
	Tim.Bird@sony.com, Kazumi.A.Sato@sony.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Lachlan and Laurent.

It's brilliant that Sony are getting involved in upstreaming drivers!

<snip>
>
> In his IMX678 driver, Jai hardcodes the pixel rate to 594MHz, which is
> 8 * 74.25MHz (IMX908_XHS_HZ). The rationale is that HMAX is expressed in
> units of the 74.25 MHz internal clock, so we assumed that the pixel
> array is not read out using the link clock but using a clock derived
> from the internal clock. The multiplier was chosen to ensure that the
> minimum HMAX value corresponds to a positive HBLANK, as negative HBLANK
> would confuse userspace (and developers). Having a fixed pixel rate
> greatly simplifies the driver, as you don't have to update the pixel
> rate control, and HMAX calculation from HBLANK becomes a division by 8.
>
> We're not sure how the pixel array of the IMX678 is clocked exactly, so
> I don't know if the above corresponds to reality, neither for the IMX678
> nor the IMX908. If you could provide more information about the pixel
> array readout, that would be greatly appreciated. Note that the pixel
> rate value does not have to match the physical readout clock, as it is
> only used by userspace to calculate timings (to convert between h/v
> blank and fps).
>
> Jai can provide more information if needed.

In case you'd missed it, I'm trying to convert Jai's IMX678 driver
into a generic Starvis 2 driver[1].

IMX662 that I'm interested in is streaming with a total of 7 changes
to defines or const structs in the current imx678 driver.
IMX675 (5MPix Starvis2) frames with a similar number of changes but
currently isn't giving me images (test patterns work).
IMX585 looks like it may fit the same pattern, but I'm waiting on a
module for that one.

I'm therefore looking to parameterise those diffs but otherwise keep
it all common. This avoids the hassle of having to convert potentially
4 (or more) drivers to the Common Raw Sensor Model once it is
finalised.

IMX908 here looks to very much follow the same pattern, so unless
there are additional diffs between Starvis 2 and Starvis 3 it would
potentially fit into the same framework.

I'm hoping to get an RFC out this week as I'm then on holiday for a
week. It'll be interesting to see if IMX908 will fit with the same
pattern.

Lachlan: Are there any particular people we should contact for details
of IMX908, or just go through our normal contact?

Thanks
  Dave

[1] https://lore.kernel.org/linux-media/20260312150437.1091195-1-eagle.alexander923@gmail.com/T/#m6072f85b03811932427597d8ffe5da008d33246a
