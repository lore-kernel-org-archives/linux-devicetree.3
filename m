Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793978184;
	b=ynwjUSz/H2ADIk+j6ao91GexXVlz48VlOUObSDQe025JF/qYc6EmVsDjVD6E3NqDpPxg
	 wHWgxMsFuLUf5GkQ4uuQfF4lmCCpc40R+uu65BOGvOc7PPt4VmzsTnXS4E4IqwHVrJjfQ
	 wSPfgWOqG7ZmqL5740S36DjAK/cZStzLDTQNsx1qdB65u8OqX3EnkCKyJhXhyplL3vrST
	 ek+rJpAKgfnFNSIlWlY7Mip8cfXTFEI7OZFy/XavXgExV3hxjC+Loo0oPodUZLhko+iBe
	 gNYLOLWlVhHfRvLHQ5TtfDvLdoj0qq1ZaLctMU9wwQqVWDhwuUhqTzN17i+7N+OcqxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793978184;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=ZBDIYs4Y0It7dcl6v419n3JeAweftEEfsMmrD17e+80=;
	b=FCkmANT1Dmh2UiL2mtlA3bQVjEHqGJq4FSMZLnMbX1KqXPEBafQLUU68u6eAxLNMxpGj
	 hEvRADKbK4ZtkaRZXvXlc7q1DgoX5SBNYPe6Vgfts5x2K8c+IFW1oDMu4PKMh/BXAY0At
	 WeTsYlVeSgz5c4+tzjtlRpi98js6XMdfZFoS6lGLnRbS5jKb22IKQiy4RFJaeNJX3TTNL
	 8RCRgiqx7KMmyayQLbOlqlAho9CG/KIAIVqOSKO1kGQrFFOhlXZGNXzHluFUOhoU8EFKV
	 sftUKrhIzgYTlKIvcZrTOU3CJp/6SNVpCnjXi2CYPPEQUOdLaFXGftSZdzXlqP5anpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kxo8erlB;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF88D606A32D
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 15:16:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF88D606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kxo8erlB
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a2d6cf958bso3812685e9.1
        for <devicetree@vger.kernel.org>; Fri, 06 Nov 2026 07:16:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793978182; x=1794582982; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZBDIYs4Y0It7dcl6v419n3JeAweftEEfsMmrD17e+80=;
        b=kxo8erlBylITXb38m1wEtnfEDV3x/yMaJ29j0q0YIFU/H5cyQrsqLj5K598Wy9weJQ
         A0DJbc4I/TN86jX1fGLlvJLWjkhURO4cOxuuAKH3apDJBtQTlXy2Qz4bO1avMzj8VPOf
         uUL7kHWf2fTP9uFyfKLeCspQFLGH1ANd+tisjKG+IgGewKu52tBELtyTjX66BlA+4FBj
         P4ys4PblaKABcVgEPv+IeHdWFIE/o3yZ0zqeQutuhpbbrCAV3N1kpXvFMBUL6v6aa0dT
         P0STpQnsN0JpWBIWLbxZUipI6nyhf6kzfxKIr0c7XQ0L7LcBGKJ1P3t8gjHWzHgYrEm/
         QYDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793978182; x=1794582982;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZBDIYs4Y0It7dcl6v419n3JeAweftEEfsMmrD17e+80=;
        b=TRzmj+6wGHB3D64LGsyjSuXKb1ll62VDq2/UnX0RIs4B0WC+lPFvixI7ecoKFlw3nM
         FHVHSt3/mDC//NGW32eYQ9s+4nlrEpCb4MsZbOMzyIb7JUuZMbpMNlTzK9aYt80DCB1p
         EYVhAE2TcVJmTip2KkKNWwhHTX/zjeZeBip7qwCScv9/jH44FAo7P10aEGHzsgjbnoel
         jhi8yFCKVCgEICFC8xrYgOUV6T6pmwhbFkLjyESgiLY5FuahgkdwdcSmDkLPU1iXtzuN
         Op2b4nJgnmBiIDLM5z3GfZVD/+J3xWIbANdQHCcDH+haMwLryPCHrzhExmLIRgEa/Ghi
         3tBQ==
X-Forwarded-Encrypted: i=1; AKwUvByo1YyOChiwUN2kIjVfoFgEUR5IjWbyq50+bKgFx8+4nL7hCDlcHgF4Bj8J6y2Db9ig0Yw0pzljscpy@vger.kernel.org
X-Gm-Message-State: APuU4Z87smNA79Md7fxk0V1ZfvIoh81ZEQZpdt1XU2sNC0qqr6PLiiIy
	OpNEZAcTyxrV04nlh9YjzqDN1LMoxABDXOAs+bn2iN/ZCYkTmgtO1guY
X-Gm-Gg: AYBFou1jjoVfDqqaqDSUXJUOyRbgcb0dX2YbngN53uZB9izXhdV5xcAwkUlX3KpNc5t
	nbmDtol/AAacdgY5+JJAtV/InGe0HiQsbXSRbHkMGHTJO+zsb5kfB0G/fMQZMzvDyk6nKv2QZJR
	NvbkYdTNBKdW4FJbes+RFiPvYmWVLWdeKjZTjRc/NJ1PPBd7P5dvJjZDagpJwUAiuvPBuTZCDb8
	xHspBwcvjfBeN9horPfGhclOrs9RwTIUL2hcHPLfNF3Q+pgQUbPw7/ys31E56xXE0GMpy/ZwvlT
	N2LqWr1G5Mnrx1A/26RH1yV33dckukGNHBTUvbaHtzyF5ZJc5/8LH/4D7vh9Yz87+jHbYjReqx2
	48Of137NAfVc+X3V4pLMp4oHWRc7hrs6GNQ28D+IGCW7m8Hw9EbxIrmOTaUKKf01wbtZVjW7/1C
	/Dv+VcoZa13HfIe/CE6yL0ZZ7cThugFTINQ7lbrln7/4OFbNxoaQvtRLE3w2f3U95Xzif4M4n46
	mZT0DFaB7IXQWU/TfOKHHYXdE0gC+be0HC+S1YLmaS1n7wfumGHKwG6gqVfi21xIFioj/5FO9xv
	BFzjaUitxb30JQF7JOm/1DoO/Xc2L3gTNC/e7fPC9QIfF6GDWTRiq1O56/G1oifpCs5bK1sBKaw
	YJEx5GL/t7bzqaqlA5zq/yhIxaY/iOd5Yxf4ZYhWpLTUdNtoJXFV/yJ6PB/8F
X-Received: by 2002:a05:600c:8509:b0:4a1:fa27:df7c with SMTP id 5b1f17b1804b1-4b6e091f195mr44253705e9.34.1793978182055;
        Fri, 06 Nov 2026 07:16:22 -0800 (PST)
Received: from Lord-Beerus.station ([93.146.104.162])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d7cc6162sm4124688f8f.47.2026.11.06.07.16.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 07:16:21 -0800 (PST)
Date: Fri, 6 Nov 2026 16:16:19 +0100
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: Johan Hovold <johan@kernel.org>
Cc: Frank Li <Frank.Li@nxp.com>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-serial@vger.kernel.org,
	luan.r@variscite.com, alifer.m@variscite.com,
	pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Peng Fan <peng.fan@nxp.com>,
	Shitalkumar Gandhi <shital.gandhi45@gmail.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Karl Mehltretter <kmehltretter@gmail.com>,
	John Ogness <john.ogness@linutronix.de>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>,
	Fugang Duan <fugang.duan@nxp.com>, linux-pm@vger.kernel.org
Subject: Re: [PATCH v1 0/3] serial: Support driver-selected TTY wakeup
 defaults
Message-ID: <au3vQ7sSi6O3_hqv@Lord-Beerus.station>
References: <cover.1793719239.git.stefano.r@variscite.com>
 <au3diCrF5jPYH4Tu@hovoldconsulting.com>
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
In-Reply-To: <au3diCrF5jPYH4Tu@hovoldconsulting.com>

On Fri, Nov 06, 2026 at 03:00:40PM +0100, Johan Hovold wrote:
> On Tue, Nov 03, 2026 at 04:51:24PM +0100, Stefano Radaelli wrote:
> > The initial goal was to enable TTY wakeup by default on NXP LPUART ports
> > marked with wakeup-source, without requiring a userspace write. Instead
> > of keeping this entirely within fsl_lpuart, this series introduces a
> > common serial core mechanism that other UART drivers can also adopt.
> > 
> > The new tty_wakeup_default field in struct uart_port lets a driver request
> > wakeup to be enabled when its TTY device is registered. Each driver
> > decides whether to use it. This series adds wakeup-source to the LPUART
> > binding and makes fsl_lpuart the first user, setting the field from that
> > property. Other drivers retain their existing behavior, userspace can
> > still change power/wakeup, and serdev wakeup policy is unchanged.
> 
> This is a policy decision that should be left for userspace, not
> individual drivers. As documented in
> Documentation/driver-api/pm/devices.rst:
> 
> 	The initial value in the :file:`power/wakeup` file is "disabled"
> 	for the majority of devices; the major exceptions are power
> 	buttons, keyboards, and Ethernet adapters whose WoL
> 	(wake-on-LAN) feature has been set up with ethtool.
> 
> So no, this doesn't look like something we want. You should continue
> enabling wakeup from userspace on systems that need it instead.
> 
> Note that the "wakeup-source" devicetree attribute also describes
> capability, not policy:
> 
> 	Documentation/devicetree/bindings/power/wakeup-source.txt
> 
Hi Johan,

Understood, thanks for clarifying.
I incorrectly treated wakeup-source as a request to enable wakeup by default,
rather than as a capability description.
I will drop this series and keep wakeup enablement in userspace.

Thank you,
Best Regards,
Stefano
