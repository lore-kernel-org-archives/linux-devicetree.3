Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AABB31714B;
	Wed,  6 May 2026 22:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778105996; cv=none; b=coCF4f4iSAsQoexCbUzonkYxujLP2NFlfuT70LTdjcyO5kGkifmvW3AfFN1uHr3pVURzGJPplPX0SeVhXbxH+ZoBoLluAsGyN6XgBfDlbQyKDAA2/eGMTWNXzvURgJXIk54mtwRiZGqU2ZDuSiIbgB7oQLXJBiFduyT6kHLBKJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778105996; c=relaxed/simple;
	bh=/+CKgoeuypQEaB7jyv2Zm3OW8jOi1NyTKSfrDXFqRhI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ks2gsL0xMOK+sqKVpxHDmhRuF/+Ter+Q6BFYd3tqZUGP75sVQwIWHKaIbOJEfoj6SAfmuf0u39wqSe+UbFh8kYxZ9NSQD9DK+XY4qsK7wwAKOlSGalSaBAH4upFVINqsbp7um0RP00CRt66zdRywyHpZ60UvpBlJgyA1wKBvIGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EpSWsfc5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EpSWsfc5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13E8AC2BCB0;
	Wed,  6 May 2026 22:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778105996;
	bh=/+CKgoeuypQEaB7jyv2Zm3OW8jOi1NyTKSfrDXFqRhI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EpSWsfc56Yj3uwb8u81FnIIC3/JdJ62h+fG/xSsxTuCfW/N7DssJcmHwyKyPcTTX3
	 CKON33G7l/otFmsXbqc9bWkoAL8U9g2je5zrzrAlhd+QY/W6ban9Nv2EUR4LmRjcJ5
	 UJLH4SD299tBu5o45uhAGc4+Cs/FcpJbElOA4mLeWiMUnXXCC0jzHYL7xQKp85qKqQ
	 e3r89avbtzCqaI1RDGHg7tG3OGAc5FL/ZVdGLJcpfZ40VLFIJsM38JQKesGmOZpmXe
	 RlupeC/briU7sP08A6Zn3qVh3TRXaHC2X5NS8mcT0H3Ke9RXzGzZg689DvhJtz31Bs
	 t/K7HnJ3qJSNQ==
Date: Wed, 6 May 2026 17:19:54 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Cheng Ming Lin <linchengming884@gmail.com>
Cc: conor+dt@kernel.org, richard@nod.at, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org, alvinzhou@mxic.com.tw,
	devicetree@vger.kernel.org, miquel.raynal@bootlin.com,
	krzk+dt@kernel.org, Cheng Ming Lin <chengminglin@mxic.com.tw>,
	vigneshr@ti.com
Subject: Re: [PATCH v10 1/3] dt-bindings: mtd: nand: Add nand-randomizer
 property
Message-ID: <177810599339.3410044.3676671440442113308.robh@kernel.org>
References: <20260505013453.980249-1-linchengming884@gmail.com>
 <20260505013453.980249-2-linchengming884@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260505013453.980249-2-linchengming884@gmail.com>


On Tue, 05 May 2026 09:34:51 +0800, Cheng Ming Lin wrote:
> From: Cheng Ming Lin <chengminglin@mxic.com.tw>
> 
> Add the 'nand-randomizer' property to control the data randomizer
> feature. This is used to improve data reliability by reducing
> cell-to-cell interference.
> 
> Depending on the hardware architecture, this property is designed to be
> generic and can apply to either the NAND chip's internal randomizer
> or the hardware randomizer engine embedded in the NAND host controller.
> 
> This property is defined as a uint32 enum (0 or 1) instead of a simple
> boolean. This design choice explicitly supports the "not present" case.
> If the property is omitted, the driver will not interfere and will leave
> the randomizer in its current state (e.g., as already configured by the
> bootloader or hardware default).
> 
> Signed-off-by: Cheng Ming Lin <chengminglin@mxic.com.tw>
> ---
>  Documentation/devicetree/bindings/mtd/nand-chip.yaml | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

