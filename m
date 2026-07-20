Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C90123B95EC
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 21:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784583228; cv=none; b=YS6vJ/XZx/cp/GcMEyBTrRx3RP/YY3R8lePD5ExKHQBqySP5/6bbmm1iNXb88jLbGaQ1rrB7RKFU8JPtW3JVDGojSXU0K/xLXLzjAH/jhTJnEHqesL3aMJuYOVA1lcczO/mnJuwcLjj44xIYMYDSpuvkTbDlhV281QseYJTm0UA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784583228; c=relaxed/simple;
	bh=44idU8XRPllgsta208T3pPheGd2tESHEjmpM2ssCfH8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JvYLidpscQqMYH+V7SMDdddPBR66Bxpps2S4MWnAocEEq1tmnxZGrmPrYZACPxQbXRcwS3ga6OcYQ5/TslQB/P/+PJTvuHwgI15+Y+AQ2aE58uaGhri8r/KC4GK1MzW2SfQBCrniDdIZV1dWFkXZpUwcnKQfzaA0iiejipXls2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NS1UvihY; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NS1UvihY"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-81e6f0b4610so111370177b3.2
        for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 14:33:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784583226; x=1785188026; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=usAr8RVI0THAJ8XIFOJ4ZxGvrwrm2FlwhEayG2wImz0=;
        b=NS1UvihYe05ZdEsYa2d5+tzFnVGekPYGLoctqkl8AnLBPX8s+e6REiBv0lcE1RLJKV
         2CsX2sldiKiaycJDqfKW5p0UwUbIm1/qHJRRB4F1zc8iGTZ5ELxxGw3ZM6k7OgmTQgVL
         J28OvY4FgqoHAXg/9Fd+dVW+GD+VwuSpXVn8K+WVoxR59qi+fF6NgL+ouLorVxuz2ym/
         LUxuba/OkHjVGwtvpYywF4AEeoEd3s+vsK75RRwtIeer88FVbqCuUPdcekXksdhhVPK3
         kZioLDiSF7sdargd8ZZXk7OsScNL9hCOHCiq0Z0R508vp/fhSLFi5Wd/7ugnoPHBdeqo
         e74A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784583226; x=1785188026;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=usAr8RVI0THAJ8XIFOJ4ZxGvrwrm2FlwhEayG2wImz0=;
        b=UISiNg8bM1uymDfZLZg1TCeaoT9V/CH2izjIzQrIlI5y2bbrO3k+pFizHJKdhNRijM
         svdts/sfQM1DqE09n7xeoy9A+a17I0KE72MGuuRAU+f6l8gqW6iG5HZ1dNs7J3Q3zABO
         zTyQ3RIpBghKpu/Ds5LGh6SLNcK2zo0DUcpy0PK7aeVr+QkxcJVlx4Q0JJHiuo9S+/K4
         RIyoQ4QJXlFNWKPR2hjLT/5xZd88hWqoETnbfJlmj+tX6nnVkWcoqfl2S/lXFD1226WF
         sykkIBEJ8uniRyhv6awMzP2z1YZNe5a7yZoCUjzupTFVudJCN2Uf4s3jfvSbFm089KWR
         aoGQ==
X-Forwarded-Encrypted: i=1; AHgh+RrGGUnG7U6IX1Ge0Tb4Nxit/fLIGB6ZYoO/8i/gybIRdrWxTvu3BHVfB301qvkaESELjk8kVJOWLC8S@vger.kernel.org
X-Gm-Message-State: AOJu0YwWH27ZMYxUYFiIQvQ/cr5aNrAvrAAMgyjfCg5pTw/ORBI8k8jl
	UbQkVCmUPsdTq2+GBCKSz1VksthCSrSej4KZMfqcHmITUSIu3eLaodF0
X-Gm-Gg: AR+sD13gL9i3oSCMcxSo9pKdrJFIl4X1IzAndwIBVMrXhVzUhPnn+uO+VHBiptbqKN7
	6Ty7Bm0fw7w5OUUXRclLHJoO9SRSzTStdm7BJ1U8gCu/Keq1G9DX8NCYYLAeANRWlq7ipZJmuYr
	ijZjooF5weLV47jJcYMOzWhbi7VhuKfjVcyx5fj1holZ86DtzJtzrsKy2KFXkc1XpCGmxpzzjVL
	xhU2fLlWjrVjw/4u+vKJeapOt9UH5rLpzFpZX9p/DKVAsyyhtT5I3NaZG7JtA9QIYlL6tX5ITrl
	dk3BPrDDLP36S+xdkvXptIELLAM/80ESm+LkLs04eI2w6XJAiNiQdloXcB8ZqMuXd8ipooM7xSv
	wfPZGXE0ZWgpNr5NlHUMXkVG7M6A8WEfVNSNIIM3PezpqRzDvL4w5GD8GHgdQ2z26hDQsDILUt2
	M5YqIvS4GyZVBmG+IyNqBsif21Q0V4/FLczHXLDtzGhESqxwk=
X-Received: by 2002:a05:690c:6607:b0:81e:d032:f3c8 with SMTP id 00721157ae682-81ef26a5baemr53618927b3.37.1784583225589;
        Mon, 20 Jul 2026 14:33:45 -0700 (PDT)
Received: from zenbox ([2600:1700:18fb:6011:50af:ea84:8387:c8b5])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81ef406700csm56746327b3.22.2026.07.20.14.33.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 14:33:45 -0700 (PDT)
Date: Mon, 20 Jul 2026 17:33:44 -0400
From: Justin Suess <utilityemal77@gmail.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Sean Young <sean@mess.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Ripard <mripard@kernel.org>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, Sashiko <sashiko-bot@kernel.org>
Subject: Re: [PATCH 0/4] media: rc: sunxi-cir: support the A523/H728/T527 IR
 receiver
Message-ID: <al6TyVD2EO3MxHY1@zenbox>
References: <20260702214750.3428694-1-utilityemal77@gmail.com>
 <20260720225310.039aca2e@ryzen.lan>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260720225310.039aca2e@ryzen.lan>

On Mon, Jul 20, 2026 at 10:53:10PM +0200, Andre Przywara wrote:
> On Thu,  2 Jul 2026 17:47:46 -0400
> Justin Suess <utilityemal77@gmail.com> wrote:
> 
> Hey Justin,
> 
> > This series adds support for the CIR receiver found in the Allwinner
> > A523/T527/H728 family (sun55i). The only board in this family that I
> 
> will you be able to send a v2 with the fixes we discussed in this
> thread? No driver changes, just the binding for the new specific
> compatible string, and the DT changes.
> I tested this on the X96QPro+, and also managed to enable IR operation
> on the Avaota board, where it uses the other IP instance (and another
> pin).
> 
> Please let us know if you can send a new version this week still, to
> possibly allow a v7.3 merge. Happy to review that quickly then.
> If not, please drop me a note, I can then take care of that.
>
Gotcha should be no problem! Sorry I was working on some other patches
for a bit and was out of town and didn't have access to the hardware.

I'll get the board out of my closet and do some testing before I send...

Justin
> Cheers,
> Andre
> 
