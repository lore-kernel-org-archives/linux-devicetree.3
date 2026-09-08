Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17B2556E048
	for <devicetree@vger.kernel.org>; Tue,  8 Sep 2026 15:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788882886; cv=none; b=aBRho3lbkQGngZ4Gobt8Q+TmzCYW3eyOrtc2iJvY36UBtWstEamL938Kzidl8++JKQcS4RqZ5DyjLs3wiA1oNJoaXxhusuR4bISZbzcQpN+yt7bSTfT5webMREy9x5BDmbYp8bNbenya1ZlmNGCfd+7/Yf/30Oy1Zj9fl3nw28U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788882886; c=relaxed/simple;
	bh=/3rnNXag/vS5IrYn6Xz2BrIs6kjE4MLs3wdioFECscc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=qaZ13Kpkr9aPaKL3kto5ucTAvUq+ytRVeTTTpDCHPlNU6dlPnNiI2Vklf6ro4JibldQgRDPD9jwp+3Hl5CtPnSfA7JSyFhIAbPbd+KGcHxGKDNLeDwEyF4zPGNdikDQSqGEp5jvgORr55PX2QI7rGFf0gyU1g8j96ImBfhVrroU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=toaa46GB; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="toaa46GB"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 2A2774E4159A;
	Tue,  8 Sep 2026 15:54:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EB8D36031F;
	Tue,  8 Sep 2026 15:54:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 70CC511C7AF49;
	Tue,  8 Sep 2026 17:54:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788882881; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=6jYHof1xozakTmB//jQ3mXI6cUayuxeFSdZ/OEuL1ao=;
	b=toaa46GBaAVcoNTbW8tvTfTTrSljE7hWXu0MeOJ3pAxuye9gHyQlI+d7ll5ckFxmRkV1hk
	WggaIc0lIOCtjc/uq0/8ndwbEKD4BxyQ2ljIgGd/pMdkvIZSAFR7/NmMFT89A1yRueyQvn
	Ji8OvEZOI4a/v7mjyVKI/lz3htZvA0rApBWEgXnrT5E6Jtt4Y0NDkN+P9YKJt52znXPNSZ
	cbPRegXkxAZXTa276Y8SA8Dpc1vIO/CuWXSba1Pm3IHktv0xGu7hSXK3GIdVDRBeaNhRAk
	aLNq91/BCjCNxMkrqfRrcE22fSrYDoEdozDJMRN8sp3NBt7KzNmCAgycKnkiuQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Santhosh Kumar K <s-k6@ti.com>
Cc: <broonie@kernel.org>,  <robh@kernel.org>,  <krzk+dt@kernel.org>,
  <conor+dt@kernel.org>,  <richard@nod.at>,  <vigneshr@ti.com>,
  <pratyush@kernel.org>,  <mwalle@kernel.org>,
  <takahiro.kuwano@infineon.com>,  <linux-spi@vger.kernel.org>,
  <devicetree@vger.kernel.org>,  <linux-kernel@vger.kernel.org>,
  <linux-mtd@lists.infradead.org>,  <praneeth@ti.com>,
  <sebin.francis@ti.com>,  <u-kumar1@ti.com>,  <a-dutta@ti.com>
Subject: Re: [PATCH v9 16/18] mtd: spinand: negotiate optimal controller
 operating point before dirmap creation
In-Reply-To: <693550b9-a1fb-4732-b6ab-b06fd6b11423@ti.com> (Santhosh Kumar
	K.'s message of "Tue, 8 Sep 2026 18:44:13 +0530")
References: <20260825171737.776052-1-s-k6@ti.com>
	<20260825171737.776052-17-s-k6@ti.com> <8733vp0yuv.fsf@bootlin.com>
	<693550b9-a1fb-4732-b6ab-b06fd6b11423@ti.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Tue, 08 Sep 2026 17:54:38 +0200
Message-ID: <874ifzu4ap.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

Hello Santhosh,

>>> +		if (!ret && spinand->max_read_op.max_freq) {
>>> +			templates->read_cache =3D best;
>>> +			if (spinand->all_cont_read_variants) {
>>> +				templates->cont_read_cache =3D
>>> +					spinand_find_cont_read_variant(spinand, best, iface);
>>> +				spinand->cont_read_possible =3D
>>> +					!!templates->cont_read_cache;
>> I believe you almost addressed the concerns raised in v7 about
>> cont_read_possible, except what you do here is still a bit dangerous
>> since you could re-enable continuous reads on no_cs_assertion capable
>> controllers. I believe you should clear the flag only, never risk to set
>> it, something like:
>> if (!templates->cont_read_cache)
>>      spinand->cont_read_possible =3D false;
>> With this fixed,
>> Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
>
> Thank you for the review.
>
> Fixed as you suggested - spinand_try_ranked_variant() now only clears
> cont_read_possible when the newly selected variant has no matching
> cont_read counterpart; Will carry this into v10 along with the other
> fixes.

Perfect, thank you. I'm good with it then.

Cheers,
Miqu=C3=A8l
