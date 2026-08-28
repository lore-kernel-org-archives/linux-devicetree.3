Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C77E44CAD7
	for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 13:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787923845; cv=pass; b=TTD6Rnq4vb9+AfQZHvz6WOWnbscdbqa0+3rNujZBT0KiQ8oQrgiG25GQ8vwpXEJm5o8XF6Tyd2zqQwhrS/Iz/voGL/hBbteINJ5f8CaAlFx8Kq35JmcQP+qcUmE3Cxv/kbqIAkrkifuZ5QtFWkgyyRl5LLsJYR5cEUnJNjNEV4I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787923845; c=relaxed/simple;
	bh=hok4GvjDE1nmTNyDoS3DTDjsSlvgrhNExm+F3J3GMLI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J4ASX46mGI1gLqS+eqPE6g9uNyNSBe86xudW7QQFXAMt/7YkN715c3jekaxpaOUuFkkrIkc8YtnsFbt+9cEVrg6z8cSvyyfFcIj3hfLmXcvhjEALX6PHlqJVnBkcqX+HCCalqcP0Zpim1Awk+YmTey7SycG5mLPCAN+IjdEcI5Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gfUlmO8b; arc=pass smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gfUlmO8b"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5b4e6868276so124838e87.0
        for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 06:30:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787923842; cv=none;
        d=google.com; s=arc-20260327;
        b=YoyPYCPZPXVmEebSd9tF1B70w0BGh//tIoXPXRsUH+sb9dHQSctljQuXawhwirty1S
         +dizxTr2zvRZND3JcAKJju2i1xsf4nbPtTCvfIwpLYX8IGNE4eu6asOzfhDCOB7aW54F
         C+1WcBN5R537Z63hAG6hxVINRPnXmA4OynQ7yD9YA1ajhu9d7MVp/hRBWOgBWBXY1zxJ
         0wM6ltVkNL98L7DzrzSUqkPLGHZ08izfqK6hkRn5B/isXMN5hctbNF9CWS9JrrhrYF+R
         Vt3g2mJBuuPVS8PvWBjuWjma4tLQ3bWWPqel0X/hjgVQAsKEUTY0T3QOGDsDhe51Rxrn
         0KMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=hok4GvjDE1nmTNyDoS3DTDjsSlvgrhNExm+F3J3GMLI=;
        fh=FKAhnL/Zbvjq1WlyShUa9hNfH48G3MVUO7lDpzJIa5A=;
        b=R4XXBZc0hLfq6yqhMCgjm35CVT+imG+ugt6LkbsrqkUVrtfG+He4De64+Rx5RTKzD0
         WxlbpyQxCTN9uy/ffa+MaEJs9PvzR9roqaj2ed2vFKE5/MDQaTmw0CUiwgVJ7KQ9x9l9
         kEarm9JdSpkCthfwJ6mBLEHEAW9QvH/k88UUxRs6EbKnEfQNrSCVjrpk/bvyOX0HaaFC
         uF1C9yrJT3ds1zL+VqJYzkR3Sc5P1SzWWYIRH4T/hltAlj3n9qOSUVXfVX1xSdfaFYM1
         /KPvADpsECx/4wKS3i/Bai4rMh3HOmwEUdxqDpTsXLNY5gkUt6k4MkrxeGrvtL5oUV4j
         uwuQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787923842; x=1788528642; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hok4GvjDE1nmTNyDoS3DTDjsSlvgrhNExm+F3J3GMLI=;
        b=gfUlmO8bnKpnFyWsx+/8R0WWocZCifqJJPsQox5wNMj3wqidfp9chD4s3Mpblxg0AB
         t1wdB39Z27EsLPNEobzSvf5dpFozLsDU59pFmdGeg34bqSjtMq63f3bHSymHplU04vY9
         rEV4XLPVqKiKE1G0x8XKLUwhzeCtWdaEyiKXyMBlS2fhw2r/cNyuDnga/NA3spCou8dy
         kEaKKlbekj2epPNjarr9IjKG53JJTeOsanvftt5H7BeZJET7QE57kUusvf6wuGEmhTkr
         yormKlWpnGL1BfmqH0x7t/nHUwMfQeIxl2pFOdbCZVB9wrtOkPxNpanCB/tyQBCW3nc4
         EwvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787923842; x=1788528642;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hok4GvjDE1nmTNyDoS3DTDjsSlvgrhNExm+F3J3GMLI=;
        b=IMdx4LcRGs/yxLGH+j7vJGkQ9m14Pqwc2i9ApJWECaCq9OBkHUg1milTMOcLc3cmnm
         pgIpxvj0555lgr53Q6JqAE2qfXxc+XT6DeLJd+ovSH0i2o65tc63AIPDIjlBo44vZ+15
         RXX+5N1sFyBPxOyDxIwFqkdmFmyQ/zThgwq1VMCAt0xscw7c3jX7VUx+DhJMSOUzrXzE
         nC01AnQ7RStzC/rM2pOo/dH2F+KfzTpgIwI9jF7HIns3es6v0a4RVofCxmVJx3R0mFkV
         u0FOiTRNRCRG0yyrQF1xfJYgK67ZGx9RYaZMPBGd1IviAJ4g4Bs0jZ/eCOyjSyDwx0/i
         drDw==
X-Forwarded-Encrypted: i=1; AHgh+RpmSYiE7sH0K54bESdHq0xQ1P76g1SJD02n6aTv8iaNAJJmP2i/vtKbh4W9frMFOTYf4RGB1iujlCCB@vger.kernel.org
X-Gm-Message-State: AFuF++llO3zLZ7Ad1QrLR5PzkyWwSiNyexAeynIjj5HX9smCUXIeWh1M
	Ky53Z9ZlyPwp1yok52fqsNTCNJ9IQPmRo9METO/UyurdDXPR1v4wzjizHdq1A/qMcxg9NZI2nM7
	exJhPUpHuhcasJupYc3SmxjIPrE6BIHI=
X-Gm-Gg: AR+sD11rXrh1d40vMz1ugqFQGuq2M+UgYXSsf7dB2CUbAOB6V1P+8V1marS65jfyrDN
	VxDt2LiPi3rrNgPwqv9iesFdLK+qPLk0Lt7OR0m6EAidcJyasE5L+FGtBYSaY3EXx5eQbRU9UaI
	X781rka2eiDu/hNLdespZZjJueIufTVjAl2aFUCqMFgCLXd8wYFUIVVyJEMIs2pebf2UwkSDeD1
	Xv7tdKd6V8trTRSxopPi01dYWKWM8iVssB0YzcDiAz4B2LwGRgTP3hFqwy1mnn36R2WN5GWq+xO
	3RwKcsfMq7DSs7/J3hR76uvjpgPfwfw2cRRwqXxjHJbiCr7FYX6XMr7IuP+7RaZ5LjQ1xIsHwqV
	FUHD2Q7RMComGjw+tHL8P3qu1nIMwSWt/pwgA8w==
X-Received: by 2002:a05:6512:118a:b0:5b4:4c8a:abc1 with SMTP id
 2adb3069b0e04-5b5e6b35c5emr1180327e87.4.1787923842021; Fri, 28 Aug 2026
 06:30:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260803163427.74445-1-chenyou910331@gmail.com> <aokF9v3orE3nBz4D@inochi.infowork>
In-Reply-To: <aokF9v3orE3nBz4D@inochi.infowork>
From: =?UTF-8?B?6JGJ5a645L2R?= <chenyou910331@gmail.com>
Date: Fri, 28 Aug 2026 21:30:30 +0800
X-Gm-Features: AcwNN1U3qtWfXakKgSZWrBm0x66_gbL--qvyFVM6YD3FiR8B948w7osQE2VTpfk
Message-ID: <CAKspUhKtnmmB3UmfqgXa1Ciq=qaqHCmdTYfYDa_X-4WJSQWmfg@mail.gmail.com>
Subject: Re: [PATCH 2/2] riscv: dts: sophgo: cv180x: Fix internal ephy node name
To: Inochi Amaoto <inochiama@gmail.com>
Cc: chen.wang@linux.dev, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Longbin Li <looong.bin@gmail.com>, 
	"Anton D. Stavinskii" <stavinsky@gmail.com>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>, 
	"open list:SOPHGO DEVICETREES and DRIVERS" <sophgo@lists.linux.dev>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

> Please send this with the same thread of PATCH 1. Otherwise, LGTM
>
> Reviewed-by: Inochi Amaoto <inochiama@gmail.com>

Understood -- 2/2 went out as its own thread by mistake. It will be
threaded properly in v2, and I will carry your Reviewed-by over.

Thanks,
Chen-Yu
