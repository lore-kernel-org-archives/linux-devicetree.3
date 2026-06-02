Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77A173A6EFC
	for <devicetree@vger.kernel.org>; Tue,  2 Jun 2026 06:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780383271; cv=none; b=uqHYtmRvpmYKhyhMEKd5k3L5zNa+z0SBkXOh8X/dxgDC4tcXx14gQkUGgbHDQVHcRRjKFtVvGt/PHDj9DsvJSOf17khjk+X6Qj2tzgyNh2/Gu/Z7lnjy2kHaysmxiGQ/Okad4YSuFyAonWhKsr9nSU2ta7RaEHC+LAfGhatTWFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780383271; c=relaxed/simple;
	bh=iIfLzY0RSV18IcvZfxcvZn2bQF6E4nr4oH+1NMGnZJw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=OmltjFJgfRLV2JYGxxjlSRNTIhfL5WX/3CKBdB9ClWzt3YHFE7myM48kO+VgDMnkwrdz4wSIObruihSvff4ReT2dDfyT+QA7QhdDVHjHXcv8OmJZ21cHH74V1ZGRSSbhDe8XE2Me/axBsm1F+cOIMuo8rvpSI3m7e1FSSmUgBJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=maM0uCwD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Lk+wI6iE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="maM0uCwD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Lk+wI6iE"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65245n6k2692286
	for <devicetree@vger.kernel.org>; Tue, 2 Jun 2026 06:54:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=j+F4q7Sh2lmQKfIwbrzC4F
	r4FAkAVmOqbpOY+e2YGO0=; b=maM0uCwDyaN42iyqJHZCYXoNLwOONjxe3YQwfn
	hUHXqAccYk+ly4lMfI/nsylJcmONjSQ9cqeksimj2h4SN0Dg2ZIITfyzXfOV/swt
	43RXrM42gSX/hbQOksJrxKnmaQ+j9mdnZcOd3DUrTIlP9aREhfMVZiT9+r0fmQEe
	NVPGP9BX2EbVLeqHCRdWJxZ+X8TN2DBMLkFtve+L4izuHBpTL6kSsre0x4Tjzt95
	g/HhRS6qNldHD8ZzOttTZvXmbzr33ZYa82DgawiUromeAZngrgfYcaeF9L1D1q3t
	+LF7KVzg0npCukpsDinmmLcx5mOZcrB+CgYeKL/VVrDf3Jhg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ehqumgkf0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 02 Jun 2026 06:54:28 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2c0c1e08848so30616055ad.0
        for <devicetree@vger.kernel.org>; Mon, 01 Jun 2026 23:54:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780383268; x=1780988068; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=j+F4q7Sh2lmQKfIwbrzC4Fr4FAkAVmOqbpOY+e2YGO0=;
        b=Lk+wI6iE/E/3pr1W+VS6gGci8FlMPCgdTWMP2XpLEwFK+VmfeIaF5MB987DI3uD7U/
         CPfn+5LTmopc2vNjtVkzPXmLShErE/cEsmmnp2Au319imvMtF/vF/Eid+wty8u0TXf0X
         2RtjRuS7pV0RAxbVvZHoZsc9pO/V2Ox8IIwMDi66wbLClMQfzLnRo1J8n3H3xmUnJix2
         hbiCg9LVwqTn3OPSYJELPlXWVbdPqv1+xmTLSzeXApFhRJqipRBfmeM8byHN/1TvOygF
         4+kyoVTyP0+CeEGH9tZPCvMtn1ddhY1r1Q8tbsyHllP/Oyh/GzxjqfBvApjkfp88iv/f
         VycA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780383268; x=1780988068;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j+F4q7Sh2lmQKfIwbrzC4Fr4FAkAVmOqbpOY+e2YGO0=;
        b=aIsh9qYvYNtQLK3Fpcj2rnCT9MzsKmxEmL36LSyeqM8BFg/v4WYtVYbZhSjcqNbz/m
         iWYZrZg/ZLt3STkpg6l+KtrTvPGzWYK2DCOGbNhGjHEPTVnp8wItNqcty2PsnZmA/bsN
         G/LUQFlIa8oGtDjZ73ToN1X+I3LZYuV4/ZyGny28ZrYwODZ3L2T/qZoUm16bJCRqH1C6
         96E0h7sb9pg8UBOmmF7lvqwxf0Aq3B/HewMyg8awRbNlB0qQZ7N4HNfAfpDqw0fKrgvH
         DpofsYxHK1MeQkXRv9D5q+XplZqVI/MpPG+2V14sRW/X7raYWWXu2ds8C96JIFJgr+eZ
         w7Mw==
X-Forwarded-Encrypted: i=1; AFNElJ8Gl7/vtp/dVmPhP99NreAbvKxsuDsM8eQHA+NSBFkQ2iB/dGVHXcLvz/CpbBkxcebQswXfa33Ob0ZT@vger.kernel.org
X-Gm-Message-State: AOJu0YwP8FvSUFCvgZQkD6dAtBNN6C+uaHe+7eNCslxrUJ4nF+UylrDW
	5lbe02g97L2OEFsAAEr3CxrTiKB9yr7qKdrYnbcEKefY5/uVOw/nUju5vYuAkYqLn19IAa9CLsU
	4i9lkeU1C9otfZmwtqp9LaZ4jiRH11nX/gkzcS7tjhOfp6iLpLveH6oXoLIH58kBJJTWT6SG1S5
	o=
X-Gm-Gg: Acq92OE0YQ3mgqcHKkbvwdN0FphCc8n4IS7QW0MSN/n8WHvWxuFo2v88JAKpsTC7YCT
	x6LyEkYbz+yGEjnNLVYGIMMzsfNfm1KxI3z9KDYVPT3CZ2C71GKLlYXgx7MERd99BGQwzbWj5gp
	PcgqMUJ0dcaDcMCiqkgNH+kUaBOoBHCwRpqa0oeKrXytzSc6yXzfHphOdHtyz/hQGSaj4RsfVb4
	eOgd2N1EoJFGXVtZ3T+Z/wv0+DUJPgQ0t77EwQZFvcdMAKENltSqBmcFDWtgB3Ri18K5dsIkdGa
	k0yCxNeK6iLxYMYvFvLQR855ZDxy+GsUmbBpuoKwOC8ZDZ6ujlTR6C1XdlaO4KuDJCO6eL5qOur
	3dq0SCW+W5Ys733fy0N0f+NBAqqPJKhbikuU/bl2ruZ22cOf1SXzHbYVJQFGLR93MaSVezWtwt/
	wv57m0URezA6mvo30jtBGzMqCalw==
X-Received: by 2002:a17:902:e54c:b0:2bd:a529:4b5e with SMTP id d9443c01a7336-2bf36898ff8mr149246205ad.41.1780383268104;
        Mon, 01 Jun 2026 23:54:28 -0700 (PDT)
X-Received: by 2002:a17:902:e54c:b0:2bd:a529:4b5e with SMTP id d9443c01a7336-2bf36898ff8mr149245675ad.41.1780383267565;
        Mon, 01 Jun 2026 23:54:27 -0700 (PDT)
Received: from yijiyang-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf23c5a350sm167383405ad.83.2026.06.01.23.54.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 23:54:26 -0700 (PDT)
From: Yijie Yang <yijie.yang@oss.qualcomm.com>
Date: Tue, 02 Jun 2026 14:54:13 +0800
Subject: [PATCH v2] dt-bindings: interconnect: qcom-bwmon: Add Maili
 cpu-bwmon compatible
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260602-bwmon-v2-1-d4a851c45f37@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIABV+HmoC/y2Oy27DIBBFf8ViXSIeNjVZ9T+qLIZhqJFqk4Djp
 Ir878V2NiMd6cy998UK5UiFnZsXy7TEEtNUQX00DAeYfohHX5kpoYzopOLuMaaJE7pWBw9Go2X
 VvWYK8bnnfF8qOyjEXYYJh+17hDJTfouZbvfaMx/2oWIaxzifm64TRrTeoHWWAvZemB5CsK1HL
 aSxLXxC8ERsKxlimVP+27cvcg87ZqruPXORXHLXB0Oyt6hJf6VSTrc7/G6Fp3rYZV3Xf8qVGaQ
 GAQAA
X-Change-ID: 20260512-bwmon-ecb43fda63c9
To: Krzysztof Kozlowski <krzk@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Yijie Yang <yijie.yang@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780383264; l=1402;
 i=yijie.yang@oss.qualcomm.com; s=20240408; h=from:subject:message-id;
 bh=iIfLzY0RSV18IcvZfxcvZn2bQF6E4nr4oH+1NMGnZJw=;
 b=SOZ11f34zTO5w2eBWAI+fNTAGn5fB4Cgk4enr+W9Gf3Y0QlDucGnbu0Y73wEjhcRK8768YtUv
 khMf6/4DL7OBbBAfSwh/YFgutmgqbC2A2UTRv0FlW/BeChUFZ5dRVPr
X-Developer-Key: i=yijie.yang@oss.qualcomm.com; a=ed25519;
 pk=XvMv0rxjrXLYFdBXoFjTdOdAwDT5SPbQ5uAKGESDihk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAyMDA2MiBTYWx0ZWRfX9RWZH+ogO2Oc
 McnXiFD7bodzFD2AZON26CEayUoEp/HaoPwsiewom+NZHZlt3WY0asQWAXZ3brG/jF5Tvhsvf5g
 0AAG2fzBkA87zkqwCJDhXPkKucrkW+UCRJ40/KwF4J6+BUObxNN8LugPiM9QSLKeo6zwQDyHutn
 MIGHUQRzK4GdR3DLQa54YRarYi+mWeoxzvZKgaXysvbZ3oO010v9zmGZuQDohUrLp+b46TLWrJy
 sB5Bd9wcc5ohdK8WNRRqk2SzlRAPXVFQYzAwbu1Fcs4njwSlptIVEzjXfJ8wciLMk8o1knrA58l
 VIPeH7C60TthngNK74X4aVOj7I2G1RVYZe1Y5QVy0sdMjewGwG5PqTc731MBizres/ebtJPVd2v
 yVOQbuXMiYOWBZGyAHAiZ/Xv9NjEBYNM1UPHJrfTcHbyiC0oYZI7nUM4WD8ltcxjjCB3gSYHTyg
 n+iWbNiyRYYVprCHREQ==
X-Proofpoint-ORIG-GUID: 7GEld5mIEmUp9F_F0LJxvr4-z2QIqzZF
X-Proofpoint-GUID: 7GEld5mIEmUp9F_F0LJxvr4-z2QIqzZF
X-Authority-Analysis: v=2.4 cv=Rrv16imK c=1 sm=1 tr=0 ts=6a1e7e24 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=XRsJJl_DE4KtB7T7ePwA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_07,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 suspectscore=0 impostorscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606020062

Add the Qualcomm Maili SoC compatible string for the CPU bandwidth
monitor (BWMONv4). This falls back to the sdm845-bwmon compatible,
consistent with the existing pattern used by other recent SoCs such as
sm8750 and kaanapali.

Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
---
Changes in v2:
- Drop Assisted-by tag; no functional change.
- Link to v1: https://patch.msgid.link/20260525-bwmon-v1-1-b8f6e189c3e3@oss.qualcomm.com
---
 Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml b/Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml
index 82b1d94d3010..7989db1aa774 100644
--- a/Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml
+++ b/Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml
@@ -28,6 +28,7 @@ properties:
               - qcom,glymur-cpu-bwmon
               - qcom,hawi-cpu-bwmon
               - qcom,kaanapali-cpu-bwmon
+              - qcom,maili-cpu-bwmon
               - qcom,qcm2290-cpu-bwmon
               - qcom,qcs615-cpu-bwmon
               - qcom,qcs8300-cpu-bwmon

---
base-commit: 550604d6c9b9efc8d068aff94dc301694a7afdee
change-id: 20260512-bwmon-ecb43fda63c9

Best regards,
--  
Yijie Yang <yijie.yang@oss.qualcomm.com>

