Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795375139;
	b=clYZlVUsvoKYklbHcCprzolHabQsugl1G5Wr1RcCsjGdNz7wWdk8OfwyedEvs7vlsT3B
	 d1+5GpdEj4tfocl99yMEnGaBVLT1C9nTalfpvfC4R931+SXSL23b9ConQg5cpyhu+QTVq
	 w5fXppqJGLaZZ2BUV7uIlxkNFORQg/CHWWK/8rNHC2wrZ76oxapozleOYFDRmJGpP4xkm
	 0Oul++m9G5BC6uqZhfKqKFdmxvFZRsrG21uuytXswlCgNUqZpQmPhO/ZybSKk08Z8RoWL
	 PC7epV4UVV9g3G3hsQ0c6mDIEhuPNZcv7VAm0JOTUVkhAfQpKYlUkxCRK1jj/eSN21w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795375139;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=JgVB/O5hBKCdOeqZ2JLGG3q/f4KIK1fx085LNchkx34=;
	b=uFw3rsA7X0tPEe7LAsTwqEZyYOctQd2eosOeXJ45pjk+6pHGyrkrAyd4+46Yqc8u2oKi
	 EzsnoYzTmmT3dWRQiQUhiLaZsPfQU7N7PTFiUQETayr2CNoCaul94PmcR0asr8wUWbeyy
	 rddyWGu9bNwnqDEF5DGt4/f7FWdFBi5rW6isKX5oPLd5c28lAaqZNavpGFoOA68yUNCkd
	 P9t/g2XTsO326nv3wLqdSfPKK0Ph24uZaBxop0ChQnProsYbBQwmOwMcgQULYB8DnKjqU
	 DapMmJm6iwtayYa6/znVzGrd18D0jbvngIC0mqgSI8gE9uvFSymjdpstRhPYF7nrdWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=O3UjBH3C;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DA95606A31A
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 19:18:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3DA95606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=O3UjBH3C
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4bb72b44a97so20866955e9.0
        for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 11:18:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795375137; x=1795979937; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JgVB/O5hBKCdOeqZ2JLGG3q/f4KIK1fx085LNchkx34=;
        b=O3UjBH3CmNWhcmGEJhbSQHkXs5PNu0jtbxwsuPUdWbYk7HhTLqUQCZVRasMZgp1kjv
         KSBaZEyIvEJ4mxlaMSVnEuZf+DLpxMU/XKVPPkZfy1Y35+CnkvifWZf8TqhkE4zGEJk9
         R5ieUAlv4aqfeP+ncJ1fIhK0aCwtizM756ibsGNChZmUkb0i63l00NI64vNo0akhcQpn
         i3CK4KrtHXExRUTQ2/xvOcxl6EDgLx5Z0wbUXODLYyx9OoPZMJ8oX4QI+gB9TumKtHpj
         XqmmkOxo8RVqcXnVO+JR/1tjk7vjPWNboEesTNetWxR7w5fjJwVkdrrBiSWUV+D14hc2
         h11A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795375137; x=1795979937;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JgVB/O5hBKCdOeqZ2JLGG3q/f4KIK1fx085LNchkx34=;
        b=OG9jJ1otL7582nIhnPFBVYsNB/pSI6vy7azEYP3HtFY/zL/4tSO8kuQK8u2MHvHopd
         3jVhSNj6hyMUR+Zmpiw8k+GFQXpTNYBuM6kqfR7t8yFJ0IjJye2PWNF9C4OJLhKaaP90
         L2B9SlrnM0fB5Kga1Xiq8Pa1lfSk/U9vynHsheVQAEO6v2GNwelvgnS5eBMuoX327d0R
         TIw3jGzqf9bj8o9+tATSc8n6c71X/abKDM1qbLL8jvvhFl3S71QwqnBrYeHCtmWXl21U
         HZBFen7IezcVFGUbSw7aIucXfgsctDGWMUoIlnCnUXJMJXoT24wk3snhMkg7LU1S0y4g
         jM1w==
X-Forwarded-Encrypted: i=1; AL+hErFAKrJosISTBfA6m/b06PsJYyQiMkF4igufGDpPunRrLyDBDT3FL6qgvm0JGFSfxvGsYmSXnjumaJnA@vger.kernel.org
X-Gm-Message-State: APuU4Z9T/OXj/uL8AewswbjO5i1G4fE+Q+mNW8qdkkuJ83r4D8HqsTyI
	yM+gdLo2lu1UtmGEKOGSJwpHcRbgPCsBNHiswk3U3OToFl8ztQWNhhn9
X-Gm-Gg: AZFdTZcI2HHG+eu5ujcjaAcx3gHaZqtOa96aeNBwB9tsL6BVSwIEp1XjCKWNxc9O5JD
	R0WHqv+zXIgltUKd18DpgfBUDdpNCIHH5IXaiEiBdvGOD+B3y+c6CVmxJ0pT2AV9+WRLrcY7yc2
	4anP0z9umMMRZ5DadUmFkCL6TziM7W34OQeSTsp1Zca5JwAxjPZxc7fG9zE5OMS1/jgWRqTUiAA
	ujcWWZQ4ScATLdsJhAogthS5+u6cAnTK6RHIHQxmk9m2psqHiG0gbZckbO+3D6k9J33WNNrULZB
	wBR/c4VOfClckv2pe3cpEWPB0kShiEtgnX1Xu4RBgDKx50L3nidE0vhLlXAvu3guoKa2Z8q9NSb
	L7obT8DrPo7UKUSTMxtaPlLMwkr4WCNktBFeB/c/U+nubxZQ5U4oGNEYEQZc5RmUkcI5HpTj9kv
	/rOqKtqyEtWJhf0rQq0GmqfnLUEE8lLv9FreHQq/UhvYk8JNqs+icUwetQO4GYQe9vo4myoETZs
	4CI9bkC87fNpyJe+1ieiOM0Brx4DPUANKQw5vnDbd0XLhJz/MFuxuYklIB0pCKGwWYX870VQSIN
	JSKEt0S2XbC+VV1IKmwNKgFlFliuzceyGhIB+H5S1PN4iZ4A4NUGTpOeUErDAS6xfw==
X-Received: by 2002:a05:600c:1549:b0:4bb:6f45:2a77 with SMTP id 5b1f17b1804b1-4bb8880abf7mr193493515e9.11.1795375137482;
        Sun, 22 Nov 2026 11:18:57 -0800 (PST)
Received: from cachyos-x8664.aetlocal ([2001:bb6:e78e:9100:cdb3:c7ee:74a4:5189])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb90660cb4sm199176045e9.2.2026.11.22.11.18.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 11:18:57 -0800 (PST)
From: Mervyn Pretorius <mervynpretorius.oss@gmail.com>
To: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andi Shyti <andi.shyti@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Min Lin <linmin@eswincomputing.com>,
	Yulin Lu <luyulin@eswincomputing.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Darshan Prajapati <darshan.prajapati@einfochips.com>,
	Pritesh Patel <pritesh.patel@einfochips.com>
Subject: Re: [PATCH v5 1/7] riscv: dts: eswin: add reset generator for EIC7700 SoC
Date: Sun, 22 Nov 2026 19:18:55 +0000
Message-ID: <20261122191855.2183827-1-mervynpretorius.oss@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261015125454.1381941-2-pinkesh.vaghela@einfochips.com>
References: <20261015125454.1381941-1-pinkesh.vaghela@einfochips.com> <20261015125454.1381941-2-pinkesh.vaghela@einfochips.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Tested on a DeepComputing FML13V03 (EIC7702X), on top of v7.4-rc3;
details in my reply to the cover letter.

Tested-by: Mervyn Pretorius <mervynpretorius.oss@gmail.com>
