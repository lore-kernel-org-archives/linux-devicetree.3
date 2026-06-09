Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D048C47ECE4
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 17:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781026398; cv=pass; b=rllEaJepAE+FLOY2KVPNB8Gl8jP35BJn6Stbw66nF3LAt1UL3DfpCqRkw4fDqKPt8KBa4MfG7+gYdERdd+ogWghUZjyfpy00hFX+cpcjf1k+4xP2jwSHPV0kU2cBU3poSyCeZapAkfIR6OHvqKLFD54z6qph0y/H0Cpv7PUSwrA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781026398; c=relaxed/simple;
	bh=jxQWVxKxN1OM9wmfJgsxdUMXh7ls1hDMi7sURvf3ApQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Cxo5QGJzu936myLaxWF17W9T5eS1j8/HnXt6bWtchI4g7kEw8OCtSZZwJMId+zvq3la5m5EgjkEK1WAQVIbGkVg44eeIJ9oG24EOcNmTy577r+9YeyfVvcJj3Mmg6qk+/RVuzi85GUX0mhRLrJj8egNd8BGV40jtcNOtoRHYZFU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SVgOJmvc; arc=pass smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SVgOJmvc"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-68d234218bcso11306681a12.2
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 10:33:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781026394; cv=none;
        d=google.com; s=arc-20240605;
        b=K4wZmVwjWvRHCxZKUy0+W7Lk5rNCme+cfuuxzZYnkVh7Q4TFXnBRBoWYljI5k9YrgG
         qhRVd9kjRMD7KBPaKDJSPB95Od+xSiaczHrb3h2UhQxZTqeJdCIKRF6KZtbubuj43Lhy
         BMZa3lE1AqISPA4Ho72IOuyQyB60Ps4T86A5Uv1Dx5OLYtDMA+C4GlRbRLiwfkwGNS4B
         duMB0SvKSV92Dwe4RUxrO4yn2K+clTkAOmVN/8cfMeUrYFSnAxpW5Mdwucf4xVKpT0Sy
         mqYKidZGinEE8beQxHhWvNGj+r6/94l+F9Mtt5AmrfpGHAHsRpY0NKh9htOrsfRDUfYf
         v3Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=qk5OSgpm2QKOum3ErlbYh3UpTiSxTWavV2qBzb8WH/o=;
        fh=NZxpt0Jc9Ju3OxEmGlkw1TbCdtpR4hL5zCSDD/bLGys=;
        b=EihgF5g5q74g6MBWYP0aU1iU9kXnQGfFA6a2BTuN6CCiKupQq+FVAPd47gs/LXE9A4
         mGs8KIzjCruwURDDbycXvTy4zhhMy9RwGW4y26/U+Y7QSV5D3V0htjs/UDG1/VFp8ogj
         2TwUK3HC4U/Jr+O2Yga18r2HlnT+bonqT7DJOj2ESko9xxWYsWVworbJoq5nNPSsPIFt
         BoENzuE4mFfUZBZ1/R3FhLvmSWaw4XRLI0RvsW89DyxP3knvMBLDwgRFA4/5t+WalmTW
         UeTiLDMBIm8IcnWz9JmUjh8tYXtxFD9AMsMA2IpQ4KG8wdTsVZ0pe/P5whU0bmL2cJh3
         7+1g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781026394; x=1781631194; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qk5OSgpm2QKOum3ErlbYh3UpTiSxTWavV2qBzb8WH/o=;
        b=SVgOJmvcFoLOW/HEbCmF+l0Uga8kDmkZHWFybxBRHElCprDTKTzfkIFrH88qTQFPBh
         1744NY2PbX01qOvEdu0B7/G9YmR7La4npRtB1q5bstedtJjfNFIAzLAiOSRLTyvvo8Nc
         ikJdf+ADyTQLX94K6TaHMr4jZHwb5ZEKYK1JwhawdlVqUWjTgxH5u0THe3OqD6/2jKB5
         cWz/Jl906f09xtRxccxTOgY/g4eeHLLAE/PduWmSfTuBa2Q8lB0A60acAS28sIEgOXyT
         F2ri7QHwHog3AfeymIe7TD3N2qZZhEnTiqHa1WpN6zVPv75+gzcc49YD9Ppe+d2aFQYT
         xVbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781026394; x=1781631194;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qk5OSgpm2QKOum3ErlbYh3UpTiSxTWavV2qBzb8WH/o=;
        b=plac2XQjAvPln/2FsiZFVxbJqP3WbtxFXDlLwcMswvtCWWYvLHeI/NCWvWEl93NceT
         gb13p/2NN0hyJap1LlYI9Yuvcl7FDlHzojK3bNLbiUPjy1aznAlnuiwvrW6RmF832gvc
         P6jDOxlTncZfBr+26qrkajssEd36pMO0rt+Q3rheEG1NvVMuQDqoO/gdRWxalRPX4tVy
         hb1zzDLF19tWcZp/mRMDfpQgRtP+hc58UW2wpYgzf45YHKEj48RT1reFeqG4JaL5hzPY
         GuwkChWERMmIfpRRd653Drmob6vJtX3dw5XieV8duDyhOUB71N7lvDytnmZO7T0usuLB
         HmhQ==
X-Forwarded-Encrypted: i=1; AFNElJ/pWeDcoKLhrPjCy2ZQFk4wh/J69fzfkexheimws5Q7GXFDI0dtr4wCWCDpewOVHdq9UxnN6SkrxAgY@vger.kernel.org
X-Gm-Message-State: AOJu0YwHKtkEBn6AyEg/K5e4Ey8/m5vzd6+oqaIHow23h6iPtlIHQ3bE
	RTvOEhBjl212GtGrpACox5DipgE94P6IhR/+WxU/+Mf4Ad0n3kLCaSYr7UUUtgsxTxShBbe32Fs
	aosGtTwOgiiannx0gaM0YqkatBPvPF9IFqES+fyUiMg==
X-Gm-Gg: Acq92OFpvXJLQbrdZ/BVU6alUfqK70KYV8ZR/S3cHlB/DqK4kc2fo4fZIpPOALEzoI5
	nSPif3Wid2GWHic3TK30BXFNxYTsefBj1WrhQ8qXJCfd/ZIcjp8B/XXHqsWGrV/qZQroUrJHncc
	24Rc43VpvvXQ5cvrtnYH3PLgO1YrtXDuk0QsR5VVvKwshGGE+wyh8oCr/mUc0Eg+M8vLpJlRULI
	XalyT99uAg7fkuqzG8Q1T+FbW2VcYNoeEpsKvXLlI8p67BJ4y9HENsfPoe28GGvE0G4ioSk31V7
	2wiiuTRcYY/wKpLhTqvizwTP4Ti20rIRZDYzU0GQ7Z0fzwfUEqEK
X-Received: by 2002:a05:6402:2686:b0:68c:3994:45f2 with SMTP id
 4fb4d7f45d1cf-68fa503fde8mr10046906a12.19.1781026394348; Tue, 09 Jun 2026
 10:33:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260605113621.1479-1-laurentiumihalcea111@gmail.com>
 <20260605113621.1479-2-laurentiumihalcea111@gmail.com> <aihB5rVLsVqzg6cb@p14s>
 <aihIIwt_9T7yYxP3@SMW015318>
In-Reply-To: <aihIIwt_9T7yYxP3@SMW015318>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Tue, 9 Jun 2026 11:33:03 -0600
X-Gm-Features: AVVi8CfajwXrk0zh9dxoFsW97FohDkxe-xDUhgkWnVGwuNvfV4UW4Y-xjQ1W9M4
Message-ID: <CANLsYkxw6rbWNom8rNfKurKAXKpihqV1LTd51D5YXG4oFP6-wg@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: remoteproc: imx_rproc: document
 optional "memory-region-names"
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>, Bjorn Andersson <andersson@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Peng Fan <peng.fan@nxp.com>, 
	Fabio Estevam <festevam@gmail.com>, Daniel Baluta <daniel.baluta@oss.nxp.com>, 
	Francesco Dolcini <francesco@dolcini.it>, linux-remoteproc@vger.kernel.org, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 9 Jun 2026 at 11:06, Frank Li <Frank.li@oss.nxp.com> wrote:
>
> On Tue, Jun 09, 2026 at 10:40:06AM -0600, Mathieu Poirier wrote:
> > [You don't often get email from mathieu.poirier@linaro.org. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> >
> > On Fri, Jun 05, 2026 at 04:36:18AM -0700, Laurentiu Mihalcea wrote:
> > > From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> > >
> > > The names of the carveout regions are derived using the names of the
> > > reserved memory devicetree nodes, which are referenced using the
> > > "memory-region" property. This adds a restriction on the names of said
> > > devicetree nodes, often bearing specific names such as: "vdevbuffer",
> > > "vdev0vring0", "rsc-table", etc... This goes against the devicetree
> > > specification's recommendation, which states that the devicetree node
> > > names should be generic.
> >
> > I don't see what is so restrictive in using the node name of the reserved-memory
> > regions.  Function of_reserved_mem_region_to_resource() is already doing all the
> > parsing, packaging everything in a neat and easy to use "struct resource".  What
> > will you gain with this new "memory-region-names" that can't be done with the
> > current solution?
>
> DT Binding check can't find such wrong if node name is not what expected.
> Binding can't restrict memory's node name because there ware not specific
> compatible string for it.
>

But what "wrong" could that be, and what kind of restriction are you
hoping to enforce?  What specific problem are you hoping to solve?

I'll wait to see what the DT people think about this - I personally
don't see the value in it.

> Frank
>
> >
> > >
> > > Fix this by documenting an additional, optional property:
> > > "memory-region-names". This way, the carveout names can use the values
> > > passed via "memory-region-names", while keeping the devicetree node
> > > names of the reserved memory regions generic.
> > >
> > > There are no restrictions imposed on the values of the strings passed via
> > > the new property since the software allows any name to be used, with some
> > > names (e.g. "vdev%dbuffer", "vdev%dvring%d", "rsc-table") bearing a
> > > special meaning.
> > >
> > > Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> > > ---
> > >  .../devicetree/bindings/remoteproc/fsl,imx-rproc.yaml         | 4 ++++
> > >  1 file changed, 4 insertions(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
> > > index c18f71b64889..8e3e6676a95e 100644
> > > --- a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
> > > +++ b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
> > > @@ -62,6 +62,10 @@ properties:
> > >      minItems: 1
> > >      maxItems: 32
> > >
> > > +  memory-region-names:
> > > +    minItems: 1
> > > +    maxItems: 32
> > > +
> > >    power-domains:
> > >      minItems: 2
> > >      maxItems: 8
> > > --
> > > 2.43.0
> > >
> >
