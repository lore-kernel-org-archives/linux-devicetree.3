Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F05146D2CC
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 07:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788249361; cv=none; b=nguqeUS/Tw8NGZu6NLUTMF9P6Ww6y4qZZ0uoVz4dLR2VrrsOu+s4rESgGFvEpEIbS6GV3nWlkU6H943/vWdfb+Iyk0kN9Nqn+b+veXt2B1ptnhia1IYixy/mONJRmgbVO0zwgbkd12qoxAc0RTQdbFmERzM/dh08v/SVQHimsYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788249361; c=relaxed/simple;
	bh=6GKN2yLKizVj79f/0u/7sSHvo/RwDr913ezSDMHaBh4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HpZQgr+HbkI9JotJJpyJ3o7cqhIwZue8bKesomWfGatzmx6Js8SKMyTo/dpPFCxakvtt8T4RTerR8L2ecXEAKVWcCyEKP6oEz8J9XK+Rkz1JhYSgL/u4D3jNfXW1xvd3dxtSF2ZpAShsgprjy8DPUp+tmw/Cu1uQWRgJ7ywN9Ns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PuYvifYi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jvsulCMe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PuYvifYi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jvsulCMe"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68179JNb1709562
	for <devicetree@vger.kernel.org>; Tue, 1 Sep 2026 07:55:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=JHEwpkm2mwC
	kiN9KDQARjnU/8WkGNZroifhSu4p4+NE=; b=PuYvifYiqORpcVOaCSPPhhGVjfa
	iffe8+vioi14egcSZ2j71rsLpGWPxbgVANfq647k8G5+3B2vT11pbC2JAsteqn9o
	65ZYWCaTyWP/paYmelnb8AXf1zFvcXpsItcu0NNhYOOy6uks+wwe7K52SO2oe/4c
	Ngd8OsA8CH4+6Ihj8scONQQirLlq9jTE2h2kzQRlJl6PfxkIFdqNO6xXbNxwgxPs
	bU46sO9zpE1cb9F62zNyPIkCIJkbixN0+aUHkNa2QZCdKo9h7I59ufYF672epM2h
	BdvNpdByh22RKV0RNjArQQxN+GStEPRNj2o0qvSyOCGkXxTlyM4BE3OyBUw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdp8fs438-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 01 Sep 2026 07:55:58 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-385d2703b64so856277a91.1
        for <devicetree@vger.kernel.org>; Tue, 01 Sep 2026 00:55:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788249357; x=1788854157; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JHEwpkm2mwCkiN9KDQARjnU/8WkGNZroifhSu4p4+NE=;
        b=jvsulCMe9z+HAN115a8MhA0sJEUBfi+4/ALqqiMvAPF/Q9Z+YgluP91LiJX3NRRa9A
         PuVAOCoyXSHAsV+7pfWLSkMOEp19Tff/QXTzn22Fns+vizy9wxe+2UifsCkvy8kQrMQV
         lKDFDPg1nRCUZwOTaA6G0icHZa8I7qJVwTLlgX/hWNS6bc96w62PGSr5CLsHjzZg328e
         KOr8hr8oymAigawdOgK5AVYIS8G+JiwZgBVl4JqjENYhEiqGZMe47YmPjwqguswWoAXN
         sz3grcf72dtL3U5BHEn9m7JfFXGgciAVcuz10CGYfc4wWHTw6OkRRI0Z17jDcH9AinQ4
         YErQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788249357; x=1788854157;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JHEwpkm2mwCkiN9KDQARjnU/8WkGNZroifhSu4p4+NE=;
        b=jDu2K+0ibh3TIn5mwBnHyrRAoBpW5EavDnYxQBuIkVEkzPx06LaSgNGFuRYie5WtXd
         xDR7t1oWZz0MQr8ehTMnwvCWvtjNBeiFbaP1lemwTrSDP2pjaV7aLJyrsebwoGeg/+zJ
         JdgOz4BYR4IXNePJbRCQxlWWaCyHydYW1qER3K3lygrPdjrkZOByS0LpVdAYtELB2kT0
         r5XNWs4sTvQnp44k++5mo4zHz/MxFGSI98ZjK9emDS7XFyCEGTMu4lwDy13P7vv3V3SU
         WOgHLdeuJhLEgZ7cgUmqmPXro/v9iDGVmQSq0o1+BIlGOpQqAdp4QiLFA5ncfb3UEz3/
         JuyA==
X-Forwarded-Encrypted: i=1; AKwUvBzjtfzZg/XSDkba/6gSI8Y69PHDkbdRQrHyMR6vpSlyf0VWJnPiNdvT2YqxlvlK/2pRcpCVp66RMqbG@vger.kernel.org
X-Gm-Message-State: AFuF++lGs+uZSkHwcsFUFGIJtN5Q22Ms4DVdcXkxXseAWWt+mGeB1Ox6
	oxACFsveNSIzhk1SpHtfaMm8S5OON0XygBNv9F5DOhbsZCmjooUobmnXC0XF7mjiDTIG8H/5v+5
	uxuy+uh69odT5E9qDeX7XijWXi9Mi8OJo3A2FiXWEilvfO9cTSc1XNuAHnVE4K1Rb
X-Gm-Gg: AYBFou12zsGsUG9VIQIxQsbY0AAQppUdJXTcEgH9CAm4TW+YfCkX8BMSJvm5x01IoYC
	ykG7e4ztnkj9lGsxyexY6On0IMHgmD6dGesdNm/CgGI8zo8GEzS1BAdJDJ/R2X/1D0lNzCNym6A
	mf+ekAImX//jrkleKl/ymcB9MxQ1ETs45Uq/gsFZ/SOcz9RJa5rZVtj4HSlpBUDqv/VcXv/23qD
	M6bHxJn3nZyifH5zNu/y/OhICg6dfIlChBDE216FDfZ+fuGR+86zFFBby7hG6a+9yUlhN9TrxDq
	YzTEJOlpmpEjiaI/0DEADjDefzK0Hz9I7qVZAP6M0uhu5M7042Zo8sM5qs6QLbloaVOuQ95FX3g
	XImZJzpj3e/JixNUMQPxqCTIhpuOGnmWWc3Umg/8qquUJuQ==
X-Received: by 2002:a17:90b:17c6:b0:398:c6e1:dceb with SMTP id 98e67ed59e1d1-3990f757be8mr3582351a91.9.1788249357254;
        Tue, 01 Sep 2026 00:55:57 -0700 (PDT)
X-Received: by 2002:a17:90b:17c6:b0:398:c6e1:dceb with SMTP id 98e67ed59e1d1-3990f757be8mr3582302a91.9.1788249356703;
        Tue, 01 Sep 2026 00:55:56 -0700 (PDT)
Received: from hu-liuxin-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-142e0d2e465sm54873262c88.4.2026.09.01.00.55.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 00:55:55 -0700 (PDT)
From: Xin Liu <xin.liu@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@oss.qualcomm.com,
        xin.liu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        jie.gan@oss.qualcomm.com
Subject: [PATCH v3 2/2] arm64: dts: qcom: purwa: Add PSCI SYSTEM_RESET2 types
Date: Tue,  1 Sep 2026 00:55:46 -0700
Message-ID: <20260901075552.3558150-3-xin.liu@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260901075552.3558150-1-xin.liu@oss.qualcomm.com>
References: <20260901075552.3558150-1-xin.liu@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: CAPuYNNdWGHeMwzkXe_emwJ-GWvvPAND
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA2OSBTYWx0ZWRfXxnc3AjDpAxEz
 2KC+HgYgAJYiktYAOfgVFkFnF827XhoN1UMvpfowf+Cx2PrdondRY7QvQH4Uidoh/6Qj+AuMcJZ
 XY34GJDvv+aNo9x6gi/DCic1wzewMLc=
X-Proofpoint-ORIG-GUID: CAPuYNNdWGHeMwzkXe_emwJ-GWvvPAND
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA2OSBTYWx0ZWRfX3V8EtjzHdtRN
 P4FOGCgTnsw3JuDDJf2MRRzLF53DfpTzoWR+SffrcYnrPUE2i1Lr2ybqtU5QM3rRyoDWaEnk+ZZ
 d23JE8kXXW9f7yVkhoFpXoFl7dcu37KDqq/MNHX1+ROwqbyFmHT6I3Z/PEPI2TpZW/+I7Q4DfLF
 82raXE510k18buX2UFpeS11JjSwPOSQVEFWskSeh8D6SKKY+xIev4DCyH9QxrIbe6CVjpunt9N/
 vh8AuzJOHmHuqEEdHNU3xIxGn3ZHbr3mFFVSesDpz9Z3bHZnkU7RYymPr4wB9yn4kLzxYAjBxaZ
 OJbTUPbDIREa6RZTppdaKvlw0Cpb6R/VKZGqy6fkVczEwIjZfdXb085I7dy5PMb386rzJTJxE14
 y22CGw271d2JkQ6qEcjB4mqUhoG+IEHY+PVXnEKbLz0L64U26PBReKAEmEkORt9I5ec9V17Zkmj
 H3VxQX9ltnQJWxYlvsQ==
X-Authority-Analysis: v=2.4 cv=BPWDalQG c=1 sm=1 tr=0 ts=6a96850e cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=SqthuRuOofwOhuX4C_gA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_02,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 phishscore=0 adultscore=0 spamscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609010069

Add support for SYSTEM_RESET2 vendor-specific resets as
reboot-modes in the psci node.  Describe the resets: "bootloader"
will cause device to reboot and stop in the bootloader's fastboot
mode.  "edl" will cause device to reboot into "emergency download
mode", which permits loading images via the Firehose protocol.

Signed-off-by: Xin Liu <xin.liu@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/purwa-iot-evk.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts b/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts
index ad503beec1d3..a6a1145f11dd 100644
--- a/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts
+++ b/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts
@@ -1180,6 +1180,13 @@ &pmk8550_pwm {
 	status = "okay";
 };

+&psci {
+	reboot-mode {
+		mode-bootloader = <0x80010001 0x2>;
+		mode-edl = <0x80000000 0x1>;
+	};
+};
+
 &sdhc_2 {
 	cd-gpios = <&tlmm 71 GPIO_ACTIVE_LOW>;

--
2.34.1

