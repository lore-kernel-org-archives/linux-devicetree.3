Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.181
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793880530;
	b=i/LRQqTR+2eaMLLuq+1RJ1DeQuWaum+RqLikdo9ulaFfah1WxHNDvvd27ZqoeB8j9rTj
	 X/uqIUwmrQP1L68ZKVeiHcHK421/C1gphNg+oSHTdT7x0sV70OwUQO7YMsVr64aFpzUGf
	 eX5iMpV6B6lCn6EH8MywXfuUEj4KlBTblBiNu7yokG15P649+ptAInuVLqvEVCbGzGbHP
	 QE+9uy8WFWPqy7GQOLpSy48ZeRyT38AvQsq8Ym2w+TSOYQRhEkvIRc2zjrkGNfPM+YSZ5
	 zoS+cJfdIeWhNhSSGL/mugh/OGf8aju399pbtaSwpNpo/4jUnp0lzOPHiggRYgbkHVA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793880530;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=/0iceX90IqV9oL5wqkzDxra2XjMzLEXwA9jTMie2zR4=;
	b=v0W02/Cu0XEC6aO2O+y1m/6AWJOqRTPJkBRMVALf7OoIBid2pwOIDY985Ix0Yx2QwVq2
	 Ak6+2NWjB236vKBHWHByDFPW7szBGF8vwzHEOIJ/I42k37VEtQuxgz/jqqfpQaresUC0g
	 7MAUSkm6Zxv4NT3N1mR9zKGh/hXe+OGN7WKhVV+4irwLMxBQLOSbWFAcA4qFf7Fd2JxQy
	 am0+QHOiebrHRT5bMYZDVxDiLoLzGKF00jwSa8Np1EkQi8SCQAjr82Z45X0izgVSRPZFG
	 frAGT/g8trEDPQGIZvlCFXWeHLvjszRIc/nDx3HEdPBOJBEp32AcWxrk3x0NfMAQ6Pw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=fooishbar.org;
	spf=pass smtp.mailfrom=fooishbar.org;
	dkim=pass header.d=fooishbar.org header.i=@fooishbar.org header.a=rsa-sha256 header.s=google header.b=NI+Tnm0+;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.181
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5C81606D83C
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 12:08:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5C81606D83C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fooishbar.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fooishbar.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=fooishbar.org header.i=@fooishbar.org header.a=rsa-sha256 header.s=google header.b=NI+Tnm0+
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cc4aa0246b7so868811a12.3
        for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 04:08:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793880529; cv=none;
        d=google.com; s=arc-20260327;
        b=NUvpDCQZJaIke7QKOyMMLCo03bVclQrol5bID6sK9U6gltxE+QVPVIDmTBps5jJBuM
         MalsKSl59dFYlWL+4yINbhF5tHRAo6Y86X90GC81nfq3u6XNFNRkgdan8YwLHDjTTZNK
         kfE6jyUSKEotSxQdPuPHG9FWBUIonxdAEf1w3gd78e5hMn7wuQRRCLoYk+fQP7+q2CYz
         p53RvsHITz5hIxe7CjUSFA0gQD0hLRs3L2i8I5VXoWCLkRKU/1WVQHrE9KQ3eD2CaKrF
         OBHtq6u7rfJuJmm/ua55b+ZUFbZRnjnYTLPAxWBqduZxEKglPov1LGC3+gj7fxqMxXPC
         8DPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=/0iceX90IqV9oL5wqkzDxra2XjMzLEXwA9jTMie2zR4=;
        fh=TTgsLazHOl8VfryAcilkDlYhfu1Z5sTdlJWHuIC7G44=;
        b=nF7RpmItXMOYX/0GYg8dxO3FbOGc+2eBgMye9qbGXsE17HO7a49D9gNGDiHyrnASuA
         QmIouqMeZoWVpBp+Xpk/Kw8ThMDYKtuUh4lS6jKyiS65JjmwXrMVmNTgagkP7lkXBPvD
         dij7IqtM57Mp/415DmXYv+ZAclXW3N8Iu0zAqR0vksyKMH7b2DSmpYTbfQfzVT3uNgWZ
         680yk8YTBB1g+tx0uIiWPOyeiq77UH++tb2UYqMA30rX9/QV1RQzYD3FyVz4i6Jk8Y1Z
         deuhjyHiB1Mk7ws5RDmdPRBZcIBr56qgSx43sHuyaEkmp3JrWRNqa2edWlw9Cf5Ta2Qo
         qOkg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar.org; s=google; t=1793880529; x=1794485329; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/0iceX90IqV9oL5wqkzDxra2XjMzLEXwA9jTMie2zR4=;
        b=NI+Tnm0+iB8mmC4dR6qzPqkzbrgseLMU00deWh1JGnVPk0oWXMyXTi/PDOFPhbZFb3
         eVqSqKbVvudM5YXGUGcVRSMqzrmJy4aAoLHhs3tpEkYcp09Ja1qw95hVPXHWkyZvLjMR
         n6LW29D9imLKa8RQc6kAbvXLChjAki8xtlpXVjMAOJtqFHvkKYfSuxVuTqA94aKiTOCh
         +bKq8DluefDVFX5kL/d8uuVoumva9dIu/1DrwA/9JuJONX8qsEFm90Ecv6bcww8bfDxA
         jJBZSpD/Vnx6YHZCJ+Qx+gCIn2t/XzB2D5eU4cdg4wS+JGNEO6wKMJbfjuc12f7KHlCF
         qTDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793880529; x=1794485329;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/0iceX90IqV9oL5wqkzDxra2XjMzLEXwA9jTMie2zR4=;
        b=wRgKfOIuPR314SEfqkmTGEGACflM+i2O505zWhIGfPWVOrTBqBaAUXjEAJLMku8wV2
         NhHJLnLWUA/dcMGHq2vUAXqGB6NHJ5jeC4vZ72Fr7w/PfM8bxf9rtSuFU3JkmvvM7UJv
         XzQou3UPK1i4J2UtCA/blp609+OoQaUHOAv/eCIsHbwysI2ZxZkYFyJqRsUMnufI0X1A
         oF9hplUoP0lxtOnz5smajolOWACou/0IK1Z8KYszF3K9PTBeuGFVgx/pij72VBNQeyXR
         +52K3xduyfZZEGu3XAxmkRVxlXS1a3tFlH9EnJmoVLXYSAQGR3qsZ/qRkTZAZQyOY5ED
         srAw==
X-Forwarded-Encrypted: i=1; AKwUvBzCjB60nOeSHHQs6jwgYcNuase+4lrXhCiO+fM7UBLLxg9juyJ+VNA6wP67pnsKyFsDmVyHOxJSpMZH@vger.kernel.org
X-Gm-Message-State: APuU4Z/+Y0iSgiLTpaG1SQsA0jUG6V41q6GmVss9QBUyvDjUA7p0Y4lG
	RFBX/TryBnRuSYqsl6e8nb+BtpYAv8XQIA0kt7UyLi5eXaWzr7c6Y1ZYiM9LD/lv6YkMy3gj+LP
	d8/vtkqmGtmS5F+6WbJCgfaJSpAsnEK7hqce1xrD2Ig==
X-Gm-Gg: AYBFou3zDm5VTvvXPly75Q5XkhqvDIZimmDaHNwo4Pr2wzSt7SG0q/3bDRm4oOcZIlY
	7lvWRU9SSpZYqOIlNT7G8w+Hj6OHcMieZWWMTdneofq24/1w6ZxDryMVpm5QU+AyiwhNee9mtP+
	Bx7OmGAVx+VS6hJTLhv1j9DCAYTYgL9O0dgsQbz5SVx5uGXzXELU5Vj+pbl53gXU7ZXmQ1qlJIf
	M27+jcyFCCnQT0AM2pgc7TFTKvIDeYa4qVDdjMTUIiypHX4D34b+K33+JWPfCbVxTNVkVhrV7JB
	Lez9OcB8yAjh71A0ZZi/81+/suweRf6vKKd4Id7ymASmpWsmcUEoZ6RLkJg5pXW26NEMGzi8RVF
	qI4MY7ouaArQPo1hCWhibHinYbVVbVuIJKQV5
X-Received: by 2002:a17:90a:ec90:b0:3b0:c11a:902d with SMTP id
 98e67ed59e1d1-3b0c11a91c6mr1036738a91.10.1793880529265; Thu, 05 Nov 2026
 04:08:49 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105-dw-hdmi-qp-yuv-v6-0-1bb63ef5766e@collabora.com> <20261105-dw-hdmi-qp-yuv-v6-13-1bb63ef5766e@collabora.com>
In-Reply-To: <20261105-dw-hdmi-qp-yuv-v6-13-1bb63ef5766e@collabora.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Thu, 5 Nov 2026 12:08:38 +0000
X-Gm-Features: AclHuK9SHkBLRSAoFwhG6L3qgKeNZAN0mhWE5mO5no7yjWFPSRU-9JZ6TzN2VOg
Message-ID: <CAPj87rM=D4h-EfkTdqbumrM159M9Mb89nJt0K1AgcTrqwAqM6w@mail.gmail.com>
Subject: Re: [PATCH v6 13/15] drm/rockchip: dw_hdmi_qp: Support 10-bit YUV422
 output format
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Andy Yan <andyshrk@163.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Daniel Stone <daniels@collabora.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, kernel@collabora.com, 
	dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Igor Paunovic <royalnet026@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 5 Nov 2026 at 01:01, Cristian Ciocaltea
<cristian.ciocaltea@collabora.com> wrote:
> Rockchip DW HDMI QP encoder supports YUV 4:2:2 output through
> ROCKCHIP_OUT_MODE_YUV422, but was limited to 8-bit depth via
> MEDIA_BUS_FMT_UYVY8_1X16.  Add support for its 10-bit counterpart
> MEDIA_BUS_FMT_UYVY10_1X20, which carries two 10-bit components per clock
> cycle on a 20-bit wide bus.
>
> The HDMI PHY scales its PLL output by 8/bpc to undo the deep color
> packing, such that it matches the DCLK rate expected by VOP2.  However,
> YUV 4:2:2 is never deep color packed, as it always transmits two 12-bit
> components per pixel, regardless of the color depth.  From a clock-rate
> perspective this is equivalent to three 8-bit RGB components, so
> configure the HDMI PHY with 8 bpc when YUV 4:2:2 is in use to keep its
> output clock aligned with the TMDS character rate.

Reviewed-by: Daniel Stone <daniels@collabora.com>
