Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89DAB238D54
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 02:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792376160; cv=none; b=jkb/IxeKuVlsHvGg4/147Xe4y5hhdlHOmFtv2wtdLFdYgfiy5JBKY2AsfaQWnQwvbXdoY8m3QGsGvHkKGWnNAnACpidsh+JNYS3HeNsEJiKW1VLodxyahaH5aKw9xTJ8K36UfYCBdf+uiGfUkRLRuDBmwVfGYyCzUeyoAb0IfxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792376160; c=relaxed/simple;
	bh=Dp1TMlpdZ+dS91HNECLHkK4AGyB4hgRlbjkwGiarOSQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ATckABn8xWveOvomUS/lhfH3iALUNaMTGvUW1WUmmsrYaCQBNbDW1X9efOfnvo33YFoxaDQanwDo2GMfyfs/+jO5e8pOO+UcbQ00qndzzNuGM+dTjNa34QeNZZoN+6oNl9/uZE6YTjpy+Q4LhqTaizL/IdQVCYUD5v+1KrC8FM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iKwkhejK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UJJ6qYKZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iKwkhejK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UJJ6qYKZ"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J1FIwd1113904
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 02:15:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Z5XVahu8zK0
	MXgLq4fcKODdpjac/qhpvtXBbd9Bo29c=; b=iKwkhejK8co/NAJKei3qD86umom
	OAj3ES4qJgkDtzYhL3VxJRzIKT3JUTDwHTqxy7syhM1msGx6/TOE0eGL2BBQtqFK
	zyO6SC0D6OApzqTWbxivtK74L2NH1QGAXwox5v/ejnvJp4xjW3ETaIVFLxtJ6uKw
	VuO4IpC+Y0eaeP00jpbMfkzAI1mPWci6b1SOq0LMPVh2jjvRnES0XN86zHpFKEPU
	uJFCWAmXxcmQAzbNT0hIVxS+I1cH/SQfqkdpdnmSR9pzlJcRPDGKOSV2emcVbfoc
	k5OXlybQ5ydT+/OaOC8yiO0LeKRoCNhTG88muub2B89+yQ1JvbsIG3axd6g==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hd5ur0hyp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 02:15:58 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-35d4538fd74so6076161eec.1
        for <devicetree@vger.kernel.org>; Sun, 18 Oct 2026 19:15:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792376157; x=1792980957; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z5XVahu8zK0MXgLq4fcKODdpjac/qhpvtXBbd9Bo29c=;
        b=UJJ6qYKZBl7OQmx+uUIavhafc8O42h+Hz7szqnZhPWD7YRr3mglm7WjX3J3PQ+wwlO
         LtCG6qGnH35gxhL4ztjPMXXpaKMW9fhzl9J/iaRGKes95/w1Rqk7v7z+AmE/oLYDN98D
         aPfwCRSLPjNuKusJCptGq1hM0mL7hSd62Lmqod4h0mMOqhif5ulgYgbNzhNkxzM/qrVI
         dpo8FfDFDHARGdWP4nGBHc0yYHtrOcIunuSyt9+J2nvIyOyJIwjz2qi3D5IY4Ukx1mQu
         eN3ea1+8rsWzq+bHRkA01bg/N9tCBw4XOwKnqW14sY4ayhYn055/duRgvzHW7URPU8Q1
         lYJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792376157; x=1792980957;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z5XVahu8zK0MXgLq4fcKODdpjac/qhpvtXBbd9Bo29c=;
        b=TKROT4N7MOtlH00Onue+cOgl+btqc6+BKt8OWoaba5Qp7IRos96S0XCoc1iXp5dWWG
         ZKFwFK18JbHTqOAr7ru1/BSvcQYhWs9SxEDGfg2ygIg82mm1by8eaH/UwEo1JWwZsHIG
         bcC0s8NY6LC4HTaHzrESNBTr80ffEWvO2DqFZG3sgSmS38lGQNs9w/CSES7j1RHKTlQh
         46IZRgh7huW7RmM7/fhBflnyLLeSp1wNApIVXgW5TCafC3wLB4c/CIwWMIJexIiXRCRQ
         KWksDHZiO/caozRpF+IeuinLOmVfbBQuUrIg7nc670KOeCiWRpGtN057R86WTzGJpoO/
         g1AA==
X-Forwarded-Encrypted: i=1; AKwUvBx2/SAkDBqmbIrGSZ4UPeugIdOIrq343ZWFaaDeNLgP2S9FUCwzB6cGrjnzTdusYbN0P6UKICCeC8Nh@vger.kernel.org
X-Gm-Message-State: AFq9FYJedBXqxdQumw9bEYHMGNafhHd7xcWsBbDk0iDSjcMIYdTQF1bm
	HTYYuBS/e+y4o5kif/VDV0huhjGhUcurvrF9scE8y0kHp/rCRqvuBkYXr8HL2AhzPEUutQnfLKA
	lY2INKB/ACktR8ClyJyGSQ1rY0nbS42pQpTrsQSzsE5sVX7yCrHrrSNqaBz4Yhy3Z
X-Gm-Gg: AYBFou3boQcXhWhNsTOBZDE6CrBwOa+y7G2Q2QkWZMD0Lx1HEaNI5Jm1uweWZxpiqaK
	oxpVWUcdLVcIhEFi400YVdwHET9R3/pqcbvSRKjrvfzTsatWVF/5Ra53AcCwql+D+JU1ZfUHJ38
	vKw8yAo78wU00nz4U+aQR386sMsE1P90nRIvwSxKBa/oXv40ya9YR+d0q+vRR/+yF9GINx9ZLJT
	Qjbtsm+gCiwTUF70ROONWSK+K8OD0YGdUD0L6Tbv5TqVGEQhy8sdOugVTTjhcct+DACyiW6+gAk
	Y+QcrRtsUPCJCEABV7pPbQFIiQf6oTwPswKMVUinZxcSe5vLX03LGXi+EcmxOnW4T0kA7i2sby+
	IIxMoAGUAi2zMkx5d1QfKobTBo5LQ/UAJ2jNxuWLzcIlYaG3gDQ==
X-Received: by 2002:a05:7300:ff4a:b0:351:f762:a10c with SMTP id 5a478bee46e88-3619b20edd9mr9199658eec.0.1792376157406;
        Sun, 18 Oct 2026 19:15:57 -0700 (PDT)
X-Received: by 2002:a05:7300:ff4a:b0:351:f762:a10c with SMTP id 5a478bee46e88-3619b20edd9mr9199627eec.0.1792376156877;
        Sun, 18 Oct 2026 19:15:56 -0700 (PDT)
Received: from hu-petche-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3607ee0cab0sm33841550eec.3.2026.10.18.19.15.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 19:15:56 -0700 (PDT)
From: Peter Chen <peter.chen@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Udipto Goswami <udipto.goswami@oss.qualcomm.com>,
        Jack Pham <jack.pham@oss.qualcomm.com>,
        Pratham Pratap <pratham.pratap@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Chen <peter.chen@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v2 1/4] arm64: dts: qcom: glymur: Set snps,resume-hs-terminations for USB controllers
Date: Sun, 18 Oct 2026 19:15:44 -0700
Message-ID: <20261019021547.1694088-2-peter.chen@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261019021547.1694088-1-peter.chen@oss.qualcomm.com>
References: <20261019021547.1694088-1-peter.chen@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDAwOCBTYWx0ZWRfX8s6jaaysbia6
 7caHi2Edkqxb6ujcrPRSJ3vkTpZP1C/GAhh/BJa7zy9DLTj9UlT7CU5TLHwBbp53BbpO0NFzdoL
 3+W2CMoOGLyY4tBh7ZimuuqkBU+410w=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDAwOCBTYWx0ZWRfXxBqh2tm5K4kk
 iqN9q0eVRnlySV6rAf4CJ6Yhzgzx/BYJybQjtPvEJ9inqYERwqjCjkuMnVcIBahzPw1LVw2L1Ht
 5bL1jAJcCuRS4sR9y4l/ZFhkd+hou4d701YxMV24zPk6YNLLCdGjag5r7AfqE9saE82TS1YztRw
 VusQ+cFNSBfbXKjgudpI3uHSjNHpjFF/MsAMQDDiBV3QKvfQeBh6xJCsHRH2uqUFOKgiCehRD1A
 szzxP/+z1qI3To9f251Je0vfUVbFV6uN7mcBsggJ0hal8DQd1EtTBfphUjvVhnJRSm3npkDyevr
 SSJ825Yzwlfdw2KVSfqYv1J5U/ECsaass+DsW5sMtePhgLtAQi9dpwDotTOhgbuplqbFZb2pkpI
 7QNh2Hj3wJQ8sGiZejt0zLm3JiTtYQuozeigolVK97UDHcan2JLMiVKVd5LZg5onhIdCxla2T5n
 H+SaCAEfGVsxYcdRZDw==
X-Proofpoint-ORIG-GUID: VJ2hxH-7SG4zfhe97GUT9eO9Yg-bVUv1
X-Proofpoint-GUID: VJ2hxH-7SG4zfhe97GUT9eO9Yg-bVUv1
X-Authority-Analysis: v=2.4 cv=CP6/zhrD c=1 sm=1 tr=0 ts=6ad57d5e cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=5sioUILVtsypdmoVIHwA:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190008

The DWC3 controllers on Glymur are paired with the M31 eUSB2 PHY.
According to HPG, host-mode USB2 L2/L1 resume with this PHY, GUCTL1[10]
(RESUME_OPMODE_HS_HOST) must be set.

Without this bit setting, USB2 HS device cannot be reset after it is
runtime resumed. For example, after:

  echo on > /sys/bus/usb/devices/1-1/power/control

PORTSC.PR never clears (PORTSC = 0xe11) and the hub driver fails with
"port_wait_reset: err = -16".

Set snps,resume-hs-terminations on all Glymur USB controllers. This
makes dwc3 core set GUCTL1[10] and fixes the issue, tested on Glymur CRD.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Fixes: 4eee57dd4df9 ("arm64: dts: qcom: glymur: Add USB related nodes")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Peter Chen <peter.chen@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index e269ae6e10ea..023a8448449c 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -5544,6 +5544,7 @@ usb_0: usb@a600000 {
 			tx-fifo-resize;
 			snps,dis_u2_susphy_quirk;
 			snps,dis_enblslpm_quirk;
+			snps,resume-hs-terminations;
 
 			usb-role-switch;
 			wakeup-source;
@@ -5620,6 +5621,7 @@ usb_1: usb@a800000 {
 			tx-fifo-resize;
 			snps,dis_u2_susphy_quirk;
 			snps,dis_enblslpm_quirk;
+			snps,resume-hs-terminations;
 
 			usb-role-switch;
 			wakeup-source;
@@ -5696,6 +5698,7 @@ usb_2: usb@a000000 {
 			tx-fifo-resize;
 			snps,dis_u2_susphy_quirk;
 			snps,dis_enblslpm_quirk;
+			snps,resume-hs-terminations;
 
 			usb-role-switch;
 			wakeup-source;
@@ -5783,6 +5786,7 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 			tx-fifo-resize;
 			snps,dis_u2_susphy_quirk;
 			snps,dis_enblslpm_quirk;
+			snps,resume-hs-terminations;
 
 			maximum-speed = "high-speed";
 
@@ -5858,6 +5862,7 @@ usb_mp: usb@a400000 {
 			tx-fifo-resize;
 			snps,dis_u2_susphy_quirk;
 			snps,dis_enblslpm_quirk;
+			snps,resume-hs-terminations;
 
 			dr_mode = "host";
 			wakeup-source;
-- 
2.43.0

