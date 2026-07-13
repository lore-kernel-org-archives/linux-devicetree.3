Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E21A1357CF4
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 19:37:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783971461; cv=none; b=OK4gIz07p2tXlxymP/4Q7bFBNhdnktMLRb2WPBEKY8i7tKusdyxlxwfGVbm9kRhUXXbR848cOdi361HC0lBelcf+qPu0xFHAyFAoeWHfROT4r19QpB5BLFA2xHSYlOy9wdlBtpEUFy8FYnv974Z30efIy9w5xxGivFb0GX1Lkwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783971461; c=relaxed/simple;
	bh=do0tzTludNgpGS/opTf3SCuV5bhJp5iWnrGtxTlST74=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=X7Qa+ITM18sz8W3QWeke9R6xXYP66VFSymc2yQkhO245jVP613GXDZA9xPg7o/0rnx6r7mNysul4vIHVfhkBp57FIIBx8d2yFxQ/rueHJrnXahLr4UcOF8VacQb4Ujp6WEFY7vrL5c3Hc1j+Q7ofCEy8NQ+FBBI4da2Q1wMMjRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oKQKw3Vw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M5nbHANc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oKQKw3Vw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M5nbHANc"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66DJAgI02159303
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 19:37:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CJNfEpph7JMPeJCP0Eo5JXk7HW2DFwVqyvqs385kgkM=; b=oKQKw3VwQqBvMGBU
	CihsrWCq8Mb1BckigcRWToTIWDoi6wUYjouCU7KhEJN2zQUxaNhs6axXJHgtf1Sx
	ui2/Q1PgvNcwNnapT/RbwSBpK57xvjuXz80yiRJ/7boV8KAO/Nh1K0GybVXVk9Vj
	aBRJxQ0kON+p3SDCpjCTHOJcLBtNsRN0BiMyOfNsc2/vIFgEApY2UxvdJC5UFZ6b
	geckV5BEoSR6GiPz27kKqYjiJkH1ykUfVoupsP39zB36t3D1ILRRu6t6PKCWIIY1
	w9RwZKnO7iVkIW2mWoqK6qACvptX/j1OUM4XoEta0KgktwRSu4Rb6o30pzZIXRxl
	fxeugg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcw4qtfqb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 19:37:39 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38dc085b0a7so4578394a91.2
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 12:37:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783971458; x=1784576258; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CJNfEpph7JMPeJCP0Eo5JXk7HW2DFwVqyvqs385kgkM=;
        b=M5nbHANcdFE2GiXKw3ktRltgCwBomIa4Fj/P2C+QZXLPBIhF2ynL88hF+hlCbwiS/9
         JF7PNWQIVOGU+7q4veaSg414igeVhpV3s2/SjQtzj2bbyT7VPxdI0pnGIxnwzXGqWDy6
         AZADThWEAeD+eBOIhILXJ8/ZHAlkS/SwF9moOD1K3Gjm+NW5+WYXe8jxbe8lszEUmwhC
         Pw58YjWbELvvh1JZZ1mvczg+QnQPjcJnjhnzDIF/FDvhIKNpwyLdjzn2zX/VTDuTY2Yf
         wBuCFmqXWCXs91Y/213TWWH83ktGtE3IXwyqqiB+TQnOskEexrOP+eX+NjRXs6htEaPa
         xiBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783971458; x=1784576258;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CJNfEpph7JMPeJCP0Eo5JXk7HW2DFwVqyvqs385kgkM=;
        b=htt/Z032hcJd0nYnW0fTCLceeV5q0dQi/UnQ1WVgqDBPV5T1s8lKxY2q40owTwTcnI
         uFJcyItNFQAzHYVIA6cOGTptvnlswDZsoDkCcVz239Ntl7OSyk+Vr+/LBrsfu9Zud6+A
         jiziyuuTcXKzuqZBgEh3AwvQquys635vwllysUyUns2oGmffMBF3h0o8M/IoPNT2qpUa
         A6CkNSnNz/OZkB+mhsY+ACzfc1sx+xW8D/3y/s/TwXgzjD9VEO5fbNtJ/KR75tPMPMY/
         eGxhr/PQahJp9bPdd8/5d96M1EdsNByw48JcW/ndMPzt5hCQwX0gILRP5fcXmcA5dRz/
         37CQ==
X-Forwarded-Encrypted: i=1; AHgh+RoB8ZZw9r1S//W3bV1plFKtfZq/GXHEQdnJpmVeoFifZZCiC7olD9g+sCE9FQXAdZeOKvUeMWsCDbL0@vger.kernel.org
X-Gm-Message-State: AOJu0Ywnf1Pwj9/4TfjMGq6HV09C4qjhj4115qGMxyV4zHDLmENsKQA1
	uvZUbI3HtSQXmA6HxUu1BqvHWvNyFSrajZpOyCUDa1SfFtxJEFpp9Hm1Dw7KrpVhY+zMfdhXAHO
	NIBLI7aS+kbkWLHhwk0k2zVkMmkCh+Wgy+DUWIaTBrex/m0R8Iw8eRu832nndcVSn
X-Gm-Gg: AfdE7cmF/KPFy1H0r92E6xorMYpYMBsy1pUQPeY14MR0RdspzOE5dZ+x9udPCbxuMRD
	ROfdrmNwdYhb6ai2Tx77FlbOjvIPGtFmZ+x3fWTs6N39mXV4pHuTcLycnm8bxOwGRUwwfi1vk2M
	fqbq7dKVkyHMxHxNRGaZh/LOFu8p8pZUisoKvjGPXH2I+37e//opk0XzZ6XXW9wZIo4jz+75z2T
	kuI1Xag4my7d8uGpYMV+DSZpOR5QA9gcN7IZtWYisGvajUmqqJTCoQiR9XcscRDiGzMeE3vd06H
	jwiymLkFlE49s28cyiLV97trEp9WLoS1gBsn++JfidrrXos9UAHMrepwFMRhgFIyz4DpwfqqIT+
	jW17j1i/MClDBqBmeRMG9AoFrnQ==
X-Received: by 2002:a17:90b:1d45:b0:38d:e28e:a625 with SMTP id 98e67ed59e1d1-38de28ec08emr5880898a91.16.1783971458572;
        Mon, 13 Jul 2026 12:37:38 -0700 (PDT)
X-Received: by 2002:a17:90b:1d45:b0:38d:e28e:a625 with SMTP id 98e67ed59e1d1-38de28ec08emr5880872a91.16.1783971458109;
        Mon, 13 Jul 2026 12:37:38 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-313f3ea883asm207540eec.29.2026.07.13.12.37.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 12:37:37 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 01:06:54 +0530
Subject: [PATCH v6 05/11] arm64: dts: qcom: shikra: Add SMP2P nodes
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-shikra-dt-m1-v6-5-bee265d3499b@oss.qualcomm.com>
References: <20260714-shikra-dt-m1-v6-0-bee265d3499b@oss.qualcomm.com>
In-Reply-To: <20260714-shikra-dt-m1-v6-0-bee265d3499b@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783971418; l=2339;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=x9fBogSqQcJioAYXHmlLdEWBKjDZV1eFUot6gF6WwrY=;
 b=lI7UXLVv/TSry+HZZng1Czwu8BQjTDMxBdjJZJlE5346b/LBsksE51Wsyp52OFL6dulU73dig
 fi6pIIxh/m7AK+xt6ynT3pVN4MnbAu/U6AJSbnD7chGdTw2tVtQsls4
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDIwMiBTYWx0ZWRfX9ekfHNaP0FP6
 /15QCK5peQEyiK4d2Q7EthzAd9ltQr82rqDwOzVYCjnvlfzCGzzD4fIwmArCOSmliJk81oVkPbr
 vNiXhRhzdjZ3BBzftHrq4NQKwFDSAF3DYx8U679WixEGKeCJrXarBKECkdgCfZbNQj2MYCXFc60
 sIXanbHfcDioFgrwjsoj/yKJxa9ms0+Nafc1oURdy3jd/76nZ9RfZ2o5AFdemEKhPD+aAQqtBGE
 Cigz8tfJeAnj7ZiOSE9rrqqguLYtI8YT4Y+2toOMPU9ONBejrWuNtXK0bZrLu2P+mHFH41mU3af
 iSjuZHran8mc0ocosX222AmnXoQQgZ3wWleYPjrGoeThe5qbHmVhyciBdakJAMZNK7nEHUScdNK
 dosausABgwYhs1f6U9lZXJZdBulfwf5ExRQ1FEag766+bYPjerOB4/TlTBHV7nGV5lAu0SAu0c3
 vBiyEYXAMC05TOwyLJQ==
X-Authority-Analysis: v=2.4 cv=HJrz0Itv c=1 sm=1 tr=0 ts=6a553e83 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=EkeGX7dVun7IgMBPpHMA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: QWMRmgNIEVJ8XrAe8QNDSBtHhHZaXxJn
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDIwMiBTYWx0ZWRfX1ImEJJ+YMPMI
 q0N75nf5xhRftYrOCj9lpdn8vXJh6Dv7DgQynN/AEJTNBZI+3xp3YDdDQA3FCZ6O8Jqer32JKvP
 yACha7aZFXJH+YRellldrR0anbkDirg=
X-Proofpoint-ORIG-GUID: QWMRmgNIEVJ8XrAe8QNDSBtHhHZaXxJn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_05,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130202

From: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>

Add SMP2P nodes for the cdsp, modem and lmcu subsystems to enable
inter-processor signalling for remoteproc state management.

Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 69 ++++++++++++++++++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 26ae21d4c7e3..53dddf35963e 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -428,6 +428,75 @@ lmcu_dtb_mem: lmcu-dtb@b4702000 {
 		};
 	};
 
+	smp2p-cdsp {
+		compatible = "qcom,smp2p";
+		qcom,smem = <94>, <432>;
+
+		interrupts = <GIC_SPI 263 IRQ_TYPE_EDGE_RISING 0>;
+
+		mboxes = <&apcs_glb 6>;
+
+		qcom,local-pid = <0>;
+		qcom,remote-pid = <5>;
+
+		cdsp_smp2p_out: master-kernel {
+			qcom,entry-name = "master-kernel";
+			#qcom,smem-state-cells = <1>;
+		};
+
+		cdsp_smp2p_in: slave-kernel {
+			qcom,entry-name = "slave-kernel";
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+
+	smp2p-lmcu {
+		compatible = "qcom,smp2p";
+		qcom,smem = <617>, <616>;
+
+		interrupts = <GIC_SPI 287 IRQ_TYPE_EDGE_RISING 0>;
+
+		mboxes = <&apcs_glb 10>;
+
+		qcom,local-pid = <0>;
+		qcom,remote-pid = <26>;
+
+		lmcu_smp2p_out: master-kernel {
+			qcom,entry-name = "master-kernel";
+			#qcom,smem-state-cells = <1>;
+		};
+
+		lmcu_smp2p_in: slave-kernel {
+			qcom,entry-name = "slave-kernel";
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+
+	smp2p-mpss {
+		compatible = "qcom,smp2p";
+		qcom,smem = <435>, <428>;
+
+		interrupts = <GIC_SPI 70 IRQ_TYPE_EDGE_RISING 0>;
+
+		mboxes = <&apcs_glb 14>;
+
+		qcom,local-pid = <0>;
+		qcom,remote-pid = <1>;
+
+		modem_smp2p_out: master-kernel {
+			qcom,entry-name = "master-kernel";
+			#qcom,smem-state-cells = <1>;
+		};
+
+		modem_smp2p_in: slave-kernel {
+			qcom,entry-name = "slave-kernel";
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+
 	soc: soc@0 {
 		compatible = "simple-bus";
 

-- 
2.34.1

