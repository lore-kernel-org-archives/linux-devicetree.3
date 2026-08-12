Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35C6F47F76D
	for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 17:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786555379; cv=none; b=UdujjsyONPYgItb/a0vWyO4NXzZ69A6XWcQcBF6t8Nglr9LsU9v7GX9rl8r8SrhH3UzgdAo1XrFHV8GKyzTj2rV8+YW5DSE2ku38Rsddb7N/jX+ncnn5WBzRXL/xls/h4fn0S14bzau5gdPJqaVZCcGY79rwHK/VaD994x52jng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786555379; c=relaxed/simple;
	bh=BtmQtSAcOc1sMwXsSXHd/N0LJhsNzGr+XDlMMcgHhfo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=adAmZYES+7X3GEYAYNx76gZ7VCBLmWuPPP+lLWH2NszPs/vAnT+TsCpJ8lfHlKMxWICrquqL0hEppmJtIVPMEBeYngaJDTYPL10WS17vE/6yL9N2sRjzwXWPsFnual015eG8TebE2nKGzIWJTFJUPicdZ3Qo+9TIbOLu4D6iANE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=ub1ESb4b; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="ub1ESb4b"
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-93695893ac1so80023585a.0
        for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 10:22:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1786555375; x=1787160175; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H/KJ6sckLCdEVJDbpdFqbeYqPNdthT6c5yyUBXrsMRU=;
        b=ub1ESb4bq7Cw5S2kHeARt5oVAtAfhEkHYf5hTHxujEMAKKj05skRtsyxjj4HleHk04
         R46hlXOjyEKIveU9dPsl7vVUHhs7snOKGkLPBOYfre2uJ43UOmZd/LcKtDECa7eJ9hj4
         V7ABs4tltxlN4xxFYHSrf8KJC7SNz4pWxLvXGMnRLIv/g3cYV/s3pQGgJsWbYwRgoRb8
         /K8l6wem26pXXzpWVMC6qswKJqfrwAtEZ7N8bqy4NJMx5Ee93ABv/W0wTvuZrqK5fGnl
         LaIZdYihofxKMzrF35tVwA3TL06A3Xe7JuQyzuzHTa+s/IsLHXDHckczoAF1AVEkMYLn
         DjBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786555375; x=1787160175;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=H/KJ6sckLCdEVJDbpdFqbeYqPNdthT6c5yyUBXrsMRU=;
        b=ABBelqra64VnmZuVGqrLeSVp4ubiDUd2f0SVk60cl7pujE494Ji1TKHhsTwqb0d1+4
         DKfvBexABt2TOqoFvyC8eWQ24wJ+g9mkMiHLw+BF8eyIbUL0Ql3UeKqAvd+Ln/H94pWE
         DXA4GurtDDYVr5XDvqR4GeDGGhVWLc1gJxtWxlw/QgqYWpkQllQbAwgfPSwKcfWq3Gdj
         rYeCByDpjXtQL4fcIpNqLU+OMd6JcaylOqE4HDPm8V0XA/QLLS1JWmOlUlAO25HLMRIo
         Pb74ZriOYBpJ4B/sPjIIIRfrRc1knSCXz8ML5buAaK4Y3LubOt6PCuZiN187llUohqq0
         eAFQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpb/AtDNHZ2e2z8ZyklzSs+nvcQJchmg0P2DmIbr+0oLzxK/ZCMNo8pakPIqzgEv9A+bSKTwCcoUvuE@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4u9DSDOIT7x1LyPkpbXj/tbbQjJAcLFryc4Nuk5SU1s5SAyGx
	0tTq+gk7R7hC+OJY7q8vyBVwgIt5t+EQVa1XmBusmh+SNhYmYBleaQOa7RwRqOmYJwE=
X-Gm-Gg: AR+sD10CmOMSokeiX4NJbnbtsq4CdEMwGiXNqGtMpMFcrKR8hC5Z3S2b3+o8SK1HuNU
	GTJBry9JwgHKbBrwszwuvItX5a87wMLPcKmFNWyGL+Y5iZhCYVBPy3m9AXRMHmqY53wEGGFJDuj
	yfM6tcITVMzvSLBClWbU2a3OJ5W7sZDOsG+yjPupRVZNSmPc3n9H4fWOdL0ObZagMdaYEOwAzll
	mhpu4SXUdOhw4XnL8bOUKdo2MQAUYHg9jDzc0g3sFoGvkzAyyynJG83PCd1wkD3sQhvGRUoK3oz
	m18dVYlRSBhBWgYo+0b9DgX6ik2q4sBZUX7zkzt8kzrk6XBtFchfLmSTdWy52s94wFquUlxy8XT
	/TltVbG3LiEwMrfu+RlFg9qdcdE4Gz5XytyyiUE3I20++EkIZfozQQC9nD4tX1im8uGHlgMcmyj
	il+CZGxj+QwLag+jlcS8eo4/TqeA8sXJ5FQqLGlwHMc2UGVNKt/dPqwgbSTrtmscTH
X-Received: by 2002:a05:620a:45a9:b0:915:9e84:85d1 with SMTP id af79cd13be357-936b3d3ad7fmr560175485a.23.1786555375639;
        Wed, 12 Aug 2026 10:22:55 -0700 (PDT)
Received: from zippy.localdomain ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-936b5f720eesm173587685a.47.2026.08.12.10.22.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 10:22:55 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: bhelgaas@google.com,
	robh@kernel.org
Cc: daniel@riscstar.com,
	mohd.anwar@oss.qualcomm.com,
	lorenzo.bianconi@oss.qualcomm.com,
	linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Herve Codina <herve.codina@bootlin.com>
Subject: [PATCH v2 2/4] PCI: of: don't zero flags in of_pci_get_addr_flags()
Date: Wed, 12 Aug 2026 12:22:45 -0500
Message-ID: <20260812172247.276554-3-elder@riscstar.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260812172247.276554-1-elder@riscstar.com>
References: <20260812172247.276554-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The flags variable whose address is passed to of_pci_get_addr_flags()
is zeroed before assigning a value to it.  Skip the zeroing and just
assign it instead.

Reviewed-by: Herve Codina <herve.codina@bootlin.com>
Signed-off-by: Alex Elder <elder@riscstar.com>
---
 drivers/pci/of_property.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/pci/of_property.c b/drivers/pci/of_property.c
index 505226b876c56..22fea1905a080 100644
--- a/drivers/pci/of_property.c
+++ b/drivers/pci/of_property.c
@@ -82,12 +82,10 @@ static int of_pci_get_addr_flags(const struct resource *res, u32 *flags)
 	else
 		return -EINVAL;
 
-	*flags = 0;
+	*flags = FIELD_PREP(OF_PCI_ADDR_FIELD_SS, ss);
 	if (res->flags & IORESOURCE_PREFETCH)
 		*flags |= OF_PCI_ADDR_FIELD_PREFETCH;
 
-	*flags |= FIELD_PREP(OF_PCI_ADDR_FIELD_SS, ss);
-
 	return 0;
 }
 
-- 
2.53.0

