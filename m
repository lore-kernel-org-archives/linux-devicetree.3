Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 056FC421233
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 10:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784889254; cv=none; b=FgwYvPrk38WT34WFRmWeQCXATGxAyxrEOfF3qUHugIL4sWJjQqdBXy/TPu6F8LLXvDcnjr3djh7QfQKE+611/SNcdxI8bwufUuDmk2LkSd9ZNt3LD+VWCVGtsq8SptmXN7b1t9HRFWZ35iL/Oxisq8SwM64h7Y+G3orcONtClL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784889254; c=relaxed/simple;
	bh=7yJ0XIwJzjPOJ+yWjxzt78IMRepMQzFTHARmaw7TQm0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qfCbZLv8k+xrwL7tA0sHCyIGSSKY/8LUFDzrognnhs5HGKQR8hEOBVPlvsYoWCqroyRWLMSzq3rEwJS/ht6cEHGq7rb6Kc/kFSQxjrQzi7+mloyJOYEEV69zSKWWLroFGbBNPrlDmGOm9M5Iaj7LmTj9gaq3YwBrki/JN88Pd0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=oVNqgStd; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="oVNqgStd"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4956242332dso2755755e9.2
        for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 03:34:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784889250; x=1785494050; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7yJ0XIwJzjPOJ+yWjxzt78IMRepMQzFTHARmaw7TQm0=;
        b=oVNqgStdVX497sSXZdAcVyYA29KAAXJIV7gRy97FYSULEE8QZuMm0EjFvMRKcSTXSA
         /kDRv6rrt2solcbodOtwgKqMrfrVz9yXyCKZBCmWEtYbq8X0IT1SedCt0FveUGiBP+Oi
         xf2XIZ/VN8gQ7SdAB+ayX5KYgMujr7KBp+I0ozaVNfLYy0FKwV6ftLntTQS9EJgF+DyM
         WI6lpFvb5E8Oa3rKLRxPDnm1qqDuhfyfXlpNZVvWsxKuxq0htNnbMx0snrwq+VwMANHR
         lPCK/F/1/nttuMc/6gIOuOGJjJBe9q4yz07w3gQDTI9YaKen9Wa4/51NNcpXfx6C8K96
         gksQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784889250; x=1785494050;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7yJ0XIwJzjPOJ+yWjxzt78IMRepMQzFTHARmaw7TQm0=;
        b=i7loiDGozzVaOz67mbxFq2cO9fHJ1b8F5/ufCE/7/l7iZADQrRTlOgdT5reQk3oJF6
         SXEBxkJQ6WRgqGU46Lei3wJ6IJ8zCj5LArx4asKuj0xtNPXxAVhv3s5LHvfnEqcuuKjm
         NVFF8CN9uLjYu2bB/gHBkmNcNqVvlJvweCYS6vGdnwWQaBn4cIrTWCaBmMRv6WYnBCyF
         QStsi5wjhbKkwPxJ8YhYufdK7lgbuS/1oYXfzcvdKSCbjQvklN10Rva/ccy5+nvh6H9m
         5y2ziAQsYAvur5deWYUipQ6vsDQ6VQU6WqKnM7cDFa5zHlS7kO52uvgi+XZtkz4cv+5z
         v/mA==
X-Forwarded-Encrypted: i=1; AHgh+Ro7kimbeFOHeKKUpiPdA8QKWHJGTPVEzizr6jlmINQhSWj1my4FJrI08jXbmwUyzNsCURWW1IVE3g6L@vger.kernel.org
X-Gm-Message-State: AOJu0YwXMOj3v0w/b05LT4p+sTBWi/yezLvHUKAMGFUOiwuTc3zm4fTQ
	2INwVHpSarsOeVqGyJmceFhweJaD8pdPvh76eyftWsz4WdOAumgUcS7bJeOF3V06f4g=
X-Gm-Gg: AR+sD12p7VUj3Je7T7Js2WcYakWNkwL8BSe5o8pWc4vr7Ef4n3tQZK/kfWAaJmY9omb
	QnZorKpAoq4T/vD15grJ+fogZp9anfSkAVzgZDT3WhmXeOSezuWfovvViJiw5YKxmW1l/WwiKeo
	DOpXJBtdX1XqPUGGrsimNFR61Ra93Wvd79GqcNYezPHoxhQw6DvgK24ElyuoRfhDyZGQW7fECJj
	w0WGaHAF1qWZjULbs2aNPhKQRJXiZqzEBgx/K4LwqFjC4WDxx9u9vHGpuC2MLQqzGmaodV+rQbA
	b1YDgwWatJO8TYDkJ3vfs9f5JRx+3Z800rgNsTB5AkGB82l7PrkyyERNb287sfpI6yxPQ0tZfM0
	dVJToUrrIKYsb2geKbY0J6qon7bd5C7m/1FA/6/D0XbJZ3B35AjiebQ8UOpOcWyuRHjMjZXG2fO
	cF28IDJHc=
X-Received: by 2002:a05:600c:3b0e:b0:495:78af:78e5 with SMTP id 5b1f17b1804b1-49578af7abemr52456775e9.1.1784889250156;
        Fri, 24 Jul 2026 03:34:10 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4957afac187sm58468025e9.11.2026.07.24.03.34.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 03:34:09 -0700 (PDT)
Date: Fri, 24 Jul 2026 12:34:08 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Imran Shaik <imran.shaik@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Ajit Pandey <ajit.pandey@oss.qualcomm.com>, Taniya Das <taniya.das@oss.qualcomm.com>, 
	Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v3 3/4] clk: qcom: Add Audio Core clock controller
 support on Qualcomm Shikra SoC
Message-ID: <amM_ViJcG0jbDNmB@monoceros>
References: <20260723-shikra-audiocorecc-v3-0-90b878ae0d4e@oss.qualcomm.com>
 <20260723-shikra-audiocorecc-v3-3-90b878ae0d4e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="t2bnazuvarmd3e35"
Content-Disposition: inline
In-Reply-To: <20260723-shikra-audiocorecc-v3-3-90b878ae0d4e@oss.qualcomm.com>


--t2bnazuvarmd3e35
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v3 3/4] clk: qcom: Add Audio Core clock controller
 support on Qualcomm Shikra SoC
MIME-Version: 1.0

On Thu, Jul 23, 2026 at 09:15:52PM +0530, Imran Shaik wrote:
> +#include <linux/clk-provider.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>

<linux/platform_device.h> already provides of_device_id and
<linux/mod_devicetable.h> is supposed to go away. So please drop the
include for the latter.

Thanks
Uwe

--t2bnazuvarmd3e35
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmpjP50ACgkQj4D7WH0S
/k4/sQf8D2+PWz3SlUqpHSWzW3vCjzo8yJcf/44rjrQuErQ97PsZnrshJVLId4Ro
Y4MeRfq2WTIQFO5Gpz2UvWOywcryX18qUEPKGSgc/R/nkwbrmwNbeECdMxm94XdV
pJ9UjqXVPDlbNvOniqBLYBs8XAyGr4E/+puRfHJ03ZKNK//+Sa08d+oiD9gEvwAv
ItYFdIzkIqZ1kIgCWyrngOetlRK8z5NoGazvl2xbPPPrBjqoZFBJtTB7TyaTv0Pp
W+2kjElwpBuBmlf4Dkdh2BYuKatxjtBOLTf+q2j9yzHD9G4vNdiagcF0xs9hlvlZ
wKs9kfYotxt+3MzBoNcv/uUcGPw0vw==
=GYne
-----END PGP SIGNATURE-----

--t2bnazuvarmd3e35--
