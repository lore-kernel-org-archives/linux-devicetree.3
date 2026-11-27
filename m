Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795787545;
	b=XWiQU+LyTidWihZtR+AkLlPoEkVuhg1bACnbfDHGvb1wBteclqWoMZM8LnC0/TCobFvM
	 Hmt4Kscw+K/CwbzOpf397iRqEUrssPlXHuK8e+udziymeFIQK4X5V2YtwF+pvqymmJbUt
	 w37UPWf99g4Jma8Z7D2t7hF7SMGNhNTuGRU7oaDT3pZ3qcWWkEwD6W8G2LOoAdLM5QSaR
	 1LFMcTWCcWCMG8y8QQC2x/E6p92nJ9daesF8Ww09Img8CgyZnv7mmBQ3pwnvN939oUvNy
	 OdftDah7iqClyNrI1NIdrJTvJWzsmh5YErOrbEbbVaxJS8dZ4IIBiMX90qzdGntp1Pw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795787545;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=tnoWArl2HUpjRgOjudjV9w9iXKmNmwdOFIWAzIgu+38=;
	b=rfb3fSGZc33dJMpokq47puWC9MBpE/TxX5yFnoDwfIUIpIsez3J94e6mT/Lj3rGe3+R0
	 22APIJQts23UCY/xz6rwxnG1oDNrK2qAVjoufo1K+SHqGs30BQY1+/B3GB3Sjfp3/q1sZ
	 nc0YQseF1n+Zv7eRsS1VpscQ6lJkttkUFXKAprsap4qqZK+U55ukdnyXjyE3LUhj5rAWr
	 SA0hxZX5IITxhLBJ9Ntu7kNfJWyGC19lUKSQDSC38CUnkbAvrtsegLfswghI/T27YjEzM
	 nMO+/Do/TqYLHP3TqCBCw9edYW1HLBtw/+VTm0W8lZgDjvM5NTGFG+ov6BMzC9lvoKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ji7XeqFc;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GQouWFl0;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 288A6606A321
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 13:52:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 288A6606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ji7XeqFc;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GQouWFl0
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARChDKI2512661
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 13:52:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tnoWArl2HUpjRgOjudjV9w9iXKmNmwdOFIWAzIgu+38=; b=ji7XeqFcMKanAsu6
	iKnR7gh3/PTAw7OmOmq+z2uzQOSuCJUoCjQcEY3ko9da0LijfBg5Kvr/riweyYiY
	st4FiGye0+qd4oZOx9zBxTqLHXif+Rl0Sx+JkBXIOI/HSQgo9CJFOZelKStzGqoD
	Pa7IMgOMMSRfqR+GO82CJSMwxKACTHd5K4GtXmkWZJ7CE+wOnBjbr15kJwdav8JP
	IYzc0q2ISgaVKfhiQTUl8oYnpAXmjgN3gG2eEaVqaTShxigRR1Gd8RX2SkL+Yni7
	vr4I0I+kQKsULwIn5KY0oy4M01vCaLQTQIvd/tmwT7NY60RIaALzOZTA2f/PCJn3
	PUajJw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j73uhhw8m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 13:52:24 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8bfe396acb4so5306619b3a.1
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 05:52:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795787544; x=1796392344; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tnoWArl2HUpjRgOjudjV9w9iXKmNmwdOFIWAzIgu+38=;
        b=GQouWFl0FPid/Q+IR42tD59I/E35MzJKqdEqs007sXYBTPDnlunfZRXQHWnqVUTYFy
         ZX6H6lRsCVICrcirqhjCdGvyWzG0Ah2AAscV/D7Fh3qfZfCPXN0FEj6xYluLHfVi26fr
         gJGr7c7OriH/4RZiBqKNZyw3qVzJrZGTGWxZeOyc4hgNh6kcr4Ei3xP6rbtk67mIMG1i
         PAB7QaoRPbJpa8kHrZQ+b7L99Ofd82+mxA/k9FosvtHiuJoR2THtamQrtjWWGMJg6BFf
         TXJ1biuosiAd/dGQSQgm4EpwIv4Gzc8/fLnvIgAOAK6LFe4Brgm9ErxdhLLUkJVIebp9
         BV/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795787544; x=1796392344;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tnoWArl2HUpjRgOjudjV9w9iXKmNmwdOFIWAzIgu+38=;
        b=AqALLBoDgKa+OuzpyA4JRb7SQRf3I8/+PWWZUuzW+P5XkEADQNzIQLC6xvRZeyuk9M
         dSYHQcQ6h9rp/3hriptWGHTN0SiVKN42jDY1MJ5CAq5HUQI3UQLNuhHAxP6o16J4c2Kl
         9oTdcx8oe89QX49z6i0PNuKlNyAqLNI9XoEpCSpoGjhWRFg2inai+C1hjoOrtYlqBBh8
         0TiDP7gNh9ecSMylzwH/75KIVGShGXilUTwycut/NfZt4M6rFyX/30MELGI0wn8o7E9r
         ZRhxagvfo4WtzwDbPbhot78rJaRvogGaY6xjWaoOgRozJ/jNBVgxB1rOArcefm2H6NnK
         17tw==
X-Forwarded-Encrypted: i=1; AL+hErFrKuMACxRgLK4wXPMfLOqtSrQF4syxbHayDl7dyzV9ZN2wa4a5z99MncmTfkWDnnBbZYrRA2Lq4EVC@vger.kernel.org
X-Gm-Message-State: APuU4Z9Yr0Q1TngrG4LbkvGq4677Awm8gspW/adrHBIKNZgThLv+Bl4P
	uaMKpVRVmPNrzDsDRX0BXOdr0/oT02deVKLRY8dqSkC2erVuBzBdwK0pFIEOtEywQdqx4P4tPoU
	BXcwfLQNtpsqj8i61Tei0GhNqx5J1Et+SDX97y0cXl/Dl6ZA+BbzFiPLfVwsaXdvJ
X-Gm-Gg: AZFdTZfk5jzroLiteGoZzE0QhdoyPYL9kbFMhCvi5H5flbh8kFNihTeMJprdSI9VCol
	L3CC9kw5Xw9oAgkJSu+G87cGFgHznh7cob1nMC3NS/0l3cdT1lW5DAHJHwMup1fpjR4/uJnN9Ms
	AIqpCdtGXE6WC/6ijjriZOI5xnhDSgfo3iRzPAZbluD5eteZZkBMC6N9ssLHfh9Jt+kUJOUJHR7
	XIYLwjDXhOFd38qyv1aJ7nUN64ep7YW86bo/njA3if92++eFfsUjfw9LYgmU4jt+YPTAhuH7U9U
	5KEb+g2qqiDdNoyjutCoIrTNPtsOmzH/CQGSJ5ZjZxyLpuiUWK/Cw/7wznpR17H9LOde2iJ99JY
	J997ZMaZA6RINMzbPC3aFvAU6WyqGSnHbZvL38gq2YJvUwY7v7opNMZwSHAzN7aJVoAJKgW2qxt
	feDjE=
X-Received: by 2002:a05:6a00:2e22:b0:8b5:e4bf:a075 with SMTP id d2e1a72fcca58-8c87ce31c42mr23021618b3a.36.1795787543542;
        Fri, 27 Nov 2026 05:52:23 -0800 (PST)
X-Received: by 2002:a05:6a00:2e22:b0:8b5:e4bf:a075 with SMTP id d2e1a72fcca58-8c87ce31c42mr23021581b3a.36.1795787543017;
        Fri, 27 Nov 2026 05:52:23 -0800 (PST)
Received: from hu-raviravi-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87077944bsm12747353b3a.2.2026.11.27.05.52.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 05:52:22 -0800 (PST)
From: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 19:21:47 +0530
Subject: [PATCH v3 1/2] ASoC: dt-bindings: qcom,wcd9378-sdw: add non-SDCA
 (mobile) mode
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
Message-Id: <20261127-b4-wcd9378-v3-v3-1-397e5ba2da55@oss.qualcomm.com>
References: <20261127-b4-wcd9378-v3-v3-0-397e5ba2da55@oss.qualcomm.com>
In-Reply-To: <20261127-b4-wcd9378-v3-v3-0-397e5ba2da55@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Ravi Hothi <ravi.hothi@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA1NSBTYWx0ZWRfX3d1gIt+ndvXW
 SIPq/S9oLNIFrlYf1kTmR91u9MzACOCb+oCHlKY298c6mRPsqH6JOLoUYa4xCGIRSWdc2SLsV1z
 GvrzH9ihJkqbtP2NARb+eO5roAb6fxU=
X-Proofpoint-ORIG-GUID: Kpv2s7dHDygSrp98VjZmTBVPyn4HmP5y
X-Proofpoint-GUID: Kpv2s7dHDygSrp98VjZmTBVPyn4HmP5y
X-Authority-Analysis: v=2.4 cv=BbBNQbt2 c=1 sm=1 tr=0 ts=6b098b18 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=gEfo2CItAAAA:8 a=GYSh3LzNAAAA:8 a=EUspDBNiAAAA:8 a=fcspkU3XncssIb0DMhQA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22 a=sptkURWiP4Gy88Gu7hUp:22
 a=lWcdFasyL5yHfcDTNXXo:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA1NSBTYWx0ZWRfX7vvOp4HtR8+j
 MJobFeBlFuzbj4pVfsLawvxXbV7btF6F7D46VOS9Pvo92drmgXYFmkuaT3smvKcMFp3vJS4efaE
 MHC1MyFZPyjBkupwQf/oUs1hWAtL+bE9IFCBJMf+nTJv812lAjfuYlU+Jae3wSHyzv0yU1/2GgY
 vm/hvetneO9dF6wxlMSjxBsFdssYC4Sx4bDknkGxo0kybHvLnIo3505MIlQ4+X0D3/GZ99MokqP
 6RYpoyrZFwm4+3uRhvox3rM6yKfle6Dira+WAbbxp5aP3FgC9PNF3OJbXRjG9trWuaFsGFTU8JI
 bpzPOCoXK5eOXmHPqsTwRYqs3CXR+a2kR4FYAYgLpnkf4IbacmIs/3JJWjr3RG5eBp7FOQB4Hiq
 IAmZ43rqb9dVtjautv7tPDAOjJnBNiOHebiR+24Rv3hUs5OoyBSADOpbqAAGo4uQtBwaiopwgcH
 uyCCizh+W9KsL/Y5GjA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 phishscore=0 spamscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270055

The WCD9378 silicon is fused either SDCA-compliant, which is what this
binding describes today, or not SDCA-compliant - the "mobile mode"
fusing. The two fusings put a different number of devices on the
SoundWire bus: an SDCA-compliant part is a single device aggregating the
playback and the capture path, while a part that is not SDCA-compliant
splits into an RX device for playback and a TX device for capture, one
sitting on the playback SoundWire link and one on the capture link.

Both fusings carry the same SoundWire class ID and therefore the same
compatible, so they cannot be told apart by a separate binding file.
Describe them both here instead, keyed off the existing
qcom,sdca-compliant property.

Only the capture device reaches the codec control register space, so on
the split fusing the TX device is the one that drives the codec, and it
references its playback peer through the new qcom,rx-device phandle.
Either way the device that reaches the control register space owns the
codec-wide resources - the reset GPIO, the supplies and the new mic-bias
level properties - and exposes the codec's DAIs, while its peer
describes nothing beyond its own data path.

qcom,port-mapping is shared between both fusings, so its minItems drops
from 8 to 5: the split devices map five device data ports each where an
SDCA-compliant device maps eight.

Co-developed-by: Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>
Signed-off-by: Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>
Signed-off-by: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
---
 .../bindings/sound/qcom,wcd9378-sdw.yaml           | 172 ++++++++++++++++++---
 1 file changed, 149 insertions(+), 23 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,wcd9378-sdw.yaml b/Documentation/devicetree/bindings/sound/qcom,wcd9378-sdw.yaml
index 62d85b1dca7f..03ee4a4deea6 100644
--- a/Documentation/devicetree/bindings/sound/qcom,wcd9378-sdw.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,wcd9378-sdw.yaml
@@ -4,19 +4,21 @@
 $id: http://devicetree.org/schemas/sound/qcom,wcd9378-sdw.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Qualcomm WCD9378 (Tambora) SoundWire codec
+title: Qualcomm WCD9378 (Tambora) SoundWire devices
 
 maintainers:
   - Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
 
-description:
-  Qualcomm WCD9378 (Tambora) SoundWire codec. The same silicon can be
+description: |
+  Qualcomm WCD9378 (Tambora) SoundWire devices. The same silicon can be
   fused for a mobile (non-SDCA) mode or an SDCA-compliant mode; the
-  qcom,sdca-compliant property selects the latter and is required by
-  this driver.
+  qcom,sdca-compliant property selects the latter.
 
-allOf:
-  - $ref: dai-common.yaml#
+  An SDCA-compliant part is a single device aggregating both data paths.
+  A part that is not SDCA-compliant splits into an RX device and a TX
+  device; only the TX device reaches the codec control register space, so
+  it owns the codec-wide resources and references its peer through
+  qcom,rx-device.
 
 properties:
   compatible:
@@ -27,19 +29,28 @@ properties:
 
   qcom,sdca-compliant:
     description:
-      Present when the codec is fused as SDCA-compliant. The mobile
-      (non-SDCA) variant carries the same class-ID compatible and is
-      handled by a different driver.
+      Present when the codec is fused as SDCA-compliant.
     type: boolean
 
+  qcom,rx-device:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Reference to the playback (RX) SoundWire device of the same codec.
+      Present on the capture (TX) device, which reaches the control
+      register space and therefore drives the codec on its behalf.
+
   qcom,port-mapping:
     description:
-      Each entry maps a slave data port to a master data port.
-      Entries are in order starting from slave port 1; slave port 0
-      is reserved and not represented. SDCA-compliant mode uses 8
-      entries covering DP1..DP8.
+      Each entry maps a device data port to a master data port. Entries
+      are in order starting from device port 1; device port 0 is
+      reserved and not represented. An SDCA-compliant device uses 8
+      entries covering DP1..DP8, the split devices 5 entries covering
+      DP1..DP5.
+
+      Several device ports may map to the same master port, in which
+      case they are distinguished by their channel within that port.
     $ref: /schemas/types.yaml#/definitions/uint32-array
-    minItems: 8
+    minItems: 5
     maxItems: 8
 
   reset-gpios:
@@ -58,24 +69,93 @@ properties:
   vdd-mic-bias-supply:
     description: Mic bias supply.
 
+  qcom,micbias1-microvolt:
+    description: micbias1 voltage
+    minimum: 1800000
+    maximum: 2850000
+
+  qcom,micbias2-microvolt:
+    description: micbias2 voltage
+    minimum: 1800000
+    maximum: 2850000
+
+  qcom,micbias3-microvolt:
+    description: micbias3 voltage
+    minimum: 1800000
+    maximum: 2850000
+
   '#sound-dai-cells':
     const: 1
 
 required:
   - compatible
   - reg
-  - qcom,sdca-compliant
-  - qcom,port-mapping
-  - reset-gpios
-  - vdd-buck-supply
-  - vdd-rxtx-supply
-  - vdd-io-supply
-  - vdd-mic-bias-supply
-  - '#sound-dai-cells'
+
+allOf:
+  - $ref: dai-common.yaml#
+
+  # The device reaching the control register space owns the codec-wide
+  # resources and exposes the DAIs. A data-only device describes nothing
+  # but its own data path.
+  - if:
+      anyOf:
+        - required:
+            - qcom,sdca-compliant
+        - required:
+            - qcom,rx-device
+    then:
+      required:
+        - qcom,port-mapping
+        - reset-gpios
+        - vdd-buck-supply
+        - vdd-rxtx-supply
+        - vdd-io-supply
+        - vdd-mic-bias-supply
+        - '#sound-dai-cells'
+    else:
+      properties:
+        reset-gpios: false
+        vdd-buck-supply: false
+        vdd-rxtx-supply: false
+        vdd-io-supply: false
+        vdd-mic-bias-supply: false
+        '#sound-dai-cells': false
+
+  # An SDCA-compliant part is one device carrying both data paths, so it
+  # has no peer to reference.
+  - if:
+      required:
+        - qcom,sdca-compliant
+    then:
+      properties:
+        qcom,port-mapping:
+          minItems: 8
+        qcom,rx-device: false
+    else:
+      properties:
+        qcom,port-mapping:
+          maxItems: 5
+
+  # An SDCA-compliant part takes its mic-bias levels from the function
+  # topology instead.
+  - if:
+      required:
+        - qcom,rx-device
+    then:
+      required:
+        - qcom,micbias1-microvolt
+        - qcom,micbias2-microvolt
+        - qcom,micbias3-microvolt
+    else:
+      properties:
+        qcom,micbias1-microvolt: false
+        qcom,micbias2-microvolt: false
+        qcom,micbias3-microvolt: false
 
 unevaluatedProperties: false
 
 examples:
+  # An SDCA-compliant part: one aggregated device.
   - |
     #include <dt-bindings/gpio/gpio.h>
 
@@ -99,6 +179,52 @@ examples:
             vdd-io-supply = <&vreg_l18b_1p2>;
             vdd-mic-bias-supply = <&vreg_bob1>;
 
+            #sound-dai-cells = <1>;
+        };
+    };
+
+  # A part that is not SDCA-compliant: an RX device and a TX device on
+  # two masters, the TX device owning the codec resources.
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    soundwire@6ad0000 {
+        reg = <0x06ad0000 0x10000>;
+        #address-cells = <2>;
+        #size-cells = <0>;
+
+        wcd9378_rx: audio-codec@0,4 {
+            compatible = "sdw20217011000";
+            reg = <0 4>;
+
+            qcom,port-mapping = <1 2 3 4 5>;
+        };
+    };
+
+    soundwire@7630000 {
+        reg = <0x07630000 0x10000>;
+        #address-cells = <2>;
+        #size-cells = <0>;
+
+        audio-codec@0,3 {
+            compatible = "sdw20217011000";
+            reg = <0 3>;
+
+            qcom,rx-device = <&wcd9378_rx>;
+
+            qcom,port-mapping = <2 2 2 3 4>;
+
+            reset-gpios = <&tlmm 162 GPIO_ACTIVE_LOW>;
+
+            vdd-buck-supply = <&vreg_l8b>;
+            vdd-rxtx-supply = <&vreg_l7b>;
+            vdd-io-supply = <&vreg_l7b>;
+            vdd-mic-bias-supply = <&vreg_bob>;
+
+            qcom,micbias1-microvolt = <1800000>;
+            qcom,micbias2-microvolt = <1800000>;
+            qcom,micbias3-microvolt = <1800000>;
+
             #sound-dai-cells = <1>;
         };
     };

-- 
2.34.1

