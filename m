Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3EC53CCFD0
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 08:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784535607; cv=none; b=X1yB3VBB10AkrV5CR5p4+cRaPXiKOdQIymZgbuwSVCPOyW/m32W/rATj4Su/ymb9KyEybH2+VpqYfk4nQtVX33RgXwQu5PHL7LdSRLEgnUanN5VM7L8cnvQTrf/IpcXSG6lfKdOD2qKpo/8oLkyyyvf1e14/6txGaXtm6eAAags=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784535607; c=relaxed/simple;
	bh=XeAEXlpZvz1Kk9U20DPBoUr+0RBrXFDXeooUbCrFtfk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=T18UCYMI9JU2SgVF5O3Ln1dOVtHAupHdyZxSjZTD6PLAQMl4E6PQlOM1nc90BKTCknHyJbLaWRfBsn60vBAz4kfBzzhpIxK6siJfqusTzQQPtlq7/PS/SM4asTTqmNCEE+K5ul3Xf4GwFUBnC/OZpnUFGL1nGKMoPaho2lq8tMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N9SMOOoj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JCLRmRkn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N9SMOOoj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JCLRmRkn"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66K76TNp1712983
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 08:20:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=oywFt15nTUechSp1jVDxMiDTZuPB3zyGHsn
	nJBE7dAk=; b=N9SMOOoj2Mm0hUmIxeJ329kLUXKUlRm6qCARhXiWTSWz8BCGbRH
	5VlukN1qdTpTyTaUs1NreDG9b9YtAxC+6iis7af4bWIocsS2voFCHYCGvziyhp2A
	yxac23Siy/KAYuKnsbX14PwJ8vw6JWcNVihwll3VNdZHoVs2kP7Kiqn19vfFEL/+
	iSiNv6Tf+idp73fZxyUEqukK0QoOtWGFiVKATveIC46FQ31LYVUAqIrM4uBEViNy
	qMJNDA0K3lZ4D8FuIFzi9gwfkmkoyMzgIXYcJwHaBvBsiMVE23YMM/49QmWkCXdO
	3NGNyQbreWAUGdAjzse9v0m7JdAbXslMToQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhf0c08tt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 08:20:03 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38dc0eee75dso2444400a91.0
        for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 01:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784535602; x=1785140402; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oywFt15nTUechSp1jVDxMiDTZuPB3zyGHsnnJBE7dAk=;
        b=JCLRmRknsQLnSWHOGs+DgsHKMtM6sU+dor4/nVsnXAlsb+12899KzdqnmzXuFixE04
         v4gRXIflPz3ZqFpPzQ03Asicyc/+5CW34sK0ys4uDpYZRzjF1lWvfDbbSUTVvjRUVQQz
         igYhohukOswW6rAxsgWfFv9x/fBS9uXsOkCbVqVhNhdLp3wlYAdbj+wMC8lLbKouA0bU
         wMHv+eUKXJufH41733pSL10VKmgLzg9OcG1PipYdbFddh68Zz9qd8Fro8o/q6+dxI0Jx
         qqXHwliqL/u13d2T4/GiP1nHyTylTRv53HyLghDza1idaqkdwKYovPKHLgg34ImbJ9zW
         GwqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784535602; x=1785140402;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oywFt15nTUechSp1jVDxMiDTZuPB3zyGHsnnJBE7dAk=;
        b=sGSs5jmilroP1nasxjzjK6gLaEfVTC4sYPV0oa9lutU8yHALNgWMz8dtaRjQ1tKX/V
         qPddZxmQdq9nLpcZOmqFa5O1KrcGf/CDE70MzmFt2HJwae3ckhtVMzB2U/cHD/7eFhLR
         UNwAnf3oNJj45P5PUKReOwRyide8Q2eZyhs0Pb/9yZOZcClj/BBY+SwVimodujuW51G2
         KcY3EoSRBEl7MYfVFbUG4z2ISHFYb3tlAWCOl7kbfpw/YrKtQaZiGdP9t+T9PrxNMYV9
         60su/sVmn7NnnPoHAd4/X2MxThCrYe1geMjEh7xahicb/R0x9drzPqxV4XWs77wCFZkm
         fJ1w==
X-Gm-Message-State: AOJu0YyHEKSUKYrAfrWiWQwxGBm7pT9gHE5BpXie8T3ac9Izaq2cfUhi
	R+rWaZiaqTSHa7vljm9UkdEilRZDUgRAgogS/0p43ie8MKWq4GjvZ45NdmHm3NYOE5eheN6iAd5
	xcWBsHZVmB9Ovv+ZN3UECYVafpfI/IwwmoUt+9GqLfInDIw73o0D8h3pyVt8umqvp
X-Gm-Gg: AfdE7cmqHjviITLpzfjpP/OBMGLP1ihVSSma0bBUIJVoUl+FaPzPxQe50RIx5OR+L93
	3LkyRZj7r9xrzLlV3XfZoSCEPFXEDvhYqW2vIeZDjPrIgf8mzi32vBP0bHKMA00xQfMRY//4FNf
	X2FA+xmGKx7dAtSBEsilwavKIzr4OLAgPxaFDy/+H7zrTOEIJAkx1CqVGoHGVT+iph/9bxWCtk+
	qS8ajjEIcnk+GwSgw1nnk8RRIalrK846FT6e0DFac2hejNeLaFeBQiCpbJvCap8dW1NAxBCEg2I
	QfklC/240lTUxNAvQrue6AUGupiSxgq4GvCxOJ/ex9vRRoUhg+JBudJ4oIMQa8GpVJ3HiaK921d
	LZDiiP7m5AFGFeqcciSMA3OKO6pUThqw=
X-Received: by 2002:a17:90b:4c0f:b0:38e:89ec:5254 with SMTP id 98e67ed59e1d1-38e89ec53c6mr600796a91.7.1784535602421;
        Mon, 20 Jul 2026 01:20:02 -0700 (PDT)
X-Received: by 2002:a17:90b:4c0f:b0:38e:89ec:5254 with SMTP id 98e67ed59e1d1-38e89ec53c6mr600761a91.7.1784535601850;
        Mon, 20 Jul 2026 01:20:01 -0700 (PDT)
Received: from hu-uchheda-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e39e0531asm7233688a91.5.2026.07.20.01.19.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 01:20:01 -0700 (PDT)
From: Umang Chheda <umang.chheda@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ruidong Tian <tianruidong@linux.alibaba.com>,
        Tony Luck <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>,
        Umang Chheda <umang.chheda@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org,
        faruque.ansari@oss.qualcomm.com, avaneesh.dwivedi@oss.qualcomm.com
Subject: [PATCH v2 0/4] arm: ras: Add DT frontend support for ARM RAS
Date: Mon, 20 Jul 2026 13:49:50 +0530
Message-Id: <20260720081954.1858180-1-umang.chheda@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=HeYkiCE8 c=1 sm=1 tr=0 ts=6a5dda33 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=NEAV23lmAAAA:8
 a=VwQbUJbxAAAA:8 a=SRrdq9N9AAAA:8 a=tHe252CdNFHeNeq8tAEA:9
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: E9pSey32jb6JxzGDsSTsH3VsbQ42-R5t
X-Proofpoint-ORIG-GUID: E9pSey32jb6JxzGDsSTsH3VsbQ42-R5t
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDA5MSBTYWx0ZWRfXwiR2jE2WftH0
 mYwGRsk4a2wLN8TLqbXMat153y8dcXfxdZ6m8bCilRt01nz5xImjHhcGhDo+jRaiSeWKXzJRAUj
 /1k/xGapG4996nVQ/SHASGHHRY2L8dA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDA5MSBTYWx0ZWRfXyJBMM+oYAkYq
 qPTnaguedhQz02a6Sdu9yV0oYyi8j5DG8Wi6kP/5KjxwhKOxfrvau4ommriMjY/s1B53Dqv9z+E
 r0PVhu0IRQjP+5Y7oXOnmqLLtvav3Gcssa2Y7jbym/mmQjT/q4Hw5nLJOowhDPbioqtaLXAaurv
 mutZF8PAvafwJH+9D+Gp/Z6RuQVK9NSCwyx6zhYxWwc2ToJlHTNVrsiRiyOivI6man/NJo3JGIT
 XT4vvE6szJBm3Adte8oVyuN2GQwew05Ue+3KJkDcXd/O0KRm5n199vnlJG/vWnjL4OtppxrJEfM
 kI1n3DqKSPO7svrYyqWQZQ8NeCEY5OQYhwFEiX46zWiCwlv4k4s8BDWS8f+vFvTLUSsPLXBG4+o
 rFRJFkrV9PcPWGjbSsLvVpRBwsRPLBSDDHBUhvLrkQhJkQojlen0HQYk69iciXVZ5seNZ7JhSXo
 9tZC993HfmeANG6d22g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_01,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 phishscore=0 clxscore=1015 adultscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200091

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
  on Qualcomm's lemans-evk and monaco-evk boards with DT boot.
- Validated CE and UE injection via debugfs soft_inject.
- Validated GIC and SMMU error sources on QEMU.

[1] https://lore.kernel.org/lkml/20260122094656.73399-1-tianruidong@linux.alibaba.com/
[2] https://github.com/winterddd/qemu/tree/error_record

---
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
Umang Chheda (4):
  dt-bindings: arm: ras: Introduce bindings for ARM RAS error sources
  arm64: ras: Add Device Tree frontend
  arm64: dts: qcom: monaco: add RAS error source nodes
  arm64: dts: qcom: lemans: add RAS error source nodes

 .../bindings/arm/arm,ras-error-source.yaml    | 330 +++++++++++++++
 arch/arm64/boot/dts/qcom/lemans.dtsi          |  30 ++
 arch/arm64/boot/dts/qcom/monaco.dtsi          |  30 ++
 drivers/ras/arm64/Kconfig                     |  25 +-
 drivers/ras/arm64/Makefile                    |   2 +
 drivers/ras/arm64/ras-of.c                    | 383 ++++++++++++++++++
 include/dt-bindings/arm/arm-ras.h             |  11 +
 7 files changed, 806 insertions(+), 5 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/arm,ras-error-source.yaml
 create mode 100644 drivers/ras/arm64/ras-of.c
 create mode 100644 include/dt-bindings/arm/arm-ras.h

--
2.34.1

