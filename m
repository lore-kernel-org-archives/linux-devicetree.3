Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 708863A8743
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 19:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790019130; cv=none; b=sfQ74xTFvkJ5JSsoTl0X2yuj2YjmDoVcBVE6c298+d9iA67YG3t9CvepL1XSuIW3OY5e0AaNfyAJKvTYi46p92ywMF3NPCh3H8gjDoiZyQlb2hYUnSqjiTFHAmTl8x1CnrfbBT3+Eu+KazdowK6MUtuT2ZBCPVjZmHraCTDvuCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790019130; c=relaxed/simple;
	bh=DlxL+7x1lp9tnfFTr4GsXM8J8UTaDQhZyuNIKR35QKE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O9b15OaHn7BvQ8v4TEEjhAfUSor1+lJ9PKvaza30IErVVf5mkMJWIejsH9//BFM55WAXsIK0J5o05Z8HzLoeIU5aPTSEnXr282OcZyX/Mh0Pj8jzWj8D6Hsz5I3qkPUjTH9YnYjbhPOkxzn7tTbnhfWP2TRUj9ONssB6PaaquEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AfPF8gHi; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AfPF8gHi"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d747ed9866so31789245ad.2
        for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 12:32:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790019128; x=1790623928; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YkVaGp7Cn0+pPyLCGLyICIBFgNNpQjfNjoyqplnwg8g=;
        b=AfPF8gHihqxKFvtNza2MGwCvpV6MbsDsDRIoNgNIeeSZr0dlfUr+1UeOlB6y0r7mC/
         rpUes6cMushi0H4WxkjcK/tiOQsKxQXKcjJvFdj2CEv6rAgkxLNvSyKYajFTeNlqdYMR
         jhKiwujTXvbeHgiU/Y9ZnuQr0MoLCUKjLWXX2cjEy0vsyrMHeTdbEXJd0IBpCgu2xMo/
         JbuzxKcoAk4Qzzs2RoXWTgfN07VMmY2wzk3AqAUIvdffWPQGD9nb6MxUAEnVjIud+QaE
         R2dHbz2xAvkONLCvYriwH7njZxfT1m/5YJmZyYKCfvfitj8mINm0eTYldaCLClzfO17j
         ilxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790019128; x=1790623928;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YkVaGp7Cn0+pPyLCGLyICIBFgNNpQjfNjoyqplnwg8g=;
        b=LwalbJPfo/GJTwYz+mkx4yAl9xyaoRjHzCU+G+f/suMZ+NJ/lOptrcQV9qpLvEIV/4
         if2rFSCIZHVhb+tkpaHP73Lk9X8ohRMmDOJAqS19+WI/1/qOG+i/gQKHlccy2nNIV2UJ
         Rzi20iOwJTtsZY+K8t4bouMTNFBa6zubXznrFIXnZtAySKOUw8CM62zijVWTmD7wfOBD
         jZFwsjf4i419/MqGKgXhZT/4yAWzd7Qhw8xfp4nFOuSz/a+TQz5QWHkMtdrhFX77E0AX
         LeWWMpWTP5/wKMEx2IUyWYfTp2PnlO3X87JpKfQ7ynKyJ/HtOysXIsuMZT5Jzmd+toPV
         SlDA==
X-Forwarded-Encrypted: i=1; AKwUvByO6csatxd99AlIWBhAuZOwPxd64/dxOyn+YzG4PiH8b1mhrmVNeWy7T4hVw5WMpLfVldDrDpubvHVT@vger.kernel.org
X-Gm-Message-State: AFuF++k9wxPTIo5shyX9bkUOLhIhVeQAhiH+i8RlWfohVe81KvlZ6Rvp
	hTyezCNL4iOvUw3axh8tXFcNNyWCei76CELRlAZQCoa9QQSx380OD1a0
X-Gm-Gg: AYBFou06wmKVEhU/5PqxFPwD/nqeuIoD2V4txMiaUAiNabpSmgqViBL34SMvkxqmVBi
	UMPCYVdV3UcPVxzdaXRjYzCf67FM2aptouSwLabiuHhFPpiMx/TY4vpYzsq56hU/P9D98+X2YyO
	QTWJN7ldAuKWF87ZMqsvGIZR69n/hCg7N0F8ee6G774xaDS/cOT6fADf1R9DcOqUgsoKKOKFCUr
	SysViGTS3lkFEh+8RVW0lHTVwKBjbQnUIGCZ1myIGSSTTGQeEz0qcfZRnh/IjUfRKg0cNPQrMQi
	336UVMw5ssQDUrTVwr0dLgNfBZh4I2IYwwXC7jPfCfDuyntXJ0fKM/BIZ3ByqtlVGY6ZIWUY3xw
	JsRLCKjcwag3lB4ZF/Q6TN5TK/rACnbzFXyS7anJUZGi7M0mbJyHHOTW6BGfV4KJZZvjKVD3Sqt
	F7BN9vpUeRRrvaaxEvONxjtjjIpaXvromVZqpZ5sua6B77QWI9k2E5YRL7Y+4u5GNGi438jEWs3
	PLv5Fd8viJKlTnNaHnkzSyXlEHVsKhDVcG220EB
X-Received: by 2002:a17:903:4b28:b0:2dd:c100:a5da with SMTP id d9443c01a7336-2ddc100a676mr100940305ad.46.1790019127634;
        Mon, 21 Sep 2026 12:32:07 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:e1a7:4f7b:11d4:34fa])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e5ec60d1fsm126954eec.28.2026.09.21.12.32.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 12:32:07 -0700 (PDT)
Date: Mon, 21 Sep 2026 12:32:02 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Yassine Oudjana <y.oudjana@protonmail.com>, Mattijs Korpershoek <mkorpershoek@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Artur Rojek <contact@artur-rojek.eu>, 
	Frank Li <Frank.Li@nxp.com>, linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: input: Use consistent indentation in the
 example
Message-ID: <arGGLo9vmxyJQlTo@google.com>
References: <20260913123310.100170-2-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260913123310.100170-2-krzysztof.kozlowski@oss.qualcomm.com>

On Sun, Sep 13, 2026 at 02:33:11PM +0200, Krzysztof Kozlowski wrote:
> Correct indentation in the examples to consistent 2- or 4-spaces
> indentation to fix dt-check-style warnings ("example 0
> [indent-consistent] indent mismatch ...").  Preferred is 4-spaces, but
> re-indenting entire example just for that is too much churn.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Applied, thank you.

-- 
Dmitry
