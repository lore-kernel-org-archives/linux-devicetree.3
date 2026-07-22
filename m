Received: from out-170.mta0.migadu.com (out-170.mta0.migadu.com [91.218.175.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AB763126B2
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 18:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784744696; cv=none; b=Itg8GpiVNTuC8iBk9tew+wFTJF+gaZQGo0k6/J8WOREuz71D6HmJFPNIzYnz47q/Y+H3Q3S/gndz+vLaH2kRRJvQwsoD/81t9k75pBVPIzVpFI1V6GpMHrzECobS/rP8UEGa8RXjuIpW9Sydf2mdvRS0XpWvHIr17zHDbShzNqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784744696; c=relaxed/simple;
	bh=rghimowWPmjK74MlBp2FXyE6YL8HiU2SDJ7DAawS0eg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=obSqKbXd8TUuibzdrsgQ9iah22LE/7mdUTedU3ht7IcddCvxzJLI+xaspo5BxV8GD1Tat85364harre/TGwFzma9rO23+hmy1Mbvun+kbgNGDCev49vSh5M5g08UoqAmRsfiq9r+tydF/9QLmasBiMC9XghJHvmJbExg6FrETng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=rEYPIJte; arc=none smtp.client-ip=91.218.175.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="rEYPIJte"
Date: Wed, 22 Jul 2026 20:24:37 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1784744682;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bFI+iEkU1ean1qsfFHxd28ILlVMGZK3vjvSQny9gw5M=;
	b=rEYPIJteXiADVN0paZ2xbU5HZoSidadfW940/yVh21qgyTCMDeac9qa17vd+PPtfPYcsDa
	QVoGaOs5KLvoX4VnOfa1lrZ5l2Oh5XmrRk/LO12uV8teqzKesBclQHXMvsIYwf0Bh+9eDk
	rv1MominPl8/E98ugA4qEYyoOX58/eY=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Richard Leitner <richard.leitner@linux.dev>
To: Mark Brown <broonie@kernel.org>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, Alexander Stein <alexander.stein@ew.tq-group.com>, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, driver-core@lists.linux.dev
Subject: Re: [PATCH RFC 1/2] dt-bindings: regmap: add common schema for
 no-sequential-read
Message-ID: <amD_vkMOrtKq5NvX@bombadil>
References: <20260722-regmap-single-read-v1-0-aaaf31591669@linux.dev>
 <20260722-regmap-single-read-v1-1-aaaf31591669@linux.dev>
 <cdd3b988-72cd-4143-9a17-ee0c57625e94@sirena.org.uk>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <cdd3b988-72cd-4143-9a17-ee0c57625e94@sirena.org.uk>
X-Migadu-Flow: FLOW_OUT

Hi Mark,

thanks the quick feedback.

On Wed, Jul 22, 2026 at 02:59:12PM +0100, Mark Brown wrote:
> On Wed, Jul 22, 2026 at 10:42:46AM +0200, Richard Leitner wrote:
> > Introduce a common regmap dt-binding schema with an optional boolean
> > property no-sequential-read to describe hardware integrations where
> > reading multiple consecutive registers in a single operation is not
> > reliable and registers must be read individually.
> 
> > A typical case are imaging sensors used on vendor-provided camera
> > modules whose bus integration does not support reads that advance across
> > consecutive register addresses. In such cases, single-register reads
> > work, but bulk reads do not. This restriction is a property of the
> > concrete hardware integration, not of the chip itself. It therefore
> > cannot be identified from the device driver and duplicating firmware
> > parsing in each affected driver does not scale.
> 
> No, this should not be a DT property.  We should discover this through
> the bus, just like we do currently for the various I2C quirks that are
> advertied by the I2C subsystem.

What do you mean "discover this through the bus"? As mentioned in the
commit message there is no possibility to detect that within the affected
I2C device drivers.

Or do you mean that it should be "discovered" by modelling the MCU which
"proxies" the I2C traffic between the host and the sensor/device as some
kind of "parent" device of the sensor?

Or something other?

Sorry, if I don't get it, but currently I see no other option than
providing this information somehow via device-tree. No matter if it's in
regmap or I2C.

thanks & regards;rl
