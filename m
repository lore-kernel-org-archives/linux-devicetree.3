Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793871768;
	b=FwRkN66McG5vJJcx7Jx3T8vxqDilteQzJHBC5caeLVmuux2QNUIif4uXG+FlCs7VlBSS
	 X5+nJHkgIC1N2iNQnd2vSzr4j1OXStO5xGiZ1ixRB8jqbven/r9LNVcI3sXakF8kq6Zgf
	 VUcSH7M7hf02/+1X7URvi5F1Sky8sDvJihxM47C138c+qoxlb1EKDMAyxjF++DpPZgIKI
	 Xom2m1utqhJ9V7u3uz+2DpjmugF4ujtTgrMk2c5/rEMk2Q7AGtWqV3H77g/XcVz1jAPDe
	 edkioGNomJjtDZV8bCwmh4qxVaA36kdzNXpnmnBf9QrcYblSWiTM/sQFExy7ATQlfEQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793871768;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=9KVyqZjLxhSDOn37BJsTtiq5i2CumiInDbFkl3r3JTg=;
	b=EEmuBSinXCvsIWGy/I/H53auD4RJ/+w8voQZJuCuO39D4PW8TnU2w6ie8cNfx+MXqtgp
	 uo5vhLA2sbDKEK7MtzMFfkfZ0nbqu5p0OZUErAx4cZfBRzpQYlCAnzW251wjLTrIplWUl
	 Yi8qTAY2E969uiLY5nQPlq7LZ3CIpf0L7C3KI9dcYYqzHpLgNCmdE97Ya+opGTdhMo+HM
	 HBFw+oSD0cNg1BCY2vGVagl0GAnmCSRlzAsIHLoEa14WW4r3vS/01g1gU2UbtKgJ1FhKb
	 xRa5sJOUg+vKvCp/WCLfN2i9eszlk6B2/+V3smM2mBK03VZxZxQ0jWw+8d/3Bsm5twg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lBCZOVag;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.50
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ED5B606A32D
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 09:42:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2ED5B606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lBCZOVag
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6b571979178so1346918a12.2
        for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 01:42:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793871766; cv=none;
        d=google.com; s=arc-20260327;
        b=s9jSxDcg6eKc9MuwIa6lO1S7p2FxKCYbiz9ZHI2UpqWCquc37oK598udtFM6Wx4tQO
         1gipsJz4mRkKpCMMIyzltAl/1IluyEd6qF0AWFXfSm7ssMX2iQJXHhZCt4aysctue5od
         36+vBhtCOAItmgtzrLur0ZiL59M7OAhke7iZdpTuC7GqOrB03p+0wVbrjAcysl7xhjnX
         fSSagNG/qZzinv14OCSxDHjgq+ga7bqD4gFqzj7D57Mm9eSIVN8OW6duXkYKLJD614Oc
         foXwfQKPQtgPRKbWt1i7Nopu038vJTsoRjSf/7y5YGz5SSst1MuRwaWcUreWniIbvQaK
         /KeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=9KVyqZjLxhSDOn37BJsTtiq5i2CumiInDbFkl3r3JTg=;
        fh=c09tilgppsXy4EKOTq4OW4D5s1s5dwcTRV17GnqK5Q8=;
        b=Ae8JnMkAwlE2/SSpAfD6c1jMViHYduOXLVSNYjRxcp92FOUXhsKgq0FfOW7TQyx7pO
         5DWQcKSO9ASnBoTRwmQbcJJXKDJRFxyx+JFzneZ1pDoiF5sWbO0SDHfIGHtahSiCaXQG
         5Vba5RpM2jE4MKU4vRrg3q/Y253/+aDHRolA/d6TnwNpsyH3nwUy1uLnlKNTva21TUkr
         icxq3eM/njQQunK6ZNXrPdEHFo9qoBMFStbweJBebK8LAbY3rNXb8+P5Cu8X5G4lsZEZ
         vg1ydNH64Ugnwl3cXJZbSOabk2oe/B5rdUEuubfnxwsy3BKmc2SKinPfv8jUX2G9AugH
         VgJg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793871766; x=1794476566; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9KVyqZjLxhSDOn37BJsTtiq5i2CumiInDbFkl3r3JTg=;
        b=lBCZOVagTQVLd9KXSuiTDMdDSUssX6sHOvFz6jllJYqirrCE9hPUTo49xM4gJtulHD
         mbB90BoJR+kAHY5NgspfzKWw2JtqDRvz3eqaznwFv3AmMzGIX8fp8vhmJSQ0mwgwjguK
         pT2aWtLj5fBJ9jcZbx+nC1NK4eQOvNHWxie867CTF/vf5DFavxvesOEdTQSHjvJofvqW
         wGHKGvjhrHgi62Vy+rz7cAxQP1+FsgnMIG5U7uhcDf9ppFWsbDTtAU5ysfnZYVzCix4q
         cw5IbWu3uYh8SbdQ59hSYfZqX6k7oxzo6nXPyNkUXO15cChw3EeKoUbntDa2K+ueweim
         kH1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793871766; x=1794476566;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9KVyqZjLxhSDOn37BJsTtiq5i2CumiInDbFkl3r3JTg=;
        b=QBNV+ZcPCNLLCjuNPgs6LUPu6DL4ipACj4lflJlvHPLtf0LSLPezcBkLsde/kl7mDG
         fBrnkvTBhRs/cpNoilaTv2HOgZWnQqrDXZ295lcT6PcC/v/tTrYymLbZ03v5Beb4aiUn
         uI/fU7vHXDQasjMC2m5+qQ/CNZk591UOXICwQbMJD1GsMd8W6tDi3HJmVo8enshe+Tx1
         2i4jt330CQo7d0I4iDTWZaCwvQdP8O9tEQ43+nt6xphTeab7dmImNmJR3d7AKitl/qm2
         5i42khFMDyOJ205GKSPds89epPUbZh3sKQOcfGNbe7fSUNOfGUZ+Ggt7yVbARZUeric4
         5mfw==
X-Forwarded-Encrypted: i=1; AKwUvBzBffCNvaQHzK9PQEJmpvosE27vNVJaxAWmcZ3t0sSho4/Yqwr7LCBHrkMgtY44Cm50gnSjI4Ej2j0V@vger.kernel.org
X-Gm-Message-State: APuU4Z+j2JflEfLVZUn6J4YxHRoLuQ5y2UaSlgQGzA1clWha9AJ8n23y
	Xk2LEoGVYCj2866Oh65VUDwEhY5J6E7MAPwwS8JnmxLLAp3XwsLtb9WX5wwuwAZo55Ql1bsgjDk
	350nKpJdi1adL3E1M9dUCg8sjR/4+ubQ=
X-Gm-Gg: AYBFou1kPb84pOHpdbbd1sIApXegaQ1Uz/qA0Hoe65wnhr8Qy00h8I/ugHOgvIAO76V
	oPXCu8wg9yuFP11fekwSjk+eMj0pC5ZRaVVwEvIL2oyxAmTigODBT9t0bAFHRwDzbmHOpxdBGdC
	xA9DXHhFCWEVtqqft21gzY7C2/cmq5vvqP893gfGTYXK12iblNi0i9yWGchMj0r2Ls92NER6/l9
	wZVlkpWr5Dl2Z1DDCNomsngD3xTP/R5Nqupq9MZ1veXdWYt7xnIUF/TEnp1J6o315r4jdPXk4O2
	td7vmQ69L5jwvYIbFiGyNi6yINYDdriLrhegdslC0MnfNSRA5+Yk6MVFo7pqBFsgIpBtbePKOtl
	Y947Fwn/w4zGbsBnawP5EJ91xoEpxaZs+z9I=
X-Received: by 2002:aa7:c2c9:0:b0:6aa:a33a:2762 with SMTP id
 4fb4d7f45d1cf-6b4d3377817mr10254827a12.2.1793871766289; Thu, 05 Nov 2026
 01:42:46 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261021105109.199886-1-l.scorcia@gmail.com> <20261021105109.199886-5-l.scorcia@gmail.com>
 <179310028255.2808517.13933580516140278450@kernel.org>
In-Reply-To: <179310028255.2808517.13933580516140278450@kernel.org>
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Date: Thu, 5 Nov 2026 10:42:35 +0100
X-Gm-Features: AclHuK8keS0URREeVHi2bDcMrIMTrg9GDE11ruNkJWdKZdjkdmjRgehGKxzojT4
Message-ID: <CAORyz2Lv9fBrKZOQ7kFBE+u-nJ-dFpRm_3G0JTS=bHtEL6n_GQ@mail.gmail.com>
Subject: Re: [PATCH v11 4/9] mfd: mt6397: Use MFD_CELL_* to describe sub-devices
To: Lee Jones <lee@kernel.org>
Cc: linux-mediatek@lists.infradead.org, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Sen Chu <sen.chu@mediatek.com>, 
	Sean Wang <sean.wang@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Linus Walleij <linusw@kernel.org>, Val Packett <val@packett.cool>, 
	Fabien Parent <parent.f@gmail.com>, Akari Tsuyukusa <akkun11.open@gmail.com>, 
	Chen Zhong <chen.zhong@mediatek.com>, linux-input@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, mfd@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> > +     MFD_CELL_OF("mt6323-pwrc", mt6323_pwrc_resources, NULL, 0, 0,
>
> Nit: This is non-blocking, but if you have to respin, please use the
> 100-char limit to keep these on single lines where possible. Same for
> all the others below.

Ack. I will rebase this patch over current 7.4-rc1, adjust the line
width and send it independently of the addition of mt6392.
Thank you
-- 
Luca Leonardo Scorcia
l.scorcia@gmail.com
