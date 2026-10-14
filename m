Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBD5C42901D
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 13:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791982959; cv=none; b=j4U6M0GjIIRjHQDL9y6bsJFlEwWqLGwMbdEv/w/wyiMJAXDP1zKgRdc9T11x8LUPDaQWRHgd//lxEeico+L/eoH2kx2PvZHv1SbLORWTQWxl81aXJGmUXnTV/JzaLXucXoe3fxez5+ApdZxEoYPD8IwMsvp5C/vZP5vekQ4GcN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791982959; c=relaxed/simple;
	bh=618lZEj4J6PxaEmGpFoPKRIGN5uod/rBxdxIH2fNG/E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AALITpTahRbfA+qgK4R1M/6hETN156k68LNtKzFkU0YChf7oei3z4SkowPA8SpR2EqU5Jf2aF1AynS5s98luPGAGSlF297h8je/fak1xpIF/S95posWloOmAAOaGMXGX3nGPpnqjATOIM15Gly3MQH9Po0dBzaqGizXS0SZyL2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com; spf=pass smtp.mailfrom=konsulko.com; dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b=orjDfi9e; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=konsulko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="orjDfi9e"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a180fbeef5so37201375e9.1
        for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 06:02:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1791982956; x=1792587756; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j6Xglxzig/oF1VgPKgOC631Csxaxo7kJhuv3JvcuV7I=;
        b=orjDfi9eWorHE/KfDG4kaaZ7XN2q1+XnDDtZVmI9v5CKru0IcCKvZjcsK1/Vj5rnlH
         28PxJBDORxfHb1/0s6kiXdOGkk5eEm5360KW/iympZFJ8a/yH9bctOmhX4s1Qyrl0V1s
         +8RghXgBgTe8IP0Of/TH4TNB1nNHtAsbYV6mk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791982956; x=1792587756;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=j6Xglxzig/oF1VgPKgOC631Csxaxo7kJhuv3JvcuV7I=;
        b=WrCcFv9wxePZeHbnVXVhqySh8hnOg07oATqd95CFtSwiw2EiZbxolbS8gC6O10dpaL
         mxLKL4EkgrbvlGAx52e+21KqB/NGw1J0G4YBlZSefzpALkB6KVqUKP75BesFrxzZtXOx
         ywjZqxuT1vfSnxg8h9u/OiOCAVUm9u++TVDwGxN+c9GW/Kc/rGKXgVQGkN8YfLPSLND5
         sgsPqxihBFt9NKp01JMHohfs2K0sqN8mUeJ6AeBuOb3hU6GJ4TiYBgREUfGqNQvw7jOr
         ZDJ68OdqHdJ4h8SnGrEHzIaj3+7PfNjya/VVSWUDZ56fC1fOaGQXJPDQhkwzKJs2Q8w4
         6Udw==
X-Gm-Message-State: AFq9FYIC/2NZqyJwZ1tQriuyArs5c0ROv6wrCc46tbqYqVVWizdoCBDU
	GFpRIUuKiQFgXy5aTDMZ99bW5wMQYeYg3SguA7z9PwrkQksPQM6khGGwQsv3Pl8xut4=
X-Gm-Gg: AYBFou0DAteuRWF4KheF1d116QdGO0cAGXLZITwpWlmt4q6glAhchOetZ7Ny73cU5KP
	fLl0RVNfvNI7MBSnyika9XPSnwVE/XgkZRA+/j04TRikE+3TR+AA4RxtixewNOQoTGVutxxQWIh
	ih/l7+Agn9eMuR9kvtAmeasWL/0InCaqqQ9kDRb7AOLVDcoU4O3DsAYgvFKNcOJZkTM/MsSkFMM
	hrtW6VvfnRLmzY36Amaq4DnGKd/+hP0VKT8yuyDb1T6QTpZevffSjm0b23PlBhQjVfrVxcGlEiR
	hkF5SHCyosAg4KIEeVwOjj1yv3q+JlT4TqvZZD0jDgtMn+ICVzFReU1tobsqZ+SwY8WNGJXzj4F
	JXYKWcKFzvqo/zYVp8Pe+jZmxtKc0bp/rcLw58QC0gb2wzA4tmpMfxwnNKdvqaoeOyYt4Dx6PCR
	dRCkHOAphMj9aoxW6XDkY+jyEUG6hkNWW/GojW0V9CosCNgwg+lG+RTwV9PsrZK/nX+sidQl8fk
	axm4H5h7HUeCWg=
X-Received: by 2002:a05:600c:580b:b0:4a1:688d:a43f with SMTP id 5b1f17b1804b1-4a18e4c9908mr226269495e9.35.1791982955907;
        Wed, 14 Oct 2026 06:02:35 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0ab5b03sm12608292f8f.30.2026.10.14.06.02.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 06:02:35 -0700 (PDT)
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
Subject: [PATCH v9 1/3] dt-bindings: vendor-prefixes: add Draeger AG
Date: Wed, 14 Oct 2026 16:02:24 +0300
Message-ID: <20261014130228.2780803-2-petko.manolov@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261014130228.2780803-1-petko.manolov@konsulko.com>
References: <20261014130228.2780803-1-petko.manolov@konsulko.com>
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

