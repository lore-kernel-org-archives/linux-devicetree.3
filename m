Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C31A372056
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 01:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783994274; cv=none; b=Xwvur+7TiPBX31Orszbv/0BGbe22TfGqYFq7rP3REo0/B4sn8iFAhThuVwuB0E4AEgLvX4ekhzxfpLfRpwZQza2MmDkKyEZ3jbIN75J/L5HGOM2VjGOjPj+dS9WNdAXUcxL3DVSpfX4DeCNhjd+pOY3v3cOsQ4N1GyFxQiuV1i0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783994274; c=relaxed/simple;
	bh=tQRjjrGLQhurhoVg6JDZIViVv0b1R+8JttaNXtHXaZg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iee/gH7ym1gpw6aezkfjzbPZov2eKRFH25AXh1ACaC2LgfYqdVm1HZiVnDpcCc6vABnJDa+WMi+tv6x467+7JziuBGZrmdK26jfoBQmi1Y8ivchcRYxjEewGZ2Li/npfVC4heSpsYuA02IDgeqgZOG63gOF4ZdG7t6aX3BTFQ6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GdFVVWf3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CFhAaXRW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GdFVVWf3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CFhAaXRW"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66DNn54j3062883
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 01:57:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kBIVcQAjVYYsOGfglxOehsEMd2HTp/k3lvhCVhd/5PE=; b=GdFVVWf3TfbkZG2Y
	ZEXDFOc5++40fuiyQx0QM26CIhBkbPxbkOTAxrl1R13hRkEf6SdW7hR382NN/Q9j
	u8QJQxoFBsgkejxOhShH35JHCc9NLcn6SbNNLR5fRdV6k3pFfzGtAdA4uMMKKLDC
	QEAER7IIPXw5fH9e7RPre21/dFWA7vCKQp6segHeHdOiUsSIxEt6RvbVtFzs4366
	dvQwbSUQob1LThKD1mbuzp9OW5MJ3ZsPQ/IwOllR5XTY6jhahurQ1AjFLtvX/hy7
	XCg15Ao9QtNAf0JTY46Rfcx37sqY9Ek5q4oEzsxGrJPup26xAiiOjBXCQqCPzYbj
	T8UoQQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcwda3bs2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 01:57:52 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cab048cdb3eso3545760a12.0
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 18:57:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783994271; x=1784599071; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kBIVcQAjVYYsOGfglxOehsEMd2HTp/k3lvhCVhd/5PE=;
        b=CFhAaXRWn+7z4IrHsOrZf8QQNqwhcKcWcwnYItKscYv6GovFSw1OCta3jZccyn6T+2
         axAE3lklbcWgyr7Z31eym3HzRLpSIni45v9cPQX0ERqb/ekKWmfowYvvqiNyxEHWYQNq
         2UXe/y2BAnGGwCifRDl4tn1zaB1ptTctH2xkhjCDCJvMwsqmQgEkmJoyjZN3wpcOg8FY
         36xHRkP64nsVDRSfeA1IAe9B47y/pAR/g0j4CO3MOh1hYamm4GPo2H2JSzGZ0W3lnZO6
         rTaJD9Das4lHFRTLtJ/aYsDYLG0R2Pn4OvEGh4zrt8K63durIxjHpQwxO4WPyJyF9dJf
         qrjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783994271; x=1784599071;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kBIVcQAjVYYsOGfglxOehsEMd2HTp/k3lvhCVhd/5PE=;
        b=kzaoZbHEOizVR6uhHaVZmrnZjuRrJIFWKunCcmY+NSocbWEzdDDheye1g/SSjf4b0j
         2E8MGo3rmCz8TrQY6gq+7bgY+SpXl9WFkDlO7C/CUoqibW487UXuXZvQlreRS0e/8IIF
         MrmYcuKexRcoUCzmFFqrUZ6alggeMYJHBuacvMlMGWSHYXdtzYL45ixrSbNOvBXUxBls
         vTpQku44VYylGUln/r6jibZHzqnacm2GD1zMMtXSfGXFKDA44NQgfzi8m52NDpYWA7W/
         V+V+D2/+S6U8x4wUsB2n6D3YelyBThibzJ8v+R2Zd7hVNg/4gvSn0UZQttB4ELXF5sxJ
         8Vhg==
X-Forwarded-Encrypted: i=1; AHgh+RqXmUkNibHbMRxRcoSkhwBZlPaUBoux2ag6RghD8Iz20shYq/9ExouR7dtc8ZNG1HdvytWbzFrIiiyX@vger.kernel.org
X-Gm-Message-State: AOJu0YxUk65at3+R59bM/KpkkeNIP5Zk1f7D0lQAxhg1H0+5qn4OFAqX
	YYnbDe0vrew4cstQ7Vodee5nlPUPc4zhxNQoX/ZoTglhpQr/y2yQhpMtm0Sek96+a9ZyefGPupK
	4TgRzp+hOnz8PMnUCVIQBZ//h2c+eTEuTpwkuAqb9KzbaiUejNFQTu5faew15y3R5
X-Gm-Gg: AfdE7ck6M5TQ4BEtU3jp6krr2aFNdxByZzP9BHrb0yOpozDxfIwXZOvAvkp3YhhTN5H
	y6A3uAKpAaw6NnZQBOEsgF+gCrF5/2lh07CtcsgU746NxOx69TJCfgz8gr3vtP63WKAJc/rqzcu
	q1RQwzgrt2tQduNGdfPJ7lo3NyRaD7gDZVNjiWU8YVpcp9KpaBbpRPEZNBZznfJsSlOt7L4Klsa
	KHk0AP+W5vgBlOVJ+IxncvGRb/HwaA0en9d5e8jbfAulDzhOJdwI/LGIfcbMTnI3AGCtNskORA+
	Lk4GXDMoYUpNn2ve6O3lMZoXW6Jxggv2HWqNlfy7yp4G9xK3AeHzJbGD550SzThmcPlAOckzkhn
	zsIUkXWHgvAH6i3VszmX5U6b4bLyY7bT5UwYB+uIQ2xiK2swg4FPV6qmp5e6VkCDhXZ0yuGd6yA
	==
X-Received: by 2002:a05:6a00:2d1b:b0:848:599f:26b with SMTP id d2e1a72fcca58-84a5140f5b2mr1435670b3a.14.1783994271259;
        Mon, 13 Jul 2026 18:57:51 -0700 (PDT)
X-Received: by 2002:a05:6a00:2d1b:b0:848:599f:26b with SMTP id d2e1a72fcca58-84a5140f5b2mr1435657b3a.14.1783994270836;
        Mon, 13 Jul 2026 18:57:50 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a4f29ed3dsm634191b3a.27.2026.07.13.18.57.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 18:57:49 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 09:57:25 +0800
Subject: [PATCH 1/2] dt-bindings: arm: add CTCU device for shikra
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-add-coresight-nodes-for-shikra-v1-1-b1cf85962455@oss.qualcomm.com>
References: <20260714-add-coresight-nodes-for-shikra-v1-0-b1cf85962455@oss.qualcomm.com>
In-Reply-To: <20260714-add-coresight-nodes-for-shikra-v1-0-b1cf85962455@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
        Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783994260; l=948;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=tQRjjrGLQhurhoVg6JDZIViVv0b1R+8JttaNXtHXaZg=;
 b=dFnReCQgB1F4kdP6N3jOcn2Ya1eg8bL+kLH+qKY8JJP5w1AWyBHlggG7AXiRu9hPYu4/4MrrW
 LCjAADl1NfFC3xBVmDM6Iq1YOeuluTQfFmcIKhbdK2sUMjdi3FMnmzm
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDAxNSBTYWx0ZWRfX0DYDs82OkZEB
 8s+haNWFvFWLeJPYtRMZTVOsmvaj5QO88qJt0V2et7lo4DQ8d1jNJrRSZSjgZzeVGuE7EelqCDS
 IAExndrbuHjOEtmR9Aazh9iGdJTUB/c=
X-Authority-Analysis: v=2.4 cv=cNbQdFeN c=1 sm=1 tr=0 ts=6a5597a0 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=bwSPl2VgRa2lNh99CM4A:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: XtHYwHejCi__OTcwpjsD7LOP2VNPnzu1
X-Proofpoint-ORIG-GUID: XtHYwHejCi__OTcwpjsD7LOP2VNPnzu1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDAxNSBTYWx0ZWRfX9fzHHT7w4SZ8
 VLg5WNSBdYrrHCUxxWAQ2ZLM0I7GTfHGY8NAdAc6XR3vgFd7F3sNoAF/MAMWBV9SxqRWIdai7lc
 LnhqyLrS3Rp+D/NgKl8i5nhlDBnyd8IWtOz6r6jlufmShXyKEUE/xudlsrHmkTaARiNGPU17xPN
 m/K5ne+cM6v6x9tfM/OolpV+IKXr0zK9BDF/USVm+BWAyDn2hTU4WX52fAu0yOI6Fm22kW6S/dl
 qqHKZqMTZXzSHGMUj+vkUu21U7SiHZA716nt9kH9WRay9HaYT4H+49cBsnY21vhvc795pSnIcf9
 XycK1PLWCAsmWUI+I1+Cn6GGGK4SV9i50cReRgSSh/Vzv3g93Nd6KRmhmcipJ4xYh4nQkaFnlWG
 mwLqnp4Q/lWgZGhdvqWHSoJNfTM5mUbgMHYCCDEzmWILGgyTFT8oYKcCO8tPYYj/zQzjaK0/+w1
 mUBNHel4uqupPhyATpQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_06,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 spamscore=0 suspectscore=0 impostorscore=0
 phishscore=0 clxscore=1015 adultscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140015

The CTCU device for shikra shares the same configurations as SA8775p.
Add a fallback to enable the CTCU for shikra to utilize the compatible
of the SA8775p.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
index f3f3feac4ce2..335a8e1a5a9e 100644
--- a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
@@ -32,6 +32,7 @@ properties:
               - qcom,glymur-ctcu
               - qcom,kaanapali-ctcu
               - qcom,qcs8300-ctcu
+              - qcom,shikra-ctcu
               - qcom,sm8750-ctcu
               - qcom,x1e80100-ctcu
           - const: qcom,sa8775p-ctcu

-- 
2.34.1

