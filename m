Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793917484;
	b=43tySkA77lGinf14kl7VvsgUCyaZmV3OLd6g+I0S+EwtAMaCBQWpXocTvc26je/Jd3lH
	 J6pOVsoeAD6to5HZSk3yqgrlKE6WN2y1t1UiSGwEMFfX4/a3pQJt/VAP1SigwHMZUGNeC
	 gXYhKmevGtwox1Lr8K3IFSJYxJxwU0ORbbCbu6zXZAtQkHiOyxEYGW1Z6RnsU71HBWH58
	 fn8Y01uEJ1bhMNQWTh8VWKr6Trdl//cTZ+nVxSYYJcQLR85w8bhRoj2C7lMt1zVeYPfYD
	 IOPtvRszqrl2LfzcNQEXqL6ulRmlVAlKfFnmaPLZE4JxDYfx9+ctUfvunvmFRYJRfYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793917484;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Z9XTrE2yrR3HPAGKN8cfazsOZArS5Wy1dlBvlHzw8y0=;
	b=bCzTkKq0/OaSkIdw1ISsYE4ets7HsHpxsiJK4cK57aaqEvMEWTAV2VwnCNnzX0bMnkAR
	 8JiMfbWsbJMRD+RsFFGvNHGhRey50XMnVf2zcbZ6MDJijxyLb3vcnyYc+EcF2bHCJlQb2
	 MYbEqwnnq7mNWtlRM0Cp8SJm8H+UZtss6Fq6uQi2pUhHwvYEGLFtt6cDeJezhGvVxs8pj
	 385F85gzzaY0Or8DFBtDtQpMM9M8yqxddf0WO5URgQKUIEPvEwR3gaxogBKTbgepc+wEc
	 tgKAypl5EZKXSg1gKaUh41SiH36G9RSGEMoO0pfyG2AEjLIULYUvRE8mJCvLRI8BpVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GnGWqdjO;
	arc=none smtp.remote-ip=209.85.208.49
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72081606A328
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 22:24:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72081606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GnGWqdjO
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6b566cf56c1so2141886a12.2
        for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 14:24:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793917483; x=1794522283; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z9XTrE2yrR3HPAGKN8cfazsOZArS5Wy1dlBvlHzw8y0=;
        b=GnGWqdjOEcjf/+4W8F+F9FVjds3+v932m9PLoYSn38RfJhSVzDzxwCGKWm04TwwmY6
         VxL5eFs9njfpPRpQrH0Y6uCv5kXKpTPOWuNwZk7N+Yr+MMvOnPFCCmv9qskltSEdnJ7q
         geBsjgL0myKHYhfZrQFSev+kBK7WaEBjO64OtPz2GnEun/eIdhSMVeDKOrF/XTFXgKTK
         b7yALxR+N/CVuzhw2sHyro3oh7HpJwXH48xJDWMrLi7LLJ6EDhSy0Xb00kjqM+PJ/fXo
         in6YoOuerlF62CFYLxYfNdcZhs+YnfdJfKBNhqmA6YvGL1WJvucqNPpXQEjArCIoP49u
         Li7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793917483; x=1794522283;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z9XTrE2yrR3HPAGKN8cfazsOZArS5Wy1dlBvlHzw8y0=;
        b=nAPewz9HNMq+Sszfxu9ZLTjM0H7Thv1y9eHoSnHF2ee4wGVWSekNELDMDZXTX7RA49
         GyghQnvOGNV+bTDMHEsq1P83SOT+I3ph4xOlOZwyk2XwoK7p2ptrn766m5/KDJIEp/as
         rzNBdDckw2Yd5B5OpzflJW2eEzRdG8IGTSFkeSfOfS3d/wwzf3/NaXdsBIFlj36n8Cw5
         AqhwfjwGsWL/WFYcdJSTnTj5erxkj5BCsWQ4hVovXtb/HaXqlRx8WcupWR9iNGrbRsll
         uPLc5OSExWd5GCSAQ6zR3YamWZ1qJ9dUnILKsc/puoWTKmPIR2r1bi//EeQjigDbPFIC
         y3Yg==
X-Forwarded-Encrypted: i=1; AKwUvBxHFAyqJql0aM/DJ+oGpJgwVWpPI6gwNVBOUW1jnd3rc04GmrlPmHgf9tztnJRSy3syLLcMoGW5ULY4@vger.kernel.org
X-Gm-Message-State: APuU4Z9HWL7N2yz3Z2zCaudv/Y7bPONCQ4Hjznw1KfEI89jcecMq3wr8
	qhwcu60zfzBvg9YCN+aiDkHsZkJK+QqTJzkVClhsJyykmda9h7qiiASz
X-Gm-Gg: AYBFou0KUNXb7XqXoACU//XkbnERn9uGONCTgDWH0YJ071d/LbdKawreXRNEHysZUNI
	0nN54laEh3r+0uHBEugZp9dy/+wS9BrxbzCxV4fL4DZuVC81so5uBROtSC2mHts7ShtLtby4aVi
	3CPAGmOKWMfvDYFVFAfCaosCYm7yBzDqjVfYWM2Hy45A1ctSYVnCYkf9Kr4K1jmSH614iUnpdNK
	L3gYZpZSowHduF9zAMwcTIyCE2DRzGwqT8NKympgNa8XdMTNhxnAE9KRLuqp56ujmGv4nsOftMM
	raV/IltZm46DBdQrXt4vB4amDoUGnvFfFfBPXn8SYth9q7DvQZQyYxpBzV3EJ2MWkgIhcIiT+dW
	n89pFP+SMG8wWLcC2qQMoK705Cfsm3ZAlxsxAygR3Emsb2kXFIyxXuPecaNBCZ9wb1IfrzbiiXI
	zQzkpR2Zam4fD2KJsYLYYs8XUy0LKWuTbQw/JKgcWF6+T4clgZbSJkApNjL0fbXzBcPsWOq7dVE
	JHVOxG7+MZOekb21VwZMC7PXXqyHpNrGcUo3wNYTsvk+UDD4kZ+dISCkLxeqvk9jDbVBEg8C7Az
	O1drvO+MNtR1b0splQqKbs4NewRCJ/M9ntAE1j4qpPXTmhJpnQ==
X-Received: by 2002:a05:6402:5384:b0:6b4:d7fb:affd with SMTP id 4fb4d7f45d1cf-6b5977de20emr411756a12.12.1793917482391;
        Thu, 05 Nov 2026 14:24:42 -0800 (PST)
Received: from letov ([62.41.24.155])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b55ac57b9csm2103697a12.15.2026.11.05.14.24.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 14:24:41 -0800 (PST)
From: Alexander Letuchiy <asalde.le1@gmail.com>
To: Roman Vivchar <rva333@protonmail.com>
Cc: Alexander Letuchiy <asalde.le1@gmail.com>,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-watchdog@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/5] dt-bindings: watchdog: mediatek,mtk-wdt: Add compatible for MT6895
Date: Fri,  6 Nov 2026 01:24:34 +0300
Message-ID: <20261105222435.571449-1-asalde.le1@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <xUMh3NwVp4cBhFsWWFE2Xng4h8YH95iJM37_I158WAyVmsRCPbirWT1iU8eMFeiSFw8xco0X45o-2NOeB6Jc4_nWAg25pFPgDMwK3mKzm34=@protonmail.com>
References: <xUMh3NwVp4cBhFsWWFE2Xng4h8YH95iJM37_I158WAyVmsRCPbirWT1iU8eMFeiSFw8xco0X45o-2NOeB6Jc4_nWAg25pFPgDMwK3mKzm34=@protonmail.com>
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

Hi Roman,

Thanks for looking.

On Thu, Nov 5, 2026 at 11:50 PM, Roman Vivchar wrote:
> Does mt6895 actually share the same reset layout as mt6589? Given the
> generation leap between these, the former is very unlikely to use
> the same resets.

The vendor kernel for this SoC binds the watchdog with the same
compatible list ("mediatek,mt6895-wdt", "mediatek,mt6589-wdt") at the
same address, and its register definitions are identical to mtk_wdt.c.

The TOPRGU reset layout is the one thing I can't confirm, as I found no
reset table for MT6895 there. This series does not use it: the DT has
no #reset-cells and no consumers. If reset lines are needed later, I
will add a dedicated mt6895_data to the driver.

I also tested the watchdog on the device: while userspace keeps
kicking it, the system stays up, and once the kicks stop the watchdog
resets the board after the timeout.

Best regards,
Alexander
