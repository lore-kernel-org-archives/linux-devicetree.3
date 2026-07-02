Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBB8D3D5241;
	Thu,  2 Jul 2026 08:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782979205; cv=none; b=LvPtTDyj7dZM6ynb+WrxXVFWpvXb1OCmDSXZ6hGorPrG7ZrbQ0fyO1QtdFXmblILQntF8Xe1VgSX3jlfzsgFB8GI8Luc3YUrQL7iPA2p0xznnD6XfjYZ4pc4/uqD/CH9gHorisRTOLwke7KfrxoQ2coGrUwS5BlfPngsl1rIbfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782979205; c=relaxed/simple;
	bh=73hiqdHY5+Qx96+yc9/hXV2EDNDonQeU68G0WhUveKY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ELihsbAElx+kmBWARr/guMJigGnT61HljpuzLTq9e2aJJa0R/iMrMh8rRCCHtgOaNZYTQpruXvabzfCCF2ohQeAffJpGBybjQ6g/qWlyZ5uLwXGjvK3IkPrz6z1elVRw63Hg7ewliOxqB2Kk8INZ69gSzPwUAOSYA+AlG6mZXuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nfGzv4gN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nfGzv4gN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0887B1F00A3A;
	Thu,  2 Jul 2026 08:00:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782979203;
	bh=Q4PYqXEPA9CrErHqa91ZJaH1kjYdbpYUf9UuYq6zkao=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nfGzv4gNN7z2ExxL240I0Gbl0zh0l+AvOBpM02Qw2GF2kbT+rsa/Vpf47GM/Dsbvs
	 UeNAX/nLxswRSgVjAeQSARnGkcKkTVWYs5wLRXsJmUrk/ou6ScpCE4GB5V5iAkNt/m
	 yzLoV+IFhj2neMYJ8INuEBG3r+7hNipm3lx9Iw/oobb/o+ZczRu586hbxyJ1B6eAyk
	 g5loD7xSWUUxW/omAGX/kRXhcO9NV8FpW1dsnMJbs8IKZFLDR5P1PTMiev8LE6N84t
	 +sf+TltQ/ErSy0kh+aJqpJZypkRjhycPmQsb+WLHfB0rzBj97I3NgadJDPcYFIL5T1
	 ImX2zueWK4vWQ==
Date: Thu, 2 Jul 2026 09:59:59 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, 
	simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, matthias.bgg@gmail.com, 
	andi.shyti@kernel.org, djakov@kernel.org, broonie@kernel.org, jitao.shi@mediatek.com, 
	ck.hu@mediatek.com, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, justin.yeh@mediatek.com, 
	jason-jh.lin@mediatek.com, kernel@collabora.com
Subject: Re: [PATCH 3/6] dt-bindings: display: mediatek: Allow
 trigger-sources on relevant HW
Message-ID: <20260702-authentic-dugong-of-whirlwind-ac3e3a@quoll>
References: <20260701122043.19612-1-angelogioacchino.delregno@collabora.com>
 <20260701122043.19612-4-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260701122043.19612-4-angelogioacchino.delregno@collabora.com>

On Wed, Jul 01, 2026 at 02:20:40PM +0200, AngeloGioacchino Del Regno wrote:
> Most of the MediaTek Display Controller hardware sub-IPs need a
> specific (and reserved to them) MuteX trigger.
> 
> Since now MuteX is a trigger source, allow specifying trigger
> sources in all of the display IPs that support one.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

