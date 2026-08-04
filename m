Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E74B46A603
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 17:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785865860; cv=none; b=gDw2U5igION5qplDElEhp6X7pfRwjUwhsqtHyvn0d5kKH5jJ+kdJ3oQRUKKGvKVEWyflmkQ6sIckr7KlH5+ph1SIkEwEylnfH1mOn2BxEJdbH+UVnjNtc7fyb3WPuF5J94bLeX5FpiBHHfMhSTpggUxOWJt/6DNxi/k1yn7tR24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785865860; c=relaxed/simple;
	bh=0rw08JsGiL/r7Q3WzWwCBrjpAsuVLUbBRgKV2TN/bck=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Zaqhvy1GqPTxeBJjJfridlgovdmJwugQmAyw/UxM65/5f+ToND6B4AnW1U22uYVRTiJD5EyJI7GkTnh+ikimzWLESEWGOUUZfAx4aWmLymS7PMS3Evdhbdm8zd1p4UQBABQhSQ7Qr1LNKDGcZ2cNIF9nSaqMUnvrmSFqoTqJyu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ORWeJPoM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IeBTV3Zn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ORWeJPoM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IeBTV3Zn"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 674H0Dp9268918
	for <devicetree@vger.kernel.org>; Tue, 4 Aug 2026 17:50:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	e/FB2kx9I7szAacRUGhC1WVT/Af65I0UeWspZWSP7bU=; b=ORWeJPoMLLMepr1s
	6QcDItsrz8IeEeiKKpbYuinRlbUWgarp5PqhYIEXVCdXs4ZL/AAK2zqrcqC0PlPy
	QalvuIo518qoK+vjrPAo7K95YAsTkV9JzGLvLl/EXCcD65DLwpe8yBwPeCbAVdDv
	TO7vD6KL7JuXxythsAfUdxZE4JyD1H1ncmwwQrfaDgkhqpBc6LZenRJMPbaxjyjT
	QPk2XGTV82DSy3bbxluKpLRvQIQeCo1DftwxphQj1Kiii/y6kxWWv2VkYr0Iag3q
	1/Tx8G/5cMZen5yU7oc5GuKK1zpRaThXyvh0cgAxQWYfLVH7ajW46LDR6GaYCmaI
	cAtKqQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fum3nr837-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 04 Aug 2026 17:50:53 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cab048cdb3eso61651a12.0
        for <devicetree@vger.kernel.org>; Tue, 04 Aug 2026 10:50:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785865853; x=1786470653; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e/FB2kx9I7szAacRUGhC1WVT/Af65I0UeWspZWSP7bU=;
        b=IeBTV3ZnsISLfXWNIfXIFuzpVp4yCJFAnkbaqnLADYZ2H+w8W9HLcCrC9Ir88cnRlT
         5Qtc33TeW9Vmw3zeolAYEPa1cGMvkMWRo5iD1UjObWFcFc8WPBL3vJRwCLypVbJEZEH5
         r5TpYAAoGdbRJSO1Qg9cZLh7BsGIJQ+GItc4hogR/C6Kj1a8abhKxvVK+sn/S6ElRSx9
         0b2b8YUbXfzey42x/bIL1/t2pzLgUKfT+xLkyGLzqqANUIagpSZbgc80nL/wr1pWViwU
         NrDScxHBOJM7qHa4zix2Ogsbcw8ryMJid0NDXdWS2PuvQ0BbikeQJAQugWmqCb77m7mn
         MnVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785865853; x=1786470653;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e/FB2kx9I7szAacRUGhC1WVT/Af65I0UeWspZWSP7bU=;
        b=PQnFOlEcDS5RSay7Bx4qmxMUXS6vflWcg55zDRcdAA/lHXwtCsV6THbqw5M/gFKd9g
         mtZL888Vgfm/qy9mo22MHVR2Qb9DpBdweEk4zbRhOkWrOReSpdLJm7OEKlb/Fa2obwo9
         VwSWHa8zNXlEUEyya/UeOLY3zg03JfOebRpTF3D9s1J1WdeCdjI1EuRIBawPEHT+OMmM
         5cRDcJYHvmuW5/1tJ7lK9tTcEFdEou5Fqc/cYtzrc+vHvirQ2z8LnQymYghTtKmEm3qc
         AwiORqCOJ01hoC70EMpgIMfBBQ8BiNG6rfbvRilbk2b4YHaRC/1+cqusNsaTkQHYszAD
         QOTA==
X-Forwarded-Encrypted: i=1; AHgh+RqetdGVhLFPTwMYSrdva3WWSGahxr7J6E3HtOsimoVZnT90Lg/xwfZVDpYA1xe3Ey1Y9r8kI14WqcFp@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0E70tQQ3kAufTTa04fPe28vhUu9Ls3XBVNqaGVJvxhoA3zJod
	pL9WaqfNtg88cxtPZcKfD13UqXb/ace8iVfsLGGpWVpqVXnp0MpSNYIs8wHk0Ji9LRQ1HHR1gtB
	Cs+FVsqk2NJ3oJOJhMAOBL4hbmh+t1G8mF31LOeEeaJsffqsmSlDSq24kfC5s1d9h
X-Gm-Gg: AR+sD11/cv+RoOA4SylcA1TT9BrHYwaJH8pOyUcLaeMrjwFrwQ4OMibc7PFMbhERQWT
	2vkjCfYH1xj1xUfvuvdZhxhYvjxL0ETO/8jg0SYusUaRxNmyJowq013GRi4L5JhP4SWJuvG3SkS
	VUlbJsbCvZuLKwoM/vlDBWC4w/VuPkkbTrWFuy6hlOuzmXJZP+TvdPEyEQPmGOVctP6uixbf8KX
	bVhknfYqxT0CxYqWKSk9ODTzqmivgVPfJN2E9b79UxMNHEhjHP4L4Z50LeSq3F6ySSdCYIrNTA4
	9MjekWFvtMZrSvKLhIt7vPuw5Q2mR45jOfyExi7Wxb3jY2b6WqgZ32ldapBV2mSYf4Qr1wjTmAe
	My93RrWAusshkGgydY04BrN8H
X-Received: by 2002:a05:6a21:a517:b0:3c3:bd32:4587 with SMTP id adf61e73a8af0-3cb85fbda24mr449927637.44.1785865852802;
        Tue, 04 Aug 2026 10:50:52 -0700 (PDT)
X-Received: by 2002:a05:6a21:a517:b0:3c3:bd32:4587 with SMTP id adf61e73a8af0-3cb85fbda24mr449891637.44.1785865852402;
        Tue, 04 Aug 2026 10:50:52 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31586790e21sm7052108eec.24.2026.08.04.10.50.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 10:50:52 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Tue, 04 Aug 2026 23:20:16 +0530
Subject: [PATCH v9 03/10] arm64: dts: qcom: milos: Add power-domains for
 camcc and videocc
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260804-eliza-mm-cc-v9-v9-3-39067760dc3c@oss.qualcomm.com>
References: <20260804-eliza-mm-cc-v9-v9-0-39067760dc3c@oss.qualcomm.com>
In-Reply-To: <20260804-eliza-mm-cc-v9-v9-0-39067760dc3c@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDE0NCBTYWx0ZWRfX0Kp/BJzwqI7Y
 R2ciV7jBRKLcd58Tns9OieLG6AmJsRcyumnKkARoea/nMe5kHaAe6qQiXTVWkat/gLLy15T2A0g
 yyuwRobXbexqWSusT6AH65LFXDhGvLXQw/vraPs2xAdrQuq0A0J9KcXj/HXQnxcRHgH60O4g0+p
 1ShhUsZjzlSNn80f4Mn2fa9j9su2iD6ASV2qD063K26THydHX/IEeP2bE2qMWQSTFNUk6eC27Hp
 QWG3Cu7j7vCogOdM0NaqtaeLgFs6o7yU8fDRtCcc5FvhF3CIIKvjt6nigMt5l62YgHLMJ2eXAvv
 UT1CNdcdKBIZq3AN3OK9PtDUz8iTLH9NImTgt2DxMKOb5H7n9Y5URluz/la8QsIvINAlcu3ESc6
 hbvrnzd424gV0ZBbDtev9eJPMziT7qxbztEYWhP1wlPnRZ7+paC8TxslWNv0FSmoMcUkTyUWbgY
 NF5el7tBDm4fF++jaZg==
X-Authority-Analysis: v=2.4 cv=AZqB2XXG c=1 sm=1 tr=0 ts=6a72267d cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=zrNp7rCLQDew2w7GYOsA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: EKhiEGiwcsGKF6ZhIy7SDn0Ng_ehCDkg
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDE0NCBTYWx0ZWRfX92rcHtF3L5hK
 IVNe7kALvynI/xc1O1OOVrmLpcvL9x+RFdbCQFss3T4TE/GfHYeXhOMy683KJ2HoqfEd4HTHEK/
 PohjY5st9hQSzlrDCoydkv0nugBSTKQ=
X-Proofpoint-GUID: EKhiEGiwcsGKF6ZhIy7SDn0Ng_ehCDkg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_03,2026-08-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=0
 suspectscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608040144

The Milos camera and video clock controllers operate on the CX and MX
power rails, and require these power domains along with their
associated performance state votes to be specified for accessing the
clock controller and its GDSC. Add the 'power-domains' and
'required-opps' properties to the camcc and videocc nodes.

Fixes: d9d59d105f98 ("arm64: dts: qcom: Add initial Milos dtsi")
Reviewed-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/milos.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/milos.dtsi b/arch/arm64/boot/dts/qcom/milos.dtsi
index aad8bf6789162f5dcabbb7d4a8efe180f86d4b46..f3af1d759e09837de457522af47c74431e8d3fdc 100644
--- a/arch/arm64/boot/dts/qcom/milos.dtsi
+++ b/arch/arm64/boot/dts/qcom/milos.dtsi
@@ -1949,6 +1949,11 @@ videocc: clock-controller@aaf0000 {
 				 <&sleep_clk>,
 				 <&gcc GCC_VIDEO_AHB_CLK>;
 
+			power-domains = <&rpmhpd RPMHPD_CX>,
+				<&rpmhpd RPMHPD_MX>;
+			required-opps = <&rpmhpd_opp_low_svs>,
+				<&rpmhpd_opp_low_svs>;
+
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;
@@ -2031,6 +2036,11 @@ camcc: clock-controller@adb0000 {
 			interconnects = <&mmss_noc MASTER_CAMNOC_HF QCOM_ICC_TAG_ALWAYS
 					 &mmss_noc SLAVE_MNOC_HF_MEM_NOC QCOM_ICC_TAG_ALWAYS>;
 
+			power-domains = <&rpmhpd RPMHPD_CX>,
+				<&rpmhpd RPMHPD_MX>;
+			required-opps = <&rpmhpd_opp_low_svs>,
+				<&rpmhpd_opp_low_svs>;
+
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;

-- 
2.34.1

