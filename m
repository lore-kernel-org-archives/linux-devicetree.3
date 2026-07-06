Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1590412266
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 10:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783333199; cv=none; b=KaTSQdKtJbTSt3KxfWqtDzDt9kzrwoIgIm/QfNB96DzdwASd0lTZeuW3eN4Z5PfSTJ4K8dse6tcIiz2D2gMRQ4GCKB/QqIOuLNQTF/+8S+JOnpuOOC9sIcunr4EV3bdNhyknW9V9QQVbiS5bHIudKZ4Vg5cqlyeUITUaTjnrV4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783333199; c=relaxed/simple;
	bh=axU3ClN7PPFa4DxjQxbfhMg1dVxjMj5qElsJKDqgZLw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LC7q9ef0pgEVUlKzxQDjtdUaJ+reRLplrE9RfYgKJ9mH8JvGqRqPxrrs3hi8Uo80QhcStqvt0acwVHvTkeOKzvaWH0JPskLTUcUOBnONrl0jcjBZqd7+eNW6J1i7iYEQS14xpH4vLQvLAwjuwWIH06FbkDDZxrJSCP//jwINF9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F/DYNYTs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BsZTBvFe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F/DYNYTs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BsZTBvFe"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666A3KuN121500
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 10:19:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=fp2LR6M9xnkRompACiDCG04L9cxx+pC2SGu
	z4SfYOsk=; b=F/DYNYTs74zTC3R95rs1dc5KOkM1oJOTwurk4FEcz6WmI+EMoU+
	cm5zeDxyn8ImI4vY0nM9vFQ46ASIpEv6cu/qr6fRmTjKuzk/5gjckAUUCOL3nt6D
	3McHALQBfgr17RTTcSxX73TCL9DpNlkBVkRiLRPI1f8ezV0+s1g/722D6Qdb3nWQ
	qEdnRY2L19jc2FmfZMjGHMKyvpzp4TP0Y3qdMxRTxZukEF1HpBjjKH1LxjhxAGIk
	DCtjDRcPfZYLUvhJPjynlzPNn5D58BfmPTWNYvk+bAJjTUtkEE/D9My9U5brAjMF
	1LmEekxE8i10tN7GpwiHruJEMJUt4NfValg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8a98g282-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 10:19:57 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-91931144870so225289785a.1
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 03:19:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783333196; x=1783937996; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fp2LR6M9xnkRompACiDCG04L9cxx+pC2SGuz4SfYOsk=;
        b=BsZTBvFea4qZIGtj3xvUdxvU1stFC4B+rdVJIwnwaEin2OzuU3uhMbix09Ma9+wjq+
         dmq4VCeCxZEPJhFApG8yh+UXh7xn403axHo6bKlnbusJtYXCvEI1TOA7VbZc6x1K7rXi
         Nv4H+VWgVhPLfkLfuOwLGC6zES2UrJCgntdshbZgAhhpENz8qSrKe4CIIpagGAc5PFf+
         JmPeyM9SoUArwyeGLqS8rGMowxosL+LMWWl8EQyS6zje19jM/9KtJb8UuAFGscaWV+s5
         RO8KZDQIFtr5u917npgjoRtUebZPvS9dIChTs6Wn+O9D2MiW3dbga/UOBQRuZ92G9GtX
         qSAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783333196; x=1783937996;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fp2LR6M9xnkRompACiDCG04L9cxx+pC2SGuz4SfYOsk=;
        b=IkO005pBQ3bSOivfRqyXVGnFCMFFJfopIR/PkxYxLt05gafbQ91xmnakkVKDQIzgsD
         c6cC6O1Lh5/16THfy0/5Fcxp8fC0bZU2YhXiRgNOSHVBmwKVtKYmufAoOvmC1gmuDWdb
         xf8IarGhlGVqlyuGdftW8HBYS/AWX4njJVOB5CP2avQNDJq/mHVGVdgbGqGeX4g2v7Pn
         DldCh+1BJyl8KTDbKMTyb/9Qn0xFS4eirAN7f3DofuZ0ilkdyQz6AiK8VcBH/nQHKi6W
         HEHPMFtiiuzmI2DI9OgJPD0rpat5vVcx8hBw4pVTqOMPZMU4N/MC+BJRTdOHauZaozDV
         qrtg==
X-Forwarded-Encrypted: i=1; AHgh+RoidAkyUquC4Obe47MJvoS8kz/HfMFiJehd84QNKTSGg+rumWAlj0TabmphV5IGAjRBuBWgamuxkPTO@vger.kernel.org
X-Gm-Message-State: AOJu0YzrhtMJn1+ZzRWWAQizh2VcfFWV4C2/AwainLol+rJg9qhJ37fr
	O4bebBiAt47EKirCjJXv2MMrW569I94nBHngIUfQ2/h4wKlt//rT4i1K3rbM4rV9GNtKZ159uPl
	s5KFM6GwJSjNU6hu4G8u/NWQU4uEEq2u/EeCmEQDnf6eeCGGjWvCk80qYbL/h9kcL
X-Gm-Gg: AfdE7cn+ltbTt2+jG9j5ftZQ+gZTJyUpEdE2LWexhA7WkCi6xn7GYO7AC7WP2WSBcUP
	jMJQNBaDL3QePRb2MEjiFQiRXd1XWoP0w3nJrGJAInRLqEFxGV85MDevv6Sko+MqkHSQ7YVxp9U
	jd1uDFh4AvUF+085j3ytesU+LEMsAunDuRy/XeediZKOiF0dj3X/ocWuWGWWGzupfnd7o0ChZrx
	g+Af0WmrNTuf4TeqmpTGs1nnJFeRxoQVKiHWvZAS9pluxcCHtIupJLXq8ZyL5RZTnpeoGsZFJvO
	mkSZLrDEZ/DdIFPPbqjiw3Axly+c+D6mWmcM1BIiYqUNOc2xCcBRVF2sfn7EvNWhHzOgBxvV5uw
	sOayC8wxYbUU5OxF79BpYtP9xXh4=
X-Received: by 2002:a05:620a:8811:b0:92e:6533:26ce with SMTP id af79cd13be357-92e9a53a993mr1386022485a.71.1783333195963;
        Mon, 06 Jul 2026 03:19:55 -0700 (PDT)
X-Received: by 2002:a05:620a:8811:b0:92e:6533:26ce with SMTP id af79cd13be357-92e9a53a993mr1386019285a.71.1783333195486;
        Mon, 06 Jul 2026 03:19:55 -0700 (PDT)
Received: from quoll ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47ad69519c2sm24514134f8f.37.2026.07.06.03.19.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 03:19:54 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] ARM: dts: allwinner: sun8i-h3: Correct indentation
Date: Mon,  6 Jul 2026 12:19:52 +0200
Message-ID: <20260706101951.341727-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1164; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=axU3ClN7PPFa4DxjQxbfhMg1dVxjMj5qElsJKDqgZLw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqS4FHiWJVYH/5XmTaaQuajA00KokkoFeKc3om/
 +8vVJI4F1WJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCakuBRwAKCRDBN2bmhouD
 18n1EACRdxv9uvSocdbI1X13995UM8uwb+F5Mh5dFtuFlnFCv/RGo8u6QzYnxAwmnYOGsWRBzkM
 OrtCtZSrAb4WqUiOHl+0N5tQJdqPivLh4FUufU3vM93YKhMCIqrww+cGlgglF1D3TdDHYCCXFZP
 ploHT6KUOeaoYTNusoRQhJS2cmo5TJWZ4X7qRNLEzVclQe5xF5He3uDiWlw1WGUhy2wGhRj32MN
 Mr95NOH7mdPIT9jGOHaRd1IZQI8qEsWVGLh0gfua/OURBn8TkW/R3egK+4FF8TzX/mC1Yc58Or7
 iu7u8DIyRhL7phbD963L1+hs4aszpAljeqowojD999a8KogtVJ168MuM2wZXhq/fLKpqZlxsoMr
 nX6EMxbsrs4elOjH3vgsbxoLLHAMwu7hwZ40evoRREeXcNP/d0TTu/qu+kPx+WR1V41msSr4LYt
 Zwk/519wBzrAQFvrwo8Ew9xL+uk5TIHVkV5A4uj7I1NlXS6ovREyQ6cDec0UW2GqIshXT83zZc3
 IMPvI1ZOGuK/jBHpICb1JWz675G0xOyi+q3Nyu5VjCJL9PTT1Iokvko3E4AE19+Lf4Qw4w1sgES
 mBbh4q4vRf2D1T6DU0QrvCYce7FWczy/Lpec9bRZy7K82TokHrlLUQH2+IhWJ0QnGOUluEauod7 Sk48bjHXi249e/A==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=SpigLvO0 c=1 sm=1 tr=0 ts=6a4b814d cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=c6vaRMsCSfZZW2L0M5gA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEwNCBTYWx0ZWRfX9OSEGJ1tL1VB
 xGEOAs//to9VKqN5EdqaaqHlSGYMow97x8PsyPWJq75AWxzLRK3uDhgFwueCELZyY+1usK1QQf5
 lAUuKuTCXwk3rHtfZ52T8MPD1wT6fvi2s6fShVvmDiWeigwts8lk/oOzyQtK6TOXBJLZjPNNEG8
 J6wTt9YmBSa0ddr9RAhqPSa2N7coqJZbP8Elymiz5yoVY4cILsohRTuNMHxSZlaS7rWEsdhO6cB
 tu3IRZHiOxPpkT2fz8VdJYvKhzLiKcbT/3cAV/QLLViP1iOR3ruWJJUx4pOMTqmWMeT/aqVEZvt
 Wh5vOrOn//cNEkcMjhkVnU+3i5h0CcZqbCbSW8K1MoH2YpS6o135j554pikUEhc97gGmnlPqE+z
 GR+h9ZgLHRYsR5Ydb4xCByypzKrMCuQqzpGNq9eEJR9YkkVs4jLlasnyursiiI8Jr5Om0TWmqQz
 ZFDkoWqYdGfx9gaxBCQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEwNCBTYWx0ZWRfXx/5ZnweQD465
 4n7DL8ZyYqDEp4PZsV3oNp5tZiyRcsx1NO9XhW+NmIcf5gtTHyvkFXZcj6q4ZzqtuVLXd2q356H
 zlcG/wWG309DDb/Ep2VDwmSjFyjihKQ=
X-Proofpoint-GUID: vsZgb762pWTmdkFFQTEyUg2rdyJMfoIX
X-Proofpoint-ORIG-GUID: vsZgb762pWTmdkFFQTEyUg2rdyJMfoIX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 spamscore=0 clxscore=1015 phishscore=0
 bulkscore=0 adultscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060104

Correct spaces or mix of tabs+spaces into proper tab-indented lines.
No functional impact (same DTB).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Ongoing bigger work for all bindings and DTS with built-in checker (dt-check-style).
---
 arch/arm/boot/dts/allwinner/sun8i-h3-nanopi-duo2.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/allwinner/sun8i-h3-nanopi-duo2.dts b/arch/arm/boot/dts/allwinner/sun8i-h3-nanopi-duo2.dts
index 2b0566d4b386..88550da5af62 100644
--- a/arch/arm/boot/dts/allwinner/sun8i-h3-nanopi-duo2.dts
+++ b/arch/arm/boot/dts/allwinner/sun8i-h3-nanopi-duo2.dts
@@ -73,7 +73,7 @@ reg_vcc_dram: vcc-dram {
 		enable-active-high;
 		gpio = <&r_pio 0 9 GPIO_ACTIVE_HIGH>; /* PL9 */
 		vin-supply = <&reg_vcc5v0>;
-        };
+	};
 
 	reg_vdd_sys: vdd-sys {
 		compatible = "regulator-fixed";
@@ -85,7 +85,7 @@ reg_vdd_sys: vdd-sys {
 		enable-active-high;
 		gpio = <&r_pio 0 8 GPIO_ACTIVE_HIGH>; /* PL8 */
 		vin-supply = <&reg_vcc5v0>;
-        };
+	};
 
 	wifi_pwrseq: pwrseq {
 		compatible = "mmc-pwrseq-simple";
-- 
2.53.0

