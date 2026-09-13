Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 358F937DE8B
	for <devicetree@vger.kernel.org>; Sun, 13 Sep 2026 20:18:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789330731; cv=none; b=sAxhrsVznQnD9RjYewdceb3FtIFyERhx0DaT4miz8yzGRLk923yWnYel91ZHExqZzYXzWuZXJxQ8E4CxJZa6M7i/A8oWaWlxlZ/rZlRSoXAiUDkH+e6zJmXGQiQ8oJNmMHwSrJchtwOtf2apI11NSsr9e/1L/HK0zfnHmOGz9Zg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789330731; c=relaxed/simple;
	bh=c4wTHslrndNVpK5kjYJnzg6/X7lZc1ElumlIUbFLiSw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=laS7hYH2dkP0hTrWc08UhXDd7f8gmh9RhaC9QrEsWSQwoI+EiUqEJL5tMZwQimP7Hoh4CTgTm7nW4BndJHzI0vuW7qJ5XQ4FbAdARMbmOTfZJZ3cEGw1OZHre0Q0DEF3t+64CwS+3eXU8PxMi2BQcmx8GCvXIk2rjEGaSkab8AA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LHfBJyxj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YUwmxCob; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LHfBJyxj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YUwmxCob"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68DJxb1P2631398
	for <devicetree@vger.kernel.org>; Sun, 13 Sep 2026 20:18:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=1QPVushJ6JeDYkDdFRtdAlcR9wpX8yx6bam
	U+HGQUsw=; b=LHfBJyxj7lCJ3xfHc9Y5znKfFxLG/iTbIh6TpbKJQZv0NFIcBo0
	La4SmCrHMksiBwImlJO5ZjnBsaAQom0JcVsWThYEUEWHb6Ojt+aXIHVDFmLNkyUU
	93CpoQa56PuCMyqcu1eMimvU87YtYGrPROt0/wb+JtXlnKafJ48wPURF2ikWh8bL
	lHKmG89cp8yHOLII8SNoJiiN/pqaOWtoB9EjQs3A7eHRmNKwEzDo0+p+GRrOz4lp
	iNAnBxnVwxIt1e3bWMlVbTfu8Lqi/LSnW9eA37at5bXtzN+mv6KTXoGWdeM67Wqf
	lCXXz/8US7dW832vMsUkg4JCLqoxh/GkBkg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9c42yc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 13 Sep 2026 20:18:47 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-939062ecda9so409291285a.1
        for <devicetree@vger.kernel.org>; Sun, 13 Sep 2026 13:18:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789330727; x=1789935527; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1QPVushJ6JeDYkDdFRtdAlcR9wpX8yx6bamU+HGQUsw=;
        b=YUwmxCobMC0qV2zb4oKCexAOyo3kBJah242eeRLROjZVsLwohgLUcVievZnjtgWQdE
         3/t5Cf7J1/sfrwT+9o6jTKhu4XNX9gmrPSl/Ry4gECFEXqcEPjmeX3EU8zgLJIx7Oa9w
         hFSjG2FxV3kcXy5ICpip9GDOousG4x4TC5MH9ojqGnJ1fL12DqCyjuBVgmM+1033D94F
         nLI4L1S9uZ8BavoyBT5okk2iObqbpWAU/krdyDe8eHvTA9WNwkTX3oG55IwMBKvkeqh1
         waq34N7GqTy6Ug9sbJXEHFziKUEB8aisrUytELdR/vkfcbOOQ8XnAU4DgaUupTYjxZfV
         28Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789330727; x=1789935527;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1QPVushJ6JeDYkDdFRtdAlcR9wpX8yx6bamU+HGQUsw=;
        b=gzr2/k5o23rs//wLDO/2Pr5tkMfcz8zrfX6xrMtyl7BBr6lDOpOwmgiZ3oMjvcu+kw
         IT8bXZWuNA+rRxlqYjn53XzqEgs9yF8dNzqOOJ6NyJfZRTg5NibF9TP3J8Xwpc0Cs/a5
         RoAmQIv7pTSIYfUsA/TLGMmcdgItGd+ggkjvlC4VZwPrX21FKB4bHbbgtL1tgDwnJZ1E
         0hUoROTCq3cWlRq0+SeTTykFbplw/XEdncGOBYsCBT4Dgl41p0jIfEzBvaM9BeSM/n0Q
         rdqn5X+EEvhVJg+IH5SnEuQ3cp6WjLS4y7FVEnu8WAvko23abnpm3nDiObTENEYbCcMc
         AXxw==
X-Forwarded-Encrypted: i=1; AKwUvBye4bsakZ1n7UHXTBHGzOUK0Xj3V79mlFzqcl9UXl6g3O9yOdOwellFuOfZnw8mDqzzEVYGxn8c6Jh0@vger.kernel.org
X-Gm-Message-State: AFuF++lux3VMJLiY4CsI6e5H4F7ExV4muTDtCEMW4Gomj/5h06Su/GNi
	VtThsGWfENoMyiu3VQjJYcjCDpnYAZpmp3Nb81Ncapo/cT0U62c3V6e/WertbNLhMce4JTRWHzb
	6DVNh3GrWzJMkmBmQ+K11reS0R4prCxGtGMjtno6OTmlCJx25I6WaHnr35MZPvPlM
X-Gm-Gg: AYBFou2gPaKTd+UHIlNSb/Ic7TnUXgkqHK8RVj4/1gnjnAErCqpXQHFwAYVHctO69yv
	CT27NK2wqiKJrWJwx8/O+u/wbrvZ4CdFtdyz5ZueuMsqab/05tU1/0CNLAlhT8MKclxAc/xCgJX
	787ZOx1ynlY9Ys57DbZZYpHs6UYnIiQJLAqeSg5L8hyJAk+NEJsst5WLCwtzc27BBEs9CbPsa02
	2NFXdQCGwCi20Eh0Mor/SrOlAyjYzVa0s6Po/qb4iWG+6jBh7AUwH+wlo8wXqnaTlHZAjCwadqW
	0SczXp+pVTj/FRKeZaVb0oC6AyLaBhWZ5FiPS2t9unNZgl13QImQvTnMhYCL1J1Nhs9Y8c95ENl
	B4lbXonJ15HUtLA==
X-Received: by 2002:a05:620a:472b:b0:92e:745c:6c5a with SMTP id af79cd13be357-939ea09214amr2042405885a.14.1789330727176;
        Sun, 13 Sep 2026 13:18:47 -0700 (PDT)
X-Received: by 2002:a05:620a:472b:b0:92e:745c:6c5a with SMTP id af79cd13be357-939ea09214amr2042400685a.14.1789330726641;
        Sun, 13 Sep 2026 13:18:46 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb32d3c7sm20143821f8f.10.2026.09.13.13.18.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 13:18:45 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Douglas Anderson <dianders@chromium.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        mpearson-lenovo@squebb.ca, abel.vesa@oss.qualcomm.com,
        sibi.sankar@oss.qualcomm.com,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 0/4] arm64: dts: qcom: Add Lenovo ThinkPad T14s Gen 7
Date: Sun, 13 Sep 2026 21:18:31 +0100
Message-ID: <20260913201835.250085-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: co8EAcFSGHfHWzL6niJiKXXXJCDpBSZE
X-Proofpoint-GUID: co8EAcFSGHfHWzL6niJiKXXXJCDpBSZE
X-Authority-Analysis: v=2.4 cv=c5Y+0h9l c=1 sm=1 tr=0 ts=6aa70527 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=NEAV23lmAAAA:8
 a=8k6WQxmsAAAA:8 a=AzqT7FCsPe08lIGMPrUA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEzMDI4OCBTYWx0ZWRfXwj0dn4EyVnQy
 /BF/eC6fC/0eZwl/e7id/0ZO248DZk1PP1VFRpTcAMSmAMV1JlhHLBxJeNTdxkEEf+N4pvDellp
 tUQbjtwKvCflzw3kPSsECOKLyXcUn7sIA0KNWhRTH6PrzRX+q0uxRvdE8bPwA4/DK7epfwWeUSV
 jS9asx0PSSBkIbQlY/RgHJ5jRLkCFuczYUylXkft+enYxGxWp92Od39UD39CQR1nmFtIs5I8qmB
 DBhK8ICpuuB5hkcAXhGE3osqIfcGSjA0dZwN2gyu9sETJaXYi9cM9x4oaVWs3hwhd644LmDhJgT
 09wmnZdzQOYONFtsaPvx1tPZ6yZae25vz01E742RJ8m/jDJ0NEdFKgHRYV60DD35eTP9uSCXJo7
 GgKIKWtpHT/cCpQDox/gnX1hELb/jLFLiIl+HR9ehiDLQIzkuVF9FeMF4V+9e0znBhfuSEtDwMG
 VM5RP9fjLdZMvxoRMig==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEzMDI4OCBTYWx0ZWRfXzt7omAdjIhKx
 x0I78gQyysH/mycVhPitzuTLUumFDLgW37rHcspUq94DAK2VayA4TC3GcASqWIpqb97XPXDnQyU
 LCLXU+x+mrTrl3qus0poaqoKpMvfY8Q=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-13_07,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609130288

Add device tree support for the Lenovo ThinkPad T14s Gen 7 [1], a Mahua
(Snapdragon X2 Elite) laptop, together with the drm/panel-edp entry
for its internal panel and a QSEECOM allowlist entry.

Tested on the platform:
  - Display (internal eDP and external DP on both USB-C ports)
  - USB-C data + charging on both ports
  - Wi-Fi (WCN7850) and Bluetooth
  - NVMe on PCIe5
  - HID-I2C touchpad, keyboard, TrackPoint, lid switch
  - Audio playback (2x WSA8845 speakers) and capture (DMICs)
  - ADSP / CDSP / SoCCP

Not tested / out of scope:
  - WWAN (wiring included but no SKU with the modem to test)
  - GPU / GMU (kept out of scope for this bring-up)

my working tree is: https://github.com/Srinivas-Kandagatla/linux/tree/upstream/t14s-Gen7
alsa ucm is in : https://github.com/Srinivas-Kandagatla/alsa-ucm-conf/tree/t14s-gen7

I plan to enable DP audio and other things in parallel.

--srini

Depends on Bjorn's:
  - phy: qcom: edp: split power-on sequencing by PHY version
  - phy: qcom: edp: update v8 power-on programming sequence


[1]: https://psref.lenovo.com/syspool/Sys/PDF/ThinkPad/ThinkPad_T14s_Gen_7_Snapdragon/ThinkPad_T14s_Gen_7_Snapdragon_Spec.pdf
Srinivas Kandagatla (4):
  dt-bindings: arm: qcom: add Lenovo ThinkPad T14s Gen 7 (Mahua)
  drm/panel-edp: add CSOT MNE007QB1-1 entry
  arm64: dts: qcom: Add Lenovo ThinkPad T14s Gen 7
  firmware: qcom: scm: Allow QSEECOM on ThinkPad T14s Gen 7

 .../devicetree/bindings/arm/qcom.yaml         |    1 +
 arch/arm64/boot/dts/qcom/Makefile             |    1 +
 .../qcom/mahua-lenovo-thinkpad-t14s-gen7.dts  | 1184 +++++++++++++++++
 drivers/firmware/qcom/qcom_scm.c              |    1 +
 drivers/gpu/drm/panel/panel-edp.c             |    1 +
 5 files changed, 1188 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7.dts

--
2.53.0

