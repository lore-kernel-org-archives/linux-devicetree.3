Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794184415;
	b=bRVfcJVwB0c7Bshri/TbqYVRlvOU79FU8xuX5XpdZXns1ICXRnREQf/D6UB4y07ry0Ww
	 WAGEwR/Nl0CnPcS7ryTJLLbqtBN0kFTkPO/i6RwrPhDOyGZ7G1PDncnzSjFF4K4bGng6G
	 lV/c28lzYPXEQsfuhQLYfleo+leK8WRLdZJUN3Yo6ZWHngJXF7B7updBqXxuOF5VKWE+m
	 jM3w0zgm7Ej2hJ6+zIq4WNygQ2ZYbDYnVB3dCNAY02DfjWgzCSLCDu5kEH/sb5D9lXBqF
	 WBJ6BR5kqRAbtOztCH7NUf6YlzL3ASl7OLTh3F0rkLCQU0CeJj++3bLVA7IbxO1BSIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794184415;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=x3Zvaf/6knxBP4r88bzQVxogNYmuURJ/Z9N4FNNEXXM=;
	b=nIAXzPSnjP/sKRhOUK3kEpUPRqf3hrqfzrdDvsNa4cCI0uQn+Kw6zhekkFPuWVR9EG5K
	 ZkdjQ6aI+RzZj6binPO4XeRv5N+fJdpakzAGJlTQ+qOSIsMLwEw1E7qMciv1ILWOwiSCS
	 wR/lHaswmL9HgI+nOaSNzcjM3bb50X4XLj88jlQggSrf0IYlsw/Nq8eV9OC6oULffV2wF
	 ZVMkl2eDqm/Q85gGiy1eKpzvvCYrD4Twy3/lAkv6qJMStaa5+760LhlL3XcUsaWA8/sOM
	 jdWi1EY4Oo7sFA1Jsuk+tkw0F5V0qqLOKw/8qGq+KQ3TtJ/lq4tGtKxmHGgvVZNUZGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="DVeB/ILu";
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BDD6606A33D
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 00:33:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6BDD6606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DVeB/ILu
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a5720b0a57so2206565e9.0
        for <devicetree@vger.kernel.org>; Sun, 08 Nov 2026 16:33:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794184414; x=1794789214; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x3Zvaf/6knxBP4r88bzQVxogNYmuURJ/Z9N4FNNEXXM=;
        b=DVeB/ILumBTLtGhAnK9SThmzeGROX65vDDXvaMLZaeOoYlcOfAZJzCyt6um5mYfHDv
         Y3VcmUpi6VTDyzOrubE+TKxzkEzeV7DSAlF0WPPNZOCE3moVlSnmkE+1qezIdsBohAmP
         a/93IAhud+Xk1IuhtXMMbD/9JTprYk8GiRs8RDQKDOz2ajUzeKy1jt8xEeKQ03ZHTNjl
         KWqIgDs77rGbxNx92twtTmLWRqapsVjV3jMP0O+gf6wVsaSd0oWYgtJXqPstZO6rnlkr
         fdQkYrgvqlA/v1Pb5mWvu8AR3xbxLkneLZ+FWfx+DKb2+C192KWMt4IWysE3CQA4Jrx3
         3R5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794184414; x=1794789214;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x3Zvaf/6knxBP4r88bzQVxogNYmuURJ/Z9N4FNNEXXM=;
        b=KJCkFduvbOhoQpLagPKsjxhkiwiFSKZ/ogO856OMVke1A+32O2jg9hHsS37/N52v98
         q7sY7uvcCGdBa66j5tzcZyNxK4Pkc1bYfHAmOsMoN6/IGIZ/Waq5bpRYucdk4iUoTnaM
         gOyFLAw9y0nrXrtX/Zn0U1s7E9YvOYb28a2EYKcFp1u1AXdz8emC50qPm4ce55muoHlc
         FdppENTWxAoJ+hWrUC9VQUBSPvR/qD/Mm3zo9jL3l+biAhNws2UB2qZkM9w9uyUCiTBm
         U9TN8Pv/xi+emjfp5W+b/aKaJJtbm876Z1fBqHP41uwMkm2JOArriEzlqO36fCwi3CSG
         C8eg==
X-Forwarded-Encrypted: i=1; AL+hErHUDT1ppuc/m0LpJttqpC6Gga67gdo/5qqzPdt65oJpvUVr67d5wpza7TrQej6LbBcAnlCEDnVCuoUQ@vger.kernel.org
X-Gm-Message-State: APuU4Z/isc1qajTNVOTmz2jIVh87DhEcoSDZYccvY984vI8w4kSmHvrW
	PsCYjvmjw2ZR0owfBKzJYDCNo6tjCP0QCjSAi0Ob8kvmKar7rXUgpdY5
X-Gm-Gg: AYBFou1y6p88HilfDhoHe0B9XuaMctJXJe2w/xSGOS2cg81fUtXbq7iJdJd5ngbE1or
	Kfrcw6ZB78sUXpFsosUz9XG0fxSlRvnxTj31ykvb+yBWhqku+k8b22dWmhuVjvlCsU2FQbmPNrM
	Vos2f1A6Kzojb2H+3epflUvVeTL7F6xA/E5jKcYW08kS7I1hvzE/b6XGO7EO3k3ah3cS0hQPupb
	9gph52vbivQPKvIBILhgyO8jrJ6B0Ed5gVMK/HHhBLrhlyU8vDtbzmLvkxcW6C2J8jPEyOluu+X
	AHj0nZF9OwB+F/kz3EhetRibvvotQnYb/ayVpAxGO3Mm+yD5DtoA3NW46wFnXcUwt3c/3ysctgV
	h3iM6C65Ik8TqLT6yTYCS6fJ9a2B7xSL9Q9iyirDWl0QvRTBh8z602Hs4CPnXXPMsKgEmnC/kZq
	BiNPe58AuQLhYgL+CSTrZtDGeBRA7vC0kF8BTyknkxZ1KIYuE3SQxZfI/pnNRFKPCM/SCCGXy9m
	qOnFLGLL/2ABtLq6P4XRC92E3YOm+bwWQEiZBOpZfuXQPNykRXgjELdJhF/GHQxrxsQsfodNPyX
	LYofbLk//QKfAqU/2Zd61jKEryOv+ui8jWgRLBXG
X-Received: by 2002:a05:600c:8506:b0:4a2:10f9:37db with SMTP id 5b1f17b1804b1-4b963c664fdmr50119595e9.7.1794184413846;
        Sun, 08 Nov 2026 16:33:33 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49592f39c8asm6541675f8f.7.2026.11.08.16.33.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 16:33:32 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Mon, 09 Nov 2026 00:33:14 +0000
Subject: [PATCH 02/17] dt-bindings: firmware: qcom,scm: Document Halliday
 SCM
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
Message-Id: <20261109-halliday-dts-v1-2-289114ab8197@gmail.com>
References: <20261109-halliday-dts-v1-0-289114ab8197@gmail.com>
In-Reply-To: <20261109-halliday-dts-v1-0-289114ab8197@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>, 
 Guru Das Srinagesh <linux@gurudas.dev>, Thomas Gleixner <tglx@kernel.org>, 
 Radu Rendec <radu@rendec.net>, Lee Jones <lee@kernel.org>, 
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
 "Joerg Roedel (AMD)" <joro@8bytes.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Wesley Cheng <wesley.cheng@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Bart Van Assche <bvanassche@acm.org>, 
 Bean Huo <beanhuo@micron.com>, Stanley Jhu <stanleyjhu@google.com>, 
 Herbert Xu <herbert@gondor.apana.org.au>, 
 "David S. Miller" <davem@davemloft.net>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, Amit Kucheria <amitk@kernel.org>, 
 Thara Gopinath <thara.gopinath@gmail.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Georgi Djakov <djakov@kernel.org>, 
 Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, mfd@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
 linux-usb@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-scsi@vger.kernel.org, linux-crypto@vger.kernel.org, 
 linux-pm@vger.kernel.org, Stanislav Aleksandrov <lightofmysoul@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794184395; l=1033;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=mntziyVI6wQ2kSkSteAmiaUttlX3LQ+YCHknAe0v+s4=;
 b=6KLs+gQMEgAdwwaI8XXKZHARhr4EIqJqXke9wpzWMnotth4jMEZlLGfBGwMvNoTpcE0tKCN8v
 aRJBBJI0d5iA+Opb629gN3RAQt1TeYIjZdEvW3ChlNmIbJyjVXak7Mn
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

Document the SCM on the Qualcomm Halliday SoC.

Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
 Documentation/devicetree/bindings/firmware/qcom,scm.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
index 40a267c54b00..fb3da66443ed 100644
--- a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
+++ b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
@@ -25,6 +25,7 @@ properties:
           - qcom,scm-apq8084
           - qcom,scm-eliza
           - qcom,scm-glymur
+          - qcom,scm-halliday
           - qcom,scm-hawi
           - qcom,scm-ipq4019
           - qcom,scm-ipq5018
@@ -225,6 +226,7 @@ allOf:
             contains:
               enum:
                 - qcom,scm-eliza
+                - qcom,scm-halliday
                 - qcom,scm-hawi
                 - qcom,scm-kaanapali
                 - qcom,scm-maili

-- 
2.55.0

