Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58B233815EA
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 05:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783400856; cv=none; b=pQ65k0UmziCbLxvnyyo0eSLyQY1zsddceKRRtOvPlHls+XRF3zoq2/uc7wKtDEfOY4m938RVytteKUpRMw7QfB4HaRRdg8pVjAdmyM+uLVjAl8tJ/YW7+cRNudx/Zj55YoDScArXHKHrHdrW/uuhjkH8f27W/WSuESFNtVjrFfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783400856; c=relaxed/simple;
	bh=6RVr5NpJkkcCiFIoHGaOvdBVJjf0qL5PKNjHtaOrEWY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Z+PYee0FO3SYxs6C2RA6rr5l/ZOgR6BALiepgF6ht8k8sfRtJg777oL6IeQwp8UM8CEUMliO8xJsxqhGZfL4820r0w8rkvOo6OKMhETVLVY9Ntg1pv246rQkXzq5YPp0p1apP22JWrwZHH5B8ZpPV/hKXijIoWT8lA+wIG0Q4Tc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JKjLJHtm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ql7kmyxA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JKjLJHtm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ql7kmyxA"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66749NiC2658630
	for <devicetree@vger.kernel.org>; Tue, 7 Jul 2026 05:07:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vJah4vNVwjs7VSSGB+A9naKi9Nf1+1dJyUG7gSQkLj8=; b=JKjLJHtm2mdFKt9x
	tx6hteFxEw7PW3oBCS+IZTvyyZ5ehwmLwcZ4FiqsMdZhjMstDIocLQ5xpGfcTdH+
	MmPee2/rzDdZMCLTdk6S1FKF4f3+umrArqF6RF+VqRSQvGluRNl6+EaaYid/XlkA
	4aKhY1Y3giU4wZgwqr/4kb2rvHV1099yRafn2qOvMMMn9c6io+CuE798zNs9iW9l
	McUSOW2OKOemez044ISt3hhZRBlI25onKB/lORjqrC8i4GhJjpHIKVp9THjUf4aU
	DrQm1iSrkNZ+i5a+/7v7eCK1QE02h0Xqx0E3LVYfZXGa9Rw53NtQmwjHDx18N86G
	ewekNw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8a3r44v4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 05:07:33 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c889d1eedcdso6226100a12.1
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 22:07:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783400852; x=1784005652; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vJah4vNVwjs7VSSGB+A9naKi9Nf1+1dJyUG7gSQkLj8=;
        b=Ql7kmyxAKk5FpJSySfZtTuwDgpEjiWMGGqdv5/siUydZy7jgLePfNRHUTgdS2tH4Ml
         uv9IuyLgJDGdhwNoQJ/HxhUl8RJPoxfNpTYoOe1hGH9nVnKg2BdaYYkyG9Y+FrZllRBV
         8iZovUlSfhJ4KamcyKmOa7nkjfFFwW9zB1JCY7cenBPPJogth7Ily2TE+R0O9wMzrOvs
         awy4W0FVp2sh5ia5n0OY3jRBlhxSi+5GZfG+TZhxWNt2Ub/sITbOuU6mv9OvWeV+m51h
         w7AYHSyHVE2ayrQt+CYDXIqL8xHoHwlq+OTgWdOvGMeZljWNP/KnVMzLQOm7QorNTThx
         952A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783400852; x=1784005652;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vJah4vNVwjs7VSSGB+A9naKi9Nf1+1dJyUG7gSQkLj8=;
        b=LKUUBg1TueBvafFEgaYW+XWwt+rm7zX4cL/JAiEzFro+CWAQUBCB7fK7Vfka3LG3eH
         Cft7l16KxQ8TgNkQSZlnIgfYuT3AkLMh7+AqHrAAfaVDUJndNKOfyvu2QTt4g6X6VN6v
         4sYn8CObHGDcvdsHgOsMTQ6NpIVbT6+TWx/Ra5ozV7sWj0avSSo0DBgIeiqzMEGyyYk8
         139OuDaT1vLD2dhmgKqWlhS9rOnGh5F6UXulYoFt694idnryilCAdeSCK2ZGf1CAnvox
         7r22XHa7RSJbUoOHixmCbVgwV1f+/X2RFiUEiN5pC26fpgiAl0PHCKACZxY5BKNFSci7
         V17g==
X-Forwarded-Encrypted: i=1; AHgh+RqcANPAK02xil+2Oy3m66z4lZMqF0eL1MI8Tabp2hzykDBq2o5Sy2GMfjyzRzfsYXHkQHOXABEn7Oqr@vger.kernel.org
X-Gm-Message-State: AOJu0Yyiz8SRNsrdtUoOvHQ3DQUmVOsxu0byEGQ47FUwxuvo6Ffo9A6X
	CYrnTcfu/MGQGaquTNIACKPGvm5fSejHGbFePRSlRHrjOz2vsRlNCjzjKZ0MFcT1h0/N2//xGmN
	8k3dtVRu6QcuaFb+5nUdHiMdTyQMNiisn1IpM/N1rSy8sx2k9fODkRAmVAcN6TMHK
X-Gm-Gg: AfdE7cm7t8xBT4MG/rizyd6J3UPRuOOm1IErFJRh8jbVKhoTfaJuPg0kpRjT307t3G4
	eyOhsdGFaoBQxemzA2bhEg40ieiBj+CN6PhL76xf9z2U+aoohfODu53XUSFlZ8UxPUGIVN6dU5/
	rsOzSyPYtF5h+CgtoI0YjoS4gVtH5R1mgh0qEj4XpT7qRx7hODbVZFd1Zy2jDFJ6ZK2/83kin8O
	6/eLZL8wqgtvw6cIEsvXa1kYk4uUmIlzqV/EaQuTSHuYnOk2vwbsMkNJ9D8GUtV2gxWQ5aBMPfz
	ZwIhwwi6LIUft9s1+uX9193AwCwWqclKo9Ek1M+EozsrXNV5z7sd6nax5F2NyWCqVr/CXKZ/DKe
	fEvGdoUy1OYs5WDKMwmEEVfWvVcFVelLF4u0On8XCsRZcpQN7hzWARF/Xw1zu3vpiX9Ckud6+30
	riJgqI
X-Received: by 2002:a05:6a20:2448:b0:3bd:3591:2457 with SMTP id adf61e73a8af0-3c08ed405ebmr4264980637.4.1783400852216;
        Mon, 06 Jul 2026 22:07:32 -0700 (PDT)
X-Received: by 2002:a05:6a20:2448:b0:3bd:3591:2457 with SMTP id adf61e73a8af0-3c08ed405ebmr4264952637.4.1783400851801;
        Mon, 06 Jul 2026 22:07:31 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca5b3162b59sm352300a12.16.2026.07.06.22.07.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 22:07:31 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Date: Tue, 07 Jul 2026 10:37:18 +0530
Subject: [PATCH 2/2] arm64: dts: qcom: kaanapali-qrd: Add PMIC Glink node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260707-kaanapali-pmic-glink-v1-2-3f7d476672d9@oss.qualcomm.com>
References: <20260707-kaanapali-pmic-glink-v1-0-3f7d476672d9@oss.qualcomm.com>
In-Reply-To: <20260707-kaanapali-pmic-glink-v1-0-3f7d476672d9@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783400840; l=1734;
 i=krishna.kurapati@oss.qualcomm.com; s=20260707; h=from:subject:message-id;
 bh=6RVr5NpJkkcCiFIoHGaOvdBVJjf0qL5PKNjHtaOrEWY=;
 b=wjEH+5UV8vUL2H4qdqMyUzf3/izAqB2dIMefMiAi/8TtWmzjpT6jqXabn4qOI2hXGJYONuYH2
 WhQYqNs2ZlgDkAhsb8fdvAzzSiK3qFe35u7cqKigzk0m+5//JIscXAg
X-Developer-Key: i=krishna.kurapati@oss.qualcomm.com; a=ed25519;
 pk=6PmiuwGCdov3wRO+bdmRlRxRtmJyDKz3ED57LLPVgds=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA0NSBTYWx0ZWRfX2bSeCkYcCXiK
 nfGMgmX8NKOY0gjyP6CrcruhRWVWMVYtkKkZRkXM0sz29ZlLJAJ9rZE7/oP5THjD/eLvqFV3mzX
 5DOGVVRlcTu+RfoLO/EZYLBoYQ7dnnLnz/b7cmYA7oHgSmxwZUOVI1cPj/PhMwn47DAzABMfnyi
 x9rRzthD/LxxSInxg/7pwan9g5f/v7F/V6CRI25iwEixAI7kcXpo+T96i65/smXnMcoew4VmVqV
 ijazRTqKGCNkJHaWol5WgslMShAg2n0pbA73fyu+eRIotFsc6EYbzLGY5/c51RNMnZFLt18Diir
 4lK+Z86gbD+fCx9d4ElSM2HrrM19z2zk63/ksxXEI8I9HM6JSwb+HlZ6e+6XQR2TGPhmAE/BKe4
 u8MdOF5VkDNG48oT+8D5RO6rdz5yGlpAsHdbxufwZDUXBjZFKZb8Ki5yp2Tyeheg2HRobsNt3tz
 B2jrbUeK8iukedfPicA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA0NSBTYWx0ZWRfX9UetEkWA8A4J
 RcqIpTFrRkTSMQcmf8X01sSps0YhIFmPt3VFMewc3IFB82CMfU37OyNOUvYez/75YKJSqTZfnO/
 jlnmnnF09IOitCkxoOcDErKla8NlDx8=
X-Proofpoint-GUID: pnQQ0rCy1bazErm5NKgp_5OZ77mU3Id-
X-Proofpoint-ORIG-GUID: pnQQ0rCy1bazErm5NKgp_5OZ77mU3Id-
X-Authority-Analysis: v=2.4 cv=OKcXGyaB c=1 sm=1 tr=0 ts=6a4c8995 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=7aILTqA_qkZ4MrPzyYUA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 spamscore=0 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070045

Add PMIC Glink node on Kaanapali QRD Platform and add remote-endpoint
linkages to DWC3 controller and QMP phy respectively.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali-qrd.dts | 53 ++++++++++++++++++++++++++++--
 1 file changed, 51 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali-qrd.dts b/arch/arm64/boot/dts/qcom/kaanapali-qrd.dts
index 55d02219ef4e..a79ae73acf0d 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/kaanapali-qrd.dts
@@ -80,6 +80,49 @@ key-volume-up {
 			wakeup-source;
 		};
 	};
+
+	pmic-glink {
+		compatible = "qcom,kaanapali-pmic-glink",
+			     "qcom,pmic-glink";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		connector@0 {
+			compatible = "usb-c-connector";
+			reg = <0>;
+
+			power-role = "dual";
+			data-role = "dual";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					pmic_glink_hs_in: endpoint {
+						remote-endpoint = <&usb_dwc3_hs>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					pmic_glink_ss_in: endpoint {
+						remote-endpoint = <&usb_dp_qmpphy_out>;
+					};
+				};
+
+				port@2 {
+					reg = <2>;
+
+					pmic_glink_sbu: endpoint {
+					};
+				};
+			};
+		};
+	};
 };
 
 &apps_rsc {
@@ -823,8 +866,6 @@ &ufs_mem_phy {
 };
 
 &usb {
-	dr_mode = "peripheral";
-
 	status = "okay";
 };
 
@@ -843,3 +884,11 @@ &usb_dp_qmpphy {
 
 	status = "okay";
 };
+
+&usb_dp_qmpphy_out {
+	remote-endpoint = <&pmic_glink_ss_in>;
+};
+
+&usb_dwc3_hs {
+	remote-endpoint = <&pmic_glink_hs_in>;
+};

-- 
2.34.1

