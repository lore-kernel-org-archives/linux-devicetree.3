Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B70E35E958;
	Wed, 13 May 2026 19:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778700320; cv=none; b=KLS1tj2/Btm7q7xrhygumgVm91ejPbjIumQxDbFIdu4pubwgDm6A0WORZLrTkVqDgceBRE2VXik06hsHz14o7ZiRKi+kqxCxAHDlHWID80DnJ6j07GHc7+2dbZ37kExjWDQ3zTnHLBGQGQUe0OjqTzLrbAGwvCtHCU3UAZhOF4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778700320; c=relaxed/simple;
	bh=7zcrFW0glQIa+ApPblLZSfwkAXwmocG6ivduz9eA1dg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c2W31sK00ohI9NKiZiwJrfAd18TNtWoGkVOh/vMJpuyzhkHZnGOPNfvS8/Mhj23UiaGOtZ8V/5WL3lFvcnZU+ffI5N1DegT6dOGGwyTNotgVH7H1Tg2kFPzFJSFuCH5yIaylvNeM3svTfMSCVOf2U8qbFoF/DfenBmYoIchykHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AWIuGoi2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AWIuGoi2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4590CC19425;
	Wed, 13 May 2026 19:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778700320;
	bh=7zcrFW0glQIa+ApPblLZSfwkAXwmocG6ivduz9eA1dg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AWIuGoi2t+/dBRT+pgUvwbBVry/qDhB1E+UQMbBwUvcTxncoYlscDiRQ5LgCypxfk
	 wA0+2KbhIZb5uDnuqrSpIhNbziX9Go8rHQIAXW5w4I+D0p7+nyKzex4zT8vQUJicrG
	 jMr3hehwdOnAT6QB0DnGVPZFKYYWI9Q7TKy/WzLOJd/1SHRskRrRPBRlBGteVZJMc0
	 DhxBaobUKAdQJtq2HMl7BfSwlw7OGw5eXdAAS/6vTGryYUMnc9+kYxdEKnzFKkspVH
	 fjKKeG/D9I5GtettJ71iE6TP3gzxRIg2+wTBR/yjQE8AV2gYmj+51XeI8c/Clkm50h
	 R4GyCM0uuOV6g==
Date: Wed, 13 May 2026 14:25:15 -0500
From: Rob Herring <robh@kernel.org>
To: syyang@lontium.com
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, andrzej.hajda@intel.com,
	neil.armstrong@linaro.org, dmitry.baryshkov@oss.qualcomm.com,
	maarten.lankhorst@linux.intel.com, rfoss@kernel.org,
	mripard@kernel.org, Laurent.pinchart@ideasonboard.com,
	tzimmermann@suse.de, jonas@kwiboo.se, jernej.skrabec@gmail.com,
	devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, yangsunyun1993@gmail.com,
	xmzhu@lontium.corp-partner.google.com, xmzhu@lontium.com,
	rlyu@lontium.com, xbpeng@lontium.com
Subject: Re: [PATCH v5 1/2] dt-bindings: bridge: Add Lontium LT9611C(EX/UXD)
 MIPI DSI to HDMI driver
Message-ID: <20260513192515.GA1728398-robh@kernel.org>
References: <20260507034049.97765-1-syyang@lontium.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260507034049.97765-1-syyang@lontium.com>

On Thu, May 07, 2026 at 11:40:49AM +0800, syyang@lontium.com wrote:
> From: Sunyun Yang <syyang@lontium.com>
> 
> LT9611C(EX/UXD) is an I2C-controlled chip that Receiver signal/dual port
> mipi dsi and output hdmi, differences in hardware features:
> - LT9611C: supports 1-port mipi dsi to hdmi 1.4
> - LT9611EX: supports 2-port mipi dsi to hdmi 1.4
> - LT9611UXD: supports 2-port mipi dsi to hdmi 1.4/2.0
> 
> Signed-off-by: Sunyun Yang <syyang@lontium.com>
> ---
>  .../bindings/display/bridge/lontium,lt9611.yaml           | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/lontium,lt9611.yaml b/Documentation/devicetree/bindings/display/bridge/lontium,lt9611.yaml
> index 429a06057ae8..b20a43456b01 100644
> --- a/Documentation/devicetree/bindings/display/bridge/lontium,lt9611.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/lontium,lt9611.yaml
> @@ -4,19 +4,23 @@
>  $id: http://devicetree.org/schemas/display/bridge/lontium,lt9611.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>  
> -title: Lontium LT9611(UXC) 2 Port MIPI to HDMI Bridge
> +title: Lontium LT9611(UXC/C/EX/UXD) 2 Port MIPI DSI to HDMI Bridge
>  
>  maintainers:
>    - Vinod Koul <vkoul@kernel.org>
>  
>  description: |
> -  The LT9611 and LT9611UXC are bridge devices which convert DSI to HDMI
> +  The LT9611、LT9611UXC、LT9611C、LT9611EX and LT9611UXD

Use a normal ','.

> +  are bridge devices which convert DSI to HDMI

Missing period.

>  
>  properties:
>    compatible:
>      enum:
>        - lontium,lt9611
>        - lontium,lt9611uxc
> +      - lontium,lt9611c
> +      - lontium,lt9611ex
> +      - lontium,lt9611uxd
>  
>    reg:
>      maxItems: 1
> -- 
> 2.34.1
> 
