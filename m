Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 823BE41227D
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 12:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783686450; cv=none; b=AiCW/LjdXmNTMxcPdWxrhznIjdR5uwGY84DgZ9DtOCgXBDZ2K9tRD/lzonmqimWx7kFZV2JZUKkKTDLdqeBGxNrH+bGSrvHUA8GpKUVUWKH+Ng5o9AMKhAqAbuJXUEOcEmz7fn9eA7F9nJwfpf+yzEHiuLE/IiM6pCr0fmDPCD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783686450; c=relaxed/simple;
	bh=rLKCmjRVf9KOpumyHtF+VxJdc7P58Nvlzs8HElmoXlc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fgJgNoB+sDY7YRrB0JQ+Nv+AUzCdyB3SfrNNXr4TWEFE8UkJwnxNJO3byVvcsFX5ccIYUVicuvXd48llWNzhu0BWLmcVpZoQ/eae4NOmk2Ao8OQL1tvQ32N26x90B4z9DGJXpNLTC0E66kI+IXhi8tpEBx4gKhY0lxnCb/0HcHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JsutOSIg; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JsutOSIg"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-493b27c7451so24336695e9.0
        for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 05:27:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783686447; x=1784291247; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WuKkt4ZATcS2uEH6twVx2vS+GDU8r/hOeP29ybwJqOw=;
        b=JsutOSIg+W6NbOGtl1Td0s4GDsVPt0D9i73z0vHyLM02eUHXEGvNLfaDJKR+HIfpDc
         vT1kk8AQQvtixCPqWlInaAhWxOONGGuxU6XG4UThcVTvWlQt1sy2zc8/7zyFzN4dzBhG
         tb5Ult6qC166ZGh/vj8QrtaWGC0XMizZTXKu1Iuv9lG8HiAnATzItkK3yPt2wqCKAtWA
         nGkgdKBoSbEH8zkRyaafj+aNDF6U+9sDy0wmdLyBVLyNyKZ1ccv5S6mNGvp18sypbo9q
         ZJCZ73Nn5KWJCNMOUZ0tGXFYQnuxwdM1yJ5imozp8EuxGcMAYOsASnOFk55UwbNaRGNz
         /i+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783686447; x=1784291247;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WuKkt4ZATcS2uEH6twVx2vS+GDU8r/hOeP29ybwJqOw=;
        b=QMfDW+JSieNvigh6OBnpl8n4rDd6+unrVMCsBlb0Cbq2pn4QRbEPPAeLSFMFMF5qek
         GaugS9axsMMNOi58bnlps6ejaTaG08TYX/5sMrrhW+K0/87ANoGLBCgneh900rIhM6LA
         GHNU8Ou8pwdlKc3XLdGahQHNOu1f4/Ylc1Gd9WF/YToXUNYysx2D9D9hWhA/fNOGTlwG
         kttotZrXvqZFF+XkbyooCoYmHFSYw7WRcpPyuany6ddnE46FnnoVnwarx8/xUXjiF/qg
         MWvLbDvuO2c7gsuIefek9mTkEvbcC9GiC8KeenoSjXxZhS5LTO1CRpsqk0VhknNP9+TB
         TxXw==
X-Forwarded-Encrypted: i=1; AHgh+Rq44A6LPXLn8OzcE6845L2xHyvPp+23LpU+hQSAPrLdSlt4IUI1i681Z1oicv8mvB/pAMT6u6b6+ePK@vger.kernel.org
X-Gm-Message-State: AOJu0YxhKCsPQm5fpUTwAGsLzG56FFI5dQ8hYFuLw9G5wVX7ursKUWwl
	q4UYKsi3fBw3Uj1za0tN7O3tHhSWq7J3w6SUCOev+PRjyVsHQJhto2Ql
X-Gm-Gg: AfdE7cnGwoy2n3ezQ33vtAAWAhtaeNEUFiDxQjX3qMnItCt6gb6EPtJYa0gkeFw1zD/
	JP06Hd04lcghII+x07LEAx342CTeHJXQnU3mdYDLBS4DoP/yN8V4UWcVh/OpgXCl7ze1ldOJd9J
	x+xGZez6JLVGqxtZYPZK9NQ4A8r9NJYKDvRr3yoATu8MTKkQqVrb+XG+Ik2YWbxKtAl5MFfxyy5
	46kV88Ic53TdIYBZ9orCMNzC7YKqZ9DR43Ca1uZbkVXej1MgXT9TMiuNq0FF1UQqqevL6EN/yCi
	lqgjEMJr7xfrwnYCJm9A5oFv2k26JgZzMWsj5sGIyxa5K7CVKo6xdJ8dnrDHywGA3HPpFmyGpCn
	FKAouXeS46sH2D+dBwNNXsYWKIxfNamQX5OusAyVZKIqg+28fNPhRMPD2gdEV2rg/hPgCeGH8W8
	8pnWUarZVumtuV/G+zKg2+SO0v7tsth2dh2RttNJk4mYqitGe5FCEvYEy0Z0edS0XJpw8YUf2Yc
	cfGuC8e
X-Received: by 2002:a05:600d:6447:10b0:493:c991:8e56 with SMTP id 5b1f17b1804b1-493f2b24cfbmr24906515e9.4.1783686446545;
        Fri, 10 Jul 2026 05:27:26 -0700 (PDT)
Received: from [10.128.11.240] (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493eb6ff432sm130984125e9.4.2026.07.10.05.27.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 05:27:26 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <5ca48a5f-086d-4372-ab3c-1535dcdbe5fc@gmail.com>
Date: Fri, 10 Jul 2026 13:27:25 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v16 4/4] crypto: spacc - Add SPAcc Kconfig and Makefile
To: Pavitrakumar Managutte <pavitrakumarm@vayavyalabs.com>,
 linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, herbert@gondor.apana.org.au, robh@kernel.org
Cc: krzk@kernel.org, conor+dt@kernel.org, Ruud.Derwig@synopsys.com,
 rbannerm@synopsys.com, manjunath.hadli@vayavyalabs.com,
 adityak@vayavyalabs.com, navami.telsang@vayavyalabs.com,
 bhoomikak@vayavyalabs.com
References: <20260707125311.2398031-1-pavitrakumarm@vayavyalabs.com>
 <20260707125311.2398031-5-pavitrakumarm@vayavyalabs.com>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <20260707125311.2398031-5-pavitrakumarm@vayavyalabs.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Pavitrakumar,

On 7/7/26 13:53, Pavitrakumar Managutte wrote:
> +config CRYPTO_DEV_SPACC_CONFIG_DEBUG
> +	bool "Enable SPAcc debug logs"
> +	default n
> +	help
> +          Say y to enable additional debug prints and diagnostics in the
> +	  SPAcc driver. Disable this for production builds.

This help text still has the indentation formatting issue that I pointed
out on v15:
https://lore.kernel.org/all/deb73385-a7a9-4ea9-8338-b7da999a5e9c@gmail.com/

- Julian Braha
