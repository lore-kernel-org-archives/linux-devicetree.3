Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DA142874F5
	for <devicetree@vger.kernel.org>; Sun, 22 Mar 2026 16:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774195715; cv=none; b=u/Y6K4UEh6iLdY5U8+VFOSCFqf3EO75tL2DB/3vv5OI33k1sRA/5FyGka1rbFmu7dPUcAHYZpqIjUIDQceCgEN1tluF7KKNz8s0jjY1ZpTXP4xbZgrkERpgepJKUJOBUq7uh4q4d/M2B6n6+Y3jvBe8mb7HelQOXJweCkiQtVDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774195715; c=relaxed/simple;
	bh=jE9FNOCU8b2m2ObI02k/Oi7LT+HXOk9Tf6MxJK4jxJo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=em+hjVZlyXz0RoocPR7IYaElYNxuzhW7XRvzsJejd5r0XtN5YW2zndVOV4dQSHJ2GIekEC9KhALUJsMaczdtRwcW1YVF0S5Rd8ZyOnOiDK8y+pZUWnrFhn/oIqAG6DxIYWuTbEqUCJisNQhNF0D1bghlpZnWGxZDP9udpOcECY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SgtbT+yY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ghwH3whm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SgtbT+yY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ghwH3whm"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62M7D8tt2641012
	for <devicetree@vger.kernel.org>; Sun, 22 Mar 2026 16:08:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=HlCWhmkj5gP9XX0ujtsUnl
	pIDxpAr0Opxk5NjgaFC5k=; b=SgtbT+yYVxq3L5e7gq/zGDSR01oeTq4ZRB0IoF
	fVs8hyVQ0lCMqyE5iii8b4y5ziR6P6eM863CqoJlbxGQKF+fLBlp2atZnhNee9Lx
	UMpl76gp7hz02VzsYM/4zAucWLNj+leWzgdtbZTzoIvreIikpAZJ3YpSbVLRtB3o
	zFO4BTdmlxo6sVKCed4bScXx8Q3lXZBmXxtx8sid8xj7S0+Geu8urS9P2V1Xw093
	tEZ82rHiEaKrRysmUP0TLxjHMZtnHBU/LuUhKzuE22cYqEWPg203MuuoOEyshBVM
	bKewIK7dlrMKM4GGBDL0vPc6wzoQuXjqlcNY9uCCfuC5G6kw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1h1e2t2b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 22 Mar 2026 16:08:32 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b469e5543so13723421cf.1
        for <devicetree@vger.kernel.org>; Sun, 22 Mar 2026 09:08:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774195712; x=1774800512; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HlCWhmkj5gP9XX0ujtsUnlpIDxpAr0Opxk5NjgaFC5k=;
        b=ghwH3whmH7PkY4tMls2rTSbJvm5j8u8+dY+hvDssu7V8xYqHDI3LdmrUNsYVgLu588
         HUHKpZqi6/HXs2lx8Rj56jYOuXZ78VAuaIbfbg6WO/SxgZtebyYFwpNEeGXrokaeSIXt
         yF2Mz2ea2T/I9yOlluYqYjNW2UcvOX/42dFTKFv7CtMSV/QHCBKeD+1HvUcQMg/wz/2i
         REBd5ykTdCH9dYFGwrEytm1e5DPnl6cJ8Qjixa/EAxfZ8zIwOCjjVHY87idTNklQaBMc
         G0yOu0dZQQipNdwYfzEeCyhy05emTlAaGkn5j//eHDkBc7/E2gIWeNE9cKWATKJN7AWD
         X8cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774195712; x=1774800512;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HlCWhmkj5gP9XX0ujtsUnlpIDxpAr0Opxk5NjgaFC5k=;
        b=N/p3ZSbGkAJhR+SqMrFe92UiykxkeKW978K3kSj1Tgbvf5mqLqm/CbxbZ8kX8/JI1q
         SAEvS1JX3oDbWWvJ8s3g9/2Cfy0QyvYbdSAKAmqsNFt23LYkyD8Y3XIkAub0dGExnucp
         dObyKUki9AOAGc1yiJRD/LtZwmce69ht0SzwTJfzTJAn+PuAbC2evu/Aahp/o4GZMNNR
         Vr4ZNazGSO5o0+iwqgkW7EqUI48fQC7NJ7RpxPOHA4vQPU76kDV4PusylL3nkp9JnVVm
         VZjx+GejXVNEsQ/SHUu5A86EOG9+2u0OsQ172rwIjUKdPVve+GYDhM0k2XU7T0bjhICj
         foxw==
X-Forwarded-Encrypted: i=1; AJvYcCWlsGXuZ5w79eWITjvBt+Z3ZOFGkgZATkZKSkbyM1hymygTYKTs4aPUbN8ley0a7SG5i6sCwOxLnHdy@vger.kernel.org
X-Gm-Message-State: AOJu0YxMqXJrIRAXpzeGxAkOjP6GPYa+fnY3yvdI0vV6UBLj8nvXTHTq
	YDtlKQZ3/T4QftwCE2pS3ZKxe2h9RR0aUa03HbYmoTWWIg62RKjyNk+kcG5/jm491Fu9XSdITOC
	jnGo3PtPYum3Ah3foIYGvKPk9jsNn3ynFgnQUM9MgO6CibkV9DD+E8xpPY9vIw6Un
X-Gm-Gg: ATEYQzynlLWenILjkFoYZ8VSGhiEv5bo03H5WFNv2/Ou/7dXmPUUudHBktTtDeBULQa
	Mo8jqpg5Fqt66hTxLtNPiZ3Ka+rm3KufZFuKYm94Z+JQpquGLIz76+W3upe2hrcpl4dMoyC8Jy9
	kT8bQZ6ZfMajzNGAOMmnPeU6htyvDy4VQr1Yi8IyxElMLnZVeRYlHTlNYV1eMSjni8Z5B9RtUsZ
	G7Hptw0jI9egW1rSCTFbcpc8Oxj6PviOKgshBifSpPHPNvFelso6AmddD59x6it1DjTz6BkjsDi
	xUxiL4+FhKNgf6qsC209b5WlbXOb7QJRhJUu3WW+XphwdYtqKzNuh1jzDF58QpSyd1Eb1nh7tyC
	vF8WkjMTJGFGJnBvv4SYomLcbaUc=
X-Received: by 2002:a05:622a:4:b0:50b:52ee:62b6 with SMTP id d75a77b69052e-50b52ee68f1mr42448081cf.38.1774195711630;
        Sun, 22 Mar 2026 09:08:31 -0700 (PDT)
X-Received: by 2002:a05:622a:4:b0:50b:52ee:62b6 with SMTP id d75a77b69052e-50b52ee68f1mr42447451cf.38.1774195710960;
        Sun, 22 Mar 2026 09:08:30 -0700 (PDT)
Received: from hackbox.lan ([82.79.95.133])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486fe8159dcsm79087155e9.0.2026.03.22.09.08.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2026 09:08:30 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [PATCH 0/3] arm64: dts: qcom: eliza: Left-over review fixes
Date: Sun, 22 Mar 2026 18:08:18 +0200
Message-Id: <20260322-eliza-base-dt-fixes-v1-0-c633a6064a24@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPITwGkC/yXM3QqCQBDF8VeRuW7ARlixV4ku9uNoE2GxoyKJ7
 96Wlz8O/7ORISuMLtVGGYuavsaC86miePfjANZUTFKLqxsRxlM/noM3cJq41xXGLnRNSuKi61o
 q5TvjP5Twejtsc3ggTr8r2vcv3qxJrXcAAAA=
X-Change-ID: 20260322-eliza-base-dt-fixes-6b93dd26c697
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1101;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=jE9FNOCU8b2m2ObI02k/Oi7LT+HXOk9Tf6MxJK4jxJo=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpwBP0k80jprY4ncvv4owg/ADOZo/w9eRc4Pm56
 gJzbx1sXKWJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCacAT9AAKCRAbX0TJAJUV
 Vt7CEACUNfGWmB6oAKl3lFVXuv5hrwbGz3qtmaxBcxqRRDOC2uz5K/dRqoyLQqL1Z6fRoKw83QH
 kskqOdFdlrCrG/Yl/S9OMDZLM5CskjFnYcaSZj+Y/r0Dmy8iMpBJYMdP6hkfMUxlmDJfb/i/UtG
 /7sBlA7+kHb80DfHAPPQdAH0cRirRC6/5vTCOihnf9AYNLe9GussBAhC4THiN9fAw+1sB3IvZ13
 N1+qGbHI68+0U+Iqa0J8YpkXpBYKVBphTpLpgxIFSeSFq+KCBc/CWIsxourFN1FqI1Vl/QTv3qA
 6MDucGmGAlCxOyw48W7BP6APhO3WQfS9if26J1Kqkgoxi00rNV02Q8ppoqhvOIy+NMDzXw9dLJY
 qg+LwPLP8u36cIFPRkXDzhfeJLTI8Fe8CLs1z7uL4CSNwl5DVklQnU1OXzRqQsKmniaM+LUhwGf
 dQ9G1tZfj78W/YuFxSyrKrI4EBkOIn3BvcpDip6okbRcV5+rP4DcyVA48JaXNX+63DqKiT07k/q
 9DxNCK6tJwNhPaQxNIEXCsDnGGRUNDIQOVqvKdKBeSPZIW+2TyI6GIAbxTZWRI5YXuIX0EManSQ
 QKupZQHiQ/YdvI9FnukF19Oa/Z7+lNDb6+zaHw2M+kTsXP2vP63MvYOSKBWHxOS7NloypS2/gFw
 OKtlclnggPLBlcA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: jOwyXArHxkJ-NMXEdR9G7hyaW2Fe6MR-
X-Authority-Analysis: v=2.4 cv=epXSD4pX c=1 sm=1 tr=0 ts=69c01400 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=iKs3dpp2RB4k51ZqCjcyjQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=DjkNGMU_IkZk5lCd40AA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIyMDE0MSBTYWx0ZWRfXzxpB/yaQWq89
 Lq7UWrh94yrEyWnO5c92p/9yRzrBOpXhMLOJ1xqyPRTay4dlu9G7K5cOGLBGFyPlIdLG6rZraZR
 uJUUWpIAI/5GueSzmxsatgtVse2Ah/WwzrpOJgjl+1HLjt7W5KZKMs3NamlgiKZ3v7Sc8pqlmq2
 9T4FnqT3sS6jJqoUKyB8YFZPqp1Zx9KdyCFJZVUxylqJLptS46b6GeEc2V+vec81Iz56NXqPdvr
 uiRWSayU6j3r99BqrQDvFMSZ50v7oKU7aobC5WFwMZaa3OKZOfjeslc9F4bgfn4EQHev2FiTCp0
 PzIXnOkRhmOKITS7zk1RePZm76iPTNZ8mzzNTg2PQZ+meLABi4V5dLj7kt0prAwXNlRiIWw4s2+
 nKGRCEjeugOsvFw4aT+DaeLbDziLSZWgZHQj9hPHVxUl6Cte6SSSuG1lKtvMn71du+Tucqp97wh
 /AMjrYsEiAv9kVz98Sg==
X-Proofpoint-GUID: jOwyXArHxkJ-NMXEdR9G7hyaW2Fe6MR-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-22_05,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603220141

Some review comments were not addressed before the initial Eliza
devicetree support was merged. This series addresses the remaining
issues.

The changes are split into three patches:
- one patch with coding style cleanups
- one functional fix for GCC/CX power domain handling
- one functional fix disabling UFS MCQ mode

The MCQ mode was enabled during review in anticipation of driver
support, which did not materialize in time.

Bjorn, feel free to squash as appropriate, since the original commit
is currently only in your tree.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
Abel Vesa (3):
      arm64: dts: qcom: eliza: Coding style clean-ups
      arm64: dts: qcom: eliza: Add CX power domain to GCC
      arm64: dts: qcom: eliza: Disable UFS MCQ mode

 arch/arm64/boot/dts/qcom/eliza.dtsi | 35 +++++++++++++++++++----------------
 1 file changed, 19 insertions(+), 16 deletions(-)
---
base-commit: 785f0eb2f85decbe7c1ef9ae922931f0194ffc2e
change-id: 20260322-eliza-base-dt-fixes-6b93dd26c697

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>

