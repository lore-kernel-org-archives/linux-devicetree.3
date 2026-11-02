Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793624799;
	b=s7TJXVVFuvDO6eR86yKSzRRaN+BntqLGm7QjUVa41q23MLABd8lCIBx/lshF8c1jX67S
	 KKl6s4vGJNH/WTBMLYWvo1XUlJZR44cIfGOUYVRCQ1UML4y9Yip+Aas2D7S8TSGLop4uj
	 TPERvvJDjkJ2fIeCKucr3n3yym5m+cF8JN/e/r98lLwgXAKE4m/j+Go890VRu8O8dIGYt
	 SrXD1BwOo2qPk1Q+CJKMbfj5lW+kFd/iJENbzcMvKtSXQ6ptGAHMa7w2qnCDU67/sPHj5
	 W6sH+nPfdMPhaaASnv/J9GIM9WVd4Ot807UYjEhZ5bSVMIQs9FfIIWce/wzDXkBTBvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793624799;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:From:Reply-To:Subject:To:Cc:References:
	 Content-Language:Autocrypt:Organization:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=yfR/i7hbDTZSQ2eYRf8n8O8zPjvztuU6httsCjBeO3Y=;
	b=y6LjCGf2d0GVWjHQF+SvjUaQkGoI9LhuTXE6BudLLiDDcKbqVS7x+OBh4ZV3AOvC58V0
	 eMaNYKVXkH1EaC6rGbMIeCGhzdh5LXDDF3VLUVrH/6qf8vLpiabXYcx0p86PcUNaVArZV
	 Kj7xyrTZM+6pYo2aq81sWNpQTA82AjoirHQ9M96KIiIgpbEqOrEyDcJa9p85jWnFILGbO
	 uQ1d5Mn0sJYqu7AnHZT20F/a+mLyPBzvTMfJGgWfVYbTPmwLmRHzzNlag3WZJAoSqSyk1
	 AaN0ZOeUsEslPskzp8dLDYwR8qpdo7rSY3NufszJbeulRkp2Bw/fndI0xYi7It/BGDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=NWazXoJP;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49B0D606A327
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 13:06:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49B0D606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=NWazXoJP
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48af4d4e61fso1793994f8f.2
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 05:06:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793624797; x=1794229597; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yfR/i7hbDTZSQ2eYRf8n8O8zPjvztuU6httsCjBeO3Y=;
        b=NWazXoJPsRbNkg9gG5HNX5c563DygjjMcvpsbZ0klT08nqkGA11g8Q281acxdD0YNZ
         P1FH17CebLSd4u7RZnkrmRIoEEDlMVthf/QCPoAE+u+o6AZXqFe8tNL1R5pEjLPFZyJK
         BtJvehNfXo3Nd4X/9hzNLYIt64n0LVbQvrh4xOsl8vwuePMEno/Axiv/qddmyR9HL7oZ
         XpbT1LhKeeg8H0Zw9uC7M4TWqGvzROXentxSE3gx+hiWNNB1h4oMLjXz7fE++CucsHRP
         pPvr+lM/mZztROI8oLeVjP2AUUfVWxNY/GIGM+Rj7wnRjm0pmV7b/oyvw40mIEnre9R8
         X9bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793624797; x=1794229597;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yfR/i7hbDTZSQ2eYRf8n8O8zPjvztuU6httsCjBeO3Y=;
        b=SpzgZKvQQmxKOC155Ki9X8pln5Z1MvYt1L8Yhplj9vDIEUoro/7CDMDDumnXW5u1ZE
         Os1mwW7AT72MW9CE1A8ttkYMlgdch0Y86YMHP3TqaX0FwPoD2fUbRE/0YuTnqjPfz516
         r/3t18QBp8QRnXJoJ0fpR5AE5Mwczg0tfKPuPsAyHab3vFChnooN7pmNNrdrU3gvpp1r
         ECbdaruv04lPA7+ERO0SrM/+eOrSoip13jMKZZy+JLiK3OcVPnnHZc6JWfAsZy8mBy0U
         1qN+16pT7b6M+lY8AV1lYF/NRMQDjRaWW0oQaeur3P3C42gktbqRytA6kRARxaIKFzP2
         e0nw==
X-Gm-Message-State: AFq9FYJ/fDp3i4J6HHqtmenskvxfUodIkBtySh4/EeiNorQcmO53RXiF
	Y4lQABSi5TaCvIDswq265L3baXgU/ntKByKTCLJDVTK0gy2QXyYI/NU7TnLIKLydWaQ=
X-Gm-Gg: AYBFou15weRPIjop1HEr0P7JWGfxKIQcIaQBWqfNdY3mSLBasSROExi48HPhsXNAxPg
	NnrkKcbgt2G8OZpuTh/cFqd2G1vcPu0HhUgaeiAjkOj99zL+S9F7kqvxxk8s4LfqjzwbUxRS9Ur
	fJIxhFYYbmh8pDhVoMXFR98bIjMN49SFrK5JYJfEGeiFcFrCJPsAcGNpljNTc+Po8Coq03q43yI
	esGPBU8yW6GdDwS+MBV63YK6qlFm7IUXOh6yPB9L1Ip+dXWsr8fbB5BowiJ3bKFlFEm0DLFkuF3
	1i0xL7t/zDXsSwiJJ81toWs0+9lp4WNKcq2Hjaf4xMOVdtaJl9grWZxLoEp05rW6wvgstHxY/wd
	xYKZ/YbYaRgHdN5i/fyCAel2pFv9XoBOPmm0zGjofRVf+okGrcP/kq+McQrZHLEpocajr9iqgzC
	Dns6FnKYEypKSdKWuWKhOOTKIpEQ3BhpX9BeHE4dQPPwsHV+rGkU65ULwRpkAMnP1iascWurZAr
	Q1oTe1LeWclkACiZZ9l6EbFDK9yn+RTc67J/Q3d5Hd3+GLkHyc/vCvA/IVKsSRxL28tOwrKW58e
	LGE/MBuifNIE9C9wAOGTVsh4HtzdijcnAM/CFeaOCBFb6Z5VsoDYFY6BWJBYMrbPoP2v+lTWFoE
	I9DV6RQ==
X-Received: by 2002:a05:600c:5397:b0:4a4:7a8d:c736 with SMTP id 5b1f17b1804b1-4ac16acfceamr220111445e9.9.1793624796374;
        Mon, 02 Nov 2026 05:06:36 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:9476:5165:3a16:262? ([2a01:e0a:106d:1080:9476:5165:3a16:262])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71ba7168sm21696052f8f.55.2026.11.02.05.06.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 05:06:35 -0800 (PST)
Message-ID: <c456f163-2309-425e-90c8-66380f8174ed@linaro.org>
Date: Mon, 2 Nov 2026 14:06:35 +0100
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 4/4] drm/panel: ilitek-ili9881c: do a soft reset in
 unprepare callback
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Icenowy Zheng <uwu@icenowy.me>,
 Han Gao <gaohan@iscas.ac.cn>
References: <20261030-mj070bi30ia2-v1-0-a0f65b65c290@iscas.ac.cn>
 <20261030-mj070bi30ia2-v1-4-a0f65b65c290@iscas.ac.cn>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <20261030-mj070bi30ia2-v1-4-a0f65b65c290@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/30/26 06:44, Icenowy Zheng wrote:
> In case of neither reset pin nor switchable power supply is available,
> the LCD module could be DC polarized (which is harmful) when the MIPI
> DSI host is shut down.
> 
> It seems that do a soft reset for the LCD controller could stop the LCD
> controller from biasing the liquid crystal, thus preventing the harm.
> 
> Add a soft reset after putting the LCD controller into sleep mode.
> 
> Tested on a Sipeed Lichee Console 4A, which has no LCD reset pin, and
> the LCD supply is an always-on one.
> 
> Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
> ---
>   drivers/gpu/drm/panel/panel-ilitek-ili9881c.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c b/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
> index 83148c40e25ca..8b874c6f7d37c 100644
> --- a/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
> +++ b/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
> @@ -2493,6 +2493,10 @@ static int ili9881c_unprepare(struct drm_panel *panel)
>   
>   	mipi_dsi_dcs_set_display_off_multi(&mctx);
>   	mipi_dsi_dcs_enter_sleep_mode_multi(&mctx);
> +	mipi_dsi_msleep(&mctx, 120);
> +	mipi_dsi_dcs_soft_reset_multi(&mctx);
> +	mipi_dsi_msleep(&mctx, 5);
> +
>   	regulator_disable(ctx->power);
>   	if (ctx->iovcc)
>   		regulator_disable(ctx->iovcc);
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
