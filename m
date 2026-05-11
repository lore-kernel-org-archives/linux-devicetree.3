Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68C3B40628B
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 15:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778514437; cv=none; b=QEUu5nx4XUwCEaLQYIgXBjdcuM4ak+qC8zdpjEM96pPQn5zLFMhYqlgynZT9Fn89EVUEhMfRWMsEtY0QG/vLEYBGg1/puL9NTQkMHRb+5Mvz2mEJYI04VUaETR9wmh7s1F+WCiaZUr3i1Dcnoa3kZYFj3ZTRaZP4KICyY393TAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778514437; c=relaxed/simple;
	bh=//cZI5dNMSNBnjI889RTNGrX0/AbonNKGzNdu70sR6g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B6n3O/qxhfonMwX1RWmiFGE0N0Ow94CnMui8lgP4r4f1h6yqlIOrnPxf02APw4+3+f5J5qJZylJB6eQ03TBcK6d2ZRCtJAmgsRDJ9YXscl/jDTBDXnd+1mW3kPa9v/q/8GDfBMfS1i+Xn1d15dTYA3OD8HxRIcJXCEq6l6K0pek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hYpSXSYd; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=j2Wz3h8c; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hYpSXSYd";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="j2Wz3h8c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1778514435;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IaLCuwVBpxCwdbLTEf7IYx3z7POJtFUK4DUpOB/PfG8=;
	b=hYpSXSYdlsKgHbyipfhD0u1R6QU6GBi2fdj/ONCCjWZpIXla2I8TRx66UsQB/dI84zyEFI
	DwqWOGXQVUK6lfvvDMksUDSi0Kd3lO/LgbKfzpVDxzZmXsHEt914KOjqwoVZSF9axZY1IK
	nVlLFE1EsyHmhYtHPCyOg7Wr/t12+24=
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com
 [209.85.222.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-192-Dl__T7TSP9a93LGi6aAOyA-1; Mon, 11 May 2026 11:47:14 -0400
X-MC-Unique: Dl__T7TSP9a93LGi6aAOyA-1
X-Mimecast-MFC-AGG-ID: Dl__T7TSP9a93LGi6aAOyA_1778514434
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-95f4d5efbe9so1686505241.1
        for <devicetree@vger.kernel.org>; Mon, 11 May 2026 08:47:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1778514433; x=1779119233; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IaLCuwVBpxCwdbLTEf7IYx3z7POJtFUK4DUpOB/PfG8=;
        b=j2Wz3h8c2HsznDyllmmn1ifxRi84n+aum3cskSj0qD6VcUg0ZGportzNX6VW6orauI
         JC/z9DeMtD/reKht9U0VP41zZ9/g3rQSdUzU+ToKFViz52XVaEZVb+62k8KujUGqccbW
         XdSe6KY/d4vHYZZJ3M3DqtwLRKgchMVJ+J57mCN6oksYvQW/HmuYGyzfEHE/N0Nh2sAB
         c7QiG/corQmayW+1Y+jroRACujU5uh0nH6zsbtxt7uGIctBNDb9wTWYm8ogvPouK3pm9
         8yV7aNt1Trxr4krUELR7GM8LlhiMhNDxPi+4GyV9ufuraZgI28FTucZAiJb36KRJUwRC
         56Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778514433; x=1779119233;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IaLCuwVBpxCwdbLTEf7IYx3z7POJtFUK4DUpOB/PfG8=;
        b=MhgeMsMVDudgz83alI/cxmHR/VO0km4RWawgYh6AdEC9vlJFRwRvh8o+ZzmIiYQetu
         fqYwmDqUl4r3EQBerkEZPP4uPwiou/9gvlZGCQY09tSY8kYUe5uhji2kIr8d5SFdaGmB
         o3/7rZM0ZsrLRQdf56Kr7sUZ7fdFuUFqDoVhd/zd6PlaSTw6/O5dfY8MXDpKUPLDRRYM
         HsPXVS0LYJbPe4KuwH/G1U9cPSlKVLRMZ4Oq3SZqPEPGkmr514z35g0UtcpVyodAXmVQ
         EGRjObJxkd3F6xW0UVASQqlAOVcIucfak51oMNonP9k6BDOqqUH6EBAr9Hjw1Aw6wekk
         Kx+Q==
X-Forwarded-Encrypted: i=1; AFNElJ9EBsRPuK2b3yyw17Fv8lmMqnIJpqJhMSq8qLwGeC5wHftMr6LMaikIOeZvmZBgUTssRP0F5ftG+Hpx@vger.kernel.org
X-Gm-Message-State: AOJu0YyaZJNBIWi5PMh2Zt5yxOFOqgygw882oX8z0AME1egZYdsjbvQT
	OeggRaq17KcCQ2mNId1WHXN2dN/f1yOYrvKbZVv9McDU3u866yIKfjNVgHZZcOq0Yn3D3SY4oO9
	xlY6bh85OKXwsC4O0VkVTN2vxN5CeAPDOZdRlLbdPyrFoJYeOokXRcZ5/JnUMOvA=
X-Gm-Gg: Acq92OFgzjKxKiYoZAaBlaizoUqkksQYUz4OOyxSqOthxlRnphHu8bLnROEWvyk2ArP
	niW6wor6MVMMYtK23pyITV4UgYHoxogMJUtrYOjkZWjmVouDMgF6ldeB8LQzO1uLr7MSK9v602V
	kvCnFyfq6dA2w4qO1/HzFNGgfVgHAHShGYossLeZie5Qn4svNU8n85WovDzeNgjeoElZL2+K76Q
	sjHaqtU6mqBg7AbpOR8OTZKUJwKC4elY2UiV6G+5Ag0lJAGa1lFMymF4GIMXNE23a91Zb8twG5n
	3g6ysZAzI5M/rlWS7BZVT7RNJDwsh3UzNKn/hCImGAOkvC0wTxHeFmXy/0E+LY3d9O+Tdf4CpyI
	VAe9UOz0qlJop5V6ZV1jPAclqbn+i8oIW+MM2JKb/LJ617gAO/IFEy9BaTTpEwFytzTU=
X-Received: by 2002:a67:e704:0:b0:610:db51:6f3d with SMTP id ada2fe7eead31-631da02a2ffmr4546449137.12.1778514433523;
        Mon, 11 May 2026 08:47:13 -0700 (PDT)
X-Received: by 2002:a67:e704:0:b0:610:db51:6f3d with SMTP id ada2fe7eead31-631da02a2ffmr4546395137.12.1778514433109;
        Mon, 11 May 2026 08:47:13 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8bf3b0c4c9dsm101224006d6.5.2026.05.11.08.47.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 08:47:12 -0700 (PDT)
Date: Mon, 11 May 2026 11:47:10 -0400
From: Brian Masney <bmasney@redhat.com>
To: jian.hu@amlogic.com
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Xianwei Zhao <xianwei.zhao@amlogic.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 05/10] clk: amlogic: PLL l_detect signal supports
 active-high configuration
Message-ID: <agH5_mWD0CRIcGyS@redhat.com>
References: <20260511-b4-a9_clk-v1-0-41cb4071b7c9@amlogic.com>
 <20260511-b4-a9_clk-v1-5-41cb4071b7c9@amlogic.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260511-b4-a9_clk-v1-5-41cb4071b7c9@amlogic.com>
User-Agent: Mutt/2.3.1 (2026-03-20)

On Mon, May 11, 2026 at 08:47:27PM +0800, Jian Hu via B4 Relay wrote:
> From: Jian Hu <jian.hu@amlogic.com>
> 
> l_detect controls the enable/disable of the PLL lock-detect module.
> 
> For A9, the l_detect signal is active-high:
> 0 -> Disable lock-detect module;
> 1 -> Enable lock-detect module.
> 
> Here, a flag CLK_MESON_PLL_L_DETECT_ACTIVE_HIGH is added to handle cases
> like A9, where the signal is active-high.
> 
> Signed-off-by: Jian Hu <jian.hu@amlogic.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>

