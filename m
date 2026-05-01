Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6FFC3CFF64
	for <devicetree@vger.kernel.org>; Fri,  1 May 2026 15:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777649576; cv=none; b=qh7Onpg52tyCtCZe+puvf4Gj/b5W2RwTp/iVVKGj8qarhfhVMniA5a9ZNlH7XtGn+YXGx31XC6Welw4I5s8mcgVemv/aL3/M5+mj/nSFwMwaQG/+IywBrQ+0DnCEb8Gr+7ctxHnNv6rt8EwH8SwHu+E3o9Yc+N3o0IbNXBCBL10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777649576; c=relaxed/simple;
	bh=auIWNOK7TliDHRa41hP4h/ZGSc9hDRKRewTuikcXQhg=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=trcoaPLIEbt038pcgMOlA/WJSO6oxXrWWdred4qJ8kwDB9skmkKkDX+VXGRExXsZ0z1PE8TbYGEjw0Iu1F8ZGva4pOBxWq1bTx7eRtWnaTgIwZAJcNBWOjLQ1QFrsXMAZEiOSqNnJnk18M9Lg+xxcGazhp/U2C4x8JA/UR1F6xQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BN9VVDzC; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BN9VVDzC"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4891e86fabeso25992085e9.1
        for <devicetree@vger.kernel.org>; Fri, 01 May 2026 08:32:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777649573; x=1778254373; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nIFGJkIeWdUt+CmNJefoaOlO/byGEQ4fNf280dgFKws=;
        b=BN9VVDzC6SvjqYqG/OHlCXcINCVckD0HtROIzL6RxLMR+tr3zBdJEHwK62QlKfW380
         VKDGQd6oNEcs/8fZ9DvIqSMkidhkAVsuXJYrwCyqNUMb0FDNMHetWeV43FBWNxB6zMNN
         XCUgOclQQkPYH50LQFmEueTpZTA6jPjfmIfJGz4eDUJeda+LU9nNZc70tQSeKRDSgbU9
         E2iD0pjNLqTXnWb5K81cNq4xbdmZQxwdV56YqJ4yA2rQZOghOFSfg+njv8ecBAWPoRh0
         43y5LlVHo/vwB4a7xo3q7ygrZYGpIDruDUj+J6bs7Cux+cvvHU0wbrx4XNuadCc4fCtf
         q6Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777649573; x=1778254373;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nIFGJkIeWdUt+CmNJefoaOlO/byGEQ4fNf280dgFKws=;
        b=d8YsbQH9LREvL5un5ouTzobiRYJD6AnZRiDVJUMuwTc6LxWnNqcRV2nYRGC+YlFbMf
         zwKX4WF9l+kxXsxGgLadqGGGmIZc7cB0N716xNqL0O8GKb1vL4TlM8WD5hRfwebIZIP2
         X1s0SLcIOwr2G7800AFTMIWGZD0vCYIrPE4bI+9ItjwYiapUqyTdz4/F+VHIbK73xE3d
         aP0j3lsXsa6hXvodEgduhl+ql0BbAqahBMxYp5pDnSS0waVrK21bjKigfY4x5uRcduJ5
         8Q5pRFblFLtffUqzTVWi1m2Mm0Tyc46qlIk3ajFjfPteFOpRQ2A/LYnLwtJh5kJo2lQc
         xW4g==
X-Forwarded-Encrypted: i=1; AFNElJ+4GlUoPmMdYzpE73KVlPsXinZ+sIXrppCkV5XXjpYSxJ2a9pABMTIb/7jBvv6p5y0LkKJ11Ihkk/FR@vger.kernel.org
X-Gm-Message-State: AOJu0YzDDcfQgugeN0nJkDdWY2FRcMDZQ1mSyhplkmJ1hWJpxKlGMbOo
	HFVRJn+UQXvzn7JjXzoxKZRv4sIpjSJvmGwN4s8KEfgebuHOoQHBslyTN2OyBBgG7Tg=
X-Gm-Gg: AeBDiev1dfg226tPXiPDAye0kbirR4IWZNoslNtwDQSdA0r6Ifp6oJ1jmKoibo+blM/
	BuuqZGGzX8i6GEjXczgJxEVGmgi4kp6EILZvr/Gw9OaBYd0X8ATgGgtmkVczHAfE2Nypry2bz0g
	MEoefkDWUkA4/vApc4j6UsSVZwrco2DT5oUeGn1jpxyZk2X/dgSsj3aQzcwWo0Y0pfL1ffusJqo
	deDVdEg98LW5qFGRwmgr9avQV67Qiai6ah8hosJBfc7pI0Pd1XA+T/R5Mj1p1ASB6Id1QGROhyx
	jMF1v47FgsQTF07wBe0rvDnVOg2gLOyHnm/YW5axXj46QhX+etmiowJCYVbQsBlXAnuClxKcTC6
	xWVtqrr5KX9vbGn82cXINcMKmXQ8aG8lorC5w1pcchF8hC//T5rXZL4EF+3kNpVD/mQbineGvey
	QyoOcefJMLoP/nfgq4jMS0A97lFr6pUDUOFWkjkxe8csbWbXoXgpRbXJQvOlYAFiV2c1oN1jv9I
	JZZEr18DcERmjkDAlG7WsQC6VXsqabcsWs=
X-Received: by 2002:a05:600c:354d:b0:488:8b99:54a1 with SMTP id 5b1f17b1804b1-48a8445e8bcmr124239825e9.28.1777649573128;
        Fri, 01 May 2026 08:32:53 -0700 (PDT)
Received: from localhost ([94.4.195.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-44a8ef50e59sm5648768f8f.10.2026.05.01.08.32.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 May 2026 08:32:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 01 May 2026 16:32:51 +0100
Message-Id: <DI7G6J6LMC4T.2LQ8SEC6HMM1L@linaro.org>
Subject: Re: [PATCH v4 00/11] thermal: samsung: Add support for Google GS101
 TMU
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Tudor Ambarus" <tudor.ambarus@linaro.org>, "Alexey Klimov"
 <alexey.klimov@linaro.org>, "Rafael J. Wysocki" <rafael@kernel.org>, "Zhang
 Rui" <rui.zhang@intel.com>, "Lukasz Luba" <lukasz.luba@arm.com>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Krzysztof Kozlowski"
 <krzk@kernel.org>, "Alim Akhtar" <alim.akhtar@samsung.com>, "Bartlomiej
 Zolnierkiewicz" <bzolnier@gmail.com>, "Kees Cook" <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, "Peter Griffin"
 <peter.griffin@linaro.org>, =?utf-8?q?Andr=C3=A9_Draszik?=
 <andre.draszik@linaro.org>, "Daniel Lezcano" <daniel.lezcano@kernel.org>,
 "Sylwester Nawrocki" <s.nawrocki@samsung.com>, "Chanwoo Choi"
 <cw00.choi@samsung.com>, "Michael Turquette" <mturquette@baylibre.com>,
 "Stephen Boyd" <sboyd@kernel.org>, "Lee Jones" <lee@kernel.org>
Cc: <willmcvicker@google.com>, <jyescas@google.com>, <shin.son@samsung.com>,
 <linux-samsung-soc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-pm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-hardening@vger.kernel.org>,
 <linux-clk@vger.kernel.org>, "Krzysztof Kozlowski"
 <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: aerc 0.21.0
References: <20260423-acpm-tmu-v4-0-8b59f8548634@linaro.org>
 <DI7D7JXW4RGK.XB0BE6ZXNMHS@linaro.org>
 <b9fa48f1-0ace-4a8b-b2bf-b5e01f789f7b@linaro.org>
In-Reply-To: <b9fa48f1-0ace-4a8b-b2bf-b5e01f789f7b@linaro.org>

On Fri May 1, 2026 at 3:33 PM BST, Tudor Ambarus wrote:
>
>
> On 5/1/26 4:13 PM, Alexey Klimov wrote:
>>> Dependencies
>>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>> - context dependency on the ACPM fixes sent at:
>>>   Link: https://lore.kernel.org/linux-samsung-soc/20260423-acpm-fixes-s=
ashiko-reports-v1-0-2217b790925e@linaro.org/T/#t
>
> cut
>
>> I've took series locally using b4 and result doesn't compile:
>
> take the set linked above as well please.

Okay, now I am lost. Were dependencies incorrectly described in this
series?

Log below of applying patches below:

Total patches: 11
---
 Base: using specified base-commit 2e68039281932e6dc37718a1ea7cbb8e2cda42e6
 Deps: looking for dependencies matching 4 patch-ids
Grabbing search results from lore.kernel.org
 Deps: Applying prerequisite patch: [PATCH v3 1/6] firmware: samsung: acpm:=
 Fix cross-thread RX length corruption
 Deps: Applying prerequisite patch: [PATCH 2/4] firmware: samsung: acpm: Fi=
x sequence number leak and infinite loop
 Deps: Applying prerequisite patch: [PATCH 3/4] firmware: samsung: acpm: Fi=
x mailbox channel leak on probe error
 Deps: Applying prerequisite patch: [PATCH v3 3/6] firmware: samsung: acpm:=
 Fix dummy stubs to return ERR_PTR
Applying: firmware: samsung: acpm: Fix cross-thread RX length corruption
Applying: firmware: samsung: acpm: Fix sequence number leak and infinite lo=
op
Applying: firmware: samsung: acpm: Fix mailbox channel leak on probe error
Applying: firmware: samsung: acpm: Fix dummy stubs to return ERR_PTR
Applying: dt-bindings: thermal: Add Google GS101 TMU
Applying: firmware: samsung: acpm: Consolidate transfer initialization help=
er
Applying: firmware: samsung: acpm: Annotate rx_data->cmd with __counted_by_=
ptr
Applying: firmware: samsung: acpm: Drop redundant _ops suffix in acpm_ops m=
embers
Applying: firmware: samsung: acpm: Make acpm_ops const and access via point=
er
Applying: firmware: samsung: acpm: Add TMU protocol support
Applying: firmware: samsung: acpm: Add devm_acpm_get_by_phandle helper
Applying: thermal: samsung: Add Exynos ACPM TMU driver GS101
Applying: MAINTAINERS: Add entry for Samsung Exynos ACPM thermal driver
Applying: arm64: dts: exynos: gs101: Add thermal management unit
Applying: arm64: defconfig: enable Exynos ACPM thermal support

Best regards,
Alexey
