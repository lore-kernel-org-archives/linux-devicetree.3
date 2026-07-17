Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A48037997E;
	Fri, 17 Jul 2026 08:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784277521; cv=none; b=hl97HUfEdrjEsJ9SU9KzpE+o4izR0Lf/fywppE1avauzAB67KzxbA+YB6iQPu3YwFcfaMvwtZV3zEbQrEmsa7Zpf8z5rgHqiHo0bqFn/kg3QGfn7iKpqKzYTrfERX/BjMdJds7abO/6Lg6Qx4HAZizKuEmVkq94YLq3W9A3sDCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784277521; c=relaxed/simple;
	bh=JO9lZr9AOnxpk03NBQMXO2SCByjAQ78w/9N3gr1bg3A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F3fy57eS+CUExyTyQvb5lQx9pAbPcpnxo8HqMr9J6std6sFzbTjFqEl7H+Km7WMrhSv6SnJNdE909al3iIxgatTnxu2vRjrhGjrvNkd6PD0y1m+6KS+RRXcg/Y3FomPdm4ul4l2lUeyq2nqM1ZmbuOjCkVj1Ju8nmWdmXeqvnwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MlUgvP3L; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MlUgvP3L"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5243D1F000E9;
	Fri, 17 Jul 2026 08:38:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784277520;
	bh=6Sy6bLu9Q3NOEH8nZ+KczW/y7ldpRksGLq6zS2Mbwf4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MlUgvP3LbouDsJKh3lNGWq26S6zD6qpcNMHht7j74BGZOhIqHvnqIz/xIZFQRsPKW
	 uWIdKk3cAUDH0/kFYiXF3TvXDR7y7ToEsMo+On3E5cVbXlP7ksOXEZ3/XX0R8j8+QK
	 8YbXUZD3kCG0DFErcfxU/5ym6p3/cgmQEqpTKfVJ2tpqUwqlWofmBSshnQEREY3LdP
	 WUELjNe1sRgb+ZrXZSIWShDWHRZRanyu2jdqThFu5M0mvJHvMXiK3eMyqRXsP/hJV/
	 PS1eNL21uTjUAqYwAtY++I+CyU0NKY11RMumQ44UkF52WEAkDeiOIx4Gr7pcJrY6fz
	 1kXzDqhf8fx3Q==
Date: Fri, 17 Jul 2026 09:38:35 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Salman Nabi <salman.nabi@arm.com>,
	Vedashree Vidwans <vvidwans@nvidia.com>,
	Trilok Soni <trilokkumar.soni@oss.qualcomm.com>,
	Nirmoy Das <nirmoyd@nvidia.com>, vsethi@nvidia.com,
	Varun Wadekar <vwadekar@nvidia.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 1/8] dt-bindings: arm: Add Live Firmware Activation
Message-ID: <20260717-lucky-gerbil-of-courtesy-162f0e@sudeepholla>
References: <20260706134455.132091-1-andre.przywara@arm.com>
 <20260706134455.132091-2-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260706134455.132091-2-andre.przywara@arm.com>

On Mon, Jul 06, 2026 at 03:44:41PM +0200, Andre Przywara wrote:
> The Arm Live Firmware Activation spec [1] describes updating firmware
> images during runtime, without requiring a reboot. Update images might
> be deployed out-of-band, for instance via a BMC, in this case the OS
> needs to be notified about the availability of a new image.
> 
> Describe an interrupt that could be triggered by the platform, to notify
> about any changes.
> 
> [1] https://developer.arm.com/documentation/den0147/latest/
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  .../devicetree/bindings/arm/arm,lfa.yaml      | 45 +++++++++++++++++++
>  1 file changed, 45 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/arm,lfa.yaml
> 
> diff --git a/Documentation/devicetree/bindings/arm/arm,lfa.yaml b/Documentation/devicetree/bindings/arm/arm,lfa.yaml
> new file mode 100644
> index 000000000000..ef8e250f2da7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/arm,lfa.yaml
> @@ -0,0 +1,45 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/arm/arm,lfa.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Arm Live Firmware Activation (LFA)
> +
> +maintainers:
> +  - Andre Przywara <andre.przywara@arm.com>
> +  - Sudeep Holla <sudeep.holla@arm.com>
> +
> +description:
> +  The Arm Live Firmware Activation (LFA) specification [1] describes a
> +  firmware interface to activate an updated firmware at runtime, without
> +  requiring a reboot. Updates might be supplied out-of-band, for instance
> +  via a BMC, in which case the platform needs to notify an OS about pending
> +  image updates.

What does the below described "interrupts" cover or doesn't cover? Both
in case of in-band and out-of-band. It is not very clear for me.

-- 
Regards,
Sudeep
