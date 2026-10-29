Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793250372;
	b=kmYRuTScsHEo9wX50MDFQsKmbzCLi3OWYzTlktzV1+vucfnulouTBdd58VFi21S1ETWk
	 1VPwWe7ZU1+w3G3qtiTvGos1RT4N3v1EIZqY5ZgY56rsi2S1LH+MzIIf1H7ZQ6BNusuu9
	 V9+V7IRZWu5z7P11wk7xqw3Z+u9BcUFPtQe0sUv9SInsstxYZdt6b2s8/+jwOijR/zbDX
	 D5M2q6XMQ8GMNe951pAj7zNhCjTIQOAJ7pmhqszlb5EtBq7w7JYFe+D3nHJT91J2TiIyc
	 kPaW87VNoe3gyLWHnT38KXvVh+2K4PTqDsoetjf8KDpfCp2h9+c8xilIs3n4wvyvrmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793250372;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=JRnZbRztbK3uQmcjPiHrls6jXuhvcHYv7zJm0Q9BEjQ=;
	b=jMpKc2vpbChTPbgDHsNaLWVmnX6hwsaJ/Ex3q6DUABhow6ID0Osq4Acd0fx1w/Hy9Yxl
	 2jcejuddmwugEiXE+uUTD7uoONad0hT6vntnX6pKEQMUeI+fLIeQM29WC8Kqa0r/i82jY
	 lNIO90hkw1E+H7OlQLgrBlCoNgHatkxZWYsnWtllEr7JdNjrapWW5Fu10z8YSKC0B7xoR
	 uKIz+LAgp8MY+a4EiuFu7Lkd9OmonH+pm53QoJCRV5yZxipYjvUk85E8/FlXk3jcFlDwV
	 z7ubCQeAOD64z9ZwQjjWdKmApqj1UEEg8K16xsca69p3rOgaRsQa2jaAjPDyfDcafTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=G8fxqTXT;
	arc=none smtp.remote-ip=209.85.214.172
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D846606A31A
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 05:06:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D846606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=G8fxqTXT
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2e98798cbddso8069355ad.0
        for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 22:06:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793250371; x=1793855171; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JRnZbRztbK3uQmcjPiHrls6jXuhvcHYv7zJm0Q9BEjQ=;
        b=G8fxqTXTTNESyQXKDfIY5Xm8WthtTd3j5AumXbjcPreruRzIvJMDLop8TkQXZylU3o
         IlEvSfcyGjWpqG5HLBexfP/zaWk5YYU3eDReWFuHsG3VrgOxLwqzhNxYvrFdaiwvtCbt
         /arHNvx02yfHlnSJ1jjO/tDYf/1o3w6+RJ7pGCPCqu3JILVZ05QQ83cPE61xNQHWd5nC
         HFBB2Q17w4/zRv+jCWFodkiXb3OrHw8kVX9cxRCiYzEr3xxF9zkYljFcUt2R/Yjqq8dg
         M2CFYURtpKrc4PkoREBYRaO4xVAgS3cWp7BxSi2Uy9RCLdpmE0h3DIPREbo3dcklQkFQ
         V76A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793250371; x=1793855171;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JRnZbRztbK3uQmcjPiHrls6jXuhvcHYv7zJm0Q9BEjQ=;
        b=2xwOsilJ2yBsG6MqiI6+81VgYcsR8Sfdz2rA58uy1lO/O2KATjFRNGrbzWGdYkGoi6
         lhoGEechhvzxFAcx81e88KqXq/bUYMmQsoh0Yx9AvzDqJv2Gd9nV/B46z5y3dMT5ciM9
         iHdiHk/1vgYi7mRkNhYcegFFIHhULKlZ0U8gjRT01YcKT7Cliu4tHySLA3tWPXwQot84
         +2hSBxXEQP08zzLeqoz0kPNXGH8xfEb3hLagyRoCkn8rp93pElbJMUVmK9glRc4tG1td
         mIdpFbvz1oJCy2hNg4wshNTIzAkTK8c5pVVIOu1nITj3Z/Yf4LnKrC22RJk/GlKc1NAF
         JIZA==
X-Gm-Message-State: AFq9FYINyb188WXyeLlJ5lKjlvZLQHPqBxWwzslwgIjdau1/XUGhahZ3
	S3Ar9nmjtchDVKwpL9lRhx1gr6F9dimAfbGhW46Qwq2gG2CEOfkb7xKV
X-Gm-Gg: AYBFou08bKA0svR8azOPP7zT1Rr1hd+q7OrnfQubC7CGFRh0vxpfa89SFV+7RiQ+NBQ
	Xm2YnLjXZuZPynH8tfs3DD1N1UWy+cyGOurW2M4yN6y5Ifm5CklrsTk/qP6C0v5W0hfS9R8t8KG
	FiEA7KEazCy9FnZbN1vl9z+DZ1EzwV9UfmtAryElDdie2/WGe+cFP6M/DR9RyT/EjsL77pnY9HS
	dGMJo+IAMvTnaeW9kDBhVjciGV2WEpGTTFj3xoxD6q7IWBprTeH9ntrVBHkpsoCHxKXq5JSaG6+
	sy5gtDluo9YfQ5513ub/fMMKsi/knKkTsqMKQLKkSjwSOeEdkyntfFpifgwBbEnFkY2/Ftl1I+d
	SAyOX2yFXx8yRgflHFRyqdesl1Xu75NPTFWypxJltV9nPeVz6tWh2NSizeDrkzrJlOFOe+xkDk3
	i8aQ1md45tj5VAVyxM9mzHD60Cd8c/7+uzockPiUrv7W2Rz7JMxV8tq3o91NFliC+cSN+lBnit9
	nVpumFKn+R0H8h7wMXsRFfOZpcOuilaUYHOuLJ2SAVl2P+ZbpBUce45ZBF0E+NuSaT1YBk5EgrV
	9r2VlrGMMrKEflQD3TG7JU4nGdj2zg==
X-Received: by 2002:a17:902:c950:b0:2e9:61bf:6591 with SMTP id d9443c01a7336-2eb0058dfa6mr43576915ad.45.1793250371450;
        Wed, 28 Oct 2026 22:06:11 -0700 (PDT)
Received: from [127.0.1.1] ([169.211.140.146])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6c9d2cesm28159685ad.65.2026.10.28.22.06.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 22:06:10 -0700 (PDT)
From: Kwanghoon Son <asdfkwang@gmail.com>
Date: Thu, 29 Oct 2026 01:05:43 -0400
Subject: [PATCH RFC 02/12] dt-bindings: interrupt-controller: Add BL808
 PLIC
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
Message-Id: <20261029-rust-bl808-console-v1-2-b736ee920078@gmail.com>
References: <20261029-rust-bl808-console-v1-0-b736ee920078@gmail.com>
In-Reply-To: <20261029-rust-bl808-console-v1-0-b736ee920078@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
 Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
 Paul Walmsley <pjw@kernel.org>, Samuel Holland <samuel.holland@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Anup Patel <anup@brainfault.org>, Kwanghoon Son <asdfkwang@gmail.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, 
 linux-riscv@lists.infradead.org, linux-serial@vger.kernel.org
X-Mailer: b4 0.14.2

Describe the BL808 D0 PLIC as a T-HEAD C900 implementation. Its
interrupt specifier includes the source number and trigger type.

Signed-off-by: Kwanghoon Son <asdfkwang@gmail.com>
---
 .../devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml      | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
index cde4bb6918978b40037774269cee85212d39d4aa..9c625dff1968ae6267b0ab65ed8d4e771c70c3ec 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
@@ -72,6 +72,7 @@ properties:
       - items:
           - enum:
               - allwinner,sun20i-d1-plic
+              - bflb,bl808-plic
               - canaan,k230-plic
               - sophgo,cv1800b-plic
               - sophgo,cv1812h-plic

-- 
2.47.3

