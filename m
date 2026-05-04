Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89C5E3D3D05
	for <devicetree@vger.kernel.org>; Mon,  4 May 2026 16:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777912281; cv=none; b=se5jwsrgOH5bwq8MfgFfNl+Kc43qZ3Bs5CqiQALhHfTtsd3Vz2udrnwvjraYOL/MFQG43Rv419lrQ25Y/3kindX8srSxHiLuCyfu8Y0xZ1fkPBwg/qiaVFxyjBxAozU0djqfzCH+hTJllTzbdJ7+mxeV4xgtfVDQBdYTW6Bu6y8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777912281; c=relaxed/simple;
	bh=Rbr5xqYSP+2O3DF4a1uCRmOQrSRcQUysjbEvW5ORHIM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=jUpFM1+IomhszfR+vKxV+KrLgwr5EVrJyqz8yK65rPzqWgq5hEyX7Zlyz+DzqJ43RtIg/SO5GzQnh1EjzQJiSWcwZHIuyKOnkbd/ZWWpNcy8xQt2UFNnRMhNWmIw0ZdtPl/Iu8IqFbQyyLGNpbMw7eJ3aXoEB8+GnKB9mnLgV5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UyncGPjt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FkmQmo2s; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UyncGPjt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FkmQmo2s"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 644ELm4e1960438
	for <devicetree@vger.kernel.org>; Mon, 4 May 2026 16:31:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=MjrrKRV4MKtAEtzZMCNfTG
	QI6/WjZuAoSv0MnSblM4E=; b=UyncGPjtxMmFj6WiirDirn9ms7SppJWObGIUQk
	ZEh+i7b4EXgpTL4v29yjVNMurB8g/wAcBl8DwSqgZcYwD+5HJ9tYPNrJnW6BlCBR
	qMVdKItjCSVd1ZowrE9+wP3ag1HqGpXkO6gZvqsmHYSlTEw+oRTR5HVn2bx7R/Pi
	qv1LjFxrP+gKBcQzkt3TNiK+pumt66SKuPnvclp1/d1QpFJNS1J7WL7UcGWQlfSz
	unL2CrQ5scNxkfxnQScXlHr2lHsoywc8YMuWcWWgXHL6AUd57xTveCeueUzucRzK
	XV1rreYlIjfPvIjOj2tCCLznqBGN2/wNkq8QJoKD3agysFQA==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dxw5drgub-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 04 May 2026 16:31:19 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-467dc3431cbso3030681b6e.0
        for <devicetree@vger.kernel.org>; Mon, 04 May 2026 09:31:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777912279; x=1778517079; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MjrrKRV4MKtAEtzZMCNfTGQI6/WjZuAoSv0MnSblM4E=;
        b=FkmQmo2s8OOv2YRDQSVvtRo3LrsSM3426/iyvSA532EaAOarCl0fLojOcVrdulTJLE
         cDgUDOfFNpIo2asOitObvzsQkiVazdQLrLY8fAMIvFt0z+fru027f0WbNoUMJ6okdHOV
         teZ1cQyO4EW6D8b5IbcFDbdyLD4MW1xol33jBXVVLBLyDXv4HlbJAlPOx4Vm1d6ULBoj
         8aSqbU31eSDwuDi8QZ876x6MOcyNBi3xkn51EAO4M8D9S4Yi0oRfVwphUpo+PDnAmJWi
         VC2MkhfoOPA1f2w4PWun+QskInsGWIP9qlb3e8UTqqkX/qg9T3K7lzrucxkw0AG8uqPg
         /2Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777912279; x=1778517079;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MjrrKRV4MKtAEtzZMCNfTGQI6/WjZuAoSv0MnSblM4E=;
        b=T7uDtPtqe7yyzvaV0UfB2EELtgD/DudyQyQ3cdv4fzZW39LaOvK9M/KlmdoB72UmK8
         oTFLR7ivx6OhBCa1bcdWqrMZBpKQyBzyh1oXHdL+l7GflPzQeo0cLZAaarqm+LJTUfMv
         F5nifqKv4fxSpT8J0qnERtMd1EBkYsVf1GW67iuMCuy3DLIwsQkXw8m9ly6OjWVJPEYG
         VPkGAMm4iLDKMBlUrowMxeQtQQqaheb8rWexoxMKQrrQXzNnJuhYYjMHULzEqOPM7aJF
         LLkvwClEGX2asy58g2Ppv20X0OcKqVJwSpju4/GMUHE0k/HFVg1qFR25Inn67hE9rlLr
         fHwQ==
X-Forwarded-Encrypted: i=1; AFNElJ8srHWh5YZyS0g8MOrFlafvXAMsoFx112ED2nAiVwgDGZjmGtILIubYXTS8mfUNQmg8zP5RmOI7xIr5@vger.kernel.org
X-Gm-Message-State: AOJu0YyNe2sTNqmzefC8DFLR4rZLVoMPIp+d3NBLLOLBwdZyL7vrIYPt
	gUpf2n8cWenQoybmzI0lkJNopY7EHI5WunvnYeGAB/bp25ay9lPJ3s5kuOUAo+J+kqtqkaYRC6w
	jseVLuMgdLDnkM3rObu6OdqW0h/mgr8W7C5L0a5OCCIstbEWq5EilIWDfnSspQrC5
X-Gm-Gg: AeBDieupHWW0HYbwK6lAVss9at/Zy1iOt80M1O7yyyXwObaMtTy96p8LBcS1z1DHhQT
	Ls6/iBILYGqMAGGs9c8W2czKNAt5NHzbcSaMZK+BHwVxKkMpJJlO8UMxllxxOuuerCkscbzyUSA
	pBgWe15VmPH+E0zfEDmOx23QZ9dDUvEzE8OtRZ1pggpga/QK1su6YqwKbBjCRzSHzuUz6AsT1zR
	UOQgYnkCCkcf52itACf/qTrNMGY1fWkFjaLi/gP3vRJreJ0UHLtZ72DPBMtOOw3vCBtAQ+9ZsAo
	Mv1lKz9Dv3opwWNe3Hh/hIAjwST3Z7jNzvdcvDtoOCeBp6ngMoKAXOAPSg2vTj+tlVOofkYtmTA
	Rkom9SkKb6TqsaXftGvFkrlSAuED14bNvZMdWNTGx
X-Received: by 2002:a05:6808:1a01:b0:471:f036:791f with SMTP id 5614622812f47-47c8923ae37mr4789676b6e.30.1777912278488;
        Mon, 04 May 2026 09:31:18 -0700 (PDT)
X-Received: by 2002:a05:6808:1a01:b0:471:f036:791f with SMTP id 5614622812f47-47c8923ae37mr4789641b6e.30.1777912277961;
        Mon, 04 May 2026 09:31:17 -0700 (PDT)
Received: from hackbox.lan ([86.121.170.213])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a8eb75fc1sm294986075e9.7.2026.05.04.09.31.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 09:31:16 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [PATCH v2 0/3] arm64: dts: qcom: eliza: Add ADSP and USB support
Date: Mon, 04 May 2026 19:31:04 +0300
Message-Id: <20260504-eliza-adsp-usb-v2-0-18e0b0b0407f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMjJ+GkC/12NzQ6CMBCEX4Xs2SX9iYZ48j0Mh7YsUgMUu0BUw
 rtbMF68TPIlM98swBQ9MZyzBSLNnn3oE6hDBq4x/Y3QV4lBCXUSWguk1r8NmooHnNhiQbWy0or
 aSQ1pNESq/XMXXssv82Tv5MbNsjUaz2OIr/1xllvvJ5f/8lmiwKow6igtKeH0JTDnj8m0LnRdn
 gLKdV0/y97PQsUAAAA=
X-Change-ID: 20260330-eliza-adsp-usb-8ef2b1b0fc13
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=2093;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=Rbr5xqYSP+2O3DF4a1uCRmOQrSRcQUysjbEvW5ORHIM=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBp+MnPPI3HfhjbFzG+vKfloiZdkRcsb1bOKSGES
 n+1wY/X2AeJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCafjJzwAKCRAbX0TJAJUV
 Vo5sD/99mrcTlUy3oYy0CuRNKibJr9Hkop21f1CBygo5j0p0wCEba9Cn7C2c4TLk7BZ/y387bhL
 2DbSgXUA4sJLp1ENfaMcqBIpDGHyKjCtqiO/qgaY8HNEZEz/vimNyj6KEA5tsYuaYfPJHwJSGLa
 5L4Rh7QiDez0xh+7ap7UBgaThtlFtUzCD6tMO4sGA/FSxkgBuRgzw1mbiSDnGIWN2dzztudwg+T
 UKmn0v27JyE7XuRakF9axRp2tl+/eOM+RQt1BQ0STcR+V6Hb6YKMPCu2fB0UQrTiIMbCv8dLNcV
 CkvawN1Zxlu6nTOeTu9PhNElqyQxD3+xjIWaD8/53NNGAvU2xCuxSanDI/fFxWfKBiULHTgv12b
 qGGq7FPuVmATW4jybZa4fPzdP605dE7TkMpnrUjxqkiDBloTSYk4w6n1X5PhDfiabpDYqPZ+nBf
 1AZxVa3X/ef98y01b+yumoyUVSUtJG3CHQ/6jpMmoGeI5YUeW7TXzDYd+DDDuwA5U2dzMrxfI4G
 pfJgmlXvg2+OugRkLvVZL+k96iyc/RQPThumgw7tVxnW4dr/L4VhiwwLRD8ZFPFGbAzrhlAt+SB
 AzQpbxNthr0mqJXKKv0bBgJzCG4l7IAl+LIryS8l1cuiPiakt7pOJwzLBv5euCN9Z3YYrY9bRgc
 /+GsTyuYH0wWnrw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA0MDE1MSBTYWx0ZWRfXxMs64olmvACO
 QhzrUei6O3BW7ekbO4/J1g6n/0PapzD4h4bGaGKf8qjNNMpuHNVsO1BlfkxVyqHl68hcQckjx8S
 1MQ5R+ymWbixYq9JWxbXFRuCVS+syYc2JSKWcndHybtV64alRgpxs5V+UpQ8toH/JVHU80WFM+K
 Xr456mlbKK33LuWTo5uwkaqI+dhMaT8zjQ2+NuJvRAreEs3Cu+5Uaj06KUL44TrxBzUQHuvb/r2
 0UKQ+n2kukyX0E+2QFwjgLY+jLn4gvvBl6Qp3wuxoU5aAFQnIjCUUvliKw6h1phIRbSP1vYOWDJ
 tsIQz6qIYJqE37jMHpQ9sFlCZRUmzWZbRLJT0uqLVlQL9Oqc+Um2szyCw7HOKEbeAbehgKkuR34
 JxppsZuN08pui4OyhR9TGnqSWWmG4CU2viKGbrn/b0EWKcWZ7SWrdjV+9p6n3ItzTrbLpI14SQj
 wPsCUX4kGB1i2sl6UNw==
X-Proofpoint-GUID: rvauhl18KR2H7xDonh9v-a4agWTx0ks7
X-Proofpoint-ORIG-GUID: rvauhl18KR2H7xDonh9v-a4agWTx0ks7
X-Authority-Analysis: v=2.4 cv=HpJG3UTS c=1 sm=1 tr=0 ts=69f8c9d7 cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=gcnggjyPzmaCdwFRn6A1TQ==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bC-a23v3AAAA:8 a=v-TjB7A8gc_t_YAPOJ0A:9
 a=QEXdDO2ut3YA:10 a=_Y9Zt4tPzoBS9L09Snn2:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_05,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 adultscore=0 clxscore=1015 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605040151

This series adds the ADSP and USB related description for the Qualcomm
Eliza platform.

The SoC dtsi gains the ADSP remoteproc node and its communication
dependencies, including IPCC, SMP2P and the AOSS QMP channel. It also
describes the USB controller, the SNPS eUSB2 PHY and the USB3/DP QMP
combo PHY.

The board dts then enables the ADSP and USB stack on the Eliza MTP,
including the Type-C connector graph, PMIC GLINK integration and the
PM7550BA eUSB2 repeater.

The following patchsets document all necessary bindings:

https://lore.kernel.org/all/20260504-eliza-bindings-phy-eusb2-v2-1-fa3a1fd65ab1@oss.qualcomm.com/
https://lore.kernel.org/all/20260504-eliza-bindings-qmp-phy-v2-1-849c4de8d75f@oss.qualcomm.com/
https://lore.kernel.org/all/20260504-eliza-bindings-aoss-v2-1-c3628ca79a25@oss.qualcomm.com/
https://lore.kernel.org/all/20260504-eliza-bindings-pmic-glink-v2-1-d6b5397b7899@oss.qualcomm.com/

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
Changes in v2:
- Rebased on next-20260430.
- Changed the HS PHY ref clock to TCSR_USB2_CLKREF_EN, as suggested by
  Konrad.
- Changed the HS PHY VDD supply to L7K instead of L2B.
- Dropped the dr_mode property from the controller for MTP board, as
  suggested by Konrad.
- Re-worded the cover with more info and updated the bindings required
  patchsets list.
- Link to v1: https://patch.msgid.link/20260331-eliza-adsp-usb-v1-0-d8a251be20c3@oss.qualcomm.com

---
Abel Vesa (3):
      arm64: dts: qcom: eliza: Describe the ADSP and USB related nodes
      arm64: dts: qcom: Add Eliza-specific PM7750BA dtsi
      arm64: dts: qcom: eliza-mtp: Enable USB and ADSP support

 arch/arm64/boot/dts/qcom/eliza-mtp.dts       |  81 +++++++++
 arch/arm64/boot/dts/qcom/eliza.dtsi          | 261 +++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/pm7550ba-eliza.dtsi |  69 +++++++
 3 files changed, 411 insertions(+)
---
base-commit: b9303e6bff706758c167af686b5315ad00233bf8
change-id: 20260330-eliza-adsp-usb-8ef2b1b0fc13

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>

