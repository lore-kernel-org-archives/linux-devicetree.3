Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C65C13E5A38
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 12:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785759052; cv=none; b=Uf0+aoN+jJCbqvN0Xa2/8BHFeRfgDB6GTbWdZkmTqwJvgNuu5EKgujJifMgiEHdWwsrX0kjnJyKJNaAkY8QaliZQ4g0DwMNJ9m3wSLrOfP9CLx9t68WVq09hExeKF+8Fl8Jflv3/niPyjIZxE4/dPoaaewills8S2U6etgmUeiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785759052; c=relaxed/simple;
	bh=bhAahT3NJxDTdKB4UyV1IZlKYqcqMFXLTf1RkZT9x6I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=VMpYHfcLsm4ZazHClSllhFxfDvqUqac0OwucZ2WRfB6WDpM2lQ7xhku5fL8tpVRJIsrVLWx/IUWcviN/UZt4EOcnymjHB+XepyDBvWQiBYO3GxAxCkjizA7quuOIElNN/EyG0M/i9vocjESA7E021mfFWBeMTDIFLqPfXjd5fqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QIvP7adx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HHtEX2xc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QIvP7adx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HHtEX2xc"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 673C4TUv1722014
	for <devicetree@vger.kernel.org>; Mon, 3 Aug 2026 12:10:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=4L9uawW8hWlFW7y8D8/6KD
	E4PdpPN3ONUaJ0tmMOntc=; b=QIvP7adxFq/YfCfcYTt6IyGSmBix37yKiyf/NW
	c5UFB7RPF+6Gy8cn6lwpIybObatiIQsBzZaUawqKavukFnU9IwuotSE2e6prH5yK
	v02tC4KO4vuEQQ/p8eVaSAL/iDHjgzqMoiTPUdVjHMp2NCRiSP75r7/mA4Z8xgKm
	KNVQ7SyQvzyhxq9q9tXygNA6v3AahKXF8ahXoKGsT+QS7IsCkvw5Yk+GGDuwQR/2
	UMtg3xSNWhzEzhgb8ZKHcMIgK8wdneQ/ZAv33Fvz4Y1idjTIO9E5hrmMNTAuWLHq
	JrBQfZ7cbJMRSnjCKvZfXkrUyJj2EeRw0L78bdMXVCkAMOqQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ft9fak35m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 12:10:49 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-385d2703b64so3644708a91.1
        for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 05:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785759049; x=1786363849; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4L9uawW8hWlFW7y8D8/6KDE4PdpPN3ONUaJ0tmMOntc=;
        b=HHtEX2xc2stJXbqs4g1/5cxgiNNZyqSkqXz42UNEL3H9+RFQZBEEUa2ZA8tQntXQic
         khw1GtvtUJEjbFFM7dKyc+sSQ81eGzSpixULcyTQCzEVORRwS+ym39214dVRNXmW0s3Z
         +xJNAHId6YuUlhFBRkKmwxSteJdl5r7UTy7LDXdRteaw13ostN8jfDrMHKEWjbrOBQi9
         cO3vxR87nMPc3Ug06B9GipBzu2cJJdmKWUW7SAPuWfxn0X6miYDWO0Ui9tejv/MPdt54
         dW4erbBMcz3YNp+0SLv40rnJsGTcr2JdK7QwFuAVL6PvwuIhM0D8VHcLVvFHcMmXGhhY
         CGkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785759049; x=1786363849;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4L9uawW8hWlFW7y8D8/6KDE4PdpPN3ONUaJ0tmMOntc=;
        b=XPzId5/8MkXOgIUxLM0+XhcMUF4vOkyojPcppTUZYqjCV8BvUG6Bx8o3k6Ww7Qmuip
         t+wQGFxxFgBmoDf8EXG1TRz+jQdZ9O5ZbVSeHHBihCKDY6jnzsGjQ2ACWQx8PllbzXd3
         aoar6z5NJ86+2ah3A2+yUtct62737RInu7QoiI1Wlk7TXRREcbtr9Tds0UhB/4fX/5HU
         Tu+IXwXdWo3XPbBbUs+JjHeLDP+3JA8BLNTGW5m1E8h7HkCUmgKwv2WtN0SAIWW9XyiD
         O3nlXs14KLQfTeUpNEeYgxv8Y7mnMpZCjfUMSqDLnk1105tc2Y70GHToMfBe52VX+l64
         XZ6w==
X-Forwarded-Encrypted: i=1; AHgh+RrFcNznEKUY2DQSmfh5FGSSs3sd2wttL8foNQWOp1dhMjCL04y8oC4a5xF3E9qx6cDejf0+wEeKDef6@vger.kernel.org
X-Gm-Message-State: AOJu0YyUKM2dnnGR24A80VYqtiAeWk4yLXz1nrrFhI+jruCx8In/NzUV
	aDO73fLjJE/47h8YXSz0hkyd8MrRkh44KRpQ6JMbMXp3/jMvVu1tEZ/7KwQ6Y4N8ge4j25CKGAC
	UrS62P70XpA+E0DAKGCkLvelF9g6u7O3s5q2YLurMaoPecj70+ABkd9on3NH/ojaM
X-Gm-Gg: AR+sD10OS+jETTBSLKpv4UJEfCtkAt2DGO4ezp+6g/CHlNn6uz1zzFuij6FyyLtLD3W
	DagLoHUYWXbKLyQGXyCF4+13X9jjTgIMCdZFDN1kjlg9F4/sBZBbmx8JhyrAnQJaf4jZPoqusex
	E1eOT9KIhzbVkTU9R5V4aY/V3x/ao8dDhdnMQuaGCNg5/gL+Oxm4er80yN6jCqnz5l26mfSYxZ0
	zjMkOLs8lXJX7VcEF+waFGbG0bYjX1+GXevIvJFgeQdxkP71LWY/0Gm/63Xs0qc/eWTHYXfUeo2
	133fIrGqgDN4dM64hiG8gF7CB4nkDrFtcG1ykIHN0cRQQBPtEUR8QNyVbeHbuDd/RxvhkaSax+J
	8+6amt451zmtVbO/xYt5qlWbRqWI=
X-Received: by 2002:a17:90b:2549:b0:38e:42f5:d096 with SMTP id 98e67ed59e1d1-38fbc8cbbefmr7525499a91.0.1785759049137;
        Mon, 03 Aug 2026 05:10:49 -0700 (PDT)
X-Received: by 2002:a17:90b:2549:b0:38e:42f5:d096 with SMTP id 98e67ed59e1d1-38fbc8cbbefmr7525458a91.0.1785759048483;
        Mon, 03 Aug 2026 05:10:48 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38fb30a3c75sm3864076a91.9.2026.08.03.05.10.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 05:10:47 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v11 0/2] arm64: dts: qcom: kodiak: EL2 overlay for qcm6490-idp / qcs6490-rb3gen2
Date: Mon,  3 Aug 2026 17:40:40 +0530
Message-ID: <20260803121042.3313824-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=PZPPQChd c=1 sm=1 tr=0 ts=6a70854a cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=n0mgBXbVGTAyQq78KrMA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: g1BrdnxAw6_1lSK7JvmZjfYhpm2BNdlH
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDEwNyBTYWx0ZWRfXx8v9FcFEo417
 pQe7lWuMyF3KCh5q+tynqwKr9lmMv+gxQfmGhZYyNk2Mu8ZgmN2MUudD336FuiPvtd+oz8/4Vdt
 m6RitDVI40VzP+JAnyT76jXNx8as2nU=
X-Proofpoint-ORIG-GUID: g1BrdnxAw6_1lSK7JvmZjfYhpm2BNdlH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDEwNyBTYWx0ZWRfX3J/9JPhSb+FV
 5a4Q662DAkAGkZpALuPfbRfsU46jbL50n3ODKfCiItLjAVgu8E03MH721XAzoSmUUTR7Q3/ftSx
 kKeCDRmRLtFw975S0+zFlmfoJ3xKEqojS23+ZDJD5/p2AKDyJ1CEQ2gIKgaxVj9ojWEazx95c/v
 3LwJ25a5PLKiKyq7yHhs+dPBC3GlYjDfPjr2sy2+UEh5tiT4KkuKumugOr24bm48ZcKGMNePP9n
 HtPMx7jAZTdw+F0wiyC0d+O0JNCYPGwKVgFqVsytHfrRVpnSjJ1TAVgi1emvYpBsuBBOP1STh23
 lzrpo05WTA9mfWQJUx32iwM9aF/wFLcWPJx3dkNbBKY9D7Uy2alCwGaRC/UkmLHkasLKWmWLTWu
 LhGaBfGKw+g1KT2EG4JRee8o5GyT2m8XYE5oEjCLFDk2A6N6HAaSbOm6vLcDLchH7clAuN64KuF
 klS4C+Fc3soMPjbnVpA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-03_03,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 adultscore=0 suspectscore=0
 malwarescore=0 impostorscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030107

All existing Kodiak board variants run the Gunyah hypervisor, which
means Linux can only boot at EL1 on those devices. It is possible to
boot Linux at EL2 on the qcm6490-idp and qcs6490-rb3gen2 variants;
this series adds the DT overlay that describes the IOMMU streams and
other kernel-owned resources needed in that mode.

Patch 1 is a small independent cleanup of the two board .dts files:
keep the wlan_ce_mem reserved region (its /delete-node/ was erroneous)
and drop the redundant wifi memory-region override that duplicates
kodiak.dtsi. Patch 2 adds the kodiak-el2.dtso overlay and wires up
the -el2.dtb variants in the Makefile.

Changes in v11:
  - Had a conflict, rebased it on next-20260731
  - Link to v10-RESEND: https://lore.kernel.org/lkml/20260714071943.2036353-1-mukesh.ojha@oss.qualcomm.com/

Changes in v10-RESEND: https://lore.kernel.org/lkml/20260713160754.1250988-1-mukesh.ojha@oss.qualcomm.com/#t
  - Nothing, just  removed  In-Reply-To tag from each patches and
    cover-letter and added RESEND as part of the subject.

Changes in v10: https://lore.kernel.org/lkml/20260706161428.3764398-1-mukesh.ojha@oss.qualcomm.com/
 - Split the wlan_ce_mem retention and the redundant memory-region
   removal in qcm6490-idp.dts / qcs6490-rb3gen2.dts into its own patch. [Dmitry]
 - Drop status = "okay"; from &wifi in the overlay so platforms
   without wifi enabled in the base .dts are unaffected. [Dmitry]

Changes in v9: https://lore.kernel.org/lkml/20260624063952.2242702-1-mukesh.ojha@oss.qualcomm.com/
 - Instead of adding wlan_ce_mem back in the EL2 overlay, stop
   deleting it in qcm6490-idp.dts / qcs6490-rb3gen2.dts so it is
   present for both EL1 and EL2. [Miaoqing]

Changes in v8: https://lore.kernel.org/lkml/20260522115936.201208-2-sumit.garg@kernel.org/
 - Added a wpss copy engine memory similar to chrome for Wifi to work.
 - WPSS does not have firmware Stream, so that was removed.
 - Added wifi streams similar to chrome for wifi to work.
 - Removed this patch from Generic Pas patch series, can be followed
   separately.
 - Moved Sumit as co-author as part of modification done to the patch
   in the past.
 - Added some more kodiak's board variants in the makefile.

Changes in v1-v7:
 - mpss was disabled and will be enabled once the dependencies patches
   get merged.

Mukesh Ojha (2):
  arm64: dts: qcom: qcm6490-idp/qcs6490-rb3gen2: Keep wlan_ce_mem and
    drop redundant wifi memory-region
  arm64: dts: qcom: kodiak: Add EL2 overlay

 arch/arm64/boot/dts/qcom/Makefile            | 12 ++++++
 arch/arm64/boot/dts/qcom/kodiak-el2.dtso     | 39 ++++++++++++++++++++
 arch/arm64/boot/dts/qcom/qcm6490-idp.dts     |  2 -
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts |  2 -
 4 files changed, 51 insertions(+), 4 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/kodiak-el2.dtso

-- 
2.53.0

