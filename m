Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C160A3E6DF7
	for <devicetree@vger.kernel.org>; Tue,  6 Oct 2026 11:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791284847; cv=pass; b=Th+AfW18KY0drPqHKHxW957tMqaFnlSATWx8QKfP8yZoVZqqXbJrTkTNAhpSxeLKrogafT8F0IxkrL2+CZjntn2GgPMlxa3FbXGwk0MKd/+ibR7eejJ44BjaPQBLZDtGdhIv7ohLWeLd9NqdmG371htlze5eU0D8nqM7mmD7ock=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791284847; c=relaxed/simple;
	bh=qSS/SQDaAJD+8TrXRRUdYlnKCJd8RHVXLPrkfyVyE1w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KFAZ2cycc7ZJpXudCU4nZyUwXVMIom/X4hNpQmR2k5KL/wLYSut2zuCR6JXyjInA29b4pSbtf9Zo7lasHrjLBalVyuULuzxjzUYY8pI4i96U94j4CEdNtukC9f36hYtalLGsE6eRTAeuWKkGEAtlj7CH41GYBeBRsuyy0wrdiwo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q/EMXAj5; arc=pass smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q/EMXAj5"
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-917c04630c2so7629086d6.3
        for <devicetree@vger.kernel.org>; Tue, 06 Oct 2026 04:07:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791284844; cv=none;
        d=google.com; s=arc-20260327;
        b=p/hp5FZPsmBFUHo76oJW8v8PG9QjBzwpbVA7gAw3J669wOWRHEqKPHihs7j27+vZOp
         KIn7RT5q2t+wgXa9xX9u44+tIsfMqIg+ln5l16+oqFlt0Bax5pVQT1FdcRNwgKkMY/7o
         Uxr4KZ+fNZCK1fWY+TGIIkibNzpR0r+kEUkmb2igaNvV/iEmUxLBrSluLhZJxI3YcUCT
         VYaPspQy5EQmijApX8ukBlXNATkSfOV1vr+JS2lE+lrj3tovRQZn2K4Ecf3W4yXj9e5v
         VOljM+m41KV3IjTUUanQD3ExQi41Bj+a0qlK28ztfjktLayVnSxjiHZ9pl5LcLD5ScHL
         yHdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=st0WdGm0HQhoVPJqkSZGig8FXS+yxZLP3K54PTCRXrQ=;
        fh=q5yaf2LREfh3ehgODE0zzece5uEs+UNAdusgfCTWdf4=;
        b=dQf8V6JtE7Nzp48V0Qzs5t1g/+e7kf+ZD3AxU7XGCo7l0g0p0FAj1PZL8PWi3Fma8M
         7MO4UYOdvO+sO2oa+14iscmGu1V89EFhoyjAKL9cic5qK3K1bkZt9inqHzeqw7nLuyOp
         E85oW1zNWtEJwqwSHAlRm1JknAdUU6tb+vijoe0GQd96vFVcihTY1saDM6vxvXuw5Z8h
         MXPpKPvV3X4zBGuEtZANcZtmIkXEQnnclyryYKBWbYKb23d7/hsVwd4yQZaCcavrJa38
         1PB9f8bhH2pcFfkPbBjYd5F9Kkq6i+IRbNEdDxDavt4solNEkOg+nq3X+s3TagDaz13t
         AFSw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791284844; x=1791889644; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=st0WdGm0HQhoVPJqkSZGig8FXS+yxZLP3K54PTCRXrQ=;
        b=q/EMXAj58oXFBNWWRtOLXcyeBBO90ETnY2BHR6HODfxlA9IHy74LVCO8VTqPXZQ/pE
         nyG1fUStUMb0w875dj+GxKu/HPIEx8sOJw8Xvo4ODTraXkKRaCR9GX1JfYEOJLGIOqYD
         BHmdQZd5vAMsjiFpJv9h08ms6pFetTnIUyIb60/N3z+pSjqZElpf13ExW2ALNFAZLtC3
         CwXVmbGGRrB23xa9u+3Wlq5b4vSbOtr88EDBnO+GvoWczmm9Se9YdjS94QUrpUDZMuRP
         VF3cg3KnqQSQeacZOqMNtIkcs25GWyXIon8F/aAJHFvrbP9Epod/IN/uL804GdV1swEp
         WQ3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791284844; x=1791889644;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=st0WdGm0HQhoVPJqkSZGig8FXS+yxZLP3K54PTCRXrQ=;
        b=b0EYzXQS/tRFt2a7l+gEk7LfSX0fa5kxnYVnci6B6RCsOkMHalXPiasoVVQZ2qgRti
         CIdiOd0ls9gjBpQAy/knw6d+FXr/M9Bs7UOU8To5cAA1Cti6nWV4sd0EptXGVICCrjdr
         m0o+j7CR40QZ0jxpdyG5+IKE1L9AdASg5GAIbC41zF0aYeL5ZDbSr5p2bM7bzV/rHuNt
         iZKGtWMlYSDrEqj+BFNZSQTZsuonQxjaCdOep+nhU/P5D+l7U23CcWk00leWsamX5OxK
         h828fR8513mUqvRbvQFCe2bN3vWunxEot5SvTBOUd05F2MMKHfeKYgpHFVUbKytAUtvc
         2Xxw==
X-Forwarded-Encrypted: i=1; AKwUvBxgTYp9r9bsciNfy3LVNf8bt2ildxvPVVHIYey1yl0j8g5Zhtad5zaDMDL6YFeT39je3mmYbEbhCfeu@vger.kernel.org
X-Gm-Message-State: AFuF++mTNsfk/IbmLitGXG7uH6Ff07wRZFTE3Vgx3DyDWuRuf0Z8iy0t
	vGmjNYpR3IoN6Lxuvj1uHN3MuFeSn7wNt7MzHfzQs0vKEwi2B0MlR4YSXC6UDHHXUj62W8+wP1T
	bQxac8GWlgNSmL6/rjuqpyN0HEyceF3w=
X-Gm-Gg: AYBFou31+X4z1xa2yoRsgQvBzrP0LeSNAEEto7t5SPq2FoEckVXzU2ET/wQHsvaq4pn
	U2hbsS1ToNtSutLEAluuqC8OzGjx/2GdA7OtWak6AlQ2O3CEzdAchYHq4gLy3Cj4ri7C/60LTzg
	1vVpfa3UyAzzSmdI9bO6ps/9c2HxYru+gyc+gIEICRgdAv5AdJJqimmWRGhE2vj2v1wHLuTlxMH
	pKw4jv2cO9d7XJubYV4HPqf02xmnyjWp6L+S8k9GTmqPUtrno6uKWe/n9dh5A3BPY5Jw3hnLHRR
	bodm14CTxbCDzErvb4EzaC502vc+vbIEU3u03Nil+PduLIdDVSe04NemMi6dvSyPnTLo14mQxr0
	PbHoIjnbi
X-Received: by 2002:a05:6214:310a:b0:919:5a24:d77c with SMTP id
 6a1803df08f44-9198b7bec34mr20040386d6.31.1791284844396; Tue, 06 Oct 2026
 04:07:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261006102937.10972-1-ansuelsmth@gmail.com> <asTRQ6d0-NYOeHqX@parshuram>
 <CA+_ehUw8fQHGef_L7YPQEf-wwuzP9km=G64Ty3+AkvM=fkNJ4Q@mail.gmail.com> <asTVqsqOLb29LY08@parshuram>
In-Reply-To: <asTVqsqOLb29LY08@parshuram>
From: "Christian Marangi (Ansuel)" <ansuelsmth@gmail.com>
Date: Tue, 6 Oct 2026 13:07:10 +0200
X-Gm-Features: AclHuK__1dmQcUVRwrNQOlxQllKfZWHAwvmEnEZJ6X7sEUc-dLa0jeCfKreo69E
Message-ID: <CA+_ehUxra53C2N8a0t73nLpS4DkaNSzE3STfhU7j3ZoQ9becyg@mail.gmail.com>
Subject: Re: [PATCH v14 0/3] airoha: an7581: USB support
To: Vinod Koul <vkoul@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Il giorno mar 6 ott 2026 alle ore 13:04 Vinod Koul <vkoul@kernel.org>
ha scritto:
>
> On 06-10-26, 12:47, Christian Marangi (Ansuel) wrote:
> > Il giorno mar 6 ott 2026 alle ore 12:45 Vinod Koul <vkoul@kernel.org>
> > ha scritto:
> > >
> > > On 06-10-26, 12:29, Christian Marangi wrote:
> > > > This is a major rework of the old v2 series.
> > > >
> > > > The SoC always support USB 2.0 but for USB 3.0 it needs additional
> > > > configuration for the Serdes port. Such port can be either configured
> > > > for USB usage or for PCIe lines or HSGMII and these are configured
> > > > in the SCU space.
> > > >
> > > > The previous implementation of a dedicated SSR driver was too
> > > > complex and fragile for the simple task of configuring a register
> > > > hence it was dropped and the handling is entirely in the PHY driver.
> > > >
> > > > Everything was reducted to the dt-bindings to describe the Serdes line.
> > > >
> > > > Also the property for the PHY are renamed to a more suitable name and
> > > > everything is now mandatory to simplify the implementation.
> > > > (the PHY are always present and active on the SoC)
> > >
> > > I get build failure:
> > >
> > > drivers/phy/airoha/phy-an7581-usb.c:7:10: fatal error: dt-bindings/soc/airoha,scu-ssr.h: No such file or directory
> > >     7 | #include <dt-bindings/soc/airoha,scu-ssr.h>
> > >       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > >
> >
> > This header is present in linux-next
> >
> > https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/include/dt-bindings/soc/airoha,scu-ssr.h
> > https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/include/dt-bindings/soc/airoha,scu-ssr.h?id=11952173d8a180ac05641775f80bd6946327478f
> >
> > Introduced by a clk series.
>
> Okay so we have a cross tree dependency. I would like my tree to be
> buildable and not depend on next.
>
> I can
> a) get a signed tag for this from clk tree with the required patch,
> merge and then apply this series
> b) postpone to rc1
>
> Either works for me
>

Maybe "a" is better for other phy driver? The pcie move patch is blocking
other airoha drivers currently.

What is the procedure? In theory just the dt patch is needed, nothing else.

Thanks a lot for helping in this.
