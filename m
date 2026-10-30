Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793342638;
	b=GZgRTwZL3ua8gg1KzayO0h79I79FliHWOJxpLIJiIPbvZCwBg660SfNWcuU0iIYj7BOT
	 leC33ffeFDUWk4kzukEt4vI6mbQsI9eEfdQYs0GeqHUo/mDXcu8WRlKia/IZdjDO6beYK
	 xrmKt4BiPKBrWoL4wRcOTThHPEkJ/NUdXZqGhbsbTndZGv6Ie/coF6aknwQZs2NopDxyP
	 ExnTq4Q6p8o8ijl6ahZsHqFuyAHZlj4vY8qr0LlBUbkfBkI6mzmOpdn/EjaFHoVrDsSpl
	 zMyv4DIJ2AGXOesM7R+HAOTe36kehrOULfO4DWDDj9sPzjJ2kDKjFd7Rnbm64GeiJeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793342638;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=J3XSfexUEQIihbbvfLU/6+xIU/w28QhcpSoaKqiT8+M=;
	b=1KDufI3lvR4ooUfqR2u+VuEmvZeXj9qjaZ5Gw0YCsW6lKKel5tnhzNLxDhh8GCamfUEp
	 h3YGeptJlGb9rfAwPa13H9d5OgQRM1pwNvMkfC2KOR3S8YW/QYmiGtPpclpwMMO87ISio
	 2PC2InYQnsZq/umxR+PQX3CQ8cQ5uAJAdXUshi3VfwumRmBnXZZMT31qwKNm7qxbfhnsY
	 OLJbVmiz4Xu4fZJdO6ZQAeEoRbCcESiF3WADfHMMCDa55sTTB8uZcAOW6pY7+gg8PuJpa
	 6GGk6McwcSoMaOx86aKMphNLDBDPPanKEAfpdVzHcpqstoPyPbm9D7xhYMYcbaqBqUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JeeryRjE;
	arc=none smtp.remote-ip=74.125.82.43
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F84A606A31A
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 06:43:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F84A606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JeeryRjE
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-188406bb948so318451c88.1
        for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 23:43:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793342637; x=1793947437; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J3XSfexUEQIihbbvfLU/6+xIU/w28QhcpSoaKqiT8+M=;
        b=JeeryRjE/f5SWAdspU+P2cXzq6VlrJ9uZbNsl2Z3bMp9eugk4YUx3A6vk2Ih7llCbZ
         xnOSmidWOPWclMfpnOU/zstPnq2onY9z/0sqQxrwW6C42jgnlocQbLsI6o65snWFWdcc
         K7WkOdn+fQehSCJ0gfAcOTjVEU8fW4vLw/0gOzbJWqWeRHsRgdYsLIbUSq9VWDaC2bs+
         Cvq8Dmkky5Gmdiajsk6xf+cFiPTrIIE28wLdGxyGf8U1pWk49R4w1sbUVPTim72G9IvB
         BE91pPFk3TV1QPjLIwkmcSzR6L9/mYYfTOx7RBhFNdG+J5Lk0I/ht3yV7QtfZebwvFd+
         zg1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793342637; x=1793947437;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=J3XSfexUEQIihbbvfLU/6+xIU/w28QhcpSoaKqiT8+M=;
        b=TC+escQNhtMHaJY6oqjwKY88kmHmJwnUyk7uQGzUEEXzVVLxXWBNRZ+VlR1m+XI1lT
         T7zh4714ylqR6qpxTVv/oXJtJf405lb9becw4064IaIfcj/Nah2U7BDi/13Scq8b11bo
         gCnRjSeUhpW5/GpWy3Od2gBc23Lsa3+JLqxIU8DLGbyIZLRVS50QpbUO7+L/weIFJ+23
         0ESSSU48adV6DjgQfxspg+Nsr7AAikzUsZR6P1eUAxrlRNKzBIpawnLmaDNr3GMlQ4WL
         sje08797puXiMBs2w2YdWLEzVYV5/jaSfAMdTWOP45HIqbg+ZnEzM2EIr996NAxErK+L
         njCA==
X-Gm-Message-State: AFq9FYLU4nSlOCYOLCiFmuO50LGg+eybUKmww99A0bHwKQfJhXIas6ZY
	9ZYbylTOwG2FQknPb6L8RI9Kz4qiHxjkVBCJMyJsDPgol8tEtPjIwT4uGUKTOnnKqJc=
X-Gm-Gg: AYBFou24YTTX3mziRUJiYJ/Asq+jFMUdPW2wIHPz5ESyRM1oQ5ShRXk7RHM70Fu35AC
	Y9cGyFZ65cq6jd5g/RpiOv0llW/sI5jjgU048IWaxzJ/qYoTDK5/lkHiNU+qfoP77mzEmrulONR
	dUPiI9VSAhliEGzZBPXjk11YGJH/HKN4zM9cbgpwZVcAcNSA/LahepWZqehUP6pd7vCNRUwRokF
	qTieuZvAl8f/0mEvvhG+sIjZINcST3NQJNT8Exu1SkW3OcbtXvk6T20ffw/3I+9p06iXqVmfhnD
	NZ0J+i8XGo/5FzE2BjzfARQaJy9GT8HhXcKY65jFYY7zQXrWM6ORZLQ2f3DxQMxB8lPCcophRzD
	o8RVB8hFH+zqWx+nwcSJedhHY5txYyk5sjbAgyBkPahjIV4Xt4fsIbyHlfmShXVlGgdSqW5lQab
	rFLNGQgwgLBQKsMT4qtVdHg0/wYfbWlf32A3TJOuiE6cYswVIaHPhqzWz58184WLdyO7bKEvZs9
	i6qQ9n6PmzSMLwhbd3wFBX1HxTRAmdIN3+ooEibRNGNAFfH2YXRYEmL2nFVsko4h91GzrAPGbj6
	ZyABcNCOzX6pdlj24U7tjAHTQ1QSRHr89ul3
X-Received: by 2002:a05:7022:b047:20b0:16d:dd5c:4261 with SMTP id a92af1059eb24-1ac5e6f4e87mr2052934c88.46.1793342637307;
        Thu, 29 Oct 2026 23:43:57 -0700 (PDT)
Received: from ada.lan (cwgw.codeweavers.com. [4.36.164.2])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1b38ac58sm4173902c88.23.2026.10.29.23.43.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 23:43:55 -0700 (PDT)
From: Kaipeng Zeng <kaipeng94@gmail.com>
To: devicetree@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	abelvesa@kernel.org,
	konradybcio@kernel.org,
	andersson@kernel.org,
	Kaipeng Zeng <kaipeng94@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v6 1/3] dt-bindings: arm: qcom: Add Acer Swift Go Pro AI (SFA14-11)
Date: Fri, 30 Oct 2026 14:41:47 +0800
Message-ID: <20261030064149.14736-2-kaipeng94@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261030064149.14736-1-kaipeng94@gmail.com>
References: <20261030064149.14736-1-kaipeng94@gmail.com>
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

Add Acer Swift Go Pro AI (SFA14-11), a laptop based on the Snapdragon X
Elite (X1E78100) SoC.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Kaipeng Zeng <kaipeng94@gmail.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 121ca557ce1e..027207758cab 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1240,6 +1240,7 @@ properties:
 
       - items:
           - enum:
+              - acer,swift-go-sfa14-11
               - medion,sprchrgd14s1
               - tuxedo,elite14gen1
           - const: qcom,x1e78100
-- 
2.53.0

