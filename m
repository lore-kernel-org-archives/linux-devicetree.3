Received: from mail-vs2-f42.google.com (mail-vs2-f42.google.com [74.125.227.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EE9E3A1A38
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 12:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789389540; cv=none; b=PJbOkOVxHtnvGFe0x1nDivnRmaCWLoBrTSDJdAS5cCrwwvmWUhzwFuNt8cv0d5KB0GXHBkjnqLNMMf55w47PLytFotgTziZn6cbPfl8ajsjQUH9cVyEnnxkf150yYWxk+lTwgap/q4emnhfrpJ23RdObGLqMU18xTKY5ohpLnWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789389540; c=relaxed/simple;
	bh=alCv2i4afikLPEBE/ZSB/QPy8e/IVs00EB1s3dQO9nU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FpVacCbwEugkzBtncmHROdO4asffAc5dGX7IYGN+qwqp5crixDx3/f36MIU/y3aUd1YnmIGTcNQPLW6vuRexaVXBy3OZ2ZimLQDv/CiPTceV7Z6O0j7tN20qbHr0lvgH4UAHF87+kyDSz/w0T7i+4AkjPk0I28hEUQAQPfPkqpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f42.google.com with SMTP id 71dfb90a1353d-5c963a787c9so633710e0c.2
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 05:38:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789389537; x=1789994337;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=OYAVE9OAvj5W369HdyvqFVzrTYEbVyLELurCOBH65i0=;
        b=LKzVJbZ4gJMLhG//CVyRtrzES6vo8BdDkW2lv3Dp4O0tqItjhzGR/j+rCJhPP7OrEP
         /nIUe8OVQ3PwdeWGYuqZJt4Zl2Z9wvP2pqzpBgrBXBxNzEKqaHuICwP37Fo5rJTGXo71
         zoZHuwBX6T7ccMZfk5vnYrpePJBWe4TU82SA2DHqsrfwg3ljBMjYl3SOdwyWyQM3Mj6n
         YEPDOM7q//KQt2vBEBmKJGUxlX7bYAko2ORZRdJyxaxFucBfkcxP1bm8+nFMTReD8/Oc
         ZRVSyWvSgMHjEutN35IhuasQtfgvrngXabzHd1AHz/CWXIQNaalFCtbt9IhrgbThztqB
         vCsg==
X-Forwarded-Encrypted: i=1; AKwUvByxggTGpj089tQWu83laW9xVEENvLrI0Hm423+Xa77mxVqglJyolrdxcjxXNe/jIm00WDcJgImhT+mq@vger.kernel.org
X-Gm-Message-State: AFuF++kNOWhCFOCJm9TmeexS8s/8nbxieHwsd3XsD6jXoFnNmPsQe3t5
	0a4O7CmXmrdBi3F4EXnJzzVv6+zhzFEya2JEiHsynGmEUIEjLUUKkIZcCw1tzFoq
X-Gm-Gg: AYBFou39Riv52J3IYdMSTtiWRZtsJ/8mNeqm1LltvQlDQCE80z++aelsnOe4XI3q07a
	lS4UP7ELmSF5LIswE7ifaROfDxFXUQkDXlsMXcCbqEUFxr2HhHVp0lL5I/4yLZI/w0MSU7ETtH3
	vp+2BGbBjAWmwpqsYOsVRhnkCtZ6/RMu3JKoxvmhZ8uglkCS7Wd74UssYW+2TEBuZimXvv/qNDf
	mr5bzEVmbxpPRV2kC7v/bMTFg7YQSjKMqMgktzmtWOUqqnWB6q03wz868TJDpLJ4bRIkGh2FLvR
	tiWxRZl4W69aU7gbm9QFz12pjwY+wMbI5V+53lGr3sFCcM4p22FQKdJy8ttJYiiCqe0gyHYLTro
	2bjrHkA6Bmrup3tr1XVQutRMS5l4zw16i1Q1Vf3aKLMkHNXCtewL0qBcsPT/pzxPA67/MDlrh6Z
	yvfDtPxAluGUacGYrXu9ZElGS/Qqx4S/azQdwM3eR6gwr67vRspeUFzt+lrM8iRl59TNJTfTPT9
	Mu3CxS2dJKxbm+q57VE7hUP9HiQMogXQCEpkRJDafBjbJw=
X-Received: by 2002:a05:6122:50d:b0:5bd:aba5:3830 with SMTP id 71dfb90a1353d-5c981884dedmr1650602e0c.0.1789389536621;
        Mon, 14 Sep 2026 05:38:56 -0700 (PDT)
Received: from mail-vs2-f43.google.com (mail-vs2-f43.google.com. [74.125.227.43])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c847153919sm11962341e0c.16.2026.09.14.05.38.55
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 05:38:55 -0700 (PDT)
Received: by mail-vs2-f43.google.com with SMTP id ada2fe7eead31-785643199c4so514500137.2
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 05:38:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwYHE6hcxYDOlvIiVUSThTQriKRR7+WYJn2r7Izv3b6bJpcRe76n3H5g6ByQbu3iEzx8u7qc3Mdn6PX@vger.kernel.org
X-Received: by 2002:a05:6102:54a9:b0:789:5f54:2367 with SMTP id
 ada2fe7eead31-79b579b0d38mr1196005137.4.1789389535416; Mon, 14 Sep 2026
 05:38:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260909175922.161658-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260909175922.161658-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 14 Sep 2026 14:38:43 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX=gEiN37Su3hhVS+kdTiw2j8WXDtjy=bQy0M8drBa_kQ@mail.gmail.com>
X-Gm-Features: AcwNN1URkRSQsxTlCS1AkYCaZYHp_UGH2AcjGLEgcywIPONdLTrdjIQPHpbJFxk
Message-ID: <CAMuHMdX=gEiN37Su3hhVS+kdTiw2j8WXDtjy=bQy0M8drBa_kQ@mail.gmail.com>
Subject: Re: [RFC][PATCH] arm64: dts: renesas: r8a779f0: Add GICv3 ITS and
 update PCIe nodes
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-pci@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
	Koichiro Den <den@valinux.co.jp>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 9 Sept 2026 at 19:59, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> This SoC implements GIC600 with GICv3 ITS and PCIe host mode on this
> SoC can use it. Add GIC ITS node into GIC node, update interrupt-map
> and add msi-map into PCIe controller node.
>
> The GIC ITS does have master interface to issue transactions to RAM.
> The interface does support cacheable transactions, however, it does
> not support shareable attribute, because the AXI port signals are tied
> to inactive in this implementation. Therefore, add "dma-noncoherent"
> DT property into the GIC ITS subnode.
>
> The GIC redistributor does not have cacheable/shareable, therefore
> add "dma-noncoherent" DT property into the GIC node.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
