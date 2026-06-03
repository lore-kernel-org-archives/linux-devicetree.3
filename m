Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F6933FA5F9
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 07:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780472604; cv=none; b=R5zt4GIdP24gWnW2vGcOhf3W6CRRLxDdMZm9H5UzJ5M+VoUlzSsPL0Vricou7c4pjQ7IcPz1EYF/iiexZ+/FcOZKXIRiAFE+DPbkLUKwQnZYefUTAKQ5VfTugkI4Gt1PadAsBDnK+nKkX69v2nkG16QI2RTHDLK0v2lwBplgZRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780472604; c=relaxed/simple;
	bh=MlGRy/qAAEOaDqUZDfVdIjtNFNZn3Yu77wodEkQ8u/w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s2dF0KLGZBZ+Z7zwkIOGa8R15iAU4Qk5RaWdVLYMRQLZAg1UhJAxNZ2yDSzkdWPvfuhZLm0nfgebLCUyJgF1HWkEk5GK5CioSkyB5eXlVrywfpgsQvVV8oadtxZQqxja63lRHfMeLPAG4Q6Us6BhXSj3suk8TrK7oQHLyJ3+8BE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IwFbpe0j; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IwFbpe0j"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-84229481d44so1545120b3a.0
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 00:43:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780472602; x=1781077402; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uVLVMX4sF+kg2pdf/ugOhP5GyXMNStbGUmph37aYsJA=;
        b=IwFbpe0jcEM3LI03JfjRhSCY3kU4+oEzaJMSj2FL1aye328dNg24QsUUMnBlxynsld
         Scv/+RD425XzZT94PO35ruhHa67ziHlFF8Vhv+At9kqMlijUbzACD2diBds9bzOVFQSs
         KNs9zPYJYCthjjrKDaWXNjUNOCDjxabfyVUgCpmWVzm79ZX9pU7E+yf29iw78uB+Nzp7
         rrvwzhG1OsYpY5DJb/s5FslJ4PXds6hn8FtxZ9HTQwPUp/VzkTVYWnt7yqcdp0FSQ1cw
         D+g+xdBZQzDFGG0O7CFaRqP7or1u6mchiWzKr9JQLn3md5HGz+eN54xAyHZmaKcYeoiq
         xC/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780472602; x=1781077402;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uVLVMX4sF+kg2pdf/ugOhP5GyXMNStbGUmph37aYsJA=;
        b=Sy4sCde6+BRl3nHQLekJN2jIejFqFQQNsWRioQiLvwfe2F0fJGJBUiSYzjPsKkJpwW
         TlGX3wsMIsVZ2Xtr9e51tuNiOXhW3jnmfjRCX3700jAK0/cfKWjtJSleiSkBuRrW6a91
         V4ODZBKwdkot6ITgJtrw8X9KnrbBbHMc3digCV7qrenMGulwLVIIdNhfhh7cemH/ud0N
         sTyRC5XdU4Jck4rZstOSP4W5GdDMHHodXu/SrYZnNayAPsrrgKWK61ntXPTZQH5jUN5w
         3ymhltRSLeg+EucyUbY4U732HTGYEK+/7KfFvke0LCMQnJJ1A2msENvXYgcvbvhBZh+v
         Sivw==
X-Forwarded-Encrypted: i=1; AFNElJ824DffsN8eJj8YG7hQMY8jLrfaj7vZCmdqnN3Chl2JVG6jk3qon4KbsUaQChZma3xQ+VkPq40mfOAu@vger.kernel.org
X-Gm-Message-State: AOJu0YwP3kO8SD49ujbMBmgn/vqUMP3uJ1Kv/1pD8AwSLo7VqifT+Sey
	3YjsBlpHeLD6daoLTqX4GxUNNNDolTtpe4wNkTHqLtNvmkJHQODeaaMP
X-Gm-Gg: Acq92OEyKv/bLJggXSr/wdwW7N4vDEyuwWlhO2ABn0YLXwbgW9ieVO2YlWb8uvznncQ
	AJYPZG+M/yXQZgN9DEl3h6nSPGrIsoWNx3Vicwh09NC3BKt+awF62B6+6HPHBRTo2+PUv6+098s
	DEeAwEIYYa3rkociDCt5dhYTlqmjBQiKGHF0Xf3J1MJFaaFGVp9WsnIUnBTE6d4xrr/BQ5tt4DT
	yrYSRjDdlwijJbMxngKcz8ZxsWItELhw6tbEtOOSMlgp4CUteM0+YV6UeOKWERLzWwPTzhzLgEw
	T+8XnwhL2ItUMYd+tUJ7vzyn0AnU4kFJ8HdMk07coQt16elN108l1lsd0XpSAaTac0F/fQBn183
	n/FDfhITIpbhV3vxJoREr9Ijdxj8acCK6m2qpX7Kn83OJ0eUXS4cp7KdyvTvHy+2JfnFLKe9DZo
	c/SjRKLHbc/Tr1SXO5EF408DnKkJHy2vwYP5zH2/1vgPQNW68LpRglEtUHtvPldwU0h75GeWmOj
	AIW4o0JWkucYEneinMAgKp+eEoitT19Vb3vDaJLkGEybIqRU+Gn0mZgjZkDjx8Q
X-Received: by 2002:a05:6a00:448b:b0:842:5b66:3c7f with SMTP id d2e1a72fcca58-84284b68651mr2330670b3a.0.1780472602501;
        Wed, 03 Jun 2026 00:43:22 -0700 (PDT)
Received: from donnager-debian.. ([45.124.203.15])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842828daf76sm2161223b3a.42.2026.06.03.00.43.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 00:43:22 -0700 (PDT)
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
Subject: [PATCH 6/7] dt-bindings: riscv: Add Tenstorrent Atlantis platform
Date: Wed,  3 Jun 2026 17:12:18 +0930
Message-ID: <20260603074222.593243-7-joel@jms.id.au>
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

Add compatible for the Tenstorrent Atlantis platform.

Signed-off-by: Joel Stanley <joel@jms.id.au>
Signed-off-by: Drew Fustini <fustini@kernel.org>
---
 Documentation/devicetree/bindings/riscv/tenstorrent.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/tenstorrent.yaml b/Documentation/devicetree/bindings/riscv/tenstorrent.yaml
index e15359b2aab6..7fb640e38455 100644
--- a/Documentation/devicetree/bindings/riscv/tenstorrent.yaml
+++ b/Documentation/devicetree/bindings/riscv/tenstorrent.yaml
@@ -22,6 +22,10 @@ properties:
         items:
           - const: tenstorrent,blackhole-card
           - const: tenstorrent,blackhole
+      - description: Tenstorrent Atlantis
+        items:
+          - const: tenstorrent,atlantis-evb
+          - const: tenstorrent,atlantis
 
 additionalProperties: true
 
-- 
2.47.3

