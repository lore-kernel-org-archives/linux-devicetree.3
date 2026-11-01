Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.155
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793542298;
	b=4P9yhSOLTxa+wM6inH1qcCKQqX18z0U6ryPoqA2urAjKeyK+WxU84gxDFAF90AW8Ilal
	 xCj/O6nC22FiQqwvJCgPlWhV/rhcdARfmOVb662DupecE0cDIhqyhG9qZkK3XVhhdrngc
	 kyCZZwFkF5hJ9FMsle83qLM8w+8BJ6FnN8FjKS0Hrw95VXZAVR1v0o41/y/88C9aELDBN
	 mpjJM6KZ78Gz7Rnhj+WVkRl32xW7FF3Jkz8qDtT1QiOClTvRHuLkpsHv/Qo6o6Zc/34Nq
	 qgInnoMV/gpRx8/CGh0IHLzzuD32sF2r++3eM+ZWXjVcQd2Ck1aaz5yqZ7INWg2Sy5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793542298;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=3bh4372hS2kACn6ZvzQmLdLqtWIUlsk51eR2oxOMfCE=;
	b=BHIdcuIALM8VjWmN4bZq7nBqOnShuN/RseRVgCiVgFQXyfBW+GRbGwEy9ZeKe8fzVEWf
	 EbkcKoGg4zG1kuXxPh8kN0BPhEZtpDjVo8M1IcNWHF0F6Sg6bH/GA7nbxvqWioKMpOw0G
	 CpIRrf28XYRAQK+GjNnHvQvfOCowghhdFaAve02PQDPF27K0M9GguV4dXha8xgoHuv4c9
	 +RO3kcZirHnrm2heQRFFYNSY48uFFN4o9lkpFzw2KR99uiXWFxJ9jDe+VZdlG9ghDz1AH
	 we7NUYhnya6FDMI1vcwvYKUBp3ekoHyWf7JwfTJFRn+AxLO0Kg5meQKZJpGU50bf/CA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Zs2i6Qn8;
	arc=none smtp.remote-ip=91.218.175.155
Received: from mta0.migadu.com (out-155.mta0.migadu.com [91.218.175.155])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA7B2606A324
	for <devicetree@vger.kernel.org>; Sun,  1 Nov 2026 14:11:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA7B2606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Zs2i6Qn8
X-Envelope-To: devicetree@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Yj3Ch96OSSiVTVr2M7wDl8PeUGqNkknXjeKIRpqUwXI=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793542296; v=1; x=1794147096;
 b=Zs2i6Qn8YKMyOPGaNdhbAu2b7U0EA/3LcCViZ0RuxYcPDVIGA5UW6VqTu1iv6HTBpTCTSlT6
 GjTz7mDywqSZYwaSpNWW7IRoJg2Mvz52a07DJvY3kfXOMe8mV6Y78BM588PkZkp6OQMjPra/nAT
 jZPTjpOn9xPTnSadfer61qmw=
X-Envelope-To: devicetree@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 785229cc940770b9;
	Sun, 01 Nov 2026 14:11:36 +0000
X-Mizu-Trace-ID: 785229cc940770b9
X-Migadu-Flow: FLOW_OUT
Message-ID: <5044b7a0-5eaf-4008-9653-11027b8055b5@linux.dev>
Date: Sun, 1 Nov 2026 14:11:31 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 06/14] drm/tidss: oldi: Drop unnecessary forward
 declaration
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Swamil Jain <s-jain1@ti.com>, Devarsh Thakkar <devarsht@ti.com>,
 Louis Chauvet <louis.chauvet@bootlin.com>
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20261029-beagley-ai-display-v4-0-dc7f2b532478@ideasonboard.com>
 <20261029-beagley-ai-display-v4-6-dc7f2b532478@ideasonboard.com>
Content-Language: en-US
From: Aradhya Bhatia <aradhya.bhatia@linux.dev>
In-Reply-To: <20261029-beagley-ai-display-v4-6-dc7f2b532478@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 29/10/26 10:18, Tomi Valkeinen wrote:
> Nothing needs "struct tidss_oldi" in tidss_oldi.h, so drop the forward
> declaration.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

Should this perhaps have a Fixes tag?
Fixes: 7246e0929945 ("drm/tidss: Add OLDI bridge support")


Reviewed-by: Aradhya Bhatia <aradhya.bhatia@linux.dev>

-- 
Regards
Aradhya

