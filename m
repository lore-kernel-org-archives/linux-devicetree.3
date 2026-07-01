Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D24B421EE4
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 10:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782902245; cv=none; b=BQ7DTOeYR5N4vUkLVBID40A2mhlrFSXLz9bdcydPnzByWIzw7UPJd1OMigxccyKqHkZ7MPV9UBxkc15hBZC82DlYHpmyePdRvdPXvThzfDYiT1hRbxNjNxveSoYXF+mpqV9W9C2mOZ1vDeIFtndBvK5KlsoiCt2XATeQk3u8J50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782902245; c=relaxed/simple;
	bh=3eTtRbYeYc2Ucl4oM9OL99IuKEACdQbDk9OneYUz3hM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=e7M5iNHwP87Y+ojaJX57oAqRpN791EMtZO0eSJwuUtQA6IPXxdqEMOGfdbvIe6bFrkgcwWNyn0WDE4uaR98tkopjn6Vaeq5w//4547YwUrWBz6Vs79BzsIA/qGtgXrI2BBhYQGjH0Hg4zxRjyn9jsce3An7yxVmg6YdRqz/X6Dk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AzAmDLpl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cX5ugZ+5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AzAmDLpl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cX5ugZ+5"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661A8qDV744716
	for <devicetree@vger.kernel.org>; Wed, 1 Jul 2026 10:37:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=HBLQidyajdO9oG1GsqnmdD
	1EP+Zn0eFu7AAq13az6os=; b=AzAmDLplePkHG2aHzBiQkXwaXpsA4fHSoEcQyt
	Xcp8NdJew09OhYrjHM1Fk1dtn23RKC7B1e9ZHerhq6+Qcm0wtfceEGHnN8Fel8ec
	tILh15t2g1n+vMBrtNyQtrbzyubyS9UvY2zW2/3I72Z3pwPls227p3sd8qt/62zz
	XQtzjnK2PgREh3+o8e5PNj/0F01wt0sjIuEUB0YK1w7jSu4kbx47fqbI+Mkl+AwW
	KxDEErpIDDCQI7qucaBRX+FaUSBthQUHjs8022Scpo/vKXceN5AK85otNYR/C7eL
	CkBz0MiPDUVhrIo/UQfoTtxUXgI/5sdvzmB9Sh/Hy8RyAf1w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4x0th12w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 10:37:18 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e695a3b28so213598585a.1
        for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 03:37:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782902238; x=1783507038; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HBLQidyajdO9oG1GsqnmdD1EP+Zn0eFu7AAq13az6os=;
        b=cX5ugZ+5ZqJBZzADFzlO415Snhe44xSZvtLNYweoDDQjrQxbP6GmuWvijZ2n48d8nD
         MIBAyByyo+g3ppLhiVm9HxRstDF80FfL8G0sIFpXm41nBmYUa50kQPkelYvZ/MLxXZMn
         uy49e4RSOJqAYpmYzYy5x1/3ZuLEfVrbviiU0KR/UfDqhf8axFCHVZAGq1Y8wCZf7M/s
         uzb+0m4FQOG938dXgHBsuhDtv3nWGCO4HXTKsc+htDvDkGSO4VGFNgcHAogowflTIzxC
         3JV0wfPmsEpHSRL2fJ0if/glvDaqlLVnVpolyli5BxHiyi+OafcDX5/GQW5CF8zEyXkk
         nZhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782902238; x=1783507038;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HBLQidyajdO9oG1GsqnmdD1EP+Zn0eFu7AAq13az6os=;
        b=BxIWo0zFlCHd7DmKNpiPng1aZzunxB5i6X1Qz5rnsCflo9PP35Gp0gDNvBr9l2qZZ9
         u+NAqgUlrsIbhsdRwb5SKeJn22tGA95UyONMiBtiFhc+qqFZK/G24ZllPpF5FYwbWCs9
         1p3nhp1BuzXIuaiExKGGK8ieDb3A+zVyhMqZKaK3ZQ6inKcozYY5O/WDIMp66MP5CZ5v
         0Yl3oySZwB5LfgsbdqaBN9LoUJ5xHoB6KWHOY2MdNAMaw+3N7Tr2YliZzVpeBmhYL5Cc
         S1ygiAyPoDpwyY+9cjxAcY7sFm3xZeenkAgZYTQGgXPwQHvgHScxL8U9HmnzS98Jxf3y
         Hmjw==
X-Forwarded-Encrypted: i=1; AFNElJ99eTkV2XRi4iUHfqcuteqQ33MZL/agMpoRNG21/XWJ9hiGzMpOIB4BKiJimlMdlXTE57LpVgQQ4UWi@vger.kernel.org
X-Gm-Message-State: AOJu0YzNZXPspOexQscr3gbMFniecrDTJ4R4GXE++Yl85SnKZxYdQZL+
	fIWwxO6BQA3A58uLYxsGctqY7Kk4Y8z15V9hHJ3jXnC/dI1u/VQ+hrSB1iXeVGgZRGq1APpV9M+
	2AHe3Xn/H+1PQmcjPkxZzJyX6MgHhR5J8KNlKDLyPF0Q2vVPW1j5bafbhFDFXtsif
X-Gm-Gg: AfdE7cnmZlZ0zex8cxxPJ6/6PgpUexSW8CmsGmk1phc8Cr2RNuoobWcTtcPBRpjtyHc
	h3HGLUGhG43XP4j7k2oJc/5Hg80O4pUen2LdLUCq1lFcWRtBrBnDV5Qx2+Vfp4ENKGHDw8T+yfZ
	+zNCXpVNymVj3As+ikQBFj9nMqO8G3XA341+TEss779mOenx1PovF1b2IKJiAueczQN7h02hGJJ
	9JwVg5q0ragxbEtix2/VOOaLqANgughiDjxrx3+5+qVw220x4ifTOv3a5z79RmLfi92ekuOtC7J
	MJs9s5pbkSwZa+XKG64qbs3wfB8OrV/9hzICxxPVubLGXgN/M/uA5l7SAUz/3k8+YG2wF5kiy/P
	Fyl70EyBD720d0Q73kpFLqD5BZrtg7kugX0rfj83fJKE=
X-Received: by 2002:a05:620a:390a:b0:92e:68f1:db9b with SMTP id af79cd13be357-92e696e9173mr787223785a.16.1782902237883;
        Wed, 01 Jul 2026 03:37:17 -0700 (PDT)
X-Received: by 2002:a05:620a:390a:b0:92e:68f1:db9b with SMTP id af79cd13be357-92e696e9173mr787221185a.16.1782902237505;
        Wed, 01 Jul 2026 03:37:17 -0700 (PDT)
Received: from juillet.box.freepro.com ([2a05:6e02:1041:c10:cab:bdb4:a76b:614])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493be4d2bc5sm69130655e9.5.2026.07.01.03.37.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 03:37:16 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: sre@kernel.org, hansg@kernel.org, ilpo.jarvinen@linux.intel.com,
        linux@roeck-us.net, andersson@kernel.org, konradybcio@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: bryan.odonoghue@linaro.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v3 0/2] Lenovo ThinkPad T14s EC thermal monitoring and thermal zone integration
Date: Wed,  1 Jul 2026 12:37:09 +0200
Message-ID: <20260701103714.22583-1-daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: EWcNXuQNiE87dqXVqlWucH-d3D785Jcv
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDExMCBTYWx0ZWRfX/79I4zZ9XqON
 0D3xgyFU1SfY+boRmjSZdbndU6GQCjonUaCzDzrV6A86w+Th9pMxtRoXembUok1t0EUmFBshP+j
 EWCCtJgj+fS5IYDIsdN45h6+NtjZexg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDExMCBTYWx0ZWRfXz6f6LpJH3e6W
 bIC/hLPtAL/NADI0fUGcGzh14G+irKOWofeaeCNCg6YuWV6Z7CJYyzSfkd+bfd61CrFG5BvRqdu
 PwfBHJZF8FGREt7LiwV03/n/luc/YiXeKfKA5f9RNuVB9U5V9WJg8IyDfcASis9VtuEkMYjxrYm
 0MPsOfLv3Tpb+zj0qnCdNHehfxt3CM85EktEeeyRWKpjJ1euAGL4g+w00gKEGwlqSp9/H3OXBCn
 MctpRnRdjW5cUfgNS/l9vUF+g724yBTfAhUMoZ0zN0EaLIzSz4AaxYbU60eXfnOWYoHiRokeq+4
 ZYKKD76c5+MdqieTaJ392gI37uIDDF4jQQotW5148VExePZoEIAG0RTKhwE5IrKjNC3hNeaUdOO
 WOybJiGfGJ3QixJroUk3+2JUBQonoa+ZV6Uoyf6wOQnva6Ra3+3KqvBnFrf0+8GAxrd8277dclT
 WTR/VNb/OmR5XsY9Mfw==
X-Authority-Analysis: v=2.4 cv=T5+8ifKQ c=1 sm=1 tr=0 ts=6a44edde cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=Jz99LMs1rTwwAPREzXgA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: EWcNXuQNiE87dqXVqlWucH-d3D785Jcv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 bulkscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010110

Hi,

This series extends the Lenovo ThinkPad T14s embedded controller driver
with environmental monitoring capabilities and integrates the exposed
sensors into the Linux thermal framework.

The EC provides access to several platform temperature sensors
covering the SoC, keyboard area, bottom cover, charging circuitry, QTM
module and SSD. These sensors are currently used by the firmware for
thermal management but are not exposed to Linux.

The first patch adds hwmon support for the EC temperature sensors.

The second patch exposes the EC as a thermal sensor provider in the
device tree and defines thermal zones for the keyboard skin
temperature and the charging circuitry temperature. This allows the
generic thermal framework to react to EC-reported temperatures and
apply standard Linux thermal mitigation policies.

As the EC protocol is not fully decoded, the passive trip points
get/set actions are missing, so it is not possible to program a
threshold and receive an interrupt when crossed the way up or
down. Consequently, the thermal zone related to the charging circuitry
is polled every two seconds until we can set the trip points in the
EC.

This series fixes critical thermal issues happening on this platform
where a kernel compilation, or heavy workloads, lead to a system
reboot.

Tested on a Lenovo ThinkPad T14s Gen 6 (Snapdragon X Elite).

Thanks,

Daniel

---
 Changelog:
	v3:
	 - Removed event based because trip point are not yet well supported
	 - Added an empty line after variable declaration (Ilpo Järvinen)
	 - Used MILLIDEGREE_PER_DEGREE from units.h (Ilpo Järvinen)
	 - Made switch consistent (Ilpo Järvinen)
	v2:
	 - Fixed patch 1 subject prefix
	 - Removed the fan information part
	 - Added HWMON_T_ALARM
	 - Fixed DT change description to reflect what it does really

Daniel Lezcano (2):
  platform: arm64: lenovo-thinkpad-t14s-ec: Add hwmon support for
    temperatures
  arm64: dts: qcom: x1e78100-t14s: Add thermal zones for keyboard skin
    and charging sensors

 .../qcom/x1e78100-lenovo-thinkpad-t14s.dtsi   |  68 ++++++++-
 drivers/platform/arm64/lenovo-thinkpad-t14s.c | 130 ++++++++++++++++++
 2 files changed, 197 insertions(+), 1 deletion(-)

-- 
2.53.0

