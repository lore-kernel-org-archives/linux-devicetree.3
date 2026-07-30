Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B2B7392821;
	Thu, 30 Jul 2026 21:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785446363; cv=none; b=sYhXXUWJnNHriJ5WPx0n7Fkv4thTNmPBF5VzrmhY6VfIxSjw4FLmTKp5Qa+g8hZe+D39j8wK6ykhWbIiXhjxQDPj3+BFyzHq4Ltrd8CVU0fGVKFrbibfJK2vfactJTofP7OD8zkcfQ9ui2gO699yqO2qmnsH4s4jRpvWwDuAtBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785446363; c=relaxed/simple;
	bh=9TGxkH0AFNeaL0LTtJiIhAnsHh0NSM/jsZbn4Z9CCwU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r7u77i/pkXjP8Lx6kRS5+9YCq4KMVUfVdWMP4Tp8/u8mw5h2cIVrXCYMTFPBth8Yu2whIWQ4F0bnLH9sU1qANCg131fmgUkqJ5nSeD+WBqf69Zf9bU1oHjDHrEuRRICa2+JFf1YYRBDDoZU5gkYL7XUEZfpK/mSvZL3tKggAI94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LFpTOth2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LFpTOth2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9E6C1F000E9;
	Thu, 30 Jul 2026 21:19:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785446360;
	bh=O4ztPFUflL40uyuABOr+tVKUzpAc+WnbAwLCt9/Z4HA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LFpTOth2g/S+0Qzpp+KUojTfsJFxriH/2pH9IVwe6z0U4GkTVXF9Di3HZD1pCP+AX
	 H475A6nc+OltOXZHQYS7b5TEitO8l5KBVLoHYiXzJQ4a3ULIaeAqBTym2/hFfPczZU
	 DW0mAj7geCYI/7IGDmOzYcS0ml806RqNo1Ngw/ds/dzgTjVHupZSltMsUETBaZSbbp
	 hWMWTIowiODjsqVMF54rHUEduAzPIDqq/okVrCD5xBoIAuh7skiaRYaZBykKBq+ANo
	 ZaXBmzzS1QG/Pq9sJp5FNJOVgGruq+GDXKSGHwNFtUlWOKAN/rxQ2ReeSJfS4FUYbz
	 gTkSq6ZSQlELg==
Date: Thu, 30 Jul 2026 16:19:17 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	chris.lew@oss.qualcomm.com, Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
Subject: Re: [PATCH] arm64: dts: qcom: shikra: Add qcom,vmid to BAM-DMA node
Message-ID: <amu9hfJQ3VhRZ6PR@baldur>
References: <20260714-b4-qcom-shikra-dts-bam-dmux-vmid-ext-v1-1-5b19da8d7735@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260714-b4-qcom-shikra-dts-bam-dmux-vmid-ext-v1-1-5b19da8d7735@oss.qualcomm.com>

On Tue, Jul 14, 2026 at 02:01:53PM +0530, Vishnu Santhosh wrote:
> On the Qualcomm Shikra SoC the mDSP (VMID 43 / QCOM_SCM_VMID_NAV) is
> the AXI master for BAM descriptor FIFO accesses. The XPU enforces
> per-region access control; without an SCM assignment granting NAV
> access, the first DMA transfer triggers an XPU violation.
> 

I'm a bit puzzled about your plan here.

You posted this on July 14th, that's 3 days after I asked you to rebase
patch [1]. This patch literally says that [1] is broken and untested.

> Add qcom,vmid = <QCOM_SCM_VMID_NAV> to the bam_dmux_dma controller
> node so bam_dma SCM-assigns each channel descriptor FIFO at
> allocation. BAM-DMUX itself is a singleton and no longer needs a DT
> property for its destination VMID: the driver now selects
> QCOM_SCM_VMID_NAV internally via the qcom,shikra-bam-dmux compatible's
> match data.
> 
> Co-developed-by: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
> Signed-off-by: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
> Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
> ---
> This depends on three separate series:
> 
> - "arm64: dts: qcom: shikra: Add BAM-DMUX support" [1], which adds
>   the bam_dmux and bam_dmux_dma nodes this series modifies.
> - "arm64: dts: qcom: Extend Shikra device tree with CDSP, LPAICP,
>   MPSS remoteproc PAS and peripherals" [2], which is still under
>   review and adds the "remoteproc_mpss" node that [1] attaches
>   bam_dmux to.
> - "dt-bindings: dma: qcom,bam-dma: Add optional qcom,vmid property" [3]
>   and "dt-bindings: net: qcom,bam-dmux: Add qcom,shikra-bam-dmux
>   compatible" [4], which introduce the qcom,shikra-bam-dma and
>   qcom,shikra-bam-dmux compatibles this series relies on for the
>   qcom,vmid property to validate under dt-schema.
> 
> [1] https://lore.kernel.org/all/20260711-qcom-shikra-dts-bam-dmux-v2-1-d5b33ee32138@oss.qualcomm.com/

Changes was requested on July 11th

> [2] https://lore.kernel.org/all/20260714-shikra-dt-m1-v6-0-bee265d3499b@oss.qualcomm.com/

Changes was requested on July 13th

> [3] https://lore.kernel.org/all/20260714-qcom-bam-dma-vmid-ext-v1-0-cef87c57b7dc@oss.qualcomm.com/
> [4] https://lore.kernel.org/all/20260714-qcom-bam-dmux-vmid-ext-v1-0-3f29da7cca76@oss.qualcomm.com/

Might be wrong on the timezones, but I think you had change requests in
your inbox by the time you posted this series.


What do you want me to do with this patch?

> ---
>  arch/arm64/boot/dts/qcom/shikra.dtsi | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
> index 246ea74d1fb1e293f0428d342301886dc52cb179..cb824da1757921edf0befe5480bf489ee1d8c727 100644
> --- a/arch/arm64/boot/dts/qcom/shikra.dtsi
> +++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
> @@ -5,6 +5,7 @@
>  
>  #include <dt-bindings/clock/qcom,rpmcc.h>
>  #include <dt-bindings/clock/qcom,shikra-gcc.h>
> +#include <dt-bindings/firmware/qcom,scm.h>
>  #include <dt-bindings/interconnect/qcom,icc.h>
>  #include <dt-bindings/interconnect/qcom,osm-l3.h>
>  #include <dt-bindings/dma/qcom-gpi.h>
> @@ -1888,7 +1889,7 @@ glink-edge {
>  			};
>  
>  			bam_dmux: bam-dmux {
> -				compatible = "qcom,bam-dmux";
> +				compatible = "qcom,shikra-bam-dmux", "qcom,bam-dmux";
>  
>  				interrupts-extended = <&modem_smsm 1 IRQ_TYPE_EDGE_BOTH>,
>  						      <&modem_smsm 11 IRQ_TYPE_EDGE_BOTH>;
> @@ -2030,7 +2031,7 @@ glink-edge {
>  		};
>  
>  		bam_dmux_dma: dma-controller@6044000 {
> -			compatible = "qcom,bam-v1.7.0";
> +			compatible = "qcom,shikra-bam-dma", "qcom,bam-v1.7.0";
>  			reg = <0x0 0x06044000 0x0 0x19000>;
>  			interrupts = <GIC_SPI 74 IRQ_TYPE_EDGE_RISING 0>;
>  			#dma-cells = <1>;
> @@ -2039,6 +2040,7 @@ bam_dmux_dma: dma-controller@6044000 {
>  			num-channels = <6>;
>  			qcom,num-ees = <1>;
>  			qcom,powered-remotely;
> +			qcom,vmid = <QCOM_SCM_VMID_NAV>;
>  		};
>  
>  		sram@c11e000 {
> 
> ---
> base-commit: 3b029c035b34bbc693405ddf759f0e9b920c27f1
> change-id: 20260714-b4-qcom-shikra-dts-bam-dmux-vmid-ext-1b4f793e035c
> prerequisite-change-id: 20260525-shikra-dt-m1-082dec382e7f:v6
> prerequisite-patch-id: 48ecd66c06c4fad81f91283c26ec57d95bbde29d
> prerequisite-patch-id: 7d92e5a301d09616840e54dc9e4a81f30a64383c
> prerequisite-patch-id: be1a16f53e23dd5ab90210a056c9da3559c6186d
> prerequisite-patch-id: 3eff04500c55100c763aeac1f1f8c5768d500500
> prerequisite-patch-id: ab22c5fdb2fa65b78ffef76bbe4459c8d5ffe7b2
> prerequisite-patch-id: cb24efedb648271ef5c60ace96e2366d89254e8f
> prerequisite-patch-id: 8be7df0395c5847a988c7e814c7db878b5932b11
> prerequisite-patch-id: 0510992d022cef7317b6efee6765ac78c0225356
> prerequisite-patch-id: de4327fcbe81f92a337f429b74e8220969a5b79f
> prerequisite-patch-id: e13435365cba0b6ecfcea6d9e5ab72838fba23a7
> prerequisite-patch-id: 90f78668eb969c16ed8c2485d75a60a183fc4b8e
> prerequisite-change-id: 20260603-qcom-shikra-dts-bam-dmux-7fdcbb6fb662:v2
> prerequisite-patch-id: 59bb0a7828e41f546f734f127d81da83c0adcda9
> prerequisite-patch-id: 197da6bcb15cadc47869dba88c8020987b25c335
> prerequisite-patch-id: 8ec9c1eb03f052ae232ed54117abed38672c23f6
> prerequisite-patch-id: 350db4f4bcdfc0fad9ed57cd5b1723f85ad44f5d
> prerequisite-patch-id: b5d7f75df02fde56181f576a936baf09d0a72276
> prerequisite-patch-id: 3ce52e07ae57139c2e2b71a29ed7d7250f6fcc87
> prerequisite-patch-id: 3a689e8dda5fd2755b689d94d095806b3f2e6eed
> prerequisite-patch-id: ac83151a889855498d36288ddd36216d451340c8
> prerequisite-patch-id: 2357cac636e019eaf14d6a493a1c72bca56fe405
> prerequisite-patch-id: 2885f299e711582da312ca9d13983d296a3dd5dc
> prerequisite-patch-id: 91af5f3c01e766a53ce8de69aa21847a2d6bbbf8
> prerequisite-patch-id: 48ecd66c06c4fad81f91283c26ec57d95bbde29d
> prerequisite-patch-id: 7d92e5a301d09616840e54dc9e4a81f30a64383c
> prerequisite-patch-id: be1a16f53e23dd5ab90210a056c9da3559c6186d
> prerequisite-patch-id: 3eff04500c55100c763aeac1f1f8c5768d500500
> prerequisite-patch-id: ab22c5fdb2fa65b78ffef76bbe4459c8d5ffe7b2
> prerequisite-patch-id: cb24efedb648271ef5c60ace96e2366d89254e8f
> prerequisite-patch-id: 8be7df0395c5847a988c7e814c7db878b5932b11
> prerequisite-patch-id: 0510992d022cef7317b6efee6765ac78c0225356
> prerequisite-patch-id: de4327fcbe81f92a337f429b74e8220969a5b79f
> prerequisite-patch-id: 968bffc36646412f8289b917f37e762a4297bcc8
> prerequisite-patch-id: 35944403bd4480caad12657342da15ea71c6afbd
> prerequisite-patch-id: 65b485474126f4a2ab3f69a0b8e146b3b04c2c1a
> prerequisite-change-id: 20260714-qcom-bam-dma-vmid-ext-8a3bd3c5c00e:v1
> prerequisite-patch-id: b61d337d6c8fc4b20bff5a057b3f3335d89c57c3
> prerequisite-patch-id: 91d3d344ec3e35ef7a3cec0a2ef90fefaf10a039
> prerequisite-patch-id: 9e23abde2db60a3ad3a00d060bfb91f68c0aa798
> prerequisite-patch-id: 4fa3350725e5b9d442247756d2b51d03f99b86bc

So this patch has almost been tested upstream, only 38 patches delta?

Regards,
Bjorn

> 
> Best regards,
> -- 
> Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
> 
