Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C26C836923B
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 06:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789971611; cv=none; b=OZCMTnJYsb+YLMw/ZWu2drTiMtd5zosSzI1voc6MBnhTi6EIPU1ZLTg2OvliURvrF76yXn8KUNEly4i/YokUqgUEg35r92S1KAQzrysE/QBXBWiUlYzMhnWjP9lLAYX5AKvYiOzNwiimWWeJUFn1O6J555AWkhdEyjmOWp1wWYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789971611; c=relaxed/simple;
	bh=nub8YchaXe+fEs7vARMi1DJduhsG6p4g9wlPVkeXOik=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DmHzd2mfrgzZV7/u2ZwyxBHLf2DCJCRGhqD6NtUOe2usAf3/BmbPWY5o7tZGSkA5aylUkv8ISWGBASrWXUcjzWdvaA14upSvgMkFKcW39N0XInoukBsXm7HsA2RI2C816Q7mAi5lEJDhMX7DgJfe2cWAFcOPxKJvTvBz7KOOQ1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UbLFOLgS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TYi+DQu1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UbLFOLgS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TYi+DQu1"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68L3Zats291112
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 06:20:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mUv4XNsYY7RWg/oB9/eJvRwSDlNc6B92miYnzdDmack=; b=UbLFOLgS8rjw6YAb
	jwHQoLNsga5DeNrRWQgQ8MrdIQMcgn40m+iWRW/5XMccD5lkH/LVrs8R2dPpRcxd
	Ga7ixO5JsvRigkrIr0ms583AIk0IY/g+DU1F3NtQ+Sflu1lXmj9fOQM3UceUUFKO
	Z4gGovv+xURURecGryr0RM5PiwVZZEz9j0AWkXMWVnjexU8PmLDMbm2hZQGDi2LW
	ECqjq2N7T49t4fijc6KLBH57tKaCrTxzGAYHPKwtDl2mgu61anhKWXqwjyDfI1al
	SOsrklJj4xB05m6ovrVYgvEuEBkZ6kDDTsG3tqKZyDw+29uvw5K0Jboivpeh+dOp
	UvKiuA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gsjfumyy7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 06:20:08 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-862a0aa7d2aso4351027b3a.1
        for <devicetree@vger.kernel.org>; Sun, 20 Sep 2026 23:20:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789971608; x=1790576408; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mUv4XNsYY7RWg/oB9/eJvRwSDlNc6B92miYnzdDmack=;
        b=TYi+DQu1TOaf5GjM6n6xAp7+VlpEKkwdFQUBpmP753FbmPMsYX+vg17hsqrexYHdqd
         IcS9p0QRioPDaw8s7tk5chVHbRvs4omOp7wHHtIzpvJalI6/NSKEsJuvsJLKN2gq0Lu7
         lG8IZjcle+7EfUPN4xe3r+uUhRleNju/ecQc1SP+5+1Lwxr1hhbWN3aOeux1FsnZd2zB
         Csbl8UgZmBczbs3R++13lyRvihycBbj2Ggsdqj5AiAjX2Bqd6I9+8beOFHPyRgz5EGQr
         2+m1ATf8GxejeUl7Px4XfoqAWJehNRLIpCTFw7eyQmbRcw/NIQQ1Ss8SmClnceTARgSv
         Z6SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789971608; x=1790576408;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mUv4XNsYY7RWg/oB9/eJvRwSDlNc6B92miYnzdDmack=;
        b=WDzjxUtDfctrVKig2Uj+ylPYGaR/Jj95VB0jYxY66wRdSE/KzkND0VXwfKISe34LAL
         FSeLuAae/O5lhkoBhAT292yOl/lZgJRXt4IFgoOEf77zBKkdGi82b2FXCqGXuubGhyPc
         P9dRbztvKxjbELV+Zrd+DFr0nsqT/yFBwpiVvfco9ACXtbyp+yiS7NRvLDSaR2U6d3cG
         M9eprcFaM1fZRVaMT1BZbRZuRSO5PYVEVOtjdbA3hXNRyWdfA+TZybL9crSBLibAt3qc
         MxBpk+QqQR6hadRfKYtcgUcPDgiSdjCumMKwETTgAcJYCy32S3WF0PB5jVIuPW9J1Vy3
         BjmQ==
X-Forwarded-Encrypted: i=1; AKwUvBw6aBxO6K28HrwmkS1waX2+7Eme0p0/hE2knr2rRuaicRe+ASuL1+bYzsmPjTWNnb5Y+558yfISC9cl@vger.kernel.org
X-Gm-Message-State: AFuF++mcJ3Tv58B2f92aipJ7EHgzhBTGVchkl7UJ/fMBg91vxN8XJWiT
	dIa9vV5zd/fi6khAwX+MENUPGr/wxDVg0gQ3wpCrfeLPRZRvXV+q7oSXbbscGfu8Fm7828S92iS
	j2fJDiAWuqH0Io5DyQi6x2IJBmuohTIXNAcQqn5Y+rOLNQPddyUq7OmoBpYuFrBxb
X-Gm-Gg: AYBFou215svKPt2A7JjqSctch1dzsBspgiucxDJ9PAdcRMGhIjzm2kZj7ItzBhPuOYy
	PVgDkt280qky2Ov+Czqq90pwXWQGfWiI+3wyXEbP4XvwApQOLOO9J2mK/9tdqOx8FDg3L26VBVj
	1VNjQgnuUNRFADeCjKQ0C7xfDrQ2O8vaN1HEjT69Q7tRmxW9k1tsyw7KxME4zkeobE6IsWTGcyc
	V9uZu6VOY90qGB6LpK8j1o0YTwrKWWhVzWgqy4PRhFBwicrkoKeU5kpAhto134pzJRqY2wT+H5+
	OL4zgRyhB2W4uvAP/NXJsCODLpIlhzGiCwHCgKxv/8kG7Ly+GkuF6aKZLe7u3/d5KfnBDKLGroO
	u/WyRcTTs8uKDPVqemOBKTBKeyt1opVIuuinRqVF6dKMFSnbj1mboNPR8PKDuFM9aTOeoyMJBS2
	CPf1m/fUwz1e+vMKXHN4edKzm9QqmQL7Pynw==
X-Received: by 2002:a05:6a20:cd95:b0:3dd:85a9:55b6 with SMTP id adf61e73a8af0-3dd8c5d2212mr15954741637.33.1789971607728;
        Sun, 20 Sep 2026 23:20:07 -0700 (PDT)
X-Received: by 2002:a05:6a20:cd95:b0:3dd:85a9:55b6 with SMTP id adf61e73a8af0-3dd8c5d2212mr15954699637.33.1789971607300;
        Sun, 20 Sep 2026 23:20:07 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c331d3f2csm14091444eec.28.2026.09.20.23.20.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 23:20:06 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 11:49:36 +0530
Subject: [PATCH 03/11] clk: qcom: ipq5210: add 24MHz rate for USB UTMI
 clock
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-ipq_clk_changes-v1-3-d242e3d49648@oss.qualcomm.com>
References: <20260921-ipq_clk_changes-v1-0-d242e3d49648@oss.qualcomm.com>
In-Reply-To: <20260921-ipq_clk_changes-v1-0-d242e3d49648@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Varadarajan Narayanan <quic_varada@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>,
        Sricharan Ramabadhran <quic_srichara@quicinc.com>,
        Kathiravan T <quic_kathirav@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDA4OSBTYWx0ZWRfXzdhntIMuENwd
 Gw0Qku2u042GrmgjXo85xM3mcchHBWIGSM7h0cnza6bslg5jg/Mjn5bJCCz+Epb9yb3fbWMcwKj
 THYtW3Hwxj4FPHC6NGFOITpUTbyc/WY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDA4OSBTYWx0ZWRfX0cWwcpfd3Ml6
 B0yaokA3rE4j343ngXRG7rL2DnatpZKIa4P8mPNf5Ubt0Z3753IPz3tdzA4DYyCe1sTqJ8M1YJq
 H03bNrvwt3URPH5kVEQC4omRaQl+b/fp/SADrqXgiaLeFMjj1+8KIE6XmgkvWOjeOSe7ZymLaps
 KuGPPulZyvU/y2yY3POLKdo58WyfPRHXT+p1euiujBanNDzg0zFTn4fljgBx8smvgIc1W3lQ8PH
 cDND3P7e2R5hHP/CeZN3/9m6HDkbEVEyxwtxuLC6N7kcvSMq3uUELVGNlZ2gKwW6sxQVzIm//Xc
 4YBiyefxfzZ3Mj6E9cF3ML5KKXScK6nAhlYlbCeW4ivZXq8r27QGqDXrD7NOhh3EqNYpSxoEAIG
 H7EzlJMEsBbbnTPXJE4Dtg399obhimD8+2gC94gddYSQb0CV5RORuQnEa2n3SDKS04eAw6TgJH6
 q1Eia5IWFXJFJnHIhMA==
X-Proofpoint-ORIG-GUID: K5y89bq46Hzc7bYmQmDaXa5gRn1urKVv
X-Proofpoint-GUID: K5y89bq46Hzc7bYmQmDaXa5gRn1urKVv
X-Authority-Analysis: v=2.4 cv=QKv91QLL c=1 sm=1 tr=0 ts=6ab0cc98 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=T_jLbkAMJ8GdCbUqRukA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 malwarescore=0 spamscore=0 bulkscore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609210089

The USB UTMI reference clock must operate at 24 MHz, as recommended
by the hardware team, for reliable USB operation.

Validation showed that USB 3.2 hub enumeration with USB 2.0 devices
fails when the UTMI reference clock is not configured to the required
24 MHz rate. Configuring the UTMI reference clock to 24 MHz to resolve
the enumeration failure and ensure successful device detection.

Cc: stable@vger.kernel.org
Fixes: 844be6e24afd ("clk: qcom: add Global Clock controller (GCC) driver for IPQ5210 SoC")
Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-ipq5210.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gcc-ipq5210.c b/drivers/clk/qcom/gcc-ipq5210.c
index 3a786a21bdff..76adfa8bf2ad 100644
--- a/drivers/clk/qcom/gcc-ipq5210.c
+++ b/drivers/clk/qcom/gcc-ipq5210.c
@@ -716,6 +716,7 @@ static struct clk_rcg2 gcc_usb0_master_clk_src = {
 };
 
 static const struct freq_tbl ftbl_gcc_usb0_mock_utmi_clk_src[] = {
+	F(24000000, P_XO, 1, 0, 0),
 	F(60000000, P_GPLL4_OUT_AUX, 10, 1, 2),
 	{ }
 };

-- 
2.34.1

