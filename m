Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C1DB41B8CD
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 12:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787572819; cv=none; b=RoeeNJ1vD93mPZr9U+MigAFp4JHxC6cPDA7p0ClMm6TMH6WCPaiTf7kwpqHBAm32CN5hxBQndddJrmKqjPZ/vlCZ/ZLk5YYgWbrLuT30SsOJArr7nlv2mFpuZF7V+U8LEHLR85NRwSTA5ZpAtnmxRWvn+EAp21Ya9Z7oU7UEVic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787572819; c=relaxed/simple;
	bh=wehBoPAFnMWIlOR/1hMFMoLL9ogZezGXsy8/qgXQ8FA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ryfxk4QeQRActSmKjaJ6SiIcQTSTekpzAwBUujYaXWVK5IftU+Z+50UVDHNP0WQdcDBw1RcFJs9qE1jHNbTGtLqXq6kjf5m47/k302O0K0eBHogGPvziZO2lflKmbvvckZ+eV46OLzrBmKbFcNjPRfXnmjDa1vsa8qhwQAGUNrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sRHtk+fU; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sRHtk+fU"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2ceb096e675so38344425ad.0
        for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 05:00:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787572817; x=1788177617; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WLH2hqwn3vkTX39PfHLgy/sCe/Pt/ywfZsI6UoXbmOk=;
        b=sRHtk+fUkR2yUImSOZ9AHUt7wSTYgmNpBF7ps3t95TV8nY8paAZhBP+/AQ7TBZsCYJ
         1eRZUn7kI649U0vztPyPu13xGtiFj3VdQ0IDqI2AxXCjIZ8zXC93YpLB4mkZT4aRJf94
         oqm2AqcSO+vU2Xbq14KLUrQgserqI+okKakiXi2ddqICMpkWh/MDubkOZo06umXFh/rc
         QOhS0IVvgU2ruSRayAf3PwIji6I3EOJsVYvivVo6yu5QPGpAngGmrN5Z+05vYxIs3Xi8
         z7DMurvLR0we8qi3qHN7uqFnL2kG8BQg5x7gtnxRuCDxzVTLGW8idvlxRnqMZzGx7+t2
         lyfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787572817; x=1788177617;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=WLH2hqwn3vkTX39PfHLgy/sCe/Pt/ywfZsI6UoXbmOk=;
        b=ORgETUf9lvApRnneaBaL7DXKXVyP36DxcPbZh/gSU+vfyDUGt9zz/PUIaytqrQF11O
         bv5yx6ns44fGmmK/DlhQJuZNqrLEhTunMFQXtZJ5ZE+DQw8vtA8ICBh+Zm4SlmH3V+E8
         hQPb0pADrCQ+l9j2QU0Hnt/C1RadP9eF5fd29JvB54NG9ulH6WH8A+lvk58juGNFw/fa
         ywnIFapCWPz21w4AiWWgMY5eEvG66MclfwAAVP8V7g5fEQ1ed6zFhEGwhBEWch5Zu5e1
         v9q6g8yBRo5cIC41c/lMAWc3s7myec/YV/1pccpLhg5KN+Ogl0qy8lsuUwdhu9T4VIxe
         SN0A==
X-Forwarded-Encrypted: i=1; AHgh+RreRZvBDcaZ3oNXlI0NGtscKGqfnO5CyNxHRA56h1Yusb0hrrPzq7oyRJIrsmnyMBI+1FBTWQsSZyMH@vger.kernel.org
X-Gm-Message-State: AFuF++nHyJ/IenGsHgkTkjA06sif28222Nh/QuCAU+B47uQWf9d0aAjF
	fu8jemf0P9tJkYTIU2ncwJ9xliZrR+vjyAoywoUfDRXoToyw5CDvhTlt
X-Gm-Gg: AR+sD13KXSV7A0830n1dtJI6evc9DtFRaPgw3cg5qWFyzKLFW0/wumcwEAPkcagGEMH
	OQ1TXDPQKGKSsA+LyJ4pVrLoHjz2D25/eNUog+e9WiJXlsNdU3GEl+fj0JrxNKJazQkS8fjztDX
	43bz/x8NON+yhNOIiWWL7wz58gqlB416XVg1eVgPLqhD3av+X01UlaC8G42dI4Xevj10pbjXwGd
	YYRr+vmrJVqBMzBM+7c41hHL6+l01Wv5IaUunDOrg5MXrXmpFpoAIzeV3G35xPRuQv8Q2Q6BpEs
	5ZWHRR9qAt5zEyL6qUXsSrKmcVb7J9TkxypoVJ+TegIwUUm/w5w1Sem/CIM5o62JuLw+7RlpEDA
	qHSpsFmwjap4vFqT2DzxjfDQ9wMcmEufAUvh+hoVrwX5no+8JFPgkJch8rPhRCG5TO4b6kgXf6S
	8HLHjFLNjdMzHrEgYjlq8TBeb2q1hY+byhxk6zRmxswIdB2sDSw5DMYEpo0Hs5130Bsfpc
X-Received: by 2002:a17:902:d48f:b0:2ce:faa6:7cbb with SMTP id d9443c01a7336-2d670b85236mr264502195ad.4.1787572815669;
        Mon, 24 Aug 2026 05:00:15 -0700 (PDT)
Received: from localhost ([2804:30c:97d:e800:9454:1179:18df:ab33])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3280af94751sm17053707eec.26.2026.08.24.05.00.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 05:00:14 -0700 (PDT)
Date: Mon, 24 Aug 2026 09:00:56 -0300
From: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
To: Antoniu Miclaus <antoniu.miclaus@analog.com>
Cc: Marcelo Schmitt <marcelo.schmitt@analog.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-iio@vger.kernel.org,
	linux@analog.com, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/4] dt-bindings: iio: update unreachable maintainer
 entries
Message-ID: <aowyePkyjRVpqhV-@debian-BULLSEYE-live-builder-AMD64>
References: <20260821180753.4633-1-antoniu.miclaus@analog.com>
 <20260821180753.4633-2-antoniu.miclaus@analog.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260821180753.4633-2-antoniu.miclaus@analog.com>

On 08/21, Antoniu Miclaus wrote:
> Cosmin's Analog Devices address is no longer valid, leaving the ADXL367,
> AD4130, AD74115 and AD74413R bindings without a reachable maintainer.
> Take over maintainership of those bindings and add myself to the
> corresponding MAINTAINERS entries alongside Marcelo.
> 
> Signed-off-by: Antoniu Miclaus <antoniu.miclaus@analog.com>
> Reviewed-by: Nuno Sá <nuno.sa@analog.com>
> ---
Reviewed-by: Marcelo Schmitt <marcelo.schmitt@analog.com>

Thanks
