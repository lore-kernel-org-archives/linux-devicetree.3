Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795376474;
	b=bDpgjlDiLB9QIT4MLjbujMqlPsnrpw1SIqZQk2uKFw6lz9dcUyZNZnScp2kPmGQKoDnG
	 X4Sd5+mxrxXRhi7HAF8Fjb6v29rEl++TRrldLoTUTF/XnQy1L9r6/XvbE5otYhltiXmQI
	 mEapEinJmPaRIOaPPO7OmvcGVZ0Ga09PHa30hvRl5OzVy1mpdAKaRsg8goeqh21f6YE5g
	 PX250eQWmsS2WqKJmzrbj1tq4HqnOrxAKREyDr2H8gAZih4tCy42rld0FnuJR1Bqb95xe
	 bJmemrPju4BhMuJsndQGBRlrIxpDhAEMtSZz+ON9xzjPLeMQDUyQXCS6VVv3V6NRb5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795376474;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=08JJ9gvzdH5RSu7lCMC6gz25P8IY9qc6nWmBwjiJQ+M=;
	b=uTVXSk9e4tRmEFpqQkthN0303NK+KUirBn3U2BrKuXjyXKASM7cEcqfpux/VyMZt1enj
	 QUuTNsLHV8l3Kev7PxkA2k01g+A/WaV6AOHJe56muqo4CWoCPFQW4w1LlmBPdhRzlf6iv
	 fr14IU8PAYKsQ6iWOt97XkKabagrc4LcCIhsmGq3lGgB9j8bIPVCO/YmkGkXXEDu8Pyja
	 1nTzHrwidfrfgDdUgUKqAb7hqQNGsSEjsnIW8Oe/C8Tv6Zxr/Mv/Q/sVoKch0eEDeMZRo
	 GlOgPPSt7zgYr2WxW+LJJqxfq+atQSp6s9JQk2Fhe/Dcchs6iOdZkFmj1OawTD5BQuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fWQVHv8K;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GRWuavx5;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59ECF606A31E
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 19:41:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59ECF606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fWQVHv8K;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GRWuavx5
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AMGUrCM3514847
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 19:41:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=08JJ9gvzdH5RSu7lCMC6gz
	25P8IY9qc6nWmBwjiJQ+M=; b=fWQVHv8KUbHKBlNOGxKzqfioXZa2mMNPUF/fcw
	Ab3cLg48+FK7qBIASUS9NG+i69mDfPm/imGUt2Ez5EC0ti3ApGRmcgFHE4l4w0kQ
	uhm8h5TMx6vr3Zydk13i/aXaInf0py+KfBE02LV6/VdV2zK7DNcCQ1YIr7L6SwNh
	Ff/mrqhZdteIF4EZTllARbAfWjQXkQHuENyzELR/mECMLuwxP9cJhjh4pTLOwfJv
	qsdASFvc8YD8AdWZjpMDRX+b3Z8oR5czuskaHYpudjoZ1TGYwerJcAZD3rYZmoz5
	CDjQEaCFoUD8BP2rSXvA0doFFZK+3E7npmdawefoPrLkx85Q==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j33p7v29a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 19:41:12 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3869accaac2so1207377eec.1
        for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 11:41:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795376471; x=1795981271; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=08JJ9gvzdH5RSu7lCMC6gz25P8IY9qc6nWmBwjiJQ+M=;
        b=GRWuavx5Euxm9v9+PV03+r6hAVCTGVDlSi052r0K8X3OOqfrEy1VsZjeCZkAFALv39
         tZ5WUa16cK5B9e+sCI3db37jMYm49TN12NBFAiMx8VdYI2ksBBPnJtmw5DVbfnGFs8kL
         D+51K3JxsxlkhzcAsnuYsKcyQJ8lrOkAHoQH8xfeyp2TygifsLqovVLd3R6Uj6J7Qxg2
         5EdNi+fmqbrFD4FcW45Kltjx1Augz8PMkvHkswYRaWsQ9k8ZMiZ4PTJsPVtaNZTkojBT
         O54YjuFp7FNPmU9oOWaiHJUEMUfCjjIgzt/yEd2fMShFZbSaqx/32mkTz1Ny5P/SPEJL
         Lj8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795376471; x=1795981271;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=08JJ9gvzdH5RSu7lCMC6gz25P8IY9qc6nWmBwjiJQ+M=;
        b=l/KdxFD+wHyNQYroDNqEvMuUh1/lVhp0XbFGpXPl8/CViJnuUv3Il1wm8pv5O8lLTG
         pOM+6A9xdGFvifLssi4iJKkiXfJqMjzkLFiFWD4326iim8Wn5hDx4uoLgUZUXeZsVbWT
         X93Yt7UTqFxSczqNeKGfzWjkBWap+2+obT3lCqiTUYcSk3d8qLXX2yQ5H7ei8kWCPd3B
         mZlwZL8iDjP56wCN7t/hiqUopY5zKPCxfKJBWk6eMY6m2eM3Hfpg3G4s8uO/yzZx8ZFG
         Fts119L1Mrz+4z9mzMOQdZSoSTBH8aAA41Qaa0QzcrzFmC6S88yCIZybYq2qLSHd/XE1
         PwMg==
X-Forwarded-Encrypted: i=1; AL+hErGpnDAXvcuraWV7lPDPuz3ue6vHoNWHoEEMBK+/7h7VD1ABXKjSwXFKIJs9+RTnbgZQTPIgvh/n59d5@vger.kernel.org
X-Gm-Message-State: APuU4Z9DGPpfQeSY2xLEvC8DTRJX62Foeu06e10mpJVQz9iBy2R7quOC
	3I7qmJAJWJxx12nAaKc/jTjC1z+jXmAJAa5RtmlJtIxLsGROGCVtGml0ivwkBOI93OG7c1OdXNz
	uYDm983OudqMwmdw1ZzY+Xq/0SkWL2k0O7ethJSEPHSGaNhoupWoak/k3vtjputR2
X-Gm-Gg: AZFdTZcQLNZrheUfIFpGqhVMr8fuofqh43LYJHB0v3kpJl0AAvlcPEpbInCNsmydcer
	T49Qf9+ujGh9fC2FpeAI8ZVttxB86z65/gzWxkCsKZ2seDBYrKeLC4ge8AVahhpcYmzUlFlVgMz
	vafQxK/FQwZZ/sLcPCrGfnHql3AG7CSjlnSvRP+1ZHgo1We9B06Y1mH0Y3nB3+XBKnkqC6LoDkS
	iT4kgqLieR9Tg8TYFOixM6ch/a3f4yG8bjm9gbbxplx2qv2KpHq02W8o/PvgXNrYAzLI9/6p2Mm
	QXBNxxw637AA8uvfcY6FIyMms8z62WfVkxg/TPpaC2/dV6QbpGSrFQf35Jd4Q5FfD2AdfFhipAN
	O4DZY2Sg1H121rmjrVbW3YnKv3S8wg2GkDKJf5IXXR99p08y2hpHCV4b9QJbVkQR8KxUIHNDi+E
	0i+fflQbLszA==
X-Received: by 2002:a05:693c:88d5:10b0:386:9e9c:867 with SMTP id 5a478bee46e88-3869e9c2df2mr5049508eec.10.1795376470999;
        Sun, 22 Nov 2026 11:41:10 -0800 (PST)
X-Received: by 2002:a05:693c:88d5:10b0:386:9e9c:867 with SMTP id 5a478bee46e88-3869e9c2df2mr5049488eec.10.1795376470476;
        Sun, 22 Nov 2026 11:41:10 -0800 (PST)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672c6f31sm28348711eec.15.2026.11.22.11.41.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 11:41:10 -0800 (PST)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Subject: [PATCH v3 0/5] ASoC: qcom: Shikra machine driver and DT binding
 support
Date: Mon, 23 Nov 2026 01:10:45 +0530
Message-Id: <20261123-shikra-machine-v3-0-e5d074264428@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAD1FA2sC/12NQQ6CMBBFr2K6tqS0gVBX3sOwKO1gR4VqB4iGc
 Hdb3JlMfvKS/9+sjCAiEDsdVhZhQcIwJlDHA7PejFfg6BIzKWRdllJx8niPhg/GehyBO6srULa
 pTa9YGj0j9PjehZf2xzR3N7BTtuSGR5pC/OwflzL3drnQpfiXLzKf4Lrr6864qtGuOQei4jWbh
 w3DUKRg7bZtX5y2zSrIAAAA
X-Change-ID: 20261123-shikra-machine-dc95e3c86af3
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795376465; l=2669;
 i=mohammad.rafi.shaik@oss.qualcomm.com; s=20260424;
 h=from:subject:message-id; bh=AK+isnXFvbL7gDAUtPlaSgxjaBL6KvTPiIfM1qx0PsQ=;
 b=TYqDYa4h4N9mtgP5Vz8Y245ECRAgzkjsgdE1GP2thducAZFSQfY26at/jWq9zQPFNcrihRsI2
 zUpGRuQgYUQAuRJcyoKRWCPrNoZYzBnbviabw6cx/L8KslP3GukQxmf
X-Developer-Key: i=mohammad.rafi.shaik@oss.qualcomm.com; a=ed25519;
 pk=KZedmYgMGYOzuTpLGv56tdrL+pTLDP8pdmfQ91xemiA=
X-Authority-Analysis: v=2.4 cv=OrHaWC/t c=1 sm=1 tr=0 ts=6b034558 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=iox4zFpeAAAA:8
 a=FU4AtH68Du5tlk7Y-9MA:9 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22
 a=WzC6qhA0u3u7Ye7llzcV:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIyMDA3OCBTYWx0ZWRfXzh0AkGn7gKU3
 D9ClBkelHKdeOba38Hf9j2kGWB17klWpCI393Py24yFzORClTEWzVwQ2Z1Whu/abTM+IU2qPdGW
 EMobCyIiYbz0fqnGygXEP8mfNA1p3u4=
X-Proofpoint-GUID: hSUER4Zoh6zHu5gprSaXKCp5_o6_aTTQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIyMDA3OCBTYWx0ZWRfXzEU+rhyLHeMp
 TKaBTFE5S3qv+fsksRD7sZxu1b92c/SiKJH3MyzhZbqyo8cX3kqD/OKQtrJHPwNftXplVnlw3c5
 OGfL8WhOgoHI66La/pUyotWZc4E4Znfn+XU5sMFDCsp3T0J6EREwXSDoeLjlzxz4Sycwh05LE+u
 m6dOZn96vazC17SZ5qlZSXU5I5ADOaw7TGZsYSi3BC3+sHjHjMpk9E9w9YkqGWUr8SVJjhnfwhQ
 YhCsWbXBiq5Heek0LmW5yuA/5+w55fgLkA6/GX45mgQYHDynz7pFx7K8ELHURnvul401Ych+I+l
 KYOomyOsrtHMpYYaduFIjhIMSYo/zrooT9bGSGQ32pcXtrKUO8zh0VtZ3WIobPAp74PoCuKMbx0
 Umt3U7qzoOwC4HBtxe0uPDt4XUFng3Lobko69iihxAuXoKufPNOzI6MA0980PY40RmE5n9TIzmw
 mkDVUJsDCNC8jcjY5WA==
X-Proofpoint-ORIG-GUID: hSUER4Zoh6zHu5gprSaXKCp5_o6_aTTQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-22_04,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611220078

This series adds Qualcomm Shikra sound-card variant support in DT
bindings and in the sc8280xp machine driver.

Shikra EVK variants use different audio components and processing
architectures:
- CQM/CQS use an I2S-based path with WSA885x amplifiers and
  PM4125 + Rouleur codec components.
- CQS uses modem-DSP based audio processing.
- IQS uses a third-party MAX98091 codec with modem-DSP support.

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
Changes in v3:
- Fixed the dummy codec backend ops issue reported by Prasad.
- Fixed the issues reported on Sashiko.
- Reused the existing DAPM widgets.
- Link to v2: https://lore.kernel.org/all/20260910-shikra-machine-v2-v2-0-9bf6bad589d8@oss.qualcomm.com/

Changes in v2:
- Split the single machine-driver patch into four separate patches
  as requested by Srinivas and Dmitry:
  - Patch 2/5: extend hw_params for QAIF MI2S/TDM DAI ranges,
    add cpu_dai_fmt, VA_CODEC_DMA_TX_1 and be_ops filter changes
  - Patch 3/5: CQM variant support
  - Patch 4/5: CQS variant support
  - Patch 5/5: IQS variant support
- Carry forward Reviewed-by from Krzysztof on the DT binding patch
- Use correct struct type (qcom_snd_soc_common) for all priv_data
- Link to v1: https://lore.kernel.org/all/20260611112946.954172-1-ajay.nandam@oss.qualcomm.com/

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
Ajay Kumar Nandam (5):
      ASoC: dt-bindings: qcom,sm8250: add Shikra sound card compatibles
      ASoC: qcom: sc8280xp: add Shikra backend handling
      ASoC: qcom: sc8280xp: Add shikra-cqm-evk compatible support
      ASoC: qcom: sc8280xp: Add shikra-cqs-evk compatible support
      ASoC: qcom: sc8280xp: Add shikra-iqs-evk compatible support

 .../devicetree/bindings/sound/qcom,sm8250.yaml     |  3 +
 sound/soc/qcom/common.c                            |  1 +
 sound/soc/qcom/sc8280xp.c                          | 70 +++++++++++++++++++++-
 sound/soc/qcom/sdw.c                               |  1 +
 4 files changed, 72 insertions(+), 3 deletions(-)
---
base-commit: 7884221ca9857a317bf4bd81ac3bf5528f266feb
change-id: 20261123-shikra-machine-dc95e3c86af3

Best regards,
--  
Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>

