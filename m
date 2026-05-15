Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4982A46AF30
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 10:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778842091; cv=none; b=hxnM0JYBkNZ/gRBAsKEROGFHgTsiaoetj/IaTC1gYt/YqyH4BuZ/HMj8GQQv1UH5ap9sj6RgGrvvpTUdvPNM1OL6MB2+2qB0UXEMiv7JIVpzgivxEuvZRrVI4FP63DH03sK3YYwICu2EsplvbZuigGZ2IxgG9AvmQGRxIwT4z4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778842091; c=relaxed/simple;
	bh=yWUkKCxpknhAXq/88uPPyHdo4U2bnW26ExLNI4eK6vQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MHPk9CikuBJLeIOIeAL/xxRjDti2EpSXCEcCZB2MrkQ6oMSQneiDfaKvVflFJGKnFCwd2sMR2qIL9JNJmRUzPq1QXBQheeT1fmy1sAxRFRNMTjVbgd0Ai413D6JwhXVovCHekgkWjsuU6UEHup4hiXlUTHoGnfK7uoaj7ZTI9sw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UuoHn+1N; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Bwv1lmKs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UuoHn+1N";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Bwv1lmKs"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64F5BW3G1847945
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 10:48:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mWXgiQlzWpIuNL3PuoPS509A8qqN1Lj48ZNShMaqLiI=; b=UuoHn+1NOgriSVno
	EEcDXEWwwXDApCs+f26l9CFuUbzJIH+6RKA/PaS9v9vRcW7+NUYCptNtuosSd9D1
	IdJ1HVvt3z8uywDWJl7BA/UE0UPJgMYPU/Y7D/A8NVSTR7cq67HqvVDXwX8tILKu
	0ga0Zbx1nESMZfP/HrruNi+D2Wf8ptZ5rgmR84ZTnzI1WhdKgPzm8oqwSOUAyTO4
	Mjnw4D08G1BB70nnH61YQAC8LGi4kb/3b0fy0U5kEv6UTDYaq5KWPMA1qvoaMt6c
	a9AVVEISilLOhvWnHrHC7ZUbVnd35pBL9rXqV8Z1G1e6Nf6vu/FFKgj3ejSPHCzw
	LZjI9A==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1t2v54-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 10:48:09 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c827bda2e60so3991490a12.3
        for <devicetree@vger.kernel.org>; Fri, 15 May 2026 03:48:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778842088; x=1779446888; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mWXgiQlzWpIuNL3PuoPS509A8qqN1Lj48ZNShMaqLiI=;
        b=Bwv1lmKsnI7/nJ651YeCDKo1fq2hasPP9buHMVCc5gQmew6M7gFY73WeNqSfQcF2m5
         TgSJix8mJvJ+PSjn48FLc0QyIenc3jQdEcnW+py5RUBr5CwcLPA7rqbyk//2vIGmfC9w
         f49vUetIGaiYNF47zLde2e4pxPZt9Accwb0fSKrTMHgyo9sm5Yr5GV8XyoELERcVf1a3
         gNVP9GpEiaZgIe8fPzn45aP7kbj1o8InBUV0aixh4ZrO0BCJ1Az0Bjm2LqzT1R7CKoJ8
         A3TfG88XRgX9AM6EUyRvgF6UJE4SlaO4bGyVqaLdW1LueadwkGIiLlrKycoiwIXWyeA/
         6DKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778842088; x=1779446888;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mWXgiQlzWpIuNL3PuoPS509A8qqN1Lj48ZNShMaqLiI=;
        b=W02ClDTL+gPpf0t/hOmxaV8luMZFvM92Wp46yTA9ioo7bIbYQg99gOtQazHANl0Kao
         2Z9EfH0xioQf0n0wDhK8Rywp1Ev3jQYP0Ivtor+43RGpFweANBk8I0F9yqB85xhN4on8
         Bpir3MT99puKKfSE8y48KfVd3a7nt3Xi1n8ZxfhlfrVz5XzR5fXSB5fE/RC1ED130WSq
         si2hHxQVPnIjq+k4Syy4n/EwI42jZ+wu+Dm77/C/WZEIARL/KiCJ47ncJU2JoLBZm6ec
         YTSQvH6kBNvhwIZKD/5khpH951D7ixhl/wWxLloJq75Iqt1Pv8fMoPpO727NkUQRprg1
         jqEw==
X-Forwarded-Encrypted: i=1; AFNElJ/Q0yLq5vSk2sGLzYSnxqdFFCK5AlMycqpy7YZYR4r16ZZGbeUyEKtkSbyLdhT+NlYdlMNsaGqekPo1@vger.kernel.org
X-Gm-Message-State: AOJu0Yzb8JzZ0PYpg3yl1wqL+l/eUiA2Uv6MNk9Uy71L0eMMB616geNT
	GjyZOqejzgvl+KgFKdnsoIoHnr+brAhVRw6zodHXh4ZKLfmSlXufkOpYr16KxcQYm3fjtdgIsNM
	aMcIeaLP6uG7lWPcvUMm2yzreYV5F6tt6oWde02Fsa6GAOr08JCYsHGKJIKjcpZOK
X-Gm-Gg: Acq92OGQsTPWc6xiJ3LZEQkcd64Kg/qS7XFCmJHKVlPhwjhiYq3PtsrUvYEHxG6MS1d
	9/gJut2/6Y7oe2HSf+4jeyFVgvpRncGUJPSBG/MbPemKkYwHczjdCUSLSP4yCurGqKh6sUdRmf4
	mYnODLuJhsvzHdnNy6Mi617PxUAbGYNV83uZLgVd0EyJPhXTlUPUiBT797nQUYOOLPSrzZ6JQOM
	aF4omG1xlbczhXyXKUQO2cLB1fLIWyg7PhkibxKv4Ndd0rMaYFsVFcMZ2aMKfl9cxDXqtI4x3wQ
	X+sNBZtgEuKq/U2QcPfTdcS6DCe01jBeKceWN7b2glgzug+63QJOirqMKi5CYOq5MAbivj9TUcG
	0Mouwgq8Mg6SahE/9CgIHXm8uxjHhnlUpEnNSteqADmYJiCBBLbHXoUlWWp7/i8Wfx+heNGtRUd
	bkzAfNLzdD1s+TD20jutZferr/rv77ChFyeqWtLEE/8ks/2V2rIXg=
X-Received: by 2002:a05:6a20:4305:b0:398:962e:83d7 with SMTP id adf61e73a8af0-3b22ee7df4cmr3917214637.43.1778842088335;
        Fri, 15 May 2026 03:48:08 -0700 (PDT)
X-Received: by 2002:a05:6a20:4305:b0:398:962e:83d7 with SMTP id adf61e73a8af0-3b22ee7df4cmr3917170637.43.1778842087839;
        Fri, 15 May 2026 03:48:07 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c82bb1006fbsm4955221a12.21.2026.05.15.03.48.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 03:48:07 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Fri, 15 May 2026 16:17:45 +0530
Subject: [PATCH 4/5] phy: qcom: qmp: Enable ipq5210 support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-usb2phy-v1-4-5f8338d466bf@oss.qualcomm.com>
References: <20260515-usb2phy-v1-0-5f8338d466bf@oss.qualcomm.com>
In-Reply-To: <20260515-usb2phy-v1-0-5f8338d466bf@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=D7Z37PRj c=1 sm=1 tr=0 ts=6a06f9e9 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=--c7UDEKweIPGI6wXLMA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDEwOSBTYWx0ZWRfX1PW+OuvE67lY
 XKMG1oHL9zhsQv7fih71xHnpByqqYEVN03ladIEOYc+kk24b6PidhJ6emiF3kvLLmRfhyNaRWBs
 G0U/q5F3zgwr79BUFR/E34NoFbXlzFh8Aha/QGx1tcCRcl5Zq+srkczcSmJZY5EHN3Qlohqufcr
 ip1mWzVU0Ed4ZglwG7DWBuBdaS+UrJudkbw4g25Y+LvXEVWMNUusNxhAzCKOin7+eRpoX9TEBBC
 MSGaz7NbFoOpyDZij0WTTAoSFQQjp0A2OhZEl3aypZhcOsgvsoj2hsj/3CKndU+PNs3HPR7SYcQ
 2kvJUDzi/epPDJdqhm/rVdSeTO9AHtrRdDR0xGxzHQT2SWmfjOF4q4eeQ92L6o4LUKbrJfc/RlL
 MGxqJ69lvysRUvaJ4E4rW1KkzakpczUhTLbHW65m6U3CR5GIbO0truYHHG7PtxxzuIz/HTj11Mz
 OBtOeJflmR+jqZIkCLg==
X-Proofpoint-ORIG-GUID: I5Kprf6qrKbBHvNI7N--aVnOEBBccqdq
X-Proofpoint-GUID: I5Kprf6qrKbBHvNI7N--aVnOEBBccqdq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 phishscore=0 clxscore=1015 bulkscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605150109

Enable QMP USB3 phy support for ipq5210 SoC.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-usb.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usb.c b/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
index b0ecd5ba2464..8d3d7e39697e 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
@@ -2449,6 +2449,9 @@ static const struct of_device_id qmp_usb_of_match_table[] = {
 	{
 		.compatible = "qcom,glymur-qmp-usb3-uni-phy",
 		.data = &glymur_usb3_uniphy_cfg,
+	}, {
+		.compatible = "qcom,ipq5210-qmp-usb3-phy",
+		.data = &ipq9574_usb3phy_cfg,
 	}, {
 		.compatible = "qcom,ipq5424-qmp-usb3-phy",
 		.data = &ipq9574_usb3phy_cfg,

-- 
2.34.1

