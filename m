Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF8563EDE73
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 13:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779368833; cv=none; b=JOVLSsYdRgvzcg0mFxod7xcgx0cTKRMskE5sGgMpxStDoWijAvjFPXqbatZeJXqqsm2EdWw6YceVFjA8iym2Gx98mB1fEQATjUj194qb6vvHqVi7LwWG2RAqSOjavCxf0HNo0arndgBYJeMFHHRMJyjcgoAoyRNq7NHanOZcG/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779368833; c=relaxed/simple;
	bh=B60gwn2osJeq63y28HdBWkh+E7Nc2abnJm78Ob1pKEo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Zl+z9Nu55BEibv/rBfakeThQVRa+uYpFjA2jj73jaDxoX1yGin8DO0hrJu1HdhsPr8gKh2x3GHY6G9eLpvzoKefgivJYhgfyOOMaqQOQDn+Oxef2eULIzPmw07Grw/FCCWwfir2QJeFE52FOtN5P6Fejb5RxAdiPOdGblJ9mhkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F1M28wTS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XN8HdX9v; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F1M28wTS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XN8HdX9v"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L99mXk3451373
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 13:07:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nkgSGT5vmcjvJZV7Oqxtgx09DTrYAdxe+rZl4hZ6XJQ=; b=F1M28wTSK6SmswJf
	u6wUjr3pgFOPWYe7pUJysGd7jfbZRYNwViVVNKlm42Lzvcd7fkeO4WMEKg6NsHVX
	lswr7EKtpaLx1VoKwacAxUzAIk6NMLuRaI5RveAD/SnZO4peCHPJLMofmDmfcCvn
	41Kk6kYsCzRQxdOU0jiQA9qoeGU4UdJuFZ9redEz5aWRbJ1v/UPM/0gPSM8d+3Cd
	0QGhHU8CJ8xTQun3Z9S3NzAqoWTIMxR5DNePFNGDBXVPvvfgpfvma2aepcL/JJFb
	cdw8Wv95Qk91xeMiCRGjrC7iLpKW1vKVLbFSajxqBEvXf/1ouX4T2RwJ7iGSNvtN
	uiJyHA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9y1h8xek-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 13:07:10 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c709551ec08so9386474a12.3
        for <devicetree@vger.kernel.org>; Thu, 21 May 2026 06:07:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779368830; x=1779973630; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nkgSGT5vmcjvJZV7Oqxtgx09DTrYAdxe+rZl4hZ6XJQ=;
        b=XN8HdX9vHM4phcrr+3/b6rzhCNskkoaRsnbCjrTJ1SR8HXiJdl7QRsOQt3sivQfMor
         yGf2V/Yeu4KqCKRHsQ1Mvr5gWrJFYV7P2Zknqx/kONSp6ZoM1ezAQHIhhWVDt8Ug5T1j
         R/Vkucrs/l2launNFh+eGqMT2AO/LZheNw9l61ffBx9Fj6CRZm9qECZRFUUWVuDaIvwb
         EfzUlxQZRu6XgJG/4YVBP09tZ48vGyi67TmIhqIq9O8RXACVnnowOto5tkbxy3cNZ2U5
         A82sZEu0v0yA7CxFWgPpr/n3E1zwuzCkNj85XVBDcylWaLohn2vlXxvGGyaJokA1Bhnj
         hylA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779368830; x=1779973630;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nkgSGT5vmcjvJZV7Oqxtgx09DTrYAdxe+rZl4hZ6XJQ=;
        b=E8Ecnmv+gi8AYsZ12NlwBiETBFYnMUakoL+3HJ4wZKURzny/agOZkvyr+fl6HCVTLQ
         co5eYLMeBaC1qgHldIvo6jrWsRweuPuQOsESXtFS4zlzJ5iqcr9w+WDvPjlvqWfJdu/h
         oGwMUpfB7RGp7MWwqeF2nQNctDUIVTSjqsBtVBsqBhMJNO5HknLGK2ylelSkhEDCiia0
         TGsF+oIlR6WrvSPOTj3Rh7qrV3reFfK9YpugYouA+T5amZgqB28Sb1O1UNK1E84YtH+h
         t/YAyXzvdrCkfNH6Jt4JtYkoNcTrGSbrAj/osC+Cd2wy4nmP9lM6cP75OpoHuk2DM8JV
         ahAg==
X-Forwarded-Encrypted: i=1; AFNElJ9KzCfJzbpjZG5+byhIdeWJ8OlX+wU5xw3Oz9uahxgs+pRFwS8hZa/JZCmDm+/wmvmOCMlzxeZXJOI1@vger.kernel.org
X-Gm-Message-State: AOJu0YxgckQBoC2uguT7TpazZAkmtsdQuXU4gF5/FE1ot6X1SVSm8ert
	1ETID/xtRmR5GuUpznWQ1vRhHG000DQYQLLcWrswhjKyVCk54U0OquUh9TqM1s7q43Y7BDj+dKg
	IGcDVfB73HASjQtE5deswfTWptorZtMU+JoSfenE8J95IC05z5duvZUShmpl8uZAM
X-Gm-Gg: Acq92OH3s73Br6yJ960mFD3yLcm4cbf09mpXgh8/f+HGrSLM15Q3xRsugsguaUsSrZ+
	VkpqOWTd+qvq9PH2101R6pcD2mNA3/pg3r6FVBDwtaJc0tVHLmNGuDBUTkPgRd/PxzdwDgsd4DK
	Yk8pX3MXiKiXL0RKJJJT288IPG/14yYy4I/7qi8XWvUCxU1jXa+bmVc95TMwmUR2UXz87d0VAeE
	1WRRPaB260PgkTQAkUQvWoz45DvJxlx+HM2GhNmSGHssOjZcSw5f+/dk6hz83UpJKhnniF+u3AL
	wWn6n+/7KohVtJe4CstAt9qBGHDTswcT5SsF3q8TnN919ejdK62p56etzvSk57uFwBZn5IlRfT3
	LCGSlohn48dDLPR6yVYyoeV8dY98BDIPY2MMCQnlQcWQNlDG/MYF2h/ZP
X-Received: by 2002:a05:6a20:7f8d:b0:3a0:c285:e51f with SMTP id adf61e73a8af0-3b308bc8879mr3315620637.52.1779368829725;
        Thu, 21 May 2026 06:07:09 -0700 (PDT)
X-Received: by 2002:a05:6a20:7f8d:b0:3a0:c285:e51f with SMTP id adf61e73a8af0-3b308bc8879mr3315567637.52.1779368829255;
        Thu, 21 May 2026 06:07:09 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c851991ab10sm294602a12.22.2026.05.21.06.07.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 06:07:08 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 21 May 2026 18:36:36 +0530
Subject: [PATCH 03/18] arm64: dts: qcom: sdm845: Fix PCIe wake GPIO
 polarity
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260521-wake-v1-3-d822567be258@oss.qualcomm.com>
References: <20260521-wake-v1-0-d822567be258@oss.qualcomm.com>
In-Reply-To: <20260521-wake-v1-0-d822567be258@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779368813; l=970;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=B60gwn2osJeq63y28HdBWkh+E7Nc2abnJm78Ob1pKEo=;
 b=X9dYaR03XEyAICIwGeKi8ad77vwcjMnK7jPQpjIYxb4Qc8gFEMzVWkbjlRQh541IZ2lqqe7Pq
 xYQsXphms4WCPi+k4+x4Rr+fao67AAkVrvpb2XpAagkq5IHGEF7Pwhq
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-ORIG-GUID: KYzVxTQMkgW6V-NwRaTY0SPdewEyAT8Y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDEzMSBTYWx0ZWRfX7uhBB6PII4EL
 hM/ojr75AX9j2+e2LWayYX/XAXV6Ue1aRAT89lqp/iJKiPI/Mge7dIqoDEqCsyBQRmDmhxmA8Bp
 8ePwnT1ACqhlobZ4TqU4/nUUpAqc+odMHZiqZVKdFYLmC+MUw6ECdwTj8FsO+gKUBD1WaOioC6C
 UrVHxZLvhGJQuCKXlON+8Rjkje9DCULPSjPJRFl69Wntidv3N5ZYYtcjDgjN079NloQq7CayHGW
 ro9BvpyU0JpUmrzQLdBh51K3M8I2B8gQQRdzZhAeSQ+tGusXtmtgE79eIiLOKRv6iio9ZuJQD1E
 Vrk3733/8BGNQ058KipBAVHVndK8V5CGXImCR0huMKMSK9PKcmp1RbKQ5tl2adNCIeGP6XOGn8i
 oZEXZlLA4HnpzomKEOUc9WDFZ4NHS7Q6QUSbzXl/DlJtsf/4iFzCWuCbuSMXf+u+XsgovOtnivG
 hA+SqQX/Z+GOBbM3lPQ==
X-Authority-Analysis: v=2.4 cv=YfyNIQRf c=1 sm=1 tr=0 ts=6a0f037e cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=t4RzHNKIQDbQSdFyBH0A:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: KYzVxTQMkgW6V-NwRaTY0SPdewEyAT8Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 impostorscore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210131

The PCIe WAKE# signal is active-low as defined in the PCIe Base
Specification. Fix the wake-gpios polarity by using GPIO_ACTIVE_LOW
instead of GPIO_ACTIVE_HIGH.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
---
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
index 02416812b6a7..24c0e97bb122 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
@@ -619,7 +619,7 @@ &mss_pil {
 &pcie0 {
 	status = "okay";
 	perst-gpios = <&tlmm 35 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 134 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 134 GPIO_ACTIVE_LOW>;
 
 	vddpe-3v3-supply = <&pcie0_3p3v_dual>;
 

-- 
2.34.1

