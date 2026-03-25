Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABE683EE1E8
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 16:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774455732; cv=none; b=Gla4O8OYgzSbcqbO52sVFSq9Zp9Wt5u1pYWCS05NTsdun+inYGJbYDLWYNS45YNxdzhEf0ykaM9CfPj1xAPd1OlWNSq7IKasf60WyA/n+5TbI0GoxuGfWtrd0PCtm7Zpyy/Qjx1qjVmD3xASCrRe4dnl5zTRxmxw0BYLsngH6sE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774455732; c=relaxed/simple;
	bh=/tAVcWhVjzz9qIGzMcaNacJ2+0y7se0EVvVbLWigg+k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dFl1Vd8uKDr2Vb6jbLw012sZLNOwodwPp37ERCsk2Vm9iyEzBO61seTTVk09I3QWLHSQgHAdIpuy3w8ykYfQmAVIhMWmauWzJfprK8SO3YGWC9L+rlwiBkray4YEmOsiEdaGlJ12CCHVWTIq03DTsfE8HxNWwf4+pDP0exj+F8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FZU7byQW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iR6P0qEo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FZU7byQW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iR6P0qEo"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62PFRLfk1432159
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 16:22:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c37CSvjP46taUJnNNUK7QMfhl6NdHUcX65l8UjR3634=; b=FZU7byQWcbXQXeSp
	NSnDvulXgrsDr/JOwzH6XRn05IdL5scA1We6I6XTzCWTEt9d574At0ZqB7SeY49s
	4Zc2Sn/nDhJGEnpzPgzoVERCC3ZuAO4w8dlniMbN42mmuMRkKK+HYVjiNRBilIVh
	Vcu57MUtl+NzVFOU8z4M/jFE4djsPGCPe4ZcqFeC7NN+1HYGcw75q6QkTD7TgufO
	Wy5dsYp/wxOaACHcWzq4VPXjhEYT3bi8V8CsbE+Pp0vm7+uyg6Z8xEMdSuNymOK9
	JnqqKfGMrUS0kSC4yCWynPEwMySG7cpvrNDSvmOaS7NcduDgKfoONgNLGriX2MLn
	hk/Iwg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4jc5078b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 16:22:10 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c7651644975so68134a12.1
        for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 09:22:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774455730; x=1775060530; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c37CSvjP46taUJnNNUK7QMfhl6NdHUcX65l8UjR3634=;
        b=iR6P0qEoyFpmxGuJCuQGX/CGOH2keg8dCMf2lHPjFWOzVonMQQU68wSQE/x1AhdHPW
         +x27uNH0MaTefU+0kYquzCRibiG98N8NJ+3rWbZM4YSZZh61alZ4tnrl4pMzbtZnPliH
         4q3tlCS/+mnt4AkP2ug3I9FyLuJnrFVHbfOIIRfoSUCX/NXoZF2qQD1fJkccpRI0AdVW
         yXaAuGyh4GKLDEDU+x2BEzo0bEyhpoJJOoCkJQsT3uYTbMZ8IK5UIFY0zeFNQzqS+hN4
         giT6CHNkJiMcMwVWxKy84vj3hN13Mk1/nF4yhJhYrHsFDnY+r9h0T4snG2Be1sYshira
         DXUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774455730; x=1775060530;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=c37CSvjP46taUJnNNUK7QMfhl6NdHUcX65l8UjR3634=;
        b=UvIa5LqXeVnOVU9/AX25gRxEHztKn6yO0JdEvF9CCQUPnDebU/Eqcpc3KNYOp53eU5
         tp8eJdgFdFHa/BcKYWOBZuCXiXVyBO/9Wh6kPj6UXKKD6QHaZRZJQHh3YdqOUMIa1W7x
         X4hxHmNCVZFc6kPL5oOXWeNHIGMAMwgwtiHCI1PkQ3jl+2ecbG+mH7h8my6MYiTIHE5K
         DHKzwFgL0O8NL8z1M1h+EeTe/Ef+r0kO+FberOMXJzVnLh4mzmufgfZVpspq2CHXrYmS
         JyLIDgArkWHZyCcP2qPdfzf09I6+4FOny6AYXjhwpqLolLTMtRC5EPsCIjA+AxDpZ18a
         6qUQ==
X-Forwarded-Encrypted: i=1; AJvYcCWfHC/h+IhTtcmvfKUA2RbRugZetbr/cR8Sjd3i9jYJ0xfOYLPdggZhwfUUR4UbyosIfvqk/rjn1yPz@vger.kernel.org
X-Gm-Message-State: AOJu0YyLE02Ba/juzko2QgwLFNhGfSjunUJFkGkG+Ce6gJ78ZQH/zFhF
	mxv6jpHXphc9rcrLOt2A3yRyCMEKs4GnWGoCdV+Dw/jZdiislcuWd1kfp0g0KTarmwSGjXALRYg
	+AxtXNSXIDBGmXphoh2mM1uWV1domAtNXAOsey+GVJAoufO4Zaud9GEy0Vkwz1ZD5
X-Gm-Gg: ATEYQzz+PdmedKAh1DuJCUdmPngfvyzfEoGidcMHwNmGnd+8PwF0Dd2QS8Q7b/RkVES
	0AckhJH/d1lSxqmrcO/hnXq3XljiNeJM721JvhYzLGcIQgVhhKWmcEdCVml2bwnFBqXS+ggiGt7
	0TbWhZYIO1GPHsqHJVFOxRYjogHhRY1n+BKOqeBYan4K+O+eVIfc/O521HP/SYPikPNsOBRmAWN
	8WtjFnEd9qm08rYTVsy2u1rbi+VfDfWT9rUwstungHZeIHjndn502aDaIaz1qWpbAN0s2fsUNAQ
	HdvCQW0gPVY7RW6Wem1goS0Z2ixPhJmMV8NxgDK4bLO4CxmfgkWzeeIOfRppELyOG0ui1C5zwHh
	XGhelNVXnUqJWCyxr7IM6T1o4eamliE5+MRX5uVRx/Amuid7TbhOnttWGGolYOKW8wbBY1Ai1mt
	TEljz/aU6ErYhQ0QFbxcaqQBA6kWeH4rpli2YazI4vdP6N82rl
X-Received: by 2002:a17:903:22d2:b0:2b0:4f82:74ce with SMTP id d9443c01a7336-2b0b0b2f889mr44454135ad.46.1774455729543;
        Wed, 25 Mar 2026 09:22:09 -0700 (PDT)
X-Received: by 2002:a17:903:22d2:b0:2b0:4f82:74ce with SMTP id d9443c01a7336-2b0b0b2f889mr44453885ad.46.1774455728988;
        Wed, 25 Mar 2026 09:22:08 -0700 (PDT)
Received: from hu-ppapaniy-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0bc8e958csm2945415ad.66.2026.03.25.09.22.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 09:22:08 -0700 (PDT)
From: Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>
Date: Wed, 25 Mar 2026 21:51:50 +0530
Subject: [PATCH 1/2] arm64: dts: qcom: glymur: Add missing opp entry
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260325-bwmon_fixes-v1-1-9433f9d4c276@oss.qualcomm.com>
References: <20260325-bwmon_fixes-v1-0-9433f9d4c276@oss.qualcomm.com>
In-Reply-To: <20260325-bwmon_fixes-v1-0-9433f9d4c276@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774455718; l=725;
 i=pragnesh.papaniya@oss.qualcomm.com; s=20260120; h=from:subject:message-id;
 bh=/tAVcWhVjzz9qIGzMcaNacJ2+0y7se0EVvVbLWigg+k=;
 b=Peh4ArQMebk7fNnewzEjKB6ulukVDPzyFqZ2n5X8+NwZXUgSi5SWE1QhrMp1wSGku5JwJsyZx
 nGCzN0WXnOiA/bu2RjtRADzyPgkn0MGH5eGBuMpQ6+m1DCX3R1AZVG+
X-Developer-Key: i=pragnesh.papaniya@oss.qualcomm.com; a=ed25519;
 pk=09P9nFmZLXJ9+4Jx10ZK5rIW0Fmk79A/DLErm6aVA0c=
X-Proofpoint-GUID: xHwCaNdqLjWKLHU-3yJDhc8RxhPnyduj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDExNiBTYWx0ZWRfX7FXsb8PjQPGE
 movgG8xv4lA4bsrSZIk3ctjtGdOqsIrUK+b5TJvkNqvVxkcveUfisfCaO87LC7RMZIYJ050UWNr
 qpvc4CDG2Y8PTFf7tdDpypwNQ88iPqic5UXdk8/LQwmXs2FeZKG4CvbqT3TQb+gSUhTKvYqX1e7
 52gsYL6xbo+fman2foS8AqiOlZ38ch9yYfkKnJk4D3+E4InsVqhC5amh1gxgsX9qNUX0Mt2xkZg
 XP3YyhXStpp6R1xl1M0gXzMBwUXypsMXcboANhNNVaLQoenMZkejUYFtdHeqgNBQRPB/mwNVr7v
 AfzgUm4ANmGW5dp7vpM5gPOGdfmBMXnKF8FY4clreoteZyFSqh+VPEVotzFRywRpvtQTx2ax7tV
 EbBJIWlnmoJzkJ0IGuCw4TDcDEgfzAjBJanXnMEPNkZ5EGq3UwDmr8R5kiodTo2IPaDJvgIlhRp
 bXUkPjXuz44o6DVAATw==
X-Proofpoint-ORIG-GUID: xHwCaNdqLjWKLHU-3yJDhc8RxhPnyduj
X-Authority-Analysis: v=2.4 cv=KaLfcAYD c=1 sm=1 tr=0 ts=69c40bb2 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=Brl5giRaLH8v9AitE4EA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_05,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 adultscore=0 phishscore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603250116

Add missing opp entry that corresponds to highest ddr frequency
for Glymur/Mahua SoCs.

Fixes: e4945894c1cb ("arm64: dts: qcom: glymur: Add glymur BWMONs")
Signed-off-by: Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index 2c9d10f2e987..dc897fe1c8de 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -2595,6 +2595,10 @@ opp-9 {
 				opp-10 {
 					opp-peak-kBps = <19046400>;
 				};
+
+				opp-11 {
+					opp-peak-kBps = <21332000>;
+				};
 			};
 		};
 

-- 
2.34.1

