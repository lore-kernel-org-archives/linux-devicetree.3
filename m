Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C28F6344DAE
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 19:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782328180; cv=none; b=HMKduvuz/LJo0Z1Qs6gJvgKrLI9PX4fq6Fo4h96MHWr2pLqxqCw9XGpcoT4UKa6sIgagdyEV9z1i50P/M7ib9aT4hkt16JCVYi1MvGUX6i1M2UavAymkivYXQGrgaisk5w7dUA6JpbH7kR8LvsTvBO7xKVmKXzKF+ZGbtwXjGI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782328180; c=relaxed/simple;
	bh=q2M6sUMBFnSwf5l2Kd0WKx74C8Cyzd8OxTdXY4egw70=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gHsSMSmFtLiH6yzcgWGaLbuM/Gb6wGpfzV4rp3KxfV/N+BiNnG07LwYQpx+gcJXEX0yDMr9VERWS1C1GxF9XjrdKYQf6+dNpCl4/K8fYnnm1E3ZAL4MVepJsOnxoQxtQSUKcxrZdYpWalf5tWWhOhsknwQuOy17iYYb77qX89ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j6lx8NRQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ceEXDh/k; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j6lx8NRQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ceEXDh/k"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65OHixJN3580284
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 19:09:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=OYV8iEEBqUQ
	eGUzP6iB+0ywG0zlXq6EYDd4qJaeKUho=; b=j6lx8NRQxsk4IWGl0cLaFo4FlLU
	KA7XQ16KuedlLF1h2Wkvpp+XmSMXowIuKa8id4ONikoY31t6Wc7vPrj7PCVKn73u
	xXoQ43s2sI75IdfgQZkbpWr1tLj+WzlPrt0LAi61JWAxvSQuhaXpgsiqZuY8j4Lo
	0vVBlexst2en2RUNRW0IGbXi7iX+RXZ6ovqUftvEXNAXy3ntFJRtRLypA+OVLsUB
	yRGq7s+99p2I8pnRCCT8lAfLOEIvCgyQ1ZjRIcbMzEUTMWlfg7/AqK6moVzk0Uq+
	0UfIYSBNX8LXTntKWwtX8KDHsAuoSdBm2aV7n7nDAxG0fNB5F29liCG3AZg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f05aqbw2a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 19:09:39 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-845319bb97bso1119502b3a.0
        for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 12:09:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782328179; x=1782932979; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OYV8iEEBqUQeGUzP6iB+0ywG0zlXq6EYDd4qJaeKUho=;
        b=ceEXDh/klZ7MsZHgQ1JJHlbaGLIdCQGrM2dE69g5hhIntjDKoqFhipFxT9qCcmpNA2
         fOWuOXa3KDFltgLe8G6WfVzn156lBP5s6UMCFEgfO3zn2se+wu1+AGfxvLv2WPtTDg+1
         FoJJfzU3BVOSB6SVdt3zxyv3IVTcmGkgZb3Abzl771Qb/z4x68Ty2eb+q3U4tLqXqPqn
         CTTcjpyT/i11Ri38EMocJCS6U/iilRaZst1oMBxQnAUqKMLxaDGNcCQmpRcmGW7ZVmqj
         wg95/+HEVbK1fsR3li+PzeASJbdqjP8ExToRw1wuDl/55UEvjw5eF4B1BX5AnVf9vc94
         7XlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782328179; x=1782932979;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OYV8iEEBqUQeGUzP6iB+0ywG0zlXq6EYDd4qJaeKUho=;
        b=kahz7txXyOl2Ua0Dk8H+yHBh7C+tMxX1K5yYwkUX97FEaBvMPZEyiph9G+T73liMl+
         DVDOvY7XlZ4GQYycEndOrb6jiz9SPYWC/LJ1AeqjKaLaBXMYB8yTAiVw/iGO+Nn1uySp
         Wejaz7Yy54VbPYL68p2BmclJMb9sPbTTPWRrfSz5xPzWiF7ngBTo9+XUx41Hs7RqlIOR
         /TAm0QlE8qxs3fk4exaRf30LZQoYgOYxwSgsyQ/G457FP+GnZePK3QPwPFHJ+pMxo9lZ
         EQD8lCcsPQVA+S65IQLXGAsmLdKSgrz/9XoUPHL2YfuHMC3ah2/gpRDTERU65Intr3t/
         THzg==
X-Forwarded-Encrypted: i=1; AFNElJ/MVyXjZZDZgu2s1gktCqOO7cTSIR9k2GbRApr7g6rCKhAlTzfbhihbHXWnWz7Jg3UJ3AdsWEiLpKMM@vger.kernel.org
X-Gm-Message-State: AOJu0Yy15gku9d9fYR7+a76+6SI7L7yjOrPNzmHO5g+FtaeQBTjXX7AJ
	LN5Unc5ecjra/KVHVaRSQpg9H4dGAZwt25onLS/p4VA6jdDO50HyvSzO5ME8rwapSDcmRVEdXdM
	TNwR/xVnE88y3UKLD9L4jV4omqLmPXafNI4fVlMk5Mlw5Yf3R5ArvUiB4qTPriLbK
X-Gm-Gg: AfdE7ckNnTsKk7RGLc2COEPLuwp292JHwcT5menLxcM0TJMXn7IwIazJH84NNod5rMj
	O4XHhIiKctR+y+HwPHywvCfC2slk7t4iVCXaycB+X5v4TcC8VB6iE3OSHGA/+2N76X35bN23myf
	jGeGRdjpao6l5xom1zvl3fkPWtyg4dXgeTR9zJBiLdav3RHeZ1+7Yff1mmv7W/MIZOHx4oCkAKg
	CY/9S7nk5YbX+wcVXWrXX3ekKUcQ9mF3F4kIQN9Xs2nAUwXjxRHel16H52aqiESJPydonchxno4
	1toDSvxEcH9YLamW3y8UhO1aZEch6Cg/U6HJy46sBNR1WK3rYDbNBV0cd7mh4eJOg8OZiEbXZ71
	7aYLDJeD4IXAp8HY6hr7MgOMmWJCiiQAFSM3MUA==
X-Received: by 2002:a05:6a00:a383:b0:845:390f:f4cd with SMTP id d2e1a72fcca58-845a2c7d3f1mr6047084b3a.30.1782328178718;
        Wed, 24 Jun 2026 12:09:38 -0700 (PDT)
X-Received: by 2002:a05:6a00:a383:b0:845:390f:f4cd with SMTP id d2e1a72fcca58-845a2c7d3f1mr6047042b3a.30.1782328178159;
        Wed, 24 Jun 2026 12:09:38 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-845a412e5e9sm2932120b3a.54.2026.06.24.12.09.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 12:09:37 -0700 (PDT)
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
Subject: [PATCH v4 14/19] arm64: dts: qcom: sm8350: Add minidump SRAM config to SCM node
Date: Thu, 25 Jun 2026 00:38:25 +0530
Message-ID: <20260624190830.3131112-15-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260624190830.3131112-1-mukesh.ojha@oss.qualcomm.com>
References: <20260624190830.3131112-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDE2MCBTYWx0ZWRfX0xQxlPwABF4V
 HmvsipJj7vbocM80XsThEnwh2Ggo0GtacyWXKMKDDV08SpG1w+7VpO+slvk5DR1L/ZBN2MocQmo
 +1Z3hSXy2vM+cMSmNTik8lc9wimRTW8=
X-Proofpoint-GUID: 9Jf8EVLAyd1tu_XZeIKdsGuwbJsQYjOa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDE2MCBTYWx0ZWRfXy0LwMWeRW6oe
 9HnCPViKgFv37cqx/MhMvKo0hCIAc+HO0jaWl0mllgb0WpndWzheogvHkTFizApNmzR7F05Bc2Z
 wcnsjs3scTEfSO/HiPsCC/eEzHnICuws8Zu8aDzN89o5HX/jVMOKnr2BzArtXDz4YN2mYYyK4yV
 5hIi7WbHYJxhhtTtTjFWCgNW8ZYGXY2CAtKd/pXPxSIkvYhj57E/Idxt6ll+6ZIEclOWryorRmW
 lkNmHk+tXHUZhImraFqLFMbl/1gj2t4xhjnzjWPoawzL1CDwkVUmwEOgRhxctTd1Rb+GpQlznMW
 dAL1aaReb5I/4pm7uWthZyOg+Pyq6UQfod9yaQbTQAhHdbpHDzMZKhoft7s6P+kYUcKYbaWrLP+
 wp3LKJrEywD4EaNPFhD6Yx6BK+XvGA==
X-Authority-Analysis: v=2.4 cv=UphT8ewB c=1 sm=1 tr=0 ts=6a3c2b73 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=BqutWRM4iOSfELY9pvwA:9 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: 9Jf8EVLAyd1tu_XZeIKdsGuwbJsQYjOa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_03,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 phishscore=0 spamscore=0 suspectscore=0
 malwarescore=0 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606240160

Point the SCM node at the minidump config slot in the always-on SRAM.
Boot firmware reads this word before DDR is initialised on a warm reset
to decide where to deliver the minidump.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8350.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index c830953156ec..dea97330da49 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -293,6 +293,7 @@ firmware {
 		scm: scm {
 			compatible = "qcom,scm-sm8350", "qcom,scm";
 			qcom,dload-mode = <&tcsr 0x13000>;
+			sram = <&minidump_config>;
 			#reset-cells = <1>;
 		};
 	};
@@ -3451,6 +3452,10 @@ sram@14680000 {
 
 			ranges = <0 0 0x14680000 0x40000>;
 
+			minidump_config: minidump-sram@1c {
+				reg = <0x1c 0x4>;
+			};
+
 			ipa_modem_tables: modem-tables@3d000 {
 				reg = <0x3d000 0x2000>;
 			};
-- 
2.53.0

