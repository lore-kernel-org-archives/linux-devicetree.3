Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CD1346F4B0
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 17:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784655189; cv=none; b=rv1JqJZsRUY9l4mklRRs4PJa2jdkX3e2MRVtktyGa7cDHyZ2R81XeJ1gAKx9kp5hKhHTT29b/0wactMZbk9KBUDju2MlbOaw2eeqxtWI2+fzKzkNklfEy2FpDZ/RcVD6M3ufpPRaJaOqY1B+CliV/kGkyea/xQiapetzl9FOJsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784655189; c=relaxed/simple;
	bh=zD30EA8RlbclvL9YJ5yRBEJPZIL2Cuh8TMVY+3LX+dc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CqBb/+91hkA7br3JmZmJrDlzBVgGO2ZewRIN1NkS74PpsyhqnUSUdWbtQYJU8y2hyWB0JbqkTCH8YQoTgVwK+Nppz5jiMAk/0uSvGkH2aID2C/7h35cwm3+Bz88PWazw3o5krLGlVnOUPMakkjiq7VL0+j/i1UQVmcbmiuly65U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FCEaAWvd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NQxtuyDm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FCEaAWvd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NQxtuyDm"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LHPVJj2115734
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 17:33:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4rOPeDp1gR6WFEaLqOQIi9Vwwi+NGwBjpXQJ2pPHGYE=; b=FCEaAWvdmqbxCxCA
	G5jHmwr225NRMj4A6zJrNiCah2aeZT1gXDGfugpBaGB6P7732dEyBbfjRvLZY/3w
	DEL+Q1zFKH4Y1lko9hhOd9HAfgqVyXNtS3W1HVE6uZt1zuwkzeeAzTTlBCymocrx
	Vlsp857v4f2wcYTX6SwBFxNIqjMYo+YUo6UpGKF4HSzrnldOTdcmh1k/XKbgtSFB
	5GtjHlZpeH6U6hiQZdcgmGkeXUKQAvyHwQGqDB/zA7oU1nYjzPoWdC6sG6rAosod
	qAkRM8T4rby8HSLt/lGXIvfBPgqxvaVTyRMr3S4dTAyFdwe2hPYrPGPm6E1OtO2V
	st40Cg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjd5e018x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 17:33:06 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-84865f326efso12112896b3a.0
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 10:33:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784655186; x=1785259986; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4rOPeDp1gR6WFEaLqOQIi9Vwwi+NGwBjpXQJ2pPHGYE=;
        b=NQxtuyDmegCtKi5t6suxj3coxfOLNrdFIdne1Jf7I08xo0U6ehd2F8qQZIG1Cs0tCY
         PnuF/B/gT8u7aO0HE+9CKcl/uWZADT7HmPfPY4g8j1HoazzwMIp0rartSOENDpVoiILi
         9ICcWE2A0G2t2hOT06FLXoRRBX6msWsrqKyZrYivSTixBZ861XkySiJS5W5oV1vBL/RF
         mvUSCnXM/r9dAMOfKeymXZx7/950tpiQEOnygdYJho1ctnHk2usbjNc/uxdjO2fo+4tA
         tHROhHB5vt34k+x4r3xZw95xKzcaofJAeS6aFX+rU24Nkgai9JoLeWlj4wYUu1HT38cM
         GC0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784655186; x=1785259986;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4rOPeDp1gR6WFEaLqOQIi9Vwwi+NGwBjpXQJ2pPHGYE=;
        b=ddQVgX02qbfcK8TeBwjxf/LhtkZfOYGGtBnHVVEdTq47jpcyl61RUYe1ES2Xeo7awI
         iET4KLz1yjPt8v7cCCMxDsF6dnMAsay40zexuHclGH60MGNKpXoNPXwZjP92p7DaziCB
         PEDznySlzpvh800bWhTOKq/nmTnqIQozzzDlaoLb94FkRyR0ZzxXvQLrVmk06ZrLubi4
         32BwkVgEV2thsDTsXLJ4DIHPN+50QVWA1R+P1vUCJ2r/GYZJvfxBy5fDK/Y/x0Tmj9OE
         wBjV9Cau5TSqquP1nWYnvMuafDRpMJcqLH4W+tV7e8C0uNM0C+g1pwxzIbkUEj3TNkYy
         ebKA==
X-Forwarded-Encrypted: i=1; AHgh+RrWDbqIhyCAP/ah0oL+Ilzs3pUbAtkvcKNM68OGu249e4CGpH7AWKP5hiZnnouax1WeXWxChvaSVB6N@vger.kernel.org
X-Gm-Message-State: AOJu0YyAM2m//IHhwo6PP3ioYnzOwxbSXS6BDnciWfP8+yGfYqrUtUsw
	VoZAaZIbpJLs0mM7LPxGwcYTWB4tkufLIY9TFCwrLgS5qj7HIOHoiz4YNn9bwxDE4fH3Moz1dl1
	CXax6HrIQ8/U1RLgcs9kXj/B0Wl3oov+1NthOvQkLcFHjxZtC5GGdeOYQ4QFH4Nlj
X-Gm-Gg: AR+sD11nMJtzp4jnkGtR3qnKLEjoOobKKL++SRUFfw78WlwkdRdfn4dPDG/4tv5IiH5
	knVIT/jxch19GxCAzuQ/xzMWFFcFV7Z5LISQXNvMfQ2wt3EcvkrnDBZ03KBQ0R9iUnx4YZR8uMU
	9c9nwa0fgn+2DmjUIEzSooXexPS0q+j8/L9englBmj5fo25H1SZul52kzP/qWtsZeZJ2nytgBRb
	YHRQAZZcLXjurDhBhmSgFXMt3jg1kJ/PtblV/jeZIA4Ftb/LerJJtW4iqDxCkLoKabFOINrwqxs
	eWb7A5gWb/MbeK3GMqOzLZkt7NYZMGTLzF7hZ1tqx/pJxzXyd8B3F0aKq5EZgqDO691bCTS/MD4
	DKXLyob4PKgb3xaV/hP83x+ixykUIfTPCxuw=
X-Received: by 2002:a05:6a20:2583:b0:3bf:5539:f8f with SMTP id adf61e73a8af0-3c3ad972d74mr18735753637.37.1784655185665;
        Tue, 21 Jul 2026 10:33:05 -0700 (PDT)
X-Received: by 2002:a05:6a20:2583:b0:3bf:5539:f8f with SMTP id adf61e73a8af0-3c3ad972d74mr18735713637.37.1784655185224;
        Tue, 21 Jul 2026 10:33:05 -0700 (PDT)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147e1bc886sm710881eec.26.2026.07.21.10.33.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 10:33:04 -0700 (PDT)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 23:02:27 +0530
Subject: [PATCH v4 3/3] arm64: dts: qcom: shikra-evk: Enable Iris core
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-shikra_vpu-v4-3-6dc5a8999b73@oss.qualcomm.com>
References: <20260721-shikra_vpu-v4-0-6dc5a8999b73@oss.qualcomm.com>
In-Reply-To: <20260721-shikra_vpu-v4-0-6dc5a8999b73@oss.qualcomm.com>
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784655163; l=900;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=zD30EA8RlbclvL9YJ5yRBEJPZIL2Cuh8TMVY+3LX+dc=;
 b=u1JBDopBwxjem4sw1HBkEt6MYx+EfSBwZV59lka9bL7yubITsaPgGM5toPIkFNWG324j4adWo
 PQK4x7X1a2YBSe84EW0uop+2lS7A6ObCgq2DBuVFg6TRv+LWwTrA1D5
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Proofpoint-GUID: 9K5Q6K6oaDghDakGs5Nt8JqJXeltv_Zc
X-Authority-Analysis: v=2.4 cv=CbE4Irrl c=1 sm=1 tr=0 ts=6a5fad52 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=c0ntbg5kzuLjbw3eiskA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: 9K5Q6K6oaDghDakGs5Nt8JqJXeltv_Zc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE4NSBTYWx0ZWRfX4RJM8KVXIpog
 IAgCDk3No4VswMd0O9R9zhv0CBKS65sYjOKhKtf5GfiGHuUXAxpmXP8DUSMWyMBp6qg+6Q3W1fQ
 cv7Uai3SU5MBzcU7KeuEOWpyRqKOVEvMylenlHwbrKBqtW7CaqslonrhhrDT6XAdBSjt+YtXclR
 fP+XNJlOVqumCqiEKUFDusqxBU0B2bofLX5ABtYhLN5//D15O8fvCvl5L5aSqTCpewWnfVkCy0N
 tjMyV6wqZhBAx9vdwtFwu1eJuo9+4vBCpCLHG3pFxU+5lWywHJ8c/JBAaQ0wAxnr8bT7wagXykz
 tl2Iy9t53E8ItQbt3yK57yhNqIy8DoJ+iNDXiQNTv4O7QH/PpUqr5La/Wx8V5E9zQKU/mAgOfj0
 h1CZmxp5gTh6VRnJc+rG+m+8w3iGOAkTadsGWWMgYOuk7lR+W5LUkOEsPWLa1wxl5a7mUCNH8nG
 aAe+YURJ+9wzQIwwCgg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE4NSBTYWx0ZWRfX/w6QehbOaWTu
 TOdQKw6A3eQnfcbzMqq8ep1O/Uzm7Swf/eYEcDrdubNHlL6lQgoYV8uhXruuggsozvHvPvg0Bmp
 pnrNEWD3JDyvKqt/DKsASYjrujImon4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_03,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 suspectscore=0 clxscore=1015 spamscore=0
 malwarescore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210185

Enable video en/decoder on the Shikra EVK board.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-evk.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-evk.dtsi b/arch/arm64/boot/dts/qcom/shikra-evk.dtsi
index 6eb4184f76422d57766ba34647010c690646fdab..696df7c9a7e0f7c86955066e76df3d8fcb8bad1f 100644
--- a/arch/arm64/boot/dts/qcom/shikra-evk.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra-evk.dtsi
@@ -3,6 +3,12 @@
  * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
+&iris {
+	firmware-name = "qcom/vpu/ar50lt_p1_gen2_s6.mbn";
+
+	status = "okay";
+};
+
 &qupv3_0 {
 	firmware-name = "qcom/shikra/qupv3fw.elf";
 

-- 
2.34.1

