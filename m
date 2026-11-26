Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795718310;
	b=CDB+0UV0wiZqGSPWAEzjqwawbWOnkHUc3cvuwcu4HYIKl8LjoOXpSRwNaQRkK80wFi73
	 EoM2zVfelAnzt8SBjRmMEZ9qgmOVBT2gKmmvAUBh1CliRFmdXslisoTJwXUOVq87ELC3L
	 aMM/r2HKAVnCgpfuBfcuOResV98UrGPZvTz/TyUtRtCCG//uW0lYgra7ZJZoh0f0lrCoZ
	 6A5flvnMLvGtrO00LPLPKSuUG3Rk5fvmDAVgH2D+FeBsRDrmpgOovn5PLrvuVwBfo12Aq
	 mr35cVQ6LtvfgqWEOsNHC/JMlNdSEx7BP4tNc4lMUQ6+M700gY3g+T8HHEOfa7kyO/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795718310;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=RjJP/yVn5Zo3ETtO6OpLswGKOSp2VwIJzOn/FhsZnys=;
	b=A76K5fJhlU7gcQRoH7goY8d1akdyH5l4Vf7ACnz2cTBmhJJGdQC2aymoVQ+7piUIgFqj
	 F7sUi7QZOLSaTDftymdgWcMd+7TnaX1BNu+3Jukj9AZ7RdhrQUkaATEQdKwK2EXZmvLrE
	 6osioMi6kORN59v+rdusGV99POiydBsIIDAkDS9oYGddAnAdBsVLqdUBLKXlteC9jkR4k
	 qMUVgPUc2VfLnZbGHbKwFqlOqNB87gij2HJka/9uPPdvmJrsAUMTllhheQplGckPwAJLL
	 g5VvLPHv0J7X3Xf0C68neY3NRsRz1jInHFlkBdJ72ts7XxUu0sL3BQut3HOGRqb3CfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pmLM9Qxp;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Vg3UNItw;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EC9C60A2634
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 18:38:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0EC9C60A2634
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pmLM9Qxp;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Vg3UNItw
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQFvagx1209067
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 18:38:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=RjJP/yVn5Zo
	3ETtO6OpLswGKOSp2VwIJzOn/FhsZnys=; b=pmLM9QxprgnHqvs1HYhjmUu4WiD
	p4LNs5nPNpj+SQHK9NtdgTLQOu3BKdFpqJpO6dw1mHsh+5DVDHENEWhdVhNhhnwp
	j+xe2Ypp7LGldnqPoJryS+X5w3hez2lP3z6dMRpPb23MboRGF3V+PeDKk6ZFH1BO
	A13twpH9ecuCJrKZpzuEt93AU8Vqb8zIRk2k6Ujox9nH6NkBcWS7jYnia95AMo7S
	Rbf4affIblFzyKdoSFfMTnOIi+2Dksvu/KVi0ApZ08ph88Kc24wlKvyvmNUN7lSC
	jSaRZoohE6vyt/DVhDh33TFIw1UqzJQpYGDzm+BkJg/XcytBLGaM2eOCy8g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6gne27tb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 18:38:28 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f2c0e6653so341575185a.1
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 10:38:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795718308; x=1796323108; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RjJP/yVn5Zo3ETtO6OpLswGKOSp2VwIJzOn/FhsZnys=;
        b=Vg3UNItwB54bDE/elz1MkD3Ca1BjCbdI6D5KknQ7Dc3OpYGn44FwsFfzn0/0ZhS+8Y
         yA7nQR7v/DE8CGiwpbT5tNZtVdUGFWtdtXe25kjYXDeydCpAfLrsn4ywfxuw/7o9g04L
         xC2C2OYSysnoQOj/4L023nW2dxdCzvj5igW6ZbxkuegOtgHT3sQMjK9RL5Q2dyI3HtP2
         YwhhlaiNMueeaC9D6PqdztJSzhKZPKk95+TKF/PI0ru+rB/H+mUAn8b4wCA+HagMyeH+
         rpUYILmymXYRSQswvLN+P6+H7ehDeyAP7sh+hOE59+lkFbcxUW9afNtFgZCxRqoMV/1Z
         kDNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795718308; x=1796323108;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RjJP/yVn5Zo3ETtO6OpLswGKOSp2VwIJzOn/FhsZnys=;
        b=Jg6tTWO4KQcPPy2GgIFssuB6U/zmEZ4WG/Q+66g0cwkUByj/Ona4oGOjihPjlErWfv
         OPjfJ0ipd0OrA/sj33M+dcXngSkyBWJ6ZdtJ8FPTthGzxsrnrCALnSJFntbZW/9XLTut
         D1YU8X4etdkPah/QIn6hS8tof4we58kXaG+HAsLh6Ovt3k8tPUIx/3jz/pVUCwJ77GZ4
         hckPPnByrgGG/5KmYJmuFwLF7TOqYIuDVx+yD8KgR+zQ3p53cDof51ZfkLmc3PNygcGm
         rkShI49/fxEeUIQm548m/QvjqkB/jXJRi0koMez0UZChxXZDE5XmoEuPX4fOafVEfFe8
         Dt8Q==
X-Forwarded-Encrypted: i=1; AL+hErFfVzTjTgwokPBsOXSdW/NTMCzdp+9+Ch+LHXK6XN3i3UZTKvlrNif+bUomyQXqZ4PEXrWZ3D47buwQ@vger.kernel.org
X-Gm-Message-State: APuU4Z92g68fLtfeP8JN6FP7sh4QGxr0j9ruXX0hXSMEiyKcVXU/Em7k
	DoF5LMyDMDd7DhoWoKQhO3YdIF6SmaDpXAuXi1aFjNe81aosgjmiHgeAyv9W32BT6oAq4vA9s1U
	xa6njXxAfrdwumL60mrSHhS3HrKbqxhUJQuWWnfDQyI+np57OBBhdYYV5QKNoaPqmAugsVPtP
X-Gm-Gg: AZFdTZdduAL7kaUx+HcszoOoKyek86N4/bdRrilAtbVzMlLAm0rbMUF8Le3TDzQs02s
	MgCmwYRDNy/iRHKM+oBO70hNXsKp1q1ppnX7PWqo7lMlowguibHSAaZ9+R1JoPoXuy8ykApOdeX
	iXASvfGkIe2mN8zZfkKXcBlvfbFSwzH00N1J+cGZQK+gnzoctLX1N5AclEolzSLF+RjdtOK4V+w
	Q4BqVRzwhTXl3vYVeHXylvJ0/6XUKQD7B/X9X01PsSRAF5X1M7MNeWNvjSoSK3JTT6HdNuSoBxV
	wT5YdXbtEkwYskEUMMSLbdPL3VurLfjZ7Cw1I5a/ciU0mBIx0KvbcbBcryJVNXqfopQp1H1tA+I
	tfecUxyOWf1Z5ZltpEq6mWHkCXxTF0Urnq4+tOgJGyhEbh5ML9w1YmiuxPaO2hPAi
X-Received: by 2002:a05:620a:8089:b0:949:6d95:f62b with SMTP id af79cd13be357-949ba9e753cmr3683553185a.31.1795718308432;
        Thu, 26 Nov 2026 10:38:28 -0800 (PST)
X-Received: by 2002:a05:620a:8089:b0:949:6d95:f62b with SMTP id af79cd13be357-949ba9e753cmr3683549385a.31.1795718308034;
        Thu, 26 Nov 2026 10:38:28 -0800 (PST)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb895f7bc1sm239659035e9.3.2026.11.26.10.38.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 10:38:27 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: andersson@kernel.org, konrad.dybcio@oss.qualcomm.com, abel.vesa@linaro.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 7/7] arm64: defconfig: enable SDCA class driver and WCD9378 codec
Date: Thu, 26 Nov 2026 18:38:06 +0000
Message-ID: <20261126183806.172485-8-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261126183806.172485-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20261126183806.172485-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=XpVvqlF9 c=1 sm=1 tr=0 ts=6b087ca4 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=Lb-CJUeqFN5ILZ2-pT8A:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA3MyBTYWx0ZWRfX4ZmSQSzgm2pX
 TQb1LVFAgfJzEf7W0db+Hr1hDaOnV+cetjmrzrpFe3xaxnw/3irfBE2q1M6i9GYmaLxWJwfeG4U
 7GstpAKjq5/L3CeP+A2QeymETcx2FB7pmuN9M2EPNGSQ8UXpLNVnN9k5jbqeEFvp0FVuvsKcUHA
 GyEiqQKf7t3+6FVs9sRfYtufWkS6JY2rXleUMCHBf/NIFmcB7CplDOqz3Jym48lJkQgPPvXljFC
 F4cS4c4yBZCNHlXHM0P5SVkpfLDXsh8b3y4DTzhloCcN3L4cjwh1hPDjjV53TE3eOdKPNndkU5S
 IdX/CrtnfhdcBC27HsYup+A3fWxXNVS1hd0/HfyoZXvJexW1adzO7wOOURwAxtgKp24zPslm5X/
 x82XqhsBBg09lNfL4bEFcKpYjynO1u8LNA26Mpta+9FSDDjOeJ4LK7LMlSN6I8YH6ww+ShrFAZt
 YAuWlUTPWgh4LwKFYlA==
X-Proofpoint-GUID: Jc8O_1T1yJfQI3Osn4eAPOKOBwcyJmDZ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA3MyBTYWx0ZWRfX710WX6qqS3MK
 s8ACuuYEwDFgg9aX8/m5B7nS87hK0e0tw8r28MjRkaPdHaL/1p+LvfabWadOqK3CUgteMjfb/xj
 xQTm03gvWu5j+D8eC/CmLmO3ozSMgCg=
X-Proofpoint-ORIG-GUID: Jc8O_1T1yJfQI3Osn4eAPOKOBwcyJmDZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_04,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 spamscore=0 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260073

Enable CONFIG_SND_SOC_SDCA, CONFIG_SND_SOC_SDCA_CLASS and
CONFIG_SND_SOC_WCD9378_SDCA so Qualcomm Glymur-based laptops have
working headset audio out of the box.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 9c5b64f34a22..86b33019eaa0 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1184,6 +1184,8 @@ CONFIG_SND_SOC_RK3308=m
 CONFIG_SND_SOC_RK817=m
 CONFIG_SND_SOC_RT5640=m
 CONFIG_SND_SOC_RT5659=m
+CONFIG_SND_SOC_SDCA=m
+CONFIG_SND_SOC_SDCA_CLASS=m
 CONFIG_SND_SOC_SIMPLE_AMPLIFIER=m
 CONFIG_SND_SOC_SIMPLE_MUX=m
 CONFIG_SND_SOC_TAS2552=m
@@ -1194,6 +1196,7 @@ CONFIG_SND_SOC_WCD9335=m
 CONFIG_SND_SOC_WCD934X=m
 CONFIG_SND_SOC_WCD937X_SDW=m
 CONFIG_SND_SOC_WCD939X_SDW=m
+CONFIG_SND_SOC_WCD9378_SDCA=m
 CONFIG_SND_SOC_WM8524=m
 CONFIG_SND_SOC_WM8904=m
 CONFIG_SND_SOC_WM8960=m
-- 
2.53.0

