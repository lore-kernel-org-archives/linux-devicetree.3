Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 504FC2749ED
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 11:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784202933; cv=pass; b=DKDq4V686tKdtTSagG9m5Wb24BdZvz7p9qOf4KziR3hi5XcWGQL5kuFTJXmkYaev6jGpq30e7YJOx3FXlDmC1JAkeanM1p2KDHTLGyZfzvJPMr4cjB/jTGO3ApKIuHxR2XPRn06nhs6j484ByaI3CJrCkDHbVsDlPRh/n2bCyY4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784202933; c=relaxed/simple;
	bh=C96NzncbsQ/25PKJxsR427vDtbfGh0/AwS/xdfMx8Xg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HjyR5wOs5l/vcV0EETdqOsHiMTgioZEcv+Yv8FInywOT60wrnTP9Zf0McaMtkJUT3myfRTBMocj5DKuWIqEvftAlqOnNAXXvLBSIczb9Ca+mD0hC6mvK1sz/dMiEEHgIocgtDyLo1PXePMOqKRXDWIUGCpT6xPT0NcyXcHC+ppM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YiudG+I2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RYfDUPas; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YiudG+I2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RYfDUPas"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66GBiR8L2754564
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 11:55:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HkI07VOyyD1qjY3yy4oGy1PR0IC6S/eabYgXTFOgS+g=; b=YiudG+I2F1ZQxgZx
	4N6qfruU4OF2hA2wyVxhqfkKGvoLahO1KV2unqq18ca4FbN3VGsj3H26W7oPmV/r
	ntAgChfzQk8iH5qx5Il3dsmmMpD7n8bfyUw+XS/wCDAG7+xex4m6iVcoswaK3G1w
	gfaxppW5UM9uxEM0IMir5GZjLaH6hyYlrbspV/+fBLCzZtGqhlXJY1eG54nDCY7m
	AXCPgby3moriOiMOcF7ijZIKXpMMhEmPnSKlBNIfku2dWVJJKnvjTJPp4ijQ7f+n
	r/RnCcHfZY/MWXhgHHO8pkBzZ2qYiliIZFbaMBgfbIjmVkP9uBas28d//K25ES5l
	PFavxw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4feu10922k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 11:55:31 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c26012cd0so104747591cf.0
        for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 04:55:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784202930; cv=none;
        d=google.com; s=arc-20260327;
        b=naF9Gz0qsHo9A/STt1ELEktT4a9JhVMU5XloJbhp+r4fMf988JERJe2oFgfRCf2vSo
         fKUayLV71nfkjQry/d+5Z/QRQaDgWJiE6UtzlW839vHUDWni2+0+VucsXDDWUQKa7D5n
         DcV0/eGjDfva9i9B5y60L5cG+uxhdo1ZorTMnLpDFzRK2cUtd1x7/6KgEeTEnGhzzAZe
         rufH+H9FOBcqbz4IbrZ2zCwG8C6kGZh9pxq7TtZ0rxOSiZxN11WVbGRNfiQaV2kQxYyK
         U23GNAhQVQwNj6lJ0ykiNsk5F5I+7w430D4Oz/1zFMieDvyNGF+Gank/7QOUy0M5FoFb
         9BNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HkI07VOyyD1qjY3yy4oGy1PR0IC6S/eabYgXTFOgS+g=;
        fh=2sEuNKLukFvfL03CHbAnmwAQORhX/iTVmsoPfAckWEY=;
        b=MVqiIo4j2YvzJfCRv9CnN/sIwZE6p3E1l6vYsBqTRcac8Wk5rqAVm5RWMUjKNuBPeG
         IWYa0LfeJWZS6ZEW7cACLyOESp0300PF1TT8VicMLwZ5b+7zcdZISeB039rohmElN0Lf
         67cohqzlbs9/jtjsv5hwLqJsyi6CEjBFukASWrSj5GzRbKIfs1th/TNsOaun+uPfCJGs
         kRPGdXPjh04MK7O+99qrfvby1WY146SYKXK6xC1Ropj/9R9ZClHeWZgMlwDZziZtIf1P
         GM0RPwP/H4djWX+U1Csgz2F2zn37m63kV1P1l4sKCBM2eRHwrir5/rM5an/VivhajJCx
         tmDg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784202930; x=1784807730; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HkI07VOyyD1qjY3yy4oGy1PR0IC6S/eabYgXTFOgS+g=;
        b=RYfDUPas7UKfaqmw9BD9msspk3+8AXF04+yX+Qx7wvYvkIY5zIDaICZHnvr0uvtbZ2
         uH7XeuVZba10mY/49ZZKm676H3203Amiz5YN1Nn7Z8A2a4YSduOUHWq+4nN8y0M55dEO
         CEG+RtQbOwb4S7y3NUE8WPvFKF61Hx/kGa+Gy+8Ez3VjkXmYBnamz0TMH4OdI5pAFlqt
         ENluPwCBuvbLrr5tDNA7aEaZBVjbzNLniiWZ+QVbsk5YLfX8stN7pAf/ttmUlVZlarhh
         qnItn6oS80LLRgvjlaTPhStjaRo1yZ8SgT6csZE2kvAEWsopLsDujyUi7Ou6g9d/0g9j
         XKkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784202930; x=1784807730;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HkI07VOyyD1qjY3yy4oGy1PR0IC6S/eabYgXTFOgS+g=;
        b=Fjqwn8OqOTapjDKuy/ZhT4Cv+HgQnMIozehoMVeII1e4XK1mSwKxdFSMvj3fsd6Qnk
         UT3UrgF5SCw2hXK6sJJYo4xcvfybnYLgBlU+Be41RRHmULSODCkYF+sXZA7SUU2g85IQ
         OqBo+HF6DR95F1hqhy+d5DT8M3u/YSwUi0RshkQaLxisf9Ubvv+iOJXoZ4EGVTe+b854
         Bw5GYVV1/+tPoASqgCTol0TnygfN6JYuUo9boxH+tzqfhpsCza84BchyZ47F1HLTAnGS
         rsL7WaNOsH4cNj1BHk9SWG9EGM+vfzh8orVSq8tEEY5iVYNjPWvnmM1WKxAexBqb0B/j
         +WEw==
X-Forwarded-Encrypted: i=1; AHgh+Rp4GoPR6q3kr7mOUzZutNNtJ/s4wAtHfSObw/n5rb2eFldAxo7DfDu20URDmEERRpgzQnhbT++3ePyV@vger.kernel.org
X-Gm-Message-State: AOJu0YyKyBivuW1olKUuW02JCIqPfDoQ3kbipxsu5g9gPrmYdUO8tl9D
	KSgKXmckihQyXBgJ8FcsJ0UZTrVVx64QMJScxetKkPsmqDXx7iHhiLicbUOhrmNAe0kWREvQY9l
	fkewg74EZ909kIy7C8WxINoTQMa1QPypPNGW25VFZ2zL2PYZQMeNtdWXXIEzAo9nBsUO4mIKiSy
	tiwxYfMO2QtMaV6b9Lh6Ki3lbyf0yFZ0bkn2HGaA0=
X-Gm-Gg: AfdE7ck7DlU8UPalgJrsP9PfvupKFOtrGo/qPYv7pM0Q1CdT+Deb0ol1PFq2zS3eDPh
	LMlBsBZD1CSW0yG2hWfHzk0hT6MtcZn0fxP9Nhr+erF4u+3WYKr1g++frGMM6VxOCu+sE2C4PpO
	sPKzmFVzEJWORu+d+rZjiEcWQj1eNKVZDWJYku0caAbp4BKDR0apBeauvT8g==
X-Received: by 2002:ac8:7d0b:0:b0:51c:b900:5136 with SMTP id d75a77b69052e-51e4ecca047mr71644401cf.0.1784202930457;
        Thu, 16 Jul 2026 04:55:30 -0700 (PDT)
X-Received: by 2002:ac8:7d0b:0:b0:51c:b900:5136 with SMTP id
 d75a77b69052e-51e4ecca047mr71644011cf.0.1784202929904; Thu, 16 Jul 2026
 04:55:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1783505142.git.geert+renesas@glider.be> <23f979b0903ca11513ac339ab8b6dd40435603c5.1783505142.git.geert+renesas@glider.be>
 <CAPx+jO-=LF9CvYDrC3O_GBtfHU6GYvq524OLmTG8R1-u27oyKw@mail.gmail.com> <CAMuHMdUAwxs50S7hwWRsSmtRagD7Gu4rodGund4k3r1x1+A5ug@mail.gmail.com>
In-Reply-To: <CAMuHMdUAwxs50S7hwWRsSmtRagD7Gu4rodGund4k3r1x1+A5ug@mail.gmail.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Thu, 16 Jul 2026 13:55:18 +0200
X-Gm-Features: AUfX_mwNMY8bmSOOoE3tn-LA0Fojd6Jz_KE9ZsYKsw02nHYdKrjLLMH4z5Iwnas
Message-ID: <CAPx+jO9aajD9eFTEUdAFOO-wC5NduaYhbDmYw5DHeFj92Fmd9A@mail.gmail.com>
Subject: Re: [PATCH v2 4/6] pmdomain: renesas: Add R-Car X5H MDLC driver
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Ulf Hansson <ulfh@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Marek Vasut <marek.vasut+renesas@mailbox.org>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: FNlA7dQuHC8TJfU9iA208FB5544BREwM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDEyMyBTYWx0ZWRfX/htn74cFa03w
 GUylN+c3AMRH3ADM6Lhf0NkFgBF1bzhSuBT9jB4oMtZEzcrj6BeR2IIL8jyG9vrj4O611vt4u5b
 A7ChDEx4ifYOO1kqCYt75BpsA07hb+hntFYkZ09LBe2ieRyIfOSQBYK7ZLaEeT++QdJ0A1JwAbL
 sqPf8tA2AF26oxD8ACQDioRhnq+tOwcOLAnhZ2fzrb27lbfymbZCya0NgkX1Ck1o8I8swYbo3Ez
 HGW4tx40TBpAdh5AGya+Bm82bhUv1Rcw5FrTFrwejBkOnLRahfEb/vu2DyffT0Ud3Ezhq7wM8DK
 v4mWWNR1Kng8H3IuoPPYn0IqXHhqbQF6gKhqr34Sb7WbWW9qTtp6vjFsMGr0HKt3e2ZFD/KjAI1
 RdtZj8xUj1eH0fGZGmEdMMHgG1igIq8oy6jyz3M1dUGW5bTDxJmatCCfruI4PlLNOe+bAmKL3Un
 SLoXVdeoVI2uVngAqzg==
X-Proofpoint-GUID: FNlA7dQuHC8TJfU9iA208FB5544BREwM
X-Authority-Analysis: v=2.4 cv=BPODalQG c=1 sm=1 tr=0 ts=6a58c6b3 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=tBb2bbeoAAAA:8 a=EUspDBNiAAAA:8
 a=AEl4uQJCqG-skdcfchQA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
 a=Oj-tNtZlA1e06AYgeCfH:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDEyMyBTYWx0ZWRfX/5g6qOGGOCkB
 ReLHVSbS9Mqub3OvkahbIItrR7IqbjC7kQJD3Kf7TAPR6QXzgoQRyc6uik+F68W16v+6kk6yCy8
 ZmZwZoPpGeRfK4wK6CIJyWsLrs8KFRQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_04,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 priorityscore=1501 phishscore=0 bulkscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160123

On Wed, Jul 15, 2026 at 11:11=E2=80=AFAM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
>
> Hi Ulf,
>
> On Tue, 14 Jul 2026 at 14:04, Ulf Hansson <ulf.hansson@oss.qualcomm.com> =
wrote:
> > On Wed, Jul 8, 2026 at 12:15=E2=80=AFPM Geert Uytterhoeven
> > <geert+renesas@glider.be> wrote:
> > >
> > > Add a minimal Module Controller driver for the R-Car X5H (R8A78000) S=
oC.
> > > For now this just supports the always-on power domains, and dummy clo=
cks
> > > and resets for the serial console (which is enabled by the boot loade=
r).
> > >
> > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> > > --- /dev/null
> > > +++ b/drivers/pmdomain/renesas/r8a78000-mdlc.c
>
> > > +static struct generic_pm_domain *r8a78000_genpd_xlate(
> > > +                       const struct of_phandle_args *spec, void *dat=
a)
> > > +{
> > > +       struct r8a78000_mdlc_priv *priv =3D container_of(data,
> > > +                                       struct r8a78000_mdlc_priv, ge=
npd_data);
> > > +       struct device *dev =3D priv->dev;
> > > +       u32 id;
> > > +
> > > +       if (spec->args_count !=3D 2)
> > > +               return ERR_PTR(-EINVAL);
> > > +
> > > +       id =3D spec->args[0];
> > > +
> > > +       if (id >=3D R8A78000_MDLC_PD_AON) {
> > > +               dev_dbg(dev,
> > > +                       "Mapping HW power domain 0x%x to always-on do=
main\n",
> > > +                       id);
> > > +               return r8a78000_genpd_always_on;
> >
> > This looks odd, but perhaps it's just a temporary mapping that you
> > intend to change later, no?
>
> The hardware has multiple always-on domains, but on the software side,
> using only one is sufficient.  When needed, it can be changed later.
> Other domains will be added later, in the else branch.

I see, perhaps add a comment about this in the code, to make this more clea=
r?

>
> > > +       }
> > > +
> > > +       dev_err(dev, "Unknown power domain 0x%x\n", id);
> > > +       return ERR_PTR(-ENOENT);
> > > +}
>
> > > +static int r8a78000_genpd_always_on_singleton(struct device *dev)
> > > +{
> > > +       struct generic_pm_domain *genpd;
> > > +       int ret;
> > > +
> > > +       guard(mutex)(&r8a78000_mdlc_lock);
> > > +
> > > +       if (r8a78000_genpd_always_on)
> > > +               return 0;
> > > +
> >
> > I guess the mutex is used to protect the global
> > r8a78000_genpd_always_on, but it looks like that isn't really needed
> > based upon how things are being called during the probe.
>
> Why would it not be needed? There are multiple instances of the MDLC
> device, but only one instance of the always-on domain.

Aha, I see. Thanks for clarifying!

>
> > > +       genpd =3D kzalloc_obj(*genpd);
> > > +       if (!genpd)
> > > +               return -ENOMEM;
> > > +
> > > +       genpd->name =3D "always-on";
> > > +       genpd->attach_dev =3D r8a78000_mdlc_attach_dev;
> > > +
> > > +       ret =3D pm_genpd_init(genpd, &pm_domain_always_on_gov, false)=
;
> > > +       if (ret) {
> > > +               kfree(genpd);
> > > +               return dev_err_probe(dev, ret,
> > > +                                    "Failed to create always-on doma=
in\n");
> > > +       }
> > > +
> > > +       r8a78000_genpd_always_on =3D genpd;
> > > +       return 0;
> > > +}
> > > +
> > > +static int r8a78000_mdlc_probe(struct platform_device *pdev)
> > > +{
> > > +       struct device *dev =3D &pdev->dev;
> > > +       struct device_node *np =3D dev->of_node;
> > > +       struct r8a78000_mdlc_priv *priv;
> > > +       const struct mdlc_info *info;
> > > +       struct resource *res;
> > > +       int ret;
> > > +
> > > +       ret =3D r8a78000_genpd_always_on_singleton(dev);
> > > +       if (ret)
> > > +               return ret;
> > > +
> > > +       info =3D of_device_get_match_data(dev);
> > > +       if (!info)
> > > +               return -ENODEV;
> > > +
> > > +       priv =3D devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> > > +       if (!priv)
> > > +               return -ENOMEM;
> > > +
> > > +       priv->dev =3D dev;
> > > +       priv->np =3D np;
> > > +
> > > +       res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > > +       if (!res)
> > > +               return -ENODEV;
> > > +
> > > +       for (; info->base; info++) {
> > > +               if (info->base =3D=3D res->start)
> > > +                       break;
> > > +       }
> > > +
> > > +       if (!info->base) {
> > > +               dev_dbg(dev, "Unsupported MDLC instance 0x%pa\n", &re=
s->start);
> > > +               return -ENODEV;
> > > +       }
> > > +
> > > +       priv->mod_map =3D info->mod_map;
> > > +
> > > +       scoped_guard(mutex, &r8a78000_mdlc_lock) {
> > > +               hlist_add_head(&priv->link, &r8a78000_mdlc_list);
> > > +       }
> > > +
> > > +       ret =3D devm_add_action_or_reset(dev, r8a78000_mdlc_unlink, p=
riv);
> > > +       if (ret)
> > > +               return dev_err_probe(dev, ret, "failed to add action\=
n");
> > > +
> > > +       /* Note that no actual domains are registered, just need tran=
slation */
> > > +       priv->genpd_data.xlate =3D r8a78000_genpd_xlate;
> > > +       ret =3D of_genpd_add_provider_onecell(np, &priv->genpd_data);
> > > +       if (ret)
> > > +               return dev_err_probe(dev, ret,
> > > +                                    "Failed to register genpd provid=
er\n");
> > > +
> > > +       ret =3D devm_add_action_or_reset(dev, r8a78000_genpd_del_prov=
ider, np);
> > > +       if (ret)
> > > +               return dev_err_probe(dev, ret,
> > > +                                    "failed to add unregister action=
\n");
> > > +
> > > +       priv->rcdev.ops =3D &r8a78000_mdlc_reset_ops;
> > > +       priv->rcdev.of_node =3D np;
> > > +       priv->rcdev.of_reset_n_cells =3D 1;
> > > +       priv->rcdev.of_xlate =3D r8a78000_mdlc_reset_xlate;
> > > +
> > > +       ret =3D devm_reset_controller_register(dev, &priv->rcdev);
> > > +       if (ret)
> > > +               return dev_err_probe(dev, ret,
> > > +                                    "Failed to register reset contro=
ller\n");
> > > +
> >
> > In some of the error paths above it looks like we end up leaking the
> > data allocated for r8a78000_genpd_always_on. Perhaps clean up that
> > somewhere here.
>
> That is intentional: the always-on domain is shared by all MDLC
> instances.  If one MDLC fails to probe, the MDLC instances that did
> succeed still need the always-on domain.

Okay, so perhaps we should add a reference counting of it, to make
sure we don't leak the data?

>
> >
> > > +       return 0;
> > > +}
> >
> > [...]
> >
> > In regards to the merge strategy, I intend to pick patch 2 (shared via
> > the immutable dt branch) and $subject patch. Please let me know if
> > there are any issues with that.
>
> That is fine, thanks!

Great, thanks!

Kind regards
Uffe
