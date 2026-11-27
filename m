Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795754298;
	b=EriMhxg7NiI55zpVEoNaIPBjRY1kzS+F4uiyKHu4y0fVhtS58oNvh1P1tUtmUB8ByYGF
	 HAE6u183zfl0mslUt9KK0QgkuashNTYc7x6oOI6x9d+ZXfGE+Twr/KeqkbMpC//58jUEZ
	 45xs4Nt1MJ1ZrDEYB0M78NvfjV+HRJfrYMW+XOLX/U3+nDYgSrSaBlFYC3RvervFgO3ud
	 y7q6vPz+GssT3vzH3lX6mWG63AT3HMY9fyV/lrVV4Qll+ScrS/qLqryhD8YDJh74vXkD/
	 ETMXkO3LOQyfv168XCK4rcWve6q/0nGj/vXdNJ8byyorNEsQlZ6buUWEvqIPy6VfegA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795754298;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=zruFEoiNJ3GuzEfyp/ypWlfjDaFrN4ac00vaFpQJwKE=;
	b=q39Q0oR/QSak3AYPAvoi04nxPz5UutTvcAigD32A2dq+xeNKhOEMOss09MYp6hDmeKjG
	 jmTn8NKKrBzK7teGOSAnbNhYojxt3lJhUdqDhfENgkSuvsn85kAp9zqEzypWRuERmb/Ai
	 Mh5BOIXw7aKKpOAcpMqcOws9eJBDF6zg5kCpoyGsnsoJbvHjcj+uk0MoThC09NYXSzbHN
	 XklTRYGc9Bd1BzgO7CY6+7J/6G5LCEmbr0uXFnGI96yigyjYBxG3Y1giHBEZIaImRJnGZ
	 YbeyzP7IXgTTRMaP8NZegOSavZQt7jX99hI2s+sx/K2eiISM+qXO8ZP/NWnh87tdQMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UDo7MjyA;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=a0kQvYr5;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49EBC606A31C
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 04:38:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49EBC606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UDo7MjyA;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=a0kQvYr5
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQJw8hF2354103
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 04:38:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=zruFEoiNJ3GuzEfyp/ypWl
	fjDaFrN4ac00vaFpQJwKE=; b=UDo7MjyANg+EiJFW1Bf+Gjmjzabn6oWxCgFvm2
	1BNktCB0m9EeGW/3TMp3juN+6ggyoEgegX9mYQps03j5KiOHL7q+sBzF2pue1jG/
	GzuunnXCJ9WHc8ZX7Moq4wow/6mVt8IH8Kr4VfRaMERSSLmcBQp+isJQbgWSx04m
	vsDh2DoC4KsH2+q1kRoD1DqSFKyW37ZGL9X1+r4SB81gRHHJIKMB68qSwcaAB4Yd
	9FpY2am6Cl3GNPAWcq3ODDmIu/W/L82HGoLog/LqxgI9HEpVoejB+hWSeWy16cLQ
	BR1vDq0vm4elQGR3IAborTbPTPyxeokgSNo27txsbSU2PS5Q==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6fw7usky-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 04:38:16 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc7361c62b9so4770773a12.3
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 20:38:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795754296; x=1796359096; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=zruFEoiNJ3GuzEfyp/ypWlfjDaFrN4ac00vaFpQJwKE=;
        b=a0kQvYr5s59Pid2k1L7ejJpJMkJ8j+Q1YUh9CrR5J3uussMNbgdoKbHPQWiL3xSGS/
         h/wDNnKTIBwaYZ8ACxw+hb6R7ZOnkOXRbf6muqEhmgjaNYvVd2SY/ccM6IXrnhECOtjU
         8Uan9oCyb3LjEAkcsX35L3LagLte5OiWLd6s92Ta42LIqqc7Bq0YGZWabKnwQkUGbGuP
         6IJa3tawttyO5M9nM7exLyaVo5t/W+yCg7p1JHoseAlEPUhsD55ytMcOcdE41Qi75UTI
         /QOYSVTOyTmUk/pDVm1Egf/hO31z5ON9tSRttUI4HXn295XFjNM7fZcER/bZW5jO3RzU
         WBIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795754296; x=1796359096;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=zruFEoiNJ3GuzEfyp/ypWlfjDaFrN4ac00vaFpQJwKE=;
        b=mqvnI/FYd7+ANuM/yiWYx78BDTniSAEZD37ekp3I8qLgDzydtVYuHkoTHb8tAHGqTC
         jRr6tXTgI0hsNSY1WF7GT53w+A148nqV8SwvTKChcj4tHeL9kWpS2I0uP0fCpVdsQGMA
         kyw+n0VSDM49oOHHOYscAzkj8YTpsAWDN/mreNMP9FwzV1wKXJkkjYGLBC99S2ECak//
         hzNiviRuKSifo+q5Ex5Q3/F/4HXDANrdEMcMPZtOOtiw1aMkiARiUCgArbLBaUwXKKGX
         ZbArTZdZD9n8Trj+ct6R2UhtEiCjMEl7OgGojavt3+sAS3kHJoERHlyGKp978kePeLBU
         NVyg==
X-Forwarded-Encrypted: i=1; AL+hErEQ+OEQnC3W4+S6oKWxlBJQu+9sKSzxlXt5l4rnxKtou12b0b4PPvR7Q+M7YqRc/ARXEKcK0E4o9Acy@vger.kernel.org
X-Gm-Message-State: APuU4Z/sdaSO4+1ibs7VdsTvzfEqv/0huCM8Tv2P803aurKZKDp1Nq2T
	+z5fVmwpAyNStlR+pKTwuljfNL6be6tDzhaoRgAnUqUIIt+9tbokgQHMrCyiBxqotAdhBrAOMqc
	8MgNsSLT1L56kdTYd26Wg2OXD9M1AEcPyju3hEWesc7+9eVE6QO80xHb8+KRkW6fD38bFXoCeD1
	o=
X-Gm-Gg: AZFdTZciuTJoG7nmZzkQppXVbatygWqA32H60NcPRGOrmMbejvLv2WixoxNr6k46x8T
	GiS/Bbek9qjGGg9cam0gCdWT2ru4a6fS0OUmaCfOc6I5R3vLeHYqdUvHItHuikvdUXZ7rwqkNQ4
	9oBH06zFefpd/s82TvyTMaY01pv9XcpeAaaTMpQn+fyFdE5qAYYk/W7yeveM2JRfAwIpwt22Zn7
	rrtZwssofg8Ukh/qZWC6fjyg1lkO9dFpmyhz+1fUBWJ5EpS6XwWUr+aiHKX1qgV65au2gjko9x/
	TjMhxPK/HohXcP/UWLs35CizZ2iByzvTSFEoetwSX5BKSupEEl4xcOD7vByi2lkYlkVyW10gRbI
	g3tOSIfcJGsQawjBTl6MdniWTFcBZILcL0E5lWaAw0wRY8mNCEZ5j0ethH+2ufUkc+rdriMmQ28
	5WMRMZJsrBulVvt8IKwOc1QbHkuREX2Ug9siA=
X-Received: by 2002:a17:90a:d2cf:b0:3b4:12a9:2dc with SMTP id 98e67ed59e1d1-3b41c7abf82mr23232687a91.8.1795754295885;
        Thu, 26 Nov 2026 20:38:15 -0800 (PST)
X-Received: by 2002:a17:90a:d2cf:b0:3b4:12a9:2dc with SMTP id 98e67ed59e1d1-3b41c7abf82mr23232660a91.8.1795754295367;
        Thu, 26 Nov 2026 20:38:15 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad0b52dsm38823918a91.5.2026.11.26.20.38.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 20:38:14 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Subject: [PATCH v3 0/4] Add ETM devices for multiple QCOM platforms
Date: Fri, 27 Nov 2026 12:37:33 +0800
Message-Id: <20261127-add-etm-devices-for-multiple-qcom-platforms-v3-0-0037736dfbc1@qti.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAA4JCWsC/53NwQ6CMAwG4FcxO1vCCgJ68j2Mh7kVWcIcbJNoC
 O9u5eDBm6ZJk/9P028WkYKlKA6bWQSabLT+xqHYboTu1O1KYA1ngTlW+R4RlDFAyYHhY00RWh/
 A3ftkh55g1N7B0KvErYugZbW7SF2WTd4K/jgEau1j1U5nzp2NyYfnik/y3f7nTBJy0KgaXSDuF
 NLRx5iNd9Xznct4iTc34YeQEuvfCGSiRFPWPKqq1XFM9otYluUF9obWM1ABAAA=
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795754291; l=2805;
 i=jiegan@qti.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=xFoegEccIlKkJmI+DgYv4nERYcIkMTUSJmA6gRGUL+8=;
 b=NxNoWvummqN+tTCi54wXDHtcESAER+LQrXe1P8oUw4QrrPVGatcSRcgmAwLHHDcL6XOe/9GtK
 HJY0slN4q/9DeQ+rtmyz/rN0leeUWLGv+JR/zJquyQNBMaXQEc3OZVx
X-Developer-Key: i=jiegan@qti.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDAxOCBTYWx0ZWRfX4qFoms/OzsXX
 +asvNhY/lhxd5YbGn6AKjHnfthXaz5Sn2PQxE8Dv1TFFJV/SoMPjMxMdmmvo+nv9OHYPq50/39P
 Y++oEPV8LR8JapSXhjzNhG+MV7e1VrY=
X-Proofpoint-GUID: mwdzZqe4UET2KkUGFfcMrTldUQG3tUUq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDAxOCBTYWx0ZWRfX4CYm/UTQfS1Y
 v+woETcYvALv1End+YWcxWQYr+BuLCtlcUsWMav+YtXEWua4qVUm/EcMlUZfPTcFW12JL8neAG7
 hSRqz01EZcEZJ/LH26PbEn4WCOurhJy2D3VQT7ewYvhzTu04A1we6+2XWfQlaSxO6bl9g5t0s1k
 vE8QDegECuvId46Lx6Dg+ayhR6u5lWnUqtMcpMBJHdDCtyZx8Q66gVizOjb53SgGOtwEn5BMXpH
 1pNeqbDAp7a08Co/SRsHhc2yW3Y7QGQB2o8BBCCxFnM14u990Soq1dmTqbHO53mFXvmz52hvSWe
 XWVTboVH+BG4Vn4r911LpK8dk4QEcxcsOdDs9z27t1qbWP2rwqEWhZL+5VenzsW0t3XXUMuqjIF
 mDCS7breIPoUjIOviLl3xw8tyGjulzsHaaXSYTVwRVMBS46pctYWyLlQH/nk+BN5G1nW4E8Yx9X
 sfPslI2K+sayP7//FwA==
X-Proofpoint-ORIG-GUID: mwdzZqe4UET2KkUGFfcMrTldUQG3tUUq
X-Authority-Analysis: v=2.4 cv=ePeGH3p1 c=1 sm=1 tr=0 ts=6b090938 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=feMje1RGGvs939tdko8A:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_05,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 malwarescore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611270018

This series adds CoreSight nodes for the APSS debug block on multiple
QCOM platform, covering ETM, replicator, funnel and TMC ETF devices,
to enable ETM trace on the CPU cores.

The replicator, funnel and TMC ETF nodes in this block sit on the CPU
cluster power rail rather than on a dedicated always-on rail, so they
need a power-domains property pointing at the corresponding CPU cluster
genpd. Exercising this property correctly depends on one related fix
that is in flight:

- coresight: handle runtime PM resume failures
  https://lore.kernel.org/all/20261116-b4-coresight-runtime-pm-failures-v2-1-cc437170e24e@qti.qualcomm.com/
  Without this fix, CoreSight ignores runtime PM resume errors and
  continues to access registers on an unpowered device, which is
  exactly what can happen while a CPU PM domain is being woken up.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
Changes in v3:
- glymur: fix the order of the node funnel@12080000
- Link to v2: https://lore.kernel.org/r/20261127-add-etm-devices-for-multiple-qcom-platforms-v2-0-42d47474a67a@qti.qualcomm.com

Changes in v2:
- Rebased on next-20261126.
- kaanapali: use cluster0_pd/cluster1_pd following the cluster power
  domain split (Konrad).
- kaanapali: drop the planned qcom,skip-power-up for ETE nodes; the ETE
  binding does not allow it and the driver already skips the power-up
  check for system-register based trace units.
- purwa/mahua: delete the whole APSS funnel port@2 rather than only its
  endpoint, avoiding an empty port node.
- glymur: also delete the cluster0 ETM/CoreSight nodes on Kalambo, which
  is derived from Mahua without the first CPU cluster.
- Link to v1: https://lore.kernel.org/r/20260922-add-etm-devices-for-multiple-qcom-platforms-v1-0-c2a8c3225a2e@oss.qualcomm.com

---
Jie Gan (4):
      arm64: dts: qcom: hamoa: Add CoreSight nodes for APSS debug block
      arm64: dts: qcom: sm8750: Add CoreSight nodes for APSS debug block
      arm64: dts: qcom: kaanapali: Add CoreSight nodes for APSS debug block
      arm64: dts: qcom: glymur: Add CoreSight nodes for APSS debug block

 arch/arm64/boot/dts/qcom/glymur.dtsi    | 1184 +++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/hamoa.dtsi     |  884 +++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/kaanapali.dtsi |  567 +++++++++++++++
 arch/arm64/boot/dts/qcom/kalambo.dtsi   |   16 +
 arch/arm64/boot/dts/qcom/mahua.dtsi     |   16 +
 arch/arm64/boot/dts/qcom/purwa.dtsi     |   12 +
 arch/arm64/boot/dts/qcom/sm8750.dtsi    |  599 ++++++++++++++++
 7 files changed, 3278 insertions(+)
---
base-commit: a9c48428cbd8d96b26f92631d0db6f8519c5fcc5
change-id: 20260922-add-etm-devices-for-multiple-qcom-platforms-c165b1c4480f

Best regards,
-- 
Jie Gan <jiegan@qti.qualcomm.com>

