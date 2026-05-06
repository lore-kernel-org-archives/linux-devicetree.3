Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62028358388
	for <devicetree@vger.kernel.org>; Wed,  6 May 2026 21:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778102535; cv=none; b=J0stiQNWQG/VASP/+1eYKB80ovLdCw6kGYpGMX1b2/pxIno33DUDqi7OS/nD2GrlUUIp25up8AqhI77K9eJWgU+oc3ZBPkzC3wLqAYVjpS8CfETD3nMmpi80/iP4qSfim4lAuJ9AlUOwfpFV65nMaEUOMW1ZCQDoxyjOOgDmE5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778102535; c=relaxed/simple;
	bh=TDFlAyJw1nUODGr7CJgiZNIw/mOTrHdvnPgaxqyWrIM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=H8S7jdriM1hWjX1fXNJqh/09I8C7KFoi1SoHi1PMIqfBJTPqOy0pTP4tQXA84lmCkPH8UrVDcDdiwG2CPqXHLABYHwa77vnia6VQb3rxjL3GSXK4cvGdq3Rsx4cJAr49mbAMrruGTvbwTG3qoBKLtUX7Sygg0eWeE3neGb1Npoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b=GXpETEK6; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b="GXpETEK6"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3654ebfd57cso81644a91.1
        for <devicetree@vger.kernel.org>; Wed, 06 May 2026 14:22:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1778102533; x=1778707333; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E+3kkHmTsm2rX61tkHXl0gWLDyLZTSYok7GwmcKQ3fQ=;
        b=GXpETEK6PSp8V4gOKJ2seojB66tCYausMgQiarlrQpA8DfAVRX+xxFgQrNhA8Qtzgf
         gpy8xp4WRYD5R3NGt98Pa3urG/Y5Ugy4DY7LcuoafImQl1E6n74lRZ9rDAW3mkuEJDre
         tOpMMZcHlvmhAQohMVNVztCoIAR1XYVREuBxHe5mMHnaiLE+rhBaWycN/Cbk8GnAi2bs
         CNy5pWS9tZBGxA4zcii+CHBW3Zh/P+0sXmVCZun8lK4CWdxCVgWbFNUABfveOXds34A5
         k8J2Yz9/ZnRY+5MgSJ4l0rWLEdv0/Qj8iIVzT1gcbSjew6eebMsFAmYUhtNqHuiCZFB9
         4lUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778102533; x=1778707333;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=E+3kkHmTsm2rX61tkHXl0gWLDyLZTSYok7GwmcKQ3fQ=;
        b=kt2YprH/Afwss9MWA7f6qvU9eq6t3aRmLjWWCEPoyP2KTM2IU4FXblPuh5kH8Z+CdV
         lb0C2bOO09i68ys4CvqxWswyulNCgXgGUMJHTAAbK53JdTmEptcgE7ybi4G9p6MHhI4O
         0EA2Uoe+7+mF4YatvUENz2TxAshBagJzB9edWIlYMxjLu0hrgWRw90c16pzTKaBDOg5b
         Mga9sXK31V7uQ4SEJkzMsKIy9oBccwc1eu8D30rynUpsiTMDhOYcNF4IZPKA6Pvx58u9
         zy8xA4M2vnaz5Aqzx3PBl6Ez2rN3t64mj4CgZNNTN4TqpAJUUfLh4kotVOMkmRiMJrc1
         QmOg==
X-Gm-Message-State: AOJu0YxyOBFxjXiLdSTN7BBnjkt0JkVl6pQ5NLmKvcMbo0SIH7bGhyk+
	GS84YmYZ+havv9IHGvBXZURWF06+Jfnd+xpy6P9BBXpuORhIUJhj1k1W5BZyk3qpSwbnmF/rbMc
	UjEntKTM=
X-Gm-Gg: AeBDietBXsO2DavmGu6JuDypGklVulqENtK7bvY5MtMiXRzhi6cTXbm7D29GoCjacfw
	EWF/CCbhGmiy7muHO/G8RMxYx/JunjO7aJQGGu6L8A+0ZAzwFaWVz5buzVjnGQaQukeHxRYgR+k
	2C7uWu3kzVj5SObQ7a3LPLvvUtVXBNezpmji7HO+GpG+cMM7OYsF/OypwUHjiNUasGb4xDkEOKt
	kihvqXf/ZqtGuFbDM1e+OMNNSDfCo2RI62pbz6WZ9TE8GSEP5w7se8mZbfFOT7daah1IVHpOebK
	3Tpnq6GodkUNGeTbJ+S7XDkXM28fR9n24BYSLhuuY6CkzvfntzEUOs31Vfzvfyen7G0W4OiVXDW
	P/4bMYh+SxGvpiZRdTp2RDaIlxaSCxSSd+yiCyYd/ZbCAcVGAlpYcUqLs7eejPr7nWkU2yR9rJ0
	6QuAjbLIGVg4XowlBbjTl9L9W0oSO7zw==
X-Received: by 2002:a17:90b:548d:b0:35f:b647:d98a with SMTP id 98e67ed59e1d1-365ab9b8c53mr4534954a91.5.1778102533545;
        Wed, 06 May 2026 14:22:13 -0700 (PDT)
Received: from localhost ([97.126.187.42])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-365b08feeb0sm2272665a91.2.2026.05.06.14.22.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 14:22:13 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>, 
 Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-omap@vger.kernel.org, linux-sound@vger.kernel.org
In-Reply-To: <20250122164129.807247-1-ivo.g.dimitrov.75@gmail.com>
References: <20250122164129.807247-1-ivo.g.dimitrov.75@gmail.com>
Subject: Re: (subset) [PATCH v2 0/5] ASoC: cpcap: Implement jack headset
 detection
Message-Id: <177810253253.236754.5359911875458195041.b4-ty@b4>
Date: Wed, 06 May 2026 14:22:12 -0700
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2


On Wed, 22 Jan 2025 18:41:24 +0200, Ivaylo Dimitrov wrote:
> cpcap audio codec found on cpcap PMIC supports headset detection
> and PTT button through its 3.5 mm jack. This series implements
> support for those capabilities.
> 
> Changelog:
> v2:
> - cpcap.c: fix a typo
> - dt-bindings: fix interrupts description and alignment
> - motorola-cpcap-mapphone.dtsi: fix interrupts alignment
> 
> [...]

Applied, thanks!

[1/5] arch: arm: dts: cpcap-mapphone: Set VAUDIO regulator always-on
      commit: 009f64641db3fbfecf92dee910c57a41c3e77a4b
[4/5] arch: arm: dts: cpcap-mapphone: Add audio-codec jack detection interrupts
      commit: 164f88cd7e0c0fcb950e8b4ba5d8c26404334c88

Best regards,
-- 
Kevin Hilman (TI) <khilman@baylibre.com>

