Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF824395D86
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 18:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787251399; cv=pass; b=C2YZWg0SaiiJuNvQOYgDbejh+bkjhFLgCznMz+gMUJwQND7i8QFuD8HQIL7/E49oixa6pg11aRJm5xrhmTp/zYPta9ofq96jH9fMP+kcSfYrPb/qkR2pPt4FvRWydIKEfyzk8+JBjceZeGGk+7xzN4gsjCzUo64UUjUnOZd80FE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787251399; c=relaxed/simple;
	bh=/gqSU1EwjK2L+OI/UYE3e2zLhINP6ZH5lVx2IhdAMcI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HEvk8eIA+QcWT8Hv72irxDaF9RL7iGerE05BDj2fWuNGxtMkQexI2jGdcOFyDQSoPOkE4ISgBb4HKlcUHy0oDohn1K3oAtTIo73D34a1H3GV5wU2OyOAFRdK5Deb2v9aEeIHptbMNXLDnNs4H84gK48RZN1EFks5In5lCjE+UWM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mj79YdgU; arc=pass smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mj79YdgU"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-47fe377a217so159176f8f.1
        for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 11:43:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787251396; cv=none;
        d=google.com; s=arc-20260327;
        b=aKXfB2dSP+in9zq90yDfAuRG/5bE083Q6gHjxY8/QRLoCMg4hM4ZPAu/E6UPVHfkNd
         hKHGWEYlqbBAtPx5b/+6n2QQ31DK6oILAnQjyT7YcEE8NbYq0aGwecmC1QL5XcvX3Zk7
         IbNT6CrJeuU0WDmCD2SaNq8a/H7Klgu/bN2UGha2OVbJPFTcttFY97UnMiW6eVdxvz5V
         /CToAnFdSFOQUrANGyTCap97eQ/qn7lGoEy85PHRzCLcjyYSRqFDpNPeyna4/rT4Qy3V
         kKn7NUgipdSib7qDnw+L7brfR5VPbIbcMc6SKDcgE10yNEgZI9wItz8X9Z4h5uY83Exb
         S+Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/gqSU1EwjK2L+OI/UYE3e2zLhINP6ZH5lVx2IhdAMcI=;
        fh=BX5LFE44u3ddFh1Dx4p5hR6beBkL2mOH/rsXou2k6cw=;
        b=G4vLyJoaT5avtAE9E8RRVGH4H0Jhg9mwKjo9ie3T9s9zRuAMv/IKJGdOKrfnfIQkXQ
         d5Ro1HMZFcNQ+NhF9gABaeeh37w1YWlJvqblNqTp+XydcGjcAVuII1Sy2Rl2gBJxGZaA
         6zvvtkFhyFe6LpCNvvopOU8C+rXy/tCnwir282E04EhEX/umTLCTGHQP1DQz2wFlTJKd
         FIvS/L68ZLjGXH/s1frnTdKphqeOIzK+VYlLlKPSOiEH6m6G6O/FLiWdy/W4AhAl6Xj6
         dQeekR7hS/Eo5M5hw1njEQi7+Lxf2RSyK+hD/XsQXBU2L3XJvFZ7jDI51v9gggBvXyWy
         xndg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787251396; x=1787856196; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/gqSU1EwjK2L+OI/UYE3e2zLhINP6ZH5lVx2IhdAMcI=;
        b=mj79YdgUNB3vXJAYIveEq0p7HlvflYtmszQNqdt2D5NMVMlCMfE5KfdkGbDqXtAI9k
         buWDJj4cU1jsV+IjSP86OsxneXIXhhv8ozLuiiUrQ5C/zP2ZnxzJ+3ClkwvKQAYx75b+
         5LmgDvshBG4am3sSlVNz9PNV9NWYYuz/E4Vqp56PqD4eK8BJBHutDFGJKMHc6kDhKwT+
         hps2/DZvPqY+be8EaoJmFakYfrh3ZYpbn6JQShxCw4E75/xyXO8gaV71l/+nt8+U95ir
         uNQBTICAnEnO1rwGiLE3hpdgWvHZtT00VU1EzeKMztqe9HegNIIvWpf2Bz6LA/JyOBEn
         GcyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787251396; x=1787856196;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/gqSU1EwjK2L+OI/UYE3e2zLhINP6ZH5lVx2IhdAMcI=;
        b=no3MLHvK3ggLwbXhOn7jGzzqcCBAxhEtSDrDpgd6SBzmR7UeE2VxbO1h2UeT6W0SiL
         uItXoejt2PZLb8uExH1Y/F4UoZ0xqJ6WNMVWqdcPkjO1EVN/GPanWXUXmRJAM6MK5zEg
         TJ+1S4dTQcQFuIgZAbkwB+D/wsLbWRg1FM9RqryDM+mvsj/bUvtdBzmkIWAkRgon3Hgn
         w+QDnlir+dZPUaqzYwIgovOyIZKjUksKtilyCdsNlU+neKoRTzvEoHTOffldYBj3fpt4
         GiMJbbP57pSpdUGIbSQbVw287UH6AMhu9N//l1emnLhRbRId5JA7Uw76/69kqPQ8Sy1q
         jMWA==
X-Forwarded-Encrypted: i=1; AHgh+RrTpz36z++ykP1unuSloufIJU5P2NulpUWFf+L20BHuATnytXztsHd0A1uIbjQH3SZFXGADNh6r7eIx@vger.kernel.org
X-Gm-Message-State: AFuF++kNi8bbNp3pmcSrkXCOKSlYxgh04FnZzafThp0P4iVR8+afVz2T
	cEWhOLMHv4Vg5ZxLIAIH8O712/W5x4T0rvS70pk1ynPl7IuVtCP2lhaToC2yjsXpseIQvfyUeaJ
	V7D0OB+qH5OqdfIc5Vt4lnNb4DyKwZFM=
X-Gm-Gg: AR+sD10Csf5UGEz0hm5nPlBFJ18yRdGflBUGpb/+A9L83DxgkgpHIqNhJ5mAHlxyhI4
	QGJ0L2r0v15yhI5ByPsiqFPmwH0CizE160OaH2reLz2aptPoHqroWWY7rDtYRGoaJo/mj1l+1Vm
	3JcwodHOpN3fTmzmeXTfcm/EXxW4b5nyvrHQrHpUCm1MhKdUs8Ja9fsYhgPClu/RS1VVaHBxgyv
	kW//sxLNJHH2+4fN6zyxcQG2YdcYcgTJSL7Esj6hwpI3b46YhPl0XuDqGumLxmKaJi/9qpRvc8J
	eQWRVauW52DR7VIHfDSJTg3tnhE0uyyhgxqHNFdQeqA9Vj7qr11OjOtyCoOuaY8eP2m9fGscl9r
	Jia0UrWr8M5NYvgABIGyDTod5pexLEg==
X-Received: by 2002:a5d:64cd:0:b0:482:b886:4ce7 with SMTP id
 ffacd0b85a97d-482c0b95967mr1559704f8f.12.1787251395978; Thu, 20 Aug 2026
 11:43:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260819103926.2136712-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260819103926.2136712-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260819105027.B7A121F000E9@smtp.kernel.org> <aoWqVMc-EQEDqA8h@shikoro>
In-Reply-To: <aoWqVMc-EQEDqA8h@shikoro>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 20 Aug 2026 19:42:49 +0100
X-Gm-Features: AcwNN1VWAd4yRx74uvdrwkqeGxUaWBMQRHelzjfY8vzM6hoPGzX-UUqIL14Hd8E
Message-ID: <CA+V-a8ug6svy-mWkffaZxN08+TiczPk4mq=aqgavnHdYebaVpQ@mail.gmail.com>
Subject: Re: [PATCH v4 07/15] rtc: rzn1: Replace remove callback with devm_add_action_or_reset()
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: sashiko-reviews@lists.linux.dev, devicetree@vger.kernel.org, 
	conor+dt@kernel.org, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	linux-rtc@vger.kernel.org, robh@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Wolfram,

On Wed, Aug 19, 2026 at 2:06=E2=80=AFPM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
>
> > Would it be safer to use pm_runtime_put_sync() here to ensure the devic=
e
> > reaches a suspended state before the teardown continues?
>
> Yes, seems like patches 7 and 8 have to be swapped simply.
>
Ok, I will swap it.

Cheers,
Prabhakar
