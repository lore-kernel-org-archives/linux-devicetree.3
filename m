Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792974927;
	b=KF9yGGT+7/f7bJ3gCISg38HHw+60XtRR04A21bmI8QSqZYg61Sk7Oww3BsJvsY1C4U6t
	 XDYvekb0TrqF40NBGXUT4i20mk35Xifh3+solfQozKgnFe5EqxPQYB3jIyNaOrfLq/4Cx
	 y6B+dIB67y79xdqJ3fNsv1cXVcujoeKM34wo8q8kycDTztwmKNchcTIT4ZAm6fwgjWrmS
	 QLW7/2tHDOYysV0UIJDdNiPkwy73Jo581opRYlpMlJx2Cqe7KIrTjZT+tHo9tcBqOO8dR
	 wpX9bhYJoKLjINckhclCcgnxYzf1/V2vPNKJYixOcMejfTB/4/UJjba6DZmMOzcY+LQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792974927;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=biikjnXgtnu7sMIPqSuPM5THtJpQ0Ac/8rE+B20J8oQ=;
	b=Sez2rkCQb73ORDjLNrmiPTrOnCDJXiFkO/CZgn5rWkPvYMbYUy+f3AjzMmrDbAYbpTmB
	 FE3Y67qzRD9+dz/OBG0Rmz/tiP31vX+YR5oSH3ehNPS1bFst4dtQTdkEnIQhAf6BizvtP
	 eop15aQhqZjWaEE7J11ztPcr+M94y+OU/BmHNH4onc+CGdZkBGUNJ/8+XCVggEDSa8llp
	 mtbl/Qw6lLopE3K63PNGmeISZIowgrFqCdRkvb98afw44qzGYaqI2kD07I99vWYmtJabZ
	 zfxo1uSafWsKr3omkCypzUX6zUAgwaylZDMj02i83aaQUOw7w4uRH1+EvWUpYgirZaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=njplM3md;
	arc=none smtp.remote-ip=209.85.216.52
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E549F606A31E
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 00:35:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E549F606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=njplM3md
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3adac5b29ebso1468267a91.2
        for <devicetree@vger.kernel.org>; Sun, 25 Oct 2026 17:35:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792974926; x=1793579726; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=biikjnXgtnu7sMIPqSuPM5THtJpQ0Ac/8rE+B20J8oQ=;
        b=njplM3mdJURiFtDubYKaOfdLnMma8l3vjNmOEFUeg+E2dIDMxZdZS5gPlHPm7CT2LI
         xac35vlTXGv7kMrt2tYHiDLx24Bl6NaLQixMgWAjjjxZ2WyKjtcHlyLQZBBFTL+cu67g
         HWYPLXAxjlJUxwQkeUtVknDJjLmJULxEarhr37O18hYhSaSf3RcaehcOjXX0ovgVFQo1
         nGXhgTYRz7CBuL29RtbxRaaSUPHynQSGs7KBfnZ/a1K1n9kP9ugkfNb9iphT2mj9G2wH
         KVr1QTQGiIi2GiYvm/b5+MXp2LJP/gHn+XJoXzzNNyNTfMMB0WMqLOXAISbxmNvFlqEr
         kEqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792974926; x=1793579726;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=biikjnXgtnu7sMIPqSuPM5THtJpQ0Ac/8rE+B20J8oQ=;
        b=NsgK/pOisLeNqpRyRJuuImtQxvb3Ll0rkBAqKmoiDxo67/BYDz8tr7vljaac2KEKwf
         /ZUZHnHIxOCXkDgRe1v1nuhSmM4G3XzjyqQ98D9YIuq2CzHLNC8eX/MhNYam7K/LHupj
         a0T5MPS78psNHRvo5OYA8/W8UxbeJDi9qYc22ZU85OFOArXLxJQ/04QucAgu2BNGp5SS
         Oiil7gcwdPhmOW3FS7SjfqOUp1RIcVHS+Xbr4IiDo0LEHulaXdFU8e9OMsSngXjfFou5
         oYpzhv/I6ZkNrhDrEZjyAyGqKLbeX3LLX43OcnJyXq+7hIx3eMA6cLjhx8iS8d3mt7e+
         u23Q==
X-Forwarded-Encrypted: i=1; AKwUvBxcrrN5h+YwL7ugAuSRjIz4ncYxHU9l6iLNQ5gG1wDurv2rdlWrBpUzn/iwX/cjnGCKI/M5hY4m3s4h@vger.kernel.org
X-Gm-Message-State: AFq9FYIn8eE1AtVES6ebYeYARplT9DaJpZ3HxCFOIQ1CMTCUqNiXX7nW
	SaDNx2PXgdMClyIwPuZ2I3Xqiasi2EvpQEPdtqhCtcmAoJ1axlGWQMw+
X-Gm-Gg: AYBFou3TvxZ6sd7E9ODqYyCW5JF4Ko2bDIpHQjas819uaNkok5GsrsTWmtlGoeUnUfF
	mbWROLX2nkd8tur7bPAI66DY4sCFd8XFLP5mSKQ2TGRwcwQSd6Ldj3RSVr2AzzsT+ZoNNo3Z8eu
	SjUIba9SaggMnrdV4rrrAy7IPhUFmMPVlKDsymBN4f3NG/12OyaMjWMlmrsmQuO30g/O7z0jd3Q
	yFqxAbVxg2/k+R5aGQ4HSayzSBxeLT3xGIr+sQr7FtDDGSQDBvUGtmHAqEMBiSQrSdCsXfZO2lk
	B4iiqTYKeBKrSD21VLOTPwUVwK1rnxLbqqrEI+SuQ8uYSSRGMKGBUgkB6Kx8okJNE7vDAPh5TG5
	1oYbwmvBQErsrJilLj4Exvd5tFTr+w+cRbENVED1KneIgwBJzQgB6FBt3iVb9eyGdh8YM9eY6bR
	mAEla9oUP+1ASYvECIfNE5aCaE+Vf9eBNfPwVUGz1DXOTJJLJGlR69Yh/rIuccF2xW9xna28XfW
	uw2eDZwS6aEyMf8GqwzhjCjT44sPKHdPK4KMoFp1yD8hdk0fWy8s+t6VoPVHjkxU11JIbCobxpY
	+bkGrnp+z684uPc=
X-Received: by 2002:a17:90a:e18c:b0:3ad:13fe:41ba with SMTP id 98e67ed59e1d1-3adeb11f8f5mr4322887a91.52.1792974926204;
        Sun, 25 Oct 2026 17:35:26 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebe8f0a7sm6187626a91.9.2026.10.25.17.35.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 17:35:25 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 25 Oct 2026 17:35:24 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Lars Petter Mostad <lars.petter.mostad@appear.net>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v4 1/4] dt-bindings: vendor-prefixes: Add TDK Corporation
Message-ID: <083d8718-bcda-47d8-83f6-6090b40689b6@roeck-us.net>
References: <20261020-hwmon-pmbus-fs1412-v4-0-27ece4e43d04@nexthop.ai>
 <20261020-hwmon-pmbus-fs1412-v4-1-27ece4e43d04@nexthop.ai>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261020-hwmon-pmbus-fs1412-v4-1-27ece4e43d04@nexthop.ai>

On Tue, Oct 20, 2026 at 08:02:05PM -0700, Abdurrahman Hussain wrote:
> Add the vendor prefix for TDK Corporation, the maker of the FS1412
> point-of-load regulator.
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>

Applied.

Thanks,
Guenter
