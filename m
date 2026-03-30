Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A730E3A8744
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 08:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774858541; cv=none; b=AndcBVML5DIfuHVofeLZHdRxZfmeOguDS338CZNVKHaiHdvch8ssgIUko36KfOL8IMVWvox/IzhJEBjjVXm1PoUKfRt8LKVJWG1JCUBZNCOLQzXPqhckgO757++XkX8z1Qwhs9m6Xo3aXC9nVnABDbbU6RYHvLCYEaLwmmhWYCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774858541; c=relaxed/simple;
	bh=n80FdRj3PPfLGJfhL/LDnOu3GGohFsmLid/HSzbkX44=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ElUahrTgsgxLrsOP0Ss44s+hRaLqXg8ZO9jyL0C0IyYJwaBZKBsDElIS5ZI3Q3Eebd6E4pJeWVrFD1+EXFUVzdQjuuSkLNw6HvoDUJNF1OL764UldjEm92oOtDel/fNUUVVRuxWsD06foT0pmGl77Dy6TuhhgB1frlFSt7018l8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wyb0q31V; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wyb0q31V"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-486fc4725f0so40580195e9.1
        for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 01:15:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774858538; x=1775463338; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ELQ99DUHclnDOffuSW0lyygwgn+jLXmNAs1AdGgvIKY=;
        b=Wyb0q31VUnU5bjbVGYp0gRL3NpTIohdVFsyj1Qw81cNhGvZoThmsWJTeTZFNI/wYjO
         y8M2IUppsMBc2ge2oiAHTxRtiUuFRQZroerG6i+2c33cf07gDnl+s/YN9ssGEeJHUv7d
         dWgqd2TQAF9uEqqaVAvKrv96VWQrdoHXs48D8LFNys+w/u3x5DgiS8QS4L9Wuq5sCAMG
         Zyr3uzDnnmPVsnAlXqSEoVkaNcd3F2/iDFeZ/fJqxlpic0lfAmvnEZBgniYN/F44MgdA
         qiuK135haC2k8yuI+ktU9tfPt9Hc6rvxRYyTmHGuquv3M8Tu7MAUYIeniJ1tTUDMjT4W
         BqlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774858538; x=1775463338;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ELQ99DUHclnDOffuSW0lyygwgn+jLXmNAs1AdGgvIKY=;
        b=HfS/9nY30MqUxiGSbBvNfDB77TPxhvBcdPOyLQ6Zhfe/W+M7UBRnQofi7nxGxqGkIz
         taWNo7Ol588uUJh7oRI8Z0u79EmAevtCbnNYMxeNOlrtYmpIg2Vc4tWya03hUuaj0HPD
         q69i+IbAKLVJ7NLtoYyOXvUz8e9Y3VL0oQ/6Je3GVWXviNl4tRACAiuEl6YPm/CQK350
         5MWISg47Gcx47at3aLXFWoNwkGL/dLjDwLMdOzlLmJFQxvneFV3cJxj4wBqtG4+Nnvem
         IyWBdiP28AxBrSug1eesslOsV6EhnJwuqVEAiYJzhKznIwyLotG0/XslTvNflvwx6vkO
         WE1Q==
X-Forwarded-Encrypted: i=1; AJvYcCWjkRYXrrmCOIfkyeHsLHGQxde/ilQGyepVP7NwbLrA5SZsoM1ua9Ht5KUgNz0U3vTyJcTHYukgt2vE@vger.kernel.org
X-Gm-Message-State: AOJu0YwQU2hqhizMRGqbEs/zboxONYhtNQRVpSKpkob96JtbHFt7OYo8
	q/aRe87jj7apRsUYxy2Zhko8D+XbEVIToZYdJTkU/G+GXKUfoUWzHw6zeF0F+g==
X-Gm-Gg: ATEYQzy2z/FQQc2CuwKF3cMuGOEblGmvtnCb2t6/krtIqlbLD2YKGfhuErxvcKHJpqz
	rth5wM+wtlXIHR6X78tNJfSZTd2nYIpNbYKsn896u0Vm3zKfHRz82x+GiDOfYcKY7sBE/XV3nZO
	OnQx4MlWFqamELtJnfI1Tsy0MqYzeLxgsi/K/7/3AohM9yJFHRZyEfQRzt83A2+vAB8CIf080Tk
	H/9Ty4CySAM7zJW/gDKIdciBBjV7vvElUbxfSPrC2SV984Al1jCqMow82MDOze61Sk/ygSNXSV+
	j528zfPosH3cz4CGrFkKPWk00NvXqnI/R7h877x3WBaUiwq+piVAzKV+EWugo+3G3gLOttXypbX
	PPs4tpWjvpAD5cBRwIYcNCLrH54mzeZGWKsbA9E60iLE+kiv8ZSeMbMFTbjt3wH76YGg1LyrK+s
	0uZV0I/HGr06XiZX3OEaKdHEjugHVl6cqW6Pnk4lwZViJl/sChdkSnDGg2ZL6B3ie55QHSy9R1R
	7AjgMGHWvFXOtCfRasqiB9FXs7xyC8DTRYLVEFoHnN6
X-Received: by 2002:a05:600c:c172:b0:486:f893:56c6 with SMTP id 5b1f17b1804b1-48729109ac4mr162979685e9.10.1774858537664;
        Mon, 30 Mar 2026 01:15:37 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-20-233.cust.vodafonedsl.it. [93.144.20.233])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4873061ef41sm168098415e9.3.2026.03.30.01.15.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 01:15:37 -0700 (PDT)
Date: Mon, 30 Mar 2026 10:15:35 +0200
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: Frank Li <Frank.li@nxp.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v1 1/1] arm64: dts: imx91-var-dart-sonata: add RGB select
 supply for PCA6408
Message-ID: <acoxJ3KUVHqIR1yQ@Lord-Beerus.station>
References: <20260327163243.17334-1-stefano.r@variscite.com>
 <aca1jdx0DjmmHqFk@lizhi-Precision-Tower-5810>
 <aca7ckVY9ure8Cwe@Lord-Beerus.station>
 <acbPUTPpGIJoqTn3@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <acbPUTPpGIJoqTn3@lizhi-Precision-Tower-5810>

Hi Frank,

On Fri, Mar 27, 2026 at 02:41:21PM -0400, Frank Li wrote:
> 
> Accroding to signal name, it is MUX chip select signal. Of couse it may
> connect to a buffer's EN pin. I have not checked your schematic.
> 
> If it connect to MUX chip or some select signal, it should use above method,
> even though it is permanently asserted when access PCA6408.
> 
> If it connect to EN pin of buffer, regualtor should be good.
> 

Yes, it is exactly the second case!
It's just an EN pin, that enables a buffer to route RGB signals used on
the DART-MX91 som only.
That's why I think regulator is the right way for this case.

Best Regards,
Stefano
