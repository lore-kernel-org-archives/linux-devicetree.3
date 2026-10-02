Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 549CB3F23D0
	for <devicetree@vger.kernel.org>; Fri,  2 Oct 2026 10:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790938034; cv=none; b=izos3sLOn91HbdU/5zSSZB900Y+00sb2/CwJH3OSmARTPDw+zhOnXMoS18aTTQn4iWvwKCZWTuk0YnuvpZJKk4TEu0Cj96YGrq7nBDKsvbDAEPiti/6RscCqY9YhFnHtzB6xeojpJsUAkeNvp/sMxTo/okkV8mXC+RZqY88d+Nc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790938034; c=relaxed/simple;
	bh=fJuyOlM65Puw9W+i4xPVFMT6DCKmSXyYGLqjNJ8Ifc0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=MIoaupsBKG9wXPUqasApdCxQofJLj0D6bKztpyAJy9hGGRYrsgQ2plH230ljq2l+41wKwLtzygBGKy05RaoBFvp7YvE/yZTkXlfGeTt+UNB2/X++Zy+gRvCxJ9IDcBVpFueLh+Gtffvz1gY/toG9inZVaTvqseW6uRrD89xKrAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mN993v6K; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BP/gW8Kc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mN993v6K";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BP/gW8Kc"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6929nbhH1190427
	for <devicetree@vger.kernel.org>; Fri, 2 Oct 2026 10:47:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=kPlUe31+cjaI3wZHq0lO0F
	0PLbebowSPB4XnFjSdqx0=; b=mN993v6K+n1vpR7JEBc+HxKGDiV328tzGECCw3
	9AUEPQnaAlnF2XICB8BEKW2bfbhioimHsYYk9rur0cjjwzJdp67PuRKv26sAhl1m
	jq1yBQy/NreFdN6woDPoLkNnmep0x3wnlNWpUkfE2CbXG9ZjwYSh30V2ImibiHLr
	5Sfzljdf6xoS5PCKgApJATB/lrDINYV8fO94cVwO7sAyeozU+F7vXTMHx/JUu/Mu
	ZzzYvwe9zyQlZ3N4PWftLZa4q0hR2v5ig+lKZ/LFElNgIalkPRwTF/utihGQz1/N
	1ALPAK9MGR6VsCXn4QK4UCRnxyysIH+0S1CzKXrxkTyOXZ9w==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1w8tjpv7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 02 Oct 2026 10:47:10 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-34d49d8dee1so3162684eec.0
        for <devicetree@vger.kernel.org>; Fri, 02 Oct 2026 03:47:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790938030; x=1791542830; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=kPlUe31+cjaI3wZHq0lO0F0PLbebowSPB4XnFjSdqx0=;
        b=BP/gW8KcWCqflZlUnSmXG+G34aiF5qB+tTW97qV9UWUAOqvreigDtAIlaIqGIyL2xs
         rLFYijG1d+Ki4CeW4e4vjuJuF+7+use86NgpTbmNWzGshZb/tEuPMabVsD2pEpNi8slh
         U4hNowkouavz172vbEONOxxQ1YK4uDirE+tWYBLXn1hk1Y4tnbRVbKzbepddr7kuo5ZJ
         LEPLmSGadtFSxiiM2cfJ3tkM091TzbNA0orxQlhuvky21BTpElkZvKXQy44Kafe5pvk1
         lMqHNJKy42BObW4ANqV+174QlenCvQPRJV0xa5o+Jhe40UyWtOS1FliHmog4sVCXW0Yq
         JuBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790938030; x=1791542830;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kPlUe31+cjaI3wZHq0lO0F0PLbebowSPB4XnFjSdqx0=;
        b=X07jIkMD7NorXp2nY550EQ8/rlzM7f97HDbD3IWooJjNhZT0ko+DmFUEGNZGUNCUgx
         1smmQMc6p9cZS/7ezLKnVKkRYfmvkSFlUIED0/SuD6KmdevuLf/JW1pcw/eg8UW2tJbv
         eHKoDRdzmPFcv11dgstxN7eaGbT1VI/GoA8ucF9OAkEJLQtzumbEjnI0N1ARLNIQi4jU
         ju1GoD7QDHR0QBv64TuLASRLtx28kHHjZOch0de4KCC28fYJZYFT6n0y0N3G+UGoNDPK
         kUmsAtCyX2nvrOdBuDePVYj0V8H7kDWEgJuTdBhkHk6fdDVb6e3Y3N1E2nBBfVzYKW+j
         Eicg==
X-Forwarded-Encrypted: i=1; AKwUvBxEzhk1NdZpCvsldkshG21jzdd037KkU1sDstv7be4GTwoUa9Pj/PImF3wPgkQDqi8Zx+ZLWWcNCt+G@vger.kernel.org
X-Gm-Message-State: AFuF++lacryzPSeSR6fVP++t2N40/jrcvg9lS+cF4RTUIuoEeZeK40OS
	fpQ2Eq7MzrkTtwfxqR8qy+aeiozyvzO006hR9S9oOJ3wLVJWwXbLLUsSHNCLqheZYgtw4jrVwMk
	k37O6ESnsBL/5I872qd/mBgdLRezTvjeqq3lVyRAhQCr/JP8RwfmHT5ObAJ0sdVHxdACHfDaX
X-Gm-Gg: AYBFou30YwdQT6BVMMT4edL+EYUhez8Qyrem1fULQM1RdR8h8//7an2d0BElnRgaXa1
	6n3p428Pj0r4OfaoOSw/E7MuaRoU9W0z5qq5NtwA3L5oH71PjRxh0coSIpPEbRrvFLlaGAU4cyT
	vg7H5JvRz/RoqRDF3jEOHDLz0aaChnkpOWVEpEJgLrqFsrvNvIpHxVTqGFxsdUppTwT0r1D2HQU
	YAKUuKxEHt/D2e8/UfaoG5tK98I4fULe6I6fzttiJlCV4x5dfLnOWTV6F/uwwioiDpbtJccsDKN
	i4uo3AMRr+ptr/n6EnAlCUL2rIvtycYhcf7AlP9oJHUj75AllJDu2MZlJmm3I7jN6vjWmSjHJkJ
	HdSHUrg4VUYfCeGxQ5C61SujEVLvm
X-Received: by 2002:a05:701a:c909:b0:148:4d6c:2016 with SMTP id a92af1059eb24-14f5ba072bcmr2406021c88.24.1790938029528;
        Fri, 02 Oct 2026 03:47:09 -0700 (PDT)
X-Received: by 2002:a05:701a:c909:b0:148:4d6c:2016 with SMTP id a92af1059eb24-14f5ba072bcmr2405968c88.24.1790938028780;
        Fri, 02 Oct 2026 03:47:08 -0700 (PDT)
Received: from hu-gkohli-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14f45fedd43sm10645191c88.4.2026.10.02.03.47.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 03:47:07 -0700 (PDT)
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Subject: [PATCH 0/6] thermal: Add hardware-binned trip point support
Date: Fri, 02 Oct 2026 16:16:55 +0530
Message-Id: <20261002-thermal_bin-v1-0-5a29be7e8ec5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJ+Lv2oC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDS0Nz3ZKM1KLcxJz4pMw83bRU86TU5JQ0g1RDcyWgjoKi1LTMCrBp0bG
 1tQCc4ayGXQAAAA==
X-Change-ID: 20260917-thermal_bin-fe7becdf0e17
To: "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>, Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790938020; l=4331;
 i=gaurav.kohli@oss.qualcomm.com; s=20260302; h=from:subject:message-id;
 bh=fJuyOlM65Puw9W+i4xPVFMT6DCKmSXyYGLqjNJ8Ifc0=;
 b=J34gI2MrrIl9/GCmK30WCnc+dn9+ND6gC3X+ADXlOwJbYVx0dSHdhb94leGBHcHLq/iNgN5rY
 o20Hkl1q3UfCEaIthfY01TxicXLvGg3XERkadj2UR5gsMdz3pFekppa
X-Developer-Key: i=gaurav.kohli@oss.qualcomm.com; a=ed25519;
 pk=IdNsqe8rWsF6dbpGHfwPEH9zM0nbOdRH72HxUT9qPak=
X-Proofpoint-GUID: 0RJtZxZeWbT_tXPBP37f5B_Tw5Fc4h8E
X-Authority-Analysis: v=2.4 cv=ML/1C8Zl c=1 sm=1 tr=0 ts=6abf8bae cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=OGjWj8McAAAA:8 a=EUspDBNiAAAA:8 a=cnS6JDR7V26kcJ3wsKUA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22 a=UYjydHh6ynBBc6_pBLvz:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDA0MiBTYWx0ZWRfX7QXiSK89vMlA
 9zrWN/w1cyDOAekxQd7NoRZ9SwT7Pa+GxNNBChmXeIBh+Kh2SIs2C+Y/eA2IdItiWLzLfZpB6JF
 rUJqwisajEuIMS1dfzjmlB6Ci85jET+OVfVIXcUU+peAhuJmNdRmGQzPe+XyaEgkzjBSssRZXIp
 OvoknyeQQc/NgzxxU2q+CTTFrppot2UId76zPWCQCHlnX3R1Blsr3OxdN7qoEt4ryEilsaiYd4F
 J7PtJQB6AEOAdb3FLMIJjsaw8V35LACOH8EtVDZN+ThB1QcW3dyCMhJ00D5SNbKZiY8upCtidfE
 wa7U50vd8YFkW2/XYGLNFPegSmiCmHyeQFy8/EPNzylF8KnqfsgJA/A8vW8UxR/0fobi++FWOlJ
 BPM0Hq8Ev4iF9BrqG9THl7TbGJWyVcANJ+4bGeiGpq++EGU0RxGrD8IIRHziIVgyT3FGih+HGvk
 6YPdvo4xNv8TEpGwxWw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDA0MiBTYWx0ZWRfXxnxgFhdTKqFr
 uIAA5Jk+0Fg9Rra9eaF1wUef65ifwjmpDqYclwX99NOGu3A9hCrj2lsK+ZFdigJ28r2L0nWc4f1
 6I2Q9ZstYUdJGMPEPLdXdnLfw/07sQc=
X-Proofpoint-ORIG-GUID: 0RJtZxZeWbT_tXPBP37f5B_Tw5Fc4h8E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_03,2026-10-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 impostorscore=0 phishscore=0 spamscore=0
 bulkscore=0 suspectscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610020042

Some SoCs are available in multiple thermal/package bins. The silicon is
otherwise the same, but the package/bin determines which junction
temperature limits are valid for a given part. This information is
programmed in manufacturing fuses and needs to be reflected in the trip
points used by the kernel.

At the moment this is difficult to describe cleanly. Board-specific trip
overrides can handle individual cases, but they do not describe the real
hardware property: the limit is selected by SoC fuse state, not by board
identity. Duplicating thermal zones or adding vendor-specific trip
properties would also make the binding harder to share across platforms.

This series adds generic hardware-binned trip point support to the
thermal OF parser, following the same general model as the OPP
framework's opp-supported-hw property. A thermal sensor driver provides
the decoded hardware bin when registering a thermal zone, and the OF
parser uses that information to select the applicable trip data.

Two generic trip-point properties are added:

  - thermal-hw-bin:
      one or more hardware-bin mask groups for which the trip is valid

  - temperature-bin:
      per-bin trip temperatures, selected by the matching
      thermal-hw-bin group

This topic was discussed at the Linux Plumbers Conference Power and
Thermal Management microconference as "Thermal binning support". The
discussion covered how to represent SoCs whose valid junction temperature
limits depend on package/bin characteristics. The approach taken here is
to keep the DT description generic and let the platform thermal driver
provide the hardware-specific fuse decoding.

LPC discussion:
  https://lpc.events/event/19/contributions/2245/

Slides:
  https://lpc.events/event/19/contributions/2245/attachments/1885/4034/LPC2025-Thermal-Microconf-Amit-Tj-Thermal-binning.pdf

Qualcomm TSENS is added as the first user of the generic support. On
SC7280/QCM6490-class platforms, TSENS reads the jtag-id and feat-id
QFPROM cells and maps them to the thermal hardware bin. On
X1E80100-class platforms, TSENS reads the i-temp QFPROM bit. The decoded
bin is passed to the thermal OF registration path before trip points are
parsed.

The DTS patches use the new properties for the affected Kodiak and Hamoa
thermal zones. For the standard bin the passive trip remains at 95C; for
the elevated bin it is selected as 105C.

Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
---
Amit Kucheria (6):
      dt-bindings: thermal: thermal-zones: add hardware-binning trip properties
      thermal: add hardware-binning trip-point filtering support
      dt-bindings: thermal: qcom-tsens: document qcm6490 tsens
      thermal: qcom: tsens: add hardware-bin trip-point filtering
      arm64: dts: qcom: kodiak: use thermal hw-bin trips
      arm64: dts: qcom: hamoa: add thermal hw-bin support

 .../devicetree/bindings/thermal/qcom-tsens.yaml    |   8 +
 .../devicetree/bindings/thermal/thermal-zones.yaml |  53 ++++-
 .../driver-api/thermal/hardware-binning.rst        | 151 ++++++++++++
 Documentation/driver-api/thermal/index.rst         |   1 +
 MAINTAINERS                                        |   2 +
 arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts         |  66 ------
 arch/arm64/boot/dts/qcom/hamoa.dtsi                |  41 +++-
 arch/arm64/boot/dts/qcom/kodiak.dtsi               |  56 +++--
 drivers/thermal/Kconfig                            |  10 +
 drivers/thermal/Makefile                           |   1 +
 drivers/thermal/qcom/Kconfig                       |   1 +
 drivers/thermal/qcom/tsens-v2.c                    |  16 ++
 drivers/thermal/qcom/tsens.c                       | 189 ++++++++++++++-
 drivers/thermal/qcom/tsens.h                       |  29 +++
 drivers/thermal/thermal_bin.c                      | 135 +++++++++++
 drivers/thermal/thermal_core.h                     |   5 +
 drivers/thermal/thermal_of.c                       | 253 +++++++++++++++++++--
 include/linux/thermal.h                            |  77 +++++++
 18 files changed, 980 insertions(+), 114 deletions(-)
---
base-commit: 0d9d0dbf2fddcff5859d623e90ca73c4054276e1
change-id: 20260917-thermal_bin-fe7becdf0e17

Best regards,
-- 
Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>

