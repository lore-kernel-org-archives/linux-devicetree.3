Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C16BC2848AA
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 19:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779217522; cv=none; b=uXQ1irzNH3LnrxvjvwCxu2rpKprR2Id4JPIQxiWHcQEL6BcA8IFI6j8zLqCPVbRzujmbb2rYn6v//5NgGGO/GkU/tCuW/4b+ulyxChmL2nJgbFfcdnAfH7JLWQ+DeQf5bYT+US/C0wKc1IRRFSvHML6mFKuClGeVRVRg7Kdf+SE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779217522; c=relaxed/simple;
	bh=C7CEQQmP96TDGF4BbZh1KMNko2GsC/BByDb8SSpMAfQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=QjtU8Y7n33L1Y57idglIwLALP0AvwIK9UqWffSSciIIKbrhWoPbhKf1J3XBOPIHiZ7oCNBIvwL6/A3IytvL2DVk9BXvrxbas8KXR27RYC2V87Hl3Pmhkz9WPlEEP+sj5ac/GO/xvp8H0gD8bJYhd5nSd9DOpeLm26HTpy2z04g8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B6eaQ+Nt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L/NA7Xjh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B6eaQ+Nt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L/NA7Xjh"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64JExHbF2064607
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 19:05:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=RUqLYjoGgo9u1VxAsNMCJ+
	wtmEWsxHGuTN8oZtSL/ys=; b=B6eaQ+Nt3nMmwKbGMPEjXSBdX461FzNxSm1Evc
	ydkbXKuUi/bhKBCEogSZzcgFJfdw+IDK1CDSvz/nQQ9K+NdGcL6TQQ5Qvy8jzbxu
	Bwo9UPwvwQNfQlTe8o/xOjtaqw5/3XZlFgkUjPsApHT3jHWIfJaCLyOy83FNTXNb
	a0QOAqLju+Vn4zMpdQQYavfKtmj8GMM1DCPmERr3yXtYt8xYnWkqhC0ZZHQM7wiL
	uTtwnOwo1oB5fHkINL4H/0QPTdaK65U7jBDi9AURpYy/nvG2VFoSS1uPi1agdFxw
	eRUv05SOpJPZm/ZYm58x45JFKJbNUgS+hT/faIKGU3J/Kz/A==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8t3t1417-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 19:05:19 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c70ea91bfe1so2219017a12.1
        for <devicetree@vger.kernel.org>; Tue, 19 May 2026 12:05:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779217519; x=1779822319; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RUqLYjoGgo9u1VxAsNMCJ+wtmEWsxHGuTN8oZtSL/ys=;
        b=L/NA7XjhmfP7FGvsxsojGBgj9phI+DnceRySFKyOfwm5mDsb7rvP254h+g6UC67JWd
         D2bO4oRyV6HdjVjK2HyhG8tK7NWkaQ9YgbVrzoaNSjjP4/qGd4erE+AyS7/O36w9wVRs
         8tYfGmu//dYlgMHby2cHzLLQhYcTypDse1co1aCz8mK/AEbNbvvK4qo0WNf8OOiDtEqy
         m48ZpURILljDIChhASD8acgexM8EpszmvB/S7A6CW5wzZ3GDNOZ8nJBH5Ui9Nju/viCB
         P57qSWhBVA8zUKCdtljED9uAi4+r/T91U+jy53Ep1JnSI2YOwbxrvYoWKjfmWdPvJOlI
         r2uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779217519; x=1779822319;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RUqLYjoGgo9u1VxAsNMCJ+wtmEWsxHGuTN8oZtSL/ys=;
        b=AZ6dcgbxD0CqhG7RjGCxJHGcnKV0a2/7G9IJz35Xm+kIaYiZicPtxH5DuYIuBvsrFL
         I5jLkc9fo1wpP39iQzpSirc4jhPROmmtHFLBRnvpOI4W1cpk5UNktpaWwIBZJPIUTBaT
         jLrsxpTrxCBnwumCLLlZk6qCUG3zQ+DoJwh7AKcOmbKbVGLmJot6hTbArKEgRGlYS+wO
         bpY5rcTFVPvOAAcCaSbAdXQc48s1c+W2+WWNq2dCOLjdjZfhwtNZjUWtVOJyDFoMQ892
         TGYA9UOsuxk/vovyn6/UakX6mXF+3zE1bpf/+MnfueVRTwnQrolc6B6mmsNRlbdDYpcE
         PNOg==
X-Forwarded-Encrypted: i=1; AFNElJ+vDKQwcVlQogKStocMVcexUwuMuKGI+H21nl1nrQeyss9KBWZf41DQ0s9+p+VNH0TIaR00vtL2fLJf@vger.kernel.org
X-Gm-Message-State: AOJu0YySFQim9jDbT5IpwA/bTEOEo5WJEDyJmszbNr6E/GDeOT8nXOTQ
	n4+PmUnw+qK5Su3FFJ2BAFy+P+bc+BhlFqBpG6xAfWNsdvhQS5ZfWv/UyMlYGiDW+4zqYE5MrIV
	/cnxeSZwBpN2DTvdrV4CgUqvx8myxXZvcck1wzXF71VDaxnCm/TeCVUVHdvEd23hV
X-Gm-Gg: Acq92OFoh78nmuCmE0X70xEuRCqfTmoZn+qoqiWa2ey/utLkdPncZUe7QNZDMeLPwmL
	xTr3t/jEIRb9j6XIxU6TjyzqdfDeFdfMvMh2ihKRbtje957qFqtBVgG0P1pe4gSMjMDfC3c/mKS
	EBg501AG94yw3FqhTntYh5gKBwovTcug2I03Pu9xlqfZPXkBj/+uVdr3xWHtsvHl3duu60tbfnF
	XeB2C7MPkG5ba+5eUFeH1cht1a+ra8Pg7fpmIPp3EKuwERzzjiLF5oXybamWrkRBT7ETLz4Zqqs
	tWxo27LEAVUGwyoYjMJaF+sECSv5/HLE5JUXONUGLrm/FxsGlxu4TR3/zAO35xORf9WQDMUvbL5
	DlkWVasPDs9qnichyyv2Xz5WPTT7jmXtcRrAFWJg4lBbKc4L5TAtzmuxq+5wvO/uc+x2U1UCO/r
	Bn1XC3XXxTFBLzIYB6+Ggf3AnJjcXJb3ZE5shQboDt3+8qva941cGR3+FgmhJBJQ==
X-Received: by 2002:aa7:88cb:0:b0:837:b97d:2fe with SMTP id d2e1a72fcca58-83f33c1f156mr22131378b3a.18.1779217518664;
        Tue, 19 May 2026 12:05:18 -0700 (PDT)
X-Received: by 2002:aa7:88cb:0:b0:837:b97d:2fe with SMTP id d2e1a72fcca58-83f33c1f156mr22131341b3a.18.1779217518166;
        Tue, 19 May 2026 12:05:18 -0700 (PDT)
Received: from hu-viswanat-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19794e6esm17423401b3a.25.2026.05.19.12.05.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 12:05:17 -0700 (PDT)
From: Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
Subject: [PATCH 0/2] Add CDSP Power Manangement Driver
Date: Wed, 20 May 2026 00:35:08 +0530
Message-Id: <20260520-cdsp-power-v1-0-85eb9501a1cd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGW0DGoC/x3MQQqAIBBG4avIrBNGIbGuEi2i/mo2KgoVSHdPW
 n6L9yoVZEGhUVXKuKRIDA2mU7SeSzigZWsmy9Zxbwa9biXpFG9kzQAcs/XwhlqQMnZ5/tk0v+8
 HJOgmrlwAAAA=
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Praveenkumar I <praveenkumar.i@oss.qualcomm.com>,
        Manikanta Mylavarapu <manikanta.mylavarapu@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779217514; l=1736;
 i=vignesh.viswanathan@oss.qualcomm.com; s=20260518;
 h=from:subject:message-id; bh=C7CEQQmP96TDGF4BbZh1KMNko2GsC/BByDb8SSpMAfQ=;
 b=CAGuwh8fTWjur/IxwwvTeIfB9DykAlHTz8PdHF3tm2yr59mmmCUFjh/N0IG7vsLOclubcIxCv
 rAM5X8nd+sdBVwaKAcXs2sHinBRa7z7qq7NHU29+21Peq9edWC7rwG/
X-Developer-Key: i=vignesh.viswanathan@oss.qualcomm.com; a=ed25519;
 pk=/lHspsTTqZQg546ZudgrbywCsk3Whx/C0XNVUevaKNk=
X-Proofpoint-GUID: ZpXPDTOP8BpC-nN_B21aD0s44egSHlxx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDE5MCBTYWx0ZWRfX2GRq3R0BNvB9
 MnconJdE+tV1I2BOTQKY+b6zT19vVqlwBIk83zWMDba+gtCf3hYHRH9KFlKC/hx8KDia2LQ/8hR
 lsYSvCFeWh6QXNLlNagoXqEUDMEzedTrT3+RFPz0nJuS/JftT5bRks3BYzdQHeKl6IyXL/ia8d0
 1UBIW6Ub36ydMaC77IkfRMt0U9Xc7WfvPEBuCkiwlQtrY9hIKv6g0oKyiUi8e+MoxcOcMLbAsGb
 BThnG8voQ2uYthexOcERF6qBdjXz+cQLjQryRzFCd9gqcSa5ebHX0sShOF9oc5LT+FFt9t7JaM2
 Jz85fksrpAjJfNWEEq3QsZ80RqcQyZFU1fm/pUot50+a9oDOruk7pB3OHgHa/cNJHroHzkDbYy6
 p6Kn0CP6OO/GViiy8Mr35WtOWAE997Y54uHMAwcES+HX3q8otsVLbTKGu0jYX5XrBSe7CYNJWIq
 7Z5IEuAX3rZ3r+8KRNw==
X-Proofpoint-ORIG-GUID: ZpXPDTOP8BpC-nN_B21aD0s44egSHlxx
X-Authority-Analysis: v=2.4 cv=C4LZDwP+ c=1 sm=1 tr=0 ts=6a0cb46f cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=4IyOyT_C9-gSaBXp73cA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_05,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 spamscore=0 phishscore=0 priorityscore=1501
 adultscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190190

On platforms like IPQ9650, the CDSP subsystem cannot manage its own power
rails and requires the APSS to handle power management on its behalf. Add a
platform driver to fulfill this role.

Handle LPM (Low Power Mode) by executing hardware isolation and restoration
sequences via MPM register programming, coordinated with the NSP Q6 through
a handshake protocol. Support both FULL_PC (CX+MX collapse) and LONG_APCR
(CX-only) modes, detected dynamically at runtime.

Handle DCVS (Dynamic Clock and Voltage Scaling) requests from the NSP Q6
received via a shared SMEM channel. Apply voltages via the regulator
framework and write responses back to SMEM.

Expose virtual cdsp-vdd-cx and cdsp-vdd-mx regulators so that the PAS
remoteproc driver can control the NSP power rails through the standard
regulator framework.

This driver functionally depends on [1] for bringing up the CDSP on
IPQ9650, but there is no compile time dependency.

[1] https://lore.kernel.org/linux-arm-msm/20260519-mp8899-regulator-driver-v1-0-30d14421b7f1@oss.qualcomm.com/T/#t

---
Praveenkumar I (1):
      soc: qcom: Add CDSP power management driver

Vignesh Viswanathan (1):
      dt-bindings: soc: qcom: Document CDSP Power Management

 .../bindings/soc/qcom/qcom,cdsp-power.yaml         |  138 +++
 drivers/soc/qcom/Kconfig                           |   17 +
 drivers/soc/qcom/Makefile                          |    1 +
 drivers/soc/qcom/cdsp_power.c                      | 1065 ++++++++++++++++++++
 4 files changed, 1221 insertions(+)
---
base-commit: 6a50ba100ace43f43c87384367eb2d2605fcc16c
change-id: 20260519-cdsp-power-0eee60028e81

Best regards,
-- 
Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>

