Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16B913BE15D
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 14:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792076297; cv=none; b=NqdSDw0ycsPep63Dnu1uN9N2AaNt2CiAogOZgdbKX2FpektEerKZwvYhrUgGcK46VL/94YUouqlDhEtqQpUMqXP2e6W+PAzEx1vnJf22TfwZ5gWYskxR5weGX6Y6o11af0W8bEtQUvMT+9A/wmVY9BmU/6zPyKusdPjAtvLguBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792076297; c=relaxed/simple;
	bh=618lZEj4J6PxaEmGpFoPKRIGN5uod/rBxdxIH2fNG/E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pf75FSQcy1lPMYOFBXmHld2WYhidwPkwRmlWwyfau+/6NxvqujNPGttR0qyxSkIyoMR0123orQh0rnUblkkXpErLeUZ5omxxmciVWXBtgy3rDFaKSixJbO8jhFfu58BTbQ/C6QJlkaWJK71gsHnwajm4Zekx0rPoi7H3prHy/Vg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com; spf=pass smtp.mailfrom=konsulko.com; dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b=RZOFHwxc; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=konsulko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="RZOFHwxc"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a018dc1f98so43751475e9.3
        for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 07:58:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1792076293; x=1792681093; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j6Xglxzig/oF1VgPKgOC631Csxaxo7kJhuv3JvcuV7I=;
        b=RZOFHwxcl5wivM/frhSzzW/LCl6azaP3euEsLTahtSLEjCnQKr9G4DeKls4BOScV9k
         DFix4BBh1yA8U+AM2T7mwPEvTFho8HdqZ7nwfA1d3k4GwNHfEWt9nnzoqZsn99iVxSXZ
         XBK4t1+Fkz8xMYTXmM3Ukt1hwERx5dHtGi1+8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792076293; x=1792681093;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=j6Xglxzig/oF1VgPKgOC631Csxaxo7kJhuv3JvcuV7I=;
        b=sslvtS/MGEmwmkgBmpojuuIZIQrMXObZ7fjs0KhGXuI3j7QCsjAG1HWDVGNdzooqkD
         p2vSb/hn0duN0FxvlLAxBtbSn8yVRz6PHAIaSJEx0IN66tfM0Sicp/C+zC7WULKrDHrz
         DQVhZuTXDd+dDvfaWN3BTh17r3CvDxGRhjtXmFR4Jl0MVyrImHxlSSNLDF3gZzg80Pw6
         misJFrQVQCyEh2EhXv3J/aTjGoPik2E9sq96TiTNmHA0Tj0OUVOqmfTrKiIYb9l+/4H+
         Vi0Z4A3Z0XUegfaJA21ERZxM6vgDPUS6y8cFzlI6y28S+YT4rC5ro5Aw50GEhsZr08uM
         gyZw==
X-Gm-Message-State: AFq9FYJLqxP+FSG+xYa3I1WUT88S5e9HQiYAwD9SI/0+UzVL94N6m+Bo
	8NIGUmjYBRMwRWZqaHKvkz7DMQJZ30XJZn1H6TYbLb54OBWTdqrzQpdhKVzJdETbiUQ=
X-Gm-Gg: AYBFou25ScUd/TB3bhKNpsh03Sr+IIrjyKrONtXwSyejr3G0a7NQ2ZKLpvggKhx0hyz
	Ivd41t/J0AZ+3w9P2qzpgFeDRxCHu6NbZC1s+/417IXzQXrGYg19hD82zODdBWCAFOa/RFWO3dR
	YEBw4d38KJ4IuKnyjjLhjiea+KtGahpTLi+N/uFk3BuGLrMtBS/J9VKUnM4vEvkAobwwNj5wqPS
	cjhaSsZI4vBBFZZGKf78YUNkW9+MmFuFgc7Z/V2Q3FsbzHgAhXT2dQzX5lyGlUfI7cvyg0lngtZ
	DRtHVRBr2VCfE6ZplrG2kGpdz+hyd1xq87me7Xm3kRUWVm0+frgkaI7CFwxzMZijuJoTC2vCPNJ
	QRTKhsfGfZaGL/AkK8fh9KqnWJckNd5OalSJxA8yO2ekwRHIMkMJjO5L3f0u+kzAHAyn6Oi8y92
	FpZAdNhEgJsPWvJ4AQiBoWABbwmpga+VSYVh47MS6sImZY8YuxMHk24bljndXr9zr3IpWbF2rUn
	TOfw6gPooheF5E=
X-Received: by 2002:a05:600c:19cd:b0:4a1:80d8:aedb with SMTP id 5b1f17b1804b1-4a18e49d9eamr395054165e9.11.1792076292071;
        Thu, 15 Oct 2026 07:58:12 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd97ed33sm88053985e9.5.2026.10.15.07.58.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 07:58:11 -0700 (PDT)
From: Petko Manolov <petko.manolov@konsulko.com>
To: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dinguyen@kernel.org,
	arnemaximilian.richter@draeger.com,
	martynas.grybauskas@draeger.com,
	Petko Manolov <petko.manolov@konsulko.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v11 1/3] dt-bindings: vendor-prefixes: add Draeger AG
Date: Thu, 15 Oct 2026 17:58:01 +0300
Message-ID: <20261015145804.3632839-2-petko.manolov@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261015145804.3632839-1-petko.manolov@konsulko.com>
References: <20261015145804.3632839-1-petko.manolov@konsulko.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a vendor prefix for Draegar AG, which is Draegerwerk AG & Co. KGaA
Link: https://www.draeger.com/de_de/Home

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Petko Manolov <petko.manolov@konsulko.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index ba2002969373..276d62b848d5 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -467,6 +467,8 @@ patternProperties:
     description: DPTechnics
   "^dptel,.*":
     description: Guangdong Dapu Telecom Co., Ltd.
+  "^draeger,.*":
+    description: Draegerwerk AG & Co. KGaA
   "^dragino,.*":
     description: Dragino Technology Co., Limited
   "^dream,.*":
-- 
2.47.3

