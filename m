Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AF6925C6EE;
	Fri,  7 Aug 2026 10:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786097870; cv=none; b=bW+CFP+hDWBqMcRcNnTKKytLjxbmvFP35To9kEy5Cevshaz63OgPf1tCW6AaQmFxYpUdrbYZEsc5QuJiM6eUYoNF4Q5/V8SdL9eRryrizRiAkVLFSZeVM3J29XwxYiZ1mlRSOgkOpwYI5FJ0aBPiynQ/BLT/OceiYioK6Cn6o5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786097870; c=relaxed/simple;
	bh=D3O3zqvUDP8FMW5Vs8zOXU1b2zI5EhCcB0qNbUWAuTw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eGxVdynPwJ1XrmigpauSFcuhxGncBBpbqf01Hl9fSPRU/4T4J5GSDMvoDUOqq9KgNhHd+98Ja8MyWOM4bZods121VFpgJ56SvKwre3riZFJ/eoyW+z9NW8oTaYEA39xZJxWZ0da4jfJjGW6HnChdWT9b6Oon1hR7JbM1T5eGnro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LSB/0X+9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LSB/0X+9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F3851F00A3A;
	Fri,  7 Aug 2026 10:17:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786097869;
	bh=pztF5ZmE57ytikk6f3PQbP5jBmY/LIYwAmQLXlLbfIs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LSB/0X+9XEap2xAfvK4LNYyoEdhiXgPP9zSo9nREqqKzTmHXVX+ZeKhJa0vwnUSB5
	 i11+t2xKrW6i1Fwrl9Gakc4ZcjXtTDn3z8L+qMttvF2zKMpOcJGmDdDjkkr1SKvTuu
	 w/IXBDEuDxONJBMCcgU4kPV69sHLFcdVFwJnxlLTdeEJIiRFmUdfl7dXf+ac8Y7f4N
	 JalGQM2Zr13VhrPy5RXKBfC1btgUdTSK0ck3r1EAbq+52R5ECu0sHlDaGEqii/lp8n
	 R3SuYydG702WEsyHFco/uhIvPBCOtF8F4vumvy8yp9jrSHmLXoWcMAfni7jWsGqM8u
	 JEBc0+WaPprQA==
Date: Fri, 7 Aug 2026 12:17:40 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunfeng.yun@mediatek.com, vkoul@kernel.org, neil.armstrong@linaro.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel@collabora.com
Subject: Re: [PATCH v3 1/2] dt-bindings: phy: Document MT8196 MediaTek
 PCI-Express Gen4 S-PHY
Message-ID: <4copgyszdf2tjc7mes3lzw3tnvtn4nn3ossdjbgckaucnfrn52@di74kohvokfz>
References: <20260720152654.92216-1-angelogioacchino.delregno@collabora.com>
 <20260720152654.92216-2-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260720152654.92216-2-angelogioacchino.delregno@collabora.com>

On Mon, Jul 20, 2026 at 05:26:53PM +0200, AngeloGioacchino Del Regno wrote:
> This adds bindings for the PCI-Express Gen4 S-PHY found in newer
> MediaTek SoCs, such as MT8196 and its variants.
> 
> In the current "revision 3", depending on the specific port, this
> S-PHY supports up to two lanes of PCI-Express Gen 4 and both EP
> and RC modes.
> It is not clear whether revisions/versions earlier than 3 have
> ever been shipped in any other MediaTek SoC.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani

-- 
மணிவண்ணன் சதாசிவம்
