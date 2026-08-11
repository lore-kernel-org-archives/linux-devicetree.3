Received: from smtp-190a.mail.infomaniak.ch (smtp-190a.mail.infomaniak.ch [185.125.25.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3F814322FB
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 10:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.25.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786443027; cv=none; b=RoNqHepOC43ODBlVbx1F/KlzRnAvr4EQQZG1kXi/6/BrtyJ3YS3xdFrt/jJKm78dmQw/Ia95EpqHdehulO+CVuMWRUs40/YsL23dt+kgLyXXpMnYo3csj9DVHY5o40ckeW8rmrH1Wtec1iWrbWn0cBTh2ImlxIcF19VYq8B1FfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786443027; c=relaxed/simple;
	bh=RImZ+pRya9h81uprhPuyebAsvTi+jgFoR5fBRCz2C4Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TAG49PabyMmwd+y0TNQdqr/xfWleRO+6K8pkOy3PUQJplG8R1zhDGal6Ij7y1pgRamDqa59RXEUFpIB1VRTOsC3Ax4jztXfBy5lpY1MHUsEAcTC0M4DsY003Wx1PP1cKYMoBEv+WnROhCE0yZregiIq0Rxppzrc2VBg9s2uU+iE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=humanlearning.ch; spf=pass smtp.mailfrom=humanlearning.ch; dkim=pass (2048-bit key) header.d=humanlearning.ch header.i=@humanlearning.ch header.b=FI1YFsXM; arc=none smtp.client-ip=185.125.25.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=humanlearning.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=humanlearning.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=humanlearning.ch header.i=@humanlearning.ch header.b="FI1YFsXM"
Received: from smtp-3-0001.mail.infomaniak.ch (smtp-3-0001.mail.infomaniak.ch [10.4.36.108])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4hK6cS5C28zbc3;
	Tue, 11 Aug 2026 12:02:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=humanlearning.ch;
	s=20250828; t=1786442552;
	bh=nBRaUYKTI/2+X8NKEbYlQ7/P3Fz/oUZ8JV6I5QuZaas=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FI1YFsXM0Z/BiooIofy1TJVIbRnJxNCSkXwd1PsFOrawA2FWvvsxaEnEcfVStxwZQ
	 qEcIrLOGj5iCAWWrBHZul6WY7NCda5K4pys3eAdhlSyWV+lViG6g8N+QtUOoR0k5wf
	 SvOgb1exXfCynMj0rHCaK89ji3apLOeepTNC/7fziRgUa0gAa5kA58eXRhmOyCIEpY
	 mRs7KTJ1r+KBO2ymmLGA9cwvPeZldVZSXJtnyJzXB9YiFKkFQjCdTKeLs8cjp+Ii8m
	 2OlM3waH0smj8JPD/VYZmzcs1v8exeiFMTkngdhzde7sX5z4AI3WFhAmRI6OJuzvyR
	 MvTiFeGo+QB8g==
Received: from unknown by smtp-3-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4hK6cR5RdkzhX0;
	Tue, 11 Aug 2026 12:02:31 +0200 (CEST)
From: =?UTF-8?q?Fran=C3=A7ois=20Roux?= <info@humanlearning.ch>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Harrison van der Byl <harrison.vanderbyl@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: Surface Pro 12in (X1P42100): touchscreen variant, different GPIOs
Date: Tue, 11 Aug 2026 12:02:31 +0200
Message-ID: <20260811100231.79480-1-info@humanlearning.ch>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <CAGA=SDgb93GiaZtdh85q6oWxywjHCiz-hXj4ebukEqM1_aTifQ@mail.gmail.com>
References: 
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Infomaniak-Routing: alpha

Thank you — and I owe the list a correction, because my report was wrong at
its root.

I claimed the upstream DTS describes the touchscreen on GPIO 51/52 while my
unit uses 38/48, and concluded this was a hardware variant. It is not. There
is no variant, and there is nothing here for anyone to act on.

What I actually did wrong
=========================

x1p42100-microsoft-sp12.dts does not exist in the tree I was working from
(next-20260626). It was created *in my own tree* by a patch I had applied
myself -- Harrison's v1, which carries the GPIO 51 that he has since
described as an early mistake copied from similar devices.

So when I wrote "upstream describes 51", I was reading an obsolete patch I
had applied, and reporting it as the state of upstream. One `git log` on the
file would have shown me that. I did not run it.

Two further claims of mine were also wrong:

  - I wrote that booting the upstream DTS would leave the touchscreen dead.
    Per Harrison, GPIO 51 works but with degraded performance and missing
    pen events. Degraded, not dead.

  - I wrote that both descriptions were "internally consistent, so this is
    not a typo in either". The consistency was real but proved nothing: a
    mistake copied consistently across the interrupt property and the
    pinctrl state is still a mistake.

Where things actually stand
===========================

Harrison's v2 already fixed this, and v4

  https://lore.kernel.org/all/20260609145906.40854-2-harrison.vanderbyl@gmail.com/

is the one expected to land in 7.3. My machine's wiring (38/48) is what that
patch describes. Nothing needs discriminating, and no separate board DTS is
warranted.

Sorry for the noise. Thanks to Harrison for the quick and precise answer.

François Roux
