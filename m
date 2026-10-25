Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792915462;
	b=HYsdEgVDaHM2dK/h0OOjUpfIaN7Bk2cyEjFfR9oR1iuHjYY31vkW33qmCwSPE23Lb6LT
	 vjFMxq1nzuShuk+8J2NES9HE/j9mynLsAS+vEtUj3olJC+g4J3iJZ1EQfadCNzwylbuj5
	 sgZovQ6FH+mNn6uUzwgE+NyJ6acxLPlAbUAoORo69QmHNhMIcQfiIj0axzXg7zW0h+mTm
	 SX3zC69YSaI9Mr8gHCOi3MpuK1sxmMRYt6WsplscBGk2SZYF7ccKR9UA6roPL89/oTlAU
	 QXU8KP7eo5VCLp91f6QpOPxBa6k7o6H+5FS0i9DcH/X5hazUYbIT79UnQYZW6agn65A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792915462;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=J2GYP2bcjwkDFqHNWYeEbSfUF0yw4ds3/hBpHNxwQcQ=;
	b=ukZNGHBYI8UzearUjwL9KU8oTgc9rnTNq2CwD7c0ZqWEvyE48vYZjuPUDBwcXhOttubx
	 a5NdKmsCMxRKU6VyefqqVoNH5eN3j3QxRs6ikUfpMZTtZrnEz0oUlKqHnRqEGvAXyVpzQ
	 R/i4PwU9Gp5M2lC5f5oi6MrKIKWYaJXDqQJYfrXm6Jeozsl/D1RcMbciYXMhEbo5zZhXZ
	 z8WDNMp7f8DeCqqRlutuRS+9aY+ZzHNUsNdTQVIlkmpmzNOXwkf1Rq3H+16XCqIsTiu+D
	 Cd0QTW4N+NRamynOHu1XgtowSBQ3oZ3W4FzJSaDIz7jcP5k+j+CnKjx983WhfWbhyOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NJsNFwIv;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=er3Yn1AW;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1ED9606A31B
	for <devicetree@vger.kernel.org>; Sun, 25 Oct 2026 08:04:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1ED9606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NJsNFwIv;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=er3Yn1AW
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69P4stSw434748
	for <devicetree@vger.kernel.org>; Sun, 25 Oct 2026 08:04:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=J2GYP2bcjwkDFqHNWYeEbS
	fUF0yw4ds3/hBpHNxwQcQ=; b=NJsNFwIvZCC8q+/4u7GRZPZeidXn80wkq0fbT8
	vK+JuOVTc0huhKggjOtFPlRikAOA+lERIHnC8gPLVhUzFETvh0WUeSl8ni7QbORi
	0zbWEZB/52H2hxKd+GSoAdFOtASj9WvgAfMUA1PIXzMD8lA4NkZhAOh+ZIRmd9vM
	ihtJF8vvD8d8uDkQI12rMOm/ZAe37PY4BNvoTlglsL1cAmlCr49kaNSU+sqaN2rd
	HcUstI7vkGhEVWS7Hqj6lURi8rp7ufdn3SahPYe2FF2zGvKSPovlp6g9/nF5Jcun
	khE+T6KobsV6ISna1YjdNmU7K4Ou+0hp7DfT1Q3YnBAf8V4Q==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgjcgu1dg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 25 Oct 2026 08:04:20 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-155a75f91e1so3486601c88.1
        for <devicetree@vger.kernel.org>; Sun, 25 Oct 2026 01:04:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792915460; x=1793520260; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=J2GYP2bcjwkDFqHNWYeEbSfUF0yw4ds3/hBpHNxwQcQ=;
        b=er3Yn1AWOEJkllMHTH8RtyBdoBMXV0Bl8rlD7te9zLkFY7MvtDg18Lrc53z7OY3ZQp
         3Ol+lpsNtZ4Ne0DcBNolXThRNyxrqgqNMP2Qy4/NOIwIgWmKX7tyULhB7mWRI0wXJ6rA
         y0SUDUC5Y6Xm3T/7/xF5mAWejbKTYqGwMir81NhvS+aKuiMEPRMeCiN3oKu42X47gDH5
         dGligSvArBdzo2eTqCtiZ2RxyZCAdcVQCuB2fKSMlMSq7igBUCpUPXHm13+G5gufNlVL
         1KsnzEeHg/4G8iWwbh4lkFzkUKVgZ/ClUQhR/nTKiL53qJEOt74FA205wYakR4kvhS07
         DDgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792915460; x=1793520260;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=J2GYP2bcjwkDFqHNWYeEbSfUF0yw4ds3/hBpHNxwQcQ=;
        b=picXD7Ak33KXMNJL77r0k/vH+PWFrSYqFX6eeU0XHfxPk/NppB+TvkxscVZKHcVagG
         Am6ipVL5TeKWeoFnbYpRXBha7KvsMdXjvgyLwrG+fznvNbuW9H8T1biHIIjVK3Ky63GI
         jNyGBz+IuomoPWxvraFGedMLRAHCJKnF5qQl7vSXrMANSC+qjBKJ6dtiPG41W8QOM2Vc
         3xR9yDKueF4Zgedqk+5Kco0U+leTiuggk1jShsPM0tCqMnvWMvc90L3Z0GR1fCsqu4t+
         tHmwI7PUA9bMkKgHoCllJcdGJV731K0ZfNz6za7he+kOlJRQCMMg3ob/TZbgtnOY2zHP
         JalA==
X-Forwarded-Encrypted: i=1; AKwUvBwd7lA62ocQi4joJGvUQ3jDiHIlNiaJS2n20hRkFIO9xv8MqgOErQ1/tJUGiWiw+smlETERLFgIxubz@vger.kernel.org
X-Gm-Message-State: AFq9FYIoPvQSQZKxuiZKjY2eMGFbeS2zOqQ6mzBRfT4xMoT4GydxUDpP
	tIRWd8GB/njXzYAW929AE/8sWubJnTyqwMzAumHIJLcQ0C1MVO8KotvKQHwB+OJumfo6iACxTpN
	rNp6wWptrnwHkmBjYX50p2a1ghZHl7y5PdjPKGWydpCR6UasQMyDNu/pZK4h0Y6jzcCuorwVl
X-Gm-Gg: AYBFou15ml/9mQGKpWFX/AHqRnnKMDqMM0kKj8s2aPUaOScg3koRjO3Une0OwMKIUNG
	jnn8+t2hKqJI84fvBbQtEcukp9iKFKpUTVLVoCudW4naFsyo1zIMY1NChjOwU5JdKFpEC302p29
	ADsCEzdVCQaw0gNuTICfs03zK9JYQspNguY0C50+cgO+TF5nRN1n7ADI8ei/Z/76vMgz7Ybsw6n
	9B5/VI4ZN6ogjW8U8ea7fNx//24Gjh1FQxlU0Lllh3LQOYEIrenM4kpq7gZ0AdPTdS4Qfugm8Po
	FknOOYhPb862qpSr1mACy0WLNxjiqvnVFpDH1R1PO1JxJdNoyraedR3HLTjkuR0YalM91KOWYhh
	n5S3f2ZrAIQF5S+/rZbCE/mhpHYtZ
X-Received: by 2002:a05:7022:51e:b0:14e:d0ba:75af with SMTP id a92af1059eb24-1994d8b728amr7883416c88.6.1792915460145;
        Sun, 25 Oct 2026 01:04:20 -0700 (PDT)
X-Received: by 2002:a05:7022:51e:b0:14e:d0ba:75af with SMTP id a92af1059eb24-1994d8b728amr7883373c88.6.1792915459531;
        Sun, 25 Oct 2026 01:04:19 -0700 (PDT)
Received: from hu-gkohli-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a0f81ea9sm16147303c88.11.2026.10.25.01.04.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 01:04:19 -0700 (PDT)
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Date: Sun, 25 Oct 2026 13:33:05 +0530
Subject: [PATCH v2] arm64: dts: qcom: shikra: Raise CPU critical trips
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
Message-Id: <20261025-shikra_crit_trip-v2-1-79e429cb9350@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIALi33WoC/32NUQ6CMBBEr0L22xJaCQW/vIchpK1FNgrFXSQa0
 rtbOYA/k7xJ5s0G7Ak9wynbgPyKjGFKoA4ZuMFMNy/wmhhUoaqiUaXgAe9kOke4dAvhLLSR0lp
 bVVZLSLOZfI/vXXlpEw/IS6DP/rDKX/tHtkohhT4Wrqx70zS1Pwfm/PkyDxfGMU8BbYzxC42wM
 Wi3AAAA
X-Change-ID: 20260924-shikra_crit_trip-7a11bbb66b71
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792915455; l=2686;
 i=gaurav.kohli@oss.qualcomm.com; s=20260302; h=from:subject:message-id;
 bh=9NEPErxMm60dBJueiQOlAK4w2gncG77hGo4ML1LQSLc=;
 b=TwY+vI+fG86BiToPOGX0DYO2gXUwEYF0FyBZuKKlAOgItrGWJo2ZyfcSaN8NPJYed0sgnBU5E
 /iOoXBmP3UqAoAn8pIzdogWSUN3UUi0Xltcnx3wRaL2ibpBUYDL8Ff4
X-Developer-Key: i=gaurav.kohli@oss.qualcomm.com; a=ed25519;
 pk=IdNsqe8rWsF6dbpGHfwPEH9zM0nbOdRH72HxUT9qPak=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI1MDAzMSBTYWx0ZWRfX0ZCucn9VuJaT
 EHMKzOUTO9KgyqpbZZ6/kVYR8MNuccEITreAv/s0B85rPcjjiWvqB3W++VhyLA5pV4qSWiy91zb
 lAGbo3V3oJsxBSVOku9cJEhsyAAC6ok=
X-Proofpoint-GUID: UvmsCUeK0bPnlfn6qpqWq70EMwQWlT1d
X-Authority-Analysis: v=2.4 cv=JvhkP84C c=1 sm=1 tr=0 ts=6addb804 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=jog98iChi2leUUf6YfEA:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI1MDAzMSBTYWx0ZWRfX9xlA+R0e60K/
 hbXZAIIycukTg4Ehbw1W3XXtjjfeECFU7XlLwuR3irRVzRG8aocfv/9pBz5LzapoIzJ1WHG237P
 /8Yf2rPhWodpix3ROgP3nZP7NhQL/ZrEkynUlOwkOeUgkOQ9RmvSZTLA6o+nVY5e19PZ7ScdR4e
 jmOMTKR9yExiZoCCT62Dav+PMmJkI7nXHHF+Tuz55Mh+MlgmfUuxn6rKR9dKSPjzheG5nkHsVqL
 A5+0g+1zsUS2eTxtEeUFZUZ9obVPBMGY9WatHtf+hgPUfOgAqz4836YZP9yhYEt00xWreuHyP4E
 d/JPYQWcmpPWdprbzDwGejGlmOhNv71AYs//2n1ZzbeAS89hzo8bTaBOrBV9R1FDABuM3S4I3/B
 vrknmYLf5yuZsOaXmV7jg2IpHfo5gS26VuGZ1XGzgALKoBpaVwpydzusH2L9kEXb5CtFVJFm80m
 UPRQyF5LBbgZm4noRfQ==
X-Proofpoint-ORIG-GUID: UvmsCUeK0bPnlfn6qpqWq70EMwQWlT1d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-25_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610250031

Shikra firmware starts CPU thermal mitigation at 115 C and also
handles the 117 C threshold, while hardware shutdown is at 120 C. A
Linux critical trip at 115 C overlaps the beginning of firmware
mitigation and can shut the system down before firmware has had a
chance to complete its thermal sequence.

Raise the CPU and CPUSS critical trips to 118 C instead. This keeps a
Linux graceful shutdown path before the hardware cutoff while allowing
the firmware mitigation range to run first. Leave the hot trips,
non-CPU critical trips and GPUSS passive cooling map unchanged.

Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
---
Changes in v2:
- Move critical support at 118. (Abel)
- Link to v1: https://lore.kernel.org/r/20260924-shikra_crit_trip-v1-1-730c48fa998e@oss.qualcomm.com
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index c1f06f692f66..c4e1b78e2673 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -3756,7 +3756,7 @@ trip-point0 {
 				};
 
 				cpu00-critical {
-					temperature = <115000>;
+					temperature = <118000>;
 					hysteresis = <0>;
 					type = "critical";
 				};
@@ -3774,7 +3774,7 @@ trip-point0 {
 				};
 
 				cpu01-critical {
-					temperature = <115000>;
+					temperature = <118000>;
 					hysteresis = <0>;
 					type = "critical";
 				};
@@ -3792,7 +3792,7 @@ trip-point0 {
 				};
 
 				cpu10-critical {
-					temperature = <115000>;
+					temperature = <118000>;
 					hysteresis = <0>;
 					type = "critical";
 				};
@@ -3810,7 +3810,7 @@ trip-point0 {
 				};
 
 				cpu11-critical {
-					temperature = <115000>;
+					temperature = <118000>;
 					hysteresis = <0>;
 					type = "critical";
 				};
@@ -3828,7 +3828,7 @@ trip-point0 {
 				};
 
 				cpuss0-critical {
-					temperature = <115000>;
+					temperature = <118000>;
 					hysteresis = <0>;
 					type = "critical";
 				};
@@ -3968,7 +3968,7 @@ trip-point0 {
 				};
 
 				cpu02-critical {
-					temperature = <115000>;
+					temperature = <118000>;
 					hysteresis = <0>;
 					type = "critical";
 				};
@@ -3986,7 +3986,7 @@ trip-point0 {
 				};
 
 				cpuss1-critical {
-					temperature = <115000>;
+					temperature = <118000>;
 					hysteresis = <0>;
 					type = "critical";
 				};

---
base-commit: 3d7783543c2646af69ad65825e810060494bea21
change-id: 20260924-shikra_crit_trip-7a11bbb66b71

Best regards,
-- 
Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>

