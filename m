Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3127D36B92F
	for <devicetree@vger.kernel.org>; Fri,  9 Oct 2026 09:47:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791539255; cv=none; b=p13DgQ+x50govFOuJ0el2d4rJoFrUcVXLTX/6K+xz0gv30kIV1ocQjpPuHWm/UymaWmRgAdRdOLteqSwXodcK/+aamYgmpNYRigAFT8BGie8j13ZdTqQMOpHIM4UMiLGGTzmWFRZGvqkZpzxZHr8FCavi/f/TTqbtK57uX4sTlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791539255; c=relaxed/simple;
	bh=s3u5T5breAgT2P8lcRxXYdcTlv5dNJi6cEZM9dWPzaw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=D4babD68rBzUqS1DoneKagWNBXfHlYy7VpCYPo7EjcSGArdnM35fmU27M0mT/m4EJQQ9DahU22a2KJuvmu7Ic2GK68AsZAIFmr+vPBXsGr7wMS2D/hHzne5Gm1qKsmGczZ47PpRenGzt0vSZvtrZxNClxArBNhc9czYnT3cDtYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ROIzAcse; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ROIzAcse"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2e5378b281aso23331205ad.2
        for <devicetree@vger.kernel.org>; Fri, 09 Oct 2026 02:47:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791539253; x=1792144053; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=owqjwJWBuPvcpm2AwPuIEABZT8Ua6Ztz/UXZ6nA+qF0=;
        b=ROIzAcseGrjMoxr/xoada8bo9s/fwhtQrFFAcMnV/duOCYtX1MOrqXn+Fy7vpM8Am2
         g5EUcw4yyFgyWJmMu4CWL57cfmmlN8oOmzQCYzjUc3H66QOQTtJbsAzFkZFs2jm1H3Vd
         LU4BuLviIgpRf92drasxGswbTNm8lHeZFDu3wNoi2Bo/7PUZ6iAa/aZVhMHLFGlZ6CEC
         PQ+bGzI/V0F2x8MiSH/nLkI0MMQfw6vssD4J46jtixB4xLcXX1ocV++htrFomCvoDWnH
         hQJAqWHRFSftg4nm6voWXTvVxRiI4u/Z9NRHLoQb/EC8/8ubjJLWU0sjb2rZqOFniquB
         F0fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791539253; x=1792144053;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=owqjwJWBuPvcpm2AwPuIEABZT8Ua6Ztz/UXZ6nA+qF0=;
        b=X6zSosaFT59RsAA1/mIBTd2k0WrL+D1jQePZTaDmEZd1cPssiUeXiMDm9R9i0RfTak
         k+BNgZzaQRLJxDQ9HBDIlvVBAKW/f725bvhO3r6J8J4OJsKeNtWfkXnxbTd6FHVaSN//
         /qXu2+u1+9FVFegcUns/h5XlRxBSgT7kxMKdinSTpL2kCdEbHWcvlSMJwTAzhrcHXhEN
         8qPBCvXmzqeQHZW7ET8Mt4hDtDKDz2RpWPL0ui3q7GFMrl7duzR2PgDi2U9/IbP8D/9C
         G/2JIR5mftlFcBmg50DGPZShLlA1z68PRQezYUibkpmXRd9om+0wYz0B6rVByLMeyhp3
         kpew==
X-Forwarded-Encrypted: i=1; AKwUvBx5lKojj7eoV/V/eCLSPMMz4k3p8G43rBpqRoiCd7OC5p+ScmLPyb+GX5JJoeltevjJRnyOrT3gFfCJ@vger.kernel.org
X-Gm-Message-State: AFq9FYL4V+poszx49MWZfNv2ctKAsx/Pzv0wV5EbdYkczf2dIVAzP9vH
	83Fpa5CeRNK0JUo0yX62KXEIxgRpvPcVUPr5y8IYRP0480I/YvBc4INJ
X-Gm-Gg: AYBFou1hgSJJAF8YyjG6++ozE5I7VN4g+ZX6MEfYTGUmquUXm27euOeiF2s06KpmSPO
	oH20iZFWsMDjP75rer+tW14Fbb9Ge5CFgvEXpKBhpB9QmmAEvzs6abpV+8l/otmfuJHGY1RVuiX
	jkyXZYgFky1xSafqArV4i55RzowTVBV2o071ciq9EPAY1sIs2qVaaoxq5VjN8vu6iD1eTvZwgey
	ydJ8dgme0uQvbxasawTOsQbR7mVe1JStQ/rWv3rhPR1w3btqmvmbKb9CKAxUhItgtwOhzcWcXq7
	X1anS8WW8KAaBPGrxcK4MOSlKtv+4wMmhU8RVGNp0+Pt6FIPZ/ZHxgASPyDIv9xNbu8pbvoNOoK
	OpKz1Q/PNZYCdOMDpS7WQilSg8ntOP3pFhkMiSdf4+ncvJ/6xYHX4DvbZF0kGSdKa0VwdzFGTyx
	SG58J2excc26+feN7QIpjqbZPI2z1FXjkM4uBAlugPz6VNhuxydLgY5kPgY98tVCLftyXP
X-Received: by 2002:a17:902:ec84:b0:2e5:d2db:bf57 with SMTP id d9443c01a7336-2e842d03028mr11541545ad.49.1791539253450;
        Fri, 09 Oct 2026 02:47:33 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8421b298dsm5963035ad.33.2026.10.09.02.47.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 02:47:32 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <chen.wang@linux.dev>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Yao Zi <me@ziyao.cc>,
	Andrei Lalaev <andrey.lalaev@gmail.com>
Cc: Inochi Amaoto <inochiama@gmail.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] Do not reserve memory for coprocessor FW
Date: Fri,  9 Oct 2026 17:47:06 +0800
Message-ID: <179153921383.259252.13110307622319000120.b4-ty@b4>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20260921-sophgo-remove-coprocessor-node-v1-0-ace29446b327@gmail.com>
References: <20260921-sophgo-remove-coprocessor-node-v1-0-ace29446b327@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Mon, 21 Sep 2026 17:08:58 +0200, Andrei Lalaev wrote:
> Milk-V Duo and Duo-256M reserve a region for coprocessor FW at
> the end of RAM. It is not correct because:
>   - FSBL can be configured to load FW into a different region
>   - if no firmware is loaded, the reserved memory is wasted
> 
> As explained in [1, 2], FSBL should reserve the region at runtime.
> 
> [...]

Applied to for-next, thanks!

[1/2] riscv: dts: sophgo: cv1800b-milkv-duo: drop reserved memory node
      https://github.com/sophgo/linux/commit/6645398c46219e97fd153ae6188ae86c493d2d6a
[2/2] riscv: dts: sophgo: sg2002-milkv-duo256m: drop reserved memory node
      https://github.com/sophgo/linux/commit/60e4cafd30908e7d8cdfdb4fa1a74dabed9f47b5

Thanks,
Inochi

