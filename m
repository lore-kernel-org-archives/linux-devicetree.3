Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 384F84ED1B2
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 14:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789741313; cv=none; b=TEYlF7iAk7NWhSU8G/IDZfapBIAN9pX9206sTco4WQOrwMVZL1bEOMkrhvm6JH0/1QT625lO1sBJCD+ON6yZOuEFrkF4XSPsIIXDMvqprwkZW8lBCfzCBKG3lY+nKpzLHPaH85rGh4dH1OzwTsHemj86j/0kmJ2rieuJP7FULJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789741313; c=relaxed/simple;
	bh=9XYa6FqU3mw/mrQiRKV/D+EoT2qjMYHpM/1GBGcHENs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=uE9dwvLmQI+1F9IvSSErUkKBtxFGuqZj+x2J8aZ/ZHkSF9ttuyVN/7ZLiMPKs9AdQC9SVxdwdT1P9I6aVtlFw05L+iMrUC3lp7CaMuHqexc8qFCrWa9lttosFi7lzj1n+aM/VsEAfJrmLjXj3TTo+6r60N4MT7fxonwAa8z7yMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffroot.co.za; spf=none smtp.mailfrom=ffroot.co.za; dkim=pass (2048-bit key) header.d=ffroot-co-za.20251104.gappssmtp.com header.i=@ffroot-co-za.20251104.gappssmtp.com header.b=R5coWt11; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffroot.co.za
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffroot.co.za
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ffroot-co-za.20251104.gappssmtp.com header.i=@ffroot-co-za.20251104.gappssmtp.com header.b="R5coWt11"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-4858bc96fabso649210f8f.3
        for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 07:21:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffroot-co-za.20251104.gappssmtp.com; s=20251104; t=1789741308; x=1790346108; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:user-agent:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=HRW5+1Frva7zZ8isaTm2TY41CHJL0yWnE9pSGq+/CS8=;
        b=R5coWt11hGbdTVSEE2hsJmVgmDSM1Tj81gHQEq9FcVUA7YY6E2OPVGrQv0aFa+P48w
         CUD5sNFsKYuMKE/Ra64Lz9y2O0or7JIbjhDXzKgonJY8e+kEq0n81nKOASTjEqDsQKYz
         kjHd1nMnFm3+uCsyw0BO0E1xUw/NySwl2rLfDNxv0yXBgj3cKT0ds3jQbkYyMCEtfcom
         LsnSONR8cEvfP+kYo9dO6qHLCR4X7i5W+TgNHOwBscaPPRekJ9cccOv57/bufsc53+3P
         9fn0TEXWlKbIZimDQL5njp4wqzrGA1B0/MRL6Lglr/KRr9d3GNFDTR38xuhni3pFIx8w
         vWHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789741308; x=1790346108;
        h=content-type:mime-version:message-id:date:user-agent:references
         :in-reply-to:subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=HRW5+1Frva7zZ8isaTm2TY41CHJL0yWnE9pSGq+/CS8=;
        b=kKR+05bYNw6tTWqK1ee/vv0HtjQBE3RtQJr8j9KS1ANSe7u/BJ2GrJ7aRPTiT8fFjD
         UX41CJ5Kbr7Qktd8aJOe1KV8K4wF0gS1s0Gtly/zxcocCHjeSgjufmGPIhGEE1YOpZx0
         rpByPYiaFA5nBs06CqSwPqK5NmGDKN2UtYlbuqHTyB+t1E05c1LRjxQBltWDsm8Hktma
         TPzAp2vLODq+8tDwDEh1+QsgF6cwZ36HPLEqG+gJGu/G1z74v5Pb7h+2dlWwc6bYY0pq
         KdFvr2kVatp6TItP3xN6zSoHu93YXtqqwMGpewysGQH1zqZvjndwCODxFTdo0sbH45AL
         vZtQ==
X-Forwarded-Encrypted: i=1; AKwUvByphHpg4qgkVbY2GlObQVIH2L/ZDxWU+hU8VpxemL0jjcv9FWevEb4+dKhmTprSkUFD8jAgb40d8sdJ@vger.kernel.org
X-Gm-Message-State: AFuF++nluinJSEHIep2pCaP0F64G0z2gKMckdhxqJb4eo1LK28gl6Gyf
	p77Oe9q8WbUZwhWcpYXq7mofYKGqefUAlgMevoURwTVYPpa4jCrdmWrk/MMf3Xr1xbI=
X-Gm-Gg: AYBFou2X8YjmW6Euq5WlbDYi5LBTiUEAbi+g3wMkf2ZvKB9D4pi1SNVHCtKCPafAKLg
	oiIC9FgBRFWmzO4rtdbGqBzbRxq/4BpR1H6922y7/hF/4HkXgREO0cWWHL3Q8x2ln4gUPON1Pla
	iKAjOTs7t7OW2w1Pu8IiMLNb0wJDonysta6ZnvUQzjjiogaBiUmG4/jCOQ7hxJCI86UD1+tHtoA
	L/siBS6+zDMbPKV+ZGKqNYvab9lMlQkZWLOlnnIFHYIWl326VPW2B74Unu6pDXFE/2ZnZVq6nuC
	8NI0wCTfnpY9XSascBg47+/XMj/MXiGGZ60cFmvuOstoxpUwGLdrYlYQCL2BezW0RYSNX+3IMjy
	oOF82pE5ruYMmxqn1POF7IFqEu6mSjsmT/X+qxnaqZJWYQZb8cTCuBoCIzbM++uiLfRDUX9ohHg
	ClezcmvWTEGVsGj2PA2pJpOx96/f1pEpD8J/pM8TOe0rs0OMCmYNTV3a8JxsZOYVQ5OZ+CZz2oz
	Kx2+I61j2BdBOs=
X-Received: by 2002:a05:6000:2904:b0:487:197a:e27c with SMTP id ffacd0b85a97d-4871e244c22mr3729361f8f.8.1789741307974;
        Fri, 18 Sep 2026 07:21:47 -0700 (PDT)
Received: from dev-ag ([102.33.165.38])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4871feb5de3sm4774627f8f.1.2026.09.18.07.21.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 07:21:47 -0700 (PDT)
From: Andrew Gaylard <ag@ffroot.co.za>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,  devicetree@vger.kernel.org,
  qinjian@cqplus1.com,  robh@kernel.org,  krzk+dt@kernel.org,
  conor+dt@kernel.org,  linux@armlinux.org.uk
Subject: Re: [PATCH 3/4] arm: dts: sunplus: add Tibbo LTPP3G2 board
In-Reply-To: <20260918-silent-zircon-cuttlefish-bafcbc@quoll> (Krzysztof
	Kozlowski's message of "Fri, 18 Sep 2026 13:31:00 +0200")
References: <20260917082632.626614-1-ag@ffroot.co.za>
	<20260917082632.626614-4-ag@ffroot.co.za>
	<20260918-silent-zircon-cuttlefish-bafcbc@quoll>
User-Agent: mu4e 1.12.14; emacs 30.2
Date: Fri, 18 Sep 2026 16:21:43 +0200
Message-ID: <sa6bj9ufxmw.fsf@dev-ag>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Krzysztof Kozlowski <krzk@kernel.org> writes:

> On Thu, Sep 17, 2026 at 10:26:31AM +0200, Andrew Gaylard wrote:
>> +		bootargs = "console=ttySUP0,115200 earlycon root=/dev/mmcblk0p8 rootwait";
>
> None of above should be here. earlycon is for debugging. Console is
> below. root - why booting is fixed to mmc? Why none of other boot
> methods are suitable or allowed?

Because as of linux-next 20260915, ethernet does not work (crashes the
chip hard; I have a patch series coming that will fix this), and the SD
and USB drivers are not yet upstream.  That leaves only the eMMC for a
rootfs.

Nonetheless, you're right, none of this belongs in the DTS.
I'll remove the whole line.

>> +	pins_bt_reset: pinmux_bt_reset-pins {
>
> Please follow DTS coding style for naming.

Will do.

-- 
Andrew
