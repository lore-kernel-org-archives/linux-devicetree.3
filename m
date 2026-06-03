Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EF0243E9D5
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 14:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780495733; cv=none; b=V2R9R6+BVu2NLios9xWUe/i77TnUhLpgxyO9IZ0BeEP5TbWMcwWgEn3BFBBMULjuhzp4/KM+tAkZNrGKigaAj735/crsu3dnNBvYzJGhzQPPn4WMcwxDMmfcugz7HswtMF7uzMxgHsps8MUA8o2Ws3TATLAkSnqCubnMv8pMKhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780495733; c=relaxed/simple;
	bh=L3ZPpwbHa76nNAHfgBqExbWbe/NkLxokXKDlmicbUV4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WVLPDZmNFAEmEo/eBs7nPM31xx+oPLkofXMw8HGltEVyGpSf5Fi8fRpC0w+t1TbGreR7hoze31X+d9Egom78+3HEPrSUjLYFbdGQcmwwjkzAbw1GYNk+Ky6jn5yWIMEwH1psqiQ4xXT2VvzMzCQPbJ6FloXURLJr2EnytKR/huA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IxAMb7SY; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IxAMb7SY"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-beb2a97cc9aso855956166b.2
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 07:08:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780495731; x=1781100531; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L3ZPpwbHa76nNAHfgBqExbWbe/NkLxokXKDlmicbUV4=;
        b=IxAMb7SYZTKP/P44MdIGxBfOc6GgCL8dvL8PiAv1ayGA0vV7W6Njqq9851tgfqXi+R
         24GdM/b5h7J5H5OF/vRV8QNA0FngMsvpTNpqzpvpVdqsByBy2E/V+NzovVU6z/l2Lyij
         JgcBU5OG/D8sPI1u1DAQO1Rm1hPDo2Ihfu91dIGQ/LjgFZEFXuqxng+fUsWMK+BGymHn
         WoPAnSqljl12pqmtvu4x1x2gtsPmG+9WFFxR6G33Ieyf56GswZKjF0RU/HVKUmzoJVOH
         eX2vWV7f3nglDjaKM/iX8zEskjTLR9kzKMz7kQAsUg35JNtqtRFarP/adyuWqZZ4tkpR
         EXzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780495731; x=1781100531;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=L3ZPpwbHa76nNAHfgBqExbWbe/NkLxokXKDlmicbUV4=;
        b=PL1JmbCyuAcJIzYsMzaFc78zTJVxE81xq732QNTAVrjClIyfrizFf4DsqFy2Gip7m0
         1PjoHFZXspJ8Mz/W86r4/tVluuxvYsm+noGx1YDoni9nwCl3dzFdu7qpvjVgAiIgzN0B
         NJRSUluVJqYL20XvguS7tI1AZhL6RiU7KKkeqA5KtNog4k8umHCQBo5apm3m34riUvo9
         92caFav1q2QVg3EtJryZ51PCIQ0gWQLOxUvURlhWb/jmGN7cM7v41IdNw7h1G1YpbML6
         Q5LOWuUIRXRLXASxcC+bcKHSzbl9W4amHi4JnkAbwlduhmOwTuklTMyk2MRJxzGtOaxv
         1VhQ==
X-Forwarded-Encrypted: i=1; AFNElJ8COHDEMVUPp+TUr4qDLn1FPc49SBdO11r6OpUZ8VlozVbd+sZe6fwVtNrqwaU+DrWvXTLVW9zHrZqk@vger.kernel.org
X-Gm-Message-State: AOJu0YxtRaYuhCNyIEaO5ClJ2r1I7VvUuumpivl1Jp5CwfxJnGP4gvkO
	tXW2nP3oCZ8PnTgujEoki2G06YVVNZiC+QBzBGAp3B3O/LXW4wUwyoWx
X-Gm-Gg: Acq92OGVLgzP31S85DLqkGTY5DWoJ3F3vbSzzW/njY4PAYZdyXohAJNFQqZCjnjh6Iz
	3TZHQmbwd7g67YpoaRtdLGJuSq6By5ILWgiPR5FnuPKF8QcPk3/9A7wEq81HwoggudNj8dU76EC
	xC0d7qDRsJULkk7nuReFUAHerH9ovyptGQy9+iVHCYuUO/x1hHAs5qWEmBEm5yeJjNd1UJYB56X
	OFPQEvInpljkAAEUTIiyA0rPdQ8/eWwKDSkdTZfOHzgSjwxfgCnz8hgLFIFfAafxY2qEOfvT2Wh
	JHW5L82WuAHht09UyQkbzBGF0f29y/CjkaKju+G2hZKvHhr8j28ze6omjh30PoIe6e7QOMt7ExN
	lXNDq15Cm3gHxZbK5iaKr6d9Znk3uyIlL4+QPgB8RFyIDoushojCLY3NdQ+vWhgU0WB1BlGdW+m
	PGAS5GRlXd12QgClN+bL+U0ITCZjDg+pZYYUOf51HMRX4/gxw/UFdkFUDj2FDgZBhXzOyMewPoe
	rM5StI=
X-Received: by 2002:a17:907:c10:b0:bd9:2b46:99b0 with SMTP id a640c23a62f3a-bf0b4395c05mr203050166b.49.1780495730961;
        Wed, 03 Jun 2026 07:08:50 -0700 (PDT)
Received: from fedora.embedded.cmblu.dev (p5df027fc.dip0.t-ipconnect.de. [93.240.39.252])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf0559f1ac0sm162062866b.62.2026.06.03.07.08.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 07:08:50 -0700 (PDT)
From: Wadim Mueller <wafgo01@gmail.com>
To: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
Cc: Wadim Mueller <wafgo01@gmail.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Maxwell Doose <m32285159@gmail.com>,
	linux-kernel@vger.kernel.org,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v3 3/3] iio: flow: add Sensirion SLF3S liquid flow sensor driver
Date: Wed,  3 Jun 2026 16:08:34 +0200
Message-ID: <20260602-slf3s-v3-reply-06-wafgo01@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <ahzWI-bQwnQ8ogFL@debian-BULLSEYE-live-builder-AMD64>
References: <20260530205435.37326-1-wafgo01@gmail.com> <20260530205435.37326-4-wafgo01@gmail.com> <ahzWI-bQwnQ8ogFL@debian-BULLSEYE-live-builder-AMD64>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Sun, 31 May 2026 21:45:23 -0300
Marcelo Schmitt <marcelo.schmitt1@gmail.com> wrote:

> Can buf be 6 bytes long? 2 bytes of flow data + 1 CRC + 2 bytes of temp
> + 1 CRC.

Yes. The third word (Byte 7-9 in the datasheet, Table 8) is the signaling
flags: 2 byte flags + 1 CRC. The driver does not use the flags, and the
datasheet says the read can be aborted with a NACK/STOP after the temp
word. So i make buf 6 bytes and read only flow + temp.

Wadim
