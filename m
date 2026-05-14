Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AD1D3F65E4
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 13:54:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778766869; cv=none; b=juqI3jMkSw+1mhVnv5Kl8VbiRa/Nt5l1iUzMR5K5gl+M8GEtBJpQcqM9u/q7mDydu+H9ePGKhgKUbaxPtkWRY6RyGGRXEhWmX7VanRVHkYyeHcpwWAhouSrKOoR1fpjg2J8cBPLIvfquRClQ9k20YXB/HTEFuSXEHBzyWBdsCsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778766869; c=relaxed/simple;
	bh=nTbp1shaJoeWLjzKXLYsaqNmI45aHF5rl5f3u8vBoeY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=IHSGjFbDc5uxSQAvo1znOcaVO7AYK7R09aAb9GDyoe0r+raAqg1SFURCe/rL3Itlj47r6B1npOcG+qWw+uDlKJj5eWQ/FQkxzyi+7eWKMh6Rt2svSEyXFgMHNtdYcCeYalrw1inxZFXb5ELOGUhZp1+vtzQDyjSCv1eJfxHyR6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VrtsH66r; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Rp/rrAWw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VrtsH66r";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Rp/rrAWw"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64EBeV452841081
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 13:54:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=YDIYt1/654w02U8gSa0u4q
	uzz3yG0Ktza8LnFiuDJTQ=; b=VrtsH66r54wvqwFiYatY4g2ag+5vxGy3tWxcsx
	m0Im1UvOkAcpOxoM3CR4sfAexZijzu0QROloBBBLT/mLPLtuB8WLHsgSHjAYn5jI
	3WMejb5bXtPxROozYQvS9selVLdrf+ANjVUxLa8LBBJx8Bt4TGdae26TGYa/rQCu
	pPiUlYGJjGNDval1IEWxGbwGLC6aA5RcQ2k82AREzevnPkK/qan8dsvm5WmgXNZI
	D8vpBOH6f/skxszFm89iU8xwP2TWCbKWLzjpyYkoQFAq8twC1mnQ6uhP7kUmiS0A
	upV/xpgl0Y6BwPwJ6w3eX3tLWR7k5EBbkup3yCzBSLJMSnVA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5899sn5u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 13:54:24 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-514cbe73d00so93989381cf.1
        for <devicetree@vger.kernel.org>; Thu, 14 May 2026 06:54:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778766864; x=1779371664; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YDIYt1/654w02U8gSa0u4quzz3yG0Ktza8LnFiuDJTQ=;
        b=Rp/rrAWwyvereqQXOx4HlEipUmgsGnj1szjzvU/9CIw6F4DiitHjF0OCK3FJlWBPwd
         ruWbJW32WbcbFgiLp/afRdhLi3UMhrnU1Shnr15OHETSIk/Qi/4sToQNDd39Xw2FLtHX
         LlKwn4v/CmHSTgArmMarRxu492cPIS5WenGzFwFLVCyDkG4YSk0rK1JRZdccrZlMWhsS
         Ksx6V+Iy6qi+UGMeYyqoyH4FjYCrKgZldZg5E7MrNMqxlAZT+ja4fmeb6XjoVFWY69Hx
         jIPnA30TTP4BzZghiFRaaH63/96US1g2u/94E90u+g9J3QzzNufG88J3fYBvSR1bxsMd
         gR2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778766864; x=1779371664;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YDIYt1/654w02U8gSa0u4quzz3yG0Ktza8LnFiuDJTQ=;
        b=Lx23U2ihIMA01QIwQLsBfldtOLM0gogVDEMZrulfj8YynRb4xG9DwPOHgOhuafBXIy
         RQyHOkfdtFVzwypgJVmLI7+3CmHJ9o8M1MMoTAA+yYvdyNCZVgeHojPOmVEwaDbNbIqU
         XdfUdqj6X8jegMI9Beec46MDzQ4J88o+ZwiwwvBQNZhrh1Jz3Efr5xHtKiJ0RT+cVVl2
         OFr3oOVKlLAcvm3HoRvXjgKihR9EIhsn4toRqKgCxMzezTIW+TF0rM6ucTHrP0pxoYQg
         SZA3FCc+aFZOL34kObzjVmUg7IlVm0qRPKvXeNEc9QmicOlcRo7utU8TkRuN5xOhv58B
         GPYw==
X-Forwarded-Encrypted: i=1; AFNElJ9FZCZgFhDCeOdIRYgR5XQhh1TvtxhmdQ+QI8K2JYCy8gYI7tEZMbMHmMKiib/Lrr0YLBudMKw1ehgN@vger.kernel.org
X-Gm-Message-State: AOJu0YweWYwLLtVHv+e04J3k+BphWLo9P5BgkR/0dpHj3gjr0Qdas6Lp
	J1N9aFKXnM+xwG5tZlUF+1L+c7ymacapkITiRyrGG+cxX6n8z2BjOHvk+uGoj3Fh0VObMlXLgQS
	XRs3HwjIbt6LNZv4WThm1oapg0gs+J0/1CfD3XXPmRsd8HiCed5PRv5y6PiK0QfCc5H7bTTAd
X-Gm-Gg: Acq92OFLZblHjmSXi+WXdIK7euQPkXt+0AAmC7i8rwp8P72jzHbJeIgZDqQ1mqsqJ2O
	gNNZL2fePc8Hn1KN6s6WN6rp1V9thCcRDkorcrcEsHxo8qbk1JHoT6G9iS+tx1o94aTUKSw2+7q
	s7Rm7fGBmjgHVVopZlzsiq6IoFIZTZjIlIKrVsnMlRxZdo3A5qkQnc0Ap24XmDXcG7pcVoxSfPo
	aTEQ03tWSCiiMEXCrfvw2nteKUVcAHDLVqy6XotIPlzLkq+vvm5l/ZdVMrletAvVFxbMDdWxwDw
	zCsMSJJ0WYvygIdJ+FQr3T1R5NfP2KygxyPTfRSNHURiIZdPeJuOuWNnVO7mxAPKdbXiJoj2m7/
	Gn7xqiLX94eKNW2S5MZ4TG/kxlB7+fA==
X-Received: by 2002:ac8:58c9:0:b0:50e:5fe2:83a9 with SMTP id d75a77b69052e-5162f437d72mr105273111cf.5.1778766863924;
        Thu, 14 May 2026 06:54:23 -0700 (PDT)
X-Received: by 2002:ac8:58c9:0:b0:50e:5fe2:83a9 with SMTP id d75a77b69052e-5162f437d72mr105272261cf.5.1778766863239;
        Thu, 14 May 2026 06:54:23 -0700 (PDT)
Received: from hackbox.lan ([86.121.170.241])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fd62dde04sm27798165e9.2.2026.05.14.06.54.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 06:54:22 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [PATCH v5 0/3] arm64: dts: qcom: eliza: Add ADSP and USB support
Date: Thu, 14 May 2026 16:54:12 +0300
Message-Id: <20260514-eliza-adsp-usb-v5-0-a21056ffd892@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAATUBWoC/3XNwW7CMAwG4FdBOS/IdtIu3WnvMXFIUhcyAWUNr
 dhQ3x0XNA3RIUuWftn+fFaZu8RZvS3OquMh5dTuJRQvCxU3fr9mnWrJioBKMAY0b9OP177OB93
 noB03FDBAE9EoOTp03KTTFfxY3XLuwyfH46RMG5uUj233ff044LT3i+MjPqAGXTtPBQYmiOa9z
 Xn51fttbHe7pTQ1/RjoTynAzhQSBR1DkLLw2jxRzJ2CNFOMKKWVsSNnMdITxd4rZqZYUZypKlO
 yq3z0/yjjOF4APPtrFZcBAAA=
X-Change-ID: 20260330-eliza-adsp-usb-8ef2b1b0fc13
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=3171;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=nTbp1shaJoeWLjzKXLYsaqNmI45aHF5rl5f3u8vBoeY=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqBdQIaOFeGQD/jvmtbIhtOLzqA5iQ1q/DKLqg/
 1mfwrL12pqJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCagXUCAAKCRAbX0TJAJUV
 VoS7EACrOJAbdzvC6XJGe7w+U8LCWwSt7Q4ucsVHB6a6BeOTwxQc22xC6TNZQJ/OfbTHFkS0blx
 C/ZIHd4JYzTzBJjEi3Lp9ym7T3X/5iIkvn86HTvXZOxhluqzl+nvBDA5IgVRkxFysZg5icBidaJ
 oQdtul+2kO3wDWVNfdhX0JWuS+FD3+PZTEexd8WgEdpdA8Pd8/FJgCCWFHO5EOEidDQr4kmNPcc
 5xB2YUgoHVaBWp++gPuK+0IiusrC8WTLMeXbkyJSsiBpqjlcqX5ixjoC9E3l2xbe0Go8EQvzLah
 XlrkxxxsCJxrAQnHDdbB5U8eTCLwEegUsFD7S6+eQ9GoGK2dwdrTQiSoTrAgVNRO80urfb8UhSL
 PCL0XqPUwE0KYEYtbj1/v5qaw6rvzl5UfzqddtXOTVC4Z6HXmLA76atBJ3xznS2uN10S8JqqKGz
 XdRGnu98HozXLWy88ovCyRoFtfqq2KfdOWGDFarQwCsJaGOeeUqqqXjXgM0cuji9gyrA0DyEt99
 hdr+W+NFdq56evG53opQ3akMLVnrNOqrIfqzhU4ckeatp7DmdPBCWcvd2DCYHjyFxCUz2R7c/aa
 etfFwcUn9htiAZps9+lEEQ5BlbtLlkORyJSawaDH6kArnTzZTvRAauWk7xNrVrgHf8+GePvYihm
 GUn8ARl/+AddLRQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDE0MCBTYWx0ZWRfXwtidIx8qyN8P
 6jpkcdYfS6NJZ7yiZKWF/mZYi+SGrbjompn/cAMzg9LjBCCy3zBMJiOOY4c/sDgZmG9T86eOZIm
 B8/r+n9djzQ+PWrj+C4JoQGUOh0GnAEFyK0MqWeyZLAdGOvDIGGwxfTFThuIil+Y9gJRo51h8Ta
 /djTWNj2EbU3QPJRkUYDD+Nu8Awbs/c8U5hONGRFFPXqTmrjZlUqSp5TJZx+bOZpX+mxcGLggHp
 sC839ZiLy3Y17flw+g5atRQ+BwnBqU0aN3LyolQi9cV4PcPk3d522SuwC5Nj3+2K2cM8D65h1xE
 Jv1AOsy6h7+lTGczABUsL01uCIGxEoEwl5ZeK78CD3n72DmYAf0l20fELGrUp395Y1qOPI81IZ/
 mc7ZZNQXZ1GF+104p1v5vdH/TGaEQZZqyXwriGtLGNrCf/SYz9pHIex51i+QlEC6E4mYt2e/ZYF
 Ayclpy0EU2eecMrKYJQ==
X-Proofpoint-ORIG-GUID: emAsWRm7c9mLxRBpC9DOuU4yxXMhONn7
X-Authority-Analysis: v=2.4 cv=N6AZ0W9B c=1 sm=1 tr=0 ts=6a05d411 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=NtgjAHhJo3Q0P2g9Zl9R/g==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bC-a23v3AAAA:8 a=Qmfk-NFhDH-ilJP6KxIA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: emAsWRm7c9mLxRBpC9DOuU4yxXMhONn7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_03,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 bulkscore=0 malwarescore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605140140

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
Changes in v5:
- Dropped the redundant interrupt-parent from the AOSS QMP node.
- Picked up Konrad's R-b tag on the first patch.
- Link to v4: https://patch.msgid.link/20260513-eliza-adsp-usb-v4-0-839936e89aca@oss.qualcomm.com

Changes in v4:
- Picked up Dmitry's R-b tags
- Replaced PM7750BA with PM7550BA in the commit messages.
- Put one entry per line for the repeater compatible, like Dmitry
  suggested.
- Link to v3: https://patch.msgid.link/20260512-eliza-adsp-usb-v3-0-6420282841c2@oss.qualcomm.com

Changes in v3:
- Rebased on next-20260508.
- Picked up Konrad's and Krzysztof's R-b and T-b tags which I forgot
  to fetch from v1 thread.
- Link to v2: https://patch.msgid.link/20260504-eliza-adsp-usb-v2-0-18e0b0b0407f@oss.qualcomm.com

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

To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
Abel Vesa (3):
      arm64: dts: qcom: eliza: Describe the ADSP and USB related nodes
      arm64: dts: qcom: Add Eliza-specific PM7550BA dtsi
      arm64: dts: qcom: eliza-mtp: Enable USB and ADSP support

 arch/arm64/boot/dts/qcom/eliza-mtp.dts       |  81 +++++++++
 arch/arm64/boot/dts/qcom/eliza.dtsi          | 260 +++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/pm7550ba-eliza.dtsi |  70 ++++++++
 3 files changed, 411 insertions(+)
---
base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
change-id: 20260330-eliza-adsp-usb-8ef2b1b0fc13

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>

