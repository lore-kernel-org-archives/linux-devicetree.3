Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 045943EDE55
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 09:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779875097; cv=none; b=reqIRGxNksC+cmw/HhG3W7QCu4FQQ5QrbX8mCOVDEbVWNLwvDh6QW5GRsFjZbLhAFl71LSInHLS9VnunOB7iLJaILQfZqfhQt8ioQ6G9RhnAq1eypYcDxu9VwRc3yig0lYZ40jFt90OpwTuJnyDvzuqndei9CjKk/SMueMyzguo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779875097; c=relaxed/simple;
	bh=1P6BEMtSK00TsWaqiDJ8t72v81fch2x3Fie4Nq3BdYw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iVRE43eOITqOP5ryBn88unJDUUe0JewWPSe5RpTlrK5XmtWUzjj/vcwjyHXFyoD3v3YdipyogYjfglDu6PuvSklOECGc6xsp196hBme1w/rq7ko3G19lcXNueNxhLEje4vuKGV5NQkAb/cWGtSNR9iUYqXtsJwFyR45xb10j67s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xapy2Osi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g2aZ7HmU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xapy2Osi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g2aZ7HmU"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64R8mhri1168558
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 09:44:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=SvYUjwZH0OZ
	oQhhwOPEThNHhKCiVazsGLWS/qFlX8ao=; b=Xapy2OsiqgMCfaf/aDXR3LVZrFI
	vdkHU4j9gPoMDtAZzUflvQx7SIBBbcq13BhKrP6DOtZJv81Qor6+sh9S0bofgs0Z
	cU/73SBSyHRfJ9NbbZ6xTA845yi+OMyrPD4kf9NuWlHmM7ea/3l+CWAGNPMlNrYd
	HgttKFumZUBZy59gVSnOysXNwaSDMrFFMKM9VWPHzdJAjawd96TPzNwBcNFE4th2
	f261j+Qy8Dgina8ks71PmTYDRmQiH36pcNLYGt9HUUSreL83QfWjPWXWkUNSr5Qm
	NVmDZS7Gp4RoKK0RmKf+Svyid2lwruJFRcBLQpnQzTC96TQNckq2BVHl/XQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4edfqk337j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 09:44:55 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2babbeff9e4so126670215ad.0
        for <devicetree@vger.kernel.org>; Wed, 27 May 2026 02:44:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779875095; x=1780479895; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SvYUjwZH0OZoQhhwOPEThNHhKCiVazsGLWS/qFlX8ao=;
        b=g2aZ7HmUujawrGUEOHGhX/gW2SI02ss7PZB+hMuKY4DHhOfFMJ9d5kPmnbQr3CKhuJ
         YNGVBHAVXiADLqEY8bEr1DWNxt8mzJQSLoT8na7Mi36W91kL5ceDjONAL1tDA18VVkiC
         3/OP57DMGY0FUsjpoTX3k5C6a9vEH23M/Ubahi5YYPWuY+9/1qUdAKWnVMNKCZWtdZSN
         bkYS26Haf/e0pvo7tLMV3TOqQln49DfG2xAp3egRYtxYPAPUn+O/u83v0XgLmx6RM2GU
         mQi0ezb6iZZKHpe+q3SHs5svq4Sp51HmXP8BjnxjFpVErZ+SwnDgAOxhylaBAshtcHpX
         bbyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779875095; x=1780479895;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SvYUjwZH0OZoQhhwOPEThNHhKCiVazsGLWS/qFlX8ao=;
        b=TNXHoFYqdjT7JyHaWFdvqctwrOr88JkK8gUSRr6GdGy+UZyPR1I61wW0JQWEbEFTM2
         wM+gsCp0q0aLEpbBQrP4ATWAg7L6v6sQr6mEQNxxOx/JWbsPsiEx/6jRTp5IA/A8NX0x
         J7c+wZtlJWB3fRUQlvTUIAFR/TDcahmmmKEjtZ0pv+UljhJDSeN7jl1kphQtPqmoA4v7
         ouefMQ9yVZk32Gv/WalENsXbyJpTDz9mObv2HdVfWEkTcsNz/ozSHMEG8Gt1VJYJVJTn
         7yqiVwn0vDyphevsE2TOsAkujlgERXDLNk+SgiCFRAQqOOq8eTQQ+iazQ1Y9dIasfs7J
         jiLQ==
X-Forwarded-Encrypted: i=1; AFNElJ8lubAlTVi7yTzn3GV/obgTF2GajST7HklXhePe8FeAm/pwYa/v8ZNaZSj5RkBZGSFV0dOHKaNMAHC/@vger.kernel.org
X-Gm-Message-State: AOJu0YxkkUlo3ti2B4bN57h2UitaB2H7k3VUoXc4TNG6tpGRx1Y9o1Rn
	DDbLuL/C1a1bco8oM9pSKDRyq/NOdlrl9tstRsbxPthfILZUCVbs3fYcNhE2iQYfQQS5pCb7LXp
	XXqGkPSJisuk1u9ZHGseemGtW3kNHEp8WOd6eEoktI4IGO6E57VnNsbUHIxjvirG9
X-Gm-Gg: Acq92OHbjE8NdkjN/QoSrhLLD/v99f/i/N3WPryeYCJTdVIB9znd5POuE0suvP6rGg7
	4Gg0XoqVx4glyyKfcADz4eWLtSy4/g09alIaAjLc5cZEzD+esz01oRnVRJcG9IaubfEcJv03CtA
	o5K7iveAE1TAFmO351Xt3KnfOLhUih76VNFXaoiRuDA1EUO6vmbDz7K10Eus1ghbXJnTy3ONyf6
	IIMXwh6r8WZkF9tMcsl9JcyCbQJh3tMoIpfWIctoRwts2vDMb4ZujWXfZc7lr8yZx1xLO8F+rSc
	PPRlNErPRHHDiI1BI6g25YDtSnPdnqwVIGDlcMeGSLzf3YxLRrH/OxviYKk4fqs7M1oJmik6qHY
	yZz9R958eOj3lJIdMwAlG0rP9uabj/ZpGuE4lDZEN6yp310gFtkNpJ83NceQ=
X-Received: by 2002:a17:902:c410:b0:2ba:5e99:93e8 with SMTP id d9443c01a7336-2bea240f094mr240726095ad.29.1779875094620;
        Wed, 27 May 2026 02:44:54 -0700 (PDT)
X-Received: by 2002:a17:902:c410:b0:2ba:5e99:93e8 with SMTP id d9443c01a7336-2bea240f094mr240725885ad.29.1779875094047;
        Wed, 27 May 2026 02:44:54 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb58b386esm154738185ad.44.2026.05.27.02.44.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 02:44:53 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v2 18/24] arm64: dts: qcom: talos: Reduce OS PDC DRV span to 0x10000
Date: Wed, 27 May 2026 15:13:23 +0530
Message-ID: <20260527094333.2311731-19-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260527094333.2311731-1-mukesh.ojha@oss.qualcomm.com>
References: <20260527094333.2311731-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=fqPsol4f c=1 sm=1 tr=0 ts=6a16bd17 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=RMwiql5bMxdNdqmTa7QA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: JZqacriqZTR9q_TGa-hACU0d1JYTcHvI
X-Proofpoint-GUID: JZqacriqZTR9q_TGa-hACU0d1JYTcHvI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI3MDA5MyBTYWx0ZWRfX4dyyxtlROTQu
 MSmVezO9XbRcJhOQIJOn2zQ7ZIGMR6lBpf1kGchrvB1KzxgRcCygtDBNsp2vz813evLWeICbDhc
 1iRxX0epSMwrX6zyi8d02wvsqVqfSDPDKDAeuAWpo/ENsS35p5pChbj60NYyuUXPDSd4oCzAMJE
 aC0bpFnDYQlXO4cLVUsk3PmEF45yGYCQpGTjPVtRTiUJ1TVKOHukLJm3uh0A509Zx/1W4XdKa3/
 kI2cjPiI36wKu29lUukeHSPHBbyjepu5yAXea0OrtZqTEmCh7ff4R31Vp6uFGgsON/mFZCZyT0T
 RG09PCj7CC+eUJ9mzOdzltRDDm+m5AHxU7A/+TFZNlPXuJAm2Q5YyHXEJv5qi2UmbZHXIn07B8X
 8wddCgT0NySYAmjticiF3Z98hsAIg09EYcNN9bsy7tFDZRUXitzOnnjZrJqPNUiRiS6m0FkM17j
 964z1mqq67OTCBiMoLA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-27_01,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 phishscore=0 spamscore=0 adultscore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605270093

The OS PDC DRV register window on talos spans 0x10000 bytes. Reduce
the size of the first reg entry from 0x30000 to 0x10000.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/talos.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index fb1bbc51bb8a..4b6adad72751 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -4624,7 +4624,7 @@ dispcc: clock-controller@af00000 {
 
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,qcs615-pdc", "qcom,pdc";
-			reg = <0x0 0x0b220000 0x0 0x30000>,
+			reg = <0x0 0x0b220000 0x0 0x10000>,
 			      <0x0 0x17c000f0 0x0 0x64>;
 			qcom,pdc-ranges = <0 480 94>, <94 609 31>, <125 63 1>;
 			interrupt-parent = <&intc>;
-- 
2.53.0

