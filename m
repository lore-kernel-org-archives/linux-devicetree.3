Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795760183;
	b=hyO3nHTmvzOUEXaEmoKt/GX6psiv0kwtgZugVEwKKMm25wCiiu00DRti81bNNpcDekcU
	 HfJ+J6rQWp5DYsOrHg1Xg4YN+cgI8jrpS7v6decEEqSHHBKuoYxZo80LS/ELsIzEMWqii
	 MzItuJNQoX8AefdHF2pokVeslhUpe4NtESEJ0n9GPTjAlCyt3lYvvBNfNyUq4I3h6yF0x
	 h6+TvBSAzj3ujmOBX3nS+Scw0HF8XNn13dQ7cp23wPfM8mPwfS+8bKXkaxFW43GkMSJLv
	 4Th5gxsc/ksZ5W59T1QjGJnz+KyKRFpH590/TkR8HmvNMjOLkNUIZ8wj4DKRi7h6I0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795760183;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=9kQ4FNw3OCJ6/ormQUi4fQ9yOioSJH7BH/0oAtcrFok=;
	b=wMhIMNTCmj9SI4cPMco8JbOaOrGcZWm3NClKs90gP/dZE1Ymdc67hd24O6I2L+UTWq1t
	 A9xwZpoQF/sgXhULeOe160yTuJaIyLKEhgPfqDTB3EHFybRM5OI9qQz/RWa9LcxYtSlmW
	 x42FcTG1gTFXi49QeQs8Qkuq4Pic6uDTuf3xAmUuYhmu52ff4Ypq6afoDuFwL7o321Tpp
	 VcP2hQyE0XE739cmg54IATpLMPa++cKiCkmVQts0mfZuEjpRElWv858ovNJgQPXt2pjv4
	 7OLJC7+fSliFZlXVzmrd5qicJD7oCk3Qe2AsDpb/H3niFe3YibMHLvjZbd5yxAnwE/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=jms.id.au;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="En/p4qIh";
	arc=none smtp.remote-ip=209.85.214.182
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAE50606A31C
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 06:16:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EAE50606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=En/p4qIh
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2f046b0adc0so44176255ad.1
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 22:16:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795760182; x=1796364982; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9kQ4FNw3OCJ6/ormQUi4fQ9yOioSJH7BH/0oAtcrFok=;
        b=En/p4qIhMI/KlMEiNsGgTnyE3MIMmTGSL8fj7vTdQas2dhEaXK5U7o3B4NasDUkzde
         rj3uRH2ZaB3zEl7R4DylAue1QSrcOY0mPMWrnpvPvAIxy3YAA34Fp9fTeesna2t28Tkd
         Xw/tvtk3qIxQt9O/3+srTQAFs7ALk+Fb1nt0rd8kPiM8dbo9HO6pTjTQd6q8kcwRBuam
         9G+1KEdd+qaXnyBgyiZMwD6rGj5EAxK5Gd4URDV0ST6GqCkUBxeMb7aZgtChov/e0Rs9
         5n6C46DdX04dMc7e7WvjamY1nBAsXAtA7VvV8viXAyiAJLBVkAOsZmtZ5ayXMBXyFNkv
         XAbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795760182; x=1796364982;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9kQ4FNw3OCJ6/ormQUi4fQ9yOioSJH7BH/0oAtcrFok=;
        b=BZwLoidci6H2mxGf4P/kYr+MAGNeB8ZLzI5lCIwa08eOBfWUzRQ2WDhFKcbNMSZO29
         ocZKQfp6bwpHfQSUeeb++s4wpbM9gW4w3PL0zEridGLwNzxR77I0OavXK2nhcPdIvyfh
         bZU2nIzkQU8FKiUdCFEUa/cxQHIAoPRPLwgxwcw4sA40wRvr8EkmRbH/lM78Xfiqw0gE
         SR3/KNkIW5VowzVvQIGxxApqqEH5AYCZErNjab5g4lvzb4azh76H+hKDfkeHLljHgY/L
         BIVA+2z+MJrItQO1S+utbx5AbQQjm1hdHcx7Yo3f2GZ7P0+awu5ibsXZD1QZtBNMftds
         /0Ow==
X-Forwarded-Encrypted: i=1; AL+hErG43dCC4ehXOououeaZgg5j09nXVJ3uVFP6KnqdU6NxTpOGZo/EKFNoR4p2ZHLyNv+K1J61qvCQf1M/@vger.kernel.org
X-Gm-Message-State: APuU4Z/bl5kbh4pYBymVFMVB84v8xB+DnYoYa/xWCS2YPw7GhqVjudpJ
	wvaE/mwykuLFkjCt/7BnVJNn2avjSi+szsyX/YsHnnkq/9eb8AGva30z
X-Gm-Gg: AZFdTZfZMlKI7/3QJFMhD4c54xI2JjhSpeKpctpSz+gUfNx6x9AjL76CzBaVEFRGlnf
	fBBtL81rSP97iy9KDYLly2y4aNO+tHJRWKG+YypWKAK2u+HZCJ47FjrEptKDcmSTJ8Z9Dg5dFjK
	teABz7/YcOvWKM0BWGcHLuoDLDRkSbmoNUKX1i5JZ2vIsp7v6SVao88UtDEwwXKsXW4bQRS3DMc
	nddWrYNKwNk5qLoMZZPuppz+XJGOxpk/cGVYS4BMDynQl+KDUdjWq97/fexaiOJ83aMzYRlnaQ7
	i+PnLHXii8SWjO7eB5nbhS7Y/9lxdMDP1UnbkzQhZAG+5pJz7r8FEKRrNhdElVl12S3VUwlfpYl
	WVkebO/LkyWFrO7ku7jo23hYALiRjq0WwBLjIE7CkaLFTkTC+nWqd8s/peUDei49ZAddLlyR6rR
	c6D0cK+9Ahim+NEdsVNo2Dm4IFE+IQ+sSc91fV85x32A65zAzgpACQR0fhjqmYRgv9iOE3cH4eq
	OTWtAPFc+DCuC2/pmiJQvNE/Ln31p1QE05fWL0EZhbqKsLpNWoKhjBE03X48EGinWdNVjAPoqnm
	CG86Bg43Uz8dNsaGNzESB5sDKWWMVvre50DuLygIVPXCJwgqryUSZq+lFXZ1nR1y4StpXMZCR9O
	WT6Rj+aML9RbUhVtwSWvq4nPeiwMHQqH/e74nkxYttrgjjKG9a8SvM/cA5v7nLEI=
X-Received: by 2002:a17:903:2b0f:b0:2f0:3278:706 with SMTP id d9443c01a7336-2f03f181867mr210364255ad.54.1795760182204;
        Thu, 26 Nov 2026 22:16:22 -0800 (PST)
Received: from donnager-debian.. ([180.150.112.169])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f0dcbe3sm114829495ad.28.2026.11.26.22.16.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 22:16:21 -0800 (PST)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
From: Joel Stanley <joel@jms.id.au>
To: Paul Walmsley <pjw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>
Cc: Anup Patel <anup@brainfault.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	Michael Ellerman <mpe@kernel.org>,
	Drew Fustini <fustini@kernel.org>,
	Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v4 1/6] dt-bindings: aplic: Add Tenstorrent Atlantis compatible
Date: Fri, 27 Nov 2026 16:44:21 +1030
Message-ID: <20261127061432.17306-2-joel@jms.id.au>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261127061432.17306-1-joel@jms.id.au>
References: <20261127061432.17306-1-joel@jms.id.au>
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

Add compatible for APLIC in Tenstorrent Atlantis SoC.

Reviewed-by: Anup Patel <anup@brainfault.org>
Reviewed-by: Drew Fustini <fustini@kernel.org>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
v4: Pick up Conor's ack
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

