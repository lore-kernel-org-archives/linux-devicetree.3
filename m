Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEF1D3ACA77
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 11:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783077245; cv=none; b=DWMCPx2AOROszWQduZYaAYcWQ05hC54ncutGmReFO0AYebPqgBHtnHn3fhYR0qd5zuOs9gXBsg/pwBm2f8Ug0TpyfE3D4upMkeaKxJ087XuQKrJxlvAZxTFKI0aRXXc7e5f6Dn+zp0V7Rb3mPlhoty18pMbRVK4gFuygbI/Nk7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783077245; c=relaxed/simple;
	bh=athePAx7BbOFVZ19VFS2S0g/Z8cfkap7sP57WV0yZNA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TfeJyxQwOB8w2PkgqaCcQgRgRhONv9m2xFyz5c/Cir5lRpgeYsLpOwK2iIqTrlU/4ZtrQ56hDDLG7zpRqBs8oqixsTaaViyJYAOo5hdX24SQUvmgd2OQAqkOiJuVJGm6G3tiZW6l46NmqL9GmtbDZ1GcmX3cIyGVTm5sjJ/LIHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KMlYijpz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gNL9ciib; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KMlYijpz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gNL9ciib"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6637Zkm13410160
	for <devicetree@vger.kernel.org>; Fri, 3 Jul 2026 11:14:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	naSIg8io1zjzPWn86qy18L8LbP2gted8xk4qZdDvsRw=; b=KMlYijpzAzgJaakC
	TSu16+nVawbb8/hm8ECEMecFtyydvCpYNTs/NXLa0qs6khNtTWXMz2MbSeCvuGZJ
	JluKlTBH9Wzn7FN6eMkLvA3B+ZtSrrabfN8jIkSgKXjhFyLOeRIvkIlHLXZ501BX
	COFHwJcPL+3Kom5UoJ7vVVV7fQqPIq07hERKXC3BrCxU85c49upruPPKeO8CS4bC
	cX6nJgFHp3PM8zPxcSMrGO1ATiIKib9OxVwSMldBrP8jM++mlxRausaIidJlO4zf
	0B29CHFVkynM1kbXsHihP+E1Qv9vcLqkuF4J3IwTqm0AlrJL5IIpd3nG2yRtmHc/
	E68e3w==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f68u30swx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 11:14:03 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-847a483ea41so619007b3a.0
        for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 04:14:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783077243; x=1783682043; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=naSIg8io1zjzPWn86qy18L8LbP2gted8xk4qZdDvsRw=;
        b=gNL9ciib7d+kI2WB3vXXpDJHaiYjePPZcbfM3MYxbTbXi3g09X4UTpzp2VVIt9H+UI
         OGF0dsYcViPDXt43lOj70baYahsduAwI4DQStJKJPRgcFcgTsGQTgrSkdgntFyGgyN02
         Sy6YcnUce0OM6ei6tTW1IBbUQlj6tEjLQ6dZ7WAnobDcjfkzX5RXZ0y8e//VulVjDl70
         tlW2LNuJ8iF3Z/Hjge5phB+y4LUHsmwcLCOIDvsSQEODxlr8lt6TD9VyvGMoUtdm1L4f
         AJD7oeHTNDK2liY44b4/jDyX0e5R7xrqv7kXmzSDREAfXqS1oUyzpWoUIcjptzBu0tTi
         YbNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783077243; x=1783682043;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=naSIg8io1zjzPWn86qy18L8LbP2gted8xk4qZdDvsRw=;
        b=D4MslUaQfSR1wFOeE0SK7s6coQK9V/ofRhzE39ajq2Cg0BRAe0ev6slmAtPzD5/aUk
         HYty9KyhiVlogW/PgXqc5BhhhqRo2m+vOEzbvotutqCobBesu8Nt2cdfuDEA08Ukc75N
         DRDgnoy2d9bQ1x3ei2qzfJvW3oh4ENU2y8hMZtOfHcOCGR9iueEOcL38TqRsJWf5qYIP
         G92wsosH4sf37PnFEKLEKfyquEy0UIoC37Jp72IQwN4OssnBGEU14zgau1KNPIyeIiAW
         ugM9tkw6g6EjtlA5VA320V4lNagqzY6Dken8PeU2HjBrW7+jIvOLlhssezmyJzoJIZzE
         GLkw==
X-Forwarded-Encrypted: i=1; AHgh+Ro2W+KBQgGs9C+aGxKhg61OvI7qlb6oz7QAg7J5fcr1QoDIHZT2ovnQkGqoake1fEi2a8G939IPiTYa@vger.kernel.org
X-Gm-Message-State: AOJu0YxJGoRd89AgEYHUYvT/0y5D2uxK/B0n+EPecb47LnHrYmXFG1nh
	7H5op4U/vVTjWc7d+pecQIQSqqCTyhzb8NZF6vnWtpBUomT+Pv4mdIYkpc4w5Pc4t9cZUEcQsVI
	3H04R/Duu2jxiT8VHZSXTvVDOeqLBQjvRXxUC1p1iCM/Mpb7rAE0nEW6rmxUiOvxcuejQC+NJ
X-Gm-Gg: AfdE7ckAqP0JryJVKp2CRMJWC87JcA2modVzvTbD5FgaN/9PTeVr6WYitXgw39eIw/P
	7BA0Oq1gRac9dfurHc15EUZEy2/Hw6N1PirKLHT0kADBoA/7yTGxcVQDsFiUR3z1PQpxvlP1Rkn
	/XopSiN1CU/9ZSmk6jQPBU5ZnZYVOpI4gMDb8oh1vtRfjsKyR9oka+yznlYr7lddVOp70+2vbzD
	2Jgo4ToEXUnz9hlFaV6z92wFjpIV99r0IyyCyuAJlgnwStS2LaAZQH2FKCNphcEx1vH34i0mBof
	IVvomo6NHzNZzr+Z9T8UP2oDpZ4peiUNamOIiewormp9kkWlTtO8OweCTIJNDxgit4ghE5AfVfz
	22nxN1ubahmVBqHmiEkQUzGj5Ix1w9y9tCg+V653w
X-Received: by 2002:a05:6a00:760d:b0:842:dd4:d9e2 with SMTP id d2e1a72fcca58-847e14f59b3mr2779354b3a.0.1783077243363;
        Fri, 03 Jul 2026 04:14:03 -0700 (PDT)
X-Received: by 2002:a05:6a00:760d:b0:842:dd4:d9e2 with SMTP id d2e1a72fcca58-847e14f59b3mr2779320b3a.0.1783077242798;
        Fri, 03 Jul 2026 04:14:02 -0700 (PDT)
Received: from hu-smankad-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847cb94b3e6sm2729490b3a.33.2026.07.03.04.13.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 04:14:02 -0700 (PDT)
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Date: Fri, 03 Jul 2026 16:43:43 +0530
Subject: [PATCH 3/3] arm64: dts: qcom: shikra: Add LPM stats support for
 subsystems
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-shikra_stats-v1-3-0aa0ec1fa83e@oss.qualcomm.com>
References: <20260703-shikra_stats-v1-0-0aa0ec1fa83e@oss.qualcomm.com>
In-Reply-To: <20260703-shikra_stats-v1-0-0aa0ec1fa83e@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maulik Shah <quic_mkshah@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783077228; l=715;
 i=sneh.mankad@oss.qualcomm.com; s=20250818; h=from:subject:message-id;
 bh=athePAx7BbOFVZ19VFS2S0g/Z8cfkap7sP57WV0yZNA=;
 b=RmD/DRfXmIh+8TwRhLoAhTzFg+FKcDblRfvOB5Ui6u+/re3j6WpiKjDsh9R7Tjm03VOc7GjEv
 P3JrbNddiMOAl/7Di9+VePazVp6TQj6TJ0Qj5YvcVeCP1Jx+Ynrjbmd
X-Developer-Key: i=sneh.mankad@oss.qualcomm.com; a=ed25519;
 pk=sv57EGwdcfnp6xJmoBCIT1JFSqWI+gawRHkJWj/T2B0=
X-Proofpoint-GUID: zDSRNv55l8nRXtZy9FzlZamWkET4hCpV
X-Proofpoint-ORIG-GUID: zDSRNv55l8nRXtZy9FzlZamWkET4hCpV
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDEwOSBTYWx0ZWRfX0qXvrUitF0jb
 V+v9WprsasHwT971ebh2gdmT/4dMHaViTbhazIUd42JEU2SnY4jwpl4ikbutX5IhTd1JV8xB8sP
 N+yxh/VeNSP8Smc2JWjqCAT0grLv3LE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDEwOSBTYWx0ZWRfX8f5AL+sdOVpC
 Ta81fIBFNGTDhYne/OyBnWZawPZx7YSnj6krl+JIFsbsWlZZkkuB4dkCFY3nzecX0Igl7jb9vtr
 hK59lo3xmC8ZRATcjVXjTAFun57ejT41EoAeO2M149ubtyv0G7FHjqs9GOQQFdghaBByFuTx2D3
 AhywTWx7H/K10KmmtlbzzyhZYfrMma0MWdggpcmKR/nGchxc0yY8drqpOaR0U8oT9GYjVnhXhP9
 lwz9pxkXWXqi4rGV76675t9+ETVjaKJI1Nmka+WrDUHRew9Dgl3ZPRRAkBIvNMsA6ATkBYyZLgA
 Ine4LuE0hArseCZ4kUQKbu4/nS2vNbZhE/4sg7cXGk1PYWJnPVzdwk1UF+EXxEN7N2BmxBab7f5
 y+rNaE83y2/2mCFhYpDG4oSXfttD/PJ78Dimdn3EVUWR/BCMazVcHQzeaKCJb628T7HqtphtrYC
 kDtql/jLk4ia87J/9SQ==
X-Authority-Analysis: v=2.4 cv=OaKoyBTY c=1 sm=1 tr=0 ts=6a47997b cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=DU1Wev2QKLRUMiDuaJkA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 spamscore=0 phishscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607030109

Add support to display subsystem level LPM stats for shikra.

Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 4e5bc9e17c8ed8914733ac9fdc9b69128b40216e..53f40283a3b70bccdc510716b39251d377be7d24 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -535,7 +535,7 @@ apss_mpm: sram@1b8 {
 		};
 
 		sram@4690000 {
-			compatible = "qcom,rpm-stats";
+			compatible = "qcom,shikra-rpm-stats";
 			reg = <0x0 0x04690000 0x0 0x14000>;
 		};
 

-- 
2.34.1

