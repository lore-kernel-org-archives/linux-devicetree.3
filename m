Received: from smtp.forwardemail.net (smtp.forwardemail.net [121.127.44.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C6E6315D43
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 20:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=121.127.44.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783713617; cv=none; b=Y3Jd6GmwzmV8JtcmXRjRAEDL/iX25wJqzlWwBanr6MBW+J9sCs//wrJSlc+JLg2ohOOG0UFbl3cvMBJbeGNwaXMx9VvDrmvOi3Al2iWWSvMo2GHcUE4+p0e2ydJays7T5sinahmC9fxeyrooSwJZfcWBXCrP580GAvndCNf92UI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783713617; c=relaxed/simple;
	bh=xH/B71YU9s67bC9FMdI+WyfQ8AX8QhCJH/Yfl0FJQls=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=goJTVUuz4778/1rkEPXXDiLi9degqBF3gJc0Vl5ZQyqPDvrljX691amIS1FojIqQrl/nD0tGYHnhQ0QxP6w36S/HtVe9shyb9+9enqvksqkTjaEeWBC/ztBKXsEW4iQp5EcJ8jfLVQoQI/jsxvR85CuIG8BxOhJ3GhBQtIhW/lY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kwiboo.se; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se; dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b=FRNIpVX1; arc=none smtp.client-ip=121.127.44.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b="FRNIpVX1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1783713614;
 bh=ulVUgfNYT2lEH0MbdG1dD+8MEdmaDjbz4xf8uzzuOTQ=;
 b=FRNIpVX1OfkXzYVIG6mVWbzSB+5Eyz7WVTVN9vKvfOeG3t1PKAPCt/QMEn7pS117XQKBsYqGc
 b8y4A5hg4gjOM8luz3fMIKUQ/FQlqkBhwKnl6ssbsbKUQteAJqU4h4fgkxNsxj3nVT1QSB8xgqa
 nfeAF7U0uJUM1OHvC2mRyxTTWf3rVJVLFbMLevwgzMUTHpeEQOkNXWThtnJ8nfCkQqq7VgIHJ+D
 Z2oYK7RSwfQ/DHu+RjgLBxNJNxOzg8dd2FfzU76PwjHIQwZTCt4R9+rD4TTpZFJQTpfPZARPNxl
 qEFCuSCx7e/NA6aGDpddUxFz3o1Y8rRNe3HidF2Osx8w==
X-Forward-Email-ID: 6a514f4df640ad60663f1f38
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.66
X-Forward-Email-Version: 2.10.2
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <1abc6880-c131-404d-a521-5b5063e408f1@kwiboo.se>
Date: Fri, 10 Jul 2026 22:00:09 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/12] dt-bindings: soc: rockchip: grf: Add RV1106
 compatibles
To: Simon Glass <sjg@chromium.org>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
 Fabio Estevam <festevam@nabladev.com>, linux-arm-kernel@lists.infradead.org,
 Bartosz Golaszewski <brgl@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Jeffy Chen <jeffy.chen@rock-chips.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Michael Riesch <michael.riesch@collabora.com>, Rob Herring
 <robh@kernel.org>, Yao Zi <ziyao@disroot.org>, huang lin
 <hl@rock-chips.com>, linux-kernel@vger.kernel.org
References: <20260706195818.3906949-1-sjg@chromium.org>
 <20260706195818.3906949-6-sjg@chromium.org>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <20260706195818.3906949-6-sjg@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Simon,

On 7/6/2026 9:58 PM, Simon Glass wrote:
> Add the compatibles for the general register files of the Rockchip
> RV1106: the main GRF with its clock-controller child, which provides
> the MMC drive and sample phase clocks, and the IOC and PMU IOC blocks
> used by the pin controller.
> 
> Signed-off-by: Simon Glass <sjg@chromium.org>
> ---
> 
>  .../devicetree/bindings/soc/rockchip/grf.yaml | 30 +++++++++++++++++++
>  1 file changed, 30 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/soc/rockchip/grf.yaml b/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
> index 2cc43742b8e3..349fd3393ac4 100644
> --- a/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
> +++ b/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
> @@ -64,6 +64,8 @@ properties:
>                - rockchip,rk3588-vo1-grf
>                - rockchip,rk3588-vop-grf
>                - rockchip,rv1103b-ioc
> +              - rockchip,rv1106-ioc

Do we possible need a different compatible for each GPIO IOC?

GRF address mapping table over all different GRF regs used by this SoC:

  Name		Address Base 
  PERI_GRF	0xFF000000 
  VENC_GRF	0xFF010000 
  NPU_GRF	0xFF018000 
  PMU_GRF	0xFF020000 
  DDR_GRF	0xFF030000 
  CORE_GRF	0xFF040000 
  VI_GRF	0xFF050000 
  VO_GRF	0xFF060000 
  GPIO0_IOC	0xFF388000 
  GPIO1_IOC	0xFF538000 
  GPIO2_IOC	0xFF548000 
  GPIO3_IOC	0xFF558000 
  GPIO4_IOC	0xFF568000 

> +              - rockchip,rv1106-pmuioc
>                - rockchip,rv1108-usbgrf
>            - const: syscon
>        - items:
> @@ -100,6 +102,7 @@ properties:
>                - rockchip,rk3576-usb2phy-grf
>                - rockchip,rk3588-usb2phy-grf
>                - rockchip,rv1103b-pmu-grf
> +              - rockchip,rv1106-grf

What GRF in the table above is this referring to?

Vendor kernel went the easy route and declared a single mega GRF block.
Mainline should probably declare each GRF individually to correctly
describe HW?

>                - rockchip,rv1108-grf
>                - rockchip,rv1108-pmugrf
>                - rockchip,rv1126-grf
> @@ -244,6 +247,33 @@ allOf:
>  
>            unevaluatedProperties: false
>  
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: rockchip,rv1106-grf
> +
> +    then:
> +      properties:
> +        clock-controller:
> +          type: object
> +          additionalProperties: false
> +
> +          properties:
> +            compatible:
> +              const: rockchip,rv1106-grf-cru
> +
> +            "#clock-cells":
> +              const: 1
> +
> +          required:
> +            - compatible
> +            - "#clock-cells"
> +
> +          description:
> +            Clock provider for the MMC drive and sample phase clocks,
> +            whose control registers live in the GRF region.

As mentioned in CRU patch, please take a look at RK3528, it exposes
similar similar 'GRF' clocks from the CRU. Do not blindly follow what
has been done in the vendor kernel.

Regards,
Jonas

> +
>    - if:
>        properties:
>          compatible:

