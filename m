Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C27942AF9D
	for <devicetree@vger.kernel.org>; Fri,  4 Sep 2026 11:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788520296; cv=none; b=LtVgLagITnqlqy4dq6YR7NctkKTqv54PTvetlxyJdftmRrDbrcyJN3oYmrASFSxKsYJlx/p6tuLI+Q/Di8A3dBefGRPl6KwFYtGQpTD/R9/HuqD74KA6aZ730irGOPcIPtKjBdk0pDMNoK5qqJwqOcxvlA2rtWICytFudK8+YhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788520296; c=relaxed/simple;
	bh=kogY6TLSuVIt/3sC1dBhtpJjb2uFidHomRE45bNUWKg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Tq/GcEHkCmTvkViv3FEmGRypPNyfA4vxQN37+5msFzLAFbgz+OTeEspbPOl1ogtprU5jLRGsuu6BnRZftZIBlPhwqxrRQwYrACV+0pDd9bzxAa9eLw8+ikxlS5sX+Zo1vMMtWWRipNXg7pArfMMJweuHOjK7/AJ9w1UNXciZlE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-5c7c25d9f6fso842032e0c.2
        for <devicetree@vger.kernel.org>; Fri, 04 Sep 2026 04:11:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788520293; x=1789125093;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DEMMEYg5UPRjTvJH6bpCIIVqiRbyQhNHEX2ipUmBsbM=;
        b=Em/AX8fLn+p2GgKqo9Q7KzgZ70CHPg2T//RUA7PFzR2/XWmUeJmn6fFnhPXfyxlCuG
         9Z/nm/AKyz4+ls+PERn9PscZmFH/YOeIJinRnQpCNmf0TFolR6MBeI9xIBeBRLP6SwcC
         2XTWru7gYmybn6IgtSg++/F2Xh2GlAAjDoGrgVyaSALCqmaf5NEQL+CA5cd94Dx/kcg6
         uzDSDlzl5xwnM3QbLhnuXEg7A7/HE/BB8uePENfXnsTaDgbdaaAX+QvGkl3eXETnlviB
         LQiILMwj/itZtb/6RTxFsBBH2wRnY6cS+9qkb10IR7ancEj4Jfea/zmtgtQsI1GwzCFd
         JyxQ==
X-Forwarded-Encrypted: i=1; AKwUvBy4cITJsgD3cGyuW+pLxBtueOnRm9ZOvR1nYuqyR2iJy9G8WiSym/diaDtl+si+D4wn7unHY0ZL6HQV@vger.kernel.org
X-Gm-Message-State: AFuF++l3y6rOaFCu+CxmerOQVnxLu7ec4iI8wQ08uwaxUGSPN/7aq1M/
	jPafWWrwq8J2nbpmclZPIPTEyDfSikBt+3B/k2JYam+SbyY76B9YJNweow1ipdyG5u8=
X-Gm-Gg: AYBFou1c2iRX7tFZrSy1xCpHjKBkDrjuExRw9XLVhQrzjEF9Vm7fVCutnq2lZEdzUgm
	WkbFu8TRAr5AfXuObVGfpoFXAf4IaFBy4KKdUhr58xvykB5nW+fzhlgrVjL5AhZFdMPgGHhv9wF
	zRr4rmA70cP9b1cueFP1DFWE5YGXd3zIUD+Pv+OMmVFA9gse7XnbLsPDEt0MkXXwHlSeZUXz8G0
	lRooR3hc1jaJXC2m6Gtby6LbgQCPi+Kuiagib+AaUxEqMqpjoqfG8SH1Ygqv3GUlS9p0MUl1Nlp
	s5qAwKvXg/V2s7VOTjPqkYvXBrHJFZEkRSoJOPUifktDLaDzswHAv4KXDWv1uLl0V1TxFuEu5Vu
	6hh7P9yaHJiunXpZgnjdhdc64YOmXhCGbkwlLl/RDsqMJfxAf96G+neclmo1Xypw29jv8T6ZXuE
	D1i7Ly6EacufLhi/S8CHnEZzW/4R1vDQCEXNc8Nm69GfJomOxQa0n6/puh78NWFY2VfZfJQqsih
	iT5ZxW6ilkRAZsdI7Yb2IGyjo9K/nm7s7vCRQ==
X-Received: by 2002:ac5:ccad:0:b0:5bd:fb77:842a with SMTP id 71dfb90a1353d-5c7ed836476mr1815446e0c.7.1788520293172;
        Fri, 04 Sep 2026 04:11:33 -0700 (PDT)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com. [209.85.217.53])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c7ec386599sm1753505e0c.14.2026.09.04.04.11.32
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 04:11:32 -0700 (PDT)
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-783fffcfb96so693650137.0
        for <devicetree@vger.kernel.org>; Fri, 04 Sep 2026 04:11:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByH4TU83lqRnI7X/kK0N9KHRxhDJAqWmqOKhFuUqjFBxf5lud7CVeCgGh5BC0frZJYwc8QjgBeEI+Z3@vger.kernel.org
X-Received: by 2002:a05:6102:80a3:b0:77d:9fe9:1716 with SMTP id
 ada2fe7eead31-78a4a6e83e9mr2237001137.2.1788520291864; Fri, 04 Sep 2026
 04:11:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260704151521.211335-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260704151521.211335-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 4 Sep 2026 13:11:20 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVaKuYeEv23AH6MkCU-+Zb22Vo5YYRY=+v56jqf2oN5Dg@mail.gmail.com>
X-Gm-Features: AcwNN1VWCzUARGrrpc_Qo6UxK-PAKa2dMGWtQC_aDHn_mP1ls1EOnA4D533OdMw
Message-ID: <CAMuHMdVaKuYeEv23AH6MkCU-+Zb22Vo5YYRY=+v56jqf2oN5Dg@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: gpio: renesas,rcar-gpio: Document R-Car
 X5H (R8A78000) support
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 4 Jul 2026 at 17:15, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Document support for the GPIO controller blocks in the
> Renesas R-Car X5H (R8A78000) SoC.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
