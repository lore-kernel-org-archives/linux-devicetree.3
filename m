Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792514907;
	b=X2chQdThdu7mHuAlR5OdenaE49Wl3x/gZ4ey3ral40RT7ArmWByN2yLMH9SOM6R2GhN9
	 X91XkD+ZgwWxdVcZVC+snYT8Sq23gzyfR9P+iDQJSfph86dBAczMxAkkQG25RpPNkIqCl
	 kZCtyZYiNaxfS3fS/G1Yx1DU0K+cXriJrlRTq3JPaJg1zuweXTGXi9LY8pU2pI+rIJ2zY
	 YalK1g7WzMG5hMTSxFIBATUSuWbjnEYIVdTUgBfgjVGaE3PJZ6ITdIkvACJMTSEwEI35a
	 zyQA/GoTr/LlCaTul8g6IWieQtQsd2OlERbd8lrio2weIsZF5nNzGcBez4VkF8odxOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792514907;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=+5EOVY9DUNw8s72Nx7os6foE09oFwHGfwPgDFCi+jYM=;
	b=xbEuTht+UD5n/Ec6Ra2uUv06BzwnH6YMf3ELeSQhmNVHX5g67gE0TYQ6+5PCaup9l152
	 iDtWWHTOirMZ5SbTK9tWPlxC8g/KD0Se543zIScwtCqtbdFjzn5QtGXgiXJDpiKcToZhz
	 weVev0KuFxxSClGSqRBclwtxcIkZR1DZeNVNFKPFGjbwBWbwAQQypxyoqpcoI/pVeuuZH
	 XuLwE6TROdxAnTJ0cM826cvJibysMoY98y/Cj8vDt3MErblx/RRd3puY3GVslNoD3rGal
	 3MMaoXGVHfJod9xMuRRxmsMtTyo1yWKLdB0/O/0o+QSgqbCGytgHEsLucsjKOVN8eGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nexthop.ai;
	spf=pass smtp.mailfrom=nexthop.ai;
	dkim=pass header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b="asN+/mJc";
	arc=none smtp.remote-ip=74.125.82.51
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CE9D606D546
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 16:48:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1CE9D606D546
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=asN+/mJc
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-16079d54c17so756037c88.0
        for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 09:48:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1792514906; x=1793119706; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+5EOVY9DUNw8s72Nx7os6foE09oFwHGfwPgDFCi+jYM=;
        b=asN+/mJcU9zt1+Ew7cYXC5xXTLeYVwsdj8Hyrtz0iXW1b3RBMxYmDYl514VEVie10j
         82FYCcHC1M8nJSu2OONjjyOtcFC6gZHNKrYXJHr5nMiVgjLkt2AHYzcinTJTpTAweINn
         ceiDB4RwrIQKYjDxEcwqOuQ2zEIMM6oIFQEaTNi/fjcYZUz/8nVR0NcwsPlUOxwTj3rN
         hffBkB8nTHsiH2ET11kFj05nJQdp9fp01OcFNOs3IB4TlKp9hJk/JoUemW67NNkHeiPf
         /HpuClRnaj22CXs9FsDO6YXGCR11O2QDe+IVb7udqHkzgjQkdhPIoBORX+Cc/gPRmd7x
         spzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792514906; x=1793119706;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+5EOVY9DUNw8s72Nx7os6foE09oFwHGfwPgDFCi+jYM=;
        b=UoHbAUhGR33iSnVNom4gKGCulUffSAca/GJxeLTKG+9vhVbuPVjMiFUiX21Va6wSrS
         m/hXiPRTmVSPmNWUZxzROFgm4vs77Le1Cw+Q0khAHK8DsR7xBDhUeg1bTxHoG/6Mo/Ew
         z6d1vBk+fJnFuMWYw/ueizGAPkDxyqaGJJEF1TIQQiGFWH0VTxZ8Z9/OEk8iY3E0/Y1X
         ZwM6xPaxV2a7hQQLiGS7iT2yRC0tvznZ2nGnk6hFxK8gJqgZ1Y46V+VGlaWbzhTpmpD4
         Z8Qvw+DAjsQnlxEnRGKFttiNNaQsSNHparqp/4sHtbZN67+UWqCSHIKk+WNm7vb53C1K
         JtbA==
X-Gm-Message-State: AFq9FYILKNfqqTMtw20mQghr5ZYvhjhUIKCAM4NqAEeqbBSCsfKnjnaB
	mzJ+vMBLV3AqwocN7BeEMRnwvcuyjM9rIYLEJ33YPJhrj5nO/hVEiEBiDprLuBI75yM=
X-Gm-Gg: AYBFou0vJQbduIGLBwns3jQQEe6vLsxOBpHZEvTVf8ajVi8+ogl8AsbbRSziTuQobg6
	LQwWSzXQZjIOyKZraWaXlpjapvHLw0ixaDIPAzj/ijC17E3yCPgknS/0RdBhmlYRuNUcSSUuKdg
	tHpg/QV3TAi7oC1NmL1ThQyxxssvEMydFTCtKrG5oL4zs9RYKeyFJFNB7nqbdapgMhDfWonVjpX
	YZxtyMjYHRVmqAdDwmb0GXlbHa5s+vLU4MJ8I+lCERBtlreiO3tBdcfvoPvNttF/LogCPTza18y
	nbSJlUo8M3FW5VcMjW+LNM3Sc38hoNZ9Yx4s+s+iOKtPwET9jlxF3Hqu52iVFFgN8Ji+m1ftpw/
	HzSUzMV9vK6R6YWPACUgeCSoM5OyNX6+IPrtA59rT4XVpdSgNXZLBoXZHnYNccJZKZtD9mMFkkY
	AH+bMa0UwRqWrn1t/U/5oK83f0mHm6nSWiNPWpfOR2rhOVrdTWEhNgWjWoQE9h0wFQ
X-Received: by 2002:a05:701b:42c1:10b0:14a:5d07:9b with SMTP id a92af1059eb24-1851310b0e0mr15711482c88.28.1792514906047;
        Tue, 20 Oct 2026 09:48:26 -0700 (PDT)
Received: from [127.0.1.1] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-185aaea8b24sm30916031c88.19.2026.10.20.09.48.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 09:48:24 -0700 (PDT)
From: Kevin Jia <kjia@nexthop.ai>
Date: Tue, 20 Oct 2026 16:48:15 +0000
Subject: [PATCH v2 2/3] dt-bindings: trivial-devices: Add TDK FS160x and
 FS1006
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
Message-Id: <20261020-fs1603-v2-2-0986107a5cd2@nexthop.ai>
References: <20261020-fs1603-v2-0-0986107a5cd2@nexthop.ai>
In-Reply-To: <20261020-fs1603-v2-0-0986107a5cd2@nexthop.ai>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org, 
 Kevin Jia <kjia@nexthop.ai>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792514898; l=1668;
 i=kjia@nexthop.ai; s=20261016; h=from:subject:message-id;
 bh=vv7jc6T42fhaJkWqiEeKPohXQukidcy6joILhcZ0eqE=;
 b=vd9Mh9E0vGBxVgQlbvK8XjOPWj2RIAXhnuQwwJjS/QF1HgV7E52cWY6JCExf5hFUgRXo+D9fz
 gqBuJKTqEPzBceMMK0WoDNiGBDb3oSPIX7d+GG85ii8oILKxpA62pdr
X-Developer-Key: i=kjia@nexthop.ai; a=ed25519;
 pk=TcHV4RjX7qo9R0iryPJ/gWzq3O9yq1SUw0VO2QXQ3Zs=

Add the TDK FS1603, FS1604, FS1606 and FS1006 uPOL converters. The
FS1606-0600 and FS1606-2500 presets scale telemetry differently, so they
get their own compatibles.

Signed-off-by: Kevin Jia <kjia@nexthop.ai>
---
 Documentation/devicetree/bindings/trivial-devices.yaml | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index 42527c7ee9c8..73bc8c130802 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -466,6 +466,20 @@ properties:
           - synaptics,synaptics_i2c
             # Ambient Light Sensor with SMBUS/Two Wire Serial Interface
           - taos,tsl2550
+            # TDK FS1006-3300 uPOL DC-DC converter with integrated inductor
+          - tdk,fs1006-3300
+            # TDK FS1006-5000 uPOL DC-DC converter with integrated inductor
+          - tdk,fs1006-5000
+            # TDK FS1603 uPOL DC-DC converter with integrated inductor
+          - tdk,fs1603
+            # TDK FS1604 uPOL DC-DC converter with integrated inductor
+          - tdk,fs1604
+            # TDK FS1606 uPOL DC-DC converter with integrated inductor
+          - tdk,fs1606
+            # TDK FS1606-0600 uPOL DC-DC converter with integrated inductor
+          - tdk,fs1606-0600
+            # TDK FS1606-2500 uPOL DC-DC converter with integrated inductor
+          - tdk,fs1606-2500
             # Digital PWM System Controller PMBus
           - ti,cd9200
             # Digital PWM System Controller PMBus

-- 
2.43.0

