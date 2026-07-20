Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B706D3AB476
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 05:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784525989; cv=pass; b=H2vil4QikYxwAyUyA0JSvSCUeK4xRE7pKT+rlPqzXUTBw6UhlL2htf/gvlddo5pFk8u9Rh7f2aCha8oO42x1vDB/EC01oXWAWkQtpHkdCzGox1ILyEqqv7BwBc1anrbIR3kqAuyrJ7eBPORZZaxCOUrMq5rA0thYRMXhixU1UTk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784525989; c=relaxed/simple;
	bh=W6NVY7nCUOS6eRqN28XA6yLYq6AGh2fODwowWpZd9JU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BuvddVy0uN6cIaLRO1fOvoOub8Eew6fMUqgNQ4M+LfK8dM+LU+eqkkSoWDxvzNSIJuVkaWmZ5yqkmFpAnQ35LuOYGUio8/O3N05fbqr2ebC//Ul1o4a4oQ+zyASJvEdPuag2pBaShh7MjL9SboncCW6jKGGs2sfq8cBKiizzhIM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C4YD84H8; arc=pass smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C4YD84H8"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5b015b2d792so11240613e87.3
        for <devicetree@vger.kernel.org>; Sun, 19 Jul 2026 22:39:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784525978; cv=none;
        d=google.com; s=arc-20260327;
        b=fLImpIwY7ntnT5m2LjT5ArbxGOEGLnLA4AOXU0i9OLe74xjqkZn9PFD5g9iN1QbDBD
         xeKGphCDGV65OvJD4QhwPAnfaQobjdaoblJmXQGfD4f9zh4/sYo63nsNVkgGf8rFJ6QV
         yD0P/IOBtTS52KhyWdNHYE/bvMYUlCfCRl9enJgo8nn76aK8KHyttSoWXhoE85CSN8Wq
         Xg+3EzHC0nWblhG1JRQuyF+SYagfoGzEn8rLFTi5v7u282k7SVe5wYYd7K6djFDqZjFJ
         Jpg702BbSx2zSufIziZzqEBTEqvQ6bsqDRm2gh0Smrd1tMKmFfm3ie7NTim5tzzxlohs
         7jmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=W6NVY7nCUOS6eRqN28XA6yLYq6AGh2fODwowWpZd9JU=;
        fh=JjIUBObfsmo/5mqK/BpSFgVlBMw713VFqLM26zCNfos=;
        b=VhIXw9N94zBCP8L5Qk2f8JjfE5DfXEwk9i1T80lWWAmQL/258eFa/MVv+oxNuzJHA6
         9k898vMJyk/mO7cxww5ZCp9oc1I+/XN8XkQaFFXzEPO48jrc9VamH++c/8UJuySUonXY
         TN6CfkpMeCLgTpdjXg0gRv3IG7hPIk5wFs4kSIuARJ3pTZhWk44cAW3oQh1/NNa+Q1cU
         KkOEBfFtjei5kUuJIVN4SIhuQz5a9MPFIwLKR3eoTcS2DeKPQsDoV41iHumdI8WM5gvs
         gBUxYadcrgqKupFaQTaxq2WEm3JQowvzJiLGRWsFSU/Vzqt98fqnQ7UzYZcmFLzatun9
         Fx1g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784525978; x=1785130778; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W6NVY7nCUOS6eRqN28XA6yLYq6AGh2fODwowWpZd9JU=;
        b=C4YD84H8YDAPgSlv/6thC931WypJJxVHIwG4mwIO9i1zd8xJB/uohAIMuzexeT6aDp
         yZzV+4HFJWf97NN8oqhbRj8l8iN6pMfDF9wekKfKddbKPawIFbUwFSBGv7jaPJDMT6MB
         M65e1zSk1/nNIwWn9EXTFQUmXUKR5IuBGZr7V/tFTtknq7GcjJLfWHX5QZufZByffpPt
         LYNVz9/MEJXUdKX6ivLAao5IZ6c5TuRJ7bVm/8inewf304BN1LCioBcWRDKFCfWaNYvn
         DI+4h7YEIA9Z447Pm1O4zSxsK44jnwNivFAHC2wsPDUWP8stEu9SebHcw6OLmuh0vAk5
         rIbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784525978; x=1785130778;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=W6NVY7nCUOS6eRqN28XA6yLYq6AGh2fODwowWpZd9JU=;
        b=MgyAnYWK/W0LwKeNZJGYnFXveeRylPdi2CQdLAoSyKvWSE52cNdg8UU4ncA/OiChjM
         oH/HRGfmSCD6DZLBnQkX9XIEPKmKtmTwhXx+Djf0d89BqIPkrBLJoSEArHxKhgSn2j4q
         zMjSPTQCzwxV2+e94AQr9eM4dG6qZj6I9uU3pDC1EErgfAznIMjTGYkQ0fLV39BLivB7
         WaDvPRQ+gr1g95mJRBm98BUQ77qhAyPjjWCPpyRG6y+QJdPiO33JFmbbaKquYCwYJyiP
         SrFW1omKOrtbELemg0VA+h9R6PbIz4dbxpMzcKylklYC2CJtNT+swUPNAh9XCwTX9RIb
         2cdw==
X-Forwarded-Encrypted: i=1; AHgh+RoZRlgRNQU54tS29VVAE6S5RhYLNAz17VgZtlQs8sSkOCU2Xgt50mx+EJ2xtyZYQrz+1GBWqSSwyqfE@vger.kernel.org
X-Gm-Message-State: AOJu0Yxl9NvdujH1WUGHRlSqDdysPgzPzn4+F11yeRA3mZp0K1IvCK8A
	KBY8kSJ/jotk30NxwlaJoLRsqx064RqVzuQi5NKkdipr7HLjX/WOu+XlveUdfTDBhzl/gqJMRu5
	ZrHHQgAeZ7c9ZwQKY1z5Sa6e4uTpW3sE=
X-Gm-Gg: AfdE7clfa3+GMO8YfL1ePp85+ZdyOYXKtwhACLlTcibQwSXK450NVRIc3ymQUvzTXsP
	nBBXfcsXnzM+EWgItN3/kGzrZH3to57OXO58N3C2aCN7ZbfCVj+TtQ+zfBLs6d31wKJe55tuUV+
	GwmuE+nLBJjjDSyBAXZ87nmxftxmfZs0BLsgS+wHrJj6+pzSTiFaFvIQzgmhTcU0NdmLt4HqD3M
	h9WBNKHv9bV7qJWYgj9jNa8m+VjIvb06eYhKZF438UrPkUgEL0MEi9ChZF2
X-Received: by 2002:a19:f518:0:b0:5ae:bf95:38e7 with SMTP id
 2adb3069b0e04-5b28f87cb15mr1651466e87.10.1784525977505; Sun, 19 Jul 2026
 22:39:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260717120005.2087386-1-rok@kanardia.eu> <20260717120005.2087386-4-rok@kanardia.eu>
In-Reply-To: <20260717120005.2087386-4-rok@kanardia.eu>
From: Alibek Omarov <a1ba.omarov@gmail.com>
Date: Mon, 20 Jul 2026 10:39:26 +0500
X-Gm-Features: AUfX_mxWr9jRQfWnrNfb652ggdrTJfNDWLizy8QL0xejOpCnF33xEHR31Qj3tRw
Message-ID: <CAKyg=SV2-81VFgr+Tq=-Si5EO-86MA+ZFoQ+DX1fEYdnnLYJng@mail.gmail.com>
Subject: Re: [PATCH 3/4] drm/rockchip: lvds: add RK3568 support
To: Rok Markovic <rok@kanardia.eu>
Cc: Heiko Stuebner <heiko@sntech.de>, Sandy Huang <hjc@rock-chips.com>, 
	Andy Yan <andy.yan@rock-chips.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Jakob Loeschke <jakob@loe-web.de>
Content-Type: text/plain; charset="UTF-8"

> Based on Alibek Omarov's earlier posting [1], with the changes below.

Hi, I'm Alibek Omarov and thanks for picking up my patches. I didn't
had time to finish them and these days I don't work on hardware that
uses any of Rockchip SoCs. However, if I'm not wrong, it's still used
in production and I had report from Jakob Loeschke (added in CC) who
confirmed it worked in their setup as well.

Thanks.
