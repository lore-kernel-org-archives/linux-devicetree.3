Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ACE43A1A56;
	Wed, 24 Jun 2026 09:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782294145; cv=none; b=SV+z1F3Poij1ln4dLSFZi8WwEMmxxmJpvFVdYQKCUNWbqLSEPUvOX/qNMSiJdJ+gZ+Zg7oTLvwn5/OtAkEb4OWP7DXyo1MxlzgqmEa7xzevIO8JUDhH1VnDTIf4iB9xVrUgdy7v1hYxTKtAFlINt0I/3yKvn21hTOSZshW33raE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782294145; c=relaxed/simple;
	bh=DwW0VX4GVqWfFeo8X4S15xeVrgJHGownLQ3IXADaDio=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cZCr5m679vVO2v/vAC4NyG8LhoJFpG9PAbHO4tfElKdzRljBx+Ku2owoUcob45Ff389Ymc7kLZjrYM7gRamGfoyUkma1/GEP0BXFf/gXD9f0rYi6Jv2OCku5hiTXslHPmL7CZkAoliSAj12RO0iRBroKA3ZoFQCHd/jDEo7wrpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MhAdwshj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MhAdwshj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8D801F000E9;
	Wed, 24 Jun 2026 09:42:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782294140;
	bh=eIb76RKd8kDbIfaU0zouCWtia/gRhkmDPPIIJTmfYmM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MhAdwshjP71OUnOWtCjiWxp+k+aBs5HHl/Q7usllXn7Jagb0KTazWILP/XY2chsIL
	 ikVKMWq3z8RCKoeefCekD+hWigt4u8z2xOym4fzPQPDn2ATlzYv7TRlVtU7s6JfZ+Q
	 +qDfYbh7x8cVghySlGCdfqBdo1PrkglNpJW/QGhWOEunjPmY99dSGP+oFzDoYRnXIu
	 6DyVztQLmTt5+N8/I29HzA+7siG6RZTUOJ/6CEASHg1NH9puFzZfj4W2clArt4zVRH
	 GHWF9N5HWXNV+gho2h088RgxD47QSzRx6Imn8vCgOSARXD1rqgHZ4XNkWbgR4xYyOV
	 s8tLy5Rmon1dQ==
Date: Wed, 24 Jun 2026 11:42:17 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Leonardo Costa <leoreis.costa@gmail.com>
Cc: laurent.pinchart@ideasonboard.com, neil.armstrong@linaro.org, 
	jesszhan0024@gmail.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, nm@ti.com, vigneshr@ti.com, 
	kristo@kernel.org, prabhakar.mahadev-lad.rj@bp.renesas.com, 
	thierry.reding@gmail.com, sam@ravnborg.org, leonardo.costa@toradex.com, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/5] dt-bindings: vendor-prefixes: Add Opto Logic
Message-ID: <20260624-immortal-hippogriff-of-promotion-ea09f4@quoll>
References: <20260623195741.495734-1-leoreis.costa@gmail.com>
 <20260623195741.495734-2-leoreis.costa@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260623195741.495734-2-leoreis.costa@gmail.com>

On Tue, Jun 23, 2026 at 04:57:37PM -0300, Leonardo Costa wrote:
> From: Leonardo Costa <leonardo.costa@toradex.com>
> 
> Add vendor prefix for Opto Logic, a Swiss display solutions provider and
> printing systems manufacturer.
> 
> Link: https://optologic.ch/
> Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

