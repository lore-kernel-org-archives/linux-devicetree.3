Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795467327;
	b=nEtf4qUOaMypOFHC6PmaVTC8VtUN6c2VvacdnVZ6z7G7c8bfmMnaSumxyS9Ajvlpvoko
	 vQYEZ4qwKrNomdlwp5FrJ+p1UuKg5gz1KKLysiJTy6H5HLntwhS3nk24LwiUiTmUnV4t0
	 fPPcrFvc0QMNKw92EtjlYNz8qMaWNM4wH1Vinu1wg7J9ttRbkrvi6jSIx/LtK7OMdrJWY
	 WzO3FP5Rw5zS6bsqLVuV1nGZhtWkPOztX2AspYplrjVPM+k2Ht1Arn+2qX7EyFaLeTMkW
	 LKeKvp/d/w+ZpCTA7dDMBKImCamdRsHAeVCAiMoL6uzBhQe3YLKLqBfc+ZiK9Mnxc1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795467327;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=o/gXwwriPCspFSLvm4k8J+IvKYQXCyefGW4XLOgCZN8=;
	b=k/XmWMevXZss2ikcK9z0T5D3BDOFbff08SmM23y1AxZovjj+ktVBI00/7cq8AblpTJtg
	 EAo5mk5wF8pBQoeum46SLw+nubS1RjiQ73z9vE6kWbEVLxCE9wqGTXUkJkiE37eG6X6yG
	 1DV8yxUrTwYdEMHFEw3aEihFd+5F+1qYxiXVRRTyFwhc3SyGcbuAYHcByWw19h7dWbARm
	 O3/0wYE9+vu1P3jXXtTyBuSQvo+VHSU2LtuSzRRAsD/lmqyfiyFv0s/JPaJR8rZbQTIvv
	 gkp0VYVMDzcDnP76dw0p4PJE/0m8fooiYYTCMBjwFrws6ndmEkZ/k9fhKKGNN+dmoSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=D1so8nQF;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ony7BiFt;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0CC6606A684
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 20:55:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0CC6606A684
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=D1so8nQF;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ony7BiFt
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANJuiDY3962918
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 20:55:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	o/gXwwriPCspFSLvm4k8J+IvKYQXCyefGW4XLOgCZN8=; b=D1so8nQFSfGWQh3d
	5muophMEI54gtgWnBFN4WI+jf2diOcOOh3E6uOPfZNiGNxwnI/0W0xMEqE/ELUTG
	GCDyzEkm3r0/+3nJdr0w85whv2A2PnRZrFZ71Imryfo27Qm562lS7LDh+mtr0L2b
	BYg5DctVFIU8Lvn3+T+NO2E3CiSLRcVxgwXsKLoObx2RJtxvyxUXcXXh+zDeEo9g
	N6dvyiF02lhyBis2vCBIAWddgX2OcHf++/SL2sc8YZ/Sqn/usSKSsWgsgmM6kOgn
	PjIYIoGxttyTL7vFfoqLmD6uJSAfEphAojM7Os2th1YRyYVhARjRqHWlBn/56J2V
	Nqcz4g==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4hn7u32m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 20:55:25 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-38355b03cb8so3754720eec.0
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 12:55:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795467325; x=1796072125; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o/gXwwriPCspFSLvm4k8J+IvKYQXCyefGW4XLOgCZN8=;
        b=Ony7BiFtFn9a8vz3aPgK53D05zb5BgBX85SZdMGU9Yqcd+y+NeUog0g7aSLw/oxBMF
         yffb7sCQlmQ2UE+zoBD7h1umndQSap/DnQfFu6OKEJtjNZ/rPMoee2nSbNSmaHtHVx+r
         iUuzyT+Ify9c43EMasqMrEOh9LkM+fJcGI2UxKEtARZyMSfFELdfwMN8/zAq3VFbjjGi
         syZ1+dm8tbfqZv2MgzpMtth2r7rv9rmLCYpViHHXnK/xFn07PvBZFDZMpIWJpCVoP53O
         HpbV2i/6dINc9ADvS+oiGHE+3u7wCOeJRGZ/aQgKoowEu/YiESZ+/UaXqthLm4YIwkUP
         x8Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795467325; x=1796072125;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o/gXwwriPCspFSLvm4k8J+IvKYQXCyefGW4XLOgCZN8=;
        b=lA6aaHYFY8kgC7XSBJ626TAv74/6X+mPyUGOYrcAMnxIAafNNrdnJtFlH4lCcqEfFs
         Rfggo612EYewLwc1a005NzBqdNrUYX1BRp++qkf1T65rpKK2Q37LV+KETfLZIvNpLX6r
         TVINGgwYhvtBDR1ZScTSu1D2Id3IsMKb4uiZ355I6ea3a09Uq+uASFXy9z1ADUGdH20K
         DZsnoNQVl/nuP//MFcIAu7Et05dsbuERMJ23jB2a3NYsHOXu2G9uc7dSmWP9WAxddPtw
         gWrJ7nw391V6y5sbECCg/GLwGe7cl7kB1SLyXmeZg7v+OqcNpRVajsuehpY5L+g0aVf+
         jzIA==
X-Forwarded-Encrypted: i=1; AL+hErFDn/Js9eflG/DURbIxaStNmgesFzS/zG2SybHhS3IIialKMX8huu604NY4mPfQT4RQkNkfhr2eXZjp@vger.kernel.org
X-Gm-Message-State: APuU4Z8vpqNyxeW2BedMaXK0zhANE0eocXYEI5+MZfucffJiPdkWLIWV
	3LnIKmrwkcyl5FFN7gXxRzz+rbybeWEVVs1v2rw8G1Z2AB/THqUWYBv7dw1pRknFwl/Q4MLDaE3
	+1SOKax+RgnELerNJRUTx/LWhf43WZleFDrakiNmjFp/bzQ1HRQuM1J04Kd7uHiii
X-Gm-Gg: AZFdTZcJTT7MDZSZ/lbE7/iqNWUEqhpdQmrnuM0XmNGjwRjqUv6rFMPZlaiY7GkRe7b
	pOmdL1LfTPBFVo9ucpt+NpVg1d0lTNAcGQQd2W5M4JNdUBAmRPtWhCUecOqr60i5kSH90k/rktH
	Hn9ehfRTabWUL5S88CI0Qi2w/k1G+WQU4A1gXzI+0d3Ay6mmmJaAMhryXUGN7pu6coa+bGeLq9h
	ITZJ9LUSnJzBLInja3nwPQrOjWRzAs0sa3iA/fYXRle0xX28SJqWJ+P74IIomSnfXTMqkiYYgtO
	iHdQKvIdCahiNTHwHXSPEF0UcNF8UB0WO6wpV+W4ZQvn//TjifCk0CmSvOig2OLjUy6qPEtglGW
	G3GfLigaUY8UX5F1MfjjAl1SCKAv64WUPO8tsS91Ed+Az4D4zyK6hiRz21cRW5Yyrg1ZOftyKDj
	C6Kn7h0Je8
X-Received: by 2002:a05:7301:7d03:b0:386:9cef:ac3a with SMTP id 5a478bee46e88-3869cefaf23mr8905413eec.28.1795467324785;
        Mon, 23 Nov 2026 12:55:24 -0800 (PST)
X-Received: by 2002:a05:7301:7d03:b0:386:9cef:ac3a with SMTP id 5a478bee46e88-3869cefaf23mr8905387eec.28.1795467324257;
        Mon, 23 Nov 2026 12:55:24 -0800 (PST)
Received: from hu-manafm-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm44209077eec.26.2026.11.23.12.55.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 12:55:23 -0800 (PST)
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 02:24:43 +0530
Subject: [PATCH v5 03/12] arm64: dts: qcom: hamoa-pmic: Enable BCL sensor
 node
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
Message-Id: <20261124-qcom-bcl-hwmon-v5-3-747d5383d538@oss.qualcomm.com>
References: <20261124-qcom-bcl-hwmon-v5-0-747d5383d538@oss.qualcomm.com>
In-Reply-To: <20261124-qcom-bcl-hwmon-v5-0-747d5383d538@oss.qualcomm.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>
Cc: linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mfd@lists.linux.dev, linux-doc@vger.kernel.org,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795467299; l=1726;
 i=manaf.pallikunhi@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=zhna6efU8UrOq6A/hPXjtJfGBmOdiUoack36KYf7d+I=;
 b=JUF+Qvr1MfhBjQofxRFWz8itf9IQztM3tWFITF/Ndgd743dfOYnitwBPWbZGE0CaK4sM7mgmL
 BxKmzmW7mDgCmk6pKpOjoazilMJLtWkZCPzxl3zdJKpzLxtemj9S+hx
X-Developer-Key: i=manaf.pallikunhi@oss.qualcomm.com; a=ed25519;
 pk=oZ3x9jh+FDyPwxHmCbyzEMQHMzKqrH6hUbbL7dEBe2g=
X-Authority-Analysis: v=2.4 cv=Ls0HWXdc c=1 sm=1 tr=0 ts=6b04a83d cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=pei3ZxCQ2QdDqwo0ZtEA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA4MyBTYWx0ZWRfX9CodFWwST3GS
 wzJbA5VOOwiZKylzdJggI1EfBCctw7JpccNtTRsXFdu1j3a+ZVjU7YVEKiRq14t0MXw1ty9jA2z
 vfIi3y4LpjTLaFqGdP/PIsELtUUq0/Udj4bwlCUIBUItZo2C8sbJXJZNouTm06NDN2J1zY5+krp
 uAsmiwnKe+lzY5Y4K8QSwzUPBAJnj5xcIGXVhjDg+UtllVKbJVkK03VG2V89QKBBvxW9M1djQL6
 0R+xrO7xfZA0BI3Y9VCAPjaCkNYd7B5YHvJiOcLZQV1ffOCf1Nar4+LMOCvuSCba0ibrec1NnHJ
 fBxEGvwSEr/dUpahplpvvlcsea86c4jBZdKL1LfcXg9ulP4Y1OgqbPaCShbOn0DUyLTezXYfpQH
 c9FFY8yDlwFMICTMuPSa+pj7Opjhy49KG8r2HyQTlWvyOjKCKvkTAYGQdDTyGWz3IHwLUIs5hzG
 F+QZDSN1iUjRNv2wi+Q==
X-Proofpoint-GUID: H41Fj_KJ1pn6VHKXoqLdKVxJZbdmx2Q2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA4MyBTYWx0ZWRfX630IFr8gKnta
 ehcn2BgLNKL0Cxdpu9k/cQ1NGo0IBYV/tTq583CK3AG00WQRi049HrLjea0iW7cf5PnKytCMZvk
 Nzy/u0G094PbuopwZpmu16DuwxrlXZo=
X-Proofpoint-ORIG-GUID: H41Fj_KJ1pn6VHKXoqLdKVxJZbdmx2Q2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_05,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 spamscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230083

Add Battery Current Limiting (BCL) hardware monitor node for
hamoa-pmic. The BCL monitors battery voltage and current, providing
hardware interrupts when configurable thresholds are violated.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa-pmics.dtsi | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hamoa-pmics.dtsi b/arch/arm64/boot/dts/qcom/hamoa-pmics.dtsi
index 7fad4a9b92fa..6b17d568188e 100644
--- a/arch/arm64/boot/dts/qcom/hamoa-pmics.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa-pmics.dtsi
@@ -426,6 +426,17 @@ pm8550_temp_alarm: temp-alarm@a00 {
 			io-channel-names = "thermal";
 		};
 
+		sensor@4700 {
+			compatible = "qcom,pm8550-bcl";
+			reg = <0x4700>;
+			interrupts = <0x1 0x47 0x0 IRQ_TYPE_EDGE_RISING>,
+				     <0x1 0x47 0x1 IRQ_TYPE_EDGE_RISING>,
+				     <0x1 0x47 0x2 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "max-min",
+					  "critical",
+					  "emergency";
+		};
+
 		pm8550_gpios: gpio@8800 {
 			compatible = "qcom,pm8550-gpio", "qcom,spmi-gpio";
 			reg = <0x8800>;
@@ -674,6 +685,17 @@ smb2360_0: pmic@7 {
 
 		status = "disabled";
 
+		sensor@4700 {
+			compatible = "qcom,smb2360-bcl";
+			reg = <0x4700>;
+			interrupts = <0x7 0x47 0x0 IRQ_TYPE_EDGE_RISING>,
+				     <0x7 0x47 0x1 IRQ_TYPE_EDGE_RISING>,
+				     <0x7 0x47 0x2 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "max-min",
+					  "critical",
+					  "emergency";
+		};
+
 		smb2360_0_eusb2_repeater: phy@fd00 {
 			compatible = "qcom,smb2360-eusb2-repeater";
 			reg = <0xfd00>;

-- 
2.43.0

