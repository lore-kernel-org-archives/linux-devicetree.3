Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 147843DCDA3
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 07:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785136473; cv=pass; b=CntrYEtT68me4nBgFZiu5rEHhdO7NXkp1htxyNBF5aNEmbvdtglxGzSZ9JOp8eXncx1XU+CLw0Pi1cW4UIpIpN2N6ap/4H4Y/iclXU7vPHzTD3Hhv1YykQCMSPhU1eDoKpN8rLnhbwJaTISDI5NDCX1ArP3i8SNCgIguOEYrmmw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785136473; c=relaxed/simple;
	bh=6DQJFvDiJ28dVkS82oPqp/ycFEM1kxGwvdKytkDLGJs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KcyzoNw0j44m44kK5rfLHXvbh/mshKm1HOBodPDF6HDctfFMbipAVPumAavdDiln+7HJY2tcN6tu0HG6zWGxpVNWVcH0OKd4a8OkZwGLUeBFtX8AIFvCkqCRcCQ9hM6qy5eXSFaeRm4yL+CbZG+hTIuGP6bofMR92BkzMdsng7A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HeAO5kro; arc=pass smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HeAO5kro"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-92e5c9211d2so202459985a.1
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 00:14:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785136471; cv=none;
        d=google.com; s=arc-20260327;
        b=biaVHSIa0/ZLKwXAVhRLnzKtlfNBkcCy+odYA/5SP3MPSJ1cccw66YPCVhiGa1Bnd6
         7aNm4QXIF9qiG2Z95ya0tzhCWZgvdUZppPqV6KcVmTwFUFezvPUKoJRTVTmOs11iP8XA
         M4ozuNHHXO9Y5qNeoooRDl4LLHk66iLYpwVu6uTJXePTRth5e6JLaXaJRSPTvQXT1WxV
         wzq0WEVlrKtzhngG3zwpADNodC8G9r7+4fd9zMHbK8Z8wcnOUkMTEU/k4N4yE3m7C7sn
         ND2Y2JDjDnRQ/zFTeYmyp3K7MGwNGvKjr9EE8BG892EQCbCjlukk6IZqWXZnsfu6pwAp
         6Fqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+/mmi/yKE1XX17GxFkgO2afry/vumxMd+JoqMLh+sdI=;
        fh=R2R+SntNfUj7GOpPdGkIqqQ5d4v6VKRN6RSG5aP1q2M=;
        b=DZuACNjvGxIAHVDpGKZfxAqgIORLV19ncAX4pPsz/xICE8BxCXe91weIv//7fyl1R3
         RmLbxOeoYpflf0TtEjYZuT+H5IdRtARG1SK6T0QV4pzk4OXrRdYbOpMx+aJA4Sz+vykz
         VwDCjoxLafcSOQVb/FfPv0JJSS5iRGqVzc9/gILqHTvf2LtN0HrrIewtpsUoinTIQxBs
         G+fIlAaQFHnBRSecJXhAdbzKlJhX7i97VhBMzhbOzmtKvmU71I7goKqMNVv/dRuDT57t
         lNutAeJ+Opgq/RhpMpJ3IfGHjmD2HhcWTLUhnLGiYVbWVByM81vSsjiZOH6IzarFb0ar
         qaiw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785136471; x=1785741271; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+/mmi/yKE1XX17GxFkgO2afry/vumxMd+JoqMLh+sdI=;
        b=HeAO5kroARxCWgCvOdv52davu2OFeefaVb/kJr37JGMvWxCKIwsbr3/8vxwRc5OOVf
         XXd8phVPq2CS8E826SfCFzQCXvROTppQjcD3hFUXxkVrx56t2UCCD+ysWQ30PgW+HhxE
         YuWcYHJCSjrOhDut0/k7H+9RrBEDzYoCaBiDYFcT8PDyc9bG8UoS0AAq45a0R3872y9H
         qEksfrZGsFRwf88id4zAAYooJ+J3zIiRQss6QiauUGacdF86lSHyFPxcfakGYZLbYr6b
         OuFeJE3L5DW0aAxn0YWx0idzDzYRADS7cz+g5qPdJF79SOUE+y2l9iiloAHyRVysBu5X
         hHrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785136471; x=1785741271;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+/mmi/yKE1XX17GxFkgO2afry/vumxMd+JoqMLh+sdI=;
        b=Ez1RDhrqDt/1BwOTRd81l9uc1Cz5PwcOfsDiMUwjPf63bdAalF3TObR6MJNHvOkEco
         fE9D8lLqFnkfK9Xh5H1iRjUbHpQYQz0KbDCf32zZ2JDxAOY1+WWVaWCS9u51AfhQrDEq
         nn3QaXiBkzNOCc+81qQYiClZGECOWGTQI3xvIFLtrKkUdPqI6uAFYawOuupxlNihm9+q
         RrAAKlR4gr9F3WdoUXecyGQxXTu7ILyrVfCnQHhci3UTLG3fUDsqKziEl/m3g8gf4YuC
         DDESs/dlGCXtOibRqlWbnC3d+jJu8FdDLQvUAKjUtIWIiFrV+1pViVeBb1GSvRlWHu/o
         CUKQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpd8TUQqt2efoN5rGETxU+vNxjzYtkeV8HRZrqKZKpTg/XgxVkMywyRweET+OYzawJnOlZSTJMNNpOd@vger.kernel.org
X-Gm-Message-State: AOJu0YxrikxwtZWAR3AlO5YI6G8Yj8W0WGz+XOZVFr7vjwPMzLYOr6uw
	oh/HdtGxFYgVZT3rZuYa4a9fLV7mR4fz3RzA1eYIQtdi3zNC1HOMZwgx49ywKpqa3ZlAAd7QK2W
	XGXbihacmssQZNwIFd9t+xbVKjpBuWqE=
X-Gm-Gg: AR+sD11mlLr49RZgz9ElNJrX8kDNrWfGtA1F9/YcCoBy1VoR9NV1+4SFd3mgjf86j2A
	VCLnu0td1oV++falnaOpPCdp3bxC+nib1UmOCzfRxQSwsV9WdGZhNHvXCLPnHsG0XN7BModwJhF
	biCQjfAg+NzBK1EDIxjAg6rVzSvkaEypICK0rSR7ONaXp8Pot7FVW00Q75itnhmY25R8EIIL/BA
	qqfcb7rlGaD4wioyeXWU9EZ0ZVH+Rl1EC1Vcv0dRisXJXT3Q+6DHGy7a+9tyMhL1L9RuAfXcICh
	6/qtl6bWOneGAj4aRg==
X-Received: by 2002:a05:620a:271c:b0:92e:c118:18b0 with SMTP id
 af79cd13be357-932df725cdfmr696946585a.79.1785136470873; Mon, 27 Jul 2026
 00:14:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260727021048.3375444-1-attinagaoxu@gmail.com>
In-Reply-To: <20260727021048.3375444-1-attinagaoxu@gmail.com>
From: Alexey Charkov <alchark@gmail.com>
Date: Mon, 27 Jul 2026 11:14:18 +0400
X-Gm-Features: AUfX_mx7QqYbJPKColdFHefAnfy7L2wNcFUU2ZgtkbVju2YipXpKoC8heF-3qZs
Message-ID: <CABjd4YyohxfbVufd1pwJGsm8a8f3Cm6rJiz=WLz=jBjAQRLj4A@mail.gmail.com>
Subject: Re: [PATCH net-next 0/3] net: stmmac: dwmac-rk: add RK3576 GMAC 25M
 refout support
To: Gavin Gao <attinagaoxu@gmail.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, heiko@sntech.de, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, mcoquelin.stm32@gmail.com, 
	alexandre.torgue@foss.st.com, richardcochran@gmail.com, 
	nicolas.frattaroli@collabora.com, sebastian.reichel@collabora.com, 
	sashal@kernel.org, chaoyi.chen@rock-chips.com, amadeus@jmu.edu.cn, 
	rmk+kernel@armlinux.org.uk, horms@kernel.org, alok.a.tiwari@oracle.com, 
	david.wu@rock-chips.com, netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Gavin,

On Mon, Jul 27, 2026 at 6:10=E2=80=AFAM Gavin Gao <attinagaoxu@gmail.com> w=
rote:
>
> Hi,
>
> Some Rockchip GMAC instances can provide a 25 MHz reference clock output
> for an external RGMII PHY. Boards already describe the MAC clock directio=
n
> with clock_in_out =3D "output", but the dwmac-rk driver does not currentl=
y
> request or enable the corresponding 25 MHz reference output clock.
>
> On RK3576, this means the REFCLKO25M_GMACx_OUT clock may be disabled by
> the common clock framework as unused, even though the board expects the
> GMAC block to provide the PHY reference clock.
>
> This series adds an optional "clk_mac_25m_refout" clock name to the
> Rockchip DWMAC binding, wires it up for RK3576 GMAC0/GMAC1, and enables
> it from the dwmac-rk driver when the MAC is configured for RGMII output
> clock mode.
>
> The clock remains optional, so existing device trees and SoCs are not
> affected.
>
> Tested on a PicoCOM RK3576 ACP board with a Motorcomm YT8521 PHY.
> The GMAC 25 MHz reference clock output remains active and Ethernet works.
>
> Gavin Gao (3):
>   dt-bindings: net: rockchip-dwmac: Add 25M refout clock
>   arm64: dts: rockchip: Add RK3576 GMAC 25M refout clocks
>   net: stmmac: dwmac-rk: Enable RGMII 25M refout clock
>
>  .../bindings/net/rockchip-dwmac.yaml          |  1 +
>  arch/arm64/boot/dts/rockchip/rk3576.dtsi      |  8 ++---
>  .../net/ethernet/stmicro/stmmac/dwmac-rk.c    | 33 ++++++++++++++++++-
>  3 files changed, 37 insertions(+), 5 deletions(-)

Can you please try something like this [1] instead?

[1] https://lore.kernel.org/linux-rockchip/20260719034555.3623003-1-gahing@=
gahingwoo.com/

The GMAC on RK3576 neither produces nor consumes the clock. CRU is the
producer, and PHY is the consumer. So the GMAC driver shouldn't be the
one to enable it, nor should the dwmac binding have anything to do
with it.

Have a look at how other boards already upstream handle this. For
example, the RK3576 EVB1 uses a similar arrangement but with a
different PHY.

Best regards,
Alexey
