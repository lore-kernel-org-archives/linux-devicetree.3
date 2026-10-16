Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE5084825BD
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 12:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792154065; cv=none; b=G4qt84uMcjPMc8a4E/5uanZQz8FPqmx/FDune3tssMOYtxcBVWdrsS5J7B+CRez+6KEFWqTcMHnRfA5h1YPKvPlGn/HMsEsb/a2kyTyrQFVn/YH2XcXR4+0/bgBvfrQcS/Va5HaurDYM8kKPu+aG4mYOsCGvz4B0gU4yz31x0SQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792154065; c=relaxed/simple;
	bh=618lZEj4J6PxaEmGpFoPKRIGN5uod/rBxdxIH2fNG/E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DcnW5sTK4HhoaK1Irt894TdatCHXQTdpZ9Ag1zjFCkd2zQ/3C5ptq9NFKtWt0/ClVbAFqz2fnaU8UoKh8OKIRlCteZlvTRuDDLWsbKxdSPwF5FBaXbVWJEtenLeTzI/9kSyu9KmU8TS8uBpTjCbL8/9X30KjAU8xzd9oo6aa9Ns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com; spf=pass smtp.mailfrom=konsulko.com; dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b=f08JKKpU; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=konsulko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="f08JKKpU"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-49fbb2acc90so55366715e9.2
        for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 05:34:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1792154062; x=1792758862; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j6Xglxzig/oF1VgPKgOC631Csxaxo7kJhuv3JvcuV7I=;
        b=f08JKKpUZy5m4A8XBxVUMrcjJ/UZlUq5mAnCgdotTXtwCPET7tUVmBZENlYjK0Fouu
         B+n0am0fjG+e45dG+4NMmiWJZEdOcr2JyW+TTQONTlNd/Zu8ASrC+4TsUWFI9gfj+7aI
         OVlSVghk+So5WtaBKBTniQQt/4EV404TrXhFE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792154062; x=1792758862;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=j6Xglxzig/oF1VgPKgOC631Csxaxo7kJhuv3JvcuV7I=;
        b=LX7AQsKaYHC+tU1MB3xscya/8J2bIaLlAf/HhkWbvbnAn6akAgfrYbjTehq8oaSZrL
         fwRXq2kK9QhAs6SFQIR9x0q26dv/MgCqa56f6ZNh8L6VVCRJMPgW61LYaAan5yPG4Gqh
         Rrkf/TRc6lOcdMBp5e0yWUryY30MujsZXBhj3Fa1EAwIQN78lBKu//uAIWG/PieSi/Dx
         Jcjkh4MEClcn0JpAammiWTmxaFcEZ4pzFaN5TylF8fNyZI86880SbXFnu5Kv3GriKrJb
         1h+unVZjMhHJe/I6SeyztBObEUjxRgGcFF+AoPAD2H7TA3vM/mJ02Iz4PduVBPQ/5hqi
         q0Uw==
X-Gm-Message-State: AFq9FYJSrFqsyD58jHmb5LRjf1UolR82sdMDiSCF+clX51IzeXhbRhhX
	2jvMm3yOiHS1Un2ZAX6RXV0mcs5jRtzBo40wYpNHOjAslIxZvRf4KNvINa42w/sMbcS5a5VPusJ
	1oWr0
X-Gm-Gg: AYBFou0rvzyw60T8CVYrCAfZsoDFaviblTqGvn6KkYvY0lY0IeZtVBCb18U3wUEFX/j
	Sp/auTwqtE0BmHquTEpGRO4UE0BLszSLXTJUU1jIisepxebjHq07zXyB33bF66JRTP3U6G2491/
	7AigsYp3sOT5A4Nz+KuR6hG2Qxm3GGoBaSvyLKXwByPlcZxeBS6DEKsHjGLS0FcBse6EyRbhc0l
	XefNnl2R4twla6xOrgZaklyt9z7x2ZnRJLSOTQy+hFXgvV7dehLoG+oE8olxZm0A1FtMeJHgLcC
	K1uzsz4QI9JZDpn8Dpea0DqpdClBZRkLmvFljXIjAPTZ5Tgx0oZHy+6uorPFQ88VMB4tP44WIU6
	IQmQZX7V4yEzuzzJNgUjS6rGo5EoX1PQt5itoYP02UO5fcGhqO+indH+E0HBKM4hWjyaL0QMqu1
	0Q4SRk+Q2pgqjXx/X+f7kmTRfJY8E7uKLYUI+lckwHeWQWKHCUSiRDOPrnN7XXdK+F4mt/CfuSV
	jrdO7XvzjkzkSS0fdZTNxkfMg==
X-Received: by 2002:a05:600c:4689:b0:4a0:1cfd:321 with SMTP id 5b1f17b1804b1-4a18e4a9b31mr474493465e9.12.1792154062068;
        Fri, 16 Oct 2026 05:34:22 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1c8a81587sm110564045e9.1.2026.10.16.05.34.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 05:34:21 -0700 (PDT)
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
Subject: [PATCH v12 1/3] dt-bindings: vendor-prefixes: add Draeger AG
Date: Fri, 16 Oct 2026 15:34:12 +0300
Message-ID: <20261016123415.3272046-2-petko.manolov@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261016123415.3272046-1-petko.manolov@konsulko.com>
References: <20261016123415.3272046-1-petko.manolov@konsulko.com>
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

