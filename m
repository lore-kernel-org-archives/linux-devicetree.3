Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793699650;
	b=uwfkDISGbCgyoO9/IfuIsrb+/4J7rFbO51VhsUVIiv+mPBH263ITie5YdYnYELWyxkFQ
	 f3wxUm1KDLnUV0gp0qXZ+72nmHsfepFxA+rmpf/RxQPAv/+CMOqLZV5Gcg5Zqr+lv1JiJ
	 Tgwf7Y/hStk7+6IOcMLMtN3LmAzL91BMcYci4zGLkkUSpLDpoEEcsYi/jL3lM7NU/FTp1
	 s+S+5bEFhefxvctj0SG3Xh281zDY3Y0BwPQSHN9SUxx6PaJEeYGb7MVzPdacJKCAB9Vuu
	 OiQxQacmAJDNZffe/4G/gFuMMt1A/VJKgFvK7HZ7xuVV4hcnuz2D3d4Cy20wlPLPVqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793699650;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=6UHqseh2cLjxXxMTOFi4N10VEzBEykU3JQ6JoShxyaI=;
	b=n+ek2Yqzp8MUdkCx3TtEsIxr8hx5IYgahcqR6Y4vPBHwsUZvV8acgBOdo3BkFJd2OdNN
	 mZ8Bs4Qn2DNPP9D2PlNsQagdO7ID/N7mB70QsNzWjbKgv9sgYUZ/nWRTfQYL3HQfOHETV
	 vNBhQl8v80wGcQwyRzxIBUXhESLT1sEnxm3x/dpxGT44PoNFLHQmAcpnNkmBkCQ1iCHAq
	 BLAhLSBG0KHBlzMGumzKrUyGkNeyxbUDmDvREmJb484pe7CBgNvj2GWy8nORf/9vfL+GB
	 W3tPw890BiojucumOQWYOnHthUiRGH5H/oAd7+/xUUg1Jgldzk8O0pXzFH/QgJLTt4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=wxhs5SdQ;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 966B3606D831
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 09:54:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 966B3606D831
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=wxhs5SdQ
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a35db1f202so41231835e9.3
        for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 01:54:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793699648; x=1794304448; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6UHqseh2cLjxXxMTOFi4N10VEzBEykU3JQ6JoShxyaI=;
        b=wxhs5SdQQDpXVmSwxS+NdbsSkjCRC/yNtTyUBkmjLXVNFK+4nX3GmfxFwzyysm/t7M
         8hRkpajTSUKxGy+aQN4KI4JJGBrLxOro2DUGi1Ji2/OxZS2nYjYuKA00FtVdRmXTnnPd
         cW+FGRjhDepphxQ/mJs9fu/br154+9SpTGJaLf2THur4NCRWCE8DFBY8P83ZcR17GW95
         Y4hWSDx2rPo7tLbjSMc6uEn9ObGHkQaYF3sGI7u/9gB6OrzXs9Pm/JQWgg2Q8PX85Fme
         9nTh5KTjX4sz1g3XeZEFZ38tNiGzIDF//xmFdZEW3Giao7qq/kgwmOgj8DqCaU5dDV37
         2pDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793699648; x=1794304448;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6UHqseh2cLjxXxMTOFi4N10VEzBEykU3JQ6JoShxyaI=;
        b=RfTFXESUES3r3JRFZHZ2QI+jQAPBNz6/MaSpbLI+MQMyiSJCu0v3RVoOzLS4omkL+E
         cgy8K0X3Z5IvQHCMCI23nLAF0YDa6nQibAcQLvQAXZ0rXVeehaSnjab05ncdXOHQSsa1
         ApPpePQ8aWpxdUqcIH4tzoNt6cL6uLYlpmMxPu69WewaUza/jWTixOOH+WilAKSXWapt
         S/EbKqpQjaFL+4CxiwV3C5PUxkduqhEOawvIp8ZJMyHN763wNX1OnhB/WgPfaweBX4Hg
         ipUM8OU9bpjXLWtgzhPQPKvkvY/9Ts0svCgEXG19++ti4IP48dWYgwCYm0rBAp6gwW6X
         yoSQ==
X-Forwarded-Encrypted: i=1; AKwUvBysnS0PsqVE8du4zY9YGNAH6QzZfOaH/sRYRD9uqTrq2r/9LpxjLzVK1ypDgEKEBQhRN1cLnJWz6gNq@vger.kernel.org
X-Gm-Message-State: APuU4Z/HyjA5NqX5jrZTx9CqXTT1ZaKfC78JIDFuZIy0IdKt3VqusVYx
	7+WQnokgfEITyoxJEbFv+/wqdrj4fdcw6Hxl9xeKaIRcuSiFn4CNMAM78XuHwp9hx/w=
X-Gm-Gg: AYBFou2WpF10/P8LxwNVL9J8HO5hwiv2Jut7cSRTzfIifLve/HDXkBzndLCPtgY0py3
	iozwZBcbXAEQLEjfAjNB4iqOm/Lb3/c3fwh6QfYq8TJ140vk7ULXHnRITpTZmxA9Pu2Aq3HsBRA
	nx3cGVjRIqClDawzuJMk/14un3y23Uiu4RVcMiHR9UV5Wx7HIDYH8Pk1SPtIX2Spqi2AltehEf1
	/0lRkH9xQRbMzBz6Dee13aJhDtfA7tBQa54zuLuXu7ZYaAZRWZDZIO6Rco2EAeVjXagXP3sWp9S
	WDW2HpgKe68oEXfmqubuDnXvOLeu9QcfRliPXi3+/ZeWESQwcyFWKCn0Lrb2PAvvDDsKaHadv2/
	cwVvKV4ax1wz7YvBl+AgDN0L9LYpsKyrJUcZlKMR408NMbpwnP+cKUvPN1hU0Ucy3zM1qfqmeqE
	t5aKabyHLUolvGDrbHwCNhNrWKobS2AB7PGbPRAGcIYPpta0KwCheerMRGJ25+iTGbWRepDm7Ai
	sxLDiIRy7bZS/JExbbSxGVHjFwdKJXrp7lybfGCOzSkP2SbYCMAQmD2iYtuGB4h/u7uHRI8uA0x
	Xqt6wHV/ne8HnsPC8X3N0SqA0KDX2PKe9Z3d8zvF9H5xGgvYVA==
X-Received: by 2002:a05:600c:348d:b0:4a1:fbf8:55c9 with SMTP id 5b1f17b1804b1-4ac19234acbmr271871785e9.33.1793699647846;
        Tue, 03 Nov 2026 01:54:07 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2aaa4b85fsm43219155e9.10.2026.11.03.01.54.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 01:54:07 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: khilman@baylibre.com, Nick Xie <nick@khadas.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 jbrunet@baylibre.com, martin.blumenstingl@googlemail.com, 
 christianshewitt@gmail.com, xianwei.zhao@amlogic.com, 
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 xieqinick@gmail.com
In-Reply-To: <20261017040038.3702428-1-nick@khadas.com>
References: <20261017040038.3702428-1-nick@khadas.com>
Subject: Re: [PATCH 0/2] Add initial support for Khadas VIM 5
Message-Id: <179369964713.2330120.11723763412614220428.b4-ty@b4>
Date: Tue, 03 Nov 2026 10:54:07 +0100
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

Hi,

On Sat, 17 Oct 2026 12:00:36 +0800, Nick Xie wrote:
> This series adds initial support for the Khadas VIM 5, a board based
> on the Amlogic A311Y3 SoC.
> 
> The first patch documents the board compatible. The second adds the
> board device tree with UART B enabled, an 8 GiB memory description,
> and the ARM Trusted Firmware reserved memory region.
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v7.5/arm64-dt)

[1/2] dt-bindings: arm: amlogic: Add Khadas VIM 5
      https://git.kernel.org/amlogic/c/7db251465d5319a5c0fc46c397ebddb284560982
[2/2] arm64: dts: amlogic-a9-a311y3-khadas-vim-5: add initial device tree
      https://git.kernel.org/amlogic/c/56d1180882a32c78a6207b5364e43c2fc546cd9d

These changes has been applied on the intermediate git tree [1].

The v7.5/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
for inclusion in their intermediate git branches in order to be sent to Linus during
the next merge window, or sooner if it's a set of fixes.

In the cases of fixes, those will be merged in the current release candidate
kernel and as soon they appear on the Linux master branch they will be
backported to the previous Stable and Long-Stable kernels [2].

The intermediate git branches are merged daily in the linux-next tree [3],
people are encouraged testing these pre-release kernels and report issues on the
relevant mailing-lists.

If problems are discovered on those changes, please submit a signed-off-by revert
patch followed by a corrective changeset.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git
[2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git
[3] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git

-- 
Neil

