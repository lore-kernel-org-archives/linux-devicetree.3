Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795466524;
	b=czQzeCSyZcimkKecnMRaNhqyUXYxd4mye9UX6GBW/F3fq3gcHc7C5wetPWsAhUcdzwHo
	 ne+sEa9HIGAr63KP8p5OAl21w4Yfh3JwXlTHhZLt4yneDLvGsyS+F81P98s7tx2BqdHJs
	 C03l09r2FjNxPkgJr19yPGOL1F2Lzs2RFP2/Yyzu98b9x4Rj6LfozKkYlqbRIgdHBEeNl
	 wiknnQ3eSPHlqrB1qr6XEuEmSIV9/UGZ1lB24Vjz5orHnSIQUthUs07rj8Aye4qtMUeam
	 CY1zOe5F8vjXmSQvdL5OY5jHdz7fQlB214z0k/O60ehMBk7lVhjmyXIEvG3A2M3z4+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795466524;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=iRRa07G1xdUZQxEGMvbK1GZwIzrpVcIfzr1BuRr7tdE=;
	b=aXNCsnk1RpQ3o9IEGL6BG5DpA2md/01irEzuz3VBLyjV43yNpIZvw6CZ2HZ3k5OvP64E
	 ZWcPiZy8paM3gE55jWo4ecM3ps5xIywMTjgSChUcQAGaMZLoHsvHhwLuzRenr4x/DkMgH
	 38+ySOkhMf5F5pf5eFRp/gp2D6EBMfIPJl1ytLi/yPXwhaLOyEfdQ3VbOHMzGTdb8uYCA
	 fLku7tUsx5Xgh81HuAqJgWCtubnYdytHyNTTqVlfEDaVDodQ0oTuqvgfsfJ2kND0whe5e
	 A1yXgjRxr8gRwfJzJXkq7iZbbk6b4FTzQmXiGmT/p0AuKepBsKqKC1ViylcdcCnF9Dw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cnFeD6zQ;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7478E606A321
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 20:42:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7478E606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cnFeD6zQ
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-49412eb1474so2421513f8f.3
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 12:42:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795466523; x=1796071323; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iRRa07G1xdUZQxEGMvbK1GZwIzrpVcIfzr1BuRr7tdE=;
        b=cnFeD6zQW3a3sP/sI++8Ivx5QONZ3SGCCytu8pWJ6yXswzRonX4P6Bpqmejt1rx/uQ
         QrDCR0k0lTPfCl9iUK2zDPqIFRils/CNHRhx2SE6pFXYenpcwViivl5vEwd8ENiLi+T1
         Ut04GB4kRKSPRB+sa4GmRxHG65TpA7bDZJ0S5mvwNyc/OPaa2HmFMiWhW4LS3FwUccl/
         WZGj4Ha4h4pcAUJvLPiYf5FbRFxs0A9M//Vknty0to55/G7QdwjTo973QfKrrKTzZbDG
         TFdna4iGvKllP5tL6XqfbIsqYkIW9zKEEMCRFGzEgm++4NHsDALb5q7Upb0ZkmRjK7D0
         4i+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795466523; x=1796071323;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iRRa07G1xdUZQxEGMvbK1GZwIzrpVcIfzr1BuRr7tdE=;
        b=zBehYTPebvtcSmzew2hRouGYKxKMA96nPTrzc5P3z+CbgOckrQ8J5b68Z4hwzkYxzM
         +QuqIsKAmoFA2BRmAhbWnqTJI+ahkPYzbibUmF1ArYI09j7l79iAVmPPh/sAZNTX6zfN
         Xao1SlJvu5FC22o/l9pzXeOwphvq7DB2+gnwYVlfO1aSpowdOmDJ1gSVi2fxuALO3DTf
         zVVEUW1mvKfmFcibL48fGb3GeUPUQUk5C9CBR703/G7tuWqoru34HnMCMTgJhycNGCzu
         +klNHlhVKv25fWydwhAEKW8iRzu8Zkkc4pu0f9EtAM0ub2q6C3yLvpSIxKa2M4xsHuup
         MDSQ==
X-Forwarded-Encrypted: i=1; AL+hErEBtGrBjXuwG9dJ8jxwu56EvsvIwLm+vueypuKict0+LFnuw3sZR2GC+7fqDQO8+CFP4wFrq99DGniZ@vger.kernel.org
X-Gm-Message-State: APuU4Z8ijdP5pczzktdD09V3LxRmzzPO0QJMfCFycnp01WsP45F3G5KN
	/ib0RjXcHSPNbCkz+zyx+8dlm4xW7fhv+Tu3nFsdBS83B/3WtgbMgXaK
X-Gm-Gg: AZFdTZc7QS2vbAP6XSFemPZ70gm7yoR7im6p1J0wQtE+0nmtSHyfeIla5YevmwUeRoS
	hT1gcCj27fgyo2mN+O9/oUAD1t/ztNU+fzWlaA5p+drh9vnZ+ib093MEz3FKr0gnD7h8poc39PY
	CTPS6vWFD5dbVJ/rzu17J08L4fs7FE8+wVnyyNl+7T1sLC4SPNJ3QfTJpDrqmmy5Fo8/I+He3dl
	QfucGiumnwGlgzjXYgQfbtYSWS/iWjFH7Eqxk30DrH6YcF012Nw+J+VjkZwSXAlm/OLCzwoU+gV
	jMQlXmtQg/aeqWawniMe0ipA48oB0birxf3bfMqt7IA2esz7oioEjeLGhpISKKtZULQVcb736L8
	mlIOYQRGO2jSia08VmZV3jqxN+i2I7kiXpfn5HuGTESluYsTWJnOm6fVMX0hT1LpfO6nGrli5pc
	wMJP6rD7/EHAL2GmkLUuJtFvXV/Gl1kCGvX8UEXTlJbptzOd/z6Vwq20GDvZvD4KGMUVFOhCVME
	X3e0nMAwPK18F4IaRS1XVEGC7iwiRYV0uOBJoZ1KLCD/hHSLTeA532HpS9zTlPNQ0He0Ruz+Jiq
	eKnn39LkMr22oaAzV1dOuQsaab0Y+2jpHhOggZNCMsSbJbcZJmI9Sdk=
X-Received: by 2002:a05:6000:470c:b0:4a6:ad0e:6cd4 with SMTP id ffacd0b85a97d-4abb759dd4dmr23243874f8f.48.1795466522717;
        Mon, 23 Nov 2026 12:42:02 -0800 (PST)
Received: from [127.0.1.1] (ip-024-180.users.dtel.ru. [91.210.24.180])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67f204sm28134803f8f.21.2026.11.23.12.42.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 12:42:02 -0800 (PST)
From: Fil Dunsky <filipp.dunsky@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 2/3] net: mdio: Add Cortina CS7542 bus controller
Date: Mon, 23 Nov 2026 23:41:59 +0300
Message-ID: <179546651961.3814407.1392448728993928813@gmail.com>
In-Reply-To: <e55e5103-db9c-43ed-8bcb-406909fe8f5f@lunn.ch>
References: <20261123-b4-cs7542-mdio-v1-0-626d0a0e3b4d@gmail.com>
 <20261123-b4-cs7542-mdio-v1-2-626d0a0e3b4d@gmail.com>
 <e55e5103-db9c-43ed-8bcb-406909fe8f5f@lunn.ch>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi Andrew,

I have only seen the timeout in a deliberate RAM fault-injection test:
I temporarily slowed MDC with the prescaler. I have not observed it at
the normal firmware-selected rate. The pending state was intended to
handle that injected late completion.

I removed that state, kept one bounded transaction/poll per operation,
and sorted the Kconfig and Makefile entries as you suggested. Full
independent ARM builds with the driver=3Dy and=3Dm and COMPILE_TEST=3Dn pass.
The revised driver also passed the Almond+ RAM test: PHY IDs, same-value
advertisement write/readback and the controlled MDC timeout/restore.

Your Reviewed-by is applied to the MAINTAINERS patch only. I sent v2:
https://lore.kernel.org/all/20261123-b4-cs7542-mdio-v2-0-30465e831853@gmail.c=
om/

Thanks,
Fil
