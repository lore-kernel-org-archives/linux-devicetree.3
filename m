Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 869E3376A11
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 17:43:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783705402; cv=none; b=C7LcunPQ7L1nWvCYa3AkWMG74dcWyiZ6Y1/emmu/DxMtnixDbanehtnQc85LKP+VWECPYHlbgL90b8ctjI2SmNIERN5O/nUlygpnH410FoAd0hfUq9Z0ulkXhjPt6HH8SbenhcxgV3bxx4daJJLQLP5jc/Vb5jC6+2RK/8CIMIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783705402; c=relaxed/simple;
	bh=prKOukC/hQleIejFsl9neIEOxCOOFH9bp+Z8BwNRH7k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=joEXJm9vlol0S91NRnOhI7w+0E9OgnK7KVXa7PJw2pzXQoFibPcUcBMtrDonZQIH/NS5Z0Wk0Y4wENWCp+8wopcLPlfxnX7CKFl8uia6sHM+p8zPKsY3/KaXEHcHm9vXdEJ57N7RHOSSGFfMdilO7mEsub3tOircRrjNVBq9lQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XJrv28nu; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XJrv28nu"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-47c6e9a694bso688821f8f.1
        for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 10:43:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783705399; x=1784310199; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fK0dDolL+Nqw/IbXpMjV80nR5kRn15xWt8Y45u+zCaY=;
        b=XJrv28nuZBMoookoc4kCBNSlk2nP/DsIHqiQjup2WZro/lHTs8q51q9wXdHgoMMAw0
         ZoWChtmRzksMFLgTzPbqOUryKuCz3dLxnvzKD+Hk7jfPAE2qnUlSWeR+0zxIGeWdawDa
         uPSOPaYl+ofxI0M+oj7CJIPUeO9+nI2hyfyXqSvdKVqtIQcsMQ9qnW4bvyAA5eUqKFzA
         VsgARUafD48PnxieJ/MBOWqGNaogLGlLOG0vOdPxTDoYpdUlGipOBqEikW8RvQpkkPgt
         jyC1JTJOAJZI9iGyV7w1CA08E7biDjf0k9vWYCrB+0covZThKFwO2yboLgt1Kz5HQEyr
         Z+pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783705399; x=1784310199;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fK0dDolL+Nqw/IbXpMjV80nR5kRn15xWt8Y45u+zCaY=;
        b=EXFgY8x4K8PgnJNyApP/cItLaW0Juhbc3M4+ZYqMg60brcIpHRHR+LtOaHkKa7829M
         NfWkszJfU/YPZ/SSiA+ECk/EIw6ACN+91xUld674RQMaZR7DCslVhNuPnaAbKgp6sOFj
         fOsUMtLztPT48s/2WN/sxZnjHDmmBKITqI+7t7+BH2d7fNtlUv+1/qplssyGJ2SgRARt
         xAcDvVDvh8pxBf5I887q+Z++h8myE+4YlkO0bxbQKSFSI4t69sKuFoyAvc3jlS8R64r7
         OF6X+INjGuZJwaYTEWfs2zqGwKId07eqysVlOa2mmRM/S6zDYcDrdDMUBEAtqB2eqNu/
         hktw==
X-Forwarded-Encrypted: i=1; AHgh+RrmVy4mrAICUyTpFiRVbclyDBGNn5ZFYk+OLOD06Jc1m9yuwIzqs2lt6ogdsGpmkLHv6/KujsgVH7lc@vger.kernel.org
X-Gm-Message-State: AOJu0YzKSqv+F/BK52WwvKxvcwgf7kxySZDae/8G9D7kuBXgnRsb6z9y
	LX1veE2EybNGNuX8L0cuccJYTkCVej8WYlrhqGlmiRVgHskM2Qd0uK99
X-Gm-Gg: AfdE7cknpB4q1Ggqh4CvOHdCJnHR0Jm5yej9/zOyAnlbDYmldyxSw4lyFRjGkhcwBmR
	Dj0ZqTZm29Ojv4xmZrN4nDlRHZ0UAHw+j/wZn08ipCgJVFB7g7rAgr4IksU4Thux1Ywfk/tfqaA
	fo6REDimC7tEYSPZJhbXx5C7F/jCm+LLEp4XXmAUHmQlVIRCZrupVtfsFQVk+TRX4dZXltSHb/5
	FLf8s+2sy3oisYz8Ry4pqOShbTR3gb2Z5MCdlDPFOPB1O+WS0L2xWYY3PXOd8YAIPPXRI6qVXnU
	yj2gbLzjCpGXZXuOFw3RcpwXH+Jzkw1yf6YTDMJKPF/twHqYVvRp8g3Cc+VVveThFe4mSeve0eg
	NyDZNIyRbBB1AjDsmn+o+B7g59pj33w7Sunj4h6SP84d1DpQby6FR0zVwWy5mZI0vft0MOFKB2f
	kBa8sWLvB+GXbK83HBROp1Mf/UsI3OUWfTrDqLPnipNo5j7ZfMxbNV
X-Received: by 2002:adf:f008:0:b0:47e:f4c:508e with SMTP id ffacd0b85a97d-47e0f4c5128mr5690984f8f.46.1783705398845;
        Fri, 10 Jul 2026 10:43:18 -0700 (PDT)
Received: from GLaDOS.station ([185.81.127.246])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9de1d91bsm67170201f8f.4.2026.07.10.10.43.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 10:43:18 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	matthias.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Tony Luck <tony.luck@intel.com>,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3 1/3] dt-bindings: arm: ti: Add bindings for Variscite VAR-SOM-AM62
Date: Fri, 10 Jul 2026 19:43:07 +0200
Message-ID: <10775b12b801255546c9cdefdb153e421aedf910.1783689915.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1783689915.git.stefano.r@variscite.com>
References: <cover.1783689915.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Acked-by: Conor Dooley <conor.dooley@microchip.com>
From: Stefano Radaelli <stefano.r@variscite.com>

Add devicetree bindings for Variscite VAR-SOM-AM62 System on Module
and its carrier boards.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v2->v3:
 - 

v1->v2:
 - 

 Documentation/devicetree/bindings/arm/ti/k3.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/ti/k3.yaml b/Documentation/devicetree/bindings/arm/ti/k3.yaml
index 69b5441cbf1a..b9da6e62ab79 100644
--- a/Documentation/devicetree/bindings/arm/ti/k3.yaml
+++ b/Documentation/devicetree/bindings/arm/ti/k3.yaml
@@ -104,6 +104,12 @@ properties:
           - const: tq,am625-tqma6254
           - const: ti,am625
 
+      - description: K3 AM625 SoC Variscite SOM and Carrier Boards
+        items:
+          - const: variscite,var-som-am62-symphony
+          - const: variscite,var-som-am62
+          - const: ti,am625
+
       - description: K3 AM62P5 SoC Toradex Verdin Modules and Carrier Boards
         items:
           - enum:
-- 
2.47.3

