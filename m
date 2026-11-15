Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794702728;
	b=NuZKAwX3RSWQUYB7xJXDRZwj2ha02ECAcjM4YlWjb5CelCtfG8jsNOx2nhwAXMrudKef
	 GhHY3rQVYbSJZ/n9/Oppya7J8T02dE7L2bU4/zLNXpTc7+YsW2HdQYh9/NGecASeQblXV
	 S8KLwu0K97AdeGTxJeoVWGKHJ6kiPgjyFcUm4BN5C4Ny8WuspbhZHWbBl29EV4ry0T4GQ
	 RG2SevJWzEAlSWDTQ/W+aZDUCtiUC48Dp30XGBv4a1w1W1Ykmjli8W+Fbz73m7YHr4ryJ
	 Cnzhd9hw3W9mk/uC53iRbiMZbuOJvYaPE2dVWA0kRTEc0x9x8LcKK77lBCqVWNJAjTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794702728;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=GVBi/BtHwXrMR59M0e8R1++dDkkmRGqCyH13CxDS4UI=;
	b=RZ/B9mPGKiMj7/1LK0edSlKHMqtuKqPLX4LbiYZ1qs07eGYj+Cyhjnb1sv6E3+dmsnSI
	 j0pWRgKkN9k2JD+rEwwO10hRqYj68f2oA11mjMNrxjP42V+B0Dmv2hSVxffFsLHvJhyC7
	 kePTHpovXBCTPdevujrjwiBiPwqF/npiBDx+ymAPT4CeOeYluFZOa2q7WQz/hcdEP/Vgc
	 JIlrFqxTwWtd3kvo9dJXvfgj7RHanHuPQE34OYxDFmDuDGnh+DGhRUHk4HMbXIYScT5FX
	 63lyEua9fSKxFu1GtlofXnz84l2TkHWuCpVC1OR/Mn9xqMipNPu3Mx66VzFVMx8+Ihw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=F5NY6n4p;
	arc=none smtp.remote-ip=209.85.218.41
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B907B606A882
	for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 00:32:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B907B606A882
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=F5NY6n4p
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c5080ef9b31so421496866b.1
        for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 16:32:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794702726; x=1795307526; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GVBi/BtHwXrMR59M0e8R1++dDkkmRGqCyH13CxDS4UI=;
        b=F5NY6n4pA3zJoPJKQRZ8qrnhPh4iiSBXipyS7ZZeZZk1Jhgi5od6w1ljHwxc4TFJP6
         N4RH5tiGrt0q8MU3f86r2HBDR9A6Xb9OViFPa5swY1F7qYvJquKfK1j+NbvGY5tQHQPZ
         Qj+is9aboixvTiNwW4IEIIq7cGKLrD1Xs3/n7mmKxauASaPGQFt3J5v6yzVGHvXvISEI
         n+KcHLw2WdJSS5FneYfKXWFzsDyGgY1I+yGZBgmkzshmKDFGEu/vmKNWG470+G6EE5Cu
         RIK8CCuHbKZLfU1KmA/VpeWOKvFvZAfEzS+jibYRyTkbRMqMKs9sIZ1s9KIcRGVogHH/
         5obQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794702726; x=1795307526;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GVBi/BtHwXrMR59M0e8R1++dDkkmRGqCyH13CxDS4UI=;
        b=Swe+rOpgqdK6NSgD4RS4+OVtVZoljJ20Kb3B/0Lc5NSgN9CQ3vVC6+hQM7/jncjMgM
         UZNBSTnWoZpDsi+BFDkPbxf+/imrX7+v08mPyqZpTwqDX4w7W7mFPSPX0wnkgMXhi0P0
         cq1abpG/UsxSXrtAkM54jaPYFPbSMX7ERKSMu6NOQdGeG7SYoWkhMudAvZfnLjZAffzP
         HNesXWFew/JWz3EJiMaGg9KDISzIFIIWIlqxvEXnM/i+oI5KU2+lIc8NHm6y0JgWlSMj
         awU62MnF+jagtfXf+BaoXvMShvE1QvabNzHWD3BOtHoxA0O/D6GhDcJXevwBfCgjQQxl
         6H4g==
X-Forwarded-Encrypted: i=1; AL+hErF5B41gfPycfgnLCzBf+jWDlnHHSAwsUnADbiMmQJebJnxU5wDJUWD3M/HC4SbtRbtvKu6l8ray9xRl@vger.kernel.org
X-Gm-Message-State: APuU4Z+WZeWmZ/ADLSaJrnkyzaz/R2CN+rGQoAZWphpGZWfGnX839+Jo
	/WokaKlKyTSPm5yXz8kvxgQjy/bxuK3m9V0XWG5sbygtp44nKeV6npw=
X-Gm-Gg: AYBFou35UVuJLCR9GCte3A6wIAg83MV1IYYYr+AeSjUgX+5IOQXZhIqWGZY7klQH9Cl
	XUhBDupTR6hTDdjjvh4r+uLG2w1yfg5DgrOVP5ZrYzMwbST5ZM9RfKgQoyQbSSwDNDY7MgEKN6X
	LqUZThtbhdxBtUiqFw6KTdXWwpGqbC7zX87t5ghuczM9KMBUjeilJJzxSjVoIbCTa1yWaKRHXSi
	11G7mjT1fEo2+9l8eDXfLdDzbOKJu5Zjm2xnNYk4SxppWVSHGSLQFH7rSZdZQCRG7jAQAUYiMX1
	M0JmQJPuPybc4zmkPa3sb9+EgpTu1V93Srdkw39SR0Hjh8bk/10P+pql2xYKCegqXwxZuQsXn76
	qz/3t+njE9G99PNBS/O/izyAuwHRh84vuKO9WLeTLPW6WPfIUovOEXA8OqA565vBytfmR3BxFb5
	ITKR908WH7UT43vt2tMUJgakFjTcUB4VU3adoEHGCvzFoI+0Yn5wpbN9TtoxyUxMI4v7m0lhVDx
	8GhFCyV3vpXne9OuV9yhrHrG37o+5XLpru1+v+Jf7f8cJ8tGxd48dlkXO2nJyyIvOJn7B/AyW3+
	LWOVYLF2AFVrlgrKYb9yYe0VWtEAaswJymBSYk+qJ4GhFAHb+Tiu/sgRMvRZ8AyZnChXOf3iEdS
	EoE2q7HBDW3ExP+S9PnB91L7kBgvE5isPYZ0=
X-Received: by 2002:a17:907:843:b0:c2b:4142:2db1 with SMTP id a640c23a62f3a-c5096387a3dmr518400366b.40.1794702725988;
        Sat, 14 Nov 2026 16:32:05 -0800 (PST)
Received: from sohrab-omarchy.taila18b31.ts.net (2a02-a44e-4ae7-1-c0e-6d5a-8ae2-915.fixed6.kpn.net. [2a02:a44e:4ae7:1:c0e:6d5a:8ae2:915])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095a5c4b7sm260695166b.1.2026.11.14.16.32.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 16:32:04 -0800 (PST)
From: Majid Hajiheidari <majidhhdri@gmail.com>
To: andersson@kernel.org,
	konradybcio@kernel.org
Cc: rafael@kernel.org,
	viresh.kumar@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	abelvesa@kernel.org,
	mani@kernel.org,
	admin@mswin.me,
	linux-arm-msm@vger.kernel.org,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] dt-bindings: cpufreq: cpufreq-qcom-hw: Add SM6125 compatible
Date: Sun, 15 Nov 2026 01:31:56 +0100
Message-ID: <20261115003158.391171-2-majidhhdri@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261115003158.391171-1-majidhhdri@gmail.com>
References: <20261115003158.391171-1-majidhhdri@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the cpufreq-hw (OSM) block on SM6125. Like SM6115 it has two
frequency domains with one register region each, so add it to both the
compatible list and the two-region constraint.

Signed-off-by: Majid Hajiheidari <majidhhdri@gmail.com>
---
 Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml b/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml
index 98eb36bff..8dfe77d08 100644
--- a/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml
+++ b/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml
@@ -28,6 +28,7 @@ properties:
               - qcom,sdm670-cpufreq-hw
               - qcom,sdm845-cpufreq-hw
               - qcom,sm6115-cpufreq-hw
+              - qcom,sm6125-cpufreq-hw
               - qcom,sm6350-cpufreq-hw
               - qcom,sm8150-cpufreq-hw
           - const: qcom,cpufreq-hw
@@ -146,6 +147,7 @@ allOf:
               - qcom,sdm845-cpufreq-hw
               - qcom,sm4450-cpufreq-epss
               - qcom,sm6115-cpufreq-hw
+              - qcom,sm6125-cpufreq-hw
               - qcom,sm6350-cpufreq-hw
               - qcom,sm6375-cpufreq-epss
     then:
-- 
2.56.1

