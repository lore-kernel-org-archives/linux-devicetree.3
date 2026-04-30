Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 050743630B9
	for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 17:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777569763; cv=none; b=ua/RvUTLfjdtbfVQMdsNuk0IK5KBtVHG2HmQ4E4a6MxbVu+rwCa0SJ6rqmSTtr41qK68J4Ww57tlpnOaFbl+bxcpE/z3a58zhFidA2MJ+hdGXDBkcRG+tv25g69DcT6rv24gyeSRNhvVhR6zFMC2w1pCJLzvOBVkvDmPko6rukQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777569763; c=relaxed/simple;
	bh=/UWCCBGsCu/RGGJJonAz1pXClbHfOB5nu1HYAyRt/xQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tRZzJMFBa8IeauEg9dtYg5qlxpkM+NiQqOaaHgqejwYbLWRvhNO0iR+dVjOUuoXyc5MlrrG0FwOa0/+a15zSwsmKnOjP+tXB6B+WgEF4USA8yGoxpKBVwGF5++2ZXloYAHUMB4w3QE7hAgM0Tespjl2xAz3B8TQH7+wLqoQk+mU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=trdGs0BR; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="trdGs0BR"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-488940ccfa6so5765e9.1
        for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 10:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777569760; x=1778174560; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=86ExqbKZCyhM1MOJP0NAPT/CzgM2Kogsj9N6V/w/ADA=;
        b=trdGs0BRd9XkGQvC4s0mWCjGDC0DQvjtwWonWe/mrrLu4ZwtAxG8mBX/3XFAe5Vyc2
         8uzNB+RbUqqMG+qP6G1MVt50Z97BAI3mHyBCMepdYut11KxKm8BVrs+cDJm48HjYM0b9
         wAQpLwK60f6AKfm+YI6GI2hjMeU5pS9gbBMztvfXAMCHvbFk2bDU3yx7P4rWHDwXYQjt
         MZnBPWXCr+80Qh12fR41Ab/HMTta6OCWNJEXjV6dNdbuxRcLKG+Ob72lMbH/oon81gUU
         zrX++LQn3Cl3TxME/xq0mBgRPhh2J1pVUS3XNUwR75Ai6FW0xH+4o56QCQCh5w0zhzSO
         Vy0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777569760; x=1778174560;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=86ExqbKZCyhM1MOJP0NAPT/CzgM2Kogsj9N6V/w/ADA=;
        b=mq0aQzhLQfV78JrUDDXNSle4oUfI5KCwcgXldFCADRjiWKniqoBqcAtlXR77gTPhGb
         Nzna+qXz1yC9CRnTdaohG6QsbF1hSYq+1/ARttqLcBou/rRt8qLH9aAbZTKAvKb/sMSu
         fJASNGvdLs+yLlsTv1kQc2bSvg8J7kzFjG7ObzkzpCoev1UULuH0f8MqvNABL8xxNr5T
         7YssEUfiV+V2JIHm8+4KsmC125Vbx1r6ZvnUnX5VKQAGmo+xP91efl5Jzn5kQxsaPrA3
         bw2qd8FDwd5j4g/rlHGEt+CP0vD127nL/pG3yjitN2pyx2jqSPw7ErSsx1SQbjU1lhfT
         Yc9g==
X-Forwarded-Encrypted: i=1; AFNElJ/xxs1W+lMdwH5p3eqRPKHuAWd9QtcbDxfY7eQbjH85gj5oTeTbmFM5op9mpXSgi0xilphPhW8BV6pa@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0Nlhz12HCNBcug5Te9+/CZs1mCc75rwZ8Vw/1MjDrOLgmSkMa
	cw/LMup8zpUiCh+NsqcoeSNf9zVjqIDybnNvzpY8VWaW2gLgbbhzmaChlzw/xPoJaQ==
X-Gm-Gg: AeBDiess34fPaSX6RhbkNal1h6XrYCbk5iH2ukDlMsbLJKNpYZ5SqAroewnxBukInwG
	3/lz4FVkuMGV887CaKU4XKOoz+0q0ArW9SZvrVpioRRZbBrdqH3l3rX63Lj4Y1OmvC8pYaZnADS
	7H/q+7Wt9TPd07nKzoVR+V/rZG6rtCk59MhJp0UNW8x/WnHkRMh9AATuNzZ8DVv3ywhpcxw+GzW
	HaFmJzSwqNXOv1A64AqwgufRs0ZbQ2d2axs2E309jz6TslM8Z3aPjIIBynpXFv+vKx1jY1M4V74
	ueIeHqgEyelVpR47oR5CK3os/5v0Dm3kVLSSXy0Rple2ecrGL8W+F8tqg3v0E09cLd9s/ovjRW/
	O1NBmcXuWRCUr+7X+viOBS+WfVmbIZsbs/5z1soe5e2JgsD/pDdGAxayNx2qZGMiIgbg3+qFNFa
	8Xo/oFc04UIMjTRkNbdA9N6L2nx5s4H7CqYQVAKYJ0nx+pQXWVRo15OvkmsfXaWftYgML7luw8k
	m7KiRQJqRQJM5vk
X-Received: by 2002:a05:600c:3496:b0:48a:6321:87f7 with SMTP id 5b1f17b1804b1-48a8dbed9a8mr10305e9.8.1777569760137;
        Thu, 30 Apr 2026 10:22:40 -0700 (PDT)
Received: from google.com (8.181.38.34.bc.googleusercontent.com. [34.38.181.8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a82307f28sm126815125e9.13.2026.04.30.10.22.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 10:22:39 -0700 (PDT)
Date: Thu, 30 Apr 2026 17:22:35 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, maz@kernel.org
Subject: Re: Support for Lenovo IdeaCentre Mini X (Purwa)
Message-ID: <afOP2xXmEpV1eI3Z@google.com>
References: <20260429141815.827157-1-smostafa@google.com>
 <5c838838-00e5-45f2-9515-edbdcddf50ec@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5c838838-00e5-45f2-9515-edbdcddf50ec@oss.qualcomm.com>

Hi Konrad,

On Thu, Apr 30, 2026 at 06:48:33PM +0200, Konrad Dybcio wrote:
> On 4/29/26 4:18 PM, Mostafa Saleh wrote:
> > Hi,
> > 
> > I see that recently the support for “Lenovo IdeaCentre Mini X” was
> > added [1]
> > However, unfortunately that doesn’t work for my device, the board
> > resets once I try to boot the kernel from UEFI.
> > 
> > I believe that’s because it is another variant, as I have been using
> > my device tree for some time[2] which is hacked based on the crd
> > device tree with some trial and error. With that I can boot with
> > PCI/NVME/Ethernet and USB (there are also some other errors in the
> > log related PMIC), this device tree is based on purwa.dtsi unlike
> > the upstream one which use hamoa.dtsi.
> > 
> > Are there any plans to support the Purwa based variant? I am happy to
> > help with testing, but I can’t confidently send patches as my device
> > tree is based on trial and error rather than a data sheet.
> 
> Hello,
> 
> could you try
> 
> diff --git a/arch/arm64/boot/dts/qcom/hamoa-lenovo-ideacentre-mini-01q8x10.dts b/arch/arm64/boot/dts/qcom/hamoa-lenovo-ideacentre-mini-01q8x10.dts
> index bfb7cea56df9..845f303c3836 100644
> --- a/arch/arm64/boot/dts/qcom/hamoa-lenovo-ideacentre-mini-01q8x10.dts
> +++ b/arch/arm64/boot/dts/qcom/hamoa-lenovo-ideacentre-mini-01q8x10.dts
> @@ -8,7 +8,7 @@
>  #include <dt-bindings/gpio/gpio.h>
>  #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
>  
> -#include "hamoa.dtsi"
> +#include "purwa.dtsi"
>  #include "hamoa-pmics.dtsi"
>  
>  / {
> 
> 
> for starters?

Thanks for the suggestion, I tired that now and it doesn't boot, because
PCI and USB timeout, most likely power issue:
[    0.449155] qcom-qmp-usb-phy 88e3000.phy: phy initialization timed-out
[    0.455886] phy phy-88e3000.phy.6: phy init failed --> -110
[    0.458571] qcom-qmp-pcie-phy 1bfc000.phy: phy initialization timed-out
[    0.461710] dwc3-qcom a400000.usb: error -ETIMEDOUT: failed to initialize core
[    0.468478] phy phy-1bfc000.phy.12: phy poweron failed --> -110
[    0.475826] dwc3-qcom a400000.usb: error -ETIMEDOUT: failed to register DWC3 Core
[    0.481982] qcom-pcie 1bf8000.pci: error -ETIMEDOUT: cannot initialize host
[    0.489748] dwc3-qcom a400000.usb: probe with driver dwc3-qcom failed with error -110
[    0.496742] qcom-pcie 1bf8000.pci: probe with driver qcom-pcie failed with error -110
[    0.536145] qcom_pmic_glink pmic-glink: Failed to create device link (0x180) with supplier a600000.usb for /pmic-glink/connector@0
[    1.610679] qcom-pcie 1c08000.pci: Link failed to come up. LTSSM: PRE_DETECT_QUIET
[    1.620224] qcom-pcie 1c08000.pci: error -ETIMEDOUT: cannot initialize host
[    1.627406] qcom-pcie 1c08000.pci: probe with driver qcom-pcie failed with error -110

However, with my device tree I see:
# dmesg | grep -i -e qcom-pcie
[    0.380703] qcom-pcie 1c00000.pci: host bridge /soc@0/pci@1c00000 ranges:
[    0.388163] qcom-pcie 1c08000.pci: supply vddpe-3v3 not found, using dummy regulator
[    0.399742] qcom-pcie 1c00000.pci:       IO 0x007e200000..0x007e2fffff -> 0x0000000000
[    0.407745] qcom-pcie 1c08000.pci: host bridge /soc@0/pci@1c08000 ranges:
[    0.419165] qcom-pcie 1bf8000.pci: supply vdda not found, using dummy regulator
[    0.419290] qcom-pcie 1c00000.pci:      MEM 0x007e300000..0x007fffffff -> 0x007e300000
[    0.419320] qcom-pcie 1bf8000.pci: host bridge /soc@0/pci@1bf8000 ranges:
[    0.419344] qcom-pcie 1bf8000.pci:       IO 0x0070200000..0x00702fffff -> 0x0000000000
[    0.419358] qcom-pcie 1bf8000.pci:      MEM 0x0070300000..0x0073ffffff -> 0x0070300000
[    0.426796] qcom-pcie 1c08000.pci:       IO 0x007c200000..0x007c2fffff -> 0x0000000000
[    0.426801] qcom-pcie 1c08000.pci:      MEM 0x007c300000..0x007dffffff -> 0x007c300000
[    0.530174] qcom-pcie 1bf8000.pci: iATU: unroll T, 8 ob, 8 ib, align 4K, limit 1024G
[    0.538333] qcom-pcie 1c00000.pci: iATU: unroll T, 8 ob, 8 ib, align 4K, limit 1024G
[    0.550954] qcom-pcie 1c08000.pci: iATU: unroll T, 8 ob, 8 ib, align 4K, limit 1024G
[    0.730680] qcom-pcie 1bf8000.pci: PCIe Gen.4 x4 link up
[    0.730996] qcom-pcie 1bf8000.pci: PCI host bridge to bus 0006:00
[    0.736837] qcom-pcie 1c00000.pci: PCIe Gen.1 x1 link up
[    0.745431] qcom-pcie 1c00000.pci: PCI host bridge to bus 0005:00
[    0.748835] qcom-pcie 1c08000.pci: PCIe Gen.3 x2 link up
[    1.075106] qcom-pcie 1c08000.pci: PCI host bridge to bus 0004:00

And
# dmesg | grep -i -e usb
[    0.268120] platform a400000.usb: Adding to iommu group 6
[    0.268154] platform a600000.usb: Adding to iommu group 7
[    0.501050] xhci-hcd xhci-hcd.1.auto: new USB bus registered, assigned bus number 1
[    0.503561] xhci-hcd xhci-hcd.1.auto: new USB bus registered, assigned bus number 2
[    0.503565] xhci-hcd xhci-hcd.1.auto: Host supports USB 3.1 Enhanced SuperSpeed
[    0.503920] hub 1-0:1.0: USB hub found
[    0.504275] hub 2-0:1.0: USB hub found
[    0.504461] qcom_pmic_glink pmic-glink: Failed to create device link (0x180) with supplier a600000.usb for /pmic-glink/connector@0
[    0.528540] xhci-hcd xhci-hcd.2.auto: new USB bus registered, assigned bus number 3
[    0.531145] xhci-hcd xhci-hcd.2.auto: new USB bus registered, assigned bus number 4
[    0.531150] xhci-hcd xhci-hcd.2.auto: Host supports USB 3.1 Enhanced SuperSpeed
[    0.531529] hub 3-0:1.0: USB hub found
[    0.532008] hub 4-0:1.0: USB hub found
[    0.776839] usb 3-1: new high-speed USB device number 2 using xhci-hcd
[    1.091522] hub 3-1:1.0: USB hub found
[    1.206774] usb 4-1: new SuperSpeed Plus Gen 2x1 USB device number 2 using xhci-hcd
[    1.300590] hub 4-1:1.0: USB hub found
[    1.642832] usb 4-1.2: new SuperSpeed USB device number 3 using xhci-hcd
[    1.662337] usb-storage 4-1.2:1.0: USB Mass Storage device detected

I can try to see the differences and build another dt on top of the
hamoa one, but that will also be based on trial and error rather than
actual knowledge, I am happy to test patches if you have other
suggestions.

Thanks,
Mostafa

> 
> Konrad
