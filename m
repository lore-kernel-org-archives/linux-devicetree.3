Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795710691;
	b=cPGF+172ZfysMPXWjAtmaZf2wB2xDp3i5PDpZgB+BNBhCOGwjh4C9SiGY0w2pgyA2Yfs
	 5cKTDwQTeN1tiHkb06JdHnG3qILT3A3ez0Rf7hpg0v7lIikCRJbIw6t/DjUOVg/O73Cio
	 mnBYTy87WtXmXZ6FvwQCD/mizIlJrH8pdyYRUkW1DJp7Z1yZHpJV/ekP9Owovs77fdQtL
	 ATzLU5mRIugNuADBkQFirzT2JNZ+CAxUvYe08a9zM2fySOqEfpyA4+bwKgDVgIOm+LnQR
	 zQmCoEIv9Ukr1LtN85thQHFAk8iNF5uJgaX4/eVWgkvI84vR7CMpiubMIlC+KPt2vrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795710691;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Mime-Version:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:From:Subject:
	 Cc:To:X-Mailer:References:In-Reply-To:X-Last-TLS-Session-Version;
	bh=oEbc6GvfEpsr54onGmOLNQTpL2P8UYZyii5KitTQG4U=;
	b=g4pf9pyOeMFdL8vs9YsGx2IK23v/RlwuhiXeumJGfabM7O0rxUP6rt1IdUjV+lDW9Ewc
	 /NRd0ZPOvhMMUWxxxiYPqEiGwWUXhfc+8AbMl9M8UZ8jIjlFmp7r39jItSOYpPMN2MsHQ
	 1F2doREP1FVj29dQytB/CC+q+jRkD8/1QtSbhn6xDw0ysmbCPrvxow6mnyOgQMHg54Nqa
	 CKNJUpA9eEA3cttMHXLI/ZHIX7uEMD45nkS/HhaE2v/2cTDaNQDrKIv8HjbSncE+/h4YX
	 89t3w00RPzfah/Ls3X7qEF+tkLXeYGNRqZxdIGOcRI3rqGChU3fwVLyP3jp6c33muaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=XSq0R6eb;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5019F606A31E
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 16:31:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5019F606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=XSq0R6eb
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id EE1F71A180E;
	Thu, 26 Nov 2026 16:31:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B15E360558;
	Thu, 26 Nov 2026 16:31:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9187311E69139;
	Thu, 26 Nov 2026 17:31:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795710677; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=oEbc6GvfEpsr54onGmOLNQTpL2P8UYZyii5KitTQG4U=;
	b=XSq0R6ebButZYZwwXysdG/xGnajy3rqQ4suyD0LoJQbwU11hLRZ1B0eoOxf1MbLLk4HqS3
	cpet4drLlqhnOh+GwYQvI6OuVAiw/q3rVszc/4nO0pJWDlAh7R8gh2yJY5zcVkHxKyhuza
	DHdjhh6BTJHeYwhKCnni7suBpptl0yz2DC9gPhRNtyO3H/KOmt1/9+tUcvolvNrPhZFkzZ
	MZUZfhcfo1dD5aSekGbXyv4R+D31dMMRuGEsmVEMZpTiVZS9U/7R5/t39J3XkOIawMv2WU
	rFpaTCg3QLM3N+fbFhdlYxdZ2Nprpo0UHzn78390G59CUwax7EF2RxquDvxRjQ==
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 26 Nov 2026 17:31:09 +0100
Message-Id: <DN5AB16C26GE.3M5Y1X38QATK8@bootlin.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v2 0/2] drm/bridge: tc358762: fix reset handling
Cc: <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <kernel@dh-electronics.com>, <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-gpio@vger.kernel.org>
To: "Andreas Kemnade" <andreas@kemnade.info>, "Neil Armstrong"
 <neil.armstrong@linaro.org>, "Dmitry Baryshkov" <lumag@kernel.org>, "Robert
 Foss" <rfoss@kernel.org>, "Laurent Pinchart"
 <Laurent.pinchart@ideasonboard.com>, "Jernej Skrabec"
 <jernej.skrabec@gmail.com>, "Luca Ceresoli" <luca.ceresoli@bootlin.com>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Christoph Niedermaier"
 <cniedermaier@dh-electronics.com>, "Marek Vasut" <marex@nabladev.com>,
 "Maxime Coquelin" <mcoquelin.stm32@gmail.com>, "Alexandre Torgue"
 <alexandre.torgue@foss.st.com>, "Tomi Valkeinen"
 <tomi.valkeinen@ideasonboard.com>, "Linus Walleij" <linusw@kernel.org>,
 "Bartosz Golaszewski" <brgl@kernel.org>
X-Mailer: aerc 0.22.0
References: <20261125-tc3-reset-v2-0-32eefcaf1460@kemnade.info>
In-Reply-To: <20261125-tc3-reset-v2-0-32eefcaf1460@kemnade.info>
X-Last-TLS-Session-Version: TLSv1.3

Hello Andreas,

On Wed Nov 25, 2026 at 12:37 PM CET, Andreas Kemnade wrote:
> The bridge driver desserts reset after disable and asserts that
> upon enbale. That requires users to workaround that by declaring
> the reset gpio wrongfully active high.
>
> Fix polarity in the one device tree actually declaring
> a reset line. That patch has to go in after the bridge fix.
>
> The issue came to sight during experiments with reset lines on the
> Epson Moverio BT-200. There are two of these chips with a shared reset
> line, so also prepare for future conversion to use a reset controller.
>
> To avoid having GPIO maintainers spammed with a bunch of patches for
> BT200 support, do that fix separately and now, so it can go in more
> fast-track way.
>
> The devicetree change is only compile tested and is more
> a cleanup, not an urgent fix.

Can you test it and report back? I guess it just means applyint patch 2
without patch 1 and checking whether it works.

Other than that the patches look OK.

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
