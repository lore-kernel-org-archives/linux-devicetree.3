Received: from smtpbg150.qq.com (smtpbg150.qq.com [18.132.163.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D701433AD
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 01:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.132.163.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774834475; cv=none; b=EeXUJvum1O+fBv7CtBrQnqmVx1cL6jmVZCNHGvO2UVQBApqjQfUmYqMo8Ope5D7qNStbFxvXIS76SZbARFikkswkG594WF71XxpF+WbTiV1YLjfbh1Tsb6Nh3Jl3U+t9yVMeo9AbvwvWI1oLFhJMieIN3t7YRXjMgxxA6BbU47Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774834475; c=relaxed/simple;
	bh=fgz/GKcB3oonAl4MbkisJoA36t+sgww6I+Bj2Bn+HVM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ipEZzD7V2RBC6iZYO6bChLKD0nJhKlsTFQDh+AjYoMuBzWmtfvmvNevycDWsfiqiGSsuUvY/CxTK9beBg1gvy5vDk5IWFdB++eqnQa9Puk4YkVzbyEke/yb7mSQlysdRPHnRm/GQObBtiT4UfkLWgLciSOMoOr1x6qW+7Y90vEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com; spf=pass smtp.mailfrom=airkyi.com; dkim=pass (1024-bit key) header.d=airkyi.com header.i=@airkyi.com header.b=r47FcybM; arc=none smtp.client-ip=18.132.163.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=airkyi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=airkyi.com header.i=@airkyi.com header.b="r47FcybM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1774834462;
	bh=sfiAM2xTM874MiG/dhh6ShU4/XvUVAmXi/VOTC6gjTA=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=r47FcybMsUdzUS2n1obC5iPMspWHmlN9+YLleegl2RqVE7Lef6K463mJbd4tNXDgb
	 dIVUqyHpCkosydQRqmUhtmwcp3+JQyNY5BbQb9qb1y4BHlRdDQfmAIfnZUtQ83rQlz
	 HpSn6Dw5iAcPLdcd0IRBTYaqsTPn0H51oXfQLvK0=
X-QQ-mid: zesmtpsz9t1774834460t11607d84
X-QQ-Originating-IP: nTZ358fNU9KEol2P7krw/Em4+kZ+xSnWIUvoRY+oi8E=
Received: from [172.16.12.51] ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 30 Mar 2026 09:34:16 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 7524343022994647576
Message-ID: <FE1BFB774BE13241+54b8a8ce-5a8c-495d-a53f-65a2440924fb@airkyi.com>
Date: Mon, 30 Mar 2026 09:34:15 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/10] Synopsys DisplayPort Controller improvements for
 Rockchip platforms
To: Sebastian Reichel <sebastian.reichel@collabora.com>,
 Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Damon Ding <damon.ding@rock-chips.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Alexey Charkov <alchark@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 kernel@collabora.com
References: <20260326-synopsys-dw-dp-improvements-v1-0-501849162290@collabora.com>
Content-Language: en-US
From: Chaoyi Chen <kernel@airkyi.com>
In-Reply-To: <20260326-synopsys-dw-dp-improvements-v1-0-501849162290@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: NAeO0+xU6W76qvV4A2IYzKvM87sEcrnXwi0VEI6Hy7s1bcV8Bn00eIAC
	+0c/Ed90BdA55cpBBH9mDpNSBR4kR7kklQ7E9zQocIDHaz/eR47qWE8mCFbmn9IqaDnzGBY
	kzkhbJPRBnSOz88gHQaAlehncIdtfJq+e/5upTe8SWvHOmQJWP4vaUq84iIZXNzeKfsY8q9
	q/GqHGcsJWQSH/tjA/x2m3a8UwDFg3Nj2l271OGJG3MhNNzd+vlIP5k+bBFufQ3LqMfVP1v
	cx2kLqSAstZmd2XP3LegrwPfek4OPXeW1gcQkvumWAMyi+jigAkyAYhu+FAILm4rBOpB2GK
	jcEs/89cXC+O2jvUwwXeIxng8nnPWdpPVMmHUElWibMtpV4t6g6H2bbvNlmW37TljFMVULX
	bOoKEcN+IyXcRfgYWYtaBVsXP1m0uO3c1lIQannfONaToy2/Gczh+WsDbOp+x1VBQLk6SI/
	7pKRdsvIy+SjgCnC2Yvthq6VOPl1vDqWXALf7XVtMoehQdof+q/TEQaj036kU0GZQ++UWqQ
	mOBXyXUm0Qvc8EbggWHxIUB1A9rEgaFVKBhcsyFMFAimQof12VxEWArum0LQ7DN2APUVVhy
	O0Vd1HB8gNrB9i5oorcfFrdCA1ToRoEk15nbRIN+4bG2Bi1nyXi+bbO4ZUdSVg89O4/oUr2
	wVUz2IEC/NhDAgzSnxuLu2f37BtAnIZP2OTEBnRNAXpotv5fvEhpaMUcoStcYkTs9aAgrOB
	Vh/CuKFjs1fuIqohqREi5m74Io5DNbnLkQp7Z5Vct4uMDpStjJ1W/1bnwT7/zhdt0R+RPVC
	Tceg7Vg9Io7Emjs3XeSxOFdQf30Yf3+ifLzsIcHtKmPgNMf2ETGiTD2SLDjuAjrgD7KmIw1
	wH+Z8KPVSMs1tMfeLTCf/mJFYAK1/ASmvD3pagBz/EsLeCiZT+m6pI1pVFEIyUBhmIFHQCr
	MNheLzzD5ALYurhrt10TojgjsZMkj76EmLBXxEc9t2xoJpWHcYCYikQ/iEKVDAl8bluAgYv
	ULf2lmTg==
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
X-QQ-RECHKSPAM: 0

Hello Sebastian, 

On 3/27/2026 1:31 AM, Sebastian Reichel wrote:
> This patch series updates the Synopsys Designware DisplayPort bridge
> together with the only existing user: The Rockchip RK3576/RK3588:
> 
>  1. follow-up bridges (PHY, USB-C connector)
>     this is needed to get USB-C DP AltMode working; I've followed the
>     Qualcomm driver as reference
> 
>  2. runtime PM
>     the initial driver has been upstreamed without RPM; add it to
>     avoid wasting power when nothing is plugged
> 
>  3. audio
>     the initial driver has been upstreamed without audio support;
>     this adds all missing bits for audio with single stream transport
> 
> The series is based on drm-misc-next with Cristian's cleanup series
> applied as I expect that to land first:
> 
> https://lore.kernel.org/linux-rockchip/20260310-drm-rk-fixes-v2-0-645ecfb43f49@collabora.com/
> 
> To properly make use of the bridge code the following USBDP PHY series
> is also needed:
> 
> https://lore.kernel.org/linux-rockchip/20260313-rockchip-usbdp-cleanup-v3-0-3e8fe89a35b5@collabora.com/
> 
> There are two parts, which possibly need some discussion:
> 
>  1. I added a dedicated bridge callback for out-of-band hotplug events,
>     which is separate from the hotplug_notify. I have a feeling, that
>     there might be a better solution, but haven't found it.
> 

Could you explain what an out-of-band hotplug event is?

Can't the drivers/usb/typec/altmodes/displayport.c respond to these
hot-plug events? Thank you.


>  2. The DT binding for audio support - explicitly marked as RFC - works
>     perfectly fine, but is not ready for MST. I don't intend to
>     implement that right now, but the binding should obviously take it
>     into consideration to avoid breaking it in the future. I've put
>     some points for discussion into the relevant patch.
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
> Sebastian Reichel (10):
>       drm/bridge: synopsys: dw-dp: Simplify driver data setting
>       drm/bridge: synopsys: dw-dp: Support MEDIA_BUS_FMT_FIXED
>       drm/bridge: synopsys: dw-dp: Add follow-up bridge support
>       drm/bridge: Add out-of-band HPD notify handler
>       drm/bridge: synopsys: dw-dp: Support software triggered OOB HPD
>       drm/rockchip: dw_dp: Implement out-of-band HPD handling
>       drm/bridge: synopsys: dw-dp: Add Runtime PM support
>       drm/rockchip: dw_dp: Add runtime PM support
>       [RFC] dt-bindings: display: rockchip: dw-dp: fix sound DAI cells
>       drm/bridge: synopsys: dw-dp: Add audio support
> 
>  .../bindings/display/rockchip/rockchip,dw-dp.yaml  |   5 +-
>  drivers/gpu/drm/bridge/synopsys/dw-dp.c            | 284 ++++++++++++++++++++-
>  drivers/gpu/drm/display/drm_bridge_connector.c     |   6 +
>  drivers/gpu/drm/rockchip/dw_dp-rockchip.c          | 167 +++++++++++-
>  include/drm/bridge/dw_dp.h                         |   6 +
>  include/drm/drm_bridge.h                           |  14 +
>  6 files changed, 469 insertions(+), 13 deletions(-)
> ---
> base-commit: 0660ee19141e5e90b422b7daa0d8518a8d0d898b
> change-id: 20260325-synopsys-dw-dp-improvements-7da2e98df1dd
> 
> Best regards,

-- 
Best, 
Chaoyi

