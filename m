Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDD0B314B6E
	for <devicetree@vger.kernel.org>; Fri,  9 Oct 2026 17:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791566722; cv=pass; b=SBzNdZ/3MLvppG3waXm/yaiMrCQQRt0p5na49ZRZl99dytfF62/X4mRNaHXk61d+lVTO8wT72Pn5o2KBnLCtN2Stw/N5LTLc949oVwDcQMWX5i+yBNuqyDlaU0w+IDSTS9bn5dMiRac+XIwB3kzjabPXx5RtrmzsLnNITf5wO4Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791566722; c=relaxed/simple;
	bh=AOV4gqFTB4BnPT4BpjZV0TRwwy1hdPuOvpKA+jIuMf8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c8NOlPOExfZGOKHc5uDk/hvJ4XZLgu0TZqyxDiy7W/UjbBOYypdZE43wrWF2/+0qq3RKXF3gmDXka642xYAF4RmaP/gQaDWAYcJZyNWO/BHlzO60VXXeb3RYGNOYCiIjhVhi+Ohhne/4yhInXxvfxMQtypeok5YBfw3U/UqL/sY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OcG/Qc2U; arc=pass smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OcG/Qc2U"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-8ab395abf79so41077127b3.0
        for <devicetree@vger.kernel.org>; Fri, 09 Oct 2026 10:25:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791566720; cv=none;
        d=google.com; s=arc-20260327;
        b=qox46my7iEYVqUDT3d0pNw7P+1p5aAFrsDdq+5egpyww0IT6mNRz/nVfxPi66dh/SE
         z8Sb/mc/rguIJc09SQf2W7blgoLR6u+ntmIn9DwtSA0sIJqnQb0tSSO7HtSgiGfSOEhA
         nvaNJNIR4BB+2j3QDZA4I+CbQNvyD4spJ5YElkJK/xlQLyV18D06e14OVbsaW5YE2/fl
         0Myk7uBDv6Ymte7yQsex/UYyHkI+UytSeTq+bf1Iw2JnQf6f1xgStm85VZ27PGB35y1G
         C25Wj+88Ow8yfeUQQKuiwXO/cJq7KsPwEzn8JAspUkXwKbuD4SYLnedz2WIv8yOKdnEz
         HCsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=AOV4gqFTB4BnPT4BpjZV0TRwwy1hdPuOvpKA+jIuMf8=;
        fh=csHuw/s1DZuRQ3FzyB/iHe+V/s5EmscTTNtRlzMyB9s=;
        b=hr6uJY35TzTyfy/vvAk68bb4zQTeZ1UaKFeHm2/zUQEwhoMpr+1LpaNH8NA/eNo/ry
         eaU6qZ2Oc5C+yfP+JLNto1vntrnH/WglSbltjKSLUWmC/omPTSqNaktEJoQEwuxk/qWi
         Js5e9pjpN4xLYHFgDS/8SV/NeT2yWrhP/10fW9AqBsUMYeyGU5Ih+a6kQ6UDLJwJyOr6
         0k9vtc59XSO6+gRPReZkITHV5KsnSE13nCcH2TwVEvSEiLdVKVcoEoJzw6D/M+CqGbzJ
         AYTBMacvAOgczWEwTxSJtoNFK7yRgod7Bz9jeYbwl0WMDQK2PaKbP/WXBkLLtFsjFqcq
         bYLA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791566720; x=1792171520; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AOV4gqFTB4BnPT4BpjZV0TRwwy1hdPuOvpKA+jIuMf8=;
        b=OcG/Qc2Ume0dJMNMQL2PveflZPkQhWpip86Mad/ssRzPcWAuJbmDYr8oV82r31QmZi
         cQlFIqFrx3MLy3wJGPuwwY8bTAq0wDe6n5ShTcXHv2fIORIhEy5kfqmqlF9C9oDqjeqK
         oXFSqPHFloflUOx3NJ0OVrBhaxJxYDUp66ULr8ORDDdF4RJ/d9xBtWUD1u6m4OUAV0gs
         fc6XlHNVa6/jb+BabboklntzS+pmGoHUGqyrSHLvB9qfXn78he3vP9pA2su5/Qg+rQLZ
         mDcgzQJ/0RNM24W0AWCFtfDVEHSkHwu1/Ye5yQWLI6lVLyqytQX3NvPlZUDrqmoSP6sG
         GS/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791566720; x=1792171520;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=AOV4gqFTB4BnPT4BpjZV0TRwwy1hdPuOvpKA+jIuMf8=;
        b=HSGMZ5H6xY/khtCl0VNKyqAMl1RdowTWivEWnPSFpl9VjsebPq/ugai1mXeU+fP3S5
         4PKUkj8nABoVIA6EHOns5qBzzAz7NOifFo12XdaujvfNzA0F/2IbRBFLIi7QS2ALH7q9
         2MG2Mpzktd3gv8+mcGWPPPuppTDDdHQanSSUkHtN8PJyik+RguhMB3Femup56uSpxLwu
         S0F5SQpm/bxKQ+njGdpszoW4tEPA+swcZqqOR1pkfrA28DAh7pGNWD/3iyDPPvwRdG1X
         lhB9lPRKtogSoxuVx8lAEKwZ81nlsZi0E5hmOT9qWOAf2gnjeCr0/rxeVIk/5eGtvGOz
         oS/A==
X-Forwarded-Encrypted: i=1; AKwUvBwYpu2H3ExifXN08dKsIxqLu66VYFUY3wXT3Gy2Fog8s/4UCjWMU/RIyBxRbu4orgmwphrXhxr+lAgl@vger.kernel.org
X-Gm-Message-State: AFq9FYKbLRXEHJ4g71Ma1a7+DOZUTg7IjES1p/ZG/5S+ySVwz9Vwpsce
	oo/f5iM46C0+4jDMzRf/T6dtpi1hrC7SMEGzDVJVLobh25TFRu4P2rCfcRH92nFwPVZBRdinZLa
	gNj3UpKlzEwM+IInLUSPeWRCX61VmR3E=
X-Gm-Gg: AYBFou3n+i8/rllf9zAK5iAFowe2z/3Av3u7kaOF6hGwpT5JTjFBjWIkBoLIl8bfYKz
	1qkxGw08sCSje9oVudYtOZWNVZfE79a+zaVpp5WgXQUY1SczKsVWli3x3yssX6UBcrmIANDNGrr
	+OT02cub/QIwD4zdRjnvCLDki0DGKUQgayq0aWzKtn8teuENwfqxl4nfFvbzEkHQkb9wLesNnRn
	spyx4lMLZKgqve63vqP5zRWSZK2N0cIYfMLX1/XSgFrAADVdxDKzDSsOPCxY23N7Oj6fabUPUwk
	bugxQEMb6Aktnp7lxv42Az6Os/2Su6osPsBVf+8X56olayQcNvUKi6bkrTsadhfw9/Y+2Bg5i9k
	Smk1OCbIUyuUHkSngEe3oQuSPHVO/DqBvGw==
X-Received: by 2002:a05:690c:10d:b0:8b0:88b7:cfe3 with SMTP id
 00721157ae682-8b088b7d19bmr3339407b3.40.1791566703722; Fri, 09 Oct 2026
 10:25:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261006102937.10972-1-ansuelsmth@gmail.com> <asTRQ6d0-NYOeHqX@parshuram>
 <CA+_ehUw8fQHGef_L7YPQEf-wwuzP9km=G64Ty3+AkvM=fkNJ4Q@mail.gmail.com>
 <asTVqsqOLb29LY08@parshuram> <CA+_ehUxra53C2N8a0t73nLpS4DkaNSzE3STfhU7j3ZoQ9becyg@mail.gmail.com>
 <asTYlWdkrlci37FB@parshuram> <CA+_ehUyGgaodxKH_RddpaUXS44w=eFpediyQqEYhvJZ8LBKRRw@mail.gmail.com>
In-Reply-To: <CA+_ehUyGgaodxKH_RddpaUXS44w=eFpediyQqEYhvJZ8LBKRRw@mail.gmail.com>
From: "Christian Marangi (Ansuel)" <ansuelsmth@gmail.com>
Date: Fri, 9 Oct 2026 19:24:49 +0200
X-Gm-Features: AclHuK8pxC9pxYotACGYDKYBARoHU0lbaBRjHN1fFMlOwVi1z9GLBZkUdQVGwFg
Message-ID: <CA+_ehUwgkXVoRHhsk_2mfO-6Hpd0fytcVN-7ykgRqoWsrV-b7Q@mail.gmail.com>
Subject: Re: [PATCH v14 0/3] airoha: an7581: USB support
To: Vinod Koul <vkoul@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Il giorno mar 6 ott 2026 alle ore 13:25 Christian Marangi (Ansuel)
<ansuelsmth@gmail.com> ha scritto:
>
> Il giorno mar 6 ott 2026 alle ore 13:16 Vinod Koul <vkoul@kernel.org>
> ha scritto:
> >
> > On 06-10-26, 13:07, Christian Marangi (Ansuel) wrote:
> > > Il giorno mar 6 ott 2026 alle ore 13:04 Vinod Koul <vkoul@kernel.org>
> >
> > > > Okay so we have a cross tree dependency. I would like my tree to be
> > > > buildable and not depend on next.
> > > >
> > > > I can
> > > > a) get a signed tag for this from clk tree with the required patch,
> > > > merge and then apply this series
> > > > b) postpone to rc1
> > > >
> > > > Either works for me
> > > >
> > >
> > > Maybe "a" is better for other phy driver? The pcie move patch is blocking
> > > other airoha drivers currently.
> > >
> > > What is the procedure? In theory just the dt patch is needed, nothing else.
> >
> > Please send me Pull Request with a signed tag from clk tree. This is
> > typical workflow. Is it soc clock on common clk tree? Stephan or someone
> > can generate this and I can pull into phy/next and then apply this
> > series
> >
>
> Just asked Brian since he merged the 2 patch series for the clk.
> I added you to the relevant mail.

Hi Vinod, I wonder if a subset of this can be merged in the meantime?

Just the code move (second patch of this series)
It would unlock sending 2 other phy driver that depends on patch 2.
