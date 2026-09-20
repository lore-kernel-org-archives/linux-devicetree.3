Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DEA33EB0EC
	for <devicetree@vger.kernel.org>; Sun, 20 Sep 2026 09:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789895482; cv=none; b=u+ljQwp+D4q0L8+tOKcdyDXxUvi1gFNcEdQzDyGan59YBcYMlAMK3Id/KB8rHcCd3iuvCFuFliKUt6V+cl3A21i+F/E9ZMua2WNquD9aYranChdRol8nQs2QqG8VxlwpR9fBbASnGM+4kLziqcZbz6LzB22URJA8DOXCgllRV8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789895482; c=relaxed/simple;
	bh=lrTER2MqP0QPo+t54UPYxyOBJ0MmBWz+c+Zx7ruhgf8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uVVNMsU31/f3DszFX+8l1PurVNlQOUEbg2m9GP/Lel2Zf0lFeFwqLtEyI3I9ZBhZ1qg2phUhHboHW6QGm8zMbrqDeR14m2mrX3q7Q+9lAyAHjXAFJ8qB6HTOhpYHV1X7b2mrd36fQD+4NaZvyaFIfomBL5E5e+ZCr8JtwDc9g04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YMkUEoXR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fofNafuK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YMkUEoXR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fofNafuK"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68K8Vjsd1242711
	for <devicetree@vger.kernel.org>; Sun, 20 Sep 2026 09:11:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=xaLXdBBWuVF
	kmQZeXoKLSafvYIkhmxs/DUeyQwnP0oQ=; b=YMkUEoXR9tZYQ+lMUNoyvPZXd3H
	3A+hZ78j+YU+d93M8DNEikZIvjnxeqUnV49HMkPaexdqQqPR0S5ZZqv5mrw42cp1
	XBe814cTQEc67Rgfu1BpahBP4Z0XW1MnBy1jzYdawhHjcTddWx0h0KZU0Jlnp97S
	Vf4yXwytcWtd7AhDb5+NJVvqej5lgK7v3aLiInFjecgbS7sc1CwluMjWBtZjMehh
	cFN+Xd5y9Bdux04MDI06fSqbR8rI4CmUgTl8voEnLTCdaSslOM/eF8uCg3rIORcJ
	njNyxlhX/Z0EIx4fOFdw98ZimCKNDj3R4QEKHYkT36lUZjXxnKdVFXTVRng==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gsjs82kgp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 20 Sep 2026 09:11:19 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cfa4e4684bso53667805ad.2
        for <devicetree@vger.kernel.org>; Sun, 20 Sep 2026 02:11:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789895478; x=1790500278; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xaLXdBBWuVFkmQZeXoKLSafvYIkhmxs/DUeyQwnP0oQ=;
        b=fofNafuKyg95REkuNCzyZ70q7FisnqFuubcbTE89iBPnmrEUiDtgX5A/Jz6boZ81zt
         bgdyuPb52vcQxZQaNYCca+UEake8yEXcMWLX1qCP6Jwi5Dcg7u1Fjj1WD/Q9QxcLLDB1
         a4BPt4KMEBHzwJ+kkLB20IrVGDZJkYkhT3hG0VXPHiC99f5zaL8ycef27XtWzjoF/9/m
         fizVEfkSrsDSR9IUMW2IPLsTV+qSjmouMkWpUqVSLUw1eGzlQnrc8kMVCPnL888gzgWh
         akFMqPI09KPBf79btYoCTgAxwt4Hhcs2biuLo6TZp5+D2hU5e/ittrtiXStIpeMEDnBa
         eDAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789895478; x=1790500278;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xaLXdBBWuVFkmQZeXoKLSafvYIkhmxs/DUeyQwnP0oQ=;
        b=Ls5toyzeIfKHBXWWcF2hh9+r1miLPntpHDSFLpq03oqWJ/9K7MFfVibCVHhtBdiDkm
         FKjOSRWPaR+cGzH9xB/O03lKVzv25I7bKbVOf2ciDYjQCB9dD3v5rsn2TkagFUWqg2ep
         gIgxDhR4uLV2BnyRs3nj/2CR0SI8Mv8T+Q8JVUdmhWKIclagL3ntzWpMy1qa5NnrMwV7
         anY9zBVYdw+8AA+b/sTzgP7OsC13rB66Vf7/Zmg6GsdtGxfvepXsnEI+L68br4yo6SDx
         VwqVfDm0DDpJHIXeIzMjsZicxDaifB4bhJzGhjGK+KHrRzS7KHdasVWcDWSC7FpjwHzo
         hw8Q==
X-Forwarded-Encrypted: i=1; AKwUvBxtK9SlHuUT0RZbllJNNTRuFYoeJxqE74i1dQVxhVZOmDA7iZdR3b3iIbHjupaEoyOEsPJ2EaeiDVEN@vger.kernel.org
X-Gm-Message-State: AFuF++nM8WuCUXFBvmr9PGGp0c9wHHMstdTF1t5GiAWllRrs3ebp5e1T
	/Ibv1ZdKXEnLd5jQMsxwU+rqjppd5rQmb1GPFg2oGQtmtPjxjROgHRkll+jX6Cg0uAhYzIALIpk
	c1lUhShqV69BSPXwToVIhzaAqQriugd9Axke5ia+eefEl/awoG/5njQBO1OADcaMc
X-Gm-Gg: AYBFou3kt3jELocYg32lkAWMXVe/1bmm+SJOLFdtZ2QBOYQ0sqa6/UKdPPcN9A36eyc
	VqUd3qqWnUznM7iXJSeaAP4b9VIbxR7L7iwWymOhtJGw/zuO3OsAPYX05O8Svw0RtTO4vPs3lch
	HD4tDKI55TEDrW0YeE/VUHVeKcDCM29m1NDK3GpQfzbR8w/ClpfM31hokPLFsqth1rtQ8DFzCR4
	2swFjtkl+aWLO+VFENuG4k2fpgQHvF8Ndueya8CUiRxfHIMXI5afRKY4Alm9vo1/IRyyFIkvaxv
	6aheiJfjFTre3XXCzPIVpzmXHG/Re31n1odxxxlogWOuQ0k/WTGu5GwhmCFZvohQfr+1YghBcOZ
	rx6IW3rtaYWutnhIesll9zqvaWBrB/FsHaZAKqBWZ363W9Dz98fE/oV6STYs=
X-Received: by 2002:a17:903:19cd:b0:2da:eba4:b640 with SMTP id d9443c01a7336-2ddb1ab55a4mr131147155ad.6.1789895478569;
        Sun, 20 Sep 2026 02:11:18 -0700 (PDT)
X-Received: by 2002:a17:903:19cd:b0:2da:eba4:b640 with SMTP id d9443c01a7336-2ddb1ab55a4mr131146975ad.6.1789895478196;
        Sun, 20 Sep 2026 02:11:18 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c3313d96esm10730242eec.12.2026.09.20.02.11.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 02:11:17 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 3/3] arm64: dts: qcom: nord-ride-embedded: Enable camss support
Date: Sun, 20 Sep 2026 17:10:53 +0800
Message-ID: <20260920091053.2214965-4-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260920091053.2214965-1-shengchao.guo@oss.qualcomm.com>
References: <20260920091053.2214965-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: OhzcYAC15peTmrnUIg_Rqcz7NrYnFwNI
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIwMDEzMSBTYWx0ZWRfX3QLLjJICE3ly
 kMkOIDlc3zET0Hh3f+jOaEmLtNpd/C/dv07Jq0hArgn3f28c0/P4iuWX7IWUVF08ojPSS9BerlL
 hfnf/C7Lm69Pb4PlmqlmjbkYf3KyQ0s=
X-Authority-Analysis: v=2.4 cv=YqWa1IYX c=1 sm=1 tr=0 ts=6aafa337 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=DpGDD-vdax4iYkbPwkAA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIwMDEzMSBTYWx0ZWRfX/VqhNjX5YTRp
 iw8IfA3AYgI7/acRsHaexUlW7MRrEKACna4w2qx6N5QVSVNhuB0ThdLglK5KpL50zVds1FhAbdo
 ZfyJReTGwzXvN57pzLXvk6TPllZFE634kHwBT3rt9x5/mUuBpgIJsBtIRqyXSYVTNs/RBb1USz+
 5Hs2QvCAha2H3ZTMzvPe4M8KPoStwdXos3dfbdAAGdER/9Z4FMTr80CFGqX1bMfoQCw4iMT5VEU
 aB91ySsFvChT970qIe2KTAtJFqJU135symLLtsYxrBeyO6UgXRLpK3aWbDw/qVcYJkWs/E+DRd2
 WZePmoKF64ZmNItPxokpXhfF2MCECLt5qemAjrQhvZuvv4OGbBgzJWiK40sTNKd16yavWSKZ0PN
 254eiGeV2o/5N/ljtA6aTLp4Emoe+QKVA0YW3OjWkqcQFbtyBrnEwfoPKN2NaArgP4KH8KIJvhF
 jL0uXHiIQl05nSiRyaQ==
X-Proofpoint-GUID: OhzcYAC15peTmrnUIg_Rqcz7NrYnFwNI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-20_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0 phishscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609200131

Enable camss support on the Nord Ride Embedded board.

Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord-ride-embedded.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts b/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
index 09ee525764ef..674e2093f806 100644
--- a/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
+++ b/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
@@ -366,6 +366,10 @@ vreg_l3l_1p8: ldo3 {
 	};
 };
 
+&camss {
+	status = "okay";
+};
+
 &qupv3_0 {
 	firmware-name = "qcom/nord/qupv3fw.elf";
 
-- 
2.43.0

