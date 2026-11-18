Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795015513;
	b=mEWKoGS1WPkiufpk3SOZ+UBeWgaO46tmc2EZ3OCyBI1eeItZeiSojOlgNCagfT8gaqiE
	 Xap2UuqgCnfhvIOpnrc5eAQm/yF02n5RcXejGZ+8WCXLFlGQw96/CD3H/rqGWlUDPpbOa
	 FITPpANoyKOACtcqk/HDgAJDW/TRqjuCCDffQ7Du2Whi82KBhP1zYZKFExiy6A3g/obWj
	 VBtgNWSRHBlJBDF0lYQG0PrtrOrODrLxSTc02UbLB0unDxo+4WdeYNyCtch3uOYwITdrC
	 4OtYlC2U/PYZb8Ap7IFtnIA2qME0iELuhU9mMeIPMGhfQrBatRuwXPjdofYXXF7QosA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795015513;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:In-Reply-To:References:User-Agent:Date:Message-ID:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=CEm9dGLjcVwIMaOu+kqX5t+aM+qvinbpRnz4RyrHHjY=;
	b=EjhCZR8zm/WqkMlQqY/YGQD++BEvBQUU1K+OVBALbGWRSL7w6W6ZYLX4iZi4UTW7izVE
	 AX8JxBxZvdbQELtuvPaOGcuiaVFdFUbsS7xK/+txn19LNE63wvV0R5ZQ4IfE8ii1EEC1R
	 G8eU69DgY3sqmiXo2Ahfwa0tBEuxYZFd1mooEhd38CEzWvMd5V6MlZftLfln9fno9MwId
	 6ZW3XdTDFRP/JBth4ybWDjG4PbNmnXcqvxXhBWXUL+gmZ6eDVhXCPk+1cznBI5odVMaOF
	 UnlAnuTZJIsnd7ceBpYl5jVpci736xSEAMjEuZHSxH08OFIXfe5EV3T8xNQgbs/3uwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=ez0Qk31S;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCA86606A31C
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 15:25:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CCA86606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=ez0Qk31S
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 57EBD1A16DA;
	Wed, 18 Nov 2026 15:25:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1CF7A5FFAF;
	Wed, 18 Nov 2026 15:25:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DD84511BC24A1;
	Wed, 18 Nov 2026 16:24:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795015507; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=CEm9dGLjcVwIMaOu+kqX5t+aM+qvinbpRnz4RyrHHjY=;
	b=ez0Qk31S9QtS5y2slTb9afsub9oCe6bae5MiTUqJxpin2qhPa/86oOfDJEL36e+gl/hq0N
	kEnC3vQ/205ru9vEC10gYcjPTsRmnX//2rgC5Wx2FKON3+9NT/nmkCxBY3JiKRzDAdVXDe
	X1QqcVc9mq8Tj81LItHKUr3ofwCvWX+JtRYzEAhcWSCgkhrhTRrfxydmvXQ95204cpIt6K
	wPa5K1JZo6iSY2/i9QSdi1nO5hAo9BZ0jMf4fM1/dGszaXdZohsemd7ReSwIaLpNxZ2kPx
	XVhMHVqEHsmm/OVrCmCKoxpzsAw/VuzxbkvgKNQKcjKbhZzL1VqNr1rtLkFGhw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Jacky Huang <ychuang3@nuvoton.com>,  Shan-Chun Hung
 <schung@nuvoton.com>,  Michael Turquette <mturquette@baylibre.com>,
  Stephen Boyd <sboyd@kernel.org>,  Richard Cochran
 <richardcochran@gmail.com>,  Arnd Bergmann <arnd@arndb.de>,  Brian Masney
 <bmasney+clk@redhat.com>,  Jerome Brunet <jbrunet+clk@baylibre.com>,  Rob
 Herring <robh@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>,  Andrew Jeffery
 <andrew@codeconstruct.com.au>,  Avi Fishman <avifishman70@gmail.com>,
  Tomer Maimon <tmaimon77@gmail.com>,  Tali Perry <tali.perry1@gmail.com>,
  Patrick Venture <venture@google.com>,  Nancy Yuen <yuenn@google.com>,
  Benjamin Fair <benjaminfair@google.com>,  Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>,  Steam Lin <STLin2@winbond.com>,
  linux-arm-kernel@lists.infradead.org,  linux-clk@vger.kernel.org,
  linux-kernel@vger.kernel.org,  Krzysztof Kozlowski <krzk@kernel.org>,
  devicetree@vger.kernel.org,  openbmc@lists.ozlabs.org,
  stable@vger.kernel.org
Subject: Re: [PATCH v11 00/10] clk: nuvoton: ma35d1: Fix mux parenting and
 peripheral clock rates
In-Reply-To: <179501501070.639563.9357303541273366380.b4-review@b4> (Jerome
	Brunet's message of "Wed, 18 Nov 2026 16:16:50 +0100")
References: <20261118-perso-ma35d1-upstream-clk-v11-0-bd1d1e060926@bootlin.com>
	<179501501070.639563.9357303541273366380.b4-review@b4>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Wed, 18 Nov 2026 16:24:56 +0100
Message-ID: <87o6bmgo1j.fsf@bootlin.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

Hi Jerome,

> We've had to base clk-next on v7.4-rc2 because it carries a treewide chan=
ge
> around devm_kzalloc. This was triggering a lot of conflict in linux-next.
>
> I did not look at your series yet but it does not apply cleanly on patch 3
> (maybe others too) because of the same change. Would you mind rebasing on=
 -rc2
> or clk-next please ?
>
> https://sashingci-clk.liltaz.com/builds/555/steps/3

Yeah, it broke my MTD branches as well... Mark Brown is having a fun
time noticing all the subsystem maintainers one after the other.

Yes of course, I'll rebase on -rc2.

Thanks,
Miqu=C3=A8l
