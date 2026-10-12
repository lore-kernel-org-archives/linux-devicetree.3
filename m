Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69CFD4BA1CE
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 17:43:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791827037; cv=pass; b=AQkzbehsT2VWzin8NQ7r3oyvpKDNw7HvQ1yLKPP4iMBpjXko8LAXrHxdydHg/vfqdth5vSuOI2AJqDcT+r6IemehsZzVQyDsPxQxdBZZV9/qzYmSZ+BmP/uYTj4+91TG10KPeeL+/LSXyi4xI6XrBd2tyzErgebQdUw133dkp3M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791827037; c=relaxed/simple;
	bh=aQmNTGROGdvgxfWPGJ1OogqSDxU0dKMs1Ijyj+pgCT8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WdTFgUtBzNlpvuA6KhsK9vbFuTDyu4VD7EGXer85AoX+ribOBnoFO/EMAD4VCV+8vX+1iGKYjgwHIvnoY23TOMYW0mcyH5hJVfuCB1O9w6lTjs0XIhJupxmTe7Vv3j5F81soJZrrY4ZoCH2SV/PIrWCyW/Wyu2sjJZ9Cg0HbW7o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LcUJw6yw; arc=pass smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LcUJw6yw"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6ab006eb282so2670413a12.0
        for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 10:43:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791827035; cv=none;
        d=google.com; s=arc-20260327;
        b=Td3pKJpdbc2ePtrIBvGM1zCQGSboqdPNu8kRgdEcsHoHA9ibFBvaG/hl2WkIgAaV2t
         1Dieyif6pq9jWuLRrZeY59Xzs++CBVZslynW8PmgzMDvqwHihIWCexqgFEtolgQQ4S4S
         U/3LlBbma5yDk9RuJ9VsDGqVHhb9HLPoWJ9kYiUkkz54YQN8lz1J4gqgXIC1etWI9MLL
         iANTXwRBEDo7QGVQZv+i7wc/q6gHMaT0X/1z1onnokPVqKbXZkh88oYKoqTE43bHeLq0
         5YdGZxD3wl9xu/RwrkRcv2MP7ocXQBWI1g2lzTCy7DdBqMPZptqISFOgxyal/B1bi2gb
         zdpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=aQmNTGROGdvgxfWPGJ1OogqSDxU0dKMs1Ijyj+pgCT8=;
        fh=rEUvdBppOKK5QMseA8k9+t5Zj20Jh+Yd8JTuiryLq/U=;
        b=MFX+pc9+3KJNi3e4qcviHPpx3SE0DOwolXA7a/Tb8m62R0YtZ0m+Y0UavFRyqwOtlE
         kwnWdhQl/2Hb46xXj8VSJ+ShVPbXbvn03fw/2tFPmAjSL9AjMOeOiZ4gTf54ec+OC4Kv
         ffLuIpP85CxROf3HQkfWTKFKI6kNag++krzOI2KWkSGBG+rMm43bulQsuK7py9iS3wVd
         1fULZdGiMiTT0QsDw6cSaOeQrCRjF9mxW4npIkTGw0FsdEAQsRMtMAlKd5390f4Fw+wX
         u58Aw/tyA0CHSS/YjydRrqox80BKxKHa3Hnkz6i/i2pPTv3nQZVB173RzhZS+2inRW6l
         aPrg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791827035; x=1792431835; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aQmNTGROGdvgxfWPGJ1OogqSDxU0dKMs1Ijyj+pgCT8=;
        b=LcUJw6ywaXUWSFgVNr+iY2X2x4fSEganZoXN8lnsLbPnDIfcrnq8RssjOOLYNl6inQ
         NL8TQ8trVRYn16xSZxIdiMBSmsVF1jLCYujuN50LBbYbr8JYBEBai2WC/RbrFE9f8kid
         Q24bNAXe83QZExOOpuBgJh4U0TKqWLYZ2tUB0ccJ26yU9h37dzut/Nk631b0lK/a4gNf
         Y/5E6O6/zBFvtgUN2n/cqFXpgAe4cGvox4MrCuHKQK+lgnajjRzuiBpaL5M2A2GAYJZg
         hgW8kzSkBS805Ns/b8YBJLLllzKzUSvOdsmmyoGHyjZSgAteDy3TwCM8Sb+EDJ1YUwea
         arlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791827035; x=1792431835;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=aQmNTGROGdvgxfWPGJ1OogqSDxU0dKMs1Ijyj+pgCT8=;
        b=Id71bsAfkd4SXlmiZL/Z0qljxIFCezUXBuE82bUDEemIcEz5uuvDwfO79OL2AqXfhJ
         sECab9+Nc9cRTr33utf5wMvFjqnCM9LzHy6O/nni51/paTTp2zSmq7vLO7JT00sfj2rK
         aRYfzQvLW0fWDuFGc5BvB+rOveddJOvYn9Hm/a3POBff7mOB2SVt6jsY/MnzfZnbw4Dd
         073h+pY/Q+2RGXuIT5md/qeQvmrY0y/9JuKapo4W8z3wXouQdFOJXEByAMF1QhRkoT0H
         kBu5OIShVJelRk+uF0hVRmvrv/Yalzqq5nU9LgVj5tFOfFef/BCiCISSabfQ7LmEI26S
         rAkg==
X-Forwarded-Encrypted: i=1; AKwUvByCQI8OblRRaq0bZvo23zkIdrl37Kf75v5/KCJ+N8tzauK5LBJ2KJbljY41c549exTZs+ifd0CR1HEC@vger.kernel.org
X-Gm-Message-State: AFq9FYLr4YMDOTkMIF1DD/pBAeoAVZQhWgaNHh6KyTTPf137dWl9e6Ke
	lEWhUPO19uxZsPMt/9bVasB4Rm0HYNK44e0WSFUdE1Umi5ZCwEN0M98Qol1srmYEsDWEz5PqE6k
	vLUh8dhSFKHqryFjVmi7DPe6c+TZ00B4=
X-Gm-Gg: AYBFou3+lC6xkNnfUproUXKXpd0eYMwDKv/NG8th7lxVYu9teLRKYoX1RGHN/QAUh20
	8w4HHmWxtgSruHQPwqCMARBCdeDpBXYbdkyKRIJBhxnJl0X94boNcVAXzsHMB8AVozvK0cRt4Lq
	REEjYdPdGsT0P9bBHauDb0mcJqz8jvQACuynhProQipzqjZTs5oCVhz5FlHgp2oyls1gD4U4kTU
	nqCMcnyRCzCeYtuSQrshSkfaZFAaE+fxsTNi9OdQuRtGejpsaiijyws1JVKuNdXH2GrKz0GIJ/i
	WkdLbqVRdf9mG/D25TYQwDblywXq8FtLYUXwh6zQJKX5m51XAe3kXw==
X-Received: by 2002:a05:6402:4341:b0:6ac:8761:17a1 with SMTP id
 4fb4d7f45d1cf-6b17c27a7famr8072014a12.36.1791827034421; Mon, 12 Oct 2026
 10:43:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261010115539.9237-1-l.scorcia@gmail.com> <20261010115539.9237-2-l.scorcia@gmail.com>
 <20261012-quirky-emu-of-renovation-c217dc@quoll>
In-Reply-To: <20261012-quirky-emu-of-renovation-c217dc@quoll>
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Date: Mon, 12 Oct 2026 19:43:42 +0200
X-Gm-Features: AclHuK-aSGZTx-4HZF0vtpTq6BBo_BN-ay9Tv6iz0b611lBgirjVShAwSUrYMCA
Message-ID: <CAORyz2KgX-7=gfax06+Pb5SFq4dVTtcTY2pbH+FDCRNZ+AVXOA@mail.gmail.com>
Subject: Re: [PATCH 1/7] dt-bindings: mediatek: hdmi-phy: Add compatible for mt8167
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-mediatek@lists.infradead.org, 
	Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, Chen-Yu Tsai <wenst@chromium.org>, 
	Fabien Parent <fparent@baylibre.com>, CK Hu <ck.hu@mediatek.com>, 
	chunhui dai <chunhui.dai@mediatek.com>, linux-arm-kernel@lists.infradead.org, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"

> Why do you have flexible clocks?

Hi, I'm sorry but I need a little help in understanding your comment.
If you meant "Why isn't there a constraint on the clocks' names", it
is already provided by the existing conditional block [1].

If you meant "Why does clock-output-names have only the maxItems
number and does not specify the clock name", it was there before [2].
It could probably be added back with another conditional expression.
If you meant something else entirely I apologize and would appreciate
some additional guidance.

Thank you,
Luca

[1] https://github.com/torvalds/linux/blob/master/Documentation/devicetree/bindings/phy/mediatek%2Chdmi-phy.yaml#L90-L102
[2] https://lore.kernel.org/all/20251217-mtk-genio-evk-hdmi-support-v2-1-a994976bb39a@collabora.com/
