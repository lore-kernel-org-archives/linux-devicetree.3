Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794194741;
	b=SOOFlai9F/0iHXMgNcWWS8z7AFCCbOJEmxHv7U4vnjHG9b/7NNpDpwRPVxUPzkdVx6zr
	 r/22ciz8yjA6ezGlPP349/89NBeGBBZZp7GqvEnBQFA0PxvWeRRU8ep8ZV/2AH3kQwM0l
	 4N2+mtyVL14r6Uacf2XU4ECt92OW+su1+dJ00s6bv+vDX2QcPuJA3yYVbcWpszoLU635/
	 J+xprUBEBVFmpFDPtBFPuCsJFqfpXjhWvH/b+Gzlxm5kIXTKNooHs5aGC/JZS1GFO530u
	 vCtB01wGEAgCVcPjHMI+3zaV4r5T8D1HblxlOqsWVfFTw3LNeAI2x33jTDSfwTKDDBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794194741;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=z8n7JaPkB/Y4IA6cU4L2s+2dB40viJ/GtgSnJTcko/M=;
	b=HTZE62HeDBoD7vf/C3iAJDtm4VNelNWMlxRZ13XDKmcddjVxim1Wxnt/cDh2CPBAyRcp
	 4ixZKkRWB1LnaZs6RfBmBcvb21wyfhm2RxSXfs2yFlDY1G9G5SgFoqbWufmes6oTRhp6k
	 ifu5UO/8fF11ibgyN1pBLVCPsvS1lkEL+UCqA3N+oV+kUP+bqNjClNO/NkVb7D4pejvg5
	 e6YQ0SRVXtgfd0zaex5WEL354vJuCuXjtfGC5s75LUZ8qsnNsad68NcK6swjqyZ6L3mTg
	 xI7vxdXN/IH7y1Z3nivrJ1ZJONEX74xldvL8FRXz8ASKINRjVPWRa/amVaIadN9Rwwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=p3dQeUpY;
	arc=none smtp.remote-ip=209.85.214.176
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA635606A321
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 03:25:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA635606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=p3dQeUpY
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2ed06b725fdso2950595ad.0
        for <devicetree@vger.kernel.org>; Sun, 08 Nov 2026 19:25:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794194740; x=1794799540; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z8n7JaPkB/Y4IA6cU4L2s+2dB40viJ/GtgSnJTcko/M=;
        b=p3dQeUpYWGXYjai8+S51vDPneG1hMOt1zxN341r+Q4M4d+radHyqNndaIrMJz7wURc
         wM2vfx2JRtlfs4HEvcV5AVRHbxkSK04N97f3fOeR622N32R94JQW/ck0wj5dy/y1cHJp
         8eOSbmLFXzN02rRYfXW0HbArRcPk76lpOXukWrJnOoomeVw0G4TI+PMSr4jyETXPrFbv
         38KifUz0WL8RCg/wvooacOi9xFtq5qUHRrsh6ttcjUuAZbBlcTdd0khVwv0LBfNpWmqx
         KSSPDExNLqAen4afXuZFlXb/NUIP9r485y4TGqFxRcFKFHwTXWLC6D+d1Iy2mnsftbPN
         QH4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794194740; x=1794799540;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z8n7JaPkB/Y4IA6cU4L2s+2dB40viJ/GtgSnJTcko/M=;
        b=bmWAhgZLnHbj1siVJ/s+Mn1piU5LOfW3K51NDx7sSD0DH7vo155KW8McHJvTJjeQus
         uFJslQ2kaYr5ihubZsun80d9SIaoM/V461ZfuZj2ij5sDFW46DFuXzQ15h2rbrtvnNeM
         u6Ihq67Eo/tdjkH4oQzMV+bz6krCZAe6UcLzn8+uxPKsRwGF2+uISzOfAKdn4/BcQ6Y2
         e50TtAbcLeE1Uq6Y0f0ERHYiwu1DRAE5WiKAme2IpKp18uBLV+5XMhMTm6S8JFeO/Ue7
         rFxX/pHn+9sty6fDOtdvo6FOq1gVUh1G/8SbkRYsUJZyUohKG/aPnHaEZHz1viuCWxmq
         TXpg==
X-Gm-Message-State: APuU4Z/OAZmYkMv68xVtZT+S1whnE4nJEGzV3l2Zn0BVPugIY9ezPIEZ
	5xj4sHpP1sjVbRat9y2sxZR2qCt3jZdvv4/Cxlap/JsYk0GzCDk4RPfh
X-Gm-Gg: AYBFou1X2E6ajQLPunGWceLi63oDAmEZgGkQdWI8vAl+LCmP0epsJ63apY4L93cK4Ik
	ti7b1eQLkhxOYQKQJf23f5BNlSt/sQsy1gWTtzj6S23baOhXA2BTd+La+8nOUokKAh+ggKE1OJ/
	mUXKgE+tcqAINaC5jgEICoRPcN6Nqy0G5CvXGvYgLu1bxkv9C3miSwyfrXrsUWduNgqhdnp2FpM
	IH4gBS4wR6oJRplngK1Q+nnGOuGOwA+WAYu5B9gHNrjyIycY7jh79QCFYosR6EJEBlViaWuIlDo
	y6NTRzFzO4Kg/1XRDRIeEKoTCd/WmkVc3HG25vW+SEFpniLpir5rqad+IzIGWzwc7mwmvR8bHST
	0HNBmYZ+gPBLHVlDTAdpO/7mSlWSh8aUBnMMQodZzaOhHVRDv9emRCMSkPNUH0kxuh0k4HZ1j9t
	HiIsDThh9rggNh0pLuw5vmg2pC4KwyQq0DoROm9/5Wg3dhq/jRsfaOP9ZshrIFiu/qjsPxbr3H1
	m9+y5eP+d1xZUAYQ9s6rxzOmbmtgK15gpYgxCBPvOvIy9NeZDbh1tW72zDzG7DAqY5vnqqxfsgF
	TP8A+05gHcTH1LPFrqqZReUqe5Sfl9in3B36yX0G/F27/9ePXAf3V2lE9W+V6oifkRpdCfXfHB/
	Wlq+js5vY
X-Received: by 2002:a17:90b:3b50:b0:3b0:e388:d9c9 with SMTP id 98e67ed59e1d1-3b12d3fc0aemr1747792a91.12.1794194739886;
        Sun, 08 Nov 2026 19:25:39 -0800 (PST)
Received: from [192.168.0.100] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1164f16b3sm3657744a91.0.2026.11.08.19.25.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Nov 2026 19:25:39 -0800 (PST)
Message-ID: <4e271e16-c3a6-462d-ac55-abd9129e03e1@gmail.com>
Date: Mon, 9 Nov 2026 11:25:36 +0800
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
Subject: Re: [PATCH v7 4/4] phy: nuvoton: phy-ma35d1-usb2: extend to dual-port
 with OTG support
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, neil.armstrong@linaro.org,
 linux-phy@lists.infradead.org, olteanv@gmail.com, vkoul@kernel.org,
 robh@kernel.org, conor+dt@kernel.org
References: <20261008060629.2736806-1-a0987203069@gmail.com>
 <20261008060629.2736806-5-a0987203069@gmail.com>
 <sashiko-outbox-163689@kernel.org>
Content-Language: en-US
From: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <sashiko-outbox-163689@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 10/8/2026 2:26 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 5 potential issue(s) to consider:
> - [High] phy: Kconfig missing USB_ROLE_SWITCH dependency causes built-in link failure
> - [High] phy: DT backward compatibility regression for over-current polarity
> - [Medium] phy: ignored regmap_read return values cause uninitialized variable usage and info leak
> - [Medium] phy: regression in PHY reset fallback when clock polling fails
> - [Medium] PM/clock: PHY permanently holds HUSBH0_GATE preventing USB suspend
> --
>
> commit dce53df5cfe4dcfac8af16f8b29743a3f4e147e0
> Author: Joey Lu <a0987203069@gmail.com>
>
>      phy: nuvoton: phy-ma35d1-usb2: extend to dual-port with OTG support
>      
>      PHY0 and PHY1 use the same power-on/reset sequence in USBPMISCR, with
>      PHY1 control bits shifted 16 positions relative to PHY0.  A separate
>      driver for PHY1 would duplicate this logic, so the existing driver is
>      extended to manage both ports.
>
>> diff --git a/drivers/phy/nuvoton/phy-ma35d1-usb2.c b/drivers/phy/nuvoton/phy-ma35d1-usb2.c
>> index 0b9976fb15c17..25bd0a7a1314b 100644
>> --- a/drivers/phy/nuvoton/phy-ma35d1-usb2.c
>> +++ b/drivers/phy/nuvoton/phy-ma35d1-usb2.c
> [ ... ]
>> -static int ma35_usb_phy_power_on(struct phy *phy)
>> +static int ma35_usb_phy_init(struct phy *phy)
>>   {
>> -	struct ma35_usb_phy *p_phy = phy_get_drvdata(phy);
>> +	struct ma35_phy_port *port = phy_get_drvdata(phy);
>> +	struct ma35_usb_phy *p = container_of(port - port->idx,
>> +					      struct ma35_usb_phy, port[0]);
>> +	unsigned int n = port->idx;
>>   	unsigned int val;
>>   	int ret;
>>   
>> -	ret = clk_prepare_enable(p_phy->clk);
>> -	if (ret < 0) {
>> -		dev_err(p_phy->dev, "Failed to enable PHY clock: %d\n", ret);
>> -		return ret;
>> +	regmap_read(p->sysreg, MA35_SYS_USBPMISCR, &val);
>> +
>> +	if (!(val & USBPMISCR_PHY_SUSPEND(n))) {
> [Severity: Medium]
> Is this code branching on uninitialized stack memory?
>
> If regmap_read() fails, the return value is ignored and val is left
> uninitialized, leading to non-deterministic PHY state handling.
Leaving this as is.
>
> [Severity: Medium]
> Could this strict condition remove the fallback reset sequence?
>
> The original driver would reset the PHY if the clock failed to stabilize during
> polling. By encapsulating the reset strictly inside this block, it skips the
> reset entirely if the PHY is already running.
>
> If the subsequent clock polling times out, the driver immediately returns an
> error. Can this cause a regression where the PHY fails initialization permanently
> if it was left running but unstable by the bootloader or a prior kexec?
PHY reset fallback: valid, v7 dropped the old reset-on-unstable-clock
behaviour. In v8 I'll restore it: if SUSPEND is already set, poll the ready
bits first and return on success; on timeout (or if SUSPEND was clear) 
run the
POR assert / udelay(20) / POR deassert sequence, then poll again and 
fail only
if the second poll times out. This covers a PHY left running but unstable by
the bootloader or a prior kexec.
>> +		regmap_update_bits(p->sysreg, MA35_SYS_USBPMISCR,
>> +				   USBPMISCR_PHY_CTL_MASK(n),
>> +				   USBPMISCR_PHY_POR(n) | USBPMISCR_PHY_SUSPEND(n));
>> +		udelay(20);
>> +
>> +		regmap_update_bits(p->sysreg, MA35_SYS_USBPMISCR,
>> +				   USBPMISCR_PHY_CTL_MASK(n),
>> +				   USBPMISCR_PHY_SUSPEND(n));
>>   	}
> [ ... ]
>> -static int ma35_usb_phy_power_off(struct phy *phy)
>> -{
>> -	struct ma35_usb_phy *p_phy = phy_get_drvdata(phy);
>> +static const struct phy_ops ma35_usb_phy_ops = {
>> +	.init		= ma35_usb_phy_init,
>> +	.owner		= THIS_MODULE,
>> +};
> [Severity: Medium]
> Will the removal of dynamic clock toggling in .power_on and .power_off cause
> a power regression?
>
> Since the clock is now acquired permanently via devm_clk_get_enabled() during
> probe, the USB host clock gate (HUSBH0_GATE) remains open permanently,
> preventing it from closing and consuming unnecessary power when the USB host
> controller (EHCI0/OHCI0) suspends.
HUSBH0_GATE: valid. devm_clk_get_enabled() keeps the gate open for the
driver's lifetime. In v8 I'll use devm_clk_get() in probe and restore
.power_on/.power_off doing clk_prepare_enable()/clk_disable_unprepare(). 
Both
ports share the one clock; the PHY core calls these per port and the clk
framework refcounts, so the gate closes once neither port is powered. init
will also enable the clock around its register accesses and polling.
>> +
>> +static int ma35_role_sw_set(struct usb_role_switch *sw, enum usb_role role)
>> +{
>> +	return -EOPNOTSUPP;
>> +}
>> +
>> +static enum usb_role ma35_role_sw_get(struct usb_role_switch *sw)
>> +{
>> +	struct ma35_usb_phy *p = usb_role_switch_get_drvdata(sw);
>> +	u32 val;
>> +
>> +	regmap_read(p->sysreg, MA35_SYS_PWRONOTP, &val);
>> +
>> +	return (val & PWRONOTP_USBP0ID) ? USB_ROLE_HOST : USB_ROLE_DEVICE;
>> +}
> [Severity: Medium]
> Can this leak uninitialized stack memory to userspace?
>
> If regmap_read() fails, the return value is ignored and val remains
> uninitialized. This uninitialized data determines the returned USB role,
> inadvertently leaking 1 bit of kernel stack state to userspace via the sysfs
> role attribute.
Leaving this as is.
>> +
>> +static int ma35_role_switch_init(struct platform_device *pdev,
>> +				 struct ma35_usb_phy *p)
>> +{
>> +	struct usb_role_switch_desc sw_desc = {0};
>> +
>> +	sw_desc.set = ma35_role_sw_set;
>> +	sw_desc.get = ma35_role_sw_get;
>> +	sw_desc.allow_userspace_control = true;
>> +	sw_desc.driver_data = p;
>> +	sw_desc.fwnode = dev_fwnode(&pdev->dev);
>> +
>> +	p->role_sw = usb_role_switch_register(&pdev->dev, &sw_desc);
> [Severity: High]
> Would this introduce a built-in link failure if the driver is built-in
> (CONFIG_PHY_MA35_USB=y) and the role switch framework is modular
> (CONFIG_USB_ROLE_SWITCH=m)?
>
> In this configuration, IS_ENABLED(CONFIG_USB_ROLE_SWITCH) evaluates to true,
> so include/linux/usb/role.h declares the external functions instead of providing
> inline stubs, causing an undefined reference to usb_role_switch_register.
>
> Should drivers/phy/nuvoton/Kconfig be updated to include
> depends on USB_ROLE_SWITCH || !USB_ROLE_SWITCH for PHY_MA35_USB to prevent
> this invalid Kconfig combination?
Kconfig: valid, thanks. In v8 I'll add
"depends on USB_ROLE_SWITCH || !USB_ROLE_SWITCH" to PHY_MA35_USB in
drivers/phy/nuvoton/Kconfig. With the role switch disabled, the existing
-ENODEV handling in ma35_role_switch_init() still lets probe succeed.
>> +	if (IS_ERR(p->role_sw)) {
> [ ... ]
>>   static int ma35_usb_phy_probe(struct platform_device *pdev)
>>   {
>>   	struct phy_provider *provider;
>> -	struct ma35_usb_phy *p_phy;
>> -	struct phy *phy;
>> +	struct ma35_usb_phy *p;
>> +	struct clk *clk;
>> +	int n, ret;
>> +	u32 code;
> [ ... ]
>> +	regmap_update_bits(p->sysreg, MA35_SYS_MISCFCR0, MISCFCR0_UHOVRCURH,
>> +			   of_property_read_bool(pdev->dev.of_node,
>> +						 "nuvoton,oc-active-high") ?
>> +			   MISCFCR0_UHOVRCURH : 0);
> [Severity: High]
> Does this unconditional write break device tree backward compatibility?
>
> If the optional property nuvoton,oc-active-high is absent, this explicitly
> writes 0 to the bit, forcing the over-current polarity to active-low. The
> original driver relied on the bootloader's configuration.
>
> Will this cause a regression in over-current detection on existing boards that
> use active-high hardware configured by the bootloader but lack this new
> property in their older device tree?
OC polarity: the unconditional write is intentional. The binding in
patch 1 defines "property absent" as active-low, and writing the bit in both
cases makes the result independent of what the bootloader left in MISCFCR0.
This bit only affects the EHCI/OHCI host ports' VBUS switch and is 
irrelevant
to the gadget (DWC2) use the old driver supported, so existing gadget-only
users are not affected. The old driver never touched MISCFCR0, and no 
mainline
DT uses this PHY with host ports, so no mainline board depends on a
bootloader-programmed polarity; nuvoton,oc-active-high is new in this 
series.
Out-of-tree boards with an active-high switch need to add the property. I'll
state this explicitly in the commit message and binding description.

Joey
>> +
>> +	for (n = 0; n < MA35_PHY_NUM; n++) {
