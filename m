Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794566140;
	b=CA/pacKKfdH9QZUscvv76OOd91KEP6knTImPrEK9mKkqBE6GSmyGjGXQ63FwT46TOx98
	 dZRVgQpcAgPjARGu63R2YZl7zDEpcT0U6FtUfaf4B8Na6A4WD+ENs5uNPBjnhGECiTCQ8
	 iy+PanGH+MU9eg1j+lpCEQmuiqEyWong34yw935oh5XE9A5xqRMp33KNfC9p8GHJBpPTo
	 s8hgTRH06oubJ9i/b/TxDFk0f9qL5vBTGjmsWRz5uI8ZuOhXbQl67f4BO8ijnV9DO58Aq
	 G3F0Xv97XARDKgHBeWtCxtX2wuZbQ0D4TifENYXeXuO8c2jTKb7X1flpjR8Of2csCZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794566140;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=UerP3CLloOzIBHQJLyt3oTTjvTEtdcx5/xHOh7RUlH0=;
	b=3CsfiOu3pdk3/QKRyQuiuOlcTPBDrcD38Yxl9as75BH4/CPYDiHKBDacxh6AxHU3siXC
	 Vn6LeiS+aiWNFDTYgOw2YmFLCy5rxJEggssc37BQArFtrYZ4XujqCMIwfQIpW7N1Sipdn
	 aHTNEdWV2pVeDeHNBKBkI9gDIba8pSivV5w8OCzFmSoYCgkA+SrgzfX0OPS5Qh3s0oBQ+
	 Im1L22uYKx0TQx/VYYG7cILE9C6UJY/ZZ74izz8y1K2kItTl9YsVgRntzDHMhEK355IeX
	 1IWt6OXlckrFT24ttQW2EtdgocdKjSoLG8dj5Ep+UOMOMa240iR4sjAXwBNpmf2MfcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lqlwZJjH;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF66A606A321
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 10:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lqlwZJjH
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 551C41F000C4;
	Fri, 13 Nov 2026 10:35:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794566140;
	bh=UerP3CLloOzIBHQJLyt3oTTjvTEtdcx5/xHOh7RUlH0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=lqlwZJjH/SxiImumqQDPqzBpG6eSGITEoRZ0RajCgq0OLV4FLm0JPWnW2kVduuDdg
	 Lojs7Qo4rEWxiSPWBlb4JYOy8WQmjObsKc3WwdaLj5Szk7SVEjmSpRYb8tYBIIku+r
	 KFrgM2ZnXwYmJonm7FPo63Y115zegwZCOEos3/iQhUjkTFW1diTDz4MY0NXJJaaQXt
	 A0mAxvR+NqaVCEWMmrhyvJwafJ0Rmg7XCgTyTmswA8DXFJTIyTSImlEWJteK7lZKyD
	 Ro+z3aXLTfALUJjXmte5iAntYtHzzWZQ2KvTCeMv5q5SSX1/OxZ0jKglGS6TfmzXtz
	 buNGOPEgXrjPA==
Date: Fri, 13 Nov 2026 11:35:36 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Luo Liu <Luo.Liu@cixtech.com>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, wuyi.shen@cixtech.com, 
	cix-kernel-upstream@cixtech.com
Subject: Re: [PATCH 1/2] dt-bindings: display: add CIX Sky1 DisplayPort
 transmitter
Message-ID: <20261113-mustard-parrot-of-downpour-6ceadb@quoll>
References: <20261109103010.110911-1-Luo.Liu@cixtech.com>
 <20261109103010.110911-2-Luo.Liu@cixtech.com>
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
In-Reply-To: <20261109103010.110911-2-Luo.Liu@cixtech.com>

On Mon, Nov 09, 2026 at 06:30:09PM +0800, Luo Liu wrote:
> Document the CIX Sky1 DisplayPort transmitter. Each instance sits
> between one of the SoC display pipelines and a DisplayPort PHY, and
> exposes the DP register block together with the RCSU block used for the
> link setup.
> 
> The controller is described as a DRM bridge whose video input is linked
> through the OF graph, and the DisplayPort PHY is referenced through the
> generic PHY framework. The RCSU adapter port, the video stream and the
> maximum link rate are described by "cix,adapter-port", "cix,stream-id"
> and "cix,dp-max-rate".
> 
> Signed-off-by: Luo Liu <Luo.Liu@cixtech.com>
> ---
>  .../bindings/display/cix,sky1-dptx.yaml       | 108 ++++++++++++++++++
>  MAINTAINERS                                   |   8 ++
>  2 files changed, 116 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/cix,sky1-dptx.yaml
> 

Feedback from Sashiko looks reasonable and I do not see it being
responded to. Dropping from DT Patchwork.

Best regards,
Krzysztof

