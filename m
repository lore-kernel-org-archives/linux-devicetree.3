Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FBA2379996
	for <devicetree@vger.kernel.org>; Sat, 19 Sep 2026 11:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789817752; cv=none; b=Vlrrj/ZsS511j1Lqeq51xYHMkjYlnDRZ9ylYSieh5ymq6Td9med80v9/xYbT4Yss4rmSoZm3XslNXEyr1el7Z7vdxEZP+91rstfYH4k3mD7TVZSeoerJbVzDNJiZVa1WoFOv8YyHok92A5hpTy6GOsp2GJSsIJsXpmksJIajZLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789817752; c=relaxed/simple;
	bh=db6RuuBhwMozGXCwqVkwUYnmsJM3LcJNboRTL/tXiaE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XL/gZ+ndae1+9/jOEYx1CGNSLC6kgPR64FiuTWCozeZifU5q2eE4JABg03yxfzNwrBF0EWvCLfzhcsvbC9rxqwoF+Rvg9bqKtIpg4ZJpbHd6TJTVdwQuFWwfEFe6aUXhD7cClQwviUfGfAqzzLOtdiPtr0VvXXpdULwVNFKRNYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aAmVntU2; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aAmVntU2"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc4c08393dfso1296226a12.3
        for <devicetree@vger.kernel.org>; Sat, 19 Sep 2026 04:35:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789817751; x=1790422551; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=LB+tpTvHTK46vCvYu1SsitSoCwkJYe5UWMMUceYuMuY=;
        b=aAmVntU27V7Jpb6qixRHxQiRGEsiv+SodGwg1szoBCVFt6t/ecYo6AWH5xGNkRZ4Iy
         m6Gmy6G6EWn6HzihBt8Nw/liMpAkm4ldObabO0dzkNka/Qks6cVuBMQglWzt06E/ovKG
         /lEvq/Y0ZVwuEwjGsEu5ERW1XJozljGNccr4YF41/MLhZpCqNnFb3TpfI0BOe4r3z8X7
         6Jsjs0qniPXYmnetIqxiw6xsj/uKiHDsMy5ZkSvxFr5ahm7Jdp8NWHg1dzKBZjGZGwt1
         ftYbNLULYxxeQto3aho2mHCOq6Nw+D3N70ieZOxqImynTxitGkM5YDTxKcklJVUAo1A4
         QGjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789817751; x=1790422551;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LB+tpTvHTK46vCvYu1SsitSoCwkJYe5UWMMUceYuMuY=;
        b=1zcSMgYkCOI1xPfsBHpc24ffbky9MRkkUHoC5qnCLIR5pYs5W/8hnKE7W8O4nGpOts
         B5QQ+iwitaonBPZFDYSsB002IP9w2UyNA75UQNnxLvy3FgmRreMV+c1h89T24M97fu3E
         0C1V3N4PuCgkHhPcCBARxYvI57NbbupYdj+clfl66Q9taBLrEriXp5KVSa63sspK2xMt
         wkgSRrqFIrqo0n2bElnDug3IPMadmi2RadXE8L+4ZZIjEffyW650NNzRntEKpCHy8evC
         8hv0eKBDuozegG6NRXbNbzX1WRfPBlB/tZ33IZSQzySip629si6o7DrT7aQeHUBX1y9E
         8XnA==
X-Forwarded-Encrypted: i=1; AKwUvBwSJ9b3r00mgADTA9byHLdwWLCAoR9+dfVKxKCxaQBnBW1w0hp4UiV08xdo1YGdxnR1nPVkdoNLFSC2@vger.kernel.org
X-Gm-Message-State: AFuF++kOqbVIyLlJwXjJO8pRDsALxkBm3O8mxNMJutAg/y4tnEM8wZ0M
	NRZFHlsR+Zue4kMf77BsKPez3koYQEwMXKANDFDAvVta9GkENkWnqXgI
X-Gm-Gg: AYBFou1wNAy81I7owj3v/z+W7YkSjG5PkeuneQSsC3uSuKsJ1KNH7Qm5aZZ6X6/x1gI
	LLq1taRbLswQ1qH9GPevPO7jxAiuMDULBk5ZF+Mz9ai6Op+lzx/pGUKx2wjphv6b8G0GxGk7CJN
	1wSn4mWIBtMYH5Tt3uu9Lyyf2wKsPgSOstogtAFow1P0TAcHuHLiHU3Kl09Tj88S4P01kDRAaiu
	JQan2CE/Iz+kC7EqSAVwq/VDAcLTR/vC8t+yS5pmbAKGanQW46eFdcxPqQc5x1m3XE3QluYA+w0
	2pozwDexRuJb44FyOXN4qcI6kKi05wGt+r/xNOZIYhFpu3x764heTrijimqwrmsTLQcG4IrYTK1
	hsoFJN0vW5PyieUfQCkdZh+IdO0OaPYTSmaVChhEgjVWuSThfJYOruiv9iXh44ydRCxzHcx5IM9
	s+BkyDTfJoXRcYAN2kz4a3/HjXBEM4GRBkCaJ+d1/2601Gy2v5Bq2NQB1l8+cxz1+TsAdi9pnX7
	SfHKTnd/nWf
X-Received: by 2002:a05:6a20:20c3:b0:3d8:1f68:59ac with SMTP id adf61e73a8af0-3dd8c529902mr9848155637.23.1789817750774;
        Sat, 19 Sep 2026 04:35:50 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c32f17d77sm6091435eec.3.2026.09.19.04.35.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 04:35:50 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sat, 19 Sep 2026 04:35:49 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Colin Huang <u8813345@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	colin.huang2@amd.com, linux-doc@vger.kernel.org
Subject: Re: [PATCH v6 1/2] dt-bindings: hwmon: pmbus: Add Infineon tda38740
 and tda38725
Message-ID: <d815627d-b03e-4ea3-b8d3-52bc3448c798@roeck-us.net>
References: <20260918-add-tda38740-and-tda38725-v6-0-a8b11018d850@gmail.com>
 <20260918-add-tda38740-and-tda38725-v6-1-a8b11018d850@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260918-add-tda38740-and-tda38725-v6-1-a8b11018d850@gmail.com>

On Fri, Sep 18, 2026 at 06:23:54PM +0800, Colin Huang wrote:
> Add devicetree bindings for the Infineon TDA38740 and TDA38725
> single-voltage synchronous buck regulators with PMBus interface.
> 
> Signed-off-by: Colin Huang <u8813345@gmail.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Applied..

Thanks,
Guenter
