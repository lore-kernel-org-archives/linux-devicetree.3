Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794470585;
	b=qUUzHj6WNbsEdqnUAiGU8dciZCxJjF3Au10izw8+raA9sfepehdG493sidcYmomB+PaQ
	 GxUg4NFNNWu4wjmKmYUqaSbnUM/8/raWOcKgtNH25ezQa6FamAoCC12QhOakkR1/e+bYf
	 5LjmayBlsq4y7JQQvoZHRCa0k6sNRTIApZkcj2IY008qHslvkzxmSABhV96xDOqb41P+7
	 pSvdSHXP+H2lwYF+cmpHx8SRbA5OFnfpQJyrWXx+enLiYKy/HhnXTpNFBoySi5RCHZ9Ck
	 3OC34q0MYCNrHLS7Yd5IYS9e22q6Z+1C3ym498uBB30n8NYmDPSp8TiZ9IK7kX5C/nA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794470585;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=ZO6TWife+Q8t899ZyGzHRGytN/7TFwYu3pw4vzN9A1c=;
	b=4aCZR7mrM2qfsmzcgGmAJBISCEjo4ccelX4226VrTymC3wYLM2NRgCvs4Cn7IPI88+6F
	 V/HwCHE+bQwIDiGtb1Ezl4KQqgBEtRAWjWACL5mvUtYZ2uvBo1pFd4h9jJf6zn3E52IpX
	 t0l0fgLTVp56hNMVwUYh3wh9hn+50nCbJXHE8vrUejMGaJHOl8N1lOl3zWSAaozO1vhP/
	 ejEn1EIzQ5MZ8RqHE59i3WIO5Pqbp493XQyraooejO6XeNXrtFWZmr/aKZG0qRGd1IVOa
	 zTZyRaiLHMk/GsEZxCVCmNAfZn87yoIFItnGRIjb2qER5tIqScw/xNOG+bULF5jni1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FpEBR6uh;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ChxsvmTu;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95E82606A32A
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 08:03:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95E82606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FpEBR6uh;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ChxsvmTu
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC2ZjBK4149502
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 08:03:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ZO6TWife+Q8t899ZyGzHRG
	ytN/7TFwYu3pw4vzN9A1c=; b=FpEBR6uhr1ZbVLPRmq7xnrmIpdpFGOMqY9SYuT
	tBqjH1IcTSVBctOkSUwp9YYfVF4bPB4KezfVucbaq3VrLi2Kh/oE0HGihmvj4xTv
	twhWpLfQIsvcBFt3ife0y7tv0PDXEexuwS1urR/HmCuAzLQuf9eBBjBHK4x1RLQN
	x1RPPauWoahoUePhl+1qgIIBJYXSrasyCil3FpHlBZ5E3aUn3cGhehs3Rks9q+IU
	pq0uM74MpZVPPfSirW3HCRyrEIHsvQ8uxAdZaLehG1CMnGTb06lOii1oUQM4E33X
	X5Ako7N3oWgbPNLKLqNHD0UKq+oPF3e6OYKXFCAlz/ex+D/g==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvxc62e8w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 08:03:02 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b15e47e57fso2230025a91.3
        for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 00:03:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794470582; x=1795075382; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ZO6TWife+Q8t899ZyGzHRGytN/7TFwYu3pw4vzN9A1c=;
        b=ChxsvmTuCMuGM0WSDME5N19QzcdN4i+5zDoqfPcl46JsBJ4K73ilH2c30exDY+dN4w
         NTDHnyvBv8PHO8JwCEqqDeHwcFVOn8+7JdQ5QqvHhp/mMMv0GhBN+X8hFQmCPxxCJlzI
         EmQzOZ1o1m/vYLF6fIsVHFFVtmVgpOkBmsVG7210A7KpFgjTUdxaNIMQuXRyZUrzwOvI
         5tQL0W3o6DBPLnOPJD5d8DWI0HxEu08cZDNA+qaPBjfUZLmTkUdE1C0ZUBenAZNqMe+9
         tJFBHd/fCKzr6kVDTeqlbPZIU/AA4Z/dI6wRnN64IrCrTwhAsUtEy0e1cUNA4Nx0hMGU
         K/qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794470582; x=1795075382;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ZO6TWife+Q8t899ZyGzHRGytN/7TFwYu3pw4vzN9A1c=;
        b=ULdH9lsHUhfPamkYBnTzxrcZRqqafprb3SvgxsilOJu3G2w/+YTbhUNfhuHa2Oq6Sj
         JRiTla/5FnXUHyAOcvEfJR2wKzOAmD3xnlfy/3L/Zu1RKXH3wrLLE4vPPzCBZ6AlEg+T
         KWpgddf9iXji162UNVcmenUlsDpD5NKP4KcAFqwEIenuber3yxhO+1cTXwFLGECsWRvt
         urZ6J3DwUE/RSDnyq8DeEbNQfd/4SmFkHHvbT1MQJL+sYL1IiIvrdYzmJ8rm5aH+aiT9
         eIdHJy9hXK2fI0qF85RNIBPyDLbV96poUmJ7wQqy563DwQFEx/dfK3GtXiG1XPnv4/Yx
         V5+Q==
X-Forwarded-Encrypted: i=1; AL+hErGRaY3ByyEuiSFj3dFOO3K4mb6p4MkTMnbKGHiDOGx+d2GAqJHGz9ywnikoQg4t6RWob8H6P4FYsp00@vger.kernel.org
X-Gm-Message-State: APuU4Z+mW8fRwbNsTLwYPDGRj5NuLl9e+8CrB58mOMfHHWp91qvgeiFH
	nNEFCpEZoqct3n+cviWY8BqTrO9Q/MBGWgcQ8iKjPRPk9SmCRseq3viQnLOicMxQTWFt6MU0oFY
	lBrHQm4+ro0mpvpyLSqxxZq73TbuVCMUgn9fRD9xDq1wCDDSvJ3kDEUvdCcB67QoA
X-Gm-Gg: AYBFou0hFxNSxF21/sGLsj1CtHa/zu0rc/z+kSNVg0iAZmJYtygo6zZcDk1YolaIU4L
	ABcGXDtC3/REoEjKIrLqX5T2WtTUv+dI6YN7CCGNCKhUzjkLKfYIeas39oNZ98zRXVneoxwLynl
	3l5u0KJxDHrdcszcZihgYqstSYiazPvJS4BI08D6F7ePNIbcDo/mwD6Uaujx8v9ZGYK8g6AKNW3
	FzHfWup3Cxi2AwAStbfV8bju9yxpm9tKu9ElhtdJw0UP3pnUJ09wDMTx7AKk32dEdWWH63X3VCR
	dnHGLVfWOHJyKY4sZJjsg5YEFkaY5ex7JGGb8Gyiu14MUJKgGhfgkpVZ4xxknCgQsQaKwOw5YIT
	p2Lv82CAwQ+pSQD3vL5XgD0+564ARr8DKe57+8xc1gmMfdbR1M/hXJCe4n1ZvNshlDBkgDXIQ0X
	IVS/YXqx9M
X-Received: by 2002:a17:90b:1dce:b0:3b0:d070:3c46 with SMTP id 98e67ed59e1d1-3b182eebe5amr4168852a91.12.1794470581938;
        Thu, 12 Nov 2026 00:03:01 -0800 (PST)
X-Received: by 2002:a17:90b:1dce:b0:3b0:d070:3c46 with SMTP id 98e67ed59e1d1-3b182eebe5amr4168819a91.12.1794470581395;
        Thu, 12 Nov 2026 00:03:01 -0800 (PST)
Received: from hu-apateriy-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b182e3a74asm3722251a91.4.2026.11.12.00.02.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 00:03:00 -0800 (PST)
From: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
Subject: [PATCH v4 0/3] arm64: dts: qcom: nord: Enable SoCCP remoteproc
 support
Date: Thu, 12 Nov 2026 13:32:49 +0530
Message-Id: <20261112-nord-soccp-dt-v4-0-af6e44e9f397@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKly9WoC/3XMTQrCMBCG4atI1qY0kx+rK+8hLtLMVAPaaKJFK
 b27aUEoRTcD78D39CxR9JTYbtWzSJ1PPrQ51HrF3Nm2J+IeczMowYhSaN6GiDwF524cH7yuHSB
 UldOmZHlzi9T41+QdjrnPPj1CfE98J8bvVzILqRO85ERCWmq0xqreh5SK+9NeXLhei3zYCHYwR
 6olAhlRuBESpTC0xT+InCEAS0RmRFiztQq1cgp+IMMwfABRhr3IOwEAAA==
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Proofpoint-ORIG-GUID: 6HRWP3FZCKyqxDgYHNgBqmOFvZmEwX1N
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAzMSBTYWx0ZWRfX3WJ69AjP2jDr
 nTCtVv3CT/mp70b95QRlOnBWiNh90rlHEuYAiBuvN8Dt2Tt2Nim915fcMCmq3ZeOKYzuNh7gPUV
 yFyJMPggHJHRl6SWkqUFJvcP4Cp+XLFPK8aU2rP/F5n7IyUVy254TZwTr1WXH02MoHI9onPEK8m
 /cukPbPsOxdYpNgClQOKU69T9QjiMzBFZniMr2K5axCZWT9shtZ0a6+C0IxCB6D+s0pYgjHLSJq
 hLL0m8Fs4/gWfSsp2HbNBIHq6kTnY4Vps2UJjqgAXFpbLH9QU7/Awok4LGqrOIK46sHjLoI8OFr
 zfzHV0ed7186pLncFUr69tJgO7Tn6SRF86P0MiPM+5GdioNjQcshjPUBKMbkZcMWPg8hD0NrUtM
 vXmCMtNDwayuEA47Wr3Q/PVxh6MWrq5S4trs0tLDVMzgETcQKOV/KvH3DqNKzQ5SqV0TFllTGP6
 SktwwTpliGSMlTzT0EA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAzMSBTYWx0ZWRfXx6H5g7oML+qv
 GMsmu/0E3i1ZJsB82e/ao+60zrN4bv4/NFygosn2lnSgg37fbj8ABYOS9zwk52XYshQNzMvgoZs
 s2zwcW1EBkdxDhiLywxsbvx1xhNo1x4=
X-Proofpoint-GUID: 6HRWP3FZCKyqxDgYHNgBqmOFvZmEwX1N
X-Authority-Analysis: v=2.4 cv=O/ysLx9W c=1 sm=1 tr=0 ts=6af572b6 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=fqOI0YBPAjHUksOb1HwA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 adultscore=0 malwarescore=0 impostorscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611120031

This series adds device tree support for SoCCP
(System on Chip Control Processor) on Nord platform.
SoCCP is used for hw fencing for display and other
use cases on Nord.

It has the same interrupts, SMP2P states, power domains
and clock as Kaanapali SoCCP, but its firmware ships without a separate
SoCCP devicetree image. It therefore takes a single firmware-name and
memory-region.

Prerequisite series:

[PATCH v5 0/7] arm64: dts: qcom: nord: Add remoteproc and PMIC support

https://lore.kernel.org/all/20261014063953.549379-1-shengchao.guo@oss.qualcomm.com/

[PATCH v2 0/2] Add binding and driver for Nord SoCCP

https://lore.kernel.org/all/20261014-soccp_driver_dtbinding-v2-0-09d9c1378e9e@oss.qualcomm.com/

Signed-off-by: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
---
Changes in v4:
- Removing the RFC tag.
- Dependency  "arm64: dts: qcom: nord: Add remoteproc and PMIC support" is merged.
- Got Reviewed-by from Shawn, Konrad and Abel.
- Link to v3: https://lore.kernel.org/r/20261022-nord-soccp-dt-v3-0-1a69a4d54c42@oss.qualcomm.com

Changes in v3:
- Rearranged remoteproc_soccp node in nord-rrd.dts alphabetically after remoteproc_cdsp3 node. (Shawn)
- Replaced nord-soccp-pas compatible from nord.dtsi to nord-embedded.dtsi to resolve binding check issues in nord-ride.dtb.(Shawn)
- Link to v2: https://lore.kernel.org/r/20261018-nord-soccp-dt-v2-0-4d713d316e9d@oss.qualcomm.com

Changes in v2:
- Drop the BWMON nodes from the Nord SoC as they are outside the scope of this series. (Konrad, Abel)
- Enable SoCCP by default on Nord and drop the board-level status overrides. (Konrad)
- Amend the RRD and Ride-Embedded board commits to describe the addition of SoCCP support rather than its enablement.
- Fix missing whitespace before the opening brace in the RRD SoCCP node. (Konrad)
- Got Reviewed-By tags from Abel.
- Link to v1: https://lore.kernel.org/r/20261016-nord-soccp-dt-v1-0-ee13aef55d8b@oss.qualcomm.com

---
Anurag Pateriya (3):
      arm64: dts: qcom: nord: Add SoCCP remoteproc DT support for Nord
      arm64: dts: qcom: nord: Add SoCCP on RRD board
      arm64: dts: qcom: nord: Add SoCCP on Ride-Embedded board

 arch/arm64/boot/dts/qcom/nord-embedded.dtsi     | 10 +++++
 arch/arm64/boot/dts/qcom/nord-ride-embedded.dts |  4 ++
 arch/arm64/boot/dts/qcom/nord-rrd.dts           |  4 ++
 arch/arm64/boot/dts/qcom/nord.dtsi              | 56 +++++++++++++++++++++++++
 4 files changed, 74 insertions(+)
---
base-commit: 074f9a67c7ec6287105641f0100797473deb843a
change-id: 20261015-nord-soccp-dt-bbc2d288c560

Best regards,
-- 
Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>

