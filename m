Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793640742;
	b=zWUxh6I9u/AsNn6o9QgMRP+lbKFQWfleL0zmvyCig3Y3R0qTeIAC9VjjRXEDRL1k8zpP
	 h1pXbvX67K4vWymrCHzlgkoeNiE8CZo3pfkKNJ2rJNMq6xUa+5KlZg+U3OiNhexveJ0TG
	 636u3uhaI1U15zTDYDrmBOT/jtQBzk9GVHduwL1IEJJ2YSzV5PZL7XAY3hLH0R0wyt35V
	 bRu4fkHHuwLEEMuWcTrl7pTM399xAiZHlh5LPsgWU7xcXEeRTCCzuqiIrP1NErPiHOeDn
	 F/ZV04Yk2sXr+g1Ulf0B7fnIu5WdvPqH94t3IOMCARGz0UZpeA0Cn8FmavcAx4KTW+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793640742;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=kq9Yzc8kYPuDZCKpCPFJzDuGUxfrJXPPIpmBSRkumE8=;
	b=FihfDbYwby3qdbvbWxHToHsATYFfjhSwa2vrcGatQQ6WWwZAQjOXEB8EFDcOQfTF9pAq
	 hDtDjJhDZBWD9Sslp6mGlOA4EU5QGeSGOjnnGxd1P7mTSedP4Nv7fJTWp7O/sQXreMFUO
	 F77tdretsfF8LcdW7lNYAkV0rRRLpEgtvbG0iI5Irri5/st1T4LOKV1tsacdkOs0NInd1
	 b4TZDpGTAcPgXlw/DCleBKRuxMJhn62N2TsDeCx3/eyu7Ux418dGUNS1+Mi+Hr/SidZ3W
	 1XZmkVBCKH2YqDQpFEMO6ZLmv+dbZlVJJkWdWdCwBF/oLhxxTNbozs3BhLV3uwzBgNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xZTRVERe;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25B0B606A5B2
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 17:32:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25B0B606A5B2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xZTRVERe
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a208d93758so35173395e9.3
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 09:32:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793640740; x=1794245540; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kq9Yzc8kYPuDZCKpCPFJzDuGUxfrJXPPIpmBSRkumE8=;
        b=xZTRVERevsFJ3xOw27hdUmvVIrOKf8/xegLOt20ndNBgY1FA2N/K+i1jMiIkTbtzJX
         /iAFOs8kecCX04xqw4maWngu2LYcnb9CkJ3mTQ7MzhlRalm90WHgD4UMa+piTWU4lZwP
         uw64O4yb21Pk6GSg3moxJn8+HWhqaLxyGTN9ZyBdHKfXBx0eT1tEqgbOENFoZ2TxW1Ag
         BMKp4QUXhSyW3h/BMOsBJvHeZcguid6DOK0A5AIcwMovmCedvO1NcLDSic4EcnumPPTX
         FmScxIniK2nVIzNm3mBoxkjP18kp3mkRniyCRvh6xE6VVMep9DVEqKxpiluCIGfRCWUJ
         kZmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793640740; x=1794245540;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kq9Yzc8kYPuDZCKpCPFJzDuGUxfrJXPPIpmBSRkumE8=;
        b=oiIV8KvqRoWp07P3K7WWgTQMDtDYUIpZE08uhtdej3RlCl9RZBdNeU9T5mSKn0jCie
         We0uhXKW+CqwyqMdVsrS9UlfTVGDyrTcvCYqOd5sh6SvwrCnAkVX13ruYk3S4VrkpUEI
         cJXL2iL63fjvPCTWSshuEbOzQP5oR1bwXWyk/u8IF2m1B9y92T4L1RaQNao6XGFQPL24
         FzFnvjOICqWnaKoXFWHaXnoyfteje+OK3PZPGxGBlX9YRdXpPLfVrdVgi9TBFSgLhHf3
         hQhCpPgYQFk4+NfRwTVbCQCmnFh5b3BTpAhR/NZpTYdIol9E1jckn180Wd8DZ8qRoxmx
         WoGg==
X-Forwarded-Encrypted: i=1; AKwUvBzUTG/REFSCcqp5Iz1nyYC9UlOHo50hrJYaud74IBHj7MnLQ369iDNOASu15E7TwS6p2HEdFVYvEbkx@vger.kernel.org
X-Gm-Message-State: AFq9FYLrsEFXgB4o+ZOOOxQb/+hDSFK4bDkW3Fu+oBnQ7gHkMFEI/xnE
	RKBG139DiRyjxssi5DeORskKhxJe13tdE3VipHxzjNAtn9Q5t78NalW/U8psmzJ9+nXbbg==
X-Gm-Gg: AYBFou1Vo3gX69Z/CRSj/5T/sNjDnEEiJZnnHi9bkAqiGRWbVWJppFqcSIvEFENx/fq
	phlgDChqzZj0KKXOuU9aqetD2cQluXl8L2ILvR4ZRGmfFGjuvbfkrwYvFjQnkMR3Kl7Q6Btk+Cy
	XdFCqftoaEEp2MR/esjzM807MppNbZaEoj0bS+CzIOgSlBaMzMiMpXXQOpLxFHGfMJ3Ppucxn8n
	IbMRFZnKzZLP7ZIeqlpvdSSUs824T80Fiuf2/jC2CRW0YunkRWYvOIk0o4CTn8/cT4fWgO+zuvl
	BXJZhW/WAjAzAE7f+ktFPSlNJ1epylTxJyQQNEzKguze2WI7la5+5aFI72jJWz5CU4U4ukFhUpl
	EQDUIg5sGwyu+2ITOwZYVxKFzCqkyAyds/jSysqCmhJl+KQJgMuevuzCWjFbRJD+5m3PGBd8D8R
	q9/8cM9cC63Ul5/ROwmgDqcnGskUNGbRYjFbcDhAvxgBDXnyD7DiNrEUfrKZ1Nle4MgH1mtZd4P
	tYXtC5JKmeQcSREb48woDd89dTvbkv0WelprQff2g3Xb2MGLdkNNqYjNGwR+vLDRW+abvVRxmsi
	4ri4ZpGz9uAuQR0cz7a76XVCMt0n2OmFZhOqMgF/hte1UH7bF5s2OnyHMc//pofXYx79awWvAok
	h1BnYWWXpfS57dd1j09Pg
X-Received: by 2002:a05:600c:1385:b0:4a3:5991:718 with SMTP id 5b1f17b1804b1-4ac182dc0a1mr263780855e9.16.1793640740359;
        Mon, 02 Nov 2026 09:32:20 -0800 (PST)
Received: from [10.0.1.67] (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2ab3ea6a9sm2039345e9.15.2026.11.02.09.32.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 09:32:19 -0800 (PST)
Message-ID: <8abc611c-525e-4450-b924-87dcad57a578@gmail.com>
Date: Mon, 2 Nov 2026 18:32:18 +0100
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
Subject: Re: [PATCH 1/2] arm64: dts: imx8qm-ss-conn: add usbotg3 iommu
 information
To: Frank Li <Frank.li@oss.nxp.com>, "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Xu Yang <xu.yang_2@nxp.com>,
 Frank Li <Frank.Li@nxp.com>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
 Francesco Dolcini <francesco.dolcini@toradex.com>
References: <20260720-qm_smmu-v1-0-3689fbd8b516@nxp.com>
 <20260720-qm_smmu-v1-1-3689fbd8b516@nxp.com>
 <b911ff91-ce7b-462e-a7fb-f8c6d682c85b@gmail.com>
 <auJWI1bqt4kX70pZ@lizhi-Precision-Tower-5810>
 <auJjlYWf2JCa22Ai@lizhi-Precision-Tower-5810>
 <2a1eb85c-8a30-4594-bdad-8a1dec17b141@gmail.com> <auTPTxt5ioBJrr27@SMW015318>
Content-Language: en-US
From: Emanuele Ghidoli <ghidoliemanuele@gmail.com>
In-Reply-To: <auTPTxt5ioBJrr27@SMW015318>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 10/30/26 18:09, Frank Li wrote:
> On Thu, Oct 29, 2026 at 07:55:41AM +0100, Emanuele Ghidoli wrote:
>>
>>
>> On 10/28/26 22:05, Frank Li wrote:
>>> Does it only impact superspeed? High speed work?
>>
>> No, it's not even enumerated, on the Dev board.
>>
>>>
>>> Thank you report this problem. Suppose below patch should fix this problem.
>>>
>>> I have not time to test it today.
>>>
>>>
>>> Frank
>>
>> Tested, it doesn't help.
>>
>> xhci-hcd.1.auto has no fwnode, so platform_dma_configure() never calls
>> of_dma_configure() and the new code in of_iommu_configure() is never
>> reached.
> 
> Finially, it is hack at uboot.
> 
> 592: static int config_smmu_fdt_device_sid(void *blob, int device_offset, int sid)
> 601:     prop = fdt_getprop(blob, device_offset, "fsl,sc_rsrc_id", &proplen);
> 618:     ret = fdtdec_parse_phandle_with_args(blob, device_offset,
> 620:                                          "power-domains", ...
> 578:     err = sc_rm_set_master_sid(-1, rsrc, sid);
> 681:     prop = fdt_getprop(blob, offset, "iommus", &proplen);
> 848:     if (is_imx8qm()) { ret = config_smmu_fdt(blob);
> 
> 
> Need combine power-domains with iommus.
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8-ss-conn.dtsi b/arch/arm64/boot/dts/freescale/imx8-ss-conn.dtsi
> index 176e2e332f87c..cc2b9a212780f 100644
> --- a/arch/arm64/boot/dts/freescale/imx8-ss-conn.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8-ss-conn.dtsi
> @@ -189,6 +189,7 @@ usbotg3_cdns3: usb@5b120000 {
>                         phys = <&usb3_phy>;
>                         phy-names = "cdns3,usb3-phy";
>                         cdns,on-chip-buff-size = /bits/ 16 <18>;
> +                       power-domains = <&pd IMX_SC_R_USB_2>;
>                         status = "disabled";
>                 };
>         };
> 
> Frank
> 
>>
>> Emanuele

Hi Frank,

this works. xHCI comes up fine and SuperSpeed devices enumerate again, with no
Host System Error and no SMMU faults. Tested on Apalis iMX8QM and iMX8QP on
Ixora carrier board.

A comment: imx8-ss-conn.dtsi is also included by i.MX8QXP and i.MX8DXL, which
have no SMMU. I get if we should put the property in imx8qm-ss-conn.dtsi, next
to the iommus property it goes with.

Thanks,
Emanuele

