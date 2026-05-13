Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADFFA38737B
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 18:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778697623; cv=none; b=IP1khdDbFov+x8BQlnY5Av5JrtNDYa3lXgZXMNijp4dLcIBRU2jA6/qn3e8fjx4FTeCKbZ0d9f7JxDNtOMaGkcrLTdRdpIEu1gR1J/3N/JbNYYsCNDVZ3FPdFN73v9l89E2y0G1T01dXYe2V1605JHwN09cyE9uqXJrI2/LNXX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778697623; c=relaxed/simple;
	bh=kf3Hgwh2s4MVLGoLj2tEoIQ2lhKAbAAQDj6ClnbpYUQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=C3KStvnQp5/zGow0I3JVjFj7JTCKMhPyO6UYQ6m+pvZxpXapG+o3uqPqysuRWSgBUuuzaE1MTEGqFz33Exqgiz95cIh9NpA+nTvRg2QD1AdrFwjzoT6P/98D0GpPXoTc/bNRCfGZ0v8NuuofwTnumrBkDe61dLFbRBYPHuXlLkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZdLZmDAi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MWcBhPUK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZdLZmDAi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MWcBhPUK"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DH9MTR1393180
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 18:40:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=hKvXM/fR5rULUyFLi80lbd
	szGP+PMtyMohq0PyR2w0k=; b=ZdLZmDAiz1mkbWJ5kSBCJsHR+4BNNJ06iIV8su
	RA4kQP3uS3skR8JZD3P8Xat83JG601EHiYIoWQljdBuTrIEPpbcJwGcELX7pRzsF
	vkjyg8y2SPk0ad4jdM2fWhEdipo57UcT7Soz+uuDIvmaIOU/Pmstwc24GTcYj0f0
	vHoWWs65buW6t5Ny3H3/phhoNmy48q/UbICqtw0vx/q2xy979S/aDlhQbjcaolJ9
	p/29YOJDvfuzzx7K7BI1W2nP2HfRenKQJmOUMzwbAHiAZlRPCQBJbz/OLqTeCd5v
	vbFlzUZzO6Y6BhuJvmxpg/xs1ZC6Eq5awIiaOvY8URAbqT6g==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4k26363k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 18:40:20 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c828659ecd4so2254773a12.0
        for <devicetree@vger.kernel.org>; Wed, 13 May 2026 11:40:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778697620; x=1779302420; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hKvXM/fR5rULUyFLi80lbdszGP+PMtyMohq0PyR2w0k=;
        b=MWcBhPUK218JpjNGNmmcPAQVxv0530D2SQ3CRXWwHVfHnQ3vdW3L5EPa3/QO1TTxTA
         sNBMw8FqxfmAByMWx5QujgaYzJHYGlxEWsz+ptbhs9JoKqX4WbnumRhMfvq5YB07QWVQ
         1d4qF/QLlSkynZ0UOuLHcqHJ+WnrT9HTW89RKbY0maUl/dnZsOEVEVUIPyt6J2CAyzq3
         jsPy9WSelW3lcYMIdiqTROjUqsOZIC6Ff6tELl1O2pyWT0dcaMhthsCBmnfUixH8oiIt
         wjwfRsHEWxtIWxkQajfC1xOXPVC/13I/xR4kr0xxjHCXfdJ7Lt0vZQ64brEPYpbjREG4
         pieQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778697620; x=1779302420;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hKvXM/fR5rULUyFLi80lbdszGP+PMtyMohq0PyR2w0k=;
        b=m1zukBXTsVIaCqHgCZElOAvwIEOet8fQXkNyuoiwfnsMqwsty6B6ii1U4NhBAPGVWa
         rSjZ/J+I9H4IitqQH1M887oPu6b4987gz6MW2pEKmTQFD+Xpbqpfj59bnBVcWMst/G+j
         k/rdf8TFNqgqT0bJ9lb2dvIEjvUL53cgTEDD3l1hbBLaZ7EZX9jnS3p9qvcMKJCL+xfo
         JmjRMIy/vqMUsoUY6kNt0SFP6Z4RykeISbqbyhtVw4A0D4S8gOsXgdb0xTAjbI2P4gik
         mkTS2qBBkQsJBDi3yqujybeuIjA6+6z9o8WbVnUmO4aY2yPgPSPOOyrLSh2rVRBP/m+Q
         SK+w==
X-Forwarded-Encrypted: i=1; AFNElJ+kNdM21E6djHXS93ZekYeSok4A6zSr1pqLyNZ/MCugSUFJhrkXr1AMfzkce43I/hTekh+MFgdmyt8Y@vger.kernel.org
X-Gm-Message-State: AOJu0YwNxcRwWmNIqVu2MVHxRCYkLzi4GDYB39E8/w3XlyhWBcn/fnOs
	+IYfBtu/trCExV3l9L6uC2f8M09YVAfHm/djU1gQ+kD23ewb1RCyJNquC2X13ykZGlVHnixtORL
	0wYLsj0mbYvFDpPVozJt8LOUCmiOit6amw1r6SWf9LqTODh6TmFhK9xdUzASl7TYm
X-Gm-Gg: Acq92OFafJa2X5JMBIIMed/+mRGwb42MZoDTTel9GrZ96g21DnhmYeINWRSmIWSbNvg
	mKY9NCgt3xWmw/VeW/mUMWQNoq/0+azRbvY4oSrMcccr6eVdDCTLejUcUorxGqVPe0O5uZ8QkCI
	wfW5gXtEquLt4YHuK/We+4LUbEVjUogLGvUFgJ1VeNdg4OyjHdf4eI2m2M5+luaJPiscpgo+lEA
	CsYVJXfNmafhAajrKhwA4ZlDiMfCdLdywPqPIEI1kQ98jFTJ5DKEDcoZzY5hgs4g50TQtVJ83w/
	MhcxMZIsYDckH6gjGSjSs6Yg8pL6+9Q9FCV9iOB6TlzNK58zGqZG6zR8bNftvB4lp8maPngYYO/
	misaaNMDtKax6Z9dGTlZ9iOedEr1saqYbPsm1bXdcSMwFsmyEdJDocUs=
X-Received: by 2002:a05:6a20:72a3:b0:3a2:f14a:4290 with SMTP id adf61e73a8af0-3afb002d051mr4704741637.38.1778697620185;
        Wed, 13 May 2026 11:40:20 -0700 (PDT)
X-Received: by 2002:a05:6a20:72a3:b0:3a2:f14a:4290 with SMTP id adf61e73a8af0-3afb002d051mr4704707637.38.1778697619700;
        Wed, 13 May 2026 11:40:19 -0700 (PDT)
Received: from hu-kuldsing-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c826771a8a1sm15271009a12.24.2026.05.13.11.40.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 11:40:19 -0700 (PDT)
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Subject: [PATCH 0/3] Add support for qcrypto in kaanapali
Date: Thu, 14 May 2026 00:10:02 +0530
Message-Id: <20260514-knp_qce-v1-0-0ebdac98e50c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAILFBGoC/yXM4QpAMBSG4VvR+W11bFLciiTmjEMNG1Jy74afT
 73fd4Enx+ShiC5wdLDn2QYkcQR6aGxPgrtgkCgzTGUqJrvUqyaBaPLOKJKocgj14sjw+T2V1W+
 /tyPp7Z3DfT+KaLKAawAAAA==
X-Change-ID: 20260424-knp_qce-00f9df3e2039
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Arun Neelakantam <aneelaka@qti.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Authority-Analysis: v=2.4 cv=M/l97Sws c=1 sm=1 tr=0 ts=6a04c594 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=hpg_QQ1ef3WCVlx-FDkA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE4NCBTYWx0ZWRfXzy6D0FBp9BPQ
 dc9fREfFLO5jSBOB8n/a0dOCtNptGAp3XJM4oSE7lm+F0EZ1+eCCKp2zQGNXJXySZxHLjvxkP1H
 AQDEgkDEBfLNoXj619nKZEWxa1Za+OZM26ENfXPEbZ7qwkGmjFxdiSktI/wvbIyRQE0TCF8ngP6
 GQEqRoRoWcRBca1HvxK3zGXvG0Ly3kzEGW+kWf7nLqpEwPmeDWPXBewZAyFKWucnzpXxni6Dh8A
 ACQHyUgcSTgf1VLS7BmIQdKNts9JiyuZOT25hfIjBzU51JoqP9BesuzIYMm0i5jbvNNfD1nH74T
 Vncx47H6NwSDGZTxoJap4kcQoQhML7MwHFbYSt7SYS/AqG49CMK273ZeMhLFbjXZREXFIWtdvJE
 i9BdZGlvIp2SyB/9+ZxCvhfplxgc3xwcqUfdUu2XdUzeq4Y6rQ0OQhqrJ8Y4JfLDRr4K+WUkbN6
 2VFSDeCSScmYdBHW46A==
X-Proofpoint-ORIG-GUID: KA3EZQUN3d49gTAet-9FTAxH-Su_MjT5
X-Proofpoint-GUID: KA3EZQUN3d49gTAet-9FTAxH-Su_MjT5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0
 spamscore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130184

Add qcrypto and cryptobam DT nodes for enabling qcrypto on kaanapali.
Validations:
- make ARCH=arm64 DT_CHECKER_FLAGS=-m DT_SCHEMA_FILES=Documentation/devicetree/bindings/dma/qcom,bam-dma.yaml dt_binding_check
- make ARCH=arm64 qcom/kaanapali-mtp.dtb CHECK_DTBS=1 DT_SCHEMA_FILES=Documentation/devicetree/bindings/dma/qcom,bam-dma.yaml
- cryptobam and crypto driver probe
- kcapi test

Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
---
Changes in v2:
- Update commit message for patch 1/3 as suggested by Krzysztof.
- Collect reviewed-by tags.
- Link to v1: https://lore.kernel.org/linux-arm-msm/20260424-knp_qce-v1-0-813e18f8f355@oss.qualcomm.com

---
Kuldeep Singh (3):
      dt-bindings: dma: qcom,bam-dma: Document BAM v2.0.0 compatible
      dmaengine: qcom: bam_dma: Add support for BAM v2.0.0
      arm64: dts: qcom: kaanapali: Add qcrypto node support

 .../devicetree/bindings/dma/qcom,bam-dma.yaml      | 21 +++++++++++++++
 arch/arm64/boot/dts/qcom/kaanapali.dtsi            | 25 ++++++++++++++++++
 drivers/dma/qcom/bam_dma.c                         | 30 ++++++++++++++++++++++
 3 files changed, 76 insertions(+)
---
base-commit: 4c406406070d57dbefeaad149181785330c23f92
change-id: 20260424-knp_qce-00f9df3e2039

Best regards,
--  
Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>

