Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794558040;
	b=c0sVHzsa46ciCPOYqB9pfw+FtL/hNuKXUR0Hf1hNolME05GUcTZb+MgXfQiuIO/ezqzL
	 Zv0n4wRakTn6wRpy/A8DTNkZtPle2qR7TR/sMKNOXmKg9Uu6y0rHq7V1xZZuyxZbVoMti
	 6QBVaa6wne0F4tlGyZP/aWM7plBV7Wwp0Gl6WoaVCGNMacL1/GuBx8WSXExI32ufsL5Uh
	 u2QRF3HqcuFwMpVyMw3rdamVUsk8iTMZMfeAlQQ/kJQjDen6YIe8QckHcvovtzlTvuSvI
	 G4NwK3+8VDUByGHjH95U6WkXTqNKXMPDpAF0lcHaeUIUzJjS9pe3bonIYHyg7BV+gnw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794558040;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=qfKfJJI7wxhAdDWtpsGEzNb54cWJZYAwY7eIBpXfiDk=;
	b=XTdxIj/P4fwiWHEIpQf22ld/2RgYlLlVvyZqNMziml5ieuuLGy7KyIW9H3MajWw3VlAw
	 7UWzHuYqpwep1Im0M7dc1qw/KJfadzEgwfe5z1I5LN4iyXYN9XqD8eX1YQtgXsAHIbb7o
	 p8ftfMvcwQ4FuUGHSSx/KA+rJLmPdxkj29ZSKOG2nH1GgrEHr5HmbyveEMrjjLxt18v8w
	 t9X/Tcgzz8gvELO1dpTQIzklkuQDy0w4Gg71ixvR3tuV60NNueaXv/PWlXHS6iCVA+Nse
	 ECJBnEz+mfd1NiOS7X0RBf4qS8XFOdlfo5OGaSn7yTSgbboDgr2StfWqw+ClP2iEktA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xHhozOY0;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.180
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 859BA606A327
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 08:20:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 859BA606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xHhozOY0
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-3adfb0c9e3cso1343861fa.3
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 00:20:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794558039; cv=none;
        d=google.com; s=arc-20260327;
        b=VfUIK0kHsJsc1ApRyo9ksjBTdQm2yzzr4rFL/42DAvJ7CFvkuRPe8b0UHPIGIyXOqe
         G1DcEv7dnUDIgUXOUvntXZys7nZ1+AGgOrwxsdUZdApbTX+dgEJVYuoCLIDjIrFNR/al
         EC3CPS+HCZ1Oks/WBvJ8pklNMrQHPJyAjUiEHy+QDW9+9h60YlRVAD2wlfHU4m2xFjXf
         6G+uC6Bbfwk5DrNeOHCAfCn1TGoNuC/+c2pUcfxUmAuZWuic0P22zXpfRoe2wvTtssuH
         87TwX52cq5T69Bq2my5V8UHxsxQYcIo0vlo7f13wzFtnW55S/rxwTiR8dV24JJjOD38e
         ohrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=qfKfJJI7wxhAdDWtpsGEzNb54cWJZYAwY7eIBpXfiDk=;
        fh=Eb9s3SqG79AIOcP3KP0xnqkNj/01+PkrEltKEYFy5s4=;
        b=aVox4dKkuB2XFPK4fmH8B3Zh9/gIegD47NFgW8BgNxW8fkfKG7JUfjgeSofeF4MXhM
         ohtzIkVvyM5FfgPGDL8Xqsw0qTJUM1aonlRHLtrNkQ6JNrRelGHCbJ9VXxQWLE6kjwmy
         qKopRvj4vHY0XDpsIh12EGnRsomsSm9eW7P4BHoOASjeOz9aJDAKXq3ptyi+sqGxFgrs
         Jxkcg4WUv4su1HkBOmS5KW/pRpWln19MYxBduA1gFV8zib2ZorLjBY+p1NznqQiLF6Bl
         skoYAc0P73E6mzVYh6NaVYN/Zk/BGEcV8XPQb7SB3olf9ezO69EPQ7jFxxVc5sOfTllu
         v14Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794558039; x=1795162839; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qfKfJJI7wxhAdDWtpsGEzNb54cWJZYAwY7eIBpXfiDk=;
        b=xHhozOY0NJ2QC6eQD/p+zobo+GcRPv7sezbHuV39CnsJv+rIFMXaRxdJiXo4HMW5rk
         kdxvT7jERlvnC68k2QiiLyZBRz0Ugps4BstnvYKRHz5kDQ7XrUh/llNQWvuncUNrlHtb
         UPAURYJDSTDhXQAGVBdPLs3MbasyoOzuhkKkSlqdmvs7/hg/e76tWeuXBnwTKZWjyeNl
         6gPLUcwoKmikMRmwQogewu/eo82l858Atm07y51VNrCQ7+NeVO/+QfbKpyK8znspUjBN
         CxiJHKQWIU0idMqoy3WQW8DkOPmPpJtd1qWjg7LA0ELH3ls0J8uIExMIUmyu7vTMrdcW
         OmTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794558039; x=1795162839;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qfKfJJI7wxhAdDWtpsGEzNb54cWJZYAwY7eIBpXfiDk=;
        b=DibpZFl+h2L0yk8GIKHme/psNARkiSx18fV8YZbjQsUNO+kcKxEJiqVJFn4CQHxHNG
         IxLIu6IeZ1o55FA/ofsOGs587DwAOvABi+ublmka5oRmBq7Dh9k8MyPr9N0F7wwmVTJm
         LSkU6T2VVqylbGGxJfXiCWgIQZkOfh4PsOH717DiS7BrX/V9m7HtvaQGy+J+xp5ux2a5
         XLUS7zEmOsgXIM06kcL5jdOQj1nV7wob8U4MV6oCQ0ISEy1hsActFuyi8LYEsK/1ylfD
         U/cHZLgcpOolctgO1lAWlUggqz3kD+Nec4hDgwgPcf0i0dEWq5huUIquU75/C7wQQbp9
         UUVA==
X-Forwarded-Encrypted: i=1; AL+hErFWz++RSLMlP+Yg5GkiUtmfdTRPwPnlwCCqfLpJ7Ocf+XetWql/x8LV6EsrFb3uGCOuLpfkpiOAZkRM@vger.kernel.org
X-Gm-Message-State: APuU4Z+owFIr8SvocObeyXjg/dzGCiBao9ruRc3J3X/Yp9INImVSJhY4
	PeOoyLcXzkuxA/AprcSBsrCq2jMnF+nV0Y1hCjbrwo7pmWcYvEvE8AscT4elG6EfrIMsRXg3eIR
	t7ZMVuh6YKw1zzeeIRV1b/zz+3LjRaM4=
X-Gm-Gg: AYBFou1vBoFffoT7ZeTbSj3je4UwzHmxm3kkGZTIPCg78pFJBGWodPPsiVmog7jENj8
	1ABGuEjPn7af5muroqEuP1wywzonfZqJuPROZ72jtL+xfkEdz4ZAD7uTLhPG7Hr5YQEg8KY5+up
	ec2SgLAx50aSgj4lhzGOoDM+/Gd4j557wDw/4xhf+DhXvhgMgsjFtPX10GO+f8RBhHPCL6Th399
	sIupOciYc9PSh8pIbx0iWHHy3kUDdib19WjwDoE4tT5nFlc6ksxWu4wLzoqJxNWiMypgz/C8TBD
	iRYXeSkhcdVMwcLJsOQqGLFA4MIOWu2YtyEB8oVmu5Y4r0QCV9/gb4Z/xRn42LY3NZdGiqHld/W
	EQrvx+6Ywcwz+YciNefxQkPAuS1rMqOsoghtG4lFAic7HAhNe0PblgE3cUmoMyFEBmQzJifE=
X-Received: by 2002:a05:6512:3e0d:b0:5bf:a66f:e5e with SMTP id
 2adb3069b0e04-5c17058b108mr849129e87.0.1794558038625; Fri, 13 Nov 2026
 00:20:38 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110-usb-port-pairing-v1-0-9307e29d2ed2@gmail.com>
 <20261110-usb-port-pairing-v1-1-9307e29d2ed2@gmail.com> <CAGb2v65goAuKgYu-849171FGeCxZ8Cq3GUxQLDLaHLbhRTMmqA@mail.gmail.com>
 <CAEy9hNV9saBWyKxuMR5unmLjzBM2+S7u+FewEevuLV-6yo1ztw@mail.gmail.com> <CAGb2v64xjbc2t+fMegBUSptiwT5FQBqc8aqiVkLjwfaB+3FV0A@mail.gmail.com>
In-Reply-To: <CAGb2v64xjbc2t+fMegBUSptiwT5FQBqc8aqiVkLjwfaB+3FV0A@mail.gmail.com>
From: Arun Iyengar <aiyengar1990@gmail.com>
Date: Fri, 13 Nov 2026 00:20:26 -0800
X-Gm-Features: AclHuK8fPl6O1DLxtbIbOB_Tvsw2cAGJCYYC3mBqm8ET2-FLO8BbsLPv08rZzEo
Message-ID: <CAEy9hNXErDHYorhMp+xVz-A1tYs7JSEdFYApCK5AO1nMAFDqCA@mail.gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: usb: generic-ehci: Allow describing the
 root hub ports
To: wens@kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Alan Stern <stern@rowland.harvard.edu>, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

> It should definitely use the raw port number, since that is what is
> supposed to be used in DT (and what is used in ACPI).

Thanks. v2 crossed with your mail; v3 will use the raw port number.

> FWIW I'm also pushing a series to wire up USB on M.2 connectors [1].
> That also has some code that does OF graph lookup.

I'll look at it for v3 and reuse what fits.

Arun
