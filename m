Received: from out-172.mta1.migadu.com (out-172.mta1.migadu.com [95.215.58.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE0AE476692
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 18:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784832937; cv=none; b=sEFmaZb+xD9vggP5xTgiz33FNp7sGVQYsX92ejJKtKR7TxzZj3+DHSBQmfBJ4x57e+vCit7Uqz3Kofp/ThDq9YfPQd62AThvmJ1uYNXuXsFNwQnWqtTasKJXtQl1rZZyykPXw3FAZx5fcZn049DDl/pKv90mKHpPmFWQHWQCPy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784832937; c=relaxed/simple;
	bh=o54D70suDaw58koHq9IxtK7frBP4sFmNgJgUK0vIW0w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r6rxVFXYszSW3AzlPM5RpOnmesqlwf5mvC11CHZKO+n0JMKjWB0AJ5lHBvHrcQKwJ0TRR7MO50vz67No3ipDcl0/LXVCQSerQWjbwIkViXNJ1aal9MSR+a4jeMvLqboo+dhGXB02YrA/2hheT9T9IMkV141uOx8J4HaPvt04JGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=HgxdoVJi; arc=none smtp.client-ip=95.215.58.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="HgxdoVJi"
Date: Thu, 23 Jul 2026 20:55:18 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1784832929;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=g69XKiXRUn1mEtZau/GQ0c7YGZnvp3Nd90/6YEjeaWk=;
	b=HgxdoVJicEbEPkRW8UJsPppvDUyg/6tYY3szfUajikFPwM/97fHBbnEsj+ZfbWehoJuboS
	/FWQJz8wQgnKgsyNhkrs9sgsyEo46NYz6xN3ovx2+SIWx7mJxptTLKZL1O+rgo8hLuSsMa
	NpGQZ0f0Xu5bE2nzUbVWeGQ5Swjw7cM=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Richard Leitner <richard.leitner@linux.dev>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Conor Dooley <conor@kernel.org>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, Alexander Stein <alexander.stein@ew.tq-group.com>, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, driver-core@lists.linux.dev
Subject: Re: [PATCH RFC 1/2] dt-bindings: regmap: add common schema for
 no-sequential-read
Message-ID: <amJiqHd6I45w_e0-@bombadil>
References: <20260722-regmap-single-read-v1-1-aaaf31591669@linux.dev>
 <cdd3b988-72cd-4143-9a17-ee0c57625e94@sirena.org.uk>
 <amD_vkMOrtKq5NvX@bombadil>
 <20260722201622.GD648629@killaraus.ideasonboard.com>
 <amEvJBOE3Ja014Ap@bombadil>
 <525338f4-cad3-4acb-94c5-a4b71cde9c02@sirena.org.uk>
 <amHznORUaOnUFyS4@bombadil>
 <20260723154541.GA764516@killaraus.ideasonboard.com>
 <20260723-hamster-juniper-5697cacade96@spud>
 <20260723161048.GC767247@killaraus.ideasonboard.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260723161048.GC767247@killaraus.ideasonboard.com>
X-Migadu-Flow: FLOW_OUT

On Thu, Jul 23, 2026 at 07:10:48PM +0300, Laurent Pinchart wrote:
> On Thu, Jul 23, 2026 at 05:02:42PM +0100, Conor Dooley wrote:
> > On Thu, Jul 23, 2026 at 06:45:41PM +0300, Laurent Pinchart wrote:
> > > On Thu, Jul 23, 2026 at 01:01:11PM +0200, Richard Leitner wrote:
> > > > On Wed, Jul 22, 2026 at 11:03:09PM +0100, Mark Brown wrote:
> > > > > On Wed, Jul 22, 2026 at 11:58:46PM +0200, Richard Leitner wrote:
> > > > > 
> > > > > > @Mark: I understood that if the fpga really intercepts the I2C bus, it
> > > > > > should be modelled accordingly in device tree. But what would be the
> > > > > > preferred implementation if both devices sit on the same I2C bus, but
> > > > > > one is messing up some register reads on purpose?
> > > > > 
> > > > > I think we would need to have a coherent understanding and description
> > > > > of the actual issue to know how to describe it.
> > > > 
> > > > Understood. I will try to figure out how the hardware is really wired
> > > > and come back to you.
> > > 
> > > Based on the information I have received so far, the FPGA is interposed
> > > between the host and sensor. It could therefore be modelled in DT as
> > > child of the I2C bus and a parent of the sensor.
> > > 
> > > New version of some of the Vision Components modules have fixed the
> > > multi-read bug, so we will still need a property in the FPGA DT node to
> > > indicate if the quirk should be activated.
> > 
> > Or come up with a compatible for the FPGA DT node that uniquely
> > identifies the revision of the RTL in use.
> > That's my preference for things that use some custom RTL that aren't
> > configuration parameters.
> 
> I'm afraid we won't be able to get that information. We have limited
> visibility on the ecosystem of modules and what the FPGA does in each of
> them.

Thanks for the clarification. Should I continue working on this topic
(i.e. modelling the FPGA as I2C controller with the sensor as a
"subdevice")? Or do you want to take over Laurent? Do you have any other
downstream work on the vc-mipi stuff, except the patches in your gitlab
repo?

I've additionally wrote "my Vision Components contact" an email asking
for clarification of the I2C bus layout on the modules yesterday. If I
get any new information from that path I will of course take it into account.

Thanks a lot, Laurent!

regards;rl
