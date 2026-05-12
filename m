Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAC6D3BB134
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 17:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778608237; cv=none; b=PmVAjQnmsxnl2HI+oIQvrAyOCXQNmeKy2Jr+VheUewHrsPa1spESjYgD2nM2WL50wWd/cwEt3TZ2L3/PF0tCkJgd4yRSLrzQbFlhQ2YSXxcyqNI9KcNu7LDSf1RuPffcqDspaDbauEz8NAeb6YVjzPToVg2fK7JnwV77lK+De6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778608237; c=relaxed/simple;
	bh=5ze2uazgAeVIlCca6kGtV7W6GRHZsCErjSONJCf+OPs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nYeeyOotyRS418H7mJWuquMgFVU1RIKaWVmD4XWlWFejZauZVyJIonbI2DERwTSkog7I2X9ZxXyxC/dFpkUD65jO4b0IA5jQC3c2olBU177PJIywEsnGM7zX/k99Cc0Xt5snyHAGRl2aakTYjD1OE8/2F/dtZLXJ7qPM0j0I5I8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DvBKQV9+; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DvBKQV9+"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-8353ca0f1f1so3057874b3a.1
        for <devicetree@vger.kernel.org>; Tue, 12 May 2026 10:50:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778608235; x=1779213035; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8pS0Ld9uzavm9qCIn3zeBESeNJisq4fm3wOJuKswJN0=;
        b=DvBKQV9+Vrt8Dx6U/9Vwvoy0jmh9wsZ2nr1PF0sQCG/VpCEAp5GT8admH2TLAXKbhU
         Zl9mY++aOR31zzq7Wr271SuPcGOZRGhvnfV++TCzqthTwRb2XoI27SiDOhGh65bPubbJ
         GNx8oneCmfpis65uSaR81J1H8EFEeeJnMx64wU/m97cYnCJ49Jn3eY919SNeveov9hXB
         8LD6j1pSXKl7R9MK+FMZ6CVgWsUz3jqaoN1DUpA2p9zuqQiDpD+dclRTH7v7GpPqCnAw
         j0c4awzG/TQPBsPP1YGD1c/7JsuMY+lgWuWIUXRs7LXijNp5vf7HjmI7RkS0KjN1XQer
         nMEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778608235; x=1779213035;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8pS0Ld9uzavm9qCIn3zeBESeNJisq4fm3wOJuKswJN0=;
        b=F6mIIbsqmwfUHMFxP5CaL+keU98j06hwjg3EuLNY4HaHXeQS9rOe4yVELfTstePCNQ
         K87PNh8lcFi+jPolNEZyHoYbNSaw9NQCS1keiI6WbEHYFPqJRN06ZqGRBjLrY912oqjc
         SiNQ5Sdjp2Vh6hMbBQLVb9BZrK86TJqYgDbipiHEzRUxUNP6081T9dJHiOK+gk4qbfI3
         VfwwqeqjNpnek5zlJ4NfKZtpXRUy18Akse53lLdVHpTN+NCBoPsc3xtufCr2h29gdKj7
         R80hfWV4t7tPZi0WvGBBieQ84/xO2q9RHZeBpWhoUcFKRFQalG8Cc/l86WQF+RWbaC4S
         XCyw==
X-Forwarded-Encrypted: i=1; AFNElJ9dRef7gjimgvb7w+SGONf59jNuJoVEOsbjo/JjkAYfRyG7H1HAs2VBIuBzCslH0RR4T1emh5dCjbJ8@vger.kernel.org
X-Gm-Message-State: AOJu0Yz14u0XXBXqzUEKZqh/Us/HvU93/4LmTgttDOiCwYGGmNcZDFgP
	9XuiHhvzyy6uS2/UeHmIvZgnq+6jRlUPOH5mNSv4vzdv62hmPd2F6zdfEvOIGg==
X-Gm-Gg: Acq92OGxxZjF+LuYzIvRZI2idMPtHTlbg8zmahxMuAtToK4TkrJsl1sUgtzdx+wdzjM
	HEOA/bmvaP4rt3DOKs+S90tI3Yh1MfBndlGxTgYnYzQcXL39SWVASaPPn0Kt6axPZ+BzSuf1NGK
	jM2lCtzb+IbDs0YiDso0oU/VAKj2Kqdq7NbBd+p2ieHnwsTjlDQLww8UkwWYOLoBB11+F1xpJ83
	qt53pQUhtDX5lfX8eMMkPm/4AZDzCiO2sbDZOor+xy2N0lz7fzfgjfZmv+lLjRd+XHZ4pgOdoRz
	G7y0ex9aq4u0qhkBtHlRDBFghS/Hh8nAOYXMd23WkMFaN6kUrgSvYvbrPONzs6qNXfMlsh2duPo
	4fZFQzkS8ywrquwt8PF4F3diQ+WwUpqFwjvfvn+1Giw9DXp6+GKm4SO8RnOLWakfEnlnGkox+Yj
	U1EhaIBoz5f3yU6NCvB3H3IjWJffTSf+ODflQCh8SX
X-Received: by 2002:a05:6a00:4206:b0:81f:4e1c:1d3b with SMTP id d2e1a72fcca58-83f02e579admr34477b3a.23.1778608235020;
        Tue, 12 May 2026 10:50:35 -0700 (PDT)
Received: from debian.prasanth ([103.177.82.138])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-839682a20ebsm24838732b3a.53.2026.05.12.10.50.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 10:50:34 -0700 (PDT)
From: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
To: joel@jms.id.au,
	andrew@codeconstruct.com.au
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-aspeed@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
Subject: [PATCH 1/2] dt-bindings: arm: aspeed: Add ASRock Rack B650D4U
Date: Tue, 12 May 2026 23:20:18 +0530
Message-ID: <20260512175019.47548-2-prasanth.padarthi10@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260512175019.47548-1-prasanth.padarthi10@gmail.com>
References: <20260512175019.47548-1-prasanth.padarthi10@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the compatible string for the ASRock Rack B650D4U BMC,
which is an AST2600-based server motherboard.

Signed-off-by: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
---
 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index 2f92b8ab0..656397850 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -77,6 +77,7 @@ properties:
               - ampere,mtmitchell-bmc
               - aspeed,ast2600-evb
               - aspeed,ast2600-evb-a1
+              - asrock,b650d4u-bmc
               - asus,x4tf-bmc
               - facebook,bletchley-bmc
               - facebook,catalina-bmc
-- 
2.47.3

