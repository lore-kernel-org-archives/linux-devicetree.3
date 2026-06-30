Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25C4C3EFD03
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 09:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782812861; cv=none; b=aLJq1TrzJAAGeXC9Pq0LK+MZirU3doKtcVswYrSayIV3/PFG5MSspDZCF/fUlYO6mKnhl7Xxh7UapXO2fXVlFKN659oK8F1F9mneZCTJTr4u8ASUNWeOelqlktKreUXTnBV4qlGMcDE8aX3aNtqfC1q2uiCt1npbScjzwCiw8f4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782812861; c=relaxed/simple;
	bh=1DguEThOFK/qO7Jm1cWRlcqvhEd0dc0090D81DcdQow=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jV6lh1SqqhijdluJZiuuGdrDU+FJsG1sd8WIycYooytNDWkYM5ytNHLnfWCPwBxPhdKQCrnSyW05IWtRqW58IipiaXPb8WHxS5XjVB9Akw1UESN9fk7jERtSOTJKhWBN0bvx5xkafIUNSm3CH7/+CMkmwT9y7GSqpOqAyFAEkLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=Nlupw/op; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="Nlupw/op"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2c979d03538so13531635ad.1
        for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 02:47:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1782812859; x=1783417659; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZFsJfZ32F6Q33KlT3GRF0Vk1wwyPPazlo0zzpNaRXQQ=;
        b=Nlupw/opi22QiL+a4TW8CuvltJtmE7OSdLyXhi0wfX0VgpNKEySnZ9XFqT1nn6ysTQ
         7XpKh4LQee6CIsCHyYeJL3Yf5WYhpH20HApQaIeYF4kSJZozqaw+vUZ8Wmu2CnG8XI0x
         mUTSI9++h6vVjeL+buGhBMEy8X3/bDJkDdSaYvoXRLJFLhvibgpC3qnZ03ajF1SkGCAu
         qq1T3GiFqUhyaeq9x4PUUF1AZm1cSJfICAeqON5EZftIxrqZtm27dniVvuQuTXsEELn1
         CbqFfbPKLb/zP2VUr95NKShPZbMU0epCtjrBA5n7XpwfMmXek54Y1ZofpxLwRFfFR1o9
         3HMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782812859; x=1783417659;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZFsJfZ32F6Q33KlT3GRF0Vk1wwyPPazlo0zzpNaRXQQ=;
        b=AR0ctypHdH1rqGlcxV0RR3Izx1DXASYfgSiw6O7RZzf15tHYMASgkNoA7Fdlw0rjQZ
         hngIO1WA64CvNQJnsOjX+4tH87LIhgP30wAfBVHrLrB2Hnuq43RzWUNCcBqjvVZ464Qp
         l6xjNq7ud63uD3Hd2TNjjhpREs4+om28UmFb2UcnkJXYzWdgRJ7OgP394QIUYX8s51k8
         wxwmS6/4sCI4v7kL0Xis8icsnQDzI+VER+PqTX69rEQctMl8AYP41aPV9o47IJmLpMrY
         aiQZ6aa8YRiHGJBsh/0ZwUZNo+ah13hIP5JyW6Vm7BH2lQR66FA4wC8HeClnBvGjutbR
         dWJw==
X-Forwarded-Encrypted: i=1; AHgh+RrjDH9ER1fNCpuzZWszJAjGMtJNNFy4CtcJVm8orqGY7UmUG4TdR67WmC2EpD5zk4GEdOyjLlWHfGPV@vger.kernel.org
X-Gm-Message-State: AOJu0YyJcb7uXnv4BV7vsf0DJMKQqvYpNmYdC0Z5vgOeavJwprOAjmQ3
	0YbrY9h5CoHXbg+aWsX3NhRk0rYpxL+JoK1Dudff+eqLL1QCZlxgLwelWLGvfjvrQk4+Wr/I0E6
	6c7W4tDbn/MIpoW8vpzh8rc0fwomW6ycWRfpa9A2OIauJnggQu0pOfzzUDTikQnvRbzfRWFrtyh
	d6+F80x7jC33tqYaIMq8JlDLpEMF2py8QjxDonVuMCyl4KBwUPaK1z3A==
X-Gm-Gg: AfdE7cnp81tJEFutqgKolfjAYPzcPVrNH7D9iWaJOjJwRBDu+7aEk7HyLRYgNgADG8k
	6CXTTS0FACptir57MiyIxuQA/q2peMtKshsFFhfpzw73UCJ4LDFiuiccK33r8rOP9f5EDVXTNOs
	/ShjfPAAC1c7fgRG03ejfXi7opWOCMMm9kb0N2Wftgd9R3Ful8PmyjY8egXUmZxFmmNSwUhKuU6
	5Hh7NoE6AICUrXQuhOz7pBqzkiUtt0gtJpFERROYz7iA1khGyv1p4/gLtg+neMwCiT38OuFSIbH
	j62hBLiPZ1O///tyJ3LXM9bRLgPo0KPwOjmq7vwzQMxie21OZvBmCHNid+poXLkkEkQ4BzCz2FW
	eTp3GSQScmzYyZ7LSK40u1tBXGJoo0tBAnF8hQLnZyuXqXr8T7Ac4xCJ2t9x8213M/Nr4AZY4t7
	KUd8CCEkj4vIlPB4SLZ0SWiV8N2tMYMBA=
X-Received: by 2002:a17:902:ebc4:b0:2c9:97a8:aff0 with SMTP id d9443c01a7336-2ca2ea3388fmr21338425ad.41.1782812859217;
        Tue, 30 Jun 2026 02:47:39 -0700 (PDT)
Received: from EricL-ThinkPadX1-TW.local ([136.226.240.181])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca37c87bb8sm10144675ad.30.2026.06.30.02.47.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 02:47:38 -0700 (PDT)
From: Eric Lin <eric.lin@sifive.com>
Date: Tue, 30 Jun 2026 17:46:34 +0800
Subject: [PATCH RFC 11/12] rvtrace: encoder: Add probe success message
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260630-dev-ericl-riscv_trace_support_v3-new_sifive-v3-v1-11-c9c1ffc64e4b@sifive.com>
References: <20260630-dev-ericl-riscv_trace_support_v3-new_sifive-v3-v1-0-c9c1ffc64e4b@sifive.com>
In-Reply-To: <20260630-dev-ericl-riscv_trace_support_v3-new_sifive-v3-v1-0-c9c1ffc64e4b@sifive.com>
To: Mayuresh Chitale <mchitale@gmail.com>, Anup Patel <anup@brainfault.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Samuel Holland <samuel.holland@sifive.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Greentime Hu <greentime.hu@sifive.com>, 
 Eric Lin <dslin1010@gmail.com>, Eric Lin <eric.lin@sifive.com>, 
 Nick Hu <nick.hu@sifive.com>, Vincent Chen <vincent.chen@sifive.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782812801; l=1379;
 i=eric.lin@sifive.com; s=20260630; h=from:subject:message-id;
 bh=1DguEThOFK/qO7Jm1cWRlcqvhEd0dc0090D81DcdQow=;
 b=/dMSHAP906vhEj0vt5nUrkzlLHcedt2N4JOw30g7lsEItaFkSqYKHji+b8bPWprDBukjb9fqh
 joNfvv76/iSAkJpr1sGzylgqpxJzBcsH+zLe50OtTNKX1IHA3/cxXWQ
X-Developer-Key: i=eric.lin@sifive.com; a=ed25519;
 pk=RLPQN6uNJ1cSM8GhP+L++2j3pf5ohznFbkNdwIO1XDw=

Add an info message upon successful probing of the encoder driver.
This allows users to easily determine how many trace encoders are
available and successfully initialized on the platform.

Co-developed-by: Nick Hu <nick.hu@sifive.com>
Signed-off-by: Nick Hu <nick.hu@sifive.com>
Co-developed-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Eric Lin <eric.lin@sifive.com>
---
 drivers/hwtracing/rvtrace/rvtrace-encoder.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/hwtracing/rvtrace/rvtrace-encoder.c b/drivers/hwtracing/rvtrace/rvtrace-encoder.c
index 41e74cac0c25..e95a55808f4e 100644
--- a/drivers/hwtracing/rvtrace/rvtrace-encoder.c
+++ b/drivers/hwtracing/rvtrace/rvtrace-encoder.c
@@ -79,6 +79,7 @@ static int rvtrace_encoder_stop(struct rvtrace_component *comp)
 
 static int rvtrace_encoder_probe(struct rvtrace_component *comp)
 {
+	struct fwnode_handle *fwnode = dev_fwnode(comp->pdata->dev);
 	struct rvtrace_v0_comp_features *data;
 	struct rvtrace_driver *rtdrv;
 	int ret;
@@ -103,6 +104,8 @@ static int rvtrace_encoder_probe(struct rvtrace_component *comp)
 	if (ret)
 		return dev_err_probe(&comp->dev, ret, "failed to enable encoder.\n");
 
+	dev_info(&comp->dev, "%s is available\n", fwnode_get_name(fwnode));
+
 	return 0;
 }
 

-- 
2.34.1

