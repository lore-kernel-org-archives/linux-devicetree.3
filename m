Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84D18429802
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 09:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786441362; cv=none; b=ObgxKdTs6gNLUPLU50d++u1fMOOkl7Htou4gVNtIhGhTgQ3J+IfdCdDJx5C6kWBZ84rKX3yS41dNKXLa4TUUnh7nTamEUjDaJM/9aTBeR+nG58aksa0KKlXMj2Kl+d0bQq11iw1IW/GhOdHwdpQEs4idQ/G0bZc8XJVkiD7V/uY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786441362; c=relaxed/simple;
	bh=CjzoQNinx/MUAJk6TYpW0pAvzThhrTgPNa2w+HqOG7g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l/+iDX/+JPptmPpeb3uR4XwoIljvgnVAMWMGTbGRKbfg630eOaBdT5jKLK+1pnD1T5Jdr2IFg4sL4jKSALGI79OslCfsN9CMwTOb3R21cE4T5jstkRULwHJS1oyondMhxo98SQyq/EhnBZDkwn9+mDEXc0O9KR7drSnw661Qe3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=bLyyyKQK; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="bLyyyKQK"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-84867f07d63so3306426b3a.2
        for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 02:42:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1786441361; x=1787046161; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mwCGNXF+KD6Hu7nTlnEWpPtpXjP+niM518rfogM0Juw=;
        b=bLyyyKQKxXWmPkDQ/cs9WEqKjXWbTOK7ibyJoaT5++E1yuzkdrSF2j2lXbPmfwStO0
         VcbFD9hBBcNH0snPyapxxLg5szdF/H4Tr1KkiFzhmi2NyA4PoqflCQkwLu2XIqPQJfJ6
         vge8BBJDaomss7ttEcwmK1zCrkD7wO8qEAhy0L1v6ObNZ2uu6aNszVf3aIzDIshNwFwe
         SZf9OhICN2fzlaMpF+UbUSZrx9ke7fKKYfnDi9pEUBcC0zP5yFW/z+LJWOdKjkAvTGSC
         gthsM68KWN8uXaDZ6KgXEzJgTHNlhwaiycMnDeR/erg7AVnrE3zXYdttQ6EwcpOqavhJ
         /I/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786441361; x=1787046161;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mwCGNXF+KD6Hu7nTlnEWpPtpXjP+niM518rfogM0Juw=;
        b=Stl+vXtwdJur4muLE7+af1grDHCtMUXLLXyH53YJjCwW7q1S/WfZzcrSIWIX8t8oqW
         /nbfehM54JKynAf1u3zWMc6mbYjI5opMRGXBycdjuJgBXzBKmIWEwqriIakJqZ7jf1QD
         +fn28LfCat+CIYUT21tdi8YfSELzSM8ozusHGKY7VE7RGHoGwpn5tB7eV/kWMYvwFDDO
         NERGTzti26TLS3z3o6EHZKpTmiNp0Y1VYRSzQBgWkyeBSHAC8/I1/+uS39pGMJ7rxcFN
         E52P/KNdgmNO0XjB5kk9aM7+QJAQiGQYE6fxvhTd1xlqVXDBQTGS7VUW6+V0vXJT2zL/
         pnOw==
X-Gm-Message-State: AOJu0Ywk0Taqvx8pS+lVOdICLhal+r2UhypI4XN+cvPgZK6Vc9t8U/No
	aZoklRTCYHVYeFthFwyui3+XG/YBI+pDnrW0gFc+wCOxEF60Lp6z33cxfDJZ0Qtm0Bo=
X-Gm-Gg: AR+sD10+yuVjMIomU19dzMISMoRrx+imCdSwKmQUrJrbEM9w3EQ8JmornIZQCX/JOfD
	hBzbOgbxyYCG/AMYkv0OZl1V3wsGcuu3lD2T/q088OiWVq+pHNRbvtsnNSg0XVGsxnXkMDp0MgP
	fPJNg3WprxmQaFIXykcDMzJl2YifsPweSLlBzvLHzULNdEnpZ7cNWq4bpcV2K6ajJ5l9fHmcZb2
	n/aTF2wxZuPpNNw024YX27BFsHfUNTDDxFgmN89W7OfMhPkApTL8ugVtgNGUnySayWbgKCiudLJ
	fq+J6GQbHDhHFQhqvfZLBSzXvW7LQD2g0eftxf9rpGHk+DoeXWQKNKJHn279KVtK356T3Q0DJxi
	JYN940SqiPE/1rwWFJWw8gH9Y6P+R8bE8/47xXjsFLUCnGoy+h4A/6DrGFoBpj1klaCSMoibBDl
	QUdLEg39+ztmb+EZQrSBQ4uyjMbekU1MRDgJ58329+Y+snP3u23tsqBUSH+KE=
X-Received: by 2002:a05:6a00:4b15:b0:845:cdc1:a803 with SMTP id d2e1a72fcca58-84fa8694cb3mr1704052b3a.11.1786441360746;
        Tue, 11 Aug 2026 02:42:40 -0700 (PDT)
Received: from plin-1878 ([136.226.240.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84fa91cdd4fsm428022b3a.23.2026.08.11.02.42.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 02:42:40 -0700 (PDT)
Date: Tue, 11 Aug 2026 17:42:29 +0800
From: Yu-Chien Peter Lin <peter.lin@sifive.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, pjw@kernel.org, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, alex@ghiti.fr, samuel.holland@sifive.com,
	dlan@kernel.org, guodong@riscstar.com, dfustini@oss.tenstorrent.com,
	michal.simek@amd.com, junhui.liu@pigmoral.tech,
	darshan.prajapati@einfochips.com, akpm@linux-foundation.org,
	zhangchunyan@iscas.ac.cn, luxu.kernel@bytedance.com,
	pincheng.plct@isrc.iscas.ac.cn, nick.hu@sifive.com,
	jim.shu@sifive.com, zong.li@sifive.com, greentime.hu@sifive.com,
	robin.randhawa@sifive.com, scott@riscstar.com,
	dave.patel@riscstar.com, raymond.mao@riscstar.com,
	anup@brainfault.org, pawandeep.oza@oss.qualcomm.com
Subject: Re: [PATCH v2 3/3] dt-bindings: sifive: Add WorldGuard Checker
Message-ID: <anruhbTLRRMVa4Ia@plin-1878>
References: <20260729163908.249838-1-peter.lin@sifive.com>
 <20260729163908.249838-4-peter.lin@sifive.com>
 <20260730-towering-modest-horse-ccbdcc@quoll>
 <20019441-9ebe-4a13-9bb5-fe1beea386ae@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20019441-9ebe-4a13-9bb5-fe1beea386ae@kernel.org>

On Thu, Jul 30, 2026 at 09:37:11AM +0200, Krzysztof Kozlowski wrote:
> On 30/07/2026 09:35, Krzysztof Kozlowski wrote:
> >> +allOf:
> >> +  - $ref: /schemas/access-controllers/access-controllers.yaml#
> >> +
> >> +properties:
> >> +  compatible:
> >> +    oneOf:
> >> +      - items:
> >> +          - const: qemu,wgchecker2
> >> +          - const: sifive,wgchecker2
> >> +      - const: sifive,wgchecker2
> > 
> > You need soc specific compatibles.
> > 
> > I do not believe the two review tags did any actual real review. They
> > would tell you to read writing bindings document, wouldn't they?
> 
> 
> And you WERE TOLD this already at v1 - missing device specific compatibles.
> 
> Drop all review tags here, they did not happen.

Understood.

Best regards,
Peter Lin

> 
> Best regards,
> Krzysztof
