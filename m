Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E4F12FDC28
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 07:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780472584; cv=none; b=DVUUR1gqS+tDmuqLbCfuARl42oZ6PoBOOMvue9EEq2XzhVqpFFEK+67THik/CBNgIpXwWQs7tz6F5a0LyxyBZZ2CHKrlYzc/lGaCMvfaNxNcq2RMsUGCF3i3Wyh6qGnvZDKqukrEVLIAUQoB49uL8JYseRDF+vtWb+kqSLT3+cE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780472584; c=relaxed/simple;
	bh=A2DkH5DxXsAjKb9Ess5wgE629uv4Kpq9nuyYEPC4S+Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OkCkSbkn/UTs2bhvD3RR2B9QeqB9CBFuhkqw/kBlhCex33m9txj56KmJOvf6BKo3xjUHrYBdF8Z0ibd56pi8x37+CsAFR2SReqXb3fbhkT0EXBl8fhBWuh+unWrF3H3JW7FQnRiZszZ1cZprr3HleuNDQWfC8YiuRfEcBjqeKkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qapf/qsu; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qapf/qsu"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-c8585cd8400so1545875a12.3
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 00:43:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780472583; x=1781077383; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CYwjqTH3WPvxIZCafdNOD9YOFH6+ZvKtdV4vpuopIps=;
        b=Qapf/qsuc6PdIzj0yhhVkw8OA6hZ7EJaA7jT/o7hTYXOTkaD3FlWUiRAQOteVHtgML
         BklsckkHPlBiAbLYusCggBigajkZURdUYeu7gDAX4J8LMhvQiPOFuJGX+PStuHOSr6KO
         Jafq6xA/wv4X7JETf9jkyx3pCOktpZ0C+47DmpsXyuvPrNW7ajjXQSd+yWaY37t0qc6C
         G6X5E3b2Mydmpw23/AraW/mlmu3hwlU1FlM25Ur1DoFuoBTx+zhcXo8bC8g0Vpv4F6Pm
         BKuwcmuw1PwY6O6N9YsO7SicLUrAh5AlhJUEeYwCatmXQC9w36rRfgn9uzPRue2YXZ5Z
         5RhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780472583; x=1781077383;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CYwjqTH3WPvxIZCafdNOD9YOFH6+ZvKtdV4vpuopIps=;
        b=pgR7riIvl+Uw5Qe+jsydh2e48Pz/rQXkLhLO74/LcjyUw4KmIMKGeR+IhdSOzPApHb
         FM9QXoL4ouXc+LRL5ZhVExqzDIFulkFOFm4DmNFSWpI8nuzPzbkrebrxM/9W2ROrUPZM
         ipXBq8ueMZzvLkRwEtqs1npzeQLCfVdz8jUF/zqdXYSDSHMtQTz0t5TQuB87M9MNANSl
         4k6INtTLxiD+qf+eFaVp1lQEHSMz5/bih7151Ut5aVlyTa0eWlArt8z9r9XHHR0un71Y
         6l9kTiu8iTO6V5iTMysBGY6L3spmuIAvIz6wbc4W8s1BypqAa1vSgs/U70iJKwrh6n4P
         iUVQ==
X-Forwarded-Encrypted: i=1; AFNElJ/nXH8HeucAq8XHBuXOabFJVdnq+KKKkP2spepBkQHznkETzkrNc+6pJ4zwI7FyIZ0L+z0W3mV+b8Nr@vger.kernel.org
X-Gm-Message-State: AOJu0YxkJIQ0zkUxLvoFZGwr7AhwUMIJTXA9RJPiWmHgptBuHTWLf3E7
	MCVAmMzJr4np2Dt+q9G6IEpjiUrHwMkUbDRnjg1u4966jJ8295iVing5
X-Gm-Gg: Acq92OEtsoyuL07Br0ielsCh0R4hTDaSQkk47HXiqBZGQx89dd075+Z6XFNRR+Rnd6/
	u2q/FEHoj/4uYYviStluWK/lk/1yoVhby6HKZeOHe1L42pjCmTzs0Pxugr1HXfJ17xtqdoVNTP0
	pPRBohqlQfGkyWxs572TXVDyg7GMSOIT5CMvW04GHjnE727ZnAPxblSMU/CFLjR/JYweM+Z13/Q
	SFz26RXdIcK6lvgwnUbKWkizNEvAagoItHQjg8PoZUGOtHmERYyp2/HCy6WoNSYPtmfjk0O3OPE
	2QxhDIlqsrWgFpJM3385Mo14gm4GyRO0CYQYYULGpDzPkkbHch62tjXy7etrxt3EPv8Oheopg9D
	SupHuoi7meHe7NE0hW5ZTM9uCqKKZq5JuLmkhqVIxLpz2z8l1Nt5tK1J4/vhnYYubBjRbebEHMZ
	Dp0sL8Gc9fKgNqP5sfzyTHsKepzBejGvWVclmZXp5XOX5akTDc6CXiWh4QYbDMbI4HN/Z6uElVq
	jPaRMa/YAU2B7rAyJnfan8ZzsXtgFoY+iPsu8zfWTFtdNCaK1djcnIK4nTReLHi
X-Received: by 2002:a05:6a20:c783:b0:3b4:72bc:5b86 with SMTP id adf61e73a8af0-3b4977e30c7mr2399869637.16.1780472582830;
        Wed, 03 Jun 2026 00:43:02 -0700 (PDT)
Received: from donnager-debian.. ([45.124.203.15])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842828daf76sm2161223b3a.42.2026.06.03.00.42.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 00:43:02 -0700 (PDT)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
From: Joel Stanley <joel@jms.id.au>
To: Paul Walmsley <pjw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>
Cc: Anup Patel <anup@brainfault.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Nicholas Piggin <npiggin@gmail.com>,
	Michael Ellerman <mpe@kernel.org>,
	Drew Fustini <fustini@kernel.org>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH 2/7] dt-bindings: imsics: Add Tenstorrent Atlantis compatible
Date: Wed,  3 Jun 2026 17:12:14 +0930
Message-ID: <20260603074222.593243-3-joel@jms.id.au>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260603074222.593243-1-joel@jms.id.au>
References: <20260603074222.593243-1-joel@jms.id.au>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add compatible for IMSICS in Tenstorrent Atlantis SoC.

Signed-off-by: Drew Fustini <fustini@kernel.org>
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 .../devicetree/bindings/interrupt-controller/riscv,imsics.yaml   | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/riscv,imsics.yaml b/Documentation/devicetree/bindings/interrupt-controller/riscv,imsics.yaml
index feec122bddde..442b8870f9c5 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/riscv,imsics.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/riscv,imsics.yaml
@@ -49,6 +49,7 @@ properties:
       - enum:
           - qemu,imsics
           - spacemit,k3-imsics
+          - tenstorrent,atlantis-imsics
       - const: riscv,imsics
 
   reg:
-- 
2.47.3

