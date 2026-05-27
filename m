Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D34B83F1661
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 09:45:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779875109; cv=none; b=g6JH1RTpKbBqhSukxYKyM1zfXHsdMIEdrV2GScqJjX3EvF3zJQhTtxtkFRaMHaZ2xQ8nsadzSV5gn6NpdvPWE4zULAc3YbJf+VN5DV3cLVrZkRp4WLBF/fVMrhOFI16+vyXYbrM4CY5UAazo8C0dwjZ+lOJJtta2JNeIzvZT2zo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779875109; c=relaxed/simple;
	bh=ls7TrQxCnifOjbx6cWqjTBfc/bkIPwyHs1hYENKhKNw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d2lsu8GnWln9F0ezJfQkSvtsuctijZa+mbL4Z3/gN3j1SpstnBUc+U2o66FG8j1UEWo9KFXsIcl/s2nSLgz1rtRX+OPDRTzAXjznHVQGaad/BNwbR9qxTOLuqzQJij4uLJ0mzlR69QYI73DrV/TkQbxhdCw7rH8uDXZ9ruvwqeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I8rTOAHM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MU06itXE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I8rTOAHM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MU06itXE"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64R8mRiu2282516
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 09:45:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=lcgjnRSkg+M
	EKulFGm9TLrFmCf3MLPnC1ty6pfiqTFg=; b=I8rTOAHMpW4MYuXH9g9zudXl7ne
	z7dzpi6pF6ym2YMIpUgvNxZTxKLw0IB66hxkmThayfqlodHJkMHX829ShyfBQz7G
	Ltv+/a4Gg4WXlmED14u4tJWibNPkQfTZ+lQKf4ALoLz75mA0X5lZyKG/3ab27/Z/
	CgPIVKsVoRzyXO+irj5pB+AgdsnBqVVwez9U1vZWOswQPGaHO5UrXZpueWx/OpA0
	O2HByc85BEEpwslPrpgr1YOUYRRVyO/2r+UZ8FYOQsfv0Mi8I6BgswA83CQaPdu3
	iVqW99IsvvgHx+lGYU/oUbgKu9Oi8Uk6sk3XvUvMp5NO/cVrcv3Wpi8l0zg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4edtvcrv2a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 09:45:07 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ba5f794825so91791355ad.0
        for <devicetree@vger.kernel.org>; Wed, 27 May 2026 02:45:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779875107; x=1780479907; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lcgjnRSkg+MEKulFGm9TLrFmCf3MLPnC1ty6pfiqTFg=;
        b=MU06itXEpksGJBnBgpsLNS3j+DeC1aPvTe71cLqH5xQz8KyqRb8prZNHenXzyAxhgM
         JZmYTfgwjaR9NiERiceWTG6Imy6JqLyqM8mT7i4Enzp/Be1H0keCHYOGZUTjY5gDW8ZQ
         b9aqqLTbNja4gZl2pBg42n0fRHmwdJUhjbkoXTHNAHR19t2S1djyd8MoCPN8EDSzx9wZ
         rnR/1aEvjylURtv6srAl9TAywreeLaz6gUKPpeevA55Tswp4LM1OPEBxoou0A9Q1VCWK
         ZElyck3PPCLKR7poN26RuCEhRXkURbA/5EoAsZ8KdAQ4COcTX+p+63EuhWj0+Pu+WptK
         hE5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779875107; x=1780479907;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lcgjnRSkg+MEKulFGm9TLrFmCf3MLPnC1ty6pfiqTFg=;
        b=X6ixxVDeiEP9UuUviSDEfEbHzQo26M16V//k0tikHbwew7edDalRcrMwmLBl9R8Dg9
         mA/FJfDgQp3VFboMJ0ZufiJIjMegYBsbsUJ9mkoRQSe8XpIxFK6WegdbE25gZQ9eP/B0
         jO9C77HpZn3Gc/Ldp/jv5XXlvQ6ZegbTQKsJ1sRWCczAF17UJdbXgYXroVNoKO3iNZr0
         O4CNQ1IXI7/WzXa2kqJa6y2NwUbbIkn2ppPnEEHbqg8KaHUnfSjUmlptxBJcBBKcB9/Q
         ui61ShQPuPXuViY4UcK2O5CIqIr0ZXFAUG8QXrQy8XZmJzZkBFW/OKr0A4px1HOML/kV
         VZ0A==
X-Forwarded-Encrypted: i=1; AFNElJ/rlaWmHu9hW+IEM6OdM8hYu8dvk1WiHvlLNP4eRKVB2beJK23lv6nh+HPOi2oyQW+CT6OSPc4qHaAB@vger.kernel.org
X-Gm-Message-State: AOJu0YxxWYGrmbrok+eM3ioytbVM1cqKC83gXAPQWWOfKSeQIDoZmBzK
	1yofkzygjhg4EoWFv0axBjC3kCPPrSd0rz93YdOFMw+zhbHzQX2RNBwDo48w3bWLbXPYrQ0QnwP
	Annq2WnNJ93LIMvYq9YrpcjnQ8KvUe6k0lx5BzxZoDNSyzT+VHdlCD/mkSRkiAF/fKd8baX7F
X-Gm-Gg: Acq92OHjtjLQdtZ2KA1heF8ObxmIiUsZPMMhEJfikfAvMbTish5jho4EvR4yydHSqlo
	g/6J13j1BpuD/bmrFX4iLNhwLQ4njnfOywb/kGDrwGhK/IkpYhqL/EVGMcXMfMdIqLIfB/vxNKk
	dw4AdSKmTATMR4dwQKxfBmnEW7ffpsGqI6wUMC+xPaS/xU2HJh+oWVS1Un1PjNDOt4VvMjW+IU5
	UMYyuRYhYtzlDcM+un2kwog7ebH2jxDIH0XERXthjE3MWASHKaJVa1eix2d3mHMwUykMs9SV79C
	UHeOz3J2+N7ImNzsUTruwdj/sKzADzIfRVfl13eGc5yJHmCBRUwq1asBiwI0P7a3Uu3AYLWORLs
	gMmjbuILXse4DvUw1vPZ/HcNOw9Hm4o6ld6iuLKv/GGo22kCO
X-Received: by 2002:a17:903:1a2d:b0:2bd:5ddd:17ab with SMTP id d9443c01a7336-2beb080c8fdmr246010395ad.32.1779875106547;
        Wed, 27 May 2026 02:45:06 -0700 (PDT)
X-Received: by 2002:a17:903:1a2d:b0:2bd:5ddd:17ab with SMTP id d9443c01a7336-2beb080c8fdmr246010105ad.32.1779875105922;
        Wed, 27 May 2026 02:45:05 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb58b386esm154738185ad.44.2026.05.27.02.45.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 02:45:05 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v2 21/24] arm64: dts: qcom: sdx75: Reduce OS PDC DRV span to 0x10000
Date: Wed, 27 May 2026 15:13:26 +0530
Message-ID: <20260527094333.2311731-22-mukesh.ojha@oss.qualcomm.com>
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
X-Proofpoint-GUID: ReVOrfCTKw-Ax9iJrQvh3qG6wGk8fVz2
X-Authority-Analysis: v=2.4 cv=CY84Irrl c=1 sm=1 tr=0 ts=6a16bd23 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=DNTF4lp5giEEL2ahYmUA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI3MDA5MyBTYWx0ZWRfXy1XxvskLkx1e
 WlCFVmEH5M4coDK8uiCNCs5ukaxlzi+z5WPAgo1nZ/b3AreQChgZ53Xs20mmaW2Pjt7tgz1B5Id
 5xVquFrS3Mf08/KCkdfnYpfrGYyBCLv3GYdfz3fApA3gHr9hDcour0tXRt0ARIBTC+6GzrgHX+o
 EAaw67A8KdMcIWmkkyYAi8LnRKAqP5PFwbOGYuCkQ8xcgH6NzJXlHVzTR2vZ97fWuLgGhARzGpd
 w4l+3iQLjCyMp6CxJXjDWyB5AgYYIaVbSEf56SeOaIMP1gQs1ap0bakGnoNonmrOK8PpPES7ekF
 BVKzpZIvju3D2ZCqAQwyTaTFTBoRKl6D2APIQxycP2Efg0ppnECwprQeox68KqVfXxnsDHtP0/U
 KEs8Gzgp0Mab/o1/Z2m2GnQL3eHEvKlTi2wnxeKXQ8V0I71YX58JZxnr1qpqFsSIWzqtTcarauY
 dABXrS81/QnoRHrVWsA==
X-Proofpoint-ORIG-GUID: ReVOrfCTKw-Ax9iJrQvh3qG6wGk8fVz2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-27_01,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605270093

The OS PDC DRV register window on sdx75 spans 0x10000 bytes. Reduce
the size of the first reg entry from 0x30000 to 0x10000.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sdx75.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdx75.dtsi b/arch/arm64/boot/dts/qcom/sdx75.dtsi
index d1b61530b562..85cc9c6e6f83 100644
--- a/arch/arm64/boot/dts/qcom/sdx75.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdx75.dtsi
@@ -1100,7 +1100,7 @@ usb_1_dwc3_ss: endpoint {
 
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,sdx75-pdc", "qcom,pdc";
-			reg = <0x0 0xb220000 0x0 0x30000>,
+			reg = <0x0 0xb220000 0x0 0x10000>,
 			      <0x0 0x174000f0 0x0 0x64>;
 			qcom,pdc-ranges = <0 147 52>,
 					  <52 266 32>,
-- 
2.53.0

