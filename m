Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.67
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793735152;
	b=dAx0h0bx6Em7xjgRAA2bKHPGybj+oAWr5XPUrsGMYs8rZAW8NtsK3BQ5VzjVCv+abGpd
	 uKrtlFdN4NKKKpXYvF08HCRxJdJKHAgf+qvm8PYOO6p32H+B6rY1LAvR2/rqodQHFadfn
	 5rU4PtUAIBxesm/S+k+TMDr5RPZ5x9TobdXLRxcD1jvVTI4B+7cIHVqX8K8FyYCLgIarz
	 eMZZm/Fy/KipLvntuItq0TSL1huSGSH9/uDeGew2fRsGf2wWuDw8jjGCfaMEfas7RX2qc
	 VooO3nqHFMwjAeyOmMnarBR8pZGk+al89zDLRt+ZypobcF5cJyCpltLpxYQxBdTI82A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793735152;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=L7nC007n1UoC31+bUEjdNbMK1h27JQgcUX6FHEn7wjI=;
	b=OeKMg5kJmYhDFyrviQML7KLbTKAAEcM16Ri6Uz30jEjOprFhEkcP94gBmZonslLioSUx
	 qto9+RP58BsKerVTyUsqZz89lhZ+nKEOOfF/N+1blkmX3oH50DZrxYXhL15kShU0GYl0V
	 jd0gHqaQH8ZsIkmM6uaqjTr9YQvC+gAGcoQaJO0VI1RYZ4jstmPpqnTwNzc/Tq29setVu
	 Js9F0epMTXAad8vzh1Y6q1afuDj1BQynbvn+HjGeai2b/SAOftnLJX1evNR7WjU2dVzE5
	 cWCQjECVFOhXIPzHZ1DF8XRV4GqVtci1qgK0tCXye+LAI1kZOA7kgKm/RtbQaPreKGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=xOTU7mMF;
	arc=none smtp.remote-ip=91.218.175.67
Received: from mta0.migadu.com (out-67.mta0.migadu.com [91.218.175.67])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 194C7606A324
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 19:45:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 194C7606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=xOTU7mMF
X-Envelope-To: devicetree@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=DqgJmYvW/WYxuocn5VZljrjSvENrQMdWD4e72HV/Je8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793735149; v=1; x=1794339949;
 b=xOTU7mMF+oS3Rx9JR6fkpmMoHgt2fVZ/uNc0AniMa0hFGQLrZARrnGBVP82colADPqViQrtS
 5LGWaAMIMCokkFgCss6zWVOx9D1VXv4DCQkcUg70nXyVXoLx1nqtclKT74iDY6YxNajO24R/+86
 yk4dD+6yalTcgGs9nUNH41OQ=
X-Envelope-To: devicetree@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 1b57e00893805f86;
	Tue, 03 Nov 2026 19:45:48 +0000
X-Mizu-Trace-ID: 1b57e00893805f86
X-Migadu-Flow: FLOW_OUT
Message-ID: <dbb34880-2ca1-4c19-9efe-bb2db51f5493@linux.dev>
Date: Tue, 3 Nov 2026 19:45:47 +0000
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
Subject: Re: [PATCH v5 12/15] drm/tidss: oldi: Add power domain support
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
References: <20261103-beagley-ai-display-v5-0-f1c8d0e52bb4@ideasonboard.com>
 <20261103-beagley-ai-display-v5-12-f1c8d0e52bb4@ideasonboard.com>
Content-Language: en-US
From: Aradhya Bhatia <aradhya.bhatia@linux.dev>
In-Reply-To: <20261103-beagley-ai-display-v5-12-f1c8d0e52bb4@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 03/11/26 11:34, Tomi Valkeinen wrote:
> The OLDI TXes on AM62P and J722S have power domains of their own,
> described in the DT, unlike the earlier SoCs. The OLDI TX nodes are not
> real devices, so the driver core does not attach these power domains,
> and nothing in the core turns them on.
> 
> Add support to attach the PDs with dev_pm_domain_attach_by_node(), and
> manage the power state of the returned virtual devices with runtime PM
> functions.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

Reviewed-by: Aradhya Bhatia <aradhya.bhatia@linux.dev>

-- 
Regards
Aradhya

