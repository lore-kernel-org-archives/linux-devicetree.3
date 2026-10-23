Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792775891;
	b=u1VOTaAmihUQzChKNY0yfa5GcC1L3Xrl025ar4p+f8w3DsV+do317V9S235A1+0naNDS
	 RP/tEDFEBr2HdL5fW1EkosIg7qpVrbW3Whqb+7mKpXBHF+dsVtChzQBulKJIE9VSgEYtp
	 u4AgxfaHdv8L80IBKjxOUlZEnR4iLgupcfwVO88SSXI/Rk2GK0gfyqyeLhs0R5JMfjXpj
	 8r7FZHL998bH3gxPQIobKAHUhpaNZoaiOkx2/qaGC4DUuaQsTkeSORJlgZAYlQdX0CgKM
	 LikBokCt/MYMsz1kB1h0+vLXgQE9QwocDjghszScLNT0IeLhHFQa02R3piWK4pqVlnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792775891;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=SfsF2sbiRp1415Zg5QD61mmr6NxukLeOnr8JRBKFqbs=;
	b=HbOxrIJfMnVxd9j6SZDgQYmLpiwCzinWKIcUE5fJK4IBOcAdcPmL0Qg4SCH9/VSgS20a
	 wBBDuMoImcSw5qAza1mod3ju9UaiSm9bv9BQ5cT/9CNFSK+a8gTB+wcuUK9DPAFTr2wJw
	 eHT6nuoCmdPygoS+mXbektxX7QfHAXWHU+DdTkUPOa/Xu2JYlDntoJA3SQSS5k+Ey1GhG
	 6jOa1sthHM/wl72IPcNYJ7zye9hG3W32hjn4TfxiqT3ooUikvytaHCGClAW76HKnEl2zo
	 yRXk4u4OAxaslaRpT7Ax+XegPgfUKsgUWiRyVDK3ZKhQRJOOiUHwEnhuJTgifHhBI/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="lcyB+k/j";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=g2Hx2Ql6;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44100606A321
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 17:18:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 44100606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lcyB+k/j;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=g2Hx2Ql6
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NG2w1T3733915
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 17:18:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=SfsF2sbiRp1
	415Zg5QD61mmr6NxukLeOnr8JRBKFqbs=; b=lcyB+k/jbGPPFkXQEw4U3rZdqX9
	6D28PZ5ni2ouJQMh6PMWt+WIYYGK2cz66UmMcfNtJzzHJIixmCLViHLXF0ftywIQ
	JQW2OVCB4YoAuF5g+h70rCuSiy12Z38WbodyPwQpZ3nAokwK3YqKsTeA0UIuBHi1
	c+bh3xfhOfALFpItF/TPnlnZoWI7gsjSP8bVwYGD1Fn11IdkEPq6C115ztoFzinL
	2eARUCZa+nXCxpIYpIaolQObWp5l2QkNCe5wT6mEs6AdAH0l8sTCKor9E+IXbI7k
	2ViOwdVa8MDMLftpJxni82DWVCM43NwAVOVFjZrg6OSjIPMifs2V3nOwNgQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgarug9dt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 17:18:09 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93e92aad34aso223621885a.0
        for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 10:18:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792775889; x=1793380689; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SfsF2sbiRp1415Zg5QD61mmr6NxukLeOnr8JRBKFqbs=;
        b=g2Hx2Ql6hTP3Rj+gabede+VP20U2NEeTJ2H5AYGySgM5Ba+/i1z2ZRopveONbYMTz6
         9aiAO6ayvUkchfK8WiIk5nTsgodDwGFbas1cq2p3HKdRSR+S6pLejFMOV43RtIfek2GE
         FG5aT0Vrr2yR8WZbqr+RPgKTi5NIGMaCOfZaVsH2xOW9JPyZDTA+xHYthGZTdSrPfBfo
         S/gXIo28SOxiVkuLe2yrn/TK9yPfJo3mQxR9YHAunM0nMFXjQjaYp9K9chgFij1UqqBe
         Srzw/jUDHnsWfpcbnWpyNZuexowq7PxRQyAl2tCMq7ePbpbrtckds0dcdKqYBLDnVQa+
         jmuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792775889; x=1793380689;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SfsF2sbiRp1415Zg5QD61mmr6NxukLeOnr8JRBKFqbs=;
        b=T4K/d8tGyBnS3M+TWkcny6z5AOxHK6aBkDfhsvXVR/9R/OfXq5uozkmTeE5m9Gokn/
         inkb5f0sx93gsNffMXeRI5bKelxZA5QBmw+MxbtqPNARaCImCCwe1Dpy3IGab8NoiC2c
         DAEpga7bPsPopZECN3EdBMSiMqSRadhQlix9nJfsvA5YH6QSULxsMnOQRoTB2WrcgNGr
         xDhWgvanaVTt0iPCzPTTQxA2Tbs3VqDHDYwdljt5dK1HsmUGjWxUWngUh2DRJp2utbQe
         M0nCpAWxYiPCrvRir6whRwHL2Yrtpaj78MXmGEquuExHEqWasZJqOLHMOGRE/f7ekebp
         V22w==
X-Forwarded-Encrypted: i=1; AKwUvBwNW1BoazKh0tJiOkSFCqtyuJx2/ba4NiDr93GDn21GOhDn8/om6LFW+T11lEzYC+WzcMvXw1iKxq70@vger.kernel.org
X-Gm-Message-State: AFq9FYI5506vBojrSiWZGU17F/0S+0c9u1RXgLY4WUCYDcUyRIofuMMf
	/KXAp4YdK0+otxbWj/0+PrYghQTIRD5rhQ0m34KB/DUuiaqgdN/2Ee8x6o297N/q107HqNED+pT
	55JAqJi6Dg1dBXWCMhGbspMHteXDj0YA1f2C3XGq8CF4nWCzL05MulnaDYDqihdJj
X-Gm-Gg: AYBFou2xZHpmlQlCj9kqExsj3o5wP5+C6iyq0TeNVk7bKqAck1GLc59mAI3vp/CfYyz
	MByHsCtjbcJw5Xy/hz5xr2VN7uErcLvv2nmv094nL3MxK1UvBwvxpfp7j9EgjXR8oZqwRuyEcQN
	s0BhTYD8fr2WW9o2u1EzTr68ulUcWukMRCgN3VmUVDeMozxJ8PWqnqAeJBRYXMxlkWTZ/bmaUD1
	EpeCJ1rjVvo7KeeM7LmGnmXbkmGAO5DtHCWcO/k5mwZJF6OuOg2StfA6Ey9A7/i97y7Rh2/78lP
	TfBHAyj0eiRVYclYaUbYgbBUe03Vpmavu0awFtP+Bu8mTFiNEOG/jjZSVNdRQrJWhaj0ttF5oRH
	fgy+UYfappAY3
X-Received: by 2002:a05:620a:269d:b0:93f:1ff5:8908 with SMTP id af79cd13be357-93f6f7e72f6mr520046285a.41.1792775888672;
        Fri, 23 Oct 2026 10:18:08 -0700 (PDT)
X-Received: by 2002:a05:620a:269d:b0:93f:1ff5:8908 with SMTP id af79cd13be357-93f6f7e72f6mr519952785a.41.1792775877752;
        Fri, 23 Oct 2026 10:17:57 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3d41e0fesm937475f8f.46.2026.10.23.10.17.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 10:17:56 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Alexey Klimov <alexey.klimov@linaro.org>,
        Ravi Hothi <ravi.hothi@oss.qualcomm.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [RFC PATCH 06/23] ASoC: codecs: wsa884x: register the die temperature as a thermal zone
Date: Fri, 23 Oct 2026 18:14:16 +0100
Message-ID: <20261023171433.820092-7-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261023171433.820092-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20261023171433.820092-1-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA2NyBTYWx0ZWRfXw97GPNn2tzkk
 UywCqkfmZDZQIARSRYSz1uah7YszoqC+IWInC4WY4FdjLwiuGHs1ebLYBoy52D8fP4VPjjAw99Y
 09pWtcZeccg8Y48Kv1DexXcjaZbf1Zc=
X-Proofpoint-GUID: PpIZIHn8qUM1u9mEFv61-_bo63oO4olU
X-Authority-Analysis: v=2.4 cv=SK7Xx+vH c=1 sm=1 tr=0 ts=6adb96d1 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=51jdShTR6rvD-JhUMxgA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: PpIZIHn8qUM1u9mEFv61-_bo63oO4olU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA2NyBTYWx0ZWRfX/d0jKMTQ/wbh
 U+ZYD5+D/O5v+mgCs3Ba7yNDQ8UM/SX/Kdg4jZOMJoravLDGuC7IGbK7Rf5JcKzMqGDtJ5Zi9gp
 A5QLNVLqIQPDRrXeoEQ036qaE9Zbb/lVsu0tKCKNWfF7g6clxpMst+0t/iPzrYX6aogoFrvM+77
 mbL2GMk4FvXGC0IQRJ8AbZTFlWk6QFWRWod/QyR+dcE29ZKXIHs2/O5GHOyRzJHaLEbZ8KHgTbd
 Gqx5J1/KLzqBMtd3oJZYf0wz9BwZbVXYlYNQi4cJvLFVLZFHKr9a3MIysUmRiKYhAv2o9q+POuQ
 kY7+TL588n0eWtSEHhkLyV8g9K1b/2SBy1DhroFlzehTSk6/wLrQQdBsNdb+7VEV8xFolXUFsIO
 6u/OaDOBr7yc2hMH/64bNgqTDp7oR1M8SWUxyGd4xZwujuVXUHDpB3qSrCCQhGbKW2RKF0n60TI
 EddY7OIuWoR0Winc+Jg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 priorityscore=1501 impostorscore=0 phishscore=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230067

Speaker protection pairs each speaker's calibrated resistance with the
amplifier die temperature (T0) at the time, but an in-kernel user has
no way to read that temperature.

Register a tripless thermal zone over the existing temperature read,
named "wsa-<bus id>-<unique id>" so a user holding the codec's device
can find it with thermal_zone_get_zone_by_name(). Until the codec is
initialised, and while the PA is on with nothing cached yet, return
-EAGAIN to hwmon and no valid temperature to the thermal zone, instead
of a plausible looking zero. -EAGAIN would make the thermal core re-read
the zone every 250 ms and keep the codec awake.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/codecs/wsa884x.c | 70 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 69 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wsa884x.c b/sound/soc/codecs/wsa884x.c
index fbb9c5773aa5..ecc6983bb54e 100644
--- a/sound/soc/codecs/wsa884x.c
+++ b/sound/soc/codecs/wsa884x.c
@@ -23,6 +23,7 @@
 #include <linux/soundwire/sdw_type.h>
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>
+#include <linux/thermal.h>
 #include <sound/soc-dapm.h>
 #include <sound/soc.h>
 #include <sound/tlv.h>
@@ -1928,8 +1929,10 @@ static int wsa884x_get_temp(struct wsa884x_priv *wsa884x, long *temp)
 	if (wsa884x->pa_on) {
 		/*
 		 * Reading temperature is possible only when Power Amplifier is
-		 * off. Report last cached data.
+		 * off. Report last cached data if we have one, -EAGAIN otherwise.
 		 */
+		if (!wsa884x->temperature)
+			return -EAGAIN;
 		*temp = wsa884x->temperature * 1000;
 		return 0;
 	}
@@ -2051,6 +2054,42 @@ static const struct hwmon_chip_info wsa884x_hwmon_chip_info = {
 	.info	= wsa884x_hwmon_info,
 };
 
+static int wsa884x_tz_get_temp(struct thermal_zone_device *tz, int *temp_mdeg)
+{
+	struct wsa884x_priv *wsa884x = thermal_zone_device_priv(tz);
+	long mdeg;
+	int ret;
+
+	/*
+	 * OTP trims read back as zero until the codec is initialised. Report
+	 * no reading rather than -EAGAIN, which makes the core poll the zone.
+	 */
+	if (!wsa884x->hw_init) {
+		*temp_mdeg = THERMAL_TEMP_INVALID;
+		return 0;
+	}
+
+	ret = wsa884x_get_temp(wsa884x, &mdeg);
+	if (ret == -EAGAIN) {
+		*temp_mdeg = THERMAL_TEMP_INVALID;
+		return 0;
+	}
+	if (ret)
+		return ret;
+
+	*temp_mdeg = (int)mdeg;
+	return 0;
+}
+
+static const struct thermal_zone_device_ops wsa884x_tz_ops = {
+	.get_temp = wsa884x_tz_get_temp,
+};
+
+static void wsa884x_tz_unregister(void *data)
+{
+	thermal_zone_device_unregister(data);
+}
+
 static void wsa884x_reset_powerdown(void *data)
 {
 	struct wsa884x_priv *wsa884x = data;
@@ -2187,6 +2226,35 @@ static int wsa884x_probe(struct sdw_slave *pdev,
 	if (ret)
 		return ret;
 
+	if (IS_REACHABLE(CONFIG_THERMAL)) {
+		char tz_name[THERMAL_NAME_LENGTH];
+		struct thermal_zone_device *tz;
+
+		/*
+		 * Register after runtime PM is enabled, as the zone is read
+		 * right away. dev_name() is too long for a zone name.
+		 */
+		scnprintf(tz_name, sizeof(tz_name), "wsa-%d-%u",
+			  pdev->bus->id, pdev->id.unique_id);
+		tz = thermal_tripless_zone_device_register(tz_name,
+							   wsa884x,
+							   &wsa884x_tz_ops,
+							   NULL);
+		if (IS_ERR(tz)) {
+			dev_warn(dev,
+				 "thermal zone '%s' registration failed (%ld); SP T0 kcontrol will read 0 for this codec\n",
+				 tz_name, PTR_ERR(tz));
+		} else {
+			ret = devm_add_action_or_reset(dev,
+						       wsa884x_tz_unregister,
+						       tz);
+			if (ret)
+				return ret;
+
+			thermal_zone_device_enable(tz);
+		}
+	}
+
 	return devm_snd_soc_register_component(dev,
 					       &wsa884x_component_drv,
 					       wsa884x_dais,
-- 
2.47.3

