Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795375155;
	b=aYMirk91/qoG2QTULTsv/ocNGA8GWtLdR8LFA1XjoP/rBN1dvltTi6WKmFMrkCcIE9r6
	 N8QlrtwclPWj0rrfVdX6G80natFSGkOsqWdelYOIW8eY3UtyCh0LeKwi45q7XAp5O8Uq2
	 7F4gLCLeL1K/EHz3Px1Ar1oMvtyuIT7msAQucajE0BHJgPQOlJN50YWNWNqgWzjFnQ9ME
	 pu7QYqSfgkKUEsG0/oZYi83Vka05mNuw0c+P8sM/vHPcfvGRcNyn4JxhhENuDwYcUDI4J
	 zjPwwkuCI38X1MR/cru2m6rhihP62jQwcN6SmSF8e6t4M52h4Jd9ZUcm1TfJb8mfyeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795375155;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=JgVB/O5hBKCdOeqZ2JLGG3q/f4KIK1fx085LNchkx34=;
	b=YuDBZQWeXTTTmO0QN1b9QaZHw7HSVFDvnBQlPHauXhZUa7EHgYEskUxgFVjKoaeRdiI/
	 BTcK3MhqYOSm/zQh84OTlPfzeqnaslWYu4ZAdWdJPzw/K2rXd0yxODXadZbhlw1+Af4an
	 e1zwtGiGgd5CceX34voQq4yB57FxT/MDhfvdSXsDeXVDtFA7i3oeU4/u5K0PFsD925ElU
	 l5m+Ug9vXGUyBu0uE8ncvI4p7pY9gP9Y/39VgH48kOqw6ojknZjM8yuRl1rPO/Y4lBmjA
	 S+cDm+IUSfTHJ6VimvqTlIT8yHrMbPzTxgzLPTiMIGKo6l4+Db8IreCp49HoY4PGhNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KQdClBoh;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D809606A327
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 19:19:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D809606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KQdClBoh
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4b79502c27aso22767345e9.1
        for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 11:19:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795375153; x=1795979953; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JgVB/O5hBKCdOeqZ2JLGG3q/f4KIK1fx085LNchkx34=;
        b=KQdClBoh8jcCpLG7uk8RfQGxzzKTBS1Vz22R2mosQpM4g6tHydr9advbfUzmde37yW
         STvgE+LR7Rx+tCs7ZvSTW6NpG5uHYbFiwxwYFAr1VQRb0XTXknUsRJys3QqBs/6rFsm/
         swBdSyIk8a2U2PsvjiDvKCnEJla209oAQ/CxXfth5bmZlFTiACcIyFSVNK7M3NsSCyy2
         ZnbSOt4uPkTN9QB/3EqwltEuRhuJDLVxAfjwO2c4TToZdwSBKfs7rO62I2ogcsw0SeYm
         QJfCdhXcwZJMkSkyIAT1mzeq4TdWs8muaXAuuTCINtHGVBcciTDtufcEs0RqnAH3XAkJ
         h+vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795375153; x=1795979953;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JgVB/O5hBKCdOeqZ2JLGG3q/f4KIK1fx085LNchkx34=;
        b=HpoARdiA5f0nMEXBlhqu1IN2iWwlYt+S1SOA00Z2Wb4RL/vqdDWrDMvQSoCgXgTR58
         nOHOWQjKPDLLQB5Wy/yrLZHWQ8zbTIcBOpSTsaKRYakCaavTYeJTpTomeox4Q9CC1S1+
         QcdnmT2UrR3NaPtjGyyTi7F2XyC4To+xw6LI7JAHdLdZm7Qrj4VV5ro8WscXurFeZwYm
         jiGx/XdikeH6tQmKzjClqFefSkIqDDBErIdx7Qmt3UNYpq8wN9eduQJwW7XslvMK7wwW
         LXal8iPtGLKS369gaQkplYFrausuDH+zx2jRTmo89Ga3bKVei5O2FVaTv0EhFWEyfG/1
         Fo9w==
X-Forwarded-Encrypted: i=1; AL+hErEFCGdz0IZDUPrD/Masm/mcUAmMQ01cNZcAPctgUPpfbioWz02ANl3qRWHn2K9aM6uwPO6+UILlk5SK@vger.kernel.org
X-Gm-Message-State: APuU4Z9RYCy4UppLlcGczEdVmoD2OQaeGNihzAZiiFrN9deASqDBFhbC
	vpIK8ILEVdX3NHaNmdT6yfTJfQF5qrKdIdic6SzApjDt/efJ422b/ce0
X-Gm-Gg: AZFdTZeimjBqFGnXVE/EyNJpoY5laMlPhsHHgznyZLzYJaW9qPXPOJQGxtF7LGI3Teh
	Twb5V0zyLHa/K95Cxmcc5Ot272NZarrNKc3y51G/o7+2nNzdo/oMjwPS9KcVLmXEd9l8ZVK66Tv
	HX4L52hkRHqGfToMZbEU/dlCL0geiyht9YVV/tmaA5uMHsjXBf34rypys/hJJ8XxNDzfiA/OgNv
	Vk3BcUT7C3fMM7bJ3bnZ1k5it54zSb8cXS1pW8NOq0hUljDhb5BJaGdPXJs32JqIkTgMYzw4Tyd
	lvfksHCOIwNeWuNTA6xFQwqiutsNldYuvA9ih/8ROw7A8ZAzgH4Z55GflSLR9Fjn8NuCopQjvaS
	h8+CfPH1q9Dagb75PEP9SLgpwkw8NStcVNiaH/vEQZw6PA7VmdiGxUDSb6jqqjMEusw+IijCA+U
	5ZEhiNThVu52918D1V4AicEAyb1/gK4SFbjKKy3GFdP+Q+406m9MpRhsAK2pewf1wAq5RKGnw8l
	e7EDHO2nv5MKg8uejIA2gyQZipI6W9p3ETIVeJpYV2KYSVKHsImuJxka+0Wo0t2jYEqz/Mt/cWQ
	NOCeFW9maq87zRqHfH2Kz+RFjJb5gV5jsMDVenqWCfiL
X-Received: by 2002:a05:600c:1549:b0:4bb:741d:ea8 with SMTP id 5b1f17b1804b1-4bb8880ad4amr192535855e9.7.1795375152884;
        Sun, 22 Nov 2026 11:19:12 -0800 (PST)
Received: from cachyos-x8664.aetlocal ([2001:bb6:e78e:9100:cdb3:c7ee:74a4:5189])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c4353d6sm17465595f8f.56.2026.11.22.11.19.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 11:19:11 -0800 (PST)
From: Mervyn Pretorius <mervynpretorius.oss@gmail.com>
To: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andi Shyti <andi.shyti@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Min Lin <linmin@eswincomputing.com>,
	Yulin Lu <luyulin@eswincomputing.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Darshan Prajapati <darshan.prajapati@einfochips.com>,
	Pritesh Patel <pritesh.patel@einfochips.com>
Subject: Re: [PATCH v5 4/7] riscv: dts: eswin: add hsp bus node
Date: Sun, 22 Nov 2026 19:19:10 +0000
Message-ID: <20261122191910.2184037-1-mervynpretorius.oss@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261015125454.1381941-5-pinkesh.vaghela@einfochips.com>
References: <20261015125454.1381941-1-pinkesh.vaghela@einfochips.com> <20261015125454.1381941-5-pinkesh.vaghela@einfochips.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Tested on a DeepComputing FML13V03 (EIC7702X), on top of v7.4-rc3;
details in my reply to the cover letter.

Tested-by: Mervyn Pretorius <mervynpretorius.oss@gmail.com>
