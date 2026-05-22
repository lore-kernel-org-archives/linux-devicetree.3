Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F18C737DAA3
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 19:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779479648; cv=none; b=eG4owOwCLGndrIyMdqNsNVD/I5O+hUVeGUpcFlrQZYpA8wwyephQay4HFA0q9jmsK+hMXWgrt/tZlorDDwFdxnYEz1IbUBQ8VCbS5fJ27v9wMO+4CRGdN4bx+62ImA3/t/VjbM0Fk75sNT/WdQ+QP1nETRNPBruAtYvbI8VwxQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779479648; c=relaxed/simple;
	bh=Y4ejwvNHTTWA97Yv+hm0ybsQAOKNmu9FWZcJfyoMkf4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mIIiOIBap7akhZZ9CUNxSbH3FNEBkrDn1rsva25oB/nnfpedQFDlCiFRbFXqH3BZV+50DhB/VnwSoh1PCgkJct9Gbk2XdKZF6/3jSs72slG+Agvun6HCkQB4DJWmGO2VYREmh9R+g105eoCUQaU5HKxn3mZ/9mh4diMpOExVbQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S5smDz36; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G3Qk4F76; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S5smDz36";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G3Qk4F76"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64MIE0d63343110
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 19:54:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=WGqkrUJnaGPqFRPU5ebNNVRlrzStupmLXtF
	H5fW45xY=; b=S5smDz36sN08AJaDjSILWfKiTZbfKBADY4tXBIKJnE0xdecmMSd
	gi0nlor3khMecb1jYL6j3yodDhnjKqJE2N43CsKMYslmUplYuF/DJxeokmxikpts
	yM5EXJ3ohgMenST9y0MHIihLwnwymW6IX9JTjvnW6VbTNpKsHr7aJQoA7M2Y75Xf
	MmS85IGz8aeS0Cjl2XqMTPL2MBLhnmbAO9jKckGGn0joZg6g8lRpOtGEy/9c00+z
	kfxFJBfOkrlTioFn+3jQb97ZdNfymx9ntZ67BoaBM2wNYUqg+llN3zplZsxnnnO5
	YnnPm7PmEjemdtmQQ9zK7KdsS1SOihKbm+g==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eav87r9pv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 19:54:03 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2bd00a65673so57627565ad.1
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 12:54:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779479642; x=1780084442; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WGqkrUJnaGPqFRPU5ebNNVRlrzStupmLXtFH5fW45xY=;
        b=G3Qk4F76/vQaYgeEi22zStxpBvdmWla43r3Zbtm2NFzuwZtGoCyFl0n27g5Cz3ZSCe
         0k3xzouK9xcq345pAarHjgLgW8Em/3Vwz9ekYv0hxypBm1+fxVAw5dlzUQDRm5EJMp/5
         ixP50Luy+rb6iv+ncPwN6eiYpnhao34+cWKO2QjlO/1AngR3xDxYpCLz3aCK7qcTotnZ
         6YBHjJYao2sQDiQSY8iUzglnDoli+MBfxbKrlXnlGiXFkgPZeWutVFYFk9sfrT7ndhHt
         tP+/Xwaj6OaIxFsxqY6kaCP9Q3jykB0CuwTKXf7b+VWk3Ry/5PbzfYAz7YDkR5rZdtpb
         nKfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779479642; x=1780084442;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WGqkrUJnaGPqFRPU5ebNNVRlrzStupmLXtFH5fW45xY=;
        b=aS98MesCZX5Yo3m/AyOlDIrNleZk7kwONQQgpPdplv3m9sBCAoQzwXrhxtxxXJb7bg
         Acycsfgchr7kYAr/l74su35/sq2VFgZ0c+NF9a6njzNcoW52hYB0XWY9cWpxOr3/mUCb
         Us0UhVLbtIcVWv+yz4sdhVMuq4a5XhH9S4HE+7//eOfi3zb5shLX+WK/4K8txE25UkM6
         Qn1PD1+WzEbMrb3svH0vpv11OmdPlceup+UzGAz6RyVW5aARLayX+XXfeWA3ylqSrddF
         6K8vgJKnKynZYr0D+i9ypkm4mGWePDnFZeAUaLUXzfHOHriIkGC9iFPk9lX0aIyd4ail
         oHbg==
X-Forwarded-Encrypted: i=1; AFNElJ/NNH0k9u3biMq6AYWIA0AMT1CgxQd51GulyHzJWzrzWhT0myzTtuiwRzxIt7TLu8nykJJ+Tm1HIOVm@vger.kernel.org
X-Gm-Message-State: AOJu0YxJ+N4PTiKa5NbjYMZ5zodxyUtmC9C6toLuhDd7ZRYCj7GpNIQL
	4LgMlMNkztI3jXxxc+Oq5njJ3Ulsb++Z6PygvyI/CYR2/fyC4vb5U2zFk1diQaRDSY/Kgi1B1dw
	1h2fqsNWDiWxlLqLN9qa1eAABy8HGHoqDDRYs0AKKbOplBZABot1Z3SgVCfOKVtSt
X-Gm-Gg: Acq92OEWOIMEjIElV9sRW8vxDcBGibesBwSK8FyLjlPbwEhCb2Bbg8nnXgrOMG7eUoA
	H+iICxYv3+mVZHwAxL1JNDWCmD88JmPBOuS2ijbM/nidYd+6uRSQyG8dLu8NadCw1TgyrSP4HY1
	ub7v8eUo8u8jJNHw2IIqu36u+dsfbBmbeNzsCcy1WUj9xI9fJ/4BBT7Px28e09jf/T31NRVTqJu
	RPrYu7l06dejuCh0JTSZi4w45oPtGFxOLDSW1o2G3W9RwVrtzdrxMCmGVsKQadhxTstAgqxajvz
	dGp6eRy5pyIH/41v+TUcRR1PecDDUQi5qaym0x/zTFtWBcYPnCzOZGsI6IDR0Wci40vL9lc1RDm
	JjBMSKwRWm22lzRVPBsw06sCo9o2kHE0QqwIbs/EcrIDCgBw1AjTOeEbggqY=
X-Received: by 2002:a17:902:d482:b0:2b2:ec33:cf15 with SMTP id d9443c01a7336-2bea20c02e2mr84218165ad.7.1779479641988;
        Fri, 22 May 2026 12:54:01 -0700 (PDT)
X-Received: by 2002:a17:902:d482:b0:2b2:ec33:cf15 with SMTP id d9443c01a7336-2bea20c02e2mr84217865ad.7.1779479641439;
        Fri, 22 May 2026 12:54:01 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb5695f05sm33541155ad.6.2026.05.22.12.53.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 12:54:01 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v3 00/18] firmware: qcom: scm: Add minidump SRAM destination support
Date: Sat, 23 May 2026 01:19:51 +0530
Message-ID: <20260522195009.2961022-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDE5OCBTYWx0ZWRfX1SWjeC9j/JwC
 ZJsSbKG9qltSUv0bc9pwYLO3BviFZr+07+c/fHgwdkCu7jedwF0lbmsgusiJIOVo9rPo1EqzhJc
 oiSY9LqOCnsX4NKL++h4y21mn9PbJv5bqF+rOJ8ZRDQd8n/0du68GLcDQKMTlaVbUqC034zwsvH
 VOMnvKiOTjFpYaxeQXGor3xfVcuvToyg3uxyg79N+qUZ+kwNNJtAyRlN565QI/Ebafr1NQEmWnP
 lmnqdWXcrkDtoTUe9bYp8wTRkxG3pgLBfVD9vmaWom34/av8Z0hRI14CanRLfBk93UPUUg0uA0y
 +Xwu8lBtarQCwQf+wSJ+Ls0+ccR53ZWUx9P1R0tZQkAjQVQ+uZ4B0SWqXG9t514q1kC6eQnGbDj
 hO+Kn+rKA7UBOman2XBMt/sGauXZDqh1gkX6DfHjlcqGKKuYgOLwpq+CpnBXK7/hw+dzz9qc2TU
 mwtmC2mW8zEVL/aFSQw==
X-Authority-Analysis: v=2.4 cv=dbiwG3Xe c=1 sm=1 tr=0 ts=6a10b45b cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=fNLuE_qgFUpq_f4Vv_MA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: -QY6TMTpqVQzPMlFzgJBVkx9P_o05xa6
X-Proofpoint-ORIG-GUID: -QY6TMTpqVQzPMlFzgJBVkx9P_o05xa6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_05,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0
 malwarescore=0 bulkscore=0 priorityscore=1501 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220198

On most Qualcomm SoCs where minidump is supported, a word in always-on
SRAM is shared between the kernel and boot firmware. Before DDR is
initialised on the warm reset following a crash, firmware reads this
word to decide if minidump is enabled and collect a minidump and where
to deliver it (USB upload to a host, or save to local storage).

This series wires that mechanism into the SCM driver:

[1]- The SRAM word location is described via a 'sram' phandle on the
  SCM DT node.

[2]- Add minidump-sram pattern property for older soc which supports
  minidump destination support.

[3]- Trivial change for consistency.

[4]- A 'minidump_dest' module parameter (default: usb) selects the
  destination.  Custom kernel_param_ops expose it as the human-
  readable strings "usb" or "storage".

[5-18]- Add the support for Kaanapali and other various SoCs.

Changes in v3: https://lore.kernel.org/lkml/20260519171442.1582987-1-mukesh.ojha@oss.qualcomm.com/
 - Addressed some code improvement comments.
 - Removed example from scm binding.
 - Added minidump-sram binding which follows qcom,imem binding.
 - Added some more SoCs which supports this .

Changes in v2: https://lore.kernel.org/lkml/20260507080727.3227367-1-mukesh.ojha@oss.qualcomm.com/
 - Remove the restriction on the binding change done in v1.
 - Remove sram-name from binding.
 - sram definition is introduced and merged, so removed the refs from
   v1.
 - Minor change in the log as per comment s/find/get/
 - remove reference of sram-names
 - use minidump-sram instead of minidump-config.

Mukesh Ojha (18):
  dt-bindings: firmware: qcom,scm: Add minidump SRAM property
  dt-bindings: sram: qcom,imem: Add minidump-sram pattern property
  firmware: qcom: scm: use dev_err_probe() for dload address failure
  firmware: qcom: scm: Add minidump SRAM support
  arm64: dts: qcom: kaanapali: Add minidump SRAM config to SCM node
  arm64: dts: qcom: sm8450: Add minidump SRAM config to SCM node
  arm64: dts: qcom: sa8775p: Add minidump SRAM config to SCM node
  arm64: dts: qcom: qcs8300: Add minidump SRAM config to SCM node
  arm64: dts: qcom: qdu1000: Add minidump SRAM config to SCM node
  arm64: dts: qcom: sm8550: Add minidump SRAM config to SCM node
  arm64: dts: qcom: sm8650: Add minidump SRAM config to SCM node
  arm64: dts: qcom: sc7280: Add minidump SRAM config to SCM node
  arm64: dts: qcom: sm8350: Add minidump SRAM config to SCM node
  arm64: dts: qcom: sc7180: Add minidump SRAM config to SCM node
  arm64: dts: qcom: sm6350: Add minidump SRAM config to SCM node
  arm64: dts: qcom: sm6375: Add minidump SRAM config to SCM node
  arm64: dts: qcom: qcs615: Add minidump SRAM config to SCM node
  arm64: dts: qcom: sdm845: Add minidump SRAM config to SCM node

 .../bindings/firmware/qcom,scm.yaml           |  7 ++
 .../devicetree/bindings/sram/qcom,imem.yaml   | 16 ++++
 arch/arm64/boot/dts/qcom/kaanapali.dtsi       |  5 +
 arch/arm64/boot/dts/qcom/kodiak.dtsi          |  5 +
 arch/arm64/boot/dts/qcom/lemans.dtsi          |  5 +
 arch/arm64/boot/dts/qcom/monaco.dtsi          |  5 +
 arch/arm64/boot/dts/qcom/qdu1000.dtsi         |  5 +
 arch/arm64/boot/dts/qcom/sc7180.dtsi          |  5 +
 arch/arm64/boot/dts/qcom/sdm845.dtsi          |  5 +
 arch/arm64/boot/dts/qcom/sm6350.dtsi          |  5 +
 arch/arm64/boot/dts/qcom/sm6375.dtsi          |  5 +
 arch/arm64/boot/dts/qcom/sm8350.dtsi          |  5 +
 arch/arm64/boot/dts/qcom/sm8450.dtsi          |  5 +
 arch/arm64/boot/dts/qcom/sm8550.dtsi          |  5 +
 arch/arm64/boot/dts/qcom/sm8650.dtsi          |  5 +
 arch/arm64/boot/dts/qcom/talos.dtsi           |  5 +
 drivers/firmware/qcom/qcom_scm.c              | 95 ++++++++++++++++++-
 17 files changed, 187 insertions(+), 1 deletion(-)

-- 
2.53.0

