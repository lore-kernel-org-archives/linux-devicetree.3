Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795465322;
	b=gQaQz5t4cJ3skT1bbEAMYXxXVRQ1GRCp0a2wdONhQVl0XMKGosotfqiiudMbE3ErdWRI
	 I6VUl8fFjudcCBg12X0TSTj5qFytbyZlBlmi28ND3pZ9xp1zvVDQJ46l0RKg1i1nqPlpK
	 jJIk97X5tPeWzFOhE6ZBdxfDjN4qw9DV1QWmW+jvVKW5sxcpggWUORFlQfUHb0PRzHsag
	 JaEbb5i6mKO0yfdQpK/1vaVFohHGZbcreB0AfTDTuDUu2AVx22tba+qoXh3gOIBSrmTNd
	 5+4tyUbJvVL1iRKwJC3t6tYDTqUChw/ceO9xKJSGZ733IQjQ19EmWXFwq7PnciJA8kw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795465322;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=4uPGLAnAcPx9aw8ELBEXzJcU/YTR28Mt6fI9wiOkEXk=;
	b=Uz11/is5a95GxOqBxMP1ZODR26vcniQZShKeGTyQnhuOLiMP0S2vJUBUzc+sr5yoXXiC
	 s5pOZZfLySkNap2XRenp+EGbwMzjQLZDRPkOfkJc84JWEjHo/bsbBxRcA73MlbdIbNHKc
	 Dc6pA8KVurX9UQ9Qwx/e0twb1v/MpOeHeKBVMfdiiorGg6qVhTp2hS/yMJe05Qa0jcwji
	 HqoNEBOWBT0UwIgf3KKRXqhH7mI32gGEHUwtGM7dk97JEl7rT2gJjy1cPOQ1SvQkfFbM9
	 JRJl0Ztky5KwaZsPZl2u1euhr94dOihM4pzm3AdcI/wOZK6SyiyzvTi4CXutvB++iig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UFQzJW4u;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 608AB606A32A
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 20:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UFQzJW4u
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61A161F000C0;
	Mon, 23 Nov 2026 20:22:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795465321;
	bh=4uPGLAnAcPx9aw8ELBEXzJcU/YTR28Mt6fI9wiOkEXk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UFQzJW4uga04lxqsn02e+WFFyKwD0SkIuQNMv72T1zd39oTGEoPXUqele811c3DBc
	 j39Mvz5Kb25qqT0fn60zBv5cXv4SEWr+dnS6vqjhAePNYoL4zhntOxXCLqDKJiI6Oh
	 g4flffywo+PrrgPS+E5CYC+JP343pbctY1OoeRL6j5bd98ze6cWn7TM4+QsCBspv7Y
	 TQCRvwbozIWAcFM4u8z8rF4/A2YPWsxO/PxD8YfqV9OZnu4FpE6i7faMoSelOm3Xl8
	 lMWHY5exkT1f3Ep8079xlIbWKlKTDZ0/oy8Pmz1ahLNNof5i0WrhW/WGOUmHW5A6vy
	 Xw+zvSOR4VgKg==
Date: Mon, 23 Nov 2026 14:21:59 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Gerard Marull-Paretas <gerard@teslabs.com>
Cc: dri-devel@lists.freedesktop.org, Conor Dooley <conor+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Alex Lanzano <lanzano.alex@gmail.com>,
	David Airlie <airlied@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Simona Vetter <simona@ffwll.ch>, devicetree@vger.kernel.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH] dt-bindings: display: sharp,ls010b7dh04: Add LS013B7DH01
Message-ID: <179546531526.1777962.3727881292046293374.robh@kernel.org>
References: <20261122093426.72677-1-gerard@teslabs.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261122093426.72677-1-gerard@teslabs.com>


On Sun, 22 Nov 2026 10:34:26 +0100, Gerard Marull-Paretas wrote:
> The LS013B7DH01 is the 144x168 Sharp Memory LCD of which the LS013B7DH05
> is a thinner revision. It is obsolete, but still used in products.
> 
> Both are electrically the same, taking the same SPI commands and VCOM
> signal at the same resolution, so the LS013B7DH05 compatible can serve
> as a fallback and the sharp-memory driver drives it unchanged.
> 
> Signed-off-by: Gerard Marull-Paretas <gerard@teslabs.com>
> ---
> 
> Notes:
>     Checked with dtschema 2026.9: the steps of dt_binding_check run by hand (host make too old), yamllint and dt-check-style --mode=strict.
> 
>  .../bindings/display/sharp,ls010b7dh04.yaml   | 26 +++++++++++--------
>  1 file changed, 15 insertions(+), 11 deletions(-)
> 

Applied, thanks!

