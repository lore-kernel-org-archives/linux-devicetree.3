Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01EE2522694
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 07:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790063501; cv=none; b=Eof/vA3a3K8dUXMQmCh44rMEXeQ9mEPwBEvvXdOqzVJH358xRQ+BQy4lKwJUVPnAZ9KumWUL/zO+kQap0XyqqKxGfO5uAv+SCAznOz5zIqEY+pt7R3keJ940XKLbea9e3ILjx6s1+neGq/kyLg5bNzzRX0I3KG+GcufMPCfiwcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790063501; c=relaxed/simple;
	bh=O3400lnsfhj6gX6Ma08ctxREgMcXMobfMMPayI2/HqA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EYhdc8yF6/i5Tb2ngj6ex7mFU2EjwPCv0dRcmK9/5cmrl5B0iDhvxg3GVghaVnAuyZncyKt5PMY+KCVcebC91hkDxMWgFi+JuFkLFyd29J8yM6MhQQREd+zSkHgLMR6F/7/HLoePb5+KUQXxxJy3P+EoJRItEoHg4ZtYwAavrfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IxsXALdy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E3O2zqzp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IxsXALdy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E3O2zqzp"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68M4MuND3383563
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 07:51:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7KmwebJOVp1g+ImrGtWLyrw1qxlVtRavL3g9ATMzo1A=; b=IxsXALdytZim1qmu
	lS1GShro2eGES1MirpDxdWlYbvrN4Nj5HNuNs0Vb3u5Md+KzJfwUyF7carxh6GsZ
	L6/xEqawmi0+N2BgxmYw0gcePOUe88KwMU3VMVa5Ty9Hrkk33R+N4N3Fuca7bioJ
	a4qeFoXg5JAqI+SF66PoOPuTkkbP+6u7+e/M2ChYTKAwgwpcmUXj2foupCTPsWa4
	SqNfOWk3BglFqkoLQHV5Dgo/kCXJV/VF2UAkMwzkJYegLIce36+QnIO+mnphP/zg
	Oeaet2uxuyAMSoqlIvtL7fORphHuRDeMT+GyDfqvST7vy4sZzmvI2OgmpWPZSgwT
	xcqftA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gujkj8rq5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 07:51:33 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93909014c85so730748585a.0
        for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 00:51:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790063492; x=1790668292; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7KmwebJOVp1g+ImrGtWLyrw1qxlVtRavL3g9ATMzo1A=;
        b=E3O2zqzp32BVZPxgwDESAAeRMxOoYSRLKwGenxB76eN0xCvl4P73qwOsaBNfsp2gy5
         ky/XOYwYxiQCv8F0UuHMx9HYz+1+pdSNZ704el+gXw7kM0q6KOiCGoZchwF2HjnTpvtX
         XEhzv/XRA8uhe6nNu89jtnKNgmHYV0Xku8eAjpFzSDf6reSR/IRdk6zOgZyrbkegFSDM
         qNVXqdhtCJLsiFZ5QKAfaRKovrgxfuQ7BFt8Qdnnr0ct2Lv9tEYhtC4yC5Epjnv827NM
         P9qz0aeT7XviuwxVNmmzohsbQfj55Vyaqjm8qKqEKxM/GapOldN6nQcwHgP7zmITwX6a
         dLIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790063492; x=1790668292;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7KmwebJOVp1g+ImrGtWLyrw1qxlVtRavL3g9ATMzo1A=;
        b=2HLgZ26RonfoW30ZSeFmXAJTrBLsUEVJW/oC1BCxojun3Pe61bY7YAo2zDpWoLmA4q
         0MiFw0Kjs/HcBrio/9xihV6z4apNDp0kmWI/DwZFTK9aeUZAhlFW10ZGXHkzdp8yeT/2
         Szg9w9qRFjUv1NCGGRFCxxyVZJ4ViDlH2JkVYCVcFIgRsKBE7Se1GoWgWozLAM0UlTd1
         0DtpEyv8b3+Fz7zov80K4vPijrtyUE9yFCIJVHizV6y9xGHzDAvy9HXGG2clNj3mffAC
         QbBgGF6Ksf8hEcE0tVwWtA8+vL8xHIaIYCcjmpVItDM9AYKzNf9eLoAa5ScCaxB3b4oN
         s/Gw==
X-Forwarded-Encrypted: i=1; AKwUvBzQZk3DBKtUlgNQm1eFW74qF0UFy6Gdq9M2fgF7HVrBJpJ6+B9ie/igvlZ2uU8+8yzKpRHY0gmoVSzd@vger.kernel.org
X-Gm-Message-State: AFuF++k6DGfw3cwHBMIsK5BC9e7c34e6EpYEl2WNGw/tCFQpVXCVmAZB
	h2hNXZWPPT2BJDoZiiy0QNlMMzOFN3EOoFKZvKUOQKhQk6EVTqzlJej3SeRUiIlP81FZvDWXz2T
	LAnbfEZf+B3nzc69pXbAO+YlgBZbHdyFRu6O5IkZBJ3Lu4YFacKlCdWRCOwMc9BOt
X-Gm-Gg: AYBFou3dUpo2z+BKxm1VknLAHjNLaAUMfsz6fzof4WRsZ+USqAhmizMTHmsZnh/MMJf
	zFsbkZrdgthFVQvV7VExq+2q2eXeNmvPdo3lWrqtlkKGfss+vc2tJgMiSd5yzI+xVAAZWzELenE
	VI532UFTRGw14jSTrjUmdM4Y9fETNC9qSXwERG5+EVYtxoevhJuD/pmEGrS9NyNBvmQPkyYBbDu
	VXFBMY+8vb3ttFhuIp67gYZKbDfkBBOkZHFZ8Ry6MJnFevRjT2Hz0PGHVzrzrRFKrC3pndF9Bcu
	1mSBEM1UT2CPlekKyKY1mKfK1A51t46XgQRnT4YvYouyUN1zGXnPMPxsTVGUCtVEnz65cyjk6Q0
	VsPDHuagG
X-Received: by 2002:a05:620a:400e:b0:939:191c:cac7 with SMTP id af79cd13be357-93c15d53ce2mr439985185a.13.1790063492054;
        Tue, 22 Sep 2026 00:51:32 -0700 (PDT)
X-Received: by 2002:a05:620a:400e:b0:939:191c:cac7 with SMTP id af79cd13be357-93c15d53ce2mr439980485a.13.1790063491524;
        Tue, 22 Sep 2026 00:51:31 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48862789080sm3046925f8f.28.2026.09.22.00.51.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 00:51:30 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 10:51:10 +0300
Subject: [PATCH v3 01/13] arm64: dts: qcom: x1-crd: Mark the EC reset gpio
 as reserved
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-dts-qcom-hamoa-reserve-ec-reset-gpio-v3-1-fde7f8a53382@oss.qualcomm.com>
References: <20260922-dts-qcom-hamoa-reserve-ec-reset-gpio-v3-0-fde7f8a53382@oss.qualcomm.com>
In-Reply-To: <20260922-dts-qcom-hamoa-reserve-ec-reset-gpio-v3-0-fde7f8a53382@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Marc Zyngier <maz@kernel.org>,
        Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
        Konstantin Shabanov <mail@etehtsea.me>,
        Srinivas Kandagatla <srini@kernel.org>,
        Ettore Chimenti <ettore.chimenti@linaro.org>,
        Georg Gottleuber <ggo@tuxedocomputers.com>,
        Xilin Wu <wuxilin123@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Val Packett <val@packett.cool>,
        Laurentiu Tudor <laurentiu.tudor1@dell.com>,
        Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
        Dale Whinham <daleyo@gmail.com>,
        =?utf-8?q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Harrison Vanderbyl <harrison.vanderbyl@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Konrad Dybcio <quic_kdybcio@quicinc.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=964;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=O3400lnsfhj6gX6Ma08ctxREgMcXMobfMMPayI2/HqA=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqsjNya408nwdZywSYCUn0nfKmSoHVXn/ENxHe+
 vjnsEQ8VqqJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCarIzcgAKCRAbX0TJAJUV
 VmVTD/9u3B4NrEXRnNyMMFDBYmaMs4g6cSylS3GjzqlD6++4RT9oY2fLiF062z8W/U2gZGx6kIX
 tjQfnojiXz5roFh2JmWu6YxcMNHQSV5ev4Z1ckTMjkeQSwQFv11Th0RZtE6p6XxG1reC2zram5T
 bjxwKXU3JEectBwSQVdCUe41r4mE/0SSQn034AHg7wEDXIQD5jNjR6d+89rlnBbtiqtGrx1uAVE
 Ji9l3Q/7NZa7kG/xcnDUKJQaNDXltrb/j6WtEuKqY6a55TpboLmIaElU2yiRw5FBa7Xy5rnLW6/
 epRwg8dFoJcuVWTe6vHJZHXo66ZXprnZFniu3LPcdy3wHG0Y478VnQoaNEVqbo/4KsrqSzk2RVV
 SkQWkkrQJkGBUMre3hJaZZajNTeWU0ebBH1TlbdnxCdXqwkM3D9OSHQG0yEbs7Dxtc4QFFxFvzs
 +DmolMv15npCsqtMUG5orPjP1BjsIe80IP3RyB1Guz79BLN3MjoyfSHImn76Wr9ACeMSkplHu+1
 maFhtKDzCLgJR/SFD0tMt9R+qacW9zxM07NGs1xSjm97hfVo9utaEy7zWBUw9eCDGaz8dMjWvLf
 CrlSmp9OgFO1yvOtdIGT6BhVc3E5xOGCrF0xV4FaHUFEaigVE0zQb0Q7smlSIssyhYCr321+Xzc
 sQXc4WFqyu3hRHA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: 9AM4mJkb1tHDJOT2vWPv6S2UpUAIy7xF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDExMSBTYWx0ZWRfXz+xBd12eRyb8
 mj3u/qEcFADTlyvD30+PtTKnytHtH3xzOhZOFuzFoz7UKQVvKtrgxV7TnFuVzBiVuy1mITvLrjW
 CC9jQVwIKHkjfck05ivYzvGgFpVjxpseWHatkWknwsuNPjcxj8Ghlq4+S1/Xm2RPYwf31NOELBo
 NgWrNaAa0DkjmzwTH2TH8PjAKXoIOgA6rf+3j/UvlcXYRuCEg5eYgMC5NydTZJi167evD4OFk9+
 VNhMSS6XLXzxDibssFBJk8rFGMgEXgJ1yO5ZRq5del1CbwTAiWlHCo4lyWkaUCh/m2GyzXkH/yG
 fqrIKMotG/EExJZ9gjtoQuqbAlCX1w41/TLmk2sbp0FeVHodH9VUPqzq+In9eHZ6nlcR6EIajDo
 lGR7WKdbMC9iB5lY0RCJBhO6pBUaO0vXYBYZXZW5HCYK0j5ttUJMlZBDQHqeQmMFOBPfR6sFLja
 Q6w5A0GoZc0FcjVffKA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDExMSBTYWx0ZWRfXxYaAP+jRQ7OW
 1L78JjmkWotApdu1UpUb93w+aAY02wF5rDn+Xj+XHmNqq6UNSanCljSVaEMfEo1LhTB3Y7dus2N
 H5qhfttwkF3K9r06EgoH6nEUcz3copQ=
X-Authority-Analysis: v=2.4 cv=SuAFe/O0 c=1 sm=1 tr=0 ts=6ab23385 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=5jbA5IEhNfGvyO7prDwA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: 9AM4mJkb1tHDJOT2vWPv6S2UpUAIy7xF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 spamscore=0 phishscore=0
 malwarescore=0 priorityscore=1501 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220111

GPIO 65 from TLMM is connected to the embedded controller's active-high
reset line. Asserting it causes the fans to run at full speed during
reset and leaves the keyboard non-functional afterwards.

Reserve it to prevent Linux from requesting or reconfiguring it.

Fixes: bd50b1f5b6f3 ("arm64: dts: qcom: x1e80100: Add Compute Reference Device")
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/x1-crd.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/x1-crd.dtsi b/arch/arm64/boot/dts/qcom/x1-crd.dtsi
index ef9c8836c33a..fcd7cef6660f 100644
--- a/arch/arm64/boot/dts/qcom/x1-crd.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1-crd.dtsi
@@ -1552,6 +1552,7 @@ &tcsr {
 &tlmm {
 	gpio-reserved-ranges = <34 2>, /* Unused */
 			       <44 4>, /* SPI (TPM) */
+			       <65 1>, /* EC reset */
 			       <238 1>; /* UFS Reset */
 
 	ec_int_n_default: ec-int-n-state {

-- 
2.54.0

