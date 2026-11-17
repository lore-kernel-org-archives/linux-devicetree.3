Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794956436;
	b=KKSpFa1x2Tw1bf+qU9A3zWxKGXyvihDQc+mi/Uk5bVpc4xZXEZ4qcUc1B2T2tW1h40ZM
	 rPX9VmeftfHnF3NZO0FXRvPAYrUQ+midjFjEK1h7hkd3dWieVNu9V5tOdW3fCqTXEQY11
	 2urgBlVOOI+L1s5Cm8QFmOx3jWQT+W3SzxpdAw5OMOR43giOV0nnrdWRK6vO/j4662VkZ
	 RplVBKf80Ce7IDHl7Tp+5VYafXBL3Avsveu4wOdJcTobPBUKZqLfxN+qox9QvA7kOVmY8
	 6eM594k4ZpCztlI4G4E88a0NOlEkSupQktpvdIe3OktOZq+4skO7NnWJGWjes+Fh1bg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794956436;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=09dYCF8rOk5krx8GfedSFPYP96z1DkZBbcqH44BbhkM=;
	b=3JVwXkOlqvkO9wETh5mMxM9iobmI7h3Evr74qj6drnAXZDzSCyhbAJjUZIQEfTp1XYsI
	 a7ZB8x2jtiohrjOSagZ8PMoNHEdU6g07XQD6WyBXWPTgqs6YQgD3ao7p6Xu4sjZuoNWbZ
	 sLb1kKIbeQZTzoQwpQcJg1eU/DUe2v+l5s/al+OSZH2KMJhmxUj8ow3H9W6sbap1lzdvv
	 vV0c3tBYBHQdAUO3Kh+zl3FKk5nIgYssiF1EJ/PncUQdcjzGiONhkXS2yTqMKaoZBK0Ie
	 Ku7h2SofwHi9Xt/NzqjpvZljBTdd5I7TMGRv7D6jzImJYlhxUKJQgKDyatyOuhEpPLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dTioYphf;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PckqVD2z;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8750B606A330
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 23:00:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8750B606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dTioYphf;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PckqVD2z
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHMfF8H1614080
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 23:00:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=09dYCF8rOk5krx8GfedSFP
	YP96z1DkZBbcqH44BbhkM=; b=dTioYphftzIms+x2W4bXJvQaCKzVJwgXpGBImA
	6WvFa8Z57secBPRMUQgDt2reo6JmnNFW/9FnOm34Ms4aM9UXxiOjP+NGY00y22el
	NMONzJMU6fbQhHOCtlHBYet1J3JMo+0+3wy/2M7PVqPxswY+IcO4OXp9bgZiBtci
	H5rAaTFsjJDNaQgEncbMc8IeVN25wfRZoPxAVVVRIv3kZkTo6TdAxcSXI+xKyqxS
	X45v6VuT9/E1BHGQbwO4d8mjeFaqoNo20eCZ4P4QNcxErwFTOLV9gEfCTg7gly08
	jse/tE+kbnEP9kIvmnNS9EsE5S8R37/Z4SkNmvVP0+OHmuiA==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv8r2m0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 23:00:34 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1af203073e0so379487c88.1
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 15:00:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794956433; x=1795561233; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=09dYCF8rOk5krx8GfedSFPYP96z1DkZBbcqH44BbhkM=;
        b=PckqVD2zhc08iA5u/owxTOlsLFdgQoRMY63SPtfx9qYUWP0EUbmQcMEU2Xmr68q/xO
         /SXTfGiHk3KsmD8bDiatcadPkeQCEqPVV8ZRK8jeiFRcVijdIRZdTFF6MSddivLlAHDZ
         FsmuKcQkQO0nxnsdresUf3UkKWeoto5lV1ePV6Iz1651zDaFcAIWE0vd6tTNxlMco3e+
         PBaN17HoLQUgqXiRQXhAlbsppm0xWrI9JdRyTiPD6ThZDJZSTKTyhwlro9OwD0oU5gXi
         5RJhMKcoSGiA8EjkQPLH83Wv5EfuZJiEDk2VeJonqBCGQjpCKFURXz/W8qUUjPTJO+xq
         e2Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794956433; x=1795561233;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=09dYCF8rOk5krx8GfedSFPYP96z1DkZBbcqH44BbhkM=;
        b=23Dd4LjsKx/DqY30voeomG6CQjO4D3r0wj2FO9IGuxRhkVQmSXJ1JEYbmTEo1Jvr1M
         2iLRRrIyTAEVqi4ytgvMNw4CYSGYLCsz55NIkas4HtiD4C4gqgbOPzh56duvcqdVPW6z
         3cm7vrZ8leCqOMG4PhSUuzNTLDtaEe5Q2mRNHK0qg++71YHTKeWXOlbJDzQJeLpaHqBG
         WuLFgfjgp4yEv2fALVlpvLwpQFk68oGCTL9ixfSmlcNchuL04U3Kc2DJotQuJz7pYvjC
         laegpwxkEiecg9YbMwuWh41XPG4eYw9eRQ7wvHNIsVilLMlckKyPhiYAVi8NUD5YaEZd
         azbg==
X-Forwarded-Encrypted: i=1; AL+hErGiTEAJSKxRyUSVJXGg9RyIhCb7gk0WofZlSBLdKWt/FcTKYR2i10OkSwkG7oSyo/dKRu/tDZjpFlCj@vger.kernel.org
X-Gm-Message-State: APuU4Z/0rm2coG7zlXxc9GmnJik3d0zwzSLjPsHGYobhZbVwXcRRFbBi
	LFIBNVVBIvs3ZdnCZF32mDm2Vn9ySoWPmu/+cGZ7OTgcLPKI9mH6Q1J4GOBcRGS1mS2UB7LhYfc
	QuE9m6UxyaPg5H6FlSiiMuwMgsCWnm52v4OZ8FpJ45ohQe1Y6fa64WX7cUky0RAcg
X-Gm-Gg: AYBFou3ROB5hwuj7+uK9sVbpD4CnBZlOhRhwvGzT1DOdW0ycOAqKAaby1dO/v/AZIGr
	03JaJrA31aYzuwigHi9NmPxw7w5K1d7pRkkGvabucB8SCe2D2WSHe+QOi7XQZDYirOSWik36hy3
	nHjuQN2LDlbU+yTPnQfdSBYHKlEK2suHeuf1VdnhgMiuF4ohf+nDTuSD+PTUJvmVakmRqvU9hQI
	PiXsMJxnyfLuBdIq7mfY8QmaJJYxurp1bf/y7Xhmo0uGUTON1NzmVxu4HIY9BWEoiVoEr8ON6aC
	VlJkbnw7xQU4RgtwUaaRccLsQKiHJW+cTJPs8diT5dCRgYT9+BvAMNTzEUYNVgaWCp6gYifIvly
	c/2dILJbSAbg12p8tsSmU1FvyGTR/OCL7heF4BWknYKq1y/QnT34DVnrkOyoVlAnROqGJdVnYRg
	==
X-Received: by 2002:a05:7022:7a1:b0:143:2719:f800 with SMTP id a92af1059eb24-1b543c0243fmr1084602c88.40.1794956431716;
        Tue, 17 Nov 2026 15:00:31 -0800 (PST)
X-Received: by 2002:a05:7022:7a1:b0:143:2719:f800 with SMTP id a92af1059eb24-1b543c0243fmr1084555c88.40.1794956430920;
        Tue, 17 Nov 2026 15:00:30 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5445eb29esm1380839c88.0.2026.11.17.15.00.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 15:00:30 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Subject: [PATCH v2 0/5] drm/msm: Support for GPU in Nord
Date: Wed, 18 Nov 2026 04:30:03 +0530
Message-Id: <20261118-nord-gpu1-v2-0-8d6d9908b7c5@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAHPc/GoC/02OMQ6DMAxFr4I81yihIimdeo+KIYALkUoCCSAqx
 N0bQoculp7l/7438OQ0ebgnGzhatNfWBMguCdSdMi2hbgJDxjLBGbuhsa7Bdpg5SpJcFVyRyK8
 Q7gdHL71G17M82dE4B+V0LqFSnrC2fa+ne2JonTBqORdwBDrtJ+s+8ZeFx8SvtvirXTgyVEwoU
 eeyakg+rPfpOKv3YU7DgHLf9y+eqFvU2gAAAA==
X-Change-ID: 20261008-nord-gpu1-7e71a91ae653
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Shivam Rawat <shivrawa@qti.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Aastha Pandey <aastha.pandey@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794956423; l=2015;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=XNYDbe7JsC6Mxpz591wHG0DJ0ExB4SLBBC/CinHe9JQ=;
 b=qRU/MrT6YHgAh1gf/2YbESmKUXuSGsHWRcpYYPWAf7EfN/e1pLmsQbv9OEQf2qbEV2UcoQOGM
 +6uPaIyGylPCebV424W3V5xswE55jy2cyar6bWpeGGL3l/1gl3wZXYY
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-ORIG-GUID: bw3JZvB_q4hZnlSyXkGuHEmkn8huZ6dB
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA5MSBTYWx0ZWRfX04yRNXfJgLcA
 WweIh6cIG9o2KrU7D9b62IgjIQqhx3qNFXzK69TEOxQXnb1Vx6hYhXUbEwRmeK1s/zIfsNB2LQ2
 SwfNw4qetw/OaXghULjO3PWNPatILb0=
X-Proofpoint-GUID: bw3JZvB_q4hZnlSyXkGuHEmkn8huZ6dB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA5MSBTYWx0ZWRfX6k5tp5Z6Arer
 i9yV9/jt3hR5ELPUzybYjXpy5GvM/nBKtQnJW17tMZYDOxe7DvEwNcWO9945weL9Qd7ABjjKJGj
 omShR+IoxsauTE/YJ3lzrQHuzlcN+0Jv0D3CwaDVXTFJ9qy7CFv4lv09ba5Py+t3ql7YgAF3yWM
 TJXP1hJZ9LDF2gEyht+bckDqevMXGEJDx3v3p6o7Qz/nphDhtoNwUiYPeSt76ecSxhGIWN19nuZ
 Kbm42bvHjhOT+sFrolskQSk/XZ7ufsSHuLq5CLP6cY/CpHtl5foUGqIxT/YwTZenQB8f6T4PVGe
 c4zwyq9jN8SAvX8jeITM6tXjZ+Q7clYVxp+5LQMcohuC1f3EZ2py+MryBL612Pg96+ewEc2Xaj5
 hphra8W+Yt+ZQMA2BJfNtWgOol0AgK+ImVOW6GvxOcjRavEc6GLmA2t4hSVPw06bKE5pkJ8icZs
 yCM47NIQxwiBkjGeDng==
X-Authority-Analysis: v=2.4 cv=NNVAaE6g c=1 sm=1 tr=0 ts=6afcdc92 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=eQK-ig326sWed8EMzPoA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_05,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0
 suspectscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170091

Nord is the first Snapdragon chipset with 2 integrated GPUs. It has
an Adreno 753 GPU which is very similar to the existing A750 (SM8650
chipset) and an Adreno A735 which is similar to the Adreno X1-45 GPU.
This series adds support for the A753 GPU. A735 support will come later
in a separate series.

The driver and dt-bindings patches are for Rob Clark and the devicetree
bits are for Bjorn to pick up.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
Changes in v2:
- Rebased on next-20261116
- Collect trailers
- Split the GPU and GMU nodes between nord.dtsi and nord-embedded.dtsi to
  match the existing Nord layout (Shawn)
- Moved the GPU cooling maps into nord.dtsi alongside the thermal zones (Shawn)
- Fixed the GMU OPP table to match the clock plan (Konrad)
- Link to v1: https://lore.kernel.org/r/20261009-nord-gpu1-v1-0-a06a6c57bde7@oss.qualcomm.com

---
Aastha Pandey (1):
      arm64: dts: qcom: nord: Add GPU cooling

Shivam Rawat (4):
      drm/msm/a6xx: Add Adreno 753 support
      dt-bindings: display/msm: Document Adreno 753 GPU/GMU
      arm64: dts: qcom: nord: Add GPU and GMU nodes
      arm64: dts: qcom: nord-rrd: Enable Adreno 753 GPU

 .../devicetree/bindings/display/msm/gmu.yaml       |  33 ++++
 .../devicetree/bindings/display/msm/gpu.yaml       |   1 +
 arch/arm64/boot/dts/qcom/nord-embedded.dtsi        |  79 ++++++++
 arch/arm64/boot/dts/qcom/nord-rrd.dts              |  12 ++
 arch/arm64/boot/dts/qcom/nord.dtsi                 | 220 ++++++++++++++++++---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c              |   6 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c              |   5 +-
 drivers/gpu/drm/msm/adreno/a7xx_catalog.c          |  35 ++++
 drivers/gpu/drm/msm/adreno/adreno_gpu.h            |   5 +
 9 files changed, 361 insertions(+), 35 deletions(-)
---
base-commit: 38c8be16846f10f3a710351357e4f4ace7254c8e
change-id: 20261008-nord-gpu1-7e71a91ae653

Best regards,
-- 
Akhil P Oommen <akhilpo@oss.qualcomm.com>

