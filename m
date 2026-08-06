Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE2733D6CDE
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 09:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786007312; cv=pass; b=WmHDs+uIiTnjwflK9GH8dn2oxg5tpbraf3Fkgua9KUZTKeoFoSbb30ybCiBlI0Zffg7G/eHKgplStih8myS20eEiJO6gYWWX16UL5ybzjVt3OgkdcEpRXXgpuRzbwZ1+L4Vhly0WBxlRLsgphdV9fIDD2bw6bqTV7ZT8RlRz90g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786007312; c=relaxed/simple;
	bh=89OMrT3Z6DddhWogs306TDGgtKr4lphAjTbSwQXv5cQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Tz1PVmrgB5jNsadR3hxwzQA1ye/7QsmfTOjlC2GWSRbK3cv+b5P2dzbm8X0SRQdd+hXxr+Tgt47hMqDrKHGHScLHe/Jwtwf+WgQbHWWyJtJdNA7Scc3+r9ftokOIdzMwZ4IgSp8c9clhUr1tUAg8DxY0dGBf/vT5HPgY16ne8+g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B+uhSyjK; arc=pass smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B+uhSyjK"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-69f7fa1c548so3053013a12.2
        for <devicetree@vger.kernel.org>; Thu, 06 Aug 2026 02:08:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786007309; cv=none;
        d=google.com; s=arc-20260327;
        b=KTlmtmd6MC6hV9IjD3rnOBfQXM7ilwrPki9ms/g8ogPbJKLJZPgyrj0inzJ4S/2XVm
         HrSlmsIbtEnemSNoP4/0SpofPMgtfHAaIyw27e0RFx0HW9ZuOSE1rFVsA4bKuNxmLt6j
         guZhiSEve7eeVlTLix3N4YJXjy/WLF7wiE3hvYA63baSCC4JKPRlM2WzIj1HKW1dIyaL
         cpHxlMWbdHKp7j8jM3w/NRcYT2sOuVGIR8ApjEMQVoabTbHT610EsV4M5S30Yw2hNfkU
         e9z5ufaLIC0qXN+dU6lAVDhOgBAbGDNqKdnYhWzeWeVPT03rEG87HFLew4CVp63Jss/m
         QVkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=89OMrT3Z6DddhWogs306TDGgtKr4lphAjTbSwQXv5cQ=;
        fh=spO8kcTjF8Q1yy/i7WbfQnwzmuv7jikdHjmK/fNOE/U=;
        b=fA5gfzv+ud0VZw9Ar5cGBx6/IO14oFpAOkGBb48Btcqh6FTTAVMbFtOfw/bGXCEJQN
         OWCpSvA6fp/7fm6O1L3/uf5dRFlYNmGmgYREH+Zp+34DUfoxZB3vITmP/h/KFuj+8sUa
         pBYhSEL4+kxpyJW+PSAgWK27v0WBeOlORM1P6oHTz5Y1in8G65X0ZHYdTsp/njg8hhub
         8n+F3C2ih6HiMr7dFQQpSxIAID9IultKac9cR14jAvr99eis+GBIa/i8pKMH/HsdyGUe
         69b12qRF7YY7/s/okgqYcKQFMwTaEcDKJIMv9RABPwju7viamL2zCT899eZ/bRI6GDaY
         2hDQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786007309; x=1786612109; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=89OMrT3Z6DddhWogs306TDGgtKr4lphAjTbSwQXv5cQ=;
        b=B+uhSyjKasC25QUPcqOmRw45XKRxiZYH9hDgQi+4+yYDCwQz42avIKHYWZQBuu8DwH
         Chu1bOmNmy2vqxZs3lmPKA/nE1PFHBDSw24MZsheONSas5ALcX47R2GR/voOpMOHrWSO
         cWvNB3ImVQFoysA3A/6dl49IPx35wnA4vDrY7ER+p2gAVZPKnE6BetFq6jVBkmEYK/If
         4d5Om5Kholcp/rrnX5+GxXntdlIYtR9rlFNrMRZDmRs2ID9Gd2dV/R6sIOjB374k+ePf
         WOmPCrM6n8+zrREO4z5PeW18N3IXThLCcG8Yhas/LGCxlY8KVDDk1amqK9iyikUF4jz/
         BDOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786007309; x=1786612109;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=89OMrT3Z6DddhWogs306TDGgtKr4lphAjTbSwQXv5cQ=;
        b=HDNASdq3RP72ggSx1CE8taqg/qFr74Xk5naMTzGjTdNSZhRkYLlbdFq8AwIoIlfHb2
         p+L2+1togxze6THMMNGs0/cdErc+bHF7Dyv3N0F0NT42+hmPqAkVKfYWHVNkZwDagxNW
         WwmadqxBRW07MM1syBqQ48qxByR8bgIr/6zigTrJXyZKdbF11fSHc4WRUVfU7XQJz5sP
         P6BXrLUc/rRiCeOXoYKvmfIoNFJ4DcrlGMiiDptlDJ/BCgxNx8P24JZwLZEUmLGaq6pS
         0MCGYD/LBRxheL2OgoaVGqT3nWut4o3DRzQBFpZRoHWcGAus9GnllHdVdNmiIyG9eO+J
         Kafg==
X-Forwarded-Encrypted: i=1; AHgh+RpFDkw6Gps6tp2KhdO1YjLFVASS5ANysH8pAbf2u4JRWw2xSRDTXbOTG9PLEoCa5x6fS2UPSrxJ81tl@vger.kernel.org
X-Gm-Message-State: AOJu0YwRbgtUFdrCMIBu14Q2MaT3RJnaqbWW4FYs9h/diUqz+mhMlzm7
	wF66tFOfHQ1nasL63ooHVB5c9tZ/Ho4WeQBHBkLXBdswT39UG+vtTAJMcA6wgsmEQAHDv2Aqv/R
	WluRnMBsWj2rDB7MSYpBjt3Hc5Leu0Kc=
X-Gm-Gg: AR+sD11dDp1daKLU7sOkIiRAUvjkx/TJ8o9sWNYRvprJo85O+c7Fxdra7pun1petVy4
	7SilV2KiET76CEGHglS7MTTHmX/WS9UZrGKgJUQZwgLWJBDx9R9mXm+M2niJs3yyXiXf3IOLgma
	k7ik8jdkH1VB0sN9Q8pVX2Zgi25UCoeZE7ffVBsJqivQaDm8/Hijg/oJAHdfWsXuHq/IM2/SGlm
	xvxMcRaa1A6StQ0jzRR056jGsj7yUZTXaWXRUkuq31shD29UTSC9h7TyCKNsuGLBi9fIwYEReNH
	l8iVoSSZjGD0gzLDgCxQmxpG2seJdczVGa+rccTEDcL7Dw==
X-Received: by 2002:a17:907:d20:b0:c1c:257e:4888 with SMTP id
 a640c23a62f3a-c2039cc4dc5mr697561666b.27.1786007308631; Thu, 06 Aug 2026
 02:08:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260805085540.452260-1-a.shimko.dev@gmail.com>
 <20260805085540.452260-2-a.shimko.dev@gmail.com> <20260806-classy-cuddly-limpet-9e6d8a@quoll>
In-Reply-To: <20260806-classy-cuddly-limpet-9e6d8a@quoll>
From: Artem Shimko <a.shimko.dev@gmail.com>
Date: Thu, 6 Aug 2026 12:08:17 +0300
X-Gm-Features: AUfX_mwwygKwfn76cx2uol6W1X4L3NrQoylixOyCec7ouNwhftzJtJH1SwjbW6s
Message-ID: <CAOPX745Y_bq3b7hd0HUgF3VS74GBWKizgtxZn=65wMB2RCeicA@mail.gmail.com>
Subject: Re: [PATCH net-next v6 1/3] dt-bindings: vendor-prefixes: add
 Guangdong Dapu Telecom Co., Ltd.
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: netdev@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof,

On Thu, Aug 6, 2026 at 10:20=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:

> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Thank you for the review.

--
Best regards,
Artem
