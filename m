Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792660760;
	b=gtJ01gz88bHFCpET047fxroIgy0huDAUQNlYTacDkWyKaOPd+pNE0eNXukLycn1vtF3G
	 bWTeNytVpXKSgBhIWTczBo4ch5fJe36SgWvNrgKCYFm432YgdHN5JbLdvMxN1oLOo8Jro
	 0QaqCQ3Airgn02z8e2tywirQwzFcwgmCIZrL9pPRoXpIPQEOQmZoxvOaf1v8nI7rkiFts
	 Kx/Yl8ADqN9hR7m/z7jIJ09fEn12/mN9o9DPk0ELqBJkypB5+j+VlBEkJJ1kHAfEGNAnC
	 1vuUIjOl1CwKx/nHXbzgA3dKMqMUt5UKfR9Jo2Zm03QC+PDsdau4oszxRpWpNEQ6wtw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792660760;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=XmLU67b9anSH351lrdK4RsIBICbIuOZ+JS/MULhXqf8=;
	b=Ut3dVmjhz9fyD9C7eQ0rkGoEPX3WTinQhnmkLSAOBNuWOoGyeJRqqXXu7hjJ8wYkzN+s
	 tjvJcyqjFyoFodVm5CtraOD3FykdUggWgpX3FQIzmjr/xhTHSMtEUDz55X6bg84oXEkFu
	 994NMTtZN6gshY1mI0ktZwUE4IERlE5onaFSSIZrxm3OQJtjuJjnRKmfBKCTRIfc4Qn44
	 MUGXHgTPfeFiQU4lW8Huqj1tlAdKc75JofgKP1yMVacCTVv9CMMVfJ9lktTqKZySY7weN
	 W4EGKpg0kjiHSFq3OYlWmmb4lvPeM+GKSV8JKkjbtuHhttpRqNjaD2vvbCMaAOnX0/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fairphone.com;
	spf=pass smtp.mailfrom=fairphone.com;
	dkim=pass header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=eerU79Dn;
	arc=none smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BF5C606A320
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 09:19:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3BF5C606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=eerU79Dn
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c43373ae89aso240455266b.3
        for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 02:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1792660759; x=1793265559; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XmLU67b9anSH351lrdK4RsIBICbIuOZ+JS/MULhXqf8=;
        b=eerU79DnBIXSgkNX9XH5RvEx6v2IJwgHnx6cLavomh9+/x0S0S/nzMd/T8E7dX5dGX
         bbtHQZvIpitzL0W2/wWvPZYaE1stMzV+29nM+scZxGiDqIbP5ct3kZMfLVmGdvgsDGAM
         qTXoO594N5NrexjsKhZU+5ozQ1D0AepRPEgqXRUE0d6jdwLDQjge3ObyOjSciuomQF18
         NLTywnjVXikcxzX/HLHwQNIfxSfEmelm2GR/sVxIWNlqOA+t18EL2+jjjEEblZ+i0g+V
         ec31CyLmK5pVAGSaUmSO0UeJTDfwc7hSoqr19PSe4vB87eSLN8ud7gV8Zm4TIBkK17r4
         imTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792660759; x=1793265559;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XmLU67b9anSH351lrdK4RsIBICbIuOZ+JS/MULhXqf8=;
        b=MBKk8h6UqyAwe7951VvCzGJXaRRp6q3y1mTFHkpz8/OgiPdIK1a7MjfHH9bs6F7r3T
         eQ/Gxye8ii67KMl1zAmHujv8tWPB/xr5NRggJrS/H0vBUlSO3G9buIHsaBqquxuNLekc
         0N7ztHIw3gJfgQrYgjHHMI6fC0N8A2ZhoTA1DmAZilf/UqGctPxxOn1WxZ+hpAtQD/ws
         Yq0yeqGNR4EUui6PYmofvIIB+OwaBbHKr6fTio2Bi+eNAYZ8t9a7TYMVOKDzSnM5hdmR
         E2RwvZAOAc0oHCZj0CQhuE/v5fo0zoMRReraLusipD0HrQApcIMVJsD4UA0vWAXI3B1E
         /tvw==
X-Forwarded-Encrypted: i=1; AKwUvBzdAat5Nmigvbi0/lI8gue1PTlgK6V7AI1fiiZzkNWJpM8y85zr31CwIx7O93KKMvm3WOJLLbSE+RxF@vger.kernel.org
X-Gm-Message-State: AFq9FYJbPIyW4W/j9W+j7tkaXu3XvWFw38OCRUVVW9sbvxzAbEZt8OqI
	FoHdcCXF7xNXWMRLuNikz80ElKOShUaZlVHtLcJRMqGq3X+elab4bhQgU0AwF31U9JQ=
X-Gm-Gg: AYBFou14h3Gw9ZnycmVL730MMa0leyzMFhiXgNvJVcKVLLcSTmi2zx2Xi6deZHl4vtY
	j5qEMs2tqSkEtahsiUD79FddEo9zYJ9UYa4UeBp1Yjg9l3o8L6vnZvQkavTicKO6t9dzPi1YeOL
	/NSjrsx1Rv42BjpXoYdUS6q3Xx9kOKC0QurmNDyK19YTqZ2rLba5V5afhS1/zmuMtsbdYGrR0Y7
	P5Q8XsLGQWulykQNj5VQ9HzNcdjMWQ3VmM1u/87xiCUhjlJGUM5DdaT2QoMXgwX+rc95ThZgHKQ
	WpNICtNSjMYnz6Lr0YPv06l3MxhIY86l4XrMylmg31mzb/HCekR6Mu8ZZcx126sbdz9AzSGdVIi
	U7440Ja8WMYpIWiUhro/p6BZopXg3g1CvWoG+C5OjvhLUrdUR4E8hKqISI/2NauxK3X3qv06uTr
	7ZQL5JaYgsjThRNfLH0N7/SgF7ga4bEfI1idou8QLNyCovkq5KpbEuLZmQNFcE54P4Vh/fOABRA
	FqYjebgqkl3wdHVXc1/Mt2uplJACp16Xk9R3ws8YITLA0d6K2evtwgPRwmFbY+bpiAjLTTW1/V7
	TFlSsai+cYiaW/TOeOW3mk87w3d6WI383+cqvqm5zW1YVJT9qk8A5NuscN3jWzW1hEwdBefrWGB
	iS4qWvJtfYtKkaKPqcvneRTtRUuMEPFxgZgAuSk66z1YOCWm0xKCP5abHpzFRZqf+dH+q
X-Received: by 2002:a17:907:9711:b0:c2e:6498:5bb7 with SMTP id a640c23a62f3a-c46796bb426mr444488566b.31.1792660758671;
        Thu, 22 Oct 2026 02:19:18 -0700 (PDT)
Received: from 2001-1c08-080f-fd00-57f9-c36c-aa93-fd36.cable.dynamic.v6.ziggo.nl (2001-1c08-080f-fd00-6fe5-b143-671a-f202.cable.dynamic.v6.ziggo.nl. [2001:1c08:80f:fd00:6fe5:b143:671a:f202])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c468a50aa01sm85790866b.22.2026.10.22.02.19.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 02:19:18 -0700 (PDT)
From: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
Date: Thu, 22 Oct 2026 11:19:15 +0200
Subject: [PATCH v3 1/4] dt-bindings: input: Add compatibility for Awinic
 AW8695
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
Message-Id: <20261022-aw8695_haptic_fp4_driver-v3-1-ac8c14377e82@fairphone.com>
References: <20261022-aw8695_haptic_fp4_driver-v3-0-ac8c14377e82@fairphone.com>
In-Reply-To: <20261022-aw8695_haptic_fp4_driver-v3-0-ac8c14377e82@fairphone.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Luca Weiss <luca.weiss@fairphone.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792660757; l=1075;
 i=griffin.kroah@fairphone.com; s=20250804; h=from:subject:message-id;
 bh=zMc7fnFtbUBSVjfmEWHaUyV/0ui2OWBr6T8F5VhNG4U=;
 b=VeVZAjOe4nh9A7LEj+L1Elp95Otpjsl/9uITlARbofk85O4zyU4uaNHE2dHFfXgq0BYw4byC4
 4vmCiqOGmW7D8nLkwe/t/3Aex4MoT4fYW6/E2SJVdNGCJp19WAcmA9T
X-Developer-Key: i=griffin.kroah@fairphone.com; a=ed25519;
 pk=drSBvqKFiR+xucmLWONHSq/wGrW+YvcVtBXFYnYzn8U=

Add the AW8695 haptic driver to the binding documentation for the
AW86927 and AW86938, as this binding needs the same properties.

They are not compatible though, because the chip identification works
differently compared to the 86927/86938

Signed-off-by: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
---
 Documentation/devicetree/bindings/input/awinic,aw86927.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/input/awinic,aw86927.yaml b/Documentation/devicetree/bindings/input/awinic,aw86927.yaml
index bd74b81488f61d72b675b5701b321b30b3430be0..58908ac4ca7964f63e392050aff5e15e836983f5 100644
--- a/Documentation/devicetree/bindings/input/awinic,aw86927.yaml
+++ b/Documentation/devicetree/bindings/input/awinic,aw86927.yaml
@@ -12,7 +12,9 @@ maintainers:
 properties:
   compatible:
     oneOf:
-      - const: awinic,aw86927
+      - enum:
+          - awinic,aw8695
+          - awinic,aw86927
       - items:
           - enum:
               - awinic,aw86938

-- 
2.43.0

