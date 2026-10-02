Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50B1F495028
	for <devicetree@vger.kernel.org>; Fri,  2 Oct 2026 12:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790942587; cv=none; b=e7MmcAhtljc9ZCGMnsblagA+ky8EVWbetRc1S0joX2I1KNdARWsCPG3xuNf4CmRUkiVNd+ad5g4yDbhveBht9tXukf7ZN7StAB3qpMF4M1Jt8CJc48G2pXV0NzG7umFkPJYTMXBjDfismqUeBtAo7vtmvnCUiIRQfjH4+CvVv8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790942587; c=relaxed/simple;
	bh=ozSoPu+ixvTWlKFKxDp+ARaoG4Sjp3bKLj33/MrvA5g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ddUGXp3tRGHoVs0PNggXtyDPLvgwhWXI3tp2SYbdI0VEiueFM+BjBCjdR3+kEK4TJdk2I2MJFE+R4bEcsJAPmRVJHC5niwkdc6uAo58VavxkmzbIMb5Ti09dkTRfwcHdhaYUUCrrecLVNvDmOYZTC51Hl3pgJZ29mhstuC4236M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net; spf=pass smtp.mailfrom=flipper.net; dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b=qdv/hkPp; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b="qdv/hkPp"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-48b09f6bbe8so1091502f8f.1
        for <devicetree@vger.kernel.org>; Fri, 02 Oct 2026 05:03:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1790942584; x=1791547384; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wZxA1Fz7Nhq5BAB7+pKOMZYxJVrz5ocMRvUjSVpnaqQ=;
        b=qdv/hkPpeGWAeOea1X9b+3YicETfkFAlGNhL1wRjyKUriHagraii1N7n/yJKliil3M
         VRaqnuHwyNpkdJWUfTamq5b4gs7vGn+Nb66mnlZZoRIE7hJH4uhF6kfWi3Z9W3H6Zfm/
         6f9euuaNfXpfILQg6Nxncbc1AKRNpp/3d2iVfjQu3O2YeKgCXlfcaTf6e8bQhKKA+DdL
         EIRRevLpPBhcT681YFqcCxfgWQm6Xuqm1zuTrn1bb0Jx9ryC6j4JTsft3hrUzI5b/agz
         sdJOnXKp0REphy5DwjGAESsbyQ/BPSMvEME2JEyQcQL+K72d4o+XWbuVgy8FNCzB9hcG
         pMcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790942584; x=1791547384;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wZxA1Fz7Nhq5BAB7+pKOMZYxJVrz5ocMRvUjSVpnaqQ=;
        b=SPn/tn4KZEjttCaUmFar0yBLmcHsU7fM56qEK85+JkAtbt3w81jeXwKHBnlUszE+Ed
         rJoFXJ1kh2dUWetTrmFYUfDmrhqikDI2VvEzOgZwFh62kR4rX8SD3Ib6i6niVAeBjBm8
         4Q5SSEo5zBmgj1nkJw8m4M/eLRxDROcVRq+omWnupmFFZIrv93k+L8q+z82nnP7saITt
         ZAzOPSzhQ5/qrAkD380TSU/xSDZbfvVfmf7ihOAjcGG/kTeDQ1UMiQ5jpW6IhX5NOlCv
         JEv1Pmv7WVfx+75wT/GR5ghjuyFAXN8F6ecvF1PJSNFYqWBnvo1eFTnp86XA2MnatK+T
         1LrA==
X-Forwarded-Encrypted: i=1; AKwUvBwYNqUcTzhtI0nzlulLECDMdlstLlDezrUsdUOKOWhd5UnCLh4f74mZAzCYc1OtJVHoZMHIXvPwlM3R@vger.kernel.org
X-Gm-Message-State: AFq9FYJpeG3MdchM/DcFsRjZYG95ZrU3I1YkugqyaB6tWvKA3pxaoJnt
	zuTNZQF3emNmrRABvjFob1+f7bRKs7bEA3BSOPU506OHVGlENrAes7tahv8/TG6n7hc=
X-Gm-Gg: AYBFou1wYv3rrGu/W56Y7UEsx+WLBXiuK5gRb8wEAQUJyBATvAm5yzttTHUeX2PXUCU
	Q4OI8zjO+G+RY/SMkirT+FUYpbmTepovYnrFW5GrQOjDTvddCMcDdRiKzBUoJZA18t2lZ3sPMq0
	/RBt6Y0nyaoNwYAKJqT6d/O4Ky0VPl9ypFom6zDPJcTR/r30vB9BvPhgMkmX+DNCn/DQbRJEPGD
	3KnM+LfpjyDrFrH0c4bfEKxtmDOrwRXI+dD822STyZzreT0E3oB74AW6NVEnSfZ1hCUKDvfLQsn
	Si1hr9YhZebNVyFP+SNQY2sJ59THTtjwfsOdeG3Q0riRO/FcFm3Mu6G+/84OGTheMuDttjdjoiW
	V3MWza10wW0cgFJjU0d6Vl5z+WC68cbbiCOeDrHeRTe0mzZERbSUGfwxl0DW64XL5WXMBCFuCiD
	UzseBDyTP5Yp4zzHQhO4meW9ZAZpzHgsIYCgznLCBgtM1vaml3pX7O/QUu9xj8lWWlEeM/WS6fM
	6qPjtc4eK6d8IGl
X-Received: by 2002:a05:6000:29c3:b0:48b:6bd:1af6 with SMTP id ffacd0b85a97d-48b1271db4dmr2867852f8f.40.1790942584471;
        Fri, 02 Oct 2026 05:03:04 -0700 (PDT)
Received: from alchark-surface.localdomain ([5.194.93.183])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b380f0613sm5845213f8f.13.2026.10.02.05.03.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 05:03:03 -0700 (PDT)
From: Alexey Charkov <alchark@flipper.net>
Date: Fri, 02 Oct 2026 16:02:54 +0400
Subject: [PATCH 1/2] dt-bindings: power: supply: bq27xxx: add BQ28Z620
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261002-bq28z620-v1-1-bdcc10d42519@flipper.net>
References: <20261002-bq28z620-v1-0-bdcc10d42519@flipper.net>
In-Reply-To: <20261002-bq28z620-v1-0-bdcc10d42519@flipper.net>
To: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Pali_Roh=C3=A1r?= <pali@kernel.org>, 
 "Andrew F. Davis" <afd@ti.com>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1289; i=alchark@flipper.net;
 h=from:subject:message-id; bh=ozSoPu+ixvTWlKFKxDp+ARaoG4Sjp3bKLj33/MrvA5g=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWTtn1tso6EfYtFrkFSziMOsRjeJR2ft1qUec8UP/OVZs
 XXuofITHRNZGMS4GCzFFFnmfltiO9WIb9YuD4+vMHNYmUCGSIs0MAABCwNfbmJeqZGOkZ6ptqGe
 oZGOsY4RAxenAEx1fSXDfw8dJo0Oz9tp0xasiJzQn+yWtXzHDpHlwdlzNqUGpb+xjGH4p1gkcdD
 XXHNK1jOFnyIW6xf+3yArcOT+wekP78Tnsu+z4gMA
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

Add a compatible for the TI BQ28Z620, a firmware derivative of the
BQ28Z610 that keeps its standard command set but drops the Battery Trip
Point feature and relocates much of the data flash as a result.

Keep it standalone rather than falling back to ti,bq28z610, as software
programming the BQ28Z610 data flash layout would corrupt the
configuration of a BQ28Z620.

Link: https://www.ti.com/product/BQ28Z620
Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 Documentation/devicetree/bindings/power/supply/bq27xxx.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/power/supply/bq27xxx.yaml b/Documentation/devicetree/bindings/power/supply/bq27xxx.yaml
index 79d1a3c8c685..be0f1f7292c8 100644
--- a/Documentation/devicetree/bindings/power/supply/bq27xxx.yaml
+++ b/Documentation/devicetree/bindings/power/supply/bq27xxx.yaml
@@ -49,6 +49,7 @@ properties:
       - ti,bq27z561
       - ti,bq27z746
       - ti,bq28z610
+      - ti,bq28z620
       - ti,bq34z100
       - ti,bq78z100
 
@@ -93,6 +94,7 @@ allOf:
               - ti,bq27545
               - ti,bq27411
               - ti,bq28z610
+              - ti,bq28z620
               - ti,bq34z100
               - ti,bq78z100
     then:

-- 
2.55.0

