Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7736443FD26
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 18:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787076523; cv=none; b=MnJhyGtMPNXhLdnSDaWa1K86h/fegZnQkO3oIM2bPQOo+o6LZrqw35IJkIMLs6eJ4nUVzErCn4BPjyhiVI4y10p3Q4YGoBlvQCYQJkvXmUS5JqcvKPRT1HzQ81ePrrI8D/wPU1qTEL7up0r+We3bxZ7XX/vBRlzMBlzFG4gx0sk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787076523; c=relaxed/simple;
	bh=ljq6wlcrbG+jNSceqovgztXUVGeO8fWkLNz+62ATjv4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YryPUZ/FSq77iKKIcupPNGGKmitQUXtUh7yUIa2Ixlb1Bthe2P58JhIvuTNOGZqi9W906BdNkq2QRNqjHsaY7q9QXQPyBXKO5CkzfkZ1iiqQ/sCKmWvEUX/nKg/w4egzbh3g8tiCB0TFwNpmLV1I3np3Y1N97uD7JvWQWl3OmUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d+d86JVc; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d+d86JVc"
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-5bf83925ddaso71889e0c.1
        for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 11:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787076520; x=1787681320; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/Q6ZML4PkLQlkM1EJlZ9nhqZzRAkcWVhx1GwB+/mWrQ=;
        b=d+d86JVccx+H1G4FMonnNGgg4Bc7u9+04sKpwI3vbKVvwZVOIuVWfPxPmHOqKhQa/0
         RKiP3Is+Az43UdRnSKvXgig4do3imNZ3v+j58SALH708yt4UzvfCjRFj0J5BDKDT8k0i
         cKhKfk/lXXEOxnFFdVDXu+lHAkx2EOpi10wUp6tdqMUOndQBjf8JZVJBT5gBGkvk0P5C
         rvbC3HPCuGd0NYx8Y/NRVA+4SNO46iW5KFVAhDd6rPZco4XlsuahlLI14pqoCnvBZZ4w
         j+Sj0pRf16bJb9ie87bfB65Q846eofBsgOTKH7jq/jNXwkdYwHjq9BRUokm1AtASBWpZ
         nGrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787076520; x=1787681320;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/Q6ZML4PkLQlkM1EJlZ9nhqZzRAkcWVhx1GwB+/mWrQ=;
        b=j9auzXrQRHpOvGECEPZlmhG5UbAgTpcbw0RG7vShmnAZaFfgsgBnRijVDIff/MuZ6q
         1D7YIy3SKL6tX2qWKkAtSpenHAx1lgLvkCEKrc7c9CPa6Xx9RSiV3s4a0XAi7DI5ay3r
         a0/BV2QUSiAntDO8fvBRbCwQH0BEeBgv1gStV2IaBj/oWmKnUlqdNl7dkn3rqpJ8KZ/4
         RoxcrYc1ev1uSyBNccrvYgk2nGZeheLDHoazJQc02OrrKGTAc1Wohe75X/UuAahPmxA0
         iO8lsIOoGKJsise5T3W9J5fygCrHObGjSVEt5HgUSEJLNsmLwr8y5xZzdSeyPJm+rY3i
         WYXw==
X-Forwarded-Encrypted: i=1; AHgh+RoXiL8OkEaOgi6yss/SRSJmZCRaNFl0r5SD2GI9lb8b43Z+1umXPwl/2H6kn17BpYpe48Dj/AckZs8z@vger.kernel.org
X-Gm-Message-State: AOJu0YxRnIcp/uvIq+deVOOdO9LxG/Ad+Mb2B4Ku6VvDB+Xjeg3okbJq
	YjKSTkg53UeEV72VtM+0l3Pt6UDV72c1b31sKYX/Au0Dj2g9PhaqkZMp
X-Gm-Gg: AR+sD11YREfQY6fZETXm83z3XYWusJgxn3M5xEkwpI1SkLbBFfDAic/kOIjkGfDhKGK
	Wpm2D5evK8XyX78UBt6LMh+ZarhkOEyiZTs542d/f4YFeMK/Oaum0PtKYv5VkTVNU1UxLD0AYKk
	0Tm3C43jXwK49uGmTV06+tPddyYrRHrEX+jQdeBTcN088dYHJECP+1r0AtHg/ljKztil4+qkQyB
	ryrbesAqU8OdLUAx9onJ21rD1ZkJebj8caInCPTx+pp7YSmvfR8hbPpKR8NYHvB+S9OXWHUJstN
	BfrBqflLP+U3QwKXcGAawDc0uLaaeNyMiGFSXqVu8ylsj+AmGYwGnDDJzMSz1JPI832sZRT/G68
	BwvpWxuHFtALFanaT/Ylb0utYRLUN36+/AJYXd6d+7F9/Njxq3580Uty9N2CqE5vlDEuzXDFwO6
	+9OWxe4eheY1p6voOOSEfHT23vIsA4sqfKTtiIEws4GZk00z5KDgA62z3kqR+u6d1KNWY=
X-Received: by 2002:a05:6122:3401:b0:5bf:4522:fca7 with SMTP id 71dfb90a1353d-5c591c966b6mr8543926e0c.4.1787076520216;
        Tue, 18 Aug 2026 11:08:40 -0700 (PDT)
Received: from leonardoc-nb ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c5c78ea7desm4440166e0c.13.2026.08.18.11.08.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 11:08:39 -0700 (PDT)
Date: Tue, 18 Aug 2026 15:08:33 -0300
From: Leonardo Costa <leoreis.costa@gmail.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Frank.Li@nxp.com, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Leonardo Costa <leonardo.costa@toradex.com>
Subject: Re: [PATCH 6/6] arm64: dts: freescale: imx8mp-verdin: Add Mezzanine
 with Toradex Display 10.1" LVDS V2
Message-ID: <juuc4af7ndbajcl7gzf4tg5qz2q2j5tt3rvql4jbauradujrre@gc5nbdhhixaf>
References: <20260813133335.1941580-1-leoreis.costa@gmail.com>
 <20260813133335.1941580-7-leoreis.costa@gmail.com>
 <an3brO5COdw_F76m@SMW015318>
 <rglymw6p4c65yoqz3pjn6e6nq7cil2fa7m7dqghshgdpavby7d@kyza3ceavq6z>
 <an3tiDOUUYLb8PAq@SMW015318>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <an3tiDOUUYLb8PAq@SMW015318>

On Thu, Aug 13, 2026 at 11:15:04AM -0500, Frank Li wrote:
> On Thu, Aug 13, 2026 at 12:43:29PM -0300, Leonardo Costa wrote:
> > On Thu, Aug 13, 2026 at 09:58:52AM -0500, Frank Li wrote:
> > > On Thu, Aug 13, 2026 at 10:33:35AM -0300, Leonardo Costa wrote:
> > > > From: Leonardo Costa <leonardo.costa@toradex.com>
> > > >
> > > > Add a device tree overlay enabling the Toradex Capacitive Touch Display
> > > > 10.1" LVDS V2 on the Verdin Development Board with Verdin iMX8M Plus
> > > > Mezzanine expansion board. The panel connects via the i.MX8M Plus LCDIF
> > > > on the Mezzanine LVDS interface (J10). The panel is an Opto Logic
> > > > SCX1001511GGC49 10.1" WXGA TFT LCD LVDS and the touch input is provided
> > > > by an ILITEK ILI251x capacitive touch controller.
> > > >
> > > > Link: https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-101inch-lvds
> > > > Link: https://developer.toradex.com/hardware/verdin-som-family/add-ons/verdin-imx8m-plus-mezzanine
> > > > Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
> > > > ---
> > >
> > > what's difference with Add Toradex Capacitive Touch Display 10.1" LVDS V2
> > >
> > > why not share one dtso?
> > >
> > > Frank
> >
> > Hi Frank,
> >
> > There are two main differences:
> >
> > 1. The mezzanine one uses different backlight controll pins, so here we
> > use the 'backlight-mezzanine' node, instead of the 'backlight' one, used
> > in the one without the mezzanine.
> >
> > 2. The touchscreen GPIO and interrupt pins are also different with the
> > mezzanine board.
> 
> 
> And there are for imx8mm
> https://lore.kernel.org/imx/20260724-v1-verdin-imx8mm-dtbos-v2-3-9d7988bd76f6@toradex.com/
> 
> https://lore.kernel.org/imx/sr26lfvwasgcosfzcf4ydtwxwjjutlio2yqpgxldatpzjo7e4y@77k7gefnjzvl/
> 
> Any ways, it is too late for 7.3, we have enough time for 7.4 to discuss
> work on optimization solution.
> 
> If use nexus connectors, we can share one dtso now if there are not
> clock settings.

Hi Frank,

I tried implementing the nexus connectors in imx8mp-verdin-wifi-dev.dts, and
modify the Mezzanine overlay for the LVDS V2 display to do an initial test
(diff with the changes at the end of the email). They worked partially, but it
introduced an issue where the drivers come up much later. Before, the drivers
relevant for the display (in this case, LCDIF and the touch controller
specifically) came up at around ~8s. After introducing the nexus connector they
come up at around ~20s, after the board has already booted (complete logs at
https://paste.debian.net/hidden/81acfa7d):

    [   21.008400] input: ILI210x Touchscreen as /devices/platform/soc@0/30800000.bus/30a30000.i2c/i2c-1/1-0041/input/input3
    [   21.014785] [drm] Initialized imx-lcdif 1.0.0 for 32e90000.display-controller on minor 2
    [   21.029634] Console: switching to colour frame buffer device 160x50
    [   21.029823] imx-lcdif 32e90000.display-controller: [drm] fb0: imx-lcdifdrmfb frame buffer device
    [   21.031376] imx8m-blk-ctrl 32ec0000.blk-ctrl: sync_state() pending due to 32e30000.dwe

Was this behavior observed before? It may have not been noticed, since the
drivers do come up at some point, and it may not be an issue for other
interfaces, or they may actually come up earlier in other cases. In our case
this is important though, since visual feedback from the display is expected
early.

It seems that the drivers are being deferred at boot start by the
device_links_check_suppliers() function. It runs through the drivers before
they're initialized and defers them if their suppliers are not available. The
GPIO and PWM drivers are able to follow the gpio-map and pwm-map properties
(through the of_parse_phandle_with_args_map() function), but from what I see,
device_links_check_suppliers() has no such mechanism. It follows the phandle to
the nexus connector node only, and since there's no compatible driver for it,
the function defers the consumer drivers used in the overlay.

I think this is what is happening mainly because setting the
fw_devlink=permissive kernel parameter (which sets the DL_FLAG_SYNC_STATE_ONLY
flag) solved the issue, though I could be misunderstanding something.

	int device_links_check_suppliers(struct device *dev)
	{
		...
		list_for_each_entry(link, &dev->links.suppliers, c_node) {
			...

			if (link->status != DL_STATE_AVAILABLE &&
			    !device_link_test(link, DL_FLAG_SYNC_STATE_ONLY)) {

				...
				device_links_missing_supplier(dev);
				ret = dev_err_probe(dev, -EPROBE_DEFER,
						    "supplier %s not ready\n", dev_name(link->supplier));
				break;
			}
			WRITE_ONCE(link->status, DL_STATE_CONSUMER_PROBE);
		}
		...
	}

Has this behavior been observed before? Do you know of any work being done that
addresses this?

See below the changes that I made for this test, relative to my last patch
(only a draft):

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-verdin-dev-mezzanine-panel-cap-touch-10inch-lvds-v2.dtso b/arch/arm64/boot/dts/freescale/imx8mp-verdin-dev-mezzanine-panel-cap-touch-10inch-lvds-v2.dtso
index b78322907192..4aa1c407af3f 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-verdin-dev-mezzanine-panel-cap-touch-10inch-lvds-v2.dtso
+++ b/arch/arm64/boot/dts/freescale/imx8mp-verdin-dev-mezzanine-panel-cap-touch-10inch-lvds-v2.dtso
@@ -21,9 +21,19 @@
 #include "imx8mp-pinfunc.h"
 
 &{/} {
+	backlight_lvds: backlight-lvds {
+		compatible = "pwm-backlight";
+		brightness-levels = <0 45 63 88 119 158 203 255>;
+		default-brightness-level = <4>;
+		/* Verdin GPIO 4 (SODIMM 212) */
+		enable-gpios = <&lvds_native_connector 1 GPIO_ACTIVE_HIGH>;
+		/* Verdin PWM_2 (SODIMM 16) */
+		pwms = <&lvds_native_connector 0 6666667 0>;
+	};
+
 	panel-lvds-native {
 		compatible = "optologic,scx1001511ggc49", "panel-lvds";
-		backlight = <&backlight_mezzanine>;
+		backlight = <&backlight_lvds>;
 		data-mapping = "vesa-24";
 		power-supply = <&reg_3p3v>;
 		height-mm = <136>;
@@ -53,13 +63,6 @@ panel_lvds_native_in: endpoint {
 	};
 };
 
-&backlight_mezzanine {
-	/* Verdin PWM_2 (SODIMM 16) */
-	pwms = <&pwm2 0 6666667 0>;
-
-	status = "okay";
-};
-
 /* Verdin I2C_2_DSI */
 &i2c2 {
 	#address-cells = <1>;
@@ -69,10 +72,10 @@ touchscreen@41 {
 		compatible = "ilitek,ili251x";
 		reg = <0x41>;
 		/* Verdin GPIO_3 (SODIMM 210) */
-		interrupt-parent = <&gpio1>;
-		interrupts = <5 IRQ_TYPE_EDGE_RISING>;
+		interrupt-parent = <&lvds_native_connector>;
+		interrupts = <1>;
 		/* Verdin GPIO_2 (SODIMM 208) */
-		reset-gpios = <&gpio1 1 GPIO_ACTIVE_LOW>;
+		reset-gpios = <&lvds_native_connector 0 GPIO_ACTIVE_LOW>;
 	};
 };
 
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-verdin-dev.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-verdin-dev.dtsi
index 72a4f846d694..1103da3d34ba 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-verdin-dev.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-verdin-dev.dtsi
@@ -4,6 +4,28 @@
  */
 
 / {
+	lvds_native_connector: lvds-mezzanine-connector {
+		// NOTE: Placeholder name, no binding for this yet
+		compatible = "tdx,verdin-lvds-connector";
+
+		#gpio-cells = <2>;
+		gpio-map = <0 0 &gpio1 1 0>, /* Touchscreen reset GPIO */
+			   <1 0 &gpio1 6 0>; /* Backlight Enable GPIO */
+		gpio-map-mask = <0xffffffff 0x0>;
+		gpio-map-pass-thru = <0x0 0xffffffff>;
+
+		#pwm-cells = <3>;
+		pwm-map = <0 0 0 &pwm2 0 0 0>; /* Backlight PWM */
+		pwm-map-mask = <0x0 0x0 0x0>;
+		pwm-map-pass-thru = <0x0 0xffffffff 0xffffffff>;
+
+		#address-cells = <0>;
+		#interrupt-cells = <1>;
+		interrupt-map = <0 &gpio1 5 IRQ_TYPE_EDGE_FALLING>, /* Touchscreen interrupt */
+				<1 &gpio1 5 IRQ_TYPE_EDGE_RISING>;
+		interrupt-map-mask = <0xffffffff>;
+	};
+
 	native-hdmi-connector {
 		compatible = "hdmi-connector";
 		label = "X37";

Leonardo
