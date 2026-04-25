Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2C98383C63;
	Sat, 25 Apr 2026 09:40:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777110003; cv=none; b=NQIiTO6+v5T2ihdoMS/OTxuH4S7H8o1xxYecYN5Ydn3Agh6i8wAMElDN9+Mw79pm/XVg0D9z17wguvPBTV+y6hffkm2Y9mUw5K8UjGMPEO6+2FoPRDL+6bwrptQQxxcGEyiOhUhFqh3L7yil7AmmfXoKxehgnJHx7O/Dj5UyzFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777110003; c=relaxed/simple;
	bh=hadfq1e14Gw0z8hl3xYnUIRAy4eOpTXE+uwQc3E3bUo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JNiSZezd3vQnbN7dihrKI50TdY9mG7ISNTQo/A+vUCUvTmaJiYOaO9fsSG2r7kUeZ81xlKZXwwh0McRJkg7TsOVL7Gpuj6aiwfwOOVTYZ67sPH1xfTy4XJb44PssR550SMJA+h1Lm8xv3o7vezN9VZYLcC7F64uXksf2rxyORyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Tur0dzb5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Tur0dzb5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECBC6C2BCB0;
	Sat, 25 Apr 2026 09:40:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777110002;
	bh=hadfq1e14Gw0z8hl3xYnUIRAy4eOpTXE+uwQc3E3bUo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Tur0dzb51y8TATb8JDT+pezGHhqTSQBt0Swj6mLygDhBhkbd2DnhODtFMYJ82MVx9
	 67VHfvDOqkcVDstMrTyeUX70NeYCpcu4Ww1heMSvW5SHvZO3tkmyEOLBS1eIXaARjZ
	 lv2HNVtOXaQryKd/1TlYTClu6RK3QWHkc1WuU9P13UoQ3CXuIp0z2V0PQr/rtq+hkw
	 S67KgSGLqr9nHDCKlm/gHjYOr5RQMOM5vohrQhcxidoc/AnRtbbI42QZsg7qou01o2
	 q9z4kJCONakyfU6UlSdYxZ8gHX3Xwx0tZSb8QPAA4zjEVy2CEHJMDaopmaPWfwbVlq
	 AaODB8KgAVpow==
Date: Sat, 25 Apr 2026 11:40:00 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dawid Glazik <dawid.glazik@linux.intel.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	linux-aspeed@lists.ozlabs.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, maciej.lawniczak@intel.com
Subject: Re: [PATCH v4 2/3] dt-bindings: mfd: syscon: add
 aspeed,ast2600-i3c-global compatible
Message-ID: <20260425-poised-accomplished-hyena-d2c1a0@quoll>
References: <cover.1777058942.git.dawid.glazik@linux.intel.com>
 <41d66492e1a1d42f6888459288311094c8b7bc51.1777058942.git.dawid.glazik@linux.intel.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <41d66492e1a1d42f6888459288311094c8b7bc51.1777058942.git.dawid.glazik@linux.intel.com>

On Fri, Apr 24, 2026 at 10:21:00PM +0200, Dawid Glazik wrote:
> Add aspeed,ast2600-i3c-global to the syscon binding compatible
> lists to document the AST2600 I3C global register syscon node.
> 
> Signed-off-by: Dawid Glazik <dawid.glazik@linux.intel.com>
> ---
>  Documentation/devicetree/bindings/mfd/syscon.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

