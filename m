Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792695917;
	b=Lk6tcfvqpsWrO7MULGVB/Win96rs+ybIJ+byDoonnGYfQTy3Z1WwgNYAOWKCv8VOlCS3
	 TmZs9D3Yjcv2rcE0cTYa/AjQk6TOjmI8CaDF0Va4Wy/fFOQEYLXKlv4j2RS5FIBCESCTZ
	 vKsOu4Qno5kjGFJXJsYOyQNAHAmfR9OfJPYSuOy9ykGNig+CR27Jpgs5OkwO3ZxvsHKKB
	 sq85EvLQGUEZjCtcACI91L5bogB8kQox4mEizbTvNvP5KVHk91hM6ZpUIOrUeH4len0Sw
	 ZDJHPr66FCCsZsl9wS9bf/gwKTaabgLs4AvWPB6rkgJ12VVQ5va6s3E4tOSfdRQwWRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792695917;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=Ks/2jbx2EqoCpwywdl6UCdhMLuk09QhCyfZBU/wLDXM=;
	b=gIbOJvCAe/FDoWomJRdsvvJJpMYMaY2Rd9LAUH3CHpc+vq9R0dbWT+Qo3JAl7gbD4xP0
	 ZPlUdFJ3nPFBnc8SdbzqTeCq04HIbnM+QhlheJRoFNtIbHZZ6/ns7c0Pc/sgQ41qbmMuI
	 sNQbGmrGaRNn1njKPjkrnC0R55oBHljqVkisdNMktR28PfkXJ/rqsACYHFy5yKvu9AOWU
	 KYR1EJ/MzDflXtwstu/CMwpLBMe7yAPlN6oW67XROn3JZh6kKCenKrtI9mC0sU9AUHd9S
	 bSyEw0+GJBbOwkyzSfvxet5JX5IE+fDekbFYZggZXdsuZZuKIdKsl2d3VV/cvRL6XKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=riscstar.com;
	spf=pass smtp.mailfrom=riscstar.com;
	dkim=pass header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=QWZasyWx;
	arc=none smtp.remote-ip=209.85.161.45
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E19D606A31B
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 19:05:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E19D606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=QWZasyWx
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-6de1ca1b05aso92063eaf.0
        for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 12:05:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1792695915; x=1793300715; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ks/2jbx2EqoCpwywdl6UCdhMLuk09QhCyfZBU/wLDXM=;
        b=QWZasyWxw03j9geqHwnZh8c8OyKA2dQN8+V1v+x2FAykRAGMiVvUkbs/kAYLfZX/AH
         TCeXLgRm+IO3KJ4ty6I1BjrzB3s6aMW/PA4VKreUIPvme1FrxLkKrd+CEy5PMdLrpiov
         8RNc4DkkKKbvUG9sTQajt71jlDybGIuVw1NBJBrd/EIhZ3BwjeIJCb8OPaH/0VrekJ/c
         W4ozl6uaZtBs0hd2Fu14Ksf9slMD3wU4Ou3CS6btMk21JwIGYaItlUrtcb3YsxIrg7iu
         FMDZDkIHk5wu0vyB3uaHaFAuB0CwHfWFv2vedvIV4LZDxNPLSMvp/Vt+3dDqMIW1Dcuu
         A3Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792695915; x=1793300715;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ks/2jbx2EqoCpwywdl6UCdhMLuk09QhCyfZBU/wLDXM=;
        b=KFg+O9G1m3RxXiaZIozRM2SbAfE/1DR8KCCb3m0ndFHDhQzFedwINUHDt+2QrK94DQ
         222FFmqSPhHoZF9xfnTTukQf59WL20Dxgyv3ieMKcuALkIXtN5ogidpSA68zXyrDqkUZ
         8ip+plXoU2Xy0/NuBai2tRQ4yUGqV23P49vp7XEkyz9jZOEI0xTZE+ch4lKpo/dP68Z1
         5BeVV7Mso5J8IUhPb1df581H+Cq+KPkf50y5T78aSl2UQFAL99rThfFDrbrpuXKmuWwa
         iyEKPD+l1OfpXr0g+CviU4qDeyHou/kpAB+jTj/rnJV4gy2D3kXwUDUSIBHS+nM4P97A
         rcsw==
X-Forwarded-Encrypted: i=1; AKwUvBzyFy4NpbIH9a+aLWxZyk4cIlc55kIpl4Vwk4vIoGCGFjqcpa8klBfiylxfqWg1HUBBLrBGR9JeQQnC@vger.kernel.org
X-Gm-Message-State: AFq9FYLK7okww1CFNbhpRxHJX9SSwqVp5Mo56YMf3aCV1LjMemLkUkFW
	yqemc+6eJfhfTRbWpfHwiHiY//pVk6kRjjxdyUs6jE1UQDe74K+hOofkGGa44HeRogA=
X-Gm-Gg: AYBFou1AwfxczsADXmVO+sPEFrYloLXJGsGEmHoVZWvHrRZG9eLTPQwPpE8kZkboZAS
	4V9Nkq0uCEmuHsMilh7xGELN3eMwE4h7lZWkvh1UPHIrFOq9HLndgtUoCZ25UPUrN1FHdtII1lt
	RdhUSux2lNp9AFUKiw2ItUk8WlVO4FGXlngSAmWSsD6cdfpfzMPJzi9FNShVT0WZP/4uZYwNWiQ
	4J8WwikOQrMPlIYf48BSmDirbF/MWFrJgXvpkQKN9RlEvIGnEsmo78OuJFuJVvy1+mWVrlNNj3Z
	rgUYnx++Sk9xsxR+b/XmK0skHNhVW0JE04rB9GkfnMo39810AjnFiaav+wAfK7/ROYp6435qT2v
	1N2D2H0vBjRFSSNpWlwi21HaM8w4QS2aeJl280BYZn7jYQCvrDOY+NN4AgsiCKsSIIP7SQVyODV
	Kf/yucv9OQEO4bRIbLcVqSrbup0SpM8s8i0vNZR2BtyKxXnqkwyhJDkheOIXngV9rAiDzleYokM
	7XxpVA2xE8dV1gjz6pGXZICHQDhjXdVGkH/MDmgwbekDBDMirSy2vVN
X-Received: by 2002:a05:6820:1693:b0:70b:1217:4a8e with SMTP id 006d021491bc7-70b885e1536mr310753eaf.0.1792695915497;
        Thu, 22 Oct 2026 12:05:15 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-70b89754d7esm80181eaf.7.2026.10.22.12.05.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 12:05:14 -0700 (PDT)
Message-ID: <638e0f29-1ec9-4a6a-8777-fecef1bff409@riscstar.com>
Date: Thu, 22 Oct 2026 14:05:12 -0500
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
Subject: Re: [PATCH 1/2] dt-bindings: reset: introduce
 toshiba,tc9564-reset.yaml
To: Conor Dooley <conor@kernel.org>
Cc: p.zabel@pengutronix.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, mohd.anwar@oss.qualcomm.com,
 lorenzo.bianconi@oss.qualcomm.com, danielt@kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Daniel Thompson <daniel@riscstar.com>
References: <20261012164354.3872326-1-elder@riscstar.com>
 <20261012164354.3872326-2-elder@riscstar.com>
 <20261012-shale-rosy-805c49f6c404@spud>
 <492396bc-a0f4-4274-9a7c-21fd5fd886b5@riscstar.com>
 <20261012-numerous-flatworm-9e4cfa659541@spud>
 <325b8836-61a2-4e1c-98e3-92f0a5177f9d@riscstar.com>
 <20261013-stump-reactor-055d05dc5b3a@spud>
 <b904f4ea-e198-488e-a6dd-476d744593da@riscstar.com>
 <20261022-clench-drum-5907c17cb8d2@spud>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20261022-clench-drum-5907c17cb8d2@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/22/26 1:34 PM, Conor Dooley wrote:
> On Wed, Oct 21, 2026 at 02:50:41PM -0500, Alex Elder wrote:

. . .

>> OK.  Let's see if I understand what you're saying.
>>
>> This approach uses:
>> - A single top-level syscon driver (under drivers/mfd?) which
>>    probes based on a devicetree node compatible string ("toshiba,...")
> 
> I'm not sure if it needs to be under mfd (there's some in soc/foo too)
> but I guess so.

I'll look at both places and will choose the one that seems
most similar to what I end up with.

>> - That compatible string will require a (fairly simple) devicetree
>>    binding
>> - That driver initializes a regmap which will cover the space
>>    defined in its devicetree node (<0x0 0x2000>)
> 
> I don't think the driver has to even do this at all, e.g.
> sg2044-topsys.c doesn't. Whenever someone requests the regmap it will
> get created automatically since you're a syscon.

You're right.

>> - That driver has an array that uses MFD_CELL_NAME() to define
>>    cells for clock and reset
>> - That driver will call some form of mfd_add_devices() using the
>>    MFD cell array
>> - The stmmac driver can refer to this device node with a phandle
>>    property to specify the syscon that provides the regmap it needs
>>
>> And then, for the clock and reset devices:
>> - A clock platform driver (under drivers/clk) will match based
>>    on the driver name (matching what's supplied by MFD_CELL_NAME())
>> - A reset driver will be similar (under drivers/reset)
>> - As you mentioned, these drivers get at the regmap they need using
>>    device_node_to_regmap() (or dev_get_regmap() or something)
> 
> I think "regmap = device_node_to_regmap(pdev->dev.parent->of_node);" is
> the correct way to do it.

     regmap = device_node_to_regmap(dev_of_node(dev->parent));

>> - And despite these being separate drivers (from the syscon driver)
>>    they don't have devicetree nodes, and the syscon node itself
>>    defines the clock-controller and reset-controller properties.
>>
>> Does that sound right?  Am I missing anything?
> 
> Sounds about right.

This is awesome.  I went ahead with this plan and it's working
fine now.

This syscon driver and "sg2044-topsys.c" are awfully trivial,
and they seem like they could be wrapped in something along
the lines of "simple-mfd-i2c.c".

Thank you very much for your help on this Conor.

					-Alex

. . .
