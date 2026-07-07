Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4257441A76C;
	Tue,  7 Jul 2026 13:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783430285; cv=none; b=LD0BTLTCtDLt2OdAoRaI3x9xXTxq/ceiYTcFbMmUkuduOTOpcBI4QTGtlLVyJrWOzXh/RLojRVAQDuf1J06mx1tXKHHQUOwTGt3DxURNMM0h7i3hBO/d8aBiZj/XdE4eH65aviPm56wDKBCnvlQpmeGF6d9Jzb6YuL3Ivy8H/LU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783430285; c=relaxed/simple;
	bh=TeVrjP8YDYlyuxi5LZA2HIH6I3fMop2PIIr2LZObJHM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ptu90vttFFK/VM5PPrKfvwcDj2jHqTGF/Z4FVwURxilez55Scjes077c6uU6wazDRu+HMJm2fEWTcbsLPyKWLlZ1UxBYOjDhBCQNpxmtgyfXgBGI8KfJHzeR+oXh+B9a7OALBNeRR9iy2NRgWGE26eZ8gJGjGqKHkeTKdCBPv2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QPj6KYKz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QPj6KYKz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B20A41F000E9;
	Tue,  7 Jul 2026 13:18:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783430283;
	bh=PWnX9C/SV15upZabbY7EEF56d8byKl3/f6RZuWgCkWg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QPj6KYKzxvYIrnYl6GebJ7lcp4Lcuorgxq8HdVZV7t1UAaRWk2LANEy2qr/9y2YbX
	 VXQTYDzxNZWXar/uKdqG+VeZ1oTvNT2Kx9A4+89ePmo7YFRrmQJdj9AudKahrrVoiT
	 ca/23xmmJY0K0k5VHDwksOsChMngo4X+91fmgRnmCqr9iChgaPoVrRVL66UL7NjBJn
	 v/FXLfXCY+QmCNZ5HRlLmYGC7NQUgZfaAdZOsffvtYXGRJmFKTDBbW2xHZeJabNz/9
	 zBPesUIyDsGtjy0hCC1YgVdbm7zZTUVe+d2g/C9KyfBrc4K3upAjXOwWP9C8pt3m5k
	 zEMYrb5yBFQ4Q==
Date: Tue, 7 Jul 2026 08:18:03 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Eduard Bostina <egbostina@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, daniel.baluta@nxp.com,
	m-chawdhry@ti.com, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Mark Brown <broonie@kernel.org>, goledhruva@gmail.com,
	simona.toaca@nxp.com
Subject: Re: [PATCH] dt-bindings: bus: Convert DA8XX MSTPRI to DT schema
Message-ID: <178343028158.2334410.7512714429208471206.robh@kernel.org>
References: <20260630124631.2991596-1-egbostina@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260630124631.2991596-1-egbostina@gmail.com>


On Tue, 30 Jun 2026 12:46:27 +0000, Eduard Bostina wrote:
> Convert the Texas Instruments DA8XX Master Peripheral
> Priority Registers bindings to DT schema.
> 
> Documentation:
> OMAP-L138 (DA850) http://www.ti.com/lit/ug/spruh82c/spruh82c.pdf
> 
> Signed-off-by: Eduard Bostina <egbostina@gmail.com>
> ---
>  .../bindings/bus/ti,da850-mstpri.txt          | 20 ----------
>  .../bindings/bus/ti,da850-mstpri.yaml         | 37 +++++++++++++++++++
>  2 files changed, 37 insertions(+), 20 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/bus/ti,da850-mstpri.txt
>  create mode 100644 Documentation/devicetree/bindings/bus/ti,da850-mstpri.yaml
> 

Applied, thanks!

