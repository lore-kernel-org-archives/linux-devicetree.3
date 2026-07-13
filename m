Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E4D33F4DC7
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 11:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783943906; cv=none; b=sotp5ZEbr1LGmvIQGkPcMUxSD7DyLClndEk0QEVnPYXnSbfK9lyPx+I1AXIpbSluB8ywomNa3oN3N1qnv010RUiNv+xfgUfym9uqkkszYadhBXXClC7lGA60eNnXb9hwO5IA6o3v1TN3sl8DV40X8TJsfkcYbi4B5qw4Mk+sWEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783943906; c=relaxed/simple;
	bh=arX9tSARvFjDoZvrQEU49DO8Egee3ocKdzSm9UKLNck=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=I9kRQRdKXKq1Ff0m8BPOw6us8B0WikIl6zzKAM3tftwBh3P5W184XJqjO37WBjDJ7FpKRbKyK8nt9PKQ72We0KWTb4VfJEIKPb43SUtFY0MeZUtm1tPOERY9DAQ1m6aXlgfPhCu0DmHjE0rTG2hMaB5m3xWk4NFdt+9l6DqP8do=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TNmDsIQq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RbWNU6EV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TNmDsIQq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RbWNU6EV"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D7YlEK794236
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 11:58:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Kl9D9yxCe1W4JgCW0Ljt4Q
	sBgikkHSTfIiW244TT7MI=; b=TNmDsIQqKcdDgdCxoGscS6BwpGQLE9/u3ycsrA
	Ns+NiS1WoSZGqwX2OBZC0dh1gQhzYCH9JH0s+hqlvihesoudiaytBvpSgmEfzxym
	UIj6fv24+ZXywScPbjQf/1O/x/VijP8qhM6VuVxV1Fu0L/9Hg3NXnsAbmxfl+GpR
	43Llj7Ao55C/USs2Z4JlpQzfqnSgccrNmcUpiz+ItUnc36TPHSiJJ2Sd3CoBLQ6K
	KKfm8egG/5zCEU/94991QUxWg+FoYlNkbAGTJbYOA3/ZuAnZrCVVekUsb627Ogfg
	BB/uPoi6LzFW75Ve495iXkit30zqDQAeop59fOLPwuwleApw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcurn0xgw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 11:58:23 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38e1118e4abso365290a91.0
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 04:58:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783943902; x=1784548702; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Kl9D9yxCe1W4JgCW0Ljt4QsBgikkHSTfIiW244TT7MI=;
        b=RbWNU6EV8MmVzdzIr/n/UR70OfKLOcjW3jOyd1bPJKIGEFWWc/JTmyH98V7QHTG27s
         waPwhO+JrOU/EO7Epxlf7YssLREX86WKNzCxT45H6AMsucO9Lt5Oz9OTZAYKxqWrpqZZ
         lGvA2BxZY7hfVy9uYhZT3VclWxQqOE2DQlw/KjSxYbe/bb+77yCRx6OOVrcdru/CepYU
         /aRD0+SgcM2mr1pqCOEQK1Q8DF/KG0KTpNF95gczp2Rep0qhoLmzZ3dkkzT+mtwovTyP
         1wEjxcwsh8viP7EwdpDnO+lVhj+WLeTyK2LaLxUb40c1+/1H4sLuOEcmAuxMBYobq4wL
         4D6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783943902; x=1784548702;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Kl9D9yxCe1W4JgCW0Ljt4QsBgikkHSTfIiW244TT7MI=;
        b=OI0rhHmIJluf+4EqPB8ph6edy2tSzXIuhhOMyvWzJkxrTNptArJsgtkiAJ/ZMt9Mle
         N19TVvQy3cRjWQjTjIcv+7BHmfjjiznP6lwlPbUHK0pMRIi/m5oMFScVGoyWmjRevlO7
         JRoMk1n45ZC0aIAwx59qQPw0w2HI0m1H9M2vl6KEjuXXBAu73OYTT1PM6H1fNxDzmdCT
         /fBJv1QfOuU0fTXmXpCnzxzouGABZvMwDA52Mpyb57bvdv8GMntwL88rq+mkyiVQWNMJ
         uCsPLFf5aNM6YmfYziJbt3JLcHhNVD3NedOB23U7NYBgVwJ35G2gVXZHBa3bG/waSha/
         b8Lg==
X-Forwarded-Encrypted: i=1; AHgh+RrkunNlslbQfGnx7E9R+TVtec7Df/GmvKLD6+4Z47SEbRG5vUqJMhWbIB36NMJ6Lb/fAH0/WabQQhZk@vger.kernel.org
X-Gm-Message-State: AOJu0YzQflNMujwKFwLEdqzwzPFKw4HCkcb6VolwECga0Ro3JXrbSstD
	cpFlr3dfTUCewXDLkn1TVWRNNmNc/yk5H/5vmuljjfHfPrNqGHrZJSU+8JSbRq2gZk6Ni/KLdw+
	vupt5FvjCjab9bHEdYn0pnoJK2lgX/gzHCQ14lDYVrcS7ORNz+yp295p6CdZPGcI=
X-Gm-Gg: AfdE7ckLL3AosWYzfjW1NnUVPGysgdlRTmXwO0ZhHcWUGBvwSZLeQ0eZ6MK3vPf6O8Y
	ZYkKOmFqg6YCs/UpHl4nNH27QcaM8UUdVK9gxxQRU5cgCw5kxDKmUQkzRV98XnwPW68wvmkhqga
	hcGDhUiPTOGcBd0ytOqzE+v/7Jg2L5h/Aq5A8pfaQcHs9a2wMF43Qx2zuGSRMWQzPLC5zCXIGpM
	J3SRWOPwfZrzWzgulsYsTNNSvFK1wBzz4b4JsBljQZCB7e0X2gyWI0zfzuvdlkXQzIso8pbA9mf
	EZ6WxaQuGGsDbHh7cz88oCLb4sx71oW6SeisfvEYPr/R5w/MvuwJ6k2rtm2WPeZO+VXysjtFP8d
	PoE9bVTouLV4mf+kLE7okfVHzWzuqKb5IvwBbmgPA
X-Received: by 2002:a17:90b:55c4:b0:38d:dfd1:7a8 with SMTP id 98e67ed59e1d1-38ddfd10a9cmr5499814a91.2.1783943902397;
        Mon, 13 Jul 2026 04:58:22 -0700 (PDT)
X-Received: by 2002:a17:90b:55c4:b0:38d:dfd1:7a8 with SMTP id 98e67ed59e1d1-38ddfd10a9cmr5499786a91.2.1783943901857;
        Mon, 13 Jul 2026 04:58:21 -0700 (PDT)
Received: from hu-kotarake-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174ae6cd9sm74546638eec.31.2026.07.13.04.58.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 04:58:21 -0700 (PDT)
From: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Subject: [PATCH v5 0/2] monaco: Add PMM8654AU PON support
Date: Mon, 13 Jul 2026 17:28:13 +0530
Message-Id: <20260713-b4-add_pwrkey_and_resin-v5-0-3bea476e1453@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANXSVGoC/3XOwQrCMAwG4FeRnq3UtJvWk+8hMtom06Ju2mp1j
 L27VQQ9uEvgD/xf0rNIwVNkq0nPAiUffdvkUEwnzO1NsyPuMWcGAkoBUHKruEGszvdwoK4yDVa
 Bom84OKFwiYWsC2S5fQ5U+8db3mxz3vt4bUP3PpTmr+3HFPo/mIALXmuV1YXVRst1G+PscjNH1
 55OszzYy03yx4LF6H9JZq6cu8JacIhGj3Dqy0mQ45zKnLFUK1LonMQ/3DAMTwVfyBVgAQAA
X-Change-ID: 20260226-b4-add_pwrkey_and_resin-2c04d8d53f5d
To: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783943896; l=1875;
 i=rakesh.kota@oss.qualcomm.com; s=20250919; h=from:subject:message-id;
 bh=arX9tSARvFjDoZvrQEU49DO8Egee3ocKdzSm9UKLNck=;
 b=f0doAPkYNAGP6mnoqnHR+3aZy6vAn9om0WOAcZTuU/+LM04qRI9pmt7YVQgllcFO4obtOotX1
 s+BvOoQp44hD78r9du2huXC6KYyWjBi+urALSGKaX9PHOYo3sF4/T40
X-Developer-Key: i=rakesh.kota@oss.qualcomm.com; a=ed25519;
 pk=dFhv9yPC8egZglsSLDMls08cOvZKZkG6QQn1a/ofwNU=
X-Proofpoint-ORIG-GUID: vsDZ_ycgtxo0pMzZtycSpuWr2HaFagWS
X-Authority-Analysis: v=2.4 cv=IcK3n2qa c=1 sm=1 tr=0 ts=6a54d2df cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=hkPachF6C7OTRM8muywA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDEyNSBTYWx0ZWRfX+yJz4kBGt7QS
 AvKqG9T8QRGyE3pVfMaxkQqDGocVlbvl2Rls4LeqwmvwR11CvZzAp7W1CSCDGIGnPJLnUXP/Eh2
 VfSKeu5lPfYKTM6Vw7LPqlF8wAKiy5Q=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDEyNSBTYWx0ZWRfXzja5XyEueeHJ
 W9xNLWsSc7tZEDWcbdlJI+D+FxJMAcmJEeF9o63fqIMqFoAKigG3CjcuNTTv9j/H6VHbV7/2qME
 n6nA1whs3oxX9QVNKoDPQv1hJKT1cEHLdaE2gRo24hRQ51OuxyrvJ1FIaLOWbBoSlokoypF//8n
 uttLcg2f1nIwOAgWOhHwG7kN9ZSYy2eePn9S/IJAAtbXUaVSgaoIPbb/lTgw++J4lb89wVvCGx/
 FW6+DuXTYeO8bwAJfunIBojP8Se9piya/9Q4NcqfGbf+O2WWix9xggDgPZwhUSK9T/CpR7ciOm7
 jH51j3tCxtStSFjDDcnTFpVpdw7mfnCphf96G6qa9RGvgMba+mpkog/Knc5jVWUGTOEfJqTza1Q
 dtdlngULmrusPWjiv9m1xUldK7GXBfudIYqwl0uE79+5nDQtkW++umnlXL7CtnqwC5K/LP1bWuZ
 AxMhTOShu5t7wH4F+EA==
X-Proofpoint-GUID: vsDZ_ycgtxo0pMzZtycSpuWr2HaFagWS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130125

This patch series updates the PON power and reset dt-bindings and
device tree to add support for PON power and reset keys on the 
Monaco platform.

Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
---
Changes in v5:
- Set minItems: 2 for reg in the PMK8350 if/then block to enforce that both hlos
  and pbs address spaces are required for GEN3 PON peripherals.
- Link to v4: https://lore.kernel.org/r/20260323-b4-add_pwrkey_and_resin-v4-0-abef4e4dcc3d@oss.qualcomm.com

Changes in v4:
 - Remove the contain for PMK8350 and new if:then for PMM8654AU as suggested by Krzysztof Kozlowski
 - Link to v3: https://lore.kernel.org/r/20260227-b4-add_pwrkey_and_resin-v3-0-61c5bb2cdda9@oss.qualcomm.com

Changes in v3:
 - Drop the dt-bindings of PMM8654AU qcom,pm8941-pwrkey as this
   patch was picked - https://lore.kernel.org/all/20260209-add_pwrkey_and_resin-v2-2-f944d87b9a93@oss.qualcomm.com
 - Update Commit message and disable the resin as suggested by Konrad Dybcio
 - Link to v2: https://lore.kernel.org/r/20260209-add_pwrkey_and_resin-v2-0-f944d87b9a93@oss.qualcomm.com 

Changes in v2:
 - Introduces PMM8654AU compatible strings as suggested by Konrad Dybcio.
 - Link to v1: https://lore.kernel.org/all/20260122-add_pwrkey_and_resin-v1-1-a9fe87537816@oss.qualcomm.com

---
Rakesh Kota (2):
      dt-bindings: power: reset: qcom-pon: Add new compatible PMM8654AU
      arm64: dts: qcom: monaco-pmics: Add PON power key and reset inputs

 .../devicetree/bindings/power/reset/qcom,pon.yaml    | 19 +++++++++++--------
 arch/arm64/boot/dts/qcom/monaco-pmics.dtsi           | 20 ++++++++++++++++++++
 2 files changed, 31 insertions(+), 8 deletions(-)
---
base-commit: bee763d5f341b99cf472afeb508d4988f62a6ca1
change-id: 20260226-b4-add_pwrkey_and_resin-2c04d8d53f5d

Best regards,
-- 
Rakesh Kota <rakesh.kota@oss.qualcomm.com>

