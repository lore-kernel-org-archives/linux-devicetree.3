Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9FBB592202
	for <devicetree@vger.kernel.org>; Wed,  9 Sep 2026 21:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788989105; cv=none; b=PNctyBtJ/fcBY+OzFkZEFoxzTwOMAP19+3R/0w4YKieCDSqkW7OIxxSmDIcfaVPE/hmnF38TTmrVM1WkQG6gT6MCN8Y14W5JGFYBCcoEMJu6b5cUZd7dL1cT9FyIiSyTscNDVxq8A+WsdzC9OhtcNs6pHJWBKqFk8osT5iU92CI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788989105; c=relaxed/simple;
	bh=j/apqNvWLw9XnsOroqXyRHw69VQZFc9ZzUz7CVKUVzo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sWXbGS6+SE065CYEINvl/3PcN/D4XyLp/5l9diEHXHK286+jfSYuDN8adCqaBL3xhBnS3VYdMTv1Ig64HAhcMhoxOFNi+nRyyQ0kt1Tt/9oQG/a41nKWi5S21aIE9Okk9Ln1Wp7bGrz3JWKJ1v2DTZDIj9nQmx5p/EDdG6eiK4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j4/Ex2KY; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j4/Ex2KY"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cc4aa18f9afso583431a12.3
        for <devicetree@vger.kernel.org>; Wed, 09 Sep 2026 14:24:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788989093; x=1789593893; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=sjwFGcVPSNWfje2QsRXKLC8B+AQNq5tvQ8diIKCovEc=;
        b=j4/Ex2KY4pCB/q6pnQ9V9zQDExHQuB7MCiBkMgO0TF/UZ6/ycuXEnRBzYJi7VC1ijK
         uIYTZvODvtKqPhxBOyZRBi63qay5BiljBU3m4F2KMDtH0N5str0FzrRCQpHYl5pIh9xq
         phhKb49l8LwAZhnsXR+M8/Eu3wLFAdsqd0/g8rT+Z0HBi1iePhPFSK+gw5MzvamBi+Ph
         aMAyPiNUYh/IW8sWUeHAJEKN65HL/39b0XbDI6BmZ+FXK9DYbMfItNaZ/hVILLyiJjjG
         PPrI+sKKjQ4kZiJkJs4IaOlsAObH+urZVB0nKaYvQ3EIvUyTg6+in7ggMWcIvU2dDgOr
         i97A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788989093; x=1789593893;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sjwFGcVPSNWfje2QsRXKLC8B+AQNq5tvQ8diIKCovEc=;
        b=V4xAmqpkUNW7D9+hwc7zv5YQCWSO9EUr27hrgQD2L04vepA7CiVr7ezsbtUmovT9MK
         XwOylx7ANRTsIvmZng/+Wm0APjgeL2VqlAyUdU8G3rtwX3aGoSgRcEyiCSmxxhaoFbET
         yLuH6ywgJZZ6nIm5b8OqubGt9ZWH3rmyOnQJ+EOeyESKiAbd/L2TFziWYLt2NK9X/W+c
         hzLAOz8Cy8qVtBC6VSwNzf1ZAwn5hQJDbfiy+mgfah+dPC0deH954ZzXaE+TPy98fTxR
         9qDDYV9p64jfcNjs9ag5Ts/5bI6Z1kzBXoKEF7Y19mf/eJtPdv0GEnjJh2/mkHasV6CR
         GabA==
X-Forwarded-Encrypted: i=1; AKwUvBzLTrafDUiI8FNx5obHsxlk26NJQlCv7XY07wDZV+3vwR99FeQ/BgU82+2JC5eX7cylCMroBUo1zeAe@vger.kernel.org
X-Gm-Message-State: AFuF++nCqaB/YOBpIkQdzQX9/iKF95W+WkH4NQ/JQ+sGmbhYY7wmsNWY
	UZu2wPb1qbqBO1T4hDy5EABi1S6tP+aEsgqnOP6yr2Kz1mE/UqkXtuWm
X-Gm-Gg: AYBFou2383X04ULkM/XDPpcVWSYtg7Ym2oAT64ozcpw7brqk4qu7apurTXxGR/+XMKl
	4VY4Z8dziW5jp9v4GNdj7kXLl0k5nqKrsLU98HeuRs4ah0NQ7MH8pS1XIPmK923zjDHS8vzKa6j
	ug60KKlMoFTiCJwymXdWEWJheyFhJiTHB4OABBKVbdFB+RBT1L050cPxpRYSKSsdrtrXXL07X6a
	TxVM1RZDnvWLUjjg2IpHwlQId3h+G0EaH6nrEU483/gDU9+H0lBjww/0cTumycqYct1/Z+Hr6nF
	EUWJYQIdCAfEwGDJI4apOlBnCvlwRTqpkNX+YdVUx1PdGWKN1vuqieAh3uAM+fkSNtmrCFtu1H4
	FNxy9cnRZwCF0XZPxPfHkB2vB/GuVacyXkJzCIWc5wK0EYrha6l1mTuBZZiZaybOa9LVMyFAfYH
	1RQkIoKBgl/Dhuq39LclNptNYIEVqalPmxx22HbLepywaTMrJ25IvNG3P1scQ/O8l6YdMitRr3n
	/9hWGOTAGLb
X-Received: by 2002:a17:90b:1c0a:b0:396:41d1:cbc7 with SMTP id 98e67ed59e1d1-39b2614e099mr53418423a91.3.1788989093027;
        Wed, 09 Sep 2026 14:24:53 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d7e9014cbsm6506a91.16.2026.09.09.14.24.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 14:24:52 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 9 Sep 2026 14:24:51 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: linux-mediatek@lists.infradead.org,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 1/8] watchdog: mediatek: Add wdt/toprgu resets for
 mt6589
Message-ID: <b01b65d3-9ff5-4bfb-9917-5ab287535078@roeck-us.net>
References: <20260908174259.9009-1-l.scorcia@gmail.com>
 <20260908174259.9009-2-l.scorcia@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260908174259.9009-2-l.scorcia@gmail.com>

On Tue, Sep 08, 2026 at 07:38:28PM +0200, Luca Leonardo Scorcia wrote:
> According to Android sources, mt6589 has 12 reset bits in the
> WDT_SWSYSRST register. Populate toprgu_sw_rst_num to allow toprgu resets
> in device trees of the many compatible devices.
> 
> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>

Applied.

Thanks,
Guenter
