Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795698624;
	b=w10b8DGZGei+l3MpF4oDmNvgYX5BQ6fiS9kYOH9TWpf/qQ/jlTDF1SzlIGRia/4FhwsF
	 rQ7cIu9bOzoz89PZU6tLvRoZ57lozqNsHXQr8Ikjv/MAUfSYzWcLytaHmP8V41mt8nFZl
	 eLv7L1CbIhOff6nfqEaEQcVeG+1TgiSuRpi3+959XYnGHPpE0XMoyEml+6srL8pUJn/Hp
	 OPyNQUkybww48rkvX/yENSUmgg3DNy9e8ekcBuHCx0w3ZjgdZFRQDzonrW9596SvjL94V
	 HX5VGHYKCLt2TXumm1raQfw3L6NwvvptktGBkT9ZFVEaPXbxAMW5ygMHTdZ12zxT4xg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795698624;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=z5gsJ+BDz+8hzJBQw/xAOysO2V3ppLgl3lpNGd2ZXi4=;
	b=QDennWKJ/O4ohs8Tr0KO7wPxRRFLzJ+yhG2o1aZLzvobvw7YowBADmEyjC7R+bRVEWOp
	 BU9pvftVTHKgKmsQ8aV96w6RGufnR/T1Ch+O70UhdR5C5qv0DYh3iS+GF89IcppHoFFPT
	 5gjL5TYwwTlnA5hw9c0xW2SpnvqvT4AePnYG+8by9IlmlxGE009PAv5o8MKZVVYVnd72+
	 4RlRqm8x5XKX+z4fc7hwXkkjG/gtUYclan1eMJQhu2VpjqZ/MPO7CchP3JKX2OmqE2rfS
	 ug0vQb+ie2BmhY+kQDSC62fj4Jf2buPSFVOCeL7iKw2HTLig6krcQMBXMOEbB+Mxf5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.221.177
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47F1A606A31E
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 13:10:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47F1A606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-5ee3e658c72so3938438e0c.1
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 05:10:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795698623; x=1796303423;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=z5gsJ+BDz+8hzJBQw/xAOysO2V3ppLgl3lpNGd2ZXi4=;
        b=CTeigCa9cbOe49ttq1J2QLE7yipdChfTa9o3Q4O54p/96PeuIp7UVCKKJAnWJ0XG4e
         JbkLzLy0JARP9lvm2BnfLptF1+/tNYdYVS6UGC47FP1gOPr+LRkLe84Ir3zhGxuKSMhd
         Loz4y30xJjPazIIzeY4xekd7BPQAaNVZjuBtRe5i2yTeOlGzKsRmQQHwMEk+D4hYwMLT
         2pvH84nTKlLYSL13d6LziRkNa+y3jM8srKwlroLHAt/+A8THlWUvwB890Mh58rDorXYD
         ry3N0WYIxzu5bikJkbVvOPA8HBLp073sQsCEB6HsReD99TDfyRNWhiQuWicLD2bpbTgB
         K+dA==
X-Forwarded-Encrypted: i=1; AL+hErHPCbluLjMfUoZGEF7AkiiC0OUQPOGwczgeBZo1Pi3+gdPe5QHi2c+nCoH+QagKQEv1qudFfanU6jlC@vger.kernel.org
X-Gm-Message-State: APuU4Z9CSJYQHnraYOqmeYm41c3NfcgLGizIkIiZtRyizdwR/nNlrSBs
	9mBhmpUURB7n8z+Jv2YQW96IcMvocp8KV8w43aWb6IU/T4TsIuk9456TJaPyD3oA
X-Gm-Gg: AZFdTZdeZW/JTomWMskmU/haM8GP+eIE7y86QCx2njoWVL9hvhM9PAsrbfD4BPBaRMF
	/NR7F/+MdxnrNBQpRLPlqYyQUVBfxVwQFGzabaN9oArkOAC5oUiS0MKqR35cWqdA/gfUHkcFXYB
	ysP1+TLo7w16axuwdDFnlsff6OOpsZQlf9YUvqP4DiB7ztbw7iKc0w5+vugVZAuCCeILrsKgZEy
	jL/NHzhajfrH1KZrcA0zC5+wIFJYt6lTk8fKEgfSO2GkRSlYkzXL/8DXr/KmUApITIfo229+4nK
	32pAHOTCYoNYewiviSooAMwifLMZDffPXsNGuNfs1FjISVCjn0udCNr/LQMllpI5L0D44uIO4eC
	fT5UVPenuNRU+I9ICRIRoN8hA1qYHD2pj//WPnmlZrggH9lPKMaOXwUFOVxO5ejqNrgqwGGLE6h
	zSUHtrUQyR37M3aPJq4gfvkAyzZN88RKvA7lwwQ24jJ50GLd/yptappyofuiPlvJd5yswpgTCoD
	qepocKr1ZfQV04qh6IFmkzsmfE43norqwe5omewnRkOwOwMIcrvbgxdZlMWXF+Z6iinD98RKf1o
	xjNzMtlCLfaAPA9zEBWszs/mDNJgv6qMN025rrtXVPo7qAc3V1lyAlbVVdvfgOU8FbWGRzR7DZ+
	ySXhcjq02GKzbKooZ
X-Received: by 2002:a05:6122:1823:b0:5ec:3e18:a8fa with SMTP id 71dfb90a1353d-5ee8af737e8mr13155840e0c.20.1795698623197;
        Thu, 26 Nov 2026 05:10:23 -0800 (PST)
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com. [209.85.221.181])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ee8b5cd7c8sm20725438e0c.11.2026.11.26.05.10.22
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 05:10:22 -0800 (PST)
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-5ee3a3d281fso4454527e0c.3
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 05:10:22 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHkhNHjHk3i59Uy0IZ5uv0t/7o4zNRvv45eAP2iDEpk9onH/+MPm6N3tGDYZNafCth/n9o2KwSVKA0b@vger.kernel.org
X-Received: by 2002:a05:6122:e16c:b0:5ea:bfe3:6035 with SMTP id
 71dfb90a1353d-5ee8aecb450mr12500493e0c.8.1795698622003; Thu, 26 Nov 2026
 05:10:22 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261020031049.969895-1-den@valinux.co.jp> <20261020031049.969895-17-den@valinux.co.jp>
In-Reply-To: <20261020031049.969895-17-den@valinux.co.jp>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 26 Nov 2026 14:10:09 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVpV=FLZG6iiNMj8Mq39RQ3u8JxKyTVws7J0O9Y__2EqA@mail.gmail.com>
X-Gm-Features: Aa3M54rTYSp7n6mDEivRvXB3zz9tm8FUTty6In8Jlz7Pqa2lf3sYsYsJuOUeaRc
Message-ID: <CAMuHMdVpV=FLZG6iiNMj8Mq39RQ3u8JxKyTVws7J0O9Y__2EqA@mail.gmail.com>
Subject: Re: [PATCH v5 16/17] arm64: dts: renesas: r8a779g0: Describe the PCIe
 AER interrupts
To: Koichiro Den <den@valinux.co.jp>
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Shawn Lin <Shawn.lin@rock-chips.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Jingoo Han <jingoohan1@gmail.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Frank Li <Frank.Li@nxp.com>, 
	Niklas Cassel <cassel@kernel.org>, Wilfred Mallawa <wilfred.mallawa@wdc.com>, 
	Serge Semin <fancer.lancer@gmail.com>, linux-pci@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 20 Oct 2026 at 05:11, Koichiro Den <den@valinux.co.jp> wrote:
> The PCIe controllers report Root Port AER notifications through SPI 454
> and SPI 461, respectively, separately from the integrated MSI receiver
> interrupts. Describe these interrupts with the "aer" name so the
> controller driver can use them for Root Port error reporting.
>
> Append the new interrupts to preserve the existing interrupt indices.
>
> Suggested-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> Reviewed-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> Signed-off-by: Koichiro Den <den@valinux.co.jp>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.5.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
