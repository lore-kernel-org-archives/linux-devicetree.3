Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F25E3E5EE2
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 10:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778668389; cv=none; b=t1RXFk8T88tJBQ5eHvE3RI8qL19ymKEdSwA90aug6cypsFmHTd/NjZjO8N5wo99Io+EJRd3hR0M/7/K4IOQGMcebIU8/pmoaBlUcXY3siwlBWJAOQvbT+5r0OoK7LaS6PWgSlg6MjqHrneM/Pk4522wd+7y670wcxHkELXTU4Sc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778668389; c=relaxed/simple;
	bh=vfdsOfPIN4ax8m0jl3BhSnngPUkt47sIt8pYap0c9gs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YAIsBGmU8dyKHaLUyf9/7lJGrzDbgh3kk2UzopXBqMKROdikTS/2Vkw+6qKjb/6+suSSlm7UbRICbqgHDKQhuKR7FLKfTG0ne44G+Sx2P5nGRdE/8KEm2VEdh7oeUKabcdRnJDjDq7BOafRfsw/PXO18p1BMVABYizgzLWmMESA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=kUEO7Z+J; arc=none smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="kUEO7Z+J"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-2f0d3e07e30so15751297eec.0
        for <devicetree@vger.kernel.org>; Wed, 13 May 2026 03:33:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1778668387; x=1779273187; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QnjBg15osgUc/DHul0dxc7zos8A55rHk0TXyJ9kh9iM=;
        b=kUEO7Z+Jq8hztWtEbLAJk9lRm23JrJp5OX6ZWFhS6152yLE9jExeGt3vx5/LvdeJI4
         0rNLaXTXIytrsa0Zq0qe/vWGNlrUMFayuf2buOoHpGKbPBBMr7MlVXsSLMI1I+6gQy4V
         AT90wrl9mlyKC8NMUV3bnmvh7kTKhiXqHMJtC5yOkGZ8HkKmyMwqusxzzV6hoTcCYJye
         nQvkdr5RRzG3CC0R7IJdj9yBEJ86YP4zqETkN+rira9LnwGexxM6ZY/BgFsamoPfNpKV
         j2my87AA/xPue/t+2FgFWJe3jLSbyM7qvyZT/C8M9KD81Jsp/s38WHWVPATQNjmOs7eo
         tHMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778668387; x=1779273187;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QnjBg15osgUc/DHul0dxc7zos8A55rHk0TXyJ9kh9iM=;
        b=iyK977xrG7JcmWaLYuqGtiDxGoVgqDa265EFhOLI3Wqkt9RzdTPYq2v5YFhNRo8fhP
         FyhpB1awRJAjmz3bIp1BR8BUhW8omBRXapL2uUBmSUB89TpZyF/Yz70Y3Wb1uuPBPyKz
         HBQ8u/hgUeVAe2RomTdh0tgySAwneIFWXppgCnGbGHlXijgxM6GRWKjxY0+fk/lvTiGP
         uOv3Suvvkn32mVIgCjQvHSaYdi7vYDsFdd2zsXy8eLELHtUZ6IyR6Tr7YN3x7DUvUwFu
         uj9G3JQHBmH6yTy141TvM+QjGYeZc5Iy2PGHwdM68DfN9cz/Cran2QAJXZlBK2zgP51L
         jz7w==
X-Forwarded-Encrypted: i=1; AFNElJ9kn+3DHTNBfvNswGPm/tmvwzAUsmY/Gt81d42ixxsP4shbeldCYTAbSatxC/sHcycKGdBjToKZHl9D@vger.kernel.org
X-Gm-Message-State: AOJu0YyFAnKmFnOFJW19jaZTXr3rLaimEzl+zmr34irskZODKFm6iPp5
	kTvWxICHs/mJ/lsO+Paktal0Wn8jWadf1O40TnI+B7U7ophHZS7AgUNDt7P/I8NZKdn5a8F51OM
	xkRcklmE=
X-Gm-Gg: Acq92OGrL8m/wg1DdIl2mtDoPSK9dqqbgbEvcOD/qOn0KhKJ0Ns20RaOpbsvkMAJ310
	Q0RlTuoVME5KIJWOUOSHRoUXbmwoOvkPeaQIoXPwkbm47BCPRpvasoCekt82zaeRxmhmGCM9q4X
	CQaEuoTkJNFOvcynrcUG64X/z5f9fEfaQMFlRlzqO6lSyDDnfka9rgSNUwZ8lXDkRxLsv4QzeaP
	jVlbqS4ueah+6Bt44KiEXrScK6myqlENOUl5lQzf7CmGxnUYagFK6oYkubj4KWFujH2YzOg17ha
	9Cxk8+a2IM54OKtjG4ei0xG4p5F3vnZMm0+ZR5ASg1yoFLonHQwFFkW9nbjFhHdSR6pkqokQXkR
	TpaPFP7oz9saxms5bWnsiDOeld/IuDFXYatwLriQbjfoDK1WQfDgs59Woc0RxprgrYRJSB+qdWG
	yp+j9jsSz4yMdjO5nmO3n/cra9uA==
X-Received: by 2002:a05:7301:fa12:b0:2df:7fe3:96a with SMTP id 5a478bee46e88-3011437364emr1677558eec.0.1778668386748;
        Wed, 13 May 2026 03:33:06 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f8859eb4b7sm22241537eec.2.2026.05.13.03.33.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 03:33:06 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Wed, 13 May 2026 03:33:02 -0700
Subject: [PATCH v3 1/2] dt-bindings: trivial-devices: Add Murata D1U74T PSU
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-d1u74t-v3-1-27bcd6852c45@nexthop.ai>
References: <20260513-d1u74t-v3-0-27bcd6852c45@nexthop.ai>
In-Reply-To: <20260513-d1u74t-v3-0-27bcd6852c45@nexthop.ai>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778668384; l=1143;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=vfdsOfPIN4ax8m0jl3BhSnngPUkt47sIt8pYap0c9gs=;
 b=+S/96fF6/hw7s0Q8z+DL3GbY3dWK/AGQfOs2c5dghXBXpAD+ISzrPSVaAhP/xl1LfUpu1Opzh
 7HClF16zAk0DIZ1luaJDYDh3PuWrJYH6f8/nvZRlzOBJa9wCUYcd1Gj
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=omTm9cCAbO0ZhS32aKfJDKue0W3sQGpG9ub5eYHif8I=

The Murata D1U74T-W is a PMBus-compliant AC/DC power supply unit. The
binding only declares the compatible string and i2c reg, with no
additional properties (no regulators, no supplies), so add it to
trivial-devices.yaml rather than carrying a standalone binding file.

Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
 Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index 23fd4513933a..19c8c7220858 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -352,6 +352,8 @@ properties:
           - mps,mp9941
             # Monolithic Power Systems Inc. digital step-down converter mp9945
           - mps,mp9945
+            # Murata D1U74T-W power supply unit
+          - murata,d1u74t
             # Temperature sensor with integrated fan control
           - national,lm63
             # Temperature sensor with integrated fan control

-- 
2.53.0

