Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795135504;
	b=NGA2GxLPU1uWkMrjwC0htSeMqsk/vQtGP27F1Rh1TrTG5JcrLM+htHbwAXQW/gQtIkVM
	 ta6Te7Lxkt6jLFATh6eauLkJt6zE30uj2DgZijC5m/HNWHIuOKjWsJi2PPcWCGAHsDXwB
	 WcqWaXvWY3vbCUlxxgFf26tGZS1B45BPHcodiPFQwmkTZhrwo7nD2OM/2efdsn+NqUJ6H
	 HoF55XaNYqq+y1FyP7L0WVi27LdnG6vQGXmcGbU6SV9GbRyjjDLMLZe3aYB4MFWAXLE7N
	 Dvt7liSiP+ikDHfSFzWbYraZep5BBb8mVuW/fjV2dqY2sgbeiSvMB7OwZLIp1jvte5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795135504;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=1Lg9ws/j/6auwX9L1aWdcPJ9TeP6aM0aF+U4wWzZcmY=;
	b=2LaIFlo6bGKG8JKzEM1jSeMURxk6ggcjVJPNJ1T6ABCa3KhxjPlHQ7GJ/fgghvjgYQrJ
	 EgNbiIeAUQ8eNg8au1X/TYWMIsiF5V22drqF5m+ivpptmZ4sQ9oBi7h6ZBzFQhkVXaTd7
	 zrxxRdmD/hR3XVK8DPrgb87vttClTbdWlpXbCGiH2ULFenaZqwpovGmMpOD+/58F6Lj5B
	 2ZTdBj7iFmfs8q39H6Ilk4IJgxheW4MezEHBBsGHISg3/9baLI6TNr6g5rPv+7Q3x27q3
	 mIDXbO8qkKSuoGkJTAqDh+XAj3t62Ji9KbMz3JaGUdjmal1tc/rQLegYjy6v8d3QTug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qS03fiE5;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70D1E60A260A
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 00:45:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70D1E60A260A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qS03fiE5
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-4aa5833c263so227731f8f.2
        for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 16:45:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795135503; x=1795740303; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1Lg9ws/j/6auwX9L1aWdcPJ9TeP6aM0aF+U4wWzZcmY=;
        b=qS03fiE5VkZqWNA1/yxpm91vGHIZJ+DOi/JE/3wB4sN4v1mg+HipK16bveShnc2y4s
         ML+nATfo+Qur5Ht2C4SECHFfAhGBmC9lUmWR6FY4rIo9W+iQJqS6FV993SRUmSSIAzp1
         pWtiI2F0N056+fe79cw7ECpLjVy4qhH1+3jirPGZwSyBAJL5m+btCynOWAYQWydJrVbv
         oeYyucmoZJzccUzT7ZwH5DK6ON4rcRY5eUOpf7UE9MiWWEKKnzNgg27/3YVtXqrM7cKB
         BK2Z1627WzdNs5K4dfaUQ42nrk4g+FpOl3wsu2KRpG6fANJO/Ra2zf81Z0tp5d2Ax+GT
         ECcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795135503; x=1795740303;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1Lg9ws/j/6auwX9L1aWdcPJ9TeP6aM0aF+U4wWzZcmY=;
        b=S9balJQdy6U7WadHKSk7l1/esn2EQtbygBWkTeSZEiKM3R5k7p9Y6scwFRnsUOYFr7
         T/BgpFvWQLi6uE99aIsTsISv0/ScuDkq4BlnNCeeYic0QM4zm6kPleAQPnASamsz2OIs
         1hPEY1avosU150EbUF9DuSY2iM78G1EapiVtVlGoV0ntodCLPXQ+32pHomdO7BZsPHb7
         m31WKzmTUDTRisRZJIilaV/QbWmmSuj25EJsoujszhYInYzTqGhVKBANsa/dpw0RnG60
         X4F5QBvH3DLC3tdidXfnOXUJXQsqBlASQQ0TIfOgbCd2UNFcpAjlMjlKfHTLE2rEMqLx
         L8aw==
X-Forwarded-Encrypted: i=1; AL+hErHutRtDRealToeDN6/S0snCtfnGjGvHsTgVgETJpJAg37IbhIseGarpzBlSEnqnoN6F8iLBJUvy9zEQ@vger.kernel.org
X-Gm-Message-State: APuU4Z8N8VVrtL9+dL39iuaA35XBXOJ9fc4TVn7Cdu+g1B57OAvqU/wA
	9poyIIgCuW2us+IY/NGEGdcLZQN+6PNoM5BtK8GfoHR72k/rkwMuzRuE
X-Gm-Gg: AZFdTZdbCgb8A8ZfEtndEaSxsBtfus3QNX3NoxSCT3HjBUi8YRi0r2M+UEnMBdHaMq4
	yGnDzgzsiswIKcpxWq0OxgRRyBeIQAbtkTnHyeFqOQ6uVdd8IVE8iI76o2uro/bKafKNcQZVDfv
	kzqv69KkjMKgrRBz5zVwbg8l424/htROm5yRvY2SIDUZwzojZ5VbAEcJnayPu403A6ayR0+ntOG
	zkwzm07eoHJ2LfPaBv/tJeNST3ovASxWj5jMjQp1620aegVGYFoV+LVSVnW06cDvHnGALNz8yTA
	PzEMfz/Koo8jSRTKz35GUzzCBu2YxBd0vqtThVx2bvT/fdkrG2D+5NEkWxPK6faHB9BY4/r+4mT
	LosV1TaM8H2aIzA8+ZEdDzAE7unTD56hKbgOmSXQ7d0re34QDp7Zlnp00w3p1F+omQsvVKaQD7q
	BMAKxQ/BZwJ1E6d7Mcyfi+g5Iicf097ERCpN+/cGhYtvKfNS1ZUIqDH9G7JpLhvB7/qOZO5sYxO
	yFt3jOTqJUo0nx5HJNly3qES2W6M3guxiDse3KcJTgdshSs6llet/FT5k+8Ak3i27TU5DGyCzUk
	wCL7dL3yuhgIbcfbKrfFUnLEMfiiUZnhHlfgcg==
X-Received: by 2002:a05:6000:4a15:b0:49f:eb4b:faa3 with SMTP id ffacd0b85a97d-4abb2168f46mr2035428f8f.9.1795135502648;
        Thu, 19 Nov 2026 16:45:02 -0800 (PST)
Received: from unknown.m0rf30.ray ([2a02:b027:10:5673:5f22:93eb:1bb8:839c])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4ab6bb989b3sm2438480f8f.51.2026.11.19.16.45.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 16:45:02 -0800 (PST)
From: Gianluca Boiano <morf3089@gmail.com>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Gianluca Boiano <morf3089@gmail.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] ASoC: codecs: add TAS2557 mono smart amplifier driver
Date: Fri, 20 Nov 2026 01:44:40 +0100
Message-ID: <20261120004442.1687225-3-morf3089@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <3e194c71-2902-462a-ac77-e55f30f3820b@web.de>
References: <3e194c71-2902-462a-ac77-e55f30f3820b@web.de>
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

On Sat, Jul 18, 2026 at 05:36:34PM +0200, Markus Elfring wrote:
> Under which circumstances would you become interested to apply a statement
> like "guard(mutex)(&tas2557->dev_lock);"?

tas2557_dev_read() and dev_lock are gone in v4; register access goes
through tas2781-comlib under tas_priv->codec_lock. v4 uses
guard(mutex) where the lock covers the whole function.

Gianluca
