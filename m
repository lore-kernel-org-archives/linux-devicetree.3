Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793913910;
	b=FlpL90E9rbXFjLuCGmalvqez4+fCCUAvpHr7jxfnO/ZkK3gWV7MnBing9MinkZZXAlK6
	 FxWwYR6OIp2IGpQEYhi4mkmGm0G4lzqZyNhqYDI04C6CybJUcKikfiqtkt4j0Fpg82gP0
	 yn8RjCBZPb4PuRvpXRkV0c7iOiaK85Q7sZwPs2FKVP+UGbul+fa6CRiMuDWDXj5cMDxwm
	 n96chQNW3ftdsCOx3SGoFgv4N2wNfpe4U22ZynqQoyOcXy0G67XdLXoTKTSTr9HJsqDbz
	 uFPQ0w+25o0XxLc3LnqWPw78CNWtV3pNBw0S4L8iQ18q3vVtLAGVWvnpi9Ex1Ey6Z9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793913910;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gmail-Original-Message-ID:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=maoS8cQCvuqXj/lnZnTdjD2Cp+5OfO5EJcbvlMlmPAA=;
	b=Tmn/6bVcAqpopmSnnakKC9nlYslldTBDyFbRfWFhJ2vVQl0fUEQqklnbHo+G10rGa7QM
	 JevcccZZAHsp5S69QfG2xlxRz+XKInckwagN3TlrieLoOZ5Yysg6lBDBDYxXE2G8NAdDp
	 s98zGyC5Ko2/bSG6Bv8S6FXIIOJkLkl8skJsGHi6d6udyTr3rdrQ6f4v0s9Lbd1Bt0n6L
	 cOuYrBW/Ip2vp8KadwenTvR9FydeHHIbwk8MFRgPQOJE6J0xTXtUOkCfn/k5sUg/4YSNR
	 sgOV8bFSDU/0KyFPOIbKWHa6Sw1qkcsfBXufdd73HcxrOLjC7iwNNN0HWimoTPbRuSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.215.179
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0315606A326
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 21:25:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0315606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cdb2e0062bbso951065a12.1
        for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 13:25:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793913909; x=1794518709;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=maoS8cQCvuqXj/lnZnTdjD2Cp+5OfO5EJcbvlMlmPAA=;
        b=e4DpX1Jd0u5gWVF8PqsZca5bBw/SvMB5pry7KVn538cDaP37pECZqfTyq4OMHjcUu1
         04YY+V2UTsS0SlM090aWVS+z+te2Xqmw5GfiW2KpeV/ACFa9PZQrui5zltYBgmevuFpH
         9cv6NvhVH9EdfpUnBsf/YHobHa9VjDURPsbrMCMJB1os8/BizjrFYJkawOsERvN7wXQR
         JysGvsveBESBz+X6G/NiON5oARVScM6vAdJUaIxui6DadeoQIuHdv3xYTdK0wNXtGgGm
         ij71B7eBcGimIET7/jFlc838ZEg/LjdqdySwz6Ur/VBSIrNvAPf/PcOXjg3ykjjor4Cc
         5Siw==
X-Gm-Message-State: APuU4Z9rwkGBlK4vnz0A+v0EWRbwGOAH9ETXkYBvbUOnd4QOtMMPXm8F
	5Psj9297aEhSRUHR4oG9Kw7/awj9wwb5prHtILicRw907j67K2TVFwdfuo6IYQ==
X-Gm-Gg: AYBFou1dxPwptVFTb1QgZB5RJHcX4t/Nds327sas09FxcmAxinujW4WGOTvmxebnVj9
	KvQablmGo0x6NPBPnjQ55xqmW/jv++RoqdoJxhDhhKeKyIKebUWhX3oo5lQUL3sAukxy/62eYAQ
	GmfN3MC185TCriBHDhS6OyKrW0gqXmzViOKyTgCWr6Ra8MV5QgccjNhdgoOfet8XiAT2tEMqutc
	45fRJUEFiAaYgRXgGHKsYIoy66T04Fi9DM4mbnTNA+YuCbdj2/k0b5pyck92dYo8xGwJGN9iCpB
	AcDh6i2EyBupDshpDCrSGou1tGuV21ny7BWfPhs+hcfjnmZdfPRNzGnEJaAPeEK22/K9F++0UOj
	Kk9RbdODgTDDiFBQFB0zfzstQPAY1t3mguR1lYEUSX3I30nz1I9JInKoyre4tmRL2l3XwXk9iIg
	WG54FP6AH3agjZYk64/NAyhxvU78ztSGPJVkIqjbUMsJKbdUuUnMTSJui51dHObM0FR9smwDnfA
	n0kOuDeZWWi1iX/0ylo0j9hIpemxswF0FbH5ttzlHvausypLhWmX1LleY7OeXUol3YZ02bGjhFz
	JpYfI5rdXTdqn6G8F+rbiCFeA6YM76W2Dqz6AaRV1K9bmTpYLf1XGZPiBCMgSLhOoYpHfBS30IL
	RcVLkiwmxw1j9PChgER8bvRnJ0TtYwlY3qYaUIOUBRzk=
X-Received: by 2002:a17:90b:28c4:b0:3ac:8897:7baa with SMTP id 98e67ed59e1d1-3b0db7114f1mr254414a91.40.1793913909001;
        Thu, 05 Nov 2026 13:25:09 -0800 (PST)
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com. [74.125.82.172])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0d7ca4b03sm673065a91.14.2026.11.05.13.25.08
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 13:25:08 -0800 (PST)
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-35b2c599f43so142908eec.0
        for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 13:25:08 -0800 (PST)
X-Received: by 2002:a05:7301:430a:b0:35d:d671:933a with SMTP id
 5a478bee46e88-36f7671568cmr450176eec.15.1793913908114; Thu, 05 Nov 2026
 13:25:08 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-sf19a2890-gmac-v1-0-a15965a49574@telaak.dev>
 <20261104-sf19a2890-gmac-v1-2-a15965a49574@telaak.dev> <sashiko-outbox-198661@kernel.org>
In-Reply-To: <sashiko-outbox-198661@kernel.org>
From: Joseph Telaak <joseph@telaak.dev>
Date: Thu, 5 Nov 2026 16:24:56 -0500
X-Gmail-Original-Message-ID: <CAPY4CJ7T+tChJ0ywrQ40_xXDjUiBQjpNdeE0cEWOJ4GvPSYjnQ@mail.gmail.com>
X-Gm-Features: AclHuK8lD_KS0-g7yJtOX3ExXkCkGQdmHNReODzFWQfIXif6E1Ja7kMmpilHsvw
Message-ID: <CAPY4CJ7T+tChJ0ywrQ40_xXDjUiBQjpNdeE0cEWOJ4GvPSYjnQ@mail.gmail.com>
Subject: Re: [PATCH net-next 2/2] net: stmmac: Add Siflower SF19A2890 glue
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"

> Is there a missing architecture Kconfig patch defining MACH_SIFLOWER_MIPS, or
> should this depend on a different symbol?

It comes from the SoC series, which goes through the MIPS tree:
https://patch.msgid.link/20261104-sf19a2890-mips-v1-0-eae80820af68@telaak.dev
Until that lands, the glue builds with COMPILE_TEST. The v2 cover letter
will say so.
