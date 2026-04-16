Received: from mail-106119.protonmail.ch (mail-106119.protonmail.ch [79.135.106.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBDAA3A0B31;
	Thu, 16 Apr 2026 11:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.119
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776337511; cv=none; b=MbaHIUgfSZCy069GC+FR25ziUNcYvwDAHZ21q9CToCDinp9iuHgGgNq20boABDdH2J1wPzvyLdxvRm1hc75uMz6VGgCbynxYse8eqMtUZjfcRqkytnNE2lULugFaf9m/tCPd8UPgNSFJIoOgaUdA3n12yUarFgph2V7vV26UyQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776337511; c=relaxed/simple;
	bh=1jCkH10yYEW6CrEOr84sMFf6zjJPH7zlhT0XCmHYFP4=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=K3G7kphmD7jAS6HuKA8k2Yae8lsKvGZIKruoCTzDrv9BMfSQmoK63d53pkV96PP4iJQsZI+FUBIVoFSDRYiFPr8Q9y7Cohvf95rtdM0ngn9XKt2sTDrIlvuKCjRpEgHrTj2yi7Ivqq6UcMQHboeQL8V3SuPaSBCsRfXIl2Xd90M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=dVlODALS; arc=none smtp.client-ip=79.135.106.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="dVlODALS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1776337508; x=1776596708;
	bh=pm0yg1XnWCN6qVV/+6F+T0ld+Sbc0pebe5jSdMJUCb4=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=dVlODALSIWHhtShcE2sLY3Y6DYlyZEBijcDBSiepCBrkFeAE/gXQoIH7CRGQg5A5t
	 BcsGUXA1OR97h/qpRi9Sg2qhuPuvywjFAQ7MF52edyaXQIB2Gx4rlzRle5wzq4tI5i
	 M/RwsT9kF7ycw8ye7IlTOnIi/N1Soz1m4O0A6NTDLkOt6qTqBoTQKzhEabyP+lV3zH
	 vKz0KU104fTk1uxyDTuUGTvufRTTO5lgJH456zVWCRgQx4KTb20t57w4xxc7AKuIoq
	 mA1aM7mOfC6YzDmfiWrojirzF4Wn7Xy+3cHpHKeQu4qlnY943QV0aewWPj7G98EtST
	 aehP9p3g+GZRQ==
Date: Thu, 16 Apr 2026 11:05:02 +0000
To: Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Akhil P Oommen <akhilpo@oss.qualcomm.com>, Bjorn Andersson <andersson@kernel.org>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: Luca Weiss <luca.weiss@fairphone.com>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Koskovich <akoskovich@pm.me>
Subject: [PATCH RFC v4 2/7] dt-bindings: display/msm/gpu: Document A810 GPU
Message-ID: <20260416-adreno-810-v4-2-61676e073f8a@pm.me>
In-Reply-To: <20260416-adreno-810-v4-0-61676e073f8a@pm.me>
References: <20260416-adreno-810-v4-0-61676e073f8a@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: 5023327bad91fcafe3c860e3384d4e02c7866b58
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


