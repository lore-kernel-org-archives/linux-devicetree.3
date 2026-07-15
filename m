Received: from mail-ej2-f3.google.com (mail-ej2-f3.google.com [74.125.228.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A82133C0A00
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 19:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784145326; cv=pass; b=nH3DU83p4RGSfjl3gYKOGsyYbRFx6ZtMUZIHlWf3d6tyRFLRhqaf0iAomGxJrWZv3/eZIxM9MB1RkIaP+egc+dp0c2bmkonTSmSn+XtqtD/ozMFetndjVQCPtz6Iv2NJnmPusjT0oOWIrBinKWx+UAxGF66gcofEAJDxswQ2P2U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784145326; c=relaxed/simple;
	bh=VnpQaYCb4lI/8U01znQ7H7w3JryvPYK3m+W/I/YdFSc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ntWq202vyllwJ11AcuEV9KXeT3DTeZtJ7pFkJE+FAjZ4wlcRHXsSrh4TeeuFGnfDDD3FMwNEIJwaSzRqOhPHSPUm5zjLLvnSF+pMUidykZ7Hf0y55ipWUL+ume6HlJCO/mSxzplhAjxFC22mA9jjKs/JCYihvcg3eAp2/fV4ZaQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nBuT9yby; arc=pass smtp.client-ip=74.125.228.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nBuT9yby"
Received: by mail-ej2-f3.google.com with SMTP id a640c23a62f3a-c160cba3944so262417266b.0
        for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 12:55:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784145323; cv=none;
        d=google.com; s=arc-20260327;
        b=neS4R4H7jL+/QSjJiI1Qw8Dx4RwQz+ZIcyBrGtuFGbuZTm4Rmon3DxZqwrHFks69i7
         0gyfLAmWiBVI7JkZTw/P5JkLUoAwsLQnKzDgFAHkXqPene8aInlAk/6ZPeY53w9zIByz
         W8QOdqWLZ2TJ9NU/aj4l6+VYNk1NXqcOp8vIe9WiTuPVIj95f2KGiMib2Lfnt4peVhHh
         4pWJIB8J0EZhN2S5vXtjC+yIgKU3Dfw8PWpldW2JiHOKZ0WZMKUCEzCJYDOvjnHn79pd
         K7ub4ggDdg3AUtuOPg1mTEfWfEEvAypd0uezlaW0V6iZGSAeUsdHJF1TSjxbfU3nTSWP
         R3Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=VnpQaYCb4lI/8U01znQ7H7w3JryvPYK3m+W/I/YdFSc=;
        fh=wekT9/VLcRS6O7RbTPPgG1ewlvzYNzH6qCNhKJ35X9c=;
        b=NBf1KcScKaDXfDUdeXkzlhNiLu1uBGIuwp0P5OdT2Ox8m6fNkFkLn1d9Mh3VK7cQXe
         MmqYHFw3HtHGbEe14y6Ay1hcwwhziHxBmPUQst+9gB9gFqYaaQJ550H1iHw/9BpLQ7+1
         WcEeUT/tqQxo05y9bQ5N+Wo3SHSeFrVatmbxWuHuKLXfD9jYWR658wCDAxuMtqb3prMY
         aRIF1rRBArtRYX4JVOeL1SncInyiesYaZI82tmb0u5kXipnFONocptOx7U0ca/hYTmLi
         QI9Z4pvtjlOCztckCI2v8NfcqnK60V+8DOaCUI7/Jo1P7ZbgzgCRmvEADhBcwzmb4Gzd
         AlFw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784145323; x=1784750123; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VnpQaYCb4lI/8U01znQ7H7w3JryvPYK3m+W/I/YdFSc=;
        b=nBuT9yby/zZClO1MvZag9uDRAI4lfz5D1AtWCNkLhvecqnwPRxZsf4NsVKDPjvYHgc
         ascGAjUkRv94RBrcGqp8Iq3fFOSNuxUBPngpjbTBbu+UXjPG6VPZM+I55RvWFS+SiVUq
         aom8rpzaT74PTDziHuOHc5lw3lXGPB6Ah7uzxAXnYrDGpceh32OSa0rnx6zjQx7C3FhN
         QisjCk/2gjH2RkIyDV9KlTAnCGouq6vuRL1hYTbqcAO+N1a5ZPCJmaBVPHGRcwTuNUlw
         9eLMDhEWpJfoJuFAiEM7Fze2G9Irs98kF0G5BBX7Ilu+LGUpQO92SGQwexzXCi0Z7Le7
         iH7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784145323; x=1784750123;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VnpQaYCb4lI/8U01znQ7H7w3JryvPYK3m+W/I/YdFSc=;
        b=MbPlbmQgE+cywlb9sfXgJtO/bZ56C4kb5P5ufjGhenph+jCiWm5k26PTLqU6m7vMUE
         VhER+ST8h+ePu5+3wtiqCpusWQsb0TWNcsYjRnIP9QAaxwKQlLRx+Z+u7rzU/qjDUZHi
         C09lP1eVDMDEoABCR9Vg8h1E2BD0EEi/Kd0L4eLGJKfHHtqMuSJc5lRdknmt3neL1Tmv
         +dsxI4yDy/0725Itvj2uAQAd/NKKOZ497n76lodod4xqT/vCLJmpikH/aDtDRdGEJJoy
         4dvLohdDCuSkhxJJ2gdbV0+dMmMRzk/bdEL9fYKHntF6pu1x1RmGLwe1OOuZQYU1PZj4
         oENA==
X-Forwarded-Encrypted: i=1; AHgh+RqQqqsaM3l0X7LR1QmDl1XfI8eD8B6t6eiScjhprRLyEWH32kL+dS6TjVv8SVpB6pArLmVghyw7tfdi@vger.kernel.org
X-Gm-Message-State: AOJu0YwF9NcIIK31lZin7F5LDS1K5RMxHJfuwrAUUyQmropcfP2BszSH
	6jK61X0jQm1XoWXPwi7hG+ghXA66XYJsccN5soypsxQFn1+Tp/fgF8v7zEh7AoM400C03iV5C5g
	uLDIzWoTinrkMctpWKHvsqeNgB11Db2Xv++g37wMPGXNzh2U=
X-Gm-Gg: AfdE7ckhrcRtpsmDlxSoQhLXrxGDu7oen98JoQantJwW5c6XUobWlCpvGVqJ0xV0yHd
	3Ny3K2dq7lVyT49bIfAe1rEpwhRP9Hisxj1Qmv5InfeU4RGDqjjieayHLO8eHNaw2vIN7/Ba6AY
	najWEdY4WVsq11N1cb3TIyKGt4YHjlOtCjUFEwIZcQ8gSEnw2aVBbQ0ADxi30ZaF+TpvOoE3cT8
	yeEbriU99GzN+zGccVzjFeaEsGohWdALUDAt9avYTwuls1Tr+EbNYOmueDca4McpOibAwNxa/g=
X-Received: by 2002:a17:907:7242:b0:c16:6e57:9444 with SMTP id
 a640c23a62f3a-c1679453361mr272846666b.39.1784145322452; Wed, 15 Jul 2026
 12:55:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260714191341.690906-1-coiaprant@gmail.com> <20260714191341.690906-4-coiaprant@gmail.com>
 <20260715191450.5784D1F00A3D@smtp.kernel.org>
In-Reply-To: <20260715191450.5784D1F00A3D@smtp.kernel.org>
From: Coia Prant <coiaprant@gmail.com>
Date: Thu, 16 Jul 2026 03:55:11 +0800
X-Gm-Features: AUfX_mykLonGubsl8DxO-GKViagbh7KP9J0DCe96idGn5m70wlNIm0CCR-zZt1Y
Message-ID: <CALj3r0jq7F5HvQgpA_kq1+=AzMT2y2sG55TfJVWvWTZxwCbK9A@mail.gmail.com>
Subject: Re: [RFC PATCH 03/10] phy: rockchip: naneng-combphy: add SGMII MAC
 selection for RK3568
To: sashiko-reviews@lists.linux.dev
Cc: linux-phy@lists.infradead.org, neil.armstrong@linaro.org, 
	olteanv@gmail.com, robh@kernel.org, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, vkoul@kernel.org
Content-Type: text/plain; charset="UTF-8"

> [Severity: High]
> Does this break device tree backward compatibility?
>
> When the rockchip,sgmii-mac-sel property is missing from an older device
> tree, priv->sgmii_mac_sel defaults to 0 in rockchip_combphy_parse_dt().
>
> By unconditionally calling rockchip_combphy_param_write() here, the driver
> now actively clears the MAC selection bit to 0 (GMAC0).
>
> Because the hardware reset value is GMAC1, this actively overrides the default
> hardware and bootloader state that older device trees were relying on.
>
> Could the code check if the property was actually present before writing
> to the register, to ensure the hardware default is preserved for existing
> setups?

Thanks for the detailed review. Regarding the backward compatibility
concern for Patch 3:

First, the driver code in the RFC patch set has already been revised
to align with the hardware default: `priv->sgmii_mac_sel = 1` (GMAC1).
So when the property is omitted, the hardware default is preserved.

Second, and more importantly, there is no backward compatibility
issue in practice: SGMII support for RK3568 has never been functional
in mainline before this series. There are no existing device trees
that rely on this path, because the PHY driver simply did not support
SGMII mode at all. Older device trees either didn't enable SGMII,
or were never operational.

So this change only affects new users who explicitly enable SGMII
and set the property as needed. It does not break anything that
was previously working.

Thanks,
Coia
