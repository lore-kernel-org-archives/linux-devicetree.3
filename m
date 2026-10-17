Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9790A3BF682
	for <devicetree@vger.kernel.org>; Sat, 17 Oct 2026 16:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792255371; cv=none; b=ZnQBgnd3T8RQbnhrKdFoOQ3sJHwWfYRth8mrBV322clkhR2nEB4vi5ET10QveIVv/1bPY7tXdwQ3LUHWbu/vAGOeIafOJW6vYe0UtiAgIMV/unD74LdhjxjHj3sC3W2Wg8ZBGgOrYW+O2PN/tlxadD1MMWIxJrqFvJbYRYCXM9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792255371; c=relaxed/simple;
	bh=rTrbWI5rSQm+EpHypyvlpEvi/M8L4lp40c78faRU1Nk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TMJeHR7DPKmUxweEf6SiZFcAsJBo7wwh5bFxT0WErdt6lkymraxx099Gn4Hb2BrjMmiLrSe2PARzx0iOXPKCLPwRIxZim/VQd6R8G2c8zDM6+zdG8M6eRde+XQniJeGdYD9JhyoCCXBJKN/g8qxNVUgXcs3CQjDfh9gFWTc71Fo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fdeQwKrN; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fdeQwKrN"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3ab752f6244so774988a91.2
        for <devicetree@vger.kernel.org>; Sat, 17 Oct 2026 09:42:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792255370; x=1792860170; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F4xibtJE0TG41iQco+r4uLl7fC1ynCkxCGcMxo66dpc=;
        b=fdeQwKrNa425zVk/tXc3j2vnw41qOSJdCJO+s9FhhOVdI4xhIl7wTK83GJHkHpQUJv
         3Lzdh1vudZxtkq+Exn+fhCOMSYV4IdPCijE/RIiYCaxYvB7VUt186uD1TEHDDNvoxvOj
         oAKjhmAbBMA78lHzT12gAmZGqFZTEXmqvSxnMBc+/wnAEELjXAIAy7fSf4wGtBsGdPPw
         /vazXjFtgPzSsMB0JxIEoYHkLhaOTtucIUd1a8387cVx08/bk0DpAY5o9KktypIIr/ZK
         rqxld+xBLzFE/FLujBTAxHoEU6tH6ruTU4QUNlWhAIao9tdec0d7HH+MKAsQd8mqxbX3
         Gdjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792255370; x=1792860170;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F4xibtJE0TG41iQco+r4uLl7fC1ynCkxCGcMxo66dpc=;
        b=iPcv3B7Q8mDriiG/gY9YR1DcAPoiSGKYVEzv2oeaFhZq14zRhUwyO4FfrcZE9DViji
         RlGioQJ3ZEa5vJlzvtsNoyo5MdXOZ1H3AjINv5bcT/WOOCWdw2+1dntbqc8mlBUG2w0x
         IkEL/I+WX3oBAHeBAyH43HrKddaeg9OJng2kmvF2Uv5pXatK+64smD4JeRSJ1C39JBuH
         +xOtgvAXzIleQdff+g68tht/bICMm10eBNWhC9aU8HnQr1VV15WlUA9iP1/bvYjgKx7+
         Ppwany7OlKaTa93l//za/S2t/+D0/c9dilzfYajhILUEoRuIKkD5SINSv1+53nwik0q0
         TPXw==
X-Forwarded-Encrypted: i=1; AKwUvBwbewsdaRD3kPR2wT7MJZnSSkJc1tEVLA/uuj4axR4aRYBkkgnZP6fxTtsValrNiw02FNBB+LlQSs7e@vger.kernel.org
X-Gm-Message-State: AFq9FYJXbUAV5hnMZrMzIMVhcagEYXyM1P9GMa8+8IVuozcZ55h3LWe8
	toqsIzbkfi+DaAhTryn7THp0SNUkyp3VwEAeNhn3VIYvwa4U8W7XLnRq
X-Gm-Gg: AYBFou3Hmttp2/SFJlnHwOgFraYtJ6DhkBS8m3i71U4RcpKPOeb2Qp4MlhttxVwHxzl
	UF3+OXDhh0Xm6V3/ienUVMxlBgb/hnL7+OUjDuDcQJ7ngiqcrqMRcw8Nmbi3lS57eAZCoh3+vUO
	9jnnazsD0QsoF93yP/+MX7Eu5Tqe8aCzC7M5uxVFT7BuiI/bsEnt00WUFLrbLcn5OoaI6Z7iIyu
	SpO10t0ciKETZWyN8vDMT2ysZQW4EalEkSLINgP0OM9kiisiAIPWoUlvisveiauwxxR/IyvF9Bk
	qpnRMeJCyCETXknaz9HiyZZEB2dAk883S8fRQuOGLVp7U/LxOCVRMCuWjwTZAWtGZhfCmEu9EWh
	Y5ah6Qn03xCFGnd/t/SknZBufeCesQ72KS8IXN0d5QD5HZ0kX/wWa04bQWyiestalAgf9YDZS+7
	Xl9BDT6j88MPK09WWEj29OEAvTBeVUywORCwF+T4ng1WaI5kkSEDZmAhCymmOrMQ==
X-Received: by 2002:a17:90b:582d:b0:3a8:5d1f:59ad with SMTP id 98e67ed59e1d1-3acef14c8femr2733506a91.43.1792255369994;
        Sat, 17 Oct 2026 09:42:49 -0700 (PDT)
Received: from [127.0.0.2] ([2404:c0:7618:4e1c:2cb7:b2e6:ffb7:d23])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac94798212sm13816164a91.14.2026.10.17.09.42.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 09:42:49 -0700 (PDT)
From: Reza Kurniawan <imkyufie@gmail.com>
Date: Sat, 17 Oct 2026 23:41:24 +0700
Subject: [PATCH 2/4] cpuidle: psci: Allow skipping the suspend mode switch
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261017-psci-fix-v1-2-dedae27e4a31@gmail.com>
References: <20261017-psci-fix-v1-0-dedae27e4a31@gmail.com>
In-Reply-To: <20261017-psci-fix-v1-0-dedae27e4a31@gmail.com>
To: Mark Rutland <mark.rutland@arm.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Christian Loehle <christian.loehle@arm.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Alejandro Tafalla <atafalla@dnyon.com>, 
 Reza Kurniawan <imkyufie@gmail.com>
X-Mailer: b4 0.15.2

From: Alejandro Tafalla <atafalla@dnyon.com>

On some SoCs (e.g. Qualcomm MSM8917 and MSM8937), PSCI reports that OSI
mode is supported but rejects any PSCI_SET_SUSPEND_MODE call with
NOT_SUPPORTED. psci_set_osi_mode() then fails with -EOPNOTSUPP and the
probe is aborted:

  psci-cpuidle-domain psci: probe with driver psci-cpuidle-domain failed
  with error -95

Add support for the "skip-suspend-mode-switch" property. When present,
do not call psci_set_osi_mode() and continue with the topology that was
already built.

Signed-off-by: Alejandro Tafalla <atafalla@dnyon.com>
[Reza Kurniawan: split out the patch, added log message for skip case, renamed
 the property]
Co-developed-by: Reza Kurniawan <imkyufie@gmail.com>
Signed-off-by: Reza Kurniawan <imkyufie@gmail.com>
---
 drivers/cpuidle/cpuidle-psci-domain.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/cpuidle/cpuidle-psci-domain.c b/drivers/cpuidle/cpuidle-psci-domain.c
index 5722365b94..cc9f14769b 100644
--- a/drivers/cpuidle/cpuidle-psci-domain.c
+++ b/drivers/cpuidle/cpuidle-psci-domain.c
@@ -159,13 +159,17 @@ static int psci_cpuidle_domain_probe(struct platform_device *pdev)
 	if (ret)
 		goto remove_pd;
 
-	/* let's try to enable OSI. */
-	ret = psci_set_osi_mode(use_osi);
-	if (ret)
-		goto remove_pd;
+	if (of_property_read_bool(np, "skip-suspend-mode-switch")) {
+		pr_info("Initialized CPU PM domain topology, keeping firmware-set mode\n");
+	} else {
+		ret = psci_set_osi_mode(use_osi);
+		if (ret)
+			goto remove_pd;
+
+		pr_info("Initialized CPU PM domain topology using %s mode\n",
+			use_osi ? "OSI" : "PC");
+	}
 
-	pr_info("Initialized CPU PM domain topology using %s mode\n",
-		use_osi ? "OSI" : "PC");
 	return 0;
 
 remove_pd:

-- 
2.55.0

