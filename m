Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795453057;
	b=YvpPzsOJiw4nX5x38BWuMoKcywlGB7O0TpJBtzB1gmGdzX65uWbE5JThHFUF+fk3EI1x
	 z2eLumfUElG8NkjS7sYw0Lc/rrNvnB1g0gYfKjaXsq6J8FVmlW3PZAwqyag2A1o5Bb3CJ
	 s7erO0dwq/zsF+TNM0cjy+V4AQlOJVapEZ4pMoVBoSKIJQCsJmH+29zpeH5O/zIrfGv5F
	 8IRxdRT7Nop60s18lkyTfX8MYc7k9dZ+7G+tKmB6S55NnYLOjRygySsZTc29PFaBlo4E4
	 vpH8vgfKMqulA7ZJC7SYw4SO5N9i3PMVnqhrdnyGd5UPV3wbW7bJ8gdNp9sn5ml9cVg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795453057;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 In-Reply-To:References:MIME-Version:From:X-Google-Nh-Sender:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=7dN/vVzubn6FBy5JBi1JKDPMoy3qFWTVECLWV3xaYhk=;
	b=IRKTdqY0ageO67ALu1bcVbLjvWmSHJWniWVLXdCtz7ZNq+FU6CdI7fmIItjUnfAWyKqt
	 QegKNZ686hhk5j+x1NPWxV5KF3jK0UDQvpUQ8QC/vzXAEvyaKyaqfEsitqRjpArAwtbcx
	 QBOdtUsHYI2AhfLNt1yJvtf1pUQ5qblw7tzhESNSxzmTif1odd2YX8NECNpc912IpshVP
	 IxJ8h55C+Chp8Z8+rLqBHtn1FU2aIUiYhLDUtW29aDXf41OGxDPIkC5fQRS8F62bE5oDj
	 Gbh+I4+3nGc4EiUqNHvyN7rjlQor048ge7+SeVaz9fjrm6Ae7leeq5bhjCupGFPiADQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cy+ADox4;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.44
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A53F606A31A
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 16:57:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A53F606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cy+ADox4
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6b86bbce3d1so4669981a12.0
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 08:57:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795453055; cv=none;
        d=google.com; s=arc-20260327;
        b=M65za90cDxNwrCTNt1vgyTBU+DicUnUtYl++vW3P72LlyN6P/MqjKNSS0qX7zUrnyM
         hSr1DQTI3y8AqpAeas29j6sWS9GN0dS2T8Cq2aHGmWLgAlLtjS1iFNi3hpQTckYtTjJf
         GHW/xnExalU3ozc05oL+JWjeI1Bn1h4jZB0M5EQf+mtpoxb3lRHJVBV/DO/mslqbiKLM
         /AQz7LEkyxdefUK/XpitqNOiLsKgPe7hZD98SWTkKVvXE4/faG4D6wZ5ZcVn8ZCwvF3V
         o3W9ay1U3zm6vMiKFkvB8TWvYn+3F7bAdDTaf1Q0QV7+kQPzZY2AkBOFD2MV9DvNhYJu
         WKUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:references
         :in-reply-to:dkim-signature;
        bh=7dN/vVzubn6FBy5JBi1JKDPMoy3qFWTVECLWV3xaYhk=;
        fh=uvkgiOV25RkyLu209bZw6898DgwEvVIU6ZmSYG1lkxc=;
        b=RtZS1/rk+7dqOoq6u+YH1SpcH6Ng8Hjwfou/dqFqW51TeTT2fjqgWGX6ziVTq4yEFC
         AMX4ci7yOEW1n58ZNuGzmZEYecF2tgJx73VdH8R/G6TSxNmgbOMu8LjFnmmpIA3K18eL
         xVPOaH1wZXGXe8pfIL14SVGzhFwtR5IbROY1aTdVEBMJc+yzYpEF+pxloXhxVRkqlUwe
         ZI8aPtmn6oC54aqpuyOMCuiG7plSY9Ha2Y8R1SWRR1z0DQ5KllXwyU8EcZTSBiTKKqod
         qTWyo/PXAkP21p1ZOF95KZrIWNfbh5wtw7JyN+8oWQVL/JFTeoc62GqqChLS7NteyCbq
         nmUg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795453055; x=1796057855; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :references:in-reply-to:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7dN/vVzubn6FBy5JBi1JKDPMoy3qFWTVECLWV3xaYhk=;
        b=cy+ADox4A65zhFKOUnE2Xpili3MQn+5JJYxZAICrJlBF8Rqp3Rkuh0x5LfNXdZb/pd
         xod+qC/kr3RmdAI86IbWSUMdQ1+UTvZw1wxZ0ZfE3Lg6EJ+o9Ezn3xbTUDoIUnYVh7Rh
         bOoHEHukAGoZ456FZ98XGTS7umRLfWkjVCN48FZ7LqEyM0ZGjwPUO+NXDhbpI2i9BSlt
         1/EIfMR49TQBZ16Ty3FdBDDdhd/U1c5xnfoF+39RJG+jgVby55KrJCKp5CBO0e2/3sQU
         x7gIaXNfYuzStvsYfXx1qYqbUgu1ImDpvWsosLIrekQaFWH0HLwiuMhzEaVHx3D0y1oH
         fSQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795453055; x=1796057855;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :references:in-reply-to:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7dN/vVzubn6FBy5JBi1JKDPMoy3qFWTVECLWV3xaYhk=;
        b=WSSF+JQIEYxoR7jtpbGoOEwXdCl7QybURTkxEpYt9EArpOA95bcJLRDP8PBKeGp2uS
         rgxWqC2ZBsCGMCJMBYIFI5L52qqvzg++JyRU8xrwttonTGn6VvHMl9yFr191DB/TD5hq
         yWd8xDVyqrD90yJQ/su7t461yVJX1IetRKO6XvljGwc46cscTyGhK0QlCgDkCNfAQpkd
         ULcOwDF48BvVwLltLbNQU0HrqiHCQq1JhJmlhmzUmVOsPqI6se65HqNkMpJetrjiIaIl
         9Q86kL5VM1KEmmgLgl5gPD6cPJuSwtN+U4Z40VWhwTWLjhHCwkbB779uSYNVMOVJKwIo
         XCBg==
X-Forwarded-Encrypted: i=1; AL+hErEUiIe8S3sXnIKUDXkLgPhikjZ9TLmrhOXPGwa7ZjxMcg3nIcpGWVDJhY1paOBynCRAPuDUoEIdubHA@vger.kernel.org
X-Gm-Message-State: APuU4Z9t54lHQucxLhZco8YOT5PKQhZJzB3M4/po7UPcuHaCRYt1cP2S
	kTPjlGwlZj14v1pQ0oacu+q+WVifF+nCJGNokGonPaIxFWzV00RIw8lplZQLGwzj6J97PjTKQAd
	vFpV5Pmv7AwXt5MqnJNP+H99kGB91U++bL+iAZ0w=
X-Gm-Gg: AZFdTZfid+XbNivfulFSG2LUxLT2ln4dwzGYUI6w5uOVr7ZwpiQwBhceQj5enbtmuPj
	mhybHGzAfkm/JDMU/yyth6pvpb63nmBF+wWsldOdpA3ZwHAss3d+cWIu02smd35Djq128jKagEH
	+GUMlyG7zZBUMzs0+UOYmk8xdAj9nkN14bZbQq2VvCh+nR+iBDWdu1GQq++K0wzvYJltPV+j/yn
	v3Iio+AW/UQjHOzzAI09/gR2K8I26l6rXbIe2sRpGsrrxAWhvihFvnYV+zomThB+8WcaJ9ocBVO
	erW1JCV/qNdLGknPnwTNu9xou+lKtaYormPDjHJQSQ/2CX2CDURP44bsSg4FLskAc0vhU2FgBfX
	4eWggAWrvnbLGzOS1a+Igc3nhHYbjBs1BKi9X4Yw0A4wnKT2VUfNOp30U99jzHAn+lpNTPbNv5a
	x2K1pVMvbq9yP3fSmyk0Umi5o=
X-Received: by 2002:aa7:da13:0:b0:6b4:1037:2b87 with SMTP id
 4fb4d7f45d1cf-6ba37e8ded8mr5943359a12.31.1795453055285; Mon, 23 Nov 2026
 08:57:35 -0800 (PST)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Mon, 23 Nov 2026 08:57:34 -0800
In-Reply-To: <8f9f9752-4c23-48de-9483-63268627ff3c@arm.com>
References: <20261111134919.90264-1-vinicius.eduardo.pedrosa@gmail.com>
 <20261111134919.90264-3-vinicius.eduardo.pedrosa@gmail.com> <8f9f9752-4c23-48de-9483-63268627ff3c@arm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
X-Google-Nh-Sender: AW_J_UrASlPMOi1enYGbDd7RalW38PQ50ZaFfiwV6Y_BxvNUm5lQPRQ5rH16_Fvib--E9iewX8hh0ND8RTsKAmoDL-KACpMwZtTzhG4ooDVpLbIj8uuiHeWRLBxnpU6OrkTH2tfBoZswn_Qm0uzsBw3F6Pv7eX0d1rI4IiVhDjv6Ay7Xw0JxWYfgxfY6jaL6C_sJv31GI0AF0uqrzU2IspM9ed5gPH_aJSa3SXHBMMqxg189u8lFZgVlTPL0iQ7gqi-DGGyPJWyDsA
Date: Mon, 23 Nov 2026 08:57:34 -0800
X-Gm-Features: Aa3M54r3FfAiu2L7EUgWFmqbow6mlwYvIizYOohUXl_c9RKexdrT-6tJ232IkjI
Message-ID: <nh-1384c024-38de-4962-9d4f-a0bfb55471a6@google.com>
Subject: Re: [PATCH 2/3] arm64: dts: allwinner: add Radxa Cubie A7Z board
To: andre.przywara@arm.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, wens@kernel.org, jernej.skrabec@gmail.com, 
	samuel@sholland.org
Cc: enzo.adriano.code@gmail.com, mripard@kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, Nov 23, 2026 at 1:35 PM Andre Przywara <andre.przywara@arm.com> wrote:
> sorry, I missed your post earlier, so made my own version of the DT
> yesterday. So this is more like comparing this to yours ;-)

No worries. I'll fold your comments into a v2 once Enzo's v5 is out. Do
you plan to post yours? I'd rather end up with one A7Z DT than two.

> > + reg_dcdc9: dcdc9 {
> > + regulator-name = "eldo-input";
>
> The schematic says 1.1V/1.25V. Can you check what it is on your board,
> at runtime? If in doubt, go with 1.1V, this should be enough headroom
> for the ELDO6 this supplies, with outputs 0.8V.

It reads 1240 mV at runtime on my v1.11, what the firmware leaves. I also
ran it at a fixed 1.1 V and it was fine for a few minutes, but the
AXP318W datasheet draft lists 1.2 V as the minimum ELDOIN as an LDO. I'd
use a 1.2 to 1.25 V range, which keeps 1.24 V.

Thanks,
Vinicius

On Mon, 23 Nov 2026 13:35:44 +0100, Andre Przywara
<andre.przywara@arm.com> wrote:
> Hi Vinicius,
>
> sorry, I missed your post earlier, so made my own version of the DT
> yesterday. So this is more like comparing this to yours ;-)
> As you saw my reply to Enzo's .dtsi and A7S .dts, I will keep the same
> issues I mentioned there brief.
>
> On 11/11/26 14:49, Vinicius Pedrosa wrote:
> > Add the device tree for the Radxa Cubie A7Z. Describe UART0, the AXP318W
> > PMIC over R-I2C0, MMC0, RTC and the bank supplies. It is based on the
> > Cubie A7S DT.
> >
> > Unlike the A7S, this board uses BLDO5 for PG and a SY8089 regulator for
> > the PMIC's BLDO and CLDO inputs, and the microSD card-detect line has an
> > external pull-up, so no internal pull-down is used. ELDO1 only supplies
> > VDD2L for LPDDR5 and this board uses LPDDR4, so it is not described.
> > SWOUT1 only feeds ports D and J on the 40-pin header, so it is not kept
> > always-on.
>
> I think this stanza does not belong into the commit message, as
> comparing to some different board is not relevant here.
> Instead you should briefly list the features/connectors of this board,
> look at other commit messages for board .dts files.
>
> >
> > Signed-off-by: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
> > ---
> > arch/arm64/boot/dts/allwinner/Makefile | 1 +
> > .../dts/allwinner/sun60i-a733-cubie-a7z.dts | 286 ++++++++++++++++++
> > 2 files changed, 287 insertions(+)
> > create mode 100644 arch/arm64/boot/dts/allwinner/sun60i-a733-cubie-a7z.dts
> >
> > diff --git a/arch/arm64/boot/dts/allwinner/Makefile b/arch/arm64/boot/dts/allwinner/Makefile
> > index 792152525b43..2eee91dcbd77 100644
> > --- a/arch/arm64/boot/dts/allwinner/Makefile
> > +++ b/arch/arm64/boot/dts/allwinner/Makefile
> > @@ -69,3 +69,4 @@ dtb-$(CONFIG_ARCH_SUNXI) += sun55i-h728-x96qpro+.dtb
> > dtb-$(CONFIG_ARCH_SUNXI) += sun55i-t527-avaota-a1.dtb
> > dtb-$(CONFIG_ARCH_SUNXI) += sun55i-t527-orangepi-4a.dtb
> > dtb-$(CONFIG_ARCH_SUNXI) += sun60i-a733-cubie-a7s.dtb
> > +dtb-$(CONFIG_ARCH_SUNXI) += sun60i-a733-cubie-a7z.dtb
> > diff --git a/arch/arm64/boot/dts/allwinner/sun60i-a733-cubie-a7z.dts b/arch/arm64/boot/dts/allwinner/sun60i-a733-cubie-a7z.dts
> > new file mode 100644
> > index 000000000000..ab3d3d70f9ff
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/allwinner/sun60i-a733-cubie-a7z.dts
> > @@ -0,0 +1,286 @@
> > +// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
>
> I think you need a copyright line here.
>
> Also please explain the situation with the v1.10 and v1.11 versions here.
>
> > +/dts-v1/;
> > +
> > +#include "sun60i-a733.dtsi"
> > +
> > +#include <dt-bindings/gpio/gpio.h>
> > +
> > +/ {
> > + model = "Radxa Cubie A7Z";
> > + compatible = "radxa,cubie-a7z", "allwinner,sun60i-a733";
> > +
> > + aliases {
> > + mmc0 = &mmc0;
>
> Please remove.
>
> > + serial0 = &uart0;
> > + };
> > +
> > + chosen {
> > + stdout-path = "serial0:115200n8";
> > + };
> > +
> > + reg_ps: regulator-system-power {
>
> Please add a short comment where this power comes from (USB-C connector).
>
> > + compatible = "regulator-fixed";
> > + regulator-name = "ps";
> > + regulator-min-microvolt = <5000000>;
> > + regulator-max-microvolt = <5000000>;
> > + regulator-always-on;
> > + };
> > +
>
> As mentioned in the other mail, please add a comment that this has been
> added in v1.11, and v1.10 doesn't have it.
>
> > + reg_ldo_input: regulator-ldo-input {
> > + compatible = "regulator-fixed";
> > + regulator-name = "ldo2v5-input";
> > + /* SY8089: 0.6 V * (1 + RP11 / RP6), 30k / 10k. */
> > + regulator-min-microvolt = <2400000>;
> > + regulator-max-microvolt = <2400000>;
> > + regulator-always-on;
> > + vin-supply = <&reg_ps>;
> > + };
> > +
> > + osc32k: osc32k-clk {
> > + compatible = "fixed-clock";
> > + #clock-cells = <0>;
> > + clock-frequency = <32768>;
> > + };
> > +};
> > +
> > +&cpu0 {
> > + cpu-supply = <&reg_dcdc5>;
> > +};
> > +
> > +&cpu1 {
> > + cpu-supply = <&reg_dcdc5>;
> > +};
> > +
> > +&cpu2 {
> > + cpu-supply = <&reg_dcdc5>;
> > +};
> > +
> > +&cpu3 {
> > + cpu-supply = <&reg_dcdc5>;
> > +};
> > +
> > +&cpu4 {
> > + cpu-supply = <&reg_dcdc5>;
> > +};
> > +
> > +&cpu5 {
> > + cpu-supply = <&reg_dcdc5>;
> > +};
> > +
> > +&cpu6 {
> > + cpu-supply = <&reg_dcdc3>;
> > +};
> > +
> > +&cpu7 {
> > + cpu-supply = <&reg_dcdc3>;
> > +};
> > +
> > +&mmc0 {
> > + bus-width = <4>;
> > + cap-sd-highspeed;
>
> Same as the A7S, please add the others.
>
> > + /* PF6 has an external 10k pull-up and reads high with a card. */
>
> "reads high with a card" is a redundant comment, since this is what
> GPIO_ACTIVE_HIGH already says.
> Please explain the situation with the v1.10 vs. v1.11 versions here.
> And my v1.10 board needs GPIO_PULL_DOWN
>
> > + cd-gpios = <&pio 5 6 GPIO_ACTIVE_HIGH>;
> > + disable-wp;
> > + max-frequency = <50000000>;
> > + no-1-8-v;
>
> Please remove both.
>
> > + vmmc-supply = <&reg_swout2>;
> > + /* The 3.3 V path uses VCC-IO; no Port F voltage switching yet. */
> > + vqmmc-supply = <&reg_swout2>;
>
> Please remove those two lines, we will add vqmmc later.
>
> > + status = "okay";
> > +};
> > +
> > +&osc {
> > + clock-frequency = <26000000>;
> > +};
> > +
> > +&pio {
> > + vcc-pb-supply = <&reg_swout2>;
>
> Please add a comment that this comes from VCC-IO. See the Cubie A5E DT.
>
> > + vcc-pc-supply = <&reg_cldo5>;
> > + vcc-pd-supply = <&reg_swout1>;
> > + vcc-pe-supply = <&reg_bldo1>;
> > + /* CLDO5 feeds VCC18-PF; the 3.3 V path uses VCC-IO. */
> > + vcc-pf-supply = <&reg_cldo5>;
>
> As it stands this is VCC-IO, so swout2, please change that, plus the
> VCC-IO comment.
>
> > + vcc-pg-supply = <&reg_bldo5>;
> > + vcc-ph-supply = <&reg_swout2>;
>
> VCC-IO comment, please.
>
> > + vcc-pj-supply = <&reg_swout1>;
> > + vcc-pk-supply = <&reg_bldo1>;
> > +};
> > +
> > +&r_i2c0 {
> > + status = "okay";
> > + pinctrl-names = "default";
> > + pinctrl-0 = <&r_i2c0_pl_pins>;
> > +
> > + axp318w: pmic@36 {
> > + compatible = "x-powers,axp318w";
> > + reg = <0x36>;
> > + interrupt-parent = <&nmi_intc>;
> > + interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
> > + interrupt-controller;
> > + #interrupt-cells = <1>;
> > +
> > + aldo156in-supply = <&reg_ps>;
> > + aldo234in-supply = <&reg_aldo1>;
> > + bldoin-supply = <&reg_ldo_input>;
> > + cldoin-supply = <&reg_ldo_input>;
>
> Please add a comment about v1.10 differing.
>
> > + dldoin-supply = <&reg_ps>;
> > + eldoin-supply = <&reg_dcdc9>;
> > + ips-supply = <&reg_ps>;
> > + vin19-supply = <&reg_ps>;
> > + vin23-supply = <&reg_ps>;
> > + vin45-supply = <&reg_ps>;
> > + vin678-supply = <&reg_ps>;
> > +
> > + regulators {
> > + reg_dcdc1: dcdc1 {
> > + regulator-name = "vcc-3v3";
> > + regulator-min-microvolt = <3300000>;
> > + regulator-max-microvolt = <3300000>;
> > + regulator-always-on;
> > + };
> > +
> > + reg_dcdc2: dcdc2 {
> > + regulator-name = "vdd-sys";
>
> Please add the voltage: 0.8V.
>
> > + regulator-always-on;
> > + };
> > +
> > + reg_dcdc3: dcdc3 {
> > + regulator-name = "vdd-cpub";
>
> From the OPP tables I could find in the Radxa repo on github, the range
> should be 0.8V - 1.05V. We can adjust this later when we add proper DVFS
> support, if needed.
> > + regulator-always-on;
> > + };
> > +
> > + reg_dcdc4: dcdc4 {
> > + regulator-name = "vdd-gpu";
> > + regulator-always-on;
>
> Voltage range should be 0.8V - 0.96V, and drop the always-on.
>
> > + };
> > +
> > + reg_dcdc5: dcdc5 {
> > + regulator-name = "vdd-cpul";
>
> Voltage range 0.8V - 1.05V.
>
> > + regulator-always-on;
> > + };
> > +
> > + reg_dcdc6: dcdc6 {
> > + regulator-name = "vcc-draml";
> > + regulator-always-on;
> > + };
> > +
> > + reg_dcdc7: dcdc7 {
> > + regulator-name = "vcc-dram";
> > + regulator-always-on;
> > + };
> > +
> > + reg_dcdc8: dcdc8 {
> > + regulator-name = "vcc-ufs-io";
>
> The voltage is 1.2V, and please drop the always-on.
>
> > + regulator-always-on;
> > + };
> > +
> > + reg_dcdc9: dcdc9 {
> > + regulator-name = "eldo-input";
>
> The schematic says 1.1V/1.25V. Can you check what it is on your board,
> at runtime? If in doubt, go with 1.1V, this should be enough headroom
> for the ELDO6 this supplies, with outputs 0.8V.
>
> > + regulator-always-on;
>
> Please remove.
>
> > + };
> > +
> > + reg_swout1: swout1 {
> > + regulator-name = "vcc33-lcd";
>
> Please use "vcc-pd-pj" as the name.
>
> > + };
> > +
> > + reg_swout2: swout2 {
> > + regulator-name = "vcc-io-card";
>
> I used "vcc-io-ph-usb", "card" does not seem to be used.
>
> > + regulator-always-on;
> > + };
> > +
> > + reg_aldo1: aldo1 {
> > + regulator-name = "vcc-pl";
>
> Also USB it seems, so I used "vcc-pl-usb".
>
> > + regulator-min-microvolt = <3300000>;
> > + regulator-max-microvolt = <3300000>;
> > + regulator-always-on;
> > + };
> > +
> > + reg_bldo1: bldo1 {
> > + regulator-name = "vcc-pe-pk-mcsi";
>
> Voltage is 1.8V.
>
> > + };
> > +
> > + reg_bldo2: bldo2 {
> > + regulator-name = "vcc-lvds0";
>
> 1.8V as well.
>
> > + regulator-always-on;
> > + };
> > +
> > + reg_bldo4: bldo4 {
> > + regulator-name = "vcc18-codec";
> > + regulator-min-microvolt = <1800000>;
> > + regulator-max-microvolt = <1800000>;
> > + };
> > +
> > + reg_bldo5: bldo5 {
> > + regulator-name = "vcc-pg";
> > + regulator-min-microvolt = <1800000>;
> > + regulator-max-microvolt = <1800000>;
> > + };
> > +
> > + reg_cldo1: cldo1 {
> > + regulator-name = "vcc33-18-usb";
>
> That is a confusing name ;-) "vcc-pm-lpddr" should explain the always-on.
>
> > + regulator-min-microvolt = <1800000>;
> > + regulator-max-microvolt = <1800000>;
> > + regulator-always-on;
> > + };
> > +
> > + reg_cldo2: cldo2 {
> > + regulator-name = "vcc18-hdmi";
> > + regulator-min-microvolt = <1800000>;
> > + regulator-max-microvolt = <1800000>;
> > + };
> > +
> > + reg_cldo3: cldo3 {
> > + regulator-name = "vcc-pll-dram";
> > + regulator-min-microvolt = <1800000>;
> > + regulator-max-microvolt = <1800000>;
> > + regulator-always-on;
> > + };
> > +
> > + reg_cldo5: cldo5 {
> > + regulator-name = "vcc18-pf-pc";
>
> "pf" is somewhat misleading. I had "vcc-pc-combo".
> > + regulator-min-microvolt = <1800000>;
> > + regulator-max-microvolt = <1800000>;
> > + regulator-always-on;
> > + };
> > +
> > + reg_dldo1: dldo1 {
> > + regulator-name = "vcc-efuse";
>
> Voltage is 1.8V.
>
> > + regulator-always-on;
> > + };
> > +
> > + reg_dldo6: dldo6 {
> > + regulator-name = "vcc-ufs";
>
> Voltage is 2.5V, and no always-on should be needed.
>
> > + regulator-always-on;
> > + };
> > +
> > + reg_eldo6: eldo6 {
> > + regulator-name = "vdd-cpus";
>
> Voltage is 0.8V.
>
> > + regulator-always-on;
> > + };
> > +
> > + reg_rtc_ldo: rtc-ldo {
> > + regulator-name = "vcc-rtc";
> > + regulator-min-microvolt = <1800000>;
> > + regulator-max-microvolt = <1800000>;
> > + regulator-always-on;
> > + };
> > + };
> > + };
> > +};
> > +
> > +&r_pio {
> > + /* PL powers the PMIC bus itself; firmware must keep ALDO1 enabled. */
>
> Probably better to copy the comment from the other DTs, and have the
> "would-be" line inside the comment (vcc-pl-supply = <&reg_aldo1>;)
>
> Cheers,
> Andre
>
> > + vcc-pm-supply = <&reg_aldo1>;
> > +};
> > +
> > +&rtc {
> > + clocks = <&r_ccu CLK_BUS_R_RTC>, <&osc>, <&r_ccu CLK_R_AHB>,
> > + <&osc32k>;
> > + clock-names = "bus", "hosc", "ahb", "ext-osc32k";
> > +};
> > +
> > +&uart0 {
> > + pinctrl-names = "default";
> > + pinctrl-0 = <&uart0_pb_pins>;
> > + status = "okay";
> > +};
