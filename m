Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D57D4606A339
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 10:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UZ7b9wFp
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B3171F000CB;
	Tue, 17 Nov 2026 10:01:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794909697;
	bh=wJ9+WdNzsqniPWHZUkAZp3YQBoG3ifeT1hqU89lnzug=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UZ7b9wFpfMw2vME4RO8mr6Zmx+eBLOkD2EExbNaSeTsZS7lQgN5jWJVhlKwQCKPq/
	 RYBH7qbnZifhR3EezVamUb9sFvb1cXbejm2sOP7QrrHRq33m9mtzd7NPy1HXt5PCFc
	 vUGe8KKepHuBSV8B7zt2wFNMEIeS2e3AKFB6Ph+KnIs5JJd5FJMQv57ei/YWcGgx+T
	 yVwGe5Gcj3siVz7+pVmMVAOaaXSzfBcnKYEzO/4YtoFwBlnNAIhPdr1CN2p8vUc0Qt
	 EU84TnQ1xdq0NFbNqyYKhfXle2asMK8bheidpz/fzMG9LxTY7qqjnwSGu9rdtRHUW3
	 tYX2FcP7kfdfA==
Message-ID: <sashiko-outbox-218560@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v12 3/5] clocksource/timer-econet-en751221: Disable IRQ
 until cevt registered
Reply-To: sashiko-reviews@lists.linux.dev
To: "Caleb James DeLisle" <cjd@cjdns.fr>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261117095117.173316-4-cjd@cjdns.fr>
References: <20261117095117.173316-1-cjd@cjdns.fr>
 <20261117095117.173316-4-cjd@cjdns.fr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2026 10:01:35 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] clocksource/timer-econet-en751221: missing Fixes trailer for IRQ
  race fix
--

commit 93affbec7851d413710a9c422ba505847184084a
Author: Caleb James DeLisle <cjd@cjdns.fr>

> clocksource/timer-econet-en751221: Disable IRQ until cevt registered
>
> Eliminate a race condition where cevt_interrupt may trigger before
> clockevents_config_and_register has been called, and dev->event_handler
> is at that point NULL. Additionally, NULL check dev->event_handler in
> interrupt callback just in case clockevents_config_and_register failed.
>
> Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>

[Severity: Low]
This fixes a race condition and potential NULL pointer dereference in
cevt_interrupt() and cevt_init_cpu(). Should it include a Fixes: tag for
the commit that introduced the driver?

  Fixes: 3b4c33ac87d0 ("clocksource/drivers: Add EcoNet Timer HPT driver")

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261117095117.1733=
16-1-cjd@cjdns.fr?part=3D3
