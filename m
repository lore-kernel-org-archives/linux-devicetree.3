Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E45423C368;
	Sun, 12 Jul 2026 14:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783868287; cv=none; b=Zfv1objQhffwy9A2bK7nWdDnuOtmmyTpjEEyNfKLHEYvPqeZxwk6EdLXgAbWik6WL/NDyxgoJY8+oiR8rHmQIyENrbJnXW/pt3a1Ax/pD2/2nW/BuqPq4PxCPlA7BkgYuGLzKG5IBUMvTHvyr25kkHjpvXTckS/3zvv0XhynNgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783868287; c=relaxed/simple;
	bh=CmHjmJg3GXMcT6FNH0rtPtwmeN+snvxiyUP5SVVJETw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RJXJ/wUce9V3RpQVMJnXBcW3/r/KbdVOayJSGjs4tqUQaz6q/461CfY9LRVJSVKrluNaKEU6VItHta/J41jZBDByfRbO1Cq7uWXHkHn4gQvvvgrLJPZYL8t69MJ6nKl3w9W57TV3RNp9JACp7UdaZyNWF67uGSSXnNwvlATPJvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NF6HSxKp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NF6HSxKp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 474981F000E9;
	Sun, 12 Jul 2026 14:58:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783868286;
	bh=cYlrCYAk24mXMLq9q2GfdwKY9UjeWZbbcT39tHA3VgU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NF6HSxKpblUsmxb46pVdmmngRPByG+2D5w8fQIWWKziA+oqgrnsCwLSWW7tnZNJtN
	 Cv1B60rpWrsJup0ONxK9VM+liWOKr4H0EHBqy23w/4w3JHsM853UB8bnB5as4bhh1a
	 07BvC5WvGUbXGHHzpq+zOT8Be1t5MM6BCjQjGlCfC48rSIbRdkyOm90JtEeg/7gUyF
	 dB/pnGf+gCdFQjSVHzEdaNTm2JJwsV+495i/ma4GssOjawUEhT+y2jHEjPlXXGEpMC
	 yO+gQD5+cvrJZGRr96FFweVZlj8e949xV1sJyokFzOsk6haiShuKSACHoF4m8Ma29Q
	 Y/SQBu1vX6JFQ==
Date: Sun, 12 Jul 2026 16:58:02 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, 
	simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	matthias.bgg@gmail.com, jitao.shi@mediatek.com, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kernel@collabora.com, justin.yeh@mediatek.com, 
	jason-jh.lin@mediatek.com
Subject: Re: [PATCH 03/10] dt-bindings: display: mediatek: dsi: Document
 MT8189 and MT8196
Message-ID: <20260712-beryl-rooster-of-agreement-cdaee8@quoll>
References: <20260701121950.19454-1-angelogioacchino.delregno@collabora.com>
 <20260701121950.19454-4-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260701121950.19454-4-angelogioacchino.delregno@collabora.com>

On Wed, Jul 01, 2026 at 02:19:43PM +0200, AngeloGioacchino Del Regno wrote:
> Add compatible strings for MT8189 and MT8196 SoCs.
> These are compatible with the DSI IPs found in the MT8188/95 and
> others, but with differences making them not fully compatible.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../devicetree/bindings/display/mediatek/mediatek,dsi.yaml      | 2 ++
>  1 file changed, 2 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

