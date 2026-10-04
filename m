Received: from mail-ed2-f31.google.com (mail-ed2-f31.google.com [74.125.228.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 230B746EC88
	for <devicetree@vger.kernel.org>; Sun,  4 Oct 2026 20:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791145813; cv=none; b=mwdd8GA+TNGTa5WGxt1M7TqEhUFWC7pOqh28J6sNdXm3a8/w4/ZqN0/6kQwfR8OpJT3JSJJFbf3n4ruzOjUVCMkmDZKuDbcez8mHyme6W6rpAjKISY/FMJZSCmfU8zt56LGp9zL1vrq50o4RPAJlXUuj/RgX6nUDzWrVagGeJRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791145813; c=relaxed/simple;
	bh=NjrYE4by8IUGX+jLXXoEkanz9j2cBCv2snn0lRwRYoI=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Subject:From:
	 References:In-Reply-To; b=un5n8wmvlxDbktPYBkQe4oq0+qkjzho9qQCAhDdvzwXaAxJb9JSU9bCLvFox7tibSO4iC5cXOHdzHviTJqPUKVlmcnTx0PBoR4Gt/QEQhBO3zyFDS+yVfawj70TUrP6PaOlBPCJ3hMIGutQmWy53fonHcotAHhoTcSy6Kazo6so=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EUpxe+fO; arc=none smtp.client-ip=74.125.228.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EUpxe+fO"
Received: by mail-ed2-f31.google.com with SMTP id 4fb4d7f45d1cf-6ae42b3e901so633634a12.0
        for <devicetree@vger.kernel.org>; Sun, 04 Oct 2026 13:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791145809; x=1791750609; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:to:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NjrYE4by8IUGX+jLXXoEkanz9j2cBCv2snn0lRwRYoI=;
        b=EUpxe+fOtf9EksVMIs6LJzFRu9HdFznWGj9BciYZ+KiHDySiC4iCh6ahHGO52Zn5sc
         ehlvUPwCv8sMKa7CfsTLvolTKpOHt++VXeJT+EtmyyG7rdZdRS9TjhVq5/SlNwb0WYnJ
         2XQmk+0meesqS23m18pUgWwCJYMx/SnLnF9EhaebBVKHS2QdgJ9MMKTJzXBf5bA4Xgjb
         u2IAXM5AKHTtvD6qv2YuWF2ynMztRZqXTYwnqAbY15lkOCCTJl8LHssFRgY25+M8aEbp
         TDEiMay/OwBILtxX2fScUZh6fmPD/WbjcoBDWoCl4CmKhMv6MiWAiYuhEP4hhOZppXs+
         herQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791145809; x=1791750609;
        h=in-reply-to:references:from:subject:to:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NjrYE4by8IUGX+jLXXoEkanz9j2cBCv2snn0lRwRYoI=;
        b=Vg4QvCs3SicDmCnuON9OreOdfeXVjK3Nodzs1vtLrmJov7BrOfqiwbRqMw9ETOgTra
         F97Swx1jO6YfaYZfZ2RJfq5+CzuquPDlJ1KhmuwCQeZPPOu51u2QNE9T0cYox7CtQfD8
         kMoR+BmFBszqi+Hgmrp96icP4Om4eXxlfKfd+MAzIgtoShg25CNGgOOnsC1xc/KPKtwW
         6dHUcULlUATeRVfUP5yjr8bcLHfa+BIZMnP/VEDjR76HHh1ZCd4tO8dr1zQOejdEw1q6
         i9xInHfEjHON/XPJKaM7KU6XnNqkFYqtppGjt6fjSEgO2MBLeIBe0KyI/htl6P5GvCNl
         7tRQ==
X-Forwarded-Encrypted: i=1; AKwUvBy1/6UsF0qMnjuPlksg9HcHLPli3L9oynzRhZTRPpKLCLLr57Fbz3VDIIlnTHOKwC9a+BUECrFvFy1+@vger.kernel.org
X-Gm-Message-State: AFq9FYLg0Wyhqq4AwIzZH11kNdNceZl0lHqGqopeJlWDyE+qYjRzUWxJ
	GR598wFJ40zJqnzzkgrXyQEiNxS0OTkBUIbY79ZjpfXsHpdl5f5b2oi9
X-Gm-Gg: AYBFou23t9sT/Mo50tKrgvZPM09eJJEBcQb+7v1Hn/llq1XZFdXGb8YWDa3qON/Okkz
	Ru/dEaqBYQMW+yWS8St3OExPsrIavwkxS4nfyDvfxCgfu275+c8YDJ3vLEfKgi3pyueC9SErbMn
	+K7k+CC8Tl8lhAGlvQFTCpNqrPJwWmfUmFQ5+rWHWIQjIYI3jDD0GLSjskrEDqnNitUz6ZWxW2D
	KM6gjZ6HFwKzYhku8Wr/lLPcxBjTICab/W35VCfRra8Xmm9W0oLYdbMv0+VMdkp+FPZdkyXQQbj
	pZpczYPh9E5MSaCsOR8YSYA8VX6kzv/c9K57bpUwXb4GwNQj4OwRfBHcBchK4ZrlMG8T6Oo9Ki2
	TG2cIVLvcog9ej8PIcTm0/2aLWGet0ZZxiZjB2+iXWua3Sqm3yGOOQHlzii/nS15KrGYKWwMXp3
	WjrKVkfEVQSmorRNnexvgyIRxNQN3EMEW3nuzdc5MqlUw0UZFjHoXxQAzeJkd+MhNYv/sU1AK2S
	WsOQ90=
X-Received: by 2002:a05:6402:3819:b0:6ac:7d58:dbed with SMTP id 4fb4d7f45d1cf-6af9e2cb07bmr8078237a12.3.1791145808710;
        Sun, 04 Oct 2026 13:30:08 -0700 (PDT)
Received: from localhost ([46.205.201.71])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6afb01e592csm2343641a12.6.2026.10.04.13.30.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 04 Oct 2026 13:30:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 04 Oct 2026 22:30:05 +0200
Message-Id: <DLWC73DK15W4.2LCL8MREV6FDM@gmail.com>
To: "Daniel Golle" <daniel@makrotopia.org>, "Dmitry Torokhov"
 <dmitry.torokhov@gmail.com>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Hendrik Noack" <hendrik-noack@gmx.de>, "Arnd Bergmann" <arnd@arndb.de>,
 "Ferass El Hafidi" <funderscore@postmarketos.org>,
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 <linux-input@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/5] Input: hynitron-cst816x: respect touchscreen DT
 properties
From: "Oleh Kuzhylnyi" <kuzhylol@gmail.com>
X-Mailer: aerc 0.17.0
References: <cover.1790944534.git.daniel@makrotopia.org>
 <75b8436b900ecdce7f29513a7403b851986a3a1b.1790944534.git.daniel@makrotopia.org>
In-Reply-To: <75b8436b900ecdce7f29513a7403b851986a3a1b.1790944534.git.daniel@makrotopia.org>

On Fri Oct 2, 2026 at 2:47 PM CEST, Daniel Golle wrote:
> Parse common touchscreen properties and use touchscreen_report_pos()
> instead of reporting raw absolute position.
>
> This makes the driver respect the touchscreen-min-x/y,
> touchscreen-size-x/y, touchscreen-fuzz-x/y, touchscreen-inverted-x/y
> and touchscreen-swapped-x-y properties.
>
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---
> v2:
> - name all the properties the parser honours, no functional change

Tested on Raspberry Pi 4B with CST816S panel, with and without
touchscreen-swapped-x-y. Reported coordinates are valid.

Tested-by: Oleh Kuzhylnyi <kuzhylol@gmail.com>

Best regards,
Oleh Kuzhylnyi
