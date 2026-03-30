Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3452369985
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 17:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774890868; cv=none; b=Q8V57FENKF66KVCtKd0QlvR9ZEdTew6Xo1cCsx4L0ZhxpKcm3zU4m48g4xNY3ZbX+GdK5+HedI6xbqXOzgfzt2Qhn3rkQC3y9nI+wYVEqb5BCrBD/P9yudH2O0fqyHRt5mtgRKAI5sJWnrU8zd4pt8/yOt0fXvn2yFQMYaEDf04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774890868; c=relaxed/simple;
	bh=XYTOVkoEGusHSmstwOHypWXIz7+R10YaZTQEC2zhNLo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bm8+bIKBLrmWUW462NJzJzOTKOIwvQzd7ibP1QKuu/woh/w6d2r7JyMmCckLLGgKtujS82XHmoIQFAeCvyegoPKafqrteopTmmcowh/wq2kG75qFqTvu/9L24ol3YRebStVyFxp/PCyQMBTazKpcp2cHUXNF9coXwD42UuwR0GY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=geSVXoXb; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="geSVXoXb"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-50b3488fb31so77375701cf.1
        for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 10:14:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774890865; x=1775495665; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6PqJcIVn2A63jBO1ik10b5dMY7je6jkjKnjpNon1dQM=;
        b=geSVXoXbyiiOexjRiTtwiSxkdZ7U72SIcoHgxAyxRrTS79gLJvaLDRwqV/tPQwDg1z
         JF1yQ9Q3fp01z4eaZN682diAqU/IckAbJzl20gsoC2QMctw+m4GgU3JyuGcGF0jE12R2
         oxEYr4A6a9WoZiV/PRl0eFqX1tvNS9RN+0kFkcALhyLaS9x45vU2LZ/JuGpdPZr4UEkC
         EdSYA40UT3QEeYa8zMr1P4OQUolmp05e6YFhb9p7rTsWJui7p8VGG7nYpXD1h4y+gZcM
         eAtmgIeRS87IgarJ4QNj5Mwtvo6hOAkU0Oav6EGhePovnlRZBUl4DM/R5mw44Y7AYS3g
         JdZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774890865; x=1775495665;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6PqJcIVn2A63jBO1ik10b5dMY7je6jkjKnjpNon1dQM=;
        b=boBjhbbiXvassG1CaS62PeEhvDMR0E63JW4dXGMW7FKur1ezfWh5y9YWzyWWbdD6iu
         yaO5CLeOM6b0l8afY34+XLuqPGXur4u2Xpft4C03fLjluIxaOsT8YlRAVpJ8sChOiA60
         kiioC08qoeF7+K1tL0BFSe8i7C42VY5xBgtAr4k+6uF9dpDCPOv+EMk8bHDWcWM0rvjA
         yqeUFSJg/BEMOQICZofnct5l8babhe5eDUldudQOBEAViExV9MnwAFnvsTOhoWz9BVK9
         0bLTJJgaZxH1iZiHReNUq/mAvgV7N7l/zfFx8Dp80LQyzG4jIhSGUorFossl/Q3npi6Y
         3/AA==
X-Forwarded-Encrypted: i=1; AJvYcCUTT3b8bROCch7faWE2+T40i3Je3j4s9j9UGuydk5femHdNJ1VofrgIg6xIWOQaJ9ZKyLwWbmNRx628@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8M3WezoR4z1zEn26nB4LpB/JFD/HaH6OslM74f944Ry5OkM2J
	EnqRyIF4Gt9eZ6+P+D304nEUEkRT2x7lJVI3W7eiyGQHKoS2CtgNukox
X-Gm-Gg: ATEYQzxlH+dqxTAD56G1UU7cAP4w5OuBcCou8JV8MCuQ6FRQQRKjiXJe8GWmhdaWbeW
	aZUzykyVvUVgZ9CcEz0wiaH9GuxxQ9wGqngYdW12pDxebPl3+DYUWcoPjJaUzP21yzYDgXycdB0
	Z0f7ZAWtFP5l+rXgxdAMTwMLb5WZJKov29gyrooAfQgHi93QtkRiJO2hiGi+U0Zq7qAWOFmyC83
	xKQcU6oAviiNCp9H1aB1/uxMHJJEKWXQZh6ju43tHGckp1zWu7USYlxVxi8ZD9wCLKnDomkIiJo
	rPMYvo7q4SKmDd12S65yS98dK7buFmisL/nXxRSq89RyIalVR9dYBG3Bb0wNXeG1u8Oy36yftM1
	GYcMMxB1W/ZlWDbVdGDp/L9wsUTH+pgpvuBWKG8X9vWHauLqEkf1V5VUMi/HMOosiH7ulpMLTN4
	pWXlminM3jPFOL+t1ZhlQ3Nts=
X-Received: by 2002:a05:622a:4604:b0:509:2231:977a with SMTP id d75a77b69052e-50d2c8ffd6fmr3608621cf.30.1774890864504;
        Mon, 30 Mar 2026 10:14:24 -0700 (PDT)
Received: from localhost ([199.7.157.54])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50bb2c67fefsm66255341cf.4.2026.03.30.10.14.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 10:14:23 -0700 (PDT)
Date: Mon, 30 Mar 2026 13:15:07 -0400
From: Richard Acayan <mailingradian@gmail.com>
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	Nickolay Goppen <setotau@mainlining.org>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Johan Hovold <johan@kernel.org>, Kees Cook <kees@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Adam Skladowski <a39.skl@gmail.com>,
	Vladimir Lypak <vladimir.lypak@gmail.com>
Subject: Re: [PATCH v2 11/11] ASoC: msm8916-wcd-analog: add quirk for cajon
 2.0
Message-ID: <acqvm25ap4LTSB8j@rdacayan>
References: <20260304195815.52347-1-mailingradian@gmail.com>
 <20260304195815.52347-12-mailingradian@gmail.com>
 <aalV5dBloD1BmwzZ@linaro.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aalV5dBloD1BmwzZ@linaro.org>

On Thu, Mar 05, 2026 at 11:07:33AM +0100, Stephan Gerhold wrote:
> On Wed, Mar 04, 2026 at 02:58:15PM -0500, Richard Acayan wrote:
> > The codec version CAJON_2_0 on the Snapdragon 670 requires touching the
> > HPH test registers. Add the quirk so this driver can also support
> > SDM670.
> > 
> > Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> > ---
> >  sound/soc/codecs/msm8916-wcd-analog.c | 63 ++++++++++++++++++++++++++-
> >  1 file changed, 61 insertions(+), 2 deletions(-)
> > 
> 
> I think you need some more changes in this driver to support CAJON_2_0
> properly. Specifically, the initial register settings are different from
> what is currently in the driver (wcd_reg_defaults_2_0). There was a
> patch for this [1] (later [2]), but it doesn't look like it was
> merged/finished up.

(+CC: Adam, Vlad)

It looks like the codec part is mostly complete except for some trivial
changes (empty line after compatibles in dt-bindings, constant to use
BIT(n) macro). I can take the codec patches if it's okay with the other
submitters:

- [PATCH v3 2/8] ASoC: dt-bindings: pm8916-wcd-analog-codec: Document pm8950/pm8953 Adam Skladowski
- [PATCH v3 3/8] ASoC: msm8916-wcd-analog: add pm8950 codec Adam Skladowski
- [PATCH v3 4/8] ASoC: msm8916-wcd-analog: add pm8953 codec Adam Skladowski
- [PATCH v3 8/8] ASoC: msm8916-wcd-analog: add lineout output Adam Skladowski

Maybe all the WCD codec patches should be split off to a new series,
otherwise this series would expand to 15 patches.

> [2]: https://lore.kernel.org/linux-arm-msm/20240731-msm8953-msm8976-asoc-v3-4-163f23c3a28d@gmail.com/
