Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795760197;
	b=4d4Z0BuSx6r3ne52mjCYkN9fGq79CM587Qz7cjjACd7rCmAY/BR5i/94z3EFedoyPZTG
	 diDspg93o4+bBY6hGVxJuQEw+UDq6bK/N42KQ1UuNa+R2SwXLnwdJTvVAU0X7gIyg1BOO
	 z+gLtA+Eb4xvc1p+djzvaE2RpRPB3wfFcMza+8gkFZlnG1fmf7njZbbT/pehU/dNXtgSX
	 tHQGMoCnaDAxVLA4SjvgQlbfSUrKjhrupSys5y4bEnLNTcW/xiKtOTchd92tTra670+Bh
	 n/IpmxcIRcd7l4qjQUvs2mEjhUsNF9bFvp4SmNExpC6JbY0WNHUZetq8CkSF9MGDPig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795760197;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=vLHgRT1LlkWk+F2j4iJrU5ZKCvCqM5eYbMqHziS2VJ4=;
	b=0ThwHzVEMI7K2wAr+klneK12rNJx4xCSOEotGJVZFN12sfkj3VducUZmGht/j1/TGl9G
	 OU1mdN4vz1UlyFPiU+nAmbze0Q1jaC3sE0u1l7siP4ArK8AVF9M0hD2bEXvpHPSpiixRp
	 C1jCw+T7kV2+22Ovf6wVH28yIw69v6ZrYjtMJyw3ZQBJwk0tYjGek9NXfYxpNhfHeRQFO
	 gldNBdbK+UCVkznfrm5rr+SCwLzEhOkjspywqJf5WsQ4TbCKcGrPDN8Tis/oRmTMTPcE/
	 NvkrxWuuZHelBHPM0ksffBHUdFQU5jwh/2jC1QCim9gNZ12XWmVwFqc/ZAfMHZNU8xA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=jms.id.au;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EqAcpQWK;
	arc=none smtp.remote-ip=209.85.214.170
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31752606A31E
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 06:16:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 31752606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EqAcpQWK
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2efe591a1f6so25607615ad.2
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 22:16:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795760196; x=1796364996; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vLHgRT1LlkWk+F2j4iJrU5ZKCvCqM5eYbMqHziS2VJ4=;
        b=EqAcpQWKD0qaA2JyrwL1cily/quFG0N5LbxS8zQjnTUtfjIsBX1vhe9bFbfEoj1nG0
         GJMy1xIAMLqi1jrQ8Hz1VPv3eEJ8b/nagkg5AhrBTCG6r2FcjKD7/mcDCvIk9EQ0d93A
         0fyM60e9ZM1LQkDa2/sGjmUzFujDQM9kBVyYqvWRgmyBqYEINo1aR7n3PtU+KjF+QYfq
         q30csauBwUM0nwmereX9s6749QpqqobFJ7YT/AenI9mWF4j7GXCkpYtscverz5pJBx94
         tOe1iy1LaEAr3DU/JwMxBGfrzBUaOFtLC0tQcN03HXTf3rf3svI1eKSxFLqGgwqZOqX0
         akuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795760196; x=1796364996;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vLHgRT1LlkWk+F2j4iJrU5ZKCvCqM5eYbMqHziS2VJ4=;
        b=QA4lml/Py9lhEJtpndW3v+7f66O5dlAPC5ihO/0Gy6RMfsmiXFUXrVqyB7sy3BmUUp
         gVApGN6lfDttpyHHmv+VzpYIu2klxXbiD0mlLdNWhFtF4YG7Iqw/GX7g4wWpUzQLfplq
         BTdeXhDBElJoNwx1fgM5BXBAeGohiNNbu3rcu+MKrAqbyiOLJalZHmNjRhmUG6LYJoDL
         bB3NAIZD41je6goQgPTSkjKY0yY4aQ0jS6GQOiY/tXl6GWI9J26+7s3SEGbflXWmZMSK
         lrndE8I9JkJBmHSwgy0wdm9k+AiSeQZSK/W8F/NLMKm1O8gGJHssE/XmXd0NLsqLDe/N
         PTQw==
X-Forwarded-Encrypted: i=1; AL+hErFdcnG48WBaA60j4pRETsx5rsgvNFRG3NQp42VZ5TLy7EU2xZ/klKdzWgwyOMSSSLN3ZkBR6uVJGiEL@vger.kernel.org
X-Gm-Message-State: APuU4Z+kE/WvOkub8YLZyDkwQjqg5B5ocqh5s7Lwr8KWFqpXm2Q30ySf
	UTLJhnjILtZuyrbMge2YmG8zJYvWGfZuPgJ05cjkJVWNf5/6bW4oCo1I
X-Gm-Gg: AZFdTZeT3ZF4jI24DroVuBKTttw4i3Im5WojiKJO3QVqltGrSsdhXERgDM8CmoHe/Yp
	427qFdjnr/M0zEAFhlBm9VIdrqhx04PRWM9M9oYtqxLSnJKSnGfxDfDnUqcwlPQkddFlx7OPWpY
	SvT24rpH16sWqW5OsN3iIcP3FYdCCAoFugIEMhIM/p7FHbmO6MtG1RvcXm73JqR1hx4tlxEr87u
	WMlj44xdfxzlkbfDn0O0JYnE3YS9LPL1e2LHyptq7qW7LhI7kurmscK3Oxz92m/m00/HFin8v6H
	HLkZ+2LS+IUAcLd1YqemjIFdUTnH72I6qeME0bblodET+hZxEBPDleKOBq6Kg7YTEvvm23WE0dP
	sO4FsbJXWDukUOojObi5bG7263UzQh9zJ/gpHZZJGWqo+iNmW7GLqpiMt6GkL2otQ/vhS8Ete0V
	xeX59UZE/DncgNxB0aHEBJjVM82wSVNx4DbqRsEdb11i7ebzcY0exZHO13cogTX+D46dTdtsXOn
	Vx9CGwQsMBc0ONNlJ5bd4uYZVaWHOFaVWuPMyMWt8vAlJs+XkP5sdYIhOKAOqMeZDSdEN6bfqa3
	lw0vwtYxUqB8QiulAkCB4b0dI2uaTXJUJV+hJ/0H5e99GB+7BLGLZ8xq/pXMdTALF6Fu6+jpd6D
	wxrKDHfxJwo/C8IJ6h+c/6V4hT21B2U+057E4Qo1oJSB4Y7eNT8BqIJp2TIWgbcICQ35UZqW/O4
	Y9gzggg0Rp
X-Received: by 2002:a17:902:d48a:b0:2f0:7e65:bf0b with SMTP id d9443c01a7336-2f07e65c19fmr186365185ad.24.1795760196532;
        Thu, 26 Nov 2026 22:16:36 -0800 (PST)
Received: from donnager-debian.. ([180.150.112.169])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f0dcbe3sm114829495ad.28.2026.11.26.22.16.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 22:16:36 -0800 (PST)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
From: Joel Stanley <joel@jms.id.au>
To: Paul Walmsley <pjw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>
Cc: Drew Fustini <fustini@kernel.org>,
	Anup Patel <anup@brainfault.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	Michael Ellerman <mpe@kernel.org>,
	Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v4 4/6] dt-bindings: riscv: add Smrnmi extension description
Date: Fri, 27 Nov 2026 16:44:24 +1030
Message-ID: <20261127061432.17306-5-joel@jms.id.au>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261127061432.17306-1-joel@jms.id.au>
References: <20261127061432.17306-1-joel@jms.id.au>
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

From: Drew Fustini <fustini@kernel.org>

Add description for the Smrnmi extension (Resumable Non-Maskable
Interrupts) as ratified in 35eb3948bf0b ("Merge pull request #1492 from
riscv/smrnmi-ratified") of the riscv-isa-manual.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Drew Fustini <fustini@kernel.org>
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
v4: No changes
v3: No changes
---
 Documentation/devicetree/bindings/riscv/extensions.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index 79491ef8f86a..7f5d85c64f83 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -214,6 +214,12 @@ properties:
             ratified at commit d70011dde6c2 ("Update to ratified state")
             of riscv-j-extension.
 
+        - const: smrnmi
+          description: |
+            The standard Smrnmi extension for Resumable Non-Maskable Interrupts
+            as ratified in commit 35eb3948bf0b ("Merge pull request #1492 from
+            riscv/smrnmi-ratified") of the riscv-isa-manual.
+
         - const: smstateen
           description: |
             The standard Smstateen extension for controlling access to CSRs
-- 
2.47.3

