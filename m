Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F5B2394792
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 12:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785846769; cv=none; b=LAb7iRbiZELs6/ypZ6y9V95gFIyH3w3sUh7zuXH1aytQvaSGI39mk0K9P2Ht9NcRMjRO1nXrvUf2Aa4gRufQxdZTiXHlWrfpF/BWdahXiK9WdjhewyE2bhLCUKLGZKyx7dMqct6vMvl8Oc//Tn8QuQBOJTumdjZE5VPKAARtdEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785846769; c=relaxed/simple;
	bh=wUKqqSPQI/PF9UCfBdKpKF4JWei5R5u9/X3546YzvMI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pTaQPlKcsELzpXypN2ob/NPW7wP5ct713sI5TnLss4DFpJEsXrcKWhgvZDKmovIJRJhvGX5zj0Q88sR49raCgL3oELNP8/SxLViEfsJBggaDzPPXZ7q6jbZyPovPEF6tuyElVgEe81wH/gWbyT9PwQabe1LEf71o6P8Bi1rI2Y0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ikRiEkKi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AKV9ZHMa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ikRiEkKi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AKV9ZHMa"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6748CRgF3546509
	for <devicetree@vger.kernel.org>; Tue, 4 Aug 2026 12:32:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cKSpi5FxamMSH3b7fOjLfmrRC/AHklHEaEAY2f6807o=; b=ikRiEkKie73RpPcV
	8SiGllmzMFKdThsIIf9OHORSk8qYpyY++qdtWWunnVRTI9sNeylfRw6u/4872EGF
	n36eH4jt1grDetqxYyF7KXrix25NajG236MKVQClmAMALESRqZY4GS36uXzuVt7I
	lvrTkPjzcBG2sdK+6zs3i0/2VFaykngQxhk6Wq+u+brXTAFFG6g71FRgFk8lTFJe
	zQcup6TnNrfzjXjwtdPkXWy/yidpiCrE6+R0xcvKCYdXc/OR0+CA1B8NE+YL3MLk
	ef4f9bUXerFtjg5aockTNWaSuIlMYDaUG1o8duXwLkvH9Oljgu/jiJT2yrGuOadt
	IJKlhQ==
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fu3vs2xeq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 04 Aug 2026 12:32:43 +0000 (GMT)
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-7e6027a5761so2835819a34.3
        for <devicetree@vger.kernel.org>; Tue, 04 Aug 2026 05:32:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785846763; x=1786451563; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cKSpi5FxamMSH3b7fOjLfmrRC/AHklHEaEAY2f6807o=;
        b=AKV9ZHMaCScjdduwTa5/HDGirolSmD13xYPxijnU//iH5yUUcFGhhbvGgsX0zwhUly
         Q2RUriFCUu7vlmVOvUCGjqoIG58vidtv8U8wZumD0lHR4GBctIFqfvFnhSodEcrDEs4g
         pnei+PVrjhDz1hmPT54Ji3iy+E9ZgrlJh88wwEOUJxFr8347UbxAiE8f1n7t37WYmJRd
         SpUtiMSbwN9EyfCMfeUIFOe3+0PB83XYFw3CIn+shu4z4DT86bsckb4h4wkAHr7Km4JZ
         1WsyImZhoisgkDRktLGCmBWqvL/mt6og2IHAPsTk+DcO5i13dfPCN2H46wt8VuYtuasa
         X9qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785846763; x=1786451563;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cKSpi5FxamMSH3b7fOjLfmrRC/AHklHEaEAY2f6807o=;
        b=reU+HhFzphA8QvQOnA/GJakif/EeOEamyMD6ZVvpAl9cgxa/PZ3+H8g3ymO17RrWK+
         3vg/3FAlh9Eh1gbeqDHvm6krz5Y1bPdXbOVbnyFyHFpYZyFLNGKUsSltHUlbXsMudVd1
         8Nfyj5Z6lqqfGT99MpFNJT/B+71Q4wVyUJGPgejprx4GirlFHXPjZStMMmwfOE3anFLR
         KLAwmM5kpExXzrYus44nGDY0VQ+ruWG/gclqNOK6VMo9xivXfm2jeTtNr85mH428OhgG
         JFbm8nONW8X35VznWQS8SN/boBGafshKFTGgpxBHpzu4RCUP8VV5SlqpkdUiwXg88bWh
         3Llg==
X-Forwarded-Encrypted: i=1; AHgh+RoH+yl7ys7xLpSfJCa5aY+tIo0GPMQ7yxQe4wbXhygJsDjaf7k7uOcDYEnqeoTDx7Go5w/mbXa+kvuZ@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2ExBUdgryYC7YNSwBFTYdBCVzP631VoDwsEX7BrfPrQVeXCI4
	Cvte2C2oZcWFmhe7vagK3vP72Tx/r86jqWgchxS0NtsZYlNbKBlHokqNneDLBOnlCJgO/CeFwsz
	UD7PwVmHWY/7xlR/SO3A7NUZTcUMq6WdxSaa5EF8WzHigadI+47WF1UIxYrqvp5Vg
X-Gm-Gg: AR+sD10/fHCDP//PQKsnrklhZngYpbZb/n0DOhscRIKtO3PGa7BQpJ37Eyri0U0OJtK
	vOULMdqy2rDaFHBlP5iJMY5RIiEDJ2tmyoac0Ahr1steFS75yC1iz2P4+92kVWBFqCQaxHJ7LwS
	9JiBnHoH70LNfeLM5q6R2MLRN8rr5Oi/znxT0CMse+xzrfJBcE1C4sgLSOdho9uzXebZkMc3mXR
	4A8k/AtW7ZXvuZQ9c3EbjMS4/NCsGlKo7CznjoX6fag/rYYXkM1TUsZBaoGNOslSCwD85zkH6V4
	Z9Ttwit4T1nXACpcskOdP3Z+im7qMOho+Cm+REDDPQiLv1XcCpoBJs4gN14aDAR1L7aCQSKeeFi
	8ak5o1ZDGJ9xfNcVGJAV3+cIyFQr/Un9Ha5xkzsrfN+8YtQRm8tQ=
X-Received: by 2002:a05:6830:3152:b0:7dc:d6b1:48b7 with SMTP id 46e09a7af769-7f196b7b649mr13878765a34.1.1785846762944;
        Tue, 04 Aug 2026 05:32:42 -0700 (PDT)
X-Received: by 2002:a05:6830:3152:b0:7dc:d6b1:48b7 with SMTP id 46e09a7af769-7f196b7b649mr13878745a34.1.1785846762520;
        Tue, 04 Aug 2026 05:32:42 -0700 (PDT)
Received: from hu-weiden-sha.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-458f6064d2esm12227013fac.3.2026.08.04.05.32.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 05:32:42 -0700 (PDT)
From: Wei Deng <wei.deng@oss.qualcomm.com>
Date: Tue, 04 Aug 2026 18:02:26 +0530
Subject: [PATCH v4 2/4] arm64: dts: qcom: hamoa: Add compatible to the PCIe
 Root Port
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260804-hamoa-m2-dts-v2-v4-2-1b5ceac74538@oss.qualcomm.com>
References: <20260804-hamoa-m2-dts-v2-v4-0-1b5ceac74538@oss.qualcomm.com>
In-Reply-To: <20260804-hamoa-m2-dts-v2-v4-0-1b5ceac74538@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Chen-Yu Tsai <wenst@chromium.org>, quic_chezhou@quicinc.com,
        cheng.jiang@oss.qualcomm.com, shuai.zhang@oss.qualcomm.com,
        jinwang.li@oss.qualcomm.com, xiuzhuo.shang@oss.qualcomm.com,
        mengshi.wu@oss.qualcomm.com, Wei Deng <wei.deng@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDA5OSBTYWx0ZWRfX/rpFVnQuBxp+
 UQE4tVIJTZcUVZi9L1Rl1qQHjkkDTcrK8tVzwbdUe17LN/AVfB10KrpyPQgA56tVrKdjxi8GlUe
 LyXxY959izZ6y98hBSniOmIDP6ilcLjEJYAET3YJZ7j5tIDVQGCgBm5ubydbnc4IQ3KUDjVUIO/
 32F0+Rwrdji4moBfZqlcon17ZbyCahhwQTw6xzviXS/TEwHGMtx7Hpsfz+QLfcumFACRlYIyG/0
 w9eBBeBJ9xHOu6oQ/z3MkYunzhSdo1HSudLMiGEW7o76KKdSEDCFj5t0pIt7xN9Mz+kd7tpSrxt
 GFu3zhuGu0xqY36xhuwU8RmPGumP++V9qcUK5Rx0NGva9AnK8q5ReGxbwUtjc09I273jyaLQ9Nj
 lrAoobbEsfxVlG8ODWtDBmKe3uNVrxRiGzSE3PsH3PnXXaVGpzcz3SIkWus87f6e0sMit0JXUxk
 NksjmcSrJoyECTgYfqw==
X-Proofpoint-ORIG-GUID: t-qzBlOeGH_gFw1LcjTxIVseuwAsphXp
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDA5OSBTYWx0ZWRfX9O+nkHk7O1P6
 +1cBVcGwb3u/6yDW6N/jmMCbD6LxaHybsiJIj1toYBk8quyTSm4tRdd6bHyfBsTGFHTmPMOFJ4n
 maskidZkXrcB9+sJEKq+4rAh4TRJ+t4=
X-Authority-Analysis: v=2.4 cv=EK82FVZC c=1 sm=1 tr=0 ts=6a71dbec cx=c_pps
 a=+3WqYijBVYhDct2f5Fivkw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=unBuS9T_dDH4f9JXRc8A:9 a=QEXdDO2ut3YA:10
 a=eYe2g0i6gJ5uXG_o6N4q:22
X-Proofpoint-GUID: t-qzBlOeGH_gFw1LcjTxIVseuwAsphXp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_02,2026-08-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 spamscore=0 phishscore=0 clxscore=1015 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608040099

Add 'compatible = "pciclass,0604"' to the pcie4_port0 node in hamoa.dtsi
to allow the PCI subsystem to associate the DT node with the PCI-to-PCI
bridge device, which is required for M.2 connector graph endpoint
association.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Wei Deng <wei.deng@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
index f13e310995aa..9e81fbcf42e9 100644
--- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
@@ -3781,6 +3781,7 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 			status = "disabled";
 
 			pcie4_port0: pcie@0 {
+				compatible = "pciclass,0604";
 				device_type = "pci";
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				bus-range = <0x01 0xff>;

-- 
2.34.1

