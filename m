Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794987923;
	b=OG+X0sFTWRoVzRSAumTBlps+Ki7jpUFvH5vhn8G+p3d7CFMLMfh+obY+rqAcoiM+XEZp
	 h3jRCRpIOn1am0S26dy2hlXu+sMGCArqcLUwJD13O8noqtuzOBHGkLm4dHLs2XHknMO7p
	 rx5+4ErCVX4CrRaZu4asB5Ow3OePdG3DT2dDUGHs7smgHmgRWeUPQ9Ub4Cj/5+JpSYBFU
	 uq/0UUN2kT8Arzk2VsX9YFH6hrcqWxbZkeys2o8YdokbuvXUe1EG1IXu3MX0HwEq6J2Xc
	 ZkfU0BAZhgVQv0wDmRvUaDRry/hStkM+b/H43xb9L9ZitZxFGF0KiHWt0AIQvux9NuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794987923;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=y3+vDVO7nczkZMtqsoDVAO3WySFeNCsHYRKhCVZ0MLo=;
	b=V/tJOVSvQvKS6z42eklhDkmRuxSW3jpRF6EJ9K1cRZicJCXUmLoBIi0NDKGClxKzNcm8
	 2JbEzodb+yQDlLxrfxMvkYRxrDLu829gwMpLjH1Ovv+BRmYe1qFWYp0/zqsm9jbvb/zvU
	 d17VCR1GEKybDLLL5YYa0LyBq5U7HEig5fMaTMkmcqEV/gzPYmvEVeio4z9/Rb8QG1OgZ
	 /oOOmZKLek5KYrFWjQgaADtFrxG/nfkMaAs8uFspiqk9fuluMqLsP1+HkV56OWT3nmd3P
	 irSV2nzBqaGS7BG3ZlchshlX9QMTF+YhgXsv0iKf0QMGr2Ci34ARlbqhcbeBUdO0hyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=n+fy6kSl;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Xz7fDdmC;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BF5F606A32F
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 07:45:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7BF5F606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=n+fy6kSl;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Xz7fDdmC
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2V15f3121825
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 07:45:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	y3+vDVO7nczkZMtqsoDVAO3WySFeNCsHYRKhCVZ0MLo=; b=n+fy6kSlAp+Qpq6q
	hl5bpyy6cMt6ViMoQJUsMHvRXU4/qfxwimtvBG6qIQXVKx4cQaLwZh7WJ30jzp9Q
	OoAFyEGIeIKB+WpybCAx7ydQtKAIt9iT2ZXJSaBcaGebZe9mtCwSeTaWGzWfqwSH
	AGnd+CEWiy0dgNiWcyL4r+FNKkGs2VQJ7O/A9RZ77L5Sd/MVEKviY8HEoUm1gX+M
	CR93ijddScY30tWT6PsHtB/3s9ehdgHyVYrR41onVmpDsqDYMzGaIHpgZNQwZJJ6
	S8pU5bzLEZAusELHxVSKN2E4r6kKvkEKeyKFteL72anrW5+a6xcR00Tg1DvVCuzV
	ZegaxA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv9hubv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 07:45:21 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f1f2fafeaso101544485a.2
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 23:45:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794987921; x=1795592721; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y3+vDVO7nczkZMtqsoDVAO3WySFeNCsHYRKhCVZ0MLo=;
        b=Xz7fDdmCFtMBKePfbig53C7bnJbiX24Uzjw/CL+hpPXHYn68UkuGlUFSux+kAT/rKN
         uS8vUBsuPPIg0+bgroZJT5ZVIldSER4KU6Z+5LxdsOfkAjUuO022oGA1KC+w7i3e28Es
         SnNTwDvxPNugfB+MgzyNivlRC83C7Low2Fgr5WGV3NUy8nUmhXs2aq1VXwhT8iQMpNcU
         /ORXfmUXn+7WYG63Cv8lCJApXG6ZKZDn27R2iucSW5wTuWiGOR0xCDO34KUYCsFoiofh
         dVRk1RjRJYQGerxK/TVv3GbRMpnaer4c24RSv96mSS519L54YQd7GlJawV4g8pYK4FG/
         LQag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794987921; x=1795592721;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y3+vDVO7nczkZMtqsoDVAO3WySFeNCsHYRKhCVZ0MLo=;
        b=yc231Mwbj9fVlUXclswMP1hN1OuQhw6uRcviInhy5q5IEyH20SVPCHggEBK5iQ9zuT
         X77uLp+YWYipQmbwnkL5RKhR/xaF/BEyb5ZkxQD6dig0wFTTJ9fxIq2xu4DPoAmC68dv
         F7ioEXBCD1olZSd3maInQ63CucwkoAQVjN+RNoZJDd+xsceVk6UZoHon8QqhLULLxhnM
         Jb40aWOKIhLM4HgDIi64FWuNrmwpbmEsFMXYkX5sepHjSRHUURIIPKdA1xmcBZAozfBE
         PQ/LbaRKFnENWmu7fV7D/qM0T269WNz6kcOrAr64quwJ0EVVpp7fFZW2/jZwE26zd63w
         DfVQ==
X-Forwarded-Encrypted: i=1; AL+hErHmdVIqRqz822rtJvhy48n+KO1ajVz0Xv1im/q+ykYqvjuUdMpxgjwcUKzQd2D1XlkD0jVpNbl3fkk1@vger.kernel.org
X-Gm-Message-State: APuU4Z9cJnK2AGYzoj3mM6hkjNEjWaArKaLA9kBKYAJLdb7tH40dQgVS
	pXHUZvGstDp/M4cR1WyiTUkO7yWfP2i3JiZhJcQGEIEHwVPtjfOnSomc4BSfFR1yhJhM1diiSpi
	JpDVV3Olyq7NaOl97ZEwrz4Xe+PGhLCotw1SFxJUwm5BrcVRRvWCkwoKbVFVUH0k9
X-Gm-Gg: AYBFou2gtYtcUjp5Ti3yqigIL0iDqRvdM7VCQwoQWKR4iWH5Mch5BXxhYcFkPtKZLH+
	jUnseST+EtWTmvu4VQCb11H5b6IKZjw9uZA6nd96nCCHixpuJxw6XWz/zsJ/CSpukmowBkCwOse
	Sjx+2SnLKXx2m32Y3fIB4/LBAjJrablSL3ZdnJozkdHmJRXi1b8N+1DKKYMhVHPfCJgmA5j8Edl
	aNxLb8iC+cs1Cwqz9qycEDFB+7woYNeTzIsv/oh5UdNlSHHYwfLlYq6M6RZot4yPwDQb3kTT4hE
	BHXopB/eafVC9DrvMqcpdP9c7tZ4ubLMMw0y46SUsnR2Qn0682oTHu5cuhZdCRQvmyiR82slptt
	M/N7qJ+dvoA/4YsIpYdtF/+LTgtzh4fA2neonDdikqqhMIfIw79f6jVD+Ws+B0BZZf6AklSEfBD
	WKm9RDlLmYMVMIpnZTDC3cRPyXB0HQ+A0YPfCGITLm
X-Received: by 2002:a05:620a:4556:b0:944:192:85f1 with SMTP id af79cd13be357-949995c61e0mr375419785a.48.1794987920728;
        Tue, 17 Nov 2026 23:45:20 -0800 (PST)
X-Received: by 2002:a05:620a:4556:b0:944:192:85f1 with SMTP id af79cd13be357-949995c61e0mr375417385a.48.1794987920242;
        Tue, 17 Nov 2026 23:45:20 -0800 (PST)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9499b7b8444sm119359085a.31.2026.11.17.23.45.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 23:45:19 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 15:45:05 +0800
Subject: [PATCH 1/4] clk: qcom: camcc-sm8750: Declare icc path dependency
 for TITAN_TOP_GDSC
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261118-camcc-fix-v1-1-279d269e343b@oss.qualcomm.com>
References: <20261118-camcc-fix-v1-0-279d269e343b@oss.qualcomm.com>
In-Reply-To: <20261118-camcc-fix-v1-0-279d269e343b@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794987910; l=1293;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=79IVsXZe4aT/7ptWNdZZNaBzR5Xk7vaBEe1jnE3m98M=;
 b=Z5efrj+oMIDOmtqyXtESvKHicOBB40oIrri7Qja/vMJb8yu2klcQ2oTmlLcnutvKXS7fjGc9c
 Y3dRuCZ7itcAMWRSDdKW1ZPtQ/iu3/w/1mBNcTzkiSvQbPHi1Idu9zE
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-GUID: _-A6XIQ5HaU_tNVvMvxVC2fZcAZRNVXR
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAzMCBTYWx0ZWRfX4NxsB7wLGN6i
 akjhDU0jl2hQHbsJNDEf/ZsxYP6/kP0Ty8rGK96vjOuQo9xDIjVEqg+oHgBfs5YgfKawgIntpDG
 zXQdpdPrMc18kvQyGVamc21liTa1CvA=
X-Proofpoint-ORIG-GUID: _-A6XIQ5HaU_tNVvMvxVC2fZcAZRNVXR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAzMCBTYWx0ZWRfX28W21vPjOjQs
 aw8+QVYE5PO5Kq+ejsIoSimm3XNkRntmEv8wDyxJICjRO9aSUJUQr7z5H7Q7vWEDwPfWoPlmJyk
 +MrzDDw2lTTPWu91fv6nvGftN6097hM2uLKLORAzGzO2qAX70f5WE0aaJ0B07d+VDlQOrW/ztY8
 IREVRdysSIM9gILb2pgx+0eBKDSr4FLk5op7lipQX+RM4shY3UV7b7iMep/L56N49OpZtrdAzKX
 cvrri/Fgycwz09ey3r5wOWz/AS+P3cOAilI3H35tDRC25DsZojxnGdf/X+m/OCfMGOktLWrKGyk
 KVn61we/ilgNRCU12qBe7LxFssmMPuJl1Tm/y9l6t9sQn423CYMM0VuRcSsoUoVsZmk0pZF6rD1
 W4rVtsJXc9hRLDPuKcV6xZ4HeaonxC1RFyfdl9ccX0GWABBaHZITXOXg+UsyNH6RIThKswhlNQ6
 QLT1Dyl2gisioojdbWw==
X-Authority-Analysis: v=2.4 cv=RYIFmFtv c=1 sm=1 tr=0 ts=6afd5791 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=schgL9W0h6o9fvJNLFgA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 adultscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180030

The TITAN_TOP GDSC hosts the camera NoC (camnoc). If MMNOC is left
without any client vote while TITAN_TOP is still on, MMNOC attempts a
power collapse while camnoc may still be active (QACTIVE high). The
power collapse then gets stuck, and so does the MMNOC BCM, so any later
bandwidth request through it times out in RPMh:

  Error sending AMC RPMH requests (-110)

Declare the interconnect path for TITAN_TOP_GDSC, so that MMNOC is kept
voted for as long as the GDSC is on.

Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 drivers/clk/qcom/camcc-sm8750.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/clk/qcom/camcc-sm8750.c b/drivers/clk/qcom/camcc-sm8750.c
index 4dac298f06b188e78a61121bc9452f7246e59c56..96a2a50a02bbfcc3730bf6737df7bf09d7c09fec 100644
--- a/drivers/clk/qcom/camcc-sm8750.c
+++ b/drivers/clk/qcom/camcc-sm8750.c
@@ -25,6 +25,10 @@ enum {
 	DT_SLEEP_CLK,
 };
 
+enum {
+	DT_ICC_TOP_GDSC,
+};
+
 enum {
 	P_BI_TCXO,
 	P_BI_TCXO_AO,
@@ -2432,6 +2436,8 @@ static struct gdsc cam_cc_titan_top_gdsc = {
 	},
 	.pwrsts = PWRSTS_OFF_ON,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
+	.needs_icc = true,
+	.icc_path_index = DT_ICC_TOP_GDSC,
 };
 
 static struct gdsc cam_cc_ipe_0_gdsc = {

-- 
2.34.1

