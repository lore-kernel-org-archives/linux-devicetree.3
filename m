Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C5303A1693
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 03:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774323758; cv=pass; b=nYV7Sr4mTOCaIVxyJ8i5lUsfWz2wFCt53Bs7Ta+W7lEKKoIrweWIcYisJZOunpmh5ybAQ+NUqzYYA0NHDEhCVgNOKHc6yL9Sny2Lqj5ZKn2bviLK11eBVdj9zWAjD+NZec2dzDips2IcoRA7kyOuoMD/TYmXwYLe1Y7CLZlGQGM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774323758; c=relaxed/simple;
	bh=X3n35LNNeF5Wx2GIr4g4uUmRoFWbzxVfDULULORcx74=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XSawnk/6wmcqA7/1xpxIBIg+Apjgxv4eHxHNyjGVscwa2rFZtcqDwPtUq+Qbk7tLnzvRSMIgC8C7TwIFOmOqOnZ+1IlS8BHnJLqqdqb9ypqehU10EohyJUyfBHGrTw638jwV/jqkgG/jW6OhB8E+NcFx7831OFLAGeRQ8IFJ25c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=lUoLDZ8q; arc=pass smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="lUoLDZ8q"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-59e4989dacdso4931558e87.1
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 20:42:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774323755; cv=none;
        d=google.com; s=arc-20240605;
        b=jL3N3VCO+NBEolvPfQ7ruplxK0zbqS08NsaoqAaVjky8Qb75NU/f6rIcF7BgqBAGkz
         V4+42tmFNSXPWk3nAVJnkKNP9yq5S0rGoPIDOYTaz276yZgvIfdJnaVO8N5s9+hKzkQN
         REorswf/kZrpEwb7FNbuf5U7MY3rRraWmXfqU/s46uwz4yUtV3R4BQ0/5D6N9znP6DcR
         we6LybrMyhmJjzrm/1pl9s4nwAXNieqMHP83c/GXVx8CL4Je95e+ihYGIziWF1iBBosc
         sWGO6f2jTu3bNJPe6TYoWTFNlhWrVTPK7IBFNGT4G00EHxnkT1wcsRNlqJ/1mvTaRE+h
         8Edw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=X3n35LNNeF5Wx2GIr4g4uUmRoFWbzxVfDULULORcx74=;
        fh=2cEsR8PE1ZA7eVxEn67jrpHL+IGPyc1dOiCuOBFSseI=;
        b=WcVqiRaI3PWG2tP4RKR8bG2iKQWoYGdNZAsWATBhSrDYcqbeJ15asIPjURqaRCy9Qe
         BBHN3S10tOVDmPe3sUtFmaXQ+GnjLwwImP4lj3zsJNoL9uotp4r8eENWNsx77G4sbkcO
         EodYm2yAdBTcgT3VZiRv08n5y/De24fy87lAHbKJmsovrjUcAtW8ISwCMxqRZ4SzfAlF
         vtoTevm1g57QIh5p23sPn5jx5h3bQyZItj2RwUer2eHg9zKpLO2OlRAORJhUUOG3uACC
         uoCIze0RZnGyD+CmlhWf8vCWAIc8ux1WWCikcTfln4ItUMwjySfSP1DKb4rBGiucRtIe
         MSvQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1774323755; x=1774928555; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X3n35LNNeF5Wx2GIr4g4uUmRoFWbzxVfDULULORcx74=;
        b=lUoLDZ8q0ABswFfTOxSq8MTQa/riOxmtZvp7JNbQPHMRGYvUnWCOY8Ox4T3+7RbA7y
         lTk62paubhVc0C/OuyQET/9zyd3wZf5kzHlROP3MuvoMVsgbhc+uPeThIy5dqD1Udpu6
         Do9zRtb808HKwELbpux+W5A8tWiPTWGwcnrfY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774323755; x=1774928555;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=X3n35LNNeF5Wx2GIr4g4uUmRoFWbzxVfDULULORcx74=;
        b=Iqen8OzgHDzf/IoBJcGDzGLnb4SbeBj9UiIyCHeRqgg4VJHTvTUj6Q88GevIkVn0cB
         NscVwdgcCNcr3z8SY4Etl8oFaunO1wz7nCPTR+OuCx9Wj5Cfvs7iAt2KSb3bht79x1UK
         AyLyb0Nc0cG7ONnbJaJYXSmW+rODfK5pmdvJtSo1EBYYbA8zMU6av1vly89ry7JLYUqv
         urDlMgHX7LP6PxR448VwI5ATEuC1s7CPSS8Z2D3WntOeLgZFXWTARieSX+hRcIAL69YZ
         jb2CfLVoP2388p/eJmK26kiL3G71K3KLxVsfj5wgL1c0Ogyjozgj9Aoo9c+Pi5M/su8V
         UV6g==
X-Forwarded-Encrypted: i=1; AJvYcCWAXzJ811kWkFkF7uRiUkV88iAPSVXsODkU1V06s/ckwI72E2lfaFf0PyIvgoEBXV1OVQrd9SwSwnBp@vger.kernel.org
X-Gm-Message-State: AOJu0YyJ90fYYMh2hkYP6yJvrA8xMwoNY9P9IeKHFoEihGTnm4rpjAf4
	7AalDLNJ2zFra3n43SOFMePDGqJqz5D/yjx6i6LeKlzU+R/LCgEqRXOKJTJ8LsfyK3Ur0pG8p0N
	iZgWeIRMPiv39GriBZ1DANkQvr7axW84IdplA4BRb
X-Gm-Gg: ATEYQzyStfkIMdk2Ouo1yb9HCUHIQ6zBk4v1jalydKKNFGqmHYN8fde8yzgwvdg9UO1
	AArEHoNgx/bQsnfK8MsMyZyDAYiQdDgyCZJeNnzc7qu/eaaw6keuxk034j937LcMySMRzLRA94q
	T7+Sviqk2E8jyZyXeFKbrKOA6OADDvOU6N1xGkPulaT/g+41xvAQ68FyjCIvxVef0J6bnaHFd1Z
	MXJ2RxBeUfhZxrwCA22l0KSnAfNUxs1SB13LTJTneVlZOCf7nBUWoxA9Z+YcfXmNHkAEv+Wh0ox
	0lM0u5nrlw==
X-Received: by 2002:a05:6512:32c6:b0:5a1:44ba:c96e with SMTP id
 2adb3069b0e04-5a285b6db31mr4580171e87.38.1774323754655; Mon, 23 Mar 2026
 20:42:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260320072440.2403318-1-wenst@chromium.org> <20260320072440.2403318-3-wenst@chromium.org>
 <20260320-dashing-crocodile-of-emphasis-2cc43d@quoll> <CAGXv+5ESnhsVfu5pWf1DEt35+10ZKTgJ5G6DuJC4s6yEpRH_YQ@mail.gmail.com>
 <e14ae934-e448-433f-987d-77bede5f6d07@kernel.org>
In-Reply-To: <e14ae934-e448-433f-987d-77bede5f6d07@kernel.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 24 Mar 2026 11:42:22 +0800
X-Gm-Features: AaiRm52CNgLAlXeiRcCcd4-xI1ROYPaycCYYMcNwH55Sc_4mMYJ7m6m9CPgV9Vk
Message-ID: <CAGXv+5FhSsq2FtieUm+jKTZ4+Zes5TO9gD-a_rHgOzY5kTOB1g@mail.gmail.com>
Subject: Re: [PATCH 2/5] regulator: dt-bindings: mt6359: Drop bogus
 vcn33_[12]_* split regulators
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 23, 2026 at 4:31=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 23/03/2026 09:26, Chen-Yu Tsai wrote:
> > On Fri, Mar 20, 2026 at 5:54=E2=80=AFPM Krzysztof Kozlowski <krzk@kerne=
l.org> wrote:
> >>
> >> On Fri, Mar 20, 2026 at 03:24:35PM +0800, Chen-Yu Tsai wrote:
> >>> vcn33_[12]_bt and vcn33_[12]_wifi refer to the same output. There are
> >>> two enable bits in the registers so that BT and WiFi drivers can togg=
le
> >>> them separately without any coordination. If either bit is set, then =
the
> >>> regulator output is enabled.
> >>>
> >>> Unfortunately some of them are already referenced by in-tree device
> >>> trees. To keep backward compatibility with them, keep the vcn33_*_bt
> >>
> >> So you drop "_wifi" regulators breaking the ABI, no?
> >
> > Indeed it is a breakage. I kept the *_bt part to cover all in-tree
> > device trees.
> >
> > But the representation itself is broken, as explained in the commit
> > message.
> >
> > I leave it to the platform maintainers to decide whether this "breakage=
"
> > to fix the broken representation is acceptable.
> >
> > Note that there is a similar issue with the *_sshub and non _sshub
> > regulators: there is only one actual output for the two. I'm still
> > asking the vendor for hardware behavior specifics.
> >
> >>> regulator. Also combine them for a shorten regular expression pattern=
.
> >>
> >> Instead the duplicates should be deprecated and driver should still
> >> support the "_wifi" variants.
> >
> > But it doesn't really work in the driver. You cannot set different
> > constraints on the two, especially conflicting constraints, and expect
> > them to work. And if you set the voltage on one of them, the other
> > will change as well.
>
> Of course, but now imagine a DTB with only *_wifi regulators and no *_bt.
>
> >
> > If we want the driver to support both with _sane_ behavior, we would
> > need to introduce some sort of alias lookup for both reading
> > constraints and resolving supplies. The driver registers _just_ one
> > regulator, and both DT nodes resolve to it.
>
> Yes, either alias lookup or adjusting the regulator_desc before
> registering them, depending on the nodes.
>
> If I understood old code correctly, the point is that ABI allowed *_wifi
> without *_bt and this would be a working setup. Now it won't work.

OK. I will drop this part for now and just add the supplies. I'll
resend the cleanup once I figure out how to do it in the regulator
driver.

ChenYu
