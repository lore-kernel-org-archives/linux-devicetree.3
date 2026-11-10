Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794268857;
	b=D0laE8rYVBtY0c6JxcchkryT9AxiP5KQzAerukEpH20X1RbQkR3iJyrkiu3H9BAKr0Lp
	 NIgRScIWSeb1Hje2oU7/NwmNqYOodT4+fnnLu+BTCUjd1kaT4MjofHc5cnkTtDpZsQX9T
	 znSM+tdMCUYLcLopDth3Bv2Rcung1wcESkR+JkgHJLnVl6CkGuhO8x6S/luLQ3PMcfv83
	 2bTlT/CCJKHFpK+ulxUmWUhPsH8EB7Gol1XQ4B+hLgbKJyxsDQ0DLeNXqnC28WKcP1+c5
	 qLq30uD8RRbHWHHUiFJIOvRydahbeWN0tORV2TrqcYIeVGX5q9nJk2SJvBjE7hGZyyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794268857;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=S6Ki4zlbzehwsQUYNDGHpittBTiQ7SrejFTBf5yJLpI=;
	b=dZOGS2MN+ULVLu0vIld7LtqKPiHwK/JEgMY0t4MDJwZFRgJ0vdhy9BAsf3XIvnEpCg/D
	 nSz551QYBhP5g5Iq2AAWwo0bgCXeJhSoQNP8sRfyTGukkrLcc6uAJwYr7BiEmLBJuFzPu
	 4Wb2bDYrYdAoBV3kPTa0rjrLvZpXSNtl606BXT6xXqugzcoIRA1jM/TJTelxWbFD6YqM3
	 RSCXeNxvqssht7ZtF5hCQ7LNOyqh0mzBHdJzhT7Gqp1jVunLHDem43R/KtDQNLt34WMhF
	 Xdj01TlXZQcsfS/y78yG4kiogPjvn4mTPkSYDpUyxCPJhMunN719GfitXZ+HS1cEkcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b="deozIxz/";
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BBC660A2607
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 00:00:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5BBC660A2607
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=deozIxz/
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-4910b863b84so913300f8f.0
        for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 16:00:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794268856; x=1794873656; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=S6Ki4zlbzehwsQUYNDGHpittBTiQ7SrejFTBf5yJLpI=;
        b=deozIxz/aGLnxTDbgoDjHa8Nq0xmOsMrD8iijQkW1P4nF7hUt3TN6minRfpOckwpEP
         MH8cy2KjdHGt16ApzZLcpoe+zhdeksal5/pnr6I+TcQRsTCklK2ct7oVvoeflkq0l5cL
         OzQ85Dgs6+w3/9mQwalx+mc491efpiATwmjfct78qe7gA0CFA1q0ZOlQaauNpMBQp7K+
         Oj9dj5lmjukGVHglA8CHXKMpdD0XmZfI29qoy+pGOEslgCu8USE8/FRmf/FYwZFW+3Vc
         3h2a90My3w4IF2oP5UJKDZDIv+ULOx6KAwmIhCIW773jtJliQNO3c/GGW3MCixqqmSK9
         2Ypw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794268856; x=1794873656;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S6Ki4zlbzehwsQUYNDGHpittBTiQ7SrejFTBf5yJLpI=;
        b=AdCdRj/3WbhMwPBnAVZD1bHctjOEZWVwEXpQGX20/KRwed5wEYhdNS8PJiwvPcZS32
         2BzPmbyIdOHg3dwVQFqRoEoVOz2GPdYdDsb9/XgIS6YBRB1L1oSz7RbgCOAhP3wjP4JC
         DcHqscBPhgCT5uGmzLGepHTck3ljlPsoU8xKwapQTnVcfXWChK5ZuxTiPe/GjC0s2QOq
         dMcDtllIIk4fciib/qT6fPEVejGR5IMAERF6zNUnCjEEyA4DydWTQv/ff5P8xIbNt0TT
         8GTiJFCNzlDNYfHFFjRqBwUk55gf0F08C9aWVK7Jeed8p40FQRR28/8PfAH2NBnESkKF
         I1ZA==
X-Forwarded-Encrypted: i=1; AL+hErESWSxlxqINRzGcqogOVZz85ax9sDTTKnKLkf4pWnS9QorhVfMJp4WKj6+4H9lTiq58PMN/fQt78NMD@vger.kernel.org
X-Gm-Message-State: APuU4Z8q6MwJzVvPxsoW8YapUHsOu7BwfnbefQJOiXFeQc8Icvb+z/ZP
	Q0wD1khQ7EdyrhqzvS68vwqtLnn/vB3CxglzImu1tO98daCvum4rZpxt+PAaaXPAqus=
X-Gm-Gg: AYBFou1AlG383XlB1KXMrpcl700lYNazXsqeytakwe3VapVWslPPfCo1SLX0oXop+Oi
	W9SwjKrrKvKoTv+/G1kLfssajn9pgJqIRBaHaB382tgPVcMpPFeueUDz+Tsy9EuEs5s3PVkeKYm
	UQ+ATtlKI2GL8GmOwnJjO/OtwKTfEujSspzQInewoDAT6SsBe/KabPkES6J4PsOVv5T3eGPc4Lq
	OgmKXf6gQneMyVa01NyeD1xURgyhXRAqq9vIV42WLRUNmDktHws1nncVYV/OR+i990DrKNmjRfo
	kAst6nIkoA7U211ku+Bzr6SFl4ovlqalV/nySzalONgBh/yMVuOl2cpfVRefBb/RHKGNdipRiWJ
	G6h/SZDZm2ts+dLqPO+I32esoKPl/50ww9od28pHbXNBaRDXLS/HeinpL6B/qUYs5i734Lkzc2u
	7sKa5s1yqzwzGapcHx3IQCWonCTXbNxXqn/8REEa7eiOOmoDCnR0D5qDwBqzF6jcFNCUzQbTsYs
	a8ai8llMUna4NIQeyZT0Jmnfgn7VbZlRiwUD9lgqGpOcQmUZptFxFu0n1f+o6pVbLZDt8PLtMwn
	jv8nqPlfoMvAuzlRkpXEDNfunsvimTEd7vb1iVg=
X-Received: by 2002:adf:f391:0:b0:48e:d7c:4bc3 with SMTP id ffacd0b85a97d-4982f2b5ce0mr1045706f8f.21.1794268855287;
        Mon, 09 Nov 2026 16:00:55 -0800 (PST)
Received: from [192.168.0.167] ([109.76.74.9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498365cbbe5sm1882531f8f.42.2026.11.09.16.00.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 16:00:53 -0800 (PST)
Message-ID: <5d775896-5c7e-4830-862e-a9b02b840177@linaro.org>
Date: Tue, 10 Nov 2026 00:00:53 +0000
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
Subject: Re: [PATCH 2/8] media: qcom: camss: Add SM8150 support
To: gauravsuman007@gmail.com, Bryan O'Donoghue <bod@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261109-sm8150-camera-v1-0-3d2e7b407516@gmail.com>
 <20261109-sm8150-camera-v1-2-3d2e7b407516@gmail.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261109-sm8150-camera-v1-2-3d2e7b407516@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09/11/2026 22:38, Gaurav Suman via B4 Relay wrote:
> This was written and tested with the help of an AI coding assistant
> (Claude Opus 5.5, Anthropic); I reviewed the change and the results.

Right, well please review patches on-list before sending duplicates.

https://lore.kernel.org/linux-media/20261106-sm8150-v7.4-rc1-camss-v3-0-0103e8a0bbcd@andrewgigena.dev/

---
bod
