Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EEDA33689D;
	Thu, 14 May 2026 16:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778775482; cv=none; b=LpH9yl2yhg9rTJF5VJViuBJOto5WZ9ELUF1Tqpt8hgShIYcNlgKNNoIJasjiMx+rqHQkxq6zeic9fHBb9jOTj++GSw7Vnakj9Yakt5CsWIvg90GrUMj5sgxx7qgkxK0kY8DPb5z4Y+LjtNlfO5j2P2PZCTOwMuEl11XhoWynHu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778775482; c=relaxed/simple;
	bh=hyF5D8Pc/kYQIaWvIB9S8/rv8IKNlIdZ14J3dKVxG7o=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=uk0E7LL+5UqH3sLVXpx5U5+WM4MVW2ndTym3Al6FciQn3sDNqDAq5Pt/5pWfQxxOfZzVxDOrFxMcz4CDqDFXrvu8vClmOWaqRFuuLsPH7yPPtlg7ocbIDEpxG5mpalYmu9IQzJ+Qyfv7QGn7tPzncSI9/bd2iu68yTofdlMkTnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MY5L+XXf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MY5L+XXf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20EC7C2BCB3;
	Thu, 14 May 2026 16:17:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778775482;
	bh=hyF5D8Pc/kYQIaWvIB9S8/rv8IKNlIdZ14J3dKVxG7o=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=MY5L+XXfqtr6WnaCfpqdESQw0LlnFZidXkjWb7IM5EBPu/biNN2ouhUUqHoXdPyU3
	 bLxduLXK8kEDtK39M04WPNZZBMu7kfUlfh1TaaDvyDXKKJ8S9PPtNNtL50LPCXeS8G
	 JU/gACrG59F/ZbGrJ4AykiuDWL9NJdmIkd1uQGg9TlSiCOn6Q6sxJM9eZ9cOHY8Of1
	 h3VzdWsvKljBY3A8swYkAO8nipCiR5GsOkx8odm0DvlsGYY/pmMpVizkKCUpcZlVyH
	 Ki+/faUSa9P8O+dVaOOxG+ViiGmtzF05o8AmZMiDHNhajwqe3jhEspqACex6e/1anr
	 ElP+VOG9XGxJg==
From: Vinod Koul <vkoul@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: neil.armstrong@linaro.org, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 jonas@kwiboo.se
In-Reply-To: <20260505170410.3265305-1-heiko@sntech.de>
References: <20260505170410.3265305-1-heiko@sntech.de>
Subject: Re: [PATCH v2 0/5] rockchip: Add USB 2.0 support for RK3528
Message-Id: <177877547874.1092446.2280455106153826984.b4-ty@kernel.org>
Date: Thu, 14 May 2026 21:47:58 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Tue, 05 May 2026 19:04:05 +0200, Heiko Stuebner wrote:
> This series adds support for USB 2.0 on Rockchip RK3528 to the
> Innosilicon usbphy driver.
> 
> The usb3 support has already been merge for the naneng combophy
> last year.
> 
> Changes in v2:
> - rebase on top of v7.1-rc1
> - split off dwc3 compatible and dts changes
> - add error handling to regmap_write (Vinod)
> - v1 is here
>   https://lore.kernel.org/linux-rockchip/20250723122323.2344916-1-jonas@kwiboo.se/
> 
> [...]

Applied, thanks!

[1/5] dt-bindings: phy: rockchip,inno-usb2phy: Require GRF for RK3568/RV1108
      commit: a896852613136e6babe6036567ab0989fb322a57
[2/5] phy: rockchip: inno-usb2: Simplify rockchip,usbgrf handling
      commit: be29cd958f5393004a24cd7b5b1da88dd90a651b
[3/5] dt-bindings: phy: rockchip,inno-usb2phy: Add compatible for RK3528
      commit: c430f042f4ba2c5abd592b6924f028d3bb09d4cf
[4/5] phy: rockchip: inno-usb2: Add clkout_ctl_phy support
      commit: 2775541de0580ab1cd077dfef710e6316563d567
[5/5] phy: rockchip: inno-usb2: Add support for RK3528
      commit: 864b3617df827865a95a06f06f09a8d57a795b91

Best regards,
-- 
~Vinod


