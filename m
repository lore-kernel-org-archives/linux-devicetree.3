Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B5AD4DDB5E
	for <devicetree@vger.kernel.org>; Fri,  9 Oct 2026 13:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791551621; cv=none; b=AgpfW0ug6moWaBbqlp8+xED9Gt0CqNajUNn1xUuLe5STCWBhyXtlmT2nEGZ8c7oEwdAhMObbZrs0bwtjlV8YO7LOOOmfC0qu8/YdOunGh4phzN7Aq6rI3yKk0uoeE0Y7WYZgD/Fd8LBVRfDuthiHjP7vubmgeKThTkqjUcC3S4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791551621; c=relaxed/simple;
	bh=M9rV6JFa0e+kuKJqb5S0mB2BWCPnNVc3+wZc5hzIQvk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jnopyQzprq63qzdn/jcp5ghhvwrraH8jlkp81mzJzbWBHaIpwv4+er7EsGvcR46exQOIiYfeQkiwD8isay/oHZL6tXpjcQgvilM/W+XOtzgvV19FWIjuJ7I5d3prss/Dy7Ma7JYo0kXlJX/prxdlR4P5cccTe7VjmDjCJaGhZYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eUIns+2m; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fXza6mF8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eUIns+2m";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fXza6mF8"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6998KGrl230890
	for <devicetree@vger.kernel.org>; Fri, 9 Oct 2026 13:13:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UjBSbQM2y0p3ltbHGxCXVAysgeCWvQCnvPwXxQNEHoQ=; b=eUIns+2moNGF5wkk
	1d4gFpnhTXxFb1thaCh5OdQkjiyMsV92a/bCzOVVNrp9VKZmrnmgl32eu0OKGdI/
	ZQ5Yq/U2RR28Yk3+noVZz34k++g5Q3e1lS2Zm/P9X+3nuPPr1h1NiYWuM0b1f+eT
	MwDSiho0W6Fv5C9QKeuIXGoEpTxvMAGt3YAVTCHN8LUbi28Scu/IjvY4KmsDKdrF
	UPCQi3Y89bhxXF4M7GfxiqW6OwLkgzXN+KPjto9TxCPD7Ohwdw4UECPbnVhoiOJB
	l71L1SV0tz2Xp1z1LXL1do9Oujtmx0nxJtqqr6qJtaF+mBCE/XcO/+YpWa+y4ZzZ
	Rvfz8A==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6fxu3mjm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 09 Oct 2026 13:13:39 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-868db1b2c64so5299328b3a.3
        for <devicetree@vger.kernel.org>; Fri, 09 Oct 2026 06:13:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791551618; x=1792156418; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UjBSbQM2y0p3ltbHGxCXVAysgeCWvQCnvPwXxQNEHoQ=;
        b=fXza6mF8ebeZt96OUWMn9ZtNp32ejRLzCmu1BpBBimpAiampGpFvVZKSkqJjxdypp9
         9Q8FRG9AugI7IZpOhyCcrDvifEZr7BvHnRlT+q6i6kGB/Ui2obsnyZPNxM74/cdvsJBO
         xpDirAebOXWZHF5D05Aq4862GxyrlwZsDmOuEd1Z+j5dYpTWrx4BjMovPSXObr9lRa+K
         pUZJRyREXYz7oOIVaE5hJXT7DLJFpjsDZ7ByYl9n2+CiWUaeU/6ZQLmJrLcfu+tzXJhj
         McqVmd1mtuevyskvNHD8B48pn2y0OTQ2O1NQqyz2QanhZSP21uIxvZOfLaFNFbzQ/HMw
         QS7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791551618; x=1792156418;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UjBSbQM2y0p3ltbHGxCXVAysgeCWvQCnvPwXxQNEHoQ=;
        b=0U8ykHrgoXpMbGsMnc2z6i0XNaF48hdVBCFIboJTkw2THF7ueKJwz8oyiLIsDNIxIR
         rp5JU4JeJtOZHB0DuAiUVwQHnJ4bRqcF4o3UFJmsOgLaSYIWpU82RC8VQ4cmi7bUsxxh
         nblFuwg76hu73Hr5FX7ALsRh1CxMOMqogwkPwuKKkuUnyW1sLMy2Hh8BC5hc5fU20QAu
         NY8GFVpvbPpBSFB4IlSjKL/6P1hp64qLS/dxfsexgZ2Fe/AQxYMSJkwWyYnIfIKDw/tG
         zTk618KsXW4uPRdF/eKzbUc54iPeJBNfv3x20UBbBtEkRVmrUNmVmuOlZLJoNwh7gE1B
         aYUw==
X-Forwarded-Encrypted: i=1; AKwUvBymORi3BcvIObEjoqv6fbrpI5Rci9tNARlOS3WMvSzKp36HTeT/h5yMz7c9/69Pu9MESHQWpkCtN62J@vger.kernel.org
X-Gm-Message-State: AFq9FYJXHsVX167/L6btJSumalrntpwLD4/EQ9PBTVRg9IIn3bsA1SIc
	926QCzldaJ99Tp3pB9zgrBDk+eg1w9D4aCTBeDttgTJXSEeBm29tc1HONxy2epjNSM2AyjvDXbP
	W1LTJNbZHz5rjhPbbiQxio/OH8gBHS8cmfR6tl5iQs369PtSQ0HLVT8btIaXmUAhX
X-Gm-Gg: AYBFou3k6gH7LQ6UT9o7Pe7DdrbRzh5+i3vuDFHRBCPmwJd9BNGNQWmlUW+qPD/qSwC
	QuZCHsU/Ty24b4yMay2Twx+tHAVIwn8lalG7jpII4dYxVZl4xbWblLvHIulDH+bMjBNbQWHiVmC
	cD+eO+aWvHohOD1g4XvcZ4GfZaFORyEMR6qfpnrcfy4A38/n83aUFB6lVz2m/Lq5pV6g3vou6xG
	iRcxrMgkgBzdOFvG3Sd9hqI3nA09Cnq0D3VkqFyiBfGhZC6d5FpeG29yiHOdLvverujGtviZqHc
	r57KfDoMgKjAu93hrjF+5Ko3PYUVsKTn0hurBDG7fqA332biBdbb2hgsNW7aUEKJIv6z6u+Ovz3
	03qQDKd06H8Cn8fFqS1MeU5uKOGvGcrUOwl4D
X-Received: by 2002:a05:6a00:1c9f:b0:892:fae5:f979 with SMTP id d2e1a72fcca58-897c77dbab7mr1439350b3a.55.1791551618259;
        Fri, 09 Oct 2026 06:13:38 -0700 (PDT)
X-Received: by 2002:a05:6a00:1c9f:b0:892:fae5:f979 with SMTP id d2e1a72fcca58-897c77dbab7mr1439313b3a.55.1791551617787;
        Fri, 09 Oct 2026 06:13:37 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-896c4b8ec86sm939053b3a.61.2026.10.09.06.13.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 06:13:37 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Date: Fri, 09 Oct 2026 18:42:50 +0530
Subject: [PATCH v3 4/7] ASoC: dt-bindings: ti,pcm1681: Document the PCM1681
 supplies
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261009-nord-asoc-driver-support-v3-v3-4-0c1897f21ccf@oss.qualcomm.com>
References: <20261009-nord-asoc-driver-support-v3-v3-0-0c1897f21ccf@oss.qualcomm.com>
In-Reply-To: <20261009-nord-asoc-driver-support-v3-v3-0-0c1897f21ccf@oss.qualcomm.com>
To: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
        Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Srinivas Kandagatla <srini@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791551582; l=1178;
 i=mohammad.rafi.shaik@oss.qualcomm.com; s=20260424;
 h=from:subject:message-id; bh=dhKp4jkj70ZPXQJqqzpWahjf/VxHBiQUpGt43tFMDrE=;
 b=dIrH/z27IbKDuVu3vKcMa1ksYg39SI/HNzSD0GZbXJnCVEX7OqbEqm0CCk+bOYMLA8CCU8cpt
 CM5M3g/KZtdC45pH5SSGgLrgp524auJoy7+j40Gpc2CZUJIx7C1+pIk
X-Developer-Key: i=mohammad.rafi.shaik@oss.qualcomm.com; a=ed25519;
 pk=KZedmYgMGYOzuTpLGv56tdrL+pTLDP8pdmfQ91xemiA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDA1MiBTYWx0ZWRfX7Ki4oJR3PCwf
 P/MLeQY2dUxw6hkQOEdACNSEmJuVg5IhX9I3QZq8mPQ97LbpVd7TAnlPs/WxgxwNRl6EB/KmFJ6
 O5xJiys1C0zO3pwepM3tqbFIN0yy7Im6VzVH3BJ+LYApDlH3+OkfwQcNBXAA86kj9icDEZqFYv4
 Te4jVeWQ2UmdsqWm2eXQdZRtY5fokr+6MRGf6bNRckDx0PbXoBPhAI7iNsbuxI0BQ1XW/287K3G
 EyBd2msS472uF4eLbuV8oHU4Yfk0vzAUTu6fblHK9QGWKbJKE27yrn7JrysejOXHctkq/ez6L6x
 DHdR6jogzSoxm6nycXM5avprR0sNXHXXKZlIrboHhCMY3g2yGe2z5aww2hrNZpoN0LvC5G80S/X
 gDYt1/i6ftYf5SdtISHsvmQ5sTmT5fkXaPowzVL73eLuIF4VhbrFZzU4gI8EJ3s/IhDWWs28idY
 rGti7l/JsrfOKBZ3K7Q==
X-Authority-Analysis: v=2.4 cv=QbjzLcbv c=1 sm=1 tr=0 ts=6ac8e883 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=aa-cyReG4ptY0mJ5SFcA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: XjM3iMEMVVVZHhrP1yvkiTzaOYsmc6zg
X-Proofpoint-ORIG-GUID: XjM3iMEMVVVZHhrP1yvkiTzaOYsmc6zg
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDA1MiBTYWx0ZWRfX7VgvC2CZjgQI
 /ld1F+plI5FM1qttGNqZRPFBNhqNcc6q8sV1PECYzr0wd9TYVLLKgVSJi28wyVkOIcBVXwW8Gf0
 j/bEa69PKjkTsfotFtUPpx4QimjK/L0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_03,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 bulkscore=0 phishscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610090052

From: Shawn Guo <shengchao.guo@oss.qualcomm.com>

The PCM1681 takes a 5V analog supply on VCC1 and VCC2 and a 3.3V
digital supply on VDD. On boards where these rails are switchable, the
codec has to know about them to be able to power the DAC up and down,
which needs a way to describe the connections in Device Tree.

Document the VCC1, VCC2 and VDD supply properties.

Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/sound/ti,pcm1681.yaml | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/ti,pcm1681.yaml b/Documentation/devicetree/bindings/sound/ti,pcm1681.yaml
index 1b3803518..fb09d1c39 100644
--- a/Documentation/devicetree/bindings/sound/ti,pcm1681.yaml
+++ b/Documentation/devicetree/bindings/sound/ti,pcm1681.yaml
@@ -28,6 +28,15 @@ properties:
   clock-names:
     const: sck
 
+  VCC1-supply:
+    description: 5V analog power supply
+
+  VCC2-supply:
+    description: 5V analog power supply
+
+  VDD-supply:
+    description: 3.3V digital power supply
+
   "#sound-dai-cells":
     const: 0
 

-- 
2.34.1

