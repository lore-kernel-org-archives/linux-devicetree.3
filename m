Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792460388;
	b=yWadZ5s0B8HoYukRUyOQG+MPzt3P/IIVXKrLkt9FfE2buCumNOnTPlvEG6gU+gNTWSvt
	 dTfXAoJeEBEuzFkYgmmdeIgT1iWh6aoAEOIo1kcee8prcM44w/s4e06PBi0Ec9kAuQ+oV
	 t4uzYOpir4R74M4tU5og759RmjCuJrJbXnaeVtuSq0MpOyU1c30wcIeukicrypVbhMgeb
	 313WXd1PZTNp12dqPKphFsyqV2VtdwIgNVGMbI//62x1LzuOf4rRMHAuROerdqaCzFYWR
	 dvS8FXf74axonqhnhIl3i16gQpeySJuYMN7rBgyk4y4swvLl1yzSpwNjOOZoRdT665w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792460388;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=RnAh5BgwbBUv22MFv8wV5yaYN/qwaGj857cNozmhPaE=;
	b=4wCc43/J3586OD4JDx2PhPXIZ+5JWSW0ADvEj5emkbzYlTJrk5FyjAr6Ugtw+V6IAyZf
	 0O8VWbz43aaeYqPCL3rd+JlbgP9Gbnz+N/2zcoQmnj0jxuK+pRJftCtM9MqjaiPYglSYU
	 /hcIA4avTvaNA5jl5yFVIDfyLeBNS9zrW0f7wBKK1ddxTkTbZgMhtS/lhu9mg2UMDUNlV
	 7wz0yoR3Q/EZjVxvAR9Qofg/oy1tOn96xodOasCv+epuhn9j90xkI44eDVs1d1blrxdrQ
	 bL0Fm7sbsey4/SMUNyRjyzN1OGwcY4oY2/hn82VU/v9nZtXNeu9WHVVpdcAY+e+s8+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=RkcZ5cU4;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18BB0606A319
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 01:39:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 18BB0606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=RkcZ5cU4
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-3535bf8b3e0so5820114eec.0
        for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 18:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792460387; x=1793065187; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=RnAh5BgwbBUv22MFv8wV5yaYN/qwaGj857cNozmhPaE=;
        b=RkcZ5cU4XWT+80H9xiHfw/ZuxBl6gyGBS8H5OG1Ui5ovV0ctyZ8z4qUpRFqR9Cw3xk
         cE1gBX1g/vACLt1CLIrwHL8EmS5VeFqqrm0ueJiNdaRG5pmtJcXR9T0nI7/4wPFmx2Fc
         P6NuIHhpjNjq4DlS4dHIFp7F86kFVhySspEVGioyhs5SYNt0R0L1G+hf/6crdY5kskpr
         nh2IfgchMcIyBNiXQy8wSrHaA5HKlohWQIHEC0fRwpOhVMISs9wo+dk/5Oz2XD2EB5Cq
         WKb0vsQRYsDrrlm5Uw96Kk4QP2RpxUG/EAN5jYsQhxtaIKcG4NpiN9GSXndRffebXt6E
         7YOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792460387; x=1793065187;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RnAh5BgwbBUv22MFv8wV5yaYN/qwaGj857cNozmhPaE=;
        b=IJv79gt42Sxl8OP5bxnvzf79iOtR/Gzyf6po5qYHP/230SBwdttKtWm2ztuKMQXnXq
         HofFoszc5NLrOGflUTl1ZcnazxvwBTEapr3r8xEIyPQuAZpwXAVGH1mA7VH0SjkBnO2P
         vZgG3yBEXCOKRH3Rqs92ajpfQ9hJZAM3+Rp5hl939yFPt8b946vvbrT6x1rx3drAP5/f
         pSOWiYCto6K11IrIhnwX63j2SAhpfCVpoKfiW0kvYZUhM3Qxljszwj71OTm0pfq59TcT
         +oCvj3uEqn4nirZ6UcCcmahF/E00dtV4LOFXlYc+JaOon8/x6xD71ccCSRGEnFcGI8XH
         1jHQ==
X-Forwarded-Encrypted: i=1; AKwUvBzMAxKv+/ug3GPrJdI0jNlddQsAtXKT4xoXmGHUok/1hBXQy07pPkhK1zpQsNxDkevwS8YO/tJj4W5P@vger.kernel.org
X-Gm-Message-State: AFq9FYJN8y+InVri9x1RoW4hryckcyimG61sFkLkGS0MiT5K+1GW8a04
	wChsIMAZm+VMSwsnpftnEqGlZ05291+pjvLd02WyFscFS8lGDQDJgbG+
X-Gm-Gg: AYBFou0ppxixqua41jHveaigbFqy4YwNnZxkdoK37e5Y3G2f20Z8T+0p9e+bTTRx0TG
	S2IIoDm2qjlnuIJJAddJfyI76AS8p5U21YpFX86vO9D2dUTLKDygEwcR0/MKgT3VfaOKRt4+UPk
	t/SArehuJNlHYoal7q/CbPNp//KSh5qNdfDRfnkE/bSkI/pKEg5/ixLWBBSQa1hMCYWzgSwUXs/
	IbstNqLzw7DcOa5wKLlcPTb9IDSPLhekaw/EBrIa0lsBQDCHoG48c5VVJTIgI9m8hodHaEjmIvy
	sedIcw5BsFX0fjgLvwi+4cQJfB2b3ty1KHFuyiwsEQi7HBefaeeuEPren71fE+pEU+YQyO1jYc5
	pBRRIYvej2nLf+89A6gfW970+0bHQldiFt0eWO0PxqjuWpLAXd6hY6bwPZDX7hmewFEPlvKK8lA
	gR9PFAi03zrQXYy5wRMdyvSP9660iQMSPUwkA7UDrR7Bhg42vc1evZoLnI/8JU+4EtDZkAyxZFQ
	tvUw1R2xbIu
X-Received: by 2002:a05:7300:7a99:b0:358:f678:46b6 with SMTP id 5a478bee46e88-361a2343165mr14073141eec.22.1792460386817;
        Mon, 19 Oct 2026 18:39:46 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3608258aa66sm45216643eec.20.2026.10.19.18.39.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 18:39:46 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 19 Oct 2026 18:39:45 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: linux-mips@vger.kernel.org, Wim Van Sebroeck <wim@linux-watchdog.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Jakub Kicinski <kuba@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
	Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	Eric Biggers <ebiggers@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mingyu Wang <25181214217@stu.xidian.edu.cn>,
	Robert Marko <robert.marko@sartura.hr>,
	"open list:WATCHDOG DEVICE DRIVERS" <linux-watchdog@vger.kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>, manuel.lauss@gmail.com
Subject: Re: [PATCH 3/5] watchdog: gpio: Support watchdogs with a minimum
 heartbeat interval
Message-ID: <cde332c2-3628-4bac-9a4e-55d85fe06628@roeck-us.net>
References: <20261016221617.2223004-1-f.fainelli@gmail.com>
 <20261016221617.2223004-4-f.fainelli@gmail.com>
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
In-Reply-To: <20261016221617.2223004-4-f.fainelli@gmail.com>

On Fri, Oct 16, 2026 at 03:16:15PM -0700, Florian Fainelli wrote:
> Read the optional hw-min-interval-ms property into min_hw_heartbeat_ms so
> the watchdog core defers keepalives that would toggle the GPIO too soon.
> Reject zero intervals and intervals at or above the hardware margin.
> Devices without the property retain their existing behavior.
> 
> Remove the arbitrary 65535 ms upper bound on hw_margin_ms as well. There
> is no register width to constrain this software interval, and the MTX-1
> watchdog needs a larger margin with a 1600 ms minimum ping interval.
> 
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>

Applied.

Thanks,
Guenter
