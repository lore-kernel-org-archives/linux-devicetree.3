Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795503627;
	b=Fq5oN4NssphX3qboCevvMJeAk+vgV8ltCz0UMXMlGnP3jLZeB2DxtoVkROpmCialDZqt
	 qf7y2ZZidFMdz3JRSQvUVS73Tnp8tcb5DPFaGXwWNsaaU48hS+buvsFg04dJCMsa7NND6
	 NRKCTD9wm8FEqCwk3yjp9de87OZyyYvH7Zm0wGOeUedgjCZe0E9T3K7crekPPqAPzETz8
	 ett2fgAwPgnM4pxRrb31VxbeQDg2mvEShHfms7+cdt/iLwaDi1M3QIrW61DdVCLVA/INc
	 VHMcbtQXvs5tV22G24WaLdPTFQ3/aP3iVzL8NHt8xTP/o0haa2pIxSSY3c4V9jIVQ7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795503627;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 Content-Transfer-Encoding:MIME-Version:Content-Type;
	bh=s/NHlIq3UE1brmYtkqJh/mfk9i/Bh0D5vF4cK6kPHqY=;
	b=DpWX0zYXCvjrYYqFDXyIapCtgYWGkfD4sb3xlsTV19McDlF2LjH1/5cclu2CbBBlVGX9
	 RtcPr/ORL5MXQuj3M46puzY+m9axTzpeXc/kYrwNd5ZX7WKstiNq28DBGF7zUBhG6XotO
	 9S9dYau9RCAko3choFxzm5ivRmvavGLO5sPBAdwZlV+UMYl8xu6qCm5KaF4f+IPsI6LbS
	 Oc25jb3Y8pn2zvKz7sDnWZZKt3f+7mNqHl/Tx7OAMyQbOHs7xL2ivdKyIW0uoBBUnGRM0
	 kCnnPAXTk+HxoA6H1ZZNbBWui6qTcxItzNvfRZky5Uz6n+sD6COHeMFBeqXKLdjdQiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Gkbg+gCr;
	arc=none smtp.remote-ip=209.85.167.51
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95D04606A32C
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 07:00:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95D04606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Gkbg+gCr
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5bccecba199so3953170e87.1
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 23:00:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795503626; x=1796108426; darn=vger.kernel.org;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s/NHlIq3UE1brmYtkqJh/mfk9i/Bh0D5vF4cK6kPHqY=;
        b=Gkbg+gCrbNN3WNgHhi0uF+8i2d7zwOXPgd9yVLZvjD7rxu9P5JeYcbwXcMSyngmxED
         piEUN9osN5BF/fOSx9HZvpLP2t+3P6z7s1p2UXXbrBC0sYY3Ee73LIgXzpOwlPZhgu2V
         6WAqcUqZH0VFmHW81tjVS7UIoCmSXkjpRznEDcbRECjyvVf0DcU3cohcGQuT53Z3D8HC
         iPUS33qsaKBSDlvZ58/yAqUFs/8KJuvkGUZLceRrOCBS+5VM4kTqpv7wJrNUHxljW+9Z
         rGPuHfTNZj124G/RtcA1Unk59fijky3CIzK0AmF2ngpVc6nGAvcolqzzX7edVnmiIbtN
         WBaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795503626; x=1796108426;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s/NHlIq3UE1brmYtkqJh/mfk9i/Bh0D5vF4cK6kPHqY=;
        b=HYOBVC+a/ZGFJF5R4GWOohM4J39XiWDUZGuEi8rk+ZtPD88K9F1S8iytozVEfsmrVr
         OdvVZ0xDLlNXQL2UFCZ9g7snAQ1PnL8PS/nighbgMxvW0LYEMJuH5+oRelXZaClGCMvD
         jYbc8gXh49ODGL5xdO83NNFtceKYuH7rgOKiOPGzEBimQD39R48hUuIbZHCBWdkgqoNn
         b1r+rOMnxre3OWX0S3L2hwjWBbpkkWfDyWNAKJYrlrjJ1kmaovQC+fLctafqPVv2tUuc
         0nxer9IcoTgbzkcNGuAW2FlYcok1iz0sh1g0NsTq1mrcFTPGhuDmOfIVBMmxsqI6zlsX
         qxOA==
X-Forwarded-Encrypted: i=1; AL+hErHWYyFgUxBySGfljXBwEtiYB1MQGSzDWnZnPMIQ30GsGw8VAAtOnHt0W2Xa7ZiU/ms5tW9nQHlC2hgS@vger.kernel.org
X-Gm-Message-State: APuU4Z+onwTGHcrkIyGztnkkZzRnh/TGOZbxbH4stziTSeMw9Xyc9osU
	A5pzewo6WnVtin4d//RBi8HAACLvtqg3DRMHV552qPTiGAcIFDSVgzRV
X-Gm-Gg: AZFdTZdg4TZBKj/m4EV4d8F3AK5F3rvxlVwv6ajkBIz5z7VM55QMnvQwAeoQmqeEM8s
	+vGVQQ8JJY6NH1iGDPIlm7iGECNC3aHJWVbdDFWpGFd+igbfyw6+A2wq/r9ApGu0gx/tO1Ncnjw
	98Ji3+gX8lKq80kKx8xC4kSDtmw9v5xYktrFErMJZQ4FylUx7UC3CvYHWUyYAHx+TjzzGlXeBXX
	Det2AK1NwiQ69805N1r+o9C4TEGkR/4QOVogb4mVAMSgTrar9gH7/BNfQkyn5ysECqAdbdJBUjP
	AGNnIJVi7bDZqqnAOgXJ3Qwgal23IIcHzVzlL5LOd7msIxixGArRh90QXgfxaTbJVjMk2EgvzqG
	iE3IlqeFuNrPeXDaare9Dg9Cf3sRX27vHQlgYJEZO4bGscq/BCtDtOnRqcNL4wTO0uzF0/MQ155
	zyB87GbUJHxlWUbBmOLL+MyPTyAVWpmdPiOQYF8SS9aLfFth8OaW+2p1OLOm+FxFFAvJA2GW+vt
	kjJXklKW7CnNDx6vOO5joLW7IGDmqPs1O6s8lkICubRZe6CxzW5n+CAe2QjpImncit/mpxCDKqe
	og7nLgTAkra+vWcvsFXk1WELD29vzy3OFmxn5T/qKOzNnEX+kDLeQ4k=
X-Received: by 2002:a05:6512:23a9:b0:5c1:ac60:14fc with SMTP id 2adb3069b0e04-5c1bc7c2ad1mr4864356e87.19.1795503625540;
        Mon, 23 Nov 2026 23:00:25 -0800 (PST)
Received: from [127.0.1.1] (ip-024-180.users.dtel.ru. [91.210.24.180])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bcf33b5csm3615530e87.8.2026.11.23.23.00.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 23:00:24 -0800 (PST)
From: Fil Dunsky <filipp.dunsky@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 linux-gpio@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/5] dt-bindings: soc: Add Cortina Systems CS7542
 global control block
In-Reply-To: <7bce0280-704e-42ce-ba65-d3ab369bc20c@kernel.org>
References: <20261123-cs7542-syscon-v3-0-f1c07a1703f8@gmail.com>
 <20261123-cs7542-syscon-v3-1-f1c07a1703f8@gmail.com>
 <7bce0280-704e-42ce-ba65-d3ab369bc20c@kernel.org>
Date: Tue, 24 Nov 2026 09:58:48 +0300
Message-ID: <179550352883.4.9894258481538485863@gmail.com>
Content-Transfer-Encoding: 8bit
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format="fixed"

Hi Krzysztof,

Understood, and sorry for the rapid rerolls. I should have left time for
review instead of posting v2/v3 while the earlier series was still being
reviewed. I will collect the remaining feedback and avoid another
immediate reroll. Follow-up fixes will stay in the preparation branches
meanwhile.

Thanks,
Fil

