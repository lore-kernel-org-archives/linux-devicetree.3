Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03938448D12
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 12:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784032040; cv=none; b=QVc5yTx0GLXTC9aRRKrLwTVsj/BXv36Aot8jDN5SKNHGgFobPnIIdgniwV1+I1b4Wbv1w2a3kWt1n0K8ba1GZ9lAybWRx6NFXAogOAtlvDmzd2JeiOsCqVuQO6qU5bhJJ9eLcg/UTRfgZF6wHWnfeevf7YO1vlYxM0XcaR7JEGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784032040; c=relaxed/simple;
	bh=ZSey80JFPh9lTWD+sSqyuQsIg2D7fhxscYbJM8DP7gA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZkqbQ45jCpIWL3NeADaPtYBNeX+4yCAAUZQZQLPuUwrJ3b9hsPZSXGGXIooPJ6PyzHmrBVCqZRiT03ha3GNk8RP93r38EAObu/KPRvl0UU/BExRTB2BH5e7FmvSO7Lc48IG5n+oWvWTbjV2swHWGG1popTr5z3gCgsex/M0w1kQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=PynYh0+J; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="PynYh0+J"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-493bc8fda98so6512805e9.0
        for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 05:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784032033; x=1784636833; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZSey80JFPh9lTWD+sSqyuQsIg2D7fhxscYbJM8DP7gA=;
        b=PynYh0+J+gquIeEfFLT4xpocDZspjFo1uC0tvXr4kcCbJclxbeAeA2JOA0rl3y20ol
         mcit2fW+E+jmrCK96IIoCDFJ1VM3XZlBM1Ol1m+WClgum2198FRqcjPPCLV9qklXozSF
         bNqWPUmMRztTIRAr/uC8vS6aAntTLhgq31sxO+VuZBnLE00avo9wPo2ak+Id2S73P6TP
         JyMTv3npRT44eaT/IXdnaC/THJCMEiU1U8Y0HHTLWki0rZkYwd6+emsgtmO5Xkm2w9R+
         pry/Pqru2T18iu+oxY+ijHeqsYm6DhnLhfMAzC4qCJgPOzNSx45HsubeRl3RQLtb7Mxd
         11HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784032033; x=1784636833;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZSey80JFPh9lTWD+sSqyuQsIg2D7fhxscYbJM8DP7gA=;
        b=cvxyz57Cq2hd23bqvjzr/TEkBFXqOZyts5p4lpnuN3AVNu47GBXj+Z5o9wIlVPFp1r
         kInUyfxxVUzJeFC85zhlZ1tNDuMPzN/BGyi/wlUSaXHdJ9ztBn/dcW2MqKqgORLmTEIp
         oh9AoRVhYV86Lpbbq3Bubm8gpdB2yTDuPGIX9Vk1gccO2p5HT4mfBIPHiVX8JJcvdvHP
         R1F5V4jtBoNcTNgQfWzOSK7JiGua0OKlWoM0pEnTDIjGrXLpRVG3KTtmab3tvsbQFV9A
         916MHGJi/2tyvNzf4W8gYJmqYalxW1OpkZ5vwzZkhvmcaO4bK3onETr0+ijFfN7aEztI
         k72Q==
X-Forwarded-Encrypted: i=1; AHgh+Rr0pvBlX6kA9F/sCf4B3mt2xraNP+t8egNx2oNNuNr6ma4d2fp9SnFnz0WKIdSRr8YuG1nINyWoY7W3@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/lEqQd0MhliQavhrCVfyzXWTKMy5tDk5k08BFCyNCnIKXyasm
	ySMnmppqHxsDAWR48iV0E+54M3bBmIRDe9sbqRQSIkAajmmqramU7cm5+U65AKXtsUw=
X-Gm-Gg: AfdE7clY9nh3EWj+58JNLe6qJKoU9kag81LExXdSk7Z9bzPE3dcLJdWVFxAzQHcwWOJ
	IG0+j/iKyi3KkQaz7PI8a4RAAKed36a3NBsYHE62qC0/cQjdps0WgVAvEHQaLzySVQH3uXEIyRK
	C8YnC1FRevoQ9YWoWOVdM/vgeQd5c2/Ro2dDSC0/Zkuel/3JHfYcSTCjBHYCmUMKg1i5V+Bpg1N
	GUK+rr8ndy9z07EwAkrUrb9tpM7z80ALajRoqutBvXszniTuIy64WNbk+YpSWCLnoMjLWmcz/wN
	PDfVeSrvsDS9OBTTWp89kZiJklmQ8Fy+toaLaimNZkBm9pkRn5q/DIXAaJX0OFiv2YbviSwSZmV
	0Q7a/iO5jUAoDjyoR6ApwQv0v1Nh72W3DrrazIEnRFKlXfmmi8JeIhVuY2bsaAvu8qQWMBXJDKO
	phyjN4yIG5dvtAPkrR5riP5qDXOLVDt4mWYIGicSfnzH3UW5MeLgRMLmHxQD2BTy6TuEPUNqJvE
	P5pCyOxXcbIXhH6eYJPBdTkFg==
X-Received: by 2002:a05:600c:310f:b0:493:ee3a:f05b with SMTP id 5b1f17b1804b1-493f87d7fcdmr131894065e9.7.1784032033466;
        Tue, 14 Jul 2026 05:27:13 -0700 (PDT)
Received: from localhost (p200300f65f47db04b44a80421173aa03.dip0.t-ipconnect.de. [2003:f6:5f47:db04:b44a:8042:1173:aa03])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-49508732395sm71538925e9.5.2026.07.14.05.27.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 05:27:12 -0700 (PDT)
Date: Tue, 14 Jul 2026 14:27:11 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Luca Weiss <luca.weiss@fairphone.com>, Konrad Dybcio <konradybcio@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Ajit Pandey <ajit.pandey@oss.qualcomm.com>, 
	Imran Shaik <imran.shaik@oss.qualcomm.com>, Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, Krzysztof Kozlowski <krzk@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v7 07/10] clk: qcom: videocc: Add video clock controller
 driver for Eliza
Message-ID: <alYq2J6hd06g9XyC@monoceros>
References: <20260713-b4-eliza_mm_cc_v6-v7-0-4d91bcef50eb@oss.qualcomm.com>
 <20260713-b4-eliza_mm_cc_v6-v7-7-4d91bcef50eb@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ebx5plxbs5ed2t4p"
Content-Disposition: inline
In-Reply-To: <20260713-b4-eliza_mm_cc_v6-v7-7-4d91bcef50eb@oss.qualcomm.com>


--ebx5plxbs5ed2t4p
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v7 07/10] clk: qcom: videocc: Add video clock controller
 driver for Eliza
MIME-Version: 1.0

Hello,

On Mon, Jul 13, 2026 at 08:23:45PM +0530, Taniya Das wrote:
> +#include <linux/mod_devicetable.h>
> [...]
> +#include <linux/platform_device.h>

Please rely on <linux/platform_device.h> to provide of_device_id and
drop the include for <linux/mod_devicetable.h>. The latter header is
going away soon.

Best regards
Uwe

--ebx5plxbs5ed2t4p
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmpWKx0ACgkQj4D7WH0S
/k73NQf/T09jaRmPJhz4l6/RUqCHwddXVzILSJXm5JaBiJDO0DMQ7ba66QjYb4dl
QI1n/Dhb09P32uDl6jsczhMK61GxspOgLrFR2hBJzih+s41bXQ7uPoTac0gcaxYW
7ldbJEM2KWQqFfrv8evU5objg4VkaDip0n9ci9nt6BgjQpYrjjX2clnDM/0zDdp+
J8Dm1K+VIcHnIuhNQqi0ptZUQ7G6eoC2c6bWlZ6aaZm8kmv+yuRaMgI+u78AEzgG
aSj02assVonsMuBMLKWJt55XzGBjwDCaWmUdfxbvs8kPIqtPeP6z5JFX/FcChP14
2tr6zJZjaXuLYoEM5CwI84TE9YnOXQ==
=/t+O
-----END PGP SIGNATURE-----

--ebx5plxbs5ed2t4p--
