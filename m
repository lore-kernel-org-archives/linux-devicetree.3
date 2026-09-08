Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFA3C4E1404
	for <devicetree@vger.kernel.org>; Tue,  8 Sep 2026 13:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788872729; cv=none; b=XCzrrs4dynXsBXNYXzRDi5SDUXFrXZWeDdJ91PKY5HMGY/EHrFsje9QXJDDL1GidWZBmwReA2XZY+hnKet7ncGO4oSu19nRSyBzJBVWDIasa7NjDi8yF88hQ7AaS1j72QnA0e+AWKBMKcPqsTdaoYo6KlTSrrTpsWwQDKFujCco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788872729; c=relaxed/simple;
	bh=cnqNBx8pq7Z47YAsS+IDwbUQ3pdA9qA5zGP53d/4bZ4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mqosq7uBDcPDm5ibJiii3xMqC8Tea8A3MEBiv/gcEVxq5Hl+dF0ftyx7CTRX4uXsECtuGxRTk3XC6WfU6+Bw4j1qFpp/yyElZ0f0deC8ZTzRR8dauDliKWkz39CP9tC/wTG4TpAWRx7hgEvkLZ81oGjCOvZOp1UjwUhGu0CFUd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-5c6559620e3so1951371e0c.1
        for <devicetree@vger.kernel.org>; Tue, 08 Sep 2026 06:05:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788872726; x=1789477526;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=UFrVrNftIwevd1khEgO+DGb0fuGh52ZtRr2k3KbdQ18=;
        b=DKh6sKB3lZ9asp0gx50RhiQkAHZCL7Pnn/bvc/+DduCCh3LkbwMEP1S4S1ZCtQgYjD
         g93VlDdX+GwwHRUo9pf3eLqHE3edglyaoCKGo8m3Xnpulg3elf/4sN3/J+H7rSMz9NGc
         YlUJocDN2xepBZJdHF81knEYwVTo/kunzykrevBA7oH0f8uQcOPOe+FKY4K/JIqGS6dk
         UP9eRa3u33XpYCgrWozOnf6WZAwlVeFQv378cfIRx8mAcUG+PT2+x5jD68AgJH0+dMj7
         qzoS+qbV+rPtAiFqU9F3xusKqFwVvKCHHAaGFainvXnA/qJGp5eX/ApRhrQXAWRVrSES
         anww==
X-Forwarded-Encrypted: i=1; AKwUvBwgiI6ggDXfdThko+nJDG6LOz9iYQSolcAyRkMb0kf3p+4GDHZ+FW2bCpYU/yl/po0SrySiEAD8SHjo@vger.kernel.org
X-Gm-Message-State: AFuF++koZelAMf1zMG3fScwxqTsSLWfZvlY+Ats9JsvmFJVVj9+ChG7o
	huoVopdnsH2uWyyuQ05KRHBtFJUrXoDCAU7d3LtUtKi1ZEXEGvnDWROmoLCdeu9h
X-Gm-Gg: AYBFou1LbB1R/nXISssM9qOLYMPElGie/eKrlaMcSeeYmtxluerav2K6ydqNH3m4tEW
	asgsmWMtHNm82ketX+TtA3BNhHJ2K/HdD7f8xDJ6HSicXNIbs4KNHwtpU2WMzYRAqZ7EqS0NZ5V
	vudRpjL0RUsSrlbqtGLoRSx6J+v5mJWN4szOL7Q1OgPflObx1kpfprilcpern3VGRuXLIf9x/wJ
	xvcdogaxn0aZ72ffI6qd7Orh0c6+mjEYpM5zL7fLi2PUGaNLGcVs2Ibav/d1O1uND6xEslJM+/I
	xTAJd4bV2s1lDyCdbjtlZ3K7eaoAtFVOaPVKzUsDLJrooolTjs5ROOHokcNviwwTmbKf1Ec6gEF
	tZ7bBl1tWeyMVSLdpsjmlUaY7694ENhEIBGjN4acRYV67cj8VH8wu4+FnN+qfpcVpnq2EA81U0k
	FzjEE1K3Hp58WhdYJjlqU3IuGC3o2xT4Nmf/6kPeTGa+41LzV28dgMqPWS+UR/9pmfPEKlZodcg
	YrEpKWJEw4WCfN/zYgxaYPOdXVY1g==
X-Received: by 2002:a05:6122:3d0e:b0:5c2:c0ae:a2e8 with SMTP id 71dfb90a1353d-5c7ed493f50mr13556152e0c.7.1788872726294;
        Tue, 08 Sep 2026 06:05:26 -0700 (PDT)
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com. [209.85.221.182])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9808ed1dc86sm9316115241.5.2026.09.08.06.05.23
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 06:05:25 -0700 (PDT)
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-5bf9466867cso1935732e0c.2
        for <devicetree@vger.kernel.org>; Tue, 08 Sep 2026 06:05:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBweRCWeWFAXnpGHhDuttWcmlQi9TK+kDRyLY9NpA3+0JlhHq3HqPnr5cIm5CV8wwcHE4KmvrMWSu4Nt@vger.kernel.org
X-Received: by 2002:a05:6122:3d0e:b0:5c2:c0ae:a2e8 with SMTP id
 71dfb90a1353d-5c7ed493f50mr13555766e0c.7.1788872723498; Tue, 08 Sep 2026
 06:05:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260826174854.199139-1-biju.das.jz@bp.renesas.com> <20260826174854.199139-12-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260826174854.199139-12-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 8 Sep 2026 15:05:12 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUi5+XYET9s2M6Wof+3A==ncJBB406HQuRMAY0mzYzObw@mail.gmail.com>
X-Gm-Features: AcwNN1X6mMBGvrXg-PhR8OjhDtaY51dYTpCkmLNbl4YY1ESwbdemVH7kSJCVa_Y
Message-ID: <CAMuHMdUi5+XYET9s2M6Wof+3A==ncJBB406HQuRMAY0mzYzObw@mail.gmail.com>
Subject: Re: [PATCH v3 11/13] arm64: dts: renesas: r9a08g046: Add LVDS node
To: Biju <biju.das.au@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 26 Aug 2026 at 19:49, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Add LVDS node to RZ/G3L SoC DTSI.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.4 with resets moved.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
