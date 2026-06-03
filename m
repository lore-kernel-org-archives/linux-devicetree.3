Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21F2937BE7E
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 09:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780477942; cv=none; b=fQFRk+jb8BpTL/g46dzOrw3Liq16mEQPeth+mgZ/e8OTbi6Er3YgkuVnW3hf0kkFJH3VEDoT2/SpFF5mlFV5Iip2TEIkx8WqqqlhUa19Qsr/yoAU8QzSbenCakmrxFMw0uTgEc/6p9MUU7RC6zSUJRvTVqxW0+KR2+hjm67PN7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780477942; c=relaxed/simple;
	bh=3+cgJYxtN/cU3yRwvtnpc5EaqECC20THPXie3jHikQw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M0FR6TEHb9DVXFBVlFoBiLqA22w8XQ9JMW3j/Pr3kyYKaDskEH0WF8A5wJtSbt8ZZzNuJMwnrkgA37ncridWuAt29p7YhjH/qIn6zqR/B6H9+HGyK826RF4gPHwHwjDMMih71f8G47O/hVDCNkgWnByd5o5O550Ae94j30U42V4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DROnFZ92; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DROnFZ92"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-46019edc13dso914368f8f.1
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 02:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780477939; x=1781082739; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7Hkz0Eq0uDpMi6XdoQlTFpPc33Fvk2t3F5VcoWVOi/A=;
        b=DROnFZ92M+r8sqM1Aqw+esV6DUmS1atjF4BqgtyoBXTaEF99NdWCy5T9X4x5h8ydH+
         5uAmlisg8Zjxu1mI961MzasfzsKxpdoFhTY37CCstf7gCoPje079HBycdvmVCO+qMcxf
         +oP2krsDlFZLovqIybQQv//wykRmJ9wf6gsxbB1GEkj5/4ng6RLhzASt/ltrQF0m9H3L
         rALmyjfad9tGcRj7qKmwWECbJ4ngv4dii3KfB+ig9yni8Nw5PaHG46N9G2DUuArskHbG
         VWGyvWZNiHaGdJg2G9cw3WIm5muCk+gYC6HWQ4O1Jlh095hmHXV/GoMezbJ/Tf10uIlh
         H8Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780477939; x=1781082739;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7Hkz0Eq0uDpMi6XdoQlTFpPc33Fvk2t3F5VcoWVOi/A=;
        b=XgT54rAZC0Og/f1xNMTakvPiClh4OT/U/fR476bLkLAJ39/YfzExSDuPp1CL6IT3jQ
         NYZeRXsnJq93Sdy2zZNHT28UDpJxLXu8PXRDfMT5qPT5HGncHgyvMxLJ8hJXEo15czfj
         WC4Ll3p62RvJylT89Ihwd+9ZeyA+L2TcVYIEeAwWktA71hQN68utGBW+vxSIJTL7QslS
         vFNVPEX6kNeU0Kri/Lwu3HANM/ExSXTM3wR1XQJatD2XwuZLvnDnJnL8fHv9Px3g0NT7
         xjKA0Js1SKBQJuYZQs3IWcwA/mefYSw/VvrgBwR75jpOTIhk6M+w2pIlzEhSi6rU8Tap
         JpTw==
X-Forwarded-Encrypted: i=1; AFNElJ84KjvHCeocq7vVDHjHQ9EySspXwQTQu52RvDFkmGC3AEuzH3oi5LO3U+IjQw0ejRFfKlgEg3ad7eIE@vger.kernel.org
X-Gm-Message-State: AOJu0YzEcMVaOGtmHZQdDo+5kCStsQugJfjqIUZ7RmTnkgLt+Sv6L+hk
	llRHJJXmgUtHptGxTXouJAcj1f54/YM8ipuP6ZKD811YmMcpXadjjJrM
X-Gm-Gg: Acq92OFxJX/aV9CM3iIm4p4xuG7opHqSghLFMfCaPG48mE1ujocswyHB2CMfcEgcudm
	kUJB/VTTmpcRw1S1n8IaaKN80u/WUIrUqEYkgFNa9C1bg34sZhrWalciH7xAZ2KGKLmO8seMRqm
	U7QafDGA/KurysMC1n4u0q3QOGvvc5FQ4/Ub9vZXgAoEtmaA3WE/Xw1cb8R5i01aNI6md9OrIX6
	tKs6DHfJheRZjcJ+0T9bMwdWrvoV/eWStJKS8QkGXQdFchxEBNt+0A5Mdc2mgXgq7StmzolktZ/
	T1zNgtuTty045XgLgeRruJZ5xzL1rSwoAHheLYnLkVkoSB8kTNglaTRGeGTrjF8rRVp2W7Tt7bt
	oXyffvHsdAl6hOY3UfI8ZFqrJtZHx13W4QFOGtwDegZuZGEiMlWEcS6uoy+5CsGnKJc6s6bu5+K
	/ituhK+Nfb9lFThn0DyreVpb3BMd1kyKtFSIjTRrd9NxlvRQSWlg++lRtzLBgrUJaDXg/gpCkHu
	m8KqyhReIIhXTnFXcq4xA+m2YOs6tvmOUg7HORatfHGDiOMjhpcQftJvoKpoX04ZA==
X-Received: by 2002:a05:600c:4510:b0:490:a298:3859 with SMTP id 5b1f17b1804b1-490b60f001amr37402095e9.24.1780477939047;
        Wed, 03 Jun 2026 02:12:19 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b7c6b966sm25579115e9.2.2026.06.03.02.12.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 02:12:18 -0700 (PDT)
Date: Wed, 3 Jun 2026 11:12:16 +0200
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: Frank Li <Frank.li@nxp.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v1 1/1] arm64: dts: imx91-var-som-symphony: fix RGB_SEL
 handling
Message-ID: <ah_v8E78aV3n1TZx@Lord-Beerus.station>
References: <20260529134850.22196-1-stefano.r@variscite.com>
 <ah3uuIeZ4Z6BMwfi@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ah3uuIeZ4Z6BMwfi@lizhi-Precision-Tower-5810>

Hi Frank,

On Mon, Jun 01, 2026 at 04:42:32PM -0400, Frank Li wrote:
> On Fri, May 29, 2026 at 03:48:50PM +0200, Stefano Radaelli wrote:
> > From: Stefano Radaelli <stefano.r@variscite.com>
> >
> > RGB_SEL is a board-level signal driven by the PCAL6408 GPIO expander on
> > the Symphony carrier board.
> >
> > The signal needs to be driven high on the i.MX91 variant to keep the
> > board in the expected display configuration. Move the handling of this
> > line from a fixed regulator tied to the PCAL6408 supply to a GPIO hog on
> > the correct GPIO expander.
> 
> Look like this can't resolve your problem.  gpio driver may probe later
> than display, so gpio-hog may not set correct when display setup.
> 
> Frank
> >

thanks for looking at this.

The main issue I am trying to fix here is that the current upstream DT
describes RGB_SEL on the wrong GPIO expander.

The existing DT drives RGB_SEL from pca9534 GPIO 7 and also uses it as a
fake supply for the pca6408. That is not correct for this board. RGB_SEL
is actually connected to pca6408 GPIO 7, so the current description does
not drive the intended line at all.

With this change, RGB_SEL is driven by the correct GPIO controller and
this fixes the hardware configuration issue I am seeing on the i.MX91
Symphpony board, making it working now as expected.

Best Regards,
Stefano
