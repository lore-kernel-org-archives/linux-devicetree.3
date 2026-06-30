Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5ABF43D4E3
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 14:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782831212; cv=none; b=Xkcu/OO/9ardPqBEUeb3JWk9HPI6+sqy2nD35v/iiwDdaAaOn7+GshSC0BuAcY8ynocvebJKqdz7r/YkberbJZBBx9CEK2wqyi5+Jg4YPXRmc7JASrlKr5AUN4YxbvxboYeqXhWUIsoVowolxFKzwGSres4nel1/M6kRO5eGbgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782831212; c=relaxed/simple;
	bh=1Q1Xitm/BqGT7JSfwCpKK+MdBYH7XUEoYH8AR342OtU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jrOQw6RXFuJo3jsqaR+Ox90MKGYwTLVZmyoIDmo6ypn7jBZ2A410bn80hWMQPXrz2R3/0JgsjdfCCv+oYNF2FQds4+Gy5xNV+xDWHag31rhyPi5LUNCP4YCvdt/tXVnRiF2kiG3Zt6k4vgJcMMg17FU3HRp9z1rSIfYveGOcSiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OqHxwc+t; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LOWuWaVx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OqHxwc+t";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LOWuWaVx"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65UED4Ce2198841
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 14:53:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=rPpd66k4pbqs/wZxixhFckKv13OwjDsXuyO
	HV9Tkl50=; b=OqHxwc+tGH8iXXh3rjk3vM9/Ijbh+Cvivq+7wlOxq5AnjJV8Rgo
	Gx7IWZ4k9kRCNgbhXNq3nsod3WqbPuQBlRzvRMMHLtTcJ//DIe+PwKHQn2XeiIWN
	ri8iIwy0SeqbJYuaOdyIHw2BEbahKYFDUJ9p5Ci0W5K4/VIg2kdkyVwnKjnolilP
	oq2kQ9m63zF1r1NT2Thh819BumIS9UAVi2cVDX3swSH2i8An10DuuXV7YozJh1/U
	6DGZvn+Yb1Gs9ExG5aFsvLzqdqcTcoNISop3RjkqTqXjt3DDTOtMkuAwLzeZtbeU
	+wFdn/Jtws0R02CcWb0UKqzN9Kbk+UjTxAw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4fc085g4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 14:53:27 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8ea75996387so90288846d6.1
        for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 07:53:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782831207; x=1783436007; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rPpd66k4pbqs/wZxixhFckKv13OwjDsXuyOHV9Tkl50=;
        b=LOWuWaVxC65yrUFHBCL/cVAnbj/mQFXFKzo9+VA9m9bAGFNJZIVLfKgseWKUzi8rZa
         xj4AnCWY0fVv5ItgIWls8HEMdxwCTr+I3gfsWLmTKs1cbDoMkL9C/OaJe/dghNuQepPQ
         KBuhMKChYAb+LN8fhpxhnGFF8pdFFiWPOynLnfW3gBXYNjzkld17rTUYHbRw0l01OucT
         AoutUL9geC/WLLSGPtCavv+JldHD31Ocu1BC679wbdPQTmB7t2/07gqZEBeaFk7wXkHe
         ehTeTXq8ZxuSDGUY6Z4AL9jiJX1ibowvtuhWQYTngLfUvfyZBKYJHvlEwFGS9Vhrj+Gq
         AkIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782831207; x=1783436007;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rPpd66k4pbqs/wZxixhFckKv13OwjDsXuyOHV9Tkl50=;
        b=XEQErWSRe8YocgLCWWcI9JsI1js3FoAljnlASNlfJvF20Hbo0D3nLWwdNFLdDf7gs5
         egTM7mq8VSPgJ80oImkZIYsFiTOlq5ZTJs7VKq3YOHNYl8dBmUTYM6cuGaPndhu4OXM9
         QiLq15NMzFnS9VItLgCCVdIF0KsJVtH/TsSrfX+Gui9XRwpVwEv1W0YCOrtnFnptKech
         f+CR6ToDUywoUaO0bZafYWzSj8ZlmyW9Uo/sbvhv7DndGy5VAnEmejuFFinBG2wGFgHz
         4u0S23RZ60PBfX0ri+xVOYb3jgBiZMs0bMXYFVWZAg2KZGFqj+BrINEsswLMS/oounSc
         Atow==
X-Forwarded-Encrypted: i=1; AFNElJ+GIhoQPd68kd8x8Dq8lZFPdPkFk5Une3j60Sya8JH8AgfvRKtCXFPS/bi96830pK6SOzp/QyFUwzQC@vger.kernel.org
X-Gm-Message-State: AOJu0Ywqb+4E63lEwp2mFnBQ3xz/h93koX+dbwM6PWA4fmD15GnRyWFx
	rMRXKiHPIoPPJmhDwZtHN6nzFOWv+AuL0TCIWeuaySQED0L0F0DBBUN69u3I6G6Qe63vBBdNWwi
	aC5IdPnNzVTFZC/H3FhR+NtvtuooQnf3kDh+dhcROdchO4TR06RMKCaHY6OYzWDYb
X-Gm-Gg: AfdE7cmMtYfCjY8f74TL+Fw4lExOxUDnkFgBRiIfEkPQmML0vF5ac3kQMkNEwuucFdV
	9M/gBSKGx+sJt4R1fQETwFwMHtOTm1i5bCam9lZiDLKnPtAshlwW9iaY/N97iaZ3XT2eDH2RotD
	ZfVUs8e7dDJwrcxd/c4kdYI3ndL9ZWdKeT8ZDVZv6jM0Ue9rbwmBQ+RZbwn/4NmsOy5OphYIEpO
	XwO5flrvf7ncfLLntuWxdhJn081e9tZYEeFARv0a4IGE+v/XtpVrJiJle3MgwWhImTcVWL26lKL
	5j75CFxixMfQW3q7dDpPXC+OAGDXOYnh18DHjawP+soIupGZkQLOqdeWQaivIWiktElsJxc0RAg
	HIX5Z/gKSzFETef5xauXMr3RK2snfbdYzHwP6g+b3Ix/4EQ==
X-Received: by 2002:a05:620a:262a:b0:92e:5cf4:9f1d with SMTP id af79cd13be357-92e6d813bc4mr167235785a.23.1782831206824;
        Tue, 30 Jun 2026 07:53:26 -0700 (PDT)
X-Received: by 2002:a05:620a:262a:b0:92e:5cf4:9f1d with SMTP id af79cd13be357-92e6d813bc4mr167228885a.23.1782831206202;
        Tue, 30 Jun 2026 07:53:26 -0700 (PDT)
Received: from juillet.box.freepro.com ([2a05:6e02:1041:c10:5c75:21f9:a642:c358])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493be4d15ddsm720295e9.6.2026.06.30.07.53.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 07:53:24 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: sre@kernel.org, hansg@kernel.org, ilpo.jarvinen@linux.intel.com,
        linux@roeck-us.net, andersson@kernel.org, konradybcio@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: bryan.odonoghue@linaro.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v2 0/3] Lenovo ThinkPad T14s EC thermal monitoring and thermal zone integration
Date: Tue, 30 Jun 2026 16:53:04 +0200
Message-ID: <20260630145307.10745-1-daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDE0MCBTYWx0ZWRfX+d48vykbC12W
 8k0YW+j21G0wxnmlNozNygZhiDUn16G3jPfgrH9le3xy9l4isFrf0pMJD61u0digKzbVSNN4Xcl
 KyC1HaVdMSH+YCsyAeFfa+M2QhDdcTq8rJxyREHpJX58Q+OR/3Wq5TLai1j7HnMMOd43wpq04jB
 U37RPc6lkWG90XJp5lbT5wpqja4tfhCzxpJfQcAFccMrBmWdLbD9tlLLYZuXB9Uk9bsFuNXTzRJ
 fv07mPXZrCBTYbxz9cz58XdZXkeEe9T+O+YiTEiSWkvBu3JiN79+Pk7E+TiU86KQaduzWunrJUP
 MjdnkZNaNXiO93IfTBocT06xyH3/vE4zKSgdAB0GTTBcU+ysXR+jEMo2XpGLOCrhcRvRHC8UqxW
 XwABhnILwlw25AJ9feA7Z2pNDBuG63IXw3BXc2DDtFfv/B0ELUfWiQGMr2w8bTRngFOgWL1kLPV
 CO2ISSXWrrfJp4tgjGw==
X-Proofpoint-GUID: OdvjOLjYYOt8-cQZnlRrEeIfa1pyE20l
X-Proofpoint-ORIG-GUID: OdvjOLjYYOt8-cQZnlRrEeIfa1pyE20l
X-Authority-Analysis: v=2.4 cv=Ivkutr/g c=1 sm=1 tr=0 ts=6a43d867 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=BPc3F_TA1yA0jLc9_u4A:9 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDE0MCBTYWx0ZWRfX+joGuh2Au8un
 ZNd238b0Aqy418QA/EERJdu4Q3G8H+2N64dhZqW2hHVRzgwKYXTMjfuUMycTa00MXMqDcxu7khl
 ad6fOU9EFSQBOZ5nz41pq4wo2Ji6dBc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_04,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 impostorscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300140

Hi,

This series extends the Lenovo ThinkPad T14s embedded controller driver
with environmental monitoring capabilities and integrates the exposed
sensors into the Linux thermal framework.

The EC provides access to several platform temperature sensors
covering the SoC, keyboard area, bottom cover, charging circuitry, QTM
module and SSD. These sensors are currently used by the firmware for
thermal management but are not exposed to Linux.

The first patch adds hwmon support for the EC temperature sensors.

The second patch wires EC thermal notifications into the hwmon event
framework, allowing userspace to receive alarm notifications when the EC
reports thermal zone state changes.

The last patch exposes the EC as a thermal sensor provider in the device
tree and defines thermal zones for the keyboard skin temperature and the
charging circuitry temperature. This allows the generic thermal
framework to react to EC-reported temperatures and apply standard Linux
thermal mitigation policies.

This series fixes critical thermal issues happening on this platform
where a kernel compilation, or heavy workloads, lead to a system
reboot.

Tested on a Lenovo ThinkPad T14s Gen 6 (Snapdragon X Elite).

Thanks,

Daniel

---
 Changelog:
	v2:
	 - Fixed patch 1 subject prefix
	 - Removed the fan information part
	 - Added HWMON_T_ALARM
	 - Fixed DT change description to reflect what it does really


Daniel Lezcano (3):
  platform: arm64:: lenovo-t14s-ec: Add hwmon support for temperatures
  platform: arm64: thinkpad-t14s-ec: Wire EC thermal events to hwmon
  arm64: dts: qcom: x1e78100-t14s: Add thermal zones for keyboard skin
    and charging sensors

 .../qcom/x1e78100-lenovo-thinkpad-t14s.dtsi   |  68 ++++++-
 drivers/platform/arm64/lenovo-thinkpad-t14s.c | 174 +++++++++++++++++-
 2 files changed, 236 insertions(+), 6 deletions(-)

-- 
2.53.0

