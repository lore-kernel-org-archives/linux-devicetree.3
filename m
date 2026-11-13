Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794530254;
	b=pfiL2VdvSGtv1EaiZiJzI6X3HTDZFM0HBGFckzV+tI8jiztO8Zgc5e7DfD5BLJD7Np6n
	 SHeRTnPcsZfDt+mhmjOMfrV0h7XccgC88+5w9lnAAet3SpNECY7+o7c/qs7SgCLvfgvsV
	 vNLZ2Oi1wgNQd+3njzJQH2dmYeIdeTvi1xNE9nLi9bjJhFJMXsz2d5x8X57PtVApT6D0k
	 up78nSujy7vFgwNxIZQEDnBbCzqXNVO+fR2zq/LDQBUKMNQXWy4Bwr5hHJAVDKDMdeLgP
	 5x0mwKHW4lID0558nZZp4FIFJYlU7xUwqDx4Gw7tqes5pJ2yrnaoNCoBebq5w/j7aIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794530254;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=oiEUMAMTxco0TlFyeXtyTWroWf67a7kle4Uiif5GCnk=;
	b=SXHBPvu0Ec8WZNX/7KKi8ZI3y253hvSYqxKCPiMD4XmKEx+L7+gkxH+TjhL/bzRHFaDm
	 vC9Zt/vvoHYh4Depba00DtKdrJtsyfAWKtFvS4IJMt53BdHm7VItdGIIsZdddesJCPrJF
	 yVgB3sHUAQi6+fD9pFK4zo1vDbuqlM4UHLYB4M7HT3ciwSMZj5j6hSXs3JKdGSe861+3s
	 QtHSX5CgceLsI63gO0x0ISdTb5WgEh5WYDYrwG/9S5Drf/bp8NXaMkiSOq2Q5q8MzDDk7
	 h4JaeyVuaLpMNTWAK6Ef+YmSe0wAjXylVe30+o+sdE0cNIfSQigOk1ct8zB2qIOfk6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eY0yCinW;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BBBE606B566
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 00:37:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8BBBE606B566
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eY0yCinW
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-491846221ffso313662f8f.3
        for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 16:37:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794530253; x=1795135053; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oiEUMAMTxco0TlFyeXtyTWroWf67a7kle4Uiif5GCnk=;
        b=eY0yCinWUTqTSYrncmqmmCjvm4o1MIXWWt89QbqMMmPRCBbup9AC6IhsdAq/6ImTEU
         sG/ge1Cs1Fa4qGAFpq5LQ6UK36xbjkXq3bpJ+HTWj41H23XsCr1F6cZJROxJa/2Qr8r/
         MhYsJgTOKEv9zozWFQxvKTXas/h0tKzZDl9vWkl3JAb//05XypuDsFNJMgkBBW1BjnV6
         ZSRzva1/tUttfwrqzbfIsx3Ctd2wbR2TdkDM/3iXWtScISLR7z8CAKDR4O1jb05JSkMD
         Db7gNt6on2Sw+W/9stkMZFokC0cGRkGJAIMD04RBB/6MCbbwU2a6VNut1rXxv4gL09D+
         q9ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794530253; x=1795135053;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oiEUMAMTxco0TlFyeXtyTWroWf67a7kle4Uiif5GCnk=;
        b=RrzzxIi197xAYlyBNSEGlWF0uCXhEkiNI6JTNutcb0kFXsR3L2rHC5B2XM7ncYDbjr
         A5sSxmGixdmT2RiweLS/ouKWFA1LxqFKqJ5/4ptS6t7mJR1d0YD2xJbbBR/6Uddu3J/X
         6yc3GqRjTah4YMYAIibNiViQ5N1ntFqD9Mkh/u/cmVqm0NciH1jnncwsLfgGRmBDOFCu
         mD7IZ/w96S3TW4EN5m1QpGZDQNE1VoPI3y2Dg+zvWjAuLoPINLnXbjQ5drm/Q3kVyjlt
         FVDpj2EupCjfyVcs2HpR6Qpte1ORBjleTCORmQZ+F40Lez+NRgR9McojsY+pUAF6qaOO
         14QA==
X-Forwarded-Encrypted: i=1; AL+hErHJxx9SC9DLonVcTUmex+X6G4uaaVqwUspYDxCaaIfTVfkdTdLcxykPHzZU27LwSiSS++LWEeITnOi8@vger.kernel.org
X-Gm-Message-State: APuU4Z8ZJqRpvjzpmbMRJAzC4BcHCS50BOVTNJuuPPpXcM/j61Jt9/3B
	01nREMIkmPVEBQySQugxZePF+GWWyq+gmB0B7Pz4Q8oCJx+FhFSsYHGt
X-Gm-Gg: AYBFou2B5V2tAhOfRfolqOR4UO/Kyy0HVdGPzYCfRjqD7WklYcSv47T32PUUXlnamQ2
	Oj7aVSF7tSEgVQM62tNYjWxdl1mNNIca2uhiJSWZOYUNQMQnrux3dy8DqBCYz650R/NCVb19CsW
	H3wTI6rI0ED4/UZ+zGjF96nJuAgqMudbRjIujHV+WLVqPar/dZrOF7MX1bn/gv7LPo8X//ZNiIV
	3UG8NrE61QnyJ59C8hXA95B7zHd2CKf0tiAwnd0Tke4xdlrxyoJtbEkbtbhQDS23wRzICT6CWrh
	4WwJ5e2w547/d7s89ju4HlczGhxZOMu/wHUumdvZ7vmap2w4pa07+P4TpRgZXTycPRSQBHc7Rhx
	JxshtOVL73/w+3tS304GhMhUHsF+xsJ7DbOCOEpHTGN7NF7NzQg1FkjV4McDyqUqRblwTc7yGcz
	1PwYBUTx7GktwO0EtHPAQ86iFXGf4sBjcCDTHp5s9CGpX7UkCdYaxLpEYNAkdzJVp6S4qyVC7nS
	4ifw8E6Vl13nwAMVLp3dFpcfkIYvoj54UTOjJG4lk2e8CCYFEz0rfvlyOHi3Z1HuQxk6pHmHaL0
	pA3Uu2MqpI9ZHvQVYGv81ep67Cp129e6/gPsZQO1deoJcqxGJeCqUMe76UCX50SDCoSealuVnc6
	+Nd1B1haUTKQRjpRemqCB2F3puqXtoZjdbjEq12RMfMX0kdzFpRrs4w7cbmwoKNNMrrf94g/n3A
	DUzzhjXAWYzIt39Dv0
X-Received: by 2002:a05:6000:4917:b0:48e:2114:8ab9 with SMTP id ffacd0b85a97d-49c71d47601mr2290702f8f.31.1794530252965;
        Thu, 12 Nov 2026 16:37:32 -0800 (PST)
Received: from navid-pc ([2a01:4b00:a856:6220::a11])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c607d12c4sm1875000f8f.41.2026.11.12.16.37.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 16:37:31 -0800 (PST)
From: Navid Ghahremani <ghahramani.navid@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	stefandoesinger@gmail.com,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 05/24] dt-bindings: reset: Add ZTE ZX279128S reset controller bindings
Date: Fri, 13 Nov 2026 00:37:30 +0000
Message-ID: <20261113003730.3667609-1-ghahramani.navid@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261015-noble-sloppy-chamois-c71dd2@quoll>
References: <20261014072109.1759502-1-ghahramani.navid@gmail.com> <20261014072109.1759502-6-ghahramani.navid@gmail.com> <20261015-noble-sloppy-chamois-c71dd2@quoll>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Krzysztof,

Krzysztof Kozlowski wrote:
> This belongs to the patch with bindings/schema.

OK, the next version adds the reset header in the same patch as the
schema.

> Drop, not a binding.

Will do, the _COUNT defines are gone in the next version.

Best regards,
Navid
