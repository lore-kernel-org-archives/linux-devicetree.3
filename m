Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B7F7446059;
	Tue, 21 Jul 2026 08:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784621810; cv=none; b=uEuM3pNGwGykGug9x18ohq2sIOHethIgP/B8u8eHBYNeoN3gbrNndRvARJ55d1fvjDrEaB2eXK6zGVUiEd9t4DpAR4SBqoqEokGOo7rOhQ6Ym80tKGSkR7874wdZsp1RvcsZi6poZRm+57SBHKT0e77KwNz9j5YAv7V3Xjoh/fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784621810; c=relaxed/simple;
	bh=zIljJK0NIVqKkOsBsfQz7AGCIjNAzQ59PvsGp26XoJA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JNqT+YzGGyAf5QCiqU5PvNU1EGZwEO9gdZmiyEB6xzuwWnnh5UredCl/CLCtToZ8dutJsAPrj8M4sw+1IUtF1O7ZN4ZI7UcEwam022AbQNMZqaMLU1wR/amOoQ4l/jthNJU/vLJCubnheyvdYkMHdiqqg5J1Q5u1HEZdHHikic4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Sdvp391W; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Sdvp391W"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02FCA1F000E9;
	Tue, 21 Jul 2026 08:16:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784621797;
	bh=1sP7MrBG9kB7jM6qGOj+XgMqABnnG1TCj8gJkGQNSks=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Sdvp391WLQldmXz+4YPdhsdbstRVrkVPeGU4lOTAB3d0VMsb/C7bFoA6YCgZllI9q
	 KdkYZAanur3GvyruRTwGsgIUoHS05j3XqlRzuiLpWTQdGyGEcqQWTKYtY9j0R7dPYW
	 i4FwpeQV/Eohyark05xX3eNRA7lui9dNGb1q5hS3YAKoVGx6ZOKkc9ctmRtTQdbQ4F
	 XyziqUrN2pWIR5jckDoGGXcg8szYmzkU+ct6ypRPc0hlkfN9fueeBHRW2lL018xbnM
	 8v5qnOFpHX2kbgEPuJ3eEE9YtngEgKEN6YFNRPXu8Qzmimk4o1kJFoWP6sgU7BBasp
	 nDapi9ohxjaIw==
Date: Tue, 21 Jul 2026 10:16:33 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Simon Glass <sjg@chromium.org>
Cc: Heiko Stuebner <heiko@sntech.de>, 
	Fabio Estevam <festevam@nabladev.com>, devicetree@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	Bartosz Golaszewski <brgl@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jeffy Chen <jeffy.chen@rock-chips.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Michael Riesch <michael.riesch@collabora.com>, Rob Herring <robh@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
	Yao Zi <ziyao@disroot.org>, huang lin <hl@rock-chips.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/6] dt-bindings: soc: rockchip: grf: Add RV1106
 compatibles
Message-ID: <20260721-didactic-tan-dodo-112ffc@quoll>
References: <20260714193656.2196447-1-sjg@chromium.org>
 <20260714193656.2196447-4-sjg@chromium.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260714193656.2196447-4-sjg@chromium.org>

On Tue, Jul 14, 2026 at 01:36:40PM -0600, Simon Glass wrote:
> Add the compatibles for the general register files of the Rockchip
> RV1106: the main GRF, and the per-bank GPIO IOC blocks used by the pin
> controller.
> 
> Signed-off-by: Simon Glass <sjg@chromium.org>
> ---
> 
> Changes in v2:
> - Drop the grf-cru clock-controller child and use the syscon-only
>   group for the main GRF, since the CRU now provides the MMC phase
>   clocks
> - Use a single gpio-ioc compatible for the per-bank IOC blocks in
>   place of the ioc and pmuioc regions
> 
>  Documentation/devicetree/bindings/soc/rockchip/grf.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/soc/rockchip/grf.yaml b/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
> index 2cc43742b8e3..fd9235ac1334 100644
> --- a/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
> +++ b/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
> @@ -64,6 +64,8 @@ properties:
>                - rockchip,rk3588-vo1-grf
>                - rockchip,rk3588-vop-grf
>                - rockchip,rv1103b-ioc
> +              - rockchip,rv1106-gpio-ioc

And this also answers my previous email (pinctrl/gpio bank): you have
one GPIO IOC, not multiple ones, although commit msg tells different
story. Confusing. The compatible here defines register layout (see
writing bindings - it is explicitly documented there) so do you have one
device or multiple with the same register layout?

Best regards,
Krzysztof

