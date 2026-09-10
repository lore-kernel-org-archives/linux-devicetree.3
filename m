Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 287BF48F02A
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 13:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789046957; cv=none; b=Y56QqHnYe3BMadzjmEK9i5T016GT75XSaGK7+09EeNepXOoxkkoB871Tt94+6ArUV9kQt/gdV+tGTPHUN6lVGOKkntrlh1O5quJNDzunc4TXCz+qZRsuiwpWUnXVri1aTFsYH75uOzVvJMBC0qmTI7+XBYxSakXvMUA3/WCD1/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789046957; c=relaxed/simple;
	bh=o5+5tvpe0ZPElsvDSlWdf0J/aKPzIjOAQ/3OGEfPAgc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qiTydTJsJasEKvSBoZoc3vXOavMK8HYkJSr4ei/lBToRygymgcwGfj/bs+cxydjwozBnuR8eiJj4fegXZv4ZktbXdVs3rhQ1JX9LzoX6AwioP1pd4E3gtrBXevnRBEMQsUxnJb0bYJlk0d66IqeA/3Ae2ks5ouOtIknwCy2LlAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Rhh4YQiF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WXgfLlcw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Rhh4YQiF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WXgfLlcw"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68AC7ibf780825
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 13:29:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZC54jYxJJtuuW78KoOpMV5NKoYluv61XVYUBsfKb3t8=; b=Rhh4YQiFEq6MuANe
	hmLJHypZMuWHLSrik2q938NYNvX+8pMpuRK7VcMyf5TWFB3z1kuy/fW6SHoUhXDC
	SqNasbsYSJcO5kAhGe9KcieKxS13HV+ZVYdckoAazIwcn4KtwFtOqsLT8MaemKKA
	hV4f1NQbcChV+dh82Ztfl1iw3izSBe6JqGtixS2tt5rSN/AWmia46+TLoNGI7WAd
	2A2/U6y5PfaHIkKqKJMP1xvpYhaI7e78M6/oJH+tSe5/7PYTD5ikDyEDUJZ37KMJ
	dKbH6yWq0j+b9ZMt4j2K/EjQQL430qTe9vDSdOSMBBriULJAOjHlbAwJK0DxSfJ3
	DZsepg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkrak9asb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 13:29:14 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-39d8646b10eso561976a91.1
        for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 06:29:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789046954; x=1789651754; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZC54jYxJJtuuW78KoOpMV5NKoYluv61XVYUBsfKb3t8=;
        b=WXgfLlcwF2F5+4XUpkAawXiISrPCR/PXMN6H+yc0spHMvV+L/puUSnA9RL/jISwQCO
         VqK2jQQs0HvemrRItg1A6iwit73vpo9SgIDN7aLzdP3MoNMIugQE1xcJxSqeE5mYu2wa
         3KPqeLSGgOdXdXEPuZ37C3eYOA8/T/AJbZCJ04xzgReBXo7DwhHT7pwOnZhmXBmXuW69
         5G+LT8DNg0udBs3vS513EG1E77rYwlPCTxQXn3quFMn6iANgUG40BiwRPHc3a44ebIP4
         /m+PgFmdodTCQJhILzUohJ8Zp34Buv501ZN6DqcSsd23UXYQblaf5ccRZU5UAxcrmQst
         lGEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789046954; x=1789651754;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZC54jYxJJtuuW78KoOpMV5NKoYluv61XVYUBsfKb3t8=;
        b=aVY6pj+hmQRUQT1eRllyqb6ZdEobDtEAmP2oJvTa3glROW+QTQ98KgEps7Ur8kO+pn
         cy5p/kUqz4vTIiTbgXdHX7r0R2Q4vqEICJ9TIdUrcGHh2NtWe1cNmTkziOqYOnmWBrLG
         x7rkdekI1oA/1ykw6uKF2wSBvDrN8DV3+WSUlTVLJDHIbTyOyyLuJAw8owsp1LBHgReF
         WCIBWY9E2n1r9mKjnp4QPquALUYPG9ZwgjgKbxTr3V01pqO6GbN8HtoSGgYpwGwGAs3n
         dHTgfz3qK8eHGY+OxXSoheXcMvMAksggq+YcdE8EvGo0N1pAm2yoDDo1aqI4EvZBEQfR
         2StA==
X-Forwarded-Encrypted: i=1; AKwUvBx4nfqec76fICaE+/4Zh24qi+GY6gARyJ3ZMF2SmfQSZ6nHzGzmyMY92Su1N3qmE4JjmoT8+pbhhByE@vger.kernel.org
X-Gm-Message-State: AFuF++lh06k9R0MijqEMHYlmqA8h2BkZFpWfA/UEq1Q7PuP+6YeLv1so
	aFn6AdxRE9BpOSuB0mZweSQZKAkFNqB+5R1gmPU0UBfmH2Icktxcv0lkClSZaTki9XYw5TxTBCS
	+86ddWa1SfDD6wr5Lg18IsB/AzPMkuX7kNJTILUyJXUgorPTyoluAbMJEX0EGQtQm
X-Gm-Gg: AYBFou2xXJRDeHVCb22UHZNZb81BDMhANyrcdMVO4zIgF90JvjIVkcSuHhaaLvxbPps
	/cArixMSU0pOJRbQjFU24B7JBq61jSKuigk6xkWmvSxQSXZ1pnwCb50aIjhE6GCa9tbWKrZw94h
	/MtUnRECev1Hs5C+P2nHcfB1Ebam/FA8dma+L8QEKMOL6c/wFgI9py9fGHczoP7bja4xhtWtmkr
	6i8PmZH8WmbJpkTMbWVqu9d3VaBrN/Y8q6abMWgM8R4Rdkil1TW8y1dDAPmqaxlnM35NwWGx/vs
	CVQFJTMAnJLU2WEelvqzmjlCLi6u2u4HGsqHqqR2leV5ylOQvEncXny6txbqQGlyocMhPxkWuQ6
	nVxWWESkWpyAjKkqV9gTZiC+vGFI/w8hxTbw=
X-Received: by 2002:a17:90b:2b48:b0:398:dcf6:d40e with SMTP id 98e67ed59e1d1-39d70bb1bc4mr13342384a91.17.1789046953849;
        Thu, 10 Sep 2026 06:29:13 -0700 (PDT)
X-Received: by 2002:a17:90b:2b48:b0:398:dcf6:d40e with SMTP id 98e67ed59e1d1-39d70bb1bc4mr13342301a91.17.1789046953374;
        Thu, 10 Sep 2026 06:29:13 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-338f7bad290sm21568614eec.14.2026.09.10.06.29.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 06:29:13 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 18:58:50 +0530
Subject: [PATCH 01/34] ARM: dts: qcom: sdx55: Fix PCIe wake GPIO polarity
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-root_port-v1-1-90a252ddbbfa@oss.qualcomm.com>
References: <20260910-root_port-v1-0-90a252ddbbfa@oss.qualcomm.com>
In-Reply-To: <20260910-root_port-v1-0-90a252ddbbfa@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, konrad.dybcio@oss.qualcomm.com,
        mani@kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789046944; l=966;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=o5+5tvpe0ZPElsvDSlWdf0J/aKPzIjOAQ/3OGEfPAgc=;
 b=4EzGTzN6xtP6B/5K7QQOFFKiTCJMJMMiaGE/wVMBLKuVIXIdrvTjii+VV+Mx25KjDdeTsGJQ5
 qdnJMlmAfSHCKEQ4x319D0vYj3soddUk4vS/LLbdP47lXZrL6DWsyBd
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDE2MSBTYWx0ZWRfX7N0VibM3Sj7M
 WpRRGIiYqatugmmB1qfp9uAiHd9lvEgNfokYX0A6FFFpd9MU7373MU4nFfCo2Ss/++JFEmtDzed
 lY+jN4kybLKGQGS181BHlVPTTt+rX+E=
X-Proofpoint-GUID: Ztd5Mo_E5uMI4kL5n_7CgJz7I4PNwHcm
X-Proofpoint-ORIG-GUID: Ztd5Mo_E5uMI4kL5n_7CgJz7I4PNwHcm
X-Authority-Analysis: v=2.4 cv=EspHPicA c=1 sm=1 tr=0 ts=6aa2b0ab cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=bRpLjHfgeuKP4GRv53IA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDE2MSBTYWx0ZWRfX1wxc2UKEOE19
 hefZL4I5jlUdIUjMwCC0taDXe+P6pp2bDIa+mL5AoEtVlIzzBVTOBLk5R6s6DmVv6q65sZrmuIl
 uqJ73BYqS5eyf+C2A8atoa4Qhn3hbj9YLAeaLMbcqoU+VQ3FfBxZ1LWuxyOwAeYeUBK/llDMhSE
 mKWtckTUxnCGWw/Cg48ZcyD42bNSpdbUqiCDKFGQyrSpkgMWqYcF23ATH3VuTL7thZBoZe0RPRq
 AsJJ40QAqZLp0Q+GWv7dwRIZLn1eX9ob1r7G720viXbag2H6GJ+zki82wtfHvnmklm/DmkO61bU
 3a/T4x7CPGR9nkOh89/OVVD7weSg51JRdLmhwOvAqwOt7CZWHYP6PROdjFbLPLQPsErkPcOjgLS
 JhC5FpBm6EJ4vikIj71pjwZ9t/8VeuMvzYrve5E9z4LWI7Re8hQoWvljvTHABr1mnw6mbfu0gvH
 psgY9KM+bnYFhMeX6dw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_04,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 malwarescore=0 adultscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609100161

The PCIe WAKE# signal is active-low as defined in the PCIe Base
Specification. Fix the wake-gpios polarity by using GPIO_ACTIVE_LOW
instead of GPIO_ACTIVE_HIGH.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 arch/arm/boot/dts/qcom/qcom-sdx55-t55.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-sdx55-t55.dts b/arch/arm/boot/dts/qcom/qcom-sdx55-t55.dts
index d23b8ec08af4..0443a86899a9 100644
--- a/arch/arm/boot/dts/qcom/qcom-sdx55-t55.dts
+++ b/arch/arm/boot/dts/qcom/qcom-sdx55-t55.dts
@@ -249,7 +249,7 @@ &pcie_phy {
 
 &pcie_rc {
 	perst-gpios = <&tlmm 57 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 53 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 53 GPIO_ACTIVE_LOW>;
 
 	pinctrl-0 = <&pcie_default>;
 	pinctrl-names = "default";

-- 
2.34.1

