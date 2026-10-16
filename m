Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE54B501F4E
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 16:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792166941; cv=none; b=VkcHRevEz+8+nIESl2BzUsdjUq7p0MWypNdlxTrp13FcmgCRo/mvcUYjHtsre8p78Pgk9NKgxyuhiCUrh7SVOD8xSP2VaARNQCayTnPRA6ymnAA2WNe1JNOLUAfvRTQV3tgEBb59vRd5zhsGPf7WJRt+S+wYnOknFpG2191Yi24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792166941; c=relaxed/simple;
	bh=BX8jpYEOlAnaKcl8q9t92/d9RE4Fbo+mDDNxrXC25F8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YKdyst5p3Sv9Th1HArh9KsD148YnNjp5x+3VhN6NqowjC90+0Rowbsv8jHwdJb0kKVNsDThmUTjoicFYvD4ij0OCiSb1lXPIF1pGJhBI3a5DZ+udjA6sqU7h2iY5pPSYtvOWyBX1vl6oiW2lMhwYef3TbLdwdlMNUphK647dtoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V01rT750; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V01rT750"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a17baef589so1202085e9.0
        for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 09:08:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792166938; x=1792771738; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BX8jpYEOlAnaKcl8q9t92/d9RE4Fbo+mDDNxrXC25F8=;
        b=V01rT750maeN/OBqsYYim3ffP41BONdL4nuWkChBF8PkUVB4cTbKrk32IctOteMJsy
         PlsPMgZBMHG3NgHAjp02KlpWCB9DHfXPSNZAENzwezSjGAhLHrUjUOW2LB0NP/96h2Y+
         FXHmuvVM6IzOapmUkyDXbAUDQHvekv4f11uU116vfer1pkJHU6fFb066YdyT8l60xIZ6
         tccRreHP9AgpMHtMzzz3qpchYdpf6xS/l+SIfLMsg60cbGxKLZo14NdAeB40x4kbXLhS
         q4AHBajCwVYwbxEHHQbNs7fd639z1bgESEWex7hP34A1Otae4Kdo4lTTvyHLUve6qsEr
         cAkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792166938; x=1792771738;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BX8jpYEOlAnaKcl8q9t92/d9RE4Fbo+mDDNxrXC25F8=;
        b=KyHNBZS6G/M90XeJ1tQ/BQXSAsEzXEr4yXr+ONNUtAbi+4UE6bpMlXZwJ4XPX6IPdi
         BGCoPrhgDdkJ/DNRd26n737e3NSvixHeLpuac97vVkxCiXb8sMFTdrSbSnMgLTNJzMmg
         Wh8msWQNH232Y5vHchC1T1gyojGLh49+XrvtI0nMIOy8UpaJFU3WlVv9vLb/jk70DAYz
         obs5jXuNgmtGUN4v4VG+vRgDs6Uy9/Y5wMMGERNbWmkMnPtLJc3omPe3tPGIqdnAlAzM
         XD9aYdS5UcWmksXjfXtNqVJZ44ZjloqKy39Eo+Q+uT2RrkXNq6T8ObOWWKcl2/a2INSt
         syRQ==
X-Forwarded-Encrypted: i=1; AKwUvBxS4zeNo09m6ESBcQRxpA2KhQxpMogfk0eEubE3gL1z5GDAI0VXvLYYUlhsV03ZXIkN5MpzY+Zxa10o@vger.kernel.org
X-Gm-Message-State: AFq9FYLPPJ+citmvj97kmqgum0nJCwIu9B9XT6uUK2jS7QF9JnQPgwqq
	y5IrseHmjelGOfOFwsKXcyJJ1NYFGlNqfJRW14ddlpdPdw66Yum89i1H
X-Gm-Gg: AYBFou0Zwjy6UoSDboasOS55iJXOiS24lXxybFZ2TKHi9H5G8br5sQuvdircCAwlX/a
	3Kt1LTh079gmmmxUQSw2xRY+uoGTlQcDONn3uwHQIziPeutE9W8oE9SyhkhfmT/1rTioxitkMYB
	jLRCKH4AZZ5A5QiR+v3GKPhWGOtjMmQzdCzvZHtCEagu5GAzb68ZBgYb8Cqos0Wdj1j/eNaes7w
	GhNRK0yAFiPyMMLhO+07cNZpFG1ke3EbsjEUNFd5aOHvA0HLTe60Cyee2hO+i8zMEwIkHATrmfi
	LEppDq8+rm9MBW/gBsLxdvWULdK1rmjhuIC76UEFKL1QxWdyRxPKWFZSi6ZgNcciwqkPtCBNDcO
	0F+h4LwA14Vx1mJNGRk57m2L/mJegRRURFbmbIBdLvgPC4B2mdy0XMsK4tU6/tQyuChBofLgwII
	I+bOUVuhjXzIcV+wNHLH+z73Mls15ZoKpwyO7/hatjt//fzlwuFXmb/svlpnZUX9KySOQoO22ju
	jMieXdqvdAjVPeZbPsL8mwq+aZd7hslmmkJVQnXT9URWug40CwBF1J8GqJp7lYZ2PtO5AkNdA==
X-Received: by 2002:a05:600c:e555:20b0:4a1:77db:45d9 with SMTP id 5b1f17b1804b1-4a1d75fe6d8mr4483895e9.6.1792166937933;
        Fri, 16 Oct 2026 09:08:57 -0700 (PDT)
Received: from SP11X1e.cable.virginm.net (cpc99340-croy26-2-0-cust244.19-2.cable.virginm.net. [80.193.62.245])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4f8d1esm6219143f8f.39.2026.10.16.09.08.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 09:08:57 -0700 (PDT)
From: George Neacsu <geocausa@gmail.com>
To: Bryan O'Donoghue <bod@kernel.org>
Cc: Sergey Lebedev <lsa.uz@pm.me>,
	Andre Gilerson <andre.gilerson@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	German Pablo Lindo <germanpapulindez@gmail.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 1/2] dt-bindings: media: sony,imx681: Allow a C-PHY bus
Date: Fri, 16 Oct 2026 17:08:55 +0100
Message-ID: <20261016160855.193463-1-geocausa@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <e5d75c47-2051-4b09-9d33-d2eb64a141f5@kernel.org>
References: <20261015-imx681-x1e-v1-0-fd22f5f3b0c5@gmail.com> <20261015-imx681-x1e-v1-1-fd22f5f3b0c5@gmail.com> <e5d75c47-2051-4b09-9d33-d2eb64a141f5@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Bryan,

On 16/10/2026 16:59, Bryan O'Donoghue wrote:
> I think you should constrain the existing minItems for DPHY mode and
> then add CPHY on top of it.
>
> Your commit log says Add CPHY mode but then it goes on to do other
> things like this.
>
> Break the two things up into different patches.

Will do. The next version will have one patch that constrains the
existing D-PHY data-lanes, and a second that adds bus-type C-PHY with
one trio on top of it. As agreed with Sergey, it will follow once v8 is
merged.

Thanks,
George
