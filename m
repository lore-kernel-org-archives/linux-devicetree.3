Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795052160;
	b=Wh66vmVAFq+4eoz2OGY8wVVNlUpq6+luP0pKeFJyjvM39aLeIXMwIeaTxgwitGs1CBOl
	 GbGRzn7oYX0q8zYL4EGQ6vkRPLnwTWrbD4N5uNVgcPhFZhRKx9aV1jh4Xez31ufLdKC3k
	 PbXKjjpFeHR/sdKxQpkIZqeM3Bzar3GQlfpGKhvauwJNED/krjLRTQfx3d5EuhqjntCJD
	 +KDnnIeXIqX6HywxfBtOz8ZjyEvXBe79QKwL9axRGEQtUw2PrHXrQ3qB5O2w63L+28wPY
	 zd2i/0Nlwm/j4kDoCW+C/P1rNNjNQYItKW1T7hdlw4y4+nJ8aWoZh4J8phmo4GN+zeQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795052160;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=WaRyxnVWPqgnXOf76Bo8+FkIIWslu9CLgRdA1TVjs0A=;
	b=gglD6i4UHGx//hExf14YBQL7XQwsMuKg9RSkJKlSU5dLC0tXAhfqweJVxirQ93ygjKIA
	 KPVnjQEoHXC3JooFv88cMUt3uipT9D8tsEk6awkX+ejOYbizxkfuc7hZnd4JeqXQ2mVp7
	 71tG/AzKvrPRKph2J1yrcXjbdkFSdIMkvgYdQ7Hlqnyc7Hz8OV4JZUhlo+aarzMUORe5T
	 zHZsNjgpUsulcqqs0kLw+VSM0Gu+zT3Fk3Kzs2xLNlGKJm19Ncoiyey9185Vq1RPUwJlZ
	 oM19K0P/g6fcHv7o2yKs29nbkO4kRNEVEVmGOmCy0n5enfr9mCuT3G9C+Qb7j7vQ4ZA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yeFJt7dv;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.44
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32803606A320
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 01:36:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 32803606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yeFJt7dv
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c506187deb9so28653766b.2
        for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 17:35:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795052158; cv=none;
        d=google.com; s=arc-20260327;
        b=bVjQoXIGIdP9TDoAPfILHY1FpKifWL6OQBpV3MKj7DU1IM+Q2JdENyfHGwplS4+QXC
         FW2/FkgucuTCxvRF0MjKGutDtaBESxCiCKlQfLjpar6/V2J6uHtvkRix1Hm/OnIuwavt
         mwFJqwO/5vDn+CmwM/eONlRqdTZc/YBbNphIp3T5hoCKor+WBvWM7SLFflmT4IliF0XQ
         ko12EWaUXu3LU030tHXevkoOGuRpvVH3uLgdi5rly3yz2kREMmHF+Z+3eFRrWcu0CG/o
         Sae8ORiblBqzDKqSpG2rFH/1qo781QSQnHSdA0N1aJksOC8ocrmj11PDCnUa1F/jodu7
         HNHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=WaRyxnVWPqgnXOf76Bo8+FkIIWslu9CLgRdA1TVjs0A=;
        fh=dqXUGkJOK9cM/zE2Zl7WitZL9YSXdLo7frXL4TuiR9Q=;
        b=NOezUQrXNHJPG+krPIZohTu40hf/vekr7TTmCHf+j0gXXAkYeNO8NwKOCM3lETWPYF
         a8OqJ7oDW95YabWmvkczDA6QEhG13a7V7ce5V9xpzyFf+kXNY+IaBS5/3d7+3Jh99U3j
         DNfpgUJRyaSS3ayISj4UKSazCOlFHo3WBVhqbpbCllSan08sfks6h8Eoi3DaxHRMbSbK
         5xaxh0Sncb82BTiqiUeM4tJAhnUsWEEerXntuZxGzP6i626ksQLvHkxE2xGHpNAg833H
         KyZjnWNZ/Er5TsGuOIRl+2CXNDJmQl2swkw/aIS/7MGDlYtfVx5HH0+Cl/88JgbEEXZ7
         CJQg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795052158; x=1795656958; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WaRyxnVWPqgnXOf76Bo8+FkIIWslu9CLgRdA1TVjs0A=;
        b=yeFJt7dvWaL413aWlclNOd/3+LyJv0jdD4XrFH+3E2i1f9jziTwG5Yzc8/FoEnWg/N
         4Rnz6On30LWArDa515jUNCUFk60ZYuph8EOPMgl8f5WcqZZFC02GwEWolyQTxbgYe8em
         cky7zAOvWN4z6qnMu0qQ+4dHv6OMRSRHHEMgUFl8CSWt76SRs21NIiBe69JTbaX3W/wl
         Wc44glX9JFNE2//bAAYrA3MiL9Wl5qeI+h9ifjxK044dDrTkV1xTp59dMqK7JogFY0gw
         LgJiM5qBj0kOiNyEToISg476O7cilbu79WMH/joTtoizntd39Vd4P74dEy2tXyagZuDL
         LkFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795052158; x=1795656958;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WaRyxnVWPqgnXOf76Bo8+FkIIWslu9CLgRdA1TVjs0A=;
        b=2wxQAt3bgMMz9PPYFTx05TY40L2j44TvnVPA4LcLH9jjHSTAMLmjh3ApSnhCcB6nFn
         gS0kUJmNXYyHhIR8Bjt7plctyap4IRB/6IOpEIUq/YEax1p11LGWmM5ezLNClD3EzHDp
         e9xsl/Br0HpHowQyzxSdU2LmXRYkfKeZcbwqSW3nLFTCeCe10+AszlvZsZ0WrrIen5d1
         +KTHSeLJn03JY0smI0LxPGK9du6nVzDFVor09wvBHMQMJJRKH7919nw3Hk94/DwKtSMR
         L2qgZQQVcRc8oai1PaZfzuXcnTADFb8eENQ9vUcRbqRFDITylMeFZ6JL9yURNSHuhJWi
         YO4Q==
X-Forwarded-Encrypted: i=1; AL+hErF6mq7qH21yOWGObnktxFBnjoqx1ymd8odNSIev5xjD9qPPsm2WEl8b72yAKMgyaovfWxB/R0H0zQz+@vger.kernel.org
X-Gm-Message-State: APuU4Z/JD7uqe5shLpKtAG1P3pdAZoWJ2oRH3p4D5moyAOqFeMiHmKzE
	d4IWZ6cKByaTJ13OaI1HrcRdVPB7ID1n9xONLjD3op7/uqbUAucnRVKUSGGrwGsAU99DahFzGS0
	qsSAgjkrSJSJQURDoMiNTZ0ntS0z72Ik=
X-Gm-Gg: AYBFou0j+MWbg7UAxJlUKgdDIaibDdsRmQ72T8QamaAG8YTdT/x2ZbRS0esHtuxzNyh
	3DuqGVIysfpeUp1bvaKduk3Dgu4zeM1yPmdSBhAY93PuSr5fs9UAjVLA5zUzhHp2dpCTsHXb0dv
	Al98PfmSIcbm3ZWIuG9Qe9gUjQE1dUEcL8EX8khZZC31hSvcuHCOxrwnSIX/MyqL4nXDnoKAzSq
	37OxbMfSFSQGdhH38wTJzOieTjVXoYtksQHRs4QCuKgkFQUJHdGd4CcsqgzlHptSMhe6goXt6su
	kwy8rcGAn/Xx+V4WFlVehN82JoiyuLMzfVtTK81tBmCXGF4OGnWM4Vn8D2lcRMZdbIElEU8QaEG
	GG4uhquH2VHTcXvuM/NGlctWZaObuOcWdHevXKv604tyug6UyqF9H0VtrtrfrB3oVFTfFaG4=
X-Received: by 2002:a05:6402:446:b0:6b4:2960:d381 with SMTP id
 4fb4d7f45d1cf-6b887a7ca45mr3534756a12.1.1795052158003; Wed, 18 Nov 2026
 17:35:58 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261118-dcphy-rx-v1-v7-0-8de1adac3a74@gmail.com>
 <20261118-dcphy-rx-v1-v7-2-8de1adac3a74@gmail.com> <3a9e999f-5ff5-422c-aa65-b8560dca84bc@kernel.org>
In-Reply-To: <3a9e999f-5ff5-422c-aa65-b8560dca84bc@kernel.org>
From: =?UTF-8?B?5qWK5pm65oiQ?= <jason98166@gmail.com>
Date: Thu, 19 Nov 2026 09:35:46 +0800
X-Gm-Features: AclHuK8yzTD5Ny6Jae8xfaKIWU82OgGlGfteSTdmbBGr1nUYx7XM082OBv9L5nk
Message-ID: <CAPwA33KcMNnyBEeWkheaEQYUp8FhR+xOdrfv2CAEhG+YuAV2Vw@mail.gmail.com>
Subject: Re: [PATCH v7 2/9] dt-bindings: phy: rockchip,rk3588-mipi-dcphy:
 Select TX or RX, add phy-type
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Guochun Huang <hero.huang@rock-chips.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Michael Riesch <michael.riesch@collabora.com>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, 
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Quentin Schulz <quentin.schulz@cherry.de>
Content-Type: text/plain; charset="UTF-8"

On 11/18/26 9:16 AM, Krzysztof Kozlowski wrote:
> Please drop the tag, this did not happen. In the future, please add only
> applicable tags. Otherwise share how this code was executed and tested
> on the actual hardware (make process, like building code, is obviously
> not testing).

Hi Krzysztof,

I will drop these two tags.

Best regards,
Jason
