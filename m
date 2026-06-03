Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E48973D7D78
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 02:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780452692; cv=none; b=pF1eGodxAZiqx1v2TJcEn/XLjKN31Sb2jA2elnk/ceoEM0qIaGPnky+Lh7Lg+6wzJnPGCq/65peGAF5mRNzYoRgsxd4pgn2wp9vmRKK4NB4kztNOIisNmHKPO+p/f+CBtIjnTbGvcmJspsmhfOq/DfKi02DDuX2+0/XBCnnf0gI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780452692; c=relaxed/simple;
	bh=M6VqlQ++3QGcRoeR5pH8FA1zGjwooUP3N+Uy62I6rlM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IuJ8sllHfjz69emhOkKd8ZSORvHcrlVFNGzYhXO1uS2Or/jwKw5lCbDvSRsr7ambh6UJaQ1AIrl26axqFQIjDT6vXf2/Ku9Peh0zviMkYW4EXktd57kscf+8oB+5YeP3FVWK6SKCYLY1gMZ4LfKf629/P2qT6IhrbhKknETK9Cc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iWIivNEM; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iWIivNEM"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2bf2247e38eso41647375ad.3
        for <devicetree@vger.kernel.org>; Tue, 02 Jun 2026 19:11:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780452690; x=1781057490; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S+L9YaFJ+m4ellFTarKqsN1ZQFZp0gqbz0P+NkIvUIc=;
        b=iWIivNEMdlXQEx4xnvMVTFJfjsdhoqHShFQdnqMRltnGrB3nY+30L6hlcbMpxlGHK1
         QVE5hWD4sVvjXe+QB88AsEqsPRBVFpxT8Xh705WovHt5ptKMQ+19s/EOq13txoeedm9P
         ABnUwjy7Dig5O1QNOuk5QP7UXU0PDyk626eYuMXH0wd1zHUw84b5DJ3/iJXUHP0J6nK6
         yFHJL77jL28zRy4/JnDGhxfKidXu9MOsr2sJhaiCvwPax9nML4LeNQwLH+gxzMMcKO6i
         6Z7PIbcFKqg84kC/zaLKJ+q+vO5fn5pSwQo6TKE8qft2w2HigMWwLHQOkT1K9EA0ns3V
         JB8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780452690; x=1781057490;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=S+L9YaFJ+m4ellFTarKqsN1ZQFZp0gqbz0P+NkIvUIc=;
        b=E7Jge3o4Bc2ow9uO4ElwhJLnaDmV6XEb8KNic7BB1wtuPoEvDmehADmsiYRRyaOoVn
         R3sfYdI+nBsw5DvX0lKMugvE2FLnkR6YSnVV3spQbGOXaB/LZIWDe1GaYxcoDWuJNFoH
         qYSwBSUDcNMPvp7QdVLsurSlWbhUmAYl+1wEVQuGwNrOX4USXIQjNCKyxjHT+2lEMSO2
         rRqRjLdiSD5sHJcqw9ERILP7vBDhqiUGW6QdLf3MTwQgUOOWTaEN0Tv8hITDNnjnhrTl
         Kl/XL4SOt7hAsqE2lzKyiIAVUHRxmOWIU6OvwHYs5qMts+8vWBE0fwkvS4iy1ggHwfBB
         GXSg==
X-Forwarded-Encrypted: i=1; AFNElJ9U87xFohVm1ZEffCkF9UZ/S944Vu7OeISreSp1vb3mdMb+3EcUtGHZ1+nRSWXITJqIM/eBE7jrpTSa@vger.kernel.org
X-Gm-Message-State: AOJu0Yxkz46tT3BiBSBaZyVN7X6egW3rTC9u0X/rQXq7l+nPxx5aTyZD
	bJTgJTKYv9OueVORGjsCOnnLI7mbFtiVBk4XlyyVu0c1io1HBvPHmmDO
X-Gm-Gg: Acq92OFkP5pNtBuXIuhdjVZJOIU/ERIHO2wWzj/K2y3zo1sfkFlrvmSuPHzgVEQhjAK
	GtdMD/Ztox7cA8tNoqoj6rKQa7KI81FZN4gb+EyRc3yz9JmPnwsdRY6LqLgiQanSIIZ0zmyj5lv
	adJgio1MBIeKOIBq+QkCwfvh8SNf1DmPNwnQmnhrnX0mIsXO16B721AGgjLhoD8GleneqBywSq2
	Su6UgRGYzUMHB4pp7ieDCxg86nP7Ls7TEmBoCi+3Mh4nmHz8tuvu/pRzggpqnVeAZXi6TrqG59H
	OR/piMJf/h0DhfoUXh0DOXtCadCZJ8CvoxVEabGPm9I23ctBgyir683+9o6j2zB+YSgPTnwfEvk
	kpWlSkfz47HW728ixr245uBESS0ThkfF/0fNvAhXutguWKbasT9NI3UbupRNOG70OWvFOUG80M1
	+bywWFlcFUPAcNKYcQsw8nlIOIFDRjva0ipA==
X-Received: by 2002:a17:902:e851:b0:2bf:82c:6322 with SMTP id d9443c01a7336-2c1639eded3mr14290625ad.3.1780452690145;
        Tue, 02 Jun 2026 19:11:30 -0700 (PDT)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f70660sm6305885ad.11.2026.06.02.19.11.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 19:11:29 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Thomas Gleixner <tglx@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Icenowy Zheng <zhengxingda@iscas.ac.cn>
Cc: Inochi Amaoto <inochiama@gmail.com>,
	Han Gao <rabenda.cn@gmail.com>,
	Zixian Zeng <sycamoremoon376@gmail.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: dts: sophgo: reduce SG2042 MSI count to 16
Date: Wed,  3 Jun 2026 10:10:49 +0800
Message-ID: <178045263171.227355.8295224665627411486.b4-ty@b4>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260407160143.1182430-1-zhengxingda@iscas.ac.cn>
References: <20260407160143.1182430-1-zhengxingda@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Wed, 08 Apr 2026 00:01:43 +0800, Icenowy Zheng wrote:
> The SG2042 MSI controller has one 32-bit doorbell register, and each bit
> corresponds to an interrupt. At a glance, it seems that the MSI
> controller can support 32 interrupts; however the PCI MSI capability
> only supports 16-bit messages, which makes the high 16 interrupts
> unusable in such way.
> 
> Reduce the MSI count to 16 to prevent producing MSI message values that
> cannot fit 16-bit integers.
> 
> [...]

Applied to for-next, thanks!

[1/1] riscv: dts: sophgo: reduce SG2042 MSI count to 16
      https://github.com/sophgo/linux/commit/903a9364e40563faf4730dc63ad7446246f494ff

Thanks,
Inochi

