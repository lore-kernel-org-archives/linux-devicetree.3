Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792460290;
	b=AkauEah/HTAvNcLC67aCDiLjZUX73iwxouzZTRg5Vr9GJ77zvpJHOuMaqQnh+RD0qhv/
	 +SHLxQcu5lYpJNMvhb323zDSK+mqTbdiBBIyrXz3bgSxkXzYZnaC9iWuvOtP7/alXiAx2
	 v6CXitPOOidst2T2pa4bUcj786JK60mDxhQ6J56S/UE7/4vwRrAi2/EMv35dq4ffmYPBi
	 W0eRkgaTspSUqg/oN7hNN4aZG6W6chhYf/Dn1x3aqizJFnyUrkWoiRosQ83L/DZ9YS8vM
	 54V44qVLOd93HlOPFX/DZaLfEXK4QSyIKhIrDgdAR0mEO9/FbaBTCAQWcV0+T+CJ+fw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792460290;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=8Vg2HGC9f0RLK6KKMp0Lu8393a2H674YghRuAU4vlpU=;
	b=t6mjw4c6HhUxFhYUXNJebS25jcWzorJl2FDCv984ABkAWzuGFDWvkCtQTLlyO/L9Io9G
	 XhjHst4VsUEi7GIt0hFH/ViUp5NPxs3WHSXZdLAYzEE2cTX8XD9/b3uVKhkoibCIuHH07
	 tR2STnejo9B6LvvMPicDCNKWmO/2dX8Ud7EZZAB28NuEx98JwbDCe0mhXbywg4bSGYGAy
	 t5LDEUONCwvPUhO/hXWg/VoZUPc9xaz3vSOxhT1QvTr2hwdhJAU9A6ZfzLt1mrIcXPSFc
	 Ny1r672HlbN8sG9zqfGEr9CuCF2olTWwrZlkTuFp2vjbNLbbQsOM0/kUWFBzdMDyFAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=P8ClSeiq;
	arc=none smtp.remote-ip=74.125.82.45
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CACCA606A320
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 01:38:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CACCA606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=P8ClSeiq
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-15354aa70e8so3037724c88.1
        for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 18:38:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792460289; x=1793065089; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8Vg2HGC9f0RLK6KKMp0Lu8393a2H674YghRuAU4vlpU=;
        b=P8ClSeiq8iS2sLn5peXIWUrqLR8crS2ZbRIPFQ5r3UJoEOAy3kjbeUGU26ax0TW2vq
         M/VWc0S7TLRXwewbaBB0KXRODfGmMO4tM4luke2JHR2duix4LJ77dgPVxn/Fqq+WGYu4
         i2YLNUi/tFcRHmZtyqtwLpHEcMqeOyGD6igSrZ1Tki41ViKJ2IpD6nKi30soM30Co+vc
         3tZ48V/eBWE//1mWWvEH20OsbxLQ93KVy5A3pfmEWQaqv2RcbICpMieGwdqcsaIShX+2
         X39+mSi7/W0HTIMuO9ZGpGWzpFboaZzULMxmZp1zJAf0Fc6flUVOcpBqZHePvRvLvaFS
         +Gfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792460289; x=1793065089;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8Vg2HGC9f0RLK6KKMp0Lu8393a2H674YghRuAU4vlpU=;
        b=dEdL+m+guRQlrh8hev1tA76K1vqbrAITMcyyIb+zHhBdUrQ05G3QgWqLOGUM9BlIxH
         mzwHrcA3BGXA3g2lB9BPdFxsPFpraB5aZXEBdHz+4kEWJSdsZre+Lj3DntPEKMUn/+bD
         ZBR5kv0IHzeXK9D4FZn1Butq1ZD+ATxImLavyLMf0zvd04PkpmbBANqJDg1ISIBihe1S
         RMu9ApH5H7QOBFejgKxBo569ymYFU9CpGD2+8PAaT/aigyFa7PVkWHr5eUwyhKaU/XqR
         +PnIElMMWrEA24EAQGv10p/2Y9k/LpuzUR5w215l0HVsVfUIRn6xsyzpNgf2Dy+fj2Xk
         3J3A==
X-Forwarded-Encrypted: i=1; AKwUvBzKRNPPszYiatZ849kVCqC3Oeam2n/IE4rnYSI4MxTtSjDC9xJPqYbIC7dRbjAYy340Iu+TEkTOkHBp@vger.kernel.org
X-Gm-Message-State: AFq9FYKini7MUxMECBYrxmAYk0oIaWCM7BqxamIqi4ygOGr0gJ7kxF8I
	8yOLSZEQ2nE6h0ocbZcaT31uVNl5mlzJ8bOPOGiwPY05bMBVYh//SFkz
X-Gm-Gg: AYBFou3z+oIWRdjxM/FZQedkFwhdVbMwubkPDPJkz7RA+sqKf0Sa+ccyAhR6oEWertP
	PbOT1vYJfriejiZ4DcSheuzMYjgtBKaY4Uky8Nf8K2G4oT044R5DxolP3a/fvxK+XBvBOJX++vl
	4I9OML5ne+jQ9JhBCgrhZI78ag43xik2BRq/OahxsPTPJkLTbH/rBVncAMOtgJSwasAVaCf6Eoq
	7FnoyO8VncVXnHk3ClpxDz585TWJQIOzMPstIC7qq5McTEr3kgb63pDqirj4kJfkDmiz+uEd6MG
	/KlDbDvKqcEgegT4R5X+evdVs9Zo9cs5L3aRKbF0pzWkXB9baRyf7C9+Tr1DXZ3xqi7n6FOuaIv
	8KRfUCLtVAQF1tEPjeyg0MAHmMAqrizvyY2N3Lq9+oGNSi4D5rOhLK2cGHOP9ulpjZp7od8kK9e
	j/LBy488EErQihxSJH7p1VkT588BJZPhxxuPP8yRS4zT9iZHCZ2wjl7eE5u7kOcAZsGBetzpeUx
	v/0KuDmtkeT
X-Received: by 2002:a05:701b:418a:20b0:187:eb7f:bb4 with SMTP id a92af1059eb24-187eb7f0d0amr9277157c88.46.1792460288841;
        Mon, 19 Oct 2026 18:38:08 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1830f213ba7sm37629861c88.0.2026.10.19.18.38.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 18:38:08 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 19 Oct 2026 18:38:07 -0700
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
Subject: Re: [PATCH 1/5] watchdog: gpio: Allow devices described by software
 nodes
Message-ID: <74cb726a-b36c-437f-988f-c4f3bfa0a7b4@roeck-us.net>
References: <20261016221617.2223004-1-f.fainelli@gmail.com>
 <20261016221617.2223004-2-f.fainelli@gmail.com>
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
In-Reply-To: <20261016221617.2223004-2-f.fainelli@gmail.com>

On Fri, Oct 16, 2026 at 03:16:13PM -0700, Florian Fainelli wrote:
> The driver reads its configuration through device properties and obtains
> its GPIO with the descriptor API. Neither operation requires ACPI or OF,
> so allow the driver to be selected on platforms using software nodes.
> 
> Add a platform module alias so a non-OF platform device can also load the
> driver when it is built as a module.
> 
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>

Applied.

Thanks,
Guenter
