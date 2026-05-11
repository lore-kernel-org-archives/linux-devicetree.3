Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03D15383303
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 22:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778538233; cv=none; b=ordDxGb5cmvYEzCPxZp4ZpGpIKjvefDYHZ0q1DWGgUcPqPnssctGIvI2yGr/P8rFO1vHIDdNNQrXntiRDSsDXFO+XaXc0A1qsZ1hygeVpLmj72urkx6qWOjikdH/yb1CjhC71NelVzBxu9HCRDDnUp4odsfuUnYXBVGKs0Dt7Iw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778538233; c=relaxed/simple;
	bh=j1uKoavk7LSXVTFpinQJ3L50+niGwfT5j/plxH9VxBI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fO67/k2POjKkVoTcQDZi40rH3dC0LNZgc6MWBlS/Ou3rDkAUjb/QqY6n/sgocITmGSTKCh6aDJ5tf9+VZJumrzagpQyaFYZs+JFbDQ1oEBuTDNIUmNIkOcU0JZowBIVgCPSNVuDMnLoNzcYnL00aZiPbfEEfk0pzlTKfrL3lPcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n672HzHx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i9eP3YR2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n672HzHx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i9eP3YR2"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64BK6jNC2187626
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 22:23:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eXUF9eOdUNAlLXcUL7FmdHp0dlAT98Q3o6ahLF/ZEhY=; b=n672HzHxzEtRcoDf
	ir6x/ZJRlEfhbIJOMVkv4eyYqXy8MLDomiRPg2BnI9MdSgbrwtPlxGXcbQrE8ZMH
	Tm79PL/RiDti8cr5SSPqlKYIQPihvq+KgcpIznMhmQ3+VCQyPXo8icYNTV7yNUGw
	h+h/WaJFcROAZG4lMM10n7i6ntRQkn6Qa15zvkAvqPsJr0IFcJWkuhWOv4VUd9mO
	mHCMDbRSS2ZYZRzjxwjrs4HEctl0JYhJKxLP+Bv+3E0GTQiQrfhPpQicVPthpkXk
	WIoWEkPypH5zD1BNsC+BCVVeFbLjkTpgRepjdbQLjiZGJgp1Rarb11OFp2zFmNDq
	IJM12w==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3nv0rf51-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 22:23:51 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c827b1f222bso1208147a12.3
        for <devicetree@vger.kernel.org>; Mon, 11 May 2026 15:23:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778538230; x=1779143030; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eXUF9eOdUNAlLXcUL7FmdHp0dlAT98Q3o6ahLF/ZEhY=;
        b=i9eP3YR2gteLt1WUjwmFfpEYpF+lOEhu3GX2/ht/UpmIlMN7xe4cXT9l4XsqDAeEaD
         Hd5VIhC6mMYqDewioknjokHiNjRkQSjH1Tq9Y1p+LMHDQJKuSfwl3MNypsfUQE6HmKou
         ipazXYcBuJBD2ArZ8s3Z0ujpDVnCL2u1ljfk87yhjqLwDv4JrwnTQ1C0aFwf1Qyvim5m
         ktjF0sRsau/JsCRNKcsRY8CH4xOlgqsVF5bRd4s1iTafGRox6s4fV5PZOwH+Lx7YTxbb
         FT5W/Nzwz4botZ6VZe5cowkrTfKdtKat1/v4BvSWETPL7O+8twkkXxm7cbC3o6rqDlVY
         Ycdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778538230; x=1779143030;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eXUF9eOdUNAlLXcUL7FmdHp0dlAT98Q3o6ahLF/ZEhY=;
        b=aFIa0Uhxe4VPZj8bYc6B72FLxh7amLTzN/c4j3HFYx6EeknGg1ix8EFog86impN57J
         wJAlHOJLaRqDBXZJ1wHl4dUUYyJHhU4GvVMBPYs/2p+KYTMyWWhiN3Pkfvp6YsK3Nm2F
         GLCqYvMTEq/mvJ1ROrYWIVebqeHgPdmu3p/56Nb0d/84Zz9yEotnQ35THDv5WqIGSCcN
         qwacn6EpuKnIXgwAiVhbUl+pAiukL4yNrQRQy+g8UMAPNaB+MVTMNZ6atLs1/i0e7SpF
         V3B1OVyOmXO7wYVf8FAGFndG+EKKqtlgCTUx29i4o1eDNZ8lzvm+aGx659JNPxgcglhG
         GhWg==
X-Forwarded-Encrypted: i=1; AFNElJ9XRRKX1YCGAUiDUI3gV/NRfqkBNdhWYbW0r7ZgWAlHUX+Ai1UD7U9w2EFX7t7ZsYKWU/Nj94lgxgEG@vger.kernel.org
X-Gm-Message-State: AOJu0Yyd+3pB3Jcg8MXA6ln0mGtDUESDq5eViAjYdwHZKBgrKDur5Qlt
	V5fmbhAHziQxlMRhkUqg2VCHsADYEICZHZfllpg1wHX/1Qr1rfW0A1O6J+23ZU0aGCxOw2dHimv
	qaP/h9I+kw3WN5HHXuPMxMUYbvHmdf9F5bUrGSWB8MdNUy6Hhvt12rgE8prdrTHdL
X-Gm-Gg: Acq92OHqzImZQI1k+mEm8ABlTO3bvwLs/5phQLCVwr7iNzadMQ1gZiW1q+W+hcipPLT
	Jr1jGWqqP2MoHM3t753he7h3Mg4ZEmGBOZ0Rl1dgV1dH4I75WvFI+RA7uJhwAKB0+fI+LAVNdRf
	BgyZkRpscOA/GBB9fmW2R+w7jkfiF5FCaFpC3Ehq1a5rP0KOdet0qnnF6Ph0W+mvNVJ2WVgSzT+
	RvQSwApmD0OJTfuSp0T8Yr2aDIujfblwQIAWjeQYenQ6ostZn8yC4UDY2XL9pYHQG0hhnG23g7f
	RrNzN8rEBgSmUPRDoqDvllR4MmVJVLhxGzALVh6Z6+PgkQlhuwlPFMLjI7qEP+XkG6LJliK3izz
	ovWNTElC/Zd+9HobDyc/wYujz0vpJGG/SwF/562HPbO3YDQ==
X-Received: by 2002:a05:6a20:3949:b0:3aa:f7df:6146 with SMTP id adf61e73a8af0-3aaf7df68ecmr9095274637.46.1778538230359;
        Mon, 11 May 2026 15:23:50 -0700 (PDT)
X-Received: by 2002:a05:6a20:3949:b0:3aa:f7df:6146 with SMTP id adf61e73a8af0-3aaf7df68ecmr9095222637.46.1778538229874;
        Mon, 11 May 2026 15:23:49 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83965946543sm27028110b3a.16.2026.05.11.15.23.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 15:23:49 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Tue, 12 May 2026 03:53:16 +0530
Subject: [PATCH 2/8] dt-bindings: display/msm: gpu: Document Adreno 840
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260512-kaana-gpu-dt-v1-2-13e1c07c2050@oss.qualcomm.com>
References: <20260512-kaana-gpu-dt-v1-0-13e1c07c2050@oss.qualcomm.com>
In-Reply-To: <20260512-kaana-gpu-dt-v1-0-13e1c07c2050@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778538205; l=1371;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=j1uKoavk7LSXVTFpinQJ3L50+niGwfT5j/plxH9VxBI=;
 b=dkSBw1s8Hl7c34xGexPilCuQxVMR0sBENGS+SZhwEMiavLDKfYoCy5dsAY7UhE8iKS0QVuwSG
 2dA6b55CTO7AU/2fkPlZlCpIFE/Ms/Ak81W1hhKN6X0xKKbaFWz5JnE
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDIzNiBTYWx0ZWRfXyeMG4jvoYs60
 QJFpY+L7H7GlL0qeWtxpFeNeInIIi3hiiixOmJIRbbZQsvOLHtaW+90ijhiA2d5DaDfj1UCCbzq
 c77W5F/BKU+cmCdP4UceIUInCYgCyy9CUOvobdX3brGL9SumTt1hO/59J7uYMCokLzEt8Oj0YLy
 1qJmFX1Dq6p6mx6HKHQWeD16Lz+k/SzpV/17SmZq+Ho0iSKpir92knzslJdJeGyqwNyiaxDGt7r
 B4VL/j1tp+gv6VWRDZYk7xoM6F2czaC6en2CbxYGkpWNlDKYaQMWMTMS0W37ihxTbn2BE/1KLyo
 4uRHxQMOVQo9Hodi/6n6g97AwiQLkPS0QFQrBVa6lJrq+ga3mn+TGVe7NFdqOp7j8TT9mneSPzz
 VzJgW+OMhUe9iaBJr4lKTjaZDfykAozSl2KL/sTI2X9MmV1yHR0WrxqyETCvsHjNCZuOtEjC2gk
 xSZtbqQljjWttqnYrRg==
X-Authority-Analysis: v=2.4 cv=bpB8wkai c=1 sm=1 tr=0 ts=6a0256f7 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=I2s05RQVLi5l9ras6fkA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: hVF6knYaKHcOL_BhjMsbuuaFDdSzB9bJ
X-Proofpoint-ORIG-GUID: hVF6knYaKHcOL_BhjMsbuuaFDdSzB9bJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605110236

Adreno 840 GPU found in Kaanapali chipsets belongs to the A8x family.
It is a new IP which features the new slice architecture with 3 slices,
raytracing support, and the highest GMEM size seen so far on a Snapdragon
mobile chipsets. Update the dt bindings documentation to describe this GPU.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/display/msm/gpu.yaml | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/gpu.yaml b/Documentation/devicetree/bindings/display/msm/gpu.yaml
index e67cd708dda2..35c6d38dc379 100644
--- a/Documentation/devicetree/bindings/display/msm/gpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gpu.yaml
@@ -415,7 +415,9 @@ allOf:
       properties:
         compatible:
           contains:
-            const: qcom,adreno-44070001
+            enum:
+              - qcom,adreno-44050a01
+              - qcom,adreno-44070001
     then:
       properties:
         reg:
@@ -450,6 +452,7 @@ allOf:
               - qcom,adreno-43050a01
               - qcom,adreno-43050c01
               - qcom,adreno-43051401
+              - qcom,adreno-44050a01
               - qcom,adreno-44070001
 
     then: # Starting with A6xx, the clocks are usually defined in the GMU node

-- 
2.51.0

