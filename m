Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA3DB3B05A2
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 15:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785424860; cv=none; b=ol9d9CmhYGM1XGjAsqTf8I7B7y4+197NLyhgjGGys3nIBJqIDiEMJJCmaXy5rcDxlR7IssGWR8TrquzpmY6XhGi6yjQNsLzcOa+RNSrUlS8pfbz9kKEhk98dNY5BHz7q4TKVvqsw3h/6g767J061jBkuwTS8Gs42sXuDIWhLWqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785424860; c=relaxed/simple;
	bh=aFCxwN+s0nObB9dYmcqshZUCs9EjeMcuhwbHJaldKhc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ujmmtJESCo3i9DCykkWiWlQC0eavItzLyNNWz1PYsaGwmUwqNcIvjFB/+gl0Dqj6TwM8ovHXDcfjaveB0o1JGOd4Frh60CJS/BoF6uTAIE1iAZKUxh83mzTTvOT8m3LLIlrqOFnHIem9+CoNSKey+56fDBwvIBqkj2j37yeOEBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nVjWR9V1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jofhmO2t; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nVjWR9V1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jofhmO2t"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UEiW4g986948
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 15:20:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CUFPN10YozDbbYt5j7NhH44x2aT4ZP340z/Eg0bq1Jk=; b=nVjWR9V1hCf4kNtL
	IPa6EniCq8B2Uq4Iu8+FnBGDYP72K3nOEwnp/LimgZ44bE2JatQuQq730fIMQxEl
	mTAJFPNT2K/XcW5ZeJF25PwjmFtHnO1O3amskfcaPZfQ+b+VhIsP+zU4PBmyrrMO
	jfHUpIbKGHmMbomy+x9mBKz8W3fs4N31zK+OR82CosopkwlXQlBMfbjsSzylkgQ9
	balWNlXU0/C9AY4zJJ8Y95gztoQp2IhRlwijW/CvBjjEjV3/NarqaC3QjD/UwW9y
	BOTAZPZath9gRro74FyrFFQotibrQGnTVIma+0N7C8uOlQdKUCkNGj5M1BS9tttC
	sn8+mQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr8n386c7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 15:20:57 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-522de3c645dso42037761cf.3
        for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 08:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785424857; x=1786029657; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CUFPN10YozDbbYt5j7NhH44x2aT4ZP340z/Eg0bq1Jk=;
        b=jofhmO2ttoW+OkfLQWixzbMMSJzsaGMu6WyD0Azx9TBlAXQ6vSgJc6szXmc8TUWexT
         Qpx4c6Kpln+Dz/dZle6dr9UdzANKLmHGH6ENMefC6Ich8fsSsV4mr6ztGYQLr/dx+YS+
         0MYhcnZ6ImREfI4iMCwd3yRCv58EGmxZj/T2ZTndTv9QW79tFx/Rq37af7DSk5Fh8sRW
         hTLtY14Jsay8cGVOrD4UehEBr1j3KO7q6YO3ZnpR5lQMYQtpP5PmwFaIRJkea7gIF43N
         3zjERXbUY9bMJP2H+JDl/6575dzcmYryYo9AsbFxIog8rFrdpvCmDt3m3MCz/spo6fSJ
         Widw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785424857; x=1786029657;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CUFPN10YozDbbYt5j7NhH44x2aT4ZP340z/Eg0bq1Jk=;
        b=bIr7/b3mz74bJ1vRXy2u5MXfpun3WZl7/9j2B5aqxF4YY3zLhVcBOMM34mzU1gjNoV
         URZo/bQOX16vWUl5ZkZzEYYDqUY1icXs/b/DOhcgxhkhCRijfp53jYpZjTErmePU0obw
         h3WvEZqm/FtKBtcnD7JDqau3snfUmWjyuoaLuTBLGW+iMfXHr4JlDVMGbwQ1EMwXgo/K
         IbuWyvIHlFoVO7N1oG48S0IgnGhzgU2986avpuvMsIxkRLyod0eE2AU8eMlzSw8vHJZ5
         v9WhlumSW4Cn5rdXFnueBFesRmVHPtWpmYOG/pLJjq2Zx8AxXSotAY3byUSv0FbGWduJ
         AneQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr3ey+0BmHKlHilYU8GEDTx4A/yRPHV9GpeH3PUjf6WtjidDz1Q+3He1kx98Gc81shWOYMJ4hclSR2D@vger.kernel.org
X-Gm-Message-State: AOJu0YxXdDoy5QoX6jhGvPSP4Bx2u4FK7IMppLY5kAUHTrMK5fLeMiqY
	GLw4q1o3JmSagGJCMC6e9IlYybij77gv1BOlozjp7X0hW0sM+62uXWWV08uUIYG/tmEb3Ko4QWW
	+qnAHklmag6dHZ61/OcrTP9OoEubruR8kcHArGUyPP5bMeMRLsXK9IyxBYlnpKGfr
X-Gm-Gg: AR+sD11GWDya2dIQxdN9fOa1wheBXJVd8Ngi+m2eHSCIAmrGQXjvAuXiEz1OmsX6Qiu
	yCOBcoX+LcY9gbDNeFAzSO5uC485Avy2zrDJgGDUc4P+mofcT4YxByAQB8XGLS2QWmWAkadK2cg
	ajBv2GcnFvbfprDISYzSmsmmivfhem4j8n8T3QKFCs+jbeKmizf1TttVrnSENYMMI+zIoW5v8Bn
	W21v9OElHhmD3QikL9KBDDSJZAdVnp4goxN0njDmn9bw6CAHER98fapJuGTWncddN4NiKqGMq79
	tpp6DDlYd8G4QOPwv2cZU91k+9ZUX8gEcjxh4kSJm17qPOBE9cBMptT6aEiZA/DX+FfLB//dfDG
	/wh0sw8htbsKJ7Pa9SVJBYh2EpeWkpxIG1HUcayVFMdieezs1sPAqnKLEoqm9Cdh0cjUxe8RhUx
	915Ha1uColXLgyWA==
X-Received: by 2002:a05:622a:5909:b0:51a:1a44:101f with SMTP id d75a77b69052e-52b384a6678mr34046271cf.21.1785424857159;
        Thu, 30 Jul 2026 08:20:57 -0700 (PDT)
X-Received: by 2002:a05:622a:5909:b0:51a:1a44:101f with SMTP id d75a77b69052e-52b384a6678mr34045841cf.21.1785424856722;
        Thu, 30 Jul 2026 08:20:56 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2db95aae1sm420927e87.37.2026.07.30.08.20.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 08:20:55 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 18:20:45 +0300
Subject: [PATCH v8 02/18] media: iris: Skip UBWC configuration when not
 supported
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260730-iris-ar50lt-v8-2-6597c08cea6f@oss.qualcomm.com>
References: <20260730-iris-ar50lt-v8-0-6597c08cea6f@oss.qualcomm.com>
In-Reply-To: <20260730-iris-ar50lt-v8-0-6597c08cea6f@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1263;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=SkhEj21efbGwh1OhN+7NneptPnsqOcydi7iGjY56ptE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqa2vQzylVT+Qd6EO4bMsxm61SXivn49cya+liA
 Byv5vproTmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCamtr0AAKCRCLPIo+Aiko
 1WuACACNV7N2U75kQlThKqtfGC9WfxqLakJVFUt9H+sldp5IljUpopQY1J4vV0Ec+b7SKQYm55q
 dcJEOMCiF+FGYbDLoaf1CG7h7wwdVnpdh5g0Bx89IVqadCLY991JUsm/1L4KxZo2uBdC4QC0Xw4
 B8Yy+9SLIWTUZVECqD7gYryRzmf/EDYmBRBzkvv5p5ahd5itehzePExbA89JPipIiF707goRGx2
 QV5OGSntqFR2Vz6O4Tfb6J2ZmP7L486NvI74De4/YqbiIjYt6stZW1pT9jixQOGVXXxTwWvqaCn
 1mhz4OBVqWel6w1G94zIzXvZCKtZSfsEiUfnT7KEZ2VT8JRV
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=Ar/eGu9P c=1 sm=1 tr=0 ts=6a6b6bd9 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=wrkyJH6U6m0Jdbs6q_kA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: M6miQ4zwV7Srl-M1pBziTr6QYXaHrCEf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDExNiBTYWx0ZWRfXyMthizIsBzbO
 BK81j3rz+bxUuMEkIp2KwkSB5hrMFehOgVfvrtggTd+JwoMuxf1XCDbNu/YBDFlPHI+D0IncfId
 UXOhcTr10ng2Qu9Qx7nfKhkf2Qynm++4cWk0gtCvN2RBfCf67P458uS0kCLkUkRNVlLSDoylrpm
 GEg6UY8PbdS7DGCReW071TClt7Kq3mOXuMi4/oL1B5UrXOCaYy4/kDTWlq3hplZCdoCMn0JFNPS
 HJHVhfRSIrCwU4yEUNdv4zaE2UdG9IaDUIxb9U8Pbp7uRFB/XLHT6wQa0Qgqbw1KvZ8gc/2zkuj
 EKrkdQuiHoj9w9trXcXfNdtwUjOD3crV4tNmeLKeezJx0kG2UWZCFjhBiVjNrQwAKPzuQuIunEk
 D+soSRzdlX2p1bwSM/WiuhrUHKS88/H8UgpDQZgVe0zR7724dxGC3tpazx0f8g2FV+HJkb8Cd19
 BLDaef3Jih5supL1tzg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDExNiBTYWx0ZWRfX0Pl8BnQYP7bO
 sGXbA9FbSeHqhEPjIiIUZsfgLJqmkykoxc306VetHFpeHI+Tfy+UASf6W6pSZj6WDmpcq49UID7
 E5vmQT34wVpyyDhNnVpUIriC2C+HB68=
X-Proofpoint-ORIG-GUID: M6miQ4zwV7Srl-M1pBziTr6QYXaHrCEf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_04,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 bulkscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300116

From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

UBWC configuration is not applicable to all SoCs. Add a check to avoid
configuring UBWC during sys init on unsupported platforms.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
index 0d05dd2afc07..6e04175eb904 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
@@ -140,6 +140,9 @@ void iris_hfi_gen2_packet_sys_init(struct iris_core *core, struct iris_hfi_heade
 				    &payload,
 				    sizeof(u32));
 
+	if (!ubwc->ubwc_enc_version)
+		return;
+
 	payload = qcom_ubwc_macrotile_mode(ubwc) ? 8 : 4;
 	iris_hfi_gen2_create_packet(hdr,
 				    HFI_PROP_UBWC_MAX_CHANNELS,

-- 
2.47.3

