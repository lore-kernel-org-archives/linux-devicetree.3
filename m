Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDF8E41167F
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 10:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787220561; cv=none; b=OQIvyEb86bgxYfAT/a6GovJdpIsKdN0bck9QRrIARrbhvoGNx+50Us4N1uN5fMaFkJ5IfANDtVNYervBUfIc7HjdG0HeMjjT0EJOIVbwi/6OjWDznWJynaZzSnuO7qf6i/s84/xZLHQqcV00IWVdV550wll/is3jOTY5Tf7faJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787220561; c=relaxed/simple;
	bh=efBjfGOsvP+ouDw0Cdkr+P3tV+HFKOcqgBXTrfJplbw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KYVtLZfu0qDrlg6Oe0lAIKSvMm6XCLhnz4q8D5kkS0Jq5fwG05oTbIyg/NTxsc3SxwV2pwYvzr3IBOo52Pp4iEg+d7K6rwcEBcwWtZCPdrqGfUwtKves7blP3GoUGRcH6h9nPWL97NKp+RVCZZ5/lN77WjsTNJaf7B22gRKxUn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d24KRiQT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fI+y9Xb1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d24KRiQT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fI+y9Xb1"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67K6Kxx4490936
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 10:09:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HTXHScq3jySAp1LrX4Fz0QmrP9cXMZf3LmxSWbsjGSo=; b=d24KRiQTBx5m1AXx
	F+fSdMI3CQNc4A7h0xU4MdnSYkgxB5qkf/0Rq0WnFulPuNkk7/RV/qQuINshd70p
	5NUSQ13xHiKQ0CY9AztD7YVI+Qxm1jsk64OV0T+kqPsapzmTHp9LwENBAihu2dx/
	GVExUF+UL8JmLr41X4uxWpEqvRrjqBFpwmgYV8eFZ3mSxN/w3HOx1CV3WZPEYkkA
	dU77CbbNVtqSCe6m2EGGBXUU1QWPERobLGn+cGilU5QVdaXTVkWgg4kx7Q51MAq9
	VHmZlH9Hzipti+oeHBfRyJuK19uT8BhEoqUbMrqufy/vWKva1btUT7ZAAo7641Uj
	39AsCg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5ervmd1p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 10:09:09 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-936708f129aso178448685a.0
        for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 03:09:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787220548; x=1787825348; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HTXHScq3jySAp1LrX4Fz0QmrP9cXMZf3LmxSWbsjGSo=;
        b=fI+y9Xb18A/dWmVua6/UqWD4hasJI9vsp/LoiGNlyWh5lurOtBnFIhwnNPALr7qGxW
         mfAYbJOmMSxGBtp6MkEMQIAurghl4b+ILW00aeOn1CxaLaTUwsUy6OOpjEkkgtnfSsMT
         QpAXOL205/eL401uRG7FH3OInLL0k83L7PVZEgYnMYX8suVPXVeWd5HejONIuB2U+zpy
         G6hLXcyUy99eaPyIQ7mDL0cfYVzYI0prbFZabBbtZajd/NSvHuAuDcPkyW/0peWZtUC+
         paJ+ufaSWdhOxklnQyJp9e9uhRBAb90LtodOux3IAS7+odYSAeRSOv2sdBHPa9DmkHqB
         EFFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787220548; x=1787825348;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HTXHScq3jySAp1LrX4Fz0QmrP9cXMZf3LmxSWbsjGSo=;
        b=OLbYwYuraSw2nOBriywGPY+k14Q9H7FgYXBzd1VMFCavihrizegj5kXAUkxcD4wM9r
         tkUPEam7e6S8gSEM1WJ8yfFD42DUL7VZP7Vq7bcV1VMj7l0zImHNm6kdqavQg1HnU64B
         OctRYN6y4p18VqCsR3utaZF3bnfJvWnCnC3UTsePvZjOkWfFb9TvicDBEqyH7Td57mCt
         pJtjA2MocpJyNv1Ajkc3RFqFeXOCstso3vdbxNwao35OoN9axAeO/vSXPtYezDQ4SVrE
         im2uYL9yVSUi/D5Pip52IgUaRswR+jDk15MglwrJWcilrUoXlUTbiLVDAeK10S170Fk5
         fxew==
X-Forwarded-Encrypted: i=1; AHgh+Rqx6lkyXiNNQSo9tqQrmsPIsOk0sDLbz00FFN9wbxJLA+yBw91XQ4+FOksFPGqyuEnhY5uMr26JnSwQ@vger.kernel.org
X-Gm-Message-State: AOJu0YwxZ3GxlkPG0ipmN1j3hvQC2cD+61kIRMOwp5cjc34c8UdA+g4i
	LS6XvuxO8k+coLfzfZZpLMVZRSaH/zgdH09GgnDyZedGpgEgOUEu7BuwYtxMKcl8MbjZep3rDel
	rjL+5Wtb9L/IcHPCgaAYJdioQB6sZyD05uqVaIlNKTC//XcdkfyXMhbFkmSaFLJHI
X-Gm-Gg: AR+sD10AuoIPq1ZuqtqD8cXJq27gpcEZ11faW6ZpJb4N5e/WmiUpjOkCRG7U2xhBaX6
	4TfVJRhu06HsjbC6OmDqUwx5XDFXvWj+0keXkMnY1zCA7Pllq0/ZaAZhLfpb3FTjSfrdiBOzz2D
	8UF5FvtkIIMHbjE0DBMpXKdGa5ZBYRDbSGJXXYCKp9cybwwafShzcsl8TF5Q4YPeyZWuVeQTmzl
	KJYIcfrFsIn/bA038TT38aRhXh0Pwi6wI4fiwkdH4sfy+1HGyVDUYs+9Jqe6nch83DFoENFc+XN
	BjFSvKpZ1QoNrWPkcJd0ZLGnjCDt2Aejbwkv/TC9+A7Bfm8Fu7/RKr8cfJvNkF0ib0FT4sfQRM1
	eRRzTGG9c
X-Received: by 2002:a05:620a:4142:b0:92e:8a84:7041 with SMTP id af79cd13be357-9371e204e49mr974262685a.8.1787220548001;
        Thu, 20 Aug 2026 03:09:08 -0700 (PDT)
X-Received: by 2002:a05:620a:4142:b0:92e:8a84:7041 with SMTP id af79cd13be357-9371e204e49mr974226885a.8.1787220543906;
        Thu, 20 Aug 2026 03:09:03 -0700 (PDT)
Received: from [127.0.1.1] ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499aa1755b2sm134966935e9.11.2026.08.20.03.09.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 03:09:01 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 20 Aug 2026 13:07:13 +0300
Subject: [PATCH v2 10/16] arm64: dts: qcom: sm8350: Add GCC CX power domain
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260820-qcom-tie-cx-to-gcc-v2-10-e67ea30d8b7b@oss.qualcomm.com>
References: <20260820-qcom-tie-cx-to-gcc-v2-0-e67ea30d8b7b@oss.qualcomm.com>
In-Reply-To: <20260820-qcom-tie-cx-to-gcc-v2-0-e67ea30d8b7b@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=985;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=efBjfGOsvP+ouDw0Cdkr+P3tV+HFKOcqgBXTrfJplbw=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqhtIC7aOoVhqMKAKNLuRzQ6hQToZB7qHcsAm+S
 5vIYyT7YLaJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaobSAgAKCRAbX0TJAJUV
 Vn+ZD/0edF+jA4FFWsIbwB8znExVCFrPOBpW8EqPhTPsLwEHddD8lwMvnYIfdj5s4FlWNJayh0k
 WMGZmDQ5tYz3HXBE3twNCfSb8cwU0wYBmTA2iDp55miiGzziQU2g26922N2pZsfBi9rjdAhF8xX
 Aam9llXyVPXVZj7VHfmCvJnrVv5kDkZ0EBCWcwyiMC1IcGIbU5i5c7tnrry9h14SFtv/ebcQ+i8
 yU9WceAi+G7d+2WrsEoonayTqUzkg0IeLY9d/F9mr8a2RUEKc8ZDKkCQdKpFJQoyEniZndkh2j+
 UgTNUBr158xzRqphZmlSwa6Wbflz5YZWYL8LmGjZDHVO7S5Ikz30HnABBnN4NRSoJMOwlm7cbtJ
 6ALXNrzSkPmJaX87un+B2GGOrPg0+r8MdTO/eUp06Chgi7BsmxkHqgtsfY4DTq/blv/UzZWleVG
 JxIUhvcKXI+0N0L4h+r6M6bbD3X9Ue4sutlW3w5KJvHD3nFL6KzuBzDOWWX1sLmoZVMm3JRF94G
 FUvIZl4zdG2FAcxA/H05OkzQF1rkYC/O70iB6WGwOOVI1EjV1rWrpbUrfIVF9Gs17SMa7AtNGkM
 HGKz7sCxgshJuSfEgEr8RZuCW5ljv271ZGINgK7haQVIwsV7tTfBedCRSJqwy2PWYayhSg4IQdO
 ytoJBxYLUaLfF3Q==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: VfqdUN6hZGSyXFh31T94VwvGIYGA6Wu6
X-Authority-Analysis: v=2.4 cv=VZ3H+lp9 c=1 sm=1 tr=0 ts=6a86d245 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=S9gNOWPKAuR5AUhlrlYA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDA3NCBTYWx0ZWRfX0H0ofpryFCVk
 9EFN2BbEs5GJ7MvO+9Y7ZAhcLjzgPGtTFGsZlXpu6nMrN7C+p55tJkrvACSAsE2vrlHYJ7UWNLJ
 TZDluVfLr6WA0/El5/6mtSuAkLQU5z4NE+sJSVAEhSVNMtwpJg8SyRwEUnq2P+NrW+SOnTcVJlN
 UiaAnUpHhC8zcO8Zd+13VC8rV7R0y8PJ/JVXfUB8c4JG5Lx8qr1JsPXa1hingHN2B1MJfN8jmZG
 fSbJ5sLOFjnlOFURxz3pUBzXnsw3Iefhvn6RYdyPQVz2DDNZENpwG3itfreOuYp9aYU7UPBD2jg
 jE8NRquEx6CHjwuQMgNzKf39x5X5kvBU8dFpd8yKZOSa8U/fx6NcVopxZpATLdy4Hz6fQFDvxCj
 KaC3Xz0QBLhyaLMP8DmBuBK/37H3TDxqYlsLEYfRWU+9aJV1LgKZOnc1QL1ukUNNf1rcChqdJs5
 bNSNvgm5fr1GgsqUTCg==
X-Proofpoint-ORIG-GUID: VfqdUN6hZGSyXFh31T94VwvGIYGA6Wu6
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDA3NCBTYWx0ZWRfXwjZIlEtx7VBb
 HlOfqr1sOwPudh2tCVCUnrNNzM8Ofg4nCGElv3IlRpUKlGrUZljJ3i2yL22u8vIbREntrFPD8jB
 KWPgX6AB7GaQbXldlauM086WYUs2L+k=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_06,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608200074

The GCC GDSCs on SM8350 are backed by the RPMh CX power domain. Without
describing that parent domain, consumers of GCC-provided GDSCs can enable
their local domain without causing the required CX vote to be held.

Add the CX power-domain reference to the GCC node so votes from GCC GDSC
consumers can propagate to RPMh CX.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8350.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index 32b47f5ec1f6..84012a407c4b 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -699,6 +699,7 @@ gcc: clock-controller@100000 {
 				 <&ufs_mem_phy 2>,
 				 <&usb_1_qmpphy QMP_USB43DP_USB3_PIPE_CLK>,
 				 <0>;
+			power-domains = <&rpmhpd RPMHPD_CX>;
 		};
 
 		ipcc: mailbox@408000 {

-- 
2.54.0

