Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42F5538237B
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 16:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779897790; cv=none; b=U/zG9lbd8+je+hKFLpfBSbRzeX4zyjEFYOmX739Ux5PUVi9/1Ae9U+yaNtpcxQb26r/RYnoj2GXdiMytsQrZs3qISeCLRBuA90JbCr3wv5sX6i2KEsYWJu+byQUF6p/plN0n+/ZsbUF+Dk4oiJHAhsoDkF9AdGSBp9jzZRkQdU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779897790; c=relaxed/simple;
	bh=PdnwddvyWIarHDQaUbeQPvHrwPNXjHSw1fY7F092KIk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Gsp+aKH9vLe0yxn2XiEiaYq1EewVX37HrClDhyHMzo9xPmhGop/DZVrTPqHl/OKVeBTJdFnmGucm2IkkLGK+OyBA7y6+3eHbUgecbsPbXm3jWJqTP8sotAP/vz/mWAugiXIz9ec9yS0l3byXh6D0wUWFvW6OHGuLUraWIsEwylM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-95699e8e26aso3969746241.0
        for <devicetree@vger.kernel.org>; Wed, 27 May 2026 09:03:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779897788; x=1780502588;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dAaNLENh575JywEtLAJ71L7KgO/CYiuJ4uJtK5tYZkU=;
        b=d1bcfI7y1mfGKc0QZjLCFOZ4T1NW9tQIepjpNW1iYrk1P7OgCwflIKokLsyVKQkCMN
         oCas9Cyyphr+/zWPzzmvUFzrmutGXSkWPuFUvf2PViw85yqGRRwBk17wKfAidXGddMSM
         /iw8OwWBqggWARIBhMkgyz55dexu4b9QAqvEqQMFR0s7KBjLyYKH053E42W53atWcUFZ
         rUM4teETPirgolLO4/93nG1MV5iRFFSJp+Pz84XRgfi/8mU5dVhdqd+/v0duNiDDKy+E
         E5UjRxh5GtL3OGPW8A5jV9kjHPqDXEnrro9UvZcGJLb8RgvCRqnXjH4IHIokjMaQ03uQ
         FXrg==
X-Forwarded-Encrypted: i=1; AFNElJ+jTZEdKXJ4uIaDpjYARPBu2EwMnKH0n5JGsaiqqcxickVl5WQAMCKxXBU6T0AgpbAFUYM5ZF9CbcXi@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1YvWmdjXtawZAiIFKSxblJrSYk9Pl9Q6HCyJTOgyn9uMFtpuI
	g8NSQI5JZ5gBzqdve608N0ZosetHK7zIgpWDvvc++x/2EXW2a7miFAPdbwPxfsU/DCs=
X-Gm-Gg: Acq92OF3kKkFZK4VZdMhuegtzF46fDTe/Zb6jSjygJPRwx0JI0Wp/+qW+cPIrmd6ABA
	1kPlzBBv8HtQZklQfnGHF1rtnbr4wGUSGx9yT0tgUvz+CZPGrKSNFhOToAGda5NX7SIlB9PsbcQ
	ZGVVN1bjXPUHizP+yIRnukqaAKBlSu4Q3PqXcp+iU9h7swNPKMlUMFWmfRNgdoWMKqiov/mfd41
	ljsxEzd85MKBLmw0YMgfQ9gjSojzba4gRM99ikfx0aXDtRq4sRJAj7cr67jG546Z1i1yn/wxsmY
	Bh7sdLn5mPZ4OHFB0hG9zBuliIteBC7Psjr2bpoSs4K9Y+mBJGAAWfyUIMyTiNUsiZ+YybjagPj
	gKPCokB93KF9bciru+t5/priSxsWQyH93xlozgB7ugQcDMBNWHqLrN2xWLFqIzhfbNPzakccNqz
	A97+34HN+FRmEsbvI37QEfsXu3wCtfb9HhozIL6PuFvwyv0W5zdNfi24MJJvEpM+B9iRRc6WsRh
	1o=
X-Received: by 2002:a05:6122:c88:b0:56c:d34e:bb1a with SMTP id 71dfb90a1353d-5865ef6636emr12013344e0c.4.1779897787953;
        Wed, 27 May 2026 09:03:07 -0700 (PDT)
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com. [209.85.221.182])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-586f37281e7sm20735404e0c.7.2026.05.27.09.03.05
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 May 2026 09:03:06 -0700 (PDT)
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-5753a289955so4127225e0c.2
        for <devicetree@vger.kernel.org>; Wed, 27 May 2026 09:03:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/XcSoJ7TpjOFjoqvfy5lSpqPG6wZb1RC9QrPUzqTXj5JF+JVeuHSjIe5nyHWyppYrBbCTZxDtOmBbG@vger.kernel.org
X-Received: by 2002:a05:6123:64:b0:56e:f876:5626 with SMTP id
 71dfb90a1353d-5865fc02fc9mr11570394e0c.5.1779897785220; Wed, 27 May 2026
 09:03:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260505123708.134069-1-biju.das.jz@bp.renesas.com> <20260505123708.134069-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260505123708.134069-3-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 27 May 2026 18:02:54 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXsMqVd2qt43hTD0Umt_dp50-yx-kH3126599eNwzfbmw@mail.gmail.com>
X-Gm-Features: AVHnY4KZgFHip0uxha3AkuoFhevCBIRNlRrLf8N0236y4Jx9cgWcXOHqi2SlBso
Message-ID: <CAMuHMdXsMqVd2qt43hTD0Umt_dp50-yx-kH3126599eNwzfbmw@mail.gmail.com>
Subject: Re: [PATCH 2/5] arm64: dts: renesas: r9a08g046: Add SSI support
To: Biju <biju.das.au@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 5 May 2026 at 14:37, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Add SSI{0,1,2,3} nodes to RZ/G3L SoC DTSI.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
