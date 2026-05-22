Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 128EA371049
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 06:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779432244; cv=none; b=m9wJ2/XkGGSTrxYFXbPH8QGoAL59dFddQ8juid2jnaTG1elYMRTQL0JUt3bRV7Zxt/bFSPRay8hVaS7F1jzV/HTuDKyQdr8+2M01a7PY5esInHtCESShUcvxNQtIY5pNcUs+I7ri9CCGaX40xPRiWb3XdXPs213nBjl9WNoOvvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779432244; c=relaxed/simple;
	bh=wYDWEomdKSg+Vn09oi+zzsXmAc6O8C8jgK8UqIZwgrE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QEs/UjLR1PvqP+2aV2VssDlmjoegxkP29xZsRWxqS8798AjQ5fXVPSvp3gbh0hC7eDiHvvJo5sShrRGfsWal9hBspsWIaipo+6jbkBaCPr9CuXcxXU4+lAJQuKe8Zyq+XnRF//pZ76NKxPSjlnNezJyLDBKxONn0F5kx7mL0ci8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OqaGKd+g; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OqaGKd+g"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4903d5c67bfso5810475e9.1
        for <devicetree@vger.kernel.org>; Thu, 21 May 2026 23:44:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779432241; x=1780037041; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V95QtxOjNpk/eFHCICMdSHCCCiyFoiVHQUBE50qTcZQ=;
        b=OqaGKd+gWAeYDeX1FAFCI7/XDl9e03vdlcI7kPa8NJmX8ZEL6yJongu+5Zye1rRRgW
         +cmVK8JfSmdnQ6bB69xWInM+Vygy+XHnP2MedXWEloHYb8dE8JE5gjCN0+tAxj6Y9mry
         yzXyCvi/PD93/tyNTd7CuJ4sPJReTHL8SMT1+jvCutSvPN1fWx55esdgOOVXFzMaSR4W
         T6rIHc9r7NYzF8DJgCzSlmCzzIHUrWIWm0EgywEPrRkTe6Y4lC05vxgHMi2GLO3aWzDz
         M3fNO6+qTmMdEV+S3YmDb6Huhd8r9+btTX7BO6rdznXNMMxHz3E6qyoWYIlFgmw3VXDA
         sfIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779432241; x=1780037041;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V95QtxOjNpk/eFHCICMdSHCCCiyFoiVHQUBE50qTcZQ=;
        b=Qpz/qXWc08SCqEkxjSMpoTHJ8kpf9uZIBtfnsEf70/G+L+d0ZIysSiPTLfr5b7IfQV
         t7QGXQcCxhbAJHVUuXTOQJi8XWeQe2BYQjff6P4drfFQpvRzTav8+6gYmIl5tBFeCgMm
         SsrWbhp4AfQxGuw+Dl58IPggcCWVAJa49KaGoGZQkV2cQjgwnn5iwgfCE/C3oLBt1lPQ
         gV/ArIoS85uvrw6Pasfv0+MWv/nGycG42Q8en1qDEZHX1G+MCLihg/k9mL9AyNZm2f/h
         o2NjcBQbtzuLVkfe3/0yDw0Q/iz/E5YZLXf+cl2DIoWa7lzU+tnp2FX4IQVZhK4+W8Ci
         Ok4w==
X-Forwarded-Encrypted: i=1; AFNElJ/XHsOCEsFg3/gic03G34BLtCcKIEDw2AZuZV1a1+exmHFKxw/RXmO5u6P/rtOMQg5OwG7nVWthY4Fx@vger.kernel.org
X-Gm-Message-State: AOJu0Ywyt/ht4dcYyYjGzY+LwsWHynfdyrWn2J4BHM8TZ0C6K0aCdIbN
	O7JHF/OCNqtUwfztqxgxds2pznUt/gvPah4zncNT+MLJmrNvWsRfKaKKQ35V5WB83nk=
X-Gm-Gg: Acq92OGRg0jY0VCrfNcsWg/+4Swsy64xZ+q1pde3rh1KbRoLBZp8TXxqDGjVg2mKFgH
	xiO/xsvQ4hsS4vbouzZ2NYQVL924euKEH1sqDI/b5QMzS2LSnoD1yB0h/2JbdxwaVLIAyTtmsNE
	4KPHxyNlqyvBzM/rnbeP7EmbZshzSPwHkHhOWQ0VBTe1A5TTSbtAW8t6W53hYDmEoKkYWkk/Ffb
	UuOX4at+l/Ya/uA9K852Ig5KQX9YrTf0LDRjRwwECZ/u+s8r4oY6t04HwVbeNRDd+M63kT9kEdD
	QSKtHSQGEudukB0TesCvNmbyCnzscpbo/kOpqMbMJf6q24w8x9wufnSytCxowcsYQFz4PnP6QQ6
	tpHhWeRqoFdOJW/fVLgJiq29e1lEnaYo9DrAMRoiQBkAJ8l9Kq2/HpBtgR+x1FyVqMXaXbD84Rj
	MdkoD9YO5th6CWBX22X54vhBUzVXyysXyJXTM3oEv8GrNzrKfmpnFfMLKOA7aZC1o/duhV70wNv
	1AuVVs=
X-Received: by 2002:a05:600c:4ecc:b0:488:a824:fdff with SMTP id 5b1f17b1804b1-490426d190cmr26027355e9.22.1779432241368;
        Thu, 21 May 2026 23:44:01 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:192b:8d21:b456:cb51? ([2a01:e0a:106d:1080:192b:8d21:b456:cb51])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490417ac7dasm10859115e9.7.2026.05.21.23.44.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2026 23:44:00 -0700 (PDT)
Message-ID: <def01730-bd5d-4c61-a302-a9ca625cda7a@linaro.org>
Date: Fri, 22 May 2026 08:44:00 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 5/6] arm64: dts: qcom: qcs6490-radxa-dragon-q6a: Enable
 GPU and display pipeline
To: Graham O'Connor <graham.oconnor@gmail.com>, linux-arm-msm@vger.kernel.org
Cc: andersson@kernel.org, konradybcio@kernel.org,
 robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260522060645.4399-1-graham.oconnor@gmail.com>
 <20260522060645.4399-6-graham.oconnor@gmail.com>
From: Neil Armstrong <neil.armstrong@linaro.org>
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
In-Reply-To: <20260522060645.4399-6-graham.oconnor@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 5/22/26 08:06, Graham O'Connor wrote:
> Enable the GPU clock controller (gpucc), GMU, display clock controller
> (dispcc), and MDSS display subsystem.
> 
> Add DisplayPort HPD pinctrl state for GPIO47 and wire up the DP output
> pipeline through the RA620 DP-to-HDMI bridge. The RA620 is a passive
> hardware bridge requiring no driver - it converts DP to HDMI
> autonomously. Add the dp-connector and hdmi-connector nodes to complete
> the display graph.
> 
> Disable DSI, DSI PHY, eDP, and eDP PHY as these interfaces are not
> present on the Radxa Dragon Q6A hardware.
> 
> Tested on Radxa Dragon Q6A (QCS6490) with RA620 DP-to-HDMI bridge
> connected to an HDMI monitor.
> 
> Signed-off-by: Graham O'Connor <graham.oconnor@gmail.com>
> ---
>   .../dts/qcom/qcs6490-radxa-dragon-q6a.dts     | 85 +++++++++++++++++++
>   1 file changed, 85 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts b/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts
> index 4003837ad..e8ad6e666 100644
> --- a/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts
> @@ -1113,3 +1113,88 @@ &pcie1 {
>   &eud {
>   	status = "disabled";
>   };
> +
> +&gpucc {
> +	status = "okay";
> +};
> +
> +&gmu {
> +	status = "okay";
> +};
> +
> +&dispcc {
> +	status = "okay";
> +};
> +
> +&mdss {
> +	status = "okay";
> +};
> +
> +&tlmm {
> +	dp_hot_plug_det: dp-hot-plug-det-state {
> +		pins = "gpio47";
> +		function = "dp_hot";
> +		bias-disable;
> +	};
> +};
> +
> +/ {
> +	hdmi-bridge {
> +		compatible = "dp-connector";

This is not the right way to enable the HDMI connector.

This patch https://lore.kernel.org/all/20250914-radxa-dragon-q6a-v2-5-045f7e92b3bb@radxa.com/
is the right way by exposing the HDMI bridge and setting the right usb_1_qmpphy data lanes.

Neil

> +		label = "hdmi";
> +		type = "full-size";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&dp_hot_plug_det>;
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			port@0 {
> +				reg = <0>;
> +				hdmi_bridge_in: endpoint {
> +					remote-endpoint = <&usb_dp_qmpphy_out_dp>;
> +				};
> +			};
> +			port@1 {
> +				reg = <1>;
> +				hdmi_bridge_out: endpoint {
> +					remote-endpoint = <&hdmi_connector_in>;
> +				};
> +			};
> +		};
> +	};
> +
> +	hdmi-connector {
> +		compatible = "hdmi-connector";
> +		label = "hdmi";
> +		type = "a";
> +		port {
> +			hdmi_connector_in: endpoint {
> +				remote-endpoint = <&hdmi_bridge_out>;
> +			};
> +		};
> +	};
> +};
> +
> +&mdss_dp {
> +	status = "okay";
> +};
> +
> +&mdss_dp_out {
> +	data-lanes = <0 1>;
> +};
> +
> +&mdss_dsi {
> +	status = "disabled";
> +};
> +
> +&mdss_dsi_phy {
> +	status = "disabled";
> +};
> +
> +&mdss_edp {
> +	status = "disabled";
> +};
> +
> +&mdss_edp_phy {
> +	status = "disabled";
> +};

