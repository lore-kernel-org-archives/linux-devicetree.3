Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EC0F40EB9C
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 10:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787220531; cv=none; b=gJd7AcA+abyaK6z5S3+N/D0DgQsUEM4MuYXp8iQB9+wS6Y2rcMLJLVgLUmiBOxn8ihP0B6Z/GIJKB24aEicHJcgBz3VQIfkKuXho7GyROMs//fo2FYJxULUQfgdvj9N7EIOe4c+BvSKbMvkvumZzW51VVuA5/ZOcba96Kt+eLus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787220531; c=relaxed/simple;
	bh=ivFZTMy2U9W+rvDCVTji23OilOk8MA+0adR4aza65Fg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=I53r/i+jyDBZhLIPmQk/7k62fOoFmca36NTR/b0DT1+SgiVoApTw0WDci6miW4ISYTy0HxWdE8IIaHYA0xsW0b4OO9tOQGaCMKByF//gj5sYN0AQAjEq7xqaP5nknAOIoIO7DdZtN2rXd6i0SFn/XceQAlV0lVdWBTWq/zJBbsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d+m/U9S8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iLz+9GtY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d+m/U9S8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iLz+9GtY"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67K6edRG2161228
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 10:08:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	T2Uj7I+c2RWFNa6rrzX8ioPvVR44VGhkXy1dJC/mw3I=; b=d+m/U9S8U1cftpkQ
	+das9v1w3SbS8jvvmvNWutvC/88PbMASIauYFuW4kuJkbzC2iCHjSJLUDe6CgY/H
	dML0nsPkIlkW28uqprqH7bteVCZxOqRYtWzlg3u95pmKiyWlhXD/27+EIaoi8Ygw
	Ccu3TzRhibldlFIDRCNXeaE8uISNF6yTwSLsDaa9I4Zg9ItqrEa6VqthLVu2o5jS
	U9o/2VQk8mM42uaq0Mx39xwv7zMIBmB1Y5Iq0DGujFxgnmj4tcVtjOxDe97NKRg+
	yxeTOk8k3v1kGSOT4XWxCsNub7rCfPWOXfdv2YRBXrapf7ARXdRZHEvTrtiHKQkJ
	u+iAKA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5vh7rru5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 10:08:41 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9349c5af52bso346296585a.0
        for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 03:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787220521; x=1787825321; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T2Uj7I+c2RWFNa6rrzX8ioPvVR44VGhkXy1dJC/mw3I=;
        b=iLz+9GtYJXSXL4Cd0MZAA2pkto8LNGvXqaIouR6PZZKV6V9eHGamwjTzzo+JF6cMTl
         mSK9sJOW8vSz1lNC6Zq6qqB05WxWn5xE6OC+ziCNh2IKkrc4pEc5884SGhpj+Ty+NlAN
         cZQ5RHGeg5HSgPrN5U9Rxqxd4gViTol1bwYN9VEL/nr6TYsZGBL9jjcvNC87ionMEg2l
         Pn55c0jwtekMtsKTcKkmwXfuZ1fXkUpk1Bi4ory7jL/XkYn3+E8h/9Y2fgo5vUbI+YZO
         ca6CXhNaXyi8DK3jesr2NMBTRWkGfS3vbsdc5qJLqCQg8oNLOB5cLMX/4J3mt0bz7ijf
         CMeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787220521; x=1787825321;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T2Uj7I+c2RWFNa6rrzX8ioPvVR44VGhkXy1dJC/mw3I=;
        b=lD44eO/vVSZKJAXGtaMx+7AhAW/AODW8yY52YKAcBGNAaJG4lSCS7L+CRXKOwdFC7n
         3yrPIKFjlLQpn4rpOLOlS+zXKL78IfCjUE9oQjgeTVuzWMRO99Eo2UAtZ00EAWPySVia
         mS7Qo/3vpUKeI9STBM/iXWj/sWt3SLUz0yoVI9fihN+faYZZx0I8o4FgMlzDe00Xm/on
         NZJ4SeXgmo0E1FBeNBJA3zQcBJ8c0IMvR3hsnHnAejgAgbo9QUvkbfEU+5TYFvtSIRWu
         M+rBNO5px2mV2zkxUb5Dw+Mh+O75QAWamYTL3EnQL3g9SYjRThqVMX/OtFx6ce5je9jH
         SD4Q==
X-Forwarded-Encrypted: i=1; AHgh+Rrc4RwNYf6XtcB6DHdShzFJx0NM49PaWOKRhjc+9Jn/Cck9P9D+K5MZvq3J00nzaHOvCTJetCWjEajJ@vger.kernel.org
X-Gm-Message-State: AOJu0YwcnkJd0yMwA/qtO+pxMtBZXG89ZHhDgWtgWq2OM1qZgjE7w9kc
	wiIzvw1h8Bg4nDF/hH3aoDz57rsbUoAEdmJen7b2OC+egf9SS6FE0qxTsDYcYMZxN0helhX6eCi
	C+mrtCJalyUjKOO6ebQpri71tNdjU8mnplWVTvy7dH5vxX+58irFfLQOixQBVHgXL
X-Gm-Gg: AR+sD10a3zq3lQgxlStnj8DlGoNQ6vmIal5ZkcNkQSncZlr3ZbGdJVRRsJZZ1Y/Xfsn
	ajZWZFBOUaSqZMmcWTPDn6bcysnhA9AsARctzdZp3wZ38yfceCt/om1luHHccbZxPrsPnv+bjJj
	cmz86LBxbACZYXObLqZCT1fhBBKWDOHlS0ke+qaHSKOhPXrpM6nCARqOyVYZuycemtgjkgISnc4
	Gb5yGYoXnGINZ//wL1ghUYc0DzpqcggNhvorAqL95akp4FA5vOc6TzWqxzKv6AcdKdkP5u0asCI
	qe4uHZ7lorsksmBZ885Vvl8/uTbOROH/SG/vONXJbaeWKo96teIyLR/eGcdj9Ycnv/ErQqayq1j
	eLojqpFR9
X-Received: by 2002:a05:620a:72ce:20b0:937:2c63:22ec with SMTP id af79cd13be357-9372c632bf7mr275840185a.46.1787220520811;
        Thu, 20 Aug 2026 03:08:40 -0700 (PDT)
X-Received: by 2002:a05:620a:72ce:20b0:937:2c63:22ec with SMTP id af79cd13be357-9372c632bf7mr275835685a.46.1787220520258;
        Thu, 20 Aug 2026 03:08:40 -0700 (PDT)
Received: from [127.0.1.1] ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499aa1755b2sm134966935e9.11.2026.08.20.03.08.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 03:08:39 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 20 Aug 2026 13:07:05 +0300
Subject: [PATCH v2 02/16] clk: qcom: gcc-sm8350: Tie the CX power domain to
 controller
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260820-qcom-tie-cx-to-gcc-v2-2-e67ea30d8b7b@oss.qualcomm.com>
References: <20260820-qcom-tie-cx-to-gcc-v2-0-e67ea30d8b7b@oss.qualcomm.com>
In-Reply-To: <20260820-qcom-tie-cx-to-gcc-v2-0-e67ea30d8b7b@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=733;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=ivFZTMy2U9W+rvDCVTji23OilOk8MA+0adR4aza65Fg=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqhtHdzaALfE2vnHJt5ATIYhHfYQy2oQa1nfEUQ
 60P8bpe52uJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaobR3QAKCRAbX0TJAJUV
 VluID/9YiHReWFm2wUlZD3t0BDNQ6GQzfhOso87UJsLFhGc4CT5YovinQwzLoPrTLEwH4H+YWTg
 rAzu0Iy5jWx4gOv81i2osuIhlz659ZebIyd8TiEVcfbhj5KnNW0usqiL2N8ExmXwDC/34/W9Ay1
 +KHd42EIbmu5mclcdEjxuVmb72dwZatRrofGrxdRYjnf/85Gymac74czlv3wsBHjHKODnRx3Qjv
 t55XLAFh8zQJPiXB8PNVuzeV5nerVO0xpI4n2Odi4vjmpTKDKvRplc9qor+L10FHA8fVL39PCCs
 P0tPNNb5Z4Knxvj7YkCKm9rMD0gwZxq+5RwdchdrZsVBO6qrobN5D31CzVKA65tjyy8HQnjNSvz
 vu1EIEGdwwXkOU6IHv4LgdEQmfNtUp46ZjoIxub25WWYXirjYQ4mZygGdKjo7+VOpr4CsMdkwis
 zYjzYJafFu8SyQ1eCRT5IBBmisB7P3K0Vpoj0uE7lotTbVCF04xizRnb8yHvAnNJ/R3m4jCf8/u
 PPAbZ3CIZ4cGJMp0l8VLxRYq8P212l11lQS7fJonhPw2faUZOeGfTkd4U96w29OMtuNwhx2uWkR
 KnL0jtEIt9xpj8j6BZoEnBdEabqMavG/GZ5hLSVIJz5y6jk+xUjEwtZl5smq9r+KmJan5LEF8sF
 sHo5bXb9IJxJ3Vg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDA3NCBTYWx0ZWRfX3F3rLLnKiier
 EDMBRcnvSLDImIcnZPLLdsYwxZqXMLgiA2SCa0WpgvosYYXY/gwyraJr+gv/N+hi+xWFRftJDUn
 hqto025XNrbVjItcoOH2kmVMl9qugPZ31SbPwQ20DAWxa1l5yu6HquKyBOWoercWdSYDhHEejdK
 HNJ6WPS4qCS4zI0UznTJNW144lZ46y0I9kgrxWERL8gAou/wi2i8ZPG2yMA5tq/HPv+6Cg4sL/6
 oTfRulQgC1HaWqqKz8gQRAB8TlFVYfQsk0ElSbw5x5GVlhIQ5GZxZ0/ImCAVJSh9Tb/lOV6IgcV
 3aoN95enM8yNC2hYQEWhjIMD3j1/PrDBn8cu1GPd9H7EgX8aku9zwopDZBl34f9gDdS7bCSA1xa
 IB9hn9435R46hiY0U+CVmH/BOGwcEMqqeM9BW25Mqu5F1rF/t6xDiyrwur9gDtr31A5ZFQ2z7IC
 KdD+psx42ycsrrjtraA==
X-Proofpoint-ORIG-GUID: nd_h2c-05UVSEV18mTEz91QY9IYBoItL
X-Authority-Analysis: v=2.4 cv=Y7fIdBeN c=1 sm=1 tr=0 ts=6a86d229 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=j9QDv7RGPiaZsbg0A-cA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDA3NCBTYWx0ZWRfX64BMAN6HEFVH
 4czu3IgyqfLi/KsGSnZDSBKgMVLaHNjQlU2XsoGgYR+MZaLbxXH+G4xIGJcvznhqRnPx8TCRmzW
 e4As2WqFrXifcxYVRXxE33Lge2Drj0I=
X-Proofpoint-GUID: nd_h2c-05UVSEV18mTEz91QY9IYBoItL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_06,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608200074

Enable runtime PM for the controller, allowing CX to be powered down
once all GCC consumers have released their clocks and GDSCs.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-sm8350.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gcc-sm8350.c b/drivers/clk/qcom/gcc-sm8350.c
index 2d94f3046b71..996ee8592fab 100644
--- a/drivers/clk/qcom/gcc-sm8350.c
+++ b/drivers/clk/qcom/gcc-sm8350.c
@@ -3786,6 +3786,7 @@ static const struct qcom_cc_desc gcc_sm8350_desc = {
 	.resets = gcc_sm8350_resets,
 	.num_resets = ARRAY_SIZE(gcc_sm8350_resets),
 	.gdscs = gcc_sm8350_gdscs,
+	.use_rpm = true,
 	.num_gdscs = ARRAY_SIZE(gcc_sm8350_gdscs),
 };
 

-- 
2.54.0

