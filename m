Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5046D362137
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 00:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788223327; cv=none; b=AuKTXDlgKeW2lD2ze5P99JRRppuqTm/oh0xyGYutTmDZbfUFWmyn85dSIDYDMg44XIsOcVmqBQv3qXHxw/Ha6YDsyE9AJh0HIs7AlZjxghrtFkM7OevTuXggkknGpuIM4L2yFPA/WT4pcsEZk1aj+jSl4xoo/j3MMolkrYSP55Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788223327; c=relaxed/simple;
	bh=ZKbSy1xDYTK6vocDIneccWWiWBDPOnMJ7+OXIijoyIM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uiYT0KFgj9/lA/U/vZ8Gpjj/FRvpiKeD8UixgPQQj/wwzBt4DkaQC2SI7gB7/uKcIAIA8+fXCM332ArJWPXBLzplklqNae3vbzj7ogCWyCB2lJaon2nXX4i37R13K9OfIaUHSrtl8CR7xX+lze7hFBtm39LFV3sm9LZf8354QcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i/0D7Kb4; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i/0D7Kb4"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cc149372c14so286581a12.1
        for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 17:42:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788223326; x=1788828126; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=159jM8FdlRZa2YNqhQFQiSJW3XN5LbGD3WFOQLqy3r0=;
        b=i/0D7Kb47SEmqoTKdSrYYv+E1h82QhOXqafUmt9GjysOK1Lcw8OGEw9I4yX8O6yIDO
         R2fS/iVcjqfrZtLXfe7VSk/c1gIHmpbozqsnkspaPNA0DiyKAEBYC94sN2RSQ703eaJH
         Kl7BOHIe8xo4f0MVINHo9We3N7perPjN8ryPnI7HDNrsNodaIrGK1r9nrR1/ZGOhHi5E
         W+m+z6YLtWI6XucJDZiO7DJqnaBWBiPmbwG6PRB65h1UdiuTUm2xOo4gyX37jbfCZl5Q
         ctz+EUfCcXH+bsI86aXA2HyVis4otZZAaKsCpqychaJRCPg3/VXS1JxFGvBN77fMpao6
         u1Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788223326; x=1788828126;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=159jM8FdlRZa2YNqhQFQiSJW3XN5LbGD3WFOQLqy3r0=;
        b=DgM88jZW956QDNTVB+FJNQDlHvEDQEarowyeG6SwyoNilxD6GDW/nxsgFEPgGFpjiZ
         cqNUsndIjJKGh1okn47Hp9/4isai4yeM67sIGTD9bPpmrviwF09gawYBebkusANabNJL
         fYpsKgBycN1nVGioa5B+wbCiiVUOTTZsA8w+ulDvbkNf7Ms4nKI3qzSEdDuGalsi7ePM
         KRDx/3RVN/4INx8e56VBNkdNRx3IwqGd4qPzobGSZUN4RxmmUgLj2romOQ1kyRvb8d0i
         QsbKU/Ut3zkBMSFaZYefGUIZXIJ0BEM+c7D+swRIFGi1IQHhihQJqQ/i5Eg5IVhUXXXj
         AMVg==
X-Forwarded-Encrypted: i=1; AKwUvBzVD6Fa6pTRneOo5GtbrsyfFbwIPotpXFKGNxtVYgAPfRAexk4MSTeZ0yM4foQ2Bo1nKzElUS4gGZ3V@vger.kernel.org
X-Gm-Message-State: AFuF++npwlDrxC0DrvagKzRr4NluM6NFLqsii8sgTOz1BrArApb0iSz6
	LHPRp8riOFCfKMYjgu/tDSkgO8k/8eB8hiNXmbK8OokEMrhI/CKyiStXap3S6A==
X-Gm-Gg: AYBFou16VMboqCq8mVaoQaw01xtobg555S/zLjCzEMtCTLNnBHdGmGD/aPOrNEW82NE
	DqoSHZswLiYJ2gnqAlqfQ5grWobsH896yQXQyXFuWdPBJouwDYZKodyU8h4H+XIelbBuPkQuLsx
	Kdl58bq1HOlPzfgkB+hmdrNJJNmoGzbS+jFcbePtKgxFThdyRbmLh88oW91uuyXKZ1gX9l9SygO
	MSIlHkDuyaSQj9HQcc3g0M+NKnzhMZAn1c5se+U81ZYJ1XZKSpwYAck3OCOz5R5Yku0EQKZwHfE
	kGu0s5mQMB3vWshjXcgaAjda5rGxo/99YPxtasWCU5ZFcRQbce+SlJJay1Buis0I0+a4o8nf/ug
	mLQweMTaZoJMa8DiihPAN/Ssq7Gk2L7MEDsCmR39tmlEBoiXI0ZUDYcXbl7cjrU9cJA1udg9f6p
	W4U1deqHYDdWEsqhBHRY7S4GGeWSgfk9sAg7W86hUYotklxKaEVGKxFr+RxGfyxoktFT/VosTcL
	sXgmIjqwLZEMfXb/PwkxuGm7l4FIUK4heZDAqNg5BnsIz4GdwjGheebt5JTOQvwZpQL/OvAJNMZ
	ZN3B08qBYYlhsMY8i9e2NaCOcBjMLG9rCfNguQ==
X-Received: by 2002:a17:90b:1f87:b0:395:5f43:4ec4 with SMTP id 98e67ed59e1d1-396d0a6589dmr46494009a91.0.1788223325460;
        Mon, 31 Aug 2026 17:42:05 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396d776d0dcsm6599906a91.4.2026.08.31.17.42.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 17:42:04 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-serial@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lubomir Rintel <lkundrak@v3.sk>,
	devicetree@vger.kernel.org (in file),
	linux-kernel@vger.kernel.org (open list:TTY LAYER AND SERIAL DRIVERS)
Subject: [PATCH] dt-bindings: serial: 8250: add marvell,armada-38x-uart compatible
Date: Mon, 31 Aug 2026 17:42:03 -0700
Message-ID: <20260901004203.49686-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Armada 38x and 98DX3236 SoCs use this compatible, either paired
with "ns16550a" (armada-38x.dtsi) or on its own
(armada-xp-98dx3236.dtsi). Neither form is covered by the 8250
binding, so dtbs_check reports:

  serial@12000: failed to match any schema with compatible:
  ['marvell,armada-38x-uart', 'ns16550a']

Add a standalone const entry and a two-string variant paired with
"ns16550a".

Validated with make dt_binding_check (8250.yaml) and dt-validate on
armada-38x and armada-xp 98DX3236 boards: the UART schema errors are
gone.

Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 Documentation/devicetree/bindings/serial/8250.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/serial/8250.yaml b/Documentation/devicetree/bindings/serial/8250.yaml
index 8c2c177faf89..f71c6afe02f2 100644
--- a/Documentation/devicetree/bindings/serial/8250.yaml
+++ b/Documentation/devicetree/bindings/serial/8250.yaml
@@ -109,6 +109,7 @@ properties:
       - const: aspeed,ast2500-vuart
       - const: intel,xscale-uart
       - const: mrvl,pxa-uart
+      - const: marvell,armada-38x-uart
       - const: nuvoton,wpcm450-uart
       - const: nuvoton,npcm750-uart
       - const: nvidia,tegra20-uart
@@ -119,6 +120,9 @@ properties:
               - exar,xr16l2551
               - exar,xr16l2550
           - const: ns8250
+      - items:
+          - const: marvell,armada-38x-uart
+          - const: ns16550a
       - items:
           - enum:
               - altr,16550-FIFO32
-- 
2.55.0

