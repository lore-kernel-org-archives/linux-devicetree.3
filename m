Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DACB23D7C2
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 13:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783691388; cv=none; b=eXGu93rQqx0GCJ5TwYy2Q09BJoOv/QVdf53szP5iMn5vPLTyO4HtvO8/vgiF43OytR8f1pe+iwXvO0+G064VUzkdeOsSvL4nRqrJdA2c4bekkdD1bkB506kDsHVCwjg9sg9BrHUNZecOSmI+ONMgAE1jHtiuqgB00YZj+8KODAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783691388; c=relaxed/simple;
	bh=9eJJJ3/IG0SKZRgIbUDxACLmRKgHJO9u4VmJm+Df6uM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=kXPcw2MplrNZN8wg1CQI98hrmsN3BvHTwppuFlFnN5DSAXLofatlKkMFpQmAesFZufIopkTDKBHjU6uuXT28pQw9uSJz5suEbye7yShs+pKoBNJK+VVE+YFodvmRvatbVV9CIS/XUuPrilt/i+T7QUPHhCZOI64AASw1OLWs5/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kfC5hG5h; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LuvLk9YR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kfC5hG5h";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LuvLk9YR"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66AD7rGO921029
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 13:49:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=8HBXLpoj220Wse3k0fYLcR
	C+Pkmai2cbvL7zm7NY/jY=; b=kfC5hG5hs5T/78KffCWxUYUUo1T8nNTsQF2O/w
	hIGEUHMSZWzEL0LwvJHz/wmQw8k3KqwVNCH0ugWj98n80TSMJaVpZA7gT2Kg+hQf
	EU5v2lTPmFBa7eJrCbfGGvh2AHuodNtPRRppgDWnPnmfuZc9Vfh+YBmH9yIYeqlI
	o2lo2EpCQ7xfU9Lac5C7LDQt3DyYt/cix23Nyd5aAWoag8gLJEUaLh/OUDVJ/+Jz
	7wcWTyKM26/Xfcw38DYwzQrpjVPyc4TOofFLtz1OVmTZ+YzlLm5mU12Qohyxpm2p
	4X9a+BtGnwAHuL3pxKVOPcFJTOwfSTr7f5G8/Tp6UNF3Oq3g==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fas6n244e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 13:49:46 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5174a236220so9617791cf.3
        for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 06:49:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783691385; x=1784296185; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=8HBXLpoj220Wse3k0fYLcRC+Pkmai2cbvL7zm7NY/jY=;
        b=LuvLk9YR5dejOPiLW0cMZJ9bjJ8b1NxvUtTLTpXVnqHwnq9zU3lbCj2eou/Ixee+fS
         psvEcZIXuQo5g+fructCcx19uhH5GI2On1lDVl1fcVI6/jsybkWYmU91xSBTuQDz81Ze
         0+FfnpLfReXbjOt8f83QE+64O9noFH3+1z8pCAhEucI2gTYfjjJBKOFVk5YQ5qUuH9hC
         2PT6tPyCuOLVVO5z3lHsdhxmNQLSBi/8n1ON+nRzX2JICLwCFYI7mzbMlNWe5+hAd0Je
         B5LR9j+Lw0Zv4vCyeh79bbgw8Wj4MWP9f2uZFYwiGz/se3XcW0yLm/GPFr9hPN9AQ6jm
         yBvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783691385; x=1784296185;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8HBXLpoj220Wse3k0fYLcRC+Pkmai2cbvL7zm7NY/jY=;
        b=MY4vj3UNdIjujoGxoR9G9CUHWKEJR0y5+83ifDobuOi+SmodjuZGSd+hE/qgINAmV9
         XkSU8w1p+e0tgGjhkyt7SbSb1QjlPZJC0UYVLhPfkR7labd9RnDg6zgeOLaQEAgJaigt
         IokN+eQLoMsLmiLg1NqFhlVKBSw322P+REjTd78VQoThJORJHVXEHMhA7BSYnlmX0zNp
         mWv8jBJJl7XcaYawqfVbIQ3FETv7osU92KJ4mGr7sF7O+oyYms6ip5ho6pjlnknZ0QU4
         YFrznoWfoDs9wIoLpg2aV04lEHjJNTHhW/pWzq/on247ZsbxIsGFGWOPD2X0DOcJDjEq
         xzYA==
X-Forwarded-Encrypted: i=1; AHgh+RqelD+UW+S+XHsZ3Oe45SHEEgwXIf28okupXfiNP4p+ye2Hk7gAuPlxRVCJz+YQcGnbWXoK69Kj6ump@vger.kernel.org
X-Gm-Message-State: AOJu0YxmUN/KetCzD/auSL9gVG8gQXhsaVdaPrqa6LSw8DkzRVdzjSw1
	Uny6kCjbIq4pZsVrF89qWCLTAj2BloL+FLnXlnll6kyIOIlhY13iPoeS/yEVufbNtEcxDayzkFe
	kYcASpjiLBvjnz1/6kcZfbB1JGklmIo+72Z28r7xJppZSxqx1jZcVz6MsSI/bW4dU
X-Gm-Gg: AfdE7ckbrEWQY2qFUXyDjZKXCYeBs77SV/2y4gfDPG7G4qrFGGwj0bMl3Fv2XuthsuE
	hKfKLxwC3FdiDy0NYHLmajPrqZUa4/6QtULKFIT08ckY07RoSLHdXqZCKPd8W7rvDrtOgUoqkcC
	ywqiPC9VKNoyS5C+vsuSKTBnwb3nypKH/86vQauzGKaiGbB1jIZ/Pw9RQDaLb2sPAYAksr14VsG
	kFHxTDxxqKueT6hfFEZDm4gbJRAZgLSR26ztnghUwuiJkU1n53zwVynUvaLZDvWElkEqL+XnEvE
	TYtwmO8n6TQUzrW4FDp1J07xMZfJlvCE5keSZka1lIJ/lrPRWc5uY+PddzqPfwcvS3sJ40Dy+/h
	f+u6A1VwRGH2tA40ob7B1VYK4rrCXqRGhReGiczhgCUjv7hvFXgFEccyLGjzsAyxk0q4+CGWZef
	+8mftb7IMRhln8xYm3rD1TldsDFKQ3y9XEs4g3X5nfUuIj14mO7Ihnsqmj0go4i0SgWzg2vtLPw
	6sxbtFfDD/l7af3KiUO
X-Received: by 2002:a05:622a:1f87:b0:51c:1e69:bcc9 with SMTP id d75a77b69052e-51c8b2adf8dmr130796801cf.12.1783691385479;
        Fri, 10 Jul 2026 06:49:45 -0700 (PDT)
X-Received: by 2002:a05:622a:1f87:b0:51c:1e69:bcc9 with SMTP id d75a77b69052e-51c8b2adf8dmr130796421cf.12.1783691385009;
        Fri, 10 Jul 2026 06:49:45 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com (82-64-236-198.subs.proxad.net. [82.64.236.198])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15bb94c782sm538164866b.40.2026.07.10.06.49.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 06:49:44 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH v5 0/4] leds: pca963x: Add multicolor support and enable
 Monza RGB LEDs
Date: Fri, 10 Jul 2026 15:49:40 +0200
Message-Id: <20260710-monza-leds-v5-0-a8972d28c28f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAHT4UGoC/3XPyw6CMBAF0F8xXVvSly248j+MizIM2kSoUiU+w
 r87sBES3UxyJ7knM2+WsAuY2Hb1Zh32IYXYUtisVwxOvj0iDxVlpoSywqqCN7F9eX7GKnFQhUK
 bQ+FNwahw6bAOjwnbHyifQrrF7jnZvRy3P5lecsEF1A6EdxVIs4spZde7P0NsmowGG7VefQUn5
 EJQJIAsUZTG0VH2j6Dngl0ImgTt0NM3ea6t/iOYuZAvBEOCdx5q2CgDovwhDMPwARWLh09xAQA
 A
X-Change-ID: 20260629-monza-leds-c292e68c9a49
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Conor Dooley <conor.dooley@microchip.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDEzNyBTYWx0ZWRfXxBxjjuy2VK3R
 8L+WO1bq2ZLLxg6lxumPuAs7LpcixD4ZBhS4AJet1gwe/wq68Y+ynI2zREHu8j47UAy/h/9Ue1X
 Tfo+nuAxLGzzZgXu/WryM/qVOpLHKXE=
X-Authority-Analysis: v=2.4 cv=DYgnbPtW c=1 sm=1 tr=0 ts=6a50f87a cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=MDeckJw97qnk8wCBExTehA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=vowN3T5aPRO3JaQcBOgA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: NhzsXK91Mplf3rqEdmfKObG1A7mkf5Rl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDEzNyBTYWx0ZWRfX0ZfOfCBkXByt
 dedUQBbMJUvBRiNLNUCBtmeP0UXk3JE6z5Cto/PWy660loJSjqKZHxDS+cRxB7Qov5bQ+UPlv8g
 gdqqh5NA8GRpdGffMny2NTF0gNI63cHCTCh2V1Z3hWqCRbaTizV4CkGOeqarxhDVABw+2pSbwvw
 Q4omSeKP/t8sS9dQqAgVojYDjfuv9+54+NLclIbdsGsSdpzgQOt2dxHlllhB2Ju97S6i+SMsh1p
 Su1DQ9/LBQJl6OrGpHc9UxqdZw57HjcDO3eHc+fl9ge2fnwn8Z77l3Pa5wk6U7NGzqVUYR6CTlo
 PNPccnivqYVvmDRLImsifURK539/9ALEW9w6Y4Y+2G5xJeIu1b8in+sG4wa9saZF2r4kJxIsWex
 k2vL96x9TM6Ggj7p5G67M1wedVAeQ3lcq3ob1z19bwwF5Z8MDyBBB/IlZxr4nh4kTu4mXl+wHTt
 1EtKjw0JpkvUK/o9dDQ==
X-Proofpoint-GUID: NhzsXK91Mplf3rqEdmfKObG1A7mkf5Rl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 suspectscore=0 bulkscore=0
 clxscore=1015 phishscore=0 malwarescore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100137

Some devices use PCA963x controllers to drive RGB LEDs, where
multiple PWM channels correspond to a single logical LED. Add
support for grouping such channels into a multicolor LED device,
using the LED multicolor class framework.

The DT bindings are extended to describe these groupings via a
multi-led@N node with sub-nodes representing individual color
channels. This follows conventions used by other multicolor LED
drivers, while maintaining full backward compatibility with
existing single-color LED definitions.

The PCA963x driver is updated accordingly to detect these grouped
definitions and register multicolor LEDs.

Finally, the Monaco Arduino Monza device tree is updated to expose
the onboard MCU-controlled LEDs (compatible with PCA9635). The MCU
manages four RGB LEDs mapped to channels 0–11, which are described
using the new multicolor bindings.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
Changes in v5:
- pca963x: fix multicolor power-state tracking (leds_on now updated per
  sub-channel, avoiding wrong sleep/wake state).
- pca963x: dedup the single/multicolor registration paths into a common
  pca963x_register_led(), with mc parsing split into
  pca963x_parse_mc_subleds() (Lee).
- pca963x: use dev_err_probe() on the probe error paths (Lee).
- pca963x: pca963x_led_mc_set() cleanups: drop the extra loop variable,
  use 'for (int i ...)', etc. (Lee).
- Link to v4: https://lore.kernel.org/r/20260708-monza-leds-v4-0-a7acfc524c0b@oss.qualcomm.com

Changes in v4:
- Narrow the led node-name regex to allow only hardware-supported addresses.
- Remove useless 'minimum: 0' prop, and add 'maximum: 15' in the default block.
- Link to v3: https://lore.kernel.org/r/20260706-monza-leds-v3-0-37ea8c988363@oss.qualcomm.com

Changes in v3:
- Add color to required multi-color leds (sashiko/Conor)
- Bounded registers value for nested led subnodes (sashiko/Conor)
- Add fix for PCA6535 reg limit (extend it to spec)
- Link to v2: https://lore.kernel.org/r/20260701-monza-leds-v2-0-c1be0b472926@oss.qualcomm.com

Changes in v2:
Changes in v2:
- bindings: Reworded commit message to explain the motivation (Krzysztof)
- bindings: Kept the "^led@..." pattern and modeled multicolor groups
  via a dedicated "^multi-led@..." subtree.
- dts: Renamed node from "leds-controller@22" to "led-controller@22"
  and dropped the unused label. (Konrad).
- dts: Moved "reg" to directly follow "compatible" (Konrad).
- dts: Fixed unit addresses to lowercase hex (sashiko).
- Fixed checkpatch issues
- Link to v1: https://lore.kernel.org/r/20260629-monza-leds-v1-0-0cf7c0a7dc14@oss.qualcomm.com

---
Loic Poulain (4):
      dt-bindings: leds: nxp,pca963x: fix reg maximum for pca9635
      dt-bindings: leds: nxp,pca963x: add multicolor LED support
      leds: pca963x: add multicolor LED class support
      arm64: dts: monaco-arduino-monza: microcontroller LEDs

 .../devicetree/bindings/leds/nxp,pca963x.yaml      | 108 +++++++++++++-
 arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts  | 110 ++++++++++++++
 drivers/leds/Kconfig                               |   1 +
 drivers/leds/leds-pca963x.c                        | 160 ++++++++++++++++-----
 4 files changed, 339 insertions(+), 40 deletions(-)
---
base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
change-id: 20260629-monza-leds-c292e68c9a49

Best regards,
-- 
Loic Poulain <loic.poulain@oss.qualcomm.com>

