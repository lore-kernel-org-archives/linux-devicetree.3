Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB5DA4D17AB
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 18:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790015202; cv=none; b=H5nl/8KH4oPDNODYfsYFlphpanj3W/taIaD2xOjRePxnMv+zt/h7YiBZpJEK1R6IsUQfdkk/E0YxbRBeJ/EorVENycI2m6/DmC+5tWegWKWMBtkdCz1qYaE8gZOzq9EthTIhLnhlavnnfBt1k8ccF1gNwt2UibFdC7ftMeHrQ94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790015202; c=relaxed/simple;
	bh=UhuqCk57WeKXY+hI7wFJKWOE0Yfd6k1xI6Ll5+toYy4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ms7Qo2mJjVcaUTogVLAEMb/jdEgIF0aatsuLdr42E/M4RZpIjQh+57kIXpu8vXfKD7DfHnYaFUvDi8hyfUdvDxSCVe+ChW5cp5GGunMDFgAmTJEdBAVsMYoMxxKfXBz865L+zba6HKQ1euyv+Ha5aTFEAX6Fp4O643fRNQBOb2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffroot.co.za; spf=none smtp.mailfrom=ffroot.co.za; dkim=pass (2048-bit key) header.d=ffroot-co-za.20251104.gappssmtp.com header.i=@ffroot-co-za.20251104.gappssmtp.com header.b=oYSVrmoL; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffroot.co.za
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffroot.co.za
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ffroot-co-za.20251104.gappssmtp.com header.i=@ffroot-co-za.20251104.gappssmtp.com header.b="oYSVrmoL"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49d1fb0cf5eso23698505e9.3
        for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 11:26:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffroot-co-za.20251104.gappssmtp.com; s=20251104; t=1790015198; x=1790619998; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ha/HEypz3MxwAQmWEzTLCA1xaL4MlxM5e9rrz6J6Qz8=;
        b=oYSVrmoLPXA2oMnXjI5rDzJaib4PSA1xvZfOhbM9PkrH40LdCkiS0mSpCZD04uAxYe
         jWtTogTOsW3G59XLH0NkkJp8VTOqbWAbhuERUQM/+4E18TL9Q/AWYAiwF6FNNbVH473o
         5H9QvDEyMVDwH+ZWptW799T1BxiOeLf9Ec42JryZMKYoXmYnEtMC99QQ9Lz9XjpRFVyz
         mtHJWLtNAMsdQlReyDB6LYrG+zfb0+QM71ejvc+tCFw/ibsdn8R6fH9I04J/chwDnJF+
         1nNppDPE3jRe5viVkc+NfQCJN+FQ6ZqLDbDh1Ep4Pwo0MZihMeMb/4Rx/Gu+I0gsobtD
         K4ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790015198; x=1790619998;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ha/HEypz3MxwAQmWEzTLCA1xaL4MlxM5e9rrz6J6Qz8=;
        b=OtwDGgshRezQcS8pNZQc8DCawnHrjRDZ4IqNH+e9wlbRdwcx7QsZ6ldHtmFnWKeYAa
         6KwmaMCfpAhgFq68fJLY63iqQ9pmb7I1Ap6J8p1GN9YISHRgKLIDOBLDONZK8MFQPR8p
         Kwr+NFdIZaXU9arIDw/GQP9/Z3n5P6xgbC27AXZOQm5lvTJycKNDRVPgCxUvwc/TvrGj
         erxBtk6ivVhCHIfyWZC1IcfeTxqY/FT+gBOobyRpEfqiA85nEI1uLuVv856Spic3ndM6
         2aP61RfsZblVDDARFtFqle6qsLzpwPqXKG8NT07dopECZ+etvKJAoHYLCWtJkH2cERRa
         D4pQ==
X-Gm-Message-State: AFuF++lf1+a+aFwk5WwY5LBx3iV/TX9PWGdQVhQuVe4RMwV+qUo+BLsZ
	7gt+XFgcT2dkvjjgi7GAWJI4EKzYs9Mrp1tnq8iSHp5mcrxofjhLnIBQIl8nXT6J0l8=
X-Gm-Gg: AYBFou3+WLnRL9eNJ4RjCXa21j/4ue2z9BYA9gFaZxYQZQqr3/jE5BU3Q4jKweZhNGI
	kS0a6wXjt1hKHvKsXbUop6rDuWT9codJXJ3hF4nssR5w0a5M+IsXcNtX2XfJ3f3TO7CCQktM+5Z
	diJGb/N3MBd7iVDOq+k0zQLoOgndxVBUqu4SR3WsZRr35ubrUuyXLjAeoYkiZG9X9VjRtVsSOOD
	mMv96h2xVqsfVjy8lArfEHJIzCmsl0CABiifcbA6WVzHsMyg96RS6RlxY5LgbCmhcyDTbnzQeYC
	9DoLO5HGo/dYmSxQeqhZq+sDDlR2QtqcS15EJujFJ6odeRMtO75R7vuhRrFQtUZLHOdBf86trbU
	1FxLKj8owk51ey+7pJP1Gn1NiMX+P3sYoRiSFuuOXxpYhYCK+cUAHC/9MyJZz0F+KUlijxtzsaI
	gyHzkte/UeRQVzxOL2u6kSoP7gcl+ggXP663x+Uo56PE1VNG72Q/tkSEKlk67GSiShwpPpPdfbC
	wd9Eft6oYi/EVYnn7GW9zNPJK5AJnDFymUg
X-Received: by 2002:a05:600c:4ecf:b0:49f:bd3c:bc27 with SMTP id 5b1f17b1804b1-49fc574f074mr156497555e9.34.1790015197620;
        Mon, 21 Sep 2026 11:26:37 -0700 (PDT)
Received: from dev-ag.figment.co.za ([192.145.132.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4872446067asm25126184f8f.12.2026.09.21.11.26.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 11:26:36 -0700 (PDT)
From: Andrew Gaylard <ag@ffroot.co.za>
To: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	qinjian@cqplus1.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux@armlinux.org.uk,
	Andrew Gaylard <ag@ffroot.co.za>
Subject: [PATCH v3 1/6] dt-bindings: vendor-prefixes: Add Tibbo
Date: Mon, 21 Sep 2026 20:26:15 +0200
Message-ID: <20260921182620.17597-2-ag@ffroot.co.za>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260921182620.17597-1-ag@ffroot.co.za>
References: <20260921182620.17597-1-ag@ffroot.co.za>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the vendor prefix for Tibbo Technology, the LTPP3G2 board manufacturer.

Signed-off-by: Andrew Gaylard <ag@ffroot.co.za>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 4a5cf436eb14..8a984fea11c3 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1728,6 +1728,8 @@ patternProperties:
     description: Texas Instruments
   "^tianma,.*":
     description: Tianma Micro-electronics Co., Ltd.
+  "^tibbo,.*":
+    description: Tibbo Technology Inc.
   "^tlm,.*":
     description: Trusted Logic Mobility
   "^tmt,.*":
-- 
2.53.0

