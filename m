Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A935137DAC2
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 19:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779479666; cv=none; b=lee0QusWZqiqg24KIOVCHA90HeWuNL7OyCnX8Z9Sp/Jwum5g+FFZJuIsiqqQzyMK/fCaUvnI4+BDeRYQjIo2z3mDsRklA/Dqfo/yRAtSlzK/p68zLhCEPvhHDo3GOuhPMIWkFTf8KA3bty1popvz9wkbBFwiCKa8VRYAThoWIH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779479666; c=relaxed/simple;
	bh=vNpt8PKOg0KHWmF7TqTJnZtxLjMjP4Cx57/2xk/8tE8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cn59rEsVu7n6BS98l0O+pYb0s7Pw9LjwqzpYkSJYVJwbDerACyvM+22Y5C8PPnt6gNHjf6r5afexRflc5J1+oFQizAuH7Z3YXkIuMHw30LsuHVzLuwNHgg/0ZWOygFSmP9GvZVjOz7/QisT3eCJBnwyiOyfhfTSF/LVl49GlpGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cmkKYak1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GxxxQWNn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cmkKYak1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GxxxQWNn"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64MIOhvQ4007127
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 19:54:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=uPBy9RLhDQt
	Tb65TZq9MAQCWN1WX4EkHGyq037DA01Q=; b=cmkKYak17MhH4RsbIPKxYqqBZOl
	FA1LnIBUwx/USd4u0AC/x8X6BOC6GR167HHmWe99/EosMszQe2xayblIheZfEkvd
	pG09FdFkcW6Lpr7Y6JMGzAGqjRoIFKUHE+uJ7cwHjGDqb169oF5xTXm+JC4n28uz
	q4FhUqM3iuEfgs3MIrpaKnHbvG7q8PqcVgPwi/GyDTpE3Mw5DXfyN/Q6Ab2OkKH1
	Z7sT9lUxLzJ2Nwwzbgqh4ljhmZunM0e4mCYVspkWv9yUcGe3pr2ovtsECdiLxNfn
	Chy8h2CfT8UK4B+3U9tKqY6dWyJdPjwy5xWGVf3vaZcyUbCnprWnh4DTNUg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eavd988v7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 19:54:23 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2babbeff9e4so83241075ad.0
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 12:54:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779479663; x=1780084463; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uPBy9RLhDQtTb65TZq9MAQCWN1WX4EkHGyq037DA01Q=;
        b=GxxxQWNnsQ3r6/4TQnkNGVs+2By/YC2H423BXZET5/dklGa8gl4F/RBN4yopqMqP9x
         K1SbR2+rw7gHaZav3fxcjQHSk3wRxEeyIcPIKPtlrP+yWyqKGvOLv78sH1oOd2mNVsHC
         xzakyMDkdgla7WlX5tlZtZbAxtoG40e17oW06SEnsMOmrYkySteBhzlx2oR/G9bqMHqi
         O/gPODjvzO3uFU3MUjxAnO9BPm9t+ntOdQU0w8O8eAz4PJDbCQMnY2dUjmx8rK7hD/y+
         ldIG1Na6SFjzum6X+cbZY7TiL72/TTHIVNg/r27O/gJj9HANORwjv+hZbvqDbcybzs3g
         etJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779479663; x=1780084463;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uPBy9RLhDQtTb65TZq9MAQCWN1WX4EkHGyq037DA01Q=;
        b=ahAiYouEGlmjivEkaTJqygLA6c3ohkdzLrY1tIbNNdK5iF+RXz2SI0w+Gq8Fz8A3NH
         o4oCifxmZO+iMo9dUUMkvkqwPV23H70+bFOoEH2VPZZT3p29VqhevbwrZE8zrgjkJ7h4
         bZQbnUEIQL/NH+1ff0C42K6mRtHmC1LcyNcQq8JUJfi80TC1Nc1o88t5BXpiw7Q4NSP+
         vG2Xrl7KeBVtwoUHncrX01QXoejMAszlqglSpQdd7IGA8WPuC8JeX9H1p6Czs3nfk9I5
         lWua27WU50sJ43esHDIYNP5C0zXhg0/0NUou1yU8vDDvpysctpYXN6mrsMk73NDgxIUw
         /Wvg==
X-Forwarded-Encrypted: i=1; AFNElJ9pnbs+bDkw5AWjebrv21aIjS6BjY/yvWh5KfLYlSCqpu/gpgu4pMmVkPnp+Uv+U4Qj8M/uSrLLpglK@vger.kernel.org
X-Gm-Message-State: AOJu0YwuptDlo0jKwRcHGmbXEtnIxWN+9nNgbyX67ISzR2vbNmZlP9Wh
	rekbIZ6uiu7fgzctGzZ3/MKwd7LPVyJ3Qe9RL/cPDNwO3hyRwo5yh/1Rt7i3IluD8FxCYM75cPI
	GQ+AqbcXe5xLR3jEKIaut5cocgnE9cRF0SrSXvKcPJMJO4zSFl6ej8aQUKkbwEnFl
X-Gm-Gg: Acq92OFL9jX5A90NQ+zl1uqEo78BFWc94+ZCZwpP7zTSAJ2kFzJiOMsj8CRkFfYIvd8
	ahWQbcNhCrDFdrKsTnQgr0iO3AHwJiW2m8ByQKHOmcufwMFJCJCck5/d8xPRT6rDJKJ2s5jwywN
	vHaNmo1uw50MQDUDTDXZvA4wg1srhLN3O7tGnz3Emm0+Agjh0XV/AmkKYOThWDOElb7NOhXZTVh
	QPiNRb93QKtWJPePxL1IjiQWzgjKm/Qol4ck83fVEqIq5y/tzlphvwETOSOtQ25R9zfkBFZDLnP
	SgYEesSMjR0LfYzBm1BZZm60cszcIv8zl4HebwpAO3TjwcO/QjiATzwgBOgWgHsgWmNbDrnovaS
	mDGCiIArpCyAeSRN8h/0ONWHm1VEySSAlZOZFd7evtEpz4h/G
X-Received: by 2002:a17:902:ea09:b0:2bd:d6f1:3388 with SMTP id d9443c01a7336-2bea240dd66mr82458375ad.28.1779479662782;
        Fri, 22 May 2026 12:54:22 -0700 (PDT)
X-Received: by 2002:a17:902:ea09:b0:2bd:d6f1:3388 with SMTP id d9443c01a7336-2bea240dd66mr82458155ad.28.1779479662199;
        Fri, 22 May 2026 12:54:22 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb5695f05sm33541155ad.6.2026.05.22.12.54.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 12:54:21 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v3 05/18] arm64: dts: qcom: kaanapali: Add minidump SRAM config to SCM node
Date: Sat, 23 May 2026 01:19:56 +0530
Message-ID: <20260522195009.2961022-6-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260522195009.2961022-1-mukesh.ojha@oss.qualcomm.com>
References: <20260522195009.2961022-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDE5OCBTYWx0ZWRfX/P6blDy7+4fD
 UdfCv/LSSWinR0tdzIi6d120twLVApogbxT9ms+OGLRsOvSZQm0w2C8NQs5n3uyodFBaqS6XJTF
 Haf3ume6GvfYxHWLlMHiNQsGoYBDfg43N65aVvWIG9vVbwI5efgj0tjQMi0UDYpSP1hX6WUQ8dS
 ZTmF6x9xxUWi9otJz4ia/lOWfd1XlgMgJ28sdq5LeClNwC2vN9fLPwZJuJX3g181aSkRdjV0sd5
 38XuQz0FwM57EIni5jRmQv0PlzLoBrFSPz2DaiIL1KAvavYySD47ezuTk6wCwAe5pF3TxiW8Yi+
 TBhYe1xatSVPKg7BT9FCKTVtK8neMKLOcbdhM057YPLgomACJJy0es6ZJ8rxECqFQHac+ryE/6e
 3BTcNYU3x7bqjpOM+bgb6w02iguSGCu22Cq7xP6hi2kOz1Tr86q5TLNELJpWRoZCJF53hXig+Oa
 w4MrS0HPHKUVHSQ3eLA==
X-Proofpoint-GUID: ne4DCYWcCdwsBpUkea2h6TEoa1spcONF
X-Proofpoint-ORIG-GUID: ne4DCYWcCdwsBpUkea2h6TEoa1spcONF
X-Authority-Analysis: v=2.4 cv=F+dnsKhN c=1 sm=1 tr=0 ts=6a10b46f cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=ZJQsJAtiAu0WCEyc7p8A:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_05,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 adultscore=0 phishscore=0 malwarescore=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220198

Point the SCM node at the minidump config slot in the always-on SRAM.
Boot firmware reads this word before DDR is initialised on a warm reset
to decide where to deliver the minidump.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index bcd1cee31356..425b532c53be 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -224,6 +224,7 @@ scm: scm {
 			qcom,dload-mode = <&tcsr 0x19000>;
 			interconnects = <&aggre_noc MASTER_CRYPTO QCOM_ICC_TAG_ALWAYS
 					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+			sram = <&minidump_config>;
 		};
 
 		scmi: scmi {
@@ -5448,6 +5449,10 @@ sram@14680000 {
 			#address-cells = <1>;
 			#size-cells = <1>;
 
+			minidump_config: minidump-sram@1c {
+				reg = <0x1c 0x4>;
+			};
+
 			pil-sram@94c {
 				compatible = "qcom,pil-reloc-info";
 				reg = <0x94c 0xc8>;
-- 
2.53.0

