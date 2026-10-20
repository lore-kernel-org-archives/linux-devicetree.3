Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.167
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792492950;
	b=Y7eOaPF8wfaMaPHqqwDIpqAxbH/H7ATEBdWmDzgYmzpj9CdRMoSMQM4Rekffkq1DAdEE
	 A181qhFhQjzZ46rt5MJdFBVLKY9TCvTFje3eMWwMdpd/bkvpwtNEPWOLtUG5vpeqaauO0
	 5py1+/T9Ck0/eihloWjnEkbc/cBbJ1t6EyyM8g4ECN5PgYvjAEheV611M0DKkKRSmuo+9
	 SR8YIEgB52dFUF1j9F0DJ68OcqpMMMpIlV0RSIgIPlrgnn3kaKx69E2dvXJvpxGqcJHFE
	 lpiEltAr5unjA/RkgRYnssHA0RcSEGQ4bz53fKfdc8Qy9ijA5pbsQCej/yhcCli5VeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792492950;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=FhY/buZq8qZcY3rN3OPgKMgzFsab5qOuy5WLXWX8or8=;
	b=vbOK+bjp8/Kt3WOWAlrW6Xm2BA7yPFTsoWA/XrO6nxXoVAEoEj/jqcbT/L0dScTZuctz
	 Hz7EJfTGi7j8JqJbnQYnd8LV6ZR/IKDoSM0BCc1lW0+RPZBHUwF77atVVhuXnACRVeJzt
	 eWrz06ubFo/8cbSJ4vKwkB/WX+9xA5W5iVzc56cG8b/KKjsxith/m0pztNxgB69Z9+7sX
	 pdXNyat13XMgkuguVjfjw6aBz/1U9a4Xh0/jdkfxk/9DKlKd/cbgQLIyYC2/Q49JmSj9Q
	 fEy7p3zK9IDi6OZxoIT2QCdTQQtXyJiRQlJ8A0pVysjwVVcZpY1zESfaUgxp+JV7FcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=protonmail.com;
	spf=pass smtp.mailfrom=protonmail.com;
	dkim=pass header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256 header.s=protonmail3 header.b=AxH+hKLI;
	arc=none smtp.remote-ip=185.70.43.167
Received: from mail-43167.protonmail.ch (mail-43167.protonmail.ch [185.70.43.167])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95E6D606A31A
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 10:42:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95E6D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256 header.s=protonmail3 header.b=AxH+hKLI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1792492947; x=1792752147;
	bh=FhY/buZq8qZcY3rN3OPgKMgzFsab5qOuy5WLXWX8or8=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=AxH+hKLIiEwKeOct9itNuDm1mwkpIA49KP6dHfhgR4qvK7aGgnAoyYcZ1e9+g3nb/
	 Zd52f0e924wL9/zFDreFCy2XInTxhjHTga5GMA+gRkOrt6aWjKc+QPeKmLd1b+ipLW
	 h6U7zTCrV51FhMl9UiWhgyGtHu6XNSXo61+lznKaXme+ywjiokhby4+xeC3QTCFz3S
	 jxW1WI9WoN417GtYMesAsEe90nhCABDasRBgkHAmDTsRm4DZaPVrAcWeWHP+dm9cjU
	 L/BBumpf4P7rY5M0NlHJnJ36uMmaWjnu8kITSnBgv6Re2RiSEDIjIEVI78l82IHtDM
	 l4u44QDwyahhA==
Date: Tue, 20 Oct 2026 10:42:21 +0000
To: Aiden Isik <aidenisik@protonmail.com>
From: Aiden Isik <aidenisik@protonmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Aiden Isik <aidenisik@member.fsf.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/5] arm64: dts: exynos: add initial support for Samsung Galaxy Watch FE
Message-ID: <5CDdVVnZEwA25WkRzHJtuO-Tw47UZGTEFrZ9SBbQ2ax1bG9_OUemLDoX5C-TzyFyS5WxuFauKFU11QGk08RM0_Nn_3HGrglq0AR7wr8IggU=@protonmail.com>
In-Reply-To: <pyssceEfVM7C-RyMLXJw8UV4wTs-zyDxywEasLdafttU1LwckC7RjzO4BvAhElk2ExTaXVZYZ0NSQ82FcgBFXSrsGmj2TtBQ7HN0vv7gEOw=@protonmail.com>
References: <20261019-for-next-lucky7-v2-0-c4ecab4b1c4c@member.fsf.org> <20261020-eminent-juicy-woodlouse-c3fd24@quoll> <pyssceEfVM7C-RyMLXJw8UV4wTs-zyDxywEasLdafttU1LwckC7RjzO4BvAhElk2ExTaXVZYZ0NSQ82FcgBFXSrsGmj2TtBQ7HN0vv7gEOw=@protonmail.com>
Feedback-ID: 46524699:user:proton
X-Pm-Message-ID: 72be47aef9cb2283fc2490f8c7ce36d8a972c2ee
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

> Is it a wording issue? I don't depend on actual driver code in the DTS,
> only bindings for the hardware they drive, so maybe I could make
> that more clear?

To elaborate on this, I listed that as a dependency because that patch adds
the compatible string for the watchdog timer, and I was also under the
impression that drivers must be already in-tree before a DTS patch which
uses the hardware the drivers support can be applied (otherwise you
would be merging a DTS of which parts do not work as the prerequisite
drivers are not in the kernel).

Is this not the case?

Kind regards,
- Aiden Isik

