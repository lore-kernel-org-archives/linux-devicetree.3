Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795432661;
	b=wZUZ5NehrUbU33eXhJ0aHH6q+5hGoEE+CsMgmjOPuF5B++mQ7WlKmhcWqG4Iwt193Tmt
	 BL4QWl3j8xvSd76z8YifM83ZRVwhEFh1OPRJ0bzyGwnc/0G2qRCQ1ODDvL0mV7//GMloM
	 vlFQpxs4gEOrtmKBXpzky2b/rmElthjmkf3wuMlGibWjqhVDUI0h2zN9qx0ZGsB/Si3Y7
	 P61tEPcxiFBn4TVWktannSxyPwmbdmUsDVHFjfeMOhE4USoemP83pu408xrz+8oPOjQEQ
	 NfbPxbqBdzIgafDLgcI9V88EXpU96iX6Ad55ZfdInOliChruJrI0qfyFlAqR5kpqYOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795432661;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=wRknIvw0cLKTwtOeyMRq4oTgIEAc2aw6LoyAAqqSPKc=;
	b=eoLqvkedt7TlGdcNFinClAQ5C0DGLHPpLrZlkQECWlTfxCqgZ+htY+YVyTq6eRXgqnwt
	 tS4Hnwgxc7KehGPIluglccBXjvNEztxOl3dECuKNYKOIqfpFb+qVyLvIui7pYNJJ4h5h0
	 sIty6/DjWIgHkeApfCF3umM/1q91wPGEZBbUC8px3G5rT0VQHfmT+F6I9Gq2zv6CQK5oW
	 ySoZ4E+S5bE0LckV0fyurFLJgtuOPdbO+s6sKxk18zM7ug+FWBmtJsXK6rhdLznoZyaTS
	 I+lq8pnwIRBjxdJa2p7glHjmmTpMn+rGcOyJAhW31f/h7CrXOkotE6VvJQTpk2ZDmxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bUf3NrwC;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3EB4606A31A;
	Mon, 23 Nov 2026 11:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bUf3NrwC
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF7A71F000C0;
	Mon, 23 Nov 2026 11:17:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795432660;
	bh=wRknIvw0cLKTwtOeyMRq4oTgIEAc2aw6LoyAAqqSPKc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bUf3NrwCLmq3AIfOM8M78iR/drgzopuAxa4sfnY8YUB9SYYqVN43asRwyLpy4IxmI
	 L5kNbrU8B3NVUq+UmV1nKnUlq4oDnzchEcye8BB69MKL/PjarZdSb5Am+lYimh9bOS
	 S7gXP2wd1VgHQRSQ7o18Bg3W4sqFx4jtYgDABv2bmzpbUScPSqyR+YOkB2cpJ02jsr
	 oj+Z8kIIJgOdrRTQyyW7YU5ZDvnobD/690NEzUN2aWB+/ri671whZnXftbMGuy2fLK
	 iLt4ikr5cUYwjv6QllZpH5oCDpi6sRPkbfieLTqwbH3kk+uujhfL8A+EUQZAq4BDfm
	 ItsxFJlC8b3MA==
Date: Mon, 23 Nov 2026 12:17:37 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Nabige Aala <nabige.aala@oss.qualcomm.com>
Cc: Mahadevan P <mahadevan.p@oss.qualcomm.com>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 1/4] dt-bindings: display: bridge: Add Parade PS195
Message-ID: <20261123-meek-salamander-of-abracadabra-3cfcbc@quoll>
References: <20261116-mahua-hdmi-v2-0-0b5af6bf9e70@oss.qualcomm.com>
 <20261116-mahua-hdmi-v2-1-0b5af6bf9e70@oss.qualcomm.com>
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
In-Reply-To: <20261116-mahua-hdmi-v2-1-0b5af6bf9e70@oss.qualcomm.com>

On Mon, Nov 16, 2026 at 05:04:04PM +0530, Nabige Aala wrote:
> From: Mahadevan P <mahadevan.p@oss.qualcomm.com>
> 
> Add bindings for the Parade PS195 DisplayPort to HDMI bridge, describing
> its power supplies, optional reset GPIO and display ports.
> 
> Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
> ---
>  .../bindings/display/bridge/parade,ps195.yaml      | 111 +++++++++++++++++++++
>  MAINTAINERS                                        |   6 ++
>  2 files changed, 117 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

