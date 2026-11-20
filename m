Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795171494;
	b=0NxPPWx6fIJBJpXxUR2Hv3RXskqkLvtX7NpD6NaMsl7ZP1yr26B/fk0I7TjzgHi/CZot
	 XzJctVym3YLrJCEMKjNO5vMEEEJ6BZ15qA/mRSh0nvwh8YT6IOqRLuinLtfRT+S5g4oJB
	 oHJhpbhFuGxdmFL06lVlr+v+ddFaUpbfrm4lQgqWfaZr4HAmi1DuLM7MKUwVSB+A3ijbs
	 UuXu5cJjNUWa7rUbaBh0Pep6A5j/+lz5+j+4W6skkaTg0d+Q1dhpP0rWe52ROCkmG2B0W
	 ZEPDZrC4cU1qic3Y05wzhdtcwb97hBk8BvS2AJmppbulES72z4sbKc+JSnmLoHSL0Ig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795171494;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=1KZ5fR1JPEf3qgwo/H2AXMnVO/Jhwx/3Aw86T6B7Guc=;
	b=RpbpuGXq7XmwH1PFGMQ107g8/VzEOlZDU4+3bFNj0JPEw2lmfaXAZXBpAyArHda78Ing
	 uRiPPFAyVkkcr3G/8b3j1sBllrHkjVqX6E9BbOslMj6RzwR2yDma7cqWOxlCHvYIRWOI+
	 iaBE95giX3weDYXAuM2IfB6lT3L1NuK+L+XOpL5NBGS6Jhd4nsYsAppaMG8tMd9TMYHff
	 lRlFmhCczTFziejE8a4lb1qhuGI0N22XpunNyKB9tbtkiFWEtpn5AvodCI4TgfSvDhBaO
	 fX13pwppVEfiXQie0RaHREcOITWHJLVMRPQHprI7mMQYjz+k7lIQE+sXN0rljWuZw4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NYJoZq3L;
	arc=none smtp.remote-ip=209.85.214.170
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87A25606A32A
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 10:44:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87A25606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NYJoZq3L
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2e98798cbddso3268405ad.0
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 02:44:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795171494; x=1795776294; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1KZ5fR1JPEf3qgwo/H2AXMnVO/Jhwx/3Aw86T6B7Guc=;
        b=NYJoZq3LK1Kv0cTWDdsYfPatrMwxD0NpOJo1nV7U/WyS4kGnOwJx3fn0sUeHyK0l+A
         zwJpocq9JZui8xZK0pT/Bz3hthwH7BETqFcbWAFJ1gAGjkg1B16BtQe9GvZVRSkPTZK2
         fYKEZUsrAtb+QqYmwcKklAsrQHMdo1hSDlVpykaSPY6jRc+x4jGXv1eTc243/E6aYgcS
         qw3cUx5p/3RRGuL9kRoQkax1oIj701+mJc5604T8ocft9Xfdue5LTm9xgi+50tCck18G
         d9EKW8+4BcbraVUwdzSM0cZCdgf6IFWRPh6NL49yI2Vh6I4ZG9daI1l5ssm01Dfl5wNH
         CngA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795171494; x=1795776294;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1KZ5fR1JPEf3qgwo/H2AXMnVO/Jhwx/3Aw86T6B7Guc=;
        b=h2VrmOooOl4o6XgQlpLnamEwsnW+OVKntTpP2poRRHzS6FGKMJPKd7v+LDGHKaI8Kz
         5itiRtF1Vb9jUvstmT73xQcwUWrGnm+k9PO5TYSQM24C9G5lUvQNUsc+32goHfjamjE5
         7sVpi8gpvBHUIiAmHyWJ5Ba+4oH7MmYNWWRCrY5wHYqLF99TK5bTa5bVQfwpuj0pp7Sy
         3AkBDr3kygdlZxvj58kgzn5HUXV2zGFKlCHNlxSFvvPlYIfI+IBPxJIXa6fSrBApOZ78
         zTBTI/yzGFrZhWEWNh4syXbQsDikTzFJfkS2AVRqgm1MSLcyR0bNKgT4vpIiF29IuNFD
         Nghg==
X-Forwarded-Encrypted: i=1; AL+hErHw78aPo57lQJXlH+U/PKIQhv/6gZdEV/EApgIe6XFSSzYDtsXKzrNHcFqjxFlY2rRf47mBZlRcr9F5@vger.kernel.org
X-Gm-Message-State: APuU4Z/rfbRycElnjeLiU71TqAYzCjXcCYyK1wKZmPu5vBIcGTTX8thJ
	AhvVS4aQoIjkYVjIYtonV8AYlad9X7/3VeGA0zDgIcyUWxegsyT0/JGe
X-Gm-Gg: AZFdTZe5nGY1ooJPPwhr4m3i+mRr/0ViGScZC2y4vpBXZfrYSjcWbZTRgROeLQG3exw
	nAbE2GsflCoRAxfiMzzblw1NsCyyr/ygxId+fFSMCJYRkRWVnVRUVDmejmRaILpPCcss/DkU8ot
	UwAvXBgBIt+rjGiUI2JU5w0a5iVzU7EZMts7opI/A/Ah0GhyoPcSrZBQwVLSDhccnAZPrUxS8Im
	N6j2B6J2izwaLKkOHf2jl2OXYzl0i+OoN5KN79iftr6bg6IOZ8igjGRMpo+m+Zp7HH1ppAXoGsN
	1jkqcj5EprA1Du5DU0DMTP5bFP5hLb+NdyXk+EjNbWIkeekqjXvhPXvq6/HP+GEgpMvJc6iMhTA
	UmIToeI4V7t8eN1m5z9bHY1WyRmtFdQCriblgw+bRyAbHYvlGNGEopZjGuRq8wjOpcUr8CZASj4
	CDA7o57HpVFM70afPVgtiB8JZgbEBs4mcXZHa00fewuiQ2oS+yEB71TmVNfKT/QVJ+4kWlM88so
	WCsWPIUqfODbgGx6OC9QnhKrHlk5Yyq1WHqQSxmWHS0nvrtMePKrrFDUix+vyy6QnHUmuuN8HSI
	w8gRWmY0qzYPQdsZx8S067wIKCKJ1nQP/M9tbBUxHo9+UaOi
X-Received: by 2002:a17:902:e847:b0:2ed:3db6:2eb0 with SMTP id d9443c01a7336-2f03f1d63c6mr29795165ad.48.1795171493751;
        Fri, 20 Nov 2026 02:44:53 -0800 (PST)
Received: from [10.25.164.32] ([128.77.72.132])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f1413f3sm12068815ad.68.2026.11.20.02.44.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 02:44:53 -0800 (PST)
Message-ID: <14142c89-9e0d-498c-b0e1-08ab6ca56e72@gmail.com>
Date: Fri, 20 Nov 2026 18:44:47 +0800
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
Subject: Re: [PATCH 5/7] arm64: dts: imx95-15x15-evk: Add DMIC codec to
 replace dummy codec for micfil
To: shengjiu.wang@oss.nxp.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, Frank.Li@nxp.com, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, shawnguo@kernel.org,
 daniel.baluta@nxp.com, chancel.liu@nxp.com, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
References: <20261120031853.1175454-1-shengjiu.wang@oss.nxp.com>
 <20261120031853.1175454-6-shengjiu.wang@oss.nxp.com>
Content-Language: en-US
From: Chancel Liu <chancel.liu@gmail.com>
In-Reply-To: <20261120031853.1175454-6-shengjiu.wang@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/20/2026 11:18 AM, shengjiu.wang@oss.nxp.com wrote:
> From: Shengjiu Wang <shengjiu.wang@nxp.com>
> 
> The "fsl,imx-audio-card" machine driver uses a dummy codec by default
> which does not allow configuring the channel number according to the
> board design. Replace it with a proper "dmic-codec" node configured
> for 2 channels to match the DMIC hardware layout on the i.MX95 15x15
> EVK board.
> 
> Fixes: e3e8b199aff8 ("arm64: dts: imx95: Add imx95-15x15-evk support")
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Reviewed-by: Chancel Liu <chancel.liu@gmail.com>

Regards,
Chancel Liu
