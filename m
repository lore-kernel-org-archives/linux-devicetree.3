Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAC4717555
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 00:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781568285; cv=none; b=Ouk9CADYn6DgeWy22owoV1JRFg3h4g6g6ENDeZgPHznEKZFtS1mp4X9pejpv9bwFQ9PKTE6WCJmOHjQJGoSEz5Vor9Fpol7TvtuRDMyJt8kxM0825G3KMYmUEhSJ7Q82tGsezBvlclLMbg1sZXlZfj2ePeqvZ1L3nRLzjjzY66E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781568285; c=relaxed/simple;
	bh=aFCxwN+s0nObB9dYmcqshZUCs9EjeMcuhwbHJaldKhc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mimF4wgIaHEPaheXeLqqBNcfn0xtxzfR0yxXShVyBsOeBeeDDJsiIwsE/U8j6hiL3oUpsZWix4tYKSo+TIcbVsYEO4XM16eZ3D8cLR5hEbtloaiTTm2pCyGUVHVQDVi0msqWpXSC2OQJJvWr4SohlmfMJor4DB0/aQ9H0YDit4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q8hJXL97; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eGk8KGPJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q8hJXL97";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eGk8KGPJ"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65FIx0bX883729
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 00:04:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CUFPN10YozDbbYt5j7NhH44x2aT4ZP340z/Eg0bq1Jk=; b=Q8hJXL97fpT6SiQz
	hOghPQQiUWmZnEM06tpv/XOWxpw4PlLtsCYM7i531FDHvoT4tQCCykbV73MmiGaE
	lfimdK22su0elw+nse7VVEZZrCHps8lWCXbjj52ah/ptMFTevlexI1JRe/sZX8DN
	n0qhu+yGpFOhExKl23EFyo4oQ32kqKS7icbi0Alfg5eDUbqmb1y+BoOUu4vw9sc1
	M0zreiF89q8VgGCRB7YZJcN8n3mlPcoSFyK39urpU41kba56pqS6FB3bijAgkeao
	8d2fl55mNaQjS06CWnAEa9hpg2p2EHxkZZZspwjHyYE/37zChHe4mLsH1otsgaZO
	NstyEw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4etfa73m1p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 00:04:43 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-915d1d4fc5aso674414185a.3
        for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 17:04:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781568282; x=1782173082; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CUFPN10YozDbbYt5j7NhH44x2aT4ZP340z/Eg0bq1Jk=;
        b=eGk8KGPJsbQDprAUWQh9gF+EjKYgrCBFbKvh/tnn68kJTchrMMhopWjK/uU2ulBTK2
         ZNBnLBj9epSwcESWFx1AAGCPuZ8D575dVnPmHMb2VSh6gZ8ZZ5V9JWP/mt/Gx/BLgWtk
         LyTqfrJvIl1/thvLJnmhyKf/qUlHYMYqAmjhMTjmLHDY88hcy0syfDsyIgSyb3H79a88
         s36tzCop9LSNYJGewZvqG+H+HTDuNTXE/195UisGhVoZnuadM5j3q0wyI6ZQG0pioCr8
         N/HwsnfS44QmoJ3kR0STFeXihWPkw4k7vGSyimRkdib59JGjqO1BI4JeimQp8SvaTnCv
         FOmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781568282; x=1782173082;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CUFPN10YozDbbYt5j7NhH44x2aT4ZP340z/Eg0bq1Jk=;
        b=GcoWIYQV5ZT+ksh/VV/R1HK0EhdPeMI6zKEGgo/BanKbp7f5G128xfkk7a/AFyLteu
         OB+n6lgi3lm8UiXN8ZnTzLubUYkH6FwUUu/38s6fc5uYsskkWuKxiyemK3BDgeYJZ2oD
         XmcG3GXx2c2Ao8T49pZ8/9PwRYSO3EhjB77IO1F13tT5Ku3R9aa5IpjslKgxlKd1bREh
         vQ9sFVy8hWOPSUtkw3NDYU3y6tXFYif6jzuUKDHBGQVkM/XrlzxuRBRx+mTqWgzQPjvj
         rr3D4B/qdjSdDhNJdpIaGa3UNAdKJ1WCyw8EYP5QH8M1JkK/Fc++VWTx4cDpzQYdzjht
         de1A==
X-Forwarded-Encrypted: i=1; AFNElJ+WWEZvvni3Xd3mndSCvtzMfHIEZxzgRxc6FPRpvPw8uc7GlkrgeaDbxfJdwyUbg5OVWSji6anYDEtp@vger.kernel.org
X-Gm-Message-State: AOJu0YxXAIdlIYw06oK5NW2PRlthCjZNWeJmR5viszCNVX3pkZ+19Hxm
	5sl+8dSME2y2i9Uyr88mubNWizFVgg8BzcNit+R7aeUkhShIM569WM0C8U1+Jp7XTz5+NQ7BALy
	TNcznYdPUtv6FIhfJXA2HbB5C6MAFLujRUWQ0zwziyAvwq02grlrsoEqXpsic8rk/
X-Gm-Gg: Acq92OECqxMZT3AzOx1/G9t294G3e55PFVFvhUw0NoJTTOLetfz00F92HbteTZzDQ3D
	hQMF3+EYUvyQdThHGkdZImuqnJhtRreWDs3lIBk7CSMHDnNaRExcGBbHrkjRPKTAD0NyvB9xHTc
	NTc1hX7eiGooWo6gJNNXNOY5eBE2MY7RRwxwailItDnVbvZ6+GYnJVt4TWwe82Ih7PSwV8MCCHB
	t7ssDPwHWb97lD6SBb+6s/4YfWKsUxDSwWXWbh9voHqn8HJ+1fYrO1leHM9K4UJKbCDl00rT/n+
	VWnIlHGIG37YM4Fu+dIa8y4fmbXY0sTLWheapAVLBa+83sV4/cf5iiGw2D97vtLRzGJUf+gtp2k
	gRhRZBtoi729tSOb1qarjKmyBz+fwXRV9LEXuqtl431u0COrnCVvohlw/6KMMlBBIZI9RBEeIiv
	982WBCvwQW2GL/w8fgkm2ixyJgxtOM0j7DbQc=
X-Received: by 2002:a05:620a:4095:b0:914:7b1e:a5db with SMTP id af79cd13be357-9161baf57a7mr2579160285a.4.1781568282115;
        Mon, 15 Jun 2026 17:04:42 -0700 (PDT)
X-Received: by 2002:a05:620a:4095:b0:914:7b1e:a5db with SMTP id af79cd13be357-9161baf57a7mr2579156785a.4.1781568281627;
        Mon, 15 Jun 2026 17:04:41 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e1a7092sm3015731e87.50.2026.06.15.17.04.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 17:04:38 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 03:04:28 +0300
Subject: [PATCH v5 01/16] media: iris: Skip UBWC configuration when not
 supported
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260616-iris-ar50lt-v5-1-583b42770b6a@oss.qualcomm.com>
References: <20260616-iris-ar50lt-v5-0-583b42770b6a@oss.qualcomm.com>
In-Reply-To: <20260616-iris-ar50lt-v5-0-583b42770b6a@oss.qualcomm.com>
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
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqMJMNjdNQpbBcgQvuiqQf1YgzDa6ZzxLfNE4Jz
 zX/dg9DWXiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCajCTDQAKCRCLPIo+Aiko
 1VacB/9K4Wu0T0kXH9C7EgJCm4yN2GDV7JYd0DSI1uvFMft5A+yL7bqojC1pjrAY506zTzHwokV
 IM2rYgdMcbjYHYYv2xPPgoiwIhM+w0VGp9eSvmvfunkDx7z+RNru48C4G1HEemHOqo7bkpdRLfi
 7dLcFiQCZgHdTll5ot3KDN6PHheAu0pQMSsXykVEr3zJcGzanUsRFbWr4R8ZoXYIqgWQ1KEG6bS
 E0ljp9rZwaMNvjw9j3YRMm0i3fturGYQ3pLHpq9r29tD8H0rEwgiL2KopLp8YuGynkhVAD6F+rq
 J48H4ffbaRTDZleRgADPNicdgntm6HO5Sjmh7ryaGWoNlqiJ
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: oFcCiIBQNdkoHSdbRIF4G9rh39U0x2Rl
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDI1NCBTYWx0ZWRfX2U/1O+ZnhNaU
 WP8k889e8IScBtmcRzXshiEKnCdL/kqYZ4ek1HkLkyQpmObnyidNCCWu+TqgtCtEak1IdLPrGNX
 0hD3ejkwAelqCsI6UwAUtgMalJ4/RME=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDI1NCBTYWx0ZWRfXzuedYCFD8HoO
 83mFZZ3QHQVaMe+ykcS5vnom5hNnT84OfsOBVLo1TIsVzA+477Dx0BDhvTHPSMfxc4XtNRdNATO
 WvD7rEhHGgQQJlWZOrsQywyO8u+KVOjH6OSPceE6h5PxyxYtveHDq710St+/UPng6SuBD3hVJIM
 gmxdaIkFP0F2Cxgi+wyL//QYHPSs+zl58pgAmOA60DDQIE1svuXEqRh3zhN8Xly9HS1495U2eeO
 YPQEvXWJF0Xx2AsgDx9K9VkE7YfAMG4983350+qyiSANukQsN+2jpOSBOANnInZlKTx9ILCmxx6
 oZyxvZD6hcEwrLDm2t2zADifH2VrvCuFCKmEIEfB8AhDNX7FT3/kxCC5qqtnDI/GROZT5afaO9h
 fNpCdQs3FoADtx1IP0W6OVPkxD0n2zhx+TsDjhhXYxnlUpjoaSh/cK8JzXyqr4kJlsI6IuyWyzf
 JGhLacXOiuKhqJ8V46Q==
X-Proofpoint-GUID: oFcCiIBQNdkoHSdbRIF4G9rh39U0x2Rl
X-Authority-Analysis: v=2.4 cv=AN2yTM5Z c=1 sm=1 tr=0 ts=6a30931b cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=wrkyJH6U6m0Jdbs6q_kA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_05,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150254

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

