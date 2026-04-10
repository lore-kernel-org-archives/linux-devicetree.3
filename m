Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EDA83E5EE7
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 18:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775846648; cv=none; b=hOerr/vyicizhp/Ajt7w/Aak5NiWRsKo/ynHMP6ifNlYwrHDXOk4Dv26AuA42PtiqzvzU8a5j6DvPclgC/eSoTX/pkAJ2XxttUsvn4A1ChS8iGHyTsv1gfWwNpLhofRkdwTtwRBgXIjFY4LTFvpCmAggSbZDYgzArgJ2NM2S3wI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775846648; c=relaxed/simple;
	bh=kD1ezleZxBGbUkoU1r7F48hvn+QgREfOMICAR44lYSU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Z2kb7C9IypI6GjHs7Pt2vSVC3CUE/WYwS3P87zH7Y9bkcKS0WkjnVJX1zLC3ZTo5m3sxH12FLbe/GcTv2dCL+lCOhClMLgC5lQJkn1YLek4dxhJFiTpfeM4KpjpeQcw5KzTCT5n7k2m8T4ZtnxIjOjnvd/5NpVkY59/rzCemx+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hAzAcFBq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OZKY50Rw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hAzAcFBq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OZKY50Rw"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63AIAWZH438883
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 18:44:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=3YwNOJHfvnW
	B1gZU3cn4ouH1o7MoAZK7KihTsqW8Ymo=; b=hAzAcFBqsSc5AsafLpC9M/9kGsK
	bR+6/dGz3LNzIBO+W/nNdG9nWDXZgIbW5EQX+Xva4kRLvXBo0wlKFquakCN83ufc
	9XSEAq7tPVMHY30HxsWvuOf3gj7Gw9JQO2vzO1Tat/ARD0Jv2MWqFafUtVNceB+e
	6YiTReyBGsTUYZAY0tAKxDQkAtK4KZj4Xn18NXKQAYs7AgZAUbuOenTaL/L5+gb8
	yjmOlvmfwPnGMAmcXQbUHQXIW0olWVGdsjzwwaVXkvCv78V38jQeMEX776F4xB+E
	ItYO7vmB5SLERSbGyeiLKaO567FNY7++G913GQpWjXfOvlcZB6mC+/I+/cQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4deyy9seke-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 18:44:06 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-82f07cc6590so994172b3a.3
        for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 11:44:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775846646; x=1776451446; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3YwNOJHfvnWB1gZU3cn4ouH1o7MoAZK7KihTsqW8Ymo=;
        b=OZKY50RwnbwW4JMKNWXkjCI6Y/h2eUXI5qm6Ou5G3+0uSepziqOkGPIcECYq4MOPi2
         QGRPoAct0xhob4TLQopxrMQSLgfRGTVBxkwJRnHDdBZEnszI4Cvh0uA5QuA+VaCvq1k8
         snw2tVlZtK/NhKXopW4KX8JwYzv3gnBIqhAexLandxKQCtSqdv6Vb/SZTvIdJGVNkkCG
         rn/X25RznWq8Qtxf2CIdbj6mOGRddIYGw4V6ZhK+SXp8HZPm08QjtLzB4jU62+Vzal4E
         ez32dtHJgTTSI34/6b2J4eAvkJvF/2pafG4sJDbF0q+udUjlgGn8jGgKb9hP+d/4mXN1
         Q9zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775846646; x=1776451446;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3YwNOJHfvnWB1gZU3cn4ouH1o7MoAZK7KihTsqW8Ymo=;
        b=S/OeW8zajWxdPyPqFXks3QTQ23FMHHTyxCad9l8S/QRKYc0MItqbrZQWTgV9RxuDKb
         keE4ye8gv/d+znPqF6eV4P02aG5n6DseaiesN8c0j9X5DVh2Gd1H9C3aReDR9QBmorVW
         9ERh89ZdrwmjzYp2zSbFLSy9/hFwaVX7yxCQAvRbMgTvjJ1bo9XG0ql0AGxfzV5oWx4K
         DOUYICphimbZLaz0sqlCWLT/0qcMkmFIDUvNIezxYtvHBLrvCfk6yu8UjrB6OTlN8zQO
         7QbVGKMEfBWRJzhcKdurqgVDjqTt7o/U8XfzxOjVX6XMDl2JujacI21jOrQcG4dj172b
         YooA==
X-Forwarded-Encrypted: i=1; AJvYcCUpO49Aiqh/5Z9UvOCdZhx1TYGwyDweRvAKopaZOdw4q3hZmh/patBUxotgCFGMTpHCCChqgr8P8UlH@vger.kernel.org
X-Gm-Message-State: AOJu0Ywn0t/mfvHJsBJB+Bbz4IKL3KxQCcdBgp297jBep5kykZZByXYR
	TjjrCHdTtwpOItWWIi8GwvWcDaibOlaBnWYNPFeHzhRLTSOvTGrGesQjCWE/Fcgp1kH8PlaatBl
	zcjVi2hIzwACIKuH3Nps/YXmbmRka8j5CsI5z+hFGt/FXg3ZVqCsiTssZ9XdG8i5h
X-Gm-Gg: AeBDievXUQSeniQWHNNx3I3G9u6NNgs/ceLVMXRXEpJ4FqFuMmJituPtJ6SahQ3xwUJ
	trSnSeADCKb6yip9EtGbc/Q+rk17BtSx4OR+o0ay4wlmli4yP38khPjGFRe8953PGAvbc0KwR+H
	tw05dVWQfmoNviDBMDoUayGbP3xlDt75iHMYyi8ABgByTokV1WBkpKUk5aCvwcOzEY/Wj552zfq
	6e2ra62mkXM1r2k0ItbJ/WBPfheb4XUEVyQ4p0toxXr+veLMjGimw7QnT5+4BoR/agAl5G+JU6+
	VLWi1Zb17xdJjgWOt/8cDgJE4P/3xlLTGblmEJDNQhpxnXsMwZiur3i6q710vA1K6QPpFXd72xm
	Fl/EhVPWuXat//DfMrhu/vODoxX37e58/zo5rX7N3rnxYuTne
X-Received: by 2002:aa7:8a52:0:b0:82f:1b1b:e16d with SMTP id d2e1a72fcca58-82f1b1c0e88mr1176991b3a.30.1775846645732;
        Fri, 10 Apr 2026 11:44:05 -0700 (PDT)
X-Received: by 2002:aa7:8a52:0:b0:82f:1b1b:e16d with SMTP id d2e1a72fcca58-82f1b1c0e88mr1176976b3a.30.1775846645219;
        Fri, 10 Apr 2026 11:44:05 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c32e744sm4036922b3a.13.2026.04.10.11.44.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 11:44:04 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 31/35] arm64: dts: qcom: milos: Drop unused second PDC reg entry
Date: Sat, 11 Apr 2026 00:11:08 +0530
Message-ID: <20260410184124.1068210-32-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260410184124.1068210-1-mukesh.ojha@oss.qualcomm.com>
References: <20260410184124.1068210-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDE3NCBTYWx0ZWRfX80dmlfZ17TP1
 7vo4FlLNR0aH3B6xkAR8gzRJKrP/Mpr07fDcDEXFT7wvAOalkYtOtvZ4AWZKWWo1zKPekQe7F3n
 nxG6s3W1xj23pLoa/ksEQcTKIQqBtguMlJXVzvt7GfW6jTDdvkAfjZA40jQT37LWbcI+QTdcl1i
 i2thHO97NyzBY06jknuTWNcuGqxqZfLdold/RQq8C7M/FhBXPO6X/wyfbqgFNZ4lYb6zgMVnENs
 JmkuReCtMSM1ncWRnoEt7lfeyZsNjbJ5kaQaH3F1ePsEfhH7itiyj961Xy81Zozh+2jCYzPLx4b
 BQiUano0Dblzb19ouEj/SxBkCiCJne/fPF1i4pV/YQ9FManyleT4dmaqdYlNba3NGLsBUOAKdBp
 O+cU7jEMqUwxuqbIkbO7XhP7XDGacZXTHEtxc7w+olEdBGtYGAKYy03hrDOcPs+/5ZdHG/oxVhx
 y7YqSIeIVneqiQLFolw==
X-Proofpoint-GUID: VgqlCmDwKZUyB_PJdPOTUD9fg3ZSJLX7
X-Authority-Analysis: v=2.4 cv=d6fFDxjE c=1 sm=1 tr=0 ts=69d944f6 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=Z-SV6IHASCxNm6f5L9QA:9 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: VgqlCmDwKZUyB_PJdPOTUD9fg3ZSJLX7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_05,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604100174

The PDC driver only maps the first register region (APSS DRV) via
of_address_to_resource(node, 0, ...). The second reg entry was never
accessed by the driver and can be removed.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/milos.dtsi | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/milos.dtsi b/arch/arm64/boot/dts/qcom/milos.dtsi
index 71941e6f49bf..a3c2ac8ca675 100644
--- a/arch/arm64/boot/dts/qcom/milos.dtsi
+++ b/arch/arm64/boot/dts/qcom/milos.dtsi
@@ -1564,8 +1564,7 @@ dispcc: clock-controller@af00000 {
 
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,milos-pdc", "qcom,pdc";
-			reg = <0x0 0x0b220000 0x0 0x10000>,
-			      <0x0 0x174000f0 0x0 0x64>;
+			reg = <0x0 0x0b220000 0x0 0x10000>;
 			interrupt-parent = <&intc>;
 
 			qcom,pdc-ranges = <0 480 40>, <40 140 11>, <51 527 47>,
-- 
2.53.0

