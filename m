Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792580408;
	b=R7df8z1mqvlWqjTzxX2IiOVfmar0n+Vmwfpj5zlT04JXRbxYDIRRRcT+KV4lMgfv4UWV
	 LRKrKKeiBChR0ajUpJ9SQJwPy9YSAPRtYopdfpcJT7p+yF+iMnwZQYcU4sGMBm9JILY+3
	 D8EHuyR1P8P2Y8fUlOlvA0VD7JowmFl5OHD9VYA0zNvkKbKdTVPBMu7Z8bPpBxJ4Jp4nK
	 j9Y1ZBJH5OOKFN4t4txhL0xvhz7RIefLcHUQA+eS7b54abayfdBh1qkr7v3laBpFKlTGM
	 h2G/sGEhTsvbO7HllYg5eC5PPVdbh5iGs+U00zLJV7FRqVRAKMB+12VKqJK4GQCIl3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792580408;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=An+ETgbADntwtFKiPu43Mts6liLduZLS5iQIAQ+a5W8=;
	b=Lwuftjsoj71WxHcJORcC6hGKOurBp2Qnvt8wivK0376w1UUQEIjHgxBOizpbcHpN53AC
	 xmoFRhzhDvw0WydlFG7l0N9VntZSXEZYczrJjz6lV34fQEWgSrp1K4oA4AUdaqXoFvYWX
	 O8tAEGOIL4o9+IpZLzHVn/iNaXs/fn3m9irO2hVG00Hnf6flgpX73XYnYEY1aZfTe8bOf
	 puDm0G+OKs3yXZBFmc0pW5LBs7RjAxQD5pTMJQrfWz8dswaeWzsYy4pQjLnXNHc+ykS+K
	 4EhX9vcXg86aHXDisblV80K6Khgj4/jcYlvHNL9ky+W2ekI8mFw7eSdjPJ0LROZIhAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=cD9VTAj5;
	arc=none smtp.remote-ip=209.85.215.179
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67249606A327
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 11:00:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67249606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=cD9VTAj5
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cc4c02ddd62so236088a12.0
        for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 04:00:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792580408; x=1793185208; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=An+ETgbADntwtFKiPu43Mts6liLduZLS5iQIAQ+a5W8=;
        b=cD9VTAj53OPERn37dHuTGUZB4REtJ1I7VzpktNygl/tR2wuIKZ9E6n4EQ94oL/kd9k
         8PakWWnAKJDJ2Nh4TzQBv6fX6/Q1nGDKDjr0Xn2LasBQk8k2VWtlG5nYn836bLakBvLz
         55ZQIwApzttJb2OlV5vPm08MUh1qTO+wx53c0cIlBVelREQvymTN8sdvIE45yD8FQCu6
         vhTvSlM3skR92w4GTAj95bOkHVkafXBkctfpbF3ATYznm5QeKPLB0Npr7QFKEy9yEfux
         J0lQvUii9GJ+pQoxKhi1SqX9iJuiQnc3wNJkP2IdX/CJsuCGT/CcPBbbajWPu8aF4cCm
         FINA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792580408; x=1793185208;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=An+ETgbADntwtFKiPu43Mts6liLduZLS5iQIAQ+a5W8=;
        b=ATjzvshKfKYEGtCS8mze48hWu+vufW+Urc2aMv/n7ZgmN4oF17oq+i/zCbDftscLyt
         d3cQ2mWlYTzfuYwYgcvrieneriB77KpA6ptNouvz8HXyv/o1B6HYHnHUJ9IASovxqDlN
         VQmM15j3bwrWmQPf04/hIBScTvKi+meS+25/4Gki4R+dw3Y+eP/Jxs2l5W8j1ecs1r2X
         eMhqd67kIHpOgFunGaCpDSo4yN3Fh/tNKgUfwKZY/twUPJuiQJFpx65E8XTR+85rzW2x
         mMVAMpRbwJc1kGDM3BdOOPZeoKNoo8QRyK6dItUjKZWIO2IUD/M53bOoSFarViLzSsSR
         +8pg==
X-Forwarded-Encrypted: i=1; AKwUvBwDYTmLN/gE/Y43g095IxlrdGaj29viGurJDa3HeQGsxEh+zuTvJ6rM2flRWcilYUioFpasjTKD75T1@vger.kernel.org
X-Gm-Message-State: AFq9FYIKorUGtScMHBHjq2FobX5fWVxSMumBDW2LnrMYVq2HsZPybZgB
	6UIF/Zqudc6g5xbRTJTYUw9hV4kUg//7fFfCQDgUPLj08bbKN4c+sURgCeYlNp9xPY8=
X-Gm-Gg: AYBFou1BZiKiqxt1JF5cI5HJhg8X2mEhC1aHyEs0EHgh+SGhTmn+IACRFMx6z0KCfi2
	HyMT6iG0U8m0Lv40u8g5Kn0b19Zk1KVFHC3tFPaBmKGN0OmJVW0wZwjhuoDTyC0ZIVAUadzHJq8
	9afNAcDSK2/z+SWVSu0Occ/60c1PnAEYxU5uiakQNSlN0HLiQ1kqwUmguGX22MnfQK2CSej8Ors
	PaupvtmNM7HsY3aO/biv+TPOhd006npZJeXuN/uwFeQvz1nV9UsCapiIjg4RWhpoCd8iRvr1YK/
	QpI7xp7Cdk0V4Z7f7snBfQWsHaXh855l/OhThkjbR16dspj6djcLVOLhiZgtVExhVsS0wycVPPp
	k+8v0mAIxADnzwVDVCM6jOlE7tlVWeOzxj3WpyvZaGHI6RcHP3zDkLwtmMTztiBvjC61PxUKqbS
	FF0UCNE4vf01/TlxFeBfq7H5MjjHIq4f73+7xLoF63m1bD1+ShENyZIOf0vlDzg7tUuQwmvD6no
	oYyRAflvwal0vfV4LdLTOCKL7JQ+NoEoP4jdsrpsrNj4fll7o3lVN2T/KctcpuTB023PIkWpMsW
	pcoxw5zawUU42K3CtXR4YQjLd56vmg1OffPrLfLo0moXi2lDLhSxzHReFXhY6dHGGfnLYBLodQ4
	ys8nDKiC5vAaeoeD+oVFU4CakhNGz1rJJ7jg=
X-Received: by 2002:a05:6300:210e:b0:3d3:ae1f:d7f8 with SMTP id adf61e73a8af0-3e287df515emr1543449637.24.1792580407543;
        Wed, 21 Oct 2026 04:00:07 -0700 (PDT)
Received: from alanhc-14700.tailb22ec2.ts.net (180-177-138-120.dynamic.kbronet.com.tw. [180.177.138.120])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd6a85c6fbesm656992a12.11.2026.10.21.04.00.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 04:00:06 -0700 (PDT)
From: Hung-Chun Tseng <alan.tseng.cs@gmail.com>
To: Yixun Lan <dlan@kernel.org>
Cc: E Shattow <e@freeshell.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] riscv: dts: spacemit: mark K1 board boot devices bootph-pre-ram
Date: Wed, 21 Oct 2026 18:59:59 +0800
Message-ID: <20261021110001.2905669-1-alan.tseng.cs@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261021083425-GKA125937@kernel.org>
References: <20261017180141.3477743-3-alan.tseng.cs@gmail.com> <13d6926f-f085-4214-8051-7bf7b5d92b67@freeshell.de> <20261019141752.2077207-1-alan.tseng.cs@gmail.com> <20261021083425-GKA125937@kernel.org>
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

Hi Yixun,

Yixun Lan wrote:
> but for bootph-pre-ram, isn't it about the DT nodes which needed before DDR
> initialization in SPL stage, and should have nothing to do with BootROM?

Thanks for checking with the vendor. I agree, the schema defines it as
"the phase that sets up SDRAM".

I also need to correct what I said earlier: the EEPROM is not only
used to tell the boards apart. It also holds the board's DRAM
configuration (number of chip selects, data rate and DDR type), which
has to be read before DRAM can be trained [1].

So in v3 I'd like to keep the i2c2 and EEPROM tags, and also tag the
EEPROM on the OrangePi RV2 and R2S, which I missed in v2.

E, does that address your concern?

[1] board/spacemit/k1/spl.c in U-Boot, ddr_early_init() -> read_ddr_info()

Thanks,
Hung-Chun
