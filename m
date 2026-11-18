Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795009074;
	b=e3aMFLqBcDz9mGwx84XV5rHb4UTz15s/Y2AjCEBSlAsoeX0LOtqa7VlLWLtNNRaOWzVH
	 Q2UU72+DiBIcANx1wvWKWp/w8xwUdTCr00L5hENNyoW6MRKr5QpO6eV2oU7/NkkSpKIqR
	 18O5Wkktq7QNT+8TvKcC10oiEgojeniki0WLS50flFAJydOh4zgA1iIU/WHjil4rqf/+2
	 gXjd9kCObow1ZtJ9DljUHA5lMQ7N3F9MYH3/5DNJAapcXbzfNuedIbXvNvKmoTBvMhyAA
	 98hNOsLBTzY+DgvBffgI0HHhLAOQT0N1Ar3cbfV8HHpBeAfg1+LjTOvTipiaJ1zFeZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795009074;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=0l59jLbipC2nuCODIXqu8qHn6K/XZMBe1rHBAYgKxIM=;
	b=tflRzFWJAM9LdQzr+p6zp3KW8dpg5aLRyiWCawE3KIyUK2EFrUyliJI6qzk5FBrXFjL8
	 KDFzOZcIL0SvcusKEv1uGYUKO02+NYloxSdYoCG7FFWf+gBWTWmmUqv26WW1yStV2zA3B
	 05BtuwwzutDADTC9nnpRpLa+0m+lC+p1/w4sgqasVM8W6Z9CrOqxYqLjbRqbsSS/fl7FU
	 RQfawK+4UVRqd7EScalXx0LlVcKb9MeMzDhd/xuraIMgdJTSb0h5k5zmY4HG/v4qUGCAY
	 ActDwHMELhhvl3OWXCafcis8I+sDc1qBAIbvAZmBZ8t2y9E7aAE/FJzz/RjnDJDoA3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=vG2rBTDW;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DCCF606A31C
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 13:37:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6DCCF606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=vG2rBTDW
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id B9CB4C4F77E;
	Wed, 18 Nov 2026 13:37:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DC07E5FE9B;
	Wed, 18 Nov 2026 13:37:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 879FF11BC1FF3;
	Wed, 18 Nov 2026 14:37:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795009066; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=0l59jLbipC2nuCODIXqu8qHn6K/XZMBe1rHBAYgKxIM=;
	b=vG2rBTDWbo+RvUO+S2754ecHvSu9rxE3rUkR1JCPPF06v6MvK1qnMBMdwTEHY/3baFh6OS
	7oX/VwXB1dpM0qBieTNW3q0lz5+My9JW/T/b07KvyMW4QKgzxdEpJ6uCY4McB2vMSrBWNX
	Mz3bpQmz1YZ7CskwVfSKppByGzvyF7HEn6WvSWwwilAH6uSyOl8SN4qK2MWisGc0a9Tg2D
	TBY2NdFzyib0EEJGjS1b8fuhm0qY0CaQgqRUtHhDExDz2bde2teuPuB0TBaPw5t6vKXnAQ
	gpJ0TqbyLJd00ioJDw1KE4uiD49qDMaI2/J/yuQMbtI5R/9qC32r4cAMVTG+kw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Wed, 18 Nov 2026 14:37:08 +0100
Subject: [PATCH v11 01/10] dt-bindings: clock: ma35d1: Mark HXT and LXT
 legacy
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261118-perso-ma35d1-upstream-clk-v11-1-bd1d1e060926@bootlin.com>
References: <20261118-perso-ma35d1-upstream-clk-v11-0-bd1d1e060926@bootlin.com>
In-Reply-To: <20261118-perso-ma35d1-upstream-clk-v11-0-bd1d1e060926@bootlin.com>
To: Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Richard Cochran <richardcochran@gmail.com>, 
 Arnd Bergmann <arnd@arndb.de>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-arm-kernel@lists.infradead.org, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 openbmc@lists.ozlabs.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

The whole clock list is supposed to represent the clocks provided by the
main MA35D1 clock controller. Yet, the comment at the top is wrong by
definition: it lists both external and internal clocks, which does not
make sense. HXT and LXT are on-board oscillators which are now correctly
described as independent fixed clocks with their own DT node. The clock
controller is a consumer of these nodes and a provider of all the other
clocks listed in this file.

A look-up towards the HXT or LXT index through the clock controller is
always wrong, yet possible (even if totally useless) with legacy DT, but
should not be made with a recent DT describing HXT and LXT oscillators
as individual nodes, hence mark them both legacy.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 include/dt-bindings/clock/nuvoton,ma35d1-clk.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/dt-bindings/clock/nuvoton,ma35d1-clk.h b/include/dt-bindings/clock/nuvoton,ma35d1-clk.h
index 764d837d6162..ad0b281da45a 100644
--- a/include/dt-bindings/clock/nuvoton,ma35d1-clk.h
+++ b/include/dt-bindings/clock/nuvoton,ma35d1-clk.h
@@ -7,8 +7,10 @@
 #define __DT_BINDINGS_CLOCK_NUVOTON_MA35D1_CLK_H
 
 /* external and internal oscillator clocks */
+/* Legacy: HXT is not provided by the clock controller, do not look it up */
 #define HXT		0
 #define HXT_GATE	1
+/* Legacy: LXT is not provided by the clock controller, do not look it up */
 #define LXT		2
 #define LXT_GATE	3
 #define HIRC		4

-- 
2.56.0

