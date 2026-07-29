Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D9E340E8E3
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 20:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785358027; cv=none; b=S4Bgt8s9zyojZnEjUnQRkDSYCE9EZhsozUxXsU3YWO5vLtvyD6+OyZ1tTGSFRPDb08KArzZvBYms+ALkIbz3RSyAkpnRDI7afyToY9PYJJHfBk9fDzPBeBAjSVgI8ZRsvN6ujRFJizzq9DCnfkvH8pLpUVqzI0zQd6gScT6r3sI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785358027; c=relaxed/simple;
	bh=qDoPFDgYOwBJutDRxjyEAfPZBpXw87vS1RFRdmij+W8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tbdlpSJe1r8kX4nJW9y2Gfk6Az+8Oz6WN5/f6BtWdW07oldauoXBYKpbnI/azU/v26Iq7cqBROpxFT1xDYhSd/iDuf80hQeQOG2oJzwvmW3D3+bPY/UMEVp7OUOFXa0wA4CdErpo95WtgRyY8G7jWKuV8j0J1mXSI2qxDHBpGFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jj7h7PF2; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jj7h7PF2"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-38101f85591so88103a91.1
        for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 13:47:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785358021; x=1785962821; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=teTKn1OpGKLb7AWpDMW6Ji1oRtzdBgxsC8nNkN5FQbU=;
        b=Jj7h7PF22+lJfeg89v+OL/+GBPxcX6VYAAgtoerRl0znFSUCC9lNq4YW/UOXE3jHU0
         KN1EONceFKHnEQqXn+LqZBESO2jrXTnHo5lkN6ilHVr7q4D3bf23Ad6d1/IGDpeaF7i9
         CrussRmQnz/pPJUncBmvKFuEAWXzCKmvZCtOsCVqePFRZT2M1A7nP7J9cxdjPlSfB5dl
         pGfC1o8rbsNeR71JZLX7Y57Cy+WP6vPmETHUmaH7gSIM2inrrXIy9euKP5Wwp+20dJKh
         iazoB2IAhmnWQllz1mjkv2+khAFR1/WifCdHdNlmEujas48hLJhMZjmKGE2RCZtXhURx
         O51g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785358021; x=1785962821;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=teTKn1OpGKLb7AWpDMW6Ji1oRtzdBgxsC8nNkN5FQbU=;
        b=JD1HeB9j/646eu7EuRVspLBpWRa6al7NEDSZ8YATLYyUDbYTtD4s5+SBKqQQxE58nT
         AMFmU+rQpDycmc2IxbLBEK/XdarSK/L3fDh29EtJaLEGxG7kqAuRw/q3Qd9QWoc/K/X2
         jNMvbc5ZLViG8mnMbfVfL1+tAEUOPAlZ1v/0k5bO7UbIaAywF8v/v2bYfGwJmAR+qR8q
         /JgOEwLfoknQ69+zokpckYOX5aA7jpbN7S0GZEnHaElgRODSY5iyZJox6mfABm3OCazL
         kueqXaErX0ZHat4rFopmoJb+Szisn6VKH7ZymdnbfbMArIWbdARBmq1GzLnDRwRqX6+e
         v69A==
X-Forwarded-Encrypted: i=1; AHgh+Rr1PCFYS5dIr8JIgZoE6PC+m3JdWDiJ5UkePuOjk3V56Q1eaVIzXoY480vXBLtd3jzAd1tRMew3ocAm@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/KKRLQUHDbB2eIJe8RkvjNw9gdBG1jptYvnr3Vi2RSChbX9D9
	bxubeZl3p4FvJuwyGgchMZi+Fio+E6pO80kuis92iUFUmBIX9xIhe97s
X-Gm-Gg: AR+sD12VIjqtnK4Y9sO6lD/2gh425tHj80XNbWZ31M5Eq6+9V40v8Ja/tYCs3pJBtMc
	ExRD95GiD7hzxiIFfRuzWQZ39XObNOgJFd/WbEmT2AwCIleW4wmcFDzqEkUD2tp9intxViR5hrL
	odRzqCNcCTL4E5qDkXuskRnGbx/4/Zy8uUm+aK1UBQF2Q1PVkCcDdVJRsb25NebjZCbXO7Pb/hs
	7lVJEm2nyVnS2ecZSGFvJ2qbSVM+5tG4a4ImDWtsfXYNtHZZ3nMwPqnDtoC7pvFU4xmjFGTF5oi
	1VL8NHztwRkcyGG5vfFemXE5OcDGGcXXzNgLegbaGtk7LoOj1zaSSlJNRhlm1Dnw8lVnqRJvenT
	lczxRs1LOTQ19DfZP+9u6f+E9tXP+ErN4A69OYmKpRFdfb1AoI9C9gwb76/FxVpVtwo7ca0hhl9
	X7pbhmFn5ygXC9MZteGrF58JVO5ajGpQNLdHwOkpN7GhNymFFEIgJRkRUx9juCIrABCAdFIDlSp
	7kQs02h0foq6Py2HuRdPgcE3XNIfSg=
X-Received: by 2002:a17:90b:4b8f:b0:37f:a913:1554 with SMTP id 98e67ed59e1d1-38f836bca81mr3747394a91.16.1785358020997;
        Wed, 29 Jul 2026 13:47:00 -0700 (PDT)
Received: from localhost.localdomain ([2409:40e3:209d:579a:9da:66e9:b9a4:b92b])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31504cc9dffsm14526894eec.14.2026.07.29.13.46.56
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 29 Jul 2026 13:47:00 -0700 (PDT)
From: Rounak Das <rounakdas2025@gmail.com>
To: krzk@kernel.org
Cc: bp@alien8.de,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	dinguyen@kernel.org,
	krzk+dt@kernel.org,
	linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	niravkumar.l.rabara@altera.com,
	robh@kernel.org,
	rounakdas2025@gmail.com,
	tony.luck@intel.com
Subject: [PATCH 2/2] EDAC/altera: Use an enum to identify the platform variant
Date: Thu, 30 Jul 2026 02:16:42 +0530
Message-ID: <20260729204642.23281-1-rounakdas2025@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260724-spotted-resilient-badger-495b71@quoll>
References: <20260724-spotted-resilient-badger-495b71@quoll>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In preparation for Agilex5 support the driver needs to distinguish
more than Stratix10 versus everything else. Replace the defines with
an enum. SOCFPGA_A10 is zero so the Arria10 match entry, which has no
match data, maps to it naturally.

Signed-off-by: Rounak Das <rounakdas2025@gmail.com>
---
 drivers/edac/altera_edac.h | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/edac/altera_edac.h b/drivers/edac/altera_edac.h
index 30e35da7eb6a..79b51f051183 100644
--- a/drivers/edac/altera_edac.h
+++ b/drivers/edac/altera_edac.h
@@ -372,8 +372,11 @@ enum altr_agilex5_irq_idx {
 #define ECC_READ_EOVR                     0x2
 #define ECC_READ_EDOVR                    0x3
 
-#define SOCFPGA_S10                       0x1
-#define SOCFPGA_AGILEX5                   0x2
+enum altr_socfpga_platform {
+	SOCFPGA_A10,
+	SOCFPGA_S10,
+	SOCFPGA_AGILEX5,
+};
 
 struct altr_edac_device_dev;
 
-- 
2.50.1 (Apple Git-155)

