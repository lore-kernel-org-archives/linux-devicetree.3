Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792783325;
	b=4TQdGas5BsUrszR/rMy6x9YLtReHENIIGRXmIxFt8L4ArUgeidMdHOGBah58N8FNulsI
	 ePRMAEYIi1q6arqIqWlDHb/YnSeCpnaFYCeaQ73ky9ukoTyon6IZlaIhMt0ttYisfkwwU
	 mKX580771Mta1QncmB8CZNSwBE7Q3NvS3CJOpJZv37pvRj/s0EhQvtoIYJ1mSBypTBJA2
	 MItQCgcAkH5XKp0XuaEvqXRfj/xfCPEwV0lp0I1kyHDwoJWz/v7jahTlEq3LoC65qORnB
	 O25V4DPdYeFqhYg9jgi5VgNHSfgzhDNMi114YCibbMdTADYsdlTaz1mU4/vVZIVeKPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792783325;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=X8md4aIOlBkmqH24qYW8JCIeNhHECyEQ12dw77+1DrU=;
	b=Jy7pcIz8DUoYe6Nc4b+FOWfD/4G51rTsZ4/J2x7d59Frf1TPoTHip6VgIwauoU39WMUK
	 L5R9Om6Onymi7sUuiv+muVgbd9Fgk/M9rgmAOCn6o1fn0DQPzL7dmXiFSQu+hlzqq2MgL
	 1sDY2k3UCS1qvgV7eyVEAhW8HpMsRdNPvo0bN1Ony6HAOOsNHBCXeH6W9ne2U0ua912vz
	 CdVDEPQuJgjZPe1oH+H61disxZz9IXtZFPRopJsIKCRbbq8ZR0a5pordy6D5Z41YcMTss
	 ypQIvHntFCq4E++eCKTjoPqOhjBA+h71TnmjB5LKOo+p+gkT0sQwi6xcINw4cb1aUsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=riscstar.com;
	spf=pass smtp.mailfrom=riscstar.com;
	dkim=pass header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=y+XSboLv;
	arc=none smtp.remote-ip=209.85.161.43
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1396606A31A
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 19:22:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1396606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=y+XSboLv
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-6dd4f3f696aso744474eaf.1
        for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 12:22:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1792783324; x=1793388124; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X8md4aIOlBkmqH24qYW8JCIeNhHECyEQ12dw77+1DrU=;
        b=y+XSboLvXqMt5nQ+AIFuokPobL4LkcbVHjbQr5cyCqjSTy6p1dE1uWZboKKKrxpgyG
         7GNN8mNzaUS6VD7MAmcQogyctAAZQBdtdgV40OUvqvHA0QhtLVq+MFvUBxnlQgI3gQbp
         82HCSo8DP66GWta4Pi4xSkzG8NWnil1/tlbMc/Toj2QOypIOdDXSO7T/ykmKbWMe3brY
         wIA3CjBGaQ00f+EdHlO+zluPbRu+Nf7WV+dEDZ/0JqQkQuojs41tNnL4iLes6+v5HzPt
         Javcl4XmKoInKUhJBHerqt6X2yWzbDuzp661Us917gNhwya3BOL2+WB7iT4rZIgsYIaD
         0mIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792783324; x=1793388124;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X8md4aIOlBkmqH24qYW8JCIeNhHECyEQ12dw77+1DrU=;
        b=WWhsbugKve7Je1hbFMIj55KjyqbCQBBEyI6YpH+nDryeBYIUNLsWRHVPyEytwExtWQ
         ERNnaPgwcPi7IoIFpmTD83jnZE/zrDZwXbkIKWZlYpjpGAjlDraV7NGlwsAnBvAJjlQr
         YAKPgELzvPnt3m7HeqwQnlf2tHwTVFqe4Eyagmq0wy/UFmVf+nIdIHRwtfzYbAjsPR0+
         S6HllT0C6gG8kFmZC7Os16Afha7vLG85xaeLuVQlxVcyDoik+dKt8IiENVE9D1nlBkBW
         w7k+vOekgIzzF7ow+GqFT5CfQuDpAnBTjNTZ2R5FwGcsSEUpcoK573lAkMVS/St7PfUB
         JrIg==
X-Forwarded-Encrypted: i=1; AKwUvBx5mLqHiUdUj3Tn+DzxzUvGwCVR8kRQS9AP0pYiI/9MQF4ND6AtSmfm3ETUKiovUL6I2GkQJa/tl8A+@vger.kernel.org
X-Gm-Message-State: AFq9FYLxIz5D0cmC4DxhMr10rRA45YFhWe2A5CKvmqYljTW38jh6+WJy
	SddLNeSexBi9E1HS/HKCHOnw1aMH9eI7n9hKEqNUbSDA7LQ6+aK9dqC9aHS4rP7l9q0=
X-Gm-Gg: AYBFou3S/aT6P9zHeTDZKYfExIJKeuGgBenPDVzjNHHIcR7Pp1lweuYD0usxsVKaYl0
	B3HwoJGiBnvtNa3aFx8Apxv6UAsrITObI1uYvHpHQZzQ5InChVkooJS/Ye1mq2mJT4AhkG3/cxT
	f8CERlkXSq8gEAqN1t1+Dw03nEx0Of1ztDLxxqWRojQG8m84cAc0aDx50VY84z6tNsERMkRI3D0
	kf9g7dNKFMjpi3aKuFy6Sb8EoPHqCQLFAi/D7Y1kxf5hBVtkkQNJp86i3Oc1VPx2pqklMedIR25
	sUuE1cMcsH2yqW/enXo72eBx7XuRYwjDPTlrqDVCFnoIOyoVF6k+tGnDiL+uuIgT4hUJL6Dnj4G
	vus6U7wu9AS3SplrmR8LsXK30Nt1wgHficR2Q3nJvb7FDlc+IY/HB4ayvIuVZuIsyc5rPm4FIqA
	sx1rOm1SPwMb+AilWzV214c2J7ClWyF/T9Yu2ycCEN5bsmFiShteBZ1/ih4Olz3MzNW2JLn7rjn
	gP2uu8ebHR9axPD9BT3509zXdwxniGnUv+XqFMKrBwIvafNNRvzdzQ/
X-Received: by 2002:a05:6820:3404:10b0:70a:df8e:8f56 with SMTP id 006d021491bc7-70b88aae418mr1419523eaf.78.1792783323778;
        Fri, 23 Oct 2026 12:22:03 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-850fb649b53sm326403a34.16.2026.10.23.12.22.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 12:22:03 -0700 (PDT)
Message-ID: <cab7475e-8151-4843-855a-5aa47f75272f@riscstar.com>
Date: Fri, 23 Oct 2026 14:22:02 -0500
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
 <638e0f29-1ec9-4a6a-8777-fecef1bff409@riscstar.com>
 <20261023-bok-thong-0181aa7f3867@spud>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20261023-bok-thong-0181aa7f3867@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/23/26 1:00 PM, Conor Dooley wrote:
> On Thu, Oct 22, 2026 at 02:05:12PM -0500, Alex Elder wrote:
>> On 10/22/26 1:34 PM, Conor Dooley wrote:
>>> On Wed, Oct 21, 2026 at 02:50:41PM -0500, Alex Elder wrote:
>>
>> This syscon driver and "sg2044-topsys.c" are awfully trivial,
>> and they seem like they could be wrapped in something along
>> the lines of "simple-mfd-i2c.c".
> 
> Yea, I guess there could be some sort of trivial driver that covers
> these syscons with match data that contains the mfd cells and is
> effectively just a probe function that looks like:
> static int _probe(struct platform_device *pdev)
> {
> 
> 	ret = devm_mfd_add_devices(dev, PLATFORM_DEVID_NONE,
> 				   match_data.devs,
> 				   ARRAY_SIZE(match_data.devs), NULL,
> 				   0, NULL);
> 	if (ret)
> 		return ret;
> 
> 	return devm_of_platform_populate(dev);
> }
> 
> The devm_of_platform_populate() you don't need, but there's other
> syscons that could use this that contain subnodes too so might as well
> accommodate them.

I'll add this to an eventual TODO list for myself.  I won't
get to it right away but I'd like to see this improved.
We're left with a little duplication of some extremely
simple boilerplate code.

					-Alex
