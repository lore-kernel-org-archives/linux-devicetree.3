Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794413794;
	b=s8zSP3JYeAQi3ZcvbFHxSvN9y8W/DqqETpV2otSczvxwcda5c0q3Qz9ioGrvzZ902RW9
	 sZa890YLN0LHZjsoK16wvflVJHi7vTJggUcTov/+5dtIfdLOQFGZIzkl6F7gxWQjtDinX
	 kZi6jAdOpjsCM8svoqG76zQKlOgeUbMuPxpMaWn5QnQ5kjcHNpgMYwe5gkhMVPR21mufC
	 GLBoIjBV6IsQZBsxBkIJsX4r2wjURH0S0afMFTfksuWe/2sHn9QE5Pc+vCZDuOTx41Pfh
	 i5x5d90HYlDF4TZiOigrYmvIxR7vgBvddB3UlWEztW1uOIHti1KTqD5BU1J+lHK8owg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794413794;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=OWKya5sSJ9j067I6HNGIq62Mm3D1tDLxOBn52Ir8mow=;
	b=2916RNQqm1BWAosujdgd2gbH9375E3TzzdyXObUd8ykdqYNE25dF8HnI8RPJkupLv9ME
	 gRQkHfGFbRyt/W2sZuX6hRJAERH+Qd/en3AH6lNnpLs3184sfEHLpZawC5ZXYeiO6Tr7d
	 mj5nWssfo7oPQWPD6VpQ7e9V2mLKjIVqVH2Ffqsr6sy+OZwk5/6zMNf3ejA+5mrmIJGH9
	 uQVufcRGojneCXrSLLZ9KnZt2Yx/XoTEaV57AhelNEvFkdmcoHlJtXma9qKF0W5P92XMS
	 CZ6kR5nE7DKsARXP0iJ3+dCeWjkbvnZDa+iDiQ66t4BJwuie39ptHzeHLZjdR/KzSNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sartura.hr;
	spf=pass smtp.mailfrom=sartura.hr;
	dkim=pass header.d=sartura.hr header.i=@sartura.hr header.a=rsa-sha256 header.s=sartura header.b=l7LxDYNQ;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB98A606A330
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 16:16:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB98A606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.a=rsa-sha256 header.s=sartura header.b=l7LxDYNQ
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so39342015e9.2
        for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 08:16:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1794413791; x=1795018591; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OWKya5sSJ9j067I6HNGIq62Mm3D1tDLxOBn52Ir8mow=;
        b=l7LxDYNQO/ktuoSV8CAdZ5TDHuJEAW/pzLB0sbQ0wOpmhAl7anQ4L1+DrgtEFMHXTi
         qPszFxpwtRiPrtM5FHhfHHjGOOkJbv4lDlpEnSGomlz6tMwSYv7Vcgq+ZndRH8td/Dc/
         7RtyNgIYqr89gQ82DAQnBor2py8ks/BVoCJPCcHZCwfbaozBctN4ATrL6931ZzqdXDZP
         UOguDUjcJwm+W7lEKIy7LoyabOnqyDnI+JJarCo/FLj8HR2Iv0jNn/b/4cq/Liv5MntV
         MZ/TFVTYRhWico5wfus7vRP4XOk4IThG9z5XjfZ7JjecTWNXSXhqcGpatjK3dMs/TPgo
         ho8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794413791; x=1795018591;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OWKya5sSJ9j067I6HNGIq62Mm3D1tDLxOBn52Ir8mow=;
        b=2VFqV21lujMV4NwlF1ljWi73bOYE0OOVyBxKxH2EdmuTZsbD35O4lDA4uXvGN6Jukr
         +R+OhlKG+RqocSoCRPN5PRbEu1lKsemQeSBTL++2kAxQuCtbSYz4IhY9shN0Ntg8FHlJ
         1O8b7lEEEQaswNicmj1LYI5URbOiMAznoTKxQZaz1y+9GtPPTbTGZQ3iVhDYsrQRm4me
         aEpJxvvrHuADPiNQ8fhIkXH7Q2JqHh5Hc9FhqNlBS5Rl1GgT5VrRu7mzGtfVT2PyYiyz
         AuJKSkhcCvuMo3tE82yPNzb7pQ573x8CJ9+1Hpf9ucruamTCN/YptcF7RlBIyCca9CmX
         xJDw==
X-Forwarded-Encrypted: i=1; AL+hErEStfzh768Hb/Pdzwh0lBqz+zlvNM92ILGIM1yb6KTs47lDx/pXJIh6qHvZlb9dRSJMpYdzso77YgRR@vger.kernel.org
X-Gm-Message-State: APuU4Z/rpe4GI1QFOV8locJtP6xEmnXVVNPGPjJWMCPVOKbp8+Lq9AhP
	YeNSTBbcv1LriBFCdLcy3hgaK6MUgmBdYORDgWwRhc9tTNTXyakMBwDZ+WffyVdr6rs=
X-Gm-Gg: AYBFou35Sn4+1PDE1iYDGl+EdvmZDg3vuNNvUf0Mo5aZGLweCY0VwPekjJDC7fFaW+S
	Hu/SyqFjH8HzHA+t0xOJ7oneZ98htRIjpKZAVQnRjN14QmsDOBkdKsp7Il4WOIui1euuUd/fzv3
	X6oUqT/0bS72nhP7ArwLY/r8IdQ4qS93T2LuxQ8xTA5/nAJ07yFT8LhcOMfQQsysOb1NVYMPtng
	S/5AYQYUx9K07lyyTjzefYYP+5YU/6iVvh3TRwo8CLNLE4SmgPXA118CU+wOd6xsHiTpWxOMnFC
	E2p1D2uNPXHLQrb16Dh+8oypa65UVl8leafzP0LMIlmJQEU5sDZilJ84MutXZhe9+4tZwspxKa1
	yNEyIvkPC+GbY0dqlt31xXoUP+QKoo3v8uQbMPQQUpjJAxxs/AowxSBZhGyGrvHIZvq8lmXB9uc
	sz4nxqeKpUnz8CKIuEHV2G4LVRmBukWEiTTVohHSkc5mazW0hvwkE+dD0RiICphJpHAoHh4UZC6
	TBugYzwMJCfpNycDvUTyypjZh0JyowwmM9S8vz10cqA5+YtVoi6EEcX9tgH5frXu5p3pMsPjiyt
	ioXBiIInWUwxNm5AydhjFGA1E5el0nqm5zqVSIuMYAYRQ+2kbIDC4hxhYGre3o44eF8P1pUFiUV
	lnsd9lC+LJT6OaOBEY0FVn2rp6GZ4iO1XJ51SddTGAabjwpRMr0pEpi24yC3X9PbaIYWcEZNDhR
	K5ImkgIuABConXJCL6XTZokAc=
X-Received: by 2002:a05:600c:4e87:b0:49f:e772:6ddf with SMTP id 5b1f17b1804b1-4ba0938ae31mr51209845e9.32.1794413791046;
        Wed, 11 Nov 2026 08:16:31 -0800 (PST)
Received: from threadripper-fedora-workstation (d-zg1-240.globalnet.hr. [213.149.36.254])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4c52fd01sm8374925e9.4.2026.11.11.08.16.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 08:16:29 -0800 (PST)
From: Robert Marko <robert.marko@sartura.hr>
To: linux@roeck-us.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	nicolas.ferre@microchip.com,
	claudiu.beznea@tuxon.dev,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH v3 1/4] dt-bindings: hwmon: fan-common: reject zero pulses per revolution
Date: Wed, 11 Nov 2026 17:12:45 +0100
Message-ID: <20261111161619.232141-1-robert.marko@sartura.hr>
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

A fan sensor cannot produce zero tachometer pulses per revolution.
Add a minimum of one to the shared fan schema so every user rejects
this invalid value.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
Changes in v3:
- New patch: require at least one pulse per revolution in fan-common.

 Documentation/devicetree/bindings/hwmon/fan-common.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/hwmon/fan-common.yaml b/Documentation/devicetree/bindings/hwmon/fan-common.yaml
index 0fb7380816994..63a369628a3a1 100644
--- a/Documentation/devicetree/bindings/hwmon/fan-common.yaml
+++ b/Documentation/devicetree/bindings/hwmon/fan-common.yaml
@@ -27,6 +27,7 @@ properties:
     description:
       The number of pulse from fan sensor per revolution.
     $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 1
     maximum: 4
 
   tach-div:
-- 
2.56.0

