Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44D56222599
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 01:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785290145; cv=none; b=Y/LjPJ4U0CunbTtLOTiSSjqdFx7mB4neWVv+xO4n0TxI/vtA5wmIgQ8VfAqrLEqNjM+UfJ+86z43l/KFYpcZ7qfFQJJnbNt/QPQC+hxMRaYK/ZcSTskxN641wwHQ6yIEiL2NDD2GVyLGoKmQEbekHzNOlnx+xGsz60kUL8IgAAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785290145; c=relaxed/simple;
	bh=7d+GQbaesuf6z/xU0uuiZcz8BKi39yg5+zy534KfOZY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GThbV9X9YaP0ygIC1wdSzVfdUOD6jYo6UHw4PoK6nsXuRBVG+ihstcWiZyu3R3MoOU+9D5PZ8Jz98yfLigYtdBbuOfTF5GyMVQXckenlMLS7DoLDbhlQ8ZM2+/bNBJLLi01YMRezOMh6H/sosp7iH/RcQg3BOz/wPlLU2XNA05U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sm8cU4NO; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sm8cU4NO"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-38e42560ebcso335232a91.1
        for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 18:55:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785290144; x=1785894944; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WgpbITyz5r54kEwZv0NwNpMih07miMaqmNgkn1d9m1M=;
        b=Sm8cU4NOYzpyX4cd5yeAavT4nXzAk1lLBV3vsTao+gPjc+LypHbIMv2i+xcIdCFKIV
         nkkkFF7JWk6HZGwW/nhC2l0RZThgFIMBUeuEKVK7HGg7EHXDUla9k3yi9oN9ZkLBPczz
         Dz+ARb9RqEl8YIfBOJshpLqQ4VhD7byjX4AIEZQQGd+3ASMHor/kmIt4g1/4FuuHJbWs
         pSi6HpvX5YiSoa9/gs2yJb81wMK0Lx1QkJmFBTgRYVhxoIJ3409lJJDiIfaGUJ+UG7Mi
         BAxtIOyP9AnxKh5OHtPzdDXsnGoozgjhn63MZIk4I80g4WzXXLPG1+PLEqXn0qMvs2Cr
         VY0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785290144; x=1785894944;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WgpbITyz5r54kEwZv0NwNpMih07miMaqmNgkn1d9m1M=;
        b=nRCh61leuo7sgAVSD+m3fYt3PtHRj8fAeotNbril3zGTQtZVFG5PrpRUgtKjT3Pz3w
         YdX/7Lk/nvTSAVuGkPl51dmL1UcBvbDFu2/7bOlUHqR3OtTflohJxHKur9cRuQDclc5O
         2yEf8sL1gdT21lBc2Pe9cKzvPAt+iiyGQaWZWzDWBMOui3dBJwrkiZd3ucrarAgtpWUR
         rdMdgWOyeHdi5E6ZMqvhxzSLHk6czT2Gd1N1XmkG/2C2AoN4OWlAykWXF+yxaSVsu4PE
         8/5epGvUnwLOYj31bVuikLS+PyPyeXu+Uc3NE7sTYopr5cjjta5XEjlWnCkAOk1JInhC
         /s8Q==
X-Forwarded-Encrypted: i=1; AHgh+RqWYL76wGv4hLBNP5fw6mhgnQAPnuQbNA9R7nqsJFYAW/8XXzBCRn+2RRxOQjPRTzBDY1nbnqhrFVxs@vger.kernel.org
X-Gm-Message-State: AOJu0YzUUtB/3ngwIbJB9v4QzoNp7y39xLjb6/Da/B7SbO8OderpDM8v
	HU9ZPrpHGzmb1PVI7dpQ659jo3zZg6U1Wv1OolI1UmZlwx0vqK5V3VKD
X-Gm-Gg: AR+sD13daJBmYaj9Qz9bRqJhPB9hjEQafU3JRf2Uqp8F6+Zn9zvMJ0IxY4VlcD5VIi+
	c2v7uP31onqRx6Wyy4wqTiEUcTnSBM1cZpy0AhohqCpn08xu1PxxXM28rwrUhFYFtplJD9UkSQt
	QhVKcIharN81kCB8fMi4ITdSoj/+AJI7VupXckS6jkCFbDUOqs6ayRFBmzoXvw2ZNos584ZMwWd
	JhQVxgSMO7ZWDB0SGLPHc4jLpDacKD/KLTiAMpLDSl/dvOSX2PNrcliNg7DKaKSkQgbi/COTPfl
	InD+NWUvKcQLPYXbGPIzNCUScKBhe7rJCsriW8gWVcX2QWxq1CVXSMFCqQbwxitULUtIPkSt4F6
	WdCWfyQ9pi131/nXSQdHHcGgUpKXr280leyYBbbJ1n2CytYSS7HOC3Y3Umq2YEQv2bOeNatLuzl
	U4EvHJB3CwCWTB2HbfNgKXcOH3d88fABQUkKpr5J5nZI0Q0mAlewbhUS4CKUI=
X-Received: by 2002:a17:90b:1644:b0:38d:adae:4866 with SMTP id 98e67ed59e1d1-38f6a3dc276mr5144331a91.21.1785290143640;
        Tue, 28 Jul 2026 18:55:43 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f642fbf74sm2022334a91.17.2026.07.28.18.55.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 18:55:43 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Longbin Li <looong.bin@gmail.com>,
	Yixun Lan <dlan@kernel.org>,
	"Anton D. Stavinskii" <stavinsky@gmail.com>,
	Alexander Sverdlin <alex@sverdlin.org>,
	Inochi Amaoto <inochiama@gmail.com>
Cc: dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org
Subject: Re: (subset) [PATCH v6 0/2] riscv: sophgo: allow DMA multiplexer set channel number for DMA controller
Date: Wed, 29 Jul 2026 09:54:58 +0800
Message-ID: <178529008848.164571.1132515193531771269.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260511063818.463877-1-inochiama@gmail.com>
References: <20260511063818.463877-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Mon, 11 May 2026 14:38:15 +0800, Inochi Amaoto wrote:
> As the DMA controller on Sophgo CV1800 series SoC only has 8 channels,
> the SoC provides a dma multiplexer to reuse the DMA channel. However,
> the dma multiplexer also controlls the DMA interrupt multiplexer, which
> means that the dma multiplexer needs to know the channel number.
> 
> Change the DMA phandle args parsing logic so it can use handshake
> number as channel number if necessary.
> 
> [...]

Applied to dt/riscv, thanks!

[2/2] riscv: dts: sophgo: cv180x: Allow the DMA multiplexer to set channel number for DMA controller
      https://github.com/sophgo/linux/commit/3c698b64db0145fb5edc3f19e4170b41b4508281

Thanks,
Inochi

