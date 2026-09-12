Received: from mail-qk2-f8.google.com (mail-qk2-f8.google.com [74.125.230.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C30C237204A
	for <devicetree@vger.kernel.org>; Sat, 12 Sep 2026 02:09:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.200
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789178952; cv=pass; b=F9Sk8z8BakRtvBGzyZF8nIFvfq3j0TOPKkByWdpQiVfManzlhGPH64XT3QtXOknXsLXTZBMBCxhTRGhlj0pbrAWrB2cT+Q0sTdhML+d6AaXRSQqteLleYnxQ8guQchQuM2dveel0465GY0aErlwh2WeGxYRuLsRJsVpimj4nx3w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789178952; c=relaxed/simple;
	bh=mdT9ENWPEzBfkyRK8P1a2dUQlY39G8cEaKSfK8TCWpw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Nh3oUaRHHwze8BuxmqIUwfp4gA7HoysQZUGAk7AiJCm3GIX0SiYf7ck1AsimyzR2N6GQBxjSQEqcj4YKjjdewFrg4HkCh74l+c7vTMBAEkUwqD7Gip/xLPaPjV/L1KL2ETOh2KAnmN722aSi0xlZRWMERtha81iKcrmPPbEP7no=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=haSfbs4D; arc=pass smtp.client-ip=74.125.230.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="haSfbs4D"
Received: by mail-qk2-f8.google.com with SMTP id d75a77b69052e-530e2f0c0a8so4153351cf.0
        for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 19:09:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789178947; cv=none;
        d=google.com; s=arc-20260327;
        b=GNHSfEan28DvFijHkGYcoiZzCVRNA7zxS7pBmYJ9cpei4qtWAfi9H+UT9h1/B8NYw4
         La+fCZSluwgTmW/njwFEE2bZrt2AYZl9smvtL+7w9raCzVAj5Z/hmpp+I2J7yWJmZ09J
         Fid9WnkUsBZDR1IsY6HYmUDFZsclF+KqOiap5o/nHozyQCNxcOodQz9RGnW7Zt9qQ3SX
         JOSaU9TKu/NfKyN6GOVYrBhIlRtFgNvaUH/TsVoku1swATRhcsVt+M0KEs+zsbCs3QsQ
         Y26+Mq1KJJjGakN1bcyOwMw66ZQHQUfPDtu0XfSUYN2Z+MHWIvgWhz54fXyr6yMxL27B
         aF7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mdT9ENWPEzBfkyRK8P1a2dUQlY39G8cEaKSfK8TCWpw=;
        fh=BU6gdQNpSV3jxTg1W+D/txmxENnZ+Qv+yDt+3bTL+Q8=;
        b=DbufoBhJS+T29WQrjLOmzjJ6MjYK2p+hQ1l0XuTwpKV5vNGCPryqtYjS6XTDKQKv40
         JDmHswasEVSiqF+7UH8MwN63Uz8nQbIKXBweT3Xh6SHZ/YO69jcxef4DjdmyLkTga5DQ
         EcI4AOZaDTCCSxqyz/Id66ycGBDWnGaYwOPlUwpwRrwqv4UxlP15yHlR2NXoal/BJyOD
         kfrhIPOPSWBCM1W68LbpAjMZLiGrHKTugwHZPDY02k5slsZK8y/UR+nfq6D4cTmxqadZ
         H+bt3tFg/Wuk1ujZqJjRRT9PEDt20F2FSZ8Zo1pMolGuSfsa/XufzpH6A/IaItlKkeW7
         gUtQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789178947; x=1789783747; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mdT9ENWPEzBfkyRK8P1a2dUQlY39G8cEaKSfK8TCWpw=;
        b=haSfbs4DLoa/DAimtNX+pLEgqVbB7AgCSaa9bMdLPLPuxwKrwGhBx6UXOTpqKsX3In
         HmPfspx9fu9BmY6nqeDEKMHkk4AfRVKdygG1wjixkkNt491Q5PdYIBST2VNmRyWmEFzQ
         qX1Hc/DXQC5bNhj0fQXw31rlPm+l7E6BUz++lSI3Kw24acU8zmdqgk88WwKlS9ljAf4u
         BMtf0NbTwyATUMBTOiHfCfoai66hcwlO1fS98WJDfMROGq1Kj8b5+1Bq05A23o/VE9sA
         jpNl9UK+fREU+YaTa3g4rVRk84pTrhtji2/oOGf0OpTqWofga//DHQycVfrqmj0xByET
         u7Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789178947; x=1789783747;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mdT9ENWPEzBfkyRK8P1a2dUQlY39G8cEaKSfK8TCWpw=;
        b=D87/ElJpvlNH47BQd4T2FAwfNqMVIlMtLt+1sVoeRD5ouo1IXvwj/HhISpuwNyPDtF
         kwu28GJNpcn1mrUQyXA5m/jOIWucE1vvKGU+IBTt9SZ9lb7F3miL4tMTe/poqtAgZEK1
         coTS6fXpcua+anVs4I5uu3UAp9HxfcUiPjKlMbyz1CYugmdXxgkTEHlBPtNmmKP+A80W
         67m/uIpp/KbWMDpfQ9h5pn54QbddoTxyCRAxoBP8Nh3FNh/jXmeHhsKx6Qxum2jOuSmY
         c69kAOwEXY9bbJdFmOYE9NW0nuvCLyNd1P8iaw7AFlm/vNQSsAlXY7+liIpf5YegKBEV
         eu0w==
X-Forwarded-Encrypted: i=1; AKwUvBxlLN70YpcX9mYxJkYsvXvJzWQ4vDqnJkSvEQ0FsFVlCpcznJoXWeo+gpZ2TTB0MWGfz0DV+abEtR2P@vger.kernel.org
X-Gm-Message-State: AFuF++kcZ4rGuq5iCzdUgprQtxs2Mr4278Bt/rZzu3r+GXG6SP1LDIMj
	qYg8O9le4nwVbcAlsqlBdVDQdz6snlqgSiGgYQ3Qm7vChwDXtBqgVZ/04sWpWlT8wQHrKc909ny
	BmkdKlbLeRJm2NNMoT2AM78IJoAu+qxg=
X-Gm-Gg: AYBFou1tyyLwzR2Z9pp+wBFc6c+WQCwinlNKB9c4dQW+5bZ0ju6WC9AYOs6fF/cvRKT
	OCYCuH8S0uvCe541yyy/mhLhqcAMDg4XylWnvVMBEaEovGorXb20ThI45R9EwOCPeWjNs6aFCEz
	tGNLibyXqmXWLnNjeyHUU3b1/67n3GRG91a7KqCAkP+y6odV1HvUJiiRnLOx4rf1Q0IJCejGVvd
	UItEKIiu1Ve0SmtZVwrtd5sYcZ9QyLYFQyWnn86jfXyVHGYGCT+gimBeGT/UEBdv/9uUDEl0Feq
	2DHXctNMjcetj3JKTBAjsqWwj84dQmwGtFN/D5p8DQX6prPzYefVklmU+SqEVdD/blexjM2f+gu
	OxcLnhfFCqi75HutbuZx65+4tSvblgXVefJ1Ve9n/
X-Received: by 2002:ac8:5dc6:0:b0:530:d1d6:792d with SMTP id
 d75a77b69052e-530e7dd8ae5mr13590681cf.15.1789178947506; Fri, 11 Sep 2026
 19:09:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260908152808.3928630-1-arnd@kernel.org> <20260908152808.3928630-4-arnd@kernel.org>
 <CADkSEUjYhRk-ezaXZkHzFTFQnySFSisKtZfEP-_NtLnQF+6-1Q@mail.gmail.com> <aqRI3N5FPX1dpIlk@gmail.com>
In-Reply-To: <aqRI3N5FPX1dpIlk@gmail.com>
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
Date: Fri, 11 Sep 2026 19:08:55 -0700
X-Gm-Features: AcwNN1XgIQzd6k50BFzIHmb9Q0P_yN5Y-RnB_uEDdmfcLkrtltvi4fLr_oEAXtE
Message-ID: <CADkSEUgkPyikkhqLBOVEeS-H8L7CvUN8VD88=dUuTeFB8pUM5w@mail.gmail.com>
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

On Fri, Sep 11, 2026 at 11:43=E2=80=AFAM Karl Mehltretter
<kmehltretter@gmail.com> wrote:
> I've made a RiscPC emulator in the browser using QEMU and WASM. It boots
> Linux kernels and currently emulates a StrongARM RiscPC:

That's awesome. Are you planning to add support for the NetWinder to the b?

A couple things that I didn't see when I glanced through the code:

* QEMU needs to model the broken ldrh/strh instructions for the Risc
PC (but not the NetWinder). I am not sure exactly what their behavior
is on real hardware (though I have seen forum posts where people
investigated this - I'll let you know when I find them). For now, you
could just have them load/store a random value (:p). It would also be
helpful if it could print a warning when one of these instructions is
executed, to help people detect and remove instances of them in e.g.
JITs.

* On ARMv3, CP15 register c0 is write-only, and you don't model this.
This caused Linux on ARMv3 to be broken for a very long time before
support was eventually removed - it was broken even in 2.4.18-rmk4. A
patch to run Linux on the CL-PS7500FE (=3D ARM710 Risc PC on a chip,
used in the Acorn A7000+) works around this by keeping a copy of it:
http://webpal.bigbrd.com/patch-2.4.18-rmk4-wp3.gz. According to a
comment in later 2.4 versions, that approach won't work, but I don't
understand why. Also, the patch fails to fix other reads to the
register outside cpu_get_pgd() (I forget which ones).

A few things I know about early ARM hardware and Linux that might help you:

Before 2.6, ARM support in the mainline kernel was very incomplete
and, IIRC, unusable. To build a working kernel, you needed to apply a
patch from http://ftp.armlinux.org.uk/pub/linux/arm/kernel/. There are
no patches for versions newer than 2.4.27, but the 2.4.27 patch mostly
applies correctly to 2.4.37.11 (I didn't try to fully fix it up
though). The last patch that was released was 2.6.0-rmk2 - it has some
relevant changes like the CL-PS7500 PS/2 mouse driver. There is also
an unreleased 2.6.4 patch - I should ask RMK if he still has it.

The NetWinder development team shipped patches to their kernel with
additional features for the NetWinder (and other ARM hardware,
including Acorn). This is the last one:
http://www.netwinder.org/mirror/users/r/ralphs/kernel/patch-2.4.21-rmk1-nw1=
.gz
I don't think most of those changes ended up in mainline.

The Risc PC and NetWinder lost their audio drivers when OSS was
removed in commit 727dede0ba8afbd8d19116d39f2ae8d19d00033d. RMK was
working on an ALSA driver for the NetWinder but never finished it
(IIRC it is in 2.6.0-rmk2 but probably doesn't work).

> I used LLMs a lot while building it.

I don't use LLMs for environmental reasons, because they are often
inaccurate, and because I like using my own brain and don't want it to
atrophy, but we are all entitled to our own opinion.

> Your GCC work looks useful for this. I will look at building the RiscPC
> Linux kernel with it, and at emulating the original ARMv3 CPU too.

Great. Let me know if it works.

P.S. I have a few UI suggestions for the emulator:
* Make the display bigger and able to lock the mouse/keyboard and go
into fullscreen.
* Remove the LK201 keyboard - the NetWinder used a normal PC keyboard
(if you add it), and the Risc PC used an Acorn PS/2 keyboard (a normal
British PC keyboard but with no Windows key):
https://chrisacorns.computinghistory.org.uk/32bit_UpgradesA2G/Acorn_RiscPC_=
Keyboard.html.
Just keep virtual keys for the keys that you can't input in a web
browser.
* It should be possible to middle click using a modifier key if the
emulator ever runs Risc OS, because middle clicking is heavily used in
Risc OS.
* I think some of the explanatory text is unnecessary.
* The skeuomorphism is cute but inaccurately represents a Risc PC, and
I think it clutters the UI unnecessarily.

Ethan
