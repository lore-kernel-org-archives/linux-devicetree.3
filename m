Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D6E22C3255
	for <devicetree@vger.kernel.org>; Sat, 29 Aug 2026 11:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788004031; cv=none; b=ehPVpAPhMNi9aDqdFDAH/gjBmNWtU3hD5P2kaQYgiVlrf5YcRNVlF75Bq9inNnqQ9/+r+lnKZ4KiISw+vwy0ngC66jTwLG4YA/ZtoAJkrhBtm5tvl20pNN2uxYhbmTCZEhKGtmT+Rcamzsjk+YHsUBMb9VT3/UxPLS+3VHv/294=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788004031; c=relaxed/simple;
	bh=QoA1i2bw1PTvwVLs0x0n58nVFfkIazHzKte0QfVr4jY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bQx7fYKAZSyXnJ47Zq8O19pBFVvAFDzWo5DjZW7rMwnpgQsnscOBp7Ntta98gtZWxHW6uQ5wYns5955PR1u9gzoLDkOXcgyXoiLv4MzqotO8rFcO8oYI0SzOLjD5u+ltozkxDJg5+sh42QQrY6c7sy/TOdPOBiOBLeFmznOrm2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=al8MXR/x; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="al8MXR/x"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-398b3c37877so281309a91.0
        for <devicetree@vger.kernel.org>; Sat, 29 Aug 2026 04:47:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788004030; x=1788608830; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1vqI14HLIzxZhfuAXP+1goiBkOtG4fYO1VJ85pvQxO8=;
        b=al8MXR/xd09FiOzzU6PyeMTfW1zAl5c2sMvBNQzEjPqVvOkmLinTC56C/ub+WUfMgh
         4oEYOwhSw25oVjwSg31xs6Uqvly9Z1a/iKXoVQDWRqkdJ6u7rQV9SVQU19uSwiUvia/G
         GZfnWt8m45dJ+aAjsovuvs0/eX5agahl+0h97pyU9loD1WyL8+khFmosU2D3zICQP2qf
         0ZjlkAK4ESdADzOXl0cCQAymazEV1TdE5RfLZHCnhYxg0iWHQih0Y63cLmctdDgyjFD1
         WbE7mqXSosAYhaqVNUXBNCKApeqqxYexEb/TXL17SjjQrXnPKjNMm+nxxTymM1a9DYc9
         GA7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788004030; x=1788608830;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1vqI14HLIzxZhfuAXP+1goiBkOtG4fYO1VJ85pvQxO8=;
        b=Uq7cLNLT/FKWaeCn6Bs+tyUcnnAkSEWFagOb4eQKJXdHuR7iFlT13XuQ4psW30Uk/5
         zKYNrAWMrhy7XlAUeLeRGqEsf7Af9kb/6wAHdYDj/u+sZG78+4HJLuBi/sDJ6sS2U1mu
         jnKMO1WKWS45iCR2AU3ZSfdaXGIs+s8ZugDBDmjOaffFO/3yBC5sn6NiJl86tMX4eI1h
         KyvFf+cptltU4AC8IwYwughkqIZ8+FTgygiTM9dIsa6k38QCQ5fxSbrDMCR1yLKkaT0a
         DhYwA1PMpF/LXnXZt5t1wKYEvT31acgC+7ieUUMw4JXfXiJi6LJ8TEH7Jnuln4vcvM5v
         e6kA==
X-Forwarded-Encrypted: i=1; AKwUvByEerrQVoxaRfaVRopl7O3SM6TkRxNlOIVxkYxsvj3OFkO7Vx/+oK7cupIFwwEyFYxxjzZrJOL7Nu+z@vger.kernel.org
X-Gm-Message-State: AFuF++k7o8+KsCm4GOD1lvzzIzproMtUTYGyKk/uLxZoD6ag+z3+EL7/
	FXTp2D8LSrHvfjDSuCixGHrIoGxFm9PvcVbobB3WaIIzZdihypPksE4f
X-Gm-Gg: AYBFou0vsYU2WMdxhZS8zPi0FaFbRNl+BdUK7iICf41kykVMy2T7c6bi7D+K18pqI5t
	9p1lQuUBCqYRl7oMO0UVVDL000nTKAdjqF7Hhn6rNjTpxBF6OMCX4lPEde5ycpY+MqG2QceiRLY
	XTRrM5HEnStkLT9pFPvNs84DFZED0eIasccMHuwgfunkf/2gvCKloa/yRy21Nh2d0qGLa0xEvYa
	NRaYr4IogaAhP2AFqc7Rjkefh+Nno8FFCdAVjmltDEkaYvlclbF3IKMAaFOsucSQ5sXPtJnU+Wx
	xekYlCgGwbfCVhqaZn6DA8+XqYitIOifCLxn5Y7YfeJXEd/5Hp/tvIcg3fezex6QepOUFac6gMN
	KRhJDiAGsVvEjHlX4eL+BOzr9fJi4op134xTXuTfPgnlzzqn/3yUIrD1XmMWppLH3Lcj1WdR/FK
	0vYgnh1XpVkNjxGBxVKrhdIfcsON3y2aZcfkDXEp6tBc39flO76/fclKewCpqyhZrk/hEDVigGD
	yusaTTV
X-Received: by 2002:a17:90b:2f0f:b0:380:540:d499 with SMTP id 98e67ed59e1d1-396d0ed0023mr24877699a91.6.1788004029521;
        Sat, 29 Aug 2026 04:47:09 -0700 (PDT)
Received: from DESKTOP-TIT0J8O.localdomain ([157.51.208.77])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f552473sm16735823eec.0.2026.08.29.04.47.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 04:47:08 -0700 (PDT)
Date: Sat, 29 Aug 2026 15:47:00 +0400
From: Ahmed Naseef <naseefkm@gmail.com>
To: Conor Dooley <conor@kernel.org>
Cc: Ahmed Naseef <naseefkm@gmail.com>, linux-gpio@vger.kernel.org,
	Benjamin Larsson <benjamin.larsson@genexis.eu>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>,
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2 2/3] dt-bindings: pinctrl: Add EcoNet EN7528 pin
 controller
Message-ID: <apLGtCRjCP1j0u5i@DESKTOP-TIT0J8O.localdomain>
References: <cover.1787931313.git.naseefkm@gmail.com>
 <c20005a81b4069f3ff68311629ff7d4678fa92dd.1787931313.git.naseefkm@gmail.com>
 <20260828-chaos-recovery-c99d547ee1b6@spud>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260828-chaos-recovery-c99d547ee1b6@spud>

On Fri, Aug 28, 2026 at 04:51:27PM +0100, Conor Dooley wrote:
> On Fri, Aug 28, 2026 at 07:35:14PM +0400, Ahmed Naseef wrote:
> > Add the binding for the pin controller found on the EcoNet EN7528 MIPS
> > SoC. It shares the IP with the Airoha pin controllers, but its IOMUX and
> > pin configuration registers have a different layout, so it gets its own
> > compatible.
> > 
> > The CHIP SCU holding those registers is referenced by the airoha,chip-scu
> > phandle.
> > 
> > Signed-off-by: Ahmed Naseef <naseefkm@gmail.com>
> > ---
> >  .../pinctrl/econet,en7528-pinctrl.yaml        | 190 ++++++++++++++++++
> >  1 file changed, 190 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/pinctrl/econet,en7528-pinctrl.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/pinctrl/econet,en7528-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/econet,en7528-pinctrl.yaml
> > new file mode 100644
> > index 000000000000..3ce1a5309d09
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/pinctrl/econet,en7528-pinctrl.yaml
> > @@ -0,0 +1,190 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/pinctrl/econet,en7528-pinctrl.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: EcoNet EN7528 Pin Controller
> > +
> > +maintainers:
> > +  - Lorenzo Bianconi <lorenzo@kernel.org>
> > +
> > +description:
> > +  The EcoNet EN7528 pin controller is used to control SoC pins. It shares the
> > +  IP with the Airoha pin controllers, but its IOMUX and pin configuration
> > +  registers have a different layout.
> > +
> > +properties:
> > +  compatible:
> > +    const: econet,en7528-pinctrl
> > +
> > +  airoha,chip-scu:
> > +    description: phandle to the chip SCU syscon
> > +    $ref: /schemas/types.yaml#/definitions/phandle
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  gpio-controller: true
> > +
> > +  '#gpio-cells':
> > +    const: 2
> > +
> > +  gpio-ranges:
> > +    maxItems: 1
> > +
> > +  interrupt-controller: true
> > +
> > +  '#interrupt-cells':
> > +    const: 2
> > +
> > +patternProperties:
> > +  '-pins$':
> > +    type: object
> > +
> > +    patternProperties:
> > +      '^mux(-|$)':
> > +        type: object
> > +
> > +        description:
> > +          pinmux configuration nodes.
> > +
> > +        $ref: /schemas/pinctrl/pinmux-node.yaml
> > +
> > +        properties:
> > +          function:
> > +            description:
> > +              A string containing the name of the function to mux to the group.
> > +            enum: [gpio, jtag, pcie_reset, pcm, pcm_spi, phy1_led0,
> > +                   phy1_led1, phy2_led0, phy2_led1, phy3_led0, phy3_led1,
> > +                   phy4_led0, phy4_led1, pnand, pon, pwm, sipo, spi, uart]
> > +
> > +          groups:
> > +            description:
> > +              An array of strings. Each string contains the name of a group.
> > +            items:
> > +              enum: [pon, sipo, sipo_rclk, uart2, uart2_cts_rts, uart3,
> > +                     ejtag, pcm1, pcm2, spi_quad, spi_cs1, pcm_spi,
> > +                     pcm_spi_int, pcm_spi_rst, pcm_spi_cs1, pcm_spi_cs2,
> > +                     pcm_spi_cs3, pcm_spi_cs4, pcm_spi_cs5, pcm_spi_cs6,
> > +                     pcm_spi_cs7, pnand, gpio0, gpio1, gpio2, gpio3, gpio4,
> > +                     gpio5, gpio6, gpio7, gpio8, gpio9, gpio10, gpio11,
> > +                     gpio12, gpio13, gpio14, gpio15, gpio16, gpio17,
> > +                     gpio18, gpio19, gpio20, gpio21, gpio22, gpio23,
> > +                     gpio24, gpio25, gpio26, gpio27, gpio28, gpio29,
> > +                     gpio30, gpio31, gpio32, gpio33, gpio34, gpio35,
> > +                     gpio36, gpio37, gpio38, gpio39, gpio40, gpio41,
> > +                     pcie_reset0, pcie_reset1]
> > +
> > +        required:
> > +          - function
> > +          - groups
> > +
> > +        additionalProperties: false
> > +
> > +      '^conf(-|$)':
> 
> Why is this needed? Why can you not tell from the group which pins the
> config applies to?

Not for all of them: i2c_sda, i2c_scl, uart_txd and uart_rxd are in no
group at all. The spi_cs0/clk/mosi/miso pads are only in pnand, which is
17 pins wide, so no group names them individually either.

Ahmed


> 
> Thanks,
> Conor.
> 
> > +        type: object
> > +
> > +        description:
> > +          pinconf configuration nodes.
> > +
> > +        $ref: /schemas/pinctrl/pincfg-node.yaml
> > +
> > +        properties:
> > +          pins:
> > +            description:
> > +              An array of strings. Each string contains the name of a pin.
> > +            items:
> > +              enum: [gpio0, gpio1, gpio2, gpio3, gpio4, gpio5, gpio6,
> > +                     gpio7, gpio8, gpio9, gpio10, gpio11, gpio12, gpio13,
> > +                     gpio14, gpio15, gpio16, gpio17, gpio18, gpio19,
> > +                     gpio20, gpio21, gpio22, gpio23, gpio24, gpio25,
> > +                     gpio26, gpio27, gpio28, gpio29, gpio30, gpio31,
> > +                     gpio32, gpio33, gpio34, gpio35, gpio36, gpio37,
> > +                     gpio38, gpio39, pcie_reset0, pcie_reset1, i2c_sda,
> > +                     i2c_scl, uart_txd, uart_rxd, spi_cs0, spi_clk,
> > +                     spi_mosi, spi_miso]
> > +            minItems: 1
> > +            maxItems: 50
> > +
> > +          bias-disable: true
> > +
> > +          bias-pull-up: true
> > +
> > +          bias-pull-down: true
> > +
> > +          input-enable: true
> > +
> > +          output-enable: true
> > +
> > +          output-low: true
> > +
> > +          output-high: true
> > +
> > +          drive-strength:
> > +            description:
> > +              Selects the drive strength for the pin, in mA.
> > +            enum: [2, 4]
> > +
> > +        required:
> > +          - pins
> > +
> > +        additionalProperties: false
> > +
> > +    additionalProperties: false
> > +
> > +required:
> > +  - compatible
> > +  - airoha,chip-scu
> > +  - interrupts
> > +  - gpio-controller
> > +  - gpio-ranges
> > +  - "#gpio-cells"
> > +  - interrupt-controller
> > +  - "#interrupt-cells"
> > +
> > +allOf:
> > +  - $ref: pinctrl.yaml#
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/interrupt-controller/mips-gic.h>
> > +    #include <dt-bindings/interrupt-controller/irq.h>
> > +
> > +    pinctrl {
> > +      compatible = "econet,en7528-pinctrl";
> > +
> > +      airoha,chip-scu = <&chip_scu>;
> > +
> > +      interrupt-parent = <&gic>;
> > +      interrupts = <GIC_SHARED 10 IRQ_TYPE_LEVEL_HIGH>;
> > +
> > +      gpio-controller;
> > +      #gpio-cells = <2>;
> > +
> > +      interrupt-controller;
> > +      #interrupt-cells = <2>;
> > +
> > +      gpio-ranges = <&pinctrl 0 0 42>;
> > +
> > +      uart2-pins {
> > +        mux {
> > +          function = "uart";
> > +          groups = "uart2";
> > +        };
> > +
> > +        conf {
> > +          pins = "gpio28", "gpio29";
> > +          bias-pull-up;
> > +        };
> > +      };
> > +
> > +      pwm-pins {
> > +        mux {
> > +          function = "pwm";
> > +          groups = "gpio30";
> > +        };
> > +      };
> > +    };
> > -- 
> > 2.34.1
> > 


