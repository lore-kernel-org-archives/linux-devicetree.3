Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793850629;
	b=HEb58IKcF9nRlTifkYE06dZT2UlWq4YTpqYso9M6isLAkbxeUGkNX8sYj+T28Lxo8hWA
	 j0+beQicUoVnRmKpjIGYMNTTbU46Mnwh/FPaVH9mjCPcvwarwO3NmFA67yf/KOQjcQ8i5
	 ST141mLcXv0czCg3VYn55u2gEDkZGBFNWrcOhpGoqgc9s8iG+N8ksPyx1VZ5VNw2915Mm
	 Al1mv6IgXcpWjD52XUNtYifr4oYEs4qhRxZxHpWzUVr8yllseCklg4YNOtKdfvPM+VO2k
	 DT9vGclSyhJa8XXoI8GriIOkY9cwdUSEbRo9iQKFFuvEYSxwcynsJBC+ObZwyyNQMWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793850629;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=FTQt/DKzExkg2Hajv9Ngnf1BFMIHptWE7Rva4W1+tQA=;
	b=bVS98DrxbhxBxr+9MtpVX8lE22UOrrysiOVg0ogvzefZn0yJPRHqKj4cCZYpDtDTXOAV
	 DNAikGejVZ9lGMDs5lhUktZOU9PRT1AR5bfOKuN5ME82F+sTRSHvzPS17yIrAIkyzLRiO
	 p2faQonIvL6JHhNDftR3rGBRmw6nL0EOiARxF+ZMpxaXudtMLS6O5MWNfdDvuJuzdhe0T
	 vLx7c4nPtTbJt67209eTRLxN+MpYropwBgxKqPfu6DKT64e0v0DUOHtmcL5nCoLunmC/6
	 PL6j+M03Jd9Eze+Xt7po/Yg5kj/Eq8OEGx4zVSUGDBAAyDpQ2JrNd3JaVXIbgYnbzGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=reznichenko.net;
	spf=none smtp.mailfrom=dpplabs.com;
	dkim=pass header.d=reznichenko.net header.i=@reznichenko.net header.a=rsa-sha256 header.s=google header.b=XhTSqVuP;
	arc=none smtp.remote-ip=209.85.214.172
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEAF9606A32E
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 03:50:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DEAF9606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=reznichenko.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dpplabs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=reznichenko.net header.i=@reznichenko.net header.a=rsa-sha256 header.s=google header.b=XhTSqVuP
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2e60f9af6e6so14165635ad.3
        for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 19:50:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=reznichenko.net; s=google; t=1793850628; x=1794455428; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FTQt/DKzExkg2Hajv9Ngnf1BFMIHptWE7Rva4W1+tQA=;
        b=XhTSqVuP6b7wmG3fCST5e6yEpNUMui+C4gZ9yAqbx7VgdY58JLigd2gj0n8nc7+lh1
         obKGkywYM8Csp3aZbaf3JSSaAkvnAVN0hz5BTpMZtpvn9pc6P+8Luft6bldOCd6DLsVl
         OWJo2PYnmY4AfyreJbgw5mjLOAwRWtlKIEQ/63GY13wRDUR4P1emC0L9V+ahc2kngu5F
         9GuPDIzqKzW426v9ZYrN/wiGxpzOvDKFMO6UduJocp/En34Q+d1Oyr9jBgPiEwHCzw4R
         0i99Wc5zlMx9mLPR0YHTKsAxU5rnZmagkUs5y/V9d/5Px7pdwABSYs09fMCVH73uW7rG
         SNVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793850628; x=1794455428;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FTQt/DKzExkg2Hajv9Ngnf1BFMIHptWE7Rva4W1+tQA=;
        b=GeArcf6jtfovy3Edy5+bF8+8O8IRMI7iYFN7fESk6EDuKXTNMTxXdXCmY8QIW7wRKD
         ilJePJM7knkiIysfwmx54Rgv8MdxzWTDkt14zJV5j/Egtd9EL2QTjjdxjz1jdM94wRWN
         wXpLU9LKrDHUrTZrS2xhODd1JQan/hmfejb5Vqw/ygZKGWPWeWAkDoTtOwVhYAPq0Ogu
         pbMhVND2xhIuWtzDFcrpEwAqA38lcCZ8C/ujfsLzv1WKDP7nKJV+kZSUXif7RS8eBlwN
         6CB2Un0qw0I6GLYZyHckPB+skDSg/gQib1hh+NcWpwK1OetrpU7kbPi/2/1Fm6ErtPoT
         SOyQ==
X-Forwarded-Encrypted: i=1; AKwUvByhT3zfEYjyOPJzVZbLh8VxTeFiiFwzYCj7nUoolrleyco4d72IC4q/tx9vIYUXFL2bkmOIOmSWbCvA@vger.kernel.org
X-Gm-Message-State: APuU4Z8tqLLRF1YYumcCr2Qnj2R469wE+O1mrarNBF+ziEka5pL266u5
	9yie4h2RYez0HxR2MUe4nDhmP1fIk24arv+Bl/l/EvMRQlqVFWZWChtRJn44dYucRMI=
X-Gm-Gg: AYBFou0PKjwqf8sT+kUjAOpN0dYJmu/C7bn2Ld+tIm05EqJfLzOj7NYi6nJLu5XneHd
	oWHwXkzf01mj1ZeUyNa701jlQXrulzvfGEkqgns9V/n4t8cGUFEhNKOsAmwPbZFxLox9/69LgW0
	xyzDV16MpBwc+AYSpf8gJjbB59FNx4JGvTeYQ6SPQhJt5NrWmASc0CfOlgF3ZHcBrMRAxzGqtW+
	ibMrFb1FjgcyfCcDsHgkZBksmZpc7BauihDZAhVzQQtBvY8RrOOEV88GtSCMzfykcgzBW6HOK8x
	nKS90cA2JFBrU3PmhjNZBq1kYuru/lmcuOovp0Ok9QWVVoGKgdMwlCxeUtzkn6GpxnLGzc7917U
	UF5BREqasHvquC/NtmeEylyPHMKBwm47pUB/LLpYrgwU0ryh0vyjIzwSN2GhEvFRYZTHu2QJfHg
	ebRGvrjhJga83atvNgnoCoExlfG4qIUBOo6W38VgczJaPu1dX2pjAO+87SY7u9Hgqb4dmnHTC0T
	Z8eXhm2Hn1nKFma+5i89qbSUPeqQc5Pa6gSoVnMCivOZOE77fRExTwp2Ny3s0378mHBCZz0/7ZY
	3zydJoWtjLoa9LtvYXlAUqE=
X-Received: by 2002:a17:902:ec85:b0:2e9:a23b:643d with SMTP id d9443c01a7336-2eb364d253fmr159592395ad.35.1793850628135;
        Wed, 04 Nov 2026 19:50:28 -0800 (PST)
Received: from z440.. ([24.21.231.36])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed09127d9fsm12557955ad.51.2026.11.04.19.50.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 19:50:27 -0800 (PST)
From: Igor Reznichenko <igor@reznichenko.net>
To: romain.tisserand@gmail.com
Cc: airlied@gmail.com,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	igor@reznichenko.net,
	jesszhan0024@gmail.com,
	krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	neil.armstrong@linaro.org,
	robh@kernel.org,
	sashiko-reviews@lists.linux.dev,
	simona@ffwll.ch,
	tzimmermann@suse.de
Subject: Re: [PATCH 3/4] dt-bindings: display: panel: ilitek, ili9488: add the PocketGo S30 panel
Date: Wed,  4 Nov 2026 19:50:25 -0800
Message-ID: <20261105035025.25540-1-igor@reznichenko.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261103110524.2812831-4-romain.tisserand@gmail.com>
References: <20261103110524.2812831-4-romain.tisserand@gmail.com>
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

Reviewed-by: Igor Reznichenko <igor@reznichenko.net>
