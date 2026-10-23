Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792721384;
	b=MUW5zNKjgmWDv/ilS1zL710PsA++bttdpv4OgvVlqZqxo215fYhhKOvOwS+5t6qXR9Ft
	 qlphHaN/Q9t9I2Blpoxm6gtXH5608T9K2FtHIE6189KaK91Pp/W/T54yjI7pwABesyFfm
	 m0WFS59LE2EDd/kUuYooXyMletMamTLJrSbWUUk5DNWr50qI9/m05uoDmHWfCLeB0aLsZ
	 Y/DT6a1GrW9dCo7yreDY/es+7EmEq32LGeuxZXVSHts9rYSJqYgJbrG+1V99PpAPJi22O
	 DHSoqgQqLU0gbJVYGo67i8suc1J////TwVPycMPdlRMrLhdBPvLbexCvB8LMRc9B3vg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792721384;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=nCEgrGMpts002PKaGu2tXyuX04mpb/j8xqv0L7WHiNg=;
	b=XcqxbCqv+a7yxertYgTmJOVmKtlu4GDB/0lwK6ciFqyiouPQgQm91FAUIImazeEdzywH
	 nCyruOlCjvwwKfVcdEP2RXkgftnKO6u0Vh0hTxfT2aCx2QN3sCj/aokwHPa7ZfNdEGwvx
	 NJSDjvbwFUXftmjC8bs9RP/VwCa323y7yMOFo3YOifdaOByncD3vSnkDPpyFw8gdGoxJk
	 APqGYr22LRPJRdroZ3aMX1FoHJDZbQhEqcGiPo+OCj6pQm3Vxhh7h8jlpaeIprmzpX6df
	 Xa16/Al01PO/kFh0l/X1r/4e3WdSkRnz2f4eWKPBKZBdzCnTF5PhOHNrLQfARZAWHPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ajy5gVdz;
	arc=none smtp.remote-ip=209.85.216.41
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41971606A31B
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 02:09:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41971606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ajy5gVdz
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3adc4590de4so324526a91.2
        for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 19:09:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792721383; x=1793326183; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nCEgrGMpts002PKaGu2tXyuX04mpb/j8xqv0L7WHiNg=;
        b=ajy5gVdzBO5meo7SWQMrbQWJtJdCzL1//MFKia84+VmiCEwkpVsrYbtg3P3ECvPbIv
         ZU7C15JYfKcqk5CFUI3GPJiGsXYXRccf4+a7pAX14b/C3mpAgIgdqeEHthMNxFdB6dPJ
         OsBB58VAqhpbjaBteX9r+qP88upV3+dOU2CRVfiXwrMZJn+KKZphwXPh7ZisDwAIGgeo
         MJDl8k2WHSuVfn0rpI9WMdHaLw6ocTAWG9PK2sHrmRcCsvC5qW6PjAKnl4O0r8lMhtPv
         eSm1yFdyui8bL25xIMF/X6/Y8fGbSWUkoIK/YVcQE6KRldKPgUEw9wt7V/CDVHlmV2ou
         iKCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792721383; x=1793326183;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nCEgrGMpts002PKaGu2tXyuX04mpb/j8xqv0L7WHiNg=;
        b=Joc4X7wEArpimzMqawPVwF0erq9rsW8DwRZqImz34SOL2vWKWDoy04QSfF0E7Vh7x9
         +nOTATKAInL5faucV8+w4Clk7YFIAMkMiw6uo/ZkkW0HfpHFmdXIHPQVTuBJljzhE/RH
         8BWSylGVPvKrVA+aeE2OzQC1R6QaaXIaBito4jqEag3dPsgByc2iMfc4rTwHcwrpNi9l
         rLas++kJinQLjqoys2GJF4dcrl0tNKa6nmAtxReytvcuhWukZJWge6Aq8z7b3vMTbOFv
         VRsJzomRS1nR02h9WpqJsoTjjCTaaPy2AhnOxdsc1HDoxbUsh2YcHBFQD8SIj/5hs0vD
         cwPw==
X-Forwarded-Encrypted: i=1; AKwUvBy1vg/FNlJeyZDIus8RnDwcRA2lwU/s2naW3zXg3gt0X0qAZIBXM33uvZxNoF/KQGxjXe7tV60H5p7C@vger.kernel.org
X-Gm-Message-State: AFq9FYKesV3RYyV8Kp/cZVaB4c6XZHEGaCcwYhpDuHdNjMi5iH6qEVxZ
	HDIhuNCmvrFVPoVApt11AYc6Z/YNNYB5qW6oX9kTBGccD80VZDAno+wE
X-Gm-Gg: AYBFou170JdRfWdCVQxg8qRcpNyFhZ9OTTNbDbYIpdxeUp1T/TpMqUheEdOV+zr6tkB
	4WjfMoyMoosLqpkAOhFbhPZFSWogmm/83szYvyeCRPy34skOG79pWhJkyqaqmxNuEPjsT4n5Av4
	vlofNpkQFj5P8HlOtCaRMhVkYMWEe+cI+y+1YJsV/VhhAHKwkg1kBvKTXnsA4HXZobdMSvk2g5a
	KwI22aJNHH9pxkIL7GrvoD3/ZCXLKEcwL6mi14R/abnwKPiqhcJHW8YwzsgdDTWU1YiratlEXE+
	KZ/nLvBEg2sAD0x5gRm5lN6tCCfSksmnbSEWUMhpbf88VKwpXChiuc8DcpvvecQe5veSK1XhFev
	lwXLW9y36f5DHhJOCbvjHsveN8SYfKkWfIiVcuJglCVaxaJ7O6J1XMPMFWimFMGW0Qzt8pyNLex
	k+n63ObAnqMDoBqWAGFCmy9fDldP+YFjjk9q+ffYrNLEqisSZsq9r8kusYZ83z0enqLY/6DjZ4H
	v738nI8oKyFhAP9wIwusdY4twOtS/uNoZSNqkABbexr/bC044C4PvgdqTuXb6nQ6VjT9MXfQtZV
	HcLsUqjZq1zc9d43rSazULfx3Mre0GMwTFU=
X-Received: by 2002:a17:90b:580f:b0:3ab:884b:65b7 with SMTP id 98e67ed59e1d1-3adce7db6d6mr477154a91.25.1792721383412;
        Thu, 22 Oct 2026 19:09:43 -0700 (PDT)
Received: from archlinux (d173-183-236-7.abhsia.telus.net. [173.183.236.7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adcb1b256csm1199747a91.10.2026.10.22.19.09.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 19:09:42 -0700 (PDT)
From: Artem Novak <artem122novak@gmail.com>
To: daniel.lezcano@linaro.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Artem Novak <artem122novak@gmail.com>
Subject: [PATCH v3] dt-bindings: timer: renesas,tmu: Add SH7305 support
Date: Thu, 22 Oct 2026 20:09:32 -0600
Message-ID: <20261023020932.23836-1-artem122novak@gmail.com>
X-Mailer: git-send-email 2.56.0
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

Add the SH7305 compatible string to the Renesas TMU Device Tree
binding.

Exclude SH7305 from the mandatory resets property, following
the convention used for older SuperH TMU implementations.

Signed-off-by: Artem Novak <artem122novak@gmail.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
--- 
Changes in v3:
- Align SH7305 YAML comment with adjacent entries

 Documentation/devicetree/bindings/timer/renesas,tmu.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/timer/renesas,tmu.yaml b/Documentation/devicetree/bindings/timer/renesas,tmu.yaml
index b1229595acfb..263f60b950df 100644
--- a/Documentation/devicetree/bindings/timer/renesas,tmu.yaml
+++ b/Documentation/devicetree/bindings/timer/renesas,tmu.yaml
@@ -51,6 +51,7 @@ properties:
           - renesas,tmu-r8a779f0 # R-Car S4-8
           - renesas,tmu-r8a779g0 # R-Car V4H
           - renesas,tmu-r8a779h0 # R-Car V4M
+          - renesas,tmu-sh7305   # SH7305
       - const: renesas,tmu
 
   reg:
@@ -110,6 +111,7 @@ if:
             - renesas,tmu-r8a7740
             - renesas,tmu-r8a7778
             - renesas,tmu-r8a7779
+            - renesas,tmu-sh7305
 then:
   required:
     - resets
-- 
2.56.0

