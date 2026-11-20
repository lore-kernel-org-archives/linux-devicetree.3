Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795173858;
	b=0ic8QJ3GqebO8DS54xANiYo57sdna6EmtmQxrt57CTECD50CE/6W3yYf75E8Qxj1qUP4
	 4o1jZ5HoqXBeUL+Lv5LyvlrVeMsxfkqsvucDAcR3CX6hdCrXYDTFs/2n2DSz/oAU1ARxT
	 GmJTtQK//E89i2yV7rDHELDeBxTaWFQnQcTxNW82YqNgjXQ86aMZWnHSbdND7z/RN2mII
	 ZkvuTtHRzEAVBjt/f37lhjNvfUnebYG4wKWVoP971N+ekkAt0e2Yo+5Vm606kDIoCG4Eh
	 xTGEF+ldDXd6jxQMi9CF0K4z0XWMNJeeAPMp3uV/i7GEWJD2dC0Fdq5/DSql+1/s1Mg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795173858;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=a7JUc6FSH2k9zAtUwLBJoFh7SQyPXZY5+YDsTTwuAe8=;
	b=kctcCvWYH+noZLyiPownTL1pnod93xsgNASL1xgXxwaep3romkWCvuBW/UUFfdU9nlfo
	 DkqZpaAdNVJPD/Xojs1MXjshrxEai7Gz8FR1xfkZkRtroAQpx/29FCTr9tEG1jaDZ8QST
	 3PcBp0Ye6e+zRdS/uQUxS6cjCI3CS1xeYKph06pFbfNZwfODCQbXs8EsP24T8INZfDB5k
	 baZl3rjiWYarDKFdZXAvaagZZvRaaIa8DRjitl/fOjiZKDPUby1KsFW/F5PFRPX/FU11E
	 hENFsoVoc1uleDak9wE7CMLjYTDnlxAT6etes9fTqB0NkJt/PVcKR001z7aQc2bgkUw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=flipper.net;
	spf=pass smtp.mailfrom=flipper.net;
	dkim=pass header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=vVaXFDEg;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.44
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6780C606A326
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 11:24:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6780C606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=vVaXFDEg
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c505186727fso130681866b.3
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 03:24:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795173856; cv=none;
        d=google.com; s=arc-20260327;
        b=NEp1WM4cNwS6CL9jkn7ign1va8bBSd/XmgV8W4l4ff1W3NjZwiGr2PjET1fnhtVk6w
         jp29YXeaFSsalizvt1tmp5aNdYuCHfH+RqHKnJgzuzmNovfvhAvPbCqK55g4nNoLp3lA
         AmraM/7Cs4x7H/IOvrD6l0nO2Gh2ynj72G7TEaL8lz1JxJL2H1oqevugo73Rcz/ASIHf
         Jjr4QSvn832FHwvAx05CUSSDsNFbie2NJ/3mXKDIcMy/MYjjgQ3x7AihZn2XkgUuoi25
         UtTo2xVeTFmzhWGqdZguWTfzGYlTQQe6/IGREz0ddVZluU+17kV2CEOhFH1aAfpWAnis
         87sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=a7JUc6FSH2k9zAtUwLBJoFh7SQyPXZY5+YDsTTwuAe8=;
        fh=+Kn94FVzl6rE7mDhn4pFvEHlRshbQ57dQ5o19v04Oyg=;
        b=jNLHsYTX8Hcgc9VwBQbAH4Q0UNZyejzCru49wiTjRnTbhYW45vBrvnBQ0XSMMme/mZ
         RDjS6GPZjjLCsGPOvyrqclKIIO844ei73gWnRe/zZFdjawKddNODKd2YN7taemAq0ErH
         Qp2lIaAi5/cEXDbTf3mEkDns3JB2L8I9tn8eM/BzX+wreFKUDbhnnIqEE7urO/3XB2VI
         EHf3rP1hWy7KS6y2n/msoyOlYd+YPDO8pIVgb55ctbjQKWyrh56TXu+4+BtdXHIuey6q
         gJJ4qNJdBrc8AhN7VbP0jCf959iDXCIuMLzVKQqCsWtCCtC4gw83E7dQReoIaW4A54p7
         cgkw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1795173856; x=1795778656; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=a7JUc6FSH2k9zAtUwLBJoFh7SQyPXZY5+YDsTTwuAe8=;
        b=vVaXFDEg491PMwZ6UQuCzl03S2R6r191JO6M5MdrqSBlnJN+sjBhNdDo5iDqyHgeJa
         lzTLVOrI4k3bYfmmTkbgyYdWrTZdGYVCaV7JHt8hibmcSaUrvVz8kv5SI45Ywk5Y8Ga+
         tQrxW62BS9aToyTCs3l7+nn3wOSTKhRVkaq0DhXx+Evipy3n5w1E8k5M7O4bIwWlwNkn
         FDQJHk6hjSCvZtZD+Q+ETamhdjTlJSn5LBHjAVa3MTl5krIjvUte5YI3xn5uEjLVcyy9
         IBQ4ub6lmkgoEmK1mpy7HHB0s1PB95ElWbgTTyzipF3SO0PflKpTEy8fYwMozSv0kWer
         9nrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795173856; x=1795778656;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a7JUc6FSH2k9zAtUwLBJoFh7SQyPXZY5+YDsTTwuAe8=;
        b=xfIOpWGivs2pQE7mZEQ7BQ+XTH0A5JGLjxZv6ZlrgB0WuhKpLgcSdbHsUovI+p6V8I
         ui6kDlfTFZ04oP/2CHZNinfYhH1zjZqvit7QKZNKlIS9lYW49FkSNP7mrgkpYxpSrnMd
         XiYZuv96y/e74BIurmNuGoo/UNx8afmTDwH+pHLbPNdTxC9JZn0W9pVYNQA4Phz20ih4
         1TfIxj4m+ICqrlj5jGKUnT8nnlxLJrHzONKzB5/DbOHRChownh+IQv0mIISegijSSOxd
         N7E6smmI92ebQWfzVkaJvJq/1gTQZFMdBmnpKJi4vcUuSYqLhr854EvNt5Spgeqzyk4c
         2pfg==
X-Gm-Message-State: APuU4Z8oO2csWh3qFEvCT+qKPL+TpTUHGpnVj7tdkkPO1IeBgATfvwRI
	4X3IqwwLi+6qB5mBIMXrq1WE55M9jJzPmUAtoNbwFVzJ6yknRlteIY5pLzSTTojSclcmWala8z9
	4ec+Nkx2OW2aB8oUWPrDhovHAQzsJDZWZM7GGk2gIHQ==
X-Gm-Gg: AZFdTZcEexNVwYJi/ZcV3eIykL5u15xdKN0Pf6ECH9yXn7bN5g8k2PbvFKoFVKl0awM
	2ceaEjJ1chVHYX8d3zLzeH+Oi7vLS4hT/rz5tixokXpm+ZeS48OcMgXHOmmhy2ICU49IK1l+qw3
	Z1IqwId6oyVhKojRifZe1g0Jt/CtOxFigdgPWcJqEd5XYx8czWL+DaAt/HV6HEv5nbTX/GlyrRA
	CpdtWCvBpYHTfGnxud3SqGwAjEyynV5uMQ6xBGEMc5AvUyIHYKSXiDqPDltUTbPx3+npvl4Wpmh
	rlHtD7rS8hCY4qxBSK9PGFcjV0WksLrIzt0mIpvUtgyMmu2yFpItFjnm2FHiCnrjc/r0U18kFmL
	1v7Dse/gsdJFKSI9gp/nssEWGUPLtYcdLQCjBcxrqML+2bQDPhp34vkTUkVS6Hp7d83VHGw==
X-Received: by 2002:a17:906:c104:b0:c35:3880:773b with SMTP id
 a640c23a62f3a-c513aadb667mr274279466b.45.1795173855766; Fri, 20 Nov 2026
 03:24:15 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261120-rk3576-phys-v1-0-6382cd14e3dc@flipper.net>
 <20261120-rk3576-phys-v1-2-6382cd14e3dc@flipper.net> <sashiko-outbox-224974@kernel.org>
In-Reply-To: <sashiko-outbox-224974@kernel.org>
From: Alexey Charkov <alchark@flipper.net>
Date: Fri, 20 Nov 2026 15:24:04 +0400
X-Gm-Features: AclHuK8rLoDMmJMGUWxK18rLN7mF-KAPwHPjLrX7VCGqTp-a6L8QOHGvGVNdrK8
Message-ID: <CAKTNdwGF7tFwiq4FK7EZ+mXXq353fRCDMhXKNzGjGDLhaZ34XA@mail.gmail.com>
Subject: Re: [PATCH 2/7] arm64: dts: rockchip: Describe Sige5 Ethernet PHYs by
 their ID
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 20, 2026 at 2:56=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Low] arm64: dts: rockchip: Fixes tag cites board addition instead of
>   63136c6fecf4
> --
>
> commit 5dc14b4c5e3f94d0bf427bf2ff5dad981d4f435e
> Author: Alexey Charkov <alchark@flipper.net>
>
> > arm64: dts: rockchip: Describe Sige5 Ethernet PHYs by their ID
> >
> > Both Sige5 GMACs connect to an RTL8211F PHY (ID 0x001cc916) with its
> > reset line in the PHY node. With only the generic C22 compatible, an OS
> > has to read the PHY ID registers before it can bind a driver, and only
> > that driver releases the reset line. Unless an earlier boot stage has
> > already released it, the PHY stays in reset, never answers on MDIO, and
> > neither Ethernet port comes up. Booting straight from U-Boot SPL in
> > Falcon mode hits exactly that.
> >
> > Name the PHY by its ID, so it binds without the ID read and comes out o=
f
> > reset as it does. Name the node ethernet-phy@1 as well, as the Realtek
> > PHY binding the ID compatible selects requires.
> >
> > Fixes: 40f742b07ab2 ("arm64: dts: rockchip: Add rk3576-armsom-sige5 boa=
rd")
> > Signed-off-by: Alexey Charkov <alchark@flipper.net>
>
> [Severity: Low]
> In 40f742b07ab2 ("arm64: dts: rockchip: Add rk3576-armsom-sige5 board"),
> the PHY reset lines were described via snps,reset-gpio on the gmac0 and
> gmac1 nodes, which stmmac_mdio_reset() deasserts before probing the MDIO
> bus for PHY IDs.  Commit 63136c6fecf4 ("arm64: dts: rockchip: Use standar=
d
> PHY reset properties for RK3576 ArmSoM Sige5") moved those reset lines in=
to
> reset-gpios on rgmii_phy0 and rgmii_phy1 while keeping the generic C22
> compatible.
>
> Should the Fixes tag instead be:
>
>   Fixes: 63136c6fecf4 ("arm64: dts: rockchip: Use standard PHY reset prop=
erties for RK3576 ArmSoM Sige5")

Yes and no. The fix is about the compatible, not about the reset
lines, and the prior behavior of the GMAC node carrying reset lines of
a completely different device was a separate issue altogether. And not
that it matters in practical terms: both commits are post-6.12 and
pre-6.18, so if it gets backported the set of affected stable trees
doesn't change.

Best regards,
Alexey
