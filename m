Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E3A7435507
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 09:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784800589; cv=none; b=NWcED+4dnPD6nb/YFWIszaai551DQ4uSt6C7LdH97rEghIXIKGUuB74h5dyrg6xgp0JbkDd397N/esQ+pVbOO6PyT1BhmqSc1hgKLCirqUkYqYO2R9HXWNfmobmrt1wal9+0qE8gJlE63bRgW3TZtaq0qwxM/oDSWYuu8Cxy6Ww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784800589; c=relaxed/simple;
	bh=US0TF2U3ghWsaszzBpUSGSpFLHbyqGZc98PEKS33tcE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=QxWSgKG9guifJZMgyO8PW78Ap0cKX4Z/GiLO/qyPtxLg1Rao/yz1cDeNF2LmWnLkQvHiNrMBE+BfU+F+yQcq2XZSzcxphCBX9oFpoQb0FD5QCvJ1RoS8g0J3b8AyM/bByVRHknKNCVti2kJly1XeudsfNenAUIbG2Sw/uQ3BC3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PCwucvp9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Vz/dpSI5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PCwucvp9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Vz/dpSI5"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N8qd793261313
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 09:56:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=4lSDEt//Xaaiq2pZJ5EPUK
	qp5M7wWI6L0iO7YtKCNpw=; b=PCwucvp9DD+Q/9jRCA/4JIC9QZv6gkw6MxH/Mq
	EAXxSfnR4jQ810ChMHlAV2nkIUDCKMOVNhSk9Wt+swSOFQfqdDsUm4Q6HnXdffEa
	QyaaWxExiZlrJRR/IPArHg/QLD8Bx2xEwcIH/Ig510/bed1JgoFSHQqpxgdtcVSf
	PfGS9d/b3gCtHBrHjJ2p4gO5iFMyV7nx19SrcwrshszVGS4KSTnrhqko7CKkSPOC
	wzk9ywMZxbQW8wV2UgryQxGbAg4NC8CAMEJqjkO+dLNLz+q4gu//U4TAp8xMztgs
	sBR6tPIkuK/4KgX5XiVMpAEF95AzOY+cuuHi70CshP84WA8g==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkafw1j0t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 09:56:26 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cae7a8b9easo1454705ad.3
        for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 02:56:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784800586; x=1785405386; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=4lSDEt//Xaaiq2pZJ5EPUKqp5M7wWI6L0iO7YtKCNpw=;
        b=Vz/dpSI501M11LB8tknt6ARBMTPT7NTcY05b1iVVhOvVrYge4eSbTsfH0AZNKJOFh4
         pAvbrQu7mrMxCtJmy6muNNsKXG3H1+Q2GtDeuyU6ehHQOllnWrZgzMGGL57W2zm1fZXu
         iWKbYLz+1lNGek1/VO0ZnilmhiyEf6qItlcNyPcGIgfEDLNFVf6gWDEa+emQxLJIC3fb
         eKlvpVO6N85ykH9OpFo9eql/QqRfDiZ/ykEmkNzac1kwGKDEctsDwwXHslTqM3FYw/wn
         KUgOUuFgyxlthL6umroWCZtNBAxKM8lRPHOnM8dF2cP0EgNu42W5xPBD6QykW0BmrUAp
         Fa+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784800586; x=1785405386;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4lSDEt//Xaaiq2pZJ5EPUKqp5M7wWI6L0iO7YtKCNpw=;
        b=THHDER55wW20tWOcGL9FKkmFPidvjT2MVhf5/CNP46jGsJufBp1AR3OUdBfVIIp5ak
         idr6ttdxggl4rmta55sN9jwE2/AXuXmOe2fcIS/fCwu4QC58BfKe+dr/4LpVEHPFtBYG
         DEGrTMpivba2fc8hsE1xIK/cskYInYO7Ut3ixiLnCiqq/aORvXgdBkZvYJuTySbau6/e
         bWQ6jBBPXLvTNbx3gzbi7Fj+jpKCTVw/YYjTWlg160+6wb4T06IrqO6ZTOaNJmtbQKos
         V+MgnIF7T73dqAiNZ69r7h5wAjDyrvuQH8dLnLdeb5RQH4SV/n6uTYA/9/Al2TdpgNIP
         OmhQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq1SQh62M4j3UydpLqQhZxiWaBCBkVc8GaPNubSpx1tw2srj4xxujtdR0NGPMu1Kkxi2/RFuwmPyv2J@vger.kernel.org
X-Gm-Message-State: AOJu0Ywm7xoV9z0xUffsxAagEAFZRZPoRryqXpIAdxaOroQQZH7psiDj
	Kdt3/zs0Hrw4XexqI1HFNGoUMtKSsbOloXbzYroN6xs60EJwQWfKLBesjUMr8A7nA1mj6ODQi1j
	Qp4BIWmrCiJsK+gJG3kQn6ig+dIFnrdJ/OiI0kA0TNLu4IZ7JINnnU2nfqos7Dfqs
X-Gm-Gg: AR+sD10OVz6EdUMDGBbjr+qaT1qtRC1HXnoD20W77pu2SAqQCmuUpUaGsbqzEZa4unw
	e9EOBhRjF19vh8MpZoWtEWSnYFqsq5wC4GPBGXPyPpDbRvWvHdY3PuT8VFepvGIFY+vT0c33aT3
	Za16UBftRjv90LG6kRO8kEr5USkIuKH7I0NUyb512OA3Vkxt/3Mj45dB4ioogMU6lJ104orfj0O
	kSrqGtGT/C2ApsaPZd2IWaCUDqHFrdi4F6pyn3dfMi+vajUevCYUXMo0ZIVH5COM6Lc9Lb9bcZY
	BLJyw/Dv3iqbd/q2+SacTeUCfQl/O61p/Rie/QEu/PT92kA6id4WKtt39faVVLrxU9ULqtHw0or
	JUoOyAQmUCwcKnsvJksbxvWRQW03v/6vvuYnqM4rtP8EtCva24oM=
X-Received: by 2002:a17:902:e54e:b0:2ca:6885:8a06 with SMTP id d9443c01a7336-2cfa6f977a4mr20250325ad.5.1784800586145;
        Thu, 23 Jul 2026 02:56:26 -0700 (PDT)
X-Received: by 2002:a17:902:e54e:b0:2ca:6885:8a06 with SMTP id d9443c01a7336-2cfa6f977a4mr20250065ad.5.1784800585671;
        Thu, 23 Jul 2026 02:56:25 -0700 (PDT)
Received: from hu-weiden-sha.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8efa2cd0sm30392755ad.4.2026.07.23.02.56.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 02:56:25 -0700 (PDT)
From: Wei Deng <wei.deng@oss.qualcomm.com>
Subject: [PATCH v2 0/3] arm64: dts: qcom: hamoa-iot-evk: Enable M.2 Key E
 connector
Date: Thu, 23 Jul 2026 15:26:18 +0530
Message-Id: <20260723-hamoa-m2-dts-v2-v2-0-82254ac101fb@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAELlYWoC/x3MQQqAIBBA0avIrBuwqZS6SrQQm2oWaWhEEN09a
 fkW/z+QOQlnGNQDiS/JEkMBVQr85sLKKHMxkCajLTW4uT063AnnM+NFSNpYb1uqO9NDqY7Ei9z
 /cZze9wNFv96JYQAAAA==
X-Change-ID: 20260723-hamoa-m2-dts-v2-2067c7421569
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Chen-Yu Tsai <wenst@chromium.org>, quic_chezhou@quicinc.com,
        cheng.jiang@oss.qualcomm.com, shuai.zhang@oss.qualcomm.com,
        jinwang.li@oss.qualcomm.com, xiuzhuo.shang@oss.qualcomm.com,
        mengshi.wu@oss.qualcomm.com, Wei Deng <wei.deng@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=XNkAjwhE c=1 sm=1 tr=0 ts=6a61e54a cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=cm27Pg_UAAAA:8 a=GEBMHTYVcII8AEtmbGkA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: dFp29Hfy86UpgfUhAUqiNrSYmN87GSrV
X-Proofpoint-GUID: dFp29Hfy86UpgfUhAUqiNrSYmN87GSrV
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDA5NyBTYWx0ZWRfX58Jo9L8Ebek7
 cbx3KZXbI3HTbHHoEzAdaxF6mByRx1z12WGPwX4r3FbP5m6LtMay4uv69fuKeqg/e+0huxCK5nZ
 t+bVbp+vnQfKsbdxnUG+9NdJkZBBF10=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDA5NyBTYWx0ZWRfXw8+zJ1zEa5Fj
 thYogWM2I2d2NQ1JFKzmm0L9jXxv6PZHxYUyU7fJYyUUQfD9yvHRcIvgWzfaGulD/nzuxhUKXC+
 AgWRuBcLHBNGKGeQlU9c5FTsLc5zD5Sxd2ZDdOCMf0tggug1n8Ffr/2WJ93jNQqwRaKLjh1FaNe
 nj9OSIptE6TkCUQdsi7bo64Ru+rD71wnSjg9fY6FdST+m83PKQC7V7cWC+wIH66zchU235U1wSq
 luGGL/JC1O9X8xj6POYs4AI47tg0PRNIGUp8KWnk760JY9UWBwDklbfh2604Zm1pjD7vwt7rwbW
 /xcnDI3KPFfbGYyju6XzMkyYLA93M2+ytDpMs2pTyXfpYY5vcLjTemHI6Bh5IbxQcTau92wK3Bv
 lXEX4BwCBCLIuz8reLp3kXMsLe7oVCXltpHt5cp8ZMHo534ipBq4y5CLq7s8yxImYJEXz1DDTBG
 FqzyaFr5EtUPCqo55ww==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_03,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 suspectscore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 priorityscore=1501 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230097

Describe the PCIe M.2 Key E connector on the Hamoa IoT EVK. This is
the DTS half of [1]. The pcie-m2 sub-ID patch is sent independently
as [PATCH v2]; the W_DISABLE2# else-branch patch is dropped in favor
of Chen-Yu Tsai's series [2].

Depends on: [2]

Changes in v2:
- Split PATCH 1/3 of [1] into two commits (Dmitry).
- Add usb_2 HS port@0 (new patch 1/3) to pair with M.2 USB port@1.
- In patch 3/3: rename pcie4port0_ep -> pcie4_port0_ep (Konrad); add
  port@2 for the USB BT variant; remove unused vreg_wcn_0p95 /
  vreg_wcn_1p9 (sashiko). Konrad's v1 Reviewed-by is not carried:
  the new port@2 endpoint and vreg cleanup were not part of the v1
  review scope.
- Drop PATCH 3/3 of [1]; use [2] instead (Mani).

Link: [1] https://lore.kernel.org/all/20260709-fix-hamoa-m2-w-disable2-v1-0-5e725091266a@oss.qualcomm.com/
Link: [2] https://lore.kernel.org/all/20260721065413.2306137-1-wenst@chromium.org/

Signed-off-by: Wei Deng <wei.deng@oss.qualcomm.com>
---
Wei Deng (3):
      arm64: dts: qcom: hamoa: Number usb_2 HS port as port@0
      arm64: dts: qcom: hamoa: Add compatible to the PCIe Root Port
      arm64: dts: qcom: hamoa-iot-evk: Describe the PCIe M.2 Key E connector

 arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts | 183 ++++++++++++-----------------
 arch/arm64/boot/dts/qcom/hamoa.dtsi        |  13 +-
 2 files changed, 86 insertions(+), 110 deletions(-)
---
base-commit: 290aaf24a551d5a0dce037e3fab30820f9113a10
change-id: 20260723-hamoa-m2-dts-v2-2067c7421569

Best regards,
-- 
Wei Deng <wei.deng@oss.qualcomm.com>

