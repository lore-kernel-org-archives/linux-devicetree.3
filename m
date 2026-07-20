Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AED23FC5BE;
	Mon, 20 Jul 2026 11:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784547816; cv=none; b=hwpEWmNrOvVmjRHsE1TLX6jLOhq46d5gmBtvs4P8BABaKLhJPhH55Q6/4D5echjdt/C4RF0Bii90P4GecZHU1pmEhYsRB8c5BVumalLPSf/7leabiXVyM7Zzhu3Sny/YvXAROOf2LPBDIs/R7/YAJMgGRNZZ4GzxqKDjVEiQjRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784547816; c=relaxed/simple;
	bh=IwVRI0D1/2PFt0UXc0hBGw9AKGyEtOMslogEvLAcVck=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=RlF96kvgPFMZ52P4+abzzt8g5G72DqIP3LNTjyHZnLjzBPPJZawPwEjUX0TXSiKHCqqCd73cXDSEHZ798lFxyO8Q+JlN4e/f821Uxnj7Dwlf/TQMaul2fH1lO10Vqfvn2dbJBXUcnYhvQFhwVqnCjxUpjv9UtKk0yQlFH4AW0AA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BDrGf7Nz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BDrGf7Nz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C8181F00A3E;
	Mon, 20 Jul 2026 11:43:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784547815;
	bh=kgEbuRaZ7fC8I4l3wHHvaMm3ff8vOKykqDqNHrxX4ow=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=BDrGf7NzG0L0sB92Cx3an0HY1ia4T3Hj7SKz4jZfVtUVZKNaE0lMcuzwpN3POvU+y
	 QW/1xfdjtYXcXfpfoizjUartFQ5DITdV9VV4RzKBfW6+RmwdEqwpw19lk6lxTBjwpA
	 OVdlzEOOHgbjPIbNgnUS3mBUcpmxuT5xpU1+zf17X/0Nu+Fp+2G7PS+MCjp7dXAOtw
	 XQd3v8cy/BdrIgrYxKeL5S29+gSDF+Fzbmu0AGMofTzCfibJI4EUXSVlIbMfs+cN1N
	 zpkR13ypArj3x2L/8tCe3SWBDgIB8mB2dJJUcYcuUNULhtOAtKNb2W1ofEqS7sRVU0
	 qRLKSqctmGPHw==
From: Vinod Koul <vkoul@kernel.org>
To: chunfeng.yun@mediatek.com, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: neil.armstrong@linaro.org, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, chunkuang.hu@kernel.org, p.zabel@pengutronix.de, 
 matthias.bgg@gmail.com, justin.yeh@mediatek.com, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 kernel@collabora.com
In-Reply-To: <20260713103805.23030-1-angelogioacchino.delregno@collabora.com>
References: <20260713103805.23030-1-angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v3 0/2] PHY: Add support for MT8196 DSI PHY
Message-Id: <178454780918.1388616.17680006872088012294.b4-ty@kernel.org>
Date: Mon, 20 Jul 2026 17:13:29 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Mon, 13 Jul 2026 12:38:03 +0200, AngeloGioacchino Del Regno wrote:
> Changes in v3:
>  - Actually sent the correct patch series (sorry, I had messed up v2)
>  - Added definitions for minimum and maximum PLL rates
> 
> Changes in v2:
>  - Added a few comments and fix scheduling while atomic issue in clk
>    enable ops by waiting with udelay() instead
>  - Removed one unnecessary delay after clk/pwr isolation disablement
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: phy: mediatek,dsi-phy: Add support for MT8196
      commit: 215cd5def8eca1c2aa7ca043483d96155a1c3ed6
[2/2] phy: mediatek: Add support for MT8196 MIPI DSI PHY
      commit: 2ec9c210c1f931389709aee403d28e4f32676385

Best regards,
-- 
~Vinod


