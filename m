Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59E4613B293
	for <devicetree@vger.kernel.org>; Thu,  4 Jun 2026 14:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780584058; cv=none; b=oyeM5puOutqmugz6zGCYSHNKmSdBK7yOxJ0lto4aLE171quv9hnHCgBGKR3o3XCqUY4Oh3MWGxEiArOEeAmnnP2O2wvQk6QiBKEas8huLqybo3T+REKsL8Nu1yr193+xUp3ONyAV7JhyWOPvkkkF16tk0Qkp31vl7jcC0cMmGLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780584058; c=relaxed/simple;
	bh=6kv+QWcIYT0Unaq/4rUK+cqBRmfAL8I6LNIDZgxydD8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Sc3/JA2mkayOwVaeVWSgrax7Sms/qGPD37G3GaaaJtXP4//R0aq1/3gES8W2bVMfTfrbQZdEHJq96/yUR3Ubgy3flzk0b+ypUjEQTpxqTCKoiTGUwJVmSPPT26szZ0+rx6GSfJ+/sLRpK8IXD1Zy0czph+LseOD5uBzH/BJdfAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SXnIkxZO; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SXnIkxZO"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8423610ec93so633386b3a.2
        for <devicetree@vger.kernel.org>; Thu, 04 Jun 2026 07:40:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780584056; x=1781188856; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NTP1FdYJKyClj5etDwLlPJWswFEwXeqJc5g2KUfLVbs=;
        b=SXnIkxZOq4dbS8ccxy5m4h4AywN8SnisRdGMIJqYddokBX73wg3+dTwrnmpvo98I65
         yeDcGQ0nuYi22N/WWironNmuqAdDSdVRkkYkDYhZa9d6f+w968HQ4WeylxndT1KOBsdg
         WVP6gv7o8ZYKhiJqb5hywNORag3L/cugVkcaVPx7h2ZaQ4zSYAqc3zbYZT0cO/pRo0Gu
         ziWk2PutKJ/Crsjuaet79ywqNleWlk39Ycg3wDLsrqp792mS4vww9ifhZ5IIRFcte4Pk
         xF17BLReNM9li677+F3MVXpo0Duyb4vguqHwx4BCiO2FPErXb0rEfkE3Y7hf0DegMiPl
         yZfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780584056; x=1781188856;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NTP1FdYJKyClj5etDwLlPJWswFEwXeqJc5g2KUfLVbs=;
        b=HXu0Ady6jqsLtYDxvzXU7joT1CnAdfQBl7pLnIsuR7ab4GbJtlnV/E6Npq80TkKNJR
         efcXVVSynd0m78g2mbjpXyAqn2+KlPzwCvDeZ24Zg1U8nVF6p4X0l4LC63IqvRskWn2o
         KrQqIimglyeq+eXZUl1xBHXRrOdilrUqQYQwzO6MDN9tfj2WN1vl/+qPjBsaVuntY5lF
         4KEtQ67NVKQY9ySbpOduZlZ7z02IHC2QMrerioe0+QobZahjhj1b065DlH6feC9eSHk6
         k7ARZR5WtKUJHZ/Bdv0i8wjGTU2btpEd+8PKxUAZEMoIzXx9H5kjhiDe1UOmnRwFAPtU
         X98w==
X-Forwarded-Encrypted: i=1; AFNElJ/gip3vPivjQ4YgTHeZjxMqfNpoP9rqV1xTkfBybwA3OVABLll8RuKirGzmlwMYYapIRKoHVWVmPJVv@vger.kernel.org
X-Gm-Message-State: AOJu0YzouDl5RFFSfvMpTjKfFWWNHs5wENyGWOH7Jtiu86H3ZmclPp/P
	fWqCjSgYDggxh4H1N81ihdvsmOYonortAlKDrRcwzBjb+yYsgVgWUR2G
X-Gm-Gg: Acq92OEQX3l/9mPYLj29Dj6paLfh+tpbYQteVKK0YcW2LGXFHW8/iGtqZR360QRA2Ot
	0Up+Q0Kd+ioZVaZocOQOQ28wx20apntcasbps/ny1fXo1emPuIfY2BvzJkbZkr6tfn2RBR8ObF2
	hsUGOX6uIKjuuVjBxJEzrsXoimEFIEmDc0DC8wABdu1tlYiQn0uAWoAjrndX+VCuJi0Np0IGKyA
	0S84jka7YH3C7gu1WGFWQW4Lbo/cxIZ2jRL6yc23teX54Sem+l/vHui33ZhhyvcFGjrJTYsJl3E
	hMhA1PBqNSdyRNmTRsqg5N6e1OSPFogbfsGK59TEv7zFREwtQNC8mM+5BdlAgtgxE6XIab+Rpns
	ZTZbaewbEDmGj0G/qMIjl2yEhbH79hu7Zc9adM2CWF2d2GUZz0Y5WEzS6eA0dciBCwFH+YiYxNN
	ET9uIuq276UycYcbo9/nTpSkH3+ffPU0YLeIVjPsLR0/LjglT484CtUPCC0OPaiQaYq9lWN/QLC
	7zdRblkG2un3HEZk4DkS6c0EuttBQTOs2jtJ8dlNOuJOjs8kPeUoTq7QYu6Mx+2ZcJzqCgZV4I=
X-Received: by 2002:a05:6a00:2296:b0:842:6d95:261e with SMTP id d2e1a72fcca58-84284f490d5mr8472450b3a.41.1780584056532;
        Thu, 04 Jun 2026 07:40:56 -0700 (PDT)
Received: from donnager-debian.. ([45.124.203.15])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84282372868sm7279753b3a.17.2026.06.04.07.40.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 07:40:55 -0700 (PDT)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
From: Joel Stanley <joel@jms.id.au>
To: Paul Walmsley <pjw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>
Cc: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
	Anup Patel <anup@brainfault.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Nicholas Piggin <npiggin@gmail.com>,
	Michael Ellerman <mpe@kernel.org>,
	Drew Fustini <fustini@kernel.org>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 1/7] dt-bindings: aplic: Add Tenstorrent Atlantis compatible
Date: Fri,  5 Jun 2026 00:09:47 +0930
Message-ID: <20260604143957.668047-2-joel@jms.id.au>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260604143957.668047-1-joel@jms.id.au>
References: <20260604143957.668047-1-joel@jms.id.au>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add compatible for APLIC in Tenstorrent Atlantis SoC.

Reviewed-by: Anup Patel <anup@brainfault.org>
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 .../devicetree/bindings/interrupt-controller/riscv,aplic.yaml    | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/riscv,aplic.yaml b/Documentation/devicetree/bindings/interrupt-controller/riscv,aplic.yaml
index 0718071444d2..d4e17861eda4 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/riscv,aplic.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/riscv,aplic.yaml
@@ -29,6 +29,7 @@ properties:
       - enum:
           - qemu,aplic
           - spacemit,k3-aplic
+          - tenstorrent,atlantis-aplic
       - const: riscv,aplic
 
   reg:
-- 
2.47.3

