Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A33453515EE;
	Fri, 14 Aug 2026 10:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786703822; cv=none; b=aaUwHlMFYkqMhh8bWgqkDbsXLA7RoyO2/17HasZk4bKqOYb9jPy+zQ8gOPGCGPPBgqSpAjbU+xsYE52uWomVtwTq/+rjRKkMN9DhUOs97Q/SMWHs36Kg5yMDDYljdgnzB3HI/7QEXcI2Tf5hmi1QeP55qaesTzyd7vPfRXNQYJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786703822; c=relaxed/simple;
	bh=mhBFXC+ZR25f8KOXVUpz/y5wnKdP0U5PozYTFgZxfKs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cfu7Thytq7eMAc4M6khUlRaB/iaYRY0pUp8nm7lSL5Qc74XUNmAhS8uj99jzE0uEceFqIe2DqZ/TM6zBiwTsKhI01Gcj6xM3krX9gPRyD5BaMUfR0tG15n3Ww4hdKz7b/WsPGJ/4jE3vNXwZBniUXmf/XBkqzVOta7v9XhwG1kM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j5nndVoo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j5nndVoo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 806D11F000E9;
	Fri, 14 Aug 2026 10:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786703815;
	bh=TLTSMt3dVlaVBE5gQDt5OMCyAy0P0M4s4BwBgAereRQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=j5nndVoout99Q2akG6iExCML91Yf79Dv7l30g1bbaAW+mQKMTCyS7+Fq1ZO/cjbsh
	 Kc7B5D3KjEWftsTEsACxy4m6a4T88gdZn4uTkad6LpK7DQSIezrXlrDHWiZIfrgVVG
	 DQHG3yYUrS3fgsoKMNXYG58SwvsOj5TQq+8B6lk99BPbAFz9Wn75jkph0SeXbjIFZq
	 KRLsgBByhSPsvgupVYjH8g2Sd83ehnFm51cPdGSJQ5jlZQh1R64rV97FoPv1DkHv2N
	 As08vf9z0a+wXw6HAw/GXFI1ux+Svrt8Y0UBcWAZNO6k8FfGMevvymh2HiEZ/kInK5
	 KHupuu18DkRNA==
Date: Fri, 14 Aug 2026 12:36:45 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Roman Vivchar <rva333@protonmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Heiko Stuebner <heiko@sntech.de>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: gpu: arm,mali-utgard: add mt6572
Message-ID: <20260814-portable-premium-avocet-eafbe2@quoll>
References: <20260810-6572-dt-mali-v1-1-fb908627bf23@protonmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260810-6572-dt-mali-v1-1-fb908627bf23@protonmail.com>

On Mon, Aug 10, 2026 at 11:16:19PM +0300, Roman Vivchar wrote:
> Add a compatible string for the mt6572 Mali-400 MP1 GPU.
> 
> Signed-off-by: Roman Vivchar <rva333@protonmail.com>

Does not come with resets?

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

