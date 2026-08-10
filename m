Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F024A3C3F60
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 11:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786362253; cv=none; b=sFni0p1UwZgDczIXeU9kWDDY/ywMGctD2cK2SBA1r8u0yuUwoZMaMAkss7xGLDIFJKFM/bRSvgETDccH094YPw+LwkdUkIZkgBjcwy5tu4VjLJx0eyy5EnE9paNHNWlQMSlKSwWdXfXH3JZlDSXtBaPBy/T4zuXt+F5D1+0IrSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786362253; c=relaxed/simple;
	bh=taHT/FWrTTmTNXum4aFu4vc3zEZd97waKqjHUDl8gfk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t7C/zog8qA7r/yi39EbwwUVWdifasJ0+x9jOcdtnl04w1fjBEkOOJlam3YwrjYsAhpC888Rs4dzA+HZ63s3UFgXNTHwJ+8hDaaDM3/sR6E6gDXMCtDwU37rDKoa8gUEBh/JgqQMmA3HbleflHduCdjdZpG1s5A9A0Nt/pYTtI/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VHZbtSiV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LSulILQf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VHZbtSiV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LSulILQf"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67A9pZIN904963
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 11:44:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=euO68b8p5f2
	lwR2HBSoTd9oe/4Nd/VdBWR8tOJjtlZg=; b=VHZbtSiVzHCiZ5VYz4Vf/TrGMcd
	c5zOfAbjS6BedUAoEcvmj6zctBxSWulXeJVrdXvukAd3YbU31CFOUGiE5XL82BYR
	d2lC4tMH2i2no4LaGjfQy56sQXbzi2NoTAHFXT3CmvE+OnCkis7FVvPysZ17BtMM
	CIODCKqI3qgNexSYbtAAQycTGx+q01wsEsJrMt5PrZ/+j+6fetAVJG1Nsqlf4L5c
	xJXOOEsZha5aiTFKve8SfMidjyXxMPRxUo2wqh+jSULt+eQvHef+RQ+V6aItAfdo
	CNiFFiSBOEO1OKIU3G+RLachnegURU0Nj3tIbFeis21nvri7pVCgX3HS8LQ==
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com [209.85.160.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fyccqrddc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 11:44:11 +0000 (GMT)
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-44d0960fb5bso1904624fac.2
        for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 04:44:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786362250; x=1786967050; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=euO68b8p5f2lwR2HBSoTd9oe/4Nd/VdBWR8tOJjtlZg=;
        b=LSulILQfpDenEO1VU/OnuW23BE0yRIubrT1KnLe67YMM7FMtJh7gftysy1/MiMuhO2
         lEGaeu6C2q+Oyk5IQo8z/BnvnOisIv1ukVNZEQa7CM48xwictUm8KzO68sxND6RIHh0Q
         ESVNms9+agxQ0z1doPRlNC8FNQrO/jwl0PuhvBJoOHui/Zyt9iNJrlNVa+d17jPjwTso
         gUo9s5urdoCe0O5bWCc0y0qlf/TGNIW47CMXTTRYjAHpYfZ4G7p2qbkPtfJYoQNXDdep
         bB+q+pbjD3N2McQUjiRzm7uXaxf2Bi9qp45StS1r4vTqVaf9tZ4lsOvUnjROIeSaHISi
         SuBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786362250; x=1786967050;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=euO68b8p5f2lwR2HBSoTd9oe/4Nd/VdBWR8tOJjtlZg=;
        b=UbrNWZzUGo9234Wv11iS8lKa8leMoOuQ4q/cpYsrHVcGNO4Z5T2iKu+VSrbhAGwMYy
         kxDeue5GaCjjlm6/QwV7F/4+lZOty65fktRDtj/sH1WDGELv4b5M3tku+PhiluCM0A7i
         BNAMxseNqRdAmsVwGDL1zsDixlK1b6N002whhTbXUhQDt0TT2XsRy+Wd1XVmXL94IzT6
         9QJdf0aG+nUYfjwteSZW16uubHqy3BYsJFYbpmoGaYK5zTvVV7RQqXsjBMgdYXO54Mex
         hAUlVEJq9V9Bmjsv9HLECW/Exk0cYzeAv1kbCZ+Ex0X+qMwfzCiqo8I3CXxNUUJEy5CU
         76Ow==
X-Forwarded-Encrypted: i=1; AHgh+RoBUpriWq2cpt5cufQfoWDq7W6uYWMB50al3foCiB/+It+xHnjpwRqcz4dNXIY+vzMpkmxVWu5XV5Wh@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5uduka3k9DD+mCS0toYkm+JGZwVGZga2Nek8b45fFGYSc0Rbu
	G0tbdq68VgiFouvtzVsJrdVZ9NZSZJa7QOGKOnXMNaCZNp4xXb9C9QzDl6Fp9uwKsBjGu9xifqL
	miyv0rSI9Kzr9ragv5FPrmHeJP2qMqwYMeH8Hve7RxPeavNgQ/v2xU7bNBfKwq2cp
X-Gm-Gg: AR+sD13SGBBZnO/gGQPpvoG37si4sVvqrEyrvxfhqkfWLs0Jh3pEm4yvT/gWcWUK1FE
	c4NGpj43AhIgTl7Ttf1mD3EM4lfD+Wmtk06FUMD6Iv1JxvWekeHmuMexB5Zr4aIHeUIMeTiJZft
	oov1S6sZfM+jfbs3F0uJDAFJ5k/HX30zTgI9A7F2BC4DXHw0WjH0PSXh1c+2KncCRQ8E01MjIue
	2ckvxtL06YNSAqHE5ZNFUCA/5SVWdlRldCiYwj5857+MekoWgnHL+GCvHRMgeq+QqBhuana3nDf
	/Bg2RwkHFROlNAG1P09f6Xt1KKq/XiuFTj2WDGhYB9ncA/DD5HZ1/QPJ7WfqUOPpWfDEh3FHF+L
	X2cmn74MuTmB+8XUehNArH/+54mj83ZjgjjCf3IIm8VLL1QDGot0h64C63H/m
X-Received: by 2002:a05:6808:3020:b0:4ae:f5be:fe29 with SMTP id 5614622812f47-4b1e775c9ddmr390333b6e.5.1786362250575;
        Mon, 10 Aug 2026 04:44:10 -0700 (PDT)
X-Received: by 2002:a05:6808:3020:b0:4ae:f5be:fe29 with SMTP id 5614622812f47-4b1e775c9ddmr390307b6e.5.1786362250223;
        Mon, 10 Aug 2026 04:44:10 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4b1af06bfc6sm6035281b6e.2.2026.08.10.04.44.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 04:44:10 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Yadu M G <yadu.mg@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v10 RESEND 4/6] dt-bindings: arm: qcom: Document Nord reference boards
Date: Mon, 10 Aug 2026 19:43:11 +0800
Message-ID: <20260810114313.776563-5-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260810114313.776563-1-shengchao.guo@oss.qualcomm.com>
References: <20260810114313.776563-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: qS6nWbK1aSLURKr9xV8oN7Zjsn5YQCB4
X-Proofpoint-ORIG-GUID: qS6nWbK1aSLURKr9xV8oN7Zjsn5YQCB4
X-Authority-Analysis: v=2.4 cv=WNVPmHsR c=1 sm=1 tr=0 ts=6a79b98b cx=c_pps
 a=zPxD6eHSjdtQ/OcAcrOFGw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=3mLb7b5QgQ_nS9KBAK4A:9 a=y8BKWJGFn5sdPF1Y92-H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDEwMiBTYWx0ZWRfX5h8087UMDrLg
 I3rO60dSk6PTT2PA59WBqnhw4g7c8zh1PmkvtVgC9+1H4TXakkVPA6IzmwhsXdFP8TWxZVhPziA
 4IOVt/6BgQ9p2fr14wmJUonlMhUZi7USdRWzjpbSXIZhJcDrruxGdFNcTIQt3YOkptdwGMlQWVj
 MRKbqQ72mu+tFHgIRhSm8pISCQUTEd6Te4pgQmVpxN3nzjphk4appab/eiN08gn7FLIO1KGFn8N
 Ku7UBFZ9shcMDYZ+RqIPrehc5a6veldg79PpWjM8avDoYsb1+Dkg0ggURFL/arAZJuEUu5/Dy6x
 eJzEIArxcYI6kQJyGq5PJRSLtM4QbnZgkMgQp4fDz8JPOhcYF9HoL1TPwrN+zPrzbYiJlqrcrVQ
 zp1HC64I8v/x7a8QopLJAcXJuLjFKNrMYImcqTh7QY8E7G5LJnTthP/IQmAuQR+Toz+6FJ9fW0k
 ggY8VdUP+0OFgzJI4ow==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDEwMiBTYWx0ZWRfX12R58QZax9iU
 YjyNVKb2vVknf45VWy7QoCl9G7RyVXXQenHQIyO26xpAEtz2MhWlb7nY/+6wLvZRjKi7t4WJW9A
 2+vvg7iIoSYzV35uWAv7G5i6LG+gXX0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_02,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100102

Nord is a new generation of SoC series from Qualcomm which includes
SA8797P (for Automotive) and Dragonwing IQ10 (for IOT/Robotics).
Document SA8797P Ride and IQ10 Robotics Reference Design (RRD) boards.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index ff8a35df7862..198314ddaa84 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -402,6 +402,12 @@ properties:
               - xiaomi,sagit
           - const: qcom,msm8998
 
+      - items:
+          - enum:
+              - qcom,iq10-rrd
+              - qcom,sa8797p-ride
+          - const: qcom,nord
+
       - description: Qualcomm Technologies, Inc. Robotics RB1
         items:
           - enum:
-- 
2.43.0

