Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795760193;
	b=1AA432S1ctqiu1+GnmrlpNO1GNSe44lZfc10tkt5XSsd10sXQZS3wfpTnTnNaB55J/3s
	 qI2SdRw2TTFgH629bBweGaIJ5ipS7CKRLXr8qLfXdE9AFpYS/6Z6YNgTGI011CgGZv0ZQ
	 Tuer1vAvy2hH1Idklpt4wk88Pxzw0mQmoVl1CuBTfa85uguuL3K+duVmsWrNOYyKl1K4y
	 Sd1qR6/6P7eTSpufbVSB9I1oHQTGlbdul/EjmhPTotixu3uQCn27dq0xOI+nUfmaukfiO
	 IJSdkTCTXbWznDzlIf1cuVH63gt9e18Fq3wlDBfdE4zQdNVkSOiTJtbnVYsE1XveQYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795760193;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=JeIuJYZrmd+Vl74IJcsqnRgjjahxnjf4N+emXH7zUV0=;
	b=VNo6V3Y3FzdEc21BJgfRzdOfHKymeWpaDKShlLK98eHgByJq+LCVY8sRliIc0lMK98yg
	 2a7wJwuU8G8AVt8sIQ6iflzq8fUWVrIcJYmMfGeGNP45/XxNmVf3ZGwD7HHAxMV/1U5wn
	 ytt+Pqf9RAVG+KVwi8/ZM/T0qvyPt9Ytm4veiUjd3jC8gPGeYFyP216V5MhkiaOahlbyV
	 AdAasCdzdirVawTq6jatpbDFsGA7a76Jkh1W2QOpPm4hbLw7PMZMktsdv5ctspdagHaL4
	 V26edFpQbjLYClfUIiJlmAz2CUJ9eYNQvuxu26iainGPRfVPBReuHwyyNDMNpoLz1Hw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=jms.id.au;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oZ1pCABf;
	arc=none smtp.remote-ip=209.85.214.181
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 620C0606A31E
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 06:16:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 620C0606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oZ1pCABf
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2f02b9c1f6fso52133645ad.0
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 22:16:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795760192; x=1796364992; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JeIuJYZrmd+Vl74IJcsqnRgjjahxnjf4N+emXH7zUV0=;
        b=oZ1pCABfhaXuJ2KEhzS/F4G3HPaekf1qmNp8tGp6Pg3vv7K0wWe4hFdZozYO23ooLw
         irw5DGSpuAiW6UDCU1lvBLUneg49z4atwTWa34Qcvk1YM9w0wUfF0OL3RFX+sx2qVfq5
         Hpc7WlkHZ/aKHhUeDDTsMdbN8M6BzB9clrsoVdppzx1d5JxbVc1zj1qh+m8PUbLqYEVW
         9LwOH0FrxlCO0Qr4r4mLwcFstTIOnzD/nUhAM0pj1bgoULP/kneiaXfpPkcX0/WQyUe6
         Teay5uwzNFSloWeCmbE2iX2YlK9BzDsLgVGG/cGKqQC4YqcaCUbrHQB6hqKXQ7buA82Q
         o2Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795760192; x=1796364992;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JeIuJYZrmd+Vl74IJcsqnRgjjahxnjf4N+emXH7zUV0=;
        b=NVEsH54FQV2FsNp4fx+YIhcG1u5lpmDuK5FtPqaU+D3ZlOpDrrDRB75RVckt2QIWXO
         1URlVI5vIO1PP9ViDXOrhhsj2P5h05mNAF7YgeZlCWppY2CrwEznvYK4jpmkoqAojhE8
         cmxV9Z595s9g4ayM3nIWhOrJNfZufCB6gtXhRZOwso/Y6bzjOpPTR2tqnvZIjzeHiwa3
         8LpTz32O2GSdLsQKpJg/NAy4LQglx0vCcLEVRafckQoHESPgNePDOtgfaunQTqA/yyqh
         AiSSE+R8z4qmqeEW4TTAn1lECX7/VyiBI2HjoWOTckYsMlX5PAoFI3Bm9G08luI6HQFN
         aY+w==
X-Forwarded-Encrypted: i=1; AL+hErGFyorORheJT5oSCIVC4cicnWZAVBf1e45H2JsKAo9VI37fJTEA5ltXyaBzGqUc5nm/uCcr+fNU5agd@vger.kernel.org
X-Gm-Message-State: APuU4Z9eLBR9piHp7Tvwcojo8PbFV1fbn76jEvOzGElfbMpH86ANtiyT
	gqVhEVGTVBhPhIJedgN/shKC0G092oG3WNaePtftYwFje+oYq2R2Yvd/
X-Gm-Gg: AZFdTZelZ5KLM3jKDltX9wzTubk5Yu1Bk9zcqy8H7j7ZI9o2SQdoLY9+szM58iURvxn
	tHLywYB2qlHfW0KMcVurQFG7PJgs88SaguVrVwT24d/jHgfQYhaGRzWxykb0+5dCkAShHC5tCbQ
	i/uHyxNlb8wZN5yvcDcJ+w9O4SMZfz03p+sphZVmOl7DlpTgKrduO8qMOkK+KOv8NoRKNzW71kU
	QQ7/eVZQltw/Cal/2Gjerf2Lgj89imVIG6Qsh70G9/ZWVD1qc/iLadvPPMGsBE7AGH9evNs+Lq4
	qTkWKTJJwQ4dPQjiu8sbys1QIe1Ov2w+i0sbBA3QFdGGpfhmGR/oLaEGGSAGKwKeeRx8vnBBN3C
	aSKtzYX4eD8dpQ5Va4v5JOwaD6BildlL8CHQ3/QQPVfhQpr4rBashid9p58eVzSmmFOju7D0kDm
	YHVC7KdIc7TMUM0p6TjZVLRYEOA6TwRiKGD8Re2Q6k+4aSxtWFiOnfYF4lzI9A6ThujeAStDfoc
	dnda2R5iWUFef6jWOhzpkYroHZttLjMS7zGTvZ/5WbFRovYGIgihhWe41AjnLbECRr3v/grO0/U
	ogbUgvQNjCR8Nold2B7mfncLBbPFMx0rP3dECt1kn29XJ8vZKtyvomdkH2UZ0feW/Qr2I+sGQY+
	w35KOH8WtA7Ci0hmUjY3kHfAu1Sl5nZ4BPP5e45jMUR0+4WX//wQ5IFR2PQUJP0Q=
X-Received: by 2002:a17:903:2f06:b0:2f0:a36e:6e08 with SMTP id d9443c01a7336-2f0a36e746cmr110652605ad.30.1795760191815;
        Thu, 26 Nov 2026 22:16:31 -0800 (PST)
Received: from donnager-debian.. ([180.150.112.169])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f0dcbe3sm114829495ad.28.2026.11.26.22.16.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 22:16:31 -0800 (PST)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
From: Joel Stanley <joel@jms.id.au>
To: Paul Walmsley <pjw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>
Cc: Anup Patel <anup@brainfault.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	Michael Ellerman <mpe@kernel.org>,
	Drew Fustini <fustini@kernel.org>,
	Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v4 3/6] dt-bindings: riscv: cpus: Add Tenstorrent Ascalon
Date: Fri, 27 Nov 2026 16:44:23 +1030
Message-ID: <20261127061432.17306-4-joel@jms.id.au>
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

Add Tenstorrent Ascalon microarchitecture and the Tenstorrent Ascalon-XG
core.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Drew Fustini <fustini@kernel.org>
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
v4: No changes
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

