Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B39F3E9F76
	for <devicetree@vger.kernel.org>; Tue,  5 May 2026 10:23:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777976603; cv=none; b=uDI6WiuGmEgqEg5+N2sJdOOXuTakXU/otZ1PypTfKE1wCnx69VyBWRoMyfNLWGJh+bCcfQheJdQpBpMv+jBEjxZS51FMwmrduw5CgJsiecdJ5PezX58OcLAJbdNUU7u6nhoSpVYLKVmcBXQkcNajJas5vKg/N9rVVs5ZqY2T+jU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777976603; c=relaxed/simple;
	bh=Oa67ll+SfGJDvCja57/v8Qp1QHN/7PWaCOW+/qBBsa0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Bhu5KZ+5RF2SNfH4Wa7hrgXf6Ll39dsUnc5K500lAQFV7QaMgPRtgFf7Y7vnCu+TwqeQZ7E20TRNEALdy2EmXiWoOcl1ocKC+5YPdLbREwBxb5sf65CL1GQ613lQkg2H+0uy0YA+d859JQ+FGEsiQy64E0R9tluMKXWyPTPb3q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Yzq+Au1e; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CNVB5OZk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Yzq+Au1e";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CNVB5OZk"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6456j1qw331221
	for <devicetree@vger.kernel.org>; Tue, 5 May 2026 10:23:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=yHFW2G1/sOkMmms1N9d6quiB/HsNtRPth+f
	ahI9w9Wo=; b=Yzq+Au1eJ3IlO8Y4jj8Ed1eCcVpeHgFO+xl6Gbz1J3kLJpjRiRm
	YfYEqBwoiRzlVjF6v7lJGsvcTySK/ZEzxl/cuR0ev9jcNS2HAxx7obp4KunYcvgI
	SJnhOk0h4VoUnUN96IawQptZp85OtmaCxTUjM3cKSIzwcF7GSaIKEO8TSqbIqUUS
	o7ENUGAdF4f9y06PpO1J2VqtJjB9jqXH2WhkjU9OTiKi/pu/EuQUWT7Heu3FFoU4
	TAMmHjKhj6A/nR6vGrT1TMFlFUvQ817xv8lzaaCGcwzRhUDBKXoTnJHhBrFCg8kc
	nVf4YbQuivgLpvcX8HgY0g9Z/AKL4qNfQQg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dxvr1c05g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 05 May 2026 10:23:20 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3594620fe97so12110280a91.1
        for <devicetree@vger.kernel.org>; Tue, 05 May 2026 03:23:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777976599; x=1778581399; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yHFW2G1/sOkMmms1N9d6quiB/HsNtRPth+fahI9w9Wo=;
        b=CNVB5OZk/Bj5qv2hOM+CIdC2tsd00DdO6xKRCC0YRUWMb7X4YnAS3IjbWDSOM5vkOt
         2qfxu7snUv6yW1QHA+gYNyEoXQq9ZfCGTc6aDwKWfRCTRI173G1rky4uQ9CuFmRfok3o
         LAnBnIdnLWeJrvjSBa8Fl/Ixs6rjht652nkrfr5qQa2L0Ov1bqVv6WSdeYRDbWxDTx1m
         brBQmaRmRCH20MT7yDXTigUVvWD1IML+y55U4nlKftJfuvGeONoUhg22R0K5XHZwmQwo
         jnmYZX4yd6o5MUiHLjrlc0iTnoTDXJDGDg99oiHOumufdw1kI6IJbFs32Xw/Y+tqYGyP
         PfKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777976599; x=1778581399;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yHFW2G1/sOkMmms1N9d6quiB/HsNtRPth+fahI9w9Wo=;
        b=QO156/JcADZx4qSBp44BlXCgEE85hqVZyO5PjtAYcB90No3AMyT7uf1F9g/Jb+DSR5
         Vb7+YrHA58UxNy7AoQbW3vg6CS4si8pMM7lhmJ9idF41bSIj74TgJKanOEteIEjUa6VS
         RY9/U/slNCxH/y7r01kT5NSLk0iqeFsvZkPsuO7F+4XZL7NLZ77ylFSATLJT+NyWlOIF
         rEZf0k48+D1Fgt9Nzkus9wdCgBRw+tsZUU+pWWf3jXefEzgtzSEQOWUPiLFk/s9XCQK7
         ILZxdSW1kH/ng+8fIECqY7gIJv2zOmIwGgx0FI5Rim3UhOKLYA/jnI1oW9wUqc9Hy3CF
         GeDg==
X-Forwarded-Encrypted: i=1; AFNElJ/Xr/Ln0bpEswkWCA8lM/ROn2WK/iL794ipWFT8uhj9Ttm7facQeu47TTJ8u/Qd/GYOoj2ZQLYhzzmV@vger.kernel.org
X-Gm-Message-State: AOJu0YwRuZNN2xbUFpY4eEs+QJxECHHMzpPo2nddOzXGfud77xDKNdQv
	BXWuEfxJY881et1lJcfHvJKbNfp0f7A+TXCSq7y9UGDhutC/56DJK6R4DqsLpNd08iwAR6TNH3f
	+ykjWEuQ0Y314yGsn75rP143Bw9fIN8XTo5CTWMjEjIV5NvmCX0SsFCW08g9XWHxn
X-Gm-Gg: AeBDievC27tFesyGkbT89x0mKBO84+7rKBW/Qa6EwoLS5dPTsO040DlBzorWnt+Y8/u
	lUizMWn+Q79nFSBRSS/dV3KZqz3SQ7KN8yXn7n2E4/JXE9zaTOLv6ZBcl/iIxNinNWGghvcRLnV
	dhVie+NyGW3cWluRfyB98FXZjjo237LrTci0MlgyRYQrJ4hKJTJptORsZi3NdgobEY3ZWaZuGtF
	GR+lPXeLuGNFyAZMQ6T39YdbnYIu6y+ydwKZVL7FKTIOjWDBILOQBa3jbrJbUDErJzsWhaowR2x
	3o2JAzO0kBYj8bhmVZ1IkI3M2W+V+T+qYCZYWHRafvSCvClZBNZyno1YUYjtYle2PG6mz87qkqV
	CTMXpNgTGd6WwM6y65nSWrHnqrGOanq5Ma8CeUv1s1zQVwYwOMchVkvwt4K8YV9bNulTB1kk1xG
	H8TMBtzz+SuweaKdFFTefImq7OWSLe99jEmvVcDtHUaOAKykg8jh/07XCsyUZMng==
X-Received: by 2002:a17:90b:3952:b0:364:78a5:8d40 with SMTP id 98e67ed59e1d1-3650cee0ae8mr14028023a91.20.1777976599490;
        Tue, 05 May 2026 03:23:19 -0700 (PDT)
X-Received: by 2002:a17:90b:3952:b0:364:78a5:8d40 with SMTP id 98e67ed59e1d1-3650cee0ae8mr14027997a91.20.1777976599000;
        Tue, 05 May 2026 03:23:19 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3656ae05d30sm3299333a91.6.2026.05.05.03.23.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 03:23:18 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
To: andersson@kernel.org, mathieu.poirier@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org,
        manikanta.mylavarapu@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Subject: [PATCH v12 0/6] Add new driver for WCSS secure PIL loading
Date: Tue,  5 May 2026 15:53:04 +0530
Message-Id: <20260505102310.2925956-1-varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: zLPlrBg1PjvWH4SrirdCYmsFmJYAPzMu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDA5NyBTYWx0ZWRfXx3RSq9ZKK49D
 qiB/6sgW4BawxS1kEo/m0ZDey6J2OFR0/NiPD1A1q3Flcyc02QJ3nHUMfrTNHdz5QJ9RqjsdHij
 5tfjAKq7XE4YhdXl3MN4MLZqFYsicPjLEARPen+F6VxrTUTh0tLMrqwc++vyjxmHZsjAdNK1He/
 Azn4UWzCY6BbwmOebEJ+zeP3BQQz0miqkyBNP9oGKkpLUPO+EjysG7z2WG/zQ5mH4oUV/G6uKL1
 JIOS7u+OJTLDBhYJ1zagzR3E7fUNoDFexNMhActf5iPJKY47sJDnGdto+UCa7CftHCRzbA2so4/
 LqM03kkYxzq7b8ICsZnIlTSb7PLW0iALhv8ZeFbZP/ODY9ZUbhKXDugCsGqm+eaIfYHl+PKCv9A
 wzj77fqGpCDBEnXJLbIYH9f8LLb3AbA1T0qU7LsCaVxdDwhq/DmiWq+1OFYr63hC6+ORb6e7hCs
 udgUpuf3G/VFMomaslA==
X-Proofpoint-GUID: zLPlrBg1PjvWH4SrirdCYmsFmJYAPzMu
X-Authority-Analysis: v=2.4 cv=RvL16imK c=1 sm=1 tr=0 ts=69f9c518 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=LpQP-O61AAAA:8 a=EUspDBNiAAAA:8 a=UqCG9HQmAAAA:8
 a=RJCUFTRzgs7Fj7gX-CAA:9 a=uKXjsCUrEbL0IQVhDsJ9:22 a=TjNXssC_j7lpFel5tvFf:22
 a=pioyyrs4ZptJ924tMmac:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605050097

As discussed in [4] posting this series after dropping IPQ5424 support
to remove dependency on Sricharan's tmel-qmp mailbox driver series v4 [1].

Imported from 20251215-ipq5018-wifi-v7-0-ec4adba941b5@outlook.com.

Imported from f20250417061245.497803-1-gokul.sriram.p@oss.qualcomm.com
I've resumed Gokul's work as the last submission dates back April 2025.

- Secure PIL is signed, firmware images which only TrustZone (TZ)
  can authenticate and load. Linux kernel will send a request to TZ to
  authenticate and load the PIL images.

- When secure PIL support was added to the existing wcss PIL driver
  earlier in [2], Bjorn suggested not to overload the existing WCSS
  rproc driver, instead post a new driver for PAS based IPQ WCSS driver.
  This series adds a new secure PIL driver for the same.

- Also adds changes to scm to pass metadata size as required for IPQ5332,
  reposted from [3].

[1]
https://patchwork.kernel.org/project/linux-arm-msm/cover/20250327181750.3733881-1-quic_srichara@quicinc.com/

[2]
https://patchwork.kernel.org/project/linux-arm-msm/patch/1611984013-10201-3-git-send-email-gokulsri@codeaurora.org/

[3]
https://patchwork.kernel.org/project/linux-arm-msm/patch/20240820055618.267554-6-quic_gokulsri@quicinc.com/

[4]
https://lore.kernel.org/linux-arm-msm/aUN7Aer%2FGG1d5Om9@hu-varada-blr.qualcomm.com/

Changes in v12:
	- No code change
	- Rebase to ToT
	- Change quicinc mail ids to oss.qualcomm.com mail ids
	- Link to v11: https://lore.kernel.org/linux-arm-msm/20260326043320.2507890-1-varadarajan.narayanan@oss.qualcomm.com/

Changes in v11:
	- Add R-b tags
	- Rebase the first patch ("firmware: qcom_scm: ipq5332: add support to pass metadata size") to top of tree
	- No change in other patches
	- Link to v10: https://lore.kernel.org/linux-arm-msm/20260113092021.1887980-1-varadarajan.narayanan@oss.qualcomm.com/

Changes in v10:
	- Add R-b tags
	- Remove unused fields from 'struct wcss_sec'
	- Remove glink and ssr subdev if wcss_sec_probe() fails
	- Link to v9: https://lore.kernel.org/linux-arm-msm/20260106105412.3529898-1-varadarajan.narayanan@oss.qualcomm.com/

Changes in v9:
	- Add R-b from Konrad for dts patches
	- Renamed qcom,wcss-sec-pil.yaml -> qcom,ipq5018-wcss-sec-pil.yaml
	- Restore clocks & clock-names in above yaml
	- Fix DCO on two patches
	- Link to v8: https://lore.kernel.org/linux-arm-msm/20251219031010.2919875-1-varadarajan.narayanan@oss.qualcomm.com/

Changes in v8:
	- Dropped Krzysztof's 'Reviewed-by' as the bindings file has changed significantly
		* IPQ5018 support added in v6
		* IPQ5424 support dropped in v8
		* Updated to use IPQ9574 as example
	- dt-bindings-check and dtbs-check passed
	- Dropped IPQ5424 support from drivers/remoteproc/qcom_q6v5_wcss_sec.c
	- Updated copyrights of drivers/remoteproc/qcom_q6v5_wcss_sec.c
	- Change 'qcom,smem-state-names' order to resolve dt-bindings-check error in ipq5018.dtsi
	- Dropped changes to ipq5424.dtsi
	- Link to v7: https://lore.kernel.org/linux-arm-msm/20251215-ipq5018-wifi-v7-0-ec4adba941b5@outlook.com/

Changes in v7:
	- correctly sorted QCOM_SCM_PIL_PAS_INIT_IMAGE_V2 by command ID
	- correctly sorted smp2p-wcss nodes in dtsi files
	- Link to v6: https://lore.kernel.org/r/20251208-ipq5018-wifi-v6-0-d0ce2facaa5f@outlook.com

Changes in v6:
	- added patch to fix IPC register offset for ipq5424
	- changed phandle description for mboxes property in dt-bindings
	- updated bindings to define the right clocks per SoC based on
	  compatible. Ran make dt_binding_check for validation of all
	  SoCs
	- use of more descriptive match data property (use_tmelcom) and
	  added a condition in wcss_start to not error out if tmelcom
	  isn't used
	- mitigated potential off-by-one
	- adopted use of of_reserved_mem_region_to_resource to acquire
	  memory-region resource
	- added driver support for ipq5018 SoC
	- corrected size of reg properties as per Konrad's comments
	- added patch to bring up Q6 in ipq5018 dtsi
	- Link to v5: https://lore.kernel.org/r/20250417061245.497803-1-gokul.sriram.p@oss.qualcomm.com

Changes in v5:
	- retained all the patches as in v3 and addressed comments in
	  v3.
	- reverted changes to dt-bindings done in v4 and retained as in
	  v3 and fixed firmware format from .mdt to .mbn and retained
	  reviewed-by.
	- dropped 2 patches in v4 that adds support for q6 dtb loading.
	  Will post them as a new series.

	Following tests were done:
	- checkpatch
	- dt_binding_check and dtbs_check
	- Link to v4: https://lore.kernel.org/r/20250327181750.3733881-1-quic_srichara@quicinc.com

Changes in v4:
        - changed q6 firmware image format from .mdt to .mbn
        - corrected arrangement of variable assignemnts as per comments
          in qcom_scm.c
        - added scm call to get board machid
        - added support for q6 dtb loading with support for additional
          reserved memory for q6 dtb in .mbn format
        - updated dt-bindings to include new dts entry qcom,q6-dtb-info
          and additional item in memory-region for q6 dtb region.
        - removed unnecessary dependency for QCOM_Q6V5_WCSS_SEC in
          Kconfig
        - removed unwanted header files in qcom_q6v5_wcss_sec.c
        - removed repeated dtb parsing during runtime in qcom_q6v5_wcss_sec.c
        - added required check for using tmelcom, if available. Enabled
          fallback to scm based authentication, if tmelcom is unavailable.
        - added necessary padding for 8digt hex address in dts
	- Link to v3: https://lore.kernel.org/r/20250107101320.2078139-1-quic_gokulsri@quicinc.com

	Following tests were done:
	- checkpatch
	- kernel-doc
	- dt_binding_check and dtbs_check

Changes in v3:
        - fixed copyright years and markings based on Jeff's comments.
        - replaced devm_ioremap_wc() with ioremap_wc() in
          wcss_sec_copy_segment().
        - replaced rproc_alloc() and rproc_add() with their devres
          counterparts.
        - added mailbox call to tmelcom for secure image authentication
          as required for IPQ5424. Added ipq5424 APCS comatible required.
        - added changes to scm call to pass metadata size as required for
          IPQ5332.
	- Link to v2: https://lore.kernel.org/r/20240829134021.1452711-1-quic_gokulsri@quicinc.com

Changes in v2:
        - Removed dependency of this series to q6 clock removal series
          as recommended by Krzysztof
	- Link to v1: https://lore.kernel.org/r/20240820085517.435566-1-quic_gokulsri@quicinc.com

George Moussalem (1):
  arm64: dts: qcom: ipq5018: add nodes to bring up q6

Manikanta Mylavarapu (4):
  firmware: qcom_scm: ipq5332: add support to pass metadata size
  dt-bindings: remoteproc: qcom: document hexagon based WCSS secure PIL
  arm64: dts: qcom: ipq5332: add nodes to bring up q6
  arm64: dts: qcom: ipq9574: add nodes to bring up q6

Vignesh Viswanathan (1):
  remoteproc: qcom: add hexagon based WCSS secure PIL driver

 .../remoteproc/qcom,ipq5018-wcss-sec-pil.yaml | 178 ++++++++++
 arch/arm64/boot/dts/qcom/ipq5018.dtsi         |  64 ++++
 arch/arm64/boot/dts/qcom/ipq5332.dtsi         |  64 +++-
 arch/arm64/boot/dts/qcom/ipq9574.dtsi         |  60 +++-
 drivers/firmware/qcom/qcom_scm.c              |  14 +-
 drivers/firmware/qcom/qcom_scm.h              |   1 +
 drivers/remoteproc/Kconfig                    |  19 +
 drivers/remoteproc/Makefile                   |   1 +
 drivers/remoteproc/qcom_q6v5_wcss_sec.c       | 325 ++++++++++++++++++
 include/linux/remoteproc.h                    |   2 +
 10 files changed, 723 insertions(+), 5 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,ipq5018-wcss-sec-pil.yaml
 create mode 100644 drivers/remoteproc/qcom_q6v5_wcss_sec.c


base-commit: 9d0d467c3572e93c5faa2e5906a8bbcd70b24efd
-- 
2.34.1

