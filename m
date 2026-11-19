Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795125650;
	b=kG9PRUba/8NzzWuV4+SzzrMOBBU4dpjLylxWpMPFyj93MUdODXXQagrIxWavt/TtYGuk
	 50CLhGXROUIN9OmJrxeec3nqlP2mkDWDMA+A2YHuYWZTe310KyzbJNRzwU8aALUBiwS+I
	 fVgezx6juDAyKVgHP9CBHXZ3w5qzjYrHevOVHvemDkwTX//dOfIf+vLw5+VeX0syZ4Q7T
	 ZLL+aaivNrGSz91DivbgbNtIgx8ROIRz2b6A/aAmGNeb9XPtxLqwAKlN/J9AamGUhltTp
	 UerX9JbFDY/qIoYmOqYR2HQopnnkdSPK1WVnJOSoZwtKluQoUZMFO1TktdU7C7NIrLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795125650;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=X66C2Y97QEn08StEZw2JtK4Gx5mmk6aaLSYZ3CIF8TI=;
	b=OqVLG9EY/swpZoUrZT2EdTeLGbUZUoGl6EriRLOYltW5L2CILin8BI57rdRBUjDU5W9T
	 DzqKhwA8UBfxMnwq3DjlEA+DTDh+3rKtN/ERkBJX9BI8EFhcJoWP2ypP1fw+V7ODNpxvn
	 3JOf/Pt6jU/cR5pL3M9X403ZIb++9feUUPThLZdmjbmxvzQx05j1n4By2V8vFkrc0UZLL
	 2iIHLxIcPsx4YXiKzgWmcKfxSS1Y1BSkB4E7IW4JXb/VWN1CgLVdyZc6aNtA928ZzAjpQ
	 V6Vnc/iorTfrg4ojdUAG4UVfvXTfBnGdoYIbaqRL6FoeBIdIFosQYWgO+2gGbAc5xVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=V+irdR59;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=EuYBfGL1;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35D08606A331
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 22:00:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35D08606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=V+irdR59;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=EuYBfGL1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795125649;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=X66C2Y97QEn08StEZw2JtK4Gx5mmk6aaLSYZ3CIF8TI=;
	b=V+irdR59jjx+GZ3fFXkGs4e/9q52SL5LFb89WukAOTNOw5uK7JboVSmg7q2eTqz7mZCbyF
	XRrkYHG5OelVReqA9dYNqYeCBXjanFcdnG6hTl4PbST8iNhaBEW9diPTB5Bg8kmiefwt4k
	MIQ/O/BkM+0A2jG1jMUYwvB88JYjIog=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-26-ZJ_Ue8oHNuW13wMN802KGQ-1; Thu, 19 Nov 2026 22:00:47 +0000
X-MC-Unique: ZJ_Ue8oHNuW13wMN802KGQ-1
X-Mimecast-MFC-AGG-ID: ZJ_Ue8oHNuW13wMN802KGQ_1795125646
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-49b8bd66a51so43525e9.1
        for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 14:00:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795125646; x=1795730446; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X66C2Y97QEn08StEZw2JtK4Gx5mmk6aaLSYZ3CIF8TI=;
        b=EuYBfGL1HxZzM/28OS0t2p+j2Ti2Z2PQAx4vTNJZD/B1crrT5Ec8OFjcSj4LxlLsPS
         1ZW3VApZtlVtvErf+W6mE0PamRnsxB8RwnYso0TS4+FlOvq/pphhBEEru+KCaZn68bQJ
         WPurgqGKPXFtbCuKP5iZwPqITh9rQn0rJXFkMToc0qoqeBpWlTG4beQEukgEGdCP1dZ4
         7W4nZZN/8Mi3Mv5HEBa/tP8xGMsDuHtE3BuO9kn5ExtiIzFrVOwroJLS8rVIWL/dyKXM
         eE11g8vH7l05sdNloQXaFH7ti2M87mPLkY70xzhbFFoVK6rblv8bPI06Fzr7L6WCKhXl
         uGlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795125646; x=1795730446;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=X66C2Y97QEn08StEZw2JtK4Gx5mmk6aaLSYZ3CIF8TI=;
        b=nXj4FYuE2e6zMR9uxp7tYMu6PAQPS0TBndLuwGCaF+s8MEQAxOX10hfhVXHKrVxOr/
         O30NDkh9m8gqTV0dr5F+efuoknh65zG0vXquFjTk/WPj1lNCO6PSrRbmwtEMxBvkF2Vp
         w+bMOmNpBw3oXogGFoqolz4hZ2dixEevBnoLKqYlDRdV2UnCx2K+UpDvAsfZQq9EsrP8
         VlwCN3Hn3Y/kZGSWtAsJjtgq7GrYrxIV+yeFI3Oc0+Avt3YGhFl9uYZVXqqtR1Vxcux6
         iZfZZaslJVdHuw0QkWdJlm/Ly4KcPRKpYNDkcK+tLbl9e2eNuKDiewDYqPQFu1eJfigp
         0aQw==
X-Forwarded-Encrypted: i=1; AL+hErGIhJrfJw47c9hmDKJB/2/lPb3jb8Ud5i0n/x2gZ+tjLqKY82IT0r9gI2gfzZVbO5FUMj6vdkPOu3Zy@vger.kernel.org
X-Gm-Message-State: APuU4Z+Xogb1WXxS+dri5aDIuMllLnY2aFG9FLjF/Zadv23vIAP3W/v+
	E7cuzJQiFtSjo3Iq+F4v36DzLgz3vK0fqUR4PVJSZTTqsYq6Q0JMYWg2P/4nBbH2C0zScynxcD7
	ynbDZr71akOblrYiVCIWLCvwyu4mqCFSx0k2rctS+d9h7yxJ3JSvP3kWFc9GzEqI=
X-Gm-Gg: AYBFou1hjcy26KbaQ38D2BddiG541i0Xx6w54gnlalz8QGfy5VaZcKOxPWaKs6ou0AR
	819khB0r1eUXVOvCC1WoqcHGjZ1Wlvj89JxyvyuZcfcSam+dyO0uu7KaH3aLZ7ULWSVyyE+xBJD
	siEjTAWGqL/Xdk/fFbjqdJlddk9leYsLT5eHKKL+ktos3y1IMUzJqCR5dH3eU+8QlNn9EPF24Wp
	1ncp5SNSx3VwMYhxozI8i6p3Xy9HDXYz319gPCP9UcRxR+1CUzgOoXLcrlMnQuTQtRxp7+VbGOF
	9d5d3uLfzFd+S31yg9Kor4YGHbspeNZBPzehQ78+/97WG2vo2CQmF6ulQjLK+5XD8pSK3hGiovb
	/p0GigZJDE0ifW0rkYHP7DU/D37FR35BG7XqwTJ5IlMcJryEG89Un2QYX0IBAWJSAUKl+2UL6i2
	zdcqAeYauHaoue9g==
X-Received: by 2002:a05:600c:21ca:b0:4bb:68ed:a356 with SMTP id 5b1f17b1804b1-4bb887ec919mr15282155e9.1.1795125646329;
        Thu, 19 Nov 2026 14:00:46 -0800 (PST)
X-Received: by 2002:a05:600c:21ca:b0:4bb:68ed:a356 with SMTP id 5b1f17b1804b1-4bb887ec919mr15281675e9.1.1795125645874;
        Thu, 19 Nov 2026 14:00:45 -0800 (PST)
Received: from localhost (119.red-83-42-172.dynamicip.rima-tde.net. [83.42.172.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2d1bsm1963679f8f.8.2026.11.19.14.00.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 14:00:45 -0800 (PST)
From: Enric Balletbo i Serra <eballetb@redhat.com>
To: netdev@vger.kernel.org
Cc: Claudiu Manoil <claudiu.manoil@nxp.com>,
	s32@nxp.com,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Wei Fang <wei.fang@nxp.com>,
	Clark Wang <xiaoning.wang@nxp.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Enric Balletbo i Serra <eballetb@redhat.com>
Subject: Re: [PATCH v4 0/6] net: enetc: S32N79 pseudo-MAC (PPM) networking support
Date: Thu, 19 Nov 2026 23:00:34 +0100
Message-ID: <20261119220034.1658710-1-eballetb@redhat.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <4f51bfd237fa584c7d9187d7b82f36e261853ea3.1794581338.git.claudiu.manoil@nxp.com.mbx>
References: <4f51bfd237fa584c7d9187d7b82f36e261853ea3.1794581338.git.claudiu.manoil@nxp.com.mbx>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, Nov 13, 2026 at 05:02:31PM +0200, Claudiu Manoil wrote:
> This series adds networking support for the ENETCv4.4 pseudo-MAC (PPM)
> ports found on the NXP S32N79 SoC. On S32N79, the ENETCv4 ports are
> not wired to any external PHY/MII; instead they are internal "pseudo-MAC"
> links into the on-chip NETC switch. These links are proprietary, expose
> no standard IEEE interface, and run at a speed fixed at boot time by the
> Port PCR[PSPEED] register.
> 
> A key use case is a port that has no "ethernet" DT node at all: NETC is
> reached over PCI from a host that probes the ENETC, while the internal
> NETC switch it connects to is not owned by Linux. Such a port must have
> its fixed link synthesized at probe time.
> 
> The driver synthesizes the fixed link directly in C using an of_changeset:
> of_changeset_create_node() adds a "fixed-link" subnode onto the PCI
> function's dynamic OF node (CONFIG_PCI_DYNAMIC_OF_NODES), with the "speed"
> property read from PCR[PSPEED] at probe time and "full-duplex" set.
> phylink then picks up the fixed-link node through dev_fwnode().
> 
> The series touches three subsystems:
>   - net/enetc:  pseudo-MAC fixed-link support, probing of 4.4 devices
>                 and a fix for more than 6 ring interrupt vectors
>   - arm64 dts:  NETC IEP18 ECAM node on S32N79 and its RDB board enable
>   - PCI:        a quirk creating the OF node for the ENETC PMAC functions
> 
> Because this is primarily a networking feature and the pieces are
> interdependent at runtime, it would be most convenient to merge the
> whole series through the netdev tree.
> 
> Patch 1 has a runtime (not Kconfig) dependency on
> CONFIG_PCI_DYNAMIC_OF_NODES; absent that, the pseudo-MAC probe path
> fails gracefully with -ENODEV.
> 

Hi Claudiu,

I tested this series on the S32N79-RDB board running latest mainline kernel
and applied your v4 pseudo-MAC/PPM patches on top.

I used, though, the MRU MSI controller for NETC IEP18 overriding
the upstream msi-map property with msi-parent pointing to
the NXP MRU MSI controller (this driver is not upstream yet but I ported it).

With that configuration the ENETC PF probes successfully and networking is
functional on the board. So,

Tested-by: Enric Balletbo i Serra <eballetb@redhat.com>

[1] device-tree diff

diff --git a/arch/arm64/boot/dts/freescale/s32n79-rdb.dts b/arch/arm64/boot/dts/freescale/s32n79-rdb.dts
index 897ba24ac03a..a8a3602505e2 100644
--- a/arch/arm64/boot/dts/freescale/s32n79-rdb.dts
+++ b/arch/arm64/boot/dts/freescale/s32n79-rdb.dts
@@ -70,5 +70,37 @@ &usdhc0 {
 };
 
 &netc_iep18 {
+       /delete-property/ msi-map;
+       msi-parent = <&mru_msi_controller>;
        status = "okay";
 };
+
+/ {
+       aps-bus {
+               compatible = "simple-bus";
+               ranges = <0x40a00000 0x0 0x40a00000 0x2000000>;
+               #address-cells = <1>;
+               #size-cells = <1>;
+
+               mru_msi_controller: msi-controller {
+                       compatible = "nxp,s32n79-mru-msi";
+                       msi-controller;
+                       reg = <0x40a40000 0x40000>,
+                             <0x40a80000 0x40000>,
+                             <0x40ac0000 0x40000>,
+                             <0x40b00000 0x40000>,
+                             <0x41a40000 0x40000>,
+                             <0x41a80000 0x40000>,
+                             <0x41ac0000 0x40000>,
+                             <0x41b00000 0x40000>;
+                       interrupts = <GIC_SPI 705 IRQ_TYPE_LEVEL_HIGH>,
+                                    <GIC_SPI 706 IRQ_TYPE_LEVEL_HIGH>,
+                                    <GIC_SPI 707 IRQ_TYPE_LEVEL_HIGH>,
+                                    <GIC_SPI 708 IRQ_TYPE_LEVEL_HIGH>,
+                                    <GIC_SPI 735 IRQ_TYPE_LEVEL_HIGH>,
+                                    <GIC_SPI 736 IRQ_TYPE_LEVEL_HIGH>,
+                                    <GIC_SPI 737 IRQ_TYPE_LEVEL_HIGH>,
+                                    <GIC_SPI 738 IRQ_TYPE_LEVEL_HIGH>;
+               };
+       };
+};

