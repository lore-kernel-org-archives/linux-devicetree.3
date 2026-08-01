Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C3BD36B931
	for <devicetree@vger.kernel.org>; Sat,  1 Aug 2026 19:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785611000; cv=none; b=Jhv5i0GL39y5M1W5Bw+3b4fA52Jl8y/g8fdow16imf1uMnx+dOjqGw+4up1FB6gUbf5NrGHUxqwG4EOc/NqgZgjF3P91hr1y2qaK/y6RXGtfKMEVdK0sXKqdDGlv8VbK61QBFoF7lpZke55+aGlcQ4nEx/Lf77gOX1tmbpXmjYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785611000; c=relaxed/simple;
	bh=sMQ9XbxuufDm5bjam4ntsiQnaQ3astXZvD81E0x+KU4=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=ex0qw81c8Igd8t3ChU98+iie7hVfx/J71pGDA8H1zhKSo+S669dcKanv4DR52jaRiVbQ/zHwusI4udy20fzP78uqz7iXxglFvcfUg3yqEpwrByhHnRdubXg6+8w+Vre8aHA2ZRuE3qQROvm27Kdhl9Y6t6GRspAsU1if/yNWFzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mvhUzgxP; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mvhUzgxP"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-47f6609c657so1064399f8f.2
        for <devicetree@vger.kernel.org>; Sat, 01 Aug 2026 12:03:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785610997; x=1786215797; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sMQ9XbxuufDm5bjam4ntsiQnaQ3astXZvD81E0x+KU4=;
        b=mvhUzgxP8BVBAggRQykNDBdahFKCNDZLDs+RTn+/o9lcUk7q+cMQNEP+PMevJET6a0
         Qw0atttHbqHjBB+Imel7OpioaZM5w1VC8hu9lypo0vGFOrRKoMleFovqToQOBovaRyjf
         kP16wCv0kYmgHgu6CPBlU5SZAJDa65nFeeN5Hi0cQMO7rn8r9TFJxvmhBEQKAWNXhR3A
         fe+z0zF6Ed29Tcytyvuui2YhkyY3IystR1XFHGil3zNNk4b0g6xrZT54hJ4LIFbCVnsW
         fJ5KeUjK/L8gX0jaUP0VlsnUit9BFyjA3ZrpM8cjA5i7XI2tI7/ChE5SKY4+b3RS+4PV
         jIsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785610997; x=1786215797;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=sMQ9XbxuufDm5bjam4ntsiQnaQ3astXZvD81E0x+KU4=;
        b=RzqyeyEQGripC81uF7LD9FtqMkG2ptbLPWot5TR1sBKHHkyn2QJITGssC08tvWTlgA
         F8rLFS8N4uSoOigzMIDBqEAgVAKJ9X0Jxry3HnLNNZzXAgVigRdAtQZ1AzD6SGyWN/Kp
         lrbT3S+GLosmbhy2iIE+QLGWOKN70h7MD5Xn4aWPsyvcWLA7JJO/9G2U7ZA0U/GMDZiJ
         8lW7VJp0/ijcISy7KinzM3gJbsaOU1WgS9PaYWgQKSUVbp0oA0MXGZ8AjZavqMwFMtgY
         UEmGQLLH71nnC32PDYI2I+sdQbreY7k9rdI32/PEJ8k6H5ZlioBiibyc8wgK9eJYcbK6
         jhYg==
X-Forwarded-Encrypted: i=1; AHgh+RomzK4d/tfoNt72vDe4xWz2rBC1N6Uf9tI9YgdUBzPy7g5Xoh0A20EijEBL5Z0Md10OQYDO2s1W/GdI@vger.kernel.org
X-Gm-Message-State: AOJu0YxRK4usq8i2S/n9CwOeV6j/vXf40ZNWtfzc1kyIzkfCX/EiN63s
	O/c4JO+X6MPu8aKCsldPp7Xqh+In2npx0l07zhFNM+ME9wvxzGFGXvRx
X-Gm-Gg: AR+sD11R17OXHSbeHrq1KhW1EjOrdXSe6L8/7MUDUXxbhcE7iyVUHCQBDVMQisUZLIX
	q3QpVqZslEPjKkWfC6AwnaB+I4HqbZY5yGGMMWprWORJlLwt2yWt6a78ObP6F8y8rV8dIze1/Cj
	x7ZOofMtgpAqEcI1+skgVJbGAqZJa/mRYuOo2je7UeYBaH2B/lSEwfZcaERXWnV4PQmOU24ucna
	CVSXD7zJVGUrIg0reqA7XHxYfOuyBJBaJ3ueBMXQ7X8vpTAowgQ0WZWkG4TKAP5Cy8rUcKwASXa
	KEwZa9eAqF4vs9lBzIhZC6JBurbq73LBURa2WGnZ0EFC1tvFMJ7dt1SpFKzi6qiStP75d/ixZiZ
	pTj68zohSinDWGrP674MYGV/iBZIUPXZfehQ605X4urYCQ7F7pfxK2JvImg1JHgv200F7uqJdv0
	sbTcX8/SBHiV6VHc/726oV4sQLLWQaqWo+Bv7RqIfjmJLImvm9CN8zS6jjQqEY1G/R
X-Received: by 2002:a05:600c:3488:b0:493:e6f7:ad75 with SMTP id 5b1f17b1804b1-4980c653e15mr72272055e9.11.1785610997542;
        Sat, 01 Aug 2026 12:03:17 -0700 (PDT)
Received: from [172.23.0.7] ([64.188.68.34])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49808690ffbsm92158025e9.10.2026.08.01.12.03.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 01 Aug 2026 12:03:17 -0700 (PDT)
From: Neko <nekodevelopper@gmail.com>
X-Google-Original-From: Neko <neko@altlinux.org>
Message-ID: <c691b70d-5bde-4762-baee-8f1736212165@altlinux.org>
Date: Sat, 1 Aug 2026 22:03:14 +0300
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT 2/3] media: i2c: dw9719: Add DW9800W support
To: Danila Tikhonov <danila@mainlining.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>,
 Daniel Scally <dan.scally@ideasonboard.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Eugene Lepshy <fekz115@gmail.com>,
 Achill Gilgenast <achill@achill.org>, Luca Weiss <luca.weiss@fairphone.com>,
 Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht
References: <20260801-dw9800w-clean-v1-0-38978de67963@mainlining.org>
 <20260801-dw9800w-clean-v1-2-38978de67963@mainlining.org>
Content-Language: en-US
In-Reply-To: <20260801-dw9800w-clean-v1-2-38978de67963@mainlining.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/1/26 9:04 PM, Danila Tikhonov wrote:
> The DW9800W uses the same chip ID and register layout as the DW9800K,
> but requires different default VCM frequency value.
>
> Add a separate device match entry for the DW9800W and validate the
> common chip ID. Use the matched variant to select the appropriate
> default values.
>
> Tested on the Nothing Phone (1) smartphone

Tested-by: Vasiliy Doylov <neko@altlinux.org> # DW9800W

