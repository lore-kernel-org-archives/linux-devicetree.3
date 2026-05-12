Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 352563ADBA2
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 14:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778595283; cv=none; b=sz01suQyJuDPzQiMYCxMD/UyigxPeqgR/WDtcxNqoRQi8Nfa0rzX2ZQ2Rjq7Y+6lLlv4o3dV9++O8m/iSyrIU5nFLh1IPLkca9WckuXEmNLKFXQAZAfS5mjRlKtKVwa8mfPh5CLstckxqGnf5RS4XIpr8gvx+WRw4kbDEBJcx5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778595283; c=relaxed/simple;
	bh=ZaQyJxlxOmY7xkwyuR+IwZinC980PpOQWXApt+r8JDM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DGCq9YC98SFeL4Xsyq6uOvd4Pg+NEgtn9l4TG1R932zM8ldFEmF8cr6p59b5zgdQEipJSQTrmQcfYwM1e+b0Dzn/IcM1kmaQ2JVcyQTHkDh34ZmIfk9XJf+XRHf3GvvnDiy8IJ0zF6mILVZnQWS8NvCzD2/l938YhKlYlHtL0+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=fail smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <s.pueschel@pengutronix.de>)
	id 1wMnsJ-0003VA-2A; Tue, 12 May 2026 16:14:19 +0200
Message-ID: <2138b7ee-641f-4727-bcaa-f16dc9982a90@pengutronix.de>
Date: Tue, 12 May 2026 16:14:17 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 06/29] media: rockchip: rga: fix too small buffer size
To: Nicolas Dufresne <nicolas@ndufresne.ca>,
 Jacob Chen <jacob-chen@iotwrt.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Heiko Stuebner
 <heiko@sntech.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, kernel@pengutronix.de,
 sebastian.reichel@collabora.com
References: <20260428-spu-rga3-v5-0-eb7f5d019d86@pengutronix.de>
 <20260428-spu-rga3-v5-6-eb7f5d019d86@pengutronix.de>
 <7cf0950e51e4917a0b4d565f71b1e8f2a41e4bbe.camel@ndufresne.ca>
Content-Language: en-US
From: =?UTF-8?Q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
In-Reply-To: <7cf0950e51e4917a0b4d565f71b1e8f2a41e4bbe.camel@ndufresne.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: s.pueschel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: devicetree@vger.kernel.org

Hi Nicolas,

On 5/8/26 11:11 PM, Nicolas Dufresne wrote:
> Le mardi 28 avril 2026 à 11:00 +0200, Sven Püschel a écrit :
>> Fix the command buffer size being only a quarter of the actual size.
>> The RGA_CMDBUF_SIZE macro was potentially intended to specify the length
>> of the cmdbuf u32 array pointer. But as it's used to specify the size of
>> the allocation, which is counted in bytes. Therefore adjust the macro
>> size to bytes as it better matches the variable name and adjust it's
>> users accordingly.
>>
>> As the command buffer is relatively small, it probably didn't caused
>> an issue due to being smaller than a single page.
>>
>> Fixes: f7e7b48e6d79 ("[media] rockchip/rga: v4l2 m2m support")
>> Signed-off-by: Sven Püschel <s.pueschel@pengutronix.de>
> Reviewed-by: Nicolas Dufresne  <nicolas.dufresne@collabora.com>
>
>> ---
>>   drivers/media/platform/rockchip/rga/rga-hw.c | 2 +-
>>   drivers/media/platform/rockchip/rga/rga-hw.h | 2 +-
>>   2 files changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/media/platform/rockchip/rga/rga-hw.c b/drivers/media/platform/rockchip/rga/rga-hw.c
>> index 43ed742a16492..d1618bb247501 100644
>> --- a/drivers/media/platform/rockchip/rga/rga-hw.c
>> +++ b/drivers/media/platform/rockchip/rga/rga-hw.c
>> @@ -414,7 +414,7 @@ static void rga_cmd_set(struct rga_ctx *ctx,
>>   {
>>   	struct rockchip_rga *rga = ctx->rga;
>>   
>> -	memset(rga->cmdbuf_virt, 0, RGA_CMDBUF_SIZE * 4);
>> +	memset(rga->cmdbuf_virt, 0, RGA_CMDBUF_SIZE);
> So we had a buffer overrun ?

 From my point of view, yes [1]:

     /* Create CMD buffer */
     rga->cmdbuf_virt = dma_alloc_attrs(rga->dev, RGA_CMDBUF_SIZE,
                        &rga->cmdbuf_phy, GFP_KERNEL,
                        DMA_ATTR_WRITE_COMBINE);


Given that 0x20 * 4 is smaller than a page, it probably didn't caused an 
issue as we didn't write out of the one page allocated.

Btw.: I've noticed it while reading a bit over the comments from 
sashiko.dev [2]. I'll also add this link for clarity to the comment in 
my next series (seems to be the common way of referring to sashiko.dev).

Sincerely
     Sven


[1] 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/media/platform/rockchip/rga/rga.c?id=50897c955902c93ae71c38698abb910525ebdc89#n880

[2] 
https://sashiko.dev/#/patchset/20260325-spu-rga3-v4-0-e90ec1c61354%40pengutronix.de?part=10

>
> Nicolas
>
>>   
>>   	rga_cmd_set_src_addr(ctx, src->dma_desc_pa);
>>   	/*
>> diff --git a/drivers/media/platform/rockchip/rga/rga-hw.h b/drivers/media/platform/rockchip/rga/rga-hw.h
>> index cc6bd7f5b0300..2b8537a5fd0d7 100644
>> --- a/drivers/media/platform/rockchip/rga/rga-hw.h
>> +++ b/drivers/media/platform/rockchip/rga/rga-hw.h
>> @@ -6,7 +6,7 @@
>>   #ifndef __RGA_HW_H__
>>   #define __RGA_HW_H__
>>   
>> -#define RGA_CMDBUF_SIZE 0x20
>> +#define RGA_CMDBUF_SIZE 0x80
>>   
>>   /* Hardware limits */
>>   #define MAX_WIDTH 8192
