Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793671668;
	b=yeHTuNeDQBUa0+ege3/jkmSO0XFT7E0qrBUl7qFmXWB7DELSBD6bHB4yp6ObDaDhdvV9
	 vZ42zrdeEmDjWPcPbH73pwv+0PdneEaQuNcJtoh/mQ7OyqkwNLzJUGK2WTH8dvlAvwTW7
	 tP7FK8ykUHLYNbz0Wyn6O8o+3MqzkjfrW3D19Hz/UcI21nqO7wGpv7oXtjYuEHtq2n4ii
	 2PsB5rqIvLBe7zQLz4Dlr8uYf1vq5TcdcCeZEE/aSGwl/7rbkEH8qPdxIs9XZnItwEmPE
	 775aHQhYKhe3BFDeuHu0YQf/UQyDGWIn77oPLzlaIjjiTMFSsOWa2Ge2Pq6ZuALQjWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793671668;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=mnCMgi1Mjc7rqcgOPGVHBPcSRGGmUVFCpLTaHePthjU=;
	b=zhFWg2WaLJ1MpGZk1lqgmTC6Pho8eeowbyVSjCRiplkR0RNv3zlxXX/rB4mtEwtLKSIf
	 iUt3J9GZDeN0aIQ57Xmgxxpiq96V4tyv/tkPSU4k0HFraV36Bv7aEvjbgQd7XqF3OLa1i
	 4AxPW65cZbrrnuY+CF9aajUzL7if/SfQlhuHEg9C8lYWT/lXAxpaPfgbLwJPM3s+LnAOT
	 bIGwpys4zJi724qK9v34Y58EDVygbuiXAV8bzo1IP4fCz8SaXoeyu2diZkzm/v3l3SJYS
	 bgMDus6r4/W1+2/elkk80nt9jffWMjIRN0VFQ+RflhXCpCBVApCe+RGGJz7mkhge/gg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=aLjZ44wG;
	arc=none smtp.remote-ip=74.125.82.44
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ACD7606A33F
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 02:07:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1ACD7606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=aLjZ44wG
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-1a8cc11ac42so3520625c88.0
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 18:07:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793671667; x=1794276467; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mnCMgi1Mjc7rqcgOPGVHBPcSRGGmUVFCpLTaHePthjU=;
        b=aLjZ44wGmMHqn8e7JX/I8P1V8VARuQh9o/ia1bogyOm6JOCislA1YcxOmIPAwzWMj1
         IStM6BfN0n6A/Mi7nmKeP+I/YEQ4JUI7eoCX12cJ9HDCtLihrgNPebZlvOTpH2BmP9dD
         jawS7ea3vQz4o3ANdgnbSTDQswDHEQkKX/To8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793671667; x=1794276467;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mnCMgi1Mjc7rqcgOPGVHBPcSRGGmUVFCpLTaHePthjU=;
        b=O1/LdbuHlgjQCU6ETfaLF9k8EeAxOL3JyPbEG34O/Qpe5XP8WZnvm5CTsUdTsuaSwC
         iiSECzDRAUjnFb7DyJvAqv4/JZ8ZhopewLTZmTnr0t9ArPI0gbquNDrwAANKtD+8eFa7
         andir1cHKLab4bBboKLY8EZaaAOJWJL3gUWr7NIy6ilkHCQetcQhU/R2SkL2Ra7HCqUi
         j6ZnHqwg/5wBRMtByWqN7/Qfat5S4U90oHpEO4e8LI+oHis6b+CQmPEgW67FvgAn2x0x
         arZU/v4DKXrr821QDSjRheNVUMjri8vtvtzHIvhRr5gnM3w/ZkuBIc67Ra/nD917taR7
         XQNQ==
X-Forwarded-Encrypted: i=1; AKwUvByre7y2a6Lbvl1qikFn1fjJKsxnHvanzjTfWmrrI77mzx7Njh1ZauIp881n7qgOQkoW+3jkmmA4Mnlk@vger.kernel.org
X-Gm-Message-State: AFq9FYIkQJ/AJJPF+lVoyZexEZZMHrNfpbj/FlvZPEMPzG/zn0hIKFGl
	S7F7jiTxpmuBqCcXN/yTcmBHomhzQdZYSab6RPR+TMVCHiKz3jnl0IR2r2GK7ZdkIA==
X-Gm-Gg: AYBFou2nVpmPGmmsszmAvFLhcrfclzJUGyIH9sn2qOoA8axjmgBBvFp9/ZAY7wpXTsJ
	lsBToce9fMbSWhIPWbBu753mBvzOw7oo7Ir8amu74lYhcxqxpuzlNLD/vu/DQ7JCw8Xs/2Dm/pt
	uDm2tjv3oh0kvDHf8uLGX8Iv2yofHIXQSy6U56Zo+96x2vLPm6qb0KDxb/hC7YSN78j77TTt0eD
	5m8V2IiFp1XPrI2HtP7ND8H/0pgJRHuTPFRduI8MjkfRy/HcbRjrC9L+crXfgUdYF4ik0j9526+
	3ar5GVmsYNqf/sZizaNcnMlGV3RmhDpapHV81elJ8KkRAOYECDPu24q/won3K1HMAe84JTJf39V
	ZjVyY86hT0AfrcXyOKflwopFX46NW1D9tTXGzAFW/XigN0VcHFzt3QkHi4bbW7WZNj6E8KKj9x3
	7AG+wU0nwF7N5gDHczds0aQhP6u0aPVADoaqbEd/COWGlB/PQLGdNfBeKFQsVIai21+qvSUuTbJ
	xrIsrDQ4az+mAqVLGIA2u82Tzh2+hWKkGsp6JY19jpOYAepXng/87sCJyC+6hG34YVD2GOktGoU
	Kn20p4gGBa52Z59gH4BHT0NiP1lZUrIjL3c7Zl7Jhi+CJ9Xj8mlLdNuMMz5ThiWXbrY=
X-Received: by 2002:a05:7022:f105:b0:168:e942:4e62 with SMTP id a92af1059eb24-1ac601d2f3amr14793852c88.40.1793671667220;
        Mon, 02 Nov 2026 18:07:47 -0800 (PST)
Received: from localhost ([2a00:79e0:2e7c:8:c57d:c93d:3543:aab5])
        by smtp.gmail.com with UTF8SMTPSA id a92af1059eb24-1b23b847348sm4090158c88.4.2026.11.02.18.07.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 18:07:46 -0800 (PST)
Date: Mon, 2 Nov 2026 18:07:44 -0800
From: Brian Norris <briannorris@chromium.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Thomas Gleixner <tglx@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Peter Griffin <peter.griffin@linaro.org>,
	devicetree@vger.kernel.org,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, Radu Rendec <radu@rendec.net>,
	linux-arm-kernel@lists.infradead.org,
	Mariano Marciello <mmarciello@google.com>,
	Douglas Anderson <dianders@chromium.org>, linux-clk@vger.kernel.org,
	Jakub =?utf-8?B?R8WCb3dhY2tp?= <jglow@google.com>
Subject: Re: [PATCH 3/9] soc: google: Add CPM over MailBox Array driver
Message-ID: <aulB8F6hc1eDvyfj@google.com>
References: <20261026214359.3122870-1-briannorris@chromium.org>
 <20261026144346.3.I7bc547c83b7bf677a62670099f481a91ac737073@changeid>
 <20261028-literate-pony-of-valor-3209fb@quoll>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261028-literate-pony-of-valor-3209fb@quoll>

On Wed, Oct 28, 2026 at 02:27:05PM +0100, Krzysztof Kozlowski wrote:
> On Mon, Oct 26, 2026 at 02:43:41PM -0700, Brian Norris wrote:
> > --- /dev/null
> > +++ b/drivers/soc/google/Kconfig
> > @@ -0,0 +1,13 @@
> > +# SPDX-License-Identifier: GPL-2.0-only
> > +
> > +config GOOGLE_CPM_MBA
> > +	tristate "Google Tensor CPM MailBox Array Interface"
> > +	depends on ARCH_GOOGLE || COMPILE_TEST
> > +	depends on MAILBOX
> 
> Can it be compile tested without mailbox?

I don't think so. mbox_request_channel() and friends do not have stub
implementations for the non-CONFIG_MAILBOX case.

Brian
