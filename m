Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A4263E63AF
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 18:44:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775846664; cv=none; b=Cli0Kqc6x367RJz6yBq/SW/cGdQbFUlb0x/PrY2h5/6gi53ilhXccJdBvzh3VOmCf53A3MiOxA+zQ8dgIJOFrCf+wZrdsVdnzyXXyYr9ludOwL0oCIpDBCajktdMt+MXXWmhgGFs4LGInE0iOq7ap7NFOFWzvvZ2Lo9LYnUXx/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775846664; c=relaxed/simple;
	bh=QxOLV8A7ASktDil4I4jAuFTNhNuyhy0iAPJv4gkYYis=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h1kU/J064fAcMMSjmLNFNz8JCYcUH784y5rkpS+gnLh/XpVBJnaLan5o/HAjdBrjpj8Df6jDPct1qBAbAJdtCBEpC9dqs9YcrpCAJmGyiekzm6n4Hj2+dwJqL3lUpjYBSOQ0ccCcWAjA9mdw9rNkxf58OhG6yr1F+ZZ1+27229c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pyQ+RSKz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SRau8+eI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pyQ+RSKz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SRau8+eI"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63AHWJKF1925546
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 18:44:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=qW1upb9r60T
	xszm0mEGMzfHL+nqCwza3235dvciAB5g=; b=pyQ+RSKzZI7Q6F0ltbMR6oeqM6I
	zdpWaWRri8ivWDS3AmIFdJW19XcBPJdKNNtHyRdun1KGWDTbgC4D6wVP+FF6zYmn
	ONW6e0/x6Jb2DHC+/vLOHlhQB5upoPLX5jn8ThgyjJGlKmXjsuaobY+L7MJ6gw6U
	FNy/p7RBXFWu9Qebxdfk7AcP93MIEMWs7LZRG2Hrd0YnM0xahP303iYifbQBysal
	+i4Gy4dXQQttNW0PiATd5AWaNgMQI3nvHfAzWVDKl6bIpV95tOk7uuPyNTRI6pm6
	ZKnUxur30qWJB9p/5A3P89sRPWzQSBJoTPAS4051SXbd+8seo+ql2thOYWA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4deudjthft-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 18:44:22 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82cf8dcd079so1490672b3a.1
        for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 11:44:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775846662; x=1776451462; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qW1upb9r60Txszm0mEGMzfHL+nqCwza3235dvciAB5g=;
        b=SRau8+eIIKtAOmiKOxjG8bwWANNFXJt56Xwmevf48lhdakdeU3n9vYzHPBy3HF545K
         0AVo6s9yYjVEnFWa/jqijhWMMqZQhlQjUg+XjUM1+edsw/r9tgtkpRzwWvs3WqxNUgSQ
         ss64DCp2pkulHVhixXxrv0xwT6gbMZAQcDwOm9eCpmVCKdOeSnwwlBMmQ6fqbr7JRMMR
         1QaOxVsi8LdGYbU/0Ecj4qX+ud5+2HrSBvNhEBrhjqnuCPUOYNzFftM52oJF1AlHOebu
         evRgcVFqjau9vXvv3dVFaAfzRJ0kg4lH3nxC/qRSyRV9zhwg0BHTHsOu1lGVRK4jHMtg
         MQwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775846662; x=1776451462;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qW1upb9r60Txszm0mEGMzfHL+nqCwza3235dvciAB5g=;
        b=KT3pSCYwWPudLJscmGpvPHZAH76kyPh2z7QEa66fj9XFGvSAplxBNByO7zlSCFXehA
         Gefwy+sLcVEyOxhD3elawC0PiiFSfRMHGZPsxS4e45XYjtPJtqo9MAzpmaTnKUvEjYOw
         Zf50BKKMeLx+tUh1DLNgvCf7WpGVFVm13dpxFeXmq66MiIOcwv3v/s5D4bGK74QyDqQl
         Y60rqqrF536x30otrDPNo6Mf5MZArCtr6zRf7PhWl6X/9WrhQREOZ4h+FYogBPl2WC2g
         w+qaV7eOUEnDkmWZBx05KB+djsuqaB6aoU5ph6M76cAVLiw9YYFvL4deFBCAs5HSMozE
         ADUA==
X-Forwarded-Encrypted: i=1; AJvYcCUfF1u7QK5pFUYxDz4KqPyQhf/n502OBZoplhVhdyRbtJ/rzknmiOwjF/5j8j2vE2+C6MTLo4e2eXGp@vger.kernel.org
X-Gm-Message-State: AOJu0YxJb9UfQegKtGk726D+9TaOvO4G5J1kUGe91kKL5/rYmXmG22zM
	rr2nfZehigz4cL8qQRaK5mn7vmxN+pcC331tHe2AtAVfHBp0dUEf+EvAA6QsczK4IxPxyhgFV60
	YJUWSrkiEV1rYwsGNpEXdLtUX9tjc4wIBq5m3dxyBWBlPJLlAd3l38fAbHw7+b5vu
X-Gm-Gg: AeBDiesTdgNFyCja4sAQxU+QBcnIAjSlhgWaLI92JmnMKn9teuwvVBAKxrAerjlkjRv
	x2QOcgDfSqm1OU38mOWCqWX1NVe+YTg7mmBfxRJgu6kAjxzQa0Gbl1chHd8IkFAdZV1wG0AVCLh
	YFglfY+165+2HSzn+xkqwCW3+dcUxLifnDN02eXJmG3lzZaPSir5TNQJr1/rabwIzG/ceGBd3Q/
	Yp4+epDuJ1AYKGhYC/4a44A6+p1tpucf0DdcUhsF1IhY+DYT9sB9KDehsXNf/ZC5OKby/hG2nk5
	hJU4SbSFnE/1fxdLlGu5/sJkx5RO5osgaEo8/EvXMrqs+Ln4Cyo9KLh/TlXVGy+H0uJZ+3lVhV4
	fOQycDD3IgYVwdskZRZ5uvxsY4LWsbBqo2olNrLNkcTEHiaIW
X-Received: by 2002:a05:6a00:c8c:b0:82c:e9cc:f61d with SMTP id d2e1a72fcca58-82f0c131acfmr4865594b3a.9.1775846661530;
        Fri, 10 Apr 2026 11:44:21 -0700 (PDT)
X-Received: by 2002:a05:6a00:c8c:b0:82c:e9cc:f61d with SMTP id d2e1a72fcca58-82f0c131acfmr4865569b3a.9.1775846660973;
        Fri, 10 Apr 2026 11:44:20 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c32e744sm4036922b3a.13.2026.04.10.11.44.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 11:44:20 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 35/35] arm64: dts: qcom: talos: Drop unused second PDC reg entry
Date: Sat, 11 Apr 2026 00:11:12 +0530
Message-ID: <20260410184124.1068210-36-mukesh.ojha@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=X+hi7mTe c=1 sm=1 tr=0 ts=69d94506 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=YXOZx5_nuN5cFopkR2oA:9 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: 9JzFn9Y6wVXe1GphLfphMvXSNj3C5eCa
X-Proofpoint-ORIG-GUID: 9JzFn9Y6wVXe1GphLfphMvXSNj3C5eCa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDE3NCBTYWx0ZWRfXxsD/KXn82dZD
 d29li43Or3pBAsFzVXgdvUQ35ZvPI+9faIJXxQyZ68ptlwWh1u2psJgkVATjUrMbO/aYBTHDSRE
 XlXLqw8MHGZGkGeg9oV8jYiZLi5BzfCg0+MBlJ8dubPjrIcGiZOmuqe0ac2/mssAVz6o2QFuRDJ
 YWCo5TM/xQRryFkbrW9+lUjlpPWMNuR7EXuu9wFhBzZhmvOUbgdv56esXG9qdfJI0OAf2hck4T+
 +CKCNRWlfNPxWYGk/Q5h7hM3903wcrLqRAnQkt+z19bg0MCxOr4rykFOxs/YaE0PObx0JYZ9lUW
 aiNEfB2eTaaRR+CPaPGOiWrzxRiA63gZGaC2kN3fGkh332LboNXB2LWIdbiv43ZW5EFeRoJxSLZ
 Xsv80FuZmbKyP2Mt1IuFa24eyOGLNnoAqsB+2DBFvD+2E40OOYVMU8S1QwffozM7veA/m3uXeyD
 s/LUiz8RSiSsFOIU9fQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_05,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 adultscore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 spamscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604100174

The PDC driver only maps the first register region (APSS DRV) via
of_address_to_resource(node, 0, ...). The second reg entry was never
accessed by the driver and can be removed.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/talos.dtsi | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index 4b038fb22071..e825ee1b957d 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -4080,8 +4080,7 @@ dispcc: clock-controller@af00000 {
 
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,qcs615-pdc", "qcom,pdc";
-			reg = <0x0 0x0b220000 0x0 0x10000>,
-			      <0x0 0x17c000f0 0x0 0x64>;
+			reg = <0x0 0x0b220000 0x0 0x10000>;
 			qcom,pdc-ranges = <0 480 94>, <94 609 31>, <125 63 1>;
 			interrupt-parent = <&intc>;
 			#interrupt-cells = <2>;
-- 
2.53.0

