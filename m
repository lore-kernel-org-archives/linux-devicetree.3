Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05258397E66
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 02:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780452419; cv=none; b=XDiXBbtVIiyyMbTlwifxDv4nyT51LKBOv/MeTv2iX7bICJoPtd5gzlw3TIAKKbX+BVGXc65+nPDyOkCiugLXjT4KMV8cPsaB3Nx/H8ugkYmd8YZ685YCF9lDyoCs4pEbqbzkjh/fzbh58p8Je0Ij1UUvBVK2HRSw6o7midXQe50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780452419; c=relaxed/simple;
	bh=j4WcOXqbjT92Y/7VSahHzKe4khJsbf+eMoMhUZRhMMo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=t9ONgjVqp6T9UkezD/0wYFVY26JvhMhsHQI+WjsmiV2Lult6i7lDk8URsFh4dc1yRYqQmEsmkXMB6gkov7Kfnd10WMlsjvHI5nLpcdp5b0V/1vGnQrp+WflEpSx1CLvaUHbR+h9lfIIpAQUNr17l0hd26xNy+q/7afPzH13TfmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E/6Rf5HM; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E/6Rf5HM"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-36d8b644473so3230142a91.3
        for <devicetree@vger.kernel.org>; Tue, 02 Jun 2026 19:06:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780452417; x=1781057217; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b+F1aM3WBZZAtQTaYVDf+ZQQwiErQhbecMAZSECvtDQ=;
        b=E/6Rf5HMISZgUdmGunXZJh2BnR+Y0slkJ0EiM+u78YF3VoSU14xS8lsTQ5dQ9gr8dS
         WEToUaH1Fu/2+ODlJrtnSZhA9kqhdrxFe64lp7j/5+qsQhjzZ7ySrwH47Ufbfsefrdmh
         WI9MMgttHUtJVK6ZAwQIBe40MT/FLt+oZxedxXfdecHMF0L3s8k4vvcBfufLD77FS+lz
         iyBXtRL5kS5AXWOU+NvekFZqfZTHxCbpz2AeW5nhGxbvFpA3T/izYisaunzmIZRJiYxN
         dpdWRku6vdKWEplmYb5adNDOLPuMvPtWeVrZgrhjrdiOSFKTl8RkG7gY89CDwwH5oxPN
         uh1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780452417; x=1781057217;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=b+F1aM3WBZZAtQTaYVDf+ZQQwiErQhbecMAZSECvtDQ=;
        b=KtK/zmNArjS6aYeaY6aP+9KVTTQQLgqa+Aha/Gx2pr+uoqq8fvz2h6JzOYNDiTkx/D
         kqDHsC1QkptYGB23PH56LZI04rCNAnCWQfQoT/HI+6H6kDtqlDiJE49/BQONtKBAbVhq
         ff7o7TwVdMl+Y1dqSmr4vz5OKHAlkdhXKyJAGZgiSrC9jmRlPc0wXlzk1YuTNnDnOtqM
         ct1I20F+3u3DREenGKOckjQ4k0cK9eHSwvelwVbLMb04dprpO2TjlGsIqV58eS4Hbl20
         jZFYH8lilYnhDS8or8eyGTA3viEfVuDI4CMqHgxjbPTQigP9Eu7qR72NLX5Mcnx/q6cr
         rbBQ==
X-Gm-Message-State: AOJu0Yw+J8INVXRtVp/novBYyDUygmpuUHBTtd91VOvmeRhREkA5IRMB
	uvCqguNu+oCG0ejBYWPmgb55Jk58zmZ0QTrCpqPz/79ySfjal0JqXOAaQA9MBcaF
X-Gm-Gg: Acq92OGG8nY+FbL3wbFNG9BFKHM2oOUHSPLVax/KgF9OwQcu4dMkdVfNmwaCWKJ75f7
	d1oEoAAnrPp+ml7p7OCCjwx5OWEbpc8aMgFkwUfNDdYvO3cLulOVQKO/PzenyY0FBP0UXjtKMTa
	3dIuv8pWJQ1Gh3a+/gMUXM4ipv/aoV773DdZlC+LavAevtVYt5dHnbzGpxj48GACaPb8J5Dt65W
	iFK6X7bDUIRCQ10yK/1GLnquG8Kf5JfNV8muV+J2GS6SMpppYTfkVhR25o2g1uHhJCKaLMZZQpz
	koYB9SMo1s/TxsR/7N9oKYVHsH4ZAjC9dT6YVdV2STcIHJjhOgbMt11yavxzjHUAHiTtKqg1GC7
	J9JTsbyomZTy/VZcglrlfTg4yqHqmEtWFcpaEcx7Dd5GulYfCl3Lo5NzBOhWdSfiGMhiBKho8xb
	UR6P/RbAuGT9kAxla1NiMwqxxsaXAqxg4BlQ==
X-Received: by 2002:a17:90b:1d52:b0:36d:70c8:3a3 with SMTP id 98e67ed59e1d1-36e30a28f32mr1195624a91.15.1780452417269;
        Tue, 02 Jun 2026 19:06:57 -0700 (PDT)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36dd9877d85sm4190993a91.14.2026.06.02.19.06.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 19:06:56 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Chen Wang <unicorn_wang@outlook.com>,
	Han Gao <rabenda.cn@gmail.com>,
	Nutty Liu <liujingqi@lanxincomputing.com>,
	Guodong Xu <guodong@riscstar.com>,
	Guo Ren <guoren@kernel.org>,
	Chao Wei <chao.wei@sophgo.com>,
	Inochi Amaoto <inochiama@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Longbin Li <looong.bin@gmail.com>,
	Yixun Lan <dlan@kernel.org>
Subject: Re: [PATCH v2 0/2] riscv: dts: sophgo: Fix CPU unit address for SG2042/SG2044
Date: Wed,  3 Jun 2026 10:06:35 +0800
Message-ID: <178045237640.222315.13582367282574161417.b4-ty@b4>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260426013449.694435-1-inochiama@gmail.com>
References: <20260426013449.694435-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Sun, 26 Apr 2026 09:34:47 +0800, Inochi Amaoto wrote:
> The CPU unit addres for SG2042/SG2044 misused the decimal number for the
> unit address, Refer to this discussion in the Link, it should be in the
> hex format.
> 
> Link: https://lore.kernel.org/devicetree-spec/00ddad5a-02f5-474e-af9c-11ce7716ddfc@iscas.ac.cn/
> 
> Change from v1:
> - https://lore.kernel.org/all/20260406232655.144043-1-inochiama@gmail.com
> 1. Apply Guo, Conor and Chen's tags.
> 2. Remove Link tag for all patches.
> 3. Fix comment for clarification about node name change for all patches.
> 
> [...]

Applied to for-next, thanks!

[1/2] riscv: dts: sophgo: sg2044: use hex for CPU unit address
      https://github.com/sophgo/linux/commit/207cbc477406a72952e27ace2eadbae55164f129
[2/2] riscv: dts: sophgo: sg2042: use hex for CPU unit address
      https://github.com/sophgo/linux/commit/a7e658907686528fe06a11828b04a3e42df9ef18

Thanks,
Inochi

