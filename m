Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=74.125.82.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793353346;
	b=KC9w7xgVuxxMGFcwLJIWpLiyBMmNNpO4EYl684hPtb9cxLn8f1V9cAcgLHtg32W6vOmb
	 M553QBjY6Q88qM5TvoAPfSg4TAjnpTrW6Dv2XZPdo8gi4cnnWbNh28NKurvFJxr2npzFj
	 WUZaX1Nt0MxXWC3SZ2u7vQiOPbGBjA5q+gygGIrnHTxLs7dB/JmYofBdP6Z7AFAS/nLXe
	 bDkxK1+9kQj/Aubb/vUwGcVuPNNxRkJG3ElbFx4yBWzhuGhk2bNbYf9PvQTlwStzJwozG
	 qHD4qn5jSYFPlAhvJwolx7yCD6HIXczZpzavSW+QiOPkSJ/6fFvTOybqyfbfvDSFITg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793353346;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=GDGY6UPfJWemExMe2Y2VGpgaiOOBAPyHFBWs4EkVRgc=;
	b=IuhRBiT/CG5VfvwAiw1xyLzGHZCc+oBa4XgSXpfekLIunoT9Qa1CHATNl3X3YcvNrBS6
	 DR812BQe0N7CjlOjoc/+h8qjRr3qgAPsY94tfISyjRssKZNhgSjWkTsOPT6qBzDAgRJ5U
	 shqCQj9YZH/YTxiPzRAqvw75ltZjwJ9gfnz2HQFvBQitsHYIy/gwia8p7wSwKljv7zDiv
	 m5hRBcmETR7hRBGCDfxzY+vdAgKkAyPPlhEOEUvGtG2gZI2rc2+yZc23kPSKSIkid9Oo5
	 Ou72erqOwJsNHFjcftGNZxr6RbDoGXcrjZgm52JfAbAPqRxOc2S8EZ+DKShio/KZ2cA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="VDvo/8AL";
	arc=fail smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D4F9606A31D
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 09:42:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D4F9606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VDvo/8AL
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-3550c917fd3so753270eec.0
        for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 02:42:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793353345; cv=none;
        d=google.com; s=arc-20260327;
        b=DU2lIHSriWOJtZvgq2GHafZwL8BLRIwLAQB0vKyISXLj+QleurNbuFCJp+RzT2ssR2
         zfYfBTK1zRAwkukga7k9NBD6a6OsAJO2bw0AyPt5bSnh7WulydUB0osEG+BaizkzpZIv
         RP/k9XeWautjk1wGct0cF42qjn/tYK/2frZTdHPJQOuStWnquCzUD7x+38D2FgTp/gZ5
         ARBnKFwrXWBZNp5pzflqnf3OcdwzrojPpPENevEnq+oGy7Owv/WjyxkKljnRg8sKKLOi
         SCH63Pk7kUy6UPA86vCGOnkhCqvTuyAeY4Y4cyGmoB+GRBMnJjpR6xwe5IaLQolrlyp9
         wROg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GDGY6UPfJWemExMe2Y2VGpgaiOOBAPyHFBWs4EkVRgc=;
        fh=NCyUaO7ZNHz+/5HyZi25Vp2+hpUbhcBc+HbnI6aVUWw=;
        b=YwqbfiNunVUBoTL6ByjpboDtvZpQ7x9/Q8LBsTHS8CRl6N0AfqUjSFBxBlendb6Dxn
         G38809WrvEjZsV4tqX9ANWuJeT1RRBGU+LfuI4dINidBcHmqR7DEYtWaLqoyKBY6tnS0
         3AkPU1/t13juZzYVaFPcQIurDBnaukNLyKBJkp/B6ed9xjjG8Z0w15wh+wpQ/WlabBLm
         zEB7OyCsEmjRH3JwoopvjRPgI7Koxbivo5ERDhSp5BJC7LjzbBlTwBPdwUwJ3hWbzKtS
         3VLcE2BSm8CAEznn2lKPsXv8gLWkttDR/IaRnVPSBtN6LKDUlJVOaQu2jKdOoVArgekR
         DeJg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793353345; x=1793958145; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GDGY6UPfJWemExMe2Y2VGpgaiOOBAPyHFBWs4EkVRgc=;
        b=VDvo/8ALUv2o8vLeBrFjgi8x3hH7i8hY5DwpCSk7vhJILEgsq4TzXiHzvm7k83zNTV
         udkGFuGOUraspN0Nacg5Ghc3c16IApQsRqOaDzzJ/ElVmieliY16mbyUuEWAM1ybuQ/V
         T2P0+B36wbYw3INCWqsEKpVMKVuOBrlxmNh2siJ9dpzo2J33PlWRLE/4s44nAMEaVng3
         O/7Ob3zdUjUnrhk74MT5Lkd2I3Hnu4punHB6tcGdawA4Do0SI1R+ANYc8CmGTN2C4K+2
         eU1vHiRoX1/naqUdmPws7e7NckwbH6li5mI+L28sU9q6vWsh3uFaCTn+1rde1AOPFoGC
         xTig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793353345; x=1793958145;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GDGY6UPfJWemExMe2Y2VGpgaiOOBAPyHFBWs4EkVRgc=;
        b=N1MSXmbbu3Nm46SNImv2hh8T2yySgVzT86wM//VZG7u9iDd85VdZi+iwt4OP74g8OH
         Me21a4vNtcRvdtmkP2Mwre8ekjoI225GviMWb7wp0eE5uVi0SHl2LfWjGacubm5jGM99
         Mzlk0s1y0/tFTNo8IwLNXUqauZFFnGHM66wT8Ioo6zMKEsg68NZJVV0uvhDXMbvf1oKt
         KQaXR+nQ/X1PyDqrZA3DtW0p824vyI00wPnfmYmSd73eEVDQnsKZ+W+8LzvBWS2ut20o
         fk/SB9kEKxXx2TIcGBd8dtggLvUbBZI2nrY+Z3wh4pvtNAq4dC/yzLwLAZ38DkEFHxxl
         r6ug==
X-Forwarded-Encrypted: i=1; AKwUvBxCGtbJeWj0LPtrt83XPfBFngNTZJQm5KSefqQqccdjvCKljNLrx/SWtfNrJyk+WF2GQnx9Hm6ybzOF@vger.kernel.org
X-Gm-Message-State: AFq9FYL0igc7GWwDvexaV6cWRSS0KaYZILTRnLtqONnThRBLt3RfmVJp
	J4xQnEhPWfyr7E1QzbSuBPhhHNs/M9qKGtH2lpF9UmjSHqGBZikfBYvQSfEZJY81S+WgE41EaJ7
	Bg4ubQwHssclUHAi79aoz9rGWjNJy3xQ=
X-Gm-Gg: AYBFou0yqOE4iH9WfJPIqtZJI05naKkX2liZqqVH/7rDxoIIjZ3lJS6Vmwoy3/A+U/B
	kf3Z3MVKXBiLCvOCZKJCh9XcAMsN6sGWwGBm+Vi+4K4fJSBDxlemds6Ise+PxuHhJuGLZBuMfKV
	u16pb2Cya/MJbn0OuJ4MWK4i/SvnTo+xwbIe6M5nB20vIHJl8KRL1yo3rRcSoNBtw5bbMd/pvkZ
	bHvshmwEh7XRxBNBcYBJ2ejld7ZUlpkIyra0KuvMQ+3l/lIyYO2yAdGj8Jp12JJwhzSBAL179R3
	51ikYHq+nJ0EWPcE3S7vZlxNhPpl66cVQIPaYHupaPHYbVI7dX4duA9+nxfmTbn4o1NOnpQmihu
	TO4g7rJmrWJEreKk84JUWTLPcBQGAvg4yjMO3l0vh7eZVf1qm9yydL2xyXHR6AyEA6aiE1Q==
X-Received: by 2002:a05:693c:41d9:20b0:368:4acb:f8a with SMTP id
 5a478bee46e88-36a4242f5fdmr2867529eec.17.1793353344529; Fri, 30 Oct 2026
 02:42:24 -0700 (PDT)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261029152909.234584-1-clamor95@gmail.com> <20261029152909.234584-2-clamor95@gmail.com>
 <auRjGM7briuvXDEg@houat>
In-Reply-To: <auRjGM7briuvXDEg@houat>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Fri, 30 Oct 2026 11:42:12 +0200
X-Gm-Features: AclHuK9xo3P5XZPZURXGSlkxvgjF2BR7aWoJEgrYiYo1jUomIQQhlZvP6BUv2IY
Message-ID: <CAPVz0n2=sgbzBfvhGOoRFXeOzKDvs9en7QD0pHc31r5GzgCsKA@mail.gmail.com>
Subject: Re: [PATCH v5 01/11] drm: Add MIPI DBI bus support
To: Maxime Ripard <mripard@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Mikko Perttunen <mperttunen@nvidia.com>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D1=82, 30 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 11:2=
9 Maxime Ripard <mripard@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Thu, Oct 29, 2026 at 05:28:59PM +0200, Svyatoslav Ryhel wrote:
> > From: Mikko Perttunen <mperttunen@nvidia.com>
> >
> > The MIPI DBI bus allows modeling DBI hosts and peripherals using the Li=
nux
> > driver model. DBI hosts are registered by their respective drivers. Dur=
ing
> > registration, DBI peripherals are created from the device tree nodes
> > provided by the host.
> >
> > DBI hosts expose operations that can be used by peripheral drivers to
> > access associated devices.
> >
> > The original code was authored by Mikko Perttunen; I have aligned it wi=
th
> > the existing MIPI DSI implementation.
> >
> > Co-developed-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
>
> The SoB situation isn't right here. The author is allegedly Mikko
> Perttunen, but you don't have their SoB, and yours isn't there either.
>

This is up to Mikko to decide what to do.

> Aside from that, which MIPI-DBI type is this supposed to support, and
> how do you intend to support Type C panels we already support through
> SPI?
>

MIPI-DBI Type A and B, which have NO support right now.

> Maxime
