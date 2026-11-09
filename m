Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794201082;
	b=oShkZWhCARmpN0B96khgQmtgD9AKxH2AyGp5zE/3BCPdjzRmgIxLoMVH9PNx1yQh4OIk
	 l4I4yC1V1osfoJRd/dRQq7ovcZHxMy2Tf72lUblLJmh753odRPS9xe9wdn0vlMcrKVTbg
	 /xOS+i4v4Llz8zx7Do+vf9kfo24VnKJRmQQ14pS2AkuLKE3WVrM+xFhTe9lN0YPvNViHJ
	 0iTD/grkF5oLXF0LM0Fzwf9Mq8BcScbj/Jh07Mkq0NDGBaPO9ku4h8I1Oj3RcPt/ez3Sz
	 +ddYpngHB3CjRO0Yd/EssatwFa3bjWLPr3ltgfKuTVqcTtxkgVjKAJbsZb0diQiGhxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794201082;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=lgRGsEIxSdF7se1kH5ZKybJwqIiFvQpOJpHKAYNwocs=;
	b=fgk7RSXsqU2jkDv/seG0+L2J8wxCdOykaNK4Htm9JmgFH3eAeuD+5mnOG9LXXhe7mBc2
	 N87rrcxy7ixDjS83w6oK4MLDAdIAyJ6k+QUL9j0LEcTz631nXSLTc2GQrN06wiAGiwiTP
	 3PakU4/ukPj8hFELDG0cm1zNIw2r3+jsjull1tnstebdKe7Pn8oUua9z294jr7yv46qp5
	 7zV7QjA5Vk/EuFu6Uobr2CYfT35SDEHIyi+7CdHbh7eeuiC1cffCfUEbkNDJ1BeWyPpfC
	 MTfdsRUyHTJBsc69+KbsTWwLVUdv1jfQXpFNMD+Kjv7hcqhf0xlS1d0S7lcLyCBG2PA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=jms.id.au;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=puU1onEx;
	arc=none smtp.remote-ip=209.85.215.181
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96A92606A31C
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 05:11:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96A92606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=puU1onEx
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cc147d86bebso210992a12.0
        for <devicetree@vger.kernel.org>; Sun, 08 Nov 2026 21:11:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794201081; x=1794805881; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lgRGsEIxSdF7se1kH5ZKybJwqIiFvQpOJpHKAYNwocs=;
        b=puU1onExTbaVViZ8755QQ7RLqVE74xhyo4OUB2HNFd9TH6z6R834VGBf3XEkzjwctl
         KzNwv4/lgLhsckXhSHMA4C1dzEivWdEWl+WqYfqmO6DjC28gg7LKXemRDXh3574SNvdW
         it/2vIzdjwuWJZqtbBOhp9004VSeCeccju2Lu8SpbmauffLDh+igMhwmojQdgk0jdfLZ
         NFWsC2rsbCnALZLsEU0Zph+tcXnDUsMwlt28DhmU4v2iKxt75Sl0MDtj6CAOQUnuLQHg
         Ax9wFY7dxCzZooBXJDaDneLglO9Sre6u7G6bgqfaVw7LqDVmb3SZtp8CkzUL8DCT1RrA
         /Upw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794201081; x=1794805881;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lgRGsEIxSdF7se1kH5ZKybJwqIiFvQpOJpHKAYNwocs=;
        b=c3Pdb5VR35tYhvF4iB+Ne5K4oarnYRSW4GC46e6BG/0zBOW8AkApx06N9uNPrMpQqp
         c+0KRCnBzuY0Nj7BKyZrHKdt8UmNi3Nyrlb/VHI9VDvO6g6McENpKhC0ng+sigao8d9s
         x+etF/kcZoL+34cs6M2fAAP+Q7tQd1evqJ2Ldez2RxW8hPBJ+h7twMTn8GwY+UYsMSWO
         8RYC4ZhtW5vtyBpeXQekCQi8vnhXzC50LdWEeW0ntvuJ+Ca/bpFUW5nagFhyzcrAUaxI
         C40bKRmFHY97RHSi36duBuOmIGPcVKaNWIF+fzN0mfV3s8nuoHX8dswPiC2rG6WJQGOp
         neoA==
X-Forwarded-Encrypted: i=1; AL+hErEAtLCB89nuWgb0qhnSLxz0IxxsHcR3us4Mer0K6mU22Us5so1gxmDU7Gb55ijHcYmBP1JZc6YiMtFr@vger.kernel.org
X-Gm-Message-State: APuU4Z9LT4vuWhlJQOqfZRYfbkukzaquLT0HTEoWwwvIImRhXq9Y98LQ
	YOlLtyEF82dipDAvR24PGuj/vo/Su4b6KEO6saI65pKuqUlU/bPT+Jh4
X-Gm-Gg: AYBFou3+x60wF2GgGCZPN+4vyH+9otKaulbtEBhZfaJCVKhVMA4HrPtm2oRvCuhLhEQ
	zxBhi6pp012y/Pe0Vu5wAqQIOHnDpZlWkrpm/g5zlBZFP1h2+d/OcrQl4qcRzc65+iTbAxz6xXg
	9KzFCowfezSO//IVa0mOKU43fT5GeF1ccpNzGEsbgVvjq4JZ9+17lx4SV2AnlPu3cv7tpG2+mOm
	Te2UD2ddg6SjywcgMcwr8heWvOpdOy40jqKgqIwygSWqOauNo0930YCIlHjWRkNJ96zu5B6f6di
	OicqTgCNjVqIgqrhHoLS5wMjr+Tk9uQurMMPMK9XC5RzOHeb2RkWJ6G+Tdxeyccb5Xjl0Kna+U2
	kJKgoVMBaxEQGDVuwntRjev+fcAmpRo8itj11sCjTghJXbOf55GmdXjmzDr88m87kwYHV91wH+6
	viVV1bMehRpvDY7tjYTOD+SUiBfPKIMKR2DMV8MQx2veKBWheK1cdzc0iOEuBGZnudz9d9g8Pea
	+T+f4aSJxtM/VTK2ZGo8jCMzb5uxj9WyvEJy6dSbu+yYytBlwVgb6v+HK7BKgf0Dk5q2KiLR0Wu
	fGZVWkh+1Y8sz4by5YuSJ3Fc7baJqs7V4CE0fXsWMGLvWbUk8UpqOc3KT5Hf0zaVHoAfbm+faG0
	pbEN7g/M3hEf7zfWGtqcQf1UKrw5oHhwhCkuvr0b6G//pk0j3bic0REtQoA==
X-Received: by 2002:a17:90b:1e47:b0:3ac:a6a5:5757 with SMTP id 98e67ed59e1d1-3b12d3fc296mr2052368a91.11.1794201081003;
        Sun, 08 Nov 2026 21:11:21 -0800 (PST)
Received: from donnager-debian.. ([180.150.112.169])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b12790befasm5247652a91.13.2026.11.08.21.11.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 21:11:20 -0800 (PST)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
From: Joel Stanley <joel@jms.id.au>
To: Paul Walmsley <pjw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>
Cc: Anup Patel <anup@brainfault.org>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Thomas Gleixner <tglx@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	Michael Ellerman <mpe@kernel.org>,
	Drew Fustini <fustini@kernel.org>,
	Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3 3/7] dt-bindings: riscv: cpus: Add Tenstorrent Ascalon
Date: Mon,  9 Nov 2026 15:40:43 +1030
Message-ID: <20261109051050.105623-4-joel@jms.id.au>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261109051050.105623-1-joel@jms.id.au>
References: <20261109051050.105623-1-joel@jms.id.au>
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

Add Tenstorrent Ascalon microarchitecture and the Tenstorrent Ascalon-XG
core.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Drew Fustini <fustini@kernel.org>
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
v3: No changes, pick up review tags
---
 Documentation/devicetree/bindings/riscv/cpus.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
index 0da219ae6769..2d2e4606a53e 100644
--- a/Documentation/devicetree/bindings/riscv/cpus.yaml
+++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
@@ -75,6 +75,11 @@ properties:
               - sifive,x280
           - const: sifive,rocket0
           - const: riscv
+      - items:
+          - enum:
+              - tenstorrent,ascalon-xg
+          - const: tenstorrent,ascalon
+          - const: riscv
       - const: riscv    # Simulator only
     description:
       Identifies that the hart uses the RISC-V instruction set
-- 
2.47.3

