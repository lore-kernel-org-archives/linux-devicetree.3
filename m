Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1C693246FE
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 03:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775792953; cv=none; b=kBhPjyWVdJT0G0S/YifPPqfgaErL8TF5HRFRHY5fR7MDk+NxEeBoy9YvCqUPrOK+vav3bivDKYuK6WRr6ApZsyAaMuSxjSlRin0cVl5YMZjylmf2xD5uEVRlkAMYXgX4x86Z/r4Mn9Bi/VRhARjVC2YylVIKTkx80trss1Ggk7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775792953; c=relaxed/simple;
	bh=kTq6lPmtEdVuss5Sec90PHYryIzFE7/jtO7umhTIj04=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=QxDF9+twwOtOqNfDt5xoVhZuPZprj+CyshZ/qQPJpbrJQjdLhkd8qCeRAmODucNnKKouRGDjH8fQ1jVZely4Tr/wQbgUgobXPTGFe9khaXOKoWZ3fR2VmUEHhXRsTeqvY+qNJId+Toex1CA3Rvu/caiPK/al7t6/8+rEox4JMEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GR0PMc2Z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c0keMAmc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GR0PMc2Z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c0keMAmc"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 639KOST7729238
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 03:49:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=yMvaOL/KzFTlS8jqm1Qwp0
	Ep+Esj+Ri93hlN7bcwQ4M=; b=GR0PMc2ZSrbxLvTHjk3RxbSIJJ7UdmRC5KP92P
	tEXAyFXGNRnw5AGxX6Z7Ij5kWulBlUiQD22ZSTQzvZBsgwtFGDY3VIeNe5JZPP7m
	676HCneK3imShrIA4emk2JLvSw8snC2T67LKb64odqWNxUZWjwvRG7zQaFBX6IHE
	pX2gcTl+ggEjlQk1Yo/7t+vNeRoYpWtHw1kyQQDwMrSi0H37yLnflZC0//zrjse1
	oiL5t4vtbRMuUR6SJiGfXW3BCCb/ZF2KI3WMxTIBa85lF2XRaX9wOhJwCPKxL3wI
	OsutxVC5vm+Cn7Zgrf4pIe1lExbfar98napbwx6MY3qENa1g==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dek4c90a4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 03:49:11 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b24611696eso13786805ad.3
        for <devicetree@vger.kernel.org>; Thu, 09 Apr 2026 20:49:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775792951; x=1776397751; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yMvaOL/KzFTlS8jqm1Qwp0Ep+Esj+Ri93hlN7bcwQ4M=;
        b=c0keMAmc0K3aIi+af8SISXZtSyutM7Ladwp9Vk7InY89K0/7/otY9SCBEmF6o97MJW
         r5WzI8l7cBE2nSRWKRumtdyUsr0rjO24fRKmKyT1/egTPcKN8+TSyItGjb3KlZoTfUp2
         jEjPAzxnW4SjJWBkvTymx9bO6WPo49xrDY7MRgHUXiM2FKgkJPfU19QAMHti6bY/PuCM
         piWJ7BJ0KD7vWDQjb0zdqr10YDqNFDdi4GEA5zrtPAwiQfjGS+lAPjAXasjVYcRpaajy
         4bjkpUCb8swAy2KEIAmDvazGlXDfWe9hxc0Yoa+nBUpbnoxyujQG7a625iKW5/0Q/4jp
         KwXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775792951; x=1776397751;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yMvaOL/KzFTlS8jqm1Qwp0Ep+Esj+Ri93hlN7bcwQ4M=;
        b=TiiU7DW7JpyIALPCWwfnbCIPQ7YdgscpOSZxRnXzxlsZOIdjqL9pd9K+Wkm1NTJvrX
         +XsdSPHxXMAzaZvc98ZC8debQwe0SVgFf273KS8zLB3MGembHembo4m0uhTuP2QhFrJG
         aflrBLiyB2mm8qKEqsrDSqiXdQ8JPe+mrH8Z2+yDbGg3BXH6ErrxxK2aRz9LAX8kUClK
         eptWOz4wDSFvkTNdWq4r0Hmr49yJDNJhousl3iz7AQoboRnt/O38t0xkvv7UZg3vgAA6
         BE/fvq/iwEU6tct6P5r7C6i8GCzHTfy9Meo3RD68F1gyc9McfNp3r2D3KgO93BwiSdUm
         7I9w==
X-Forwarded-Encrypted: i=1; AJvYcCXIZjP2v1YZ5uMrFhVD3BHzc1o0lhOi0uilyQrGMqPgTea/jfi9UeQRvzh9Ua5qqZ0blziQ7/STRUOa@vger.kernel.org
X-Gm-Message-State: AOJu0YygnlMFoLk1ubT+YW+8/tvPVT02VkhIZDMsv4dRhEO2VwC/Tdm9
	NjNECvyzNt26te3UnCJHyocnVxI+FWxdraojnsIY/eq8O/MtzB13h6C7ubPx1M5sUBm1t+69r4R
	vqSW/5dLjp+YOUg2RKwshheOEY3xLTUKDlWzknSJkknT36iAxiTNzjWvah/vacfOi
X-Gm-Gg: AeBDieu3mvHUUOnGt3IV/06oO5zfGzMKhjSWHUIMetOpO4L5c6U+Z/5l9BbQ/R7OeZU
	LJERaJez01P7O6UgANqah5ZB9TbM6awtf+EjOYYAG/VnwNLzsi1lMrOSXsUFY1/6Tt//boFBw1A
	zALEywLYUgB/HPCAk8rNBRAHyZdjdNNn+FSMX9f1uzHpSNH9DAAouXUH2x+ut6DzYY0RAVmfj85
	wlQY5cJmRS6u4lxeIf4jqk04Ezmq7WGscOlfUOIGY44AuGdA0QoRqmVjLx2ccDr4lrnp6zDYIxv
	HFrG0x8gbTNB+eQJcfZ+1Ucoz6duAKGML3HsHTDtcJILJbD537S+J+L2X1R0Lv2AsaMatrgReAd
	2XROOpNdSL0Ibpqz7ZUM/rDX0Q0e7AMitVPVPV2VUm/2GwA==
X-Received: by 2002:a17:903:252:b0:2b2:4697:78f6 with SMTP id d9443c01a7336-2b2d5a8b81cmr16792505ad.37.1775792950892;
        Thu, 09 Apr 2026 20:49:10 -0700 (PDT)
X-Received: by 2002:a17:903:252:b0:2b2:4697:78f6 with SMTP id d9443c01a7336-2b2d5a8b81cmr16792075ad.37.1775792950324;
        Thu, 09 Apr 2026 20:49:10 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2d4ddcda9sm11588185ad.28.2026.04.09.20.49.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 20:49:10 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Subject: [PATCH v3 0/2] clk: qcom: Add clock controller device nodes and
 enable clocks for Glymur
Date: Fri, 10 Apr 2026 09:19:03 +0530
Message-Id: <20260410-glymur_mmcc_dt_config_v2-v3-0-acce9d106e72@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAC9z2GkC/42NUQqDMBBEryL73Ui6obb2q/coEsIm6oIxbaJSE
 e/e1BMUhoE3MDMbJBfZJbgXG0S3cOIwZlCnAqg3Y+cE28yAEiuppBLdsPo5au+JtJ00hbHlTi8
 oDF1qRElXZc+Q66/oWv4c088mc89pCnE9nhb8pX+MZklhTW2dlTfCqn2ElMr3bAYK3pfZoNn3/
 QsKFFH0xwAAAA==
X-Change-ID: 20260303-glymur_mmcc_dt_config_v2-ac59220c73d1
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDAzMSBTYWx0ZWRfX19pMioDEeVNL
 OqBWx3/3uminS1NAjZBzAdxFF4PFxD0aJIqke6BKd5a45ke7LsRcZ0dpWnA8WhlF02/zG4JhgLh
 qQuje7tivWDP1wVKlu6g3jdy9K2n3KAPbr0l+JffolJgBcwBPYppaTkO5rslgeRBIgAfH52sOa9
 v2uiQYeIpZL5EPUvwcjX+4dgxQXZzU9yfZROgkV+RNH8SDBMrumbYlspLE8CN2CNjouuLvjz30e
 quZxS0tpevFwxiAaXf13zYEGhBl0BV38Vk9KSFf9J53A0/1D1qfz+p6CFCnEC12RjvUOW+XdivF
 AcQuQGCTTP2iEct9eV4wBXNBhvIT3fWbaK6WupXwIjKe6ipPXrdWCXckfCMXqXkFMFVqbWeh7Jn
 VH+WUVXIkZ0ti8z5IcY9GlrCtFIdl358zMqyC6IEG/Uu4q06dbJlCIFsg1aFhpt3Y2gUNiwGGsZ
 iF7R0KPEYVbV1SSt+fw==
X-Proofpoint-ORIG-GUID: WF3y6eT3apQYxvx_E0qvWYaiMc40y7lE
X-Authority-Analysis: v=2.4 cv=fZmdDUQF c=1 sm=1 tr=0 ts=69d87337 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bpG4E-VrZjG0UIdspakA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: WF3y6eT3apQYxvx_E0qvWYaiMc40y7lE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_01,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 adultscore=0 priorityscore=1501
 suspectscore=0 clxscore=1015 phishscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604100031

Add the Video clock controller and GPU/GX clock controllers for Glymur.
Enable the clock controllers for Glymur CRD boards.

Changes in v3:
- Update the GPUCC node with the required power-domain and the
  require-opps [Akhil].
- Add RB-by tag [Dmitry] for defconfig.
- Link to v2: https://lore.kernel.org/r/20260303-glymur_mmcc_dt_config_v2-v2-0-da9ded08c26f@oss.qualcomm.com

Changes in v2:
- Add RB-by [Konrad].
- Cleaning up stray 0, and add 0x0 for regs.
- Add "Qualcomm" for defconfig commit subject.
- Update the subject for the Cover Letter [Dmitry]
- Link to v1: https://lore.kernel.org/r/20260220-glymur_mmcc_dt_config-v1-0-e0e2f43a32af@oss.qualcomm.com

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
Taniya Das (2):
      arm64: dts: qcom: Add support for MM clock controllers for Glymur
      arm64: defconfig: Enable Qualcomm Glymur clock controllers

 arch/arm64/boot/dts/qcom/glymur.dtsi | 47 ++++++++++++++++++++++++++++++++++++
 arch/arm64/configs/defconfig         |  2 ++
 2 files changed, 49 insertions(+)
---
base-commit: d517cb8cea012f43b069617fc8179b45404f8018
change-id: 20260303-glymur_mmcc_dt_config_v2-ac59220c73d1

Best regards,
-- 
Taniya Das <taniya.das@oss.qualcomm.com>

