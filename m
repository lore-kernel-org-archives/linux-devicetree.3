Received: from mail-m1973177.qiye.163.com (mail-m1973177.qiye.163.com [220.197.31.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 361493BED20;
	Tue, 31 Mar 2026 07:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774941717; cv=none; b=OcyKnuX3Mmro6bNrKc/OQsVjLagqM2J2emAdfa4mG8kA21bKTng6PfluS3OZe6Govmyzgs5/nr2s4DUuuR3oObQSwZ+sL74G9i6bb+RaJoFKXCX3dwibkDI2OXKXxEs3RhCBoI8YnYtj3ot0AS9QOC8+rO8BnAzIvml+hInQLS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774941717; c=relaxed/simple;
	bh=Hw/xSGmvS/W12EYdELVtpL3OYl6cdTAtVH3nWGAaov0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TEr/M8B8hF8/0uNHE2w9YZNmufwWMOOPqEvOvjGFprSMHQmo3aLtfX8o8nMZi2XiThn4KLmgam3+F7XGlvgZnkx0JH/lxL/5eL7Q9EYcB/f72ECKozh0phOrOsQbzTqbNv4eowIb0+frDijkxFwXkEWVnJexpYvYTNQmEfEltdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=Wq+zkPVq; arc=none smtp.client-ip=220.197.31.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="Wq+zkPVq"
Received: from [172.16.12.43] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 38f44f87c;
	Tue, 31 Mar 2026 15:21:40 +0800 (GMT+08:00)
Message-ID: <cd0acf08-de24-4fec-a4de-0cd5b1eeeb28@rock-chips.com>
Date: Tue, 31 Mar 2026 15:21:40 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/10] drm/bridge: dw-hdmi: document the output_port
 field
To: Luca Ceresoli <luca.ceresoli@bootlin.com>, Marek Vasut <marex@denx.de>,
 Stefan Agner <stefan@agner.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Liu Ying <victor.liu@nxp.com>, Rob Herring <robh@kernel.org>,
 Saravana Kannan <saravanak@kernel.org>
Cc: "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>,
 =?UTF-8?Q?Herv=C3=A9_Codina?= <herve.codina@bootlin.com>,
 Hui Pu <Hui.Pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Adam Ford <aford173@gmail.com>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 Christopher Obbard <christopher.obbard@linaro.org>,
 Daniel Scally <dan.scally@ideasonboard.com>,
 Emanuele Ghidoli <emanuele.ghidoli@toradex.com>,
 Fabio Estevam <festevam@denx.de>,
 Francesco Dolcini <francesco.dolcini@toradex.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Gilles Talis <gilles.talis@gmail.com>,
 =?UTF-8?B?R29yYW4gUmHEkWVub3ZpxIc=?= <goran.radni@gmail.com>,
 Heiko Schocher <hs@denx.de>, Josua Mayer <josua@solid-run.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Marco Felsch <m.felsch@pengutronix.de>,
 Martyn Welch <martyn.welch@collabora.com>,
 Oleksij Rempel <o.rempel@pengutronix.de>, Peng Fan <peng.fan@nxp.com>,
 Richard Hu <richard.hu@technexion.com>, Shengjiu Wang
 <shengjiu.wang@nxp.com>,
 Stefan Eichenberger <stefan.eichenberger@toradex.com>,
 Vitor Soares <vitor.soares@toradex.com>
References: <20260330-drm-lcdif-dbanc-v2-0-c7f2af536a24@bootlin.com>
 <20260330-drm-lcdif-dbanc-v2-5-c7f2af536a24@bootlin.com>
Content-Language: en-US
From: Damon Ding <damon.ding@rock-chips.com>
In-Reply-To: <20260330-drm-lcdif-dbanc-v2-5-c7f2af536a24@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0a9d42c5018903a3kunmb80bde77a6a68b
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQkIaTFZNSBoeHx0ZHk1CHRlWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSUJNS0
	pVSktLVUtZBg++
DKIM-Signature: a=rsa-sha256;
	b=Wq+zkPVqz0CdKaCFf0pylSBIqhzr/OXJbXrZAlKgrb9mgepGLiCkxGWVe96a79ogsekMRYocXMZC5t7aV3+NWdqYlLNohinkrr7vg/PxINSu/mrTIAx7y+T1bc4q5/ZO7tbjwksOzwUrTWF9zCHcyxFrFcR8S5xLKPobhhszRcM=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=SwmQCXi9nqzIPuQ5P/EGbSWKKFcCaoib/M5YTzSviFY=;
	h=date:mime-version:subject:message-id:from;

On 3/31/2026 3:25 AM, Luca Ceresoli wrote:
> The meaning of this flag may not be obvious at first sight.
> 
> Reviewed-by: Liu Ying <victor.liu@nxp.com>
> Tested-by: Martyn Welch <martyn.welch@collabora.com>
> Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com> # TQMa8MPxL/MBa8MPxL
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> 
> ---
> 
> Changes in v2:
> - improved comment as suggested by Liu
> ---
>   include/drm/bridge/dw_hdmi.h | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/include/drm/bridge/dw_hdmi.h b/include/drm/bridge/dw_hdmi.h
> index 336f062e1f9d..8500dd4f99d8 100644
> --- a/include/drm/bridge/dw_hdmi.h
> +++ b/include/drm/bridge/dw_hdmi.h
> @@ -126,6 +126,12 @@ struct dw_hdmi_phy_ops {
>   struct dw_hdmi_plat_data {
>   	struct regmap *regm;
>   
> +	/*
> +	 * The HDMI output port number must be 1 if the port is described
> +	 * in the device tree. 0 if the device tree does not describe the
> +	 * next component (legacy mode, i.e. without
> +	 * DRM_BRIDGE_ATTACH_NO_CONNECTOR flag when attaching bridge).
> +	 */
>   	unsigned int output_port;
>   
>   	unsigned long input_bus_encoding;
> 

Tested-by: Damon Ding <damon.ding@rock-chips.com> (on rk3399)

Best regards,
Damon

