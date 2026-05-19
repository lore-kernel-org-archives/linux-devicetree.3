Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66A674D90C3
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 12:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779192978; cv=pass; b=e2eNMotZ83wcVgz5ZIS2Fi00YmFTUVSUg2wSlwG5uKll2c9FDx9x8ndMYVz/v6gS1qiljUvhhYN/gHmWKLn3XDz6Wgo0L8mUHlDYvRyLmDj8LH9RTpjAkokbelncwRfMyrxVD9fOSTgAAQ8ptyBkeNHI8ebBUq3bOVTsvi6gXTU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779192978; c=relaxed/simple;
	bh=8ANQeeN44voDZWsZc8QEKDQwvU3DW2DBsCLrlpmLslI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Wj8taokOBBJulv0HvPi3nFP80tCgMGMy5FIJ1u6EQx6nHqWgpjeAwEfEbchOT8lhKG+/mb9Z/MoUeNJ9ua+5+lo0uV+iqnXBx5c1pzv9OerrOEO4rEphpG23nQ3AzPvDq0vE+lV7jSzo165wcNDUgLZBN+VQ9DAqKeeZdUqlpFM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AyGpatvv; arc=pass smtp.client-ip=209.85.161.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AyGpatvv"
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-694932346a1so950566eaf.3
        for <devicetree@vger.kernel.org>; Tue, 19 May 2026 05:16:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779192975; cv=none;
        d=google.com; s=arc-20240605;
        b=RvVTQvMCS+83+i6HDaU3BrA3XB0ENs0Sq/CKHWixzaPbZJZ1marh+lSlyWYncVewwR
         JcwEtjUQg/Vwk0644H35SJzD6Xr3WMYUpSe3KkQ+hfAHSB6D9gA3BNMKKQKijQj3qfom
         DmFnOCBlCry8eHmieRLWYKCMaadiJvKJxM0FWhRq6PTVWAueNa8N4VEIdbMwLACm3bXn
         fueRgLqaO+EShQ/l0+aKYSpfsrLWo8ajAo5/XJ6HP2gyhtex+qyqt5sGquqJggz0N5Gr
         35oo0dxOfmnawobqWMhqPu15Yph6GBFRhAEVncrTNjT+AeLhdy4mAhZ6xJPFT7PH30xM
         mbxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=77H7TnQmMiN3GvqWNTTNkz57RsqvNScZ9ZhdVrNecWs=;
        fh=pFSGAj/i6k7FZDPpz5lKqPIrQ6+CGb6ojbvKUL/qLnY=;
        b=MhmiJeZN/4i5aRbf9POrZCmh6GUddTn+5uU8oL9Gvii3d1gd6zJgs6YZ/SZrnQgQa8
         IKD6nSnWGgr++uPxZRYuOkDGXShpU67kjzVsSf7/WKxSX1j7MmcgiP2+mJXiQHXcu+Qg
         vjBl3d6zJFyM2qoGdqrrKQV0CkX4qmlasappSYsBKBHQsFqXn9B8T/C3X9ipdgLkw+Uj
         SoouIdVr0FbhreiKJV3B+GduWUkzGA6Zaq7It5Sc+yv4lhTtT3xUw7LcdZqS/SCHGN8O
         gqQKhFy2dF0a11dFIXYEVM1b+Ikz7gcSZZAnDhOHZoJ1Itzi0IqpjiVd5u5qpPdfDV+4
         P1hQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779192975; x=1779797775; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=77H7TnQmMiN3GvqWNTTNkz57RsqvNScZ9ZhdVrNecWs=;
        b=AyGpatvvYEdAh61U/jS28lVCev0CEV3jc9vVsCFr5irXxloKfnYB7jLJ65uqLjeZlj
         H8qO3zOMABOSM7oCYfX/SJEGYr83tXTQDshDIZuTg4tUgXyqG0cmKOtjC/77+I96aXo4
         m5JUDLlgboXDRJCh/gwhX38cPSK0+Q2yQgR0nYRdE8l98t/pNtTZMsVANp25TrVduWX/
         aOmiUBP4MV68ib3fwibe8ivGlJBhu1Pr/i/beg8Gv9+uHtO1eHR+Jaz+LEKCiAPzk9Qz
         9S/bjoGSNASnAKL2SvGPlYeE4n8TN8RaWdWgGJjZx8Spzgd3zIXCiOSHD3k+sHa0eNin
         VwxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779192975; x=1779797775;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=77H7TnQmMiN3GvqWNTTNkz57RsqvNScZ9ZhdVrNecWs=;
        b=sycsGk8HJSq7ePXF0iSq8RrMdwtpLPbS9Sf+1HvYHJZu+YsLtcpKopy/8k4ESQCMCb
         F6r1H35RSdUrI5cSZUB3uJyUjYrI2TIoF665MPjIvXnXDB7dsh82LNZA4sblKzOwVi5b
         aM7w6Z0krW8I35BB9UKERzYO5MMugIC4ASWReXtic/C41miRVKTgEyFb3K2wTtpopqmy
         DRcCMXdEdVMicKtxT2OJRurhNSGZZ1e0WK+2rOvyrLUOZvvMj1ZEon9oWbQNao+yeCtY
         bwnnXNiNndz9vmTLvvbD1tUmiYrpnPYJPVt77K4JEXTso/yQhvAnnWJBehISXRCW/10b
         5rIg==
X-Forwarded-Encrypted: i=1; AFNElJ9jiNzm8tv1PuDcnhrrbxNGHEVfTDBZYPxEqNSXR82XtdlJVlJo9VxqfLzIciDPWfz+M+f21J70nPm/@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9ZufgrC4WEChCTVPMTLW4EX4tJmI8BT/Nd+kT5noUFWij1IJA
	/UBni+Iz/ibneCPxWz4D8oMYndxcfX87t1XRZXEBtK0I2TaY4qbBm1CyDboKTmjQLdXqe3FyGTG
	sgQCxpgGP7KbZ0+SaN2nIa8XBeihTp9k=
X-Gm-Gg: Acq92OF28vhby2kB2p/bWZz5Yi+uxzDD/n6sS4WbrluFMes9tJL03nKujYLr9JImuQn
	UbuMJl6qUQVhWSiYEp2fZ2Cxm8kBzRDAlbkSDnjooOhQEwAzxo+DP5khPbkBCzTie2khmuziQHM
	HYODbvpQjVBlAbBxfmYiAKE2TuTmdJXOxAIazZVQXU0aFpN2hz7A2+1ZpM7av3r2fGgn/d2g/Aa
	wiSv7eerSHJqXwa3/cp0H0MOPAHR615Fbesy3odkE155eqbyiaLbIm7/QPdQSoe8R7AhCEBxjTd
	wdbzNkAL
X-Received: by 2002:a05:6820:6ae5:b0:694:96ff:d4b with SMTP id
 006d021491bc7-69c9437169fmr10976123eaf.26.1779192974696; Tue, 19 May 2026
 05:16:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260407081700.2658011-1-pkleequanta@gmail.com>
 <20260407081700.2658011-3-pkleequanta@gmail.com> <e5d1cbdb34dddf17b4d474446fb9cebddc0894d9.camel@codeconstruct.com.au>
In-Reply-To: <e5d1cbdb34dddf17b4d474446fb9cebddc0894d9.camel@codeconstruct.com.au>
From: "P.K. Lee" <pkleequanta@gmail.com>
Date: Tue, 19 May 2026 20:16:04 +0800
X-Gm-Features: AVHnY4L7K4x70Eyzw-ceGNz7gtwZlHIdfr8MBYBkZzbIBsM_VdfexOP6IXVvRJE
Message-ID: <CAK8yEOCQEYh4smL9bu2T3gHmtaSoPrGX6VMwO2pVk=QdAQT86w@mail.gmail.com>
Subject: Re: [PATCH v13 2/2] arm: dts: aspeed: ventura: add Meta Ventura BMC
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	joel@jms.id.au, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, Jason-Hsu@quantatw.com, p.k.lee@quantatw.com
Content-Type: text/plain; charset="UTF-8"

> > +     model = "Facebook ventura RMC";
>
> I suggest capitalising 'Ventura'.
>
> ...
>
> > +             i2c47 = &i2c2mux0ch7;
>
> Many of the buses aliased here don't have any devices described below
> them. Can you add some commentary about why it's necessary to enable
> and alias each of these?
>
> ...
>
> > +                     // Fan Board 1 FRU
>
> I'd rather we pick one commenting style (/* */). Can you please fix
> that throughout?
>
> ...
>
> > +
> > +                             //fan 0 IL
>
> Can you please add a space between the comment marker and the comment
> itself? This needs fixing throughout.
>
> ...
>
> > +&mdio0 {
> > +     status = "okay";
> > +     /* * Intentionally left empty.
>
> The comment is a bit busted here. Can you please fix it?
>
> Andrew
>

Thank you for your suggestions. I will address them in the next
revision of the DTS patch.

P.K.
