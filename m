Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A56054DD6D7
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 14:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783001827; cv=none; b=n+nSn9hR197alWQeK49BuLpxVx62ilTJQ321MgEtxX5hGjIDsnOxZFALepy/qBQEEkv4LVJd+eXqWf6HCLcqWx/Ftv3QjAJYJTYIGx+89nlB5LsL2e5F0JnSmJDkCcPoaBrH248kQ5mZXGEBHWJAZKru1yZ/XUV0NUf51+d3Ko0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783001827; c=relaxed/simple;
	bh=z/QCxWHRxRaxp+FLSgd4Mq/o8qVzePyKt3vk51sDvy0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WbrTLD8tIYFMsBGJKJuv9xcBCXMWxfh7aT21hC6BWlR5phIA4vK9PDKLsVU6T/mlvxhZds1/D4TjDa01LOFBQqQ70f5fSSnpsUhz3AXI5J/ZGtcPucg5xgcG5RPaOVdVQg8kdFfXMLNnuRdCyMZYPaYkjWzSh+XyYB6Ari+w/Og=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iEfaCn62; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iEfaCn62"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2c9c9913ddaso4594865ad.0
        for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 07:17:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783001820; x=1783606620; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y6e4pqP3mm87wGSrdo1SyRap6WnXTNDpkEgJ6z1bjhI=;
        b=iEfaCn62TKPq1cAksHpKNReejADMTXqwg+XqKXJxq/GXoK2wkBU6Hlkos5qswagTzG
         lwpA3pRt4I4Er1GGZvP8GlEAII93G9dG3Cywo9UWQXN3RLLDA4VerYy9gwWT72E/AszT
         RpFXCN/4SqrruzFIztDY6ViSZqAaliA8CMtkGx/SK5S9UDIOwX63T/UzoRZVLCAw6NoX
         i83bACQWfR9d4wCkKWzev23so6B/gZMP5IqUuHl+k0q1Rav78fznRrDROlgMvxYNi4XG
         6SCw4gG4yhz65acqm5odvlj7w75KXyOx9gBpNQFnUGZgh64rzafziM5klswFUVPKn2Dh
         eN7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783001820; x=1783606620;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=y6e4pqP3mm87wGSrdo1SyRap6WnXTNDpkEgJ6z1bjhI=;
        b=SN6sGLymspNJaEEpih0CIJroS33UYqak4ZowZfHi3EXQUL47jy2DHr1UHZA0GHizjy
         NenfD2iXblv17dQu0pYonJkHedcKCEUb+jRO6LrXZ/ZxZRbCi+rPKEJ4F9vJp2zi5ek8
         2ynwSIiuIG0LVi+gogU2nQnf79g2urhoTov/mp3dqMZmp5VNMdGXJj4lm3HHWkp4K0XS
         aq8ZldqLtCO1PAanKR/I3y2+LOKhuS5g7o27v9IagwdXxyAw9Gn02G+Mf1RbyL6fZBFH
         9DosUs1OI/Lu84uSReh3NXkOEt5JhsXQDa2994RNZbLdSQuyLrod5T5trbrjnaVnOXud
         2Gow==
X-Forwarded-Encrypted: i=1; AHgh+RpPjOf3Y5kgZ8LnqA5Nd51qlARJ9QB0W7Gr6RZYm+S0ah6gFdw+N7W8svDalsc0JVQ93+H/2ibyaHGX@vger.kernel.org
X-Gm-Message-State: AOJu0YyTHWkNPg3pkdzciWJcDy8eDLRtam00dSlUPwqYra5i0h00quNs
	IN+00292ag+L7DP1Zk1oo52RBIUCMaFdNvYueXcZ/c8o3kA5KIkrT2Ip
X-Gm-Gg: AfdE7cmVhCaTDfTDvVjE94Q+RAUKSV94MFWQL/jOn+RuXFa2ocl8gfG4/rRSH/rpqaw
	eASFS3vocdSaKYNjPYsCgdq3/E310uMa3w6yLxzepLczUGM/dFcLUb1h2TNdg+CB5oMDi+SBd+q
	DxaXLEb9vB5gw5tznKQ5IG7REd/4ClpuiFWo1SNONiI0KviNGpuTFcyeZ61fpuS83tmJl1Nz7Ln
	Pjxm9OzS1tOwp2jggu3uI8S7vDDvtUNaSlZvt6rXqChi1/raoURTtl5ZgdpCH1XxWMQ+6iJqQx5
	l8zKeYgbD01dFuwI4zMb2J2p7TKWB4R9ThNwg3duwo76EVXLSerUWYsBaZ1UxVYyQlbXVceEvl+
	vvqx42ypp+t7otUqR+oJ0WoiLfYXTP8+A47cN4C1IN9/ONsvQxta4vJPx6DGJwXHcZ7UT3HvBlH
	CL2zFoLhtwgXLlJxA/qbeE7WhfnQ==
X-Received: by 2002:a17:902:ccc2:b0:2ca:12aa:a390 with SMTP id d9443c01a7336-2caca49abbdmr1430485ad.0.1783001819551;
        Thu, 02 Jul 2026 07:16:59 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca9aa009a4sm14177615ad.66.2026.07.02.07.16.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 07:16:57 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 2 Jul 2026 07:16:56 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
	trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
	linux-arm-msm@vger.kernel.org, linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: watchdog: Document Qualcomm Maili
 watchdog
Message-ID: <04954526-126a-4470-ba9d-501b943dabe1@roeck-us.net>
References: <20260629-maili-watchdog-v2-1-5cb9c83a581c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260629-maili-watchdog-v2-1-5cb9c83a581c@oss.qualcomm.com>

On Mon, Jun 29, 2026 at 12:09:05AM -0700, Jingyi Wang wrote:
> Add devicetree binding for watchdog present on Qualcomm Maili SoC.
> 
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>

Applied.

Thanks,
Guenter
