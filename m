Received: from mail-qv2-f6.google.com (mail-qv2-f6.google.com [74.125.230.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A942364038
	for <devicetree@vger.kernel.org>; Sat, 12 Sep 2026 03:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.134
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789185579; cv=pass; b=rvU7rBTaGZ15klscOL9RnZA2CF1kg333MoT3dENHhibdrVNeRw2hEYl3QBOqOD9VZh6Fk8kb2xVGG/gJ5VZphIc6KjPkh+aZ+Nudn3Wd+scfnO52vvcJdXFg88gRSuXVJzQWqfC1Me+A0S5vO2SVG7spneDtNYxePWy18P4rS6Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789185579; c=relaxed/simple;
	bh=BkL3lGBHwiEi97Q6sw1wqPYNFpmHLpnVSD+N4L8TFo0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XKQt89wZoKxL0BYySeybbAVh/CnFa7BytkA/xriUGcMEdv98QzFN+JXvhCp8o3TZ138qxEJh+6O3Eei1KSZXGXFgGSEHV3Yzu++1mwX37ZXppg9A9fet6qhnee7jnkMx8D0R/7OmUv/wlo3ZAsZRTXqpVXGLb6vg8wdt+CByaZQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AUi99WX2; arc=pass smtp.client-ip=74.125.230.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AUi99WX2"
Received: by mail-qv2-f6.google.com with SMTP id 6a1803df08f44-90cd0a3019eso6292076d6.0
        for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 20:59:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789185577; cv=none;
        d=google.com; s=arc-20260327;
        b=GHDrc03TtLAZhWviPKBGZZy0ats5iVRUBQf0bICvHBq30ZWjVaG06gdr/X8Qf1MavP
         q9JBtZIjnrTDw6zJUaDNvAElWJK6YE7YCgK4/hBMIPH6u136ADkePVcRDwcZHv+G4DTW
         Pn9QHvIfjHCTz+UCo78pVYNF3OdUyEYtkqqBD7QUzNUe9rpqA361zxeTeTHjTUOOeOl/
         LVw3aHYj9VUbHuMLpZy3ubJqFMeAd5XJrF/ao7rqkx8O0JnQ1MSBBPCP2WkJaIZDaIs7
         XezBFcabSm+oiNwL3tEG33bQdZDjyDoAfRKEV0T0h3pgN22mQ6NbOEr+j6gF00Fq6twy
         i2hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BkL3lGBHwiEi97Q6sw1wqPYNFpmHLpnVSD+N4L8TFo0=;
        fh=LZNM1ZtpPC9OfQsI8d/ZWOWOigGAMIgHkNAP6euYobI=;
        b=YE8xtPWLN+eWRsr7uf4fYZiZPWTyyZyVZZHdZGKqwPp6DxypNi6DxQo+jlao2yhMpc
         rtzuayJPLK8FPLBXkQJ2bAsv0d7LIVwsIMctyzDlS9zT9rtdh81AqisZB16BR5RECY15
         FWVuGKECMCI+p7SiqcxxDnmAIb+JHYMPZSk3+EEaZFvhZ6UBbgJNnXzMU7tZh836ir/h
         0RDNzh0piC5beaVQGK7i98pnwouTPBdw5lIESKhk2kCWH/Sl43d3SRl07stI06b2OUOc
         8ZHSyYP4zvRlhUXL7dukPuyZXSuh5x04/z2I+3M7mphNNwK1Z2b+QuNYldgxy8JXzH9u
         sg2A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789185577; x=1789790377; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BkL3lGBHwiEi97Q6sw1wqPYNFpmHLpnVSD+N4L8TFo0=;
        b=AUi99WX2mjCEnh94Mgz8UyqQU/oNEA9cIEKZBdzKT+z8ihWUMzk831dQkI3koNvu9G
         FOXv9hL+LCMEPxf/E6B6X3tqNMNit0enH6a996hZjF9P1W9Ca9u/JogjBROhVSBVKuKe
         i1ZglNYBRcPU+heleoHDLB4sNQG/UeUlV3ciG1mn4mte93xJ1PyBBaGWQo9SW/MmOyUE
         E2GuwCGaztMXULuWO9e3gDAe+xNSNVCpMSpRBjuIJOXYQi9Lt395uXUGN7PpUrH06Wk6
         hST40P8ADAOoVPLsm4F0dumn5utDUM8S2/msBC6ownOQBTLYS6vL4zC5VkaFucosXqdX
         tFxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789185577; x=1789790377;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BkL3lGBHwiEi97Q6sw1wqPYNFpmHLpnVSD+N4L8TFo0=;
        b=eUGcJhx7zWZBgiDvXCtmH1010OS/jU9wWDRyh2Q9LlVoYgluB9aU2FhXL2837b9UPb
         pvw1KUc7gXKHLnW57egqm6UBeADrD23R7OZi2HjmUYcKaxyCZD4Rv527ogKOdBJsuVK/
         /wG28pdJ35btoULDP9TjtFQUC9199BNnfaqykZ84lsPs3ERTAgdEMHcbNJ1a7nCk4++h
         Ku7Tq42N5hfehwXmFIfVXTeVfDPjhcHleKPT5g9t2WXEpdB0drWvSOUE3yjJmSaFkDva
         tgAeNwMSOyHQ7j/3EdGTIYCCO3xj3EGW4f8ociRnbt3SnQakXM3hYJ84a/SmjkBzj+Rl
         qU1A==
X-Forwarded-Encrypted: i=1; AKwUvBzENXGMOt0YuURhbTNTGQ104iGumF7ibG1zZYlNQd63ghkxmrCFZjv/LQAz727Av1M8qlgA/c+EwELL@vger.kernel.org
X-Gm-Message-State: AFuF++lM0oRPBR34/iknZJWLILEy/V4S1OL5NCZ2DZQdj+qW5ZY/oo2K
	JAybd+id3Fv22NyFdZZtAEh3wF5mEeznn3F1RNLI7pyTcfY2+8Mo3TCliSnvGpkZyDmqu3pjr8k
	5wYp34fOR0dY9bKiLS3WtbjGdQ50HHSI=
X-Gm-Gg: AYBFou14qZOlfBtZE8l5sB8JEqioi7HHQHlYA+9r4iVCn5Ywq8exQ2/45pyDTMBPOrU
	obtFm/1gHc1BlIBScFl1w1CEocIHsZ14e4JZDiKU3glCp04Hc/oFdGbgJuee3dB7QcHQRtsfXME
	LC1TpXVme5qLkgTslDKO6fUQ1ththmXPXgtVu7fTjchJ/AYTfy0tCsp0knPoQ96zWDx21o8Yxp/
	iAyRwoZNU6m6zUjF/98a4xzoy3+n2EbmdDB565XF6urW9R9QdxJDTUguL6AhdUxMVr6Qbhlzdum
	SGtVZ4YbwPHjvfuTuhoJlBgpTAAHunpF4oSpcDG+3Sm92GC0Vmtq6j68t84C7KNPhYwPYmnCoSD
	/9CtcmbtsGrfimrNxxiylAScp2+ggDGYKKB0BvPBn
X-Received: by 2002:a05:6214:8446:b0:912:15a8:bd9f with SMTP id
 6a1803df08f44-91215a8ec1dmr55956796d6.7.1789185576987; Fri, 11 Sep 2026
 20:59:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260908152808.3928630-1-arnd@kernel.org> <20260908152808.3928630-4-arnd@kernel.org>
 <CADkSEUjYhRk-ezaXZkHzFTFQnySFSisKtZfEP-_NtLnQF+6-1Q@mail.gmail.com>
 <aqRI3N5FPX1dpIlk@gmail.com> <CADkSEUgkPyikkhqLBOVEeS-H8L7CvUN8VD88=dUuTeFB8pUM5w@mail.gmail.com>
In-Reply-To: <CADkSEUgkPyikkhqLBOVEeS-H8L7CvUN8VD88=dUuTeFB8pUM5w@mail.gmail.com>
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
Date: Fri, 11 Sep 2026 20:59:26 -0700
X-Gm-Features: AcwNN1VfZ_rXL-z6In5wMRJEgOMU7kPx8LknulegWooIebA5av8sYgSMw6by5S0
Message-ID: <CADkSEUhpe5sX=C5NfUrFMoP9fOGNiFaJ5QmEAVJ=80p8H8S9HQ@mail.gmail.com>
Subject: Re: [PATCH 03/13] ARM: remove riscpc
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: Arnd Bergmann <arnd@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Linus Walleij <linusw@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, Drew Fustini <fustini@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Vladimir Zapolskiy <vz@mleia.com>, Stefan Agner <stefan@agner.ch>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, Andreas Kemnade <andreas@kemnade.info>, 
	Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>, 
	Tony Lindgren <tony@atomide.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Claudiu Beznea <claudiu.beznea@tuxon.dev>, Andrew Lunn <andrew@lunn.ch>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
	Gregory Clement <gregory.clement@bootlin.com>, Robert Jarzmik <robert.jarzmik@free.fr>, 
	Kristoffer Ericson <kristoffer.ericson@gmail.com>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Alexander Sverdlin <alexander.sverdlin@siemens.com>, Shawn Guo <shawnguo@kernel.org>, 
	"David Hildenbrand (Arm)" <david@kernel.org>, Nicolas Pitre <npitre@baylibre.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-stm32@st-md-mailman.stormreply.com, linux-omap@vger.kernel.org, 
	Ian Molton <spyro@f2s.com>, Jens Axboe <axboe@kernel.dk>, Helge Deller <deller@gmx.de>, 
	Thomas Zimmermann <tzimmermann@suse.de>, "Paul E. McKenney" <paulmck@kernel.org>, linux-block@vger.kernel.org, 
	linux-serial@vger.kernel.org, linux-fbdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Karl,

On Fri, Sep 11, 2026 at 7:08=E2=80=AFPM Ethan Nelson-Moore
<enelsonmoore@gmail.com> wrote:
> The Risc PC and NetWinder lost their audio drivers when OSS was
> removed in commit 727dede0ba8afbd8d19116d39f2ae8d19d00033d. RMK was
> working on an ALSA driver for the NetWinder but never finished it
> (IIRC it is in 2.6.0-rmk2 but probably doesn't work).

I just remembered someone wrote an ALSA driver that works on the ISA
card version of the WaveArtist, which would probably be easy to get to
work on the NetWinder:
https://lore.kernel.org/all/1440445816-28593-1-git-send-email-linux@rainbow=
-software.org/

Ethan
