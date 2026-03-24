Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4668B4035B3
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 15:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774364674; cv=pass; b=Wmk4fj/GBtk9c8TJLNRHbou/D9Av3wrT3+mqVjU2R0My1hjRLiIaRZqsQupm14iy2VlOCelvuZRPuc8FcbdJ1j8Ud5kTJsSGED0JsotNIxDT++1Sln3S3EBSaI6TNUZIAxdFBw+r7KBRskWEokq0YSpWLCUv6onW2eWTzP2e5uM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774364674; c=relaxed/simple;
	bh=bcWhaCXDqT3/4plABAPIObuBjV7tjtyRKuCbcY4Z0B0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qsCcQhKohXlhQzuT2r+F/IpVIwRzHx1aqBqs+o7Xa+cCJmFamk0/doV3Y47BQFZimODHL9cGt6lH/YF7tq8zSR+fYV55ctlNzc84pJr1gFtgz+hcW+ruIzel9xBeP+ODzPZpxgvtvjOwHz9ACtX5Zn2y5JSFTND4tHopkKIUwVA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=s8dkKayL; arc=pass smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="s8dkKayL"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5a2967e5de4so1010655e87.3
        for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 08:04:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774364670; cv=none;
        d=google.com; s=arc-20240605;
        b=kwSs1jbUxgXgllot3FhoYX74RXDyq6lqUp2CReU76G+uwoolpicL80d1HTvhODstFr
         eqSMW3Uf/esSXsAoGHoPHzsQCHzPsr7kait48X5M5vAR9ERBkDSQq9Nm6o15fYLWFdpB
         kHJIqDAf3Gk/0HShD3YeA0xUNwE8a9Bi19tBzmFinPaF4UBBIWzvQlTffm0FxoSp2Qs3
         X7wYzZcURndnjIYNRY2FFPssbVTQZvjIsycfMeNHkmZP79OMJ2Fo/gYti6CPymDx2HCb
         fbQwZk6WN0ePCGxLAurPzaQ0uZlMi2ng3lvWxrY+35KEbnJBSL9J3ztRgSXOCkAGsd1j
         pPkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=EF8mh8aKz3LIz19P1c3H9JBQd1g9ZFsPluy4phQ6zIg=;
        fh=7jfOS5kySPkrk7zJugd6g/woZEymbqi32lFbBZYVUEo=;
        b=kh3qg2wFts9oV6JHEkTnmHv/7r0cBKsLFlHoHFZFY4Cv5QTrJnUU2GQazqaRpm6svD
         h/tU5bASVrdytxvew6GXlg2anV7xydyMlc/v6Qvdg0IKqmB2a9L5/eXRcHo+P/dIUeFB
         jK8rO/46YBrU2OuRL2zwzfU3Rg429Aomypn2vPOnZLU5SspyhZhHdXtXlluMNhV4Oobx
         b3ph+PjciXzasPCj3MsN274wPLSE6xVHnp5sYk5TtUwiANUDyzCiXAWfiC77+q8x4n1i
         GpiencBgdU/AauQqumJeyoibC8OzZUaPN4xN+RA8QW0tZ/RxHavZAExVJ3iwF0SiEZGf
         JKWQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774364670; x=1774969470; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=EF8mh8aKz3LIz19P1c3H9JBQd1g9ZFsPluy4phQ6zIg=;
        b=s8dkKayLdhMXbT6NgL7fC1fyEqSkeMRs7b4B6BMGO6a2tnTF272oSnt+ZsTVvPk36p
         hLlQQzzu2nRUHFjFD0GDPSuxSE/czW0sk98NXcnZGcB9e9VRjv0Rd3Y4/KiDsmWwGYn3
         np+oJxx3VUKxZ72IaBT0b4WKQfZA4ci0yWeXNSeVPSxmWeNgIYHrzsA9CyC3gI8lL9t3
         KyRnrwoJoS5sWvY/m1L6oUFFlImZnzvjFgEs5GtRfbXqyETRDiCQ3JBgrwN31PgnMQwT
         ztmteYq2UnJtIF9exOTC5LfNK93T4U+k+ssyAodqUe462Vr+Z1axlOTHKHZefOqCrdPs
         EzLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774364670; x=1774969470;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EF8mh8aKz3LIz19P1c3H9JBQd1g9ZFsPluy4phQ6zIg=;
        b=FR8uRiRuEslNoVDQQtL9Bal3Nna16g+GPzVKg6kKZV6BgWb1EmMOb82jiRZ2MQ55FU
         c0+F9tekn0aBOubZjtSN+gdwSv/r5hVkW4HGoZ19OiSox5SmG4sudpHoUWR8BHxn0iaZ
         5Hy0YaNLEDqKvgvP+vgw59q6wYDGiScRGVc+AqhKc86P/WfL/8aKxDaSJoTu2E8qAZH7
         0/ylxNbwECmsQlbeOCPCakUwAw/wFvgSWzPMJmX9uQXMlsGHbA4GpKYfRNjEgzEFTxL4
         m5AU/uQMKEV8cDNgH7QkqV/8bSP0qRlNm4Z27njHIgxCSZc6NkNA0KnzA8OD5BacUYzA
         mHtQ==
X-Forwarded-Encrypted: i=1; AJvYcCUuAZfW0ieFfWexJsHHxr3T1wWPT3EzzhDAhPf4KEaS32519PG70kIYkeQPeNY4fNOp5Jwp+Dv4gklO@vger.kernel.org
X-Gm-Message-State: AOJu0YzxyMOxKC2B5KO4qhjeOOqNkT/WvBOmFJS1a7H07htPI1VOMv4c
	C8l42kiGLThjKS43JyVqePgU6V31tNHpKf6Jvo7ALtW7MkQy4vX5GUz2pahGFnj+s/vV4/6p9dG
	DhhcFud7uX9Eqq8OmSTGmTROC4uKq0RXJNWEL6Z9pAQ==
X-Gm-Gg: ATEYQzyYBY1ubfzEz4M4T/fwVHrqg8Ep/6aWH8fHNfagSjVbL6v+LFGy+1Lv+yndnPx
	ZM1O/zj4Jbtq4LL/gJmTTI/pvs/TNEOpQ15YNPTOG//Rmry2ZjIREYkGksOCVp9A9ZqwdP9axZy
	sQj7s51COaERCms5tAEjNv+I5FALfF098ng61zMhvfaorGAiqo0Xr7oE+I/uxHT2yII8BP1JM2z
	yYaFYqxcXdbAKCyCci9HlhFKzdC0i3i7WNNomepBoPhR3OWyelX2RO4zy95IMwdjvU7dntHRl2k
	KpE9oESW
X-Received: by 2002:a05:6512:15a9:b0:5a2:7d84:6a44 with SMTP id
 2adb3069b0e04-5a285ae4b8dmr5600779e87.6.1774364670294; Tue, 24 Mar 2026
 08:04:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260324-sdhci-v4-0-c8c2060ccb5c@aspeedtech.com>
In-Reply-To: <20260324-sdhci-v4-0-c8c2060ccb5c@aspeedtech.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 24 Mar 2026 16:03:54 +0100
X-Gm-Features: AQROBzDGb2O61nTd0QV3ZdTm6lrh7bdMvQHr7qGN2e1GOEsGjRP5W0BZL_IWEd0
Message-ID: <CAPDyKFqwCahQCw7kB495Ym1JmSkn0PAkXVn==oV9_pKcb9zj9w@mail.gmail.com>
Subject: Re: [PATCH v4 0/2] Add AST2700 support for aspeed sdhci
To: Ryan Chen <ryan_chen@aspeedtech.com>
Cc: Andrew Jeffery <andrew@codeconstruct.com.au>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
	Ryan Chen <ryanchen.aspeed@gmail.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Andrew Jeffery <andrew@aj.id.au>, linux-aspeed@lists.ozlabs.org, 
	openbmc@lists.ozlabs.org, linux-mmc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 24 Mar 2026 at 02:58, Ryan Chen <ryan_chen@aspeedtech.com> wrote:
>
> This series add aspeed sdhci support for AST2700. The AST2700 sdhci
> requires an reset. This series updates the binding and driver to
> support reset requirements.
>
> Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
> ---
> Changes in v4:
> - 2/2 rebase git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/mmc.git
>   next branch fix the conflit.
> - Link to v3: https://lore.kernel.org/r/20260323-sdhci-v3-0-93555b8f6411@aspeedtech.com
>

The series applied for next, thanks!

[...]

Kind regards
Uffe
