Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36D9C3B47D2
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 09:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777455369; cv=none; b=DjnVWqAW6OnG/apBjPDDcaKLlTYOg4Wy157PjBsNebBXqrJpTo3c3+WRkUn1EMDZk8ASCMupbICa20xpHD2W9JsWhA8LIjYk4IF5u9tCf5L/D2WjiZn4fKgfbRllLQtLQfHYv72TVvExLslwYGOt+/1T30qAknE+aBVs1yjdbcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777455369; c=relaxed/simple;
	bh=UVm107WhzQ5WkZdgFr90sAxI6S4u2TmSP/Q+GBZpQFk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=iN+9aeQRtEGisBZL5+q/6H17rzN1ue+NdHP3D5NHEprENXJtLyD68mYjFoByW3cKdzCBZqb0++oxdOFQHKf9zM6uf6jzHN1rm6pNVv827469olod/tuw2ihMVj/jGIuqFAcPkYN6NjNXkqAFG82gfLFIGiQfJYPGWN6oCKc4Y5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l8T9uyLZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AkWUiVd6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l8T9uyLZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AkWUiVd6"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T8q72E1721232
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 09:36:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=XOLjpZX8HYTI3cLRh9OOLn
	/J1nWesnZ3svuiRmcBZaQ=; b=l8T9uyLZFvjJij4S19E4CSW9pPicRSut0K7B0/
	SrEu+0AAHGNs7Yw/96J2zbGxRhOovAsJEKoz5HXiWYHkPQz3ZN3wkp7yb/kjp1BK
	3rE7XR1D+kXwZuLW++hDzWMO1QWvxPwjmrdgMDIGNm4iXqE+XCNUWhh1jF0bW4XG
	OH+MKXrNb2DG0WLU+9jcJJGwksYrZIXbWp1QhR//rivGmqB+ZK8KA1Hz/MlkVUEn
	ByP8w1xh2IyhS1RRpfDtp2Xj0ycwYg8XulLDoXOZ8TiCly/EUB4Ahk3EbqkDSnDj
	Yi+U74D4YoG8mskkVKJlFFNOFO53IwgP4UQvK4AsYU44r4eA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dua731d0p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 09:36:07 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b24cd2e2b3so113669185ad.0
        for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 02:36:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777455363; x=1778060163; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XOLjpZX8HYTI3cLRh9OOLn/J1nWesnZ3svuiRmcBZaQ=;
        b=AkWUiVd61jE1bkhZBKWq01UBCgxmjR4RgtV3uum9w7rE4NpA5PD1EUlAYljg7AkzZ2
         3kycP+jShgeV3eYuw+XpaVyZvjSHkV8dYKZvh2Lhtl/9rBZoC+X9lYvwXrWZX5Y/81gI
         q3RUfb+04yamysOFusm44SYlz5oLDgIpLo2W1t0JDCgB1ToZGq8Oeu4qBjD8a+gjMabt
         YlZa3KKtKF7NY5ayC8cb8F71OYIdiihthi7HE8D8seszXpOilYBVGx4f2KU2x3Bts55m
         6zLnwSJjzFCcJk96qXJsthEAIe364/QWw6ZpC7ke9/263E5qWHyZoFiG2tqWia7PXjED
         KVnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777455363; x=1778060163;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XOLjpZX8HYTI3cLRh9OOLn/J1nWesnZ3svuiRmcBZaQ=;
        b=HaIrOom22RDeKPDumb2QD5BLmIdopbxOMU4p8euPRo2GnUL7qrDhpOaXzka8PRtraq
         sIz0IC0YAcUn5z5zZ2ylKHX8I+l+nzkO7btrCraAvtwLho8rpK6EPynTLKL4xGPNT4Zv
         xoJqvA+0+YNsjqzXaSyC/c1/XNbG+2NgDS4lDPNSYsnhpgoixndnen3ebO+UE7NZY1SG
         jucDqQpu8/QPpX/gxjvNdpWiS66CGvpMzK1X6I2ZAKZ9ctBHc49hEL80wnEMknGIqyR/
         oe/WE0UEGYBeADWoRmSIaSvip/rXci8kEqjIdHV7daEitVmo6AgRABsTbuWY99bAeL0v
         WVmw==
X-Forwarded-Encrypted: i=1; AFNElJ80TV0mhgGqGIpL7fEAVTX7OLJWjeoeUCHRIpCkcNcwGGhgpQo5Dg4f08M0kvkH/1G5g3RKRE48GCmw@vger.kernel.org
X-Gm-Message-State: AOJu0YyhuqICIy2o9Mwtp02jn7lPA5+tnlzHwnOIFpsz9TEACHWLAtAa
	b79SnVWOV2GyqJHM5fwDs4lCVAzn9Nmq58HxM0O8BpaO1aytrL0xZ3vaBO5ZrdF6A+JrHoWhVH4
	/whbrn/ozNixn1qec7W0rpV0NvCLS92G0zBXKnF33TEIgKklcHpxC7My8x5JwNohm
X-Gm-Gg: AeBDievDuNZ5n99DspJ0unU2pi+r/astboHMXjwfAhLzTSapvLoM20yzawcLqArWcZP
	UfrxO8Zto0mLVHoX8wOszajl3C9ldVgfT7XEMrROZe7OAPqPfrdvD1DsUqP1Tl3eRE262ESXvnv
	XmFBciw1pwdY8mhhY5J3a2q64KS9fOzStl29XdCV1vcDKKaHF/juXo+IcOSF3c4GmaU6C+t53Vc
	Km/ojGI6i8ZOBMVrj4zJUXoGCXcqG7oAajJ+/R0HC5Aosynv1CNBpXfXMzTpjJ/8WDdtulpzMFW
	BLEjTKewXSYVjFcNHxvDUtDfZIv69pqfxkrGadWKdSQIXUkFHE9pHxbZcVqoI8L9PFUnONcPDvJ
	vJOJAHsYfgEc3wEeHiFTKkny0OTPDxdjTP6vTj8ykf0IY0H6O6KRD2x1l+aeiN1kMXw==
X-Received: by 2002:a17:903:985:b0:2b4:5986:cd80 with SMTP id d9443c01a7336-2b97c47b524mr69885015ad.26.1777455363376;
        Wed, 29 Apr 2026 02:36:03 -0700 (PDT)
X-Received: by 2002:a17:903:985:b0:2b4:5986:cd80 with SMTP id d9443c01a7336-2b97c47b524mr69884755ad.26.1777455362839;
        Wed, 29 Apr 2026 02:36:02 -0700 (PDT)
Received: from hu-kuldsing-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b988989d67sm16568775ad.76.2026.04.29.02.35.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 02:36:02 -0700 (PDT)
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Date: Wed, 29 Apr 2026 15:05:40 +0530
Subject: [PATCH] arm64: dts: qcom: sm8750: wire UFS to ice instance
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260429-sm8750_ice_dt_fix-v1-1-2540dc337082@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAOvQ8WkC/yXM0QrCMAyF4VcZubZQ06nFV5FRbBo1gttouiGMv
 fvqvPwOnH8B5SyscG0WyDyLytBXHA8N0OveP9lIqga0eLYteqMffznZIMQhlfCQr0kOyTtPlly
 E+hsz13lv3rq/dYpvpvILwbpuijc3bXUAAAA=
X-Change-ID: 20260428-sm8750_ice_dt_fix-d32c838c0c3b
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manish Pandey <quic_mapa@quicinc.com>,
        Melody Olvera <melody.olvera@oss.qualcomm.com>,
        Nitin Rawat <quic_nitirawa@quicinc.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Wenjia Zhang <wenjia.zhang@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Authority-Analysis: v=2.4 cv=XtvK/1F9 c=1 sm=1 tr=0 ts=69f1d107 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=YMVLaHQI2UQk2HygKEgA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDA5NiBTYWx0ZWRfX3O/o9QQ9Hu/q
 6C4NogptFjQwR/LAqSCzy+bGQBbIA1I4frzOJ5/HeRRl7zxCszj362FIXVkw9jflsTuC3tqNg7A
 8GjA8Z3uPA9geZRc5VNVBn5ZgJLrcxiqrPJlfr3cfbNcyTB53gzQm0/5Qg0lnAThZIC96Im2qQ5
 iGZ4+dIBPgPc3INLouIw0CyFQ6YWgqPahJdTXEcbUH9IliPT6STLueO7ehe2HZNtCXwnA7NAof2
 zUjA6ZWxkoflCr97S5D9IM5Foqjw5i0Fn2ts3CdQC9NiuxTtB/OUIsyCdABDGiIgP0dWpCg7JN6
 0N+57KshqXXHHGR72TjbjXVqofnGKEMS+Imf9LEOOmFx0rJcPE+ywYQ2zdscr0dZzyS64quokVK
 WndMlC/d7aElXaxrwr/mRDPH+4yuDAGEDkp0pNu+okRc0mdCMDbRgySDrXj9aNhpNGvs11M0Yoi
 yRWIp2r2kv0iSfRKaTw==
X-Proofpoint-GUID: VD719_A28Vy_WAz_jtrFiq2YoLqzS2xH
X-Proofpoint-ORIG-GUID: VD719_A28Vy_WAz_jtrFiq2YoLqzS2xH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 bulkscore=0
 adultscore=0 impostorscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604290096

The Inline Crypto Engine (ICE) exists as a standalone DT node, but the
UFS node lacks the required qcom,ice phandle reference.

Add the qcom,ice property to explicitly associate the UFS controller
with its ICE instance.

Fixes: d288abc3a70e ("arm64: dts: qcom: sm8750: Add UFS nodes for SM8750 SoC")
Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
---
Validations:
* Driver probe
* FBE with standard keys. 
---
 arch/arm64/boot/dts/qcom/sm8750.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index 18fb52c14acd..4ea7f6b7e20d 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -5396,6 +5396,7 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 			phy-names = "ufsphy";
 
 			#reset-cells = <1>;
+			qcom,ice = <&ice>;
 
 			status = "disabled";
 

---
base-commit: 39704f00f747aba3144289870b5fd8ac230a9aaf
change-id: 20260428-sm8750_ice_dt_fix-d32c838c0c3b

Best regards,
--  
Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>

