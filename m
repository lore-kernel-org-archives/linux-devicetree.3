Received: from azure-sdnproxy.icoremail.net (azure-sdnproxy.icoremail.net [207.46.229.174])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E266A3CE0B0;
	Fri, 26 Jun 2026 06:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=207.46.229.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782456142; cv=none; b=MdKFV5YGQKtjOboiwvYptmOknBMkDigD1KyNJ+AoBWNakppY5Kz7yOkzjWS1LP5Cqco9C0G6d97a/OO3zfT5ABVE5DfmyUtLgFd+0q1OGoHhJoWpyE220VsLx5TaXcIfpYlkbqg1E8BEAXNhIrz19xI0Q8gQYwXvgDjOqavNM1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782456142; c=relaxed/simple;
	bh=TAwtrN3jSQMxAlFjUmRPuZQH3fjoBdzZpcYVXbGrRwA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=OIJyrzC6lJhpdu0KbZO4ELlkoaO/L9gZzhYpeOb5HOcJgXeg8gEp9d7GUK0e5JT4KDU7OkgGufSXGhEHvJG95M6OlPMT3N3tbz2ngtTfCs2sIb5bBPJS2s33C2nb3edxzaOyIOC4eXRFFeXs2xZOuP/HHdlDsAs5slOAn5F0q70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=eswincomputing.com; spf=pass smtp.mailfrom=eswincomputing.com; arc=none smtp.client-ip=207.46.229.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=eswincomputing.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=eswincomputing.com
Received: from E0006800LT.eswin.cn (unknown [10.12.96.77])
	by app1 (Coremail) with SMTP id TAJkCgBn+286Hz5q5MUuAA--.51254S2;
	Fri, 26 Jun 2026 14:42:04 +0800 (CST)
From: Yulin Lu <luyulin@eswincomputing.com>
To: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Min Lin <linmin@eswincomputing.com>
Cc: Yulin Lu <luyulin@eswincomputing.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Darshan Prajapati <darshan.prajapati@einfochips.com>,
	Pritesh Patel <pritesh.patel@einfochips.com>
Subject: Re: Re: [PATCH 3/7] riscv: dts: eswin: eic7700: add pinctrl support
Date: Fri, 26 Jun 2026 14:42:02 +0800
Message-Id: <20260626064202.1045-1-luyulin@eswincomputing.com>
X-Mailer: git-send-email 2.31.1.windows.1
In-Reply-To: <20260615123315.ABB4A1F00A3A@smtp.kernel.org>
References: <20260615123315.ABB4A1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:TAJkCgBn+286Hz5q5MUuAA--.51254S2
X-Coremail-Antispam: 1UD129KBjvJXoWxCrW7tr1xAF17CF1UZw4fZrb_yoWrGr1xpF
	W3WFZ3AFn7CryxJ3y2qw409r47Za1fGFnIkr1Dtry2yrn8uFyftFsYyr45Xa4UZr4FvrnY
	vF4Y934IvF1UAaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9G14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2
	Y2ka0xkIwI1lc7CjxVAaw2AFwI0_GFv_Wrylc2xSY4AK6svPMxAIw28IcxkI7VAKI48JMx
	C20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAF
	wI0_JrI_JrWlx4CE17CEb7AF67AKxVW8ZVWrXwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20x
	vE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v2
	0xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxV
	W8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7sRidbbtUUUUU==
X-CM-SenderInfo: pox13z1lq6v25zlqu0xpsx3x1qjou0bp/

Hi, sashiko.

> [Severity: Low]
> Should this node be named using the generic regulator-* pattern (such as
> regulator-1v8) to avoid dtbs_check warnings for deprecated names?
> There is also an extra leading space on the properties within this node
> that deviates from standard spacing.

I will rename this node to "regulator-1v8".

> > +  regulator-name = "vcc1v8";
> > +  regulator-always-on;
> > +  regulator-boot-on;
> > +  regulator-min-microvolt = <1800000>;
> > +  regulator-max-microvolt = <1800000>;
> > +  };
> >  };
> [ ... ]
> > @@ -25,6 +35,105 @@ &xtal {
>   clock-output-names = "xtal24m";
> >  };
> >  
> > +&gpio0_pins {
> > + bias-disable;
> > + input-enable;
> > +};
> [Severity: High]
> Will these pin configuration overrides be silently ignored by the pinctrl
> core during boot?
> Since these pin definitions are not referenced by a pinctrl-0 property in
> an active device node, and are not configured as pinctrl hogs in the provider,
> the intended hardware states for these pins will not be programmed.

I don't think this is an issue. These pin configurations won't be ignored by the kernel during boot.
Some pins have input-enable, pull-down, or pull-up settings that differ from the chip defaults on
certain boards, these configurations are added these configurations in the board-level DTS.

> [ ... ]
> > diff --git a/arch/riscv/boot/dts/eswin/eic7700-pinctrl.dtsi b/arch/riscv/boot/dts/eswin/eic7700-pinctrl.dtsi
> > new file mode 100644
> > index 0000000000000..7293df146aa7b
> > --- /dev/null
> > +++ b/arch/riscv/boot/dts/eswin/eic7700-pinctrl.dtsi
> > @@ -0,0 +1,888 @@
> > +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> [ ... ]
> > + hdmi_pins: hdmi-pins {
> > + pins = "hdmi_scl", "hdmi_sda", "hdmi_cec";
> > + function = "hdmi";
> > + };
> > +
> > + rgmii0_pins: rgmii0-pins {
> > + pins = "rgmii0_clk_125", "rgmii0_txen", "rgmii0_txclk", "rgmii0_txd0",
> > +        "rgmii0_txd1", "rgmii0_txd2", "rgmii0_txd3", "rgmii0_rxclk",
> > +        "rgmii0_rxdv", "rgmii0_rxd0", "rgmii0_rxd1", "rgmii0_rxd2",
> > +        "rgmii0_rxd3", "rgmii0_mdc", "rgmii0_mdio", "rgmii0_intb";
> > + function = "hdmi";
> > + };
> [Severity: High]
> Is the hdmi function correct for this network pin group?
> It appears that rgmii0, rgmii1, and the i2s pin groups that follow all use
> the hdmi function. This will prevent the pin controller from routing these
> pins properly, likely leading to driver probe failures when peripherals
> attempt to request them.

I will fix the function of rgmii0_pins and rgmii1_pins to rgmii, and the function of i2s0_pins,
i2s1_pins, and i2s2_pins to i2s.

> [ ... ]
> > diff --git a/arch/riscv/boot/dts/eswin/eic7700.dtsi b/arch/riscv/boot/dts/eswin/eic7700.dtsi
> > index a7ebb11159580..8798c50f7584d 100644
> > --- a/arch/riscv/boot/dts/eswin/eic7700.dtsi
> > +++ b/arch/riscv/boot/dts/eswin/eic7700.dtsi
> > @@ -349,6 +349,11 @@ gpioD: gpio-port@3 {
> >   };
> >   };
> >  
> > + pinctrl: pinctrl@51600080 {
> > + compatible = "eswin,eic7700-pinctrl";
> > + reg = <0x0 0x51600080 0x0 0x1fff80>;
> > + };
> > +
> [Severity: High]
> Should the existing gpio controller nodes (gpioA, gpioB, gpioC, and gpioD)
> be updated with a gpio-ranges property mapping to this new pinctrl provider?
> Without gpio-ranges, the GPIO subsystem cannot translate GPIO offsets into
> pinctrl pins. The pinctrl core's .gpio_request_enable callback will not be
> invoked when a software component requests a GPIO dynamically, preventing
> the multiplexer from automatically switching the pin to GPIO mode.
> >   clk: clock-controller@51828000 {
> >   compatible = "eswin,eic7700-clock";

I think add gpio-ranges is unnecessary, the driver does not implement
the .gpio_request_enable callback.

Regards,
Yulin Lu

