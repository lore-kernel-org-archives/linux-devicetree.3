Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06A9436894B
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 03:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774581650; cv=none; b=dl3eqMTl2gi9R+f8EQ0PmkzLUXGG52GZbf/DoBCyrU4dm3LlVG3PpImFnwIhMeaq7zA9aYzzI61Bp/3Xv+EPEQurTlEB2hd0+XBzSyxY8HqZefYV9y9+NL4NiUtWPoutuPC5wL3FX+JiB71k5iPrXGzqgbI+dsO24Xds+gX679o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774581650; c=relaxed/simple;
	bh=0hDwDa0muC7+F5H7+OLySCMR7kBL9kPfSS38DbXtQZw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=FrFjQmXnLLGjSSN+s6sJXfOWHIQgLTljdjfKb6PNbN9Nxi1O9+CA4Uz6yP2CsPpWyQCfZ81WG644phFbQ+UsafrfLUOR+bZnDzOi/9GhLB/nmJ6/o9WsCkjRwfxQdPysskEjcWfkDTNZVOLJtsfFanhSgl0rDvQrelnOBJWzn98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CzmlyuEu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E5Xa6Rty; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CzmlyuEu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E5Xa6Rty"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62R0t7fs334749
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 03:20:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=3ei+KjH0NI9RIPv6VzP14r
	QbSQ11RRu2+cMTivoU2Qo=; b=CzmlyuEuBupQ0m7qtgGQawtlgW0rBy8I4IM7f7
	++9lTr7FJ8LJPyKyGPwwYXYOknN7e190sVQU9AQ+KkOUUtRUyc6QuJe5LYqd4iG/
	ISpMeNyomvP58zhQ5Q1nuwpkLyd+WrsaUz/s3YkoRo1Vw3qi8ufrRu96YYf88OF6
	k1ZwxB118Y/KRc2jn9QeE9FdihQiLGXHYP0F0ljNzlMMo3geh3Tfo6hmNfckqa3a
	+ia6i7mGpOdU+VQBIf6MPfOmJm+ikQXb2uIOeH4yOCLp3u4xHrfYxDpLP7m8zx3R
	dz3wO7YFy7D845/C1LBiYnCunMFUrodqc8ItuGldHtI7gSWQ==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d527yubjm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 03:20:46 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-126e8ee6227so1769046c88.0
        for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 20:20:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774581646; x=1775186446; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3ei+KjH0NI9RIPv6VzP14rQbSQ11RRu2+cMTivoU2Qo=;
        b=E5Xa6RtyRrp7yN0ff2tojh7mhhg5YjMzMynqP/0isCOjpBfwSJS5zL5Caxr1NQ9Dky
         c2DEVVU79fEen4GOKf4Gxdl3/QMEAdi7WnJoZqXStg0mLSFmHdPKuGyqNtDTCTSGmXvJ
         5AMFuQCQ+cwcbIACKlKUuvZecZrBvWNyfn9AVJCBWapcc11+Htf08TKh/ROwD+zQgq+A
         iTNRLt8imKX9YFenPg3RMTnImrfCeRa/ISvqNON7oavDzVn9Lu3D/EVkSvq0Kf+qT+Wu
         8yw81+nUGzTOd2/LYMDpzcO2H0vPnUGUuehI0XDb62SCXCk1IP24Nx2uggcXRWRUmbJN
         w1Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774581646; x=1775186446;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3ei+KjH0NI9RIPv6VzP14rQbSQ11RRu2+cMTivoU2Qo=;
        b=pu9s/oavFq4wO+MT3PUFZn0BRO//ifbUBAnllXWmRoVeIAxcimfy17DejYM2IScxph
         y4BHM4ELLCHgABJA6NDm9gUH8YHWNJkrpvE7A/wO4Mzhmg+r1XlYesWmMYKcAp6ARZss
         BRtaQ7liCHwGNHdH+AcqpM0L1YlPIUxEHys3z9OJszgmJIIjw0dNcF2+OBeAjb4Al4uY
         1cF+DbGJC19Om+Y9vdl5YIgpgQw+4NcipvoMGhT+t5jZluDqtHVtKcTecHE7fJDNx1cz
         A5mghxBqhY2DnGsiHEW0KGNenDybEyWTrwC21771F+KIWYNctHu6dWWfzEQrZC2XShN4
         5Wlw==
X-Forwarded-Encrypted: i=1; AJvYcCWVcbvblFpo19eaMajwLeCwcwBAt2kjZ5cIYOhr+ZG4LFmAlsF5itY4s1iqRRitWi7d4S8oMzVbL3NI@vger.kernel.org
X-Gm-Message-State: AOJu0YwQ/bRo3XEsIGyeZu8ROJ2jOA7awdNXMQJNPNp4h4Gt7NddpXnH
	kcUBMTgPWbgmzWtPcp6LxoB7QLQqcIJGEoxUXwr0Ij3awNmO31WFFT32e6deCtk0vv+nXqjKqNG
	Oe5juGTlB5XoHQwopFW0SHaJBnAg3nkgjM2IV86Ovxpck4DsyebPlqqsJf9LGUuSo
X-Gm-Gg: ATEYQzznR2Su4W/6EVxsEHv7ilUoAZYn6bRW3JOf5h2V/EX7xalkE18/++H7Erqsp4l
	PahY5eD8FgyQh/539JJHjPq8iy0n1iWLqPmzqwPY6nAAICqkyMwc2rOgjaunApMvicfTsScUClw
	0cxUAlsoCiCfsHcnnJIr7h8ufPyAtjM9frSdXzDQYylI0fv+d2PDdYUKETv7vX4cN0NpeNqMc4T
	w4zs3KaqH4B8/hmp9SiqzD5w5tyReG2rX98YYH59/QcQqd0eGDFORtgIIeZHvG3bVYYDiQ1+83n
	lKgFQQibDIvvOTDWtfeC4ZZ0qs85zDwo0pqffiTwAR1a253td6V2LCRt5gUovYnfZE9e2Hg9b4i
	SsvJMADl4QYETHZzDeGPxUarRWE20oP7dfgoTT+drJ/7JkOM2bvmOJ5iQq2yi1RCBiq+eDPwm
X-Received: by 2002:a05:7022:2387:b0:12a:6a64:81d9 with SMTP id a92af1059eb24-12ab287d6d8mr496358c88.13.1774581645833;
        Thu, 26 Mar 2026 20:20:45 -0700 (PDT)
X-Received: by 2002:a05:7022:2387:b0:12a:6a64:81d9 with SMTP id a92af1059eb24-12ab287d6d8mr496345c88.13.1774581645271;
        Thu, 26 Mar 2026 20:20:45 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c16edde435sm4361337eec.25.2026.03.26.20.20.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 20:20:44 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Subject: [PATCH 0/3] arm64: dts: qcom: kaanapali: Add SoCCP
Date: Thu, 26 Mar 2026 20:20:27 -0700
Message-Id: <20260326-knp-soccp-dt-v1-0-a60c2ae36e9b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHz3xWkC/02O26rCMBBFf6XMs5FJ0yZpkcP5j4MPSTpq0N4yV
 Q6I/268gS8Da9iz11yBKUViaIsrJLpEjuOQQa4KCAc37EnELjOUWGpUpRbHYRI8hjCJbhFWoik
 7qbz2FvLJlGgX/591f9vM3jEJn9wQDo+SXFC/Y4nmc5Ytryz0xOyesrbYvFwSv1yXSqBA18ja1
 IRk6HdkXs9ndwpj36/z+IGP77GJS1to7V1lsTE2kGqQtJJkDXpToVMValKU/0YJ29vtDsWb7BM
 IAQAA
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        20260310-knp-soccp-v4-0-0a91575e0e7e@oss.qualcomm.com
X-Mailer: b4 0.15-dev-3d134
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774581644; l=1668;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=0hDwDa0muC7+F5H7+OLySCMR7kBL9kPfSS38DbXtQZw=;
 b=HyrowZm4NibMKaLD7BhLF3RDWp6FrWc9QkbPwrQ0i2c4BzVpXUJhS948myiMBE6tRqItWyMV8
 WAbuE04SY9LA+R2Z4cOMl6DvgpYL/Ojs7shasuJWu5v+DxrCBd6sUtd
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Authority-Analysis: v=2.4 cv=dLurWeZb c=1 sm=1 tr=0 ts=69c5f78e cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=gDCzmgwdFpW75tfrGPoA:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-ORIG-GUID: ZN4tLos00RdMnkkOMElXkSrEV51SjXJP
X-Proofpoint-GUID: ZN4tLos00RdMnkkOMElXkSrEV51SjXJP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDAyNCBTYWx0ZWRfX4kBKn4qLJrCI
 CN3PZwwWFBwmdbfs9Klb9+Ei4tGMA3JP0xGK4ixf9TyQZDeqgeZt8kdJ533kr26aMwyj66+wD4F
 9cZyJ9HI4uehOhTpnZhxLS5avRkTVBJes5+bxkQPav8+HbO5xaSCsNS6l6FtlrFDMd/UWG6Dkgv
 2bjUYc2MrendQla4IKqetYRMpPgnj3KV82TmJUx8NtgKopJIVYDg3Ew2Yc5Gpg7sTO+QGVbH34R
 SlR0lmdiWwdaWMKBg1+Y2ZCkmnhlEWay4TA4sxOf/H3OqU1LmHSPNGgsNpv1sCPGXxlivB7Plot
 YAhuFlGVcDVgdgt6dGxWWHfUgmF7q3WIdu4pBhah+i/fBfJCfBSg8aSDXUHDg7zQapWMl9zYRlk
 BzodyBQWaLdYYbjK5/jVpsUDvXnsY4znhjO7etjyx7OJlPgiqQHsPN8VrN35oH6Q3yqJY+7E2LQ
 M9To6vMMm0wTqUuuGxw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 spamscore=0 priorityscore=1501 bulkscore=0
 phishscore=0 impostorscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270024

Add device tree support for SoCCP on Kaanapali platform. The SoC Control
Processor (SoCCP) is small RISC-V MCU that controls USB Type-C, battery
charging and various other functions on Qualcomm SoCs. On Kaanapali,
SoCCP is brought up by bootloader, so the status is set "okay" in the
dtsi patch.

dependency: https://lore.kernel.org/all/20260310-knp-soccp-v4-0-0a91575e0e7e@oss.qualcomm.com/
This series is not ready for apply as the driver above is in discussion.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
Jingyi Wang (3):
      arm64: dts: qcom: kaanapali: Add SoCCP for Kaanapali SoC
      arm64: dts: qcom: kaanapali-qrd: Add SoCCP node
      arm64: dts: qcom: kaanapali-mtp: Add SoCCP node

 arch/arm64/boot/dts/qcom/kaanapali-mtp.dts |  5 +++
 arch/arm64/boot/dts/qcom/kaanapali-qrd.dts |  5 +++
 arch/arm64/boot/dts/qcom/kaanapali.dtsi    | 72 ++++++++++++++++++++++++++++++
 3 files changed, 82 insertions(+)
---
base-commit: 66ba480978ce390e631e870b740a3406e3eb6b01
change-id: 20260326-knp-soccp-dt-81072d13b6b8
prerequisite-message-id: <20260310-knp-soccp-v4-0-0a91575e0e7e@oss.qualcomm.com>
prerequisite-patch-id: aaeb6c626609d672f3e61ef18b67961df38df48b
prerequisite-patch-id: 2a977d1876fdee9c930ac5f3ff7ff6f421b025e9
prerequisite-patch-id: d81fa4b09d7c2bcb22105fb24a79ab230081c859
prerequisite-patch-id: 0ec17b780f2efde54dabeb3588c6206d5c61fd64
prerequisite-patch-id: c9d6929e04a192ff2197ae531643fd02420c4443
prerequisite-patch-id: b138f14598e1cbc8e0c9a3058ed227283d6c6b26
prerequisite-patch-id: 8459bcae98ac156f6576657fe9233badcd385218

Best regards,
-- 
Jingyi Wang <jingyi.wang@oss.qualcomm.com>

