Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33EBE3C871E
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 13:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784295262; cv=none; b=HmPePStbIttaYVCFJyy8HQM/GHI21nOzfRDuUTxV0Ipiw0qTBc8DYNAcaJmmnHYv7QT/Cva/KPMfKSMpoWhfyKjArBN6NVAqMPII8lNsixt6fXHbgCTK5kyO99vLivJu6SW35QE8edKrXEao0uiRVHeE1UfkWOTldMjMctw4eAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784295262; c=relaxed/simple;
	bh=HFSTrk43zyzNsRY27xvVNkH801KFPO7/o86KOmtZ658=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jnjvxVKk8gavyilpMezb9Fkq9nxorJRzih5CHzWsiSs3RZv+gMhaH3tIRRHd6BhaMaHwZ2r2+AoNBSjO8Sb89BItzw7toG4HJArAOlwTV2wEgW3/XosLbwMpk1hNPDrrKMI/p0dLE3qULhn41o+h6gWNfPKq0jeJLKbfWCt1vKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=u1XAOXeu; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="u1XAOXeu"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-47de008b020so1229201f8f.1
        for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 06:34:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1784295256; x=1784900056; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uaEStTJIwB/dkXeiJZfpbyBGFPs+1/VB2GuZupuIQfc=;
        b=u1XAOXeu8ZemaSc/EZLGbVVnPhLts63CFqmQmf9M55vK8AdMJWqPnwJQPaiDebpQmM
         F4fvLLtnJBEPZGxNZpY6uC6uLTmyVdyMhBxZSwCjdh3tLi0W33S2NqA+bGL5OPkeWI99
         /gy/s4a9sXSC42IzZL/aRkNNacp4E59OlGNi1SzmZz/6xQ63bGMuK0mHd7PQOPFkpisP
         5KKyBxUTrczpu1yzOA4727wyT6FeZof+AbAcuaLJU/sUGdRr59yiiATtUH1Uwcc8x3+S
         AwLdV7zZ4vgid0pC1gq5tE7JwN/EWYd2yq0rW/8YNw8Jij57z62XCg9NuONtvFsC4SrO
         9UaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784295256; x=1784900056;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uaEStTJIwB/dkXeiJZfpbyBGFPs+1/VB2GuZupuIQfc=;
        b=Nb5n1OTp1zJcWkLGb1LJZK12cSifn/DYQ4z+pjzjt/s/x6IfK2NhGFvh7m7OwXXWKg
         Ik0FPcPh8vTCzl4s67EGpv9xkFdZww/eAEJ5k83t+UVXWtIqWBSOqyQrJnu1/unK6ndY
         D8HypyPobRxjHKzt3tkobtRuVGf44WSRvZyhoPPN1bSQcEnwrNBJcy96zzFK1wHAJ4op
         Vx6qp0jUv2yhCngr035I74GT0dIPZPkHuoQw8hbsAmxxkC2VhJ6zqKIa7cXPKZVHWNS5
         Lqu0bUpJJRNbhHacWEMLPW8LxruMj27EecLhxOkcUDPoLBvetW67s6faAV1UDb+2w4dQ
         iHwA==
X-Forwarded-Encrypted: i=1; AHgh+Rohm5QoIcBV0bhHQ2b+ipM400hs58rE0ayuCIdJlO7YI5C0TlgcvwC/u2GNUGiDOA0kqD1jSGUdXq4p@vger.kernel.org
X-Gm-Message-State: AOJu0YyfTCs36gSiUmLrBTLv8OaLMSxAuiMtWyomGsdozYIUjUHHL4Cc
	ybMWl0ZhgaUscVSRpJLAx8ERwgeCzsLC1VptHKbLNDBkDWgkUmJPqeZHc4DVqDYIqc4=
X-Gm-Gg: AfdE7clTLjiQX8Hj+mMHCg/Fapcylvf89tKZaI2T7Q2AYQ+a9hCQKehwRQh3Kj9jDgv
	AXZ0XVmXIhBlgQZSU+3RCVAwehGHRsFQdZT/HRDZHnYCClycxs36975HpA0zKOCYOaM72ZjJ42l
	G8CfVwdAUJMWwMOlTdjbVHf/rPs0P+b5+Kh5A8zmC1LS+aGMQg59SASk4qi6H++Vv9geZbXoWHr
	q3h9M5enrjCbkYKEhSnMvR+YqWf4plcRfaxMphgmtYjUCml1DgqkEBhOLbLAJuexVJNehElMBnW
	gs/SNjC5GEOfv0PhRI5Im/pwNB36Ae7OBbsxteIp4aFuVPk7W8mKErlbSQ7N8KEA06S+2baSkwy
	O3Sz9jTOUnEDPJRThUFiNy4OgMc7H62MQhh/hLlWQFkXfe1zTfIWtsm6uUQEx/MZc/Xs3CekmfQ
	kSva6TSEgEdCTq8IA=
X-Received: by 2002:a05:6000:430b:b0:478:3df9:5d8c with SMTP id ffacd0b85a97d-47f5a4197e4mr9380422f8f.2.1784295256462;
        Fri, 17 Jul 2026 06:34:16 -0700 (PDT)
Received: from [172.18.170.139] ([185.104.138.147])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f63e49ab8sm4361547f8f.5.2026.07.17.06.34.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 06:34:16 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 17 Jul 2026 15:33:03 +0200
Subject: [PATCH v2 1/2] dt-bindings: interconnect: OSM L3: Document Milos
 OSM L3 compatible
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260717-milos-cpu-opp-v2-1-428813fafd52@fairphone.com>
References: <20260717-milos-cpu-opp-v2-0-428813fafd52@fairphone.com>
In-Reply-To: <20260717-milos-cpu-opp-v2-0-428813fafd52@fairphone.com>
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
 Luca Weiss <luca.weiss@fairphone.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784295239; l=893;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=HFSTrk43zyzNsRY27xvVNkH801KFPO7/o86KOmtZ658=;
 b=/t1sZp8Zx+PC4pDijJkMxs119lQoymRHzjhpNhzRRiFpi0uwSLJpXkz/a+ta6tM0XuibepT7N
 MYF66BCUTRiD4et4OkbzF1uWI0FnWLHu1kL5k7/8Em3RM//kDbGCyr8
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Document the OSM L3 found in the Qualcomm Milos SoC.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
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

