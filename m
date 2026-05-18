Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3E4F3EFFA4
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 14:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779113866; cv=pass; b=qTViwJpWyz13qa25r7cfMha5BQswxwk8SfU/1aISuTbTYnXCjo6+5zpVW4vP5rUef6tMhgqo3W3pS5obiwzlRblaxY4jX4RppwwbyNMIhO47iU0KNGMj3HTSoGSe+ZPGzZo6pB9cc1BMcdGaDS6I7NI0xdKd0SpLShmu9bXavHs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779113866; c=relaxed/simple;
	bh=m9vXK639duMrGCvxYu968cLO8RpsbdfFH6e0KuGkFCQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sCFsK2ZgFXusQyEMeFolwKbsZoOkUPmrlq/n61WO9WPMY7vyX2bORXAtTapR6DOr6U2Rf4ngOSjEbCHZpdV0MJGJ9JAF5PCa7gDbYpd2J27A1A53ZydaTZ7Xbjlpq66G8YCeKXjO6iH2BfBsn31pwpFke7qcJh/4pSmS0JQiGCs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tzl8BfM4; arc=pass smtp.client-ip=209.85.160.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tzl8BfM4"
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-43ad01fe217so30972fac.0
        for <devicetree@vger.kernel.org>; Mon, 18 May 2026 07:17:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779113861; cv=none;
        d=google.com; s=arc-20240605;
        b=GnD7133cyV6LX7bpolqjsjqIQPHt/R91FKaxkftrF3F1A8Xgh0xkcXpDFjYWGvzE8O
         M15zOQ5Ipes6QmpPXuxjDglnMthZuRt3MDg7gstaDyspPrULEncMqoVt+JtwCPS2xSIE
         9w84ji6W+nwSi3DYEGWTSqf3esd6avUqVJ488Hi2RFZ0/tHYowNekiBY0aS46gefddYc
         /Ldr57L1wnKsiDurmKQkZL55p4IIVQIZEip392Edy6tKA3ay0tANmOLIYJPgmGAIo84G
         HiZYIiOtLB7ePTwi/8vskVv8tDxXWjp4MavfJY6mhmInXbyq41uMCZ4XQOvEScRmIIu3
         nX/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pDKx3EeB+e+ODwyRdpNDzr6olUBON+DX/SSLXnx9QzU=;
        fh=uUnQ4zTPzrv8KoJg6phnkBsODm0CFSwY+mjRiw3Sjcc=;
        b=HSWdeja1PZyp97E+mV5PKbgz7ZvJwn4tSUWfuc7s5CAzy0DrZPGFDuXgwOZGYYsxl9
         Qla558J7lEwQW68E/gFIn34s4Fs1BRliIzoAMgiHmQk+/eV6JiQ6pKsCoD0GhVRCNbjO
         FZDkOfAgPsbvMqV6e5RrCT/quwkUMcchoUGCpm2HsBn59Ns5xSEOyq1O9xyANdZUYTMC
         HNBDv+dWpI8WvPacx0I1rmwMZW/wOZCOCq+k63Lkxq2godEpQws7mzj8w4TxjO1Kyr9x
         4OeTEVHcL7Xu2eVu2gpDth5GXVplgJolN0pa1Tu4/vi9LPU0xvfYgoCRekVAUW4qWrlS
         2Ubg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779113861; x=1779718661; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pDKx3EeB+e+ODwyRdpNDzr6olUBON+DX/SSLXnx9QzU=;
        b=Tzl8BfM4UY9xEgKhkGHRipduLXlAmyVqfAds8J3aPs5tmI7XGr5U9GGVfJBrdf6IEy
         xgeq2COvXZzO5CSMsoLltAMSsbf4PY+s3beEODn00XDw+mwW4XhAq4X2UVw9tHkbWeQj
         NZniNGpSqmjdvaiY98M2vlSsdKK38+oB4XTRnhJmx7Hhpv4kKI5vFoLOHMWtarh8LRTf
         7QLZebj1nP40REigaSLmSMfFsycnslqNwe1xSg/mhVzPpskhaD+sVGgAw1+sip0emAlY
         MyPTNskqq77ggT/vE//CF1pgTupX/rXL3QB6g9JDnCNoVejhvv8Tv+xp249kpH1Jj4qd
         kBww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779113861; x=1779718661;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pDKx3EeB+e+ODwyRdpNDzr6olUBON+DX/SSLXnx9QzU=;
        b=l0bwRt0889GXXEp/Wp+tS0gGdgAUADHqWEfu3fAASZNt8JBccCp/h9w1pfAuGSVKyS
         saXqQKn4MfNO6IAOYBNNnnPz4vds4Le8OpB9+zT//hGuIRiluGV3Wdrk05kZfQ7HqJjb
         ot2aSraKkhSj98qoQHXQjdCDLqRQb/NJTtxcN+RqlouF9P4Ll/+MuQcbFAcNHNm1G2EH
         160wTQB7K5+pmHbLKgJk9jGIipbajWl7BgPBOiFBLddeX0B00Oh1X6nw24dQmiPM80yF
         zB4Vneq5622ZM7jdKy4/+uy3p9cvxizxaN3q0PvVG8baGaRbW0ba5YAS41LlzWOhXgir
         UtFA==
X-Forwarded-Encrypted: i=1; AFNElJ/Vn7BO/2AgS3HsyaMSryO3QqViCY8nlr/h8MoXCVVqoG5aOmYX4EuG/VL4gu4pSKVeqbcFYZo7mki1@vger.kernel.org
X-Gm-Message-State: AOJu0YzF8XIvOaIJZHIycwBFKmZtoMwQec8noVjRiyTLN51P9eLyNEfr
	h/7VBUJaH8A9Tb/ZIur10u9utBrGaWnF4uRXj9oA6mCjlwjvEQF7F8h6GbPZ3em0+NaNW8mizs3
	imil7BUsgtF6INIX9cHo6G7alVYxlSns=
X-Gm-Gg: Acq92OHE5L2Kk1urZPQhYYBk3tPas1X6JusCD7qs8XKCIPBYwZnJRjl2x5HpG55PMI2
	SJ90sAwAvXzjbRqYgCA3rwj3KwB/hwPtSAT9H9o/W3oJKU3e8Aul+y9zDmtQkmVDBv6BH5RHLMS
	mfPzrFyrt8LAbRQkmE0DvezP8NZOus/zccZm542lvZEg2B1SmIUF6ydSlWVAFiFcJHntMA0r01Q
	oPnuPYOzYt2p9W2YJBTKfchg/mesXXTJUuP3qLvNT1Tob5n8PX1w7zwYuhH2tjYo8kYFjXfod0s
	ZGp33def
X-Received: by 2002:a05:6870:3346:b0:439:cd73:3864 with SMTP id
 586e51a60fabf-43a2d9d7e03mr9872675fac.13.1779113861493; Mon, 18 May 2026
 07:17:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260517-sf21-topcrm-v1-1-438f2e0513ff@gmail.com>
 <20260517143152.C3318C2BCB0@smtp.kernel.org> <20260517-aground-shadow-d4ac455623fe@spud>
In-Reply-To: <20260517-aground-shadow-d4ac455623fe@spud>
From: Chuanhong Guo <gch981213@gmail.com>
Date: Mon, 18 May 2026 22:17:29 +0800
X-Gm-Features: AVHnY4KG3bvfW6nL4igtsM3606_UnBal56cQai2nWjWSCWUL_A_EBt_yZCq-Ksw
Message-ID: <CAJsYDVKtfZCSNT0FgM1M5Wc-+MQ7eegT9+3T-DG=vRa4dMmKFA@mail.gmail.com>
Subject: Re: [PATCH 1/4] riscv: add Siflower RISC-V SoC family Kconfig support
To: Conor Dooley <conor@kernel.org>
Cc: sashiko-reviews@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi!

On Mon, May 18, 2026 at 4:46=E2=80=AFAM Conor Dooley <conor@kernel.org> wro=
te:
> [...]
> > >       This enables support for SiFive SoC platform hardware.
> > >
> > > +config ARCH_SIFLOWER
> > > +   bool "Siflower RISC-V SoCs"
> > > +   select ARM_AMBA if TTY
> >
> > Should ARM_AMBA be selected conditionally based on TTY?
> >
> > ARM_AMBA models the presence of a physical hardware bus, which exists
> > regardless of whether the TTY software subsystem is enabled. Even if th=
e
>
> There's no point having the driver built if there's no driver built for
> devices on the bus, I think is the angle here.
>
> > PL011 UART is currently the only AMBA device on this platform, tying th=
e
> > hardware bus infrastructure to a software abstraction might cause issue=
s if
> > other AMBA devices are added later and TTY is disabled.

I copied this from the vendor tree. PL011 is the only peripheral on this ch=
ip
requiring this flag, and there's no more AMBA-driver compatible devices
on this SoC.
However I'll change this one in v2 since I don't want to add the only flag
in the kernel which conditionally select ARM_AMBA :P

--=20
Regards,
Chuanhong Guo
