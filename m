Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E766B3033DE;
	Fri, 17 Jul 2026 19:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784318393; cv=none; b=eyApZTkwzAQbSBtP4PnTd7rT86snBlFSMtU2i6MbJcozL+gAQlGC+kwUB7fzrH6I4e2EH4Gy/x+gVRyDTWrDp+hLvcnO2vGnk/rmiUdbQV3svwUJ0V9DIYikm2mZATYchfdkn/DFV/Ax4lkBQYp5IQ+L+73zRWlCo1KN3H+1JUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784318393; c=relaxed/simple;
	bh=3Zv2cRn3K8LU5b3gBb+katLSoQWUnjQNpQru9W8UlAo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rp+ckIK3IUBe4VsfsxDZB3Mi9TpecfTp8/wvKOXivBI+8h3/YO6k/lCvuxVk/Q+cDA1SHG7aEOiKq9n0G8PsMJpW+MLC/dB1Rx0xTox/RUSnAV1/53HASMl+PlEW5EmBAFHDZfLgPFKB7VVmFnaYWU0enFoVUFnaQmOd1jlZxik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GgnSTNEZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GgnSTNEZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD7CD1F000E9;
	Fri, 17 Jul 2026 19:59:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784318392;
	bh=bV/Io+zsnPmqBhppNdxP8U+BiGfJ4lrDJ7eHx6qQ8P4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GgnSTNEZNvEYOezdPmowldxslh+zdS3dJjoAQoftgqAibn5fyvzxsTxA0bM8RYQqb
	 9WGXB10xn+2S41PO/LWbs3EbFoBxZB6wfpB+fMwL3/j8eyXfPhHnxZneAka0tmnqPO
	 zHyACXlKtvq9eJQz71iDZFr9WXlA3nJxx46jBNYB9954MOtWpYhfpYXDXIUVn5n1n5
	 +L0RVJKA5IM2B0NMHzfjSRjjxdirdh3AHqiqHzea8Xa0vJrx6gosYcqRcVlEAv866+
	 CvL9HaYKlSiHx7zV2Cf9YNKNpvYo6SH8w0K3PIfFiT4hCFU7/8Ox8JkitJHihz6wL0
	 aeUdtAt6iKQrg==
Date: Fri, 17 Jul 2026 14:59:52 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Marc-Olivier Champagne <marc-olivier.champagne@savoirfairelinux.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	David Airlie <airlied@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	Felix Boucher <felix.boucher@savoirfairelinux.com>,
	dri-devel@lists.freedesktop.org, Simona Vetter <simona@ffwll.ch>,
	Jagan Teki <jagan@edgeble.ai>, Conor Dooley <conor+dt@kernel.org>,
	linux-kernel@vger.kernel.org,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Jerome Oufella <jerome.oufella@savoirfairelinux.com>,
	Quentin Lehoux <quentin.lehoux@savoirfairelinux.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 4/5] dt-bindings: display: panel: add compatible for
 DCLTek 300250 9.35in panel
Message-ID: <178431839160.2208367.2195697663410310276.robh@kernel.org>
References: <20260708213500.1867092-1-marc-olivier.champagne@savoirfairelinux.com>
 <20260708213500.1867092-5-marc-olivier.champagne@savoirfairelinux.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260708213500.1867092-5-marc-olivier.champagne@savoirfairelinux.com>


On Wed, 08 Jul 2026 17:34:59 -0400, Marc-Olivier Champagne wrote:
> The DCLTek dt300250 is a panel using the jadard-jd9365da controller.
> Add a new compatible for it.
> 
> Suggested-by: Hugo Villeneuve <hvilleneuve@dimonoff.com>
> Signed-off-by: Marc-Olivier Champagne <marc-olivier.champagne@savoirfairelinux.com>
> ---
>  .../devicetree/bindings/display/panel/jadard,jd9365da-h3.yaml    | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

