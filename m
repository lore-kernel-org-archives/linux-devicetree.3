Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AAFD41A4E4
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 06:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790661671; cv=none; b=Qb2yrsId0AMmoIBlA6f+ySKY0pkTlWLRxffU/FV6aFmDYKmfBGzpz1ZkhMuso6zs3CrugYVy3LVOpqQ4tcTPz4v1ucDWGQpvRQGfToQVkQ8DPb3XeQzgbsVOTyMp8u4mTBbs6Md9u+YO4ERv5wvBs/D/POWakvVIgXV40vEsk1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790661671; c=relaxed/simple;
	bh=TQMoOx7LRStcYqRtPZiksVgN+aWBh0cBp7N3YqiOc5o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=M3ToLZMTAZiDeB9FLSD6yri/jNITJTSEiYqFkm0aE5E7tMMj0K7w8lON7hVi9bqOh3aOv7pzPAnwkzsJEjt0mXGI6MJGNseVhBfUIO+vvLmSpziAlKw3wSSqYMWR1Rt00F/OH306/tuleOQ2tkH6Z0ghTyERopTeHJIFb1rT3dY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BZyN1g4X; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JuDJhbK3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BZyN1g4X";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JuDJhbK3"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68T472gD2686036
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 06:01:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zDVxaWUQExbSZqDtvncCwvGw4iki0k/Nc32cFQcnXL4=; b=BZyN1g4XsICfxyih
	uYTeck0yaRPyEtV0IWWnDvVLuU72IEneoz+wIo1JAVdAFeems1l203RfCXSFfSys
	MDB+Gv3Os1hUf/in4OG0Mv1d3rO+0xAi8eAxtUIILlHpp+E894E6qKGRWefhcKIT
	UBdq2Ufje9/QApEFxAwUMRh/iFGRlsSH+3A1TnYOrHkBvq4iCxc3gAun/E7vJGGv
	0qQgDzIzlc1pQtCMvnEL8B0wYaUAjvcFrL1EtnCtaNKUN03CZaQDB54YS8xP8qGP
	6WtXOaL1Z/rhsgwem61Wmngiyq5P4kdkFL4SYDr2SQUqJxN3Z522P1gTWZqBZr/d
	v6UpWw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h02mjh28a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 06:01:07 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-39af92138f9so875527a91.0
        for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 23:01:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790661666; x=1791266466; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zDVxaWUQExbSZqDtvncCwvGw4iki0k/Nc32cFQcnXL4=;
        b=JuDJhbK3ZBmmsynbnVvAEgca2r1w0JMDltO2+ICk5ShOJTo94sujffLte4A4TtHXta
         lbQ7AY57OpBrcc4jPYSjSMYODRKtSd6LlQ5FuY0wwnT2hZJxmYdVmXUN5JZVrqZjwUXV
         GdIt8mdWbax90U+MKn8JSrSzmHDiKKVhquqkUAdkORtdUwj98B+goO8o41Yr1VEg+AVI
         mKYgQFfl6Qjs+vGPbSWqD2uyINlSUCKte6X0jR+xHr9dxnz5lT4tZsn9UGGYV9eWhIja
         PDKzC+a9vRXNLGvRDXKtoTyEOcoZS8aHhyqgs6TpeVRD0bJNx6jqW14O4D4QCCTbz3UI
         LYtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790661666; x=1791266466;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zDVxaWUQExbSZqDtvncCwvGw4iki0k/Nc32cFQcnXL4=;
        b=ZUN3LQ2THquv9Xxh3MM7MCYrS65RvslGeW8gM3kHoh8CpAQd+HBOa0s8j+G4IYzQIh
         plKx82PoaoxJmuBCelNqmH1+mhprp4T4lLBXlcTYqaszGJaeCQQeZCSsk00DezgS0f94
         kiiKIMMG5cYhwuxqsivck9+zcaiwSvc1d7vNfjZ4QnDIsf1ZMVPgDPmKMwSAamlpFoyG
         86xRG0ZL+4MYVvnzsOMLc5DQF1iHt9yi1sEtfjZJ0Rk8qiHWBMxmJzkeMckv1V9GckX4
         44XjlL7zbDqTwsXga4ZT5uncygpzAgPFazJz8bUAj669ZX8S7/RokvpTXNgxiupYtBHf
         E89g==
X-Forwarded-Encrypted: i=1; AKwUvBz/pUxpM/KKveAqWO574ZrQlQKzRfoiwekfwHBPP97VIntyByBS8PBlh3yyupZl+usIg9vzl6L/rYnj@vger.kernel.org
X-Gm-Message-State: AFq9FYKlp9lecu0x72L4QoElnAoPXF5RgspQKnvdkipmNHidzZtC9aHn
	paah8ZOSXQQLBP80fkXnmGyKaxK7siqgMhOIFKSykuLKPw6W1t5xIZv5JewUWG41quWseew1F57
	yOzOzJnLpXFamI6MmYJYX7R/qqtn7toagfQxmEFGF1TXNdhvfGotUHFcZfrxVDGrE
X-Gm-Gg: AYBFou1KDVRDFg0KDg66o10ZtIRndRaJwwzdew15Ai/WcLKVbfBLWjmzIp3mlyWjQsR
	Tnqx97WR8cXJqF4oI7SWFlt0t5c0frvyNchdxUmSowOim7xD1g8pjLMSZLRw/2c4Pf0b2f8v33D
	Q3ez8H076D2sj4O/4e/FjiIdkSH1NBfjMTI+0X5/dcwpNcMCw4WoaTkW/x0KLMnzO4O8rPx7wFR
	lK8mhLrMQitEYOAVsftcKi5m/HDm8NnCYic4OzJ4WLPU4Qb4auo49L7QI+K9qBauIGZsJ5z8kqi
	52TVGSH2n5pxw8YPr1gSQPo40SalnGlpgljD7gcROF4iD2DsMDuWlU9tOJ9VIo0E+mApRVDOTi3
	7JPC48tv/6miMZlw0fsFf2MzlH3w7emyhI9d9HgvkR6kGc1itxzYK2dTzun1vfrHS2tmA9hjHCM
	YCsXRgaQteaA==
X-Received: by 2002:a17:90b:4fc8:b0:3a0:c85a:ee12 with SMTP id 98e67ed59e1d1-3a49c1e7becmr794587a91.41.1790661663768;
        Mon, 28 Sep 2026 23:01:03 -0700 (PDT)
X-Received: by 2002:a17:90b:4fc8:b0:3a0:c85a:ee12 with SMTP id 98e67ed59e1d1-3a49c1e7becmr794415a91.41.1790661660279;
        Mon, 28 Sep 2026 23:01:00 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4985ff0f2sm3383588a91.8.2026.09.28.23.00.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 23:00:59 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 23:00:37 -0700
Subject: [PATCH v17 11/11] arm64: dts: qcom: kaanapali: Add camera MCLK
 pinctrl
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260928-kaanapali-camss-v17-11-dcf3fd37f76c@oss.qualcomm.com>
References: <20260928-kaanapali-camss-v17-0-dcf3fd37f76c@oss.qualcomm.com>
In-Reply-To: <20260928-kaanapali-camss-v17-0-dcf3fd37f76c@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDAyMyBTYWx0ZWRfX65AHEqnOdk1o
 57e0UCWOtXj2kuxsY0zsmseLCiio/Z5YlrYSdE9j3T78yZIdJs8UOIPiAyl/1/HQcvsT++EjI5c
 9zT0VSJU0ZX2X76cUc9YFpeov5Y083+ZDs0imL86740i2uFJI9VwkytToAAK2rt5XbCqHC98sg5
 EKqBHghuIpLvxCzxhNK7zGRAliRmIjRud01JX29cCiJvSs9xoJE4Ef9VqxdHWl0dQqmTj8WshBq
 i6yPNIor9SZlHiyPvcE2JMEaBBhX+0LKFz2a6kZO+emaanDkTYa2j4fFLMDWTgSXpKcKPtYgPMV
 XwDrN2erv5L7fEbABZQpWbDN2N8vL5QnPNOU0YdwdVmg0mIvoZWdzMqM/mu4HZq9cNAVzp2k6cd
 8LE10k6HqOHI1DIyzDNmW2i4EZUWTXWi3uQDfgwraDMRNnIb6wrLDLZP+K4JwJbL6tH73hOY/bZ
 BpACsagVmkDObRUYo4A==
X-Authority-Analysis: v=2.4 cv=OdgNnRTY c=1 sm=1 tr=0 ts=6abb5423 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=4Dwyees-64n8yO_2jeYA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDAyMyBTYWx0ZWRfX0w2bqWQ6uR5Z
 aU3gBV9EfpGmFayKZZZHY7xwjZAIpwNwAivEEsseCdAPvopsG7U+4hLDTy6VrCVc2xRwvvtGWi4
 C5KBDpK47frGQlxLS+h1JHwahyuCX94=
X-Proofpoint-ORIG-GUID: ELBCIJX0FjBurTfS2G2StD__MH432Tj8
X-Proofpoint-GUID: ELBCIJX0FjBurTfS2G2StD__MH432Tj8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 priorityscore=1501 adultscore=0 spamscore=0
 impostorscore=0 suspectscore=0 malwarescore=0 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290023

Add TLMM pinctrl states for the camera master clock GPIOs on Kaanapali so
camera sensor nodes can select the proper MCLK pin functions when enabled.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 56 +++++++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index c19945bc438e..bbcd5a622f0b 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -4568,6 +4568,62 @@ tlmm: pinctrl@f100000 {
 			#interrupt-cells = <2>;
 			wakeup-parent = <&pdc>;
 
+			cam_mclk0_default: cam-mclk0-default-state {
+				pins = "gpio89";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk1_default: cam-mclk1-default-state {
+				pins = "gpio90";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk2_default: cam-mclk2-default-state {
+				pins = "gpio91";
+				function = "cam_asc_mclk2";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk3_default: cam_mclk3-default-state {
+				pins = "gpio92";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk4_default: cam_mclk4-default-state {
+				pins = "gpio93";
+				function = "cam_asc_mclk4";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk5_default: cam_mclk5-default-state {
+				pins = "gpio94";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk6_default: cam_mclk6-default-state {
+				pins = "gpio95";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk7_default: cam_mclk7-default-state {
+				pins = "gpio96";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
 			cci0_i2c0_default: cci0-i2c0-default-state {
 				scl-pins {
 					pins = "gpio110";

-- 
2.34.1

