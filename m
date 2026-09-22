Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC91644239F
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 22:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790115120; cv=none; b=s3JA7vSz240rXl3ypYvMfuEZxCag3Ez8y3G9bdSfrrI6FZOR6vrUav5Dgf8W0WS/QDFEcTk9pAegSSJKfzLlbSt81tGMcyC86n7clpFqATB2ix7/igBCD2tofzbnYQUzM1IFRNOeo1al1VgFtEb38sZXE2xXn+uosRGnUldmy2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790115120; c=relaxed/simple;
	bh=OmXjFGhBNzHuev1ToYpS+/g6gbD2jZQAPZWQtH2A5SE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IPd3tN9RvpHHGcidqXdHBqOHtsH64EmVJ+CPr6MJHAnpc1LP1M+T7TSOwiB40x+lIecmzaqetxxabKi6SRPE0vOPSbkzJ7JIoU3VRtM4VBL/8A2MAO4E9x0vOGYhvc7jXCWwm5iB1VC8M+PZDTwTxPfcmZ3iLD9fAF1eJpNzzpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XL9ocmPx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PNttmTW5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XL9ocmPx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PNttmTW5"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MI7FlL368089
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 22:11:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=r+t6o+vTCc8
	nNWCoXMqzHlRWb3sKkFrmjSbHzmJ4QFQ=; b=XL9ocmPxDx2FBkKtzxKORMHiqhk
	APcdi7DENvLSHZkDrEG0l8rbJTWnL2a0oWDRFvTIbbAnNR8ZF1bAPD5aKuWgJIhJ
	8tlfTYRe3LjbnX2fdPjQBw9aMUxEQD2+7Qx1IxXWWVeTBIg+ROZ20hwLtwM8SVj/
	nYBSwikFKTjiiWppIzEInK02yWnclIcAM+zmwgHXBH46opw1kevrvp5Pp11jfCbE
	WkzYTQSJa6wRt3sKKxFS9cKhiRDoRUPFwYCKBBmyoYfA7kLhiQslAmfuHZlc+FQy
	TMA9b+UiCmwkmBoP26DDMsIpQPDd8KBl6WrjsgLu/8oCv5fD23VVJSwS57w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gurntb7en-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 22:11:49 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9390a2c895bso85823985a.0
        for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 15:11:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790115108; x=1790719908; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r+t6o+vTCc8nNWCoXMqzHlRWb3sKkFrmjSbHzmJ4QFQ=;
        b=PNttmTW5tbcTQ4e5qq5S3Grm5oKcWuNYUWGqAeCWBHH+c3MeQqZ5CXa+iBKV7pS2QV
         C26W4R8rCc1c7lfPEqAMTU7R6zmq7CgbATf0BibU2n3WmzmbsppDa7RXi5lFYvIYHe9y
         A6skkLoKQ2BfLc7OnmfktSg0Yo+P3Dgf4YT1ngrWjQrB4IYNc6G6Bfeytazm0XD+9r/A
         lN7vq0hBYOFAe4ip50tgsn+pT6dxo+pyDhcKTNiylvesav1FIz8JfPx9TZw4t6w/6fw7
         PtADa3KqzkhX6ndv7Q1US24iLGwLYqxIJ83Gwr7JpuRDWAb7J9MHTcns8BMxBGIuSVLY
         WLyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790115108; x=1790719908;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=r+t6o+vTCc8nNWCoXMqzHlRWb3sKkFrmjSbHzmJ4QFQ=;
        b=nX/h4TkOKOMIqo7B1Jy7h2WAqTupR0gXvgfZYjNv+BXZ8DxFRR6kGAFN4gBlV5sgzV
         96dbZmotyvPUJ6qnm+FbXtdPd6uLgS4YElsaOWP8u2bbz2oJ9LDFFU6bKMi6sXA5OTQe
         +20eRsVcPxn/sRBs0K+TiUdOtTioHKfo+L6xkYFqBJTWcCbfNKruOfj4bM8KTX/3eeC+
         jbWyjfkvM1rldoA5M9irk1G6V2gWWQiYl3pQ10Tr19trtxaka0XnOAsbz3pRMhU3JpNt
         9zc2U96c0gmvvFF8/gOPtufMYlS3ZpiDQCD9FoL2h11YM+SpN9FuDeJ/skN83MBCLEqy
         AgHQ==
X-Forwarded-Encrypted: i=1; AKwUvBxKGJivIxe8Qa4th0nHthNvOysv8XUVNf7OoFb0RPSgYxZXV19dT/V2dkPMH0QN8ZVuCZyAqp2/cFsL@vger.kernel.org
X-Gm-Message-State: AFuF++kUVFmQ0Pf/ZIDaBwepHqI5/p8UXHAwClK9wlOhXQRxhlzl1oCF
	yREO4Bjc3msukXPkRh6biIYdIZJT11OzxTDL1ZrP81Ekft1BoPhvMaIc/EDbPjpJjtZnk+Yuifu
	BpbEGIwp2qZjqJrG8Fk6rlAaISL/VS5BEbIVx89u5ZO8ZQPkFAOPqjOOSBv8x0IGz
X-Gm-Gg: AYBFou1NcRXzVUbQO+J6r9Xe9L4BriQ2lU1oZajRBN7tjJCIPt30KRf7G5LBQMgcUlO
	wDUvGkCWRKXvlFPhVUWZFhsZjDjVmGFfFyx3udEZ0xMxmvNmnqaha6QdNB1Aj+ndt58YK1A4diI
	N3QsFkaz7rrnsKFaUKLFCNEyLZviqVVvqybBXAQKhmyj7DxiJ+gdVufEihZkJ87aEvQEQ11vGFA
	faYi+YB+g4wHpDPr0n/u9NNe740dfP387GAHq2Ss+tVV6GefwVO0WV7xtHerDy7AdXMlEW7Shr0
	uq4onwaO7s7QBtceNrU0BwoY+zJDAmRCGgn12gsBY505SGST8bEM7q9LhqnYg/7EVzJ8O5B0CbV
	hoBM+yxKiiHp5d0X7AnYou+d5INFojFfMsk67eWtVl3uQ+T6NByyMI3NnEdqsPZwkS1zo7Nq77h
	w=
X-Received: by 2002:a05:620a:27cc:b0:93c:22c9:68b2 with SMTP id af79cd13be357-93c251d5db2mr129890385a.47.1790115108143;
        Tue, 22 Sep 2026 15:11:48 -0700 (PDT)
X-Received: by 2002:a05:620a:27cc:b0:93c:22c9:68b2 with SMTP id af79cd13be357-93c251d5db2mr129885785a.47.1790115107736;
        Tue, 22 Sep 2026 15:11:47 -0700 (PDT)
Received: from debian (cust-west-par-46-193-35-178.cust.wifirst.net. [46.193.35.178])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-488688856f0sm1400270f8f.30.2026.09.22.15.11.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 15:11:46 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: lee@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, sboyd@kernel.org
Cc: dmitry.baryshkov@oss.qualcomm.com, alexey.klimov@linaro.org,
        r.mereu@arduino.cc, srini@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v3 2/5] dt-bindings: mfd: qcom,spmi-pmic: add compatibles for pm4124-codec
Date: Tue, 22 Sep 2026 23:11:24 +0100
Message-ID: <566b4bc1822bc86a5844cbe1b2fe91d05b5ee9e4.1790114902.git.srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1790114902.git.srinivas.kandagatla@oss.qualcomm.com>
References: <cover.1790114902.git.srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: pdezitq6Wtk1zWlqRDiQylnIVzPwROJH
X-Authority-Analysis: v=2.4 cv=eauo7LEH c=1 sm=1 tr=0 ts=6ab2fd25 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=Hji71o54RgNgZYqDgtlrhw==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=1S9TnuZ4X9D0nYt2MHYA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDMwMSBTYWx0ZWRfX0+Q6wEPEo289
 r6btjcB5J3XACVX6ThhQLoKVEAh1at2TIIMqdexbnlO9TzHsPULeiLhgseh5MWGawR9V5hClJvB
 j+h6WUgy0ymYWgOXHDlF7b5oDCfKSkJ/fTE29G77LVJJisCWbhaamQVkQ7LEtaevumHYUPXHr6Z
 OkIqkLdN3oxhtH9MTyBZvOZUclPaFhkJPGdhfIaaz4anEM3mHxR5hxx2Uj4tOOoNG8ffIHnamRJ
 EeuarH+EKG/rEAlsi8rG2vzGXrTyiQ6++J9OQavMmme5UehJIN1TLQ/n9oNJR1g8yPzu/hFqqlj
 8vfhzY4upHKL/bDEho+ZPNVblsoNW5v/8Ysze8b9koHodvADlsHJNBGKz4drC5IFjNZ6roNVsQp
 KTBmRKRPXf5Jz/s9/gM7HY92slt/2a9XAoMPAV+TkEhZSfSYaGhHvqj53kR6mb/ZbSzCpoBJPma
 DFFyQyoM5HDroVWq7jQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDMwMSBTYWx0ZWRfX2Ii6YiJ/6hhx
 8ykY04dkpxaYRe92TPN/GhXVpEub1l38rGDF/p0Zz2Zbt9mOMQAqC5T44VBGBG0YHizclfONr5L
 XVxg9zjWchhTt1XeyooHScaIierVM+Y=
X-Proofpoint-GUID: pdezitq6Wtk1zWlqRDiQylnIVzPwROJH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 spamscore=0 malwarescore=0 bulkscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220301

From: Alexey Klimov <alexey.klimov@linaro.org>

Qualcomm Agatti SoC has PM4125 PMIC, which includes audio codec.
Audio codec has TX and RX soundwire slave devices to connect to on-chip
soundwire master.

Add missing qcom,pm4125-codec compatible to pattern of audio-codec node
properties in mfd qcom,spmi-pmic schema to complete the audio codec support.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
[Srini: reworked the patch]
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 .../devicetree/bindings/mfd/qcom,spmi-pmic.yaml        | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
index f6534e9e9912..d750da31ae3f 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
@@ -148,7 +148,15 @@ patternProperties:
 
   "^audio-codec@[0-9a-f]+$":
     type: object
-    $ref: /schemas/sound/qcom,pm8916-wcd-analog-codec.yaml#
+    properties:
+      compatible:
+        contains:
+          enum:
+            - qcom,pm4125-codec
+            - qcom,pm8916-wcd-analog-codec
+
+    required:
+      - compatible
 
   "^battery@[0-9a-f]+$":
     type: object
-- 
2.53.0

