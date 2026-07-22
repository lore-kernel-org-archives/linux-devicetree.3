Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42886440A3B;
	Wed, 22 Jul 2026 16:43:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784738617; cv=none; b=CmFaUWCUDsx6i3w3n+Ya29E0qBssBKdUEU+/ZqLz/yH8wiBhyGYvb/7feAdQTJlRltgr3AMLV5A5JzrGBfHHSjsAtkyy0EC5wp9WVWdy1YAw0A0bHdHrBkz8KCOr0Ga+eW9D5C2dyb8st0dqXpR5cEojq1EV8AHb2acLV6EeuAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784738617; c=relaxed/simple;
	bh=fkwHUyup+iXGa5p1iVlgOChvkl3YNdJoXdLICQccLIQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NNpGivhPbxU2KrdF2NqWDDfAUN+fHdoQeD20kVnGDDBA7HzPlRI1L/yzmdTSIvgrToZC56kbIrw2whiggpQGhwvg8QCp7vKZTogZF9WLL520HNChOzWn9bFgQF9RJvm1ZqtO8EDPop6Eotk3cCsP10Y9WPYPhvmTEI2gdYXrnTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fvdCMcy5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fvdCMcy5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 121911F00AC4;
	Wed, 22 Jul 2026 16:43:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784738604;
	bh=8aMOEOID1nVJmQTMWEWGhWEo81U6EqpDWO10QcFFop8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fvdCMcy5Ax9f9FsCqLCyZ+iwhGRK+YlNOOGucF3bY7sIcPYqI8OV9KuWOu7NfRSHj
	 MlHs80/qtveei07DRKu3WLrck3tzQtFIegj/rQskYu6JzL6o5y5EH3HsaDwZ/wwWXa
	 xTyQtbP8yVE77AuFwvo+6t1yxynw/bHj6yjQ5ujjhugghYWk77Y8tHvcVhU18W4ybU
	 UgP36+7l3BWh1dpjPvmDSfT4qz8kFCtv+HvpYEDDrmyYlo3nT/2xMZoWI7bVKEJ6A5
	 0AqvO9DpDKHx313ywyK2BxbUs58RkPFsby77DGwgXM9mhpIP/bCnTINENaqVRzcE9S
	 dfpW+48VNKZ+w==
Date: Wed, 22 Jul 2026 11:43:22 -0500
From: Rob Herring <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com,
	simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, tzimmermann@suse.de, krzk+dt@kernel.org,
	conor+dt@kernel.org, matthias.bgg@gmail.com,
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, justin.yeh@mediatek.com,
	jason-jh.lin@mediatek.com, kernel@collabora.com
Subject: Re: [PATCH v2 32/46] dt-bindings: display: mediatek: Introduce
 MT8196 extended DMA Engine
Message-ID: <20260722164322.GA1078187-robh@kernel.org>
References: <20260714114414.184512-1-angelogioacchino.delregno@collabora.com>
 <20260714114414.184512-33-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260714114414.184512-33-angelogioacchino.delregno@collabora.com>

On Tue, Jul 14, 2026 at 01:44:00PM +0200, AngeloGioacchino Del Regno wrote:
> Add documentation for the extended DMA Engine (exDMA) IP found in
> the newer generation SoCs like MT8196, MT8894, MT6991, and their
> variants.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../mediatek/mediatek,mt8196-exdma.yaml       | 104 ++++++++++++++++++
>  1 file changed, 104 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,mt8196-exdma.yaml

Same comments in this one.
