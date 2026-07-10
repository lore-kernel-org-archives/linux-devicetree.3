Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 967E13DB996
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 09:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783675378; cv=none; b=pVViKQLtkmUBq4DnTj3rtwdqJWur5T1miMu0+Om4uXBh0se1Md2oyXYUZCB8GGxESv3s40BxC/0kmvLs3kN0jCXRBC0bU1ITNV/5y2jXogjEbREJfob8B/RAjFqwIGWZnLOEiECZ8cyk/lBU8BChU/Fp+JM2ursFG8KsrhCyzVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783675378; c=relaxed/simple;
	bh=2/pH/58ZPSVPRJvZYePDwwn0y2ezcvuAOg6I4e2E1hc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iePXDXGxYlQEZu1xDUPL0iXo6VChZtqBGqZvC6UmHasYq86Lx6qV3ATo1cIOK8O1v1DleMlE/B/fCslkKzI8i6Haiw6VH345Zgd8bZeXOeAKRBRNn6gNvnX0H1NE6na/1Z8ptb8jkK94k8uvnYd3puQWe0LbQlNftTyMYMZaYTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=5rRUqhHl; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="5rRUqhHl"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-69531108f25so1120448a12.2
        for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 02:22:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1783675375; x=1784280175; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iUnfFgpx3dZdJM3zV3PHug4HTfilmgNZwXGP6vHMpiQ=;
        b=5rRUqhHl7SM6pxnfM1MmKT1RlmNQ6e8/fPiixj2PM+RS759VgmCUgz82HvjEiDJN4Q
         a2R6Bp9FMOv5V/wR0mXIC2HvuxYiJdoCuMSj6sDP4JKC9TGAVXqG298w95aOVBJSKuLK
         G9IN8aPfrCIEyg6RO/ISWneH5hFVJ3Qw4vJpQM4RljnZVLyiJCeabLL5L9djMp9MRvU1
         y3xrV2ATEzr5pvbrD3UWuR+eRqRjuIqjnpKC8JoGi5J2j2tnn0YqwcDu2Emd/AN+ghDa
         9lFM7o2bA1DYBVCyLQ1qeTm9RVIupGVHPnW1c1yy1CPy7MdoTfPvPrlSqiQVd6ofAzg2
         Xg2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783675375; x=1784280175;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iUnfFgpx3dZdJM3zV3PHug4HTfilmgNZwXGP6vHMpiQ=;
        b=E+dC1Guszt0ayaSbrfgcL4o69XZ33KIwDBq6ORFnTAP7rp1LlfJ6mVdggi42xPBWiz
         cdOYArkLd2wpO1+yLmeshFv/DA28ljwgJgITW/+EUxytTNjbXLt0wyd/5USaWAUd6qoP
         z/bSPc3V14siftZ0ZV6QfOO7hO5MYI5EIvO9vmWJvJNVNtC7f024IeNLPjWg6YuCuhXE
         CMcF36O56U5bKuD63sIC1Hj0F/mGMzLtIBOfQn9OLOhHmWtJHTS9cad5S1Q7e54M6GiG
         P4XxCpy8zkZ/jQLQ7hqcH5C2kyAlQYClEq+wZT0es0GziqA6QgBc8244LRnNvnqn4cbD
         ZCrw==
X-Forwarded-Encrypted: i=1; AHgh+RoRU0a9CAwZUEGlmph1dfJLXy+5Euzhn6C/X44jZzBa7oKo16n1L/YI1y4iV+fmWx673r37POf72ni0@vger.kernel.org
X-Gm-Message-State: AOJu0YwME6KB3bsMMwTAvO77JMfXJBPzBOGqtUCI31YZ73gp1i55WW9R
	pmVeCuJncMYOU6Z8LyMAtSG4eVE+Z7yGrIZrxWOIthmLWRTx3+014NZK5MOnGpxsr2I=
X-Gm-Gg: AfdE7clI8PHTFeHZMgNDkUdrKNMW2muWciI6OMFzBfPQNBiyG+xNuFZ5aKcf57BCZr6
	xAV8Uh1WVYx+q5X/VQFph78GNMaP0BCFJSHadiu864X62w/sXyKrz0MeHcxGkr0hnYBLjC5dwhv
	hfNIX8COemCInBG8wWRFtyGuRCvmVdnF+UaJ9C2wbgBNSDJLjfs1771jR5GlMU59Nuo5Dl8wV3T
	0PLZFU5EuJQ7mmbeylLrIHQzDtSdw1YQSwZ+qtudobSQYUWdDmwW3ZKhC5wIDBRmcSGz3uhxfat
	7CpRDB3FuKN2Er272iyoYznCVtjaCoXkCDRaFepPwhrN7ocNWRBhP0IIjL5gJn5aEoDdVFlV6UU
	H7pZYHyul/JNzNi5K1a6vJ0au3b5fSoCeC6i8gL5l1i9E7XShHYo+b+InVuoTJuh4UDfcHCuXcd
	5gAkzhljEROPg5hyMdDlg3sIWa3T1T1a/41IHbaF2J6TFxNVLzeXBv3vOWc0o9Asc1jrc=
X-Received: by 2002:a17:907:971f:b0:c12:7f25:cc59 with SMTP id a640c23a62f3a-c15ce0ab923mr383566866b.16.1783675374892;
        Fri, 10 Jul 2026 02:22:54 -0700 (PDT)
Received: from [172.16.220.101] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15dfda815dsm261785566b.36.2026.07.10.02.22.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 02:22:54 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 10 Jul 2026 11:22:39 +0200
Subject: [PATCH 1/4] dt-bindings: interconnect: OSM L3: Document Milos OSM
 L3 compatible
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-milos-cpu-opp-v1-1-ae7f4b09bc77@fairphone.com>
References: <20260710-milos-cpu-opp-v1-0-ae7f4b09bc77@fairphone.com>
In-Reply-To: <20260710-milos-cpu-opp-v1-0-ae7f4b09bc77@fairphone.com>
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Sibi Sankar <sibi.sankar@oss.qualcomm.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Alexander Koskovich <akoskovich@pm.me>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783675372; l=823;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=2/pH/58ZPSVPRJvZYePDwwn0y2ezcvuAOg6I4e2E1hc=;
 b=mZje+eL9LnFEwjHLlmoyphuamb10BC+qArdJFGRuLfUvjg0fKeVUXAEx0HydxxY9D0RU6A61U
 iSsZJ2nnMRAAkMGX/QEf0uNPmQyplh7YaCMfQrso3oCzBoGdCKnf6Fp
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Document the OSM L3 found in the Qualcomm Milos SoC.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml b/Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml
index 41b9f758bf8b..17690ff34489 100644
--- a/Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml
+++ b/Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml
@@ -29,6 +29,7 @@ properties:
       - items:
           - enum:
               - qcom,eliza-epss-l3
+              - qcom,milos-epss-l3
               - qcom,sa8775p-epss-l3
               - qcom,sc7280-epss-l3
               - qcom,sc8280xp-epss-l3

-- 
2.55.0

