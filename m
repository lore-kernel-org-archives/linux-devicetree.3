Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A23E2140E5F
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 08:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789721738; cv=none; b=oabuT+kE5nHzdNGTUvHqgMqIfeTkLF5eBhJliU7njzlCNoEkGwj6L3vAzJYMH9CKPwM9KTdWggrVfViYdHeDS7p5IHH8wMW6Y97T5up02q6mm+3PuNTwNMsc9ik4Wu7+hMn9lVcEXDfwgYvPYm/+IjUAM5Kq7ZJ0GPhD84sIq/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789721738; c=relaxed/simple;
	bh=4SpyM+ubUw3bgz9Qu1bRYiL8BbWXPtON1yrhQ/ykkA8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G9leqrv9F4Q4t7PpzT+Q0ClRFM9dhrgmyFI7v/cuxzbFi9Fo2X1LJ31WqUJC6GD5feoMODbmQMiiTwQxXeM5FrDiDCuEAAAlli76h5nagq9VxhdMPiXGX15GC42508JcKFsohM1ZAKXiQzLyr88+CQ473Gmy4T+TrVesLpNAByw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GWhxTCOn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GWhxTCOn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 189461F000FF;
	Fri, 18 Sep 2026 08:55:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789721737;
	bh=Q3vK+hrez7Ed1fDsl2TVjNVdL2Vp9oUFESzWid8IhF0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GWhxTCOnTtlFovIZHK2qxAQPf4EAqwRc2LiGpoMZpF80nlaiHWuvtipfLpZT5Rhkg
	 h7dGte7v2M8uzKuHphGdDgxXMM1ayQHzEnUNCQSUupkayOjhAUM7lrnFJy/nwlPJVG
	 +CwDXoUhoDyCp80GKNUd9GzuyUfl5xT9xi4ufKmHas+RKI9DlgBu91G4KEF7G2JWBO
	 dgzyj8wjun6MW4UZFKUtMbu1eAX1UL2Ll/7rqmZZTICBslkEb+Nh40Pbw/fBmFX9mI
	 hC9HuQ1jG64n1s0pW+vDTBVYM/wt5fg7YGCM7ivCI93N+6APTGbtfeWE9rByH/JG6N
	 SSWCCaD5uhQPw==
Date: Fri, 18 Sep 2026 10:55:32 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>
Cc: Maxime Ripard <mripard@kernel.org>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
	Stefan Wahren <wahrenst@gmx.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, kernel-dev@igalia.com, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 2/4] dt-bindings: display: bcm2835-v3d: Add an
 optional reset line
Message-ID: <20260918-nostalgic-enlightened-macaw-8f4e5a@quoll>
References: <20260915-vc4-reset-control-v2-0-cb3a25b07822@igalia.com>
 <20260915-vc4-reset-control-v2-2-cb3a25b07822@igalia.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260915-vc4-reset-control-v2-2-cb3a25b07822@igalia.com>

On Tue, Sep 15, 2026 at 05:51:25PM -0300, Ma=C3=ADra Canal wrote:
> The BCM2835 power management block drives a reset line for the V3D block
> that is independent of the graphics power domain, allowing the GPU to be
> reset without power-cycling the domain. Expose this reset line in the V3D
> binding.
>=20
> Keep the property optional, as devices like the Broadcom Cygnus don't have
> a reset line.
>=20
> Reviewed-by: Stefan Wahren <wahrenst@gmx.net>
> Signed-off-by: Ma=C3=ADra Canal <mcanal@igalia.com>
> ---
>  Documentation/devicetree/bindings/display/brcm,bcm2835-v3d.yaml | 3 +++
>  1 file changed, 3 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

