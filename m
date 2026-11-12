Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794494807;
	b=YjNeFBAehevBzd4oWOLENS1mfdsiXTcHDmcITL86DxB9bbOVbQapiVTaNBzYILRnaTHD
	 cXWnnDRDGoZdcpJgkuaacyihlusPtpGJozkcR6vSwV7rv0LydNT7hRQVBeBTYpXITj4eI
	 RqaPNb5HyYLyXLtN5R7iXHeUyqCj01OFDhRZyMZMhRajBuaWb4jpprw6uB0Bq2CJHhxN0
	 ENZJ3pGxBZrNrFQdnx2d/KPMK8sA+TBX0VbJOzMYKwLiwVYC4/6Xg/rhr1x9JLmFLrsUG
	 ZAjc5Oaw82VKAIm8ruVJjAr2dR6kZ/0ppLVSYk/fEuh6uK3rY7pk+27SGGJtumYq+3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794494807;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=DeS1JutKTfuhS5q6pNbvmoX+jSrEwDPcQETf0SHwj/c=;
	b=YgKEgfCbKtqOegbpMj++QDF7DtDH5tOg1DUFw7p9eXw0fF+AXo3ONbTy+E0pNBCiLcQO
	 ZP82pHZLCUF8DrZou6SqHtQI/rNZtLpUFFWuJ5Z6953R2ulLV2WhbY0RJ1/+3Lh/08igF
	 xwqvy03cUNzdbSraPOSS3zl6vO7AFruXcRkfGav++xBstgV5kZOBtPqWGJIOAn1ykKPUA
	 wCat1BrnpBneC/A8OPhGZH8B8nvXIut0L+ywP2vAadyzOUTJco9GOxBBcmGfmq00Y9h9/
	 5OHCL5sGAvSIjPkufdzbZ0rDu3xXFxY/hdl+7fk1qYVFB9cuvyW60cHOzQnvRy1yfxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.221.180
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 893CD606A327
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 14:46:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 893CD606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-5ee1e4e3abcso559494e0c.1
        for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 06:46:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794494805; x=1795099605;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DeS1JutKTfuhS5q6pNbvmoX+jSrEwDPcQETf0SHwj/c=;
        b=HoPcCgrxZCl7J48K9PHGW1AJ8ariHqaPtD/UEjh88xCP4hrBrwBGktiaCG/bgj7v/B
         uvoF0tzywp7gV1GgNTVWKhyt0mINJ3CzVtRf1SUSk6ArQidwE5TWZXKVh0LJNoTU3JCz
         rg+cP770nyEWrIuRSX2NxTFpKdny14/YhxCy2P9JKGs6guXJy4AAeaMDwa6O9G6ZTDVz
         tYV1+Lknw/8Hgc0ImcELXzk4a9AsRpgLqt903yZtVdNN7xhqRPgXiIh9BFAQoK1j4q5W
         mwI3fG70tOovrf+KMWIzXJiWhZ0RPjixJ4FTARlgqx222ZLcWSNCCPnHVBi/kJt33HpR
         VmoA==
X-Forwarded-Encrypted: i=1; AL+hErEXT1gKyAnmkO5UKqn1354/RrV3ILm6DXFP7At7tdmMY9mPkcqcKtRO2qL6QJlNf+7pFvVrXbwVh06g@vger.kernel.org
X-Gm-Message-State: APuU4Z9fY5xxuyMD+zHVp8Y9PTZoebc1ALrVYvjqJK5dnsG75+nfnSmD
	cVBXlRvZgaLIBeGJ7mVdSncwG70rwYz+C72MwKAuT47sep4artBT0z5nsbBLJqA/YD4=
X-Gm-Gg: AYBFou1y3dZ7YuMvblr2/MvRe6mG65K7xg5sBUU7Uy4IKs0ZIUpOd/6PgP4kwI+RfRS
	tq8tXxRJ66cA6Wu8Cf/moZ9fH8pqsK61ZWfUjyqluF+yz+7akXy/CzTe6Bxw5GoTckSk6N1XP4s
	x0oC6lFnpTqeanL13VK3CFWx+lA+tjPb4cYAEdidK9Nw4VoZWwbtFEQJa5lLJg2kQanYODrw3zH
	Zm41QMeun+MZ11vV8eYc3sorglAUlhsiPrGw6UFkdT8FwLJlNbrvj20AjCqmtPDbYryeMUYN2rV
	9qQ+w6R2LFnBScYE7MXeER/Nf6jW5Y0HgsrcjCGfuVWIkS4lcatx3xCDbLoGqGP6BujzkIepDIu
	MmzIaqOK5+ivfT1fm7MdfaDPGRikPLmgR9QH3nxWoK9ogBuSeAww6v0x8nXqFsD9Vp8y06sz1z/
	fvfc5ZgnQiHwnODLXh2ZGTPeYBFhkMbdDvn1xIpUFoH3peBOTQ3UBFbelU3jJVzw3YR31IKrGqm
	+Vj+ahxok9PDdXVLc0yEXrkKvl2hWcJ9KxTgTvfC56P2uJCQGDCtKgnJPw3h65oV5rOkrNEk0S4
	5/9uz/IXWIio3+OaiF5FjdTTByzUBmVEqDx3Wpq2jnyHofuf971QcN75kJWotmdQSct0YUI=
X-Received: by 2002:a05:6123:133:b0:5ea:b1f5:a657 with SMTP id 71dfb90a1353d-5ee1c3f5279mr1985786e0c.7.1794494805435;
        Thu, 12 Nov 2026 06:46:45 -0800 (PST)
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com. [209.85.221.181])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ee3245d4a2sm58072e0c.10.2026.11.12.06.46.45
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 06:46:45 -0800 (PST)
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-5ecde8e8e5bso1301947e0c.2
        for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 06:46:45 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErF14hC5bALz0ptpDTdYoYWo61pR9WQ4prg2ITOGF/YtZFcaP+Xzkhd8H7gAEvHpcXxybk6vrNozURWs@vger.kernel.org
X-Received: by 2002:a05:6122:398e:b0:5ce:d56f:efac with SMTP id
 71dfb90a1353d-5ee1c4995fdmr2096272e0c.21.1794494805148; Thu, 12 Nov 2026
 06:46:45 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261109-epaul-v7-3-rc1-x5h-vsp-fcp-v4-0-1b2072e8c37e@ideasonboard.com>
 <20261109-epaul-v7-3-rc1-x5h-vsp-fcp-v4-3-1b2072e8c37e@ideasonboard.com>
In-Reply-To: <20261109-epaul-v7-3-rc1-x5h-vsp-fcp-v4-3-1b2072e8c37e@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 12 Nov 2026 15:46:34 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVKr2fGN3k0LYHhoFp3Rp7_=KfTB6tQkGYDof0Em0HVtA@mail.gmail.com>
X-Gm-Features: AclHuK-vYdrIZUHe9zqdC5qY90reiPN1Oa4nwuum4GsEnnZB7I1s1LzmhCydy1o
Message-ID: <CAMuHMdVKr2fGN3k0LYHhoFp3Rp7_=KfTB6tQkGYDof0Em0HVtA@mail.gmail.com>
Subject: Re: [PATCH v4 03/13] arm64: renesas: r8a78000: Add FCPV[BI] nodes
To: Paul Elder <paul.elder+renesas@ideasonboard.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Ulf Hansson <ulfh@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-media@vger.kernel.org, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"

Hi Paul,

On Mon, 9 Nov 2026 at 14:35, Paul Elder
<paul.elder+renesas@ideasonboard.com> wrote:
> Add DT nodes for the FCPVB and FCPVI IP cores in the R-Car X5H SoC.
>
> Use the SGD1 clock as it is likely to be the clock used for data flow.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Signed-off-by: Paul Elder <paul.elder+renesas@ideasonboard.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Tested-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/r8a78000.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a78000.dtsi
> @@ -1574,6 +1574,78 @@ mdlc_aon: system-controller@c1338000 {
>                         bootph-all;
>                 };
>
> +               fcpvi0: fcp@c5030000 {

Please preserve sort order:
  1. Sort by unit address,
  2. Keep similar nodes together.

> +               fcpvb0: fcp@c5038000 {

Do you want to sort the FCPs within the FCP group by unit address,
or by label?

For the contents of the nodes:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
