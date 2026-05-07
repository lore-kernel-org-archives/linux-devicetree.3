Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BBB3306B3B
	for <devicetree@vger.kernel.org>; Thu,  7 May 2026 11:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778154634; cv=pass; b=ju+V/zl0J87GjjQBRsow2vqcZ1Y1/KBEepDA0IawygKByvs5lYpRfEZ+dH+0VNG7HPPXeau9BHLqTE6erKoa/LMavml8qYNg3kRjC//per68vWgSXCB/wYa+3enXaiyb/az2gMkXesJbso/sosiN3iwq3P0Sbu0zmjf1O7Q+YG4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778154634; c=relaxed/simple;
	bh=hJUpkJFy4pFgHUpAc4l5g4rVqSQXJgujCikzsRw1LI0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UL/jHQuDIadQm1vB0WjWqscHGDfOXawVo2jvBbLMFZYPZ7FyyeAL0w6rao05SXyOE2DtA6LoJHR+U+20++AqHTYgSoOymNtx0zLBQ1HOY8sqeY+PAr46AlGLXBMFT1DEcnp1r1jXarnwFYQXzQSfLj5gPNxbJXWYVUHsSm70PKM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=edgeble.ai; spf=none smtp.mailfrom=edgeble.ai; dkim=pass (2048-bit key) header.d=edgeble-ai.20251104.gappssmtp.com header.i=@edgeble-ai.20251104.gappssmtp.com header.b=DzJSxsSN; arc=pass smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=edgeble.ai
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=edgeble.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=edgeble-ai.20251104.gappssmtp.com header.i=@edgeble-ai.20251104.gappssmtp.com header.b="DzJSxsSN"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2babfd18435so2874435ad.1
        for <devicetree@vger.kernel.org>; Thu, 07 May 2026 04:50:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778154632; cv=none;
        d=google.com; s=arc-20240605;
        b=JHC7+5ofxZtLgNnB/0BJSm0NjQPwaDsNrp/qUy0PD8wgcoEUHg6hTnQSWlFpxxVz/o
         agwXHMOsGEnV0PjMUune0PiuiQNhincBmhwOonFsCHeKZhISv8jhU3iTkIH20R1WmOO8
         4O1YNTThMYk81FOSmr3a8LgHHZ66K5XnDuno557cLLqgvzjSIuSqm2iCsNZHpF9aDb1Z
         x6muAcjbuCjPmmDDRQuQ8hRxMJAPSUr6VedCXjDiJMTWiCrMLs08TTJNXf9IUBMBRvcU
         AtZRIcDjPpSjvVmA4/yzXHuWkxYh+A8y4ZpIr2U35bO7gyd5c8JgTbyvwE+15xpFPzHp
         QIBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=BvJ38BsT9fMouXvjyZnoiUSCRKuA5x8AFeU1cGImlEE=;
        fh=29Z9hwuoamqKnCdqt6axZMyu/Xym1Y9oT/TwxX4ORUs=;
        b=FFlpxauWKkGqEBPi+x1JkPCIdvisVgeNiHli62t6NzSBOj5J+0e0IG3E3U6sIU40On
         qxJ2JuwMzMfPeMq8oEC6D3LdmQm8x5/UdxdR57bLDA1zeYFL4gwaWrkBB0HvwgCS1oXO
         Zcncydb7B5zEgT/nArIgFVv8jWFSO5bZ7cQFIemup4uZO6pA1B4YnmbEwrnWwAq4dFQP
         ETOgJ3EGuEQlWb+w3W68PXqHcbhQGDXgxk9JKHqgqd0RGNeDByXTtixJAoUF4hpaYKIS
         PaROBYRY0cftGvY/+lKGZ3gf+H6iSqGUm0HSQ3CfiL/tQGTaWTyxuGJffBdVRilcPuEE
         tNnA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=edgeble-ai.20251104.gappssmtp.com; s=20251104; t=1778154632; x=1778759432; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BvJ38BsT9fMouXvjyZnoiUSCRKuA5x8AFeU1cGImlEE=;
        b=DzJSxsSNP/VWY5lK6umxFg1DGouQ86rOkTJYFr2Ns/8EdanrJbwUbsr5bvp8I061Vw
         e6COf4HrXiFqHU3HRrSH7sM45Xe5egV0ldwdROslQ0YFINjxqEw6NcR7CLyRPfCaN4GV
         ScxEepF3FgKzZERcz8a4iEaS4vjPLuap84GhyLodYO2d0ItcTjJk3+X1VuJeCkCCwAh1
         NQDyxUSsSgvMui6fKAX3sDaeAp4F+dYVLnlyikJblL7PLzi/JRAP978NmdvtOGtLkQTw
         vFKn4lDry7qwexNyxILBRZLvD9F5o4gmEN6x1U2IqlwiEnQ1t2+zGLr8WoYblzIHw44S
         xepQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778154632; x=1778759432;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BvJ38BsT9fMouXvjyZnoiUSCRKuA5x8AFeU1cGImlEE=;
        b=SeqSzCl9PKB19s3LPmgxofKRus5yGg0+jEMErcZlfiFxvRzuDbHqN6wXtCC01yoCY0
         YHUsjhVgHDGSYm5Vdt5xsbV7wsXc/Amtg59kvy1LsmTjLPgHS+yIO4kHCbHOO1wilm42
         KUPnIFXOyD8NkE8qJLAqTEy/+BvTAz9y274XFBIbwoK8fRsxLqwhX9hZNLAYakqhhuza
         NUdeASb3fdUX6Ip7+cIK/HI/tXhs2O00b5X4sc5qYhQRn7vX66TPOz4ZpeZhE4dJhLFQ
         nJSkm2jiYDz/UdDYifgRTiYyTlpZWDZAiINxIl/hIHylGKVSWxY+1an8mL7jr0sMXyTI
         PQ7w==
X-Forwarded-Encrypted: i=1; AFNElJ+p0xy7vZBaDsEm/gRvhSdSzacX5ayah6r5a0aH3+E0EG7d9+2T+vWGckjOgfaDAbWZsPkOH6YAtH5M@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4a3UxoMGT3S12T2LefW7B8wt3dGAzhBAqq52MgKGS9OfpqMdy
	t+KzMPDpv5rGgLgq0T+8VbrpSF4pnMZdn0OP0aPan/Xlb3BBIvalZslrJTuMCUObwNA2b6Tv3zZ
	KfkY19i3SqR0nMqm51EHNuNKV1IFWxqi2fANearBu/A==
X-Gm-Gg: AeBDiescRCOr86na/b2lRoZuWVmLiNO6c5QxwsfWaS+QyXeaVcTV9NI3HDkt4Odc4VC
	BGpm2p/LgyMe/6S/L4kM6dy1N531dUxyerzxJJgOPoKte1qVFcRP3ephr9OGlRJ2iOKDSeKNXG6
	KDBAfQMR3fIhjJzGz4SwEdp9Wfas0+/QgtgaB8ErLY4Y4VNO3tg95bb9UWzNAWL0Y/eG54QHvPk
	B1VlNLNAlJoyLWSnfPlQIgicbBB+aKX6SDFyk+NXI1RbTl8iDJEQXKl80osIqClEK4HJPUXJaeU
	G5y2eVfQTFlqsEsS+VLpwrBu7sROvutOJT0u2aYmiht9aj2VOZcPnZ+vIXSCxj1przQdfLBTIqf
	wmqQ721m574pzSPSDCISKigjQLj4V/nLyF/HCweRS6D+eLV2hB7EXuS8LejtXdsgaCrGzUUrUyM
	JKpfnd
X-Received: by 2002:a17:903:32d0:b0:2ad:9b86:ddc2 with SMTP id
 d9443c01a7336-2ba79287840mr74956165ad.22.1778154631740; Thu, 07 May 2026
 04:50:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260406-gmsl2-3_serdes-v10-0-645560fedca5@analog.com>
In-Reply-To: <20260406-gmsl2-3_serdes-v10-0-645560fedca5@analog.com>
From: Jagan Teki <jagan@edgeble.ai>
Date: Thu, 7 May 2026 17:20:18 +0530
X-Gm-Features: AVHnY4ImNfDSCtiszfUjpZiS_xnG2D7LfpDRWViLHXt-m2rR-PMYp3ZtRPQUAUI
Message-ID: <CA+VMnFwV6gH+W=5UdpPJ2t8J=C0hpZ8M_gmKok_DpmCkJOWo=g@mail.gmail.com>
Subject: Re: [PATCH v10 00/22] media: i2c: add Maxim GMSL2/3 serializer and
 deserializer drivers
To: dumitru.ceclan@analog.com
Cc: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Julien Massot <julien.massot@collabora.com>, Rob Herring <robh@kernel.org>, 
	=?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Cosmin Tanislav <cosmin.tanislav@analog.com>, 
	mitrutzceclan@gmail.com, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-gpio@vger.kernel.org, 
	=?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
	Martin Hecht <Martin.Hecht@avnet.eu>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Cosmin Tanislav <demonsingur@gmail.com>, Vivekananda Dayananda <vivekana@amd.com>, Cory Keitz <ckeitz@amazon.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 7 Apr 2026 at 01:47, Dumitru Ceclan via B4 Relay
<devnull+dumitru.ceclan.analog.com@kernel.org> wrote:
>
> This series adds new drivers for multiple Maxim GMSL2 and GMSL3 devices,
> replacing the few GMSL2 drivers already in upstream, and introducing a
> common framework that can be used to implement such GMSL chips, which
> avoids code duplication while also adding support for previously
> unsupported features.
>
> While the normally acceptable and polite way would be to extend the
> current mainline drivers, the choice was made here to add a totally new
> set of drivers. The current drivers support only a small subset of the
> possible features, and only a few devices, so the end result after
> extending them would in any case be essentially fully rewritten, new
> drivers.
>
> This series depends on support for internal pads, for which a patch has
> been added.
>
> The previous version is at:
> v9: https://lore.kernel.org/r/20260311-gmsl2-3_serdes-v9-0-41499f09004f@analog.com
>
> Since the previous series, Cosmin has left Analog Devices.
> Because included changes from previous version are trivial, his sign-off
> and tags were retained.
>
> The following deserializers are supported:
> * MAX96712 (already exists in staging)
> * MAX96714 (already exists)
> * MAX96714F (already exists)
> * MAX96714R (GMSL2)
> * MAX96716 (GMSL2)
> * MAX96724 (already exists as part of existing MAX96712 driver)
> * MAX96724F (GMSL2)
> * MAX96724R (GMSL2)
> * MAX9296A (GMSL2)
> * MAX96792A (GMSL3)
>
> The following serializers are supported:
> * MAX96717 (already exists)
> * MAX9295A (GMSL2)
> * MAX96793 (GMSL3)
>
> The following list enumerates new features that are supported by the
> common framework and their respective chip-specific drivers:
> * Full Streams API support. Most deserializers have support for more
> than one link, and more than one PHY. Streams support allows
> configuration of routing between these links and PHYs.
>
> * .get_frame_desc() support. Both the serializers and deserializers
> implement this to query and provide frame descriptor data. This is
> used in features explained in-depth below.
>
> * .get_mbus_config() support. The deserializers implement this to allow
> upstream devices to query the link frequency of its pads.
>
> * Address translation with I2C ATR for the serializers.
>
> * I2C ATR translation - some deserializers cannot do muxing since I2C
> communication channel masking is not available per-link, and the only
> other way to select links is to turn them off, causing link resets.
> For such cases, I2C ATR is used to change the address of the
> serializers at probe time.
>
> * Automatic GMSL link version negotiation between GMSL3, GMSL2 6Gbps, GMSL2
> 3Gbps.
>
> * Automatic stream id selection for deserializers which need serializers to
> stream on unique stream ids.
>
> * Automatic VC remapping on the deserializers. VCs are picked so that
> if they were unique on the sink pad, they will end up as unique on
> the source pad they are routed to too, prioritizing using the same
> VC ID as the sink pad, to facilitate the possibility of using tunnel
> mode.
>
> * Automatic pixel mode / tunnel mode selection. Tunnel mode is used
> when VC IDs do not need to be changed and all hardware supports
> tunnel mode, otherwise, pixel mode is used. The serializers are
> automatically switched between the two by using a private API.
>
> * Automatic double mode selection. In pixel mode, double mode can be
> used to pack two pixels into a single data unit, optimizing bandwidth
> usage. The serializers are automatically set up to support the double
> modes determined by the deserializers using a private API.
>
> * Automatic data padding. In pixel mode, if the data being transferred
> uses two different BPPs, data needs to be padded. The serializers
> automatically set this up depending on the configured double mode
> settings and incoming data types.
>
> * Logging. Both the deserializers and serializers implement the V4L2
> .log_status() ops to allow debugging of the internal state and
> important chip status registers.
>
> * PHY modes. Deserializer chips commonly have more than a single PHY.
> The firmware ports are parsed to determine the modes in which to
> configure the PHYs (2x4, 4x2, 1x4+2x2, 2x2+1x4, and variations using
> fewer lanes).
>
> * Serializer pinctrl. Serializers implement pinctrl to allow setting
> configs which would otherwise be inaccessible through GPIO: TX/RX via
> GMSL link, pull-up & pull-down (with strength), open-drain &
> push-pull, slew rate, RCLK pin selection.
>
> * TPG with selectable formats, resolutions and framerates for both
> serializers and deserializers.
>
> The drivers have been tested on the following hardware combinations, but
> further testing is welcome to ensure no / minimal breakage:
> * Raspberry Pi 5 + MAX9296A + 2xMAX96717 + 2xIMX219
> * Raspberry Pi 5 + MAX96714 + 1xMAX96717 + 1xIMX219

Thanks for the series. For validation, could you share the DT binding
used while testing this configuration (Raspberry Pi 5 + MAX96714 +
1xMAX96717 + 1xIMX219)?

I used the same with imx415 but, cannot detect the sensor ID.

[   12.768891] max9296a 7-004c: DT source ports parsed
[   12.768903] max9296a 7-004c: DT physical configuration selected: 0
[   12.768909] max9296a 7-004c: DT pipe defaults initialized
[   12.768919] max9296a 7-004c: DT sink port 0 present
[   12.768926] max9296a 7-004c: Looking up port0-poc-supply from device tree
[   12.768978] max9296a 7-004c: DT sink port 0 enabled
[   12.768989] max9296a 7-004c: DT sink ports parsed
[   12.768995] max9296a 7-004c: Initializing deserializer core
[   12.769000] max9296a 7-004c: Applying RLMS adjust sequence (2 regs)
[   12.770660] max9296a 7-004c: Enabled link A remote control channel
[   12.771745] max9296a 7-004c: Enabled on-die LDO2
[   12.771755] max9296a 7-004c: Skipping TPG init for this variant
[   12.771762] max9296a 7-004c: Disabling deserializer output during init
[   12.793066] max9296a 7-004c: Link 0 serializer xlate start:
power-up 0x42 alias 0x40
[   12.793081] max9296a 7-004c: Selecting links mask 0x1
[   12.796294] max9296a 7-004c: Selected links mask 0x1, waiting for settle
[   13.108806] max9296a 7-004c: Link 0 serializer responded at 0x40 before reset
[   13.216637] max9296a 7-004c: Link 0 serializer xlate complete: 0x42 -> 0x40
[   13.216817] max9296a 7-004c: Selecting links mask 0x1
[   13.219683] max9296a 7-004c: Selected links mask 0x1, waiting for settle
[   13.425486] max9296a 7-004c: Consider updating driver max9296a to
match on endpoints
[   13.425503] rockchip-csi2-dphy csi2-dcphy0: dphy0 matches max9296a
7-004c:bus type 5
[   13.499022] max96717 10-0042: Allocated serializer core state
[   13.499081] max96717 10-0042: Parsed serializer DT
[   13.524495] max96717 10-0042: Initialized serializer core state
[   13.524511] max96717 10-0042: Initializing serializer i2c-atr adapter
[   13.527562] max96717 10-0042: Initialized serializer child I2C adapter
[   13.527587] max96717 10-0042: Registering serializer notifier
[   13.527598] max96717 10-0042: Added serializer source notifier for phy 0
[   13.527607] max96717 10-0042: Registered serializer notifier
[   13.527619] max96717 10-0042: Consider updating driver max96717 to
match on endpoints
[   13.527635] max96717 10-0042: Registered serializer V4L2 subdevice
[   13.540303] imx415 11-0037: detect imx415 lane 4
[   13.540310] imx415 11-0037: current mode 2, cfg_num 12
[   13.540356] imx415 11-0037: Failed to get reset-gpios
[   13.540369] imx415 11-0037: Failed to get power-gpios
[   13.540377] imx415 11-0037: no pinctrl
[   13.540385] imx415 11-0037: Looking up dvdd-supply from device tree
[   13.540450] imx415 11-0037: Looking up dovdd-supply from device tree
[   13.540495] imx415 11-0037: Looking up avdd-supply from device tree
[   13.580898] imx415 11-0037: Requested xvclk=24000000 actual=24000000
[   13.630800] imx415 11-0037: Read chip ID reg 0x311a = 0x00 (ret=0)
[   13.630815] imx415 11-0037: Sensor state: 0x3000=0x00 0x3001=0x00
0x311b=0x00 0x311c=0x00 0x311d=0x00
[   13.630825] imx415 11-0037: Unexpected sensor id(000000), ret(0)

DT:
&i2c7 {
    #address-cells = <1>;
    #size-cells = <0>;
    status = "okay";

    max96718_dcphy0: deserializer@4c {
        compatible = "maxim,max96718";
        reg = <0x4c>;

        port0-poc-supply = <&vcc_3v3_adapter>;
        i2c-alias-pool = <0x40>;

        ports {
            #address-cells = <1>;
            #size-cells = <0>;

            port@0 {
                reg = <0>;

                max96718_link0_in: endpoint {
                    remote-endpoint = <&max96717_gmsl_out>;
                };
            };

            port@2 {
                reg = <2>;

                max96718_csi_out: endpoint {
                    remote-endpoint = <&mipidcphy0_in>;
                    data-lanes = <1 2 3 4>;
                    link-frequencies = /bits/ 64 <400000000>;
                };
            };
        };

        i2c-atr {
            #address-cells = <1>;
            #size-cells = <0>;

            i2c@0 {
                #address-cells = <1>;
                #size-cells = <0>;
                reg = <0>;

                max96717_0: serializer@42 {
                    compatible = "maxim,max96717f";
                    reg = <0x42>;
                    gpio-controller;
                    #gpio-cells = <2>;
                    #clock-cells = <0>;
                    i2c-alias-pool = <0x11 0x12>;
                    pinctrl-names = "default";
                    pinctrl-0 = <&max96717_0_pwen_pins
&max96717_0_rclkout_pins>;

                    max96717_0_pwen_pins: pwen-pins {
                        function = "gpio";
                        pins = "mfp0";
                        drive-push-pull;
                        bias-disable;
                        output-high;
                    };

                    max96717_0_rclkout_pins: rclkout-pins {
                        function = "rclkout";
                        pins = "mfp4";
                    };

                    ports {
                        #address-cells = <1>;
                        #size-cells = <0>;

                        port@0 {
                            reg = <0>;

                            max96717_csi_in: endpoint {
                                remote-endpoint = <&imx415_0_out0>;
                                data-lanes = <1 2 3 4>;
                            };
                        };

                        port@1 {
                            reg = <1>;

                            max96717_gmsl_out: endpoint {
                                remote-endpoint = <&max96718_link0_in>;
                            };
                        };
                    };

                    i2c-atr {
                        #address-cells = <1>;
                        #size-cells = <0>;

                        i2c@0 {
                            #address-cells = <1>;
                            #size-cells = <0>;
                            reg = <0>;

                            sensor@37 {
                                compatible = "sony,imx415";
                                reg = <0x37>;
                                rpi-global-reg-list;
                                clocks = <&max96717_0>;
                                clock-names = "xvclk";
                                avdd-supply = <&avdd_2v9_cam0>;
                                dovdd-supply = <&dovdd_1v8_cam0>;
                                dvdd-supply = <&dvdd_1v1_cam0>;

                                port {
                                    imx415_0_out0: endpoint {
                                        remote-endpoint = <&max96717_csi_in>;
                                        data-lanes = <1 2 3 4>;
                                    };
                                };
                            };
                        };
                    };
                };
            };
        };
    };
};

Did I miss anything on the sensor side or in the DT?

Thanks,
Jagan.
