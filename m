Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E57337FF69
	for <devicetree@vger.kernel.org>; Tue,  5 May 2026 11:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777981047; cv=none; b=rDtXNW4/ZNdDuHJhoKzt3dGIduBbUt0tc3o1f6pir16+tqBu/dMVikTzGryWNOidPue15S/SaAeFb/DDiL+1OoTFdKS87pElh6NnPo2w8tNSPKRPze31Ft3ggrQvPZYcAZfekcrjVOi3YCeFM+IYFgacFsB2vCmoT0WY3FrqsxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777981047; c=relaxed/simple;
	bh=hNk5hAGBEBQ3Qc10Py1DmI/n/SS0XTIkRTMGQ4NLmzY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FFsY/1uwNYys4J5kxJ/L9Lx/DZuGEaDgdAT9z6guINxwSkZE5Jx1fr8frPYAsYw06DM+g28CwTTVTeR18DOb+1gWi0FQLno/+d1bB8ZlorepHFo8xQWjvrL9w2hk4jZ5u4ZKTWq0OtlOzQI4743EfKL5tDcy/rt4b70Y1tpxO0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T6kkDfja; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T6kkDfja"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-483708b697cso6785175e9.3
        for <devicetree@vger.kernel.org>; Tue, 05 May 2026 04:37:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777981045; x=1778585845; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZdRzt5sMT7kBUftNf4L682EBI7TwKGESedWlm0GTlT0=;
        b=T6kkDfjauEUPccs1q9A8IksR3MEkuHXkXPZVeFfTE4kWZOxrnsvGtJTNUb9HGbZi0g
         x0oj4TN2QbjOP7DQssm+i95xaCwO+vsZibbSMneBOX6VRF650z32RYVzZWLHWFacm9jH
         CoTM/BF7fdU22x3jX/RT6YeD2ukOhU4XsAT46nIPCbOa11WXHCRgXy4gybNTaXjaK2b4
         kF/GSj1f/75IJ9/BH4jaF9g2tJDVDaZtehvsdeCr9VR8z/GNvIPsp/JIy0TWm+OliTBY
         K9xVSIM10LSeSziBbUzHJi4z61eCdvwJSzUqj3KcheuJDcWkrmrzjDR9pcMtm7pzGksW
         7clw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777981045; x=1778585845;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZdRzt5sMT7kBUftNf4L682EBI7TwKGESedWlm0GTlT0=;
        b=GQHFep3lsJhoJcC2Nr9FCbmdyq/KXarAGoL2YE5IqfUOspgSNO/JQgCXPoXgAv+aUZ
         pod7ox2HtbeqoDi5kKBE1NyWtZ/Bf6aZhUs3MgEx/rtGkfF+RXXL4dd16yYAJAbWIToI
         OofI7ZIwJgzVdLiD67BLBJ75eaA6aFFI7WS5mlKd4immd1ws5VBD5l5jCpLwfeb8Dape
         Ztxs4jxL2yaVCzYJ7cn6dtKOMlik1A5D8dxsaKZsgj/yecKR1swfMoquCajHPJGs6owv
         eUPksUdUJqSa5d/48WN2cbi0EtyAGW876EADyCdyFSV3NNtN/r3qZvXyhUUC8RlKRUe8
         IF5w==
X-Forwarded-Encrypted: i=1; AFNElJ/vq0CAOxjN69MxVHjbbAbK5JAr+qxN6QycQUSaElctmtHUbMJyKX0Z3HRwZqHugDQgsgSIhBuLfB1s@vger.kernel.org
X-Gm-Message-State: AOJu0YwiBdJaJ+iXhbMRqk2e7qY8ORn+xBmy5z+LZGG0uYde6b/0B06H
	zfPB8PUj1rUnbVewPZdPD1KfF+wwJqBE6lfWqZkvAG8ei11yIaMRraQo
X-Gm-Gg: AeBDiesKyBFRDMdG463//1lE7fzY4Qdoyah+TOouMLDxGMow7sYh/qNd8F8HL6fC3qS
	1kCoEETguwrOU6usDLpiqOIioQaPXDyBb8L5hR3XyhY9StY61+KkTTATiUnzEubJWO9RZsuE72r
	nn76+86cvP0kugLDszMVG+/Cqsgm+Pn+QSYt7z9SVWeLLooqvbgO1Rvf3ZZ61qCnZ/lMDIEPapQ
	f10XJXDfVlvaeFfbA3GS7dipQOv7kJ+JNoJZ/Dm8SRxfnikDePHU7910SyxkRMiu588W7K084nF
	w0E9+PFHO/xacmukG4lsLOvYr7s8OyHteyBPculRId9NwLDyLmVx80ZNlp/gB3iSi/V4ORL1Kmi
	lGhDdLkFKQMecCE6f2RA6o2EeyOOaeaUC0W9WQxUUb6B5QTnAM9OLS7iKNXvQBfJ82aCgvUlniJ
	10q/+exx53y0WltKf1gsG3Z6t9fQ==
X-Received: by 2002:a05:600c:444c:b0:489:e696:127d with SMTP id 5b1f17b1804b1-48a9866a67dmr112715415e9.5.1777981044664;
        Tue, 05 May 2026 04:37:24 -0700 (PDT)
Received: from skbuf ([2a02:2f04:d403:cf00:9b58:9830:baf1:5f76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48d181efbdfsm15094235e9.25.2026.05.05.04.37.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 04:37:24 -0700 (PDT)
Date: Tue, 5 May 2026 14:37:21 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Rustam Adilov <adilov@disroot.org>
Cc: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stanley Chang <stanley_chang@realtek.com>,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 0/6] phy: realtek: usb2: support for RTL9607C USB2 PHY
Message-ID: <20260505113721.ur4qd4udu7jas473@skbuf>
References: <20260420191941.81834-1-adilov@disroot.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260420191941.81834-1-adilov@disroot.org>

On Tue, Apr 21, 2026 at 12:19:35AM +0500, Rustam Adilov wrote:
> This patch series for Realtek USB2 PHY driver adds support for RTL9607C
> USB2 PHY.
> 
> RTL9607C is a big endian MIPS CPU which is quite far from RTD series SoCs
> supported by realtek usb2 phy driver, but the phy initilization is found
> to be very indentical in most areas.
> 
> Most of the code was based on the Realtek's usb driver from the GPL tarball
> in [1] and adjusted to fit into the realtek usb2 phy driver code format.
> 
> The patch series was split into smaller patches that add/change something
> in the driver that are not exactly related to RTL9607C and that also
> helps for easier review. That also means, patch 5 depends on all the prior
> patches that come before it.
> 
> USB2 PHY on RTL9607C is primarly used for its internal OHCI/EHCI controllers.
> 
> [1] - https://github.com/jameywine/GPL-for-GP3000/blob/main/linux-5.10.x/arch/mips/rtl9607c/usb.c
> 
> ---

Could you go through Patchwork and reply inline to the issues found,
stating whether you are or are not going to resolve them?
https://patchwork.kernel.org/project/linux-phy/list/?series=1083475
