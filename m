Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792501234;
	b=uinTg6wUYmB/FKkPCHCIhxV1Pw9qoPc4nDObVwkoCqkKDMKZ7dQyp/2KG04iRfn0v4ck
	 zNs2IffFHaXmiSOmrpmY4rSpFuICBBfOr9cyZBxPztmTR//19NQ+otj/MBAfrXM+Gv+zm
	 hbjw6uUTbwdRuD5biecGTNf00r8Y05Dv8I5PW/L8/3N//iIvOu3iemHxMJh5ZpIodaL8S
	 dmOXlPPM6YfDl4zaU+VHb680PVRoYLyeOUh2+84liq7tWX5NlhYRg63ddERuQtKNqQ06D
	 FIhydhNuLQcCKUUauT4pVRIx0ii4K8M+onwDsr7Sep0I5yXyuAgyzzKVYFiFkOj4AfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792501234;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=V5mXplAJ6XQpaLaAHpeez9TEYogaPUChaxNtZ24iXK0=;
	b=EY2qfyIJ8+zo24xJSM7skiN+pSxxa92dMVPV3jMxS9txhqLRFXaTvm8Zwfm0e8ynzhvG
	 RCQIDnNcoQuMmB7yufDEc7VgQVUIRViEJlx0F3CheewWSs5f2NbhaM0UXTT2jmFxE+mH2
	 3/PzK8s2eu1SWQt0KevkTwKAhRNsa0FF6RoiRgZtuzf7bECrl7BK3S2QoDQDbX1Got14d
	 fX8hZR7pBlbcN6qB2t80a8RVjFJQm8h37WQoK5Lh6iiRcdVUKqMxgdw0h2nhR014PxSRh
	 bNitZjqrLNebcdarUDSrMUkFfgwrpHKGeaBETuYI2Ba7g2GPz5FuOug03EZXP96U7mg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ecLSa4Oa;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C27D760A4AFB
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 13:00:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C27D760A4AFB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ecLSa4Oa
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48af4d4e61fso1978889f8f.2
        for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 06:00:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792501231; x=1793106031; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V5mXplAJ6XQpaLaAHpeez9TEYogaPUChaxNtZ24iXK0=;
        b=ecLSa4OamAr1JXHnOVbC+LVGLjRHmAV5oQgnEndvWjkaIQemPKJRMOAcS1Dc/d3hIg
         beCl8Py+xnZ0AWDS/juvgzrRfx1cjCwOJrXwBpBUT6mnaGczVS9kPxNiayrdrswmRdCi
         IzdM7KTvmGYuFt7ylRcgODLLIFWn6YqVTxAPYE8r+BFkSYrMM9TBoqh8FIjzvigp5dng
         GS0L4w2pBBLKs3GZmHRz7vygWdyA4pG9O80y3YZIDmnb0ISvIiiAR7dAw7v+BKQWXldt
         W9WaeUxCQGjkEytozN1+6Ow4TGzPrbi51FyVqSmfWWy/UEgNdKulJZFowC3hzmn99Jtg
         YTvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792501231; x=1793106031;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V5mXplAJ6XQpaLaAHpeez9TEYogaPUChaxNtZ24iXK0=;
        b=1p4H1aEv9iNV0Xm9AdMam1h0P8UeYN/5rgm/pKtoyO6xF6QHixjobOB43BKq/uoAam
         lHGmDkBUOM4zcgXZtlGg+G7kHNE8R6S6f+h5+R0B93SH3H8B+EXZZa6mzqjjjwPUQEmn
         JXMKylbIJfsjKVG1kOvsMpSHi8Ye+2O7k/lOKThSNW1KjgNrF5bT38kNlebxEpOvjAaq
         Rl2yWeqVjYU7AQ394LwILOJs4DRoygxj8umK7AWZI1fLu6CEPsYiMI9cI2HvGSAuaBRR
         51+OqSeZ1J3MU6xQS9h0dcST+yyJRyNPM0MAo5tyF0Ug9FPFwPXww3mpqqqyHacx3uUL
         TPdw==
X-Forwarded-Encrypted: i=1; AKwUvBzDMAt4lfWCVbTv1kDJmeCgzObYm3XTyBDXqea5NUk/lr5k2/eMsjrlV25w+We4X8mFROFXIayEwXse@vger.kernel.org
X-Gm-Message-State: AFq9FYKI5lkSFET27FTMfBsyoG06Eqn8LEGc7v94dWLnvENwpNT9MyGZ
	Y6p540xHlwfAzzImpKgoL2Wtoc+m1/DRiDv9xE4Rypln8NMhyBVF63NJ
X-Gm-Gg: AYBFou2/K6ajjLwOFVdtLKPhSbV2VgDIszJqDgqs7+bFEyyPo6rK7vZSWQnNW4tTdb+
	BBDwg+HvJy+pLRZwftne9ECZYRT5lPdPCalSD44jAX4GA15nzmYvXju/i+UyTFUTS+ErftEgGs+
	M1cb/7NKO6QnLxo2Ec2nD0Ifu4Jy8czxU24rFyXa2iWw07WjT/gdTH0BNSMceMy+ZD8Nlslgik9
	u3bFoRQTjlZb9hM3Jup3Z7+Mbm58qN6cssFn1tjKfZ6hN/owraF+BKBUACz5iv8tVb1mmNQlPJH
	dEmxucbaLZJA5nUwxyNxraWI2CwLFM4lBUU05sAnArtEguZdiZYXQUIXYObrfMGT0PhOkZm/vc4
	9N5o3ULKZuL4oSb+lW8QH8EGFel5ik/XEPrV6hdlieRR1eMukkw6KKd6km9f8wI51Ds162b0hTf
	aPLzbjpz7TKRjCE9nsGd0Tk+xavLqZjFtvxAJ6HBs7Uxri+tiYoLzajrQYp0CoVD5zsSQbdGivT
	eFfLTt2QbTqURMxylbkTNjU2SBNIngFGbcB1VsfTQs+cjjuAxf0zCjkz6syestrvX/qXa9gjA==
X-Received: by 2002:a05:6000:1050:b0:48d:ecba:3cf8 with SMTP id ffacd0b85a97d-48e07fa82f3mr15476118f8f.43.1792501230056;
        Tue, 20 Oct 2026 06:00:30 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d830e91sm6114754f8f.54.2026.10.20.06.00.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 06:00:29 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Tue, 20 Oct 2026 15:00:19 +0200
Subject: [PATCH v3 8/8] of: unittest: Test fw_devlink with clock nexus maps
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
Message-Id: <20261020-fw-devlink-nexus-ready-v3-8-fd6f1c17e16d@toradex.com>
References: <20261020-fw-devlink-nexus-ready-v3-0-fd6f1c17e16d@toradex.com>
In-Reply-To: <20261020-fw-devlink-nexus-ready-v3-0-fd6f1c17e16d@toradex.com>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>
Cc: "Miquel Raynal (Schneider Electric)" <miquel.raynal@bootlin.com>, 
 Frank Li <Frank.li@oss.nxp.com>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Herve Codina <herve.codina@bootlin.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Geert Uytterhoeven <geert@linux-m68k.org>, 
 Leonardo Costa <leonardo.costa@toradex.com>, 
 Frieder Schrempf <frieder.schrempf@kontron.de>, devicetree@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-pwm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
X-Mailer: b4 0.13.0

From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

Extend the fw_devlink OF unit tests with clock references routed through
a nexus map. Verify that the mapped consumer has exactly one link to the
final clock provider rather than to the nexus.

Also cover a direct clock reference to ensure that it continues to
resolve to the original provider when no map is present.

Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
v3: Route clock-map entries to two providers, use a middle entry (Herve)
    No clock-map-mask: only clock-map applies to clocks (aacc54c67869)
v2: https://lore.kernel.org/r/20260910-fw-devlink-nexus-ready-v2-7-17ac82dbe226@toradex.com
---
 drivers/of/unittest-data/tests-phandle.dtsi | 20 ++++++++++++++++++++
 drivers/of/unittest.c                       |  2 ++
 2 files changed, 22 insertions(+)

diff --git a/drivers/of/unittest-data/tests-phandle.dtsi b/drivers/of/unittest-data/tests-phandle.dtsi
index 1fd465bb8f79..8f86fcee4093 100644
--- a/drivers/of/unittest-data/tests-phandle.dtsi
+++ b/drivers/of/unittest-data/tests-phandle.dtsi
@@ -81,6 +81,14 @@ consumer-b {
 			};
 
 			fw-devlink-tests {
+				clock_provider_a: clock-controller-a {
+					#clock-cells = <1>;
+				};
+
+				clock_provider_b: clock-controller-b {
+					#clock-cells = <1>;
+				};
+
 				gpio_provider_a: gpio-controller-a {
 					#gpio-cells = <2>;
 				};
@@ -98,8 +106,12 @@ pwm_provider_b: pwm-controller-b {
 				};
 
 				fwdevlink_nexus: nexus {
+					#clock-cells = <1>;
 					#gpio-cells = <2>;
 					#pwm-cells = <2>;
+					clock-map = <1 &clock_provider_a 3>,
+						    <2 &clock_provider_b 5>,
+						    <3 &clock_provider_a 7>;
 					gpio-map = <1 0 &gpio_provider_a 3 0>,
 						   <2 0 &gpio_provider_b 5 0>,
 						   <3 0 &gpio_provider_a 7 0>;
@@ -112,6 +124,14 @@ fwdevlink_nexus: nexus {
 					pwm-map-pass-thru = <0 0xffffffff>;
 				};
 
+				clock-consumer {
+					clocks = <&fwdevlink_nexus 2>;
+				};
+
+				clock-direct-consumer {
+					clocks = <&clock_provider_a 1>;
+				};
+
 				gpio-compat-consumer {
 					gpios = <&fwdevlink_nexus 2 1>;
 				};
diff --git a/drivers/of/unittest.c b/drivers/of/unittest.c
index 320a992c4310..40d010c55b8f 100644
--- a/drivers/of/unittest.c
+++ b/drivers/of/unittest.c
@@ -765,6 +765,8 @@ static void __init of_unittest_fw_devlink(void)
 		const char *consumer;
 		const char *supplier;
 	} cases[] = {
+		{ "clock-consumer", "clock-controller-b" },
+		{ "clock-direct-consumer", "clock-controller-a" },
 		{ "gpio-compat-consumer", "gpio-controller-b" },
 		{ "gpio-compat-singular-consumer", "gpio-controller-b" },
 		{ "gpio-consumer", "gpio-controller-b" },

-- 
2.43.0

