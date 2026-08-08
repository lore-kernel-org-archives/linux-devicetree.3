Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77B5736CE19
	for <devicetree@vger.kernel.org>; Sat,  8 Aug 2026 20:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786220621; cv=none; b=Sn/lHtr7NOlFyCD+sQM2KFtxROqszVJOgHEy43tbAPQ4EoLsT4v87JBJTb6segDiXpFmo9QzCCEzEHkZmCEXuUEFh8kSDHx5sAHdLQK/jcu4mq1W42IcWcrgxbcFR6Uc3ZmS+yKmmq7wI2u0lxrsDl3LYP2yh1X/juyv7SiW2YY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786220621; c=relaxed/simple;
	bh=4ei02UymcNOSwF4Et78K90ZktnKD8QiRpdCSLrTGTHU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Mcu3gJT7c2Ptp8OGMCzaYwiQpFdwRdGaAi42ZaXf8HC2PpFliQuqmM9tN05XIG1fOI+CLUQUx2ml0mc5I9c6i0fQHkv9Ma2xCxW+inG1zGWuAJ7eR2FsC5rey0ngZzrPUBrYzS57qp0S8aj1Rdj4mSRTwM2kDrlX700MuAZ7x5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JPhDc+ta; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z0LS4fF2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JPhDc+ta";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z0LS4fF2"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 678JvXET457706
	for <devicetree@vger.kernel.org>; Sat, 8 Aug 2026 20:23:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t3NG/0TSBU0DmDJU75ZDdFzCQshXmBj+SMFGbmVKo7U=; b=JPhDc+taFYk2XWsr
	WuTFFJFZ/Yl39ynf6sdZptUDQhCqnuTzxhmplOksHOP1VCqzMBrpQSPxO5mAsw8c
	gMROHy+q3eUydtAwnqUzTUHtZwsA4gnmcr9naOGcrAEGQdZupbikzTP/08Meiu89
	DpUoXe0KQh/HK20fg1CvNYbmscbB+4E+Iu3E8VeYvRoNHLB+DQbRy1WheZJaL47f
	z6nqBf6bpEtM7mC8+8o4YSXQMOCoo+/rC1XV1bhFmG3aFTvnq0Dq+1LvQQkwmwFL
	urOP68hdur+oaCoPHUl2e27N2YIrKIKcAGBjLj9cpRrjz7UbrWG32WGw+cPO4atp
	Ky30Qg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fwvu8hmdx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 08 Aug 2026 20:23:38 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38dc085b0a7so294155a91.2
        for <devicetree@vger.kernel.org>; Sat, 08 Aug 2026 13:23:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786220617; x=1786825417; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t3NG/0TSBU0DmDJU75ZDdFzCQshXmBj+SMFGbmVKo7U=;
        b=Z0LS4fF2HNn4W5zFwH5oNm/kJbrbOM7Y2UZ62HLShMSCmmepk0CCHs7+IoHzrbeReb
         AkPLyttMuGaSw5I8jZomW5yj4a4x41qM5Zu6CJpLBdap12rGSRJ6KzxY80RiSg1hdVNb
         EN6x5AlmiYEfOF5UaWr0ygTOxStohBcBXXhk1BdOJ4vM6jGhf12NRXduBIbMlTN0if6k
         GeBVkEp6n1STmTybuFW+zfKTBUnVh9iY5EADA7K1uM9zAmJk+E/2YUdCshz8GnN8hJnw
         CcxZkrD1H56tswuZcf0fJAId1jMeYtu41wp4NjcrhnBM27Z+FWAALwWZFJGXr6wFgFkK
         nVSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786220617; x=1786825417;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t3NG/0TSBU0DmDJU75ZDdFzCQshXmBj+SMFGbmVKo7U=;
        b=YiLuBnH0Rkx8D4yA5uMKTkMahIk+xd8J3Mv5jqA/Kvmdpcx7ClukAAHKgkRoKlqcvs
         I2byAE7H3KhZ+BkKr9emtWYz65RmHmviaJYHTSmXgw9O6531gHJ8+NAGx9fX7vb06ukB
         hs/0cpchcJRNyS/PWq1bz1fd1bKPcNc4XWqJboX3/pV7PWUg2jUt3ApKYdVhirFko2iC
         Zmxn464EcrihRyEUaY47U89hQ4D73l+Gpe/ilf2MRk6uX2sGfOrukDiajXYrar4qe0VJ
         rJzgBQ0uqNQq/h1j39KW/JiFEzC34E1464YXgSoT9So1swnV+KPCCmcBmQHFmKsvIaqK
         ugMA==
X-Forwarded-Encrypted: i=1; AHgh+RqhxICSDvOi5rTmAcAvS1f36O1cBvDY02GAEq0Ib8WPL3X382znFKPTgFF+QhltqrZY9RyvUY6noY5t@vger.kernel.org
X-Gm-Message-State: AOJu0YxiSwPniVMFuw06U7Sw5fx06yQl3o/B7AjjQYmLTxkXKuItJ5bA
	17VopM9VepUx9SbDzJuzQhE5RJaWoFDtUVU2qFZhHgBN9RyKlNWQ801tCik5W96BDsR8iMNhskK
	gZLAHcTaq/5chKbNQjy6IXY35UX9/5sWYHgNlddQ6VspcIfnAEUNH0R2gKWiyf8L/
X-Gm-Gg: AR+sD13PdUjWOtjy/lWaiiHn4+ks944MAsQ4zBV8a7TwbPXzfy3QwNlnca7BSfM9GUR
	FnrtpATiCS2pnqsZqXFoUHryaNc00dW4zBJ4naNY3JHn2AUQKZh1OyvIJj1CWpT2CNtdKtEI3lb
	rgsDGhieHVQdpqE9xpIYpFAE72oldYo4kPaJpvh284rjkBgt6VWGVNN0KMgdBv6w+kkt/Pxuycx
	tRgTeUGHnWnE+KERWpfVeA66vcdVEL/hsyo8OiMdijaZQI8k9XXMx7HiW0h+5GN25t2WUzBaFxP
	g/n1me31xBSxNeUoikCu67aHbhWvpPH4ndssLB70sjAlCqxr6kLnyHSn9kS1R3SddEAR8fD1xor
	TAPnU9LuNpkX/fAdA3Y/oeoV6
X-Received: by 2002:a17:90b:498b:b0:38e:7268:220d with SMTP id 98e67ed59e1d1-3903c628176mr35483058a91.20.1786220617448;
        Sat, 08 Aug 2026 13:23:37 -0700 (PDT)
X-Received: by 2002:a17:90b:498b:b0:38e:7268:220d with SMTP id 98e67ed59e1d1-3903c628176mr35483027a91.20.1786220617000;
        Sat, 08 Aug 2026 13:23:37 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315be86e917sm26357417eec.5.2026.08.08.13.23.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Aug 2026 13:23:36 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Sun, 09 Aug 2026 01:53:09 +0530
Subject: [PATCH 2/6] dt-bindings: display/msm: Document Adreno 830 GPU/GMU
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260809-pakala-gpu-v1-2-207ad1fac1c7@oss.qualcomm.com>
References: <20260809-pakala-gpu-v1-0-207ad1fac1c7@oss.qualcomm.com>
In-Reply-To: <20260809-pakala-gpu-v1-0-207ad1fac1c7@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Jie Zhang <jie.zhang@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786220595; l=1936;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=OsqXLb6DBAwwiK0M3PH5HtArLEFAOG7FO/WRCQ/j990=;
 b=WsOxEWLB8urgkOTr2myVNTvNfCf0TdxIL78Mb5G/oOX6ieWmoeLK0xXvFLwVvI/0aTrQ+4FUK
 BZBIJ/0BwnTAhQcEMpg+qiS6DnogVQGuiExn1U7fuX5UXd3zuHU+VRt
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-GUID: lhqPDZB2g-SzYolXKLQJPpoKZmvWSW88
X-Authority-Analysis: v=2.4 cv=M8p97Sws c=1 sm=1 tr=0 ts=6a77904a cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=Kd7_WHXXByo44f3drYgA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: lhqPDZB2g-SzYolXKLQJPpoKZmvWSW88
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA4MDE3NiBTYWx0ZWRfX2bKZlVJoYlJJ
 VJgRKQ1P3Uxb5jFfjJtoE01f9L4JzU9nUzfgjDXNMj+AwP2L6z80DPzNjxyE0yT2kZIXISwzo3J
 zmo4htEnDEUoQfEzdpwMamh8LOA9TkvF/H0Xx/0jC7T4yYfcVZQypkQzdcVRowUCf+ZUf/jySPP
 d2Q3H1lyVFnNR/5ziqfaVs8x6O0yvMvJ/Onlm/GY3FLT6nlawzzZ3meTJXThktVwX7SblSu0Zgq
 d8nrgnFFhnrc2+0g20aNyM4Ueuyjr3cTNO/ZwVXXQse8opM2ldfiUVlCVF9u9rYGyM1J5Sfk/1Q
 Y1imxWbHEAN7TQbByzOYuxs+jg/BAvLlJaFzC+Fx9dOr4j/WlixbIkcPXv7RwexdSN+PZCEFhbl
 kVYSD6iXH6ZXxHbuxfRfF1qB4H3NwDlAbO63lEc42rMWRBIzWXIJZq7tydI+YAp96M4tJTGCSln
 O3CQElGSyPnc3i4aq1w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA4MDE3NiBTYWx0ZWRfX963PPq7LRISG
 z+Lh+0RXppz/drDytRSLXn4r7lNlccP9ezGBbD5rSUrANpM7uvpinQzlvJiY3pDAOnXQGh79zns
 Saq5LIuYBNj4tImZmxjEAT/EHlyLZ0w=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-08_07,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 impostorscore=0 adultscore=0 bulkscore=0 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608080176

From: Jie Zhang <jie.zhang@oss.qualcomm.com>

Adreno 830 GPU present in SM8750 chipset belongs to the A8x family of
Adreno GPU. It is similar to Adreno 840 GPU with some meaningful
differences like GMEM , register file size etc.

Document Adreno 830 GPU and GMU present in the SM8750 chipset.

Signed-off-by: Jie Zhang <jie.zhang@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/display/msm/gmu.yaml | 4 +++-
 Documentation/devicetree/bindings/display/msm/gpu.yaml | 2 ++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/gmu.yaml b/Documentation/devicetree/bindings/display/msm/gmu.yaml
index 9e459f12ce3f..f1e609b7e1c7 100644
--- a/Documentation/devicetree/bindings/display/msm/gmu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gmu.yaml
@@ -305,7 +305,9 @@ allOf:
       properties:
         compatible:
           contains:
-            const: qcom,adreno-gmu-810.0
+            enum:
+              - qcom,adreno-gmu-810.0
+              - qcom,adreno-gmu-830.1
     then:
       properties:
         reg:
diff --git a/Documentation/devicetree/bindings/display/msm/gpu.yaml b/Documentation/devicetree/bindings/display/msm/gpu.yaml
index e5efe2d35ddc..1c4a6f17c1bf 100644
--- a/Documentation/devicetree/bindings/display/msm/gpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gpu.yaml
@@ -414,6 +414,7 @@ allOf:
           contains:
             enum:
               - qcom,adreno-44010000
+              - qcom,adreno-44050001
               - qcom,adreno-44050a01
               - qcom,adreno-44070001
     then:
@@ -451,6 +452,7 @@ allOf:
               - qcom,adreno-43050c01
               - qcom,adreno-43051401
               - qcom,adreno-44010000
+              - qcom,adreno-44050001
               - qcom,adreno-44050a01
               - qcom,adreno-44070001
 

-- 
2.54.0

