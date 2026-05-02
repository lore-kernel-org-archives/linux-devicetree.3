Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2EB42DECC6
	for <devicetree@vger.kernel.org>; Sat,  2 May 2026 08:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777709278; cv=none; b=PlSe2NuMtd85EVentVgBFs1sPjNrB/+9Xs6yyg/Xs+hz2EhiBAAYkIB0gGNhmQ267aFH+ogyRYXPLAYb4xkb3lQRGq0ephl+d/t0vrDW6bBjc/pD/xlEcSIwTq4UWqhdSWcis4SJW+EnYnqVjsytQpQagJaTKEZWIZDPF6ZMBmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777709278; c=relaxed/simple;
	bh=1jCkH10yYEW6CrEOr84sMFf6zjJPH7zlhT0XCmHYFP4=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fuqERDI57a22GhhSDvjSa+NUy1LSxE1OEs04DMPc9fve2kZbSnexXan8zQ1HAU+ksPNCr9QmE+Ntg7YqpwqkQ/A3c22nLBosEbpASjjCe1cYpnFEaatoAMPgs1ELXsjptz/Y4dwtQ4xT/lRUTgf/nXkesAGcqypFDfc4kiJCanE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=W+K8/JMb; arc=none smtp.client-ip=185.70.43.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="W+K8/JMb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1777709275; x=1777968475;
	bh=pm0yg1XnWCN6qVV/+6F+T0ld+Sbc0pebe5jSdMJUCb4=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=W+K8/JMbNzSgUBuNOFVCky6c0fUCqDd2RG3sBg4QSBTR95Ban2L8VitDpLy0ZnUz2
	 /5oBqHujt1u1UW7VneVbtrIBvdABoGK7mgSG3FJYvDlrWlWZsdn5NRK2KqPo8ct4gE
	 iul4Pn7GkV+psKoI6g+ejmh7uWRYoJwROADC/YQj9GhQfAtl4/crZLu3P9aqrsRS8u
	 xtN9e0wh2LO8DjVjRsBmJazBmRW54k0drAJSRjuuFhjRsgTQw7asnZEBgeBsXhxNW/
	 2Au3Ic5PskRH2yuioLfIs8F5qmK4cPeLFRaEHPpK0MVNs9PXXZy2/eoSKydqrbpk/N
	 Tkoy18cZP39FA==
Date: Sat, 02 May 2026 08:07:49 +0000
To: Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Akhil P Oommen <akhilpo@oss.qualcomm.com>, Bjorn Andersson <andersson@kernel.org>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: Luca Weiss <luca.weiss@fairphone.com>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Koskovich <akoskovich@pm.me>
Subject: [PATCH RFC v5 2/7] dt-bindings: display/msm/gpu: Document A810 GPU
Message-ID: <20260502-adreno-810-v5-2-bc9fd2bb788d@pm.me>
In-Reply-To: <20260502-adreno-810-v5-0-bc9fd2bb788d@pm.me>
References: <20260502-adreno-810-v5-0-bc9fd2bb788d@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: 2e43b084eaa8c12fc5c9aff2925ef31aa6e47048
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
 Documentation/devicetree/bindings/display/msm/gpu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/gpu.yaml b/Docum=
entation/devicetree/bindings/display/msm/gpu.yaml
index 04b2328903ca..1875a3b9f688 100644
--- a/Documentation/devicetree/bindings/display/msm/gpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gpu.yaml
@@ -434,6 +434,7 @@ allOf:
               - qcom,adreno-43050a01
               - qcom,adreno-43050c01
               - qcom,adreno-43051401
+              - qcom,adreno-44010000
=20
     then: # Starting with A6xx, the clocks are usually defined in the GMU =
node
       properties:

--=20
2.53.0


