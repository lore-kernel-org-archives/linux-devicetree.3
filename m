Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C6E44E532A
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 12:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789733137; cv=none; b=j6u2/f+/hjq+3AJnLFMHy8OEG/3hAVwvBKNfA/EBiyHy7qPrLPw16qUgqlnCaSpLpSm4Rj4hUlZrR6TPX5+6dy23z3mVFzeAZ07FYsQ0EIZZZorWfw9WYHQNd1PiqcozphrRS6v67SwL4SNZ/G7OxMrcnriLBgKZUiTA5/rOnHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789733137; c=relaxed/simple;
	bh=Nyed4En6PwZe5yiCtAXyDUFH5d5UVwQL26E6t0jTMDs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=stn7eYYTBDfjxPLh5ZCfW+AApgz899y+4KMJ/vFJjWq74BVfm3NxGLmqLDpWDpMl1XHdW01oe1IIARc4zrjzgVd6gfkV8rT5AXbOLiphE29Ci8OuwXyBFnAv3mUWy2VcTpYDH9GwuNJOIDJjRyE3Luvo8a7ymvLK5VZH+e3PtcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BUUmQwaW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CitdiXtF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BUUmQwaW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CitdiXtF"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68I9ddI73801914
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 12:05:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=u157Y9EZ4rdCj82BSUWEmRUeIA7sKwxqgZZ
	dX73J1mw=; b=BUUmQwaWHcxeOPQjyd8UGMBGsgiR8EwAy2DYafwKyKMrlp8KhBm
	SsUtlRW5Kh7324DJho6rOPHMDgvhvpC5U3Q6pFy/lmt/epa2A+QbHQr91wu8m8Yi
	nQzFGw1CJzIH4WERgyHZLNm7L50Z2r5xCOtgV+ay3xbEeSWTCy6AaG32gqcYdyF3
	XPWpq2bcR/eSGEwjpLsRp/H2KgstILRkWRIQWCt2epCu0WbW6jKHzmzL9hvBbn2j
	dEkqGynrgU/o0hbVhbJoimh7aJ4CPoPU4+wAQ7AHLkbfn3V1Frsep5KhkbqzsAV7
	Vn3vvdmCEkOtr8kcm3q+F5IRJZuk/3Ero/Q==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grq2kueeu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 12:05:33 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93909014c85so124050385a.0
        for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 05:05:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789733133; x=1790337933; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=u157Y9EZ4rdCj82BSUWEmRUeIA7sKwxqgZZdX73J1mw=;
        b=CitdiXtFxcVj4cUXf8kTx0dHwAJ3oStF1cdw3S/YbqTUMr6G3XeeWd8mO9O4DUSjXN
         Nu2af1i+6idF+DbGzvOZWLadkaZx7qOspbZ5DU3HpJzKP46IYWQIsW3P/9apA5vF4PHO
         dN0HXHewZ+vSonhyrARWnetTBw7ut3Qd5X1sogeb9x4z5EPMOIBQglEtra1o6WtwCrTU
         blZgee+fJZefKzQAxfreaK04BP4mlZDEklueNc+XigRJ5tYQpv9JoymYegbdGGb21iQZ
         htAPhIUT6OlU5M+clOp04l5Bvz2Nekuq7PLJWsb2HCglnfUr+0388nksOSNPd01bHY/3
         htsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789733133; x=1790337933;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u157Y9EZ4rdCj82BSUWEmRUeIA7sKwxqgZZdX73J1mw=;
        b=IlszfUAXjr6XaDHqNMWBwezEtAVnoUxNbeVJsH2XdXvIPWD3kOeQQZvVRJiDNLO03s
         yxxlQH9MT1du7TR0MLFe1y1YVUvOIni8Q8tAkCa97YDa+bDsN1LOZvuPphHb4ufokqnJ
         2yz2HOYfhu1TD6e4tP9HONXutVnj9v5ntqfzMYQY1z8z/UaMUc9KcLEmS1oZkgwftm+3
         ol5KGfWh3uAkf0WP2lnL4zEovpNmzgB1J+0nXVp2oqGv1ukQM6p9UN2GIyUPVZ5priNc
         tYALdNBiRKo2/0wpdC4UcGq8YLLGDqhxwi3F3Rp9fgAeu6lh2IGL85dkJvD+pNO3xoMq
         F5GA==
X-Forwarded-Encrypted: i=1; AKwUvByx0OESsFRhRkEn+wGUl865FuM8Pj8nzMM1a3RBB6VOTODNf+8OoyQW6XKddGogwFoDb/Goeg8DMelW@vger.kernel.org
X-Gm-Message-State: AFuF++mIiXbB4lO2j6eUqlPbmYcV0PRT3IDazWzjTqP++SFuqljdx6zP
	vsg+qnXRw/b9u3pc2D6bcVh1rL+vsNu4NDvJc0Gv6RFaGmQ0TTu18fDO8kv2WLL93cBymrcUKCe
	nHnQnVuujfz9y5tU3nFBp0pBOZUlCBiYGQ+CG4M3ZgWIBWG8wl5BDUK+/3KEW0BvS
X-Gm-Gg: AYBFou2yFWWLE0yhkIN6x6n8nGd1Wwjvf2rY43GkOHhO+Gz+TpJXwMO2iMeGuFGpQa+
	j+RGDdlTL+HrG/NKIqJg2br7YnHKfnv0h0M+4eICdEY4vB1IiT+qGAavkBlq+fCfq+dIRsHgBvH
	WGVhnbLv2JqlIZwiBqQ4QO7tRwxqU2LHSVHhE4D1pMGQ0PQ2jiwu6nMwc8WpURjuRWefmQhBwmt
	luWoknV4vZ0odFfddeDBFYa2aoEGBY9i6pCX8nhvOHQF79JkOSMtvsbRdG3+stgaOtHOUuMlBgg
	LUcXN1cIPGS/4VMcbYKdUVA71Mcym04chJ0UgNbkuooA7UaGo8LowXPzoytTJsbf/s/h9HR2Tfe
	E3ClqnsyaoHyzMA==
X-Received: by 2002:a05:620a:458a:b0:937:80a9:94b4 with SMTP id af79cd13be357-93bdc64f822mr298204285a.2.1789733133154;
        Fri, 18 Sep 2026 05:05:33 -0700 (PDT)
X-Received: by 2002:a05:620a:458a:b0:937:80a9:94b4 with SMTP id af79cd13be357-93bdc64f822mr298196685a.2.1789733132563;
        Fri, 18 Sep 2026 05:05:32 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4871ff3ae49sm3917584f8f.10.2026.09.18.05.05.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 05:05:31 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Douglas Anderson <dianders@chromium.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: Abel Vesa <abelvesa@kernel.org>, Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 0/3] arm64: dts: qcom: Lenovo ThinkPad T14s Gen 7 (Mahua) support
Date: Fri, 18 Sep 2026 13:05:12 +0100
Message-ID: <20260918120515.595782-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDE3MCBTYWx0ZWRfX4qqY9uzO+ef4
 yLmmV4SzRYhpnYfsKRjSAtVY+k86/NDnP7l0/9DjikBKWBLl6EqtgrLCcTVEtQ7AXDsSOV4O9bt
 gXi90CR3hdoOiEcpGEgXM8935i5amkjFd27SkbJqNJAtafr5m6ZIpCV7MjBkOD0Kdpy9sdlsCLN
 5uUsSnOUEJd0W35G+UP71rZwdlJg4rN16yXZhOl86tKSu3/UHIIFdXTnJKl4NTj+6ERKptT+r3j
 tWDfQM9dXO2kISTjDaQ6zBaVoyeNzkfgXk+6GyeUUnlb8XASbi03rVG43eqHIQVBBFe5pD/E4pG
 BV/C5R1oZgvhXvfzGdPkwCrwiiVjQOw0ks9ysdpyrh/4McltMr8X8Rte9XzVKMM9JWSmN1J/MSc
 WBikgETh2RLsaD6F3gdLiwqSXKzM1+Rna+8xzz6GW5ZSERWVSk5C8rolxQmxOjtYKfJiq++lakJ
 p2CagPP/nRK8f+pIS8Q==
X-Proofpoint-GUID: plPK2MGZ-9xQsl0BXOs8SqTFWgRPnSeI
X-Authority-Analysis: v=2.4 cv=bcD+w+PB c=1 sm=1 tr=0 ts=6aad290e cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=J05Q59ynWE-0mZ9N3MUA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDE3MCBTYWx0ZWRfX0VASdXWqpX4h
 V3KbHC+izqwyht2ghQ+NnW9WiBHOeGBeKM3ndRCnVutZkR4i1boSSLYIifoVYJFXa7Xi+Mca/VU
 oiAJh1XAb+1BUxqmvDUs7bl0BeLemSA=
X-Proofpoint-ORIG-GUID: plPK2MGZ-9xQsl0BXOs8SqTFWgRPnSeI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 adultscore=0 suspectscore=0 priorityscore=1501
 bulkscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180170

Add support for the Lenovo ThinkPad T14s Gen 7 (Mahua), a Snapdragon X2
Elite laptop.  Patch 1 adds the board compatible under qcom,mahua and
follows the Gen 6 T14s pattern with distinct -lcd / -oled variants.
Patch 2 adds an edp_panels[] entry for the CSOT MNE007QB1-1 (CSW
0x1465), the 1920x1200 IPS panel shipped on the LCD SKU.  Patch 3 is
the T14s Gen 7 (LCD) device tree itself; it follows the Qualcomm Glymur
reference design used by mahua-crd.

Currently working on the board: internal eDP display, WSA8845 speaker
playback and DMIC capture, DisplayPort audio on the two USB-C DP
outputs (DP0/DP1), USB-C (host + charging on both ports), WCN7850
Wi-Fi and Bluetooth, NVMe, HID-over-I2C touchpad / keyboard /
TrackPoint, lid switch.  WWAN wiring is included but untested (no
such SKU on hand).

Changes since v1 [1]:
 - Split board compatible into lenovo,thinkpad-t14s-gen7-{lcd,oled}
   with lenovo,thinkpad-t14s-gen7 as the base, matching the Gen 6 T14s
   pattern; renamed the .dts to mahua-lenovo-thinkpad-t14s-gen7-lcd.dts
   (Krzysztof)
 - Drop the on-board HDMI-A / RTD2171A bring-up; DP-side link training
   succeeded but the bridge did not produce an HDMI signal downstream.
   Will be re-worked and re-submitted alongside the headset audio patch
   in a follow-up
 - Wire misc_3p3_reg_en pinctrl to the vreg_misc_3p3 regulator so the
   PMIC GPIO pad gets its documented drive-push-pull / power-source
   settings applied instead of relying on defaults (Sashiko AI)
 - Drop the unused wcd_default pinctrl state; T14s uses WSA8845 + DMICs
   and has no WCD codec (Sashiko AI)
 - Sort regulator nodes alphabetically (Konrad)
 - Drop the redundant &remoteproc_soccp { status = "okay"; } override;
   soccp is enabled by default in mahua/glymur (Konrad)
 - Rename WSA speaker labels left_spk/right_spk -> left_spkr/right_spkr
 - Include the raw EDID + decoded identifier fields in the panel-edp
   commit message (Doug); the CSOT datasheet was not available so
   timings remain the conservative delay_200_500_e50 preset shared
   with the sibling MNE007QB/QS entries
 - Picked up Reviewed-by: Abel Vesa on the DTS patch

[1] https://lore.kernel.org/all/20260913201835.250085-1-srinivas.kandagatla@oss.qualcomm.com/

Srinivas Kandagatla (3):
  dt-bindings: arm: qcom: add Lenovo ThinkPad T14s Gen 7 (Mahua)
  drm/panel-edp: add CSOT MNE007QB1-1 entry
  arm64: dts: qcom: Add Lenovo ThinkPad T14s Gen 7

 .../devicetree/bindings/arm/qcom.yaml         |    7 +
 arch/arm64/boot/dts/qcom/Makefile             |    1 +
 .../mahua-lenovo-thinkpad-t14s-gen7-lcd.dts   | 1213 +++++++++++++++++
 drivers/gpu/drm/panel/panel-edp.c             |    1 +
 4 files changed, 1222 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts

-- 
2.53.0

