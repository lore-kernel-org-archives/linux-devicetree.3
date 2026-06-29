Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36368466B5B
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 16:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782751239; cv=none; b=RwhHRQaUVqvqYrn+WI1wpV29W2BFN2ygvCtWEOTng1uV6+uOisUOD9W0BtPan40DZTyUhGkN/dTQqDUKEvB2NcGv9TuEYhVWpBJd6q+n4+niN/ysD56O56zWMaov7+M/5+b1hcfaEVDGJFfpbOfJpR4KearvD8Poyic0ZNx0mfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782751239; c=relaxed/simple;
	bh=9UPYfhc/POTDHsxHKkd/qvgqQC6aTve2NNjdEdwkeQ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k3ZpJAn6OAN3cdxL7FpmO/H2hcj0DjI34ji3MKczPw5aXEdIYuWaPfhTwE6f2lxWgoGYNxFVwA/9z+gRFsk+FIzdiOFZbJtGpoqsPnT6E6XiBA5wDReM/0qa9ahTzgxTtnuNwF2osEjTZHvkW9WYO3ew9xTyd8xh5ETe8zntfCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U+tMRYJT; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U+tMRYJT"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-493a5d32e8cso18703875e9.1
        for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 09:40:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782751232; x=1783356032; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vTAqympCuHM2c/PQmqwHbJCuVDhybEJa0vtK+R7ZX2Q=;
        b=U+tMRYJTAJFWAdLeEKMzqUagtX0rCYoWove6KnY/J0PnOtFVjMOR6o52RfxxPhsbGP
         D5Gz56s50MfzFD634LfQfGmuRY3PfBwf1IIrzaSQ6mHa2cXlLgp2yTzE8Ym2tp8fm2L8
         zMj+gV2m11i3KuznEmgfwo/GNyq/qOeA2/w4qwR7EqFU+T8hmIb7snyzaQEGW4vBNXZV
         mvfDhR7fn/eCq25dh2KK/j6fszbvxoZPSTLuPtfDcK6ZbPsZgFisgz43eEsrBN0yvh9E
         q/TFXVvNim2RqywmyTYyD9BpR5T07rZldvceplV4WXCuKORqntoIS4lxpbtchgcg1Tmd
         R+SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782751232; x=1783356032;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vTAqympCuHM2c/PQmqwHbJCuVDhybEJa0vtK+R7ZX2Q=;
        b=Ha2QpAccpwEvWxy3UWBIDA2+te4gG1ZeGdjqccsMVbXswZrstrQotq32xt+HMxjYoZ
         oagBqId8hxS+4/Be6WJboleTYn87WP01pdVb8Ck9/mPxEw33c4HkuYwsKK5FybBa4P5i
         vZ9mQxYx6DlGPNNRjRS6FhBZBfQ6NjicomTDpV5EZPKJFvTBkH8QZ+AxlE53Pc/one/D
         yjT4xYvQObXMnn9hcZwtboMJUHBdaCpgRLDIS9D6IKZu5DyEOJw8ySJtJ+fGAOqbvqgY
         +LN5SZdi75jifU5wYOmSPvk7Ak9RdTdnrv6tLhzWnBzm2zUElXiyzYFSGW7C+jndhOrP
         tMaA==
X-Forwarded-Encrypted: i=1; AFNElJ+JOzpPR3G3/Ct6b7pdw7SZFCSGEK8l/ypQkyMhSkuU7P7qCPjkC4i8JsdhiQ14YPPXsw6DuHXBoD91@vger.kernel.org
X-Gm-Message-State: AOJu0YxVYSxQFUiMiOy7Z2M8OiVdxRd7ijWLXtp4Mu7j7uLqb2AtuNDN
	28A/yyAVIhy4QAuaQPLx3jFtuUwUYI7ucn0VHueaWXfiKBEhv8Ph+23F
X-Gm-Gg: AfdE7ck6lET3uGgLZFXWkHMJh0JOhQwp09RcDnay1Nm48+DZDHyH+LxJC7XHRN784K3
	6OzePtG6EilPX0juydf+TE0zCuymQw9PG+acCrOGes/5gJnhQ/Z3I5XfsP9r1bjKeesfZu7QpWX
	DSnV+V9hvPi7867P1mK37dl1E040hpZEIqGtXfY77NOYkDwf3+wk1y5kHSkdeWmnp8UWcOISW76
	b/1jd6GOJ9mh1c2flVXTjUm2DOC0KJ20X3sTqTuKUJOPQJ0D8m4Epz5BtKp2tWjXgee6XTy1uak
	1Xzya8oG/n+Si6oBr/iYpEF7QcZat0dPIYfaautNA6Wijh9jAoCiXWWHSm1VfNB+IuXtHPG9f0m
	y2eUTDKr5trT7r0ad5MptejD5Ioqn6EG5X0Nq0VdW7mgOjSnnhzkIaBUfUkPdR1tO0mADXNsFuD
	tdc9GOkwJm+Sw8I9Nrjg0xFNOazKegpgdZ296E6S7d5/LwWOxOMwWKyNUgfgXDIxhHd6nxhm5La
	8lsdfGflxf/fA2+lqWm5HHI48GVpdki
X-Received: by 2002:a05:600c:1d09:b0:493:a535:5527 with SMTP id 5b1f17b1804b1-493b82ac8d4mr6429385e9.21.1782751231985;
        Mon, 29 Jun 2026 09:40:31 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-248.cust.dsl.teletu.it. [93.144.65.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493b8c238fasm2254645e9.0.2026.06.29.09.40.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 09:40:31 -0700 (PDT)
Date: Mon, 29 Jun 2026 18:40:29 +0200
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v5 06/14] arm64: dts: imx8mp-var-som-symphony: enable PCIe
Message-ID: <akKf_akO7IZ2ltHd@Lord-Beerus.station>
References: <cover.1780929317.git.stefano.r@variscite.com>
 <26b5b602c3995a5a74f64b84576ab4d54ace23ee.1780929317.git.stefano.r@variscite.com>
 <akKdkWos2E25M_q8@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <akKdkWos2E25M_q8@lizhi-Precision-Tower-5810>

Hi Frank,

On Mon, Jun 29, 2026 at 12:30:09PM -0400, Frank Li wrote:
> 
> You have to provide all clocks, otherwise, whole clocks and clock-names will
> by overwrite with one clock "ref".
> 
> suppose CHECK_DTBS should report warning about clocks items.
> 
> Frank
> 

thanks for checking.

In this case the SoC dtsi does not provide any clocks or clock-names for
the PCIe PHY node, so this is not overriding an existing clock list. It
only adds the external reference clock used by the board.

This follows the same pattern used by the i.MX8MP EVK, where the PCIe
PHY node only provides the external "ref" clock together with
fsl,refclk-pad-mode = <IMX8_PCIE_REFCLK_PAD_INPUT>.

This is also why CHECK_DTBS does not report any warnings for this node.

$: sed -n '/^&pcie_phy {/,/^};/p' arch/arm64/boot/dts/freescale/imx8mp-evk.dts
&pcie_phy {
        fsl,refclk-pad-mode = <IMX8_PCIE_REFCLK_PAD_INPUT>;
        clocks = <&pcie0_refclk>;
        clock-names = "ref";
        status = "okay";
};

Thanks,
Stefano
