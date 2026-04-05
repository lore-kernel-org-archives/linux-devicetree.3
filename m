Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 421362F290A
	for <devicetree@vger.kernel.org>; Sun,  5 Apr 2026 14:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775399674; cv=none; b=Ptl2PrThYLB74ZeTdbboDtxUuh1+LbcBOQ4gLlES3PxfJ0xDSnfTvKzogbJY+lL5yi6LjxZzgZmQrRPpLdtTaZJrcFy6dV+9DXMrT1JF6bx4dioVHHsXfaGWOxoNn4myRfXq80fxxEwd4/D4trpKjhfJlrmNBDbLB885nCjTraY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775399674; c=relaxed/simple;
	bh=Hl0zlaD4IFKg1NjUgP4F3RZL1deVCm5fZzxtJLP6NuI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CbdTpy7s2wtPEwixCqOFKi3s1KWPGYg1Y0S+CM8eeyl8zF3qF//LrfaPTB1Y+T8DGuuYVYyiJusgol213F0hbhRyUfj6hQnV2+lyfKt/rnzYUGSwzIybHiAukBjuKDyAo5L4+LpdfE9lryiiSLbNVdjlnBqOkBmArHlv8ivj/q8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RVEIFMpM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XQ7rw277; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RVEIFMpM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XQ7rw277"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6353N4sd3633817
	for <devicetree@vger.kernel.org>; Sun, 5 Apr 2026 14:34:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	52oscFDjem1+c6zc6REhqJiMklNGT0dva2yqjZoyFxs=; b=RVEIFMpMKMSXfIoa
	ZPo3e86ZUVDI61Vmy8nadkvLlBqE/qMSGUYQhrHpp7qJWOroh03+1/6Tsbea1+XN
	F3ECjGHZ8d9+qDR5zxdzDKkaUCCXy7s++7o2h/yCnTTOwHQIY4etS7mLxLl9ehCw
	jyA5tUZTXQU+3HPXe62U71R3uDMC/+hCOB41mbD8igOHZzzHXwGOwQi8ChHGqd8s
	en36wRemjuXTsPKON/bRKa23o2jZKJYcAIpmJ4La9jNFAk3WI3bDj+5FGytIHj3F
	6dUg5t7j0I7lgzyTpH1KTPApDp3kIrvGC4y5kFXQvW7rSs2rX5awBSlwmdqykSrc
	0fkNEw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4daux8ahfc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 05 Apr 2026 14:34:27 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-89cd8b56114so122649286d6.2
        for <devicetree@vger.kernel.org>; Sun, 05 Apr 2026 07:34:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775399667; x=1776004467; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=52oscFDjem1+c6zc6REhqJiMklNGT0dva2yqjZoyFxs=;
        b=XQ7rw2771GniNjdHwC61LYFJzxsmQe2R1LYbepFEuvSVMUgBjE1ZcCsOsqLdiU8zw9
         cOIv5ZQApd4G7d6imq0+JRFC7wi42VU2PKKdrqrr59/L+U3bX5YWoX0AH93qzoRELufC
         Ojv7MHR6EHPtZZGc2HIGWiXeNsmqHkBtNR3FVAIazhvgG0f0r0zJrWy9e9IIob9dx3YN
         D1oGf7BsV3BD33PjAGRaCFVnoL9FfXrcp5RAyFwIMkrAk/hlasPH6keXkxGYn7+oblJk
         G1SOSGeGgfi2SzFaYNFGen54Ig7FuzKL8rsfehAPrUTXTkTNCMWAcQTv4UL820isfu2/
         nKEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775399667; x=1776004467;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=52oscFDjem1+c6zc6REhqJiMklNGT0dva2yqjZoyFxs=;
        b=PIUYgzqaGRUgrIXslqflQen/xscw7vintA6GWgMk5vQgxPsPLcivYznFLu+K6ab0Tq
         A46pH2SP4PNuQRYPolUN9QU6ODSLw4n8qP6cU5AK07CFS0Ndn1c3mGmoT/CS7hVklcjh
         FNS5nnQL5dTIKOPQNbc98UmtUnzJSNbu2UjehWLHL6a8Ap9TVFEeH/5nbivar9qOvVYC
         EW3H+byY9HUsnoMl+FCTJclF+9zProkCX0ja3Xmr/WQEHGhPrRPoGkYsgEDKi4MwchcQ
         0130rFFJP1Q/OA34JimzfqsOkRvZXK+2rkd5yHjjolPD6u1cBQdk6hgHSkbmEsoF+Eqb
         34Hw==
X-Forwarded-Encrypted: i=1; AJvYcCV5qILMA75IUKgB2hMQd0seyueUxEFXLoAawY1yYAjqPOq3uv9T8x5lZMk9jfB98mWynA/xQoHk7AJW@vger.kernel.org
X-Gm-Message-State: AOJu0YxSUOWTa0uwYV8ctMlOkwJJGGOoAit/2pOaEphNi7ZrhffDocAM
	5YgI3wfs/VaAtkFD4hWZmwU+0vjr+/qkoWxWrJNt+/pDbeJFlgGBLyJwSnbziEdDhtN7uN9lCyP
	4j8eqZDMACSTEbUxaZ2yi+/1qNryRh0RbsY6vn8lhZ2gOgL+jTcFZKSsv/dKAQ6Re
X-Gm-Gg: AeBDies+nB8vvIbzvvZ1FKVzrnL9OJ5ySW6G7HR/Y86nSh+mIoIDdmiaLCO05RihzoR
	6pb6QPjXrxvGxLVf80ouynK/oryjMuvNcfZ/ZheJ1nx7UkZV/PGdJKV8D7q2Svnx9O8KRWijkeI
	1pydNk/VmgIlnyKrvM4yBYg2ycOCUBhMVP+IlJ0PVwgitMLyTfgRsVve0nRj4Rhe2I4ZqUoJjvC
	dQE3XDWMGR29yqbiRT40MHneSz6+a85w1gfMWANlZW79WyXYrHWzAGyLvbPW1CMpaKmaQwElssc
	0zJnPW7mLSteEv/jgf2m4Pj+3JRxTGEpIE1jB5XLKET+kHASuWIKRtGH9J5cGRJxFDltFPikeBj
	Xh0Ip2tIdAcpVi7OOJrtiCcOyvFPK1hQaA7vmOzP925zZ
X-Received: by 2002:ac8:7f48:0:b0:50d:855a:8909 with SMTP id d75a77b69052e-50d855a8cb9mr46714861cf.32.1775399666629;
        Sun, 05 Apr 2026 07:34:26 -0700 (PDT)
X-Received: by 2002:ac8:7f48:0:b0:50d:855a:8909 with SMTP id d75a77b69052e-50d855a8cb9mr46714401cf.32.1775399666125;
        Sun, 05 Apr 2026 07:34:26 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887e80a616sm713934755e9.2.2026.04.05.07.34.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2026 07:34:25 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sun, 05 Apr 2026 16:34:04 +0200
Subject: [PATCH v2 8/8] arm64: dts: qcom: sm8750: Correct DPU VBIF address
 space size
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260405-dts-qcom-display-regs-v2-8-34f4024c65dc@oss.qualcomm.com>
References: <20260405-dts-qcom-display-regs-v2-0-34f4024c65dc@oss.qualcomm.com>
In-Reply-To: <20260405-dts-qcom-display-regs-v2-0-34f4024c65dc@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=845;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Hl0zlaD4IFKg1NjUgP4F3RZL1deVCm5fZzxtJLP6NuI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp0nLeYiVcsI8vu787g1/XyQ9q0dbh9TdjeqRqI
 rrMFSpeRL2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCadJy3gAKCRDBN2bmhouD
 157JD/9is11lENJgRuFgQ9Yth9GAtompFKYbTWij+WSzhIj0ch7c2fycWLChVDDGZSL2BJw3dT5
 jhYIU3JROcDUMvbOjNgcw7W68rqWjBk0Hltm0QFnGUiwUXGlkmULuSKPjA2kRlSmdqJI32ewiOF
 UKF44+/5BSY01Hc15/Nj1oxNSRjh9kbPzyg90iHXJ59QwPcp0oaccz1as04khsYKv4OuI8Ye1J0
 x2cLK1PnCsb5B95adaaAtFB/l0fMo6V6V0Tm/+9rJezcvURfDRBcHgQUz0mSMMfSlyqoyPRERBc
 mrlSzfBme4speAWuCSFh1thHbFbc0h8mDgVQ7l/DkTg4PK/5coVBHjqvRDwh/NFlwhQhFpLZBwy
 iqY3+BX4mEwmfFDmFUwDjpLbEaXf71rrvqfTy/9gE6fONgz+YUHPqLCuSLSi4qmdrvh3WKw4+M6
 Z5FzP19pktGnQ+VOdM9UUEMlpFYM3tAAneZQSCRK5UV8sB46AdMj5N/Hjao588jNqsDoGk7Eq0c
 +JjXpE8nE8ulKxN3JVmr4ObKKJRciTTpgmZ+t+MVTQMxvxGicOoDp/dWXewlY8ylsraI+MohEGy
 WdJBAF1hwYPZf2incCt+2S3C9qazhWKpPgAeLmVRGghQmPlYD5z9sB6+4/iA3oktncZ1GPun5yw
 DXIseaB5aVuK9wg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: Y9MXZ9fPgtZ0dtUamPVZaFLxq9-b2QFQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA1MDE1MSBTYWx0ZWRfX3+ohMSB6w60D
 nX67mET0TnEpAgw07JQu6TD7RRo1gCpjnOn27ywWzuDTpA31Pe4joyOEMWsmrrnGoKPeI2x9OQF
 tLPOp5lYhLFdBh9ueVJG3BRr+PBbpfXgHRfh8m11wH7FZWk/SbMLLzalnGco/8Dk2E4TLKe5BxU
 rXXTTzAsySBLp+StcC9040Bf8yKpwHzx+0CulrcjN5JI2QsG4m1FBerPue+2CKyBQfpclRtMrpL
 zJzjhmuG+fh/CUXdX9NUba/L/XggJ8Z6xzyLSRLL18iti4U/XZj0rjyC8fpC9NajGE8860CoSOf
 Q55AzNGklXQOZ5TyNxZ9xgqFMjXnMsYxelLxRwGmLSH9mqRPUL24xe6xYWInD4TC+pOoid4ZfGR
 h2BBO+AYLakuAwhNh6+8bkGh4vuP5OibPJ7bt/TAdEmve4yeQXaUe4So1aROzzTwVNTr4ig1fOz
 HsVpUNQoMrTba/BlN1w==
X-Proofpoint-GUID: Y9MXZ9fPgtZ0dtUamPVZaFLxq9-b2QFQ
X-Authority-Analysis: v=2.4 cv=AuzjHe9P c=1 sm=1 tr=0 ts=69d272f3 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=WYllmNudUJmrw8VR-PoA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-05_05,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 clxscore=1015 lowpriorityscore=0
 suspectscore=0 spamscore=0 impostorscore=0 malwarescore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604050151

VBIF register range is 0x3000 long, so correct the code even though
missing part seems without practical impact.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8750.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index aefe517e0669..f4b8703ef856 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -3041,7 +3041,7 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 			mdss_mdp: display-controller@ae01000 {
 				compatible = "qcom,sm8750-dpu";
 				reg = <0x0 0x0ae01000 0x0 0x93000>,
-				      <0x0 0x0aeb0000 0x0 0x2008>;
+				      <0x0 0x0aeb0000 0x0 0x3000>;
 				reg-names = "mdp",
 					    "vbif";
 

-- 
2.51.0

