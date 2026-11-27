Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795797397;
	b=AA93saQfNYCGkzO+sPi/ywLrp/7LvCDL6AepHYMMfEoKUQ/0vUNtdqxmfD1yGBD55Ych
	 nWcFbyKuMzHiViACTupkyLsv88SfFqu68pE+ZhVtzf+4lf+ZfCtAPygFan81GEU8MGJgg
	 u+pzsdqEX4xCezr8X96icgkO7SNH20KMb43Je0IZ12mpquKgboZ5SAhfdZRIvzGeYyH6A
	 Rp53My7NpWrQZleWCd+Yk8SZlMjAOsMNHEiIUvky5Xdm5WUGJcytTqWBGCO/Ysd2Mkcax
	 Lbmdxn+KkYJRgei0QdlKKBfIB/Uq4Y1le+DM7LilEh1iIraeizzcv5gsCw0ictcV3fQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795797397;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=jE1IwgfT43a9KWd1BnGfLYSEKePpQ66VYgXQTyv6r2I=;
	b=ZtAMkpr1/fzcRRiJ+im6Zfv3mkkHe5drmaQulGpZY7dKAnr64yQwKJzKyqEv/6FVlZDv
	 P69jkoE1aVqwOU3TNMOhSlRoLGyKtT+LqCNYAcfgnk9oOAOGOYzqmtwUaAEwPngDS931A
	 86O6L4MIQA+ZJuHA5hQ+UMmKDt/x2OrGDETCMDD2HpEUzetECj6/jZhuXXIRiySMiIzr9
	 pg2yTCe51JEVVCuH/vznGbnAI7Ue+JiBuAbVL01PLbTtB6feB5izfLQjoGdubbUd53IGR
	 PwBMEZm5jigsCSBQzYOLtvGM1hfKLYfavq4Dj/OGVjdBdJyO9HBxhWtL4NdIXKIqZkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sFe8BE8y;
	arc=none smtp.remote-ip=209.85.218.43
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2977C606A31C
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 16:36:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2977C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sFe8BE8y
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c51d016c75dso191688066b.1
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 08:36:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795797395; x=1796402195; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jE1IwgfT43a9KWd1BnGfLYSEKePpQ66VYgXQTyv6r2I=;
        b=sFe8BE8yvCFbIDw+CsrPHr8Oh6hr14pdlieAzCrmoHZE3ZMpgdUbmMi4dFLUM7LftH
         jgh4p/H7WberYSOXX+eYIJKAdgTJWBZjATz+MWJlgTMNkvT0Qp9cSoO+4EWdy2aS2crq
         IrBPTWcL4e7hNh58xsisSlsDfJ9GC+YdJvZvtBqCnSNS8WoyPxqnnQdSKNDTcGPlJceJ
         h85xE9yPhs67YMc9Oa/uYmA3V9d5jmDCvfmTx6LS35RgnfvWgiLpMWzPQydCfmEpG/yR
         pstezSGsCBx2LSob9aKI6aUNwdd0u041ZaTtYlqXUrIZvMZ1IFHu4vRQTxGjEg/52ix1
         wFNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795797395; x=1796402195;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jE1IwgfT43a9KWd1BnGfLYSEKePpQ66VYgXQTyv6r2I=;
        b=z5bZEBKaJkAotIqDa392xCTijDSPR1qDr0O4pMeeraLdwTY6x+FvUay563b9j7qhvj
         nEbdwGKKnclFZFMFaJxLT9zOUuoWPFolBfvNFi0GD9fl8w0ugfTKXKNG7CzeARkVW2g8
         bBsEyxrSINewAHgQ7aqEyqFPJtCLJTWSTgRUt0Q7wombJ6B7jamwi/sGHuFW9eNdkzRw
         X4pzfjb9TwcwY/S9MVuXStosscITs9XMbl2TshEuzScLjcwjCfc7OmAS1JVm1MFemfVx
         9PpmZu9SQV4nOahjGIQXGhKmRTB9ih6Jt1fuC9AUD2hG+cgiP7oS0GmJSGGSE75bITjb
         N+Lg==
X-Forwarded-Encrypted: i=1; AL+hErEbCh3fLoscZfgZHSXn6CQ7kW/Sp9A3d8O+7ekDEsf3rt1UuOaV+B+vC3exGKC/kNVM1rmD13QqOMv/@vger.kernel.org
X-Gm-Message-State: APuU4Z9EmBpgwhOrdWLLpXC+zr2OSjM+JiT6tRh8gXKRc95azGE3xO0r
	eC1SUD7aCxPtjX4IlvHDdwVoTKEhrVFKFG0JpXwr96Ad4WimeqCf6L84
X-Gm-Gg: AZFdTZdvf60VJKJlAe/8bBj9+kYAJz3FZ7Zwf9BlAu4+O5r2W31w+aClQZxbLc7XTmo
	dy/L7X5vivoUlyPFQr9GxBEownpl61t5+/E/4gxsQKqn+qHaZya47dhxWKnTFMrKh6M7vwIVXFq
	aL1MxBAW5Ao8mXb9yZZjYALL/UYEkmSXVKECljhMpnTJB4N82CAmdcTVa3TVN8uiTT0IS2U93hL
	leGtwFd57XiFd9gN7RAJy219GnSvugDoeJFOLrDNlF4/VlWZ4RgCqFxs/pvQhlm1GQkKBbnTqAo
	xCyen4JwDIvmvt9H1gbYtM9AsldfZSOD1bBaprhnUCixtrngI+B4zw3qxiSEM9f3qhimNfW9se7
	Ij3nkzTpMOQ81MJZTWVXbpureujhsBBhnDmr2mnGzDGvoc1qjGbFpp9rF/qj3E2pYI4/dl2N4u8
	hX8fn0X9iDfiWjwJA+EmDTAOGnTQLaCrPyqjbP74LZas0vElWgqFn5RxNFoswVnqG/8u5e861qx
	RhnFpbuqdFIf0HcXJzwrUW74D92KRMgC6+cs+LRzLrKIh10n8O+nCN4NIoijqLPPR/3kR9oAG8r
	m6Fa+BjuweS1QThGHWBM5yGWjvWw2SePLgjWiZyUoeAER0/8NR4wTZY7ln4oU/H7YwCTaLj0otL
	DqtxUA+uqAPc=
X-Received: by 2002:a17:907:a890:b0:c41:55b4:d88b with SMTP id a640c23a62f3a-c513ab14402mr2259218266b.43.1795797395343;
        Fri, 27 Nov 2026 08:36:35 -0800 (PST)
Received: from xeon ([188.163.112.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae9dc7asm893079566b.41.2026.11.27.08.36.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 08:36:34 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v1 0/3] regulator: dt-bindings: maxim,max8907: for Mark
Date: Fri, 27 Nov 2026 18:36:09 +0200
Message-ID: <20261127163612.280186-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

All changes which should be picked into regulator subsystem collected across
all my patches for MAX8907.

Svyatoslav Ryhel (3):
  regulator: dt-bindings: maxim,max8907: Convert to DT schema
  regulator: dt-bindings: maxim,max8907: Document LED support
  regulator: dt-bindings: maxim,max8907: Document io-channel-cells
    property

 .../devicetree/bindings/regulator/max8907.txt |  69 -----
 .../bindings/regulator/maxim,max8907.yaml     | 290 ++++++++++++++++++
 2 files changed, 290 insertions(+), 69 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/regulator/max8907.txt
 create mode 100644 Documentation/devicetree/bindings/regulator/maxim,max8907.yaml

-- 
2.53.0

