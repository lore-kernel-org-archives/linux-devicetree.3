Received: from out-189.mta1.migadu.com (out-189.mta1.migadu.com [95.215.58.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4B8B2EEE69
	for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 21:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782681844; cv=none; b=c5KNeasQpI0M/Q4OnAQwGTZXxgN9ygKpI885hmPovdei/Kx5xFdOR8tQfINZ9aaWGcCv+OM4cb7tIe1gFZ5tFcp7n+A3lfwzQJ4soBVE+lhM2U0UZX2KgaCY3HY3W2Ova0wHsUk9Y9plnnABXIENG3RSu4YtvKez3aPU0Y0fJlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782681844; c=relaxed/simple;
	bh=ebzgUZxe0rehWBrkeANTLR18jrab6RcudMXczJqWg28=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q56jxW9yDmvgqvKBoL4qGSFUP4KyYUpSdUR/LkpRQn2GZqIoDnEKwLfHSQW7EIP7lqVzR9hhjYt0SyWBKWO8y2TBW+Er6pgicEj8gfr1mROxsDRKarrixzlz0ZLKlbn8zi0RCW5ChPv6yExdvH1DIdI0cx5A4bnX6VyD4vjxhuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=UNCfFkyz; arc=none smtp.client-ip=95.215.58.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="UNCfFkyz"
Message-ID: <8a0348e5-a6bb-43e3-85e0-aa4673cd3a65@postmarketos.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1782681840;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=1q+7iLNBvpNOBdf+TZ8aP58kYuzF3+NuKg8iL9f2URM=;
	b=UNCfFkyzb4z3Q4gOLilypOIqh+vuaQ9lmYdKBP3z4+wQZKEzE+bNQcZKJvtVcDb6G7nIpN
	OwzLps/+c/tDu8Qh7gCQWoZO/Fj5dvkap49zNp+iCd/S9eDnTRT2IQ1xz2+pODriUXubpX
	yZ3ICdANBpU9vhGBXlhifQLQYVzqMezKi3y4cIykj+582gjpwHXlWUZCaa/0Rp1wYNjMOD
	CtLZjiLv40Q07ZMXAMK03Y7B83t1vr0h9qxJ62lI3kcapGtPrVB9HNfFfqG/9mEf53dk1z
	fhe/L8hMqHva25TMd+FqjWurSx4qzvyAUZl0u3yjJwzFzlUfaPfZweoMfmNKSQ==
Date: Sun, 28 Jun 2026 14:23:23 -0700
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v3 4/4] Revert "dt-bindings: display: panel: panel-simple:
 Add lg,sw49410 compatible"
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Thierry Reding
 <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Jessica Zhang <jesszhan0024@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 David Heidelberg <david@ixit.cz>, phone-devel@vger.kernel.org,
 Amir Dahan <system64fumo@tuta.io>
References: <20260614-judyln-panel-v3-0-07f4134441bd@postmarketos.org>
 <20260614-judyln-panel-v3-4-07f4134441bd@postmarketos.org>
 <20260615-jacamar-of-angelic-aurora-1e4cba@quoll>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Paul Sajna <sajattack@postmarketos.org>
Autocrypt: addr=sajattack@postmarketos.org; keydata=
 xjMEaVNevhYJKwYBBAHaRw8BAQdAjvGGprvrSn/CmlA1Bpjc4S5zJBNSz/6q0AESlS2JbdjN
 J1BhdWwgU2FqbmEgPHNhamF0dGFja0Bwb3N0bWFya2V0b3Mub3JnPsKZBBMWCgBBFiEEv1E8
 AP7J5F2dJQd4hycszAKyDbsFAmmt6twCGwMFCQlmAYAFCwkIBwICIgIGFQoJCAsCBBYCAwEC
 HgcCF4AACgkQhycszAKyDbv25QD9EdvXYqdH6vGQvB5HrUnMOsd37AZkKKgK87kMOXL/5tcA
 /jM3VLcq9mol+GstmBm1itIVAblXcm+H8g/wKoPXq/4LzjgEaVNevhIKKwYBBAGXVQEFAQEH
 QEgCn8S+S7t/3QvXt4dK4572qd+iTl7h4JX1FEV5XUs6AwEIB8J+BBgWCgAmFiEEv1E8AP7J
 5F2dJQd4hycszAKyDbsFAmlTXr4CGwwFCQlmAYAACgkQhycszAKyDbueJAD+IMjk8ztbONXz
 H7fieZc5LoR+6mHnddccacmQyPcGAvsA/0+5SkHEgIBuKwkzwrmKgDqcLhVuEs2f1H2GxKUX jqQI
In-Reply-To: <20260615-jacamar-of-angelic-aurora-1e4cba@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 2026-06-14 10:40 p.m., Krzysztof Kozlowski wrote:
> On Sun, Jun 14, 2026 at 05:08:01PM -0700, Paul Sajna wrote:
>> This reverts commit a74c2e55ab66519ffa2069ac9ae83cd937bff4c4.
>>
>> It isn't actually panel-simple-compatible, and we knew as much by the
> 
> This is not a separate commit. Your work is non-bisectable - this commit
> leaves undocumented compatible.
> 
> 
> Best regards,
> Krzysztof
> 

Are you suggesting I should squash the revert into it's replacement?

-- 
Hal: They're going for the kernel!
Margo: Colonel Who?
