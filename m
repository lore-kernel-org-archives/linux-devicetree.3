Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA8383FBB5E
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 12:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779106180; cv=none; b=o9L1z2/13gTH6o95QPoShFkJ7CgwuBx7eeRLNrtIaunZdGY5V+KbshM+7sJ6iGCQXBMUZJy8WZVLMKsKUbGighUQp1mcfowKmt4t/i63gw9ujt43EepXPcLgKkKkdhgyATtZNc5Ry/wDs9ZsX7TPnOovSzT8KGUco0xUyRroI2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779106180; c=relaxed/simple;
	bh=7AT2/oSiJdqVT/zn70Y/W9nkm60nW+UXqpoRWb5gyUI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=IuriKPOoOaOtV8f4RM665/aPpldC3kpObG4MCX/vZ79L+BBlUQ2br96Pb7ledvuGbdVwNQw0nCXDX+UqcI2lJc9QgLwF4pSPzq2Sp9+SxHgvOlFl5UkWO+OwXIO6jBiFeArwHtq7HdSj8v/UyIVCqZYUbARM+nJql1AktGGz4Z0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s5hMHycN; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s5hMHycN"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-488e1a8ac40so22434925e9.2
        for <devicetree@vger.kernel.org>; Mon, 18 May 2026 05:09:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779106175; x=1779710975; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=7AT2/oSiJdqVT/zn70Y/W9nkm60nW+UXqpoRWb5gyUI=;
        b=s5hMHycNyNVY/dwgEjAiHWaRKPTrXiLMgI3Q/hbciRnLk0P69LRLfzes7VxcgejvgS
         bZoVZewF7fi4QzEn4b6XPCkYZyx2QdTti6nMfzgk3PeDFuqgD+Ois8icg4LNUlraJmSh
         mn9L5YUm/uF9Rwtg5Iuw9xInLBFudwnpJxjh10AbhgQI1GoG5p3M8vbZSmPAQ2hyGGFO
         vJBwLPc3JP0qQwsyVE5Wa+74k1ou9WogVFcz2s58tZVTuDPKOxK9rBIfa5+arahJ1IHk
         TbuXHoFN/DF7h6B9OqQuGwjtBj3PbF77cGblr4RAD9Yur1X7IrHznFXS2Cpz+GpLDDuA
         HN6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779106175; x=1779710975;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7AT2/oSiJdqVT/zn70Y/W9nkm60nW+UXqpoRWb5gyUI=;
        b=i5Y4sjC8lBQHHZy7Wegol/xfUtc1MuzgnPFwdo+N1223y4ZbvFlGO+DxbgvBQgipvv
         /t7+Q3R9caaH0xdLWNDhr1HWxYu9sY6SIM7PXmdHWcA36kJ/CIRCBY8sx0lIwwj8ngL3
         /jECCFtE6qbMw7j3pn+Ho1/SkxdrmOdfXq91zYSbTN4E+lqs2gaiLKiFs2tRWBicznZN
         oR74ga9kzMTwuBVUnfMST6kCvibn0fbryb3Vivu2kAYGM2bkd0iMJ4Isx2MkQvEeh8Cq
         EgpZefLOGFZ3gdX/rGirjMthF4lg211ldUskfukILaSF9+5RZIGOQRuiEKEQ0Q4oS2uI
         bMJg==
X-Forwarded-Encrypted: i=1; AFNElJ+CK8zUePT70Ll99DdjGk1V+PqHZ3/HIrk9N9xkMM9SHwp+tlzFHW6xmjWgtMNATb+Z5YwE2wP+nvC1@vger.kernel.org
X-Gm-Message-State: AOJu0YyJEhNx4xYGKRjliPUGI/mrphIO6kn6PqlNWvCJTumHR8p25HpW
	L42jJzFi3Sxh+iGz83oiqNxglGU9/LIgUPLRN2800O2CQZjBBVdr99Gm
X-Gm-Gg: Acq92OF52CnZ6WK4H1vj1XsohOm1xNraT6tXeU83mBG3tFgnQQFfWCif9VR/j9DQDAl
	nyQ1e3WyDWTKfN6T28gO2kLf7MOXIEt5bmIduZqr2Y9JdL6LbIWy/TS1q43PKs8JJ5f7SAY/YTQ
	rs9XycA2GhpE2YVo4S+1R12RoBrDmOCb1he0nL7WW9zrcENSt1KJBW1hwSfyJmc6FUuPL50HDGZ
	/PspFV2LcOjXQaGovr6QbBwj1pJeTY5MDfdVmx/GD94YPwrNSv8omv4X12gLG/TfDkYx5ojPaXZ
	VunakAmHQjnYx2q58Fpe1A2v5EyNsSofX+jzLlUWY8ruqjxZE6dfnQ3OQyBr7kABpn019vvS3Nz
	79BGloJpHsFSs/Luktu88f1vWTAWSlN+Db6vUC5mG66wxip//JpMSMGouDwUGGVPX3nf9sJczbD
	LG6NBg6msw/OuzQvQO/NxqmFTctq663deT8IzYiz6azOwQtCnuHc8Y2HyX15KMAH+GsBgpgb53u
	TZ3jgaXBGheZA==
X-Received: by 2002:a05:600c:a293:b0:48f:e6de:1cc6 with SMTP id 5b1f17b1804b1-48fe6de1e03mr141000945e9.32.1779106175444;
        Mon, 18 May 2026 05:09:35 -0700 (PDT)
Received: from giga-mm-11.home (72.92.4.85.dynamic.cust.swisscom.net. [85.4.92.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49017d7108fsm2250215e9.23.2026.05.18.05.09.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 05:09:34 -0700 (PDT)
Message-ID: <579c7c33123c4cd0bd486301e56daf5962ca55ec.camel@gmail.com>
Subject: Re: [PATCH v2 3/3] arm64: dts: allwinner: A133: add support for
 Baijie Helper A133 board
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Paul Kocialkowski <paulk@sys-base.io>
Cc: linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Mon, 18 May 2026 14:09:33 +0200
In-Reply-To: <agr9m_tidBr6Cu2h@collins>
References: <20260510201644.4143710-1-alexander.sverdlin@gmail.com>
	 <20260510201644.4143710-4-alexander.sverdlin@gmail.com>
	 <agr9m_tidBr6Cu2h@collins>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.1 
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Paul,

On Mon, 2026-05-18 at 13:52 +0200, Paul Kocialkowski wrote:
> Just in case you missed it, there was a previous submission for this
> board which wasn't followed up on.
>=20
> I also have one of this board and wanted to respin support, but it looks
> like you beat me to it :)

thanks for the hint!
Do you mean this series:
https://lore.kernel.org/all/20241227-a133-display-support-v1-0-13b52f71fb14=
@linumiz.com/
?

I've missed it indeed! I'll look into it!

--=20
Alexander Sverdlin.
