Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BDBC3FE648
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 14:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779114546; cv=none; b=dl/yrU8hMseTYFJwXIZ5RF3AUxaqz2IIh57+/YXojIn9Ag6W0GPiC/BnpfdimJtZMGZuFZZq90yFcmz/Kz+KLdgu5DPTi8QyZmyX69Bbce63jUOW1UDyGS/MNQfEHsmeFms+LvpzSrQ+OqzoE4yAptJH2hgx33SF4kjSr1TpwJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779114546; c=relaxed/simple;
	bh=jZS0cfoCx0fWKIraDqZnTPmyRkWvp91bnw4H+4AY/W4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d1Okk+1F4FRayqEIr2vGnAQYL0sO51/GnGhjFGdE0dsdyenVueSry/9fOhUJpwvsi0j3+p5tVGlDeuAirOocNrrvxRtgl9FWQI7jb+nWb0924oWJ39kn3/ZpY+nzg4cZFsu2KXiZnyr8r9WbLu2kSprC5TRpvDFWwKeayK3rfZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sgzTHPlF; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sgzTHPlF"
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-7cb343d343fso16943627b3.2
        for <devicetree@vger.kernel.org>; Mon, 18 May 2026 07:29:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779114544; x=1779719344; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=InSESvH6SbYX4PPIUX4JXAvnZujlKzjBMLYv/0HgeqA=;
        b=sgzTHPlF6xeBrYUZ4oFlgbUDzPsHmVY8wZSfnEjI2L8TBcLBMlCUYvN24+/bnI9YC3
         dZM62AatoZjZ8nJqqBZ1mB6+8gxR7Fh3DrYcFfpg9ilXk/EBIMS1+Uamvj81nJoxkE7X
         lEJpbcJmcFXn5bzKXfMkGfwu2DFiLgEJWBuEkl2+R8o/vD9PgtVXdqgVkNwtlUhJSa7p
         d/UX/7rxE/uqEDD3wyQlEgvSF4w8g52LepAW61pvrcarXI5sIhGBWWppFTb/K3N/3Rwd
         wS8v015TrosoklOd3r47BBswIKFEM+Oel3cjAqaAlsgFmUPNIOT6RQjL9yFHB6sVbQov
         ipMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779114544; x=1779719344;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=InSESvH6SbYX4PPIUX4JXAvnZujlKzjBMLYv/0HgeqA=;
        b=EkUhTHdbafkjd742cOrKa3+hRFvIysiBSPOKCbtf/ghNA3yfmWUVE6kRb+DK3kl3EH
         04diSTDQjjZ0rjcNZ90JijBU/OJ+eWJi1gTXaHCxII4/Va3qKna3YntWy1bDLTIg5xsd
         8evUGz+r2kJ/OF2DpW50RU9xEOllLAZa7bX/uTL3tydZVWoT5hfpjh+hKpkboXuggJxv
         KE0fS6Xd6a1I9s5KOC+FhWb2PY2or7pgyOLxal9sMRfHAHa3OLP5nEdm8mEFrGTU8y7r
         TkdmTPWDWAifgFdahCTXonndHs/mLJ06p119R2rWrbjP1CryZUEQOaGfEpOKhEK2dmHc
         CwVg==
X-Forwarded-Encrypted: i=1; AFNElJ+iKl18dqM2ZxLPIqxud3WBvSmJ7oUcRsGkUaHg6+cQrTi5C2eNDRjED5kDqcBo8EHsiNqNUWDSzN0F@vger.kernel.org
X-Gm-Message-State: AOJu0YzW58XC80EliFYhcDBsaepmKhC6L4IVqaqyLzQt8eLCJH84MY2z
	oVDVbO6/pko/f7/0R1fiydiIhqkByFtuBZFkJVtVqUrK0d0HVNWPPyfR
X-Gm-Gg: Acq92OE+bvOtIrBJZg16ELH40z//RKzhM2VpdycU3sK1dgECqCTSSUudsgg3LIELIUf
	NPgFqx+C7IuWUN69xBnOLHTmK260T/2uKV/LgtEArf23rEXlD/y84yTMAJKRQqHoTdcDW9lsPhO
	8+d9QxES7WUpgaZ+vXJ1jVAAhk5HoL0l+EgYLg6yXuY/3zxS0cI8ghboGW1zuKwtl7boqzgkuJI
	zOCxfNsYz8bkZM1aTBGyFLFqNwEEy2OSwGySlVUrDxYZ51l/L0SWqw/CmtEgSiIZPOvds3jVe13
	PM0qp9EkDkuW/ZJ50yvcAUSJo9IEUElosL9OQIffa5cliWQmmTX0mLBMMyOoREOlKEQLV/cDrJz
	zU4vA73SqCo3gYK66KndgUflQ+K428LdCcam6L00dtvUSiGQMlugvvzo2VXPImmnDhK1ZLND09W
	AP5FwHV7Pu6mIgm3nM9P6OEakW7TM+O0U1SBh2OY7ZZw==
X-Received: by 2002:a05:690c:e566:b0:79f:7972:f89a with SMTP id 00721157ae682-7c95bd1b4b8mr135891887b3.28.1779114544188;
        Mon, 18 May 2026 07:29:04 -0700 (PDT)
Received: from fsh.attlocal.net ([2600:1702:56e9:4b40:ed8c:6b8b:1fa3:d14b])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7cc997cb156sm22094067b3.18.2026.05.18.07.29.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 07:29:03 -0700 (PDT)
From: Akash Sukhavasi <akash.sukhavasi@gmail.com>
To: krzk+dt@kernel.org
Cc: robh@kernel.org,
	conor+dt@kernel.org,
	gregkh@linuxfoundation.org,
	gene_chen@richtek.com,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] dt-bindings: usb: richtek,rt1711h: add missing 'port' property
Date: Mon, 18 May 2026 09:29:01 -0500
Message-ID: <20260518142901.1747-3-akash.sukhavasi@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260518142901.1747-1-akash.sukhavasi@gmail.com>
References: <20260518142901.1747-1-akash.sukhavasi@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The schema declares 'additionalProperties: false' but omits the
top-level 'port' property, which hi3660-hikey960.dts uses to
describe the role-switch graph endpoint. This causes dtbs_check
to emit:

  hi3660-hikey960.dtb: rt1711h@4e (richtek,rt1711h): 'port' does
  not match any of the regexes: '^pinctrl-[0-9]+$'

Add the missing property using /schemas/graph.yaml#/properties/port,
following the pattern used by realtek,rts5411.yaml and other USB
controller bindings.

Update the example accordingly.

Signed-off-by: Akash Sukhavasi <akash.sukhavasi@gmail.com>
---
 .../devicetree/bindings/usb/richtek,rt1711h.yaml    | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/richtek,rt1711h.yaml b/Documentation/devicetree/bindings/usb/richtek,rt1711h.yaml
index 7ded36384..fd7f29179 100644
--- a/Documentation/devicetree/bindings/usb/richtek,rt1711h.yaml
+++ b/Documentation/devicetree/bindings/usb/richtek,rt1711h.yaml
@@ -52,6 +52,13 @@ properties:
     description:
       Properties for usb c connector.
 
+  port:
+    $ref: /schemas/graph.yaml#/properties/port
+    description:
+      OF graph port describing the connection to the USB role switch
+      consumer (e.g., a dwc3 controller with usb-role-switch), used to
+      convey type-C data-role changes signaled by the TCPC.
+
 additionalProperties: false
 
 required:
@@ -107,6 +114,12 @@ examples:
               };
             };
           };
+
+          port {
+            endpoint {
+              remote-endpoint = <&usb_role_switch>;
+            };
+          };
         };
       };
     };
-- 
2.54.0

