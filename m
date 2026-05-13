Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E04CC421F17
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 12:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778675842; cv=none; b=kygusWeMvusQ1CVlg4Q0KvoDWwOAm89OzF+7eJ8IIUSaG8teQ6lx/jw0EG7Q2nhJzjLYjxbO8+fRB/DRMgjby0UP9NMLM9c48m36G/DeCy4J+6zdTlOGady/FIQjNxEGovPE8socc5ZU4SfvRhO9455RK2ZyGschqvL9RJiieRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778675842; c=relaxed/simple;
	bh=DNx2DsjINuyPqrUb+Ejo7Pkkik27ZEapCFCzu2jeQ40=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fMjPzlsPMnWWQPuoSt4FRUIhyLWD+gDwZ3ZivqeB6N0RYRoBy+KmqSGz9fBCqzXpn0SHwSSUwuBjrrahC1a18HdrQjPQhRCFVdpnOkAR/oQ2IT7kldodcEy+LL4WMdLAKLl/KiZlsDzOCVUFkHAx9VOgPJV/U70ndI4Ti6UqYds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ELZ16azz; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ELZ16azz"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-44985f4ab0fso3958248f8f.0
        for <devicetree@vger.kernel.org>; Wed, 13 May 2026 05:37:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778675838; x=1779280638; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qzGCiTeCStiKkPzefQJeYM5JOvHm2x+evqxUb+M6NvM=;
        b=ELZ16azzJ9nVNNsB81aPCdCxV2WJbR/1XhHLsGqrxUT7tIj79S6xv7TH6FHI99NsCB
         60WH5R59MJH67qoZ1UALc/mjQnlbg61ggnysCsR5P7EiExHJr+Qybbbi7MUjdiAK4DVb
         rZ/aPQFrkLXyVwwSjlRT88XimMtqxmxuQ7wbg9kjKxo7lgbeOgObGqsLMbHkO73O6ef1
         bY/YPZCLAspY+t9CKYZPw3nqPZeX5wQACfH3QiWL4aGVI9I8ephp2e34FeQ4FDUus+3Y
         HtpkYEexF6cSz1TtswTg0Dgognlky9Ra5mxiuO4Kyvf56LNquKys3yNqZWF4S+lZOqc4
         OHJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778675838; x=1779280638;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qzGCiTeCStiKkPzefQJeYM5JOvHm2x+evqxUb+M6NvM=;
        b=ro40mg6vTqQjBkLilVxkKfiEYpUj/xxY7IjWGO6x+jOO/APhcaV+HclUWO6EVexNr8
         DwiRwKpIXaICyFeuz2ERsA+oQ7XqPV42MzliPzCRvliuOKlysHpAshio00kV+j6enRw3
         5D4rbvac2pG1ONSnKMHwx2qw2ZLK/eUggHvNfn1L9J3NQbk+tfvo0cqYNOpPoZpErPwy
         ae+gLuMQKSFHB2vkb0Q2KBPlVY88UDOYdMInmGvZA3sepW5sYp3LgQTx7wQ9AZ4t9wA5
         a7OLvEKMGtpxl+LyrFpASZPkGwg3UGJZWwc7QH6b8mjx38aXeLBrU04p7KzLwLhoBhH2
         ueIw==
X-Forwarded-Encrypted: i=1; AFNElJ9mxKyiM6dGbf9Rg3N0+Nd2jt65axt3zC2G2YZbqAM7PSajRti/tO5lARBijG0RPMUGg+vcENdm2S2Q@vger.kernel.org
X-Gm-Message-State: AOJu0YyXraBS91kRuaZLk+WnCGZj2GWx/26ya7ezXUjPQ/2d5cGR2wI1
	5o2OvPl/O0DXGAHwJt4WwDekgHS9+ICGJHvAgM+WF8Yj1IdUn0JFbhpcEuJdrkJr4G0=
X-Gm-Gg: Acq92OH0DVkN+QFVuK6QAOSNHTEoAwH+Skbvuf6GiI1XMHtO5ltOz8JxkhbWZKYlRxS
	chs7IywtQi+9INqF5Js2PykOyjG4pkhcOR33qFrP2KZDZrQ2+c2C98QE212kiTd3Fw75x+Fb+I0
	k3gmulGyIYN6kCMfy1cwmEIL1uuN29bsWgMCFSFm2ur2aD/3/Vcr2avYEHWnpRcFSIS8j/BUJrL
	inDeFkGIAgyJeGx1/60IERuXZGFMqm4740+nlU4BLyz7EB/OGHjTz+XjFuy06K8hTFpJMJIjgvm
	gX23+mnQD0xANRVqn+hJxQERd/h/RFMy5ZySqcAfUOtcU3seOGgi2zC+J7KX04pO5epH9dFnqiR
	59GH7q1fPqbRqUKagN6qOzlhNy2lA9LwTAo38RKIZ/XEk1/xzqiXx5bK6X9i1AncOaF6yoMe7Y0
	9ukqHYWeBvoTvLGdo5Do9/1irDBPgZcHV6K7/ZR3wyjJ20f8V8edqUi0flYyG+Yg/LpKSNWn75O
	KzHViwEdxo03DkF
X-Received: by 2002:a05:6000:228a:b0:43d:70de:1c71 with SMTP id ffacd0b85a97d-45c58a70c86mr4450704f8f.11.1778675838428;
        Wed, 13 May 2026 05:37:18 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.195.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4548e4bb87bsm38899725f8f.2.2026.05.13.05.37.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 05:37:17 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Wed, 13 May 2026 13:37:14 +0100
Subject: [PATCH v4 2/6] dt-bindings: soc: samsung: exynos-pmu: Require
 pmu-intr-gen-syscon for Exynos850
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-exynos850-cpuhotplug-v4-2-54fec5f65362@linaro.org>
References: <20260513-exynos850-cpuhotplug-v4-0-54fec5f65362@linaro.org>
In-Reply-To: <20260513-exynos850-cpuhotplug-v4-0-54fec5f65362@linaro.org>
To: Sam Protsenko <semen.protsenko@linaro.org>, 
 linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Henrik Grimler <henrik@grimler.se>, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3

Update the Exynos PMU schema to mandate the 'google,pmu-intr-gen-syscon'
property for the 'samsung,exynos850-pmu' compatible so the driver can
obtain the necessary syscon regmap.

The Exynos850 PMU relies on a separate system controller block to handle
interrupts generation, similar to the hardware design of the GS101
SoC. To ensure the hardware is correctly described, this syscon phandle
must be explicitly provided.

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
index 76ce7e98c10f..6550c3736a3b 100644
--- a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
@@ -182,6 +182,7 @@ allOf:
           contains:
             enum:
               - google,gs101-pmu
+              - samsung,exynos850-pmu
     then:
       required:
         - google,pmu-intr-gen-syscon

-- 
2.51.0

