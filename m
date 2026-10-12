Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C8B34D37D1
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 18:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791829933; cv=none; b=s/5fYiLjH13fn+Npuqpb70blWy96dcVDCZoAK5owL3UNubBLevjcnpOv4nH4yLNrqdwQZcPDDo+RxvndrIyeyIrdMe8JSE9lDjq7yvq/0p3jqEnAQAAiLRIuMRY3+KfBdLhPlSCvPx/wOjWh0N4E9dbJZWuGsgRteTCheZbHkFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791829933; c=relaxed/simple;
	bh=H3ajQd7wm1bFogX14K0eYfOdNs6MQ8yHjBdXJ/cawUA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PocpXowU5GRj8mu0VWisoIJdpLGq1GsA/bpLR4/JuwNlxe6FDPnWafhx7QJh1cITWywzEt4jAyU9/kwr4LKiO9PWqaw2A8u3uyUnH0Ma7q0WEPTag/5HxD92um4sHNBZDmNJWiQq2SylN73BhkCXMMQ1XZoBbQEKt5pMvrsL0Dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JE+2/AG6; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=tyuuXAp3; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JE+2/AG6";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="tyuuXAp3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791829929;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Mp4Az4pn5hEgJeWah5nozn6weJjpUXzUrROIxr1Rl0E=;
	b=JE+2/AG62Et8L3adqhzPTC1t2kgBumeG1nRQSnFujMHs4kPdpiQyA+6wg1FppvGT+4vkBI
	JyB4/YjoRfIlK5kGVJpCdUVe0K+tFmLiRoFQB82OcZB1Mhh9yNNK8WZS1yv9esN2zcSR0C
	VuxriuUa8e0HjUnb4YLb4b85kbOKSQc=
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com
 [209.85.221.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-450-XXZmuWyMMCWJrDp8RWbmeg-1; Mon, 12 Oct 2026 18:32:07 +0000
X-MC-Unique: XXZmuWyMMCWJrDp8RWbmeg-1
X-Mimecast-MFC-AGG-ID: XXZmuWyMMCWJrDp8RWbmeg_1791829927
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5df1badcee9so1853183e0c.0
        for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 11:32:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1791829927; x=1792434727; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Mp4Az4pn5hEgJeWah5nozn6weJjpUXzUrROIxr1Rl0E=;
        b=tyuuXAp3++BO+OR/9lmPG20dkIDHAKpkHjqUmTGQjQ/yJ1utAfrq44gpJ+DnX6KciA
         9+8HQDHGsfZ9AsWxcyLhqIdhiWwzDHVOZ0f53eLtxd0ocOOO6rCNj3U1PEWshpNzuWS+
         Ltn3hctxizrJFWqclESWkWpIIwk6B+qliut67IJb0FESyRGiUiVzgQDiZYpFgFM6YV81
         mg6WGFWoFVLpA3R4psbcgmvcQAckIaDZDjFSZseE05eemY14XkC2EoF4k/x3LUoU5iaj
         vYqNGfcINJnziCXcwsllXxcFUkfCCpVORsQ/HBwA5ncQkgqnvMun42d1h9IcaEA/uPJw
         +vig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791829927; x=1792434727;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Mp4Az4pn5hEgJeWah5nozn6weJjpUXzUrROIxr1Rl0E=;
        b=OTJpn3ncHx7YUgUJHPMnoQv6nJf/8BObUjlKkOsm8Sr8MdRnK7ud6Kt6oW6eJ68SIu
         UKQ6rFJJui62yXPoPMZiOytu4vj2rwBMBA3uxdsimK5nBogOJJsmKZVTVwb3f+7du5KV
         6UIaxcbKOkNOrvTHgWFtOfkQAEqaFeTCRso46jm4DqKZeHVsU7OO9h1n1svzpvnFfJWB
         WLhkClFvZsEaNUpdrGWZZyscxRegPOzoy455fF5pyxsfSDj9PrzvCtmAOmp8v5XiRjwP
         vQGRJdJt3WxOgtyTTCNQPyZxGZL8Xd9u4jYw2a0W4Dx7QZLFxtfJ/kAZ8zQPdoJhVOnt
         Ji2Q==
X-Forwarded-Encrypted: i=1; AKwUvBx9I6scB60tRne9KzqWOsuFYBwkuQ1LtAxbNqlpTAWDk72QGwHFG8guIrputgE9NYpXzhZ/UqiAaqXj@vger.kernel.org
X-Gm-Message-State: AFq9FYKkU7Jih/zQNRrGZZjC8C3EyLHI8SptvvzkCZmDIfLX8kLKk8+/
	x5h39qk/ogYbHHt/LseZbhvRM4zLi1sKEgGTfJvBolPzCDLJVBSoJqM6ylfXnMs0B/RQqlQ462Z
	dcFm6VghT/Ih10HrsN9N/ieHU52PXyQsi/wj1V9CG8QN+VMTAVCMsPDuujq4dTAE=
X-Gm-Gg: AYBFou0y+PkovwqVPR8yeleKXXp4owZ3fFgEQNbJF9D3guamemvU/8ivPBpEAoC1hl7
	+DsgNVRL9/h62clf0SxKpbYfbGma+v8nFReFkxyzyfa5ytJVe9/95PMTN80tkyrSV8HnywXzWt7
	AWQ8TM41q9lebfBUtT+pz/PmPihzwgcpANYoYHuVvoHt/itMdNsgRE/OivmVv3SbcdMWKz1yta7
	xMhhl9uEbloLWw55Kh/iZvff86AqyyZwwB06k0/EnbEWqhzoPiATrppvpof9S4e2BVIv8DsdI5R
	0lc6ry0QySxgqcPR/4DRro3D2TCVnuksJCSqQ/OZ0YyYTy+QQc9Qtg==
X-Received: by 2002:a05:6123:550:20b0:5c9:a60c:273d with SMTP id 71dfb90a1353d-5e91f4fc783mr2548300e0c.21.1791829927175;
        Mon, 12 Oct 2026 11:32:07 -0700 (PDT)
X-Received: by 2002:a05:6123:550:20b0:5c9:a60c:273d with SMTP id 71dfb90a1353d-5e91f4fc783mr2548281e0c.21.1791829926536;
        Mon, 12 Oct 2026 11:32:06 -0700 (PDT)
Received: from rhdev ([2600:1700:f361:20bf::14c1])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5e92f300f42sm5764908e0c.0.2026.10.12.11.32.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 11:32:06 -0700 (PDT)
Date: Mon, 12 Oct 2026 14:32:04 -0400
From: Jennifer Berringer <jberring@redhat.com>
To: Shengyu Qu <wiagn233@outlook.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org,
	James Morris <jmorris@namei.org>
Subject: Re: [PATCH 4/4] riscv: dts: spacemit: k3-com260-ifx: Add rfkill nodes
Message-ID: <20261012183204.c845fc69@redhat.com>
References: <20260928231807.1757995-1-jberring@redhat.com>
 <20260928231807.1757995-5-jberring@redhat.com>
 <TYWPR01MB10887E1A3744FD44000F89E8F98922@TYWPR01MB10887.jpnprd01.prod.outlook.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <TYWPR01MB10887E1A3744FD44000F89E8F98922@TYWPR01MB10887.jpnprd01.prod.outlook.com>

Hi,

On Sat, Oct 10, 2026 at 03:08:35AM +0800, Shengyu Qu wrote:
> Hi,
> 
> I don't think doing like this is correct.. We have a dedicated M.2 Ekey
> binding and should use that:
> 
> https://github.com/torvalds/linux/blob/master/Documentation/devicetree/bindings/connector/pcie-m2-e-connector.yaml
> 
> Best regards,
> Shengyu

To my understanding, the pwrseq-pcie-m2 driver that uses this binding
currently only supports systems that use UART for Bluetooth, and is
needed for them because UART is a non-discoverable bus. Quoting the
cover letter of the series that introduced this binding:

"This series adds support for connectors that expose PCIe interface for
WiFi and UART interface for BT. Other interfaces are left for future
improvements." [1]

K3 CoM260 Dev Kit ships with its E-key slot populated with an RTL8852BE
module, which uses PCIe for WiFi and USB2 for BT. I verified that my
patch series does make the rfkill command be able to disconnect and
reconnect the WiFi and BT devices with this module. I also tested this
patch set with an Intel AX210.

In addition to PCIe and USB2, this board also has its M.2 E-key slot
connected to sdio, uart6, and i2s3, but none of those are currently
enabled in this dts and the RTL8852BE module does not use them.

Several other existing device trees seem to use rfkill-gpio nodes to
control W_DISABLE pins on M.2 E-key slots. Looking at rk3588 boards for
example: OrangePi 5 Plus, ArmSoM W3, and Rock 5B all do so in the
current tree.

Unlike those, the rfkill nodes in my patch aren't actually necessary for
usable WiFi and BT on this board. The shutdown-gpios here are
GPIO_ACTIVE_LOW and this merely allows using rfkill to block both radios
via the W_DISABLE pins, so I'm not opposed to dropping this patch if
anyone believes it should be dropped.

[1] https://lore.kernel.org/lkml/20260326-pci-m2-e-v7-0-43324a7866e6@oss.qualcomm.com/

> 
> 在 2026/9/29 07:18, Jennifer Berringer 写道:
> > K3 CoM260 IFX has an M.2 E-key slot for wireless. Add rfkill nodes for
> > the GPIOs that control the slot's W_DISABLE1# and W_DISABLE2# pins for
> > WLAN and Bluetooth.
> > 
> > Signed-off-by: Jennifer Berringer <jberring@redhat.com>
> > ---
> >   arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts | 14 ++++++++++++++
> >   1 file changed, 14 insertions(+)
> > 
> > diff --git a/arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts b/arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts
> > index 01e286cb05797..cd878340e5add 100644
> > --- a/arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts
> > +++ b/arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts
> > @@ -47,6 +47,20 @@ reg_aux_vcc3v3: regulator-aux-vcc3v3 {
> >   		regulator-max-microvolt = <3300000>;
> >   		regulator-always-on;
> >   	};
> > +
> > +	rfkill-pcie-wlan {
> > +		compatible = "rfkill-gpio";
> > +		label = "rfkill-pcie-wlan";
> > +		radio-type = "wlan";
> > +		shutdown-gpios = <&gpio K3_GPIO(73) GPIO_ACTIVE_LOW>;
> > +	};
> > +
> > +	rfkill-usb-bt {
> > +		compatible = "rfkill-gpio";
> > +		label = "rfkill-usb-bt";
> > +		radio-type = "bluetooth";
> > +		shutdown-gpios = <&gpio K3_GPIO(57) GPIO_ACTIVE_LOW>;
> > +	};
> >   };
> >   &combophy {
> 

