Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40014381C4
	for <devicetree@vger.kernel.org>; Sun, 11 Oct 2026 14:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791728194; cv=none; b=uUXqRvRXL4evRbRVSEiNBhbHCqN0mpmktox5l04mP3Y50XZgh3uasjRteHqDhIsYm0akYH0CyzXXVGmwwAeiubVvp2SlE+vOyRUxxUeBjJfk8702ymgKN8LA8Z3inRmNpsfrWvDzpD9/2LYoefwWM2k5Ll4yzyJJN+Kggs2BjAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791728194; c=relaxed/simple;
	bh=HlQy9lG4oAWvBTINQPKtqjXM14hS5iTctc/NgAcI/mk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KWfKNVeXx+P6EOFjvp5RmEEDXchMwibJBja+GNGRctUZ32DnxBdphwV2fiKZaqiqWxe9DM65QNrAJkJUPmoauHA1OhZNOn83M0xZd2p9xp3TjhiTUuFDgig04pGNvQv8jJh7+80nSiaF5u+M9B0twvasq/FJf4FoafVCoGbOjuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.224.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-677bf06de21so680259d50.3
        for <devicetree@vger.kernel.org>; Sun, 11 Oct 2026 07:16:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791728192; x=1792332992;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=66qeQFvPa1OLNzA9zOG/eSFE0YAdZbwXEI8cdDv4Aes=;
        b=00TY4kRA6o/gVGPTUXvWIf+0rM2AYUpjSYDI94FLbwwoQXHwYi0GcDCaqySVX87IpS
         5sbChKy+DIkjzbCMyQkrm1k9Y1JBlcrQifEC8OVixBBnp+Apsz45EHTCk667gEHHiLSi
         eob4e4OepClbVj1mlZD2U1jSIe4gtuUzcTQHVuQjRNjaa+ZBv0loG9Ge7e11PYVs2SCn
         Cdbf3c65s4gLIB8R2Fg0V5NbBJ7TJFWqd1MsUJInuumEkomIMOtekEGs6qHvkNiMKQwW
         MoR62Cm2nYXw8fSvP8HDxzmDKfiQLyzSwAcU+euNSQvEVQ9i4ohiykbk4pH9HN27IR1Q
         k7wg==
X-Forwarded-Encrypted: i=1; AKwUvByjjZHKSvxoiXe6dxR5bGe2SesYIg79Xo83i5twNoKAwJZ5D8QW9FV0Ge0scZIo5mRQBaEGMrIgkrMz@vger.kernel.org
X-Gm-Message-State: AFq9FYJucYo5whS8+Cg/HtuHDEN9onQBwouxowomrzR5xZHShP7nqbdy
	jegbbT9A1meex/rIlPrXEISxv44UhmQSvcByoqygV4A91BTu5y+HDlfqj7rLrfLwHJA=
X-Gm-Gg: AYBFou05F2CV+0mCbNlKKYCfsqPn2V/7T7L5HuG3DURWo2/VvgKTzniz1AB8cGoGOyW
	gOePzNztNT+8eiPk1zDTA6sJ9uj0yiZtVYVgnV1uqy21fPd8aEOPbKTWQDFvWsz+E0q6PUh91nz
	N72GbnR8kDf131bTYk/o1auIS4Y5/yfxORQZgsWxECPCR1plal0owBlrSBHkZKCQKhn8CFgnWLi
	Ur9oIvAI7y81Oe8J6/pWLNP5ityigIMHt6ZSWxQngz4y0aM/caVo6fo0mP+vsAgl42gPYtwyfFk
	6cledYdufRZ8X2nEZpis8dXZDrX+L+XxJkpqLWTd9sGxfXRGasiygSIksmYQONhkr5CSQNh1/wt
	G8/Q6TNsYzFQi+VgKqtmgjPzs7L1xPQvuxQIkMO0MfsEtRM4jh/4pPQlWeCkkrYAIFCXLQkrH7j
	Wgu3cOZJ8OYboo8LOdVv9ivrQZILNX0gX2kzzgGvBJyNq2b9Tka17FZSnMcX39Ppw7QKpiywL80
	u4JWn9E3po+2ohDtaml3u9LeWFuySuH/B/m2+xStJIzzl9kABNAj4PnTx+Rdc9P3sM=
X-Received: by 2002:a05:690c:d8f:b0:8b0:a176:fa56 with SMTP id 00721157ae682-8b0a17708c7mr2053247b3.102.1791728192166;
        Sun, 11 Oct 2026 07:16:32 -0700 (PDT)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com. [209.85.128.180])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b07ee8c23bsm26294197b3.1.2026.10.11.07.16.30
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Oct 2026 07:16:30 -0700 (PDT)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-8a83d2706fdso6467067b3.0
        for <devicetree@vger.kernel.org>; Sun, 11 Oct 2026 07:16:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByq5lDY+6um5gROVdXB5rB1FP+hzk2DG7Fc53Dwk7m/Vtd+l/G2R/WY7y/Jss2PRfsOQbdraA4hvVsE@vger.kernel.org
X-Received: by 2002:a05:690c:a78a:b0:87e:2404:45fc with SMTP id
 00721157ae682-8b07ee0119bmr12804267b3.53.1791728189975; Sun, 11 Oct 2026
 07:16:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261010105900.247342-1-tanure@linux.com> <20261010105900.247342-2-tanure@linux.com>
 <CAFBinCAejxmeeHyDy+vMSg6dBm+9prhEo9qZ7FAsiWNB1W-HXw@mail.gmail.com>
In-Reply-To: <CAFBinCAejxmeeHyDy+vMSg6dBm+9prhEo9qZ7FAsiWNB1W-HXw@mail.gmail.com>
Reply-To: tanure@linux.com
From: Lucas Tanure <tanure@linux.com>
Date: Sun, 11 Oct 2026 15:16:18 +0100
X-Gmail-Original-Message-ID: <CAJX_Q+3JLn6oTt8qTPM-muKsY9JbTEMwqRvbamZ3vqg_Yymsmg@mail.gmail.com>
X-Gm-Features: AclHuK_1GqFe_9xMchzTuN-zUjY9-HZS8dq9HbxopbZkfG1FPjpin79NLsfNCvI
Message-ID: <CAJX_Q+3JLn6oTt8qTPM-muKsY9JbTEMwqRvbamZ3vqg_Yymsmg@mail.gmail.com>
Subject: Re: [PATCH v3 1/8] dt-bindings: net: amlogic,meson-dwmac: list the
 compatible combinations
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: xianwei.zhao@amlogic.com, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 10, 2026 at 11:04=E2=80=AFPM Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
>
> Hi Lucas and Conor,
>
> On Sat, Oct 10, 2026 at 12:59=E2=80=AFPM Lucas Tanure <tanure@linux.com> =
wrote:
> [...]
> > +          - enum:
> > +              - amlogic,meson8b-dwmac
> > +              - amlogic,meson-gxbb-dwmac
> > +              - amlogic,meson-axg-dwmac
> > +              - amlogic,meson-g12a-dwmac
> > +          - const: snps,dwmac-3.70a
> > +          - const: snps,dwmac
> > +      - items:
> > +          - enum:
> > +              - amlogic,meson6-dwmac
> > +              - amlogic,meson8m2-dwmac
> Meson8m2 dwmac reports: User ID: 0x10, Synopsys ID: 0x37
> In case it helps I can submit a patch to change the Meson8m2 .dtsi to
> use "amlogic,meson8m2-dwmac", "snps,dwmac-3.70a", "snps,dwmac" - then
> we could move it here too.
> That leaves only Meson6 with a single fallback compatible. I don't
> have any Meson6 boards, so it'll have to stay that way.
Hi,

Fine by me. But I think it is best to wait for this series to be merged.
Lucas

>
>
> Best regards,
> Martin
