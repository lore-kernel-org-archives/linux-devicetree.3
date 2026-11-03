Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793699649;
	b=WNeT04EFEQPLpsFVsKR45zBfWumY3xjQLR4Pk395vAfAlySC/ohABaMW++drx8mp/xDy
	 mje3ivU+eKvdlz2xrrTjHk1o3XSiGI3QGQT180J97e9sjNdLin7xbDJzFW475QiwAFpp3
	 1WT8z78Jp6ho8km54gKQc0FJD4MywKCVDcfjtjeTXu6m9ym80HT8We/wU5MjniRSDRduh
	 BEUpF+YBY5LpPRoQahKDEc0ckcPVaNYcQwBhRMCfmle49g/VBbMBVjN5Mic8ayk/0uo58
	 MfCUdiI1pGm5a2uf7dE9y1KZwd3WoWknhtieUZEcdBjhfczACjdWHcwWg6+eLN6EMHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793699649;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=Wy4OVqINXkwCakS/yGHU8W8MCAAF/D/083jT8dDHKck=;
	b=EgM4W+mJiFp1StwtBcoFvRLmo7WzI972IuoUK5+zM6nArpbiPCJ7ZJO/twS8UJS6No/M
	 AT99IFWZiZGbpOqaaRU45hihrkE4Cl+W5hjAlrgFGhTGyC+9yBC5IZBvU0Ezm1a3ZMl2B
	 +83F3B1q4VUDcp0W2xWUlLvCxPKiQrpyMeTmgkSXZvpr7OyY97fw/G0GdXNDVl2JDKZF0
	 nd+MeT37RNns9Nx8RA3IwVUCJKattbL8QBrK74I+v5wJMumUroq85uF3rp3EPmWwNyTj/
	 w/7ogtT6iDp00dTr4QdYA0duEIKz7nwOXR5N2MBlycj7ZLBajfOwxmGsbQXiXAobEmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=KMlQObsf;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AACA06082BF0
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 09:54:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AACA06082BF0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=KMlQObsf
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a2167bd087so33068415e9.3
        for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 01:54:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793699647; x=1794304447; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Wy4OVqINXkwCakS/yGHU8W8MCAAF/D/083jT8dDHKck=;
        b=KMlQObsfiwkd1ZbJuxRjv4Hwvrsqf/d2jrRY+Q+/lqyK9wVP04+j6xmzJipO2Jb/uF
         tzGzoDT13jAbLYsUi7QiwzzbSwTNQPqvPnP87zURnCMvH08cWDEVvYoiqeTF/T7Yb7vH
         odAZSvBz8Vc8p+oeeQdi+zMUlakYiOZ9Fjx2sEmlC+d3oZmn8Tb84Oxaewv7vHTbGXvY
         jgVz4pDG8ihctxTZ8oZ9rKokj1IOD+7wkA2Twm+p9UnrJcVxvsV8DtIfc/FFQq/lg8e8
         UEUexhAKw9YMMojDJg4TI+yFjTyd1HFuK6ok3mk+EI82DpGIovMHk5dCkSyo/95qcwK2
         SyDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793699647; x=1794304447;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wy4OVqINXkwCakS/yGHU8W8MCAAF/D/083jT8dDHKck=;
        b=keYM8i25Y5H3g2ef/RfCKhT0P9zBGLCE+VAc/VBFzsIeu9OTutulLHmd1alrG3PO77
         H4n1F169tJdz0TuQ1pWKMtmQZyrqpIRDWGK9WM9nX4ZDQs0diO4tGc/3cvTfDyjzUhtL
         gv2Ue7DVrcBoYRSx4BSlQDQpWuX+wYWBGFNsm7nutzucSCWAXE8TCo+UASFXwSaygspt
         NoMlp7Ml8mrJ3F4N4WxaAnxQ8dABvdy4QHg48z+TQ3GY2CIP1SbPVpSVOMziB+n5Txmx
         vdHME4lfQVgUT6LaaJtXRS/LoHmuXqOqic+17kZFHydEZFodPvEI5M1sEh9dMW8EUEqu
         /p0g==
X-Forwarded-Encrypted: i=1; AKwUvBwsQdIC200S6VOd6rztklJOEDLP/WVFcd/mGN7aOD3dcfAD/0/+GGwIuleXMQ/dCMJ3fhVl0H6WLEWT@vger.kernel.org
X-Gm-Message-State: APuU4Z/ob5A94391Ggq6I/ZwZwDOL62RXC8faWiWkolRFmrHt9A846aj
	OI0Jfv4tMzkkH5vV8ND3TFIRW38hSvGzCHXMiddy34KOECb7pKvwYv+VxRhGztN1P7g=
X-Gm-Gg: AYBFou0JTtc3h7u9rOe4LR1WR3nfnEGkbkOfMMZP8lFEtEahm3imvmsmVFTQao9PvcI
	yLtZtsY1eaT76AMp4dleahEUM/4s3Pfh0bCACtP1mVqijJzDWRNAIiOzvxLehmXwPuZW4rATYQe
	IXBSA1d97ls1ftR3FiWQW+N4zTDZVGy/ShL8bLqOPgFZaQzMLIEbZoCh/3GSQqMDleymTyVwwsx
	QTyy22Wt3v39oEnMrtgPxeq9G0q9tjpHqrLUzAkew0+NWhh0GDOknho/NWTSurA6d1jWVWxm33r
	EPMjZEL9Lg6/CKzkv3/Jjo8VexHroPL92XTo0dpSycUsi1oogvP7ossaBXn4qd7W+c6T43pPeV+
	VnvqkAjG7ojpJM1dBNhToUFRTBxPOVlIR/fnfEgPKo3YyGTQAL7G8NJkUHHV49yfRB/yCRCnQSd
	g1ojRb5SUMnkdufYLBHJP7gzPLOu5SkCCHY5aXcn2YPjOJ35mBzRL8pyXSm4nAom4dmR2QGoGWf
	zUbwAvvJHvCJc/gq1ycmzvO9i1UT2T2RCfEyvi6Arb9KlKCGU3DCs3Lai0K5y6SNe24FZUK42DB
	aIR81Zyp9V0wHo5BiYY/jVagbcEj3tZkq8Vj8nN9M5SxJJtHUw==
X-Received: by 2002:a05:600c:8b64:b0:4a2:84c:52f3 with SMTP id 5b1f17b1804b1-4ac16fa21dcmr308685225e9.6.1793699646995;
        Tue, 03 Nov 2026 01:54:06 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2aaa4b85fsm43219155e9.10.2026.11.03.01.54.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 01:54:06 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Ronald Claveau <linux-kernel-dev@aliel.fr>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261016-add-thermal-t7-vim4-v7-0-6eede5450fd4@aliel.fr>
References: <20261016-add-thermal-t7-vim4-v7-0-6eede5450fd4@aliel.fr>
Subject: Re: [PATCH v7 0/4] arm64: amlogic: T7 thermal support
Message-Id: <179369964613.2330120.9766633798877372121.b4-ty@b4>
Date: Tue, 03 Nov 2026 10:54:06 +0100
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

Hi,

On Fri, 16 Oct 2026 19:16:06 +0200, Ronald Claveau wrote:
> This series adds thermal monitoring support for the Amlogic T7 SoC,
> used on the Khadas VIM4 board.
> 
> The T7 exposes six thermal sensors (a53, a73, gpu, nna, vpu, hevc),
> each accessible through the secure monitor firmware interface rather
> than a directly mapped eFuse register as on older SoCs.
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v7.5/arm64-dt)

[1/4] arm64: dts: amlogic: t7: Add cooling cells to all CPUs
      https://git.kernel.org/amlogic/c/79279ee341b99634f3c106e5970e13d073e8b064
[2/4] arm64: dts: amlogic: t7: Add thermal sensor nodes
      https://git.kernel.org/amlogic/c/c3644a9b59fa49ef88bd312dcdf47cc6e155dbeb
[3/4] arm64: dts: amlogic: t7: Add thermal zones
      https://git.kernel.org/amlogic/c/e41608d8792d8de0369a0e90f7e0d2b45db27541
[4/4] arm64: dts: amlogic: t7: khadas-vim4: Add fan cooling to thermal zones
      https://git.kernel.org/amlogic/c/e90086cb0f608c55e0b2d17e8db8207e789fdaf5

These changes has been applied on the intermediate git tree [1].

The v7.5/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
for inclusion in their intermediate git branches in order to be sent to Linus during
the next merge window, or sooner if it's a set of fixes.

In the cases of fixes, those will be merged in the current release candidate
kernel and as soon they appear on the Linux master branch they will be
backported to the previous Stable and Long-Stable kernels [2].

The intermediate git branches are merged daily in the linux-next tree [3],
people are encouraged testing these pre-release kernels and report issues on the
relevant mailing-lists.

If problems are discovered on those changes, please submit a signed-off-by revert
patch followed by a corrective changeset.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git
[2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git
[3] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git

-- 
Neil

