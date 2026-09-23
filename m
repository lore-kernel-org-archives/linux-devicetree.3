Received: from mail-qk2-f43.google.com (mail-qk2-f43.google.com [74.125.230.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B98BE38F649
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 08:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.235
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790152328; cv=pass; b=FUdIo1/JEtjM7zTc5rKtEyng0T3Fn3hZkRPC8MNbisldcta8hPhR5oRttifxoc2fTHMVapCBiA7Q9yaVU5xiOiY0t3JFqd5OzkCi8gbvmurEhj97beyTnmKs4W7gNI1OpRLYW8K5uZC3E8p5t/Br9eUYIbW0dAvFCFeM48h4lfY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790152328; c=relaxed/simple;
	bh=hLbf5wdEcfSfArgGglezKU7/4be8aZs+31yfBhWP598=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V1/D0DQFEE+OgHojd/ixJ5Up7nO+mWgcsRS68GgxHjuTq4AGYXmyeGJf+/hBGZMeJuXyaHac3CoSd7jdlhsCifKMA458PvtZjdfZU2ac+iUYoOn75cUfl23Gox8Pnlgp9K5gDs/SO5ellwUURe5qfFQf+PbAtxQ3z7jvJ3xHjGw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NttemEvV; arc=pass smtp.client-ip=74.125.230.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NttemEvV"
Received: by mail-qk2-f43.google.com with SMTP id d75a77b69052e-52fb76ef1d0so6471121cf.0
        for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 01:32:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790152321; cv=none;
        d=google.com; s=arc-20260327;
        b=ilbMJQPWGpUA5BZDnH0K8CKxR5MorRDFx9j/3x/dMCbC83DdwH1l5q6ylG2Av1xn99
         JHeVn3Kh5ep9YkZDnfc2lBCVCEcxOJuMKZt0kBofRiJ1DYRZxyx1Xnc2Ks0j99xpkj/G
         OUkhaLLNnMNVky9EEyebbfiNQJhifQCRvbVBU0Ckf59KmvPc21omm7506yslPpm+autL
         HBaZrJkkzHd1+7E4MYVIqb+OCfsGuJi2xRbOZaAwlv8ww/6wKV4vB4q0fcjB5IlosRSY
         TIW9++p5EmwoHJMsf938T085AKb3SYdeblnwoTM0YBvibUwakPFy/yPSXoEEnF446vCq
         D8sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=hLbf5wdEcfSfArgGglezKU7/4be8aZs+31yfBhWP598=;
        fh=OgNJavDhqwCM9K9b6HLLS5NCQs8a4TbCDnTTfESiF+c=;
        b=hPhNRj2OaCZS6nCrunc5E0/NGV11CBWWQmGXetHw/aO1qa0ZBR+egk51tX50v1DC1r
         0Gz8/tie9QReEfVsvccodywdAwqDL0BLKQgjmL68taqqnkJzPE9aTp559Ie2s6uAuUaO
         lxvfCHD3EODbWnrw+PNZ2XrVOvbFrz1TBSgywTtfNIjbZ7pQP8tRH7Rmq+F0A4dnDsUy
         SUUBikVbNfLxkAwfwTwQ9p2Rg8/aX8/C7620g50Qzt1McNPVDlFW5oobO25a5P0KvAGZ
         dqG20aUMby1EElAEsKVrv78Qa7HGSxlVSJhG6r/D+WNcsCKoBL5JUgsHsLAya+ZIIrD6
         WVeA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790152321; x=1790757121; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hLbf5wdEcfSfArgGglezKU7/4be8aZs+31yfBhWP598=;
        b=NttemEvVe7HFiC0/n/2XEDffB6Gz9Bwgh2IQ+eKH8YlZfzHQDCt97R0Pf0SBqu7J+B
         x5TAnZ2nbcGlg5c0V8jzgCQ941hX/sSI0Fcq+hf76CdHB2R8f0ghVDmUecGAYgN+G5KO
         ZKEEX86kmYGOxsXxn3cXgCwZAT/Vmw/BurKFRF8EdBV1qaw+UZVzYi5uFyUTcs83u4re
         cqobkZO51m2W0kNcd5dWweVPDxm9Peqc98eG+dPHQB8MPGsIIrNJillu25v5nsarat3U
         sjnWGQfyJKfCOj78G2xLuE+o7Uo0+OD8HxiyUUFok0zmvmcKNsERfHF8/jM15bBzsZWv
         O1/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790152321; x=1790757121;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hLbf5wdEcfSfArgGglezKU7/4be8aZs+31yfBhWP598=;
        b=br/7rS3j30r1f9yjnRVAwThdpFcIwUB+VS7jSrPHCp5Eu/NZbBDquuQqxcEMWs7RQq
         sUloe/MRmQ7OSwUH13EI0RhrQgWyPN2y2or1zQU+0AbFbdzKgJOVg5/1R8FPxCrqfKa+
         6BGjHt2C/UIVnwi4rg8dE3qcO0IoA42qf1QerVPDqyEsG9R0bxi7bGPnEnDBNdg1jIcc
         HslL6VKohOLA98JoZLI6JtYZfztNKpgsLPH9v/m4nVtc40NZytWjKT35OizOvx16xrXK
         HMDZfRSa7L0UPWiEuFqF8d6oozkeyvwNIGjVEcmZ720URtX9YqiPiU7gJ7wVPVE8Wjk5
         TtQA==
X-Forwarded-Encrypted: i=1; AKwUvBwKHrl3/ZyP/fJl+owd4YyUPZUruwqJtUV8Aq0Qp/6xW5eq/AzW+8UluRQC/nAKzopPpGdg+DUIuL02@vger.kernel.org
X-Gm-Message-State: AFuF++m+s15zT3JDqOU7gM9SdSDny2x8qxMQfangivGGleyvqBzOLvNu
	IB4zPPU+vOMkv5zPEoePe5kQ5UulFebrF0+4tDS5XJRd59dEMB6HLWpR2CkGzX8JamyZAfrkhSy
	zON8BkZZmZIHywOzzeJhilkX53/RudyY=
X-Gm-Gg: AYBFou0aHXE8fTKNhBUFPLweOkI7nNn2tLNWu7dJINyzMmzjaZNfscxHCwK9eBRA+NO
	9wXBi/UsGRZDG4AlVjG+M+eRsrfieTwErJLAfgGhrjvqstKR9K69uAMWdWXi8mmuVCldJVBBd08
	c/aQKqDdpmXYnDvxfiaC5Wg6jdNT5FgSUcqBQstq4aGnr5SVk+bk6TjtI03+sokskG2yS/zMCa1
	ZrcPO9qgNmK5pUKD7d+mtBahIVbO+Mw7tD1bNug+eAv7NwtHEqWdG6y3Lvk/dc+XjVQO/TNmmts
	xFTQBwIdSSSUJQEUBfCyzgl7yP8qgmt3BotBsMwpF+NtUx1jv+emoICcXZ93VG4a
X-Received: by 2002:a05:620a:6017:b0:93a:2d15:f84 with SMTP id
 af79cd13be357-93c2511c2b1mr290767285a.33.1790152321118; Wed, 23 Sep 2026
 01:32:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260916235200.20712-1-ansuelsmth@gmail.com> <20260921135933.7e8857ba@kernel.org>
 <CA+_ehUwy9RUKCCHDnqoED3AMVnErgGr9RCrCR4ceg5QONq1wOQ@mail.gmail.com> <20260922172514.7feb6e7c@kernel.org>
In-Reply-To: <20260922172514.7feb6e7c@kernel.org>
From: "Christian Marangi (Ansuel)" <ansuelsmth@gmail.com>
Date: Wed, 23 Sep 2026 10:31:49 +0200
X-Gm-Features: AclHuK8jGec2XT5CWPXvYVvV1bFvl8hmA75zakqIakpr84shp0cAZGnoi6_G1Gs
Message-ID: <CA+_ehUyFKZzd0uP4akgZxaLLJTwcvGGKz5ppCYsB++fn92Dn9w@mail.gmail.com>
Subject: Re: [PATCH net-next v16 00/12] net: pcs: Introduce support for fwnode PCS
To: Jakub Kicinski <kuba@kernel.org>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Il giorno mer 23 set 2026 alle ore 02:25 Jakub Kicinski
<kuba@kernel.org> ha scritto:
>
> On Tue, 22 Sep 2026 12:12:56 +0200 Christian Marangi (Ansuel) wrote:
> > The remark on the fwnode patch are invalid. The driver is expected
> > to return those error as probe defer is not supported.
> > (a notifier and late attach/detach is used to align to phylink logic)
> >
> > For the specific Airoha PCS driver it's really speculation from the AI
> > but HW doesn't work as described by AI.
> >
> > The only real comment that is valid is about the alternative way
> > to give supported interface with the .get_capabilites OP.
> >
> > This is currently not supported as there isn't any user and it will
> > be implemented as soon as there will be one. It's really to limit
> > the patch delta of this change and to progress further.
> >
> > Maybe FIXME might be suitable?
>
> FWIW no preference here, I defer to the human reviewer.
> We can treat the AI review as a hint if human reviewer thinks the code
> is fine as is.

Soo should I send v17 to fix AI that failed review?
I think I didn't got this detail.
