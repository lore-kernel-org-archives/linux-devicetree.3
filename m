Received: from mail-pj2-f1.google.com (mail-pj2-f1.google.com [74.125.227.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BC894BC009
	for <devicetree@vger.kernel.org>; Sat,  5 Sep 2026 17:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788627933; cv=none; b=hZ6QVYzic/Gmmb19rS3rOEfXw3yMQwe9HZe7EseHyRYOd6CPcO7frwjinQN3OSJcWDDIy3cmrzVJqqSW9ffS9y/IABFxhTlHQ8clVPEi2PNKn0diUWkxlzxUpxuCdArr3zpxEN4domZMq9UKI0nxyShUdutBh2VdN7CDEdcidCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788627933; c=relaxed/simple;
	bh=0ODup3lwTSxoRSnQU/SPB+fwEkQRgmnDBxu9JVnP6zU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LXjvAa2R/6GWQxZw5kXUOyvPPBKKaNT7KufUqp0Ub5OuyY3vtW51HV46tV8OTEN+kIvq6PH9T+Unw9BcXkYKmOcWKCKhPIfxYHL6xTYDeZm7ODP+ZkpIggUutXBXb2uz85fPz2GmHNZAXDUQFsthegRAu50PCtM/VBaZyxsPrA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gaz87e91; arc=none smtp.client-ip=74.125.227.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gaz87e91"
Received: by mail-pj2-f1.google.com with SMTP id 98e67ed59e1d1-399213ef56cso1013813a91.1
        for <devicetree@vger.kernel.org>; Sat, 05 Sep 2026 10:05:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788627930; x=1789232730; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Lgfe+MC2Qpshqj28ePlzHxBw1FwK8wWPwaSdf9wxtGw=;
        b=gaz87e913BAT+Aa3VtEjxvbcCut1SWMWN5bCnYao5wyi/iFN5cR0Zb/t2VEkth1tf8
         aninueHS4D0/DrOBLhlt1GenF2Wvs3dgYfZKD6VOHjuqXzUn76ccB7DyBJWihwNhxaQA
         y5gB7Js9cMx4XJvFkYo8JTaNTsf1LwiFbiGWT0sHK0tUbVnca4iY9LgDKU9vPmqG6r9a
         5tCsiGeThLbnaDDk861dy9TpUm6aWHDwwM0Y2Y5yiwRBZaPWds4yA6cYlfuiB2mQPs4d
         Vn3RNlShRx8bYgPSXrlcoxt2NxZ9k39yzAGMeNRkpXjy+w8TN10Ss5Tzt7MchXXRCPK6
         ytjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788627930; x=1789232730;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Lgfe+MC2Qpshqj28ePlzHxBw1FwK8wWPwaSdf9wxtGw=;
        b=GXaC70rIT8pRygpX+c9g6SqTQTBlOl0hn8yevcHmKyMd0mXLdul3hgy+kboS9hepiX
         235qsD6H6e3DK8f9mqitB6+wP57nQ+mQPEvdaDYbdtm7Pwob+YD4FynnrX2kM89z0yes
         katAOou2xQ22RgCL59tg6En3bi+gO6qVnKW6X60cIKGRKbzNidSa3yDpmCXXD8FK4oMj
         EX4N1TliDcsvh4AHViasLL2Y3NS3DqpUx2zWkRU3Nqvso60fFeJMTKqLkbq6HlixraAo
         1BqtaXS6mtD/DVl470mz8fmyhsjDFnzZT+hEXlt16CjmTQv3dh0mCBWuPaY8nJWOdIFY
         Vr7Q==
X-Forwarded-Encrypted: i=1; AKwUvBzkK9Evdy7+uq0I5DoThOSerle/o18LiZ9wOtWhgHHRwhrqkj2AeBHKji+BHVzxADDL0l7GaadMUcct@vger.kernel.org
X-Gm-Message-State: AFuF++mXHkd5zpCdarsXOzvj64HFmtiFTY37LRj12uO23/PrTLxg0hzy
	VP2f/NAvuMa+ic/xZy6FUZniFFv5ZtnGfS8sx8fNd0b1wtzozGnu3HJW
X-Gm-Gg: AYBFou3xOUQGJKxl1t/mJx4h3RhIFQkW9tJvGJoZl2/cD31vILfDzz5siqtca/UbutL
	vHXl/uxDcnbIlRm3sy3RIUUOPA2ViDaaXlyYZBFKhmpJXF1bvdjljU3MSTgWNlJWHbr21iQ1kGq
	DpY4y6yU368VcE6UTtqveGIR82PS/Kpkk0RDHpvLFWpdOZ4EXDiRg/5ngDqMzlNDvZtigrLVzLu
	5HfeiXsvV2ng8ugivHhbTIPmxnVN16gUHm/qWv9uAKXPqA/ad4d+dk6KePPqpylt7h9QboqlAr8
	cgf6Y6sGoBgaVk5BZRwUDuTCrtRsY6AxzrfaYMbLe+uHb9s5A7V8BtFwS1ZEQ9hmqlqHvThJ2Xy
	7Mdw6DK/obJE1OdlpyQ0VC/klAM1L5HpTHWFAIsRum7ZMw2utUos5sVrAjfBsgfCS4JnV93X8Rk
	ROgJp7MHZ4PmLJzT14eZPVQTfHt2V850wYeCkDqQkNRkIk7zY41MBvb0FnoZJs6r4aMjV0lvSUY
	dO9Aj4F
X-Received: by 2002:a05:6a21:9d84:b0:3d3:af85:eb98 with SMTP id adf61e73a8af0-3da3a16a579mr21841183637.26.1788627929852;
        Sat, 05 Sep 2026 10:05:29 -0700 (PDT)
Received: from [192.168.50.100] ([111.199.57.231])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc4554770f6sm2092737a12.24.2026.09.05.10.05.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Sep 2026 10:05:29 -0700 (PDT)
Message-ID: <4e8e6f90-9731-4416-8b1a-be1cef12bb72@gmail.com>
Date: Sun, 6 Sep 2026 01:05:25 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] riscv: dts: spacemit: enable onboard eeprom for
 OrangePi
To: Chukun Pan <amadeus@jmu.edu.cn>, Yixun Lan <dlan@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Paul Walmsley <pjw@kernel.org>,
 Alexandre Ghiti <alex@ghiti.fr>, Albert Ou <aou@eecs.berkeley.edu>,
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 spacemit@lists.linux.dev
References: <20260901080010.95040-1-amadeus@jmu.edu.cn>
From: Gong Shuai <gsh517025@gmail.com>
In-Reply-To: <20260901080010.95040-1-amadeus@jmu.edu.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/1/2026 4:00 PM, Chukun Pan wrote:
> Enable the i2c2 bus and add the connected GT24C02B EEPROM.
> 
> [   6.766] TlvInfo Header:
> [   6.766]    Id String:    TlvInfo
> [   6.769]    Version:      1
> [   6.772]    Total Length: 38
> [   6.775] TLV Name             Code Len Value
> [   6.779] -------------------- ---- --- -----
> [   6.783] Base MAC Address     0x24   6 .....
> [   6.788] MAC Addresses        0x2A   2 2
> [   6.792] Product Name         0x21  15 x1_orangepi-r2s
> [   6.797] Unknown              0x41   1  0x01
> [   6.801] CRC-32               0xFE   4 0xE5A74B18
> [   6.806] Checksum is valid.
> 
> Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
> ---
> This patch depends on the following to avoid conflicts:
> https://lore.kernel.org/lkml/20260802100101.327815-1-amadeus@jmu.edu.cn/
> ---
>   .../boot/dts/spacemit/k1-orangepi-r2s.dts     | 30 ++++++++++++++++++
>   .../boot/dts/spacemit/k1-orangepi-rv2.dts     | 31 +++++++++++++++++++
>   2 files changed, 61 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts b/arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts
> index 2d1ba34cb00e..7125f2882ce8 100644
> --- a/arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts
> +++ b/arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts
> @@ -13,6 +13,7 @@ / {
>   	compatible = "xunlong,orangepi-r2s", "spacemit,k1";
>   
>   	aliases {
> +		i2c2 = &i2c2;
>   		i2c8 = &i2c8;
>   		serial0 = &uart0;
>   		ethernet0 = &eth0;
> @@ -112,6 +113,35 @@ rgmii1: phy@1 {
>   	};
>   };
>   
> +&i2c2 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&i2c2_0_cfg>;
> +	status = "okay";
> +
> +	eeprom@50 {
> +		compatible = "atmel,24c02";
> +		reg = <0x50>;
> +		pagesize = <16>;
> +		size = <256>;
> +		read-only;
> +		vcc-supply = <&buck3_1v8>;
> +
> +		nvmem-layout {
> +			compatible = "onie,tlv-layout";
> +
> +			mac-address {
> +				#nvmem-cell-cells = <1>;
> +			};
> +
> +			num-macs {
> +			};
> +
> +			product-name {
> +			};
> +		};
> +	};
> +};
> +
>   &i2c8 {
>   	pinctrl-names = "default";
>   	pinctrl-0 = <&i2c8_cfg>;
> diff --git a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
> index f7547a4da71a..837616255464 100644
> --- a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
> +++ b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
> @@ -17,6 +17,8 @@ aliases {
>   		serial0 = &uart0;
>   		ethernet0 = &eth0;
>   		ethernet1 = &eth1;
> +		i2c2 = &i2c2;
> +		i2c8 = &i2c8;
>   		mmc0 = &emmc;
>   		mmc1 = &sdhci0;
>   	};
> @@ -138,6 +140,35 @@ rgmii1: phy@1 {
>   	};
>   };
>   
> +&i2c2 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&i2c2_0_cfg>;
> +	status = "okay";
> +
> +	eeprom@50 {
> +		compatible = "atmel,24c02";
> +		reg = <0x50>;
> +		pagesize = <16>;
> +		size = <256>;
> +		read-only;
> +		vcc-supply = <&buck3_1v8>;
> +
> +		nvmem-layout {
> +			compatible = "onie,tlv-layout";
> +
> +			mac-address {
> +				#nvmem-cell-cells = <1>;
> +			};
> +
> +			num-macs {
> +			};
> +
> +			product-name {
> +			};
> +		};
> +	};
> +};
> +
>   &i2c8 {
>   	pinctrl-names = "default";
>   	pinctrl-0 = <&i2c8_cfg>;


Hi Chukun,

I have tested this patch on an OrangePi RV2 with a kernel built from
linux-next (next-20260904).

With the patch applied, the i2c2 bus comes up and a 24C02-compatible
EEPROM (256 bytes) is probed at 2-0050. Reading the raw contents via

     hexdump -C /sys/bus/nvmem/devices/2-00500/nvmem

shows a valid ONIE TlvInfo table, and the nvmem cells
(product-name, mac-address, num-macs, crc32) are properly exposed.
The Product Name field reads "x1_orangepi-rv2", which matches this
board.

Tested-by: Gong Shuai <gsh517025@gmail.com> # OrangePi-RV2


I also tested the MAC address wiring below on top of this patch, with
the nvmem-cells references added to eth0/eth1, eth0 picks up the base
MAC address stored in the EEPROM and eth1 gets the base + 1; both
addresses stay stable across reboots.


diff --git a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
index 837616255464..44b81268c802 100644
--- a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
@@ -93,6 +93,8 @@ &emmc {
};

&eth0 {
+   nvmem-cells = <&mac_address 0>;
+   nvmem-cell-names = "mac-address";
  phy-handle = <&rgmii0>;
  phy-mode = "rgmii-id";
  pinctrl-names = "default";
@@ -117,6 +119,8 @@ rgmii0: phy@1 {
};

&eth1 {
+   nvmem-cells = <&mac_address 1>;
+   nvmem-cell-names = "mac-address";
  phy-handle = <&rgmii1>;
  phy-mode = "rgmii-id";
  pinctrl-names = "default";
@@ -156,7 +160,7 @@ eeprom@50 {
	nvmem-layout {
	   compatible = "onie,tlv-layout";

-         mac-address {
+         mac_address: mac-address {
		  #nvmem-cell-cells = <1>;
	   };


But I am not sure whether this wiring should be part of this patch.
Without such wiring, the kernel falls back to random MAC addresses
on this board.

Best regards,
Shuai



