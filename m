Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793200881;
	b=ssyz3BxRW9r4pBvkZILkdkljqECfhK6mez3mJeqVpMmkD4+/AH0Y/r1YY2Fozgv1xXWp
	 eK5baCekCsN2GbjnS3g23z9FxuzcPwZqIcRrbJdcuZmGIXGJ4XafJjlYrvNr8qhzlfIIG
	 QGcQre/8I0l7KwcaY8o5yQtPYawvKHsj6q/R/WVLHikywjttPX/mwUcfVcjjV7SwXxSRm
	 nlrbRL/ZAtePZ1p0tGgC2Er203SdYQa86GmhDp/EqW8Ucz6wFFLHeGyqHI5L92h3vnj8x
	 YI9SRXhlQ/Qhjnb1A4IWYFJDWFZrXoD36llGFhWzUsgBj29QM7Y5lcz6Cnw4CXtEztQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793200881;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=+GbF0SHSxnQUeknZ/fZb5yRBXRMQ+BnBpWKpFMjS6XU=;
	b=CZ4f3bbCfeSxrqNSb1cFHL88EPamLA6BHD+iOqtYl2iqJTdf6dqiM3wkH+F71LAJ1G4G
	 LjFzU1JMi6gbaZrQ8XT2k7dKMttls4zVO91Dc2o4QemgYSLOJVTl6R4tyzdxFahZbvMpH
	 f0Ts6XUWtD0wcUDpSdH1Fuc529RbOfP5oLcqicbAkXc4jfuyzw9ylLS+5DVkOdOUyhh1m
	 ImmARRworMfeV36oK6BSqg5e8oBotdbNzXREwrCXKnSCLGtzulIeHGR55UaD8hr9ZDEbH
	 5jvVpvOSwc8IsmBrdRNk3N+sUH9cB0ZmrSQibZBrjDosVnCMeRMII7YWoa8dyCWg+Xg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KRYNh0yF;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cxHkwG2l;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCD5860A380B
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 15:21:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CCD5860A380B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KRYNh0yF;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cxHkwG2l
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SFAWK31153177
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 15:21:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+GbF0SHSxnQUeknZ/fZb5yRBXRMQ+BnBpWKpFMjS6XU=; b=KRYNh0yFFoU0mT4v
	4JaShUVeJibTvkNfb1NC3dTHo86I8hUZD6Cl+hl9C+3prZiaQzptS3YxxtjFSGU9
	DesKvPo4MXAN2DPWY1zPzjfYu8LYhpuHFnRf9WiXUV7zbhjY0VZCbX2PL+6cs2GK
	yLKD5xo2KFMmMIncqfpgazcS5N7jnpHoo3Y6KupZQl/n2axKtF6icblpRdBib6Cw
	WSkPFJkUTB1LaLIPOQ24U5vzZQYNm7MidcJd4WWA6G6LF3/N5PU4ppR5EucnEFGV
	J/yIAmT6NSPbUbJOm/kIToX5bWujlEAVLq+gmFhGuFxVmkY+MWNX/IErOg1JqQK0
	ly7Rsw==
Received: from mail-yx1-f69.google.com (mail-yx1-f69.google.com [74.125.224.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hk6be34qr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 15:21:19 +0000 (GMT)
Received: by mail-yx1-f69.google.com with SMTP id 956f58d0204a3-6755fef4f96so1755334d50.0
        for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 08:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793200879; x=1793805679; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+GbF0SHSxnQUeknZ/fZb5yRBXRMQ+BnBpWKpFMjS6XU=;
        b=cxHkwG2lZicuu4/8H5A4beML2GaDcNHU59vcYlrMeslz/Ys8xdhYh1l+tBIedY2PmJ
         aq5zBwGI7/YQByt718MJIAKGDWuqaxYXBbQUgc+0L2H6u5sAwTZiDIuyWZkHFwB/9JsQ
         7xVyHo0MxYAiXSg0EIOAo0F8dYcW4nz18BaT9EV8O77+hJSkKfkvWVMzRPqBcSkN95FV
         cw8GYSqYH9pr4HU89VUun3ZKbfQeacto1WO3k2jNxpDhXzmVl3NxshaHWGyz476j3kb3
         V1VJF0RI2rxSMnD/Dt2ToULs0MYe0W4kH5kGIZdY9TD2QAUaw+/Q2YFNoawilyxFpF70
         PVSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793200879; x=1793805679;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+GbF0SHSxnQUeknZ/fZb5yRBXRMQ+BnBpWKpFMjS6XU=;
        b=bzRUwz5MeY5s9uErpX2j3Fb/3KJX2I8GRlogHJZYVmAMLVN43uZD6SIEhNR1aUgjtw
         TDkS5NkskbBa+5lklqiWVcB7LILT22qPD9ctFszhlpHMyByrp7+lJKFEBZn8SNv/SV58
         +/Z4N5tpG6nAjIViIsHvtCQFpKPafjAKFT7HnP6w1mT2kPicCdtgy2RW7RZJPx6xhSsX
         C1v/kGcIDHimc0yO5dhbHZMs7ul6k6l+/8zVMPDkbCkmb6+365ZAGNTNu8dpI0ruaEHH
         dZKlQwhHDkLqYq4BOnMA/Q1+7iPjpVGFBDWug6MMfqD73Rt3WVCch1D39irtlo7lX+2T
         0lyQ==
X-Forwarded-Encrypted: i=1; AKwUvBw156i34EaI+YuS2si4pbXYIWGoOihX6L8NWpUaKqus1FyzMpKc0VZp1LN5pcYGG4tB1rxXMCWoB5u3@vger.kernel.org
X-Gm-Message-State: AFq9FYLSawwp1il1FISyEej2ZuRGgfeCL58cbL2wbDokSJFM2JqV7EJV
	DktRSthvcbF6gdmHRSLSuhrVhh8CVttnAtbwJhjN7GweEfdDRaH9/vvE+QgGBHXoDWcSFg1saZ/
	IBu07uLujy444FomlCrYguxvAycmXUmtfWBXbmpmRae15PpsLWjl9/tn0CJxuFGvF
X-Gm-Gg: AYBFou20v0AjzCfuPLReRwl00B/lAJ86dLMBeelRS8haMPc6heCIJS/uYWM8qiBCtBj
	fczkorLQYy+SJ3bUHI1yJm8hBlJBErEryTECSJps1I1Kqe/rmgggzNTM5vtSKgPZp9rBvRwBpSQ
	iyA67wB54RrwDZRWtrWPlFneFBCOmRgEMGzvSKFwDWBRrKNIUEmh61NdL/whSwI/tiA1czVaqJX
	wX4oUwgH4KDtGpIWaT6LjdAQXs5Qnsyw1bgNNS4XMSegf3DPubrIm8LLU1C2wmqvdHeX0A/jcx5
	hvPXAflBJzZMr5pg2gOxt+c1MGr2gI0xpgK51ueiAiU24vX23S6tp24wo8U0LRPPv/OxVDwiy+f
	aFd5lSRxXZe2t4AoU+Ak7qaB9k86qQA8opk+lf2UbuJWHySDKya0iuHlTdllzqEBBifVlTytOOU
	cILw1WjEpEkL7P7cdt2Vl0iNFh7UUF0SKrCKfHfYyFAzTKoFIVkVDQFY1vqXYJ
X-Received: by 2002:a53:d20e:0:b0:679:cc49:55c4 with SMTP id 956f58d0204a3-67a7bcf7ca5mr1298188d50.78.1793200878619;
        Wed, 28 Oct 2026 08:21:18 -0700 (PDT)
X-Received: by 2002:a53:d20e:0:b0:679:cc49:55c4 with SMTP id 956f58d0204a3-67a7bcf7ca5mr1298159d50.78.1793200878048;
        Wed, 28 Oct 2026 08:21:18 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67a803cdd1asm1107541d50.4.2026.10.28.08.21.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 08:21:17 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 08:20:41 -0700
Subject: [PATCH v23 07/15] media: qcom: camss: Add PM clock definitions for
 Kaanapali
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
Message-Id: <20261028-kaanapali-camss-v23-7-95f250b18612@oss.qualcomm.com>
References: <20261028-kaanapali-camss-v23-0-95f250b18612@oss.qualcomm.com>
In-Reply-To: <20261028-kaanapali-camss-v23-0-95f250b18612@oss.qualcomm.com>
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
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
X-Mailer: b4 0.16.1-dev-17221
X-Proofpoint-ORIG-GUID: cL9qU0RAY5rER51w-40AhCiJaKGJ-nAq
X-Authority-Analysis: v=2.4 cv=HeuB3SE8 c=1 sm=1 tr=0 ts=6ae212ef cx=c_pps
 a=J+5FMm3BkXb42VdG8aMU9w==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=jNWLojqFtH_lE__qK8UA:9 a=QEXdDO2ut3YA:10
 a=Epx66wHExT0cjJnnR-oj:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA2MSBTYWx0ZWRfX/lJ4tbjzwkN4
 F1RFCVlm5+iobPVmCMUcJHLyb/YB0Wihs8t9TSqFn1PkSiW5dwHYrmWEQUZc8qPcnEq0adzh8KU
 VromZzf7FZ600leO2+ReASyNLuatWGI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA2MSBTYWx0ZWRfX1xUeJEuKAuz6
 ILSyE7B25aemB4+iMj9dqQW5qtkIs0PN8B2Fzr6IcXUG4UPbSlR2VQCbtcSQR9Hnpz2Ay8eJlxW
 +KFzFcfbk3nuRMImquW9W+2fZoWt5ytPnCr4hOwrujH0JOCgaK1eDgErKgYJ/wxEpCK+odFvlyR
 uzhv1mCp5ImhQJYh+S91QCPgMXZh6zIrVmNas4xmZ26kO/Xl8NlyVkxwYfhqddsLH7haVBdGAim
 TOr03K4GbFF9jLMajC8hmznPQ+a0gqECCgaRZ1l4yT1L0ahG0AeL6VjB9RfZwFdl+YpGYh3L54i
 JTjYuzlsEbSM4tY379KS6eu5AlxUa2RYOHoi5LktOWKyRaSLnZ6loNG3W6CYjkeebO6OaB2eCXL
 Uymta8hA9eI+7miYgLWY1GavHN2PrBWZDYRqYxtw9LMpJ8u2U1+SijNvIu41ZdzindLN64rKHXp
 QmzvXPtWAQ2z6Stjj3g==
X-Proofpoint-GUID: cL9qU0RAY5rER51w-40AhCiJaKGJ-nAq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610280061

The CPAS AHB and AXI clocks are shared by every Kaanapali TFE and IFE
sub-block. Register them as PM clocks so the PM clock framework enables
them once when CAMSS resumes, instead of each sub-block listing them and
taking its own reference.

Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 98ec23c39fda..a64242c66cf0 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -5606,6 +5606,7 @@ static void camss_remove(struct platform_device *pdev)
 static const struct camss_resources kaanapali_resources = {
 	.version = CAMSS_KAANAPALI,
 	.pd_name = "top",
+	.pm_clks = { "cpas_fast_ahb", "cpas_ahb", "gcc_axi_hf" },
 	.icc_res = icc_res_kaanapali,
 	.icc_path_num = ARRAY_SIZE(icc_res_kaanapali),
 };

-- 
2.34.1

