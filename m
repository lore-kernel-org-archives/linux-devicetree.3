Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE4843A7F4C
	for <devicetree@vger.kernel.org>; Sun,  3 May 2026 21:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777844078; cv=none; b=I3nNQOurS70Hs8GVIXXlnhPiN26u/nT1RM/nFEYvoKBnzLpCD0zCg9VG0Ch7qxwxUJwDY6+khlwDeDaBx5ZC5WVVw0835P3PSQ8eSAy0xje7rnWAFIeEO0G1JZwyEU60KkldCAmEHRWy2GWiQMzsERYBgqE5g+LqCSg4f4WOve0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777844078; c=relaxed/simple;
	bh=V2CKovgPBbL3YrqfdVzTYZbUk38RE704n2LsR5Qlxgo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JKUU1WdkV6JH7H7+OxWof/fXMTKVDDwRnQ/0bEb7zSkd0PlZUCrdeVA3pVZgCHntPi/bMRj40OJ6OsljZIimYxq/cl/jWVSdht8s7+XCdWi7XlbvUzMzVcOcRjvbVmG14ybeWg/JdN2GGPQFPDxK6MYWTBQQ6Rj5QS5CViRBUCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=agjZ3B+9; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="agjZ3B+9"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-8f231f3b130so240343185a.3
        for <devicetree@vger.kernel.org>; Sun, 03 May 2026 14:34:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777844075; x=1778448875; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=U+fB6N1kDtTpFfTTO4SeOyoK3hURDyYjimuuMZs4xRs=;
        b=agjZ3B+98QP7bVmUJazHJsSeCx/GUFrk3oUZPsXbTiIn3sYwu+zvkgxId0VaWd2ISe
         IoDa7SN4FNLz09aZBfBdO8M/iojUjAXQAtKyGvHUjVbM3cVTaUxZKMULuJZ6j+mf2HF6
         NOaZGJNMwND6Cyz71XBJCpp7EjV6eoLm5fbf8WXAZaA9IZ0I+iVrWBrKKCE9+BGRN3yD
         jBnEl1wm6VVFxuq+Z7DBLjX8BaN+3kqhd2/8if7FuHpIEftbu00dnYpYW/caNLgNQVem
         97kpt5SkgU3KhW9Pkss58W0L0cRJshpq7sXRv7CuNE1uwYe9HGQKaxNDDfQkt3fY2lcN
         OZTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777844075; x=1778448875;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U+fB6N1kDtTpFfTTO4SeOyoK3hURDyYjimuuMZs4xRs=;
        b=RgTqNHa1IjrdrNQ3TlpQNM59MCbqn2p9gj4k1tL+/mGD96LCQOXWSIhuzMKj6N3odo
         vkzJBrfDa5xJDKdg4ExzaDXeTq38Z6KM/V0tuoR1Y6L1fbGAJaw2ojhQ/uOkZynNQ5JP
         1abHx6hrX9vzNiB7QEnDqg8IRcRYWHIIOYo6FNcLmv5NsefY0DV45fJkKMtUw+g8sk6e
         bNFJPuXoDVSUXqDeT+Y+oUIE2DoMIF9wQIdA2/tO2brTBSLTpMnfMRtTSCbe6g0qkNYb
         J79wAjgct5XvIXx2dRNblVSAqFX9wRAc0TZ3KjlrSvPB5G4z6vkyWtcWhJMJHOP11pvn
         XtHA==
X-Forwarded-Encrypted: i=1; AFNElJ+r46p3zSN2Geruwcj8plOIhwRZbz7+WIU5GJvg28vXZdeIQLfZccp2FkpSDx4QMWYTEvZFT+LyW5FC@vger.kernel.org
X-Gm-Message-State: AOJu0YzLQHHoL2/GHogZx0wCpVuUkq+P1PGK/fm1eifTef6MCrRHTvm1
	0tcl2CGvCRqvQiXPttUBQUSnDFPwMN8mDTqbsnS0ema/OfobV4ESoiaF
X-Gm-Gg: AeBDietq42QyXN7kqFj/IC1RfqSqyqlK/SmxGqoOixdsMkdr2K81P7QEl0jcXS59bJO
	tvb2cHrVjipJC1IhwutcwfPq3ziXoBE4OvXIS13Y90cZFvsdghdNitse8WxrP9V8zCE/wWCRPdU
	0ZgPu5H1ZjDlGdlKgF3zt+f6Z20EkG2EDNzQp4vzNsXqeXuTiVuacnjItUwEOHmd22kqcYnVd89
	XFQ3obauc87DzP5bMxPj+CDLaKfhtaIHS6Iqq85F7tH/S2BFcrOfMhEKTtSSD4ft7xwfhkP6LSn
	Prp4RVohmY1nTr3c3fsjDsii89pwQz46ygh430gjMz21/mBek9426CrBMmJfmGJHsQGdwr6dylB
	e52gS6dX3EWI1VKldYhQA/5Vo0IMbbaXBrBZnSdTmALQzESBz7cOTCHUdM/BIXsea+mDRMPTD5q
	Zr89UtS7aVgxbsU9/YSqmBj7yEgkTRYkZaGUWQ
X-Received: by 2002:a05:620a:c51:b0:8ee:dc47:3b71 with SMTP id af79cd13be357-8fd18137f32mr1102849485a.31.1777844075258;
        Sun, 03 May 2026 14:34:35 -0700 (PDT)
Received: from localhost ([184.144.58.243])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8fc2c2540ecsm831799685a.26.2026.05.03.14.34.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2026 14:34:33 -0700 (PDT)
Date: Sun, 3 May 2026 17:35:16 -0400
From: Richard Acayan <mailingradian@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
	Konrad Dybcio <konradybcio@kernel.org>, linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	Nickolay Goppen <setotau@mainlining.org>,
	Adam Skladowski <a39.skl@gmail.com>,
	Vladimir Lypak <vladimir.lypak@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Johan Hovold <johan@kernel.org>, Kees Cook <kees@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH v4 08/15] ASoC: qdsp6: q6afe-dai: add internal mi2s
 support
Message-ID: <afe_lNt_zS0j8ZYr@rdacayan>
References: <20260501153128.8152-1-mailingradian@gmail.com>
 <20260501153128.8152-9-mailingradian@gmail.com>
 <afaItZPyanmoWraa@sirena.co.uk>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <afaItZPyanmoWraa@sirena.co.uk>

On Sun, May 03, 2026 at 08:28:53AM +0900, Mark Brown wrote:
> On Fri, May 01, 2026 at 11:31:21AM -0400, Richard Acayan wrote:
> > Add the internal MI2S ports found on the SDM660 internal sound card.
> 
> > +	SND_SOC_DAPM_AIF_IN("INT0_MI2S_RX", "NULL",
> > +		0, SND_SOC_NOPM, 0, 0),
> 
> Why are we using the string "NULL" rather than a NULL pointer here?

The new additions will be fixed, but it originated in commit
32d2c61ba059 ("ASoC: qdsp6: q6afe-dai: add support to Display port RX
dais").
