Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.209
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793734573;
	b=BNIB7+yqQvXGcr30HlNJnizabXEJeCDmVkMUHI12gfPrn6+9wMV9+TVyBtb2o7rY3QMV
	 vBE49MP+4oHIuYtAZXNuAzdHqB0XCA25xcv9vQsouwhAHrPjIUtJv0gazmdureFGF80pp
	 ronjVX4PneMi7HtmA2rQmn635SXQQwxWj17K0qSTQcxJNVJph/kTK8foD09U6V5TO++tn
	 SCDhwUjWhLtxO1cxZpvvbGOBrq58Z0hJnDbL0ArLaqpkpqrOYrKxVRT3o1bN7fJREf4gR
	 /CPTMRPO/8RheVoTuHvMYNNKW/gilVao1p8eC4lB0vWz3qshtsPdL2GjxE49cvAOxgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793734573;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=7GCadaz+EjyUtDNGp4iFFF8gzxEfhR5CHvprcMIc3D4=;
	b=aRq8S4B5ftkX9aAKgcvP9rp2W3THbN9nbuZ3e7Oz2xp7Dt5myKS7VwcVfB7UKv28Clw1
	 R4G92TZrLzoZQ4oWBfaetO96QSOL/8pJgWcw27BOjcdu4iPXkWl+BPN5W26//tPzitlwH
	 51+cHmpa+cIGg+phsita2oZ1SCW4rFvEbDCYaL/85clRL2xnFUO2puwDo/NvFQ5i6WzWC
	 N6q9fenXkK6E0987QZ8Zxu42No/PlSjRl4Rainkz/Weh+zP3sO1CNvVj5I0PhqOKOSih2
	 QasQJAiXINVJw8vxLOE0nCqI5iUY457l0uESMdvit2ZyNQ9xq1JGK0I6MEHR2Rsiq4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=lhndge+D;
	arc=none smtp.remote-ip=91.218.175.209
Received: from mta0.migadu.com (out-209.mta0.migadu.com [91.218.175.209])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 084E4606A31B
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 19:36:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 084E4606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=lhndge+D
X-Envelope-To: devicetree@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=G7KaqzRmIMer3j1Th54NKYLobcV9sl8HLgmBiZenzwA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793734568; v=1; x=1794339368;
 b=lhndge+DqYs3tfg/liaOv0xoCfapCh2cKEU1ZfrmN3kfCnD2H25OyajNLYl6Y2YIixcy+CFM
 J5zW/ZvG3noyAIIdcRXjV6YKbZ8ozYN0O4sfFZefPbvXJos0RcnqypU9FrwVUOYZ9QXkyp1CgAg
 CwWL1oRRPT034jP1rOkZs6KQ=
X-Envelope-To: devicetree@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id a12960df4dbf8237;
	Tue, 03 Nov 2026 19:36:08 +0000
X-Mizu-Trace-ID: a12960df4dbf8237
X-Migadu-Flow: FLOW_OUT
Message-ID: <08e5c832-ec20-4510-b540-d81f3d9b178f@linux.dev>
Date: Tue, 3 Nov 2026 19:36:03 +0000
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
Subject: Re: [PATCH v5 06/15] drm/tidss: Use the AM625 features for AM62A7
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
 <20261103-beagley-ai-display-v5-6-f1c8d0e52bb4@ideasonboard.com>
Content-Language: en-US
From: Aradhya Bhatia <aradhya.bhatia@linux.dev>
In-Reply-To: <20261103-beagley-ai-display-v5-6-f1c8d0e52bb4@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 03/11/26 11:34, Tomi Valkeinen wrote:
> With the recent cleanups, the data in dispc_am62a7_feats is identical to
> dispc_am625_feats, except the subrevision, and the only place where we
> have a difference of behavior wrt. the subrevision is in a debug print.
> 
> Drop the dispc_am62a7_feats and use dispc_am625_feats for AM62A7. The
> debug print will print a few extra OLDI status bits for AM62A7, which
> are not relevant as AM62A7 doesn't have OLDI, but that is harmless.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

Reviewed-by: Aradhya Bhatia <aradhya.bhatia@linux.dev>

-- 
Regards
Aradhya

