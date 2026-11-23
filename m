Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795473006;
	b=of6yTEB73iR5yku63kqtSPEnhxMhFLcSCua3FnmixWbCghBu3ePZwrT5Tf/ce25VrVl0
	 7NcCfw6IYVTNZ6djAatAzjx3Ut1evVIUWyKhrimqCLJpwsUKausTzw0/0UMotHJ6mn4PI
	 43lTtvysLAll2NMs84CYs9XpKbZjs3ps1Uxk1Lkg/SArbn1v2WK1OX5M0Dvldv/Ofz2+Y
	 fKCHmXhCQ8GwTVUOLWUlWr1y/PU9HY6n417GODL8ct5Izg7vUmn+Eaoxhp3yCJN/FsmJ0
	 raLFNt8fXdKlR1QSbT9OVU2lyVIicuaTrbJygd1P6f7mrBXkVc9MkQjDu8u+U8/zm1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795473006;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=Vonja/PWgylse+6hBXyJmA35GVq/syIKCdpb3rN0/Ug=;
	b=kJuCy13LwjaW0st2baHz28RhdRFTCLGevEJ16D4yCcxrA4SeKM5xjbIR1aMhV1/smF/V
	 U7eKYU2YOy9avICzTduYgmonHLLCGHbOdr/5WRCtMp92eDsa6qtHgj8eEsB9ynhAehm0S
	 EPOQ5reLu9CbV19eAf8DTYtCGJFmOEAbyTeyQ5ZwGN3iU1rqgOyXZk/UWP8r0eo37Pspl
	 i6DToQ5CKOmFr7Riu9UMBucRtSEgmNRKgkOGdrtGfLcFG3FfhcYPsnwGetUdRSPOSeCgD
	 WwEghvyx6eL5c77V0G1cSDuzsnm8MCqWvaNiBxGYK85eWE58dviy8/6hluFBZMJjAjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="lzGln/yR";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 094B6606A326;
	Mon, 23 Nov 2026 22:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lzGln/yR
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29DB41F000CA;
	Mon, 23 Nov 2026 22:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795473005;
	bh=Vonja/PWgylse+6hBXyJmA35GVq/syIKCdpb3rN0/Ug=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=lzGln/yRz0K8gY3hSZwX2LcHlzexYk9HaYmvAPnNhXpSPS4+QBaa7uf/ly9tyKVCQ
	 GoFTfFuDI1Y1q5tacn+dbIwATPLdJkVCLKFmgvbSYN4owZLfj/xf9spP7YNyUGiVxl
	 j1O5Z3ubd7CMwP2nZXMGRB9YhmTEpzbUqYmFt4cpH+fuplUeeTk/1PjYExrHG7uHOr
	 m3g95Ns7YbKow0C6U69Ac839inaU0aaEqE0FyFB4hxTL9Fvg5uOeiVZv0y1B/jAXY1
	 FFU1GvOaTFof9Z5A95t5tASH7cW4jneouftkDHQQFGakpcDV6woZUryvaQVSU54pfY
	 LfKyqWOAL35xg==
Date: Mon, 23 Nov 2026 16:30:03 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Roman Vivchar <rva333@protonmail.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	Simona Vetter <simona@ffwll.ch>, Heiko Stuebner <heiko@sntech.de>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	David Airlie <airlied@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	Maxime Ripard <mripard@kernel.org>,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2] dt-bindings: gpu: arm,mali-utgard: add mt6572
Message-ID: <179547300234.3122395.932903973826023560.robh@kernel.org>
References: <20261121-6572-dt-mali-v2-1-1c3925ec7ad1@protonmail.com>
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
In-Reply-To: <20261121-6572-dt-mali-v2-1-1c3925ec7ad1@protonmail.com>


On Sat, 21 Nov 2026 19:55:54 +0200, Roman Vivchar wrote:
> Add a compatible string for the mt6572 Mali-400 MP1 GPU.
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Roman Vivchar <rva333@protonmail.com>
> ---
> Changes in v2:
> - Pick Krzysztof's ack, resend
> - Link to v1: https://patch.msgid.link/20260810-6572-dt-mali-v1-1-fb908627bf23@protonmail.com
> ---
>  Documentation/devicetree/bindings/gpu/arm,mali-utgard.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Applied, thanks!

