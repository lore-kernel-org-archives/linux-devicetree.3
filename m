Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9CA23E1694
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 10:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788170697; cv=none; b=scL5gg3ZjRnMTp02IRVvzZWnA5vSyYbGNrhRrSrfxZYD8VqTaTAlLGkInNpGOR1qgShjFQHqGukM4C9n6QEXnLduGqHV2cW+kpLlZrvwkAGjPFV3uZW6/OlVRpFZXX2mgzh35651z9p4ybA8TqfRJUAc0sn3BTEQK6iCF5hX9CQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788170697; c=relaxed/simple;
	bh=4ZkWGQwLzoJisDVb4/Hs1Em8NoZ8L8w+xBFg5ICKCII=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pZ1q3RdpWGtRE4jKTpabFGATP1Pvb6dMSduX8CQ1wzUrvUKbskFeYh2xNMjh/lG36nGafYtYZXNknwXMBGG3o6mHVOnvrswsLRq7L9OcYEmLDH3BCn+n+5ildh8pZHioRWeqWFqXxSH4AnY0Xoc8DB39Yut2ZdWET0jjsgOtVD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h2UJn494; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MH/EEPJb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h2UJn494";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MH/EEPJb"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V9Ikek2516152
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 10:04:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	u0bJzMsVzoyAH5tEFDsb6W73BPbjdjwL7QyK7W0rd5A=; b=h2UJn494TlD5Gm8p
	pOsBD6fZ4mGQn8OaC8X/JVoCGchWuigR8frXbPj3IkEoicP/AROVlKKqKCTC/gt3
	bPsw3EUtHsGezYSt4WHvyPvjK/3sNcDKrq5CZ6G5BK5KyT6NNWw+usfu8RoixcYk
	zar9XVdUEGPGGJQXvMo1vozxlzKhHBFcLYVvnS9UB2lNW/N1kiNzABWCTuRBNroP
	0o9gCpdiWCGUezCFzik1p0ozfcgiZ79XSPE2YD8Pht9H7Wi2GTQrHhLRt7Qwzuef
	BwzNl9Z7amcTqeAoVwz7u8OQelIUQ3O5RalC36FoJYncmoooVvnqNKfnc0i/SPC3
	oWeF8A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gd6vcr67g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 10:04:54 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-930edb4362dso434240385a.3
        for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 03:04:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788170694; x=1788775494; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u0bJzMsVzoyAH5tEFDsb6W73BPbjdjwL7QyK7W0rd5A=;
        b=MH/EEPJbLrUb7pKae5ocbKPBdxkkQ0Mq6GB7ddNwguJu+G9/biqQ4G/47OMzWbdJqA
         LaWYuiKynlUH+ScXqWVHZaZnpea5cczF19BXuYQ/x8ysT/T6qseuS0Beain/NIBEay9J
         tGH0X7jVCF2dW9T+9UMNNibspbRz3vIJGRfDryhEFLSJxdn2p7SoLQKPBKmeVdgdS2rL
         mu6V+Sk4jCHgEgQErpTZIy3LZ/bZ4BIMFYG2hsdSlDnU422mYef/PtON5dfSnPTg5RDx
         2D1pOKfwntk/UtSVPREflEthkHxR0ooMgDmkWLE5PGMOYJe9KOdWBI8y6W+/7w98SYEQ
         TLlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788170694; x=1788775494;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u0bJzMsVzoyAH5tEFDsb6W73BPbjdjwL7QyK7W0rd5A=;
        b=GCT/6oqaHP5c/9YmDNOW07yZ1gMMo60Ar2WuDuuqfTnCGjhqEIxBZKbaNYzFVPcu+W
         flUYJJA1NuHwvtAsbnhMyOMhvEmd41/iyERSoNF35+5jvmRdPO2U55QLaGtmVGjAtYkC
         kgsqyYnyqtgNUsGPhFBsXFmyPve1/x5TypDVx7zEpvY1Gqq84i34WPMNgmgQjg/2BsA5
         m38Lr7leV0TX/7gYjAMbU6Ybe+ikcOod2+M6BfSQbsRAy3lLf7yfGfgX+l789rE5SiBZ
         f8aEpJbXfbzG+P6LvXy99OC/prVak5ymEmvZCqZdVxg8Q1E1QspmT/VwJbtTBYYTsZDc
         T7Xw==
X-Forwarded-Encrypted: i=1; AHgh+RpShcn4T+DG8nIJMUXyQVCGRswPZa+GBj3Do++/bbvs2+/vZt25qPzLj6N1NVgSQdjMYYmu53ClPjHl@vger.kernel.org
X-Gm-Message-State: AFuF++kHltXhlhowgXWZVe5H/RW7a9fZp656UFw9onqeKtsJZtXCYYQW
	waA62PyZrk8BV7/Wo2fFRWUIx+xSKPyf0kfeY7tD/nkgn0ewVi1XvMlKQQrPhQv1y9+JIqI//Q/
	9FfWGNtJM7xoE1ZX84jRETdflK0DTLg0mg/O+KORsvQ/cJ8Ga0KJko8FPMdvHaqxq
X-Gm-Gg: AR+sD10F+QZ+iw73ciEnihOq0er3SiCaURaxNnQDPlVx06D4jNpBk1sq2FozXQz7S9c
	OY3xg0WFfFg775CsKtUZaB//Ms3DUP6ZCJb9ZjTy9WA2jjZupprUN6bwsEkL8s0nLwECRC0ShS7
	Z7p9kBF3LnZAVHb2mBlUv8lQA9Q/jy0oYUn+Y/0YTU0t/R2KfSsWV+JhvDr57UJdT4jdgeyBS8U
	ipnz6bMom809TRrlF7qITlCUQdX8J8ULgQ1+FPJeU5gl5XusbwoyLi//wlvhU+59piscK7ryTfH
	0CVMFlVKJWztHSNEETfp2UfRq0+JTdt1mWgHXsF/ySGUSOevxxECRE+CBjeCvAYjJPRottmCWGz
	vWlCbbg==
X-Received: by 2002:a05:620a:2591:b0:939:ca4:4d5f with SMTP id af79cd13be357-939137496c3mr2742561285a.5.1788170693732;
        Mon, 31 Aug 2026 03:04:53 -0700 (PDT)
X-Received: by 2002:a05:620a:2591:b0:939:ca4:4d5f with SMTP id af79cd13be357-939137496c3mr2742548485a.5.1788170693132;
        Mon, 31 Aug 2026 03:04:53 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b9281772bsm131001555e9.1.2026.08.31.03.04.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 03:04:51 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 31 Aug 2026 12:54:43 +0300
Subject: [PATCH 3/9] arm64: dts: qcom: x1e78100-t14s: Mark the EC reset
 gpio as reserved
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-dts-qcom-hamoa-reserve-ec-reset-gpio-v1-3-5b202de8c74f@oss.qualcomm.com>
References: <20260831-dts-qcom-hamoa-reserve-ec-reset-gpio-v1-0-5b202de8c74f@oss.qualcomm.com>
In-Reply-To: <20260831-dts-qcom-hamoa-reserve-ec-reset-gpio-v1-0-5b202de8c74f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Marc Zyngier <maz@kernel.org>,
        Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
        Konstantin Shabanov <mail@etehtsea.me>,
        Srinivas Kandagatla <srini@kernel.org>,
        Georg Gottleuber <ggo@tuxedocomputers.com>,
        Ettore Chimenti <ettore.chimenti@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Konrad Dybcio <quic_kdybcio@quicinc.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=972;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=4ZkWGQwLzoJisDVb4/Hs1Em8NoZ8L8w+xBFg5ICKCII=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqlVACYBcXkNwzazhD1n7+4lHx9FAty+gFC1xKQ
 z34gcdLvQuJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCapVQAgAKCRAbX0TJAJUV
 VjhcEAC0q1vLrXGmcITGrwu7cztlRvyR7hF5ikABMMdJSXN6J4iiD5t9ghRr8EtCm+pmijw7RCe
 Vu++HQ+35PuZVPNxHLk0X2DNO24tuCivbQ+V8H15F0pU2uvUnaTcDt9KpgFjQurtjdNP5AnfNq2
 Z3TI3FyfoIFF6qn0QcPVcrZFhE+YAXlQXbYRCJ/567wv7HxoN85gEHn4VVfjmIroA0p1+WVDi9W
 tTQfPpIMW/2eqz5jwZPIWIKH8mgnDT8Q9JecRMlsnEIj8o5OGY0izUgEGGvelp7pPdRUZnSv9p4
 ST2n8+66KXVmZUo8buec9q4URsYHsDZ/ien5rEmxEe1/6LsWAtI/xoX4JvIkNZNs/q1R3hvv0Sw
 2tFJ0CAbTA4qlEihtIprFGY7uJlC4K21rugavCY5GMjeozjTpbGbMiZlcJYj5hSAwgXKNLXZzi5
 Z22uGf83oWjds1PwgQURNWLAB1JRJpZkjXTyCOBkf/uKqLMUqJ1lWU1dMe3ayxNxFupWs8ajfM0
 YgTvbTCxyQxseut1rUq47wBDgQMkSvh5/ezSVwZP9yVfnwMrpIZWLjABs4xOiSxCszl5o78pm0v
 2VufKJOn9ahOWMKtna3iLo1hIHNm4lx/O1wI334uHFnV94uVtxdTZPo22z/DARgX8Kgb0P3UfQO
 ZP5B5DwpejNtYzQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDA4NiBTYWx0ZWRfXx4LmHizAu1SU
 6qTp8FH1+K9/oatAS5y62sWEA1siOzI871tC/M6c3dCLdoi81X94Pn/rNOwDWNzoxy5Mucd3Nls
 Bg3ovgV6KiDZspgjjQxulWdfkcBJhCAU3FJyMd/KaW6h2fWa/2H0EeBtSborJD30wUM9Eq/jV9I
 LQqSgGDSMh9tinkxHL7JUyjqO4rc4ar0yUsQpi2mP5CKKk5Zyy4NQ5ssjyMmDrCtm/e2dWE55fT
 SHpyKiZHV4111FVSi/l64dMoMWpQGqeALQ4cki60NTRS7w1iB1ahNDXUSZpGXbjQjR6iJWt2Izr
 9d6YRwH99nqpl7I3Ew6YK+drr50Bxi7W1Vmhaz+fbYdWlVWp2hzVuxfcgu51EM1yPI9VCILsz0D
 rgXOh58kEedxcxlPsMDWcw9zBAKEP/WL2Tez8E2fw+tJ/x6aXMnSDLPG4ChazmnVfzyvvY4CZUX
 t/Sq/bU78AnLF2VSUog==
X-Proofpoint-GUID: yy_Pm9jO38RokXa3e3i20xlJErTi8T6l
X-Proofpoint-ORIG-GUID: yy_Pm9jO38RokXa3e3i20xlJErTi8T6l
X-Authority-Analysis: v=2.4 cv=Eo7iaycA c=1 sm=1 tr=0 ts=6a9551c6 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=clBUptZa5v5FR042Ey+sjA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=l8FgSqmFWaqY7FSYhIgA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDA4NiBTYWx0ZWRfX7sm8q8zjl4PO
 flXPcVann+NICCyPf7AXCL7+9ViyUkSSUEXYwcyWMY4HbzOwmaE5JvXhUU3qjAgsP8xF0YseST6
 KkZE/jeFvf9wAN8te6FZ1cbRwoGKzQI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 adultscore=0
 suspectscore=0 phishscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310086

GPIO 65 from TLMM is used by the embedded controller as its reset line.
Reserve it to prevent Linux from requesting or reconfiguring it.

Fixes: 7d1cbe2f4985 ("arm64: dts: qcom: Add X1E78100 ThinkPad T14s Gen 6")
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
index 0bee2a3d6e7a..8f7b01617461 100644
--- a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
@@ -1385,6 +1385,7 @@ wcd_tx: codec@0,3 {
 &tlmm {
 	gpio-reserved-ranges = <34 2>, /* Unused */
 			       <44 4>, /* SPI (TPM) */
+			       <65 1>, /* EC reset */
 			       <72 2>, /* Secure EC I2C connection (?) */
 			       <238 1>; /* UFS Reset */
 

-- 
2.54.0

