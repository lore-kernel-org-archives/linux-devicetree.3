Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D509639B943
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 06:29:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779690594; cv=none; b=l4nOqQyEqW6dmdTGYmYVm3e1w7Hcw5pFFTZ1LAr2tgw41k91rLmgws8O9qVN/tEeVqR/6+zRxxwAnMA6GywW9vvsTtzptRevWEQglwstH9VK+fIaMzEf3ZdMfVQq0yrScHSWrgUYJhG5JYDqYGUGJJvQctbceSrbLKWNaHwCKRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779690594; c=relaxed/simple;
	bh=klTowYgdEB8buioRr0OOUIRkEziBDxYFkoD80S8wUVs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=hrIhPiAYGtmyUsVIFnLA45qCyMIxx2wrTo1uGYwS5ctL4tRBT+oCjX2kRkjFTLK2d10oNversVVh0B9bLEpuAECXuVcrINiP4aAunmhP//dIWzZN5ugbZ77cSd4GXzjqnxCkyF8J74v6JgWh8Rf+mmeDYGdl7FRKMP9E9dYiZ8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R9j36+9u; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XVdHQNr3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R9j36+9u";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XVdHQNr3"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64P2rHX7206656
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 06:29:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=1ARXZPf9Z4FYIOd8kvk9TD
	SdnkIZZ1l99kqXftbEF0E=; b=R9j36+9uCmvnVbWrKVQdqQp1FTz+pBexRQEeKn
	eheu8VZtNryBIXwpizfEplb76q2I4VohrUWakXMXd3lnDtxgOt+sOOKgqCkGWRSZ
	DPD/MLO2i7OoXt1xUQt0PvhStU54VAswo/YX9AOlNNxxSPeSlsRkWNRhLebI/egi
	l0klkXuBQFLmPQ7L9icQUQBeVzTdWRD2/T+fahfo76WKlyKjoRBPkZcqU7+JeEvY
	Sl8TwrRQWWB+MKyjq1p7lGR+SMxQRdzhoCrDZE/OqRjtxqJP7TqY//J9lSRCCPyo
	N78NWW2AMfRxnHJXY+gWM5oa0UAqnKWj0o9lNpqN8Ic1248A==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eb4m7n89r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 06:29:51 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-304448ab58cso1745973eec.1
        for <devicetree@vger.kernel.org>; Sun, 24 May 2026 23:29:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779690591; x=1780295391; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1ARXZPf9Z4FYIOd8kvk9TDSdnkIZZ1l99kqXftbEF0E=;
        b=XVdHQNr3SXIJQQ2f3U/LyYmQttT9LpQzEINnkp3kuzH3OgD1jalW0of3foRQ6dGgoR
         jMBHu6/ztcl+kGMpcS7tV0rf0uRJgVn8jVR9L066BCjONT/wuxphD9Ey5exQ3NvOWjp7
         8pCbV1KLiOcjZHed6VYxEydqPGL9ThyvY+9oZ8n/i7j7trU53i8KRzBxq0gE8ozSnR/C
         XvfygDW3XunY3cYNtXEcJVJCIXqMlivbeQm+AuWlPp4O8hTNq+cI05nEHeCvRggo2FBW
         snVgr5yOwgcX3VSUHSu3P8yaGcIHTGxfPy0EY4MPRskvnM7n1I8O2MgGIuDiQQGZ0LmM
         gqdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779690591; x=1780295391;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1ARXZPf9Z4FYIOd8kvk9TDSdnkIZZ1l99kqXftbEF0E=;
        b=AxL4Xk8xwmFQgzFKp9lTUhAPIomq6yHkesrfi4z+tsPxp7RffP928Dj60FAVpiq0xR
         tQabrI5i7M+HcSZPjwoi3bTflnngrRSvOLzeXrBckSmZFwB4MpDqik9PWBygW35U4H2Q
         j5FVP7acOYzerBS4yqt+zt/buT0aPg17mkms4tvNl+0Dx0A7Tje0Dydb0HQFs3wYwFY5
         pOSWeW7Gcj4G5t40BuiY5fE9YwvjUHiq2hVx7tRXgd3V1p4mBo3FkSJUwfuKsm109aWa
         7Aefae7m8Wtj94KzmijoYJaIp12+XuQwNIFirLr0E+fGtNsrUU6Y+Lj+NWN4nPel/zGm
         9chA==
X-Forwarded-Encrypted: i=1; AFNElJ8ijE+TcN6LIqrkAWHjn8fcIcp/HvwdMSot+vCTIcNJjIqLb1XCZq2nJbHzFs9CQrutvbXFX3G7ORhw@vger.kernel.org
X-Gm-Message-State: AOJu0YzHIGhMiNn7hE2KdfutEZakR2TMJ0qpamiqKl6Fb+h7mTNg3B4b
	zhfQvsOA46Citw5JflKIPteG+u6Se+iIJ3dmzeUCZF5CQIaD6+F/KQtkf1PtjoiJCjF/+4kqfw4
	rn+42dIWtAjX8BvZqohOCMRrvze9FPspblC3Z0/mw0LZz3KzIrpeNwBoPEz2bCMPu
X-Gm-Gg: Acq92OE5MhUw5EoqJR5sC6Xm+giZKJYfhjke08OgQera/TIMxZ530pG3beOs+Y2iLHN
	EtLXRnVe0cAVqxNnYN+I6rxZSujfwPK5KZkM0JLL0OIh+Wf3lfE9oXSHTrszf+RlqxD3t5wEIIa
	7wj1xL+0UH//UaAtrIJvq456sIb772b1M7WDOTgOd12golX/sZkCpFXspI7YFmP9ZBKAFDTz3ep
	yhDc40mN0AGox3v16TkJ7JwwdHSFTiSFeEQUUSYmfrSsWq07aOp0bG3cvKk0yP+sc523Ue0cunL
	i54l6MxrZlK5V5t1lY/Jb8xiOYfam4fJmGBsrst951St/uf8Zu75qYWdmf69vHyIuPw9vAdoI89
	n79cdMCFRBAJYrnatHsHeK6+hr9mhTtX/xxgtJRqJ6n4LeGXMZ+PAXS0Bzsf089U8eoWKooc4
X-Received: by 2002:a05:693c:3b0c:b0:2f2:8857:17f6 with SMTP id 5a478bee46e88-30449037990mr5765666eec.4.1779690590728;
        Sun, 24 May 2026 23:29:50 -0700 (PDT)
X-Received: by 2002:a05:693c:3b0c:b0:2f2:8857:17f6 with SMTP id 5a478bee46e88-30449037990mr5765647eec.4.1779690590138;
        Sun, 24 May 2026 23:29:50 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3045223103bsm6918036eec.16.2026.05.24.23.29.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2026 23:29:49 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Subject: [PATCH 0/3] dt-bindings: soc: qcom: Add Maili soc related bindings
Date: Sun, 24 May 2026 23:29:43 -0700
Message-Id: <20260524-maili-soc-binding-v1-0-fdf9f9ff1b23@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFfsE2oC/x3MQQqDQAxA0atI1g3YoFV6FekiM0YNtFEmIIJ49
 6ZdvsX/J7gUFYdndUKRXV1XC9xvFeSFbRbUMQxU06NuqcEP61vR14xJbVSbkZio76YsbddDdFu
 RSY//c3iFE7tgKmx5+Z3iQnBdXy4Rbml6AAAA
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Chunkai Deng <chunkai.deng@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-3d134
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779690588; l=820;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=klTowYgdEB8buioRr0OOUIRkEziBDxYFkoD80S8wUVs=;
 b=nnVieUCb28brOhQUhccFjy+iyGTjKrAwLx3Je1+L9F59032UMMSfwQHyLxpuw/q2yuI6kR/oV
 Y+iaKaeTDt8BjTr+UqN90Z/Ab7GkfvnOkZ8TDzNNwAcouaZVu4j7+a5
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-GUID: l4G12Df6Ql0-GASkDA0W9CGp_lwPTSks
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDA2MiBTYWx0ZWRfX49Rd6eEpiVvU
 IcDLsjBeNs+6c62xnjfFtpbuTi4x/eMU/MO9h0q71QYXYI43eVGItXAryLTGvZDPUNdOry3lKUm
 GqalawsWpqmx3N6JmcKNsUzQ3eOXGiKBTVcA63aDF53xPG/u2L4r2zxzgT5iPNYZ1PJBEyuzGFG
 ojOCNtlTS1jooMPXNOYUhTRfWK7SuEyslvLFdex5mRsziPLuMeOAeqSMOibZjezdESf58OWEtXE
 xpCLO4EL+3RM3+dynBFEbJju7Uapem/WM68hGB9UTx3O/CeeCcgC32iJHf5eH0HqtA8O5A9n9SD
 Q++kkwq1iDhk1nJ1tjlt4IY/YsxE2jL/zt8I6+uQSgUNKilgm5tnV03Qa26xxdCsBsvIYVeT+gu
 6m54PgSMD6y/hwEI8htyYexilF0kihBdlietZIwJ1rX6hGsqa00ppKvUDNA5we47KJR8EN/BPIb
 pgMASys8nShyYFHKmJw==
X-Authority-Analysis: v=2.4 cv=MrJiLWae c=1 sm=1 tr=0 ts=6a13ec5f cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=OwyURWB_y1r3m6W9eiUA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: l4G12Df6Ql0-GASkDA0W9CGp_lwPTSks
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 malwarescore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605250062

Add soc related bindings for Kaanapali Platform including aoss_qmp,
imem and SCM.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
Chunkai Deng (1):
      dt-bindings: soc: qcom,aoss-qmp: Document the Maili AOSS side channel

Jingyi Wang (2):
      dt-bindings: firmware: qcom,scm: Document SCM on Maili SOC
      dt-bindings: sram: Document qcom,maili-imem compatible

 Documentation/devicetree/bindings/firmware/qcom,scm.yaml      | 2 ++
 Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml | 1 +
 Documentation/devicetree/bindings/sram/sram.yaml              | 1 +
 3 files changed, 4 insertions(+)
---
base-commit: c1ecb239fa3456529a32255359fc78b69eb9d847
change-id: 20260524-maili-soc-binding-2a2287fce578

Best regards,
-- 
Jingyi Wang <jingyi.wang@oss.qualcomm.com>

