Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=149.28.215.223
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795168628;
	b=vx2Y9PKD8xTCAgq6AVD+FC/u4nUZA7adCoHPGBVh0Nk1gDZvaT747UqmA5SKAjPtYWQG
	 AsVv7+OCscZ8oWXImSPQKZW0LVrPTma5W2W/gIF18bRx8sdyrW0OhU492sZG+4NG2xIY2
	 nGjl1cRt0SRwEwNBlNpYEJruR6NYDHFKYLHKjD/tzBYBs5omEJMh6B2M8pKhQsy/uLUKI
	 h81RW3PZMQfuMJ45NlT0NnNArEgqN4AabxPtS60C9sYRPRAxj6knnpPbObUAsAJ++jjzB
	 6QNhVbdotZYG4JIwj7kLC0AiXzLtczn/zXlqDFcsxLNGbdgzD/eoO0yGdWbW18acADw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795168628;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:CFBL-Feedback-ID:
	 CFBL-Address:X-Forward-Email-ID:X-Forward-Email-Sender:
	 X-Forward-Email-Version:X-Forward-Email-Website:X-Complaints-To:
	 X-Report-Abuse:X-Report-Abuse-To:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=rZ1MV5klzHDundSrNYAkIRPEhuUaPbEd4MMBr8/nalQ=;
	b=3iTN8AlX6O5b0pfzhLqlTNd4S1ePRn/PtM8PycrTy+xhn4MdaM7DNX4segJ/lsa6D+UX
	 cd+EO5/3YABmXTQy3viVBGZHnn9klobeIOMIRpPIeGodsj6Mn6SoeJcM5Jpfaq30ekd7+
	 Xx3EYZHKpjCLjpEiygg4L3JrAAgql1DupyWgLobM6VQqWlm2Vh6DifuRG4uIB2rRnnsAj
	 ZUt3TdJ5ospqvDu5K5hKG1gBV3bJ9JKOGFHYRse8YbrCAYN7wP6esq0AM2hpOtrIW0K1d
	 A1jJP8kz7x9QgQCfT5gKVBEZxW6QrVrsukwJATlDAuTn5WLzn7ENKpW6LRv5C9sYSLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kwiboo.se;
	spf=pass smtp.mailfrom=fe-bounces.kwiboo.se;
	dkim=pass header.d=kwiboo.se header.i=@kwiboo.se header.a=rsa-sha256 header.s=fe-e1b5cab7be header.b=yUTDmr4s;
	dkim=pass header.d=forwardemail.net header.i=@forwardemail.net header.a=rsa-sha256 header.s=default header.b=ONl5zTlk;
	arc=none smtp.remote-ip=149.28.215.223
Received: from smtp.forwardemail.net (smtp.forwardemail.net [149.28.215.223])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D4C1606A325
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 09:57:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D4C1606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kwiboo.se header.i=@kwiboo.se header.a=rsa-sha256 header.s=fe-e1b5cab7be header.b=yUTDmr4s;
	dkim=pass (1024-bit key, unprotected) header.d=forwardemail.net header.i=@forwardemail.net header.a=rsa-sha256 header.s=default header.b=ONl5zTlk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From:
 Content-Language: References: Cc: To: Subject: MIME-Version: Date:
 Message-ID: CFBL-Address: CFBL-Feedback-ID; q=dns/txt; s=fe-e1b5cab7be;
 t=1795168625; bh=rZ1MV5klzHDundSrNYAkIRPEhuUaPbEd4MMBr8/nalQ=;
 b=yUTDmr4s1YMjoKWI2LNtPVpQUqAWhlPYamRcUCnnogm8pTTFpA7Czi07NBiqAh5BcTtMHZrFZ
 j6fiKBb9hjwG9Y+V1W/zQnMzdji1VTDP6SbkNE6DKRnsn4FIVhpetS8WgdHxPpR6BdB9lazzK5N
 wuWoSnxcYa96cJ7atHocyqbTB5qY5zaVStjiQnka3MTxiozF/lWY+ZnG8yXTrb8cQ2YGp5PHVfc
 BTTEFH9dWIRIQJZxkkJ9jzhGIbb1/FEw4Y6E5LL7B97Vfz4+3SwGEqPUSSnZqbuFdT7h/DnDM7p
 Xgkm9pf1j6XNSybFt9iny+Erfdm5D8QODCnKuABXKUrw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=forwardemail.net;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From:
 Content-Language: References: Cc: To: Subject: MIME-Version: Date:
 Message-ID: CFBL-Address: CFBL-Feedback-ID; q=dns/txt; s=default;
 t=1795168625; bh=rZ1MV5klzHDundSrNYAkIRPEhuUaPbEd4MMBr8/nalQ=;
 b=ONl5zTlk84eEeTOaVYiiAMotFomLKE5JqbQ6f60u+JdRs9ecN3QeQ4hr6A4jYp6/L8VgoPHnb
 XpnPB/6xCfcKwFQfaDzDHscxW9v5oqJylIapaI4vsY8NqF4fcV383rS7YvmRLydY6YzOBFRLZV/
 sAJFlH1y3u1kX2n5vz4Z9A8=
CFBL-Feedback-ID: 6b00196be00cd0846a727911:c9da0eeb4ca56ea6aa90dc5fa3144251
CFBL-Address: abuse@forwardemail.net; report=arf
X-Forward-Email-ID: 6b00196be00cd0846a727911
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 2.19.33
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <0c495655-9ec8-4d16-a33e-ef4ef3a8f2bc@kwiboo.se>
Date: Fri, 20 Nov 2026 10:56:55 +0100
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
Subject: Re: [PATCH v2] dt-bindings: soc: rockchip: Add RK3572 PMU and GRF
To: 1579567540@qq.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Elaine Zhang <zhangqing@rock-chips.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
References: <20261119-add-board-ok3572-c-soc-v2-1-86f331024ae6@qq.com>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <20261119-add-board-ok3572-c-soc-v2-1-86f331024ae6@qq.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Cunhao Lu,

On 11/19/2026 11:12 AM, Cunhao Lu via B4 Relay wrote:
> From: Cunhao Lu <1579567540@qq.com>
> 
> The RK3572 PMU and GRF blocks are system controllers shared with the
> clock, power-domain, and USB PHY drivers.
> 
> Signed-off-by: Cunhao Lu <1579567540@qq.com>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> ---
> This is one of the subsystem submissions for RK3572 support.
> 
> This patch documents the RK3572 power management unit (PMU) and general
> register files (GRFs) used by the clock, power-domain and PHY drivers.
> The GRF binding describes the USB2 PHY as a child of its GRF and
> requires clocks for the NVM0, PHP, PIPE PHY and USB2 PHY GRFs.
> 
> The RK3572 SoC has eight CPU cores: two Cortex-A73 cores and six
> Cortex-A53 cores. It also integrates an Arm Mali-G310V2 MC1 GPU.
> The OK3572-C board provides two Gigabit Ethernet ports, three USB3 Type-A
> ports, a Type-C dual-role port, eMMC, microSD, and UART.
> 
> Testing was performed with Debian 13 minimal and Linux 7.3 on the
> OK3572-C with the FET3572-C module.
> 
> Passed functionality:
> 
> - SD and eMMC complete the firmware, kernel, and root filesystem
>   boot chain.
> - UART console works at 1500000 baud.
> - SD read/write and data persistence checks pass.
> - All eight CPUs start; CPU frequency scaling and hotplug checks pass.
> - Both Ethernet ports obtain IPv4 addresses and pass bidirectional file
>   transfers.
> - All three Type-A ports pass USB2 and USB3 enumeration, data transfers,
>   and reconnect persistence checks.
> - Type-C host and device modes pass in both plug orientations. Physical
>   reconnects correctly select the expected device, host, and device roles
>   in sequence.
> 
> Some files in this series are derived from the Forlinx OK3572-C BSP
> Alpha1. Thanks to Forlinx for their support.
> Thanks also to Rockchip's David Wu, Elaine Zhang, Finley Xiao, Frank
> Wang, William Wu, and Ye Zhang for providing the driver source files.
> 
> AI assistance:
> 
> - Codex / DeepSeek V4.1 Flash were used for:
>   - Reviewing and adjusting code style to follow community conventions
>   - Automating tests
>   - Collecting data
> ---
> Changes in v2:
> - Split the original RK3572 support series by subsystem.
> - Link to v1:
>   https://patch.msgid.link/20261022-add-board-ok3572-c-v1-0-0b0fd85a31ee@qq.com
> ---
> Raw dmesg: see the v1 cover letter.
> ---
>  Documentation/devicetree/bindings/arm/rockchip/pmu.yaml |  2 ++
>  Documentation/devicetree/bindings/soc/rockchip/grf.yaml | 12 ++++++++++++
>  2 files changed, 14 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/rockchip/pmu.yaml b/Documentation/devicetree/bindings/arm/rockchip/pmu.yaml
> index 1cff2328cd01..43dcaa77ffdb 100644
> --- a/Documentation/devicetree/bindings/arm/rockchip/pmu.yaml
> +++ b/Documentation/devicetree/bindings/arm/rockchip/pmu.yaml
> @@ -28,6 +28,7 @@ select:
>            - rockchip,rk3528-pmu
>            - rockchip,rk3562-pmu
>            - rockchip,rk3568-pmu
> +          - rockchip,rk3572-pmu
>            - rockchip,rk3576-pmu
>            - rockchip,rk3588-pmu
>            - rockchip,rv1126-pmu
> @@ -48,6 +49,7 @@ properties:
>            - rockchip,rk3528-pmu
>            - rockchip,rk3562-pmu
>            - rockchip,rk3568-pmu
> +          - rockchip,rk3572-pmu
>            - rockchip,rk3576-pmu
>            - rockchip,rk3588-pmu
>            - rockchip,rv1126-pmu
> diff --git a/Documentation/devicetree/bindings/soc/rockchip/grf.yaml b/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
> index e94c83d7c138..0e0bf8e234c8 100644
> --- a/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
> +++ b/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
> @@ -30,6 +30,12 @@ properties:
>                - rockchip,rk3568-pipe-grf
>                - rockchip,rk3568-pipe-phy-grf
>                - rockchip,rk3568-usb2phy-grf
> +              - rockchip,rk3572-ioc-grf
> +              - rockchip,rk3572-nvm0-grf
> +              - rockchip,rk3572-php-grf
> +              - rockchip,rk3572-pipe-phy-grf
> +              - rockchip,rk3572-pmu0-grf

Are we missing rockchip,rk3572-pmu1-grf and possible other syscons?

> +              - rockchip,rk3572-sys-grf
>                - rockchip,rk3576-bigcore-grf
>                - rockchip,rk3576-cci-grf
>                - rockchip,rk3576-csidphy-grf
> @@ -96,6 +102,7 @@ properties:
>                - rockchip,rk3562-pmu-grf
>                - rockchip,rk3568-grf
>                - rockchip,rk3568-pmugrf
> +              - rockchip,rk3572-usb2phy-grf

Do we need a special rockchip,rk3572-usb2phy-grf? If rk3572 mimics
RK3576 there are two usb2phy GRF, each one identical and only covering
usb2phy functions.

With GRF compat I expect the DT so be something like following:

  usb2phy0_grf: syscon@26054000 {
	compatible = "rockchip,rk3572-usb2phy-grf";
	reg = <0x0 0x26054000 0x0 0x2000>;

	usb2phy0: usb2phy {
		compatible = "rockchip,rk3572-usb2phy";
	};
  };

  usb2phy1_grf: syscon@26056000 {
	compatible = "rockchip,rk3572-usb2phy-grf";
	reg = <0x0 0x26056000 0x0 0x2000>;

	usb2phy1: usb2phy {
		compatible = "rockchip,rk3572-usb2phy";
	};
  };

The usb2phy child node would be the sole child node of GRF and the child
node consume whole parent reg space. Should they instead be merged? That
is how I described the usb2phy nodes in U-Boot mainline work at [1].

[1] https://git.u-boot-project.org/u-boot/contributors/kwiboo/u-boot/-/blob/rk3562/arch/arm/dts/rk3572.dtsi#L357-403

Regards,
Jonas

>                - rockchip,rk3576-ioc-grf
>                - rockchip,rk3576-pmu0-grf
>                - rockchip,rk3576-usb2phy-grf
> @@ -259,6 +266,7 @@ allOf:
>                - rockchip,rk3308-usb2phy-grf
>                - rockchip,rk3328-usb2phy-grf
>                - rockchip,rk3399-grf
> +              - rockchip,rk3572-usb2phy-grf
>                - rockchip,rk3576-usb2phy-grf
>                - rockchip,rk3588-usb2phy-grf
>                - rockchip,rv1108-grf
> @@ -310,6 +318,10 @@ allOf:
>          compatible:
>            contains:
>              enum:
> +              - rockchip,rk3572-nvm0-grf
> +              - rockchip,rk3572-php-grf
> +              - rockchip,rk3572-pipe-phy-grf
> +              - rockchip,rk3572-usb2phy-grf
>                - rockchip,rk3576-dcphy-grf
>                - rockchip,rk3576-vo1-grf
>                - rockchip,rk3588-vo-grf
> 
> ---
> base-commit: 4405c18c95d2d0f99f6c581ef0ee8591a1aa6ccd
> change-id: 20261119-add-board-ok3572-c-soc-0bf15aa6f56d
> 
> Best regards,
> --  
> Cunhao Lu <1579567540@qq.com>
