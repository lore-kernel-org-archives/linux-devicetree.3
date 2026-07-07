Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2088374A02
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 19:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783452155; cv=none; b=ATETrF9yyBeyBGA+SXmn+i2fEq1BvxBe0EY/raSFa5orWwJyPwhOl538zqc73FOTQU0qrlPdOTyIMoBdhaJ8qC6vo4lNCTq1+WRewmQhR0JqmiLLS+P42i+BnLwiGa/bRti8Jk/OgKt5ggQ2Jc8QWq/NfhZTqurts4ANpWEyJnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783452155; c=relaxed/simple;
	bh=+Rcs9tqTLxY6uz2CPrBVs8k8aFNAm68QFL8TI+SEKms=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=JA42sAD5xIQVjO46ondwXyp8z6OvvnTxZUTTm13rGrwa7ckSe6KfBXSnnizhqDRQOqDmy0uqfkK5TS98zfD7f0gMnoDjO2qVTU5H1lPylfoYugcWvcGwjoA5tY8Uoy80kDSo6NXuWOdIfZuUndMuGGRsrfmv8/T14nLnFLu8U6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V8o96PGj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GvgoOik2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V8o96PGj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GvgoOik2"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667J5Qqj490909
	for <devicetree@vger.kernel.org>; Tue, 7 Jul 2026 19:22:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Mt/L0C8c6aeHx2BoFJgmqf
	geH7twNz10xR7G3mGjzkM=; b=V8o96PGjmOHMv/kdEpPU+p0n2EmDXPCOhZT8fJ
	r3g65l8/TlVmyoGX4eNfiflPXPAZEN+z2s+Yk3MgFk1DdJiM7EKbHPbonchNS+nH
	/FWDfoKmOAEMzEgyLdrmEJvHTK6o2+L4YdlWA6Wrd3iDCgKUUIeCYE9XgISN4Nvt
	3bU91WWaV2NzoYr/JfNPRr2hJaDpza7RgS/f2VUdzPNRKl0YBBdvBcnr467vd7Bu
	ffxBxQi04aP8xD9P0BWHVlq9D5MSnKRhypTVw5q0rovIlDhPE/PmoaNJEX9JHAHl
	BJErLrzHHsKBq+s/Ad3kWTDl9EKMMEZSqHs8/Wp6MZ8tPiBw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8v9abb5j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 19:22:32 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c1a97644aso61683401cf.2
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 12:22:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783452152; x=1784056952; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Mt/L0C8c6aeHx2BoFJgmqfgeH7twNz10xR7G3mGjzkM=;
        b=GvgoOik2hYpK4jE8zfnE2vF1XDOvAJc03NhPEX7VW5nzfDwpp2ZXb0fbnoisuruSKE
         455bSESEqRX8jzQI/1iYCzSyzg32iy31yi/UqVeYYIbMCFhABtbDIko4Vv/3sfZ3PxKk
         pPgOfOG9+r1sYw1YOGHLhd24+AmjVxV6JRg+rarzNBn+8u5rsGkSOueD8Xu4yGnOLMCw
         2p6Y+Y7hyd55wWHQBFXKJ0d5F34gLR6o6lDU03wl3ebovlskSmQJZ2/5Ynws7Rcvn0Pz
         gIcSrLXjTXeUTHzF9QW65bZFDOHxTK0gm6sv4j48h54oqE3oodt7AgBlQcnz897w64VJ
         jD1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783452152; x=1784056952;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Mt/L0C8c6aeHx2BoFJgmqfgeH7twNz10xR7G3mGjzkM=;
        b=aREoaBGvMhEkGOm+PByf0Z6oPhxclSRLY27dFgYR1zbg/wejxbJRgEm8XwyVdLU3H1
         BqUXd2gu6DoxK5UPV2cUYfWwrWPtwZpVu8dV46desqzt8twGcXHK6WBNL00+zf1/0Vey
         cbUcTRVcjud2g06K1oftQlPB1R0m48T+aQYmBrGAZUVRVpbYmyaw2foo8WS5nC2VyC0R
         HPgdh7XLOc5qJv3fWOqMWAqRDTpkhsxQdXqs8LO8NgkWfiXE6B6bi5aWsHfaaIprpq1J
         fPWTkr0uOZLtLbuSPHwFf4Uu7o+e94exakwH2AYYA/i7mAFuhiXHbNqsXY1YgmlwehGo
         HqjQ==
X-Forwarded-Encrypted: i=1; AHgh+RpYH1JuRpDRVPdUzXoetl72+R0hA9pLZHuyEkpy+DER1wYtIZuB0I5MHS/HRuS1TAQSkU/1yQ12Cmfv@vger.kernel.org
X-Gm-Message-State: AOJu0YyYkGwcPIaDEShcKU+NHBuYtX5XxWT9WeLnnytk72U+JjdUbK+9
	5NurNT7UnR49q3cT7diLpt2ZVDyOs+EnGqhqE4bOwEG8BBGzZAvqXjDSbsfxL5E+zcBlqx9yRry
	m8L0EdbsMHKb+kUAia6P+qDbSHOFTYQWo6tJfHetQstqQ+PWjeG1ix65AMwmixm3h
X-Gm-Gg: AfdE7cmwv6UKK0Nn2tmNJHBtIKM7fQwq26VbiSUZCTdsgCAA7Ml8xZOzpFUAYrQEZO1
	SFNAF/GvDnoat1hkadnl6o2rLEoVPYiqXCbmCVJnwE+lQZ/NHIs9gsEMWIi7s89yV0Hrf1A+W1i
	nU7b1l3iCwWStD+ty4+x39S5fgrg+Rd12Ow1TAstOFge3XpLwF1lMKmhLU0OWsWHOL8TcxYlLiT
	rNfU5dIVPvePm66wbOVzC4lvkYCrC9/4EDkqlilakEF++nTA5Iv3BETcapU3NII0pLsTizeHNPA
	FSrSbs1FpXtsyUpC7nE7u4kUxKeS+VUR0XU8PKeHUA+QPY//YG/DMv6OJnVvIzCfUASdJzyVqxp
	fFUTVeFO3BVkMH6pcI7AnnstNlqlPqyDbjvEfAGtQ6k4=
X-Received: by 2002:a05:622a:60c:b0:51a:8d31:9a06 with SMTP id d75a77b69052e-51c74800786mr68202881cf.16.1783452152109;
        Tue, 07 Jul 2026 12:22:32 -0700 (PDT)
X-Received: by 2002:a05:622a:60c:b0:51a:8d31:9a06 with SMTP id d75a77b69052e-51c74800786mr68202241cf.16.1783452151242;
        Tue, 07 Jul 2026 12:22:31 -0700 (PDT)
Received: from juillet.box.freepro.com ([2a05:6e02:1041:c10:8029:bbc1:63:ed84])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e0f3677asm70025515e9.4.2026.07.07.12.22.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 12:22:30 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: sre@kernel.org, hansg@kernel.org, ilpo.jarvinen@linux.intel.com,
        linux@roeck-us.net, andersson@kernel.org, konradybcio@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: bryan.odonoghue@linaro.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        neil.armstrong@linaro.org, gaurav.kohli@oss.qualcomm.com,
        manaf.pallikunhi@oss.qualcomm.com, priyansh.jain@oss.qualcomm.com
Subject: [PATCH v6 0/3] Lenovo ThinkPad T14s EC thermal monitoring and thermal zone integration
Date: Tue,  7 Jul 2026 21:22:25 +0200
Message-ID: <20260707192228.14647-1-daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: LHMWZSgUMCx3qv80ol-nxvsAQVMySnwg
X-Proofpoint-ORIG-GUID: LHMWZSgUMCx3qv80ol-nxvsAQVMySnwg
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDE4OSBTYWx0ZWRfX/q4LUqRql0ui
 /M+pcq8qcBG3OJIX1KLwJqWuD/XgvO1o6Qq1/mNmFkCsW6UF/jtJvOr9ad5J1FRrz1556cOFBrj
 7HruZhoqYAPh74Zn1iKixxYIJShmU4E=
X-Authority-Analysis: v=2.4 cv=b9yCJNGx c=1 sm=1 tr=0 ts=6a4d51f8 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=Jz99LMs1rTwwAPREzXgA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDE4OSBTYWx0ZWRfX+mz9m9vMBu2c
 9d6Yxa2aPEeQgXzj/dLympsoFo/WoIC2RCr/nctG/Jw2A3waQC5riO2D3NbUwQsEKoLhC4TAnHa
 CZHQJYPAG7rGK/Yoht5162XTsAOKdv9ZHjz4/idUaJiHFKg6FDzE3NLrFFQARFoqmo2/1qHgbXH
 JPXzJ58bHh8jAPccqN3yceGkbXq2anGn/ToqBhXR5hZVtvpk/eHzHDEzb4wmoDajo/00KJGk02e
 mRMWf8VdVlOcWupcvoURh6qM3a8gXIDYc0VQUJancNMSX+mocANHA2YEtzg75WruReFjJ2P2GmX
 DsyC+AECRyxLCLadPehOzxmSaM1vFjNfhS3R4CDpeDUY99NtDfx94f7LtbUZsOzXvPjViBPknTr
 63hgiyx5PhtEAf/QLrB8PwwC7TrNP2UdMHNYxfLklJ9mInPBEVNvGW+gnp01kr0GimgtSQoy7TS
 NsRar4OYIj5iykNF6aQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_05,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070189

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

Please make sure scmi-cpufreq.ko is loaded before testing

Thanks,

Daniel

---
 Changelog:
	v6:
	 - Added Reviewed-by tag (Dmitry Baryshkov)
	 - Removed required property for #thermal-sensor-cells (Krzysztof Kozlowski)
	v5:
	 - Added Reviewed-by tag (Ilpo Järvinen)
	 - Added the '#thermal-sensor-cells' property DT binding (Sashiko)
	v4:
 	 - Added the missing HWMON_C_REGISTER_TZ attribute (Sashiko)
	 - Fixed dependency with HWMON (Sashiko)
	 - Added Tested-by tag (Neil Armstrong)
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

Daniel Lezcano (3):
  dt-bindings: embedded-controller: Add Lenovo ThinkPad T14s thermal
    sensor provider support
  platform: arm64: lenovo-thinkpad-t14s-ec: Add hwmon support for
    temperatures
  arm64: dts: qcom: x1e78100-t14s: Add thermal zones for keyboard skin
    and charging sensors

 .../lenovo,thinkpad-t14s-ec.yaml              |   4 +
 .../qcom/x1e78100-lenovo-thinkpad-t14s.dtsi   |  67 ++++++++-
 drivers/platform/arm64/Kconfig                |   1 +
 drivers/platform/arm64/lenovo-thinkpad-t14s.c | 131 ++++++++++++++++++
 4 files changed, 202 insertions(+), 1 deletion(-)

-- 
2.53.0

