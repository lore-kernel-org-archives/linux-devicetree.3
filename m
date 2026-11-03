Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793695244;
	b=q7mJGIzk5NqeiW4FPZrdmGnFc1ot+TEoj3Lbu9vnfLP4DvpyMfV6L9F/FzDoLD9e+o5L
	 27CBWmAHweWBo3I0wf++UUc4IGr1Cub0c36+m9GkvJjRoHv7/T+AF83iqaCvE5gJRq/pe
	 kwkqy40drdzQEbP0srycNlI+6hg51eh6kfKZ1aC+v/5Lf+sWlNzufn+YEk8JFwhWSIsup
	 vGx0n+J1FeqlNb2kcNmlLXXc5Vw1UPqHOE5szCcISMNCLlgVDFxvSexqdW8XdLlqjuETq
	 shc4oGO1beB2fLf+AGYiDgarDKWD/HyotSPR5osfFlZMJ5pEb8cGaEjun4u9u3MMUCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793695244;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=JUJOd9ewD2XzFuoXefvfL/kztf8QXUFxcaNj03ZJSj4=;
	b=0wqR+6eaFWSYna/bnPijqjUmT/adh4LrULabuwn+Cdr/mXx5FYdihCCpQYYktfPdMX3l
	 pQ8ib/hEGxdZqhVPTGIHcRG5SoT4PAsk5YMiRlkiZANgJz8zq1fIoAFlPlEcpwQi+92uu
	 5igFNqqPuiFw6op4sAdt6ouQBrZrWno3dLb/3MUAMcr4UXnhB8CPTPeseWQKX42k79eLE
	 QfIEq8HKibpGI0FM4CJPfTw+ySuOyo+voYYSvSSYKnQ9LwB/oVBaC0BHyMiFe/Qk7pVhQ
	 Mxov8gHEszklSHdx+8JQna6M7PX/hj06k3kWWmUljUCpmK5LU7KYW+Vs5HC2IX4gaXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tOLJ3DQY;
	arc=none smtp.remote-ip=209.85.161.48
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E38E606D82B
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 08:40:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E38E606D82B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tOLJ3DQY
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-70b875f6f1fso3695834eaf.2
        for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 00:40:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793695242; x=1794300042; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JUJOd9ewD2XzFuoXefvfL/kztf8QXUFxcaNj03ZJSj4=;
        b=tOLJ3DQYUFTqy8+wS6aTVUgmEJDaN815utBQykLJtiywUfcmccsn78sCFPD8ZoSt2G
         aAnrlwTAZcUd0R81aIngQrYfShPsw5b/1f+sc8Pvpb0YW9CxILEJrup3gvGCi3ngRyAU
         CPu/cNvPg5SStaa/HH0Pc3bf3TsfSaIJbu0R0ot7eOHE3JrpS1zUQbwx6nByNeDLjMfJ
         CWr7H/cfO+KEFKPRT+NfQAsJOsajqJk9b/G1x5Zgj5yTcGdqAgk6/J5K7wFSYCp+SdLp
         uSXAt+TynZBZ5IfBVxLwRmOQOtNrRD2Yh/CPIre1vvNVHFNuJzLE/c5watJNX+FII9on
         SwXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793695242; x=1794300042;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JUJOd9ewD2XzFuoXefvfL/kztf8QXUFxcaNj03ZJSj4=;
        b=L4/18LdSR2oUi8UjmYGhNnZArPaxDrE5VisAYXeuR/j/DAi1FoFEztqVMxgPlI77CZ
         gio8SEXx6cDQXh4ANAGlA6RTejJMYEsmD+SxMLDWildSIHmI6Ns6zE8At5d3oTLtC3tG
         7lvnrwyZU/MoJ2izHAiLopZXACQGj+MEZnzBhe+RDlKK1ELBagmJaeppPeeIOvsx+BqO
         3+HWksOcFLqcUamOda3zMvTZhjMcKoGclFS2v+Pu8nQRENApXc7lfqqLkSBEr4jLPXfH
         AOaZsd8TCD1wMyCYCGq5ppqBo+lz31YNrTCkxfSTI/vH6OApRYYvYhHg/d7GF6ZlkuV/
         1c8g==
X-Forwarded-Encrypted: i=1; AKwUvBziYcHzBVzakCLajKSYCA5tUU6KjyeR0XICc/aT6h8vINOts79F4KoDf/Th/+a/R3Hez1oX8VGJDVuN@vger.kernel.org
X-Gm-Message-State: APuU4Z+XkJuGO/wRqgyZMVEBh95r3jZRpaR/aqJ3973AytAE0wvoiUvB
	aWTA68Od7XXyC7lmLuRCU3rde+TrLrW8tNuF6uQQ9Igb0Wg67ewlzDgL
X-Gm-Gg: AYBFou0bAMDZ8Wqk8dDVlU+O1TJxy10LK58zmWC+oAojaCqR9VDRKiVYSV6H+g+pr/I
	PiKAZNolW0Feog/FGjOFW35fbB7CEmyyhLZLZxw+nk35IHhYxzVa5d2zrD04PYRmQYa2in0jwre
	YjiuoB3wrJbJOKkuBiw9y1GpW+Pg32+HA37OGMH3IUphZBZi4U1pOpffx/lqfSIKxRyFYD/ytYW
	a7l64+oVrKFq+1yrepsZDP7czF+84Z+JfKslLyhEPwK+ldZMx2KZGFj+ihnRy0B+U8tEsS+nsqu
	uHgTHZa4K4/UOLjQMM6UpSIbh7WfAaWO3NxCs97+C5d/fT10w/zdEo9BijXBA/8AH2Jw8QEvEt3
	o9iMry355QO+0Byg9Ogi7HLsThZWJb14V1JwpOzSRMlQYDLIo8X1GM0YqeFABkJoAv1Lw+HHaT8
	NcWodfGfCE0YPHUj1IkK3in02n85CYhRkR45y+YMS1jPYnFgDY2rXazhKaGafI7qB41AaijwHcc
	auIp3aw6jgaJMO/8KG6pbfDJtMj0zUEPB5MIsXyj/qG1bTOGOYCWQknWmfcbEcA6a0b/4BGaj0R
	uK0PvNB+gvCfvNpTljfTYk5b+drKQIZuDx4JI7r7/bfQ6Qmblo07WS8q5xCX8vZL/9XlZIbh3M0
	lybf9OytvyQgaLe1pxZUsJ4hOdJLpqPbRF/sUMRQKfys/BOYGk2TOWwVM3wupC3TsKPzlkp27L5
	CRUSJltu41yA6yS4CiUvSWPUkCkLck1UjyYX1jXLndIzFACnlETns=
X-Received: by 2002:a05:6820:240b:b0:710:8db7:5f57 with SMTP id 006d021491bc7-714f2ab5e9amr5840218eaf.78.1793695242282;
        Tue, 03 Nov 2026 00:40:42 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-714f3081097sm10520397eaf.13.2026.11.03.00.40.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 00:40:41 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 03 Nov 2026 01:40:30 -0700
Subject: [PATCH v11 5/5] MAINTAINERS: Add entry on Allwinner sun8i/H616 PWM
 driver
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
Message-Id: <20261103-h616-pwm-v8-v11-5-07abb59575c3@gmail.com>
References: <20261103-h616-pwm-v8-v11-0-07abb59575c3@gmail.com>
In-Reply-To: <20261103-h616-pwm-v8-v11-0-07abb59575c3@gmail.com>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Richard Genoud <richard.genoud@bootlin.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Paul Kocialkowski <paulk@sys-base.io>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 John Stultz <jstultz@google.com>, Joao Schim <joao@schimsalabim.eu>, 
 bigunclemax@gmail.com, linux-pwm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

From: Richard Genoud <richard.genoud@bootlin.com>

Add myself as maintainer of Allwinner SUN8I PWM driver.

Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 MAINTAINERS | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 93abbb315065..b80ae0ac5eed 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -947,6 +947,11 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/hwlock/allwinner,sun6i-a31-hwspinlock.yaml
 F:	drivers/hwspinlock/sun6i_hwspinlock.c
 
+ALLWINNER SUN8I PWM DRIVER
+M:	Richard Genoud <richard.genoud@bootlin.com>
+S:	Maintained
+F:	drivers/pwm/pwm-sun8i.c
+
 ALLWINNER THERMAL DRIVER
 M:	Vasily Khoruzhick <anarsoul@gmail.com>
 M:	Yangtao Li <tiny.windzz@gmail.com>

-- 
2.53.0

