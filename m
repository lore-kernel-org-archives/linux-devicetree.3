Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E8362C1595;
	Tue,  4 Aug 2026 08:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785831003; cv=none; b=rBU2vO4WnoC5DBlV0x2o0M9JVy573k1/gNERIaRrclzjHsSyRUb8AeEUI9B4WVEws/I3vbSfd7seWz65Y0X62GbpZXUUfYCy7SjLKeP+Va42IUJqn4ld8f6M5b+kORSum+KKxDzpoQMToBQ0k0V8E7sNPYTyo5Ow2eUMd/ZtLoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785831003; c=relaxed/simple;
	bh=8mY82PSiBtSpHZ6DZkc1ecSmAKVNK50f4OvP5BpZGrk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VhLTiAQEbWN/gKG6UctDYTLmOSbBZ+Et2uooyxqMOZwApW5JkF1qbpAs8KiKpUlTgebG+t1D5APJWV3HyoLyuWN19+h5pF41ciSNV64XtzlJt7OuPJgbHlSxi8P/BvKBC06N2xRW4sAIbTWgNLdaSZiYIRajOtorELrG9KxuQpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KQVyEfBp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KQVyEfBp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBDC21F000E9;
	Tue,  4 Aug 2026 08:10:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785831001;
	bh=VrBXCN3GIeWBskfmTx6nnVtVNeo062ZuqGS8rhG0WW8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KQVyEfBp74+IpIgyL9awrzkbnHtYGOUCLbaBFBuvaEppXK+f+KsEYfm/fPwBfk/MH
	 yCAJpkVze88kLSph+kr8He4Gp7KaxnuRlYmB+Sza5aF2DymKaimGkQ3S+/lQgTjGgZ
	 oQpZx61helPfdFqRyQ+wPv9Z2dTr58CdE5lrk1WSkdMD8klmy38/9lXb2Qj2mw6sHh
	 j+esN1yqao68iRF0upoJxQp20UOhGAeYZMR4nFzCHxmrp80BijooAEjbp6C1lhJq2H
	 ht8FBZnY4bfsHbJ7tIulnczCTnI11B2Y6fZGtZGK4bcDdzI1jnIKiL6H0XBI3BTnzB
	 MJEi5b+iKUzjQ==
Date: Tue, 4 Aug 2026 10:09:58 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dawid =?utf-8?Q?Wr=C3=B3bel?= <me@dawidwrobel.com>
Cc: Jianhua Lu <lujianhua000@gmail.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 2/4] dt-bindings: arm: qcom: add the Xiaomi Mi Pad 5 Pro
 5G
Message-ID: <20260804-bison-of-good-democracy-09ce5b@quoll>
References: <20260730-sm8250-xiaomi-enuma-v1-0-ed6d8fb99668@dawidwrobel.com>
 <20260730-sm8250-xiaomi-enuma-v1-2-ed6d8fb99668@dawidwrobel.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260730-sm8250-xiaomi-enuma-v1-2-ed6d8fb99668@dawidwrobel.com>

On Thu, Jul 30, 2026 at 11:52:01PM +0200, Dawid Wr=C3=B3bel wrote:
> The Mi Pad 5 Pro 5G (enuma) is the modem-equipped variant of the Mi Pad
> 5 Pro (elish) and shares its board design, so it falls back to the elish
> compatible.
>=20
> Signed-off-by: Dawid Wr=C3=B3bel <me@dawidwrobel.com>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 5 +++++
>  1 file changed, 5 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

