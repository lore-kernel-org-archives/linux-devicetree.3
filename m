Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDAFA47D44E
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 12:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789390115; cv=none; b=CO9z3jcrprUMG+HoFfiKxqWH6Gc+1JjpzYY++4uQV/lqB05NfaiDetHp5tZsis2InzXilk4wL26qwjvdSmpkn8hwPyYD3aMfKrmsR73soVTjtOichZww5GuzCIDvjgrsJGXu+Mt+o99Y6n9etULHUsaBkEkNpL9aI1JdRMK/sOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789390115; c=relaxed/simple;
	bh=cCljZSqJv1A83Fv6szFpAkL1t54SP0MkpLJrDu+mmuI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tM4NJNPwtWHw0ONSGWPZuL//OwVvuu7T6d/bNrs+EAN808Q6mZsqx37MzU7zVmaex32rvaNNZQMj2POjcmY89aEjA4LTiVak6ZGVqn3WAFSgCDBY5u4/99xgACHbhYpgtEft2Zw4SW+lYu5MmzWs+wwLAOfr9LCQ/Ew9oYpnQwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hisFSkTh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ap3PLcNE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hisFSkTh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ap3PLcNE"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EBRM9Y407210
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 12:48:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DfTRQLRQckPNfNVwEPDgQHOo6su7rg2rWpbow3Tx6Co=; b=hisFSkThXRaShEda
	ClxHJYdo1kqPQ0bpLg1NWRR8m/0uLU6auIXUOXAP/tz2/86RhfVnZ4Kj5ul9Nnvh
	tOA9bxogDc7fhjYBYbcaooLs+pnSKOreoF3kPZRkxNIxt1JVzQqfntUzoYN0nYyZ
	0D5J3b5/JehOwDHs67UoXRbZDLJqJBlYs3uPok2jtaiBlNnRYKtaMfV39Xb5T9Rt
	lQ2UPx3PgiDdWiJIxVydTOJOPIrYzCaz6E/SlghYbczWbCQv/m8EaDMueKJxn2Kl
	liX6rMBgLhh7nW+pUYxwfXICT6EHxNYdAOPUJnNETWP/30elTOV5oAR7sBxU+C9F
	/TPAzQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpg2kr886-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 12:48:32 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-90e869793d3so68532506d6.0
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 05:48:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789390112; x=1789994912; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DfTRQLRQckPNfNVwEPDgQHOo6su7rg2rWpbow3Tx6Co=;
        b=Ap3PLcNEu0fmAlJ9ODEI25LMjBu+R9LGKPN2qt3+HXVv/awwfdOsU+oBr7YvKhO30I
         B4BnCQ9vb+7YfhFX8V0zlFaqlw5fs/L+a/X6FNrOG5CnC1jNN/MGm6N3ohReuAN2zFLE
         +PcXr1+2h92oZaV3V9OMFmOpg4OHeHlmL/HvOv7Awb83e95xzW4XMJuVIHc+JVvjNCgx
         V1KCfgtkYjiXBtHj/QFthWQ172vkYT/aeDklRPVHDudCnzgXfGdSyWskgsqfe3a67YWq
         I/JlHfktImgum9i1JrKQWB5BxTg7xQT1KXb+R63B9KHYSYpALcG17e71tI523qc3NEWI
         AsUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789390112; x=1789994912;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DfTRQLRQckPNfNVwEPDgQHOo6su7rg2rWpbow3Tx6Co=;
        b=IrhyBta+ck3KgRWlOc4pCv4SplrlNaw1c6+WjPqbytJYTbh2Wbdk9iFoaPxlVf8mat
         kajpqZ+E/FHVLeK6HMjwmMfNLsT4KtcDI9wFSuuCYsfyBFnxR4aAqvQ8XdnJIId3+/Dy
         i3aWXnaup/Ib0CSw7YUV2HaWFwfVW2I3tq6ltFXVNijyVmkNZZx1Nh3y47OvjbGdrYHc
         c7H6vvoknsZUfOMOUsUAusCkZlGX01G1tIscyV8U70aLYRZQSx9b0cHqzMtNPmF6TT9w
         ObQ5J7QdHpEUx3ekihS+qpXxUXleg9JbMW1fkE0KfcaufMxzIzIQePP4+412FMsdppoo
         TZFw==
X-Forwarded-Encrypted: i=1; AKwUvBwT3nAAYi4Uqe+OM1V3fzgb665X5g5WBK9i2uSLyxSCGfpMkKmB6xh5oYMq1af1zxTBSdWSFrqDzz5M@vger.kernel.org
X-Gm-Message-State: AFuF++lz/J+3ebYcwbQ+smcZom7FNJJ4NVVl1bFoqB0cpujcwUY1/7uW
	Cge3uXvFzfumZtpkGKyUNezXPsUUD4/DpcNQvtYQb0OLXmwWNF8AU/+yY9FJhnGmHOyLubAtY6m
	VAG1dJkh9ZjZh45f5/mwb/uqgOcCPVNmG3O40pfLe87vtGKGwwWO07JefaKx5Vy1W
X-Gm-Gg: AYBFou1stHNqbFpm4TRrc/pQat5nSFEnyk46N5qSgdy06Pkg0ZKLPVa08noSLqwMZDZ
	FWIlZFl8GLfz8sXhAYWnzx5hc50nbAgT8Lsz8AHa4H/gyvCQPqYtBfLWj5VWepYgb0nmRr9bQUh
	2nOXdJM0P3A/cpVVwqRcOtpxC9HDBJ8yaOUZ/SzeSL1mFY4iVVv5fAW1AyBjt5Qd83GzQ+uswyQ
	tnJwJWOLdDGNGCJjHDfKN7AE5Hixn3hYRbP/L5ceh343PeBGLxGKEBRLuDMZjYYtwDvJPzx/tB7
	PRseM4L/McwFKiInaNtamV3ldrrwRdgzr3rXE3Cy4cTUCqGOeYlTdF6jGC5j/RTvVMjADZ7FqZI
	2KG0YJPzn
X-Received: by 2002:a05:620a:4620:b0:93a:1101:a21c with SMTP id af79cd13be357-93a299f084bmr326053485a.25.1789390111968;
        Mon, 14 Sep 2026 05:48:31 -0700 (PDT)
X-Received: by 2002:a05:620a:4620:b0:93a:1101:a21c with SMTP id af79cd13be357-93a299f084bmr326044385a.25.1789390111270;
        Mon, 14 Sep 2026 05:48:31 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6c566bdbsm242387555e9.11.2026.09.14.05.48.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 05:48:30 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 15:47:10 +0300
Subject: [PATCH v4 11/52] dt-bindings: clock: qcom: gcc-sm6350: Add CX
 power domain
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-qcom-tie-cx-to-gcc-v4-11-9d5a606ada33@oss.qualcomm.com>
References: <20260914-qcom-tie-cx-to-gcc-v4-0-9d5a606ada33@oss.qualcomm.com>
In-Reply-To: <20260914-qcom-tie-cx-to-gcc-v4-0-9d5a606ada33@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1691;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=cCljZSqJv1A83Fv6szFpAkL1t54SP0MkpLJrDu+mmuI=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqp+zWrMvA87ZExe/HNo+lke6CFqVCgje/TtVuq
 6cz39h2+TqJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqfs1gAKCRAbX0TJAJUV
 Vs/eEACBe3Loc/76bXBuUrnjcXfFR3LJZDLpi2bxjyqy2mebuM12DwPLn1PpkO5uI27zJEBhsM8
 7u3dsACuLJzsNqUsVGK7OXvqmeuhR51Nq3QZQTWBavTzFrWPH2I6TlLPnWNHmgdSKLXk4R80U07
 7/9T6VFpLX6TTB1IsxBaYHL8OSx/3m1lD/a9/j1Se065tocYM+lBIR/14LE4kFuymCkGJZXAxE0
 ANZALbRBhnWSGQUEGlFt+VDANsQp8XcAKnR8gx1D/8dE/iwM3xzaPz4TUTPGXluySsEEhyP9PLk
 rDySLK1F81NyK6GRQcADlCpOm3QR/8fnWi0E0enxs9yv6Af/LWcasauEyzMWgJ76umOY6rUd3+1
 jYaSpZPQqvsLoZMmd8yuehsISjUg6Nt0lFHMxHwfzIiJagevGiLNj9E9MpWQbd7xpYbOMVyr72g
 7G9K7B8M/n3gfpKAqReDp/5fvsYhSUFCeHn7LPk0UVuaGbkMgKCms8s2CQAGKnrpXO6MaA5d0BM
 4/3H4aExQ5jUwXXxYavJtcy5YxvJXCgexAUssOLNYvMUeOSKwjHI9zZ222uXcF06yeHh6aIdkXV
 ODVDmw/28f7snpamUaeV9MaB/RQaPm/CCqWzhAKeYiLQHh18GxYAF2/iP6Hs+m7NaAjnIynFgGj
 lNmIbl+OjuZtVTA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: RSDF1Yo7w-GIm8SlvrJlYvYXysJAE6GA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE4MiBTYWx0ZWRfX1aklix7eNjuQ
 W2Mjr89G1RbHNu/Ogo59P7T2btl2+JZyavAX41vxmv3RFvfE5Sd1Po4GwsZey6UsqZt0+GdTBLE
 NBMcQ2FIGkGUWVCTulqg4GNgNqVQIQELP04mLSQaKep0Z9MJUeLDzLNEaL0VQ02H5JpShMQI9dj
 gCaqw6nTGehc/UNHNKrCddzhPeMiJsEBvvcIZ0gInkvqNPl2gU7a5xRFFTW661/dz1aAvPhIQtQ
 tUNOJiMuRZg1rjCMt9CaU+VwbMXG3NofFO2BuSkxJJhaBLRTbWxgDIpQJ40UJ4WAygB41PKgXoI
 /60/+9mfqHXOywZVAeYnjedEhrv9KPnDBQbRn+y/BI5AYpaYua7IQ7wFXQFC4fk8z6ZTCR9NUAJ
 cI10/w811wMWGoy5UiM+z2ldl+SN5CX8uzxz+FJ3YiAHiaBzyZJa4URGSy8Rh3VXtq6lKlCqrDW
 tUO6pPztf53h29eCfpw==
X-Proofpoint-GUID: RSDF1Yo7w-GIm8SlvrJlYvYXysJAE6GA
X-Authority-Analysis: v=2.4 cv=M7TYuCws c=1 sm=1 tr=0 ts=6aa7ed20 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=z35zQ5kvS4wbvuCDxioA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE4MiBTYWx0ZWRfXzLwhJdqBcQnZ
 S9P/EkKLjd0MjpEi9LWPexDtzXas2Gw3ATorUvoc6JrxbgQnwl1GTIh2hfTy34N8ozv1SFIe6Rq
 5ou6Ty2qSABS++bxhAjL3ENBEuSoFmY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 bulkscore=0 impostorscore=0 suspectscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140182

The GDSCs provided by the SM6350 GCC are supplied by the RPMh CX
power domain. Model that parent domain in the GCC binding so the
provider can describe the dependency in devicetree.

Add a single CX power-domain entry to the binding and make it required.
Without this dependency, GCC GDSC consumers cannot vote for CX and RPMh
may undervolt it.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,gcc-sm6350.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-sm6350.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-sm6350.yaml
index 819e855eaf9a..098a108b8123 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-sm6350.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-sm6350.yaml
@@ -31,10 +31,15 @@ properties:
       - const: bi_tcxo_ao
       - const: sleep_clk
 
+  power-domains:
+    items:
+      - description: CX power domain
+
 required:
   - compatible
   - clocks
   - clock-names
+  - power-domains
   - '#power-domain-cells'
 
 allOf:
@@ -45,12 +50,14 @@ unevaluatedProperties: false
 examples:
   - |
     #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
     clock-controller@100000 {
       compatible = "qcom,gcc-sm6350";
       reg = <0x00100000 0x1f0000>;
       clocks = <&rpmhcc RPMH_CXO_CLK>,
                <&rpmhcc RPMH_CXO_CLK_A>,
                <&sleep_clk>;
+      power-domains = <&rpmhpd RPMHPD_CX>;
       clock-names = "bi_tcxo", "bi_tcxo_ao", "sleep_clk";
       #clock-cells = <1>;
       #reset-cells = <1>;

-- 
2.54.0

