Received: from mail-ej2-f10.google.com (mail-ej2-f10.google.com [74.125.228.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DE7E3314C3
	for <devicetree@vger.kernel.org>; Sun, 13 Sep 2026 17:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789318945; cv=pass; b=M/jq7tzVk6iFQ2T/Lkmd5SxcqigXYz95tCZ0cC8zPTJV/KyhuL/T6FmR59tKO3g34Oh8QrV/LdCcivIR5fr3+KXo8gejksyAtr0NChHCZIFGWu5XBtCMmwCPng4zHN1kY0/y+RZRp74zez+SmY5UumSS5MHux2vn0+GedfbPZ7s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789318945; c=relaxed/simple;
	bh=7MqM8rpLnr5z5TUezX4PbEFSVD8MDXRA61Xn6G8NOHk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qAr+v+qHtFJlRtTpN0AwQhdvTsGFkHs3vG4G6lnryeZ29PR25+LBB8Cw6HHIl2jT+KUIWlSlnLRaG+9UUAGA7GAYC0cohpiGdp3xr9J7URuAiCXsp8X4Y8Imk3e6+/HYa5mslTD6CrfjVa/nDWXe1YoJwl7dEFjsD66fyDGYUPg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UM0ptPON; arc=pass smtp.client-ip=74.125.228.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UM0ptPON"
Received: by mail-ej2-f10.google.com with SMTP id a640c23a62f3a-c25b4493edfso113140066b.0
        for <devicetree@vger.kernel.org>; Sun, 13 Sep 2026 10:02:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789318942; cv=none;
        d=google.com; s=arc-20260327;
        b=JReRaqvgE22ba1TAn+MioNNXdQQ5alUaa+m5hbAvnhG37QuJT+Nzp5lxiGMvzTOGTN
         tGBjMtvBDZSSGR9ac4y0eK7xA/Vjtb7tSBfjMfslB9FNLP2ao6MGd+EM/YbGpAogowPI
         DVruMbjgvF0eUxpIyoHW6x+Tf5+FyO2gJK7RhX9KtIRDBR17LxxYs2v0GdfgX+diGKI0
         EqlrWbY5SJ5mZ5EIT9PjZlymluxX/NfdEuhs3+jlHiCILapX+GPNZMvxCAYYI+wZNKNz
         ZNrghNlhj7Pthu687LbSyjVi9/pTNOQUpLzuUZbBlIeD0WgcTwQFL9EYULx4kEjSlRK8
         2OmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=u3r0lTRDt7dv1B8F+vm9KqEdZJPwpZEhR6NU+5nIfvc=;
        fh=LOVJbSBOp5gHozfoq/+Cdi2VdR04C8bBBA3OwiZRt9Q=;
        b=RIxDOEtAXNSJDiiWmH9JKxbS/ZmC2wH8zYbWozUMynzyaMIzfpLmTUbzQcOEZWE9n/
         P1pNH1Qq4VmJGCidx9omHNAnGnHBWhtpNn4oJaIpDxX3sJjn9l5SH/zCMF47zuYR1UK5
         Cce5AJML9I3JXpYBMJMfcpUcXQ1kTbzTsBw8EetLpQr7a+XR3og1s5tLWBwnv7cXCbs1
         rH7PqP4O7eIk0qKfiEX7S4mkHkjnngBqZYfqPM3UgG+yXBqkM+u73tF+pkn3AHjmHSqy
         1DvaOYAlWcpAaEAntlZNwCHyvpc/bPYfvuZoW42sCEW703FEzCyH/RDxyRJPp1ZD2TK6
         xb/Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789318942; x=1789923742; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=u3r0lTRDt7dv1B8F+vm9KqEdZJPwpZEhR6NU+5nIfvc=;
        b=UM0ptPONBQMO5goxYbzGNyfVjwRAsS+wB3+Ewll1yzpUZ3FMm76mFjI4lwGrWpL/30
         4QkgTi66KWYM+bCq9JndYzu8hO1mFnkVCQCONAEf2CBF6mFlIpwHlXdEvIIqlzb0PIip
         IlXs9AiE0Qj94sEI4hLT3ae7JvS2Qvlc0umGZPlGQIJr10r/R3z6tKJJnhRkACiO2iHU
         NYXN1CCPdpKKYoTZS8guHONJyC4DpnAjYBCsbID/xf+AhQcFv8wMVRTQlLXlPaBSnLZf
         AO6+u+I13Sj6AXGU6NQPuFKq6zYhg1H8oRG4I3WDyfj4M4mF22UK77vTxu+G2nQl7/cz
         LF2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789318942; x=1789923742;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u3r0lTRDt7dv1B8F+vm9KqEdZJPwpZEhR6NU+5nIfvc=;
        b=iBf0I5Bs2rvp9aEMrrpKzyDNIOpi9R3YQuVWzMKgOxitSZ5I8gElpLazBhTBOmFqX/
         ygPVLZhQ+1vYaC3oRTrE8Bm+oPnK0qo4GAjm2vn+ovMHHCJFVFwwQU/+Rvc5rkjyiptR
         eaZXhkhLz8Ha/VrcvWo/dAhlL7hBiR3eBEOo8xVvQ1Xcz/2PdXr8X6Xphi4T9fJxK7Ia
         jbv7Eqxb5rjkmc97PGEPKr17Fl/xycynqrnCNe5ejzoqhH8EPFOPFD8Le1SK3QzATrJv
         DsSbh6+HcK1NAXx6j6GYCtdHxowkP27GmdJOLA23ULvg7VQF798fcGzTfUD0y6OnMogY
         Fm/w==
X-Forwarded-Encrypted: i=1; AKwUvByaCPeMzSadHBdy0eXRwNO/Ac0FzWbtuotPYAz581y1Jm4VvwxP+8d/uFchjaoErp9o6jlVpkkAfk2M@vger.kernel.org
X-Gm-Message-State: AFuF++nRUgyI+WPN40Ej3BEGLFg0R5ZpkYNbT5h41YMZsRViXKnWndM9
	yi/Q+FrhG1OcWb5JSMdT0T8IIBMTQUq/q6diL4eaNpVnFZm9YT6hTJ502ChFDs2eSDepFIwE8uB
	2KhdqpWZz1zdQSigT5kCS/BGMEwFDlIk=
X-Gm-Gg: AYBFou3usJOuR/oJrRL9FAA5A5vtPd2pnoWBCIjY44HxGLWl6+dr7OjevkcSXHl308i
	ri2m/F22LnZpjGx5jMcyxi6BCCbdl8qtZsswDUiQZMRsT1gBqW7fjjgnnwD4PDgnw+w0J1J85sm
	tM+I4b2BmredlQstrrSauxjpjq4CFr9yKpg00ykI8v0x6nqIOh9CS0qaCY3UetTG/2c2y6OmAev
	Lr3B97bQyqpEvlNWSvQaW+ZCW49OZo45wilFv8w+C+gRkAQ6Jvsb76HPd7G9TCn/7iz5GBMUxyt
	O2Ke68CN+cteyxHSnTEf1m/aEHdMzIvjUsZFPTXWH3MT6bG7J280TCDFLg==
X-Received: by 2002:a17:907:72cb:b0:c25:8c74:71e6 with SMTP id
 a640c23a62f3a-c2966537005mr646354966b.10.1789318941762; Sun, 13 Sep 2026
 10:02:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260907153713.2572547-2-coiaprant@gmail.com> <20260907153713.2572547-9-coiaprant@gmail.com>
 <20260908154108.6864E1F00A3A@smtp.kernel.org>
In-Reply-To: <20260908154108.6864E1F00A3A@smtp.kernel.org>
From: Coia Prant <coiaprant@gmail.com>
Date: Mon, 14 Sep 2026 01:02:10 +0800
X-Gm-Features: AcwNN1XgtcPUOC2eP2OxkBkMdRnvIa2R9l1DdLogBuRgiStmD3sxsfDlmW79idI
Message-ID: <CALj3r0i79sWnhyQU2xmECexi8G2VaznVOHWnuzdw+h9AzeKNSQ@mail.gmail.com>
Subject: Re: [PATCH net-next v4 07/10] net: pcs: xpcs: add Rockchip RK3568
 platform glue driver
To: sashiko-reviews@lists.linux.dev
Cc: olteanv@gmail.com, linux-phy@lists.infradead.org, 
	neil.armstrong@linaro.org, devicetree@vger.kernel.org, robh@kernel.org, 
	vkoul@kernel.org, conor+dt@kernel.org, wsa+renesas@sang-engineering.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<sashiko-bot@kernel.org> =E4=BA=8E2026=E5=B9=B49=E6=9C=888=E6=97=A5=E5=91=
=A8=E4=BA=8C 23:41=E5=86=99=E9=81=93=EF=BC=9A
>
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
> - [High] A Time-of-Check to Time-of-Use (TOCTOU) race condition in xpcs_r=
k_create allows a concurrent unbind of the supplier to free the MDIO bus, l=
eading to a Use-After-Free.
> - [Medium] Incorrect LIFO teardown ordering in devres clock cleanup actio=
n violates proper device initialization and PM hierarchy rules.
> --
>
> commit 7142dbf6b28b5ee94d0edc969bcf16d1183a5f41
> Author: Coia Prant <coiaprant@gmail.com>
>
> net: pcs: xpcs: add Rockchip RK3568 platform glue driver
>
> This commit adds a platform glue driver for the Synopsys DesignWare xpcs
> integrated in the Rockchip RK3568 SoC. It creates a virtual mdio bus to
> translate mdio operations to apb3 memory-mapped register accesses.
>
> Link: https://dl.radxa.com/rock3/docs/hw/datasheet/Rockchip%20RK3568%20TR=
M%20Part2%20V1.1-20210301.pdf (Page 2078)
>
> > diff --git a/drivers/net/pcs/pcs-xpcs-rk.c b/drivers/net/pcs/pcs-xpcs-r=
k.c
> > new file mode 100644
> > index 0000000000000..68bcaa1a5cbbf
> > --- /dev/null
> > +++ b/drivers/net/pcs/pcs-xpcs-rk.c
> [ ... ]
> > +static void xpcs_rk_exit_clk(void *data)
> > +{
> > +     struct dw_xpcs_rk *pxpcs =3D data;
> > +     struct device *dev =3D &pxpcs->pdev->dev;
> > +
> > +     clk_disable_unprepare(pxpcs->eee_clk);
> > +
> > +     pm_runtime_force_suspend(dev);
>
> [Severity: Medium]
> Does this sequence result in the clock being disabled before the device i=
s
> suspended?
>
> In xpcs_rk_init_clk(), eee_clk is enabled first, followed by a call to
> pm_runtime_enable(), allowing the device to become runtime active. During
> teardown, pm_runtime_force_suspend() invokes xpcs_rk_pm_runtime_suspend()
> to disable csr_clk.
>
> Calling clk_disable_unprepare() for eee_clk before pm_runtime_force_suspe=
nd()
> violates last-in, first-out ordering, disabling the prerequisite clock wh=
ile
> the device is still considered active. Should pm_runtime_force_suspend() =
be
> called prior to disabling the eee_clk?

Sure, I will reorder it.
