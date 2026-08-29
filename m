Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5EFD2DA749
	for <devicetree@vger.kernel.org>; Sat, 29 Aug 2026 05:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787981162; cv=none; b=p4NYkXpTamuD+GFtLPklnI/2L19hzZVUn1EP7DVmteCkHCJ0l5+0qnXMAY+NvFyV0usMFDm8yhnNkTNSlnSdeFIxLVhLQJpBNGLr/0YrEyZWikqgu/TxnNn18fCelE+0PxOqhjemnS3NJRe8KbIesERyFF567FU3ikIcQLFYvh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787981162; c=relaxed/simple;
	bh=tKa5j9i3U2hEA89fukkKnmWOEyATOeYt7RNjiBnkF8g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mVqPPAgQ6aHmwbQCDCBXkih06Re4RmmsOkNpjG5/njE/lD8RAiDK9fcCmvIN5WppfdMjetvGDMMI+jKNzuTdt2WyOTzuXH1CQ6SkfmRC0BQfIRACbmWYOE3RriPZYJfq6JeHfyq+GEaf0w+zpp/oY5ZLq+jx0DnrOIy2oIBPCPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la; spf=pass smtp.mailfrom=lex.la; dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b=TTNtrB52; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lex.la
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b="TTNtrB52"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c2569aa5116so146975166b.0
        for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 22:25:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lex.la; s=google; t=1787981157; x=1788585957; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6tbb1GitXTJrwSUFBP7Nmbmt66qKmDt6rqJljhVwKiU=;
        b=TTNtrB52lTweJtY0q4agXLa61PNApfdVadtD44EgkDczUakEXFtyNDxbHSFlSuJCrJ
         7N5R7olAB5CrVQa0pp1g7fvKTbGoahgvLFB8csMZ+den9ut5rreKVcAnvh5DJylWfaQp
         RDSP+5e5Qfl8+U0d79lHFUyqqVepVICaA5jHr48wt3Nfg/XhHC03roCaAmV8MNkns+7U
         jdY86BNc6xrbLcQ/Ojh1ydd3BAy9WRGd58/sVRlm2FuJq8LR13mHdpoceWjtF6/ayMNn
         5ePELdUBSwtk5UJfcSSW+KpzrJrdRBPMgb3NrUQ8MwJMKkRH7HfinjuoAakNx2Xs6EJl
         /V1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787981157; x=1788585957;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6tbb1GitXTJrwSUFBP7Nmbmt66qKmDt6rqJljhVwKiU=;
        b=NTWHgzjTRojUJhgW6g0EvPkSodVsBybpD5b3Dvojp17UFlesqNf+quuPOQXT0bRpSY
         G1F8sxZjE3KfCJtAGjQ9+FoMnr9FwxfJ5fWPKI0Rq+60hqIdgnnpxex439G4MSaF+5tZ
         X6QBuF9wmVft9ozkmlRyiQrTFIBbETV3wBiEtTsVblES/LxwlAMv02Z9AxmpaqTNYwYu
         Igs/FQhqweX5mXoKQ4+gSK1Q4RTb0bhOnAXyzny0lk4HmFHbTnVnthKMGx+l/h6D0nMt
         oz5uRwrHnhq0L8bShcYLgBe9E8GlmvsUYos3pq7w1TldHs73Z5ukHoqi4K9Hu3MU6Fwk
         Yr/w==
X-Forwarded-Encrypted: i=1; AHgh+RpKDGww6XIfI0TvBFunRFQ7LaqMkIRYLIx4Y3DxJl4kuYFNdTkFPbyLYJeXSQrMbDWfRE2EQ+Xa4Tiv@vger.kernel.org
X-Gm-Message-State: AFuF++lx8vEdeM5pGB8tgJV9899b4QsJ1YqTKiEp/7rc8kRm3ULbv8pf
	hJbv8Ooyiiz5uhwm0olJjT57MLSfoLgatj2knW0LOhw5Tld2KrqixSTkAtUQfOOzwA4=
X-Gm-Gg: AYBFou00hkHQEwc15Dx29hqNk/+ZVVlzBT0V/qeGd6hrNtY1aFNBgzEw5GN8ZJn9vBz
	o9DWYM0Lyfe1LI6eeUzC5qQLrdkg5cD1Zd7xptuU8n0aWQVjufMH+BG5MLzeEg4MglT1V8MfKEZ
	3rMyXuKkfaYObb/xBWgKou5nCZxz12RW5ABrltn761669HwbxkfK+zXoo1V3ra27Ba+hyItyO7x
	N1LjGkzHhNSXnICcc12HurO2xISW+7EK11HnRaBqizYR3hcXjvJUBP4vZe6emyTHuHFktcLge0O
	9sTENAyQu2ImxAOlhNs5Kc2Np6FU1lzGB2fPPx6DqvAfDxUPi9adNik2Puh6ALhUieyICvV0gmc
	BWRJLhOkja2a8ZtsCw356qt3J5bQ6yPHiNUUTj+V42Qz/DpRXezTVNMDou6SOmBFChpkqQLVmwN
	XY0ss622/QzhPgUsK5yxj3rUidrB9y/Lsm1pY5G8UhSL9oYpOkmt4igw==
X-Received: by 2002:a17:907:1b0a:b0:c24:6382:2648 with SMTP id a640c23a62f3a-c256dbefa05mr322975866b.5.1787981157019;
        Fri, 28 Aug 2026 22:25:57 -0700 (PDT)
Received: from remote-01 ([45.85.105.214])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c255ee75a36sm163750666b.28.2026.08.28.22.25.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 22:25:56 -0700 (PDT)
From: Aleksei Sviridkin <f@lex.la>
To: netdev@vger.kernel.org
Cc: andrew@lunn.ch,
	hkallweit1@gmail.com,
	linux@armlinux.org.uk,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Aleksei Sviridkin <f@lex.la>
Subject: [RFC PATCH net-next 2/9] dt-bindings: net: ethernet-controller: add slow-to-probe
Date: Sat, 29 Aug 2026 05:25:39 +0000
Message-ID: <20260829052546.1152446-3-f@lex.la>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260829052546.1152446-1-f@lex.la>
References: <20260829052546.1152446-1-f@lex.la>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A port can reference a PHY whose driver is not usable at connect
time because the PHY's firmware, or the module carrying its driver,
lives in a filesystem that is not mounted yet when the controller
probes. Today such a port is dropped at setup and stays unusable
for the whole uptime even though the PHY becomes fully functional
seconds later.

Add a boolean the port node can carry to declare this expected:
the connect keeps the port and attaches the PHY once it becomes
usable instead of failing.

The name and the schema home are an open question of this series:
the property is generic and read from the MAC/port node, so it
lands here rather than in a vendor binding, but a better-scoped
name may exist.

Assisted-by: LLM
Signed-off-by: Aleksei Sviridkin <f@lex.la>
---
 .../devicetree/bindings/net/ethernet-controller.yaml     | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/ethernet-controller.yaml b/Documentation/devicetree/bindings/net/ethernet-controller.yaml
index 1bafd687dcb1..ca82672b6cb3 100644
--- a/Documentation/devicetree/bindings/net/ethernet-controller.yaml
+++ b/Documentation/devicetree/bindings/net/ethernet-controller.yaml
@@ -113,6 +113,15 @@ properties:
     description:
       Specifies a reference to a node representing an IEEE 1588 PTP device.
 
+  slow-to-probe:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      The PHY referenced by phy-handle may not exist, or may not have a
+      usable driver, when this controller connects to it, because the
+      driver or firmware arrives later (for example from a filesystem
+      mounted after the controller probed). Instead of failing, keep
+      the port and connect the PHY once it becomes usable.
+
   rx-fifo-depth:
     $ref: /schemas/types.yaml#/definitions/uint32
     description:
-- 
2.53.0

