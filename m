Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B34A4417D79
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 12:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784550719; cv=none; b=kpfsGYH3HlfCKF8XThofaMbS+FnjtROYfHgQRCVqRTdgSgZ+WZfOwsCDBVMHR25i7tgVbq76/tk5L0r88bxClNNZvz++a3iXWNQemLVFL/xypDnJ2gHuj9H5bqagtdNRWYjCXUbSQAr+KK3s0VDyX61QPaLQbq/kaLq1YN4p6yc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784550719; c=relaxed/simple;
	bh=fpuvm0+7twW67kzO/1uNIDu0c62Ki+iYZa3tN1urJvI=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=p+W+nOWCGyOWa58w2jZrPSGSIO/ZO/n6y2aJLP1XMLGMLaiZRN0tzDLlgGgez5OOaMolKHISQh3EV7IrMp8NOQlOtfRLHebKFvZaShROJaxJh7kSUJlVXtfhYZIDjw7bnFXJ3zD75CZWHNPYpRnliq8hkHFxGVr9QO5R2s5KPlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SvSEcGGG; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SvSEcGGG"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-49554ebb87dso16963255e9.3
        for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 05:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784550716; x=1785155516; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2YiheYNkLPy6p50mBPBQabeVB3m+46mhIEjX9T04cmo=;
        b=SvSEcGGG4Uo20p70Uz7bNyCpFa45LhCPbXrKowiWdpqU1r+RiRJj+ENOm5sibWD48C
         g5msnBx62AMjxMgWpTVDJnxhauIOaGmk3E7YhNZDtkw08PE+gR4z4pHkjh9sBYU66e5Q
         mA2XqRdRsuQOqr8NDZyiOvZwwbdKiXAl5HmghZgjdjGAi91bm1uS7lElqzdpD9meA6bl
         4D6E9u21Wy190v1XzDU+SeHC7N5xmv0OvEaK/bKG+DLGt1HaSf2NTUS3TqU+hB/FGfwK
         H949pWrBqHj3Fu73nHjy4wn2uRwaLybmhppTJ6BuTC/iB6ymzqUjDw4IP54sb856rtLS
         FTZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784550716; x=1785155516;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:to:from:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2YiheYNkLPy6p50mBPBQabeVB3m+46mhIEjX9T04cmo=;
        b=bIXqR7Gw9NkMRuziVPs1J+bgmt8rI9EAqqfNMlKAQVLkWxDDxurNodpH77Ovm/Xm9G
         N9d/lFgYriv6Zebx2QBcfYmj3eiNUO6DGW0g4RERVHnfCETmGMWML+btDzjAlVxrEjCh
         7KBaSl/dhpPiP4+Foff8iW9OWntqbxINyCaVVvBSZRwQg79mAVRZaivAz5OcR4/9eNm+
         SEAM5x2p/NZXFbggkky4uBl72DH/uu3YwEe/fztbNeyd5nNFDXCNXpckdFpQuCE5sD8c
         2yabE5z36oUUVl6is7zeWEzLEGujO4UxrkAX92p7NtDr16Wa8KZjPwe5BI8ho1j/3V1M
         rvpg==
X-Forwarded-Encrypted: i=1; AHgh+RrNqGnEAFwEWr7NMvcjUR1g+68oChCcq0TH9ddKaPS1WBfkxcRuHqziQiLOFuDIaVpv8oGgqLPdxC3C@vger.kernel.org
X-Gm-Message-State: AOJu0YxRVz36tGabaDglFmhGOAqEjlQBSgZUahe4eleiTeSlROxxKK8k
	VXpXDF2URVd5u88vr3WL6dzLADvvON/CdxH3UXleDeN3WYD2UOqBAjo3Fqo5vYmnLxc=
X-Gm-Gg: AfdE7ck8t61f5IbbMJAPlOH99xz+oKd5v12pr3jxnlzCP62XxhtkQ0F0llKXPgUvlOI
	o52/XVWk5NhpL4937Txt1f7hknsBxPK+in2aQ4OlD8vSWXXrTXHkdqstOHsVnbvfk/4/I1WwfI1
	MicFPe1c0nMvFj4bQlbbm4nDX1rrB4KR0hoRw73uwYzV3ChGwmeD6eLbctskmVqIQ1hLeCy1DQP
	XvgiI41QZwHI7ZBoX9mlWZk/6/lOb7/fUct53d2u+yGL+iazIbmSRpwaxZchtgvRNTeE0rqs3e+
	vs/sN/3BmmaIpVDv1ByNkUlLmuEpw0Q64U7DWUBfFwJElGK7Bf1tKasSMSMKWg21BeuPvswqvgR
	sCtjSHK6u6C/KzC2fokdU9p6k6FPCk42K9qbhj50bIMsP0scB5PtKjA2rDEmGxw9H3BZ92INQdT
	339nxiUwhR4Y2Vd4GD2eLOGVExLRu9V9DMnQ==
X-Received: by 2002:a05:600c:4584:b0:493:f5bf:4da4 with SMTP id 5b1f17b1804b1-4954a50e970mr154551135e9.28.1784550715772;
        Mon, 20 Jul 2026 05:31:55 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954a2692a3sm243086825e9.0.2026.07.20.05.31.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 05:31:55 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260706093508.273968-2-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260706093508.273968-2-krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH] arm64: dts: amlogic: Correct indentation and
 whitespace
Message-Id: <178455071510.746335.6018359052164978426.b4-ty@b4>
Date: Mon, 20 Jul 2026 14:31:55 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.1

Hi,

On Mon, 06 Jul 2026 11:35:09 +0200, Krzysztof Kozlowski wrote:
> Correct spaces or mix of tabs+spaces into proper tab-indented lines and
> remove other whitespace violations.  No functional impact (same DTB).

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v7.3/arm64-dt)

[1/1] arm64: dts: amlogic: Correct indentation and whitespace
      https://git.kernel.org/amlogic/c/6c4345eb714f094ea579e3234cafed9f8c0634f8

These changes has been applied on the intermediate git tree [1].

The v7.3/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
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

