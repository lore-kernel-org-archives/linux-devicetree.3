Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A80173BB665
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 12:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788180581; cv=none; b=tz8XC7AfTGx2g4MHmqHZhq3n9D2J/jgJpaXJxlrscLESQzp2fABgnsKXTvD7jOjRg/tBdGS4BcY1TY8bRdPt6f103hYscojVuCHtyIouUunJfOMtgGNHEy2j7nxMKafyA8nE/jRRKVlE1+0z1+23SXO8Pe+jp1IaO3d6WYlrHy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788180581; c=relaxed/simple;
	bh=VVIM94Wfr6ZD48vItyeNxjOfk3dCFOFp46+YgqOejOc=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=PbxlTLFHXSO9R9uDt3fjXSAxwTnctx8Bu3SklfbeSrWtjGM/3haDOEq0Y61dlRvfD+QV0BinWffeS37Dii8pfn93CAtIMwQHsvNpuy5wZr7ZrceUp6EocLqHnOonytyVveXt4ah/wt3cquwPaCaukhXDi8RKtNtJmpscVet2v1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mNhov94+; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mNhov94+"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-49b392ccaacso48029775e9.2
        for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 05:49:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788180576; x=1788785376; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6Yumoe7FZSNCoT/Inpg12IKhKN/8sBU4yATdWXPVHv8=;
        b=mNhov94+e6xJRU/2pOpRwGjZNlPgCvWQeEECRryth436MqqMHNVBKjKhW64et8zSRM
         XJjnzzrB4rS1cYg+AquWFNFoBwnzrznazvdt2QDGCRoRql3TGCDMsADItjShLSlzd/8g
         VmLfSVIPjHgsV6lKI78e2Gwcv3FkisoJfsSHc1eqF2c3/LvuhMZ2yahUCxHviLygiH9A
         t6dv7DmVS33F3AHcqcaMcuH6BL8obFSfrcLwT3beuJFLyWaqeyC96DbTHjaUWqM8aG3w
         i9szZz/MWiLqTffqi5xg5gXFUyjuHadzIwXpzxWBzOXTLPedu0kPni5ySGbYsGPFMyI0
         Becg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788180576; x=1788785376;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:to:from:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6Yumoe7FZSNCoT/Inpg12IKhKN/8sBU4yATdWXPVHv8=;
        b=jeR5TJ8+XFyBjZhKuIgFq9QxtrTrPLpJq2zW/fCT6Zj0GaAiFfE1PJgNOsRDFnLICH
         UuiiHkP9qTThPaTIvRA972s+wq52ymcnssYL4RlTwBd5dLNC8gjau2pN+36V1N3nCPG5
         A9GZVUx28Vmx/sZXzP/o79cfsxRWnr1MQ8YUatjdBToPERU9yAVQHRv3gvjrj4BspI5i
         EnDcg4Xli0RjcrQCZxUc+qbYpEsGhWwq10DPzV7A2eKq36XzOBdFe/EIYZyrBecmUt7y
         mEjbOjYoCgE/1ARRuV1WwB9ocvFBtD2HthJqEJWEkJ2gDXc87iGvEcOklAGQnfPC9LJl
         RYng==
X-Forwarded-Encrypted: i=1; AHgh+Rpl9Hf87XZcOoe/t1J+VQHz3f2ZNyDmxLQFwLCn7z8bfawdvf7lWiUsJTrPmKzt3fdcXegl2qE9Abx4@vger.kernel.org
X-Gm-Message-State: AFuF++kcV+Xh8MdX22joIXxVOrC4IYRybji0RngrB5GdOyc7O8KvDsHW
	pG4IFSzwd9I1BybQcdhf3FCnGlCvJ2nit7vfm9ZOVJrDEVGUcRgAqCgUhaER6+kMJ8g=
X-Gm-Gg: AR+sD12J/uMKmwZBJFVYsKoSpDpQ/1ZGn3oYHJioMjH6FtNxN/OKmNhAy3YaqTksD64
	J0R/b0lCYPdsgLPZ3lLckKPoCtkNem2Aa7JJxq7TT/QsOoYD2+HedVIl5Wg3hnMTGqwXE/MoOse
	T+cOt0OfB8cX10N4Kryl23ADDCe5D3LxUAlp9Q1xwotH965eJw1YUqQLJ6jpIiJNmQQM1Mrzsjl
	XeWJ9sN/KOKHCG3+tNAjlztujnT9Y+SrQaBe3mMQgPkz4+XYQT+ZHsGLGW/PHOjDMBC0e4StpPl
	TwGgp/xZxaKsrdRX8n9YT3q/m16S4fOUsgU4zrrOlx+7DxQQXvyAFEX3kMrLlYorjnF73VI/WOv
	Hrle7reomqHnZboTJErGjLwxiulKTjIw4FL8wgdXGdeXwRE7iCMCT/VQWcyaNqE8NZbsdn33sUu
	iPhpGlJxo7O3UIEKC8skX9oOTsH369EkGOpnbewVXW6R59xQxBbsY6lCkk90j/vPyhItmFGDVBf
	9ItuvHA+w==
X-Received: by 2002:a05:600c:19ca:b0:49c:cee0:f383 with SMTP id 5b1f17b1804b1-49ccee0f3cdmr203606555e9.16.1788180576048;
        Mon, 31 Aug 2026 05:49:36 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0e:1005:fa8b:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cd2922ebdsm164736385e9.3.2026.08.31.05.49.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 05:49:34 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260829193939.107564-2-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260829193939.107564-2-krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH] arm64: dts: amlogic: Replace spaces indentation with
 tabs
Message-Id: <178818057398.2326859.6686364977974372286.b4-ty@b4>
Date: Mon, 31 Aug 2026 14:49:33 +0200
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

On Sat, 29 Aug 2026 21:39:40 +0200, Krzysztof Kozlowski wrote:
> Replace excessive spaces for aligning indentation into tabs.  This will
> be reported by dt-style-check ("[mixed-indent-chars] too many space
> characters in indent (more than 7)").

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v7.4/arm64-dt)

[1/1] arm64: dts: amlogic: Replace spaces indentation with tabs
      https://git.kernel.org/amlogic/c/6b59171d0fe541438da68c19541cd2f31c60ac04

These changes has been applied on the intermediate git tree [1].

The v7.4/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
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

