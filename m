Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B57F5372E2
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 21:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791925840; cv=none; b=ppGFA9yd4uet71Bt4schspw5m8tJo4RWIJVt5SnrKl5Nk6/hI8fay8XrkV957uyiIUmlN91x0JUR95MA7pe4iBvNTBZWBTIwZKAj7Q9BR7F6mDIlejvRneGAjgwZmh+9KjfJqKs9/XP9yvfMiGs2Zuv50vHKJOUROw6Nxvb6E9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791925840; c=relaxed/simple;
	bh=bJUyc/ME9HJkZnPKYFx7u8d/FjI0Wfq8OzDLfsBL6oA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ebZ+yyMzIvszTFW/0RrFo2TrRPJDLnJ7RBGSPr7KQirbD26JXDnf/yquzKoSdsAlvOq8sGjW2OjfaNF7a8pn8EaFmibAeckHVQDbLWs37B5G+Vou15PRCRl23gT96HCFAdwKWqSPf/7TJvQIUnpR6OU3uFUX5rCutgfM6CKystA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZqRxON9x; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZqRxON9x"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso1816410eec.0
        for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 14:10:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791925836; x=1792530636; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VPF69Vgyq+EWaxSZa/m0vRYIReMQelGNV5KVrMj2Qbg=;
        b=ZqRxON9xj2AzbKSQ90P7zE2huf4VXuY8aW5i9pqpb0q2cpVda1LeALcjhO2keRrN1f
         g5A029vYUFBfcSLIV5pHUvN8rrudySHbRyg581vQ6fdFKTucgiTyC1ooTkbZHD/rGu7c
         8j9twWkJRizdsnPApQPyr+KQVKnp2XlGzA8aMeDIHU+G5S99eVtm+6eQ7gCBLYZFMcie
         QwuMBm1bvGb4H+RfEx0jRdHfMNtScCAIse0OUmRcvUmqUdE685MMfQcZSyj+GsmNUWsO
         ZZJQbTslOvNr8hhA+T17XiquiBfwm/Z6ACv2Y3rumXyBjteZ7vHgVWMMfM4/wRtVW3Wq
         NJxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791925836; x=1792530636;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VPF69Vgyq+EWaxSZa/m0vRYIReMQelGNV5KVrMj2Qbg=;
        b=k31vDj2f5YZ038ybRsd199TvxrDfaibR548gcmByMfodl1/sFdERMiAKGiRgak3Y77
         vDSE0FEFowc8KwSBAjDqI0QoHdiYred9qj1O6xN9RWrtPynItxvy4X9v+ZJt5necFfDA
         PbYOPfQWculfLwxdvV3OGTw2LHp+8/xgtJKuNFAw+Ro/+d5mFt9VYwnkrSd51Fyw7WXI
         LKbDF2qJdvWqwkf8pPY2MCJooR5VgejH2id+POxq2zpIcs5G80HQPP16f4AIUCbzxxd3
         A58mcxk5C1iaehwQAJfBKBz8fCc0ZSbWMbWYVcuGYCuckeV+chcam9Ay8Jm1ATBCsV2Y
         eP7Q==
X-Forwarded-Encrypted: i=1; AKwUvBy5ANMDEf40UZeVgE+yQIjefDDG6HiKafGCz1k40bexlcqzrKNSDMWJyBiKlDexsOgK3kWnF9etvsDw@vger.kernel.org
X-Gm-Message-State: AFq9FYLaQPTo6l2MY0Sc8p+VHd21qvYil9GQRklflt0OyIsqK71C9Dqy
	+rGI6xNsI/bNDleZPnZzoOOcrwshc8iBHF1Kkfle9Puxz7I8T3XVWFsF
X-Gm-Gg: AYBFou1zZOkfSerZDw9moOEuigYRJ07yN5b9l4BSjM/cQDlaNZbe4h/K/t7FfTd9x69
	047KkW+vvxUoksvZJJzCfYgdKK2S0V1v+tCWThw1mUyREuOgaOo4rvIL+Z9mwSUU5XCUzygrtUP
	YaETQ2DAv6zlKp92ClIk9A9mvRs9Ng37nMUMdYvRGTqgbWebWDCarZoZE7s8UG3rjkqaDZBnXD6
	Z10L2BZPo2KDw2CLYg4TuG1Y4zkaCve7E+TdRjtNG6XEPnpIsIGq2gik/sOM5MpUewChn75687r
	X8NQin9LK7RPPjTgXDssQRuWgj598fsFwJA+jZPMNeqYNb+0NM8fsU8lD2+fyvLbdMe/ACpCVr8
	jdGLamaEHaT6E1GVad4NyOK4NI1u6wMc5UsnbQ4HzNe0ihPpGcvrj6KjiGaVRP9BtIAOHvynHBN
	T+guxB5MFLlUtEFLv1x0kkTCRg+INg2dynagaAt9pzlTmyMvSyqGG3DSuOLsqnqIfIudX49I5he
	Ght
X-Received: by 2002:a05:7301:2003:b0:35d:9516:eb26 with SMTP id 5a478bee46e88-35d95266129mr657089eec.13.1791925836118;
        Tue, 13 Oct 2026 14:10:36 -0700 (PDT)
Received: from localhost ([2804:30c:96c:bf00:7844:c38c:894:4054])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35977229a6esm30689648eec.8.2026.10.13.14.10.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 14:10:35 -0700 (PDT)
Date: Tue, 13 Oct 2026 18:10:57 -0300
From: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
To: linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, marcelo.schmitt1@gmail.com
Cc: Marcelo Schmitt <marcelo.schmitt@analog.com>,
	devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
Subject: Re: [PATCH v4 10/13] iio: adc: ad4134: Support SPI 4-wire mode
Message-ID: <as6eYQaso8KQPn5T@debian-BULLSEYE-live-builder-AMD64>
References: <cover.1791309733.git.marcelo.schmitt@analog.com>
 <ec26e0e1cbb6572c8eee391951c084a7c264887c.1791309733.git.marcelo.schmitt@analog.com>
 <sashiko-outbox-162354@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <sashiko-outbox-162354@kernel.org>

On 10/06, sashiko-bot@kernel.org wrote:
...
> [Severity: Medium]
> If spi_setup() fails here, we return the error but st->spi->mode remains
> modified. On subsequent calls, cur_mode != SPI_MODE_0 will evaluate to false
> because the cached mode reflects the requested state.
> 
> Can this cause the driver to bypass spi_setup() on subsequent calls and
> attempt to communicate with the device while the SPI hardware remains
> incorrectly configured?

Seems to make sense. Will double check and fix if needed.

...
> [Severity: High]
> Does this cause a deadlock during device probe in NO_CS mode?
> 
> Here the driver acquires and permanently selects the SDO multiplexer via
> devm_mux_state_get_optional_selected(), which acquires the multiplexer's
> non-recursive semaphore.
> 
> Immediately after, probe calls ad4134_min_io_mode_setup(), which writes to
> device registers via regmap_update_bits(). This triggers the following call
> chain:
> 
> ad4134_min_io_mode_setup()
>   regmap_update_bits()
>     ad4134_reg_write()
>       ad4134_claim_reg_access()
> 
> ad4134_claim_reg_access() unconditionally calls mux_state_select(), which
> will attempt to acquire the exact same semaphore already held by the current
> task, causing a deadlock.
> 
> Furthermore, ad4134_release_reg_access() then unconditionally calls
> mux_state_deselect(), which would prematurely release the probe-acquired
> lock.

Seems plausible. Will double check and fix if needed.


Other LLM comments don't seem to apply either because they are related to debug
interface usage or marginal issues.
