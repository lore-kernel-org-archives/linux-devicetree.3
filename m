Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795458532;
	b=Kdfr8cF6WX1Vv3A52J9ayaHbZVBpi1KPq8TNWXSvFI/xMSH7b0XjhppeyEoXqF4h+OmY
	 n+zRb6lSJDGqll0zxA0camxG+5SO+AIJmeHE6SDMeT+MWuP4tq6gO6Gk1DfdoZhqgPWVZ
	 7w9PCxJH+ywtbccYeJqhRY5ASm251m9ZvQiSxjNOIz54iPGixwAWudZnSJ490a29mc5I6
	 5Q8kJ8TEaWrZ+X4ZeHGRd/zfczzFBdnsA13RRgMFX3rZPHsSzA1IPQbL8YUKHPUzMi+Ve
	 aL33GZBMRux5s7EaVMCQTyG6xUy9jD/6vdSyLSxReqeBkL8saRKdBHo3iZXz7AnRC3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795458532;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=uMEhX/TXd+pIUbLD5OFL1jgv2jekw8y9q3DCyyw6524=;
	b=XclNEqx3U0b5hoo8BJaKSH+SiBPGny7tvEoBj2K4bfUd2T3Wo4vo5ee3TbDTT7wWKNCU
	 eekK2s5izLbSOpiyqwXbIEvM479/81/m+2KIaObT7og+uX49J2NZJ4EISxS4pz33iL3va
	 yk+/zXXLBz4ehPHki9nAI+S6dYtU8VNz8MgxvtQyxtKtzOJV6oOKjwKFvZjXkzy0hEsLD
	 V2uny3vef9LbjO8l+RZIau3WRmJYQ4AKHowtLKbJR7B/rmmvvCAXgY6Qo14rx0ofp9AiS
	 5r1aNV+98hQYdXs/33UNdUziiYyTzMwnN3imB1NNtgFq7Df+7tqTyZIRpBEno8IyupQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="FRM4/eoR";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IO7koQBZ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71C98606A31A
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 18:28:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71C98606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FRM4/eoR;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IO7koQBZ
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGH4SH1093911
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 18:28:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=uMEhX/TXd+pIUbLD5OFL1j
	gv2jekw8y9q3DCyyw6524=; b=FRM4/eoR2THxPR10+D74CZe5H6odHCSJ8b4eqy
	gcp6Et0vws2VI+pQijuQVutC55ekf3oFixX5rr/JbYRjgPR/2TjE47yZoUu0ZIlW
	4kicJ2RUdtXRahwi4ZEpQQSdPj70OamkEsIkDGVmI0ry6IdJ+tsm4CEc6TB9HslT
	xr07BC4xRWkTjp7fZtMeH5Ty6kFK/w173WKuYEbbmQq7rMLqSDpYW7CYoKpVCzZ6
	GWZbu4fnXuZVF+XcYT3oFZL3I1HaiP6HUK+AtE3nCqbA9rIMoiMViWypbuCRomDe
	VR3pQl/KEBf4cUwJvhc6BrncoUvD4WZQRayxtetGi1eE9Big==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4ma0ssnk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 18:28:50 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-384c78aa0dbso5048572eec.0
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 10:28:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795458530; x=1796063330; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uMEhX/TXd+pIUbLD5OFL1jgv2jekw8y9q3DCyyw6524=;
        b=IO7koQBZR8q9EsVDR2eABdZzpO4f0a5UgVdzmYlmP475b41vFIxna9YIAISBCbA0S7
         e9RIxBnqjN2zVuuh3lxHO6GBDalIJqj9mV08AR4zY1KCKyaqIoWO4j+fT+1dgHEyEMLc
         oPOtxWJymvEYv58ynFyNoo9NJj9E88OevIAuQ9+6OCDnsAnMBmI9AaGyrWKk+32n7nkd
         c2879CCxqtt0knSPEj55y7FyL1J20ruoEJr6m+CgCzof+En5CdmNXc4ZZ5FylPcgxjgl
         eV7irhIAgYnzmZo8GBjFsqpWTZuLoLqya3xS98PrjnwOX+q8WbnQD500nPbs84oTZrEB
         7gng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795458530; x=1796063330;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uMEhX/TXd+pIUbLD5OFL1jgv2jekw8y9q3DCyyw6524=;
        b=W0mVSEbem4aR+i1vCJxaJ05u9OZXv5j8AahCJ334GKJgdPrHIhM8kG8CZ+WASslXx9
         9fN/b2JHPZ8z7dUcn5ATecxw+OBv7fpahpeGWKqOVoXafJ2qA7WeE0dk8UXqNudKzhr2
         Zwq7mlx4vekoWzw/q1/8mZdR1RIFaL3P7O/J027uIST4ZzxBwGoyk3YprfKxKP+uyIID
         GbERidblyCPmgzENi6inJmu71sLS4U8J9LhksNrOg6N1AAtYbNgzK+70bmERHXblAfS6
         2ksqYhOVeHhLAxDSeqv8xp3f2UjNf/ipEMfRYEmPCEBNuOU4vSFiM5ZUBV0oIlpmuH2g
         bdbg==
X-Forwarded-Encrypted: i=1; AL+hErFSXO1u/NHOv6TWzUzHWaSdkoVK+SPYJYX0NcqQ3h2WL/sYAnaprLSeuhkUUdi5GhX4cnaVAQZCXI5f@vger.kernel.org
X-Gm-Message-State: APuU4Z+Ag/qFDlc9HKhnI7NqAszg/buEls+Z18QVB1hHRm1fdAcPA9y3
	lAFcrAiIOTcwNWmS91cEB16ZE3NeSCSwjU7r0zlsowdG/IX9v1Oh3kkzp1rurxxe43XUNEqEYlS
	bRGFqD9ejA94w56F75yuAg7Js1SRzTikpMPk2TqEQ+kmYuPgmZd3OoPhJabJGm9Dz
X-Gm-Gg: AZFdTZd/b98jOXMACG9BnLUWvfiJ/0LHiMDnlEzhh3ItJQbKa7cJJlizPYoKaZXSbvs
	1XrPcZ0TlTXF09OO0EB6hm5eDDybTSQqga7ciIDWv4TCV0pjk99+uHeN0qx1Hk1P2KBYysmAFEd
	S1LW9MGl6TNd+k0POaF1ktd8eFEnAbCpAeHw6YKUWr11gAvFzzcgTsdTOHcwjJ2Zo5D9L2hfdEj
	mjUrIBtwlWA55KrMducx0WirQ4T9KRF1anUbEBpYdW5wfFtDxmeG800E4QiV6nIVBV1OPMNpAJQ
	cBKD4npu39TM4RdWtHz9cV6MKeKAODnp4VG6uvyWt8F55cXCVwnWN2tQ0umBiC05chBOWfsyhoP
	19yJ02UOZ5XsDpVB0ATZQa6Ua/DhpFxTkChnNEy9T3ouyN3uG+l7Q7STZCYkxLvrpbI6W2lUgA+
	zaNODnLU5OJZXxwcJh6/ApDPotBg==
X-Received: by 2002:a05:693c:41c3:10b0:386:acf5:b4b5 with SMTP id 5a478bee46e88-386acf5b7c7mr4219302eec.23.1795458529669;
        Mon, 23 Nov 2026 10:28:49 -0800 (PST)
X-Received: by 2002:a05:693c:41c3:10b0:386:acf5:b4b5 with SMTP id 5a478bee46e88-386acf5b7c7mr4219284eec.23.1795458529104;
        Mon, 23 Nov 2026 10:28:49 -0800 (PST)
Received: from hu-eserrao-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm47697986eec.5.2026.11.23.10.28.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 10:28:48 -0800 (PST)
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v10 0/7] Improve Qualcomm EUD driver and platform support
Date: Mon, 23 Nov 2026 10:28:40 -0800
Message-Id: <20261123182847.143892-1-elson.serrao@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: _eouXaFkeYj9LizGlk3AjD-rggc0fevy
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3MyBTYWx0ZWRfX4YA/i3txMPhN
 +dZI/pjehSWWKJlS61XcM+TsiU4h1TU30crgPkAXf4Bw5Kr4//crEBP+EpgbR2qyoJv7RmJVksU
 xPtvubgKfj5o2tALH+raEASkLJ1blcA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3MyBTYWx0ZWRfX818BNRkVyJja
 btIkUgtuDKXTWZmQJlmzKzgMzxxYoEPQ6th7vIr9fUWMoiu8l3SI6ayaTjVEODLF3FqM8m7BNea
 GmjGit0aRr9Hl+wxyO52TtqaXYYVXhBEkE59DaAG5uHkOkK5h4KYcoBZCEdHVrMPCG1p3/HRhyz
 4+ZehU57YRAAUWT7JqubFLweeUVZ1mQPpOtXkgsr0lha9f0qAHxmNpmFhGKHGv6MlzsqK+BhETH
 81Ck2u3MMuuiC4vbFhs1CABZCAeDPHb5Z7J9UB0gmom6R1QmMcHktnnATB1RzARpRhwLhn5OEqL
 A6z9W5NNYrtebtamLCvjfKJo6/rOpQLcHbaSmgqht4h7jTIvHmAe/AeVhVtya4Je3rTZ4SWlcmt
 TbgSuT7g+C8P0JlI7L/HKLH3tNWA4lvh+ueF87Rjmnu6K+jcZaPUQANisqnfVXUPKukk8AHeYUi
 AgWBex5Z8SdPZ49IdgA==
X-Authority-Analysis: v=2.4 cv=Yr+a1IYX c=1 sm=1 tr=0 ts=6b0485e2 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=04Xez-ET1AprnQQrt-MA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: _eouXaFkeYj9LizGlk3AjD-rggc0fevy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 clxscore=1015 phishscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230073

The Embedded USB Debugger (EUD) is a High-Speed USB on-chip hub that
provides debug and trace capabilities on Qualcomm platforms. The current
EUD driver, however, lacks essential hardware resources such as PHY
references and support for multi-port configurations. This series addresses
those gaps and introduces the necessary changes to enable EUD support on
Qualcomm targets.

Below is a high-level block diagram showing the EUD and its connections.


			              EUD Block
 	                   +------------------------------+  
			   |                              |
[Conn-0]-->[USB2PHY-0]---->|-------- Path 0 --------------|-->[USBCtrl-0]
			   |                              |  
[Conn-1]-->[USB2PHY-1]---->|-------- Path 1 --------------|-->[USBCtrl-1]
			   |                              |
			   |      +------------------+    |
			   |      |  EUD Debug Hub   |    |
			   |      +------------------+    |
			   +------------------------------+

The series has been validated on the Qualcomm Dragonwing Q6 platform
(RB3 Gen2 board), confirming successful OpenOCD connectivity to the EUD
interface. For detailed usage instructions, refer to Qualcomm’s Linux
kernel debugging guide:
https://docs.qualcomm.com/bundle/publicresource/topics/80-70020-12/debugging_linux_kernel.html#debug-using-openocd

Testing feedback:
 - Konrad Dybcio reported running a slightly modified version of this
   series on Agatti with no obvious issues:
   https://lore.kernel.org/all/8d4f10ef-602c-4e1e-9711-443a5f3fa7f3@oss.qualcomm.com/

Regards,
Elson

---
Changes in v10:
  - Separated the DT patch from the v9 series. This version contains
    patches 1-7 only. Patch 8 (the DT patch) will be sent separately.
  - Link to v9: https://lore.kernel.org/all/20260929213513.2401005-1-elson.serrao@oss.qualcomm.com/

Changes in v9:
 - [Patch 0002] Initialize port_idx from the hardware EUD_REG_PORT_SEL
   register in probe(sashiko bot).
 - [Patch 0003] Fall back to primary if the hardware-selected port has no
   matching devicetree path.
 - [Patch 0004] Add missing of_node_get()/of_node_put() to keep the fwnode
   valid for the lifetime of the registered role switch (sashiko bot).
 - [Patch 0006] Avoid mixing goto with guard(mutex) per convention (sashiko bot)
 - [Patch 0008] Reorder eud_con label references alphabetically(Konrad)
   and extend this routing to newly added sm7325-xiaomi-lisa board file.
 - Link to v8: https://lore.kernel.org/all/20260912225301.3396556-1-elson.serrao@oss.qualcomm.com/

Changes in v8:
 - [Patch 0001] Require '#address-cells' and '#size-cells' for eud-path
   nodes to address Sashiko bot feedback. 
 - [Patch 0004] Set path->curr_role before forwarding the role request to
   the controller, as it reflects EUD's view of the role rather than the
   controller's outcome. This also addresses Sashiko feedback regarding
   EUD hardware potentially remaining enabled when the controller fails
   to complete the role switch. 
 - [Patch 0006] Acquire the lock in different execution paths to avoid
   potential races.
 - Link to v7: https://lore.kernel.org/all/20260831030147.1500616-1-elson.serrao@oss.qualcomm.com/

Changes in v7:
 - [Patch 0001] Explicitly disallow the legacy ports representation for
   SM8350, as pointed out by sashiko bot.
 - [Patch 0004] Simplify fixed-role handling by relying on dr_mode directly
   instead of an indirect USB_ROLE_NONE check (Konrad).
 - [Patch 0008] Squash the Kodiak EUD board endpoint remap into this patch,
   as applying it separately leaves the OF graph bidirectionality broken.
 - Link to v6: https://lore.kernel.org/all/20260811213610.2956147-1-elson.serrao@oss.qualcomm.com/

Changes in v6:
 - [Patch 0001] Fix oneOf schema to properly enforce mutual exclusivity
   between 'ports' and 'eud-path@N' (sashiko-bot).
 - [Patch 0009] Extend the eud_con remote-endpoint fix to
   sm7325-motorola-dubai-common.dtsi and sm7325-xiaomi-taoyao.dts to fix
   "not bidirectional" DT graph warning.
 - Link to v5: https://lore.kernel.org/all/20260803031534.2942628-1-elson.serrao@oss.qualcomm.com/

Changes in v5:
 - [Patch 0001] Add a compatible for a SoC that supports EUD over two
   ports, restrict paths based on SoC hardware, and improve the commit
   message [Krzysztof/Dmitry]
 - [Patch 0002/0003] Document error codes in ABI doc.
 - [Patch 0004] Zero-initialize the USB role switch descriptor [Peter].
   Add a dr_mode check to handle cases where the USB controller
   operates in a fixed role without role-switch support (based on
   internal testing).
 - [Patch 0006] Drop eud_disabled_for_host flag and control EUD based on
   device role entry/exit [Peter]. Allow EUD to be powered on only in
   device role and defer enablement in other roles until the port
   switches to device role.
 - Link to v4: https://lore.kernel.org/all/20260501170635.2641748-1-elson.serrao@oss.qualcomm.com/

Changes in v4:
- [Patch 0001] Restructure the flattened ports representation to a child-node
  based model.
  - Preserve the top-level 'ports' property and add per-path child nodes,
    so that each role-switch path is described using its own OF graph.
    (Dmitry).
  - Link to the discussion leading to this design decision:
    https://lore.kernel.org/all/20260324172916.804229-1-elson.serrao@oss.qualcomm.com/
- [Patch 0002] Use explicit port names when selecting the active EUD
  port (Greg)
- [Patch 0003] Use a scoped iterator when looping over child nodes and
  drop redundant EUD path validation checks (Konrad). Preserve support
  for the legacy top-level ports description.
- [Patch 0004] Register role switch per path and forward the role switch
  notifications to the USB controller.
- [Patch 0006]  Add host mode co-ordination based on the role changes as
  per the new design and drop the custom API that was used to get role
  notifications.
- [Patch 0008] Described the UTMI path as a child node with role switch
  capability.
- Link to v3: https://lore.kernel.org/all/20260309203337.803986-1-elson.serrao@oss.qualcomm.com/

Changes in RFC v3:
- Replaced the per-path (eud-path@N) model with a flattened ports
  representation based on the feedback.
- Added port@2 and port@3 to support dual-port configurations.
- Removed the EUD-local 'phys' and 'usb-role-switch' properties since PHY
  and role-switch information is obtained from walking the OF graph.
- Updated PHY discovery logic by fetching the PHY from the controller
  node/fwnode, and exported a new API for the controller to report role
  changes. The dwc3-qcom driver now uses this API to notify EUD on role
  transitions.
- Updated the DTS structure by moving the EUD-to-controller port mapping
  into the base SoC DTSI, enabling EUD by default, and adjusting all board
  DTS files accordingly, including adding the usb-role-switch provider
  link on connector nodes.
- Link to v2: https://lore.kernel.org/all/20260126233830.2193816-1-elson.serrao@oss.qualcomm.com/

Changes in v2:
- Improved commit message of patch 0001 and 0003 with historical context
  on why EUD worked without PHY references on single-path systems.
  Expanded the usb-role-switch property description in the bindings file.
- Link to v1: https://lore.kernel.org/all/20260116232106.2234978-1-elson.serrao@oss.qualcomm.com/
---

Elson Serrao (7):
  dt-bindings: soc: qcom: eud: Add per-path child nodes for UTMI routing
  usb: misc: qcom_eud: add sysfs attribute for port selection
  usb: misc: qcom_eud: add per-path High-Speed PHY control
  usb: misc: qcom_eud: add per-path role switch support
  usb: misc: qcom_eud: improve enable_store API
  usb: misc: qcom_eud: add role-based EUD control
  usb: misc: qcom_eud: fix virtual attach/detach event handling

 Documentation/ABI/testing/sysfs-driver-eud    |  19 +
 .../bindings/soc/qcom/qcom,eud.yaml           | 138 ++++++-
 drivers/usb/misc/qcom_eud.c                   | 369 ++++++++++++++++--
 3 files changed, 499 insertions(+), 27 deletions(-)

-- 
2.34.1

