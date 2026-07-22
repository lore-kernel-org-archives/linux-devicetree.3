Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB2F1442B02
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 17:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784742410; cv=none; b=P73y/PjkFUR3FZIdmvEooq/NgNogQRYUTYSBE4JfiY7c6sbLYlv1qZEqbnWUIKjoYrSs6+n925CgM03ZcjAwvZjGih8ywKt5JmKZ78uk/Dq0anKz5hAwythedKhJPfCpDu/96LSCfr7U7/SMowNSwPyFJsdZYMOsvrFxMJOr5pw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784742410; c=relaxed/simple;
	bh=BXne72PuC1GH3oGKZ7Wp9be2K6wPgM1C1ZBDmBsf1JI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pgZD57hkA+2XUMbuO/sKVauozcw6uybMDKxsxZ8f3Blvbp3+EtHTn6kUUZoRYS08GnWoKR2NGWCnL5lWeRD+AtlQmFoe0joDvVBfOiFsiJAQJpRIJfXcMguIP2Rz2s804biwBNuAYln3nj0D/nLo4HdtFm5DHeyduq5iq6J25Lg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l1O51BkD; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l1O51BkD"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2cf452def93so34902695ad.1
        for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 10:46:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784742406; x=1785347206; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CPC3C1McKSdKHPGsEz7T2BULfXGeP3APrf619T65g/o=;
        b=l1O51BkDvNG6Uv0ehLC9FBwMUsonSX63DBZusoeStbalSmDXmqNMiGzs4ynucT3ToA
         Hcyiu+NSCM64LbtnLaKk1iFyYKAaarZY1KA7M7m1Myp5xyPbU44CTDNWfioLb6IpUnpe
         EJuQV8CmWhMNnYYgkEWUdMGrW4zE6NAyNkOTSKzosWGlcbuqAUeqZItN41Hw2QU5k0Hx
         Ga88YYiz/W6jIBdvRJmo54cPBy/BipU44zwP4FQP9BRZJJMH4wI3QqIWFHIOh+6PFCdD
         us+Apm9KBec+3nw8pQGU6+x4V/ASrhNxaLCbAZ0CX2qJXrZbHo02fprkegR1bUSgh8r0
         PMYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784742406; x=1785347206;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CPC3C1McKSdKHPGsEz7T2BULfXGeP3APrf619T65g/o=;
        b=pP2kDE13XCjCwRDfWz70MCzm/3Oso0xPpE67w+TRyNqmfsmR4p2QQ8fGBX4QC3K+aV
         sGDwVTQrXwcUxJv8z7aytJU0r9ZXI/g5PExE9QNtJzEHx+pvezgqZjzQL6CyGTGpAOiG
         I6xvQXFC+ziq5cao+at/TNBkLQOuroTW+biU+3jW1uFlZQjUqLXbBZGaagldpHSMUM7k
         geeWKUUBxvyghLoPUQhgihrfjPjz7O++J99Q4s3NaQUdwib83IYuh155W7EOM5TC4eog
         RfUlL9CYG7XlvxYCbijuPYJiC48lpFbrlyzXEDnpnnVF8RvoQa/bTqStUA7dEUY8eUoF
         eCIQ==
X-Forwarded-Encrypted: i=1; AHgh+RoKNwH4ezTMYnHaJ4IIiCeJrcf0KcDuylqajaGpSEV0ER8dPMwlEfnhA4MQyGu85FsT/Sis5+8f/Xbn@vger.kernel.org
X-Gm-Message-State: AOJu0YwwNGegUskv2yj8EE07Q2ThM+ydsILShBh39vbk6af6ew4FhOjU
	QzU0qLP9rPJQquO+wg6K/zBkB8xbRCRnvhLhZKwoiKiycrmG9j4RWPQI
X-Gm-Gg: AR+sD10g9nfdQUIrkIw7BH791idJ9JU0A6de1QDcZOvHtVbGU0oC8Gkh2Y9tJmqttxg
	JMBZ4P03sPZNQbgKCxgHTB82UilCl5r/GJSjcjjfuK5cnKG3d3AdhiEQLxRqZfEBbM2iaL4tpG5
	xOTrmg2vaQ8L6s6/uabmAgGRUryKg4EsVMwEdKmG/vgqE+cXoxsBa6W3V/m2P9W9D7/ByocbD3V
	8NHua+bOAiuc+a3k+S7pdNt+8dLRH2gTy96luFap/2J1sPWKabMdE7uWC/4cHpoRMl4k0vfvmqK
	ZMl9atQq+z3p5RbtzLY88mWriCdgtr/E9EKuNtR5kbb4hqDh+qYG+c2pFOPAdlywVK+mSWaxOl6
	sxoqe+NwP8A3S5qbUMyeLK2y+e6dKW2bCAK8JkJxTIvO6yXCmxdjcTG7C8tv0xjt/iOEuyCB2DL
	CYHGczVcqTtKBhVI0vsHyiJheLdP435j1QBg==
X-Received: by 2002:a17:902:f68f:b0:2ca:53f7:3c69 with SMTP id d9443c01a7336-2cf8dc9920emr53255485ad.9.1784742406067;
        Wed, 22 Jul 2026 10:46:46 -0700 (PDT)
Received: from buffalo-ssd (M014013071096.v4.enabler.ne.jp. [14.13.71.96])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8f386c68sm18445405ad.74.2026.07.22.10.46.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 10:46:45 -0700 (PDT)
Date: Thu, 23 Jul 2026 02:46:42 +0900
From: Akari Tsuyukusa <akkun11.open@gmail.com>
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: linux-mediatek@lists.infradead.org, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/7] dt-bindings: reset: Add MT6589 toprgu reset IDs
Message-ID: <amEBgRmQktZ44jc1@buffalo-ssd>
References: <20260717151134.678839-1-l.scorcia@gmail.com>
 <20260717151134.678839-2-l.scorcia@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260717151134.678839-2-l.scorcia@gmail.com>

On Fri, Jul 17, 2026 at 05:11:08PM +0200, Luca Leonardo Scorcia wrote:
> Add reset constants for the 12 MT6589 toprgu resets.
> 
> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
> ---
>  .../reset/mediatek,mt6589-resets.h            | 24 +++++++++++++++++++
>  1 file changed, 24 insertions(+)
>  create mode 100644 include/dt-bindings/reset/mediatek,mt6589-resets.h
> 
> diff --git a/include/dt-bindings/reset/mediatek,mt6589-resets.h b/include/dt-bindings/reset/mediatek,mt6589-resets.h
> new file mode 100644
> index 000000000000..ee08c39df513
> --- /dev/null
> +++ b/include/dt-bindings/reset/mediatek,mt6589-resets.h
> @@ -0,0 +1,24 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +/*
> + * Author: Luca Leonardo Scorcia <l.scorcia@gmail.com>
> + */
> +
> +#ifndef _DT_BINDINGS_RESET_CONTROLLER_MT6589
> +#define _DT_BINDINGS_RESET_CONTROLLER_MT6589
> +
> +/* TOPRGU resets */
> +#define MT6589_TOPRGU_INFRA_SW_RST		0
> +#define MT6589_TOPRGU_MM_SW_RST			1
> +#define MT6589_TOPRGU_MFG_SW_RST		2
> +#define MT6589_TOPRGU_VENC_SW_RST		3
> +#define MT6589_TOPRGU_VDEC_SW_RST		4
> +#define MT6589_TOPRGU_IMG_SW_RST		5
> +#define MT6589_TOPRGU_DDRPHY_SW_RST		6
> +#define MT6589_TOPRGU_MD_SW_RST			7
> +#define MT6589_TOPRGU_INFRA_AO_SW_RST		8
> +#define MT6589_TOPRGU_MD_LITE_SW_RST		9
> +#define MT6589_TOPRGU_APMIXED_SW_RST		10
> +#define MT6589_TOPRGU_PWRAP_SPI_CTL_RST		11
> +#define MT6589_TOPRGU_SW_RST_NUM		12
> +
> +#endif  /* _DT_BINDINGS_RESET_CONTROLLER_MT6589 */
> -- 
> 2.43.0
> 
> 

Correctly compatible with MT6589.

Acked-by: Akari Tsuyukusa <akkun11.open@gmail.com>
