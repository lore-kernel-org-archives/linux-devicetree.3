Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33D652D73BC
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 01:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784769862; cv=none; b=IwGuhapQfK18OYmNTFhl38iQyknUCeIAT9BVwE4532BexJZivRNwXVBoU4RWUZtXaO4xckmBFsvotlxcIW2rTqjSA1dRWZucmpyrIzW8tcIDCcsxIpjRmDsN4914kFZ2Hk11ZHCpkf32DUl0Men6Wt8AQZGwkPVMNoRBoZk2f6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784769862; c=relaxed/simple;
	bh=lMUvG8FMcDQny9fNqRp3TCG6/uNRxCa0yHENbOIbwBM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=APe56Qn/GGDdnfp5bRXiNlV3K+vJQmRi4C1oxeAMpsNRjW62q21YPOhrN5/uUn6wxgO1VPLw1LQqLn0T92pDb065UvbouLiJWyJAazD7jodFsa4ixhe2sgU9DJy4Qg2rJwzhWR44Cn25BX4WKY7e00BwemOWupe/+NSoVc8dnmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kh+L3AoG; arc=none smtp.client-ip=74.125.224.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kh+L3AoG"
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-6680ae2031fso54896d50.3
        for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 18:24:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784769859; x=1785374659; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=p22cXgqkOK2Uxhc2g0dbrDiY3ACKRgSdYIBGvHqDRE0=;
        b=Kh+L3AoG4Ukl/AMbbfjZWAeOjnlNvPUbtLm7ECBy6kDEsE2pC21MUlgtDk0IWfZf+c
         oTOAdaFKIcH7RzGeWawTNwsdF4xkZtbLwnfSWyAhrFWRAbyB+UHuIXOtrBj03kUWD2/h
         3MxSRN2PKoksLYaOYEj4C83qGOzl+2iE6RxlRFhTYy3+AS5ZIHA39jjq2sHmjEl/H5eO
         LvnnH0+FAKvViOAj+fN9rBjMNPO3v7p8ldlV/k3MWHmiCU49SiAWgWLznymKI9A8D+R6
         G7v5UOoLtTh47PBUakrnX62nPyVhvnsMqLI1kgTdOOQLHoorgBJfaNnTE4TSjlaSprwO
         gsEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784769859; x=1785374659;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p22cXgqkOK2Uxhc2g0dbrDiY3ACKRgSdYIBGvHqDRE0=;
        b=quI4aazYOgqrxIwJXos/dRDXdacVaDIOQIoElh0hK9LOlHBoSfSgS1yf2V8TiSop2A
         tyeVMEf4Z7oOVINOz+uVPvms3YwduVjPRozxhhpsXHp5g2VLMXmMqn5JeYMdvP45EnNJ
         XbLOjhKuHrhIrahQPYtnoTHv1BJOFjqDQrkz/RwLdXcl10DmzDXSWhCj0qOrEDNgOwhB
         TtfSOm+wy+3r+BtG0wwMnLBFZcuYm2jyzFipAhOzHGIizN+sXPUweiYOE0M9ze6bBGwS
         z6HriuEoIb5wVdOV7cG+NDxaAf2zrPXJ/u3Zrp95x1nfUSjEcGK7xz960QgCwXhXkdMT
         nWqw==
X-Forwarded-Encrypted: i=1; AHgh+RqTWiiTrgfrPUNrFMNZg2HVZAkJzR2OJF2GCLASQwq3ImxW9dVVozerA2orcrnYr9UyQNdXjTzUCxO/@vger.kernel.org
X-Gm-Message-State: AOJu0YwAY94gUljDDNwDmHsHKf3IwFRB3JWCnM1yaWroy79QJCf1nZE1
	DJlRE9+aMekKkMZ7FFW2h5UzKoiEHle1jN6Vu9/Z9weVp5z1m9ysf/xh
X-Gm-Gg: AR+sD12vCw8AeUYb3QIiEiapiUU5i7UBeD4QoVr/lsrTUci1OVo5q0B4+xe7Ut822BA
	4Iahx2UnIKvehtdscxSBtUwXtay2/neQo6Jax0+IrJ1UWZ2t++iaF5DW7SRfoAd3xsmlPsFqE3H
	ahUWI2cfRswcHs72JuCc4lY4k4OH5v/OUg9RVQLPjVF78VGy16culMqItKAn5p/WP8tuAxfAaHg
	n0KoOaBfB0GNS3hCBsKuF8DTbuTPtCsNkZk+zyAa561IxVqoIaVhL8PCC/L4RnZr8EEWHuCxZ+0
	5rFIjsslZNur2KrIvjSFcz9iTgqC0GFxMk8TrTAD7UvTmHxA0eMZMsUtq3EoFklYku5H//T0ECp
	5/j38QFdZ8tOo84o6nRrAfTOj3s1x6NZEMs7BB1IrX1h2d0LM8ipcWLV1GyYxC6tl4DLqITZz3I
	s1CfSU6RdjOAbVfnZewinRIO5xOR1MRIxTDJb97z4=
X-Received: by 2002:a53:b884:0:b0:668:2f2b:f246 with SMTP id 956f58d0204a3-668a5041eb4mr198296d50.100.1784769859021;
        Wed, 22 Jul 2026 18:24:19 -0700 (PDT)
Received: from karli.attlocal.net ([2600:1700:7270:4eb0::19])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6689056dfbasm2319684d50.9.2026.07.22.18.24.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 18:24:17 -0700 (PDT)
From: Aneesh Pradhan <aneeshpradhan2004@gmail.com>
X-Google-Original-From: Aneesh Pradhan <aneeshpradhan@acm.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Brian Masney <bmasney@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Catherine Frederick <serenity@floorchan.org>,
	Aneesh Pradhan <aneeshpradhan@acm.org>
Subject: [PATCH 0/2] clk: qcom: add MSM8920 RPM clock controller support
Date: Wed, 22 Jul 2026 18:24:13 -0700
Message-ID: <20260723012415.48288-1-aneeshpradhan@acm.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add MSM8920 support to the SMD RPM clock controller.

MSM8920 is essentially MSM8917 with MSM8953's modem stack, which adds
an IPA block. The new rpmcc table is MSM8917's clocks plus
RPM_SMD_IPA_{,A_}CLK (same IPA IDs already used by MSM8940; no new
dt-bindings/clock/qcom,rpmcc.h entries needed).

This series is split binding-then-driver so the shared clk-smd-rpm
changes can land via linux-arm-msm independently of the MSM8920 /
perry device trees (requested in msm89x7-mainline/linux#48 review).

Based on qcom/for-next (d36de2e50966). Applies cleanly there; also
applies to torvalds/master with a trivial yaml-schema context shift
(flat items vs oneOf) if preferred.

Hardware context: needed for initial MSM8920 + Motorola Moto E4 (perry)
upstream DTS follow-up. Fork PR tracking: msm89x7-mainline/linux#48.

Catherine Frederick authored the original fork series; this re-roll
keeps her From:/SoB and adds an [aneesh:] note + SoB for the split /
rebase onto the current for-next binding schema.

Catherine Frederick (coolguy) (2):
  dt-bindings: clock: qcom,rpmcc: add MSM8920
  clk: qcom: smd-rpm: add MSM8920 support

 .../devicetree/bindings/clock/qcom,rpmcc.yaml |  2 ++
 drivers/clk/qcom/clk-smd-rpm.c                | 31 +++++++++++++++++++
 2 files changed, 33 insertions(+)


base-commit: d36de2e50966f3dd9ef3482f1faf649b3d697714
-- 
2.53.0

