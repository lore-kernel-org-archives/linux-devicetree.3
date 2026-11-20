Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795166444;
	b=T74LIlqDNmuPHmcNhFp01PaxGhChosj0tvcvG04AOmYgOyKKyH4rIEX2/wtpBSvA3y3X
	 PpT6DPpOAk5woWtCXgUlsvfA9wXSgM2S9gu5JPtsEXhMhz+PKX1cHuoUMSYm2c2jg+jb9
	 sqI9BT38AYN5wo8D17v/rWwEdByV7T6ES1t1hvo+V/w8L1aB6PNMf0vRViIKDaA/8T/BJ
	 8gqvxiZvbO2f5CthwLY2OA6p1WAsVQwQ8+/2RdFBXF0MWvoryi8t1uNpl9/x3AgGBLAyF
	 cuAW6xgM/CoDC5UdRPD1PIge95xiwXHqmXwu7KhGXqHSKZclu/QzAz+s9tJS5BcJkHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795166444;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=HVqGtEyqfs5ObErYYrXvO9fxhLOR58qOlYIxDgWr8PM=;
	b=0EDXmH7+GdvWlHVol3z15d6fpkU1uIdgkD1v3J2yVAEUuicEIIFDhKkuTfztlMD2AzC+
	 n9z10aXZ4+a24TvdR4vJnQoV35mW6EIhsy1NsWGy0MJwJQfrHAt7wXgeGe4fv8b8ck5V2
	 TVerMRvExpkzqytgG17MLRJcEJ6M2iL3yQt0x61wAGEY7tb+yNgXwz71maF266B1tVsex
	 s16JTVTqSXhMaQOGoOO2kZ1T1IGf1MEu3gSsUZxpVMWiZPiZLx7IeE+fYeOual7GDVKsc
	 gyoAt017VgM6k4VgDZ/iWDdTPehUO94Y8GdriT4HCBDxxtNIq4J/ONIdBAt2t+mwZ/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YV0SI9tO;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Qen2pFxX;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B0D0606A334
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 09:20:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B0D0606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YV0SI9tO;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Qen2pFxX
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK90b5P826197
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 09:20:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HVqGtEyqfs5ObErYYrXvO9fxhLOR58qOlYIxDgWr8PM=; b=YV0SI9tOj1BZJk3R
	VYOrlEXuZoPkEcDvUhGu8fDzJioCGIgwBIM2VuWSXuhVeuAPpHYqd42/qZsGO7gh
	qyUJFQgWFgcqbdAypM0Ls9e58/uJo0h9sMc08OvS3UJvOB6IPTyRjrLo1ENw9uOB
	o/6QFg1jNVP6qR3yyvrXsrcRfHp0ZhFzGHhtUm3RixFGW2n3/GQgeXF1cyGCbYHU
	p4Sdu38EN0DIyYWE1+n0Z8EIurC6oNSLsJYSZLvYNaySpkEqb/VbMcj27J2ZFVkv
	9R2U56SFmqM6Yj2hN4R0gsd7WvB2x2AekjzdfECY74DGsYt9johnCCPj3yRu0J1V
	O6Hh/A==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j27fyjwxs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 09:20:42 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8b69b8c6dd5so911336b3a.3
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 01:20:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795166442; x=1795771242; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HVqGtEyqfs5ObErYYrXvO9fxhLOR58qOlYIxDgWr8PM=;
        b=Qen2pFxXxIUdgaz9olk3JWwM34WeYGUYtN5jxHr10nzbhN1iC4unodOq+800kuv5mY
         2QXZ0BaFhfkbiocf/x6VD1r7aHaqViWmaIU5sYooUN93HeGe8YvbHO/hctQnbiA2XKRW
         1H946bGhQKLc5WJkgFQm9opYgq41eIiTV40KkucvFfIlnh+Ll3AHwzCV/ydu+vmfdTfD
         5RzvhBBx7cXZv5x7KCejjfdhc+9ZOj+AC1euhpRDHEeMMj73bBxpvqVaX91GJAsSbJrB
         s+kwd0+jpXeyCnE0BJrAUEBbSb5+aQN8kLPlUHA4zPlRsWuuvddviD7U8tACJlnQNFrS
         jycg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795166442; x=1795771242;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HVqGtEyqfs5ObErYYrXvO9fxhLOR58qOlYIxDgWr8PM=;
        b=B9B3nAF0/4Dv5uXIB/+AKG7+WBMSfwBuoaODFTGvgZS48t4V5ZOSJJlpnQIJWuJZR+
         JfWeMx+gR1tXQzGoIiGXWFV7P6+5TM7WF+usYLjL3JdWp5f4RvbiBi8qDfZUpLFhpUPu
         Yq+UTB1yqTOGV6oickX/53K1+1Hkm9Tcrt5O7Aib4yAaEGPFzErUolUPsIeZiIkE7/VH
         b1lCFLDTpvAoIxVg3Ew7Daw46SaouygN57k9nuvKoIh7OQ3mJkQa4dRnJVEP2ZCAwS0K
         Q+EEapET9UbVPw8vbeDBa7OhU8gFTpFIzCke+vDY5o9tNuV8yove6q+mTEMBqvBbvr0z
         c0BA==
X-Forwarded-Encrypted: i=1; AL+hErHyT96JQW3g51xRrYQrrKZce4qrMOks24OQc4XgGSwP/EPRvrcj4GddBRBSgfTamls+4ulAks9sgQHd@vger.kernel.org
X-Gm-Message-State: APuU4Z8ajkzHSm9NoAMYSfNuRWuy2a7rpY1T9UpOg5Y6MCNAsgqo9BEg
	UCOlFvJ+70eu2SEfa79s6cR6iSOjhkqAu8Lvk/BXFSejKhU2nup8tpnFffz5Xr3sxDdbhAR/HJY
	/NB5aqWTYofySnYUOR4BbTEEogeoc56l5SPG+l39kn7eP6aSw2U1XSrrRGKoxhfjP
X-Gm-Gg: AZFdTZdQ0Kkvly+THAYnf3WBtgrfTLcxQtUtjyVA8PEyuRT9ta3DTFsV1Uk2twQBZx1
	SfemgS5X8wWDcj5U6PTSNblYeN14mu7+06SkHrTMLmSuqCNtLPDq+xM/R3tqjf86p2UIwZyJcCn
	rp3dj/DR/VVAtJQQdXq03S2xRlcEgNoqbDrKTTnWVQOrngqatK0gWike8HPwoRIEX7vZXQupF9I
	wNzuEgXbu07sEijbpurd2VIlSvgSYT+g27cr2dsTxXHOiAKTlsF0G4kayaL4v3CeUeDLlHnIm50
	AuJZGm2Rd1uuH4uuKYID6vV69WREwq+kGY7hKrOj9Fog6TenVygyNZ1KiUATjQF9lLpUIKlLF9S
	O9iEDO/3nXrML81s1YyDlda3x+f6nVOH7rJ/NU0vz1BNV0tFhvtZMLtJO4aSf0mZpqFDv
X-Received: by 2002:a05:6a00:10c7:b0:8a5:7006:1ecf with SMTP id d2e1a72fcca58-8c87c671b53mr2531450b3a.39.1795166441528;
        Fri, 20 Nov 2026 01:20:41 -0800 (PST)
X-Received: by 2002:a05:6a00:10c7:b0:8a5:7006:1ecf with SMTP id d2e1a72fcca58-8c87c671b53mr2531401b3a.39.1795166440955;
        Fri, 20 Nov 2026 01:20:40 -0800 (PST)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c873c1cfa0sm1186994b3a.48.2026.11.20.01.20.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 01:20:40 -0800 (PST)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 14:49:43 +0530
Subject: [PATCH v2 3/7] iio: adc: qcom-spmi-adc5-gen3: Add support for QCOM
 PMIC5 Gen4 ADC
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
Message-Id: <20261120-pmic5_gen4_adc-v2-3-94d0e1fd6847@oss.qualcomm.com>
References: <20261120-pmic5_gen4_adc-v2-0-94d0e1fd6847@oss.qualcomm.com>
In-Reply-To: <20261120-pmic5_gen4_adc-v2-0-94d0e1fd6847@oss.qualcomm.com>
To: Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>,
        =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
        Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Priyansh Jain <priyansh.jain@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795166413; l=18142;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=Nq8BsDHpjzmi6U8QP9R5um5WrKzHrKOZJYjnoFSp8vs=;
 b=7x+qJqm9Xz1zDElwuYOifS0rkyyXA7KIRFSOE1AbghLnawso4po6oA2hp7f2B+2onIvHSToDN
 bEpqf6ohq/SDoiK5WRAxXKMmnk+cfWIrqhgIqMWFJrnQ5lpaDE5vhqG
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDAzNyBTYWx0ZWRfX3lTVD79rh6F5
 29XDcQ/QncOlX1GzDqUA/7YmL6NBkAcDSqgOFdAE603MASvypfiw+fJB14Oobcvxj19Y1wT88c7
 RdERBoPrxxNR1hTcwb94yAp6A7vPvpA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDAzNyBTYWx0ZWRfXyc9E6vD0Tz4N
 XjaDOOyBQ+MhqBLMdiCzWpOdbhIskWmslTSFvomtGMgGnWe8j4OpOw1DnLtIzWhMb26JK9j6QPL
 L5c9CIEasMxMhACUl/J/2BA2bE+ZRZ5NkkUARK7m58FI0v0oMs9yfeV65XHw/jNbUWfTvA5D2Tm
 TneJxD2Y9h7DBUTMrqMKTBdrVReNlxfEyRbnyO6LWYAeQ1SC46vMfjvrUZe99kd+fuApbIhM/rY
 /FqfQJ0PRZXp++Y1dwHWs35k+de8X3TMpvV5i1+EyK5bB9C1c7jb7H8AwxyawS9+g+LiUxdf9wv
 nT0tHf8KCFwKUxNoGNFVLeomRUsT6IYhiy54X52WtnIon7FDgGmCXatONP7nhttiwfX5jNI2ZVA
 fJfPm4DNGHD9Waad61J0m3vpMJQ0H98xlHTua3Km5yDmSlGNM5zOnFB8P0VfnvOFfKFYmHnMPVq
 Fq+uBrBiCnOHFsdPGgQ==
X-Authority-Analysis: v=2.4 cv=GZKCDgXL c=1 sm=1 tr=0 ts=6b0010ea cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=e0d3NiHrLCEl0g2hIFoA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: 3UBWNLNPkiHiD8yXcGbdb-WBHNrgdiXE
X-Proofpoint-GUID: 3UBWNLNPkiHiD8yXcGbdb-WBHNrgdiXE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 impostorscore=0 bulkscore=0 adultscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200037

PMIC5 Gen4 ADC is similar to PMIC5 Gen3 ADC, with several changes made
for improved performance, mostly at the hardware level.

One significant software change is that ratiometric conversion resolution
has been increased from 14 bits to 16 bits, so the maximum value of
these measurements needs to be updated for Gen4. Add a new scaling
function for thermistor channels which use this type of conversion.

It is possible that the master PMIC has ADC of one generation and it needs
to communicate with another PMIC with ADC of a different generation. For
example, on SM8750, PMK8550 is the master PMIC with Gen3 ADC and it
communicates with PMIH0108, which has Gen4 ADC. Add a new DT property
"qcom,adc5-gen4" to distinguish Gen4 channels under a Gen3 master, to
ensure that their conversions are handled correctly.

In the latest PMIC arbiter version (v8), there can be up to 4 buses
under the PMIC arbiter and 32 PMICs under each bus. In order to
support communication between ADC on the master PMIC and ADCs on any
of the other PMICs, a field of width 2 bits is added for bus index
and the bits for SID are extended from 4 to 5 bits, in the SID
register. Add support for this.

Co-developed-by: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
Signed-off-by: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
 drivers/iio/adc/qcom-spmi-adc5-gen3.c         | 125 ++++++++++++++++++--------
 drivers/iio/adc/qcom-vadc-common.c            |  30 +++++++
 include/linux/iio/adc/qcom-adc5-gen3-common.h |  42 +++++++++
 include/linux/iio/adc/qcom-vadc-common.h      |   4 +
 4 files changed, 164 insertions(+), 37 deletions(-)

diff --git a/drivers/iio/adc/qcom-spmi-adc5-gen3.c b/drivers/iio/adc/qcom-spmi-adc5-gen3.c
index be12bb6781cb..aa06d4d1083a 100644
--- a/drivers/iio/adc/qcom-spmi-adc5-gen3.c
+++ b/drivers/iio/adc/qcom-spmi-adc5-gen3.c
@@ -86,7 +86,9 @@ int adc5_gen3_write(struct adc5_device_data *adc, unsigned int sdam_index,
 }
 EXPORT_SYMBOL_NS_GPL(adc5_gen3_write, "QCOM_SPMI_ADC5_GEN3");
 
-static int adc5_gen3_read_voltage_data(struct adc5_chip *adc, u16 *data)
+static int adc5_gen3_read_voltage_data(struct adc5_chip *adc,
+				       struct adc5_channel_common_prop *prop,
+				       u16 *data)
 {
 	u8 rslt[2];
 	int ret;
@@ -98,9 +100,11 @@ static int adc5_gen3_read_voltage_data(struct adc5_chip *adc, u16 *data)
 
 	*data = get_unaligned_le16(rslt);
 
-	if (*data == ADC5_USR_DATA_CHECK) {
-		dev_err(adc->dev, "Invalid data:%#x\n", *data);
-		return -EINVAL;
+	if (!(prop->generation == ADC5_GEN4 && prop->cal_method == ADC5_RATIOMETRIC_CAL)) {
+		if (*data == ADC5_USR_DATA_CHECK) {
+			dev_err(adc->dev, "Invalid data:%#x\n", *data);
+			return -EINVAL;
+		}
 	}
 
 	dev_dbg(adc->dev, "voltage raw code:%#x\n", *data);
@@ -131,8 +135,9 @@ static int adc5_gen3_configure(struct adc5_chip *adc,
 	if (ret)
 		return ret;
 
-	/* Write SID */
-	buf[0] = FIELD_PREP(ADC5_GEN3_SID_MASK, prop->sid);
+	/* Write SID and bus_id*/
+	buf[0] = FIELD_PREP(ADC5_GEN4_BUS_INDEX_MASK, prop->bus_index) |
+		 FIELD_PREP(ADC5_GEN4_SID_MASK, prop->sid);
 
 	/*
 	 * Use channel 0 by default for immediate conversion and to indicate
@@ -268,7 +273,7 @@ static int adc5_gen3_do_conversion(struct adc5_chip *adc,
 		return -ETIMEDOUT;
 	}
 
-	ret = adc5_gen3_read_voltage_data(adc, data_volt);
+	ret = adc5_gen3_read_voltage_data(adc, prop, data_volt);
 	if (ret)
 		return ret;
 
@@ -325,7 +330,7 @@ static int adc5_gen3_fwnode_xlate(struct iio_dev *indio_dev,
 	int i, v_channel;
 
 	for (i = 0; i < adc->nchannels; i++) {
-		v_channel = ADC5_GEN3_V_CHAN(adc->chan_props[i].common_props);
+		v_channel = ADC5_GEN4_V_CHAN(adc->chan_props[i].common_props);
 		if (v_channel == iiospec->args[0])
 			return i;
 	}
@@ -351,7 +356,7 @@ static int adc5_gen3_read_raw(struct iio_dev *indio_dev,
 			return ret;
 
 		ret = qcom_adc5_hw_scale(prop->scale_fn_type, prop->prescale,
-					 adc->data, adc_code_volt, val);
+					 prop->data, adc_code_volt, val);
 		if (ret)
 			return ret;
 
@@ -433,15 +438,60 @@ static const struct adc5_channels adc5_gen3_chans_pmic[ADC5_MAX_CHANNEL] = {
 					SCALE_HW_CALIB_THERM_100K_PU_PM7)
 };
 
+static const struct adc5_channels adc5_gen4_chans_pmic[ADC5_MAX_CHANNEL] = {
+	[ADC5_GEN4_OFFSET_REF]		= ADC5_CHAN_VOLT(0, SCALE_HW_CALIB_DEFAULT)
+	[ADC5_GEN4_1P25VREF]		= ADC5_CHAN_VOLT(0, SCALE_HW_CALIB_DEFAULT)
+	[ADC5_GEN4_VPH_PWR]		= ADC5_CHAN_VOLT(1, SCALE_HW_CALIB_DEFAULT)
+	[ADC5_GEN4_VBAT_SNS_QBG]	= ADC5_CHAN_VOLT(1, SCALE_HW_CALIB_DEFAULT)
+	[ADC5_GEN4_DIE_TEMP]		= ADC5_CHAN_TEMP(0, SCALE_HW_CALIB_PMIC_THERM_PM7)
+	[ADC5_GEN4_AMUX1_THM_100K_PU]	= ADC5_CHAN_TEMP(0, SCALE_HW_CALIB_THERM_100K_PU_GEN4)
+	[ADC5_GEN4_AMUX2_THM_100K_PU]	= ADC5_CHAN_TEMP(0, SCALE_HW_CALIB_THERM_100K_PU_GEN4)
+	[ADC5_GEN4_AMUX3_THM_100K_PU]	= ADC5_CHAN_TEMP(0, SCALE_HW_CALIB_THERM_100K_PU_GEN4)
+	[ADC5_GEN4_AMUX4_THM_100K_PU]	= ADC5_CHAN_TEMP(0, SCALE_HW_CALIB_THERM_100K_PU_GEN4)
+	[ADC5_GEN4_AMUX5_THM_100K_PU]	= ADC5_CHAN_TEMP(0, SCALE_HW_CALIB_THERM_100K_PU_GEN4)
+	[ADC5_GEN4_AMUX6_THM_100K_PU]	= ADC5_CHAN_TEMP(0, SCALE_HW_CALIB_THERM_100K_PU_GEN4)
+	[ADC5_GEN4_AMUX1_GPIO_100K_PU]	= ADC5_CHAN_TEMP(0, SCALE_HW_CALIB_THERM_100K_PU_GEN4)
+	[ADC5_GEN4_AMUX2_GPIO_100K_PU]	= ADC5_CHAN_TEMP(0, SCALE_HW_CALIB_THERM_100K_PU_GEN4)
+	[ADC5_GEN4_AMUX3_GPIO_100K_PU]	= ADC5_CHAN_TEMP(0, SCALE_HW_CALIB_THERM_100K_PU_GEN4)
+	[ADC5_GEN4_AMUX4_GPIO_100K_PU]	= ADC5_CHAN_TEMP(0, SCALE_HW_CALIB_THERM_100K_PU_GEN4)
+	[ADC5_GEN4_AMUX5_GPIO_100K_PU]	= ADC5_CHAN_TEMP(0, SCALE_HW_CALIB_THERM_100K_PU_GEN4)
+};
+
+static const struct adc5_data adc5_gen3_data_pmic = {
+	.full_scale_code_volt = 0x70e4,
+	.adc_chans = adc5_gen3_chans_pmic,
+	.info = &adc5_gen3_info,
+	.decimation = (unsigned int [ADC5_DECIMATION_SAMPLES_MAX])
+			   { 85, 340, 1360 },
+	.hw_settle_1 = (unsigned int [VADC_HW_SETTLE_SAMPLES_MAX])
+			   { 15, 100, 200, 300,
+			     400, 500, 600, 700,
+			     1000, 2000, 4000, 8000,
+			     16000, 32000, 64000, 128000 },
+};
+
+static const struct adc5_data adc5_gen4_data_pmic = {
+	.full_scale_code_volt = 0x70e4,
+	.adc_chans = adc5_gen4_chans_pmic,
+	.info = &adc5_gen3_info,
+	.decimation = (unsigned int [ADC5_DECIMATION_SAMPLES_MAX])
+			   { 85, 340, 1360 },
+	.hw_settle_1 = (unsigned int [VADC_HW_SETTLE_SAMPLES_MAX])
+			   { 15, 100, 200, 300,
+			     400, 500, 600, 700,
+			     1000, 2000, 4000, 8000,
+			     16000, 32000, 64000, 128000 },
+};
+
 static int adc5_gen3_get_fw_channel_data(struct adc5_chip *adc,
 					 struct adc5_channel_prop *prop,
 					 struct fwnode_handle *fwnode)
 {
 	const char *name = fwnode_get_name(fwnode);
-	const struct adc5_data *data = adc->data;
+	const struct adc5_data *data;
+	u32 chan, value, sid, bus_index;
 	struct device *dev = adc->dev;
 	const char *channel_name;
-	u32 chan, value, sid;
 	u32 varr[2];
 	int ret;
 
@@ -452,27 +502,42 @@ static int adc5_gen3_get_fw_channel_data(struct adc5_chip *adc,
 
 	/*
 	 * Value read from "reg" is virtual channel number
-	 * virtual channel number = sid << 8 | channel number
+	 * virtual channel number = bus index << 13 | sid << 8 | channel number
+	 * For ADC5 GEN3 channels, bus index = 0
 	 */
-	sid = FIELD_GET(ADC5_GEN3_VIRTUAL_SID_MASK, chan);
-	chan = FIELD_GET(ADC5_GEN3_CHANNEL_MASK, chan);
+	bus_index = FIELD_GET(ADC5_GEN4_V_CHAN_BUS_INDEX_MASK, chan);
+	sid = FIELD_GET(ADC5_GEN4_V_CHAN_SID_MASK, chan);
+	chan = FIELD_GET(ADC5_GEN4_V_CHAN_CHANNEL_MASK, chan);
 
 	if (chan >= ADC5_MAX_CHANNEL)
 		return dev_err_probe(dev, -EINVAL,
 				     "%s invalid channel number %d\n",
 				     name, chan);
 
+	prop->common_props.bus_index = bus_index;
 	prop->common_props.channel = chan;
 	prop->common_props.sid = sid;
 
-	if (!adc->data->adc_chans[chan].info_mask)
+	if (fwnode_property_read_bool(fwnode, "qcom,adc5-gen4")) {
+		prop->common_props.generation = ADC5_GEN4;
+		data = &adc5_gen4_data_pmic;
+	} else {
+		prop->common_props.generation = ADC5_GEN3;
+		data = &adc5_gen3_data_pmic;
+	}
+	prop->common_props.data = data;
+
+	if (!data->adc_chans[chan].info_mask)
 		return dev_err_probe(dev, -EINVAL, "Channel %#x not supported\n", chan);
 
 	channel_name = name;
 	fwnode_property_read_string(fwnode, "label", &channel_name);
 	prop->common_props.label = channel_name;
 
-	value = data->decimation[ADC5_DECIMATION_DEFAULT];
+	if (prop->common_props.generation == ADC5_GEN3)
+		value = data->decimation[ADC5_DECIMATION_DEFAULT];
+	else
+		value = data->decimation[ADC5_GEN4_DECIMATION_DEFAULT];
 	fwnode_property_read_u32(fwnode, "qcom,decimation", &value);
 	ret = qcom_adc5_decimation_from_dt(value, data->decimation);
 	if (ret < 0)
@@ -480,7 +545,7 @@ static int adc5_gen3_get_fw_channel_data(struct adc5_chip *adc,
 				     chan, value);
 	prop->common_props.decimation = ret;
 
-	prop->common_props.prescale = adc->data->adc_chans[chan].prescale_index;
+	prop->common_props.prescale = data->adc_chans[chan].prescale_index;
 	ret = fwnode_property_read_u32_array(fwnode, "qcom,pre-scaling", varr, 2);
 	if (!ret) {
 		ret = qcom_adc5_prescaling_from_dt(varr[0], varr[1]);
@@ -526,19 +591,6 @@ static int adc5_gen3_get_fw_channel_data(struct adc5_chip *adc,
 	return 0;
 }
 
-static const struct adc5_data adc5_gen3_data_pmic = {
-	.full_scale_code_volt = 0x70e4,
-	.adc_chans = adc5_gen3_chans_pmic,
-	.info = &adc5_gen3_info,
-	.decimation = (unsigned int [ADC5_DECIMATION_SAMPLES_MAX])
-			   { 85, 340, 1360 },
-	.hw_settle_1 = (unsigned int [VADC_HW_SETTLE_SAMPLES_MAX])
-			   { 15, 100, 200, 300,
-			     400, 500, 600, 700,
-			     1000, 2000, 4000, 8000,
-			     16000, 32000, 64000, 128000 },
-};
-
 static const struct of_device_id adc5_match_table[] = {
 	{
 		.compatible = "qcom,spmi-adc5-gen3",
@@ -554,6 +606,7 @@ static int adc5_get_fw_data(struct adc5_chip *adc)
 	struct adc5_channel_prop *chan_props;
 	struct iio_chan_spec *iio_chan;
 	struct device *dev = adc->dev;
+	const struct adc5_data *data;
 	unsigned int index = 0;
 	int ret;
 
@@ -581,10 +634,11 @@ static int adc5_get_fw_data(struct adc5_chip *adc)
 			return ret;
 
 		chan_props->chip = adc;
-		adc_chan = &adc->data->adc_chans[chan_props->common_props.channel];
+		data = chan_props->common_props.data;
+		adc_chan = &data->adc_chans[chan_props->common_props.channel];
 		chan_props->common_props.scale_fn_type = adc_chan->scale_fn_type;
 
-		iio_chan->channel = ADC5_GEN3_V_CHAN(chan_props->common_props);
+		iio_chan->channel = ADC5_GEN4_V_CHAN(chan_props->common_props);
 		iio_chan->info_mask_separate = adc_chan->info_mask;
 		iio_chan->type = adc_chan->type;
 		iio_chan->address = index;
@@ -696,7 +750,7 @@ int adc5_gen3_get_scaled_reading(struct device *dev,
 
 	return qcom_adc5_hw_scale(common_props->scale_fn_type,
 				  common_props->prescale,
-				  adc->data, adc_code_volt, val);
+				  common_props->data, adc_code_volt, val);
 }
 EXPORT_SYMBOL_NS_GPL(adc5_gen3_get_scaled_reading, "QCOM_SPMI_ADC5_GEN3");
 
@@ -704,12 +758,9 @@ int adc5_gen3_therm_code_to_temp(struct device *dev,
 				 struct adc5_channel_common_prop *common_props,
 				 u16 code, int *val)
 {
-	struct iio_dev *indio_dev = dev_get_drvdata(dev->parent);
-	struct adc5_chip *adc = iio_priv(indio_dev);
-
 	return qcom_adc5_hw_scale(common_props->scale_fn_type,
 				  common_props->prescale,
-				  adc->data, code, val);
+				  common_props->data, code, val);
 }
 EXPORT_SYMBOL_NS_GPL(adc5_gen3_therm_code_to_temp, "QCOM_SPMI_ADC5_GEN3");
 
diff --git a/drivers/iio/adc/qcom-vadc-common.c b/drivers/iio/adc/qcom-vadc-common.c
index b03cf584b165..5c4052f6f24f 100644
--- a/drivers/iio/adc/qcom-vadc-common.c
+++ b/drivers/iio/adc/qcom-vadc-common.c
@@ -301,6 +301,10 @@ static const struct u32_fract adc5_prescale_ratios[] = {
 	{ .numerator =  1, .denominator = 16 },
 };
 
+static int qcom_adc5_gen4_scale_hw_calib_therm(
+				const struct u32_fract *prescale,
+				const struct adc5_data *data,
+				u16 adc_code, int *result_mdec);
 static int qcom_vadc_scale_hw_calib_volt(
 				const struct u32_fract *prescale,
 				const struct adc5_data *data,
@@ -341,6 +345,7 @@ static const struct qcom_adc5_scale_type scale_adc5_fn[] = {
 					qcom_vadc7_scale_hw_calib_die_temp},
 	[SCALE_HW_CALIB_PM5_CHG_TEMP] = {qcom_vadc_scale_hw_chg5_temp},
 	[SCALE_HW_CALIB_PM5_SMB_TEMP] = {qcom_vadc_scale_hw_smb_temp},
+	[SCALE_HW_CALIB_THERM_100K_PU_GEN4] = {qcom_adc5_gen4_scale_hw_calib_therm},
 };
 
 static int qcom_vadc_map_voltage_temp(const struct vadc_map_pt *pts,
@@ -556,6 +561,31 @@ static int qcom_vadc7_scale_hw_calib_therm(
 	return 0;
 }
 
+static int qcom_adc5_gen4_scale_hw_calib_therm(
+				const struct u32_fract *prescale,
+				const struct adc5_data *data,
+				u16 adc_code, int *result_mdec)
+{
+	s64 resistance = adc_code;
+	int ret, result;
+
+	if (adc_code >= RATIO_MAX_ADC5_GEN4)
+		return -EINVAL;
+
+	/* (ADC code * R_PULLUP (100Kohm)) / (full_scale_code - ADC code)*/
+	resistance *= R_PU_100K;
+	resistance = div64_s64(resistance, RATIO_MAX_ADC5_GEN4 - adc_code);
+
+	ret = qcom_vadc_map_voltage_temp(adcmap7_100k, ARRAY_SIZE(adcmap7_100k),
+					 resistance, &result);
+	if (ret)
+		return ret;
+
+	*result_mdec = result;
+
+	return 0;
+}
+
 static int qcom_vadc_scale_hw_calib_volt(
 				const struct u32_fract *prescale,
 				const struct adc5_data *data,
diff --git a/include/linux/iio/adc/qcom-adc5-gen3-common.h b/include/linux/iio/adc/qcom-adc5-gen3-common.h
index ec7238e93396..fa7e08d67f26 100644
--- a/include/linux/iio/adc/qcom-adc5-gen3-common.h
+++ b/include/linux/iio/adc/qcom-adc5-gen3-common.h
@@ -41,6 +41,8 @@
 
 #define ADC5_GEN3_SID				0x4f
 #define ADC5_GEN3_SID_MASK			GENMASK(3, 0)
+#define ADC5_GEN4_SID_MASK			GENMASK(4, 0)
+#define ADC5_GEN4_BUS_INDEX_MASK		GENMASK(6, 5)
 
 #define ADC5_GEN3_PERPH_CH			0x50
 #define ADC5_GEN3_CHAN_CONV_REQ			BIT(7)
@@ -51,6 +53,7 @@
 #define ADC5_GEN3_DIG_PARAM			0x52
 #define ADC5_GEN3_DIG_PARAM_CAL_SEL_MASK	GENMASK(5, 4)
 #define ADC5_GEN3_DIG_PARAM_DEC_RATIO_SEL_MASK	GENMASK(3, 2)
+#define ADC5_GEN4_DECIMATION_DEFAULT	1
 
 #define ADC5_GEN3_FAST_AVG			0x53
 #define ADC5_GEN3_FAST_AVG_CTL_EN		BIT(7)
@@ -79,6 +82,13 @@
 #define ADC5_GEN3_CHANNEL_MASK			GENMASK(7, 0)
 #define ADC5_GEN3_V_CHAN(x)		\
 	(FIELD_PREP(ADC5_GEN3_VIRTUAL_SID_MASK, (x).sid) | (x).channel)
+#define ADC5_GEN4_V_CHAN_BUS_INDEX_MASK		GENMASK(14, 13)
+#define ADC5_GEN4_V_CHAN_SID_MASK		GENMASK(12, 8)
+#define ADC5_GEN4_V_CHAN_CHANNEL_MASK		GENMASK(7, 0)
+#define ADC5_GEN4_V_CHAN(x) \
+	(FIELD_PREP(ADC5_GEN4_V_CHAN_BUS_INDEX_MASK, (x).bus_index) | \
+	 FIELD_PREP(ADC5_GEN4_V_CHAN_SID_MASK, (x).sid) | \
+	 FIELD_PREP(ADC5_GEN4_V_CHAN_CHANNEL_MASK, (x).channel))
 
 /* ADC channels for PMIC5 Gen3 */
 #define ADC5_GEN3_REF_GND			0x00
@@ -102,6 +112,27 @@
 
 #define ADC5_MAX_CHANNEL			0xc0
 
+/* ADC channels for PMIC5 Gen4 */
+#define ADC5_GEN4_OFFSET_REF		0x00
+#define ADC5_GEN4_1P25VREF			0x01
+#define ADC5_GEN4_DIE_TEMP			0x03
+#define ADC5_GEN4_USB_SNS_DIV20			0x11
+#define ADC5_GEN4_VIN_DIV20_MUX			0x12
+#define ADC5_GEN4_VPH_PWR			0x8e
+#define ADC5_GEN4_VBAT_SNS_QBG			0x8f
+/* 100k pull-up channels */
+#define ADC5_GEN4_AMUX1_THM_100K_PU		0x44
+#define ADC5_GEN4_AMUX2_THM_100K_PU		0x45
+#define ADC5_GEN4_AMUX3_THM_100K_PU		0x46
+#define ADC5_GEN4_AMUX4_THM_100K_PU		0x47
+#define ADC5_GEN4_AMUX5_THM_100K_PU		0x48
+#define ADC5_GEN4_AMUX6_THM_100K_PU		0x49
+#define ADC5_GEN4_AMUX1_GPIO_100K_PU		0x4a
+#define ADC5_GEN4_AMUX2_GPIO_100K_PU		0x4b
+#define ADC5_GEN4_AMUX3_GPIO_100K_PU		0x4c
+#define ADC5_GEN4_AMUX4_GPIO_100K_PU		0x4d
+#define ADC5_GEN4_AMUX5_GPIO_100K_PU		0x5e
+
 enum adc5_cal_method {
 	ADC5_NO_CAL = 0,
 	ADC5_RATIOMETRIC_CAL = 1,
@@ -117,6 +148,11 @@ enum adc5_time_select {
 	MEAS_INT_NONE,
 };
 
+enum adc_generation {
+	ADC5_GEN3,
+	ADC5_GEN4,
+};
+
 /**
  * struct adc5_sdam_data - data per SDAM allocated for adc usage
  * @base_addr: base address for the ADC SDAM peripheral.
@@ -155,6 +191,9 @@ struct adc5_device_data {
  *	that is an average of multiple measurements.
  * @scale_fn_type: Represents the scaling function to convert voltage
  *	physical units desired by the client for the channel.
+ * @generation: Generation of the ADC HW of the channel.
+ * @bus_index: SPMI bus index of PMIC owning the channel.
+ * @data: top-level ADC data structure.
  */
 struct adc5_channel_common_prop {
 	unsigned int channel;
@@ -166,6 +205,9 @@ struct adc5_channel_common_prop {
 	unsigned int hw_settle_time_us;
 	unsigned int avg_samples;
 	enum vadc_scale_fn_type scale_fn_type;
+	enum adc_generation generation;
+	unsigned int bus_index;
+	const struct adc5_data *data;
 };
 
 /**
diff --git a/include/linux/iio/adc/qcom-vadc-common.h b/include/linux/iio/adc/qcom-vadc-common.h
index 3bf4c49726a7..4be682083843 100644
--- a/include/linux/iio/adc/qcom-vadc-common.h
+++ b/include/linux/iio/adc/qcom-vadc-common.h
@@ -54,6 +54,7 @@
 
 #define R_PU_100K				100000
 #define RATIO_MAX_ADC7				BIT(14)
+#define RATIO_MAX_ADC5_GEN4			0xffff
 
 /*
  * VADC_CALIB_ABSOLUTE: uses the 625mV and 1.25V as reference channels.
@@ -105,6 +106,8 @@ struct vadc_linear_graph {
  *	charger temperature.
  * @SCALE_HW_CALIB_PM5_SMB_TEMP: Returns result in millidegrees for PMIC5
  *	SMB1390 temperature.
+ * @SCALE_HW_CALIB_THERM_100K_PU_GEN4: Returns temperature in millidegC using
+ *	lookup table for PMIC5 Gen4 ADC. The hardware applies offset/slope to adc code.
  */
 enum vadc_scale_fn_type {
 	SCALE_DEFAULT = 0,
@@ -120,6 +123,7 @@ enum vadc_scale_fn_type {
 	SCALE_HW_CALIB_PMIC_THERM_PM7,
 	SCALE_HW_CALIB_PM5_CHG_TEMP,
 	SCALE_HW_CALIB_PM5_SMB_TEMP,
+	SCALE_HW_CALIB_THERM_100K_PU_GEN4,
 	/* private: */
 	SCALE_HW_CALIB_INVALID,
 };

-- 
2.43.0

