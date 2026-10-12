Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C0E230D407
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 14:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791816069; cv=pass; b=DJyuR/nJH4lUx1TVrUe8Rem/8tS3vXks0qwpHMGa2sfcVPrqir7HSIlSn9I53kF8lBndXhZKN3gWH4qzwiqiCs4BNUkEx3P8QH+tVrEqfvCltxFcCs3BkXb8Mg0KYleYY+vGUEVRsxTEFVbLgCjop2uso730LmHNuXxUTruCUq8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791816069; c=relaxed/simple;
	bh=hVt+2VZkW4XSaJKirxsUTpM7f+JQAOjlXtbg/RMP49g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uEP4xgr8kLlGI8zF4w8OE4O6QPelkzUKE6tXuABuFOzTgE0oOtPs6qUdUl9YWB/Ykhj3mLUX/SG9YSVAcvrqsxnbYRWIcXPQssHn0kcFqsXXmfs37AG0EbiAb6sUCiaTKOUW0fhtlNPn7UZ1YvU+PcPOvyXedO/wWyXf7JdXMwU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=s5y9rFtV; arc=pass smtp.client-ip=74.125.224.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="s5y9rFtV"
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-6768403e9bbso1480859d50.1
        for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 07:41:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791816067; cv=none;
        d=google.com; s=arc-20260327;
        b=cOwuuihf7Lu/Atdm4isX9ag6PBUd7vKJLkbJvBGzVg35XZLmK2/ERJH/CCaGLkzJL7
         j0RxhynrVYxz6RzSo6sBPElz7tIXeRj2hM6O/t25ZmSGeihmM02Dfhi8H2B7UuwOOcul
         WTtsKFMA7PjPdmqd45acqeHLTexOVtYF8uCEvfLp5rLgyFQDBtMH95UfSQOvKQPHJ6yD
         qE0J83t1ocFOmGe5ALQnqUaCWk9drXuMFyGoLcibIcYz6Wq+c5Kn/ziFs2sUHEjak2/+
         NAP5UaJzmspnP8lq6oqTjW3C/u7+BswNym/5UFfptHXuMZwbZE2wD6fcUJCQau0ObWwO
         kLgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hVt+2VZkW4XSaJKirxsUTpM7f+JQAOjlXtbg/RMP49g=;
        fh=nmhG3x1MJdFUVpa8iulZJRAB83te6V6vXuUGeU5nlCs=;
        b=N+VC9Kcq0fq+v7QnccQgGQvA9/wziINrH3LckIUnzMV1IPiuMSi1pjai25GgsJjgcp
         Iom3NEfhSRoDv+wdeDH2gY3DrTI27AT9xnSg61ob6DvuiTCfjLZydiakvkIruFd3CA3G
         ZGzEio/0Rni34TDWiwmdYZVNQkHSde7I/ZgqPaOADyVh8EwFDiSq5CYP9LfWk4rLteWD
         N6QV+cVbq5kVuz2kV7+D2okCOrknjadHW5PVZ6Xmlv1+evd7frCAUq6uPvNc/Xbgr4C8
         kHK0QEs9SimjX110ixpt5gcpzBGh9+iUH/amDoT39eH9MpyvWEABBT7dUVAn0txmNYvw
         tdKg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791816067; x=1792420867; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hVt+2VZkW4XSaJKirxsUTpM7f+JQAOjlXtbg/RMP49g=;
        b=s5y9rFtVdUlUZVe2QFe7PNntJ4VD+CW25EMC4qcnLN3inOHGr44O1ZM3rup8DuohC2
         ys+6NgGIt+zSsWvhLJbMZmDdciyf2J8OsowHjubJTW2XQafjM2Xo2W75kDBf+I/qTBvk
         JLui7OW/dRXXM+ZSqj4R5zSmhjnvcwpqdQAU+8A5p55t+hClAv/uUySF2B56xJe/lr8a
         2JjrRTobJXDkDMYpBXKe3H2rK47bqm/XI97PH0rnIdxeVkxS6VyLdmpoMjat+2UT1W/N
         oKG0JF+VK4eTgckE+EDcica+UlHKGOZTe4kHsNa8CSGk8bICgMnq8kEvw/AC/nKMI5hA
         poog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791816067; x=1792420867;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hVt+2VZkW4XSaJKirxsUTpM7f+JQAOjlXtbg/RMP49g=;
        b=VpzS9XYosvoU6m+za/DlRIS5V4hMEYvttQpyGdojV85zAnYBmycpERPLfvlZJXJYRT
         TakIJitZb8Swo4BbfgGYQB4XCMGPJh3ZPk/h6Ae8ea6tINtr1iLXadAPFPA3UMkaUY/P
         ahaWBaYpyNF7Xp2KS4kTMOP4xEusOQ3ULgiC5AYDO9i6E79bwzNhdJitdUSPWxMEvLWB
         xJnuSKhef9VgH6F9ajWWenNh0aNm6mi2sF9PyfDfKQ1PxgizTujTTZq5wR3Wk7CIQ3TM
         o3lxfSCLPp7MtsubOBdKnEY04tmfo6NDR8ElGuoXJC55Bb7mKBAGUtoRCKYRxZFu5Yyf
         QNZw==
X-Forwarded-Encrypted: i=1; AKwUvBybqcx4/rULLCv28LtArOPcX+vh3yz/K+jqOZ6hM+pdL5HSaJEWkMmQXggfs9LpmaXHMxmyu6sIPopg@vger.kernel.org
X-Gm-Message-State: AFq9FYJIrFPFWB2ZjUbXBf1LG+WbN3z/R3DB4OldszaMbbS3YpY0J+1x
	QlTzpvKsljmnUZvxM1YRTLBx/r9OQWElYLH/aZ5bSteE2wxF/Gp8/0VcUW072tL8kT3W24jd9Bd
	mZ1RWVFNM+7Xgatx6OnFK1PRADnKn1rkuASoZ/BdJCFQuVJpfI+pBcVk=
X-Gm-Gg: AYBFou0PN4M6BWSnN40x9jViaHxieAC6WVe1+1j5tw99wqLU8TyJqBoHODLRDvYVfwU
	J57Ly3ROuLJDogjWJGhByBpVspuCMXDmOcHgZRp89sj7ttHUm6NKaiyaJL1rF2hlGlU7G4JbS8A
	cmguwnHo82R1vRSQUJghP7s3Dva0RSPTBuWIRdEKU/RXKwAfkgmBulT+xnjVadpP34YtAFhrelA
	10NOfE9bci6jVwSfpU7eeottv2H5SEDM0SYq4uCi8k/JMZVD8rJ/D72UlgHbUGbhHkv+Kag59oe
	gQNyTdHYJnWZIBBB10UA/W/6ynxeic/akqkwrtHSizj72HkJUsvd3G2tHOtvniNf
X-Received: by 2002:a05:690e:1907:b0:66f:b528:cc51 with SMTP id
 956f58d0204a3-6793698594fmr4322156d50.21.1791816067411; Mon, 12 Oct 2026
 07:41:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260727-sm8650-7-1-bonded-dsi-v5-0-c042266b9eeb@linaro.org>
 <20260727-sm8650-7-1-bonded-dsi-v5-6-c042266b9eeb@linaro.org>
 <CAD++jLm2dVVKM075MDoStTudO+2hdECS-XucFiMGnM1H-Xk=TA@mail.gmail.com>
 <CABymUCN1oxuqPi=s1cpBHvMJorHN62uieD8Pf=Y--WBPp-=NHA@mail.gmail.com> <CAD++jLnkr+M9Tn_zAL8+owO7H706XYSMosSz-1D20rwbUukQ3A@mail.gmail.com>
In-Reply-To: <CAD++jLnkr+M9Tn_zAL8+owO7H706XYSMosSz-1D20rwbUukQ3A@mail.gmail.com>
From: Jun Nie <jun.nie@linaro.org>
Date: Mon, 12 Oct 2026 22:40:56 +0800
X-Gm-Features: AclHuK8DXIfIQSpEn-02OXtKO750H1QIkJhmjnTnvXTflrGk6XkO0SctyamV-mw
Message-ID: <CABymUCNzxWhud1qtv3os=f2txZ=nrTdMrQ6BOYkbfK87D=AnHQ@mail.gmail.com>
Subject: Re: [PATCH v5 6/6] drm/panel: Add driver for Synaptics R63455 DSI panel
To: Linus Walleij <linusw@kernel.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
	Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Linus Walleij <linusw@kernel.org> =E4=BA=8E2026=E5=B9=B410=E6=9C=881=E6=97=
=A5=E5=91=A8=E5=9B=9B 03:49=E5=86=99=E9=81=93=EF=BC=9A
>
> On Wed, Sep 30, 2026 at 6:31=E2=80=AFPM Jun Nie <jun.nie@linaro.org> wrot=
e:
> > > On Mon, Jul 27, 2026 at 10:09=E2=80=AFAM Jun Nie <jun.nie@linaro.org>=
 wrote:
>
> > > If you have a datasheet for this display controller, then please add =
some
> > > one-line comments before each command to explain what is being set
> > > up.
> >
> > I hope I had datasheet, but the answer is no. All I have is an init seq=
uence
> > with the information in the above macro definition. Let just live with =
it @_@
>
> I would send the message "upward" that you need a proper datasheet
> for this, from whoever wants this to happen.
>
> I have seen from the presentation that you will be working on
> compensation for chromatic aberration for this device, and that is only
> going to have a point if the color representation on the display can be
> trusted to begin with. Which means
> gamma correction. (Which we don't yet support in the panels,
> but hey, another opportunity to be first!)
>
> Gamma is invariably going to be one of these
> "magic commands", at that point of depth you really need the manual
> to see what is going on.
>
> Yours,
> Linus Walleij

Compensation for chromatic aberration can be done either on the GPU,
or display controller, or by panel. As long as the R/G/B channel
can be processed individually, that's enough for the aberration. I will
work on the solution with processing inside the display controller. So ther=
e
is no dependency on this specific panel.

Jun
