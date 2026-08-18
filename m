Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FF3F3BF68D
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 09:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787044034; cv=none; b=jrpoeoUs12RGItmVS+l7pVZ9frfGZAe+CBLQJynVy8yHt1L7riYal4GCekG2rHdqrtMfL6WNPBgwC6WSDsMmT5UwUWj1oSamu57yOSN/LSfFvajOSWgZswoKjig7pWWlZ5NWSXUrBcLMyyZnftno9svRrU8odyWTWZ8VOQvnp48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787044034; c=relaxed/simple;
	bh=G5GtsFhXRurro9n+DCfuYLQ9nH7iRtZYR6fJtNO7USE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dsCoJFBu1hRPRU+6hrE0V35t1zatfbhN6CCw2EXM+Rw1KdbQ7GdUgazwlGdVOo+hu79q9SoYpUbM3PJXKRbbPPSlM0Hl3bsENfEcGuvHvrgREwKSerE7YtDz+OwTFZ9T61wA4H4vzQBC6SqJ13YqIkt2WhA8z6uE/Z3GsThvNkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hY5a079V; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hY5a079V"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA4A31F000E9;
	Tue, 18 Aug 2026 09:07:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787044033;
	bh=G5GtsFhXRurro9n+DCfuYLQ9nH7iRtZYR6fJtNO7USE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hY5a079VmSMr3pzWYUzZNUsL0N1qS+wH9s8kGh7wZwo5nGkxkYGGcyekmxcE8odOm
	 P1cCFBuGcZnL2HAB62obJfIHjM1kVbvkljY7VC7Mta7dzP6m31Km13zZY27E9vGoij
	 uH2WSppKMP4MELRnfaCWWQSvO2Gw5nf9HAeBfEf8OWX+QUHk3MkGsDwJ8TeMPVrudH
	 /meNXZiRMSM0xywLT8ND+OYUEtGyfQcgbGKCMhahW0y87Gipv/jOcGDg5d3cE/I7B/
	 EnR+BmdWyo9X4omd5pimi5dQObi1FFMZqWGVSFzckpD/oKD7g98iDfmne5eBLHIvlP
	 f+ytDJ9qPi9Ng==
Date: Tue, 18 Aug 2026 11:07:08 +0200
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
Subject: Re: [PATCH 1/4] drm/vc4: Drop the undocumented brcm,vc4-v3d
 compatible
Message-ID: <20260818-tidy-melodic-sidewinder-e60360@quoll>
References: <20260816-vc4-reset-control-v1-0-896444373716@igalia.com>
 <20260816-vc4-reset-control-v1-1-896444373716@igalia.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260816-vc4-reset-control-v1-1-896444373716@igalia.com>

On Sun, Aug 16, 2026 at 11:05:40AM -0300, Ma=C3=ADra Canal wrote:
> "brcm,vc4-v3d" is the compatible string V3D support originally shipped
> with in commit d3f5168a0810 ("drm/vc4: Bind and initialize the V3D
> engine."). Commit 90d7116061f8 ("drm/vc4: Recognize a more specific
> compatible string for V3D.") added "brcm,bcm2835-v3d" in v4.6 and kept
> the original one around, because the Raspberry Pi firmware was shipping
> device trees that used it.
>=20
> That string was never part of the binding: the documentation added in
> commit 4653f22e9ab0 ("dt-bindings: Add binding docs for V3D.") describes
> only "brcm,bcm2835-v3d", and no upstream device tree has ever used
> "brcm,vc4-v3d": the first in-tree V3D node, from commit 49ac67e0c39c
> ("ARM: bcm2835: Add VC4 to the device tree."), already carried the
> specific name. The firmware device trees the compatible was kept for
> predate v4.6, released in 2016.
>=20
> Drop it from both match tables.


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

