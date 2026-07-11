Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D01C353A61
	for <devicetree@vger.kernel.org>; Sat, 11 Jul 2026 11:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783770009; cv=none; b=Q67gHhY2S4Nhn4Ow93q82azuQl+c0Yd50BqNdk2C3aLShmlA9i36ERVqC0UigEIqwO9rO2V/eUOwbqeYvdvvfIQO0MU1wcQzQBoCTZNcwUAGofHfi65VDWhzHirlui9LwZW8HCCsG+dsPsPIx14hsXHD06UiYEGPLEro1YW4ChQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783770009; c=relaxed/simple;
	bh=3+bmWam2Mg+1DChzKEqedzrXK0RkseN6c6pm2NsFuGM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lsxw5wYx4Qk6a51R34goEGqhxC47Lw2rasnQH7XS3lBUtlKaRf1UUPVJNBzIajHHdzZyFKFLDeyqzBU4d3Kf9tTS9wb0JNptIM5bdfk4D808EFacMjDiDw1PK0gbDYlW0xvnhSmm047DO0vveIRlNNEzmGnBHPlJOexSI0IW0H4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RXNd4KDH; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RXNd4KDH"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-493bfe9f886so8685475e9.0
        for <devicetree@vger.kernel.org>; Sat, 11 Jul 2026 04:40:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783770007; x=1784374807; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3+bmWam2Mg+1DChzKEqedzrXK0RkseN6c6pm2NsFuGM=;
        b=RXNd4KDHyCCwlLIbPBKVoD3jDiP4+EDcnZb5Zb3o8d0D5+AVh0p8GMskSLeBucoXzx
         yGiQrso+de7I9d069g2br2zsM1r7jqYPLcXbTsFFjgKUrl/pY/5lBWqHntIk/G6CW1MX
         /7R0jqj4T9BRkPo6kcA1r5Atuc2FxXceWKVWR4V5DfgCI3rtYIV4E15uTjwExlgDtEt0
         SmGMw4G2nCQrXKLUcsuRU/MZ6aD2KRi+ptN3Und/yjqmJbFFxg3xKdhVU5Q6ukQkRI2x
         Hmko5nJjk7cziXP5MsUF1dQB2uCCLQmWmxa0/fOpZxHJpU/l2AzlOzA0nUgCpYziv4uV
         VBeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783770007; x=1784374807;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3+bmWam2Mg+1DChzKEqedzrXK0RkseN6c6pm2NsFuGM=;
        b=mNnGe3E7sygf+fNyX0Ztrs3PXgsqBJhyrhaY1OGWJuOxvhCqNAn9FdJIOQeTFLVx3C
         98GmxBMT+c42EHD0rloKdQjOSGfOZ1uQRpPK8ByghRgxEDgONOGCArCXYDSIYM5EMYKq
         u13dAc3l5Se1JQ1LlzEeRXPE84WI849kkxjPFDE6azbCcMuh/vWI61wScb6WAdCwBHkN
         vF+By5gjtM3Xuk84m6982yzzmp3vHfLaNsJNYc8EIaDom/vl5WzHWuuIIK/za7arZKXy
         fYTzsmTM3/46qMH7kgsN5inRI4bfy8qNS6VHns9vDXTJ+m0vSdUztGg2x16Lmdc1rk3E
         CHeA==
X-Forwarded-Encrypted: i=1; AHgh+RqdSJbdeC80YooukXNxvnSQDOnGsNQrIG+5msHhEWkxYIK3XS9ISupLozijIsPpc09X/0NMn21odWk2@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9rjkWiOCoe0BYMZrwb2J9zQgL02D3jJTTxwE0dP0jqIMmbEZT
	WnNzZP67YLJvkthKImdEZgLKKk16QQ+bPQQjkz7sSRfFuU1UbDtfUTuPHQBAs8Ou9hs=
X-Gm-Gg: AfdE7cmDjpY34P/ooCLI5cAHwlVAF69Zdr6SawbSY46075tx40wtp1FFtIX114bE9me
	yIrLCXlJrHyqX7ohXIVyDWATWvyOKcl2KzBDYN4MG/IqAVbEcg360OBb6UoKPbVGZIBeMqS5qRd
	pjTxwLqmgiQU6gIalCfXFfcfkAQPtGKsLRel2T6sj0G+8CKiZMLsWwxNZ7dvrsgeoE4FVvhKXJq
	SKlFZ36dlCi5vto16lkc7mf048GIUYQyV+SA9CivztI/02NkjmLrBXK9kYf5+DVswa9xypOKyvw
	6McfmPuClnodSISCdpWYYxAx+BZDxsKuMpaJ8s9lpFW7cnTvZTQiZl8poRg6ROYDYWz1Eha2igs
	AaAd4o1mni/WhY2a9EOxOOMPFvr6rS7r8EeXdqOJJiINolUaBirSmaNdHDJ3iQyCxMBgK8P13j+
	FaD1iu0N6+RUCxD1klVfS5qNTNP2Vo
X-Received: by 2002:a05:600c:37cf:b0:493:c4e1:40a6 with SMTP id 5b1f17b1804b1-493f882e97fmr20363055e9.32.1783770006780;
        Sat, 11 Jul 2026 04:40:06 -0700 (PDT)
Received: from unknown.tail46804.ts.net ([2a02:b027:11:e106:f973:a70:bd1e:4000])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-493f2e0eff1sm84510965e9.0.2026.07.11.04.40.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 04:40:04 -0700 (PDT)
From: Gianluca Boiano <morf3089@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Gianluca Boiano <morf3089@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/2] dt-bindings: sound: add Texas Instruments TAS2557
Date: Sat, 11 Jul 2026 13:39:53 +0200
Message-ID: <20260711113956.72582-1-morf3089@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <a79fe709-6949-4f73-8f97-6d02e1ee9d78@sirena.org.uk>
References: <a79fe709-6949-4f73-8f97-6d02e1ee9d78@sirena.org.uk>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> Please submit patches using subject lines reflecting the style for the
> subsystem [...] There's no need to resubmit to fix this alone.

Noted, will match it from v2 onward.
