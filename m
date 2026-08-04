Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E8AC375F62
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 12:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785846762; cv=none; b=HgI14aInIF77frDLMQQ8d96KzVP0VcN2uw2cqT4e3HUla2a6CzFeCSVOcaGhVexSv6N6u+n+7IOI0uFNF7Gn8LWJJNTWSTHG5SF5WNTNRKcgkoE9wuJclFgZdJ1HrGL7/jGBuGRQBJZ8i3LWfZFJ/qtn2WSSl3RiM24XARarKR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785846762; c=relaxed/simple;
	bh=73c78YTxyychMUeTEd2+RTUAk/XbXHvYkWeOL8n0/o8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AUBD/fPLRAbyNL7z66XRG04cmEd4JwC7OWiiTyt2ZcEpP/ACrKpELB/CVRyzxMWeG4Z4NZ4tzJT2u4xY+cr4GMcdqjpDFGMhpExh7K1CncliHTz2GEvrdm+8E84zGn8394RAFzysPly+c80lMK0C7t37sG+xz4moc2HXDakclJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ihkJhPpG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TGZrh/A8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ihkJhPpG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TGZrh/A8"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6748CK533373780
	for <devicetree@vger.kernel.org>; Tue, 4 Aug 2026 12:32:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pzTiRvjLPHR3ElmjTSBFZ+VcbzXt5gd3AiTx06jCU+0=; b=ihkJhPpGE9EVQlBg
	orVbunsqrRLT2eGOKoMNpNMMCRSqRI5Hvv4iPXZWGtNGzQqIRkBAbZbFLfRoB/kE
	IOLTmqpBrHI9A259HZ8PuNuyxJrObkB3aD6U/6q5TT6qoRU8Ey8yVeZ5WOwCiGcW
	ZmRhunggXiZxnwgHN3VHWeifvivdEeW8PgQLJu7O00CPsLegyDf2NF19oDn1E3xq
	QzmNanSGfhkPm3IBJLmKOgYu94Dg2dpkiv/yoHe3km7ICk5vfOYiSUSc3nFl3VD0
	A/azTgLqgcmJvkYzvvgFjOYziUi43vho7d+ioez08xawTQmq0yp8YX3CTcEBLewz
	wnp0QQ==
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fty3r4627-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 04 Aug 2026 12:32:39 +0000 (GMT)
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-7e6b5a8836bso939400a34.2
        for <devicetree@vger.kernel.org>; Tue, 04 Aug 2026 05:32:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785846758; x=1786451558; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pzTiRvjLPHR3ElmjTSBFZ+VcbzXt5gd3AiTx06jCU+0=;
        b=TGZrh/A8m+XhydRV+CeISzBpo2bOtWRKeX2lHoqYZx617/OUW3WYKqcL3nXehpFG+A
         kt0kykZCA8qmlxq7N1ZIeOr0d6vIxr8HodkMXZKGrvdD7jufHxKG3zDmU3fqpHcP+tOA
         q4yY3Ovsh5IaNJHwiI+0G8hytcEqsuiX24wigCKZb4v5LZRKsGCl5lTaH4GI3msQVEZ3
         ocbXsaFWk7mZXPrMAs2HcLVTv++xGEwOY8ZGx71fwUD7H5o5vGR5+sVMJ8b7ViWEV8KI
         sJral5AMzeY8zYddA+H6g63pl/Dn+puzSRVxqmkwrH2R7+jDIm6E2g2jMDogS9q+oEH8
         8+Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785846758; x=1786451558;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pzTiRvjLPHR3ElmjTSBFZ+VcbzXt5gd3AiTx06jCU+0=;
        b=kWfPFFVxqVG5PDqLbN4fGfjcWcDeHlQPoucAGxEGUmgCAyShQ0PqTPq7cEPLGVAH+g
         rZTkKw2jk+bvQYPYvpR2UeQDiIhtA+YLiYfHgrl1Mpp8T0UAx3CwAP30sFmTyB7QZywb
         s00Wpt197YxyJMWn0XG/jSLwd3mn/I782/Kv/pZ6GJ+eACASL+R4Atl2Wopl0JfgvSAS
         ymkQYbowS+CWf2v/3pKi41l7i/5riufvg20s1W/lgARYGx7PIhZTNWEgGp8rKvsXjFlD
         gPv9wWHM6q/1t7+UrFZE/6J/L5d8gyMSV0V0W3+ahD8cfLzWgyg1szYA+pWfev7MFE0v
         YP7w==
X-Forwarded-Encrypted: i=1; AHgh+Rr468v80+Im5XKXTVbocN90oO5jRSFXl3S1MbUj6AEWM6xdReKSejKH2v3nsXpkS4tAajPeMo50Ux3P@vger.kernel.org
X-Gm-Message-State: AOJu0Yyyw5++ADOqsld3om9uaF+THcHwFZiiXT+EsWVHhMHoSzuScTNU
	AX0DNrMZz7OSjx8PWkujZJRsQu666O8Xd8JYB/NElRsWcEeZN9uCXNgHUJ2GiBjZXvvxxJMf3ZO
	NdMz0O8t5l8wOOGocQaKI8zK51qgG3Xway0UeoXacVjz8NdkUTqhzh1I8CS7tviNB
X-Gm-Gg: AR+sD10nqofdR0GUygzyoBBymGu9kMRK4v3xSbfOHoJZ5vRSLJb56nAoWG+7SXGrDEg
	rKDOMZelUKN/Tts6iLLe/01y9ZBjiIILyauoEhcSoJvxX+G58JeyfUfaUnisV7qfSdqczxehXbD
	XIAvHWV5n2YWR3DlrDGMLPu/a5+rzNotx9gdEn5+IxJw5j0Sg6HKw4welWtztjGBEiAfAw/LmGw
	5CVSkeOYmzgvfrIIHn9NW1L0P6awRMeZfKMONoh3LvHCAE2uBcVjQ6VFrs5ClwwMu6Ar60DU0cs
	KQyf0LADSnvZp8FaUP9MtWgMyLus6qumM6kbvRXyV78dZEKYwLP0rwgvs/gLcG6Pu7H96ySEG+C
	OEw0u65NN8FfiQ0iav4hsdWpCUUp8rg0Tejt03lGRwjC/jD2hBw8=
X-Received: by 2002:a05:6830:6d4a:b0:7ee:363d:ce16 with SMTP id 46e09a7af769-7f1968d12a6mr12948055a34.0.1785846757958;
        Tue, 04 Aug 2026 05:32:37 -0700 (PDT)
X-Received: by 2002:a05:6830:6d4a:b0:7ee:363d:ce16 with SMTP id 46e09a7af769-7f1968d12a6mr12948021a34.0.1785846757250;
        Tue, 04 Aug 2026 05:32:37 -0700 (PDT)
Received: from hu-weiden-sha.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-458f6064d2esm12227013fac.3.2026.08.04.05.32.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 05:32:37 -0700 (PDT)
From: Wei Deng <wei.deng@oss.qualcomm.com>
Date: Tue, 04 Aug 2026 18:02:25 +0530
Subject: [PATCH v4 1/4] arm64: dts: qcom: hamoa: Add graph port/endpoint
 anchors to pcie4_port0 and uart14
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260804-hamoa-m2-dts-v2-v4-1-1b5ceac74538@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=caPiaHDM c=1 sm=1 tr=0 ts=6a71dbe7 cx=c_pps
 a=OI0sxtj7PyCX9F1bxD/puw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=pcMctSQqfhAIPZQ742QA:9 a=QEXdDO2ut3YA:10
 a=Z1Yy7GAxqfX1iEi80vsk:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDA5OSBTYWx0ZWRfX2y/wVN2gVoqN
 Q8pxAfVcHlENC/BcHoT6a66hjX6Vx7rw/plBm0ANEU18vStqSdKkJgP7U1x/xcwgiULguaSHJNH
 jKsOkq6GC0YhOCCAL8JwrwgWVj/NHAk=
X-Proofpoint-GUID: F-No0YTJdK7z6qSpg6-HSTje5gxI7Izc
X-Proofpoint-ORIG-GUID: F-No0YTJdK7z6qSpg6-HSTje5gxI7Izc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDA5OSBTYWx0ZWRfX/ZksU6fg8Ynp
 VBEG8KNJZyAQ2yFYdVhkxVZUoddWI2l0j89dTdkRR1Rr59pymctqwzAfqM4NFGuWMYhVCbEyAv1
 69LBBcGC+diVZD+5odApH5BatyF/0xU2BbgOZvAdf+vJoFd6SNb89yloifwX9xTH1zFPG7wcQH2
 Bhu1Pzspo+p26qlZ36cxWnY7BpK2e8mZFABaJHBfGAeclaUOkIVe75NVX7yY4U8O6lD0aIXI9Xh
 MX0/UPq8MP7xouvOYL8iHi0p7a6I+w3emRHpZ+HSI+RghhM9XSSbHvLY9cx56IkWBmqZX1Z5wA3
 Q/Xf0DkVDrwUBD7IIad3NLQLRD6yO9zlQekKdgHE8nDwlLP/kXSa1F11yg03qG6vrLVbtWPN1ck
 AwWZXe83h/l54Lk49ItNfTVz4DSye+Fc6wD1YfogdEv3n3UKanFAg9uKm4Z0R/BJscb5wKJ4Rot
 7vIYaeey4AmQiitIryw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_02,2026-08-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0 phishscore=0
 suspectscore=0 spamscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608040099

Add empty graph port/endpoint nodes to pcie4_port0 and uart14 in hamoa.dtsi
so that board files can reference the endpoint labels (pcie4_port0_ep,
uart14_ep) to describe connections to M.2 Key E connectors via
remote-endpoint overrides.

Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Wei Deng <wei.deng@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
index 09527dcf9576..f13e310995aa 100644
--- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
@@ -2025,6 +2025,11 @@ &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
 				pinctrl-names = "default";
 
 				status = "disabled";
+
+				port {
+					uart14_ep: endpoint {
+					};
+				};
 			};
 
 			i2c15: i2c@a9c000 {
@@ -3785,6 +3790,11 @@ pcie4_port0: pcie@0 {
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;
+
+				port {
+					pcie4_port0_ep: endpoint {
+					};
+				};
 			};
 		};
 

-- 
2.34.1

