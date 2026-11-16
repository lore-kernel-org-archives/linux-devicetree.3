Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794864302;
	b=MHBq4ZRp/NlCeJjf9uw3KcgCvDwzhg6xHNwSBf4MzaXwtfqnbbfH8RrCIkFmr9h96qYx
	 BSZnVKwD4EhtBGIUGo6mPnUebve5u3A8HWnqhp7GmfLE0fXpCjqhudkzcGKjODDXhJ0Y8
	 2CoSD6pD9wl0jDbhpI03xc4fLFQREPySC2wZYgUYyQTKKhKMZSJKv84G5FOzBilJ8QtCZ
	 GMJQn54HyZwzkTzSppt+wt5zmvTYXocVgdpl8tv7I5Xb2ySUGmJy5c073L0+7oqlA930L
	 5qKuuVLPkPQUAyXrf9dFGNBgS2ExDok+v5GZxaZ0WmrI2wkc9482syl4wjg8aE91HRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794864302;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=S29Bz2Ne+XPBujKOM8xk1WUI0xBpcjEJIagUum0EBnE=;
	b=i0CQyNezD7iDSGMVhXUC3CbNsQ0UJo6N1sQYFrP+h3EMfbJ5I5TfmQ1rjUaglXfsTrnH
	 v5Xo6iO59bz3NWexL043qez1UzKI+Rtg8nPwCFaRXk7zforAPKJEd8MF8qv++8H018eIg
	 NF7pKueU1/3fYeTAGPzmvvgbEgFnHkKIGk+C6j7AUlL2hRyhy/VdhpqRvRGsznDQ56xs3
	 1H5pn7fotCfnvYhbwTKg5offuKQ9zL8jxlj8EVR8PlffvIGgYl1Hz31WjKpMiOsbm84Bs
	 uMVo34ifJXL4/heDB12NQpiK2RP1RJba0rTe+F+kBWbMFz9sJavaLCIOtTttAsYJ6ag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="0aKjn/XL";
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D5DB606A335
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 21:25:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D5DB606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0aKjn/XL
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4bb5b8ef642so25155665e9.1
        for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 13:25:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794864301; x=1795469101; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S29Bz2Ne+XPBujKOM8xk1WUI0xBpcjEJIagUum0EBnE=;
        b=0aKjn/XLzFlq+ouSLmTYWiErYU4NZycee0SYeWHS9aLIe0k27WBTRX6PuWRoYn4h/w
         osp9TkJMyV4e5+eYgwb/9Uc/gLhNZxiGr/cttH5JB23s5talTINxpiOqouDaU3q7DwXB
         mwpU6hyeU/LjWu661kwdEwa8YWFnc3lth2ve0Sqe0d48lh+EH/wFJLkFUox+m6kZw0dS
         J92PxdfemEiGhqmuVA2SNm3IqPkf9BqTxF/YNUaHrDdDhx/nSjKqb0Hx0eq6ATmkC5Rf
         fjAx65WnzMYxrFtCFvtUBlwnbLTSo3jUeZRGoWgkIs6XsEOOy781KWog3D0urTndgUMR
         VDsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794864301; x=1795469101;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S29Bz2Ne+XPBujKOM8xk1WUI0xBpcjEJIagUum0EBnE=;
        b=nIerQG2J+XoRahAL+iWJrTGFOOckGFREctxcvmgN6OIXAjK8QHAWSjz8E+smD0qC6g
         C+CGMLI/waSKgFqQp8XEEOxQo08UnH87AJ4BVrIMhMhr0+Mjz60lBWnt9U6J3ApGJ27P
         YU+fMEm5CYUGzi+leobqz1z8jj4FUm2+rs6PmK6Yk41ArnIexXFcr3jliK6BR/bsF8yM
         HyYpasWX/lKDAATeYVCttgCYYMrl3YRgGNvmobijXZj7gJde9BZCWDb0Rzq7b11DnMgX
         m0pu/DraEe7OhxP3bFpxL3CZzYl77mf3MFxM3BmdF2Yn7/HTYpyHSq/wbGX/enhvKa/M
         G2GQ==
X-Forwarded-Encrypted: i=1; AL+hErEDCPo+R200CHSaE1Tu26MXZCiBoy9kIGrWO/pnNpHiWORS9b57hn5DMZx65u8JWvXmEephJeNqmqHc@vger.kernel.org
X-Gm-Message-State: APuU4Z9udL9jbPGg/w7xytkoBeLVCReQsl3+BsUbIIzWgQjTJ+9MwG2b
	cztu/qS6dH2tMsjd0jGLh0rin0oIOHGGw4zS8I0Mn4OKWQttd7Lb8skrmbB1zloVVgPxrA==
X-Gm-Gg: AYBFou1xeV7EUSeSEmElT67A+rHjpBzf8rM0uHe7i4/RgeExkrRwGwSqWpPG7BnsHGI
	Z62gSuDNamQJJgSNWmAsyWTd+6MNtE+ihxa7ZrVpRRDTpNtFtoZQc5EIHLLroHqbzXSUGoo3Sgw
	eS+l+Omq+k1I31a1t9LhzgJ2yR8P8aplZh08RTH2TVaqVPgCqoqPCLnwe59HkEVnJRZZp+YAMYY
	UMe2S4aRSuKnHkFy4mAJmY2S+mdoS7iVuALzqp9B/Q/wwfCdm7gHUu60lf8kRkUNwHxEOTGoEIH
	pJ9rZKhC5rO2xlKGT5925CrqdN//5/sMjB6arj6n7LEgFqaUVTxL50FAtUlYRn+FJZDQg65cgk/
	00VCxZRk2a7T4B/NHRGr6IrH83tc6dHAmETP/qx8iOM5B4xcK2azViBlsroTgMPGpdGjL5IQK3I
	vJeVjB3lqikcOKpTNtZK/X95BiJOD1KhJ0MMTJEc6luBmAPIN4ygByMRnmxlhnRBhQt37jGBpDd
	l8R2Gx/A0A5784ywVLaB6TT0fTtXBLylW4H8UQs8bVehU5c9rfuq9mbrQlWjHKYa8cRykPZVxMU
	k/3S2W+HtR0M0XWCAlK6+BbxAouKj+gT+EL0m11s
X-Received: by 2002:a05:600c:4e13:b0:4ba:38a9:85e3 with SMTP id 5b1f17b1804b1-4bb55a47fabmr248067435e9.12.1794864301100;
        Mon, 16 Nov 2026 13:25:01 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb734b9f44sm61928305e9.1.2026.11.16.13.24.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 13:25:00 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Mon, 16 Nov 2026 21:24:51 +0000
Subject: [PATCH v2 2/3] dt-bindings: interconnect: OSM L3: Add Halliday
 EPSS L3 compatible
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
Message-Id: <20261116-halliday-icc-v2-2-6df8fc0e0620@gmail.com>
References: <20261116-halliday-icc-v2-0-6df8fc0e0620@gmail.com>
In-Reply-To: <20261116-halliday-icc-v2-0-6df8fc0e0620@gmail.com>
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Stanislav Aleksandrov <lightofmysoul@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794864293; l=917;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=wd90pl7MHpq8clj67rbDiWzxPjA0DsOg6ijADlg5gec=;
 b=pz/bm+cpBSVda5rEAkb9kL+2qT3hhvKvQmxholpBFeOsC/Cid0Qv8sM1w+T+AtXgxc4c8y4H6
 3jNx4bfGNe4DUgR0PLStj8HXNjGipU5Am3ti1DyClnFNFIdI5YKWoXd
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

Document the EPSS L3 interconnect on the Qualcomm Halliday SoC.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
 Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml b/Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml
index cd6685683bab..6c3475005a35 100644
--- a/Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml
+++ b/Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml
@@ -31,6 +31,7 @@ properties:
       - items:
           - enum:
               - qcom,eliza-epss-l3
+              - qcom,halliday-epss-l3
               - qcom,milos-epss-l3
               - qcom,sa8775p-epss-l3
               - qcom,sc7280-epss-l3

-- 
2.55.0

