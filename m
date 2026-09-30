Received: from mail-ej2-f41.google.com (mail-ej2-f41.google.com [74.125.228.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 082614F68D3
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 13:56:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790776592; cv=pass; b=JfTo7sb5JCCs6fdhWkDn+wyriCz1p+o1MvCrMbo8kUhuORo0Uxl840pl7kuQtgtvQSfmUleEHLoesULmvCY9K0DVhfd0AJppwLnSqR8oPJKMbME5Oje3SD+yCO6ABXo+lDQHQlyeeRMpRud6esi/ys4gf5PhOWxT86qmwPXZB6c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790776592; c=relaxed/simple;
	bh=5SwTqNdqJfRK/IUxZeFy/sI9epuc4z6THWr/paPSz7A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nW1Vi2BJPOGF2tPmR3Bqc6eNw2JG4Rbikog0oy508nG8QtaJzr72l/VoNfGojGbjb3NNGiVtgTIxe2Gvdyfapden6c5hOwbXWrij+qjU5wJVRPC/psQh00dS09/XBrimZXP+JqzclmU+Vag2plcmvhi5hp7R4KLxuHeE1ZRXwgM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net; spf=pass smtp.mailfrom=flipper.net; dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b=NAu7vgGs; arc=pass smtp.client-ip=74.125.228.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b="NAu7vgGs"
Received: by mail-ej2-f41.google.com with SMTP id a640c23a62f3a-c2e083d0930so160231266b.1
        for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 06:56:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790776578; cv=none;
        d=google.com; s=arc-20260327;
        b=b4wBaHy1Z1hAmUGQYsbSQkXgm6+wkjdcN5pasW14TQ35eq2sFEoD3ZG6MsqkQluoDE
         cGySJr97vc36S2B507RWh+cfkpe58y3CV+LHwxXQ8iWr4yKlCFhXXEXAggf+nSkGDJRL
         9ciMV4pWzXujA92CGnB2soHDAXH7eXkV0zsFeK4q9rWeqFdYmE1iksSHGuPrPwuh6N45
         kphGfjl2TKmwHYE6MLs3QeOU4dtnPjtKy8dOzU+Nxg7BbgNKszDp+S7V61t/6oEwk31B
         xV8yf3k2AJciSRz1yXg+gdlRqwFVlsfOWk6Pq9wSJXNRKJfJGsYqn08pfeiJDMhMhEVJ
         86Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5SwTqNdqJfRK/IUxZeFy/sI9epuc4z6THWr/paPSz7A=;
        fh=NEVRWbk3UK/hYAzJXU3TRyBOhcVxUxkJZbLyk9nNHwU=;
        b=oOqx2rdPmnSwHxYSlGS8sMWZHE3hZfF5YPDpzxb5MbAxG1zniWwmIC8fLnzUKrGhtI
         5OFAXLfZd28eON5HVgby4xEetpAEXD9pHP4T+5cQ5DmDrh6y07zRV95P+clcmR2N0G72
         IctKAezZUzGdP6oZi6DC4rYif0enUOyHn0t5FmSjnhdYGUHTMN+m9J30u0OQLo+7Akx2
         TopdFaFzcyZVFK4MT5sXgSZ1rzlRHa+Vbtfd/UKpz4z7Z2vZH54b6n4vEOIhw6LXMZ1r
         sS8/OG5CEoHj/M7aY+uCo/2+BHyoNuyOWcXNMY6H+l8dmuTm0oVKM+GsXrZXNkcaOUEX
         329g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1790776578; x=1791381378; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5SwTqNdqJfRK/IUxZeFy/sI9epuc4z6THWr/paPSz7A=;
        b=NAu7vgGsXVtRJM3kyMtlMOwhzm55urhiUSDyX8sptKkvZEuu+DxtLMgX9bOD9sV/PB
         hoheU8pY/PcwwObO9x8Xww3BZ9xopjEfolEksoJhIui9UCsAG7apD08uEnAQvFYikcY/
         cq/eenmhC6S/AUZV/GQmjiyaVscpLL+/fxy2q2Sneisl0spSawpIpX4aj2SwS2/4f+Ob
         +L8etTYb3ioJVKe6KdzzxRHtBeGkiHLsPL48wtu+pG70JmkvRCLJ3KQXvPP8VT1siadX
         USmbbSz/GhOnArUa5YyW5JePpFN5XSy797Kfx/kYeAfFnsqaQRMPkJJRmSbkYREG11AI
         usPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790776578; x=1791381378;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5SwTqNdqJfRK/IUxZeFy/sI9epuc4z6THWr/paPSz7A=;
        b=kc2SSb3wqj6cMSQuitsYrkkk9+eUR4EjDpAVgJY+okQ+IJcob/HZe26k1d1mhLsxJK
         adgJxkjKsKCznrADRtPl1bhnpfL45NUTcj05pfriI6hdNrBxBunpwjnHggAVj/U2XCzw
         TomuOUrK4N8vmCJrp1Md3Ex4ex7J+kCPi1xhoQD9Rvf2gYmV8jIOaEXxwE32i+gsMnCx
         YTkr2Zpa6l+oF3iqfU1jrDuhktCqNCB5hqSLiLIVxmvZ1B7Lx/0UVqJp94lEuTEsizFL
         xyfbxbkoD5sa2gKJewBwGKigSfh5FV+QPrpZqEAdEU70KTYeNmuIB0thHzWZ9MNlavRw
         XgTg==
X-Forwarded-Encrypted: i=1; AKwUvBzubSS+1V9WdcMZSUv7tq3J2MtFI+8V6Vh0Sb8NjsSJEW8c97Fe9TJ8aqxwehx0aMX9t9PnapV1V6Lk@vger.kernel.org
X-Gm-Message-State: AFuF++nU7Myw8RP1ZO1rTd8H7KyNWNCeX9wuke7Kl8XVkc8bWiPqi06H
	tLT5WrFwyoTkVbwfCw4NF5Pn5DP2j6JjJBZ+YvT8J32wo9XlXFG8gQ6gECCSvwI/0O/Nt/hpfL1
	XgDUhrv5XyFUcQnw9Ozx9caxHdKrDG/lAdkoyLBZifQ==
X-Gm-Gg: AYBFou0OM3Hb1FxIj0vpNvzURw3/cNzYU6Rn9TYTiwlTPlj+rRecN7GxlyZ3mFY7obv
	+4wjf81k94xESZexkYKMmDvSzuNl83LUrvAC0t7DjgCcdqj4WhI5Gru/KT81miPOB4Dkzz3u+2T
	iMr+YURQH/CrMGC3ONdf4LltYU70juNVvb5sc63zbbE3SREjAvieHx6Nara+sNyU0KKlJrWAOne
	nupO7b2LXA8FQG3kHKkatLHzEvbWcu3748FO60ll9GpopwyKf2NovySOTOOi6wTs473b+NJxhtG
	kYa1CjfPMZL+6P2JuNhEX5tnXsDjrjWaUuJrOKhkUuntgYIz0nfGArKUcEFt3WgNAUTUKNy0804
	OJtijvOwNxpayVcrLMUZWrfM=
X-Received: by 2002:a17:907:1c9e:b0:c25:c67d:53cc with SMTP id
 a640c23a62f3a-c2e23cad0fdmr124499966b.8.1790776577897; Wed, 30 Sep 2026
 06:56:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260929-b4-rk3576-reboot-mode-v2-0-5a34ca72065a@flipper.net>
 <20260929-b4-rk3576-reboot-mode-v2-1-5a34ca72065a@flipper.net> <20260930-hulking-swan-of-enterprise-94e2ae@quoll>
In-Reply-To: <20260930-hulking-swan-of-enterprise-94e2ae@quoll>
From: Alexey Charkov <alchark@flipper.net>
Date: Wed, 30 Sep 2026 17:56:06 +0400
X-Gm-Features: AclHuK_LS1pgpfgwaTzGiwreXcQZqQphizrD9-WsvYxGfaJqBGmravJ6aAw_W_w
Message-ID: <CAKTNdwG0NBZUez1Yy=jk3rYrD9W97oRMwvpX1qMXwQsP=_LvNw@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] dt-bindings: soc: rockchip: add boot ROM download
 boot mode
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	Sebastian Reichel <sre@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	Shawn Lin <shawn.lin@rock-chips.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2026 at 3:46=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Tue, Sep 29, 2026 at 02:28:18PM +0400, Alexey Charkov wrote:
> > Rockchip boot ROMs enter USB download mode, commonly known as maskrom,
> > when they find 0xef08a53c in the register they take the boot mode from.
> > Add the magic under the name U-Boot already uses for it, so that boards
> > able to request it can do so symbolically.
> >
> > Tested-by: Shawn Lin <shawn.lin@rock-chips.com>
>
> Drop, you cannot test it.
>
> What is the point of such blanket tags which are not even applicable to
> 50% of patches here?

I'd argue for 40% :-D

Anyway, I get your point. I'll drop the tag from the bindings patches,
because Shawn tested a driver implementing the binding and a DTS
implementing the binding, but it's perhaps far fetched to imply that
the test covered the binding change itself.

Best regards,
Alexey
