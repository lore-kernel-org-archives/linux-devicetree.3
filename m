Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2ABD36BCC4
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 08:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780043895; cv=none; b=jlwP5XOtn9/J8jPojR0TENMcaM5yRdfeBudyMCAovXFkj6BZHTY895C0FTsL+/BwLt2Aib18TfEYOesoOw76CRPbyJVyRgTRKeUe8Mr1YFmrT7/y3ZLn5osQCKWxOBWiLwv4xqdrIHaRx+ZkbocstG6dtWmbnb9zCHVcbwIPe8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780043895; c=relaxed/simple;
	bh=eIoJtuEeUkXYneEzlx9+Je9fqmyCt71Y4TEtTlS9pcQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n/PWuviphfamYApSqmCGvE0ooiO3dP5LWa/d97ek4w9P64PxOuTaTf39rLSc6Z1StpOEFo4Ffk7lkWS0N0kZdm3p7VmVlrB4ZerGCLQnBtYVE/Nwp33x2ZwZuZ0gbEjGoJenHCmZZ8YaxUbfeEa+IN+tTajJcM6HnXp4mBTyqgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nf/F3czv; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nf/F3czv"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-48d146705b4so144407915e9.3
        for <devicetree@vger.kernel.org>; Fri, 29 May 2026 01:38:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780043893; x=1780648693; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wuqiqTXZ5hCzNA7yD+Zir5fTo6aVNemJbGqfNK8pZ84=;
        b=Nf/F3czvcQH6qjTLMddlIEbpr73u/Z3e1eJok+ci9PmEUt5vddFjHonzaJwT3Z5MzM
         s9PmugYKZ8RTRGU3P8iGoViZQs8zIq3hq8PN5iFRjP/GQkp/BErrQq3TjJpVqOUJPYKs
         RQxL2kNvORZFA452J/qUBbwjSAz0sOvDUP8hKs3iXYk7iCpsbwej5PpEYyIA7XE4TPOG
         XJDePgaSEx6A8RgneV4gpIC8c35DXL22lw4gHAkZRW0PMEpMjIMgyX6awhw/Pw+owK4R
         TG2FQ7TKcbHctwIjllu6av821gGcjf+Uv8PVH8laRbyCP9l6OZysjJChSm+BDdoF13w3
         SNJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780043893; x=1780648693;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wuqiqTXZ5hCzNA7yD+Zir5fTo6aVNemJbGqfNK8pZ84=;
        b=Atv5+iVjXh/yzR0bK/pEUO2MxUv2sz1ru8IW1FFZ+/QNOeADFVh3GVOPWbaLnJhO0k
         jCbkYTdzNSUTi2Li9bSS6MrPU13Kxnuz8yk4lyicWYHtJedSU/6LPvKPqy+04rkxEGFv
         o197eEssTN7JsmREG8ZmYgKv7zvXoZptco1ixYlGXTReL/YgSdcviGygswMJ0FBpgu8M
         Mvy6q9eWYQi0OHm7D+GgOZZNOqof4E3CbuQJp8cS1lx1GCB+HJdtfmcVtd81ULw4CW37
         Dr4wFBj6wdIjND1a/YbjJ9rD9AtwG9va8UZgm1o20tP5zGda7k717zBFP/gaPkYb6cf1
         tcoA==
X-Gm-Message-State: AOJu0YwWUD2EB3dvlfkCV1daxkyu7BPIjg3QZiQUtBaY8HnypKL8Ek8t
	TsV1bhofuBuFxd4TlJhbarOsWydNsmAtqqyRBfekJy8XypocU4Q3ZU0c
X-Gm-Gg: Acq92OHcB6G0iuEQnHM81ASsTf++Kar6QXmzkDv8Z8a+WF89ummuuRWfwW9FYYORjHr
	lE11GIxczO4TQ5InMoiQNL2PJSAOtp7iyEOisILJsEK7yuKMLZxFG1GZlHHO4uXtrqwzAXcgTZd
	mhjedzGkT63HkZq5MHXJ8cK/p+WJXDCH+qb3JLtX+cNYNPOKllkQ3JjragCuK21TkqrDP6072c8
	JOgg+ubx5y+nR5TxWbztgvIbkkbIJiqQ8rqUNA1GzhMq920YRqnC3uQcIiczfCM38LtZpmIc+3I
	x6OnYKjYqOrHTYWRhD54Qyfg4tUgX4zIGDOMwIqqc5FjxXKUDD1r6ifVJV3HrTcF/kndaiAJGeF
	jnQnmRi028Qe59L4/4jB4s42VI2WdbONmQOU0xNVGqO/1SQ6IDnhXI3lsU2pKzAr+dwPJMN/XHD
	sncrhXimW5/IqxQq+5/LYUo84=
X-Received: by 2002:a05:600d:4441:10b0:48a:f18:ece4 with SMTP id 5b1f17b1804b1-4909c0dea0dmr23653445e9.24.1780043892984;
        Fri, 29 May 2026 01:38:12 -0700 (PDT)
Received: from xeon ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909d5f2347sm24939705e9.0.2026.05.29.01.38.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 01:38:12 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/2] dt-bindings: arm: tegra: Add Motorola Artix 4G and Droid X2
Date: Fri, 29 May 2026 11:37:51 +0300
Message-ID: <20260529083752.44796-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260529083752.44796-1-clamor95@gmail.com>
References: <20260529083752.44796-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a compatible for Motorola Artix 4G and Droid X2.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 Documentation/devicetree/bindings/arm/tegra.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/tegra.yaml b/Documentation/devicetree/bindings/arm/tegra.yaml
index 033a63f6c068..ca311262ca32 100644
--- a/Documentation/devicetree/bindings/arm/tegra.yaml
+++ b/Documentation/devicetree/bindings/arm/tegra.yaml
@@ -46,6 +46,12 @@ properties:
       - items:
           - const: acer,picasso
           - const: nvidia,tegra20
+      - description: Motorola Mot based Device family
+        items:
+          - enum:
+              - motorola,daytona
+              - motorola,olympus
+          - const: nvidia,tegra20
       - items:
           - enum:
               - nvidia,beaver
-- 
2.51.0

