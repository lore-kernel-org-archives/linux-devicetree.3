Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D32363B9D81
	for <devicetree@vger.kernel.org>; Tue,  7 Apr 2026 13:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775570087; cv=none; b=u+18pVfrkWLy13MqcVd9xgQCq+f5dvmFgKo4WJqEUukDlz/E7Zn00IylEzsnOFdjHuUehprEKCa+72khhJmhLc8hrXYz9Pyui90vj2v77J8mJOBjoqb1sfAdaq/ShmY8fNQ0r4oF38RaGvxsGNDyO1Is+LKdOQsFfrpSuWU2J2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775570087; c=relaxed/simple;
	bh=Hk36uMGemdglD1N155LHlYS04DfWcX4jaFk3m0XEMoY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ey7AjaWISB6relEexN6dPWhN3A2jTbR1nFMGUbVKwd6/7/KLHrZNwX4+8f6NMAe/YiBhnjU0Dv5EMIFhM6dbiYPBPeQNKIpn4GqpJugqzk2lTyKNe/1rZH/INr9dr1rfvr4GvBTdOo6gHQ+UbjvuUvSh8ygl+ScViBJak/6QxaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=etuRqOXy; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="etuRqOXy"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-35da9c0c007so4810394a91.2
        for <devicetree@vger.kernel.org>; Tue, 07 Apr 2026 06:54:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775570085; x=1776174885; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aGQ0vmmUWIBnqyUaESvXUUOwisanulkIR/QFZEP+UTM=;
        b=etuRqOXyVghv6SVkhP/0/tamBlJzOx+AU8x0O2bAyEOCkIg3jbF9bqGfiEc1KMBHCj
         VJ+sakFBVg16IeyBBI8MYDLaELVKNJePQkY4ubynE3UFXySW3may4CvA+J5DRW1Rr4f0
         Bb+aAq4uO6etTMNYOA+SAzOx4cw2Fbm+8k004hHMTT4w7q1IHxbZFLFLIPCDRweVTmc/
         AHw54bzOO2ulpjLuC4p13VRfRqEFmezux+CNdRR2qJ/Kz7SzvKyoOQJKCHBeASSjb+HK
         tvZ2z1bDH1K2elfKELDGkSyYS5APCXUA6sWC5UGQXoC+8tKyr7pgcHOTQkFaNDmqKsmI
         To1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775570085; x=1776174885;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aGQ0vmmUWIBnqyUaESvXUUOwisanulkIR/QFZEP+UTM=;
        b=mWJs3V0BM+VCQBczIf1FBvGEuhlwd4qo+m5t+5rlQcinCF9qItKaylx1TrbdwR94OE
         KX3W28rH1l3XC4ZN+PrY04hmkP1XFP5js5BviM6ahJkw2GZbo0TMyD0LzyafhujP3tO4
         A+zj+RmFJALdBMHqOYvi0MJr5r/3tOZPfDGwo+XRTEqQMbK+5mamf68MoSYfwuq8KLCq
         +JI/CStyJTIUqA9g+dcF1PAUYjc65x4+8dJZx7Y7OXqXAJHCVJD9bs+Hhq2pjkWOtBbJ
         EVtqHEt08YE+wbmf6GAjRTm1RviuV68f4iKxCzCda1GoKxveAUQBSNclYQew0OWX9Wud
         h97A==
X-Gm-Message-State: AOJu0YxSGIUVcvi7i5xU0AtRDK4bKiF5b2aXlgNn9GhkvpUZIAWaMoig
	2hzU7OhU2s1XaKYNRp61MixhAF/hAgfc+kO1zE0kbE7rLBUc9JlqKMI7
X-Gm-Gg: AeBDievPYt1K4KgRjCHoqBC2DqxR8OUrtE4StpOSfjwuC9nx6dXLoNB9jjHecHbXS75
	SudLX2FKtvcRKvkzNbohaI6Yml9hsSIlrBCXGa2YOiqdfV3KF3VG4EpA+at6Fhk1m6OgqIxHYEo
	vA7fjXoQeYY6qE3YnhywnEOogFjum5E0kXv5t+YRDxkcMwRtXRSCEkRB3f1VXKhMaQbZ2t+2AfG
	HsIHBZ9J2vR1c8c76hpXWLlMkNASYiFgHnufuTVVTAaMamXo6qtxS4E5RYRKhGE4oFyDQwF3NxH
	lgNTJE7geTUaE4Z8GjEP+/Dlh/8D1R9epbnSUCdJNo32fnomRz2fAj5HrqryJ9A+4cTTMMTG84g
	hgi2iDWxr4CZ2nKLeyi+fsm/Y9rt2ncJLnvsm3cVxYJSGBmwsEcgaXdZZkJwz6T2EJVIqbReQOc
	nOvK5c7eCaMBpPe7aCMNE=
X-Received: by 2002:a17:90b:3bd0:b0:35b:e529:7089 with SMTP id 98e67ed59e1d1-35de67f0e5emr14853030a91.10.1775570085230;
        Tue, 07 Apr 2026 06:54:45 -0700 (PDT)
Received: from [127.0.1.1] ([218.32.81.133])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35dd35364edsm17111559a91.0.2026.04.07.06.54.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 06:54:44 -0700 (PDT)
From: Colin Huang <u8813345@gmail.com>
Date: Tue, 07 Apr 2026 21:54:32 +0800
Subject: [PATCH 1/3] dt-bindings: arm: aspeed: add Anacapa EVT1 EVT2 board
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260407-anacapa-devlop-phase-devicetree-v1-1-97b96367cac3@gmail.com>
References: <20260407-anacapa-devlop-phase-devicetree-v1-0-97b96367cac3@gmail.com>
In-Reply-To: <20260407-anacapa-devlop-phase-devicetree-v1-0-97b96367cac3@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 colin.huang2@amd.com, Colin Huang <u8813345@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775570079; l=882;
 i=u8813345@gmail.com; s=20260202; h=from:subject:message-id;
 bh=Hk36uMGemdglD1N155LHlYS04DfWcX4jaFk3m0XEMoY=;
 b=zEf0wBENQdZ1MYnJAVX3kBcym3nuKDr8HTDVq54QHm8/2nimXbBwvrkgA8is59NSRx5y1G3xs
 zQAtAkf9TK3AuF5g7Xm3QW/N2AjpAMbHlUINbcw4/GCDvy0yRUUORZk
X-Developer-Key: i=u8813345@gmail.com; a=ed25519;
 pk=Zlg0WqpCw4qbswOqamTBTXIchwR/3SnYZpy7rjaGMdQ=

Document Anacapa BMC EVT1 and EVT2 compatibles.

Signed-off-by: Colin Huang <u8813345@gmail.com>
---
 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index 8ec7a3e74a21..c4b87c014941 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -84,6 +84,8 @@ properties:
               - asus,ast2600-kommando-ipmi-card
               - asus,x4tf-bmc
               - facebook,anacapa-bmc
+              - facebook,anacapa-bmc-evt1
+              - facebook,anacapa-bmc-evt2
               - facebook,bletchley-bmc
               - facebook,catalina-bmc
               - facebook,clemente-bmc

-- 
2.34.1

