Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793993690;
	b=sdjmRXkq/uF2MDnzEyramYgWaJ7gmZ6vMZBQymGHydZrFqdC1emCq3R7bjhLK9/S05IG
	 yPRqMfC2IUJoHf4QyKxgZWkhZ8ACy43xN2GDFqP1Nf3QGkSMt2u5wi5MjD0h8Egt/86GT
	 VJod8IW3IvDm0DxQkRpSpmGYpamTeqLjhO/6LHIGotKWf7r460nmwfY46/xdT00XQEMep
	 pXjPEb8AQ/fK2m/cAwGGZmpxVFvhMSKO0ZupfgTDxKXo83CWpuu0vUfLNNO+9GUfoHp1Z
	 AInWqzFeGqLAPVTqJci1qmcIlC74gGXrqnnXK5cBs2hhPc7hW1dp+Asg5dopv4OfCFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793993690;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=veI1zjLMBadlIkwiy8gwMKz1++qI3Sdp/irDe+F5lH4=;
	b=TzzkXpDu7/ZtEW610ZItUynB50p3cQqGuPd0BhgOkedna8xuMpP6mz3ChSofi7kKz6yx
	 tIaU7YDrR2d8PlD1M5HZCShgl4kAuvMeip5ymFAOdcaWheMo6lNooqe9H47y1H+HZED/0
	 pFDOIjvBJvvIW5VO7SzAMR8klak3RhaOT39S2z1PuXtHQKhEXsZDsPEYZOGlsS+zlRNw1
	 2Qtra/LaHJFZJ1CuwWdjNHp6Gy/YI237GlndfwMy3LDsU5EjbnVFsQ2zFfzRNWQO/3Y9D
	 MUypLqBUHIl4v7MLMVT8VihBRkbIS1HOcBfHhXVrLIsWU4k8nlZCkA3JKWPpapyH3VQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=ooWyyopr;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40F15606A33F
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 19:34:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40F15606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=ooWyyopr
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a3517554f7so10602275e9.2
        for <devicetree@vger.kernel.org>; Fri, 06 Nov 2026 11:34:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793993682; x=1794598482; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=veI1zjLMBadlIkwiy8gwMKz1++qI3Sdp/irDe+F5lH4=;
        b=ooWyyoprmnZ0Lw9epK4C81tNr7WPHUvU2iRl9eKcOqcl48P3TtFkkBdYtzLhq4iif0
         NoWKh0PN7dseQbETMek/S4C/5w7E0V0aDNcVP+gKSzrhF+c3EpL/uo9QQfvATmcqBc80
         vxq9QCmQ8dKphdadliHiddTcq4DMOMXuNk/1GXrE6LgfB7UQt/C5Xt/yRQXYghgl7E4O
         C3jqLvAZtqemGOlkrZXxMlhPDPI1/MYYHjBfDH0NoRWyxH4HYgzdDyfc+SEaSIPe7S9c
         7A0w+UG3bpfmwiS6RJ+uFwMX3Yd+RyTNDnl8oNKvEzt5hBROpYYf3VmMJNhL+37s8tL6
         kFcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793993682; x=1794598482;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=veI1zjLMBadlIkwiy8gwMKz1++qI3Sdp/irDe+F5lH4=;
        b=ixkLWJzs+BS10FuNPV47xwnjieOWNyzxU0ECCk2ZGD7Fyo9C7leboqgBzbHLwhY/U3
         uyKDCHamttqoSxoeiXqPv1Nm9IKGTB4VH5pp4Dg5aoE0NCp+ussRbaZdrAHsthZSBgUe
         3asPnFIRzRcR7IAU9d8TMv1dlHNgdA/dfZYSTeFALSwsYxCR16GL/J6lmdf2xoZYsdH7
         uGv/MnMlxBUuNQEeyVo7KVanqiIdeaFT8xjOxQmW4/WH+Rc8Mw201OP0zZbenMA8YPNk
         OuAyIJgJq72B9GhJp22bICwxypEgNQUfJn9B+MTJHLGH14/afu8kqVSX/q0GxM8EIlTi
         kwNQ==
X-Forwarded-Encrypted: i=1; AKwUvBxDg78ot1sY3vUyixe5PV3nzJ70axebbN3C3MrzL9h9ZbOgdY9pf+KNjz/DzPb+NHe10eFMcy69r6TF@vger.kernel.org
X-Gm-Message-State: APuU4Z89EQZ/jpArL7qOqEIVB35loCRyGO+CzLeh1IBl4GdWLlXZuoHR
	3FR3UTLGOYYM8hnj7fS8pNy2MZmwY4uA4uL3aG/weNf3Alg8IimLwW7gIWtg1Vl3nfg=
X-Gm-Gg: AYBFou3hHSZqABcn7ld15cSoaqW0BqSO4DWm43ndFTc9xjtuOwmVOvXtVNCgH1gZk+m
	2/O/Yz4ZEna60t8i3/alZ0G4AwJ/hDtuj6r1G34Tm7k3i5xuJHTQo/UGG2V0AxmhR1yOLMtkqN1
	q15uvNJHJFESZUcJGm/StSjqYubkZySALHNku3oZJqlRyYAw3hfcNIxckHxr4YT53K0enNWkmBq
	Pz1PaHHVYVFF41JS3DlirPoJgT5byVwkTB8wAgrDFR00F4UnXp5We2LzPZ3wPYt7ZrjveZ81uIH
	WG1YeK0VDsduqSj7qlv/4RnZjOKcR7Z8qK3kIzueTrTiCAPZmZWCJOGXaDHpGZ+et/2OXQAeY5T
	i/j4XFOSu2DrpopB9chsOec7YSapnfOv6suc781bE4bV/rkSk1z9RC1aEd32V+9G8+m6Kg9kNEh
	xjtV3ThUMWq6F4kfNs0x5xkOOAavANfX3NEUzyOTjZZlVxtSo/a0SJZdtiRSLfr2PwKizPCvbmx
	Zpj3FvxsWjwYnL3HozOgxT9J/EZDYdM5v8oc8QZIgDwk8NmRutZ2E2Jgg5jOxdSty3VKi/9mgau
	e8Lv+BimpcoPu3PhkZnSJXxWjkge4qMB+OjnHXc4AhL0EnUv6qzZCAo+zit6/gnGwP9JSk2iOv6
	PCMhfPJHpVBoaHKzMse0w4MRyjclynN9NBw==
X-Received: by 2002:a05:600c:3e0e:b0:4a2:cbe:bebc with SMTP id 5b1f17b1804b1-4b6dfba9199mr64477945e9.23.1793993682189;
        Fri, 06 Nov 2026 11:34:42 -0800 (PST)
Received: from macbook (host-95-246-144-141.retail.telecomitalia.it. [95.246.144.141])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7efb1547fsm3329295e9.11.2026.11.06.11.34.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 11:34:41 -0800 (PST)
Date: Fri, 6 Nov 2026 20:34:37 +0100
From: Carlo Caione <ccaione@baylibre.com>
To: Conor Dooley <conor@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jerome Brunet <jbrunet@baylibre.com>, 
	Kevin Hilman <khilman@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Jian Hu <jian.hu@amlogic.com>, Chuan Liu <chuan.liu@amlogic.com>, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 6/7] dt-bindings: clock: Add Amlogic S7 peripherals clock
 controller
Message-ID: <au4p0xYEFkgEU6T4@macbook>
References: <20261106-upstream-s7-clk-v1-0-7d501d62621f@baylibre.com>
 <20261106-upstream-s7-clk-v1-6-7d501d62621f@baylibre.com>
 <20261106-unwilling-preoccupy-156dbb310448@spud>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261106-unwilling-preoccupy-156dbb310448@spud>

On Fri, Nov 06, 2026 at 17:34:14 +0100, Conor Dooley wrote:

> > +    #include <dt-bindings/clock/amlogic,s7-pll-clkc.h>
> > +    #include <dt-bindings/clock/amlogic,s7-scmi-clkc.h>
> > +
> > +    soc {
> > +        #address-cells = <2>;
> > +        #size-cells = <2>;
> > +
> > +        clock-controller@0 {
> > +            compatible = "amlogic,s7-peripherals-clkc";
> > +            reg = <0x0 0x0 0x0 0x49c>;
> 
> What's with the weird numbers in this example?
> 
> Examples don't have to be real, but when it looks like this the
> immediate thought is that the modelling of the device might be
> incorrec.t

The numbers are actually real, but the example simply lost their context
because I copied the node from the S7 dtsi (not yet submitted), where
the controller sits under the APB bus node (bus@fe000000) and the bus
ranges make the addresses relative to it.

		apb: bus@fe000000 {
			compatible = "simple-bus";
			reg = <0x0 0xfe000000 0x0 0x480000>;
			#address-cells = <2>;
			#size-cells = <2>;
			ranges = <0x0 0x0 0x0 0xfe000000 0x0 0x480000>;

			clkc_periphs: clock-controller@0 {
				compatible = "amlogic,s7-peripherals-clkc";
				reg = <0x0 0x0 0x0 0x49c>;
				#clock-cells = <1>;
				...

In V2 I'll use an absolute address for the sake of clarity (PLL has the
same issue).

Thanks,

--
Carlo Caione
