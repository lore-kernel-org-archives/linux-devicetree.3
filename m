Received: from mail-qk1-f227.google.com (mail-qk1-f227.google.com [209.85.222.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 541D43630A0
	for <devicetree@vger.kernel.org>; Thu, 28 May 2026 21:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.227
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780004722; cv=none; b=RuKR0Xbv8NxsX8IUotTUudTn5+HdnhklST89ocxxFmpj6EDE74RmxqPXsUU1gcJtoQTABn3OoWigtfE9DNtmG3PVtgcwHbDudXWA6zBFmMY1YAnUPRsXnHs5+GL/iuNVAUJM6vIcCTREIACor4MHhYUdMdXSTgTSuCZM54gWiHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780004722; c=relaxed/simple;
	bh=Mtr9YlkZZQx6kxkUpIGHK1Oy+GluifVySrjlvfh1knE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BVJsj153DnejTUM13EfMQZoO7ktF5fH5qHR4Y1uJegBioMM1E4u+jU/SqOPWF+xP2j46gyeI0D+T9zxMA9HByR/n6VvnTkN7oHkyG7nre0FT5fNkcf0FWBb/NYnuiAzJKz5+w2XyYjI/NstCtfJLZcDQ54cN38yDONc2GKXtoX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=X7Qe9N0J; arc=none smtp.client-ip=209.85.222.227
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="X7Qe9N0J"
Received: by mail-qk1-f227.google.com with SMTP id af79cd13be357-912475287a5so1472464985a.2
        for <devicetree@vger.kernel.org>; Thu, 28 May 2026 14:45:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780004720; x=1780609520;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jFtFebur4e89Yp2GhL1rRJfGJOlb0c6RszvUZdfId9Y=;
        b=MRWLork5ni8uQGNHUYQoaJy5v1u/+cajQBGU+UJU5j3J/lLxYTEvwMu0AyK+ssRzBb
         kETbn6hzMjgrsBeyJgEdR5Gg6EkELA/db9zz7nNujCOXtjDC2axFM8XrxBwc0V8rHcM1
         +xdNNT221xVT5smD22kHvzvZKdt6Ru8G/Y7XHfp57G8Mq8g4TUzd8vkn9gaZnZKzu09F
         1iev4RfrokMV6wA27X2RrW/J+VAZHN33+xK1oaLKHb6c9ISHy7jjzCWAhG1GnymgaM/q
         9pV5FuIN6ku0o5c1Koi+9o0lyqfL8EN4guxawN1VnBsMbeYf8CTMZDLHvvgWtWFw3x4m
         Rt6Q==
X-Forwarded-Encrypted: i=1; AFNElJ9gUtjeINGFygHT5dELIexS4SaTKdU9wwM41bqbPJT09zPLPjTQV/Hsxyy33dyOMsm7QEQ24mzviGj4@vger.kernel.org
X-Gm-Message-State: AOJu0YyQcp/jxfN+tNifxqy/X8rNwE8nRbgrMbCMCAk/pNMVGVDTL0Dp
	lxLxIOSWCz/dNCQnwjGdjWDurs7tTjH1nC+qgQ3zbckKPXqoh7egxm7VmQ49aNt8yjlS8qJKfNl
	22Mpyt4vmmmOePkaSF+GjPYcqX4xTd3ijiYz9BCLsP02wV17ej4JfLT1Oxp7vmBc1iUo+UdO7uQ
	K822YcVesJHzMOUq3WDZVuzngMTlqbXGVEkU4irZaGY+pRHrCwp6EBzKgA1QudKRS8gjy44BhJf
	lZGTdMdOqJpYfQGAdg=
X-Gm-Gg: Acq92OGvfLObELELqWgtEdVZ1hlBF7ZRYURuwUIxqwvlWBwqLUQl+R1U0jdZbn+f3FD
	D43C5Qc47l3JzMW+5QwkE4UI4IFxDIOsCyqHotPH+LZAdpyNfemNoUUcwLOcp0Tasm1sGLjA3DH
	GGr4yJkBkQhpClDVfyGS+WewfNp03hq5nOYeO0E0ypThPMtS6ynnFHEeRd3IJmIKme1bn8E+9TU
	3yRBjvETNEHH0aOSiNIOWr5V9ffFsAUI55AIGOH4l9/jaZA9h4axYSTxPv6tpMkZY4dVBJeu0ze
	ZczVycqZ40pKjwc4iTzVaJVeA9GUHu+QTLHKm6i2qBpbixuK1VGrLj6UlTO0KB2QHDv03uo47Gd
	EQ3neiiOGN18VZNs9kuoa4c2/xFJLPEsHKDSKfaVrsVr1nfApqZAZU79WiNOSqyo1BhdrEogR7Z
	hDMc2uJIJUZnBiQBPeKi9pv6hQbXSYOU0c1a3U622YRh7Rfn7WdjfYU62nc230Pv9p/XM=
X-Received: by 2002:a05:622a:228e:b0:516:e0eb:d7d with SMTP id d75a77b69052e-5172dca040cmr3891711cf.27.1780004720113;
        Thu, 28 May 2026 14:45:20 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-22.dlp.protect.broadcom.com. [144.49.247.22])
        by smtp-relay.gmail.com with ESMTPS id d75a77b69052e-5172ebc47bcsm2331cf.29.2026.05.28.14.45.19
        for <devicetree@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 28 May 2026 14:45:20 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-bd86cf9d900so943229966b.2
        for <devicetree@vger.kernel.org>; Thu, 28 May 2026 14:45:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1780004718; x=1780609518; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jFtFebur4e89Yp2GhL1rRJfGJOlb0c6RszvUZdfId9Y=;
        b=X7Qe9N0Jxv8f7AUpHBwzIqmHM3ZLpoDAfNIRzYhDTEzARmt47MO20uasg9AGY2Np/m
         qtkP8e4d1NAP/Y77yOzBaYn/E2bVEHVHUAYmNKd062FJJ1QYIHO1GeXklwy6D/n4yuco
         HtEFIrhV5msRXDRaY51DLfq98C8sre2iyZD+8=
X-Forwarded-Encrypted: i=1; AFNElJ8ONHX6SpJZ71EgLtQYKF2+KkLQ59LptMejf0ZdgJpdw1Z1GFlle8nw9dRxqPriwamMynSZfv8vlwyY@vger.kernel.org
X-Received: by 2002:a17:907:9307:b0:bce:804f:f199 with SMTP id a640c23a62f3a-be973e21a03mr53468366b.40.1780004717688;
        Thu, 28 May 2026 14:45:17 -0700 (PDT)
X-Received: by 2002:a17:907:9307:b0:bce:804f:f199 with SMTP id
 a640c23a62f3a-be973e21a03mr53466366b.40.1780004717186; Thu, 28 May 2026
 14:45:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231205184741.3092376-1-mmayer@broadcom.com> <20231205184741.3092376-4-mmayer@broadcom.com>
 <e63906cf-9f76-4fed-91b0-1a9168b179bd@linaro.org> <12f3c515-71cf-46a5-ad92-15bf6c4c2f2c@broadcom.com>
 <c483e962-a565-45b0-91e2-41f47e2cf4bb@linaro.org> <CAGt4E5smwohGsPkvFOY8o270mNQnTkSWz8UKh3un2=XtEibzAg@mail.gmail.com>
In-Reply-To: <CAGt4E5smwohGsPkvFOY8o270mNQnTkSWz8UKh3un2=XtEibzAg@mail.gmail.com>
From: Markus Mayer <mmayer@broadcom.com>
Date: Thu, 28 May 2026 14:45:04 -0700
X-Gm-Features: AVHnY4LsuN8khH5Ub8nJHTjQ2-duCpid8nsrQhdGRehtA94tVmwnGX7LA3VIKfY
Message-ID: <CAGt4E5tGHJFXswic6vTx-ThN2K9xBtO8oA4ybrXg+q5cA6GYCA@mail.gmail.com>
Subject: Re: [PATCH 3/4] memory: brcmstb_dpfe: support DPFE API v4
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>, Rob Herring <robh+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, 
	Linux ARM Kernel List <linux-arm-kernel@lists.infradead.org>, 
	Device Tree Mailing List <devicetree@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On Wed, 6 Dec 2023 at 10:48, Markus Mayer <mmayer@broadcom.com> wrote:
>
> On Wed, 6 Dec 2023 at 09:32, Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
> >
> > On 06/12/2023 17:18, Florian Fainelli wrote:
> > >
> > >
> > > On 12/6/2023 3:10 AM, Krzysztof Kozlowski wrote:
> > >> On 05/12/2023 19:47, Markus Mayer wrote:
> > >>> Add support for version 4 of the DPFE API. This new version is largely
> > >>> identical to version 3. The main difference is that all commands now
> > >>> take the MHS version number as the first argument. Any other arguments
> > >>> have been pushed down by one (i.e. what used to be arg0 in v3 is arg1 in
> > >>> v4).
> > >>>
> > >>> Signed-off-by: Markus Mayer <mmayer@broadcom.com>
> > >>
> > >> ...
> > >>
> > >>> +
> > >>>   static const char *get_error_text(unsigned int i)
> > >>>   {
> > >>>     static const char * const error_text[] = {
> > >>> @@ -929,8 +954,12 @@ static const struct of_device_id brcmstb_dpfe_of_match[] = {
> > >>>     { .compatible = "brcm,dpfe-cpu-v1", .data = &dpfe_api_old_v2 },
> > >>>     { .compatible = "brcm,dpfe-cpu-v2", .data = &dpfe_api_new_v2 },
> > >>>     { .compatible = "brcm,dpfe-cpu-v3", .data = &dpfe_api_v3 },
> > >>> +   { .compatible = "brcm,dpfe-cpu-v4", .data = &dpfe_api_v4 },
> > >>>
> > >>
> > >> No, use SoC specific compatible.
> > >
> > > This is not that simple because for a given SoC, the API implemented by
> > > the firmware can change, in fact it has changed over the lifetime of a
> > > given SoC as firmware updates get rolled out. Arguably the dialect
> > > spoken by the firmware should not have changed and we told the firmware
> > > team about that but it basically went nowhere and here we are.
> > >
> > > The Device Tree gets populated by the boot loader which figures out
> > > which API is spoken and places one of those compatible strings
> > > accordingly for the kernel to avoid having to do any sort of run-time
> > > detection which is slow and completely unnecessary when we can simply
> > > tell it ahead of time what to use.
> >
> > Thanks for providing justification, quite reasonable. A pity that none
> > of the commit msgs answered this way.
>
> The real pity is how this API was designed, making all of this
> necessary in the first place.
>
> We can definitely spell out more clearly in the commit messages what
> is going on and why all of this is needed. I'll pull all the pieces
> together from the various responses. As long as there's a way we can
> reasonably implement what we need, we'll be happy.

It has been a minute, but we'd like to resume this effort[1] to
upstream these changes or some variation thereof.

What are the best steps to resume this undertaking? There are still a
few topics where I am not entirely clear on how to better explain
things or how to address the feedback provided. My apologies for that.
I will do my best to address whatever concerns there are.

Should I put together a new pull request that contains improved commit
messages and addresses some of the feedback and we hash out whatever
questions remain on the new thread? Or would it be better for me to
reply to the old thread with some of the questions that remain before
sending a revised series?

Thanks,
-Markus

[1] https://lore.kernel.org/all/20231205184741.3092376-1-mmayer@broadcom.com/
