Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CEBF3C5558
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 16:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775838144; cv=none; b=bw6r6XXu+dYWGkHvZofbaztpUn1CQfRkZ69CpAHIN1qAYHSotdw+DltR1C0Tv9NtbLe3As0j5B2j4FZDUZTAab+bmGuPcp18RqdXS5fm/ToPQ0xGrfc/v/t/ChGeYcnkeR0xTxQlQ1juhcMKTCRiaeDiYl4aYF4Oa7vSCrT4m8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775838144; c=relaxed/simple;
	bh=BBIkEk5IWn0dgN8UubTAKBIOMBYqreRBUyJgp0WUWdQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HD9sA8I5rGQFy4ySPmzzRccLkK/0GyKaUQxVBy5BuHgjw7FGhWQlC42nCIOwz/OBp6f48ZvutM0eQyfBhFJmNaMkey1+gZt+W24iTnXZ0i0ElrVdo+NEWuflQ5JNzXcDQwzzqtuYQXAVRggVbyfN2j182dUL1P8QiWYsBWRd+9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KIcQ5zy4; arc=none smtp.client-ip=74.125.82.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KIcQ5zy4"
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-128b9b7e3edso403286c88.0
        for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 09:22:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775838143; x=1776442943; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ud2WfQQv0Jjbl2amZn8W+6KYSKXPpeMW+BFIbEVApCI=;
        b=KIcQ5zy4WnnWRfT+vruB+DhxD+8sbKr00/OiqrrZGReIyT4YTyfsLmVjwLgFWTNVHN
         dnjIZhfj4MTQB2UsLYUWwhdwWmxaTFduiUdrjw8tXkECHSFJ+dDpSCvxMtNUYYqixcnZ
         PN2mi9JvYnFFy2NYz3i+ZBnGAsieDtoaQxWh1muDdgGIipaX+i5+mZxcP5ZI0JOlNMSf
         ABcQpxq7CmdvxAGbabLHqRcp8O8XWIIxkszwI24UX1jJYi1GSJMp1BzVDpdEMNdka5qJ
         WN37W5cGxZRsCaPm5lU8gnebn17uZ/UzfJknmwvTB0XzA1V9PKn+IG04ApUnYXpMU7Of
         9f6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775838143; x=1776442943;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ud2WfQQv0Jjbl2amZn8W+6KYSKXPpeMW+BFIbEVApCI=;
        b=Yw2/OYHXTD8xqpXHmJ3UZMrFXBgThYsCgQGYY4MLpoUVAO4zEWjL7mANGE8NoMAr96
         642ezlXg6DTPbfaG7Y1DF0Z1o/NuOXXnef+7iJSp6RvaPCoBzdbIGRAX6zFHnEloC72J
         aZUkUbw/5qWhEgXknbW858Q9GWzbhNL+22iim1zxuhz1QTPLLZX+QwicKWyHGeAmrN4N
         1ipH+oa9lgbWQDDoLo918E2s9R2brRTTrzD2i5if2mVOX2ZSMg9mn0A0mS2HLwaF5rH1
         S+B0OFwEQP7Qo0d/BDaKeVRAAk+CM7OFIO/4t5g68OMo9m84+hESuqyGLQB2sqhhTA2f
         CeGw==
X-Forwarded-Encrypted: i=1; AJvYcCU0QMPT9wo9GqmKx36ft76RPQPV3xOIrtALPVvG4u7PoCsaF5GXZ/s841T7EgBGZg9A9ThZItNbEv9J@vger.kernel.org
X-Gm-Message-State: AOJu0YzjMfxqbzdwQb5s0TMS+z+BpxsHP4oyArrz/1vM/dA7b/9XrAVh
	VIG+ZSR7cbX4gz3736DYImDmcljB1X0Ui0gX/h8+lzOWtzyEGKCBAN1Z
X-Gm-Gg: AeBDieuPbGAP3y3abdsQGIh3ti/sPdIt26EZi13mNL1Z/5Wm5rh3GlA1oU/5w2XMYuJ
	qqCyoJkhDsrPtyAY2lzi7KZ/FAeZw0BY+3oN36Oo6NbLu7Vp/0qkxKRxaxo6tZeQQs3wggschbt
	4oCphXiDAje83n+wdURIO0d20u4OZKZ2W+g1nbqQiWJLraQSYFTGFjjUJcij546zBKhVbP1KVcx
	qJ9mtMlc+jr1OfkeWWrh/28Qubh0ReTeIDQyVPvIkR9aWXVlripdlY65aakB1OdjPQtb6KDtiI8
	+l3IA8smyLJuFHj/QPuXa9cyVv8AQsg8JK8oi7uu3nn4RytIwCTlhnceUbGybtUA30YXDa0cdQI
	+8UuvYptGaqlBAuMOZd3vFFrcyC8+6xdJRLjy8wZp4HRbzo4G/Y9AquNfNgMmky4dAys14nY4oX
	sMCgBNIDWmkFjNjoErXKyssWj7UAS4gAFXrvDMlG2eK0bDWys=
X-Received: by 2002:a05:7022:60a7:b0:12c:33dd:f9ff with SMTP id a92af1059eb24-12c34ef7bbbmr2055222c88.33.1775838142675;
        Fri, 10 Apr 2026 09:22:22 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c346eb228sm4445290c88.9.2026.04.10.09.22.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 09:22:22 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 10 Apr 2026 09:22:21 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Victor Duicu <victor.duicu@microchip.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, marius.cristea@microchip.com
Subject: Re: [PATCH v12 2/2] hwmon: add support for MCP998X
Message-ID: <3025e1bc-9801-4483-b03c-f638767c1465@roeck-us.net>
References: <20260403-add-mcp9982-hwmon-v12-0-b3bfb26ff136@microchip.com>
 <20260403-add-mcp9982-hwmon-v12-2-b3bfb26ff136@microchip.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260403-add-mcp9982-hwmon-v12-2-b3bfb26ff136@microchip.com>

On Fri, Apr 03, 2026 at 04:32:17PM +0300, Victor Duicu wrote:
> Add driver for Microchip MCP998X/33 and MCP998XD/33D
> Multichannel Automotive Temperature Monitor Family.
> 
> Signed-off-by: Victor Duicu <victor.duicu@microchip.com>

Applied.

Thanks,
Guenter
