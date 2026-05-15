Received: from mail-244103.protonmail.ch (mail-244103.protonmail.ch [109.224.244.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 342122868B4
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 05:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.103
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778822307; cv=none; b=Q+UfeLqpdZjjWhnmzFOeHzVCVNfkjcHsxcYQJ2HaeORr0laBsmEgcHBKW1zZj3M2MMvHoJ4PhglbGzV9Z5kY+mykfwhFRRIEjkGLtjBzRvs2nJQB5TPiKMeyZEz2/tzGiVOO3IKmuhsjV6g/WALJp3oyDP85X5jRaR6qT9Qz4jA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778822307; c=relaxed/simple;
	bh=Azu0XRvCkmyNZahZrQEaamecpEr5Ild99+NQ1TvFI00=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kgOKMulHLiZ/Yl9iAYpeey0CZb8DMUG2yqzYHJwdCUgwwT+cWFCvljCPoZ6KiAoqinKEtDJc+jKCCDkMpuEewB0iEYTXj4rGc5qIVWT1E/4SSKcj15+rf8qoXGKBcISMwkQ+bmjdGM4pA66VsJD6MxnY3yD7n0WvQJTxP7oEe0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=gefiTsHB; arc=none smtp.client-ip=109.224.244.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="gefiTsHB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1778821719; x=1779080919;
	bh=tTGGp9tpW+UaiFNc212qlp/NLmpaLC1hIuxmeV+7WaU=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=gefiTsHB9uSN8S6Bthb4UwZHzXrD6hE1hsyGiLaqCqmTodq0Y5uzph2XBz+lg+Ws3
	 T62B8hdJvXPbju4/D1lH15eiiUsWKl1D9eDfvM5gjECfWbXSjuVbZ3boDN5J6MxzzY
	 wRYj4pTeVjxoByxkcQ04RFVaImo7rCiKBn09tx3nQ4YPzVjh3elAzk4ARwKQUkW+Pn
	 63LsFGeRbPyxKC69xMwuBRZIBUogkrDkQtAp0D45dFNwfdPyAXPNslObmv3HyzuX9g
	 /6Wc1x3TZzubjnOWfR03QxEbuFYWbcuBRq3Gq9BMA81cSCODgkjSq79KW9BY8GhfJg
	 QuPhWZ4O6fAQQ==
Date: Fri, 15 May 2026 05:08:35 +0000
To: Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Akhil P Oommen <akhilpo@oss.qualcomm.com>, Bjorn Andersson <andersson@kernel.org>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: Luca Weiss <luca.weiss@fairphone.com>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Koskovich <akoskovich@pm.me>
Subject: [PATCH RFC v6 2/7] dt-bindings: display/msm/gpu: Document Adreno 810 GPU
Message-ID: <20260515-adreno-810-v6-2-fbe04c7203e1@pm.me>
In-Reply-To: <20260515-adreno-810-v6-0-fbe04c7203e1@pm.me>
References: <20260515-adreno-810-v6-0-fbe04c7203e1@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: 28d789b8b45c78c3903495463b1d0d9f6703e962
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Document the GPU compatible string used for the Adreno 810.

Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
---
 Documentation/devicetree/bindings/display/msm/gpu.yaml | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/gpu.yaml b/Docum=
entation/devicetree/bindings/display/msm/gpu.yaml
index e67cd708dda2..1ee2f1d57f12 100644
--- a/Documentation/devicetree/bindings/display/msm/gpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gpu.yaml
@@ -415,7 +415,9 @@ allOf:
       properties:
         compatible:
           contains:
-            const: qcom,adreno-44070001
+            enum:
+              - qcom,adreno-44010000
+              - qcom,adreno-44070001
     then:
       properties:
         reg:
@@ -450,6 +452,7 @@ allOf:
               - qcom,adreno-43050a01
               - qcom,adreno-43050c01
               - qcom,adreno-43051401
+              - qcom,adreno-44010000
               - qcom,adreno-44070001
=20
     then: # Starting with A6xx, the clocks are usually defined in the GMU =
node

--=20
2.53.0


