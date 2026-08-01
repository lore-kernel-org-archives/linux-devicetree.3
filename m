Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D895F39A07E
	for <devicetree@vger.kernel.org>; Sat,  1 Aug 2026 15:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785596848; cv=none; b=RnV7RE/RAn6BBBVJILGW4i0V8ieUF2D5S1PFgXZhYM4+aeWauqy1EGINfmOKyhWAE+TH8BDlr0b7sSQWjus6i2gNxOOXAn4MwXiouS0vhz6618Hm20TEljzfbMrQWu082iPDOuKKQgspElvJmrJLL9sl3YsM3yqpKIHbDLdWzZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785596848; c=relaxed/simple;
	bh=tvFHESM367aZbumd1u+4624Oo3B8rwZfoF4ToBWH/7k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DzYOwrfNjfdQxBbPNG/BCe1QKnzZBnKRCdxYV9HfHNV1n1qszav88rvjm789dAkWJYkNweMtjIjrb2cyqcXjsN7+7fPAeV3vUehR5l4IOdhy7gStkZxaDmYBw+VdWzeeMw3wKFuxW+bqR911QqpSKkc02X/gbgkJiSCCn8K/Kmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Csonw4ew; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RyEeaxFc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Csonw4ew";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RyEeaxFc"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 671CamOJ2815534
	for <devicetree@vger.kernel.org>; Sat, 1 Aug 2026 15:07:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mCYheONZeVyUux6sPE93G9D6e8BL29KvG8pWZH8cW3M=; b=Csonw4ewY/uJFqWj
	8F2diPNbi83FrFu1TestrQXTznkVKcoJzo5uWbP7NVQK22JvXM1np3eAsL1NT3Il
	63ca5Vobut4E/2/4EM7yK6z3jpR9oZmIHwkuOyvTX2rf6d8ea31Onj0p5qxgVv08
	DPWhSbpffdBX7k02P/XjUhBBCuRlAzDfvoQlwVuqLwXT8n04dEq7+w29HmxvPJbV
	Z2drdPcjX4/K0YW6JGjnkM9FfTH38ttdMOSRv5kCkC2XGDi5Prbwq05rpxCsBnQQ
	8Ftm+fEVxJ96JCeoInklO8qxmG0fe5UNNKaMsvu/PSPe3PzYJ5MXUJfw1UlTgvA/
	w2AVoQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fs9jfs0hk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 01 Aug 2026 15:07:26 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c1eb52e1fso34182751cf.0
        for <devicetree@vger.kernel.org>; Sat, 01 Aug 2026 08:07:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785596845; x=1786201645; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mCYheONZeVyUux6sPE93G9D6e8BL29KvG8pWZH8cW3M=;
        b=RyEeaxFcx6V1wnZ87uXjdI/QF2hfNNzEVW81B4u0OX6zAZj+6jjCS1TI2kov6eKiCC
         WafL2hvBnepLIcafcD+8RJUl2wkAKyqGX+lSjtwfCq3oNVSEipucbzOp0WeGhbkgkia8
         eHOZPaQMrG7oWTMummU2E4FRJLnlZJOi4Z6WWygvk2g6Z14/2U7GgTAEnYLNps0cihW6
         xVT4VSEpwjZT3kg5QUgXVv+3edyMZbzHM9gandFMDBiDBQNTGfAmxnexUgOEcIHnpC0G
         8vfXUpwxTIyE/ljA1QdRUQI5wdT0Hcm2t6cvNM2D8bx3tjOVWw0gQiqjfYcHhjL1o9kK
         vA9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785596845; x=1786201645;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mCYheONZeVyUux6sPE93G9D6e8BL29KvG8pWZH8cW3M=;
        b=AyJjATnoWa7CoF+cv5YPAnHufwVttZ6I5o5f7km4fZIg1NlCxTfOvKpPotIfNkfiXw
         pmbU2asUS72cgrfXjFWQilUgJvb1rgfeWSOCF3gS+v2bi/HRHzBENk9JdqLguTLJ+juK
         lWtSGImW4kuOyg6J8iENclCFsi6sNJb9eG93MLEPBWr49qGHUJxY8+oiXAkOdL0eQ/Ts
         SiQ3wZtzeJhpsXfqISvIe3Bysygdif60pX75jrNvh8bylj9mlrFrVCeJRGMFcG97+s8f
         CjXbTt1d2FrDa0G1bJQPsB1XWJyoqF5MEZugjy/jUs6YpzfXGN+h6Ru+ozlU+UtXBgdO
         4SCw==
X-Forwarded-Encrypted: i=1; AHgh+RrJJfErIvGt0JcZdvieeiyVhfmSU9LKqY8eFZQyveOlHBrRfCuTAFiL0D0C48qXIioi6v6qNACUtRzn@vger.kernel.org
X-Gm-Message-State: AOJu0YyBZ6tVx15hGoJbLFg0C+aFjj03YMImqZAVjDNUBvSSK+iBy5Nz
	DXXKR12tUK6nEZ3SR8rLcf2WGeIKM4vhO/bS7Udz0cGRsmJxpKUpXGbSNXCZGNhJ75fSKI4JbE4
	7ZsSRvxjvpLre6m1OlOloQZH3c27mz9T3DAU8zErqTCpElV906bX9Ce3GSUX2G9rc
X-Gm-Gg: AR+sD10HmDy86p5uAo18aGU2VDSj1xmI/4P8NL+R5CZ6Jnodg/0J5T7nGWAWMiYMysv
	x6+KLWlkAxiKOPvYaUs+1U06NaGroukLUAyQiTYgc18hvhm5FrrZTPnI5dibMvKTegppIHjHKEX
	bTGfmd0+kS61iJGBCkW2qYj3cdXIXLXQULgCUiTQOhan74zz0NI0AkTgWgXmFMFQEhElF0/ODNU
	70wcu6YGYvIvG8SAa8hkW8mfGxoW11LZOXLrOiz4bm9vlz83fMGyYTflPopOVu4Y/CV1hAXUyjn
	BWTsjqdjPDHh7XidvmyNIUP8dEgd3j2punqqf4yzqtxP7T4yMN9VLu5d0JNRPoaWLwPgk5Ld4YD
	DEzUQcyR2P/L7Ufvn430oHy95
X-Received: by 2002:a05:622a:5585:b0:517:58f6:29c3 with SMTP id d75a77b69052e-52b56791b19mr90549511cf.32.1785596845239;
        Sat, 01 Aug 2026 08:07:25 -0700 (PDT)
X-Received: by 2002:a05:622a:5585:b0:517:58f6:29c3 with SMTP id d75a77b69052e-52b56791b19mr90548671cf.32.1785596844783;
        Sat, 01 Aug 2026 08:07:24 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd45a1abfsm16005222f8f.37.2026.08.01.08.07.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 08:07:23 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sat, 01 Aug 2026 17:07:01 +0200
Subject: [PATCH v2 6/8] arm64: dts: google: Align continued properties and
 add missing blank lines
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260801-b4-dts-coding-style-strict-v2-6-f09a659ab80d@oss.qualcomm.com>
References: <20260801-b4-dts-coding-style-strict-v2-0-f09a659ab80d@oss.qualcomm.com>
In-Reply-To: <20260801-b4-dts-coding-style-strict-v2-0-f09a659ab80d@oss.qualcomm.com>
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Peter Griffin <peter.griffin@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
        Tudor Ambarus <tudor.ambarus@linaro.org>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-fsd@tesla.com
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1916;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=tvFHESM367aZbumd1u+4624Oo3B8rwZfoF4ToBWH/7k=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqbguaDdezS54sRaZP1iIZJSPoM+6OvHd7DGHhj
 0S3Y+q8P6uJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCam4LmgAKCRDBN2bmhouD
 11IsD/wPwLlkbos5Ms6qZ+lSZdATPFCZrjyXfx8e72rwLVy0Q8l7tmB979Q8mvzSNLu7YJNzKtI
 29tG5bzpYE8CL+IIDpXkUKWZrV7Rk8czYpkPTxGmQplMqhJxR77kivbWYE+Xsvtl6ETth20hb+9
 60GVI6yVYRjIPBosX5GZGY3oAHAND1mKZNVVVrUo0WT/a9n0zLsDRXXcL/dI7uML6cm6fP2Ek2N
 qNVvEesJZBOV3UgxGryVtmf3+OVio7Ro67H4N6fwu8y9Zqcgan2azQIevUR10NcBVuLCChOTFGs
 goISA080JIsiif9cJtzrNZue572TtAw0fZQA2ufPEEpf5vHyOG1uPGqfZ1njLL/PrACU8+GON0K
 mQXrdzjpJimgnqXCBzfxUQqsDVY/wStPIx1O3TIBoeMUPUvt//iWFaXsF7LKYKhKijHfB9G+3wd
 Of3QeheLlldOKNY5fA6ZlJdBV5wMEprAa2bw9GEJi8E0U/u2NyUA8OxToWLXpwNhdEcrQAXrLWB
 prZvMCEQLCjWOWMTj5WlENRhIjG6lV41UxDWp+8JW3IELFfPOaRJQuB7e5eUaRGvA7YzblBlSjp
 mpE/atyKlYOaggQuJZ7vOeX1JLLcE+PvdfbVwR2K6mRiQ/CyHXeAhVkCRRjHgxAKOoM2zHZE8xz
 eZ9d1O3gh1+JNDQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: 7nd73_yFviPxQtpRbY2tPA46N_kqLaka
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAxMDEyMiBTYWx0ZWRfXyuE5oSGvsPqC
 pk5UQFoHRw6cvomXxnVunh3C/rSRSscQZSMH2cQkO9cwKFs1lInBj6DG7+ulecfoBkXVq1FLoQJ
 lKhc3kZ5ooXdBGSOqYSnXkNL62aIb2SqP8HGcGEPGA6JRL+ji7ga7W5qejkYeOJZ41ySdnycX45
 Ivjh4dWtyLtwlYTnJjVA/WK6QKrvpsheRh9RBBQmFmsQr1cIgZmiYBUBPN2H/Xm7FH31ENIdL3z
 UwNUMedNud2ZimIXuMbunmKxUc/uN19aaHjFYQv9g9oxiG3i8iLR/a9hiFQ6HQOx2VmHwVkUNpf
 fzFHK9p3FBf3R9kjf9obqIeMUNC2KWV3Nn3GsltqjwPgo62xu/GDxfTQUkBD7lOvw468xdKILPI
 HIeoxbP97L0Fg2ZYqnOn1HysDbculVz0uEPWlmuGoOEyqOBDh/9A59z1RYJHzAFgcv2/UxYp568
 ABIqBYyO3SloDGYkQPw==
X-Authority-Analysis: v=2.4 cv=TYSmcxQh c=1 sm=1 tr=0 ts=6a6e0bae cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=JN4siRDuy4uOFAZNwAMA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 7nd73_yFviPxQtpRbY2tPA46N_kqLaka
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAxMDEyMiBTYWx0ZWRfXx4T/kJFfBBLi
 B9MgAg1awPhnqM7aSqSDzPYa9OW3rXSKtyC5A4Bk9n50QRKAV3Ozybh3HMkUqoWUDtOyNoYuS7H
 acB7+U7HpzR1pX7GuECxTLR5PLI8SqU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-01_01,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 suspectscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608010122

Trivial white-space only changes to adjust to DTS coding style and fix
dt-check-style strict warnings like:

  [required-blank-lines] child node must be preceded by a blank line
  [continuation-alignment] continuation should align to column 39 (under < or ")

Reviewed-by: André Draszik <andre.draszik@linaro.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/exynos/google/gs101.dtsi | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
index edc38f2d1183..bfceea5486f4 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
@@ -39,12 +39,15 @@ cluster0 {
 				core0 {
 					cpu = <&cpu0>;
 				};
+
 				core1 {
 					cpu = <&cpu1>;
 				};
+
 				core2 {
 					cpu = <&cpu2>;
 				};
+
 				core3 {
 					cpu = <&cpu3>;
 				};
@@ -54,6 +57,7 @@ cluster1 {
 				core0 {
 					cpu = <&cpu4>;
 				};
+
 				core1 {
 					cpu = <&cpu5>;
 				};
@@ -63,6 +67,7 @@ cluster2 {
 				core0 {
 					cpu = <&cpu6>;
 				};
+
 				core1 {
 					cpu = <&cpu7>;
 				};
@@ -1681,9 +1686,9 @@ usbdrd31: usb@11110000 {
 			compatible = "google,gs101-dwusb3";
 			ranges = <0x0 0x11110000 0x10000>;
 			clocks = <&cmu_hsi0 CLK_GOUT_HSI0_USB31DRD_BUS_CLK_EARLY>,
-				<&cmu_hsi0 CLK_GOUT_HSI0_USB31DRD_I_USB31DRD_SUSPEND_CLK_26>,
-				<&cmu_hsi0 CLK_GOUT_HSI0_UASC_HSI0_LINK_ACLK>,
-				<&cmu_hsi0 CLK_GOUT_HSI0_UASC_HSI0_LINK_PCLK>;
+				 <&cmu_hsi0 CLK_GOUT_HSI0_USB31DRD_I_USB31DRD_SUSPEND_CLK_26>,
+				 <&cmu_hsi0 CLK_GOUT_HSI0_UASC_HSI0_LINK_ACLK>,
+				 <&cmu_hsi0 CLK_GOUT_HSI0_UASC_HSI0_LINK_PCLK>;
 			clock-names = "bus_early", "susp_clk", "link_aclk", "link_pclk";
 			#address-cells = <1>;
 			#size-cells = <1>;

-- 
2.53.0

