Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792662111;
	b=gjhBKdI/xRFaq1WLLIAz0HaX2xjiLaeELXOhCvoxMzNW6MEBhlwUY+IGPchThn5IZoV8
	 mMGgmJpT8iF+saUIVNP6/YHacZW8Gh+WhMgYFtmeBxCg3XlRod+WnFOuOrUAs1B8C6fj6
	 G4mkFKnJ6isx3efh33oUP4UGHZsy/hxRRtdgYWxEbBtxSQGvuPH9dSdtEdqfDBkLviZXl
	 hk6zUfVlTK4TzMJ/D4I/cq278MMTd5Wf9Ln+EGIfcIK50RK2yXFngweZpx/UdnNq1pvHc
	 hfziXgdtlyg/g61nVeSdDur8EVuMcuHW6dQB9PRdbd1TBzv8JAM606BQvRFtCjXQcUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792662111;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=YzJYBLOEFNhZEUyVt/ZR8mdxY6kWFw5Zp9fV2xapAVo=;
	b=WKQENTQnKwxjiuISaWfkJTEkPfy3jsULdMrGKvZfLjePBmxFsfRVn73I2ctfRDDt+VDP
	 zkV8yN6ceYW3jE4BwrFSuxvl/QDnbOrok7vB2k6Wh3Mqa57XI1sbAHhsI9MvtEn4suWUP
	 aqoWEWE29R8nXJcNJIRMPBzpfYKk6MptbvoHUN+nBiVJCaMH+tXCbTKJuDG/imSWwlq3F
	 4csZdTjoJ+Ikx8nGlrTx/BFMU5uynUmiR7YI8/Tjx/gzRmB3zW8iXdtej5xtmVzF5Yqyf
	 7d4eabaiNxc8qDMSukkbschrhB4MYVgS0uYfVo4575XKNbu1JVC3MOziPnyOmqlfz+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=flCHyNcv;
	arc=none smtp.remote-ip=209.85.214.179
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2388D606A31B
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 09:41:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2388D606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=flCHyNcv
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2e8246b13cbso12970685ad.2
        for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 02:41:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792662110; x=1793266910; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YzJYBLOEFNhZEUyVt/ZR8mdxY6kWFw5Zp9fV2xapAVo=;
        b=flCHyNcvGJEetWmU9Fiv7hcFWMZoXVM96GmwYbc/esmM7l6NyCJ6g6yfq2Xo8ADIBm
         WR8A1EGGX3x65G2pGZykeolg+tZa3bK+YX3TyyQ1mmiZkpI4t5U5PSwce2vOe97r4Kta
         gKv6S9DKcCOuvdhB/8c9PnIsoVM+6RqrRiyL1++GTusOu5MoqmeVn3wLL5bmTt88XYO4
         Y0bBe5ExlE1YXjThiDtpKE6OlKb5w1jSlSDrg0FWuA7hQE4hIxefOfadY1mZJ2zikQtt
         GOK55gc4j5V6xsPAMZ0lldPFxAy3gPcU+a+2DS/QdZOlP0jc9Y5bfuGkES3kLpfgr29l
         YjkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792662110; x=1793266910;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YzJYBLOEFNhZEUyVt/ZR8mdxY6kWFw5Zp9fV2xapAVo=;
        b=WLc+GP7eM3PJ5rV+Ahb1mguUqANV5CJh2SxycJxCSxTaOP5A0AxiDt1MfD+q/Bji6U
         nYBZBoeb7nwRrnKTkv6mmjVCnQ1VBxtrxRa2xWP7S/urvHVz1sbNgV49kpS+IUcQpPMe
         y/1KzmP9wmJqCoFCpKbSRS7hfB9TaJUllEuhf4KlSxuWvENJ7reQ4y9zp+FFhcOxFJy5
         /XiQz4l1YuVOTwf9D4nkiIP31vR4gOC13lDeWekQi6iaRzWRSBMS0oq3c46j0EovzXru
         BMR80Xwn6vH9VqIjfA9aKdvSVEJv+JQwY2Btfrt9WOhIBwuwh4Twu6h9PoAfFjwmJHZj
         0ouA==
X-Forwarded-Encrypted: i=1; AKwUvBy6xR+NRteBkKSgmNEV4fyKbYLhN9S2ugTrCfnrZWCPNVkolZMXNs0kAMwjiJOQr5KX2nc+2YGwWZy8@vger.kernel.org
X-Gm-Message-State: AFq9FYKHX/tj5D7bErZW3xx/ejijoe3kMkQyz/OyWDZhnQFbYsAaIDy8
	6YqxuWaj1rG91LmKQDqsbs2qQmBb+4lPdF1Cofd6am+LpqO8N3wY891q
X-Gm-Gg: AYBFou002lTy4moNcv9489hxAsKndYQukvkM2sCOYT2tk6nfoCOHMP4ZN3EuG9Vf4jE
	mc9Z/6SYCs9VG8s3DCS4czFkVBgDa+mGuC5AND63AtWT/YHJNiPMNczOnvUb4SeuxD00Byjw7WK
	7e0ZvuElv1Tm76F6qBhAiBgqFO9z+ltQxj5n8xSNTz3Ai51W1wbhbFzEZjH5BAgvY3gw9ebrAcm
	DVC3PwIrp4pyG78ww7enxX2ubiejQFvo8Ysd1IQaNaLWZAJ2nK0sJL4LbkwFQWLlhl4EuNwxbPB
	vWYMOLI17uybCM6oNd4cPdeLaMOMaRKP1tp2axS+esvMOVXHLI3X259IaLbjZ5wcVi2ZH4mmwQa
	LCDbHCWv2mFQxrlMWa4UcoE07YEcN1oQIgwIG6rIJ9k0C0RW/6F45okewdwCI5tmYriR/Hs6vHB
	BAxLOAnmYly5iyGmfSbbRpTR+WpAFqYerl2OFEnNnF1MH9OIqq5d5pMCY7XKS5TF2iAr5p6cgaW
	HzI6F2PQ68fWgFzpLr0iD6toZFpm62YVbMLm/YJ+hHudgex
X-Received: by 2002:a17:902:da8e:b0:2e9:6788:9369 with SMTP id d9443c01a7336-2ea43e17bb3mr40452615ad.34.1792662110457;
        Thu, 22 Oct 2026 02:41:50 -0700 (PDT)
Received: from [127.0.0.2] ([2404:c0:701f:d27a:ab05:82e0:7670:1951])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea3b4356c1sm21483075ad.38.2026.10.22.02.41.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 02:41:50 -0700 (PDT)
From: Reza Kurniawan <imkyufie@gmail.com>
Date: Thu, 22 Oct 2026 09:41:11 +0000
Subject: [PATCH v3 2/4] cpuidle: psci: Allow skipping the suspend mode
 switch
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261022-psci-fix-v3-2-9ce2133c5659@gmail.com>
References: <20261022-psci-fix-v3-0-9ce2133c5659@gmail.com>
In-Reply-To: <20261022-psci-fix-v3-0-9ce2133c5659@gmail.com>
To: Mark Rutland <mark.rutland@arm.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Christian Loehle <christian.loehle@arm.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Val Packett <val@packett.cool>
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
 the property, added property check at PSCI initialization]
Co-developed-by: Reza Kurniawan <imkyufie@gmail.com>
Signed-off-by: Reza Kurniawan <imkyufie@gmail.com>
---
 drivers/cpuidle/cpuidle-psci-domain.c | 16 ++++++++++------
 drivers/firmware/psci/psci.c          |  6 ++++--
 2 files changed, 14 insertions(+), 8 deletions(-)

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
diff --git a/drivers/firmware/psci/psci.c b/drivers/firmware/psci/psci.c
index e73bae6cb2..3226af6d89 100644
--- a/drivers/firmware/psci/psci.c
+++ b/drivers/firmware/psci/psci.c
@@ -791,8 +791,10 @@ static int __init psci_1_0_init(const struct device_node *np)
 	if (psci_has_osi_support()) {
 		pr_info("OSI mode supported.\n");
 
-		/* Default to PC mode. */
-		psci_set_osi_mode(false);
+		if (!of_property_read_bool(np, "skip-suspend-mode-switch")) {
+			/* Default to PC mode. */
+			psci_set_osi_mode(false);
+		}
 	}
 
 	return 0;

-- 
2.56.0

