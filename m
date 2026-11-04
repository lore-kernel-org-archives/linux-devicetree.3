Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793827339;
	b=GUZpWS19/bePaMQxmiVPvpFk+kPZpet41sG4g8lZq7cJPC8gjgkFvRcI7y5U46tjwkJI
	 xjEWqxGoDG2EAVK+GVtwjzWjzcmRmoskBxi2rAfbOw7mo4r3X6t9pj3ZtkowXwmfBuOgX
	 LEc3dO54h82bSocNfvN5JNJ7vRN28wz2MnqpIWOstfMfZpwf3iFbxNmxr5D7aAVwntp1e
	 nG3grrL/1XmcO318CHVzR6vs820Q2oenETj6caIxCAUYr/BGa+UI3zbQXjvnkknVYIlMM
	 XmQULVcCEtuHGBPX4LXpCLiRj5k0EeD5sE56jvQFQt9+nAf+7hHj2UuybxqwcCfvarQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793827339;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=gqPFKWoJx5hwMAzLVyvCBvd/bqLnCluacg7pBRYdYNQ=;
	b=Jf89y9lIjOBa1QDPtn9ZjQZ55BGWkOKQ0ZNwR0CG/pQKQBwYHUc+EBUTY5KAf79Fq4FS
	 HmqQbo6QomcMPAq2+jPC0hV8E01YnxfI5A3w8HBAYVdHxKNjM6cXW52YMqpnsYlZXFcLA
	 pMO/UIPZC2jMZEz5sHx8r1L77b0cuxFzUAxC9SpvZSSQdu0/eLR5crwS6CSQVYUkZEJxK
	 H4sC1inQE8f9y+oy7RxElchBpdFdRUheeosURDfFucdz8KdM0O2p5c6ap19dRi4BC02dy
	 BBjJ2iE4i9kzK4ZxUU14WHvqVX8kdYzol71MNSyfMPuokEUoCdOwaMHSJvpTb7QeRag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=riscstar.com;
	spf=pass smtp.mailfrom=riscstar.com;
	dkim=pass header.d=riscstar-com.20260707.gappssmtp.com header.i=@riscstar-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=scWJOak0;
	arc=none smtp.remote-ip=209.85.160.52
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9A8D606B3A7
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 21:22:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D9A8D606B3A7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=riscstar-com.20260707.gappssmtp.com header.i=@riscstar-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=scWJOak0
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-4a85c656c58so751221fac.3
        for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 13:22:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20260707.gappssmtp.com; s=20260707; t=1793827338; x=1794432138; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gqPFKWoJx5hwMAzLVyvCBvd/bqLnCluacg7pBRYdYNQ=;
        b=scWJOak0P2SrFj9xsdCllBdXNHB1WYAMqxN0F7JbJbVbBbcZ4s96RIbePsRVS0I649
         wkMLFv8jmjZOPTgBm6qZVGJrLGc32bzLrvxGLNTIdhs/AsCIE7CjicRJmpsMBZJ6uwEf
         o5xXuJXLHZqZ7rYQ+wqM7gFgnJ/Sw5KVvADYj2BYixP+W2QSt1AIGWqSHiTTs9mwaPKF
         lk56Cp+xciR9pa/91imRzqz+XPXMYkk7Er2XSwoLrGGgF8kGOswP6DFydnzOe2sVmMLT
         g1xYE2MF01a9bIm6QzMIbQN6BkqEh/bGUo71fuv+5i6LOPr9yuG1+V75finP0Vt8Ewfz
         Xjlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793827338; x=1794432138;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gqPFKWoJx5hwMAzLVyvCBvd/bqLnCluacg7pBRYdYNQ=;
        b=dWoaJ1Prpse3cC0CexJEOPQ71C00tpwabwIAenPZS8X4g77YQN6qEIhCOgi4EnE4Mz
         X9m46bnKgsZGdyW1h27RGQMp3ptz/Op7Ymjdl9+q5g3OwASQ6Yvnkku1RqmJTz+mwxJd
         KHZaB9NGRh3qBRL3CDnDW1VhDdw0QYVWufVKmlkc6F9elvmvlKCe+h6kaWVO6Qu0h6sF
         CPtSQB/UGiTEEtLiQglJT6Cy+iePQUDLWP3Kq+9rXnbAUTD8YbWsyK1lCD6y6cPMQJXY
         jYFDIrrpdHRXo3WsYzWoNVkcVs77dhwtJuU97T7WvNWFVAFV2woBmuslYnjFhQ8bsKIc
         Xx+g==
X-Forwarded-Encrypted: i=1; AKwUvBwLQ0tnSRKAo2M+XlJh0IUOJQ2RDwAg3uIL/7ij+o1ys4i9/7mKyWHE7mUzYpmf0SKqaAe821W/sUX+@vger.kernel.org
X-Gm-Message-State: APuU4Z/bLCskHxRrCHFRb3o/CMFD3Ws4/WEjh5e8AeX8s+PMg0LRrU2y
	RA2+vDsff4D5ppsB4dteFv7ldGl9WmaeH6rkTwLYK5vAHi5SPV3TQjMJ5/GypOIRoro=
X-Gm-Gg: AYBFou1VqauQnVV1/pkc6YPce4GpyzH3KO6oozf1+XzHqAibZHmX1N+BRvhnKZ/x8DR
	wxgj3PixcL9cI/jVIEzvho0JjCgSZ6EaOhQeq51AkXhB2oFnU/rmxIv9DsMxbUmOoMIFpz27c0D
	FdPjrAJsDohgP30ISGpGKrSwbVjLEtOgP6So2eMFeKlApzr6gBOWitQkvrxkZxby8YMLUpN9ZE6
	1FGZIgm1nVN7edQcUtpKtOc4s2tHfYUMemmVpaAwQeDvt/rVO7C1EyAnzv3i/Uy6bAhbizfKIrh
	VGmS4jC5x5Rr4hKJNHWjy2SdEFxKzBuXaZn/N+lkkf53LnbH9fNC4WEthC2lMWOOErvu6znNwxB
	Pjd1lsemus7QziqAl+slskfvhGwJ8qNjihY3ViWvCmVxXipK0SlvbCzYa3Ha4eAuvbqRwUzG0uA
	Ckwg1yCj63NDRBsv8kZB/eKjEbvkaGaktAG/AIT40BGKx1n7rkEHA+2B08Y/cCpsFh0JYsPCP2t
	XTQ1NlPLmxNk8+PjM+ihTQgf6hF6+WEAyYR1LkHMX76j/HfiR8PBC9dq3IOFb6bIL2cAIOqec2X
	LvuOm1L3Qabj5Y3OjCNT/+eThJZP
X-Received: by 2002:a05:6870:21e4:b0:48f:e25f:f6b7 with SMTP id 586e51a60fabf-4a9077756c1mr11293865fac.50.1793827337651;
        Wed, 04 Nov 2026 13:22:17 -0800 (PST)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4acea61d382sm2928188fac.13.2026.11.04.13.22.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 13:22:17 -0800 (PST)
Message-ID: <975f7923-046c-4180-80ae-6763d9ec7689@riscstar.com>
Date: Wed, 4 Nov 2026 15:22:16 -0600
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
Subject: Re: [PATCH 4/4] reset: toshiba: introduce a TC9564 SoC reset driver
To: Philipp Zabel <p.zabel@pengutronix.de>, sboyd@kernel.org,
 bmasney+clk@redhat.com, jbrunet+clk@baylibre.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org
Cc: daniel@riscstar.com, mohd.anwar@oss.qualcomm.com,
 lorenzo.bianconi@oss.qualcomm.com, fabrice.gasnier@foss.st.com,
 alexandre.torgue@foss.st.com, marex@nabladev.com,
 changhuang.liang@starfivetech.com, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261104004332.2141282-1-elder@riscstar.com>
 <20261104004332.2141282-5-elder@riscstar.com>
 <783234169f479ba1e8c4dd19896de1cd4755eec1.camel@pengutronix.de>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <783234169f479ba1e8c4dd19896de1cd4755eec1.camel@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/4/26 3:49 AM, Philipp Zabel wrote:
> On Di, 2026-11-03 at 18:43 -0600, Alex Elder wrote:
>> Define a new platform driver that manages reset signals implemented by
>> the Toshiba TC9564 SoC.  There are 13 reset signals available, but
>> currently only the resets that are (or will soon be) used are defined
>> to be controllable.
>>
>> Two registers manage the state of the resets.  The registers are
>> accessed via a regmap supplied by a system controller.  Access to
>> the memory region is provided via a BAR on a PCIe endpoint function
>> embedded in the TC9564 SoC.
>>
>> Co-developed-by: Daniel Thompson <daniel@riscstar.com>
>> Signed-off-by: Daniel Thompson <daniel@riscstar.com>
>> Signed-off-by: Alex Elder <elder@riscstar.com>
>> ---
>>   MAINTAINERS                  |   7 ++
>>   drivers/reset/Kconfig        |  12 ++++
>>   drivers/reset/Makefile       |   1 +
>>   drivers/reset/reset-tc9564.c | 135 +++++++++++++++++++++++++++++++++++
>>   4 files changed, 155 insertions(+)
>>   create mode 100644 drivers/reset/reset-tc9564.c
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index ee01aed56508d..8389b11fe6e1a 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -28355,6 +28355,13 @@ F:	Documentation/devicetree/bindings/soc/toshiba/toshiba,tc9564-config-syscon.ya
>>   F:	drivers/soc/toshiba/tc9564-syscon.c
>>   F:	include/dt-bindings/soc/toshiba,tc9564.h
>>   
>> +TOSHIBA TC9564 RESET DRIVER
>> +M:	Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
>> +M:	Alex Elder <elder@kernel.org>
>> +M:	Daniel Thompson <danielt@kernel.org>
>> +S:	Maintained
>> +F:	drivers/reset/reset-tc9564.c
>> +
>>   TOSHIBA WMI HOTKEYS DRIVER
>>   M:	Azael Avalos <coproscefalo@gmail.com>
>>   L:	platform-driver-x86@vger.kernel.org
>> diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
>> index eda9c698a95f3..8c1b08f4eebe6 100644
>> --- a/drivers/reset/Kconfig
>> +++ b/drivers/reset/Kconfig
>> @@ -358,6 +358,18 @@ config RESET_SUNXI
>>   	help
>>   	  This enables the reset driver for Allwinner SoCs.
>>   
>> +config RESET_TC9564
>> +	tristate "Toshiba TC9564 reset support"
>> +	depends on SOC_TOSHIBA_TC9564_SYSCON
>> +	select MFD_SYSCON
>> +	default SOC_TOSHIBA_TC9564_SYSCON
>> +	help
>> +	  This enables support for the reset controller embedded in the
>> +	  Toshiba TC9564 SoC.  The state of reset lines is controlled
>> +	  via MMIO to a region managed by a system controller; this
>> +	  ensures access to the region is coordinated between this and
>> +	  the clock and XGMAC (stmmac) drivers.
> 
> Drop the second sentence, explaining driver details to a user that just
> needs to decide whether to enable the driver or not is not helpful.

OK.  I think I originally had something to the effect of
using a regmap to ensure multiple drivers could access
the space safely.  Then someone asked "which drivers" so
I was more explicit.

Anyway, I'll just drop the sentence, as you suggest.  I
will also drop a similar sentence in the clock Kconfig
file description for the COMMON_CLK_TC9564 option.

>>   config RESET_TENSTORRENT_ATLANTIS
>>   	tristate "Tenstorrent atlantis reset driver"
>>   	depends on ARCH_TENSTORRENT || COMPILE_TEST
>> diff --git a/drivers/reset/Makefile b/drivers/reset/Makefile
>> index 489fafd6bbe3f..6ddded26309ef 100644
>> --- a/drivers/reset/Makefile
>> +++ b/drivers/reset/Makefile
>> @@ -45,6 +45,7 @@ obj-$(CONFIG_RESET_SKY1_AUDSS) += reset-sky1-audss.o
>>   obj-$(CONFIG_RESET_SOCFPGA) += reset-socfpga.o
>>   obj-$(CONFIG_RESET_SUNPLUS) += reset-sunplus.o
>>   obj-$(CONFIG_RESET_SUNXI) += reset-sunxi.o
>> +obj-$(CONFIG_RESET_TC9564) += reset-tc9564.o
>>   obj-$(CONFIG_RESET_TENSTORRENT_ATLANTIS) += reset-tenstorrent-atlantis.o
>>   obj-$(CONFIG_RESET_TH1520) += reset-th1520.o
>>   obj-$(CONFIG_RESET_TI_SCI) += reset-ti-sci.o
>> diff --git a/drivers/reset/reset-tc9564.c b/drivers/reset/reset-tc9564.c
>> new file mode 100644
>> index 0000000000000..fcd58d5f1962f
>> --- /dev/null
>> +++ b/drivers/reset/reset-tc9564.c
>> @@ -0,0 +1,135 @@
> [...]
>> +static void reset_manage(struct reset_controller_dev *rcdev,
>> +			 unsigned long id, bool assert)
>> +{
>> +	const struct tc9564_reset *reset = &tc9564_reset[id];
>> +	struct regmap *regmap = dev_get_drvdata(rcdev->dev);
>> +	u32 mask = reset->mask;
>> +
>> +	regmap_update_bits(regmap, reset->offset, mask, assert ? mask : 0);
> 
> Just propagating the error value ...
> 
>> +}
>> +
>> +static int reset_assert(struct reset_controller_dev *rcdev, unsigned long id)
>> +{
>> +	reset_manage(rcdev, id, true);
>> +
>> +	return 0;
> 
> ... makes this even shorter.

Yes I see what you mean.  Just because we don't *have to* check
for errors doesn't mean we must ignore the return value.

> 
>> +}
>> +
>> +static int reset_deassert(struct reset_controller_dev *rcdev, unsigned long id)
>> +{
>> +	reset_manage(rcdev, id, false);
>> +
>> +	return 0;
>> +}
>> +
>> +static int reset_status(struct reset_controller_dev *rcdev, unsigned long id)
>> +{
>> +	const struct tc9564_reset *reset = &tc9564_reset[id];
>> +	struct regmap *regmap = dev_get_drvdata(rcdev->dev);
>> +	u32 val;
>> +
>> +	regmap_read(regmap, reset->offset, &val);
>> +
>> +	return val & reset->mask ? 1 : 0;
> 
> Consider using regmap_test_bits() here.

I will.

>> +}
>> +
>> +static const struct reset_control_ops reset_control_ops = {
>> +	.assert = reset_assert,
>> +	.deassert = reset_deassert,
>> +	.status = reset_status,
>> +};
>> +
>> +static int tc9564_reset_probe(struct platform_device *pdev)
>> +{
>> +	struct reset_controller_dev *rcdev;
>> +	struct device *dev = &pdev->dev;
>> +	struct device_node *parent_np;
>> +	struct regmap *regmap;
>> +	int ret;
>> +
>> +	parent_np = dev_of_node(dev->parent);
>> +	if (!parent_np)
>> +		return dev_err_probe(dev, -EINVAL, "no devicetree node\n");
>> +
>> +	/* Note: MMIO regmap (no error checking needed when used) */
> 
> I suggest you just add the unneeded error checks and drop this comment.

Yup, agreed.

>> +	regmap = device_node_to_regmap(parent_np);
> 
> Can't you just use "dev_get_regmap(dev->parent, NULL)" ?

I just tried what you suggest, and it returns a null
pointer rather than the desired regmap.

device_node_to_regmap() searches the syscon_list for an
entry that has the provided node pointer, and if found,
returns that system controller's regmap.  That does find
a syscon, and returns its regmap.

of_syscon_register() seems to create a syscon but does
*not* register any device resources (devres) on any device.

So I think when dev_get_regmap() simply scans the parent
device for the latest regmap resource, it finds none.

I'm happy to discuss this further, but for now I will
not be switching over to dev_get_regmap().


Thank you for the quick review.

					-Alex

> regards
> Philipp

