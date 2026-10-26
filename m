Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793005188;
	b=0BtCYvetx2Q9SwYEtuZLruOnRmth+IH+HZrYDZIhFGGxfmbIilH5dJeyZOBUo1/EJqNf
	 pV2D24BeCQBDIMAbHCRsbDK9EOxb61ErrQc+3y1aoriFuI/S44SWTRLDZwi61kxTDQQgG
	 0V2pS6CFPrKU3M3JM04+08vypEfJNgINKv/k2O4vb/h0kerInuGRugWDk3jYrL9jcpXSE
	 HxhkAayDZiBWCfR0XkyRL5QW25/6d+9C1LOhKAwlTjJFpTLH4RCdpGkY/N05g0aX5iczT
	 3MJNdMWhCwsDfiaCM9hFBL1OXh4fWZY25Gyr1X2gPDHvc063HdFBDMwxeko0LRe6uEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793005188;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=49/7WOJdVSLVzoq5oWG2Xe+wRQoxoxRWiSnOqn8O/K4=;
	b=rYP4BpI+gJHeZxrQsF3vxxMKNxQg0p1qd4+okH1vOawRcSoCbxagRXSP8AfJpa+8FmII
	 gDTNyEB7CYR1OXvoSE0fCxt3kHqFOEfc4xlTyiC5BEwvNDQyMaLmqnF+81MeowV3GIKAb
	 5mZDAZkaYI3Uv+MkceW6jGoBr7GG7DcGdZk9pU8+2tBzrw/zp7F8AXg35j2B7KzVBWXAH
	 VRcw+J9/DDYOwEhxv6ZGE13k86zuxzfNqmNqgWQ+siYh/WwrrE+jls+U7Fpz8ACsyqggd
	 q5XgDRTakgNFtTe94tOlI/Lyf7c6I6GwkHTwM7t0dTNnQzjs7viSwutKvY9z0v85AcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=w0PcWQ7s;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1B60606A31E
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 08:59:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1B60606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=w0PcWQ7s
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-3282db206d3so5433356eec.0
        for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 01:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793005187; x=1793609987; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=49/7WOJdVSLVzoq5oWG2Xe+wRQoxoxRWiSnOqn8O/K4=;
        b=w0PcWQ7s1jwKnNUWE5T/YOshA42iaUDUUhGpDVV/1vK6RT9R1FUequz5lDy708udX6
         XQ2CnxkMcFfd0QMdOLg791j212YiRJl1MqaUIm9FYOP4i82jHT14cg9eWj/f3JIHdbFw
         ozqjcvK9xbUHL8sC/Te9aw7gwRzSCJQSglC44zBUvT74xxDkm7Uahb8MTZffFSaJEk9B
         Ziz4jO9I0BbWb5DvKCz3n9NN/51UaFAuvppNPSCMbEYMLJpXoQ3CQfZA/FjpEz+yNRz8
         THOHu1MVSkPKmIcLqxws1SuWjsSkZ2CihN1soh5iSuzcYy1g9h2P1FMFfLFHXw6t9vvV
         fkzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793005187; x=1793609987;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=49/7WOJdVSLVzoq5oWG2Xe+wRQoxoxRWiSnOqn8O/K4=;
        b=a6abFcbnLe0kcl9zdFdiS2lL7e7CFSOPKlGkflw1UaW/T6ZrTR5L9/X+gDvMUmhela
         pmOzBs7lm4cJofQ/OUJAYOG6mlQdHR7yPaaJHEVub009P9HwV+uVZyMQqPaC8T9AG5er
         KayAZUXpBNsE2E5ziM4mGZX23PIJ1tu2S2yRkskY6CyBvOaQxzTzr03ya5n2w5pwundR
         TWQm89ryp0NUIYhaL0CwG0jQJTu4z49ZUiY5cXz3F4TmmCoU4xMRnJDBk7n2gcVz7ovK
         aFl24i/U5hhSDPhIiIdAD2+46q3R8ABVKt2lq9hSlG1TZzwZ2U1e6ZfS+R51eEGmi22B
         Jqfw==
X-Forwarded-Encrypted: i=1; AKwUvBzKihUeTTvgNrJCbIW8GqIIh8v400OBoMWnFY8kCsrvtW6EQqpvh1VtTlxVD9cLkFWkCsEFnAmGr/3/@vger.kernel.org
X-Gm-Message-State: AFq9FYKIUtp6Q5aHdmxk18n/gQeSjo8NVoL6qR1OND0zpfx0ktayYerN
	4jXXS2xvcXPct68v30lW7y6g4FcUIPQQa1tIhwWwZf1MsV/htVeuw+d+26KWZ/YLaFI=
X-Gm-Gg: AYBFou0ruXvW6xs9g+MvzG6x6bNYojUIVmvqvQeOKQsdoHHNbdyrvR7mBncPB1cIj6W
	qRkdd7zNy+NF+Qj5TdeKZO9xw0fdij05ivWMw0qkrKRBA6aQk2yu1Dbd3xIHvnpSJ4EOOWOml5N
	1jB7BYzi72i2aXWnCRDLPQIOqLUEEAra2o2QIrtEIgMTM1W2oqbei4gaeknILbUxfQBpSE/x/Sb
	02GZL5u0LsCJggy9V2hQdVjh/SVwZgH9R3RrgLghbi3B0jJ6HLN3v1SjJzN7ZedE4n2dY08ElQm
	Okc+BOZmBkZ/I9oUwQG+MCG97GvKtRLvDHMeYXbtigYKsFYrxry53e0vQr5VOS8VhMV0wjHYKM+
	+yg7Hv7KQWpbQojG7ustXpEwXDpaQx4qyhk5DKjxaYZ5Pq+SGOwdQEWB6bCfE6czbx7qDDyzJiv
	YUKK8gdrZHkNLNg/pO+UuvH2qJ/dh1uvNAjM4nuWFOWI+L9SHij0dXUcJB/yUDvPM5v9UIfHDQN
	7QxjjTYwFb1xFX7ti+KRhTNvjXTiE7afk7PZfYOGKoWdJ9fWFnvq9P/HA==
X-Received: by 2002:a05:693c:6017:b0:369:21a:dcca with SMTP id 5a478bee46e88-369e848a2d5mr8835197eec.10.1793005186447;
        Mon, 26 Oct 2026 01:59:46 -0700 (PDT)
Received: from localhost ([122.172.82.240])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a03bea5d4sm4608834eec.6.2026.10.26.01.59.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 01:59:44 -0700 (PDT)
Date: Mon, 26 Oct 2026 14:29:41 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: christian.koever-draxl@student.uibk.ac.at, neil.armstrong@linaro.org,
	sboyd@kernel.org, bmasney+clk@redhat.com, khilman@baylibre.com,
	martin.blumenstingl@googlemail.com, rafael@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
	Christian Stefan =?iso-8859-1?Q?K=F6v=E9r-Draxl?= <ckoever@outlook.de>
Subject: Re: [PATCH 4/4] cpufreq: add an Amlogic speed-bin driver
Message-ID: <at8WfX_G0tfTlFrm@vireshk-B250M-D3H>
References: <20261025192219.209137-1-christian.koever-draxl@student.uibk.ac.at>
 <20261025192219.209137-5-christian.koever-draxl@student.uibk.ac.at>
 <at7lXEqds7ukoR2V@vireshk-B250M-D3H>
 <1jbj8gkff1.fsf@starbuckisacylon.baylibre.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1jbj8gkff1.fsf@starbuckisacylon.baylibre.com>

On 26-10-26, 09:57, Jerome Brunet wrote:
> On lun. 26 oct. 2026 at 11:00, Viresh Kumar <viresh.kumar@linaro.org> wrote:
> 
> > On 25-10-26, 20:22, christian.koever-draxl@student.uibk.ac.at wrote:
> >> From: Christian Stefan Kövér-Draxl <ckoever@outlook.de>
> >> 
> >> Every S4 speed bin runs the same CPU frequencies but needs its own
> >> voltage curve, and the bin can only be read through the secure monitor.
> >> 
> >> Read the bin from the firmware, select the matching
> >> "opp-microvolt-speed<bin>" property for all CPUs, then register
> >> cpufreq-dt. Bins outside the known range fall back to bin 0, which
> >> has the highest voltages. Like sun50i-cpufreq-nvmem, the driver binds
> >> on the SoC compatible and needs no node of its own, and S4 is added to
> >> the cpufreq-dt-platdev blocklist so cpufreq-dt is only created after
> >> the bin has been applied.
> >> 
> >> Signed-off-by: Christian Stefan Kövér-Draxl <ckoever@outlook.de>
> >> ---
> >>  MAINTAINERS                          |   1 +
> >>  drivers/cpufreq/Kconfig.arm          |  14 ++
> >>  drivers/cpufreq/Makefile             |   1 +
> >>  drivers/cpufreq/amlogic-cpufreq.c    | 184 +++++++++++++++++++++++++++
> >>  drivers/cpufreq/cpufreq-dt-platdev.c |   2 +
> >>  5 files changed, 202 insertions(+)
> >>  create mode 100644 drivers/cpufreq/amlogic-cpufreq.c
> >
> > Is it safe to apply just this one ? I can take this via the PM tree then.
> 
> I would advise to wait a little for Amlogic to chime in.

Sure, I wasn't going to wait for the maintainers to respond anyway.

-- 
viresh
