Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793616169;
	b=wHUHI/g7cx1CZLd9TfQflXjpSsWtSuzO0URb8M47Z7LwBEIZElDQgHoQ+9H8cXwV2a7a
	 kHL9kqq+UhktSlXNPMQB1bWNpr3iMN1UZgTFgaUDPEPpqO/uoGKaajAGwQ6rcg29MVsTb
	 WqZPc1Aligq7Pdhb0DU5Tox7mieifLa8ybsFWRUm/yPcbe7AYXUlIxvASEMpYtooUOMMe
	 23ZRjCHE6LYR2f8l5PkEvMcHVzdLcSpOFgHtIbGhsNC3VnFa1QEBXEzwQl9LIJVMBIiQn
	 h0zbK9kb1sGwjOGt6OUeR9XKIAtwEXnyoYHGnjLMMBvIRvcsiLWJW9CLR6FMF+3Qo+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793616169;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=/104di9z2yneboiEd7DJZFOyly6je1rIz8cvImPZ3Gc=;
	b=ti9AM0jTGZI6jeBa2nkxJNLtuJY4eEYS/629lhnnEE6c2dFqAlx6EbTVhp+C1KrZ8alS
	 ktCLaP0m7ULxaKqVzYZstjNUKXjxTms5gpZbjQdjJNHWb6S38fELmV2gvHo+mZAS9p/qf
	 F4hXPYkcpzDCHonqCaTbApnW3K6mK0Gf+QFOojBfswdqaS3wTUaqiHk7IV5uO5NT7U+bz
	 /Z4rElnxQLolrKJUA0Z/fKm/VA4Va0FbqbdzID2ovpFAGmlcLG4ik3Sszk4NCCZYHxiy9
	 KQgIIMV/aIXfzka1THrjUZvlvMF/nidFqtTBJKeY5fZhZZT7waORDJhXrEgkrouEUFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kaFOtdmP;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Xf12DpO/";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1C0C606A852
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 10:42:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1C0C606A852
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kaFOtdmP;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Xf12DpO/
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29ALsr2880828
	for <devicetree@vger.kernel.org>; Mon, 2 Nov 2026 10:42:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/104di9z2yneboiEd7DJZFOyly6je1rIz8cvImPZ3Gc=; b=kaFOtdmP024Jr7aS
	G0xi9hA4iBnG5ODY/1hcwxRRjEjhSiHO0bsK3NVaCCsdex7iBF1mHrlcigoQrt92
	QOjhU/HCfwYcJF1bMVd3Xi0TDNjyeYuLJ0wcKljPX5gUxTRunDkg7i7CehUNBI0s
	HLDJBsO2GL3YvBSXIXBnNCjup9J8UItVT8zUicXV2XPToO9wzxpYYMLFhEIWs1Ei
	XoDvCQKlsNsDUNRYaKKDri+yTHWPpncnZXQByHItDE/ojZjMVkCDPd3V/Aqq5qjl
	M98FebJsDaJrLjG1S1Y7OPWFP14URmD8KIZ/8wtPikyOu4OtH505Bv045+HqNc9q
	B9/eKw==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpqfrgdx3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 10:42:47 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4dc57e2a3f2so3955340b6e.0
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 02:42:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793616164; x=1794220964; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/104di9z2yneboiEd7DJZFOyly6je1rIz8cvImPZ3Gc=;
        b=Xf12DpO/kZnRBRN6AvepZsRZ1jR8MM1mU25GW4EmDi9jXmDRCIjQ9OUqewn+Ed9eLH
         AofgjgE6gaWzpmJgLYm+rJVZ91a9PkOXl1wCWzcLetcNKz8UvXAyM90yVpSkgV3IDx9k
         OFrNXVuJEIh8i16uJL9cUW2KxDlFWLR84fB2G8sEPD23vLsGUYa2+wC8XG+dNWCo9GQz
         DTJH1n04nk8bbnzn1kJ60xsESSSEXLN5dK88jb14XT/ljJdA7OkGhSy4+tmosEbdk3hT
         lKxExi1aWstqtPiK4Vfq1PEyPscj55yiEtE7y341dSZyOZUGWwnGV2k7WpDCRuK3znJy
         QO9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793616164; x=1794220964;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/104di9z2yneboiEd7DJZFOyly6je1rIz8cvImPZ3Gc=;
        b=DvYkvHyZWK0GMAo5dW/fRn42uUa/o8MjnkG7Wgadwi7UgPRTUxmgGfks/k5q4kxLX8
         /r3csMpjcQRqwWNl7a3g6EhheTgpDi4DSz6Weg9UvOsjuUHEHmxpNiu5++FJQKWNTUDD
         AI7eS8jkqSqMPYOgOpCK1auhOppXFx+mzn0VElMOGT02A4KyrlzlH65bP+AbqDuQfzs+
         /86fz5h0PvOPXhAlaPTlmLiXSL01mjAPzuTjEXAt0VoJh1XeplVOCFNn9qDShNIlvt6B
         W0e/G2mb2+w8xeYHU3K85YISLjUn1psKbCEJCLJ0z3fTO5kSrBmAcuVQuGADIcnafcSM
         QGcw==
X-Forwarded-Encrypted: i=1; AKwUvBxrk8ssmWpJ5legb8Q3lAW86NV7PwfM1v11vK6Q55p51LjGCJgLaryRkN60J8tq4m1gr+Yv43QD9WcP@vger.kernel.org
X-Gm-Message-State: AFq9FYJ8HsHD0VHlACffNxPANv4nK5KDCPFTuQE6vpOUCOrLGLYJ7/hB
	NB/VcUgeIORY+uHCNmPjR15J37WFfp0AGM2A1elPbIv3ZSdHHYSOj0dd+h2KAy+DXQXx3/qgLVo
	7sb8dvTTm9ZLSye7d8HnZGAlb3uKTip45y4Y0dBMSmSdRKGJnq9sBJOraEqc4C/UQ
X-Gm-Gg: AYBFou0KI80sv/BoYAS4LBB9iS+xRcA49+ZVL4NRBUH3uL1OMRl2q93GkKB7xv0yG6a
	zPhz0zOrNbCi4t6dk4Gqy4wNmZ7P2RKce4kBhgs4whBrB5XWCBDEDBiBKLhreoTjOw/co11xkZy
	iQLjGDxl9ebwRzOAUiotz9qHSD43yEez29S9om4+91MJiN5AtLNbMmsF9uDu9RV4FCt/WVJ9xw4
	Zxi0EkBDIkLJSHX4Icg9EhKEGlVu1bvrQ6+d+sZGW7kdJ/x7r3jjQxXsG01t/KB+/HDoYnNmTPL
	qcORmOmHuPCn5am+6S4TAIpc9brR08MbEu0CrjSJTkrkodGU5HosboE/cSN2/Yt7bmAoXT2QGIj
	9NqX8RG8UGbpf3p29Zrqt9KgAQ/7NcFmJFAOS2DouJUhSyEgiIl62qtGBPUHBTgQKHfhg1maAfa
	amj18iFBM+znV9mGvfu1UlRNzDyPj61AzjhxSQxruG8LS87P/IqhBPEroc2pQ=
X-Received: by 2002:a05:6808:bc1:b0:53c:156b:a16d with SMTP id 5614622812f47-5640de7bd03mr6296067b6e.56.1793616163687;
        Mon, 02 Nov 2026 02:42:43 -0800 (PST)
X-Received: by 2002:a05:6808:bc1:b0:53c:156b:a16d with SMTP id 5614622812f47-5640de7bd03mr6296049b6e.56.1793616163284;
        Mon, 02 Nov 2026 02:42:43 -0800 (PST)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5640fe0fc77sm7447171b6e.12.2026.11.02.02.42.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 02:42:42 -0800 (PST)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Mon, 02 Nov 2026 02:42:22 -0800
Subject: [PATCH v24 14/15] arm64: dts: qcom: kaanapali: Add camera MCLK
 pinctrl
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261102-kaanapali-camss-v24-14-d6b8f3f6f66f@oss.qualcomm.com>
References: <20261102-kaanapali-camss-v24-0-d6b8f3f6f66f@oss.qualcomm.com>
In-Reply-To: <20261102-kaanapali-camss-v24-0-d6b8f3f6f66f@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16.1-dev-17221
X-Authority-Analysis: v=2.4 cv=HMJWhYtv c=1 sm=1 tr=0 ts=6ae86928 cx=c_pps
 a=AKZTfHrQPB8q3CcvmcIuDA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=4Dwyees-64n8yO_2jeYA:9 a=QEXdDO2ut3YA:10
 a=pF_qn-MSjDawc0seGVz6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: Ul7pVuSIhi1XnGQpP8ySMWSIEB-uQ49K
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA0MiBTYWx0ZWRfXwYbvTZvD4S7p
 ThzXAzo2xzfzG7qdlEN/CsJrU2MBwKefcflRYUchCkXu7s5CchKVNfwEkjQcyNtHWAZilz+wD4s
 /VmmW4I2bBK+T5w98YQDrr/cK615i3o=
X-Proofpoint-ORIG-GUID: Ul7pVuSIhi1XnGQpP8ySMWSIEB-uQ49K
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA0MiBTYWx0ZWRfX9oeFUMH/tFPf
 6T9sFcBc2umcmuRsBGMZI7hjZp1GXgIcCiZBY2JwPzNHq61OI7ZC3VEHh3JDccqQnrn74dWwdjW
 CtwnLDfA8PcGl8iOSSjcUBN8icBMjpWczm1WVFxe6wykO0bNpINLeW+zEZlbyZMpNmWmBnPX8e+
 x5yzR0Okd1OLrEgYFSe8qlyG5HGGkoq4Pdn7tKyjc9bfkC8XAtJuMJO/ThLVCGGcdEfGccs3df9
 2xdz0W2tMXfTLtu+ArWrJtpbxqZOmgWV/v6WcXUjj6cAi9Ge4n92YujeMppXWSC+bLZPFIaM5rg
 MinzM0BozTMN6X3Gse3ruk/zsfkI2E4iqNswGrFuv2i/JUFSLJg0gUxi7idYm6gJCFlSm96FMwg
 HBCWkmQRiAV8R6CYv0aEFXMw3Mx81TtWgDGrs7noVQQg0fo5ucGk6hbytrcvCIdkLn1lnBOS8FM
 msSyWnt7vXUfMp2vxqQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 malwarescore=0
 phishscore=0 spamscore=0 adultscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611020042

Add TLMM pinctrl states for the camera master clock GPIOs on Kaanapali so
camera sensor nodes can select the proper MCLK pin functions when enabled.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 56 +++++++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index fbd65c2ad95e..cf43cb8351ed 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -4645,6 +4645,62 @@ tlmm: pinctrl@f100000 {
 			#interrupt-cells = <2>;
 			wakeup-parent = <&pdc>;
 
+			cam_mclk0_default: cam-mclk0-default-state {
+				pins = "gpio89";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk1_default: cam-mclk1-default-state {
+				pins = "gpio90";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk2_default: cam-mclk2-default-state {
+				pins = "gpio91";
+				function = "cam_asc_mclk2";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk3_default: cam-mclk3-default-state {
+				pins = "gpio92";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk4_default: cam-mclk4-default-state {
+				pins = "gpio93";
+				function = "cam_asc_mclk4";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk5_default: cam-mclk5-default-state {
+				pins = "gpio94";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk6_default: cam-mclk6-default-state {
+				pins = "gpio95";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk7_default: cam-mclk7-default-state {
+				pins = "gpio96";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
 			cci0_i2c0_default: cci0-i2c0-default-state {
 				scl-pins {
 					pins = "gpio110";

-- 
2.34.1

