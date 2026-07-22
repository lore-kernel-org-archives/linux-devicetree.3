Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBC783932D3
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 09:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784713275; cv=none; b=qJ5jW5xMbNDXn1n/yGpixjAGrLhmAt7B50SEj3q5nRiq81ywNI7MNrZgJs9mjpYySL4YiWRy9YtkZvCRNYmVYkWLPqXMsq1IUPCGYzpYCiRQgLQGuVamq8l8HDLNMjbhfyO8+z41qyvW4h7J67ZCOGfN2bn4u6hqe9VG1gQlxxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784713275; c=relaxed/simple;
	bh=VlcclP5nYxGv1cjwCZW7AaF/SOlzYR38DZXmK7EqoOo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PfuOAVZH/HcfkfU54FYBLHcaApPxs6zt8HwYlXTyVIk9Y3kpJsv8XvJfqvY5JTfQGhHRMl9e282h9W12vJnTv0Xl8NQchx8sXH0QzzLo6GgkcXUN/H8zWCt0w5ZnPSDpOGYH9gaviyrP/l93bHr4oUyWnmqEqJU43oHSvUdiKAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i1POdT5c; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XZ/R2C7Q; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i1POdT5c";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XZ/R2C7Q"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M8xRrK412903
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 09:41:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+8ZUMZXKWXDvmPVytUGRNQZnp19N5kQlPOcsIMgZaLA=; b=i1POdT5cFI2LWKdi
	Tb0Pck+mh2PIfLKPP48z87gz6kvuvwlY9TSFVtpt4IB4zv1TJLYs+uL2nOiGKAq3
	ZuDZJNG7VkHLKpiZH6V91Ak/ShBd8xwAWcczZfJkHfVsXy+aGQ711aXebpMntSGI
	oXkTxbH8xh5Po9a7d5TQjRbsMbMqV1nX45MyAsn1sgmmM4hn/gbIioQkYwHe0BNd
	6jX99dWbyDCQASPNFJPl1GobFJBGdPegu7UBRlBER2Lx21vGSvvGkDYUB19iTAvn
	6Xa5F3r7hsBjovJjQ80djQmaOuv4duGHfki8uviLBXz/+ckoO/peG2mTtYCTB69s
	au8STw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjpxdh6k4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 09:41:12 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8e9489f62bfso269992286d6.2
        for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 02:41:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784713272; x=1785318072; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+8ZUMZXKWXDvmPVytUGRNQZnp19N5kQlPOcsIMgZaLA=;
        b=XZ/R2C7Q0wy/aSlOiSE3GDk2T8Vnjr1COX4huDJc2mePyjIb+xjUzvvoeF0bktGX56
         wkEFFP7e43mP9z4Y/rvHetMNiapGgnwMDDT5SvEfdxZYCX39us4G3m4UuuJqMkHTmKOe
         dUyULwb0lK/69TEWBRFI1xiyIEBfKcpdgYTNSFLoBNKjwFu2kfSzydrz04Jlz0dZdqa1
         A06wrMZTwZlvJ3757otJEQGmr9Rrl1JVJmzOQqSw/mXDfm26lUpyNWaE7YHUMShMEA0W
         51I+57+IRMZoai4kZ/WN6HMa84Xht830B5oc4iYk4lN8RD7txu4BtHWkVNAZIe1yMirC
         52Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784713272; x=1785318072;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+8ZUMZXKWXDvmPVytUGRNQZnp19N5kQlPOcsIMgZaLA=;
        b=rJxv+djmtDwKDhIOc6BDPkaQhtp+R3QzaYJgM2a1lOZWOt1nIJq0qwEVvWRJJjAQFp
         BB3oWlRPhFpDPLWNb1yr96/FYnvyRwjkHoWorsO43/rp91xcOIfLqu2ZP6fzHWfwTNjq
         zWExrE71erwV8R7Xxqaud9eP7EbCxJKys4bEmkoOi1g07lnDm5AfZDDX6iDvTA8IpbWc
         p1RBAtHg1Tdmr2OlVHf9J4W1UFY2kHsNTn3dUUYRoS9eZ+Pw3lA01wk+9CclgQRWb1lI
         7zdOYAhDwmoiPm6iSYUzrNP0pdoefAqIQ8VrjcR0XuuUbiwcuDbznBtyKkGyt+qEFEJd
         Pg5w==
X-Forwarded-Encrypted: i=1; AHgh+Roytmk3ZrY8t57DgZpF4/2iesw2PxQSR3lghzYZvu57F+3pR/rPuUs7KQ5+sX+9kdypIrICV0oT69lv@vger.kernel.org
X-Gm-Message-State: AOJu0YxQ9fY5JRJ7hBhxixAJ3dgi/sPR9cLZH9VjvoTizFbFPQVrHAdX
	BfDRef/1ja/EF1C+VRnMGDFPRF9AyPDXpM8AUqqLm2KyCw2EUDilJ6wZXtzjssUTajCd3Sq65GR
	99qeDY0Omxhvce9hx418uODQDs9yOXDt3FepopG1vssqliruYHfeeJ261HlTqf/Sm
X-Gm-Gg: AR+sD13ESOkd1QrViuo/l6o0Eh8fPb18Iso6YGe1BFHmH1HniDiP8lToQdMsIBrrpw6
	x2m+i8Q7hSseH58lU+RE6brwMvCanj2Mu+RvR7/7PnTlVm0+nyLJWfrblj8Ki57M1cN9qcLIX7n
	CemO+eUguk5nzhAlXLdmG4RhjP5r3a/BM0Tyz7i6IqdwB8+oxgRxK6DZH14HTGxTt3MypJ4YTjh
	Q3F4lg/VZX5B1d9MFPyEkoLGWuDiTHkgvGhAk7/BSnAOlWsQHGdcmlDxWZUkGaWivy5PDk8EOXY
	/jgiGNSwXB7eM0o0SbdBUsWAUTYkdXeGtFQJF+njt+OB3weaYl3Tw8dP/gNdFNyeQdjmwRoln2j
	XBJVNP98j
X-Received: by 2002:a05:622a:1456:b0:51f:798:cf16 with SMTP id d75a77b69052e-5213e17e44bmr198558471cf.61.1784713271434;
        Wed, 22 Jul 2026 02:41:11 -0700 (PDT)
X-Received: by 2002:a05:622a:1456:b0:51f:798:cf16 with SMTP id d75a77b69052e-5213e17e44bmr198558201cf.61.1784713270794;
        Wed, 22 Jul 2026 02:41:10 -0700 (PDT)
Received: from hackbox.lan ([86.121.163.114])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c6287csm4816398f8f.25.2026.07.22.02.41.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 02:41:09 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 12:40:53 +0300
Subject: [PATCH v2 2/2] arm64: dts: qcom: eliza: Add fallback compatible
 for ADSP remoteproc
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260722-dts-qcom-eliza-fix-adsp-binding-v2-2-e1e98ae15533@oss.qualcomm.com>
References: <20260722-dts-qcom-eliza-fix-adsp-binding-v2-0-e1e98ae15533@oss.qualcomm.com>
In-Reply-To: <20260722-dts-qcom-eliza-fix-adsp-binding-v2-0-e1e98ae15533@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1115;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=VlcclP5nYxGv1cjwCZW7AaF/SOlzYR38DZXmK7EqoOo=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqYJAvYVUVZmaEDLwfc5+NGstob69pFvKJuUZ+f
 7jVKIAEvP+JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCamCQLwAKCRAbX0TJAJUV
 VnNDEAC3A3yXzfTT5TH9zoZzvcea0J0ltTngJoD9rhCQ+fJndu1t11LmSxZNqWTZCWRY+Ar/egB
 26f9NP45xIWXHAKdhPtKPJEMWuz6a2y5Ro5VXbn5lW8Io8NTHt9JSic6/Mnn1EdrcHhqyfHmVIO
 jQaKFMaQgskzr9MayOhBZZQyanbBtJwbPcAs/TMwD24l/MuA2J5/HLWMEPCG+aXvFRZrGqHPCoa
 fTv+XEiSIVQzTC2QSua7PMektiaDcm/nhakyS6g/YPTJuJnWG2UJhwYoUbQnG1Sg9U3IRv/+ggY
 hTLjGX/LkL6es0yyvNyyCEL2XH04DXyL9CGCBCo1RJMuiZkeTf8A/rIgcfmYB+GFNzCAkmR4uGI
 tkZVULyTFqrRWi38H0u/XuaqfMGIFghT7QQ+10WSF0tE5JGcSdumvjPFuIDbRmElKlGdwBnCXTx
 WTUjtcknFzcW3NFQ26lLjW8wb2xDpEzdyDXE3G94UZvGp+kYKuwRkjNd1BHsEeEpqgk5IscKz6J
 jxWruhkjSofjSWmKxuoVhH50oZnRnxtYNMN2a4qkPoNah3a0zuPdlTtBR58YxtU3fhZWP1Mnm1U
 uYyDuNgC4JWSIbsTw4Xu2l7EtU4c43DvudQXqzU68kahToqjIVimK0KVjzfXG3L9DQEUoBeT/3G
 o64iXRSfSwjclqA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDA5MCBTYWx0ZWRfX57hAwv9SVdPT
 Hvpt8DNK+RuK/Vvgv/Seppi2D7Cp1YOH8qRkXduK6/7A4U+dCrRLndsWLC3WXq3x6g3UQPllZzf
 jPuGz/6B0suQu0wJu3KJN+9t68YTqg2tDoFxDxzJB9qgWXEUlusrXL0hcSUEs1/wXSaCzkeMUlp
 Q/eSmXhhqty4AVj18Vov2u75FI1CwsnUc0eSHqd9rJ+01QUIHYPpr6vwAnhtLi+DCnxicZbGW5a
 pf37gwjySZCh48fkBH7m7p73uEkPRumXoxV2VngDMJOClNTzS+365eLYOlkn+LvnYIMk6nBFmbT
 6f9s6e4nCvfzYpqXKf4Yx23jiGIIM0x7NhRe11+EOY3Bs6iXAwzqcD+wwFtlHwZwUaVlcOt2YUC
 R86NJim1V582fhfCwIx7DylYgFvw6GZ1vKuAc6K6r5YEyrP1KiuyBB+BJ7ZctmErmxcG1jufQ0U
 /uQwDdnD1KvPhDikcVw==
X-Proofpoint-GUID: WtgseYImB3JETtSEl6sycicYYAyOiteq
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDA5MCBTYWx0ZWRfX2+5ulsBiD5n5
 Li1jHXByL0sSCgYfO9+TXmNjSk0DkiiGXQj+RPIay1TMrgEF7yI217jJ0Agz3EvxECnEW7bOYrh
 DAb0KGh/5STYg/7b9wtwjUc5o4RYqV4=
X-Authority-Analysis: v=2.4 cv=b7iCJNGx c=1 sm=1 tr=0 ts=6a609038 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=6dw9+iwJWV8PcCi9M4lOBg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=0y1tdHGNZ1wmcLNsCGQA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: WtgseYImB3JETtSEl6sycicYYAyOiteq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_03,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 suspectscore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 impostorscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607220090

The ADSP found on Eliza SoC is actually fully compatible with the ones
from SM8750 class. So add the SM8550 compatible as fallback, just like
the rest from the SM8750 class SoCs.

Fixes: 88ddafb01ec0 ("arm64: dts: qcom: eliza: Describe the ADSP and USB related nodes")
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom/eliza.dtsi
index 357e8066c176..5712c094cbb3 100644
--- a/arch/arm64/boot/dts/qcom/eliza.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
@@ -1967,7 +1967,7 @@ tcsr: clock-controller@1fbf000 {
 		};
 
 		remoteproc_adsp: remoteproc@3000000 {
-			compatible = "qcom,eliza-adsp-pas";
+			compatible = "qcom,eliza-adsp-pas", "qcom,sm8550-adsp-pas";
 			reg = <0x0 0x03000000 0x0 0x10000>;
 
 			interrupts-extended = <&pdc 6 IRQ_TYPE_EDGE_RISING>,

-- 
2.54.0

