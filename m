Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D1113624AB
	for <devicetree@vger.kernel.org>; Mon,  4 May 2026 10:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777891735; cv=none; b=WRE7IX+xuzBx1IkgJfa3OnfKT/HaTQcF+vpAR6WEMdFDwJ2CDkNTxPPXc/dOnLvFWV8pTZFgaLbfaJSWptxLMTqhAQQk1fcEN3+52y01al8Mi+80y6fIBQIfNEFh8Hhvocog1SRkcJIGupYG/Fo0B36dHgr/4YYrbfT8HOqfm+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777891735; c=relaxed/simple;
	bh=uTlUQACvmbDEV9HCwCQjfQKmIVqC4d7G2qr1KVpX1w4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=RHGu68p6l+nRLrZF0Eh8V/ku2wHQ0U8RH+EJ/CYZ3LPTnLs0lDVsq3GmAtf0DOpzp8ZDyKCng1Q2laHNSXCnjOndtizox9iij7b3Mb5I1SAgbzlHYwn5qC8iDvEjtXjolG1slgTL3o0b8O2m30AQ71XPhn+gGTvVqcFJkFbtPVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H/ddTn+W; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FB6HewFx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H/ddTn+W";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FB6HewFx"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6448fL0a2777155
	for <devicetree@vger.kernel.org>; Mon, 4 May 2026 10:48:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=OHF49pHPHlCswJGS2RotCL
	4VQnSkkpNWBztrFc8PQfQ=; b=H/ddTn+WfUAfK1jZ2JAhJAmv9YxiXwqdcq5SRX
	5jVhnWTrJ1ss8H6TgttsLRvhcPQItq/kOdWz1vgqwGeKHmjWVeF6dwtV6qX0SYal
	1DPqPdD4HStZujeV3wNnEi7/nJFjhi7KnjEjLLkTdisvk7ZlwpkHIt09wa4vZ8nK
	8Nui8q6x20pZ5hpYCm5PA4+xYRSPOAotG1w5z8Lw032GjqLRqlU/aJC2jgWcAdFh
	NHi7DmgJU09SwHzLOdN55hb+CbUmoDtVhzLO3/n1/6tXQ/soV4GqpVksJtpxBKk2
	TO1dMasVfYIEo5fe9zn2M+1nbrdKDb5F0UkHYPnW28obW5dQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dwaj7da1u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 04 May 2026 10:48:53 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-36531a0f95bso1066708a91.0
        for <devicetree@vger.kernel.org>; Mon, 04 May 2026 03:48:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777891732; x=1778496532; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OHF49pHPHlCswJGS2RotCL4VQnSkkpNWBztrFc8PQfQ=;
        b=FB6HewFxioFrgafRl33vyV/1EV84NxWLSbLTLPS8iIsJG5ZjC3KboqYmj7JHFOAgtV
         fjj35YdtxXPAQvQhb/s6306fCHUgTG04uAexEtEWW24wBrrHDJ8JQklUmbGL9lw/cY5t
         TZnzO2g8ZZU+x6PmNsyHtCd+DturkaEFLRBrVNNbNUyym/PQL3iY3A8lYcQVfVYjdH5u
         gQ7uUSJFhn7EcLYcM7fvTVT8mVeDVLHi5XnSFK0qqkdCk8j/IHJ+pA+juLudI30p0bBE
         jRu58Rjh+laffECFxIV/6D32HfY4+VAo63oiMilc9LrVYs5t5wyBzZw+g+aFaBTIdQqc
         8CIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777891732; x=1778496532;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OHF49pHPHlCswJGS2RotCL4VQnSkkpNWBztrFc8PQfQ=;
        b=N6tCBIFsCLCb3KHoAXD3A2yjIQqpSHqXM8dbL1Ao9/keqs97S6hPlDyisAZj7GSiSz
         wnGU96xpLMChOyE25A8y2R/OhXcjz6Ze7gpe+3DQ7nkdWM+YgE8an8muj8Js1g+7rVI/
         IZCpSXsf1dceDZyPeNLxIR8MwjXevrioUcsiFQlYKVzZYOkcH1xYFX2MHmEEjX8Gp6KY
         nDqKQvJkm2yRBqIKApodpl3TaLQoP+YepJXG15PzJyYF8FrdQ30NDKN/AfV9lNRHTpgS
         tojFyk5Z5gZUMGzL0N/oXVqYMCWHLl/bHJNX839Dnm+oGIiY1xYpRqwi6n7YHlEY1D8C
         W1zw==
X-Forwarded-Encrypted: i=1; AFNElJ8x9ax4N7llE3rhCz/Vvx4+PWRGLecQIkfG1vey/V4cj+IIxp0bEFlNLaSoDilZ9vNkFrWC1CuD7z1L@vger.kernel.org
X-Gm-Message-State: AOJu0YwEh3xOj5j2Plt6Saq0/jfcZSotFViULW+hur9EQt75Z57vITbH
	pC/qWsEEj3LKuV+ZK9gFc3jsCsZmeVeAim0C6wmNRKTTDGIzpATBfO1jCjYW7oEt8P/3N8T40z+
	5ScbMvCMdHF046kqoOuRzjvcunDkp2cH1jgkyFgvT8U1BRfNsiXnUhLSOQGGlPkaq
X-Gm-Gg: AeBDieuBsHEI0hkukYsxxKC45g19mgoLrHyB3UFjf6dygo0/av/GWeY0bl+Y2hlGbS0
	7QDTqjkmsaMfcARBYmijPNYp/dxiSimfcfsP2Nl3ijR10lgA3Y9lqn+o1vFBwHCrE/TWj4vIem6
	r/A085LhwgflTA91BPDyVK533tLSgN/O+5rxm+Hhw8s9+Oxbyqs/fgL8HIl5NRJdRT93hOA4Cyl
	gABIFgmzOG1zfYP5osaU2Mvznjzl5CApArELF8LIj10fBah+qT8m0f0btC/etpxyYvZZ/RVTp4E
	LL2LIg2eurcum7zF0KGGH5JTrvIzygHaA1lDmKwcHLlS+RLCdH17T1H46CfIzi//gzS7IYlBhBv
	WVcKCUZmdZpXbsbsLTUBNqA9s6MH5lq7WZEFYNVso/Mbcrn8=
X-Received: by 2002:a17:90b:3c0d:b0:35e:5ae3:299d with SMTP id 98e67ed59e1d1-3650cd4a7fcmr9184406a91.11.1777891732127;
        Mon, 04 May 2026 03:48:52 -0700 (PDT)
X-Received: by 2002:a17:90b:3c0d:b0:35e:5ae3:299d with SMTP id 98e67ed59e1d1-3650cd4a7fcmr9184388a91.11.1777891731702;
        Mon, 04 May 2026 03:48:51 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b9cae68443sm96799365ad.81.2026.05.04.03.48.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 03:48:51 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Subject: [PATCH v2 0/2] pinctrl: qcom: Add support for Qualcomm Shikra SoC
Date: Mon, 04 May 2026 16:18:41 +0530
Message-Id: <20260504-shikra-pinctrl-v2-0-14e9dcc2d685@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIl5+GkC/3XPQW7DIBAF0KtYrEuEgRrsVe9RZTHAUI+amAQcK
 1HkuxfHqrrqBukjzfszT1YwExY2NE+WcaFCaapBvjXMjzB9IadQM5NCdkLLnpeRvjPwC01+zic
 eg2nBdehDF1kdumSMdH+Bn8c9Z7zeqjvvn39sbdlR+4uW5ClwkAZQWe8MqmFpN9VBQe7T+Uzz0
 KjeCB2FiEYbcKBaXYneGuHeY7DgpRLQA0S29Y9U5pQfr/uqtS3w3ylLywVvnXZOOgU2dB+plMP
 1Bqet+VAfdlzX9QdiDpX0MwEAAA==
X-Change-ID: 20260429-shikra-pinctrl-fd71ab6ecd6f
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org, Komal Bajaj <komal.bajaj@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777891727; l=1347;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=uTlUQACvmbDEV9HCwCQjfQKmIVqC4d7G2qr1KVpX1w4=;
 b=JQtArEYM/rET8ZvsBIjX0wfnaGqo3JPcs6y3wh5xN/AEqOOXiIySmvEPXIHmMy8VMpDxsmXnh
 rf9TuD3UQDDBJuiWSjZHEHR22q6hmw1aRF9cWxQ4SbzO8ZsAdQXL47O
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-GUID: 2G4jjaPpfmL3mDPJjuRBIn_F5nxpUaZX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA0MDExMiBTYWx0ZWRfX/pL4hbHe0AG4
 eSj0WlcAdrkUM3OujRZSvBf8pHXJYte4QCeJszfxh0T+kq6xi78+J0SGAilPIdPTC6Df8uNMUTP
 dxkZHpuzf3n8ie37TyNkRJ5yBjfYADEWtqjrvssW9EVWgMwZbwiurBIEsLmebi9a6Q+ySksW5mg
 GHk6M80focB4gD4MxCLTV5htutZs8rj+5vGdr0vn1Illzkx1r09b4+JUcMgau9wiGXqmmVpSn4h
 D6Oh7S8KmQTtUanZX6Ee77r1Uggk0heFKeZ6brACxG1ioZJlzOkllJxxDvaYd6IKMqjUCmYVFXX
 pLHFPjOohsguAqfiLg+I9NVD3jz1UhuTDThNcAjNlOPcoljI5Pi6EdBYvQlnnhk9swm1q37X1Nt
 SqBkD+R4X50s9bRISLOkNB4w8wOLv/UXR5j5+GZKrrHt11Gbdj4d3kumd9msN9aHoaRk/lVmujK
 98A/eh2sbSeH5n7wMkw==
X-Authority-Analysis: v=2.4 cv=csirVV4i c=1 sm=1 tr=0 ts=69f87995 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=F7K3iWs-JhacpI5SHW8A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: 2G4jjaPpfmL3mDPJjuRBIn_F5nxpUaZX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_03,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 phishscore=0 bulkscore=0 impostorscore=0
 suspectscore=0 adultscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605040112

Add the pinctrl driver, document the bindings and enable the
driver in defconfig as default.

Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
Changes in v2:
- Fix Kconfig description to drop "Technologies Inc" (Linus Walleij)
- Remove unused UFS_RESET macro (Maulik Shah)
- Add spaces inside braces in shikra_mpm_map (Maulik Shah)
- Fix gpio-line-names maxItems: 165 -> 166 (Krzysztof Kozlowski)
- Link to v1: https://lore.kernel.org/r/20260429-shikra-pinctrl-v1-0-1b4bb2b3a8d6@oss.qualcomm.com

---
Komal Bajaj (2):
      dt-bindings: pinctrl: qcom: Document Shikra Top Level Mode Multiplexer
      pinctrl: qcom: Add Shikra pinctrl driver

 .../bindings/pinctrl/qcom,shikra-tlmm.yaml         |  123 ++
 drivers/pinctrl/qcom/Kconfig.msm                   |   11 +
 drivers/pinctrl/qcom/Makefile                      |    1 +
 drivers/pinctrl/qcom/pinctrl-shikra.c              | 1256 ++++++++++++++++++++
 4 files changed, 1391 insertions(+)
---
base-commit: 39704f00f747aba3144289870b5fd8ac230a9aaf
change-id: 20260429-shikra-pinctrl-fd71ab6ecd6f
prerequisite-change-id: 20260428-shikra-socid-a27ae38cb7e3:v1
prerequisite-patch-id: 843f28095c0d42d0d60ab7000095c64dcb2e90ca
prerequisite-patch-id: 1069d6880c3ff91c230c20fcd876738001c6d35d

Best regards,
-- 
Komal Bajaj <komal.bajaj@oss.qualcomm.com>

