Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792435546;
	b=RIHNV3E7HZSRsaLC34OdPJ2AUUgb4Uf0+lKAbfRH/MZh6xyB5x/FxOo08USdXQr6znvb
	 QjSksAxD1hcV6reixts7ReQ0VpdsHmDKqqHNCLrXMBVtzu9NyfaoPioKNfec7sSh3iE7i
	 5XMz5wDZwJY2R5N2gz9liygNGQLtiIn4soOrgBGAEc0xWJVSngLDNURdMlQKmElpp4Cm9
	 nrpjx55kEQRoRGBQZjPgK3LtJEAPmp8I3wC13XauPemDxBl+I5zDu8iNmcy2kSPD5tpSj
	 Ay+fLZjVsWpM1NRRYzxSbQmogoVVMgGgBPkgX4Z8T1IZNz/vk6FMCARgqn9nR5I5XpA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792435546;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=+5EOVY9DUNw8s72Nx7os6foE09oFwHGfwPgDFCi+jYM=;
	b=WMlMPKbx4RJiyUy2XBhLDQ8ssZnLOJuFKrWuWNl18Xr7h+bpRgEEH0el85rd//zPByEJ
	 0gNNRPamu/mEM8axwI/4t8pQH/hzCTicYH+SXE/5GP4ESewkoRGAF5Emx+fWuLUiFyihB
	 PY8zDQMUItUStGuK+kVXAjnjHdqJr/l+JS0vg1j9LTVAeKMVgWYDlVPhuDkFr5fdRxoDQ
	 5JzUd6aqbxJ0VzTjUhSSHvwd5kH2Qy5XX6RFUqJvRQwQ3RBvS2DNptZcfBm5FHNjbWIKP
	 sayQuL8h4fI6suSA5F7fgN+sBHMdGjjkDb+Eu9HbqxIu2YQsvmaGuPeptcx/fIOdNhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nexthop.ai;
	spf=pass smtp.mailfrom=nexthop.ai;
	dkim=pass header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=CROF+cxV;
	arc=none smtp.remote-ip=74.125.82.49
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CAB8606A339
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 18:45:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6CAB8606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=CROF+cxV
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-18cdcfc05ffso899670c88.1
        for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 11:45:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1792435545; x=1793040345; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+5EOVY9DUNw8s72Nx7os6foE09oFwHGfwPgDFCi+jYM=;
        b=CROF+cxVEiQyCpnV1Ol+NzHGgnxT88R0BFkUrod3jp1qyJ7/I/GHJIX1pjnufC3RC/
         ME4OtYwxOG2Z+oFmXjUkYoN5GAvf+zrekJVQKECUa1xfnKibOZYk31oflHTnbBYwIutp
         5/fq+mxjPPz6IQNFabdq9vjeD9W09bc/k+5+nljvtz0d6+0KrvrAjh87LydLiL8SxTyg
         9VcuD61HvEFIV9gZb0dmRGPXYSoRZHpXlJ14rarNUTq/REoCvjFzaPbxhxPKgmWxrdgt
         GiFzOHkr6uMOwHjIgXPq4MHaYFYw+Wnpmxczlv360BFsjRlnxG4mp5M4g1J7Ueamh8mn
         3nYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792435545; x=1793040345;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+5EOVY9DUNw8s72Nx7os6foE09oFwHGfwPgDFCi+jYM=;
        b=RlXB/kR4/wCptRo86nJyEZMTD1TG+lpCiXdL7RM+vrxQe2hwWgijMDHbOHNdUExnyo
         JTbul4amv1I+zImryQJYRW9ffdHi0/VvyPyrSUVTYZ1LQ0EKCyfMMdHdGsU1gHiWmqey
         nlwYMSotKx+0iuAc7A7HPyy7lvj9sVhim9LZXiLONeYZIparXfh8PkJ0TM6eqB7eo/lb
         XvWk0nLu0SyeXAYSCkzvLS9RAEQ0TswuRM11SNvb1nfuc+LSyoWz425d3oa6L8jIMffq
         wVfE4Qyvf25kRSA+pXS+mw5DeLjWjGB6NIREDEN9n8RCjP3nFNx9SMnSfmUAWOgmy7Hj
         rsiA==
X-Gm-Message-State: AFq9FYKL/53OKFrcrsQiCRZ4g1WrHu8lg8o0fag6exaRBPMLem4iHehO
	8FpUN9JteoTJiCl2W4SXBtAqiyls+lxa8kyyri+2jekxbdfUej8zf4LFC8wzwZGz5x4=
X-Gm-Gg: AYBFou0gcL9rDaGAFRq5zrvKjtsbK13palacfeQpS68uuBWutfeAcM+TnGH142dpteM
	FSitUB5i1DTqx3dL1kLZTVUALCwtCxLZutlti5hakDyD6locsWNAmacpsP5py9xGLrVC9KACrf9
	laq/fnhTPACKAfgbIacrK5IyAOiwFegR+H4dN0AbCG6LmApQ8Z9kIBbwEEBbnvbW3Z32ODCk1va
	hPsy7+XH7owZGEZFLYuCjmd7aBucopZqSJ5fga5gLpVELQZVmXn+oxn5FNzSREiw2aGfAKz2163
	Xr2QDYrbM3lIUT8sOflCGfGIOgEnLutyMznGasPF93Uo2ALP/S3h+mRqRgTroE5JBJ0u+Ti4uVs
	e7j2yVxEO30gTWMMCX1t0GAdfYPquKNVdKo/QUwRE2Zp68pdRNHa9myhfxFDUnYIho04ZTa9DyX
	ZdOOdMCeZSBdJD4CTtts2ttMcaZVGQnbadUk2YiaS4O3TSXb6KVJzinZZlkWDXw5H441FvVBIBd
	n0=
X-Received: by 2002:a05:701b:4183:10b0:14f:4b01:40a1 with SMTP id a92af1059eb24-18507fca393mr12939427c88.0.1792435545495;
        Mon, 19 Oct 2026 11:45:45 -0700 (PDT)
Received: from [127.0.1.1] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831c4d4675sm29907576c88.21.2026.10.19.11.45.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 11:45:45 -0700 (PDT)
From: Kevin Jia <kjia@nexthop.ai>
Date: Mon, 19 Oct 2026 18:45:15 +0000
Subject: [PATCH 2/3] dt-bindings: trivial-devices: Add TDK FS160x and
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
Message-Id: <20261019-fs1603-v1-2-8adf972386c1@nexthop.ai>
References: <20261019-fs1603-v1-0-8adf972386c1@nexthop.ai>
In-Reply-To: <20261019-fs1603-v1-0-8adf972386c1@nexthop.ai>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org, 
 Kevin Jia <kjia@nexthop.ai>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792435541; l=1668;
 i=kjia@nexthop.ai; s=20261016; h=from:subject:message-id;
 bh=vv7jc6T42fhaJkWqiEeKPohXQukidcy6joILhcZ0eqE=;
 b=HII5ZHZ2cEzr6ZQ/XjUeiKk53W1QW46O2/OsGyl1EYsF4RSfn6+1k5/9ZFqIGdPzQ9eBYU7Gg
 TTkqnYQGH9vAuwL2Di/mC8zwqZG7d0WgXEHuyclQQ3UGjf6wx+ysP8A
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

