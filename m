Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8055835C6AB
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 09:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789725482; cv=none; b=gdlad07QFWvYx/nxgKTaY3tzOOifF2QCSspL/3zykkRKHpud6d1AwAVG5tD36ZlYwCb/elAsZ+mTSlyOXqsJIsPUX6xIFeNvGKkh0CzpuJqCUFaHyKOBUxDcqnqV5XWh1EXWRr1aSc1WAGdeJUB0zgcvQmeT1dVD+Rx7E0EcQNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789725482; c=relaxed/simple;
	bh=fYQnJwvIDr0lMmuidC0MbYkc/xQ9sa+ACmO8nhT7Um4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=NVetxunoxYYt1+rRqVaM22i7PR6yiPkeMRgjU49ED7k+2qSNNbSE/9TpRu1DlNKKemQgNlUgAjF5RHvMNN35Iez0nhadbMhwaXLoQuGsMKzvl+gfwUuyK+jSs58IWCBAZpRzwrF1QCWLTzLFJRPq0GJ1tGZVU/IF75uA744OkeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Wp8AUkEs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Zhasou+z; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Wp8AUkEs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Zhasou+z"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68I9dQOg860366
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 09:57:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=LlXnTjIgiRIy2Jyv97jSRe2p67ffz+Qkf4E
	Z81jikDg=; b=Wp8AUkEs1A08wHTtaOVeV72N+8IcB3ZCnw0GlOHlmy2nyh7Nteq
	t9s7zXVfOqrod6zkce75XF5naUMh1GlNtqgUUD+nXHkfdCP1EWmVwMohDNUXO5e4
	H5yx1cyuhWOkwRrLdxNjtkgGB7iMXgU085RZIXOlrLCglAuQMu+aUPlQ0S/172J4
	uJOcg67r+M118DGEi4KDjBn1/w1rzSrRNvClJgD3UCg5iEnrEm+avbCJG8RnOzyW
	SEQd5AxN9f1b+gAYHm0KcVVL753N8oF4gZhw3+7c8dDluwygY7o2C7M2bYrTWT9J
	4sgv/vXNvba8BsNWlZfIRPOHnisoQ6qTiaA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gs2hv852k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 09:57:58 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3967eca9c6aso146223a91.2
        for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 02:57:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789725477; x=1790330277; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LlXnTjIgiRIy2Jyv97jSRe2p67ffz+Qkf4EZ81jikDg=;
        b=Zhasou+zXH+WlzuvyMt7mP+afAIRjJriHRoOWya4k6sZ5DkGG2IN43MCk7wdILbrWK
         W/VNeQPMRscSh96ErmLvL4OtUo1CQWkKZ0WDi4NGsCBUXd8nPO05DAE84IIR5xHnyEgy
         lUr7NdeWxWi3MfpgknKhIN6W9mHtCPLG5uBiY/i/EWZrlFmabF0Gy2L4hPxnvCSjhh5d
         xK04EKGupMeMBPv9AVdqaqnoAXZP7wOWndIu9wWDLqOapoWXwLRI5incjKp3IcNHvoPl
         pX/keaLy2P+XYTUDG2SY63jHjLMneXjvNvYoqbZB4qkjeBmaZxLkMT9J2BNb6Ve/aqS/
         DTJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789725477; x=1790330277;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LlXnTjIgiRIy2Jyv97jSRe2p67ffz+Qkf4EZ81jikDg=;
        b=W5USR1XT3EYqVil88Xsz7qCKz96TxWLoi+kEEQMghGq8cx/GiTwe7evXebTS3T2Gns
         49uCcSfOK9+3+u9ZLs/iJx/axpQQ3YJlNpGEsRMd7Pjg1JfEycS+6xYH23QaYb6Vipiw
         7lapb/rn1DGP1LPTjOWWQranB5SJdxr4gDzoQXNt+y76QaR9+WvMoHb1SPY2On2kPsW7
         ap+eT0YHiH1NrE5J3qIJ9mbff8dMey4QVdY1SkEg6uZNq9O04fHOoTPeTYq2nGMzgCAx
         udM1yS3Gz84nv/G6dIueQWigQvT5xJjM48lymyZN1w3R4ozm+GnRJIxOjQFvRa99PReL
         xi9g==
X-Forwarded-Encrypted: i=1; AKwUvBxWjeuuuQuzOAmdwkHECWUz2dunavpC/MYf2vOzjZK9vGWTh/QxLFRpNglwiML7YvkY0OXtxUIVZzyT@vger.kernel.org
X-Gm-Message-State: AFuF++lOOFuDpsOuI+M5Cxnu5KT4sKiHUExMMSRwzy089RPLJJqDvzTq
	jO5CLC7R7rtoELS3ZX0ah2SZJI2GiqdIoEtsmS7fpwbiP6FNjSTWDS288JIIz66ylIizuvMvE4o
	H+67EuVeP7MkoL0RAQA2ghOeh0WOl02O7VQUze2dzZqJuDtUde8BENI5xBIhhpEFU
X-Gm-Gg: AYBFou2iL+32B5geCJzKVy0PIw/o5kbmFSYlc3TsX75uTOIbRBhWZ7sY920y+BPUdmy
	fTHXHNuBuRT4qjcMHcgfSpAGV3AI1BA0lf8T9JgYzk5Ta2pC7YpClFXuMMvSPiy7K8c44yWc+FP
	DiW0WMe+yJHjvXgGiDAZO7pYhhiBNo+peB31vbskpZu1Li8F+Ki73n3HN9oUCGLz96wI3qFHfWU
	GqbIGduKNYoOKv3IEcEtMUsVN+R6tShS9WmMVZmWYWvJey6G0TVSYbcdDmwMFklY3e1nJtZtQou
	dazSSiDuMj4OdWqc+ZK4v6rRuR1LXa3IkD1s6Bvro5mODvF0SNSsGyNZg4wrTrmSfvOdFZT9DKR
	Ex4mcRDIMezzZSSt+36xeq/FIjCJTFEU=
X-Received: by 2002:a17:90b:2e0e:b0:396:d28e:b52 with SMTP id 98e67ed59e1d1-39e598b6ccdmr2978130a91.3.1789725477083;
        Fri, 18 Sep 2026 02:57:57 -0700 (PDT)
X-Received: by 2002:a17:90b:2e0e:b0:396:d28e:b52 with SMTP id 98e67ed59e1d1-39e598b6ccdmr2978064a91.3.1789725476381;
        Fri, 18 Sep 2026 02:57:56 -0700 (PDT)
Received: from hu-uchheda-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144ce02b063sm2892970c88.9.2026.09.18.02.57.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 02:57:56 -0700 (PDT)
From: Umang Chheda <umang.chheda@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, richardcochran@gmail.com,
        Borislav Petkov <bp@alien8.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
        Tony Luck <tony.luck@intel.com>, Robin Murphy <robin.murphy@arm.com>,
        Peter Zijlstra <peterz@infradead.org>,
        James Morse <james.morse@arm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-edac@vger.kernel.org,
        Ruidong Tian <tianruidong@linux.alibaba.com>,
        umang.chheda@oss.qualcomm.com, avaneesh.dwivedi@oss.qualcomm.com
Subject: [PATCH v3 0/5] arm: ras: Add DT frontend support for ARM RAS
Date: Fri, 18 Sep 2026 15:27:41 +0530
Message-Id: <20260918095746.3347893-1-umang.chheda@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDEzNyBTYWx0ZWRfX4ryNjNJRS9dT
 RYNRizKwr+UpBilcFjpIidYTY11O2ZevJfOPeTJW72HytklqcKiZ0VqEt8HPfl5kE9BAMAwxxC/
 8UTtjoW7bU1eucP6MxJ4QPTmtJefw/g=
X-Authority-Analysis: v=2.4 cv=IOWXmQvG c=1 sm=1 tr=0 ts=6aad0b26 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=NEAV23lmAAAA:8
 a=VwQbUJbxAAAA:8 a=SRrdq9N9AAAA:8 a=LRrvzRMqVIShaiPshd4A:9
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDEzNyBTYWx0ZWRfXypqrOfLdGAcR
 jDb4+89jtt5loSLoKKYsVZGE8EqGuLzabNgEBVn3zNXRJyv2LrtCxvBFGpppv1WRiG3Ngot/Nl7
 qB9mHw1Ybuht2g45UeF2l2Z1xzvsZ3KRbTDyNyXRUNiokEL7EHApty/9qRhqaC7DJqa4XGPCbKE
 e4uw1Z+v6REHJZMxeu19+DR7NwxrcE6StFQ71Y9nv/ltxPNTj9c92Vnk9CYWhnNHYJ6KjuW1BZt
 2+Ret5AT4bj8HqUZzrzdZ52j7zbZzV/QOW7W+o1roY76u/1i5r+PovEdcb4xXG8OIZ/C6OIfdyX
 0HZjdoZV5CtKoXD7ypEA86O05yK/p1No+gq50xgYDRJUzKxS6xB/tVoPzgp8DGgFCvZbtuJwS2Z
 TTCRKwDM1zyKgJEl4X0nnBX74AX1Z3csJwTvBKjx7E7ubTAbUb5TYtCWTw/d3DCXRX5dDiaR2OR
 /W3+WBOcV5ufv8xmDIw==
X-Proofpoint-ORIG-GUID: oYbcH3dxffFHmOL3J9xJziV5ZaB9IMty
X-Proofpoint-GUID: oYbcH3dxffFHmOL3J9xJziV5ZaB9IMty
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 malwarescore=0 bulkscore=0 spamscore=0
 suspectscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609180137

This series adds Device Tree support for the ARM64 RAS driver
introduced by Ruidong Tian [1]. The existing driver supports ACPI-based
platforms via the AEST table, this series extends it to DT-based
platforms without any changes to the core driver.

How to test with QEMU
--------------------------
Tian Ruidong's QEMU fork [2] emulates AEST MMIO error records on the
virt machine.  To test the DT frontend:

1. Build QEMU:

     git clone https://github.com/winterddd/qemu.git
     cd qemu
     git checkout c5e2d5dec9fd62ba622314c40bff0fbecb4dfb34
     ./configure --target-list=aarch64-softmmu
     make -j$(nproc)

2. Build the kernel with:

     CONFIG_ARM64_RAS_EXTN=y
     CONFIG_RAS=y
     CONFIG_ACPI_AEST=y
     CONFIG_ARM64_RAS_DRIVER=y
     CONFIG_ARM64_RAS_DT=y

3. Add the following DT node to your virt machine DTB.  The QEMU
   fork maps GIC error source at 0x017a00000 (SPI 0x0d).

   ras-gic-dist@17a00000 {
       compatible = "arm,ras-gic";
       reg = <0x0 0x17a00000 0x0 0x10000>;
       reg-names = "err-group";
       arm,group-format = <ARM_RAS_GROUP_4K>;
       arm,num-records = <1>;
       arm,record-impl = /bits/ 64 <0x1>;
       arm,status-reporting = /bits/ 64 <0x0>;
       arm,gic-ref = <&gic>;
       interrupts = <GIC_SPI 0x0d 0x04>;
       interrupt-names = "fhi";
   };

4. Boot QEMU with acpi=off:

     ./qemu-system-aarch64 \
       -machine virt,accel=tcg,gic-version=3 \
       -cpu cortex-a57 -m 2G -smp 4 \
       -kernel Image -dtb virt-aest.dtb \
       -append "console=ttyAMA0 acpi=off earlycon" \
       -nographic

5. Verify probe:

     dmesg | grep "DT RAS"
     # Expected: DT RAS: registered 1 RAS error source(s) from DT
     ls /sys/kernel/debug/aest/

6. Inject a CE error via the QEMU MMIO fault injection registers.
   The QEMU device accepts 64-bit accesses only (use devmem with
   the 64-bit width flag):

   devmem 0x090e0808 64 0x40000001

   This triggers QEMU's error_record_inj_write() which sets
   ERR<n>STATUS.V=1 and asserts the IRQ.  The kernel driver's
   aest_irq_func() fires, reads the status, and logs:

   arm64_ras: {2}[Hardware Error]: Hardware error from AEST gic.90e0000
   arm64_ras: {2}[Hardware Error]: Error from GIC type 0x0 instance 0x8005
   arm64_ras: {2}[Hardware Error]: ERR0FR: 0x48a5
   arm64_ras: {2}[Hardware Error]: ERR0CTRL: 0x108
   arm64_ras: {2}[Hardware Error]: ERR0STATUS: 0x40000001

Testing
-------
- Validated Processor error nodes/sources for L1-L2 and L3 caches error
  on Qualcomm's lemans-evk, monaco-evk and shikra-cqm-evk boards with DT boot.
- Validated CE and UE injection via debugfs soft_inject.
- Validated GIC and SMMU error sources on QEMU.

[1] https://lore.kernel.org/lkml/20260122094656.73399-1-tianruidong@linux.alibaba.com/
[2] https://github.com/winterddd/qemu/tree/error_record

---
Changes in v3:
 - Changed dt-bindings filename to "arm,ras.yaml" - Krzysztof.
 - Dropped irrelavent nodes from dt-bindings example - Krzysztof.
 - Changed node-name of ras-error sources to generic one - Krzysztof.
 - Updated commit subject text of dt-bindings to drop redundant
   "bindings" keyword - Krzysztof.
 - Drop un-necesarry nodes added in Phandle description - Krzysztof.
 - Fixed reg and reg-names to be same number of entries - Rob.
 - Replaced interrupt property description as suggested by Rob.
 - Defined the order for interrupt-property in bindings - Rob.
 - Dropped re-defining iommu property in the bindings - Rob.
 - Update commit text to be more elaborative and, change the ras node
   name to be generic for monaco DT change - Bjorn.

Changes in v2:
  - Rebased on top of Ruidong Tian's v7 RAS driver series and reworked
    the DT frontend to match the new driver architecture.
  - Moved RAS error source nodes to the DT root, removed the arm,aest
    container node as suggested by Rob Herring.
  - Dropped arm,processor-flags and arm,resource-type properties, these
    are now inferred from the interrupt type and cache phandle
    respectively.
  - Renamed compatible strings from arm,aest-* to arm,ras-* and the
    dt-bindings header from aest.h to arm-ras.h to avoid ACPI terminology
    in DT bindings.
---

Umang Chheda (5):
  dt-bindings: arm: ras: Introduce ARM RAS error sources
  arm64: ras: Add Device Tree frontend
  arm64: dts: qcom: monaco: add RAS error source nodes
  arm64: dts: qcom: lemans: add RAS error source nodes
  arm64: dts: qcom: shikra: add RAS error source nodes

 .../devicetree/bindings/arm/arm,ras.yaml      | 235 +++++++++++
 arch/arm64/boot/dts/qcom/lemans.dtsi          |  30 ++
 arch/arm64/boot/dts/qcom/monaco.dtsi          |  30 ++
 arch/arm64/boot/dts/qcom/shikra.dtsi          |  20 +
 drivers/ras/arm64/Kconfig                     |  25 +-
 drivers/ras/arm64/Makefile                    |   2 +
 drivers/ras/arm64/ras-of.c                    | 383 ++++++++++++++++++
 include/dt-bindings/arm/arm,ras.h             |  11 +
 8 files changed, 731 insertions(+), 5 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/arm,ras.yaml
 create mode 100644 drivers/ras/arm64/ras-of.c
 create mode 100644 include/dt-bindings/arm/arm,ras.h

--
2.34.1

