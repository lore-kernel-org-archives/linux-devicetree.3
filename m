Received: from mail-dl1-f67.google.com (mail-dl1-f67.google.com [74.125.82.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5490F37883E
	for <devicetree@vger.kernel.org>; Sat, 28 Mar 2026 09:46:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774691220; cv=none; b=uujleVWuqUsCBA3IXSHrz+L/JUsmEb3zRZFolUBKxU/cyw84sv+1BvL+ahj1GumQGn8rR8LnJ7CgdrnI6lGitN0cqkCxWeOVSq9O4d/bE7RM5wMs3Q4YEsnRkCDYA8i8ICJzncxGdLB4zeeBK1MdRPcZFPdS+uwkvtM4K52s+AM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774691220; c=relaxed/simple;
	bh=Mug/7k7yiQUruxGBnY8AYdjOaizJTDak/1tlC45nw+M=;
	h=From:Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:To:
	 References:In-Reply-To; b=NieHEqn/A7Wr0VQwD2oD8vVbuYDhc5zrTWMMkhO3UG6W5rO9c7+am8phl9bN4ZOl9rsYbbJJeOBdhdPBmlKsN2sQwrUb7x2X9+yVa7otHz1SASK0Ni1IsmYZR/XIVH/4XxDhBqjcWwqAwedco/3shNBnC8DHvtQoJ25xUZWEEyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hbCCUYnd; arc=none smtp.client-ip=74.125.82.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hbCCUYnd"
Received: by mail-dl1-f67.google.com with SMTP id a92af1059eb24-1279eced0b9so4297499c88.0
        for <devicetree@vger.kernel.org>; Sat, 28 Mar 2026 02:46:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774691218; x=1775296018; darn=vger.kernel.org;
        h=in-reply-to:references:to:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mm84PKI95ws94X4le7u52sogEFGb/3XJpC4WJ7nzO9w=;
        b=hbCCUYnd03IEV2qXqs7pGx5GJHzmQjAmJFHIUJUSoeupOjNiBiTJOvhK5n91Yr42VX
         TkLuYzQAwKv5mVjMawF6lGGn0EMRt5TrJzDiI9cCuM4HUUVpdSY9b8JnVzkmu9H5Vjo5
         /4KKlvt+wKCRm/5J+jepihAftOgGExBt4RYGlgXyhLEE9NCjfC0+/siGMIi8QyEp1yt4
         bGaIfM0FzWUshpMunFz2C1xuK1oD0etOWt+GLT9hylxnuLU01HoYhxCOKMt1pIrvGvjH
         ic4YCCEUSsZ+p4yyoE4JjrvfZTrNUjSWeZYnvul58kYyRDYnZF7fztmREO2mv1iKJ1Ed
         M7+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774691218; x=1775296018;
        h=in-reply-to:references:to:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Mm84PKI95ws94X4le7u52sogEFGb/3XJpC4WJ7nzO9w=;
        b=NSvNCZVio3XFQcIvZSE6kSAoaI+cPctCo1VG1rG5EEqTNr6EQOUolF6eLTAW25l9KG
         cKKHvAKJ8cM07HZGPmUCsfXbeZfNzuupKgT0XZXwgOiLi2tqtDuvijT0+9Q38AZ39+2O
         KTZzOm5SHje9+oPsVZS5wIkyTeT6UJW5+D+K/wKzHTToUy532S1KfGIC3sQn+wed506k
         gMtgok9lc7/DODFBTXY28I/VEWMyP73jT/n3tZ4n/TpXOdfa2csYhMpoyRDdqvtpQUPI
         ZDfHX46TNiZRzjA2qVSYAsWdrn8SeOVmPYqnLU2PR/v3iJUsxBo1bUIxu5XQChrGMDQl
         fcWg==
X-Forwarded-Encrypted: i=1; AJvYcCW0LCmfvxaNGLhdavofcN93EHXiFdMk6D/X83oUl7+KvHWD7s9RPG3wOC6PT4dDsT/sIWVNpDGozLWX@vger.kernel.org
X-Gm-Message-State: AOJu0YwZ7r76p1Xy7N5PFc+qaOywh/Ist9y1KTtSE4eG7E6HKYTftVEM
	0RjVzXHjHAHXauI6wo64eBT9MtTkNB9IxFskTwTZpbbAT1PfPIxqQ7qT
X-Gm-Gg: ATEYQzxEb/1WkrhCS1mvGGOpkTWhVjhzYdGSbp/VW460UMiLaic9sp2ymCWolnhh/L4
	rBdiOB0H+5Fhw5VQNBzkkifRKJjmrlcjKy1a1/T9wxyX/Imw1+nd3lR0tEhR8J6P1d4pVkYUigF
	aMnBeZ3R4o3QKG5N/ux0WfhTaKR/fsoXZ7tvlaay+7qWUjtKdsN3Bz3WP/mQ2/GU68sbaCQeO7k
	Qdg5OLNteBoczIyH1fDEV5spVV0yIOtxMpeLHWPnHqCIgBscbtWm+6KtckBh1lRm8kRMZ4mJmrp
	pVQjaQio0Hnd18/xxFC2vfFKz2OaQ18fsyUCcRQGkGTdzXhI4fxtNJvFrtpvTJovIke7DWVnOjx
	Qc210WkgsEXBv29aVi0QerC9+u9vygHu5LUOZxpaGJQl2Aj0zLXJCKCmGLIB7ACspXqSHBCg3SK
	w1WYWbY9ngtlA2pWUuwVGGLsSCVppBp5FILHf5zA==
X-Received: by 2002:a05:7022:6085:b0:123:345b:ba05 with SMTP id a92af1059eb24-12ab28cb38cmr3135449c88.22.1774691218233;
        Sat, 28 Mar 2026 02:46:58 -0700 (PDT)
Received: from localhost ([104.28.227.186])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12aba581027sm1773856c88.4.2026.03.28.02.46.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2026 02:46:57 -0700 (PDT)
From: Troy Mitchell <troymitchell988@gmail.com>
X-Google-Original-From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 28 Mar 2026 17:46:54 +0800
Message-Id: <DHEBJ4VVDDY2.2KRIW6EP7EXOL@linux.spacemit.com>
Cc: "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Paul Walmsley"
 <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou"
 <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>, "Yixun Lan"
 <dlan@kernel.org>, "Vinod Koul" <vkoul@kernel.org>, "Frank Li"
 <Frank.Li@kernel.org>, "Guodong Xu" <guodong@riscstar.com>, "Michael
 Turquette" <mturquette@baylibre.com>, "Stephen Boyd" <sboyd@kernel.org>,
 <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <spacemit@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
 <dmaengine@vger.kernel.org>, <linux-clk@vger.kernel.org>
Subject: Re: [PATCH v2 1/7] dt-bindings: dmaengine: Add SpacemiT K1 DMA
 request definitions
To: "Krzysztof Kozlowski" <krzk@kernel.org>, "Troy Mitchell"
 <troy.mitchell@linux.spacemit.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260326-k3-pdma-v2-0-ca94ca7bb595@linux.spacemit.com>
 <20260326-k3-pdma-v2-1-ca94ca7bb595@linux.spacemit.com>
 <20260327-fancy-nondescript-mouse-cfd6f3@quoll>
In-Reply-To: <20260327-fancy-nondescript-mouse-cfd6f3@quoll>

On Fri Mar 27, 2026 at 3:27 PM CST, Krzysztof Kozlowski wrote:
> On Thu, Mar 26, 2026 at 04:17:16PM +0800, Troy Mitchell wrote:
>> From: Guodong Xu <guodong@riscstar.com>
>>=20
>> Add the DMA request numbers for non-secure peripherals of the K1 SoC
>> from SpacemiT.
>>=20
>> Signed-off-by: Guodong Xu <guodong@riscstar.com>
>> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
>> ---
>
> No changelog - neither here, nor in commit msg.
My apologies, patches 1-6 were added in v2.
I missed including this in the version history..

>
>>  include/dt-bindings/dma/k1-pdma.h | 56 ++++++++++++++++++++++++++++++++=
+++++++
>
> So previous review applies, no? Was there such?
No, since it's a new addition, there are naturally no previous reviews.

                            - Troy
