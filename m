Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3C5937EFFC
	for <devicetree@vger.kernel.org>; Thu,  9 Apr 2026 08:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775723525; cv=none; b=cQCMewoLSuda09HzLEMdYvSp8Inp0UmCrJYimw3M1s82Zf+f6iecJLssoPIQyMOeRJT83KgoinXmmDr8vfA0osVz0TAiW5lC6VxY704DEwaDvGU4/4QsZxo8x91MKKKwN4WWcd4YnyMZxo4h0NqnAcNbFgCg+0BwOYdsQTyxoPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775723525; c=relaxed/simple;
	bh=EOBG6ZUalbLe0dCTG75TFDhE9ruR+7URO60Vi0OgI84=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=XM2wxnOQ8df/wJH7VLI+NNxfvzdk9onhvQkJh7l/buUXdQdEwLLW3RZYZJb73g5I4fJQzPST8fjVDRfwjuvXJ1gdHpL6B9V9kDYVnzlB+RDVqAQ7Y0itiEuJtxKRi/86ij1Ni1DecGS2HU6Vms8UtSg6fSeQiJH3NPCIpWFM64c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RLLTJUh5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VSRg/15v; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RLLTJUh5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VSRg/15v"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6395l4gN1616265
	for <devicetree@vger.kernel.org>; Thu, 9 Apr 2026 08:32:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=pYlY2MYU3AKF+o5KQR5gyQ
	VEi9BHV56WPDQ9FRiAQm4=; b=RLLTJUh5J9M4dIWlEesGh+2qToqOecwz32oXwE
	PgjDSCh2S7mIRbn0tXQW4mXXaZd4MLHjGgvTyCxWlSQaLCn+QvS0fPke+o8uVpIY
	C5+I94GAtkt8vCqvu6+px3zCDtISXuRUCqcfPvRx0Wn/XoPv34l4o2iQ5s0u/Tqr
	dPRJNl34uvsIny3TdbpzpKOyOqgC2r9I5Z7aPtvDQwWx9m3kudvMiCmC9VEIsQX8
	2g8DeR0tHM9ga0nAp0IiRoiuia2cZUw0qovlVe8mQ4nHZflZWksEpW7K2ztwfGpp
	6l/2/aba+byjACPkmkAqJ13D5THb7QWqJjfhGeYiKSgPBpJw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4de68v8jmp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 09 Apr 2026 08:32:02 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c6e24ee93a6so335493a12.0
        for <devicetree@vger.kernel.org>; Thu, 09 Apr 2026 01:32:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775723522; x=1776328322; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pYlY2MYU3AKF+o5KQR5gyQVEi9BHV56WPDQ9FRiAQm4=;
        b=VSRg/15vnQkprOlPgxl3vuFfjpgH2MmPwjtj13t1yUJFXoA0LUc5A2WYa9elCG7uf/
         Hd3vFVTAINlI4yU8TkWldr9BeUdwUNAKws2egGjOQipK7vrgrWe2rI79wEqbcP1jG72d
         QKpAaemQqwg3SKg4yIWmArf7IJZTV5Y5Ml5cQqd2XnNCTRgw5e/umiNNksXgMHDTJdQq
         uMNgw8oxG5SYd0dbx7WhaBnR/LaCZIlUU6DgN0eQPp/tWwFc7QAR6MimXjVIPGIkHmJd
         7uklaHWA7n9T/+KMp25TW7KxY+nvjdn+ikPLZR52yPXEao2TxuN+GvTJ1ucWJrPxtsxK
         h8DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775723522; x=1776328322;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pYlY2MYU3AKF+o5KQR5gyQVEi9BHV56WPDQ9FRiAQm4=;
        b=KK6SWtL8ZiubAlyFhbD+iZr14K7fn3kjze5/+sTfqHngMT2g8BXcdEtsNyRe1idIkz
         OHEn0mTHJezXgnRhxDxoawgL+qLKrTUmXsbarA/MTlugrTEr7r3KydP9snQsCADiDDZb
         DVx3N0fq6ZRAIbI2W+lMY26mQJ6RuLh+vWC1TVxsYDqlcNUtKkF252i5sHM4uB3Ui1sO
         VftCkOQ71FX4mYwBsdwh8uwzq185gX10rdeQcf3XEP4goY0r1VDMRT2e1z/n+qrio5cP
         0/XOM20Q4HIWHBfPDjr42TbdlT4Wq4aA3xTowvJ1Uq1wLAoIRRVZnNyBwp+WsjmuFMpd
         Qfnw==
X-Forwarded-Encrypted: i=1; AJvYcCXKFKzd8vsmYgeboATTRujQYKl3AJk83BEd0w39XPW9b1CgkJ+7D184VyeLKt/iOUjCgosWp8nDulsA@vger.kernel.org
X-Gm-Message-State: AOJu0YxvDszLO6D7OJvnGXmN9svFXiIGU0tJ1MP1K2ZGwlUOnrtzb+Oz
	oLna8r6A1dCq+I2qld6G547AE7/Lj7lDH25uoUmk48jrQgzHHONY5yL/A5cP3IQ8b5rv3zzOCso
	PQ2GvpO+/V6+AgZra5D+Upzux6yTRaO1xaPYaiDS955QzJmoCmhJS+aDL4KTGWGH/
X-Gm-Gg: AeBDietT7EZXiFqLenAgiWHY7KKM6XnJBtdUqhf+nFM3K049AvLzA+r9A/Jly+K7pe1
	LvH5ROnwj7H2xvWTQpU1wY4IMTRiFSqAaY5hb2fmMJC5GZ2A3af0eFV4iWxZb/ejvtQtHrRh3fr
	+eJVpcv3DQDXoYTmf0bGKe6a4oVWWenhJBKGDKguDwlAxYwLUQtahhOUH9VFdEoFgulKUcPmOQI
	A0SFg6GK4ay6Z0+4oKvDj5SJ/ncb5S2Y/quiVcHw1naQzimV0Uji8ODSKOfFpY3UQxe2WX0ZdGT
	PdgDc4mbpzOMnk3Uhs8V+xl+DhTUGwepbxygjnd5PfOStnqzyha2V6GsA6sAECUtqFcTgF11opg
	s4g7yCgTIu44N+UFFnZxv7EnxKDjAOdr4Ie8RLJXG+m2DPTuPztelMDc=
X-Received: by 2002:a05:6a00:aa85:b0:81f:544b:3998 with SMTP id d2e1a72fcca58-82dd8b4ff5fmr2317008b3a.26.1775723522265;
        Thu, 09 Apr 2026 01:32:02 -0700 (PDT)
X-Received: by 2002:a05:6a00:aa85:b0:81f:544b:3998 with SMTP id d2e1a72fcca58-82dd8b4ff5fmr2316974b3a.26.1775723521622;
        Thu, 09 Apr 2026 01:32:01 -0700 (PDT)
Received: from hu-kuldsing-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9b5fb22sm29741277b3a.26.2026.04.09.01.31.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 01:32:01 -0700 (PDT)
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Subject: [PATCH v2 0/2] Enable iface clock and power domain for kodiak and
 monaco ice sdhc
Date: Thu, 09 Apr 2026 14:01:49 +0530
Message-Id: <20260409-ice_emmc_clock_addition-v2-0-90bbcc057361@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPVj12kC/31QyW7DIBD9lYhzsVi8xDnlP6oIsQwNSWxiwG6ry
 P9eiCv1EvUy0hu9beaBIgQHER12DxRgcdH5MQP2tkP6LMcPwM5kjBhhLalJi50GAcOghb55fRX
 SGJeyBgPtLW81tVo2KKvvAaz7ejq/nzYcZ3UBnYrdLyPANOfItNG2EM44nrQfREm6+08IQo4mx
 13F4hPgpcYEA89taqWMhf7oY6ymWd6yaKjyKOabFSWU8qbpKl7vG8IwxSNAkJcq+tG91CkZAZe
 FS4fdnraW9twYYnpUjji7mHz4fn5roX+d/3vMQkvfTjHeKdvJ9kXf07quPzH0oiuKAQAA
X-Change-ID: 20260406-ice_emmc_clock_addition-e19f36c1fca5
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Proofpoint-ORIG-GUID: hmhJpciyJkakvvUcPfdu33QRpO1r4_rv
X-Authority-Analysis: v=2.4 cv=b7OCJNGx c=1 sm=1 tr=0 ts=69d76403 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bC-a23v3AAAA:8 a=Ob87irwTtRhQHdzo7WMA:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: hmhJpciyJkakvvUcPfdu33QRpO1r4_rv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDA3NSBTYWx0ZWRfX1NFQszKmPiwH
 kY+qeoR9OLQxrl18aaAaSsFw88YdEnjVc1FmFJNOAtQDbReIx9e6r1vQZzqneUV1SL95Slhl57g
 9yWstXm12ROFDHcezecZolGo1R7nc9U8TsNtJyFsYquo0QlKEcZgQatpo6DzbE8hnAjjK8TIRkA
 ggGGjq7Gz5+ygbaBBUbJdm4CTkLEbqp817duy4zepVZ3iJdnHPnSi+Tx1yR1/Zjqx2+CNmY3/CS
 h+jAqAZH8XerSJho0nrPINaS8D24o88qp+gEfN8b7dnCUwg5fMO6AX9PJgbwnZ7c4H0WwHx9NRc
 EHuOWNz/xJ3O/fdM1McBWi4v3lwnFeKVZXlKR1dor8zw2u8V2hj4DGqNwewhzaRl6ghjGwgr9WH
 AoB0TC5Gw98XeZTQbMJ5mtHWieueUpT+avKO3KO/Zdu9O9fkUbX7xh6BIrWEqqheRw2Cx19pZyQ
 /29O0ZKAoYvbLsCanmQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_02,2026-04-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 phishscore=0 spamscore=0 suspectscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604090075

Previously, ice used to exists jointly with ufs/mmc driver and not a
standalone driver.

With recent efforts of making ice as separate module after decoupling
from ufs driver. Update sdhc ice kodiak/moanco DT nodes to adapt power
domain and iface clock to probe successfully.

The patchset is motivation to fix ice mmc where ice ufs is fixed with
below series.
https://lore.kernel.org/linux-arm-msm/20260323-qcom_ice_power_and_clk_vote-v4-0-e36044bbdfe9@oss.qualcomm.com/T/#m5da5dd7a18318583b23ffeb42fa07ef1438042d5

Testing:
* dtbs check
* Custom monaco/kodiak device with emmc storage.

This series depends on the following prerequisite patchsets:

[1] Add explicit clock vote and enable power-domain for QCOM-ICE
    https://lore.kernel.org/linux-arm-msm/20260323-qcom_ice_power_and_clk_vote-v4-0-e36044bbdfe9@oss.qualcomm.com

[2] Enable Inline crypto engine for kodiak and monaco
    https://lore.kernel.org/lkml/20260310113557.348502-1-neeraj.soni@oss.qualcomm.com/

Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
---
Changes in v2:
- Reorder clocks entries in different lines.
- Add power-domain as it's mandatory DT property as per new bindings.
- Drop reviewed-by tags as patchset has some extra changes.
- Link to v1: https://patch.msgid.link/20260406-ice_emmc_clock_addition-v1-0-e7b237bf7a69@oss.qualcomm.com

---
Kuldeep Singh (2):
      arm64: dts: qcom: kodiak: Add iface clock and power domain for ice sdhc
      arm64: dts: qcom: monaco: Add iface clock and power domain for ice sdhc

 arch/arm64/boot/dts/qcom/kodiak.dtsi | 6 +++++-
 arch/arm64/boot/dts/qcom/monaco.dtsi | 6 +++++-
 2 files changed, 10 insertions(+), 2 deletions(-)
---
base-commit: 816f193dd0d95246f208590924dd962b192def78
change-id: 20260406-ice_emmc_clock_addition-e19f36c1fca5

Best regards,
--  
Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>

