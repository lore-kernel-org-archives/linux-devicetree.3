Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795518179;
	b=L8LTwm54yQf6QYeLZAtg1j+F2VLtBAXIS95/r8yuFTGsN1sDvTTlkA2VXFJxEyMWya+0
	 dUErR4WyWab08dwwenpevPrH7sR5EamI2T5fjl9m8FBGNrRlzkJbIH7Y3+UNZFhPEeErI
	 DTB0KC7sLDd2AedBPaa+rcQDVC+Vk0x/mu0Fqaz/mOAs7lL0AEiMWuOCOt+Cv2FVj7SA7
	 JLT6/qQAXiFs3PRVRqR8J0scc3VdElC1KG2zXOSx11wkXTF9Zc+lagk5hn7MEz1tSc62O
	 QZFCSVzpfylieaTXQua6wAr9ImrfND0zoGVv/VOLn/ExFcnOQ7/v0bD2cwvipkzwC/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795518179;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=mkjJrkqN7PSqt35Slo7/CrqzZ7y1RXzaSbB1kKd5fBw=;
	b=wsY0qcfQ+KZ8DCZIRJ9hdStgahoeojoAUINYKAQOifMm3mGLvAiAa9mCzpc+i/1qlKlp
	 HTwzY6m93rRO1N78q+9kVOMm4WsiTm77Pgoq+ipGP7JbXolF3FCCHfPDMN0BgO5FGWbjg
	 0QuLdh2OXSw2Vvhjb0NBwYAftU5houqDhd8tZjzkUR+9vFr3bE8fzl+wNtQ7hUu0oCugd
	 fUhYJXkj3eVbpV8+NyN0Ir/EbC9jv+KOoOpIeCjm6GCILTgFt/kp5QB25AwL/dzjn8+Y8
	 UhyuoZGOmmXr6rlut1nsgFO6Oue9w8CJnyFpPsQDxXOls2KCtNbPmJWNVKdtvh/coyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Wb8zRea/";
	arc=none smtp.remote-ip=209.85.217.48
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A659606A322
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 11:02:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A659606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Wb8zRea/
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-7cc0ccc2fddso1565943137.1
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 03:02:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795518178; x=1796122978; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mkjJrkqN7PSqt35Slo7/CrqzZ7y1RXzaSbB1kKd5fBw=;
        b=Wb8zRea/Uk89t4+0eAHLNr3Cr6gX/61QeaQp258Tm7Esv2rsyneDZboZYWCdKpvA/o
         FrbFbyuQJ//Vmvdo0t9X+XcsS+0ztejEO2er5TkJ46I/8d6w8gRKw6O+YY2ixzEpsTzD
         WfHOtyzjSLX4LeoBtjXk4sCYQwukz+8SLm5Zs31HoGpKyRyB3EHSG3YI2vw5WyJhlVQS
         1GB3nm1COkBpJsu5iLGIwL0xl3UNuUz4TgHjJ/CBhd7NYGhNZNH9qMFV1CgdU7rv5tKP
         whwDkmhQBdtUziwMUDsrK+f3nh07MJ/51ySatl2NTARQaVOBIQ5kmOgod7XcfL0cz+wM
         S51A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795518178; x=1796122978;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mkjJrkqN7PSqt35Slo7/CrqzZ7y1RXzaSbB1kKd5fBw=;
        b=jf8xU20BytIfMNyQyyTomI6DBt0MnA7TAWjjpwwvnG8gmzeC99ru3yTTblW4iaaaH3
         knEtQrJO8SQ4/VN7yonn+o4/L+fqFi7RGQnW4Uhu5l6CA6b/q8NM3vuM9lmC3Rdu/CIH
         yAk5zMACIXW4spodH2UrSqDbjC/E2afTVXrwpM/2Ul4QPFl3fffbc7YdAw2te2PvnoTD
         xNAOFWIuaGRBcPZ2h6ARsQwTsQSyQCPAYtY3HObo256q90yuOETonLAUz5Z6gdPkTbCn
         y+lejbeNRsJhJOojFVINzcEys8bOFwMJa/SrOjT2bsMi5XJZnYQCjP3wuCFUHgEg4eBj
         Te9w==
X-Forwarded-Encrypted: i=1; AL+hErG4CmNz4O8Jm8uOVSihrcqS7HFIaDA2IsFHk4P6bCQ794nCvLnIB/QaM8NAI7FSWLxPc7f0YlZyTxAN@vger.kernel.org
X-Gm-Message-State: APuU4Z9XgCbnTPCLZDOzNn10E3/sSRSfkABI03MidFK+R2MLVY47O5Hr
	q6nRwV6CUz5zfSeDPYpYjVqzoJ46EHLRLLBivy4PrV+yzhtCO34VMRhw
X-Gm-Gg: AZFdTZf3fNetb5gu051JNWiDFCgu92qv48audgIckRzIiGyTadct/BopJnu1t5Rnly/
	E0Vm7Ei77ZbrX1vl3tvyPmpGdsDXb5/3P6ukVGaEQeKElH+JsRbCslcidwlia+LSagb03wGF06i
	TIMTdgX/m7Z+n9ohe2AJwErl+Gfamyhr3exVuX2WDmi3n89Jki8Ay+Xu6z/DxI+0dAKrSRqkofe
	BA6I9hK1VbAkyAKQ1vYstIsJZ02IdWjD2FmQ73Y3MBgO+8lV8fv2D+0Vaz1orhdWFVRSmKR6gxM
	lerVvtXuAaiykpG0xsmN2o6ebGf5cvnQ+Y40ahse5UETJxCKtxBgFSfsHb4+LdECjMIxy+ICwPK
	obah9I7pPzZRei1Xq366TVxUXgTci+3pPnWjquV5zqIGj6GIdZvxfmHsYJY5PF58ZzrBN9aWEJz
	frw/nvQSwJKimpNRkJ0QYHXrAXBY+rTX4zofvLytmrpF/8+V0dr5B2Bzr4za+LWVRNLEwldXoNT
	V57SK697bI94/j0m6slEU+PBZdTCiar+8yLuZ71+EO5D+Acn4U3/j7p2Rp6HMQJE7wVI6fjzqT+
	ZMNeZ/9hbDTY7Vk1XrJl0RlV2Aac/0XoGWmj2r5sI913Kxtl+UGvf9uAIHD/v3vVf4CtbO+ExI1
	T1X1YSRHhT0XHJWmTFO90GawzDVDPrTEDTCpAtorYJMJCJKxQ
X-Received: by 2002:a05:6102:54a8:b0:7d6:56d3:f179 with SMTP id ada2fe7eead31-7d72b361a74mr6083753137.5.1795518177851;
        Tue, 24 Nov 2026 03:02:57 -0800 (PST)
Received: from localhost.localdomain ([2804:1b2:aa42:30d0:da53:c2d8:5b4f:38c1])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d6e8265e55sm14978477137.11.2026.11.24.03.02.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 03:02:57 -0800 (PST)
From: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
To: Enzo Adriano <enzo.adriano.code@gmail.com>
Cc: Andre Przywara <andre.przywara@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Junhui Liu <junhui.liu@pigmoral.tech>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Pablo Mazzini <pmazzini@gmail.com>,
	Alexander Sverdlin <alex@sverdlin.org>,
	Jun Yan <jerrysteve1101@gmail.com>,
	Lukas Schmid <lukas.schmid@netcube.li>
Subject: Re: [PATCH v5 2/3] arm64: dts: allwinner: add A733 SoC description
Date: Tue, 24 Nov 2026 08:02:31 -0300
Message-ID: <20261124110231.15528-1-vinicius.eduardo.pedrosa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261121-a733-cubie-a7s-dt-v5-2@gmail.com>
References: <20261121-a733-cubie-a7s-dt-v5-0@gmail.com> <20261121-a733-cubie-a7s-dt-v5-2@gmail.com>
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

Tested-by: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com> # Radxa Cubie A7Z V1.11

I tested this dtsi with my A7Z board DT on a v7.4-rc1 lab kernel with
some of the posted dependencies and a local pinctrl fix, not the full
list from the cover letter.

All eight CPUs came up, both A55 and A76 PMUs registered, the PPI
partitions were recognized and sysfs shows one cluster. MMC0 ran at
3.3 V and 50 MHz, and a read of its first partition matched the
reference SHA-256. Two card-detect hotplug cycles worked with
GPIO_PULL_UP and the local EINT-mux fix.

I haven't tested the new I2C0 PG8/PG9 pins, PMU counting, EL2
interrupts, ITS/MSI or the A7S board DTS.

Thanks,
Vinicius
