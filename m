Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB5B1352014
	for <devicetree@vger.kernel.org>; Sun,  5 Jul 2026 08:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783238469; cv=none; b=ErCSmZ+tzO32XF1S8Zkl5kX3N3toxfm4mt5Adu/xG2pebBB2vsz+YlvOiyrb7ApdPoIecre+Qw5qI3243+8a7I+4KA03TAhTyoF/O28kfDG9Morg6V+eEZUpqQYiA0D0GV+Buk5vyEM1JS6I/JwLhwN83YGeVX5Dt0jTl2XOJHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783238469; c=relaxed/simple;
	bh=rEVRE6tS8OEt2bDdC+eNcX3SJvvj+nz8Z0ZGM3xZAcU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aQqSeZR73MmlrIq546f878n2PRprrWJ1e07vi/yJkZohXH1q8etUcuRv/HupPrkU6ECxtgtauAXMrcWAAIY2UNlOMwJ2Jswi5mqGQmYH04UGU8AC8GsLjDKtnCIUvAqH7vpXvw9I0UThJOz8NZ/+nwJCG3/GHD+ZGL9fRN0Px54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BezB4TOk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fCMUFXFg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BezB4TOk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fCMUFXFg"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 664LTRRP4090299
	for <devicetree@vger.kernel.org>; Sun, 5 Jul 2026 08:01:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1GLzbMavJcBjpxSXBuazEchU/ZHqzUf3tHtHLBksp2U=; b=BezB4TOkjvnOWtYw
	UkpcpbynKs/qu3POkRXnKFaGwJevrfu+kK/8Zu1sks6qnMGiD1WDvPTEGF7ZAAkH
	iA47ybIsJHYT7bgr27fVi1RV8SB+2OH+tYgooo+dsBdXi/4VcXmXesOT1skFK4gg
	2WMWz9oiq0fYfd2fO3cIjgCB3AONBBvQWYq+f9yxFqMLglGeZcJGVXYujWq0o5+O
	XQ2k5sWsADvSPN0Gfj9OL7FnWRpGmdHPgXuPXzKVQrA6vrSLrNwPYcRYuqfNpMJt
	KRqQfDRMCJghmhrTux9jVCys5W7L5gJ+vnLofnW8BWwJUALtSAbf84UTU5h+OtqS
	Vxn6sg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6s64jebp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 05 Jul 2026 08:01:06 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-380c178acfbso1639577a91.1
        for <devicetree@vger.kernel.org>; Sun, 05 Jul 2026 01:01:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783238466; x=1783843266; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1GLzbMavJcBjpxSXBuazEchU/ZHqzUf3tHtHLBksp2U=;
        b=fCMUFXFgnhgZZRf4Hn+b8ocpcxbC9UJnytCC6DeJjLGkeU7//fl8DLFjwLXzx2WtJe
         EzSJxgEi10EZY4Rdr92zJuODOk22PTz6TNWozyBPs7KLqQZn9cD133nLBctpDwcspSH+
         Q0ocYKoM6OlI5cdeiO2VPSAjxAaj7maRW4h0vl3h7vtker+mZDywC75eyxGxqLZvtDeo
         osV6Zjc4r7KtaxZc16/c7AShDK9X4LROcpVdPZmbSo+s7eBsxQMqjEef1DarxcurI8xc
         YBbcGJ1Z5A8myWj2v8z9Vqy5Q1mjw8fep6A0MuKHxjFGns+tKYeHJ+bJAeg8DBdhjGYR
         InWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783238466; x=1783843266;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1GLzbMavJcBjpxSXBuazEchU/ZHqzUf3tHtHLBksp2U=;
        b=F2jgSlr5kzwCEjONmtljSSs+4ojscG9Qc57WZg+miCOMYn2sJJhoi4ATdfNSRAdLa/
         7hJ1wN9uijz7tQzYN19StJPnDnDfP8I8+yOC8naBNw8aUVaEbs3vlJ3U+t9Xt1MXnlgy
         wFcQWyH7R6Q8zHLpMb/nMeLMoUu89bImuF6H5gz0+05gm4a3kwx8qR8n5dL8uZvJSFJ+
         Q7uFD+gMLo1Exj8lT/qZ3Xz8YlIMX9sl4fRNEtBQd1JNJIl7ng40QPXsrjAxeCyg+PBB
         7PHACGct9X9W+vAoMmf3QSf0c8rIH2eMa0PzTYwGshCTP6GUaWLZjQfZWsstNvG8jUMs
         U+4w==
X-Forwarded-Encrypted: i=1; AHgh+Ro0Syi9wRINAkNJ2GDL5dydUFpnAQnYFFnnk+l5EzC4V5LWocz/wJs1GR/MjW2yQ8hcbnXUtXQnp+EJ@vger.kernel.org
X-Gm-Message-State: AOJu0YxLQRaS0HtIQ28xb+FXWOhRQegKnOi3Ee9mcIsDstvDD1KoHt2v
	etvarZLiEFb1OlQbvLSORb+NtjsGpCsdPY/mOKPYqz8IuvegAK6x6/bL+cPjGh8BqklWSMb0t5n
	PHcwDeb5xZp0ccCYTgbUWqpZpOfi/9VcUe4mkCAzH6kMcNPS2VuCncgg7Iq42TneD
X-Gm-Gg: AfdE7cn1T/U3mu3j9gw0p1qIWZEL+NergygfLf03Dp+nRlKkcuiKoRT/QPgUXfq+2Tp
	q1IJSCzSEYEyQEJCOOHifpLtsXi93DfOb+jzMYw2FQJEtQIGBMDWTRTlPzcgXprXXZWPMyMuzNd
	s1/hwB/Nn/NinILUi8heTDDhlBMFuA9lfSEXHp7PckNqL+Br0ir24drV4gzE2pwH8U2vGArllwZ
	h45BgL+wznVFmgfDPS+DjwDYBJB+TDzmXfaB1Eb4Lp0cdJ/mbaTnzZVCSpKJKnZ5yC3BQ9OtmW3
	wSViVQRZZn2Dkn51moAY0a6ca9isG6KcvReh229bgTU42QDgS2Q6ckcU63Vq7enuGppVi7B0bka
	fsG3pCUSAhrygluIwfNmPPXtGI4/4EBcKPxo=
X-Received: by 2002:a17:90b:38c8:b0:37f:9cdf:f03c with SMTP id 98e67ed59e1d1-3829f7ece33mr5155167a91.31.1783238465380;
        Sun, 05 Jul 2026 01:01:05 -0700 (PDT)
X-Received: by 2002:a17:90b:38c8:b0:37f:9cdf:f03c with SMTP id 98e67ed59e1d1-3829f7ece33mr5155121a91.31.1783238464724;
        Sun, 05 Jul 2026 01:01:04 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3113c88041fsm7759179eec.15.2026.07.05.01.00.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 01:01:04 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Sun, 05 Jul 2026 13:30:06 +0530
Subject: [PATCH v2 2/8] dt-bindings: display/msm: gpu: Document Adreno 840
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260705-kaana-gpu-dt-v2-2-6ac53de56314@oss.qualcomm.com>
References: <20260705-kaana-gpu-dt-v2-0-6ac53de56314@oss.qualcomm.com>
In-Reply-To: <20260705-kaana-gpu-dt-v2-0-6ac53de56314@oss.qualcomm.com>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783238440; l=1293;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=rEVRE6tS8OEt2bDdC+eNcX3SJvvj+nz8Z0ZGM3xZAcU=;
 b=GAsTe5la0ufNmjlUop0lHQSJGg7ejUO8suiNPoqkpIJfG+V5N92J7e6DKYQWZC8idtEXAlIcA
 yq80BjmwnsvBgjoxZvpwNTPTexaH1YVNCh0nbT5Gn+LBYJAXWitzzKO
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA1MDA4MSBTYWx0ZWRfX9u+ioyYYCU8V
 YERtt0jwm7KSmE88n7gz5/1FVlxQcjcuesQSQuugyRAMnVpWXKUmdQx/IgqLK6w833acIb7XpYv
 BfjcRSH9GFiNn0kG3a5LowQQErBEGLTedquS2KVdbby+qJdpyy5ptpYpiUn0H7uMzb++Euj+BLb
 fuZiT6I6g4BH751lViwyuQkl3XtzKnsX9WnecwlinPx4/dOxIz0OOcxfAWSxPY9zBlP2xCs5/IK
 BLVr2GgHvO4rQpDnBzcrsDRihk77srUJ41wV6CXGzL7fUvl0znqAU9drQqBmgqMhiP1OwUklzLF
 iMUGTOYjH0GoDCBeoR6JGhKimuygq0dTj8glGfOBJ2fSODyYog69aajhBWNcpW8mWkJM7LZZRrv
 nVWDhS/p65vAnKFh6PQRemAtLBMvICp9A1k0HaYJNEwk+8le2MQvih7R6sCseI1d9PMr+W9fDki
 qsQfB/TPZ40yITlpjiA==
X-Authority-Analysis: v=2.4 cv=VvITxe2n c=1 sm=1 tr=0 ts=6a4a0f42 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=2rxQ3qtc42-NlUa7jS8A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: IH2iToIwWJ99prlqH7V5_kz7l9JwRG-G
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA1MDA4MSBTYWx0ZWRfX+Th5BkIDBrpw
 20EtE/G/7WX0cp6zJ+SuoEmVm7t4viuCKQhfrcT9IRG37AEg0w0Lf5w/S64vQDf8jDxP4EQL9Jw
 lejXtgnkwiTo4tjyKt08xk2+o5Dl7Ks=
X-Proofpoint-GUID: IH2iToIwWJ99prlqH7V5_kz7l9JwRG-G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-04_03,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 suspectscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 clxscore=1015
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607050081

Adreno 840 GPU found in Kaanapali chipsets belongs to the A8x family.
It is a new IP which features the new slice architecture with 3 slices,
raytracing support, and the highest GMEM size seen so far on a Snapdragon
mobile chipsets. Update the dt bindings documentation to describe this GPU.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/display/msm/gpu.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/gpu.yaml b/Documentation/devicetree/bindings/display/msm/gpu.yaml
index dbbd8b814189..d0b7304c17af 100644
--- a/Documentation/devicetree/bindings/display/msm/gpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gpu.yaml
@@ -413,6 +413,7 @@ allOf:
           contains:
             enum:
               - qcom,adreno-44010000
+              - qcom,adreno-44050a01
               - qcom,adreno-44070001
     then:
       properties:
@@ -448,6 +449,7 @@ allOf:
               - qcom,adreno-43050c01
               - qcom,adreno-43051401
               - qcom,adreno-44010000
+              - qcom,adreno-44050a01
               - qcom,adreno-44070001
 
     then: # Starting with A6xx, the clocks are usually defined in the GMU node

-- 
2.54.0

