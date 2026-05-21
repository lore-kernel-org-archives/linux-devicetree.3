Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E271834F26F;
	Thu, 21 May 2026 10:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779359081; cv=none; b=s+lwP4a/Qnq43SwCBQ2YsG+02/NeV0PLBdDQgUhTloPUmfo2WtS4V++BkA2bz1ErzK9HWLT6zxaBsGjhAXu+pcbe79oT+ajm3VRVZfKoC2GZtfz0xt+Wl54iCJdzNh5OLNdLR/WDTxBidhN3rc1jNcFwk2Vq6hxS1b6k0PBBU/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779359081; c=relaxed/simple;
	bh=HpoQqrsqQ3ZxN7hD+bsKzIuJEdlXhDxZedBJnpEiXXE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tkuzCjwioS7hj7Hjnh6ycFV/VyWH2C47BFzOaWe+/K9eJx3St/hY/BMZaXSkuUvZsSaPkIKZaFaHnYHHM136OxjcRNP7Mi10QXfTG33WYq9OG9nz1RX8Pk7rXbI8qvuqqLAbSQdTi/XRNP2LKkwxjPmdZuUGkosDal7hOqbwOb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W7/A3sR9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W7/A3sR9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F8421F000E9;
	Thu, 21 May 2026 10:24:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779359080;
	bh=zTqHFhtYvOzBqX2EEjUQruE6dHaMpq5VRhcsBP+ftaA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=W7/A3sR9E2hNOR4AnxM61puIOLCVClnQtCIoj4jTvu64qlid1s3coboCQBJ9AZRgb
	 MtIZMjdhYRY7o7/J1gIL8y1p4wa3mJTafCgy+YruXSh/TxIDYyJ8w9BBAxrbjtxgqN
	 b1qzuKym57zf8+tLpxYUQnbB5DCLR+gnoFeAl4oaaEc7WWiauMJc7jjdb6rbEJRqI9
	 YMYI7thp+u2CvecjX20MnjfWgF0aZRxZjcO+7qO9IPu2bk9Z3b2j5NTIc8aCNf5rKS
	 shpf1JS5hu8hRAOlFXJpDcbDj4CxGBR/EAgL3DuORS1jfDuRX3lcb5tnHt7SoKLc+e
	 YysNTClCUfgvQ==
Date: Thu, 21 May 2026 12:24:38 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Rohaniyaa <rohanmithari09@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, peng.hao2@zte.com.cn
Subject: Re: [PATCH] dt-bindings: misc: pvpanic-mmio: fix grammar in binding
 description
Message-ID: <20260521-amethyst-termite-of-innovation-7ddccb@quoll>
References: <20260520154531.601160-1-rohanmithari09@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260520154531.601160-1-rohanmithari09@gmail.com>

On Wed, May 20, 2026 at 09:15:31PM +0530, Rohaniyaa wrote:
> From: Rohan Mithari <rohanmithari09@gmail.com>
> 
> Signed-off-by: Rohan Mithari <rohanmithari09@gmail.com>
> ---
>  Documentation/devicetree/bindings/misc/pvpanic-mmio.txt | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

You send conflicting patches. Also, did you run checkpatch?

Best regards,
Krzysztof

