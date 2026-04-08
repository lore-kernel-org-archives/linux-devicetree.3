Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3AEF38E124
	for <devicetree@vger.kernel.org>; Wed,  8 Apr 2026 08:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775638361; cv=pass; b=lXkWX8RgXQquY+wFEtefChzdB+440DpkNY3myY0Jy2y2WZ9HAZTwMF+ryyyOLZUqS/MkU68Twc2VslHO0nwZhybLsN91VRX1jsTHr58bmvhzk3hoVVWBAzCSk/LvKNJsXRR+MhsN562WvAzpAuesNIyCin27L36O41f7UTMOHZc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775638361; c=relaxed/simple;
	bh=GZCUYpGzSEaVz0yr2PjOwJHacB80woyDv5ya8VeuiSw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bWzzOjQHLfyQn/d/+l5uy0Lp/oNjBU3KregbKMxzHklkFETZMCJfar9aEm2eQqsQpMcq7NP5pbaVrNxLMRJrQ8lspdXYwo7ZvoEN3g9/ND6C7EB5pj25Y0Qp/00tno/Qjos8XKkjArnCS3xRagFNJo4478lQZCfgF2W7ZcvftvI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sEpxD0Xj; arc=pass smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sEpxD0Xj"
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-56eee0ba462so508306e0c.1
        for <devicetree@vger.kernel.org>; Wed, 08 Apr 2026 01:52:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775638356; cv=none;
        d=google.com; s=arc-20240605;
        b=ZVDAPRwXvAKcgdEkj7UZVsX8ZDaxDll2rpvV83ChhDeAyNwruBYbOkKOKYQjm1b+O/
         YlC3xuq/U+++SLbduemduVHQAP0+mpsVzPIMpCevEHHrhaxcl1YpEUHkNqdaMW4mvKUq
         D70i7iCMpN7+v5snZjnRoGVYW68vGSME6JcHZNKENJYBwirCsnMqJ/ebt38D8ztdOXdn
         9WyUECCENRq5xtxqGrmBlQ+q04fJqP+vGoW3VheNSSIaNrUACyIbBQ0uOJs3u20vqm86
         OxKs3he+U7qxM1ze5DZl2cE/MRrhxLTeEhnki120ArNeAsmGbg67FOWVMYBDgXysVXus
         4d4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=I2wUntJq6mMuHKrvX5Pc4RcmIMae/ycm7tp/NWMwrwE=;
        fh=bXNvYn2yFtrK+MRnYSKs//OELqzrGliuTWDl3f3u7VM=;
        b=DPcayy4p7QHs7wzWe1oJrj7mZ72TKrbksE54krfm4X4DoYtAxZn+mDoKuwPdG+HYjN
         2htyGVqRAHGofd0iqwrzQvzHRgqGaifz/k6FDsAwIZN06xIx29vGWwX/98sT5ysiZM5M
         z/+sNADK0FhJxjHLMmJ5/IVZKr/wY+emLJHdx8SbTFs5/Nd7qULYRmzxYb5n3R0f99lV
         BuQqQl8ZGgW8448NDcAGbfDROL5sKpszcmilsG+TKF8oU0X+jhvM1YVIS8A1dMOL1Rrg
         iIKdIcCeh50rP0f/nwsp2weq253n81eUHG3iplhM2KMbY4zcd0cWzYdH23Vz35czd90E
         bFZw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775638356; x=1776243156; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I2wUntJq6mMuHKrvX5Pc4RcmIMae/ycm7tp/NWMwrwE=;
        b=sEpxD0Xj56Xi7PyGj2oR70qLwlJehYjbdOT7xwYwG1ssSMjcRQwD/o8DwGeFwYTjKJ
         767I+5GIyeXRqqKX2tyKgedkfD7dWT7ZpuqUjvIh4cpuoE+IRD/d+YvjOHryJVeG6EW3
         aFPjmeinRUEtvmiifn29BD8iNqnJ6IP9+Iq+J4HpxdsvrDSbIlJ5Q59FNv+/JYVrYjz/
         UDcRqyV/2W3cOadlZ6iwEuqhpy4+Jf0KZiBEoAE1VLxJJUNzAadSMaTzRT1PmmUQnJbU
         jdISu8iud3o1UcKTg7A0SbaJ/klC1ulSLQ9ePgXABamg+WL8E+RRwtMcJvPmY7Qx+/Xs
         X8Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775638356; x=1776243156;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=I2wUntJq6mMuHKrvX5Pc4RcmIMae/ycm7tp/NWMwrwE=;
        b=hHsc+/KPS8WsIYCRyRP4Q1jwM4aPjSss7kZ/tIl98xYV0eeCJ+a/wmEpnDq0pqT2Ff
         y3cZemSyO6JxV2otSrarypSGJ4VVjnADpao2nJbkPL4bzo+w+xyk7uZsc7GFewJW9XHK
         AL+KFLd21ZMIyjd6ibVVb2qpjYNVFjulzW/2wfx5eXdDc54sJYjCtPQBs0RFypCoJ8qW
         FJFi3LX04bIP2+MbOgZgomJoigiQeYahDzPXc6sRX5UTjpEflvJYBlKnOVMaEbNWDVqS
         CAU5xYWFqfEDzt1zENz/IzhKjwgLKD5mY4iJ69Qcqkn5mwTCWO4dC9IwbpCqSj6nn9I0
         yc2g==
X-Forwarded-Encrypted: i=1; AJvYcCX99ySNkStyCLTWzdKbtbRjeZUy3BESGJ6t2V6ZmUMTdziz9eH5hX3fCTpVwI0bIs9ADGjah9V1HrN+@vger.kernel.org
X-Gm-Message-State: AOJu0YyXRvZuQsbnNKNjAC1o1F4Nwc7/HEWm1upCVzMKoJmiy3AL+/3t
	Jx7R2VivkVDsGsKrC33+IfajPSIkwqNh/WzVf/15xg7nCsCrXisVL7TZIv07Ghfb95NHaevzyS6
	zETc2mqCSpMdB6lgLSDhGYm/ubYoqgFY=
X-Gm-Gg: AeBDieuQeP6VRy5IyBWmMcdWJXeOJf//hMjCSsGjndEUihs3t1LR2/UygcTYTrWbZPv
	jrRzxrI5yNoShztsMNy8NC2fsKTiKMthVm7f/IJlP3krIecnbLG3J6jY30tGJy61lH2REnRmEkW
	E/Ttu+j7/mkv/6RqjHrSMK6MKlBIKRu8gNv2hutLokI6Sc51iz+1avmusmUySUxO/44FnxQGSS1
	2I5sGW61H5WnHWqLf8/42zBsKES0hrJtQWGNB/TUmia5pP53z6q8S+scF55HBFhjwA7HO7DIpu9
	ekUJQRufVw==
X-Received: by 2002:a05:6122:6d0e:b0:56e:e652:2c10 with SMTP id
 71dfb90a1353d-56ee6524f13mr4595571e0c.4.1775638356381; Wed, 08 Apr 2026
 01:52:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260407-anacapa-devlop-phase-devicetree-v1-0-97b96367cac3@gmail.com>
 <20260407-anacapa-devlop-phase-devicetree-v1-2-97b96367cac3@gmail.com> <20260408-glorious-vehement-robin-b6def3@quoll>
In-Reply-To: <20260408-glorious-vehement-robin-b6def3@quoll>
From: Colin Huang <u8813345@gmail.com>
Date: Wed, 8 Apr 2026 16:52:25 +0800
X-Gm-Features: AQROBzABPSvPPBL8e_J-mw47skeWFz5_1Z95SvdlAeCuqOkW0mY25cXhSnCT2fI
Message-ID: <CAPBH0A-ER9-_KpknyOKTmS2sBk-xv0c016y9WsLOvZ8CjSiwCw@mail.gmail.com>
Subject: Re: [PATCH 2/3] ARM: dts: aspeed: anacapa: add EVT1 devicetree and
 point wrapper to it
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, colin.huang2@amd.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof,
   Thanks for reply.
   Could you let me know  what kind test I need to run?
   Following is what I do before send.
   * I build this dts with linux 6.6.x
   * run "b4 prep --check"

BR,
Colin Huang

Krzysztof Kozlowski <krzk@kernel.org> =E6=96=BC 2026=E5=B9=B44=E6=9C=888=E6=
=97=A5=E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=883:52=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Tue, Apr 07, 2026 at 09:54:33PM +0800, Colin Huang wrote:
> > This change introduces a development-phase devicetree for the
> > Facebook Anacapa BMC EVT1 hardware revision and updates the Anacapa
> > wrapper DTS to reference it.
> >
> > A dedicated EVT1 DTS is added for revision-specific hardware while
> > keeping a single, Anacapa entrypoint used by the build and deployment
> > flow. The top-level aspeed-bmc-facebook-anacapa.dts
> >
> > Signed-off-by: Colin Huang <u8813345@gmail.com>
> > ---
> >  .../aspeed/aspeed-bmc-facebook-anacapa-evt1.dts    | 1069 ++++++++++++=
++++++++
> >  .../dts/aspeed/aspeed-bmc-facebook-anacapa.dts     | 1064 +-----------=
-------
> >  2 files changed, 1070 insertions(+), 1063 deletions(-)
> >
> > diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt1.=
dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt1.dts
> > new file mode 100644
> > index 000000000000..a29b7fa1155b
> > --- /dev/null
> > +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt1.dts
> > @@ -0,0 +1,1069 @@
> > +// SPDX-License-Identifier: GPL-2.0-or-later
> > +
> > +/dts-v1/;
> > +#include "aspeed-g6.dtsi"
> > +#include <dt-bindings/gpio/aspeed-gpio.h>
> > +#include <dt-bindings/i2c/i2c.h>
> > +
> > +/ {
> > +     model =3D "Facebook Anacapa BMC";
> > +     compatible =3D "facebook,anacapa-bmc-evt1",
> > +                  "facebook,anacapa-bmc",
> > +                  "aspeed,ast2600";
>
> Test your DTS before you send, not after. Your binding clearly said
> something else.
>
>
> Best regards,
> Krzysztof
>
