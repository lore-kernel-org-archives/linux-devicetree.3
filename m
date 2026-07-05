Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C2B6355F5F
	for <devicetree@vger.kernel.org>; Sun,  5 Jul 2026 08:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783239346; cv=none; b=cGQZ2+vdhlh2TNfOAkLkvJNOgx4P66GJfuaWwzqSokTJahnpQzGiJZYOE2fEqncPbyoPLYRnVY86VYwE3UMORsxTGrwHaosTuzf3AZh6qgSmHjkCEzsjY15VL8mDgT/sZqXt/HU8nA15h7kHi8dtbcKeVwFPYuEGXY2d4SO+HrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783239346; c=relaxed/simple;
	bh=zz8kQOzV0PuuiEtF3vaop3G8EsC5NffbLveQUA/TTGo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IZbKOU96YYPSZ5WfFQ/XvU3x6E/swwN/+0mqEq6Ygxvkg+hUzdNuawBUtV69jjga6vlOJYXxRVQF36enJDJCnrW6PzmcIqMRXV1+Y6EA7mOyoeqFjUYa2AMPMKDnIZJFxWd+VsCkMkdwN4ctgc8b1dSgHFYW6ib71TilVMDw6so=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mx/nqlH+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RnnRbbPy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mx/nqlH+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RnnRbbPy"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 664LqcEx4143295
	for <devicetree@vger.kernel.org>; Sun, 5 Jul 2026 08:15:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KnbrADbl03nZ3Cw89pBBXWj7vEWq4V7jAOOPfBK1kzQ=; b=mx/nqlH+vQt38iZQ
	d28JFJ/cemI1rlkM9IGsruBz3FStlE2ismhLruTZkYLsHK/TAIDeWZvHAH67sOCn
	gNEXWi3bJuodCCA9h6F3LSX3oBr2HztIVG1Pnn9lDb6nMrr1mrSQ1BMF3BfMYay3
	So9w13jlRxMWddtwLFWb702CUBzfPj7+Gvc0lN8WNcpFm1sRd4+fbt29w4WiLza9
	keonQARIz/xuOcnA1icyyGgBSPfIstPNoYWlWaP7Co6w1pRXz7smtrNeYEHU9Irg
	ebAD27rNojNDVWOPktWa+NXGIHNhS6beGoxvZlp06mCqEowft93vcljxV/LWmzC8
	tN0/Aw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6s4stev9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 05 Jul 2026 08:15:44 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2c9b1b608e2so39461795ad.3
        for <devicetree@vger.kernel.org>; Sun, 05 Jul 2026 01:15:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783239344; x=1783844144; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KnbrADbl03nZ3Cw89pBBXWj7vEWq4V7jAOOPfBK1kzQ=;
        b=RnnRbbPyZ75PCOVKRiZ5M+NwVqZZ3PoEo4AfgW+ugBB8A3F6XbeFiVMxngn4gQdZgV
         OjCpoqJZO4H8SYT1b+Tlfe0cNSc1f+TOjQCQVXaWpcauLIRK+NueqlXrWb1qRIFPgh50
         s9ug7N2ZUD94A5tGftr5cgg15BuRWpR5WbE6wKIEE5PyipRXlGsjMYAlSPsZbmitLbDZ
         xlVFvH2daEguSMXyHPlH/jK/hqL74BpHt5wv3+15YZd0W97zsYIi7q2u7m7Df5XFe+pT
         Or2R7G7vwbG9yIEd18Pi4myy3Jndv3tZG1o9Ckv6pPux3agC/mvthtcS6Kq1L63mHr5P
         Ig6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783239344; x=1783844144;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KnbrADbl03nZ3Cw89pBBXWj7vEWq4V7jAOOPfBK1kzQ=;
        b=BYNAu8xGEYn/OLxq0GaRiPYLYRFPGQbVMxaRxa32oWadrEwUG9BMl0aEkYzilKtuXd
         /atje/vs2jZmG7XSCOoENOK1FDYNN/5gmCq8DLdAzpeoVfZt4E2E/OY9RVnLYMrslXDI
         7CIMcS+OIuT7blfFQKFnVlVv80X6+yp1GKihjv/YgHXibCBSksXwZ5LgO9EAhNWlLKxa
         VIe2hzIdc7i/DE3fme3tZMEa7wom3Ja4SjI0AG4l24YvukFyi+3QG+5+AESs+OlXIPL5
         oK/wxLSERbZ+wOUyKwowmDUqSQrH3Ussym5qvJnvKmlyGqeJn0GZAV3AYMyyIohIvd2i
         hCcw==
X-Forwarded-Encrypted: i=1; AHgh+RrSA4yodNOSmtBbkTqViuXQbl4Z/LW6YqlnNKDrakbeU5Lg7HGVG9t/1NobgzMyR4kyw6zGKcAeihwZ@vger.kernel.org
X-Gm-Message-State: AOJu0YyeZcrJfSPJOUBuaPCqc0tGoTpEZmbxXXIc5JM+6MsXeSAcMV+u
	TeuyJdf+9z8iF0wYZbwmDky89engjWgzJ+BC4/FO7RTm61GsSB4FVhy3DBXrw+g4OD0AOS/GgJn
	YAKtV58clbYbfgVx4QbtbW7LBKlyXdewWVrKpzRP3yH9zMojt1lnvMf3doXVbR3tG
X-Gm-Gg: AfdE7ckbL2srEdsc2WBTsWkuJ+3UvmJECgaYjmNwuo1iQQvdSQD29Bm6t6vGIq4HeCh
	gmDP9snAiy5BujGnO2g7KhP3s6/TsNpCv8YIUou46RDuk9ecvdTiAHNMhXvFPrxvtavEUMP5hfM
	cpltknn/F8wKfAtK4Mwwhyy3BmnaiAVdgR3AET/gsNrIlkocVyi8h3me39W44PNq+RErMoKIZDA
	eyhMDy0ZbItfgdkT2ENGGMawzK3ZPwHfassAM7BEUBcRXMDHazKqCvV0OJ4TCQ3+Z2QuAl2sfBk
	MxfpUAUIkHD4+P4TKCjj48l5zdhfhUzBlofoloY9mBi/okgSCvMaMOHWkSXeUStq02phMIWpQRV
	VAHtApUeqi1jKf40sksICeQGM65Qcfcg/tx4=
X-Received: by 2002:a17:902:e746:b0:2c8:248a:5dbb with SMTP id d9443c01a7336-2cb97e47ac6mr62891425ad.7.1783239344087;
        Sun, 05 Jul 2026 01:15:44 -0700 (PDT)
X-Received: by 2002:a17:902:e746:b0:2c8:248a:5dbb with SMTP id d9443c01a7336-2cb97e47ac6mr62891115ad.7.1783239343645;
        Sun, 05 Jul 2026 01:15:43 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c85d4fesm36403980c88.11.2026.07.05.01.15.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 01:15:42 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Sun, 05 Jul 2026 13:44:23 +0530
Subject: [PATCH 8/8] arm64: dts: qcom: eliza-mtp: Enable Adreno A722 GPU
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260705-eliza-gpu-v1-8-c9f1354dbd29@oss.qualcomm.com>
References: <20260705-eliza-gpu-v1-0-c9f1354dbd29@oss.qualcomm.com>
In-Reply-To: <20260705-eliza-gpu-v1-0-c9f1354dbd29@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>
Cc: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783239265; l=765;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=7fFNa6LfUvVHEiiBGevq3c8n0UAvOooWHrhEPYn74wE=;
 b=6S8MpiE/YFAUGREvxnleOYfr3um2lofUcKuw1nfRX7A8mx3JwkxdgebU3v0OjfjzNtQWaFiAS
 /og6Rpi9tCdBjBax04qDhYpZnfbJh24WgKhT+Nh+02OcLdPzXBHjNLS
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA1MDA4MiBTYWx0ZWRfX0L2xllI5Hfx6
 6c3vBtC2zzgUr/H3K235YLKumdyzb6399IxUGasro3HAYCPByfGhub2ZCeW7nE62WdzD1uDOFll
 wdDckpPfZt9m76bYO1YUnJVlH7U7vhw=
X-Proofpoint-ORIG-GUID: 5hN1ssZ43pgP6TUt4ks4P5x6q3Gp30s_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA1MDA4MiBTYWx0ZWRfXzN8Vzs0mkiYt
 W9aqqizIedXezZ/r3NfZWUYCGhTM0dwHnWIpwtOSGKweLtQgJK+YVb+BkCjy9NsRQpMXc7R1+2K
 6VCgY6lDpxqTjigfdGoE9cp10jE1/iGtNis3dEgp+X+b0qlqo5I+R0snEtEvGfs8vdHUma8vOCm
 oL/NGk255tYRfhcK5Zy4fArxkLad17qjo+LaMwH80idF8HxMQo9ipk+uijVFg1CHIK2egvlGZ+2
 Xh0mhQCAoTiMqk1B06JtbecEkLi8FvQ3mtLY1O6trgaxeixYBtylZqQQCDdWgzWunXL2xXwcDs0
 TpC+45jlpiq19Z8V56Z5j62sHp3FkMcMQcG09yOZkRWzTHC6+e9Y0aB2GSbkfiDnEWVDjiHAjAv
 JvDV6TKLD8lcTA8Uog6r9pUfkqAiRGxRWk5TZvqplzLaUA7Y/FbXrfNMEh9geHeIFEuwt5yEa7n
 6R0uQMFsAkhRVJE0IVg==
X-Proofpoint-GUID: 5hN1ssZ43pgP6TUt4ks4P5x6q3Gp30s_
X-Authority-Analysis: v=2.4 cv=ZfQt8MVA c=1 sm=1 tr=0 ts=6a4a12b0 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=Xl3f10jGzgz6Ja07nhwA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-04_03,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0
 priorityscore=1501 clxscore=1015 suspectscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607050082

From: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>

Enable the Adreno A722 GPU on the Eliza MTP board and provide the zap
shader firmware path.

Signed-off-by: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza-mtp.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza-mtp.dts b/arch/arm64/boot/dts/qcom/eliza-mtp.dts
index 1374afd9d14e..b280d8e845b1 100644
--- a/arch/arm64/boot/dts/qcom/eliza-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/eliza-mtp.dts
@@ -417,6 +417,14 @@ vreg_l7k: ldo7 {
 	};
 };
 
+&gpu {
+	status = "okay";
+};
+
+&gpu_zap_shader {
+	firmware-name = "qcom/eliza/gen70e00_zap.mbn";
+};
+
 &mdss {
 	status = "okay";
 };

-- 
2.54.0

