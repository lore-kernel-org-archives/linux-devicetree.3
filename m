Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795171194;
	b=c6anXLJqIycjgDhHQ5yIZhlrFYDHjFBE00t6oz+jNFsPrru50u/6o6cg5ISm0AVTozLs
	 VpUKFxVBghaVtEtH0JWR210YQDGuJjhgTuyKkqesAb/SDFFNY6jE1t8hS7lbNjibVY3S8
	 cwePXyOos+E/Pl3nBx/0XRjzZkiu9otRBDXZHG1gwEnvCBqTweRvTXqLczGN0UUXC9Vk5
	 Gd19FARq+MIB2D/m02ZeoSNreKU9UlpfAFtI8nIFCVRpjCootvdYq5tLwIQZX/kadO75f
	 dewfINJaizgdkuxcGT5yjmU297DQ+Dp550gXntpJsaaioVKVQHG88xooh/JhojAa1JQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795171194;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=3+VBw69wTrVgO5VPJPDE6AGnWD5/X+T7xbN7bpttQ7A=;
	b=IV0SIRBP7ZuewfaCH9BIgLaIts6WKbDElH7KgTGeapccbogDfTISXvy1aAcgmtYR9+5c
	 1WOazvnM3Aktde+R7otD1zUpo4d8tb7EOTpQTQu/MGgbeJzfc3zfLaQgvpOTeXz2/ucRx
	 fhbYnxxpU/ualUydpqWQkBVDKt6T67rS5Y8h7cn92u4DP7LaMwLX7hV7NFsaUn6Lc/vFI
	 KA+GcqF2dNVs+t8nuvSXTBNIEt69a6v1T6845nZiF02GIRXdt2Wa17k2EnKwB0xLPZFgX
	 q6lvarUrVx1Qdf6RWFzMoslJgTyFTvICWiOMHrkVgUV4NJnY2rDb7wT3Jyr8AEYNxew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gWPYtq66;
	arc=none smtp.remote-ip=209.85.215.179
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E222606A326
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 10:39:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E222606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gWPYtq66
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cdb2dfcca94so327945a12.1
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 02:39:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795171194; x=1795775994; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3+VBw69wTrVgO5VPJPDE6AGnWD5/X+T7xbN7bpttQ7A=;
        b=gWPYtq661EMfFdx8UgQn/yeOhpWtP9TKiNs3OftX4TCfBL73tuXJec1Pne5NrXYu52
         HbkSvjR6QPzp5zbd4f2+9Zs/2L+vRWSiwG2za4iBniUG9JQDZQSAr1cCtzxUur+uLFkq
         mUdMTqqGwOsuvbVNZrmF4v2XMvD2WLRqTv6HrqmAIfGFwj/SoNuY5OqlHLvIVvExJLei
         UXCdSW4mI61GPwPNCKRUMPVlM4uGVFbc7GqZjuL/9kYvAiafNaoGPgcTU0li1BrRTogI
         FszUZGNxGsyB3RN4r1EKL/5NlJwLwVpZv/P3wkSvf3xKSk+aVRpkQUmYO28VeXlKfB+m
         8z2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795171194; x=1795775994;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3+VBw69wTrVgO5VPJPDE6AGnWD5/X+T7xbN7bpttQ7A=;
        b=xNcLk8VX2uFPVyTYmtkvdIIV7806En2viNZHoTxg8o6VXqeGr+31T5LaEc9hWQHMQ3
         5qf+DlS+cl6UpucXDU9hFdIUCSw+h+oqdUrEibnO3j+CqcySK4Pe3oPCcZZ/CCC8AMch
         cRJs7ndVMY96LAyw7+7gKd3s+UoVTgWIvGUGnOAQeXdZFXbH1DZn0I9b1H8ypbxvSJYK
         UMpH885QWfuE+1O6WHukcgiLOxp1Gtt6lUk/sPLc2taMmheqnfkPgtlfxZakX6E03ggG
         ho/7sLDoLl5eGQmiRr+BcMDg9NtbEK0QLLQjXBVv+5QYytJ4bareWs7/ifhYadI+HwKQ
         WHbA==
X-Forwarded-Encrypted: i=1; AL+hErHIY0t5hjSkIx8HXqAIGibFy2eGtoz9OhkbC9BSMHtCpUyjBvBdLrScHmIPW8iQia0flw4F0wqfS7us@vger.kernel.org
X-Gm-Message-State: APuU4Z9x6dAPZKjg31iahw2srnxUcbTNSL1eayTBYyrPUuvowef1ZSGz
	5qNmo7RR016AnRwqOW4RKEdDnnRP8gmk7DTxSDSdlp2L/XhmUe+qadeY
X-Gm-Gg: AZFdTZfUBCCDiDInBFcLOvWT28YjHmzqigpnwPoNCqkt9d1lcsQ8LdHY5PCuofwLHUL
	0LoOOW+yMQYSB2HSMph953DMK726w2ZmtqsujKOyAD9v3sJnrhK8AbLEMAxa/WrUpNPW9SqVjWr
	yGOqVH4Ni18YvnKX9nvlAzuMstTtampj2zD+Z+qhA44wYo7qcyhyNIZsJn+x4drWc4/1uX2zZOu
	tjQluFN2Fh2XxxOTkzs1eNpD2dzNurzYsES6G8b4CJTVyHKfFh8Gg4Y+Y5KBTvgiG20N+2fkNi3
	l3fLOcnnRStxTchC2rQDUhBKbklHfQyIYDbruughQH97DhkQLlZP362eV5olCJPsfgZLCH8feah
	RZ0kB+lyKa6leTDsbbcgyFr6HFrg0NpijIsH1wowmKnaCjEVuMO5JzGAX2rFaX6yE9rfzWIYC2E
	BeNYJqX7/TVX9hIdxbT9I0vUea+Hc6rChHr6MLAojf2U0rfNy+DXYY61uIlj/4IIp6mD5LMRtV7
	kTpEfxV02+ZjAzroKserWX37bvYa8NSAmQl+n+kKZ1qQGvr4vv7i39g5wl72qMdn+sUp1KQIaSX
	iJnyWNQXewtXY0iu3y+FSsUA/SlOnXgCfKCWE8Wt64F+l4HxD1kX5nTefn8Ic98V5v0TRg==
X-Received: by 2002:a17:90b:5109:b0:3b4:e3e:650 with SMTP id 98e67ed59e1d1-3b41c9c40a1mr2219270a91.67.1795171193537;
        Fri, 20 Nov 2026 02:39:53 -0800 (PST)
Received: from [10.25.164.32] ([128.77.72.132])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad92c13sm3843513a91.14.2026.11.20.02.39.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 02:39:53 -0800 (PST)
Message-ID: <47b32f82-cd7e-4bd4-8072-ba859f78c844@gmail.com>
Date: Fri, 20 Nov 2026 18:39:47 +0800
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
Subject: Re: [PATCH 2/7] arm64: dts: imx93-11x11-evk: Add DMIC codec to
 replace dummy codec for micfil
To: shengjiu.wang@oss.nxp.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, Frank.Li@nxp.com, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, shawnguo@kernel.org,
 daniel.baluta@nxp.com, chancel.liu@nxp.com, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
References: <20261120031853.1175454-1-shengjiu.wang@oss.nxp.com>
 <20261120031853.1175454-3-shengjiu.wang@oss.nxp.com>
Content-Language: en-US
From: Chancel Liu <chancel.liu@gmail.com>
In-Reply-To: <20261120031853.1175454-3-shengjiu.wang@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/20/2026 11:18 AM, shengjiu.wang@oss.nxp.com wrote:
> From: Shengjiu Wang <shengjiu.wang@nxp.com>
> 
> The "fsl,imx-audio-card" machine driver uses a dummy codec by default
> which does not allow configuring the channel number according to the
> board design. Replace it with a proper "dmic-codec" node configured
> for 4 channels to match the DMIC hardware layout on the i.MX93 11x11
> EVK board.
> 
> Fixes: fcfa86b3e02c ("arm64: dts: imx93-11x11-evk: Add PDM microphone sound card support")
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Reviewed-by: Chancel Liu <chancel.liu@gmail.com>

Regards,
Chancel Liu

