Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D26E0388E45
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 07:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783581775; cv=pass; b=sq2pVkNO4BpjqL/IyVeLsEzCe+dWPeP0CAgoViQ1EAnIYqwLhD7akLV3sYqI4IuwZ6/tTfLTDIbv+68xlvBEmKujnUPIQPrN6G52+b9kR0+HsZnHRHgTqgkm4uYOYqCvayI1efMO660ixwfnraEr0T65AStaaglTIMqFCnuKS78=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783581775; c=relaxed/simple;
	bh=/gyp4ujD3GD0ZScmU7hZBb2XngMiQOw42I4RTgf+0JY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g16sr1bICcsv2W0z8snsE6LznzN9hMb8h3HynpO+Lw2INmyybG7tWkkmx8v1P3auRlQOovvmI1IE6EErBnKdTUotdxDh4XWsmfu2Gsl3MfxsGl8h05YA0ctxWYZpFIA4YAcaDrwubMJMs+J5WiWLY0mesr/LEysFKFibZU7EYrI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vd3AGBI/; arc=pass smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vd3AGBI/"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-698c0ff45b5so994960a12.1
        for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 00:22:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783581772; cv=none;
        d=google.com; s=arc-20260327;
        b=XLPf/Giynj4/SUYlY4UJK25O6FbAQ5Ss3jT8DSntgejVM4vfLCPgh76CmU+xo+N2mv
         A9Vabjz1LK8tKHKP4NBF9q3Kp2M/ns95B6PmdqCAB6TUSjCBz/jrZU2NBQiempGzqHnV
         ZvqoljAsfutbrP7Q5TK+cqMEJqABVL2VDqxh55v/nvNol+YMfdLHTzvArkFw76ICbhFd
         3bAq956xajHHApY1I6rKMHrLS8dQeOgxsiyBpYMMJ5lhuzEjVzv1E1g1zSv0uOasjpF7
         e+YC9Zq5PR3QiJ5WB1tO3p64C26oWR6CVhU5ShoZefXv95+36WrabgbmmUBkUwrOCAAZ
         FC0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sxyGm26N1qjAhfVKYZO1lt228h3VMsDm3JuJekK9pf8=;
        fh=UGYaF3nkGhc173oFXQBr6FRBgp8t5zsLH94c1G08/Wk=;
        b=k0rbjfVRy4Sbs7yoKHR1XSXFXEYkaQXECC+GXP52RNX/DKVOB+Y5Pur2RbeClJc7oP
         ulVbcjmKjUA22UsDXi0rAGXVHkI/HbW4sLqELgNazdxKMPzPqr5xcbcIz/HY2kQNH6HL
         ZqxRYud1+kNKaahmkFxzAyA8ykprQMnAYly3EvUl+B5ptd8g7KKDkDvLuLsAtbUpI6P5
         y7BST2S31z1gaQoQiTBH3Bc0Eud8vCXzGfsqeBweCWjNzvLsQyMjEN95Gi0ygtsglgDa
         ETcVjpog0cJ3FOcEVe+32SOIGmiMA8iepYynUC2LX2G7I2DQSxgx4FrZhi39VimpOV5J
         Kvxg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783581772; x=1784186572; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sxyGm26N1qjAhfVKYZO1lt228h3VMsDm3JuJekK9pf8=;
        b=Vd3AGBI/uCfqbjC47ExRHHFSSrMsQLGEbAYtYPbt7dN61PND380rqIAKyKoMap9tIr
         qFimIViZxz78rWmghWIpHNIY9dPaTVHmW4woAYJ02R70sxnAQ3YHl8GanIRwCYkS7w62
         oJ9MD0grulnBHnzwZaXZd/UOAR1J629lyNF6j8tM7ok8zbaSvLX+FIUomYQz1MgvYTVD
         vsULFjo5D61Wpe1HPzL6kuEK1VJ7W1S+G7zgqfjFbZFiHoubLHjV9BUtdrZZx05ad6DP
         hzBZrZLqG/kfYAdf2T+TG7isxtHhB1SROcZ6IdckuxzHiVYce442VgODHRE70A6/+chh
         ZqoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783581772; x=1784186572;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sxyGm26N1qjAhfVKYZO1lt228h3VMsDm3JuJekK9pf8=;
        b=UJrVxgQ9ObqCeJ8MwkArDQDf0EZ+i6jE9XsSHRcDQHx3oadSzk9tdxzU8WXmZUJOWa
         ArN///6OL9gJQW466KP/fySWBvPZDj4c8/SSXT4tvNDj42BEvGqXaLYFIWekov083mOU
         BU/Bj/C2G2WhnmwvBo5Clq/HIv29qxr+nzP7yGIwO3MlieUQCJpUsSMj2NEWNK+R42dj
         JKFvOF9eQ8GFSPPzEvTQe4YqtzZRKei4Lk3Zj5eWu0WC7HZHbOrEhCqglI9VaiTEaUsS
         hFLE44in/pm8QkogZacaXOSB4zQ5eUjuWBNNuLrJ7Cz5/pWu/oy/DEEDDzgA+IDKxWwy
         78CA==
X-Forwarded-Encrypted: i=1; AHgh+RrUruI+WDfpM6YwOKogsu0Sp0ZWXS9GAkfwzumId/WgE6J7UpoUsLEWDdEb/4d5YW4ZMdm2Ezzwjaap@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2IuOiqGiAzMF7517ZerOkxrztDS4cAodtSMbMySC1S8I6yBK1
	mz7hBLSdPDLK/ZJdLIJz4nbFslGp33hxl1GM3ykuw9xSYtLFE39bOMVmbI1Zgve/6xiO6jUI/1p
	lrdpanMetQzA/bbe818L6ssmvrKlsFm0=
X-Gm-Gg: AfdE7ckPVU2U5oMS1PVjP2fCuMZ1Bcu8mS5P9owmXBpngXUQxxHJoQxYctFdjAxRYUb
	4lvGEF/+1VW6vXf0ddXT414rk1qgfwhsWo+hLRelH3BAGnKvYr+ubKZXbXZPMo1bEuh1bhIBSeg
	wyFoIME5k0g8iFMJ0QzoblblFFJuGkG0X0IEs03OXNfqSyBpWGpURt7li4Ld9/TBpUtceU+iphN
	kPo8lubEOpi+zVH+Y21BHwdf1Rl5BAd8KAxK9swDv5y7Q5l5cr6JOGaWD2ZXhC5J0uhggamwA==
X-Received: by 2002:a17:906:6a15:b0:beb:d461:7b09 with SMTP id
 a640c23a62f3a-c15e74474fdmr69932566b.11.1783581772023; Thu, 09 Jul 2026
 00:22:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260707122701.751878-1-fredchen.openbmc@gmail.com>
 <20260707122701.751878-3-fredchen.openbmc@gmail.com> <f9e32dd1-7c2c-4055-83fa-94683777e30b@roeck-us.net>
 <ak4QO9uhKOt68dl1@nsa> <20260708-true-carp-of-champagne-a0dcca@quoll>
 <ak41BRQBNdsQrYww@nsa> <b2a5e99c-6d4d-454e-8ecd-8638e4dc0ddb@roeck-us.net> <PH0PR03MB63512A19C32B7722D17D0FD4F1FE2@PH0PR03MB6351.namprd03.prod.outlook.com>
In-Reply-To: <PH0PR03MB63512A19C32B7722D17D0FD4F1FE2@PH0PR03MB6351.namprd03.prod.outlook.com>
From: Fred Chen <fredchen.openbmc@gmail.com>
Date: Thu, 9 Jul 2026 15:23:55 +0800
X-Gm-Features: AUfX_mwHN0qjb5l6G7Ei5hODszmeESynskEUV0pbmWdBSl0w574p6cMqhnzJh7Y
Message-ID: <CABOy65_GqKiZLM+soZUK_34T8MYZS3dRX38-CMf_Bd1EmG0jhA@mail.gmail.com>
Subject: Re: [PATCH 2/2] hwmon: (pmbus) Add driver for Analog Devices MAX20912
 and MAX20916
To: "Torreno, Alexis Czezar" <AlexisCzezar.Torreno@analog.com>
Cc: Guenter Roeck <linux@roeck-us.net>, =?UTF-8?B?TnVubyBTw6E=?= <noname.nuno@gmail.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Jonathan Cameron <Jonathan.Cameron@huawei.com>, Wensheng Wang <wenswang@yeah.net>, 
	Frank Li <Frank.Li@nxp.com>, Brian Chiang <chiang.brian@inventec.com>, 
	Cosmo Chou <chou.cosmo@gmail.com>, Dixit Parmar <dixitparmar19@gmail.com>, 
	Eddie James <eajames@linux.ibm.com>, Antoni Pokusinski <apokusinski01@gmail.com>, 
	Thorsten Blum <thorsten.blum@linux.dev>, Ashish Yadav <ashish.yadav@infineon.com>, 
	Syed Arif <arif.syed@hpe.com>, ChiShih Tsai <tomtsai764@gmail.com>, 
	Abdurrahman Hussain <abdurrahman@nexthop.ai>, "Paller, Kim Seer" <KimSeer.Paller@analog.com>, 
	Colin Huang <u8813345@gmail.com>, Yuxi Wang <Yuxi.Wang@monolithicpower.com>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>, 
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Torreno, Alexis Czezar <AlexisCzezar.Torreno@analog.com> =E6=96=BC 2026=E5=
=B9=B47=E6=9C=889=E6=97=A5=E9=80=B1=E5=9B=9B =E4=B8=8A=E5=8D=888:59=E5=AF=
=AB=E9=81=93=EF=BC=9A
>
> > On 7/8/26 04:32, Nuno S=C3=A1 wrote:
> > > On Wed, Jul 08, 2026 at 12:50:25PM +0200, Krzysztof Kozlowski wrote:
> > >> On Wed, Jul 08, 2026 at 10:19:56AM +0100, Nuno S=C3=A1 wrote:
> > >>> On Tue, Jul 07, 2026 at 06:52:48AM -0700, Guenter Roeck wrote:
> > >>>> On 7/7/26 05:26, Fred Chen wrote:
> > >>>>> Add support for the Analog Devices MAX20912 and MAX20916
> > >>>>> dual-output multiphase voltage regulators with PMBus interfaces.
> > >>>>>
> > >>>>> Signed-off-by: Fred Chen <fredchen.openbmc@gmail.com>
> > >>>>
> > >>>> Please provide evidence that those chips actually exist.
> > >>>> Internet search comes up blank. I'll need confirmation from someon=
e
> > >>>> at Analog.
> > >>>
> > >>> Hi Guenter,
> > >>>
> > >>> Well, in fact I'm in the middle of preparing a series that adds
> > >>> support
> > >>> for:
> > >>>
> > >>> "max20826"
> > >>> "max20855b"
> > >>> "max20908"
> > >>> "max20912"
> > >>> "max20916"
> > >>>
> > >>> All the above parts have the datasheet under NDA. But before we had
> > >>> a one page "datasheet" in analog.com but I guess that is gone! For
> > >>> context I mainly did the base (core) driver for max20826 and then
> > >>> Alexis added the other ones.
> > >>>
> > >>> Not sure how to proceed... I can wait and then work on top of what
> > >>> Fred has but this patch is very minimal when compared with what we =
have.
> > >>> Like:
> > >>>
> > >>> * No regulator support;
> > >>> * No direct mode. The chip has two ways to access registers (paging
> > >>> and
> > >>> * direct mode).
> > >>> * No way to count how many phases we have or if RAIL_B (func[1]) is
> > >>> being used at all.
> > >>>
> > >>>
> > >>> Some other things more intriguing is that these chips, as far as I'=
m
> > >>> aware (at least for max20826), always have bit 2 set in
> > >>> ON_OFF_CONFIG so a gpio vout. Also we needed some special handling
> > >>> to read phase current which I'm not seeing in the driver. So I woul=
d
> > >>> like to understand how the chip was tested?
> > >>>
> > >>> Anyways, if Fred is ok with it I can just finish what I'm doing and
> > >>> send the patches. It would make sense to have something more
> > >>> complete on submission but I don't want to just "steal" the work al=
ready
> > done.
> > >>
> > >> Binding should be in such case posted complete, so probably not a
> > >> trivial device.
> > >
> > > Yes, in my series bindings are not in trivial as we support the enabl=
e
> > > gpios.
> > >
> >
> > Same question I asked before: What is your use case ?
> >
>
> Hi Guenter,
>
> Unlike my MAX20830 patches, for some reason these chips (not only Nuno's =
max20826)
> hardwired the bit 2 in ON_OFF_CONFIG to '1'. This makes the use of gpio t=
o enable the
> device a requirement.  (as of the latest info given to us)
>
> Regards,
> Alexis

Hi Nuno,

Based on the MAX20912/16 specs on my hand, these chips do not support
PMBUS_PHASE (0x04). Furthermore, the spec only indicates support for VID mo=
de
and does not provide m/b/r. Therefore, some of the features you mentioned m=
ight
be specific to the MAX20826 series.

Regarding enabling VOUT via GPIO, our platform handles this via the CPLD as
part of the hardware power sequencing. Managing this pin through the driver=
 is
not a requirement for our system.

As for the testing, I have verified that the telemetry readings for both Ra=
il A
and Rail B behave as expected. The driver reports valid data after system
power-on, and the readings drop to 0 properly after power-off.

It's possible my specs are outdated or that I'm missing some use cases. If
you plan to submit your more complete driver covering the MAX20912/16
soon, I'm more than willing to hold off on sending v2 patch.

Regards,
Fred
