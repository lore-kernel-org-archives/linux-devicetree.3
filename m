Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D54DC370AD2
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 10:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779187698; cv=none; b=N6iVqLOaI3CUX4vqQVWUhFRL3nI5otG6Yk7NQ3+Tgd87wB4eLbE1+cFXLjDFdFBnNV0rI3BnF/nkbz7nwRgNCcHLbbs0fsP7z3yhFkPNIjQ6dc1h67W+PAWvIhGCrcNm7DD9YmV3Cv6APs8Y2bEw98MOB/FU9AvSzG6i+RCiQOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779187698; c=relaxed/simple;
	bh=CnlNaW03KiTGxBA6okSwBVqha/NCGg0XLOqtGZiiryQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bXz5Ud2M6UzNw+/uOT8vwwHhm3tIoHVHz2/4yfz0D34gTwiYG2E1pJDrz2toER3prr37VOXl+LVcvvvfv7Fw9YF7egNr+N9cPeg0aSljHpFtIhuxvxLW1T888a3Ca7/XwABXB6/b7pfTNmonH3OSZEOmflha1MlA9LBO3l2128A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KKStaL56; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DUp/ns7d; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KKStaL56";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DUp/ns7d"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J6glv31737101
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 10:48:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TC8FAZVWJ0CMZhTEfR47NNtJ3GnYGqJbIGdm9BhCskI=; b=KKStaL565Dqenl82
	go+g8TJpeD+juwS4Po+Ql/AwMSjtMuXQbIoJdki+GaOrMMTqmeYfll5mx+mupWoM
	PvGj8HjwJx5aQ+ZsWbiL+nzIAFYqHka0fiskMKTr9klpeKs56Wad8KD0wK5qaq7n
	SECK9YhRUWbnzeTV/DovMSci4AaqIWNrRlWJgx7VQJRuDRujJHhIUiCQHxjF1eyK
	03HivID8wnHWTF+OS+UU6Bo+S5kseL5Hz8orGzGEH9dABkVWvDC6qi7nmGSDdYDe
	xFDnh4K+CYqZtkt7TSBUyXn8hkIpy3AlRntcKLttfw/8u4Z8nuNviYabQEHGZSSs
	+f2Ucg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8ju911a3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 10:48:16 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50da529ff48so97633891cf.3
        for <devicetree@vger.kernel.org>; Tue, 19 May 2026 03:48:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779187695; x=1779792495; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TC8FAZVWJ0CMZhTEfR47NNtJ3GnYGqJbIGdm9BhCskI=;
        b=DUp/ns7dKpJYrXcPuZc12xfQ4bI9CnAlFmn9p+V3YQjsYiUcbUo5Ss0GfbVZkVnmCV
         bQhtAqhE0EwoDRnBTVEorGtUiMXkMrF7WV1l6m4DPs1+lUm276kZrKrTR9jhkMpol7jX
         DFzfSfZ3quE9mKRbMpx1X5vUaXah3UHk/S9u5V3PKPdAbSAtaRbVu+CFViv1Sf6SfjGn
         hvbfgOXkD8R0oyTT7nTLhEWpeDdIUFMayqNrB1/V6I92BDBB54vsKyV6uJEdaBH+msMW
         omETpjgc9ej6aPg2q4/1bsvkgRDRVnZIlB3wHpO+kj9OBnlwsECJkJWtlWtZSe/As3xm
         +8KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779187695; x=1779792495;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TC8FAZVWJ0CMZhTEfR47NNtJ3GnYGqJbIGdm9BhCskI=;
        b=AA2pfrWtDpdbXE1rSE3uEAqnGsOO0Onu8lIHytspSr70kdF2zyxBMhc5MWS++6Wquo
         ELeuAJtB8+hnl6AwLyJgj0YcV434zVtBAf4onlH1u81ER+Apr3gRjNHMGzt1oCXz/aMK
         E/jM56tqmYKg0+McMC0B/zaUBEAbFs+A2MZK7GnUh5kDT74gu5L3fMTuhdL92I+dVZsa
         jJGLr4kehtkKohFe8cyo1KFnTd7GIpoJJcePr9V3Oclvfj30SVtOEujHPPs3LgUgVX6X
         be46kW0VYUwTXigMYv5TzFNv4SaWICo/oUmH9xOKttYW3SrpCrAfXhdV6ruZ8CnXC/qk
         L21g==
X-Forwarded-Encrypted: i=1; AFNElJ/6WfPpwNl61o3qxe9+ul8sNbuQZSkVGe2VdHNtYmL7YxsdLfHDLjAVkkG7nqtDA14GrjmMtHRu0sAO@vger.kernel.org
X-Gm-Message-State: AOJu0YzyCB/C2XzJZGtWgTpmjiVJQv1AEPX1EuY3rQvx/sXUH7w1bl7T
	Xm19ser8EF2aREZZtJ4qBMPM5+JW/PuPrKV8bqBr7L2Am/ZygBwhKL/ecHg9ldpSAAq3clHVfwX
	kkb9cT1xyOW7OJwpk7YSUlVim2ebS+7G1bIMUsl4fcIEYR/38S6u0Hl9q3kx5pvXw
X-Gm-Gg: Acq92OHooIMLYIhkV8nbKh1f18QVhc+IRAzT/rjoVikRuDPCdqMBiBvjw9KuVg+flM+
	PDkIpiuZpNYaWG8tlYSHE5OEqN2ZSVCUVoyxe8IK6nY2tWl1pW/qtADVI6xyL2hKcmP/IunKJD2
	SGlncIeFyB9JUqy9PXm+nX10zs0zMfZEIG98RmBDT6rhdg0DgzqlQWckEgauClIkGHD7VaJI8HK
	ubqS1h0tsGbzbWf1uXKocZyw+CjFZI0XT0qhsyGoHuXnqxiJlxWdpnK65eD9Zdf07scB8aemQtT
	qdVtDmrpHYyowMpnsFbTrtqtQwcNjm9VMWp1HDgntkKyhsC7165q+X/19AEYBD0iUx96g70s8E/
	o/rPGN3jK6PiRsyMC9eFpugo8PU9M+/WpdovwYZms7yJWkSzbis60PLThnM4YVBQ21iRh0F51RD
	Ih2w+YMS0/V9+/PRWOWpz0vI/TUFRBXPfQMCQ=
X-Received: by 2002:a05:622a:182a:b0:50e:89e9:271c with SMTP id d75a77b69052e-5165a046389mr264847771cf.17.1779187695257;
        Tue, 19 May 2026 03:48:15 -0700 (PDT)
X-Received: by 2002:a05:622a:182a:b0:50e:89e9:271c with SMTP id d75a77b69052e-5165a046389mr264847391cf.17.1779187694695;
        Tue, 19 May 2026 03:48:14 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a90f11a59dsm4031413e87.25.2026.05.19.03.48.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 03:48:13 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 19 May 2026 13:48:06 +0300
Subject: [PATCH 4/6] arm64: dts: qcom: pm7250b: move vdd-vbus-supply to
 connector nodes
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260519-fix-tcpm-vbus-v1-4-14754695282d@oss.qualcomm.com>
References: <20260519-fix-tcpm-vbus-v1-0-14754695282d@oss.qualcomm.com>
In-Reply-To: <20260519-fix-tcpm-vbus-v1-0-14754695282d@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1317;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=CnlNaW03KiTGxBA6okSwBVqha/NCGg0XLOqtGZiiryQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqDD/mi3KUau+FliRKwMuvZcpIaPz5LqeOR14bW
 5R6b4cnuKqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCagw/5gAKCRCLPIo+Aiko
 1UyeB/4pQXeLHUvkH4LmPgHo4ym6ZOknqm+33Xz4394I3N/Kqz/eqyaV0KULKE+GnYXSy53nSD2
 uFJ0iHU23n6Vyt9ESxiuLRNi+yktffKBTIjRtB5UxwZcttEFz2jvInJTcIpvjtpUY41lFbyB2f0
 bYyi81MpEbjK1EnAaDxnwIB9Ll4scEQ60WmmiVR/53siJ/WYVht2RAt5tEa4IyCM+C/kmc2lr9u
 ka8WzFUfdoCGQtiaA/uQOgpigPJhuVfwuzAJEcI6E4AecN+R2vFYTWMQyKnfTN+yo+hK5oYWtz2
 lnaFfhfmkSfrlH+S2yluWBA5mSePWeXOIEMOri6wviUW0lBb
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: pDqS25m-vsPVUeU6-tRZ5mdpKhXQsHnz
X-Authority-Analysis: v=2.4 cv=eeUNubEH c=1 sm=1 tr=0 ts=6a0c3ff0 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=xYHdAnABRN2P05AV10cA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDEwNiBTYWx0ZWRfX9nH0jxpi8GMW
 8LizBZR13yClX0Kuov5u2+64LAyYA2IrLYzwpJqsW9TMOi2lajGCKP2pl9h8abeC6amXn5uz+Nd
 +KSjhGMvlCKgQpXKWXJgk3kUWMMvpaXho0AtfGHksa7X2lZ90gqvZ9DXIx5IC3NXADsuwPC0z2I
 mqqI45LTY0yudPr3EUjIWVuI1a0AS+r5IpfOY9uBEJVoFu9xbHJsgmWEVay1NANp5jDV7bOFU0u
 NBwSdSe+l3lOGBEROZ5UkLgtFQQbS6fk5OtE3OYuFGsTUv5Tki/ZQSWIq+oWdh759dknGJZFl2u
 gfNeMKbAw6qmcWdnvBVN4iOJqk7SzLURskHYZuclbvkiA38XkWm7funWcZG5X7LklmH17SfZ3Vn
 7a6TBu9Pl1P7Qd9Pv8eSO4QGKn2bMHIQASDN8QHi9379uew6KGxtim07qNe5TDZtD1v4zNkkkLv
 LuphWnm7ahUylOIrm9A==
X-Proofpoint-ORIG-GUID: pDqS25m-vsPVUeU6-tRZ5mdpKhXQsHnz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 adultscore=0 priorityscore=1501 clxscore=1015
 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190106

Instead of specifying the VBUS supply as powering on the Type-C block in
the PMIC, follow the standard schema and use vbus-supply property of the
usb-c connector itself.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/pm7250b.dtsi             | 1 -
 arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts | 2 ++
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/pm7250b.dtsi b/arch/arm64/boot/dts/qcom/pm7250b.dtsi
index 0761e6b5fd8d..43cab07126c5 100644
--- a/arch/arm64/boot/dts/qcom/pm7250b.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm7250b.dtsi
@@ -86,7 +86,6 @@ pm7250b_typec: typec@1500 {
 					  "msg-tx-discarded",
 					  "msg-rx-discarded",
 					  "fr-swap";
-			vdd-vbus-supply = <&pm7250b_vbus>;
 			status = "disabled";
 		};
 
diff --git a/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts b/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
index 3964aae47fd4..23f950067a08 100644
--- a/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
+++ b/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
@@ -953,6 +953,8 @@ connector {
 		typec-power-opmode = "default";
 		pd-disable;
 
+		vbus-supply = <&pm7250b_vbus>;
+
 		ports {
 			#address-cells = <1>;
 			#size-cells = <0>;

-- 
2.47.3

