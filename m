Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794482117;
	b=Y0QADPnIO1HQO8d2o6N2sU6Jrt3YZYbxR8f5cfDwXAibkFoJPn30nG/qr2pqiDHD48dV
	 cp0RNf97BR1Vkd9qcaTe3WRcu5/vyhIYXfjbOue33E496Cbgz73PxmFsD6rC1Sgf9TcQC
	 7r9jDAGZkrClJ5sjmtUwQvoGtGHFBNR3H1zg9keuPbD+PxZSWMqor3dqb+u5nU67eGEjZ
	 iMBz4uKVFoWxXmcFwimX8NUQfk8+SOS9kV10YEZF807mPGIyq8sIOgbq6UqPSXuMpCQ8w
	 5hyUC+l/FIxVmdToAN3DRLoTudzgQxcko78nE/Q8816Bwn9F/pPZET9h1nwRxiwpV3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794482117;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=/qMJHEvjaVSYBra9NbQuR3MV9CtSgvDCK4Vtml0tu1o=;
	b=vR1psel5/wXAD3wos5QBZJgZRNUuJjcwdrXSU/2u4uNQgektxhPutiB2/MQYN9su2DSn
	 NESfmRK5yZC9B2548asPIx2XXt508fzcWR9PFXcHbdlU8f9ZDIbrNOCyWlEPmXcDMiGPY
	 vPf3c9gS8TgJD/Osn7NxYgu1FTXauo8E25qVB6Y6J7rFBUa4sJSCc2yT+0lRXyB0HFaZH
	 nfjRo6DqQKgI5YIfMr2wqVhJuDqt41y4o0dGdvupm8gpqburKLUPuULhK6Lm3x6Ut74Lc
	 0hiDjmZfCHsDmqPf90FyXLFImgUOpU2/O/qnPsrhpW4O2PHpZ6RNDC2Bvot5zasvGwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="EgQF/Ety";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0406D606A323
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 11:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EgQF/Ety
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E133F1F00A05;
	Thu, 12 Nov 2026 11:15:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794482116;
	bh=/qMJHEvjaVSYBra9NbQuR3MV9CtSgvDCK4Vtml0tu1o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=EgQF/EtyDrngE5ccMAcJ/aBqCCoLdd593celJeL57BNSu/1cRYxI51lfwU54iVE+x
	 TQZratkXzTdKsSSNkJUzXDjy9vei5PBD7Q278E6IWBD7pKzjxDI/I4QVvEDa/Lo8mG
	 TGmQWz7sgCbxteYFjw1eW91pkYQ/Qca2kczZir4ZoMVvkNSGtDsilB+MB/u6ZcS87s
	 kH69YdlC5vbmEM4KcPfLmbInSCTiH0kJefaUTNgZo5m3uPKMAtL0ix0ECPYewUUak9
	 Cd9QxGYwOYj31FonX/B0iJKnajfih+tmU5JX+Gos49oQYbOf6JLqEp7GZIn1QHeMqV
	 tz6PHjgF2tVqQ==
Date: Thu, 12 Nov 2026 12:15:13 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Linus Walleij <linusw@kernel.org>
Cc: devicetree@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
	Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jonathan Bakker <xc-racer2@live.ca>, 
	dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] dt-bindings: display: panel: samsung,s6e63m0: Describe
 ESD interrupt
Message-ID: <20261112-resilient-keen-chupacabra-d3de9b@quoll>
References: <20261108-b4-samsung-s6e63m0-esd-v1-1-ab5c252c9646@kernel.org>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261108-b4-samsung-s6e63m0-esd-v1-1-ab5c252c9646@kernel.org>

On Sun, Nov 08, 2026 at 01:41:00AM +0100, Linus Walleij wrote:
> The Samsung Golden device tree wires the panel electrostatic discharge
> (ESD) indication to GPIO82 and names the interrupt "esd". The binding
> does not describe these properties, so CHECK_DTBS=1 reports them as
> unexpected.
> 
> Describe the optional interrupt and its existing name, and expand ESD
> in the property description.
> 
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---
> Describe the optional electrostatic discharge (ESD) detection interrupt
> already used by the Samsung Golden device tree.
> ---
>  .../devicetree/bindings/display/panel/samsung,s6e63m0.yaml        | 8 ++++++++
>  1 file changed, 8 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

