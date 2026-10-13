Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92C023AD52F
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 17:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791912910; cv=none; b=kyWon3Gr9chvIhEZ5/MVqzXbOXlEXhWSWkym+r+wbh++nQZblJnZeGLuBJ/JD8s8+zlSiNVf5efg+Q4ukdNMpdotFw9nZ+emKjG6nAg0iWhKl/R5705+F3zTp6saYZOnEzKU2hPxfWtbJDI0untiMBp6ZCaxnHE5zRW8Yf587d8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791912910; c=relaxed/simple;
	bh=PqaAprE6zhOL8p22rLBYn5eJgHj6opqszjk2fOReKAQ=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=J2aR3VrFyjgqOTpnFBlxRHARvl3J1MYpzQ9WpJaNtZ5Z9M6ygqd8Ti2PBiu4wNxo2a6xnUIEjJk+zoXd2BAPPqMQ0a2DEI+CxAWM9Vi21fnFGj1Pi9wnGZW3aLs3pQ1GTKCtPh6fUEfP7HH8uJCn2yq+muzOP7XYJYpGtvZ6nzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=gRlSCGAL; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="gRlSCGAL"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a021c809e3so32141545e9.0
        for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 10:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791912906; x=1792517706; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=XvXZ6HBIwKrdmh6LJViiFdMYKRVjXSvkOWi1JS6VLBw=;
        b=gRlSCGALR1cMhSLmk1EHyHG3Cn0GUrKn83hB7XFmRmo7kC72Q+SetqF27sYJart/qE
         hrcCvlTC2AMIEeVyQ2qVVobbGwJr6kmsNuDcSk/rNLRXNym6lq7q7KBDe9jxx1sdXjfe
         4VVjD9y3KaHcphsDAguNw9kw0jndGyhnTDM8RTCU33TlaLiaw0eRFEJpAu7KG6SaqKgf
         VYjKJeBboSVJ6X7nhub//Mme6hwoli0Q4nepQlgvRw2Zgug+BuoQ1saLmd7hEgvynhpn
         EYppN18ShaB6Dn6jFhCbZNho9U2/xqTEmVR+JDsvj9j+rcXdzBJFVJrHD26IXeIfs9WX
         VdOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791912906; x=1792517706;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XvXZ6HBIwKrdmh6LJViiFdMYKRVjXSvkOWi1JS6VLBw=;
        b=Ux7dftQb4SRXNCgEHKoV/tMy0BynMKMi77QuYZT/QTfxFagTdWawut3MTXSyFcNnWf
         wn5w4IAuVAlMQqsYUajOW03Z2PLLnSCSYi/aFO5m5brFvbk5/y72LzETtuKxm7wzJl+I
         C5o35GfkNmX2V0Kn0QanFPyPUTJ9dtSSWeG8eueSl6VOk1tHispcwYboK4IGKFyN7vBX
         DCyMSUOqfu87S9JF/anbnYkYNCqF0rxFciL4YUg8Uns43sn+QuwhKvmznI7oVr0wFmCz
         rYQlsrptEokf2I8msXpQ/2kk01b9r607tL27ZcxdOMbm/JC8h2Wyt10q5HysODx/vfGy
         u/Bg==
X-Forwarded-Encrypted: i=1; AKwUvBzSjJlIfVNQT3kYN2zZMBbffDOwOsegS98Nm0CB9ZE2rA2YdqgJ2siwxDbtz5bqTv7khV5BtZtGeGCF@vger.kernel.org
X-Gm-Message-State: AFq9FYKtfpbYjljA+m5BNko9JlqF2gWuOFww3GX6oVkcIU33ugjDws7b
	i44n7X61Y9+6gcmWwWb7luJoqnTxyMb+DJz6zVukaiZMro78Osovz4TljE7zcDWXbOkL5C4YWuA
	4PtDJSLY=
X-Gm-Gg: AYBFou0j/737eVCQFk05rbIBg/k5oKk+tbvMx3+sz5Ixtz8iflfwSiOF66yKCzTOttv
	oB0XCa1fZaZFYVepoYbpM+oo7Kdf09ZwBTapR85wb3EiFI3tlOeticlywb3p/bJXO5JEZg3Y3Wq
	owBvHGWqXoiVuMq7FXhwtqIHd4Atuebcw9YoeCHZxuyGuFOhmYooYS9pfp426sP1CCMtGLNFNUd
	r+qch8jgGKGNiqEbbJhKMHPr+kLdK9/d3WIRn1h4QnFuKoah5MezTUVn13MnXGMo8jV1KFJv2LQ
	hg+qihWuTsxyYzMSrWLhldUObhHXxv8VilmRFLp4qdcAsesiPysPMRV5IFoFxQ5MI43yVxd8kcS
	fgc7+eC4Zgx3jnNyz3y4rz/Q6SD9E6OBX1fx6qnWmh1HgzwHqXi65/BKFSaBfzhauUKaqe9oTMP
	P8NP0qD1I6GtWyaiwPBmY6yOqVtzsAlOnpHVSCvjaqw47fyaqu/Ke117pzMhiqId+KIFypafy3N
	cdcysLhpQWGy0Fqm3exHlAjsPt+
X-Received: by 2002:a05:600c:e556:10b0:4a1:93fd:8f2 with SMTP id 5b1f17b1804b1-4a193fd0a16mr140466375e9.6.1791912906474;
        Tue, 13 Oct 2026 10:35:06 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bf2343asm684245515e9.9.2026.10.13.10.35.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 10:35:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v8 3/7] clk: nuvoton: ma35d1: Retrieve HXT/LXT from DT
 when possible
From: Jerome Brunet <jbrunet@baylibre.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, sashiko-bot@kernel.org, 
 sashiko-reviews@lists.linux.dev, conor+dt@kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <87fqy9v82c.fsf@bootlin.com>
References: <20261004-perso-ma35d1-upstream-clk-v8-0-e1a106a128c0@bootlin.com>
 <20261004-perso-ma35d1-upstream-clk-v8-3-e1a106a128c0@bootlin.com>
 <20261004205903.E62F91F000FF@smtp.kernel.org> <875wzhjhe6.fsf@bootlin.com>
 <1jmrss7byt.fsf@starbuckisacylon.baylibre.com>
 <87fqy9v82c.fsf@bootlin.com>
Date: Tue, 13 Oct 2026 19:35:04 +0200
Message-Id: <179191290452.266355.16355634952216272745.b4-reply@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2308; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=PqaAprE6zhOL8p22rLBYn5eJgHj6opqszjk2fOReKAQ=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFnnsk9M2LU0baczm61fbMG91GMrv1geYA09+f3eywDbx
 X9miKc2dpSyMIhxMciKKbLUcFeLv5PU+jJrus5tmDmsTCBDGLg4BWAiJvmMDL9US31uKJx48rTj
 Tr1oeNhpBvlLn0SD1ANYbrnab2W408Pwv0T0g0rGeTk/SeEuic5eEZOX+Q18pw4oJwnf0Tau0tj
 DCwA=
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

On 2026-10-13 19:12 +0200, Miquel Raynal wrote:
> Hi Jerome,
> 
> >>>> -	hws[HXT] = ma35d1_clk_fixed("hxt", 24000000);
> >>>
> >>> [Severity: Critical]
> >>> Does this unconditional removal break ABI compatibility with older device
> >>> trees?
> >>>
> >>> Because HXT (index 0) is exported as a public ABI in the DT bindings,
> >>> removing its explicit registration leaves hws[HXT] as NULL in the provider's
> >>> clock array. If an existing downstream or older device tree consumer explicitly
> >>> references this clock via clocks = <&clk HXT>, won't the provider's
> >>> of_clk_hw_onecell_get() fail to resolve the clock and return an error?
> >>
> >> Jerome, your wisdom matters here :-) For me this is a false positive,
> >> because nobody outside this driver should access hws[HXT] and the clock
> >> is still referenced through the DT, just not provided by this
> >> driver. For me this is not an issue we should consider, let me know
> >> otherwise.
> >
> > Strictly speaking there is (used to be) a clock at this index so it is
> > not a false positive. Someone crazy enough could have gone through here
> > to get the OSC even if does not make a lot of sense.
> >
> > This clock should never have existed to start with but it got in the
> > bindings ... and that is the pain of dealing with bad bindings :/
> >
> > You've got 2 options:
> > * Removing the ID from the bindings explaining clearly that it conflicts
> >   with the fact this clock is actually an input according to the same
> >   bindings. I suspect the DT maintainers won't like this much ...
> >
> > * Keep the bad support binding in the driver: You'll need a pass-through
> >   clock element where the parent data is the fw_name and a fallback to
> >   an `hxt-fake-internal' fixed clock. Feel free to add a comment
> >   explaining how bad it is to use that clock and what user should be
> >   doing instead.
> 
> Too bad. I am pretty sure nobody ever used that yet (since it is both
> very recent and fundamentally broken) but okay, I'll keep registering a
> dummy fixed clock there in case anybody ever cares about that lookup.

Maybe I'm a bit too cautious with this. If you get the DT folks to ack
the removal of the ID, I'm fine with you dropping the workaround.

-- 
Jerome

