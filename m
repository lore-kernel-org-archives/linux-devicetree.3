Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC2BB4B2034
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 09:43:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790070202; cv=none; b=pBjFOdxANMQwKHs1PxDYXQAcMcXCwxfMv9V1BZWvBpl7wBE0ky3gQpzx0uqSE/sHho7qTWKYFqypj4usb2PPmGO4s4j29i5ez0HhJ42AOzmzZp1jJr0T01kIRmsDSOBdtASaqDb61QlKubLT67NxvmVUcxWqg96HHoPwa5iNUjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790070202; c=relaxed/simple;
	bh=KJGqR8mhL7KHXySH6tbs2aCIEBTzzQRN+fAGQbvvWjg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=raq91sD6NyOKNTdmP/DbvbKNXwy9u37W8l2Iutggi+u9Q4pSCGtYI4TSa1Sw5QN+3n4rJl6F9gqv4gJBw91XsYgrPLG0JfeQRlI0htNGXWoVEoeRbSAejlFUzi29xFde04kW8IduxmU+rGr5hDrrfzV5HYdWRVGYISOtnu54ndk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JUAvyfud; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RUDPf0a/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JUAvyfud";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RUDPf0a/"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68M7vcGn2174413
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 09:43:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=s7/+b/CxsacuIzKFZLgR0c
	Cfzon2TIFDxtHVPPQhFLg=; b=JUAvyfud9C8oehuAXhG44QswF6M3kW07Lxl8Ha
	14UJxZTZObkkUE2RwMcsDreX/kZdn10CAsFIybtRosDzDGj8qQEpj0/HlPwkwNPU
	zenIUPSgs7v5ZTKroK+zK88W9UTR6J1JNYTyXal4hjGikCj4hpB27tFT8XQzMRPm
	awXs1niAOi5/Hh5PfHOcvu5LHv5JTHaJ/DyVNBcB4b3GZqf5VpJgxVqsps1g9iuM
	7ZA30WdQiAjQGO2svO478qy3UZrzQ+6+iQHr5/XD60kYOEazVInphNUZCbGTHKbf
	EEqwhL0/2ESxPYOupxv4qtPb3eEhMuJuCVYyJ8Pg1PHzrHaQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gufsq9s2x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 09:43:19 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc1b8088202so3538271a12.3
        for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 02:43:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790070198; x=1790674998; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=s7/+b/CxsacuIzKFZLgR0cCfzon2TIFDxtHVPPQhFLg=;
        b=RUDPf0a/2ohZy6Ik6EXLmTU72gZzRVOfqpFGtQSMh2IQASf/ogpFsjSaP5mQhHFuIv
         LTL46qLjv0oPUW869bvy/DhT7KZr8vIsBNkyO2mow6h+qxlaGpGPWLsXlcbC5COKglmi
         YBYzNcvKG4MxH4B2gf998zBT+LMg7fqfq9BfWj9qhZ3/CtptzhlXXTzVJl5T/HEd4/UK
         TKT6g+xvqa0gUHSzQz23B2gV4dUg3B7n7HsXz0IDvFnovS0P9DywD0ncOo+ohscerZa3
         qJAkkjMMd5UVcBKJ4tmwjt2omOzUNHOQtG2FKoox2wx9RffnwGMk0RZajGbghqi1i1UI
         /55g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790070198; x=1790674998;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=s7/+b/CxsacuIzKFZLgR0cCfzon2TIFDxtHVPPQhFLg=;
        b=CZ6rPUcsQg32OxAEXIQK+s3SooSxrzrfJIHsjqsNRwVFtyKgnTVc02VUQldrLFvfm1
         YW9Od0xMY/rUsyvTBicw7wLMK/VThmYlNxzG5KOM8StcZ6LnCrEk7E/RaUbmRIEp5D4I
         ppKPF0+bdmTeMq28si3/O37PgFaun5kjm51frIHFvpSyURy9fOZ9vT1KCVvp6iN9hWax
         z9yw06VBZdJ7BfW2S84Es2Hj3TE54FGNaswsAQAbtqdPaC3nrE2pe/9tWvm2/ONfcFVR
         K6FR5yIoFMHMNF6H3ucsS1R5dv8+GV1TZ17RE2wQY7nq/dIhnAf9btj++UXJhIXNoy2H
         VddQ==
X-Forwarded-Encrypted: i=1; AKwUvBxQbymXg5ALOBQYru4A+yCyQys6DQ1zskvk/55W1K0ZjGtidK9e93aFY/FFfPzC9FrHvAE+YDLOf/X9@vger.kernel.org
X-Gm-Message-State: AFuF++m9WcPnCngScOrE3MGTUuf9jhqJkRCFqyAilfdlh2z6WfmRhzz9
	uaIbTygkrXZZw82PwlL+sUMyvejcZ8fgOkaT+b7wIsXZTwDcw6xq5SmKzBa1rBiqlN+gLfA55hW
	YY8hoCzVkuQkaIZ/FyVVyuMVdaF6tcP3GZzaxqVhuTa34fHpguuoztO1RYdrKGT5d
X-Gm-Gg: AYBFou3vHIz68E3TlsCAqYOn5MGM85kUH7EdLIxuNFjoVFrKwAu2C/zw8vICAxaH12f
	f5t48VlYhIyuhifimpdg17piROIIP1nuJeQd66BQ7zttZN3PGLtMd9MOLkyLRRyRzlf306aFHKf
	PKyy0ikKHfiTr0pS6zWk428JlKFrfF1QGn9N92FArmR9znWzbUJ2Qci0K3y8ejhM1vcpXYIe+lZ
	8eYFvy9utSE4x3CgI6sl03IW+87d2VcKFHhmrhsQSu5AyK6j+mWwNSMwvgmX1/fPTZGDLf3MTHg
	Q5mD3dekeMtqbRadoiEuGi/lJm+e2JT/ditu84pjC1Kbb7p7RaSEFRT0dvGxugfw5Eql5qvYHCo
	c6XRrFgxBNILwGP+BfFUFzPzXBwayIE3Lsyo=
X-Received: by 2002:a05:6a21:6086:b0:3d3:adbf:7781 with SMTP id adf61e73a8af0-3ddec6352cemr785120637.22.1790070198546;
        Tue, 22 Sep 2026 02:43:18 -0700 (PDT)
X-Received: by 2002:a05:6a21:6086:b0:3d3:adbf:7781 with SMTP id adf61e73a8af0-3ddec6352cemr785088637.22.1790070198095;
        Tue, 22 Sep 2026 02:43:18 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f2a44cc8sm3776183c88.13.2026.09.22.02.43.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 02:43:17 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Subject: [PATCH v4 0/8] ASoC: qcom: Add shikra and Hawi LPASS macro support
Date: Tue, 22 Sep 2026 15:12:29 +0530
Message-Id: <20260922-add_shikra_support-v1-0-6c6cb6444caf@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAIVNsmoC/yWM4QqCQBAGX0W+3x2cawT2KhFy3a25BXrsqgjiu
 3fVzxmY2WGswoZrtUN5FZNpLFCfKsQhjE92kgqDPF18S+RCSp0N8tbQ2ZLzpLNruAm9r5nbSCh
 hVu5l+01vWM+4/50tjxfH+XvDcXwA2Nex3HoAAAA=
X-Change-ID: 20260922-add_shikra_support-3e3af01ee9c2
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790070192; l=5292;
 i=mohammad.rafi.shaik@oss.qualcomm.com; s=20260424;
 h=from:subject:message-id; bh=KJGqR8mhL7KHXySH6tbs2aCIEBTzzQRN+fAGQbvvWjg=;
 b=jzXUKk11dBGDDaP9zEEKhUjYNasuyXaRczB41EPHxxewMaN4QH0kYE3yBR/9U11NkVNLlq+v+
 joQ1z70G5hXAexhP7Shrtk9qrQPr1Kbz4G8fOIj5ykzQG+hcJhQT/WO
X-Developer-Key: i=mohammad.rafi.shaik@oss.qualcomm.com; a=ed25519;
 pk=KZedmYgMGYOzuTpLGv56tdrL+pTLDP8pdmfQ91xemiA=
X-Proofpoint-ORIG-GUID: ZsX4tZ0eF7n-00E32o_FTzkmpj93FXwc
X-Proofpoint-GUID: ZsX4tZ0eF7n-00E32o_FTzkmpj93FXwc
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDEzOSBTYWx0ZWRfXzHU4wxa3jAU5
 W7RVW7IekZ0p+MmuGg56Gxur2Mno3bqN9gmfXgTeM0WZay1A5ZwtL7iDy+DLvzzXPoIQf/ru6xz
 v1QyAOMCnRVivmkk8aB6wutwf2lpd1Q=
X-Authority-Analysis: v=2.4 cv=NKBAaE6g c=1 sm=1 tr=0 ts=6ab24db7 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bC-a23v3AAAA:8 a=pGLkceISAAAA:8
 a=iox4zFpeAAAA:8 a=QSGbU_HFu5iARQtJ-kkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22 a=FO4_E8m0qiDe52t0p3_H:22 a=WzC6qhA0u3u7Ye7llzcV:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDEzOSBTYWx0ZWRfXx3jJT5js4biR
 aOKH/yBeURmj/DE5Xnglg09eq1S6mlwVSqCpt5ovt6t9UVt7FPB5YiJ6dcrIxmWI9waaPRFNGRo
 MB6QILQmRbr3fOki4UojC5n0xTlK+0kwBA04peOjG10Rq6WIue1iJoZPvT2PzQMXqmVdGd0nyUR
 u8FaxmG2qXdOi8j0JoDveaSD+fEXqPTe9400tVEx1hzVIr5/AsfxHNGhbgZTMzY3UUgbZjJ0tLx
 w/0ZcHTnfY4hgGRbu7UErcH9SSnCWbmAUmni/h4DdiFgtxTgCevV7nN/ckqNtArUQiSzuvDQTt/
 hcpy9of7KWThrr3IFB+Dpif3nPq9eolGRu8Quqc/8V8unVio3l3brdQiCApfQx6g5uxk6KzfXyx
 68+ZWPR6c1m1EG0NChyju5AuS331POu7deU0iqPTeelFmUgXauDR7TNUu+SB0SboPmWfww/81h6
 4L+167TClw/0NPkpYsg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0
 clxscore=1015 phishscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220139

This series adds audio support for two Qualcomm SoC platforms — Shikra
and Hawi — by extending the LPASS codec macro drivers for version 4.1
and 4.0 respectively, and by adding SoundWire microphone capture support
to the VA macro.

Shikra (LPASS codec v4.1)
--------------------------
The first part of the series targets the Shikra platform, which
integrates LPASS codec version 4.1. This is not backwards-compatible
with previously described compatibles, so new DT bindings and
standalone compatibles are introduced for the RX and VA macros.

Driver changes include version detection enhancements (including a fix
for the missing v2.9 version string in the common helper), FS counter
bypass programming required before the codec is enabled, and a v4.1
specific regmap configuration covering the additional adaptive filter
(ADPT) blocks at 0x0800..0x09a4.

SoundWire microphone support (VA macro)
----------------------------------------
The VA decimators previously only supported DMIC inputs. A new patch
extends them to accept SoundWire microphone (SMIC) sources as well,
updating the ADC_DMIC_SEL mux programming to be resolved at decimator
enable time rather than at mixer write time, ensuring correct operation
regardless of the order in which userspace restores controls. DMIC-
specific HPF programming is skipped when an SMIC source is active.

Hawi (LPASS codec v4.0)
------------------------
The final three patches, add support for the Hawi (and Maili) platform
which integrates LPASS codec v4.0.

While v4.0 shares the same RX and VA macro register layout as the
existing v2.5+ path and reuses those helpers, the TX macro is based on
Bolero v4.0 — an extension of the v9.x TX macro that adds a port-select
stage in the SWR microphone input path and an adaptive filter (ADPT)
block. The ADPT block must be disabled before a decimator is enabled;
this is gated on a new has_adpt flag in match data since the register
does not exist on earlier versions.

New DT bindings document the RX, TX and VA macro compatibles for Hawi,
noting the clock differences: the RX macro uses the 'lpr' clock rather
than 'macro', and the VA macro takes an additional 'heartbeatpulse'
clock sourced from the LPASS VA CSR rate generator.

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
Changes in v4:
- Added three new patches for Hawi / LPASS codec v4.0 support (DT bindings,
  TX macro Bolero v4.0, RX/VA macro v4.0)
- Fixed all issues reported by Sashiko in v3.
- Link to v3: https://lore.kernel.org/all/20260917-add_shikra_support-v3-0-fc0e79c341aa@oss.qualcomm.com/

Changes in v3:
- Added Shikra-specific clock constraints for RX and VA Macro DT bindings.
- Restricted clock and clock-names properties to align with Shikra hardware requirements.
- Removed dead code from patch 3 of v2, as suggested by Krzysztof.
- Replaced open-coded checks with a flag-based conditional for LPASS
  codec v4.1 specific configurations.
- Reused existing SoundWire microphone widgets, as suggested by Srinivas.
- Switched the regmap cache type to REGCACHE_MAPLE.
- Link to v2: https://patch.msgid.link/20260910-add_shikra_support-v2-0-fdd2129c696c@oss.qualcomm.com

Changes in v2:
- Updated FS CONTROL and ADPT only for version 4.1, as suggested by Krzysztof.
- Addressed Konrad's review comments from v1 by replacing magic numbers and
  lower hex reg values where appropriate.
- Link to v1: https://patch.msgid.link/20260608172023.2965292-1-mohammad.rafi.shaik@oss.qualcomm.com

To: Srinivas Kandagatla <srini@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>
To: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>
To: Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
Mohammad Rafi Shaik (5):
      ASoC: dt-bindings: qcom: Add Shikra RX and VA macro codecs
      ASoC: qcom: lpass-macro-common: Add missing v2.9 version string
      ASoC: qcom: lpass-rx-macro: Add shikra compatible
      ASoC: qcom: lpass-va-macro: Add shikra compatible
      ASoC: qcom: lpass-va-macro: Add SoundWire microphone support

Prasad Kumpatla (3):
      ASoC: dt-bindings: qcom: Add Hawi LPASS macro codecs
      ASoC: qcom: lpass-tx-macro: Add support for Bolero v4.0
      ASoC: qcom: lpass: Add support for LPASS codec v4.0

 .../bindings/sound/qcom,lpass-rx-macro.yaml        |  35 ++
 .../bindings/sound/qcom,lpass-tx-macro.yaml        |  19 +
 .../bindings/sound/qcom,lpass-va-macro.yaml        |  36 ++
 sound/soc/codecs/lpass-macro-common.h              |   9 +
 sound/soc/codecs/lpass-rx-macro.c                  |  19 +
 sound/soc/codecs/lpass-tx-macro.c                  | 442 ++++++++++++++++++++-
 sound/soc/codecs/lpass-va-macro.c                  | 429 +++++++++++++++++++-
 7 files changed, 972 insertions(+), 17 deletions(-)
---
base-commit: 5c4d4169604b335c38bbc79bc1fc03042981fc6f
change-id: 20260922-add_shikra_support-3e3af01ee9c2

Best regards,
--  
Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>

