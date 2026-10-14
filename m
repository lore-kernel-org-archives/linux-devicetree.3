Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA42E48094D
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 07:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791961709; cv=none; b=GE++clcSQBWnTCxsSlcLo4utFOv0D7/s9MS2Uq22b+dRF+EC+y6VZxRUcYVGqtzluzibgfN5E33FmSGRSPSs/AaIuIf1VTmlM2o21kPOJPmrbXVgvQJjhghbbzca9rPBk1Iy3jNssCZm6GZ6WwLY1JXKANRLxxgWrnGm9ektfoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791961709; c=relaxed/simple;
	bh=0qtI+1ruZBNaLTkzRZwiEy3kiz2UbhsH+GjByvYkReM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qFi0j2dU1P06Wn8tJ+gnYZoAYyEbA280QHEV5bLeV0FnBW5x7ldavDfxHnl0CcTxM2FRGhR98/9iXgeNCT/6xYMlxXaJORoZ916CjGMg6aWmvNuzCWQqKjvYklbgR+xP6JPDBW4AGPt9aGdAjuJ/dS1bSQQ0cYX5e0ge8haTdcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dBgBHQwL; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dBgBHQwL"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a16bc2278aso26445825e9.1
        for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 00:08:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791961704; x=1792566504; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0qtI+1ruZBNaLTkzRZwiEy3kiz2UbhsH+GjByvYkReM=;
        b=dBgBHQwL1t8g5LsC5lSrTpvlB4s7cDy/EKi90yBy83MLRr389a0yAI1/qp57HivSJo
         NC1VLfnhnubCA/iCqdETRohJZUtp40hYL5Lf5C5pCrwCO4/NS0cKh593NlqNH+93WbfS
         8f22BPTHeedh4WC5XFYlFLUMBjZhvRsrWklUHxUj6SeXbWfHm5xadaC5Eu+6ZOCmWjnn
         D61CRrEyw8vWLrpm+kkxwfv3feIUqh5V521fOMQ5pF5+40zMFcUdnn88WDVLJLwUWhbk
         mH4qEEd+HqAHHW13M0Dx1KnI6eXq5eM/f+Q+JPciZqX2Wv6HHqkZmgYBEDBxU8pMWNXc
         +VMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791961704; x=1792566504;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0qtI+1ruZBNaLTkzRZwiEy3kiz2UbhsH+GjByvYkReM=;
        b=GG/E28/WlFCWpDDFwKWlE+gCZsSqvOzCXYigTnYv/4lJv2m7l7MfT1QW/pe6SlDM+f
         UaVx28G8gi0Ka07PB6c2EuSllPSAk957rf/cxHHz/bdmBk4jotiqpym71mukJdyZnEzS
         VGrrVQ9aH2kLMWD97aWuqAjI79vqQrD2Hr8vzF0m1G2Hok11ckdnGJz1ISq03c2BvTkq
         nJPLIZzemlhe59XGl47/H7ZwfNIKkU6mkY6wu0PnCYPFKzFG8Jdzul0cWHyTA/NEX8Zn
         lfkN+BO0ZTyBKvAbeq6pjf55IJC2E6TUvC7qR/HS+JfCOdCiECGk3hT29nbcLAea7QB/
         9AFA==
X-Forwarded-Encrypted: i=1; AKwUvBzasraEhXwZAMvznKnIK0cdym9JC3PrXxgcVBw3oDqenbrvBc17BxiRJBJ0V39sZGsz9DWvXZ4Re13I@vger.kernel.org
X-Gm-Message-State: AFq9FYISu/nXD78OUftAwF7Q/ESzRTbOMD8gl4aUrz4PSXWmMpyR6TF6
	NZ7QtRIAep0S+AjJmbwTfwJSNFc+J6wLDRxWHwH++F1IxqNz0LuysBXk
X-Gm-Gg: AYBFou1g8AG0EHN8WUbtP3E4Va4a/2MAhNeGyui08XZ6rR9qBL6Htw92o1wZ7ElMm7T
	T/0w15LsHQ5ILBeGslCRetNlaOYg6Pi9PcKHPQXoLs6F4G5T8mufghaSCbqjmN2kwilPKxzMzPm
	g1N26sQfLGfO0LV8LtvFfVM5pCSRsozK6D7p3A2IQSfkxTcg7l3gBFRbGgwlnMQ8K8N5/5wcVOR
	iCu1iZuI8d5ayOJgDSpU2cVbpTgO1YPsVFLBPG0io/1bVbJf679ZilujYArVNB1wkLM13nCKoIi
	acdLbPKHTn3Ar6eKveaO0+Dxh84dIW185mmnkhwvO5UnlhF3SRs1uxnyQvzut3GduzEaL1Kdoot
	uiq2SXwAXvSsw5a6YQV5DQpkrM0zZEBqxYcuZsATJMu+OayfzaYxk9LH0AE1q+VU1l9ewL3Ab4O
	2JzYKMWDe4ZiMzzXbzIUL6DVKzEXytvpac9HmOsqYMmNpTRQ30sFRpb+G1TTZiHzrVTyJ5ZDeXV
	mq7kDRJWc43eK/dV8Hm5Be2zGRh3ueRZE8EW/G1OBSTOlYRpbZJxMHO36vz5NQXUjPFPDYXf2Dp
	PkevZ7RzE8vq+7Ye3k3DfbxNE3jwtnOg3FnNcdBfvd4opGSm3FQcXhASit1N+g==
X-Received: by 2002:a05:600c:3ba2:b0:4a1:acab:234c with SMTP id 5b1f17b1804b1-4a1acab23acmr109596385e9.10.1791961699061;
        Wed, 14 Oct 2026 00:08:19 -0700 (PDT)
Received: from navid-pc ([2a01:4b00:a856:6220::a11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1b481b7f8sm32291785e9.3.2026.10.14.00.08.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 00:08:18 -0700 (PDT)
From: Navid Ghahremani <ghahramani.navid@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Navid Ghahremani <ghahramani.navid@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	=?UTF-8?q?Stefan=20D=C3=B6singer?= <stefandoesinger@gmail.com>
Subject: Re: [PATCH 01/24] dt-bindings: cache: l2c2x0: Describe ZTE device-read serialization
Date: Wed, 14 Oct 2026 08:08:17 +0100
Message-ID: <20261014070817.1718976-1-ghahramani.navid@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261012-eggplant-nyala-of-mathematics-5005e8@quoll>
References: <20261010130024.177503-2-ghahramani.navid@gmail.com> <20261012-eggplant-nyala-of-mathematics-5005e8@quoll>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Krzysztof,

Thank you for the feedback and guidance.

Dropping this from DT patchwork makes complete sense for the RFC.

Based on discussions with Arnd Bergmann and Stefan Dösinger, I have
decided to decouple the contentious silicon bus/cache workaround
(patches 01, 02, and 03) completely from the mainline platform series.

For v2, I am dropping the RFC tag and submitting a clean 24-patch series
covering the core SoC platform, split CRM clock bindings/drivers,
logical reset bindings, GPIO, Generic PCIe PHY, PCIe host, MDIO,
Ethernet switch, SPI-MEM, and board DTS.

I will ensure all patches in v2 are properly routed per subsystem and
directly CC the respective subsystem maintainers as determined by
scripts/get_maintainer.pl. All DT bindings have also been verified
against dtschema and dt-doc-validate with zero warnings.

Best regards,
Navid
