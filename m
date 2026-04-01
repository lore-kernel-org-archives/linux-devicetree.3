Received: from mail-43103.protonmail.ch (mail-43103.protonmail.ch [185.70.43.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30C371A9F9B
	for <devicetree@vger.kernel.org>; Wed,  1 Apr 2026 02:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.103
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775009829; cv=none; b=dRX9sDw7VTi0zJ1a/ZCMAFkif0cUqH8zBzu1eF0ecuo7SBs2NtNldTOVNqby/TlP9eun91j+ITZvRe7I0Bt+hZO4khakf50s1D8/t+RROcPPCdYYH1ODBCRq52bS3DiYKcfy/3I1FIebahRUo7bwsO8+xvWf6WUhQZqiXUDVA+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775009829; c=relaxed/simple;
	bh=JH2g1PDLQ62EN2TzO844yDEirDhI9/BSGo+X3kunn7s=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aa8xBsxgzQDnMRzRsp6C9J0ZTqlw6HBaFnT5ycGxojHoAcz2cpUizQfP1DFbeuue/aCJ05JQBOcmxsX+NTVvezAszG11IxOIoPTJuq8UcKzLTz37W8bfv9OwBRqHEfROYOzYPachUtes7zJOZBYBT80U5WHRHlLH/YivPgBwK7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=puS8AkyL; arc=none smtp.client-ip=185.70.43.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="puS8AkyL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1775009820; x=1775269020;
	bh=DN6N6QM+hWyI6T9W0zQCxmGO3I8fh0zxMgCzQtQUuu0=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=puS8AkyL89OSKvW1rPr1ateKFi6bHV6aPC2DK3VgIoSTC4tdq/Ycer4PWxyeHdOAU
	 DzCoUYJ8EVUeCukPyFDQlxwCa4dfuA+/bNVxboDgQHJCfTnITisotDcAfSTn54ieHb
	 J6Gbep4iSTJ12tbkCQNkAUDddtvzi6V/2FCQa1kHGhoIVOejp88XOBy66eivVcLfWY
	 1P5xMzwMYacFC2NNhubL0e4z8xNeglSEOaSmOO/WtBqaxYVSW7CJVLaz1WwcI7w+4s
	 /P5cDZkr18ZS1Tu55W057lN56vRYr2lNJVH6UHgjqHge8NBRRSW0Qf65JO0dGrWC43
	 4uaU1lLxFVozw==
Date: Wed, 01 Apr 2026 02:16:54 +0000
To: Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Akhil P Oommen <akhilpo@oss.qualcomm.com>, Bjorn Andersson <andersson@kernel.org>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: Luca Weiss <luca.weiss@fairphone.com>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Koskovich <akoskovich@pm.me>
Subject: [PATCH 1/6] dt-bindings: display/msm/gmu: Document Adreno 810 GMU
Message-ID: <20260331-adreno-810-v1-1-725801dbb12b@pm.me>
In-Reply-To: <20260331-adreno-810-v1-0-725801dbb12b@pm.me>
References: <20260331-adreno-810-v1-0-725801dbb12b@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: 7233420edea383dfc51c8dcb5b4ddc11a8e24f9a
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Document Adreno 810 GMU in the dt-binding specification.

Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
---
 .../devicetree/bindings/display/msm/gmu.yaml       | 32 ++++++++++++++++++=
++++
 1 file changed, 32 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/gmu.yaml b/Docum=
entation/devicetree/bindings/display/msm/gmu.yaml
index e32056ae0f5d..2853f6aef966 100644
--- a/Documentation/devicetree/bindings/display/msm/gmu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gmu.yaml
@@ -299,6 +299,38 @@ allOf:
       required:
         - qcom,qmp
=20
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,adreno-gmu-810.0
+    then:
+      properties:
+        reg:
+          items:
+            - description: Core GMU registers
+        reg-names:
+          items:
+            - const: gmu
+        clocks:
+          items:
+            - description: GPU AHB clock
+            - description: GMU clock
+            - description: GPU CX clock
+            - description: GPU AXI clock
+            - description: GPU MEMNOC clock
+            - description: GMU HUB clock
+            - description: GPUSS DEMET clock
+        clock-names:
+          items:
+            - const: ahb
+            - const: gmu
+            - const: cxo
+            - const: axi
+            - const: memnoc
+            - const: hub
+            - const: demet
+
   - if:
       properties:
         compatible:

--=20
2.53.0


