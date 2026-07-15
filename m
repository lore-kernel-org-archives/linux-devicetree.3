Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E34D381B1F
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 05:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784093248; cv=none; b=FTnJ3TWsYHxNApKXjceSYA6DyZoskUm7NVKUtKlYYXLqYLlnyy9aWxBW2G79zU/i6QytannHXl8XUwBOsuaFrLI7+Ogm95TQPvo4q6eFVvs1BbZs8PSgU0aCsSRS007bOJ0u1Td+s+j8q1+Off9380yuc2G+3Wxvqt/T3dM7aTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784093248; c=relaxed/simple;
	bh=s/HSjP7l0fuliS38sucFfBcL+gILDM9+x6hz6PkArQg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kN1shr4grkpeNjcaORtSyyQNNvd1eZ8F3DT5inP+0kAItWTu6PT7N3FVMk2Rb7X4ShfooCPBM+Hnn7s6Fcxi2PeaI1itsQnLO8vRtofDwPJ+AisJeyhUCfchjlpZsG6BXqKo0ndYWVUyKk8cojdGe2XxsBf4HQjcRbtd3fyKFTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EzAiVPBn; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EzAiVPBn"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-493adc4ff7eso3552715e9.0
        for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 22:27:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784093246; x=1784698046; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t4eMricuSp+2sv7gYp7OMjI1bUn4crHCf4zjedhWUuY=;
        b=EzAiVPBn9JscRiiUeLwiFH01E89jZUfTZEAfZxSVKbk6cZp8e1Rj9KyBOWssJe5mhP
         by8DY2SR8vd966pWSOSEi7l/DLM+OpUSWTtcfpKVna8lSbpZ3nsS4P3aAeoOtnLapM7z
         QHwG8LxK/qFFIhh78KdIBgWbCTaosCNBrM/ZiH4sDfHVRnEeViVuXj4r89AMs8ZI4oU5
         FyerVuNU/MTVGyGnHLdF7h/gdnQxTifa28/qATls1QfFl43tTdvTN/X8RFwHVlB31fXK
         YDHxXIpZm3lAwNFZQJrm5m7cZ+3nqKz657mlZ4BsPjLsaQwJvYIKGkihjYpatNdTtRL9
         1pQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784093246; x=1784698046;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=t4eMricuSp+2sv7gYp7OMjI1bUn4crHCf4zjedhWUuY=;
        b=Y0KsAkhl2gPUrxyw8LH1I+acxDd/AkBcBVpwzzIUqaxsRINwu/dYiZAZIW+fuUjnMV
         BHEMX5mIm5GRpk9KMZr+cMk7Xn7jwmXd7Acs8mYpoEH0Jk+WtLVrzfGVs51RdIv91z8A
         CvFZKsc09tKRsXb5UeaeCDAwbyj2q7tTi5LEjKn55LqbQYwtfrBbC929XGVnCq9Z76DQ
         qmcxw1UBwDF9I7+sleghW9hj7rid6SQhw4+sUmOW90RX2PO6W6yBGcd4UIhnY1khmjO+
         BqAvhfn+h5fJwOwwAcYIYju9UyINo1IA8U2P+xgELPV0JiMZn0GR7x/LaFRifS8sxRLH
         VRyQ==
X-Forwarded-Encrypted: i=1; AHgh+RofMJvlaKfpnnP3MHm94DDsxfsMM2cnVoPVbWvsRZNV+1f9Hqe/rU0xNxL0V+9N9KaEUGsCHT6AOlyX@vger.kernel.org
X-Gm-Message-State: AOJu0YxoFzb6BqTqwTFT1cZM61vaiK1TTZQEguFBZYTXW4VKmDyHExp6
	izRs47NbSg1MxfAAK0tPY+uFJw8KUUS9JtCxpvcLxpqhl4oZUr4795hR
X-Gm-Gg: AfdE7clq/38z4lPMLNhPkoNszBzOe9Y0cPv+aKksRCbeNnDLCE1npB2bsaW7PjvwMBi
	ezpgQxnHjLSbeyIDDiIwpH7bKLSnA/3iqx4rWCQyjfInFHY87wH5ODaqc/W0xLpvNvRKkUls6nM
	h5GDNjOITTq87Y9uOK8qr07rLq9au6KmQmYBYItoSjHWcdf6klOF6e+OEq3w+DtKsgIU3ce2QUt
	l588VYAUNSlsespN5JZgdBFOnxZ08LnS1dtoBjNPdEGiUZF8x/OLq2DlCtn6B5oI+8xg/Y7NpD0
	ZNWhVwSLygk+JR5FrXSsl7daAQ4XzJ5VjhHg1N/KbPAymBPQaDcHnazKfzyPc7e6bZyPl5HsTnA
	ww7Ae+l48nEvUHhjJNmRP7wIhqZCOhHGY1Aiy9xY3JIiv/lBhnDFsYHOfSi2x0pTeEGOrB5u3YZ
	Y+8JQHZbegOInfQoyXmGZvZda3xdd64gEgaHD2W3LpbKTxhQGE3Uxxru/YPkFDmmNEriLJ9RUHa
	x45Rgro2Khc8EVYq3wiAw==
X-Received: by 2002:a05:600c:c055:b0:490:b2f9:d9a4 with SMTP id 5b1f17b1804b1-493f87dbb37mr69064725e9.1.1784093245921;
        Tue, 14 Jul 2026 22:27:25 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME (20014C4E1B883700A9E699EB87FB5BDB.dsl.pool.telekom.hu. [2001:4c4e:1b88:3700:a9e6:99eb:87fb:5bdb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f464b7f84sm13003669f8f.27.2026.07.14.22.27.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 22:27:25 -0700 (PDT)
From: Igor Paunovic <royalnet026@gmail.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-media@vger.kernel.org,
	kernel@collabora.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Igor Paunovic <royalnet026@gmail.com>
Subject: [RFC PATCH 1/2] dt-bindings: media: snps,dw-hdmi-rx: add #sound-dai-cells
Date: Wed, 15 Jul 2026 07:19:38 +0200
Message-ID: <20260715051939.64652-2-royalnet026@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260715051939.64652-1-royalnet026@gmail.com>
References: <20260715051939.64652-1-royalnet026@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The HDMI RX controller can expose the audio embedded in the incoming
HDMI stream as an ALSA capture device. Document the #sound-dai-cells
property so that a sound card can reference the HDMI RX audio DAI.

Signed-off-by: Igor Paunovic <royalnet026@gmail.com>
---
 .../devicetree/bindings/media/snps,dw-hdmi-rx.yaml         | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.yaml b/Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.yaml
index b7f6c87..83c10d9 100644
--- a/Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.yaml
+++ b/Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.yaml
@@ -78,6 +78,13 @@ properties:
       The phandle of the syscon node for the Video Output GRF register
       to enable EDID transfer through SDAIN and SCLIN.
 
+  "#sound-dai-cells":
+    const: 1
+    description:
+      The HDMI RX controller registers a generic HDMI audio codec so the
+      audio embedded in the incoming stream can be captured. A value of 1
+      lets a sound card reference the audio DAI as <&hdmirx 0>.
+
 required:
   - compatible
   - reg
-- 
2.53.0

