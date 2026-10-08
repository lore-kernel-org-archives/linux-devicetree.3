Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E15C44160C
	for <devicetree@vger.kernel.org>; Thu,  8 Oct 2026 21:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791493667; cv=none; b=FPFOkDUImEhBQfIE/qt/GLYzQ6rDthh+Gxyfo8+zbRjBNvPjPGkXi9bPATipRncjqm5zYTEKdWBaGYXKFvCFiHA55m25v+8lTJj9IaJZWh1yg0PtmZLbPVeHXbco0NfgKDworCD5n/z99+XcQIEE6kLz6wJmPubobMihuevODOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791493667; c=relaxed/simple;
	bh=jDPKHpf4eEeWEyqyeomjCQ3Gv77cUfB3xMNeq2DZgQw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CE5GCXo4H5DtFcyEm638+/VLRaWFqq3gq+uAGIoWCCZX9h6jHK9VoLkPIzaDm5T3q0Ejc3U1fUTMHf0/uS6kRANinTCepZd+msn2VIyRFbkhCitc6jZiZdrdDc7GIJny3p8+2817cHUYGfHdqXFNtk4avdwEpquad5PNTknkVBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QXY+wF/D; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f2eHfhDa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QXY+wF/D";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f2eHfhDa"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 698L09f82976886
	for <devicetree@vger.kernel.org>; Thu, 8 Oct 2026 21:07:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wWdjJJ/kiHobdaG6v+Jdrtw5OgD5o7Fqn+e268oN0wk=; b=QXY+wF/DDCNivfYD
	7mPAz9rH+3cWljzvOTvOCUKhgTYqCSzp3ieZe5YNw+86ZpkknXSaOGmYytPGWDKy
	vjzsAtDcDQYvfhVG9Y+wkAN7E0qdMkRGK35DRMOrnozawzwmH7ymnua7MnkS/RbL
	RfkerHBVPTOfC6r24ZmcJq7XiUsI8qNzLBjct4A+brSG3z8wCNyBaPbsNnKNVDTv
	zagUcc/K5c6OnbODN/4aCN7FsH9mAzdpjYUZUhnBcRUe2P2aoxduafcIUrWULHaN
	1X8TIDXKw0gcYc0zvZbaUkk4/V0J0lpV3RxWRBh/28LIceCgnQh40fDgjYKzzhoK
	aKexIQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6fxu0n0j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 08 Oct 2026 21:07:45 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-313d1015161so16338009eec.1
        for <devicetree@vger.kernel.org>; Thu, 08 Oct 2026 14:07:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791493664; x=1792098464; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wWdjJJ/kiHobdaG6v+Jdrtw5OgD5o7Fqn+e268oN0wk=;
        b=f2eHfhDad9dJWetfQPdlwqd4OFfDFUsyg0EsJb+2zWkdu02T+kEyRmcSU/oqBiGSuC
         E5d2JAg7z1HqkKhOPP142xxEho4T2rwfwt3AJffPQeTf0alydBb1Blb9MKpqqO952xyO
         GRNrobfl3qBIqndqIM6qNeT+KWFZndgf/Zk83citE03szbkdyfzdJQBKZy2bvrsoV3od
         O/ljqYmpllZfq6PV4nIcJzEzlR+LfrEOSEuQABpDcMv4DGhw1/Rx0KigqoB9tKcs3b07
         QFzLU3U8+zucNSbPqzQaMHVHNVunrSaK0eivk7ceGvXalcBxzecILVnnzSFGpd8YdZWF
         L4qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791493664; x=1792098464;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wWdjJJ/kiHobdaG6v+Jdrtw5OgD5o7Fqn+e268oN0wk=;
        b=a4z+SfeQKtgMZ8gKHC30IZv+9+Z36URO9qGMLgP3k/BMoz7ZBRmIVlIuTzFrIAOplM
         Qyy9DtZDdGfF3EjT4Afr8YOyBURkB5eGbbHdmppe1/rhdZZkzNSNmO425nzyJv4XTbr7
         5iNSI72PZgB83P3HsdAxGtazRj+pvUT5xpgynHjGJpSkWmir+1t4USrSdIWUOVm3bZfg
         DOfCNF1uWC2smf3cM/QU5FRR1EEEP4N2ssLfSVd4LPIuAN6CQuBTUF71mzkf5/vyp4dX
         6s/cWIqLSTbCzHu9GAGHPBilGy8+arOChowM4fN6m1eiclTdknES9o8g55VacGukZNeP
         0f8g==
X-Forwarded-Encrypted: i=1; AKwUvBx86iajIRMbz1o0phKiw9harsLF1ZN/q7oa4kqOsFsHcAzqrjPOX0sYBP0TVxw9qck/i4QIfNVto1B1@vger.kernel.org
X-Gm-Message-State: AFq9FYLsFzQOQdMRR+Kb+0cUqTUOuP3ARNR3B19+B4XWNY5uvLebcU6z
	Z2mHaZajMmnILNq7xq8Ug4PH3HaEsEpoSMCnA/RymE1l3E1/UlUtC28ptcQ29V5RDgth+opbKf/
	Hni/WrzZyWjVyWkOPExvaMvbDW50myTMcp3k1boQm2XOKKfm/QfKCYa0X7NuvKito
X-Gm-Gg: AYBFou2HXnHQy+IX2lhdUakpYtHfbW4FZiwBOS3oIyOsR/LPNOOD5V8m1U07bJpxJ4f
	OqGYwFM9PCMcQ7sRxCwuitNjCoGoKXmtXV1peJjhyl2xRcZVRj2TCFFS1m2DEshIh/bEToOwxJ4
	zd3ztAbZQW0jaDYgQWfe9lh30p7mKuvjO+BuSPNWq8A9bXij5EHjrsClrfchOA7ERmQBS2xBep1
	84DxPBC0mi5AUzogxlH9jc8bSMA5Ya2Qx5IREvh8Z/taKfHwY3pCjU1KnJ8oEsJA40Zw7MsYk4L
	GWuiRXqO6kmKSVWb8/xyEPaLraEQkaVDe1BK3qE3VU01muNrJjelneVq/0iDeSPpoaJ2cd3bOA8
	x1ZTvxxzwVlAGXSwNeX4M4uo=
X-Received: by 2002:a05:7301:460f:b0:34c:bc38:e2ee with SMTP id 5a478bee46e88-3537e01ea2amr102940eec.8.1791493663745;
        Thu, 08 Oct 2026 14:07:43 -0700 (PDT)
X-Received: by 2002:a05:7301:460f:b0:34c:bc38:e2ee with SMTP id 5a478bee46e88-3537e01ea2amr102908eec.8.1791493663192;
        Thu, 08 Oct 2026 14:07:43 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537cab27d5sm634773eec.17.2026.10.08.14.07.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 14:07:42 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Fri, 09 Oct 2026 02:36:39 +0530
Subject: [PATCH 5/5] arm64: dts: qcom: nord-rrd: Enable Adreno 753 GPU
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261009-nord-gpu1-v1-5-a06a6c57bde7@oss.qualcomm.com>
References: <20261009-nord-gpu1-v1-0-a06a6c57bde7@oss.qualcomm.com>
In-Reply-To: <20261009-nord-gpu1-v1-0-a06a6c57bde7@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Shivam Rawat <shivrawa@qti.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791493618; l=768;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=hOU8TrSd+zHm12j8RPbYrqhepq7ttnj/qRjqmRqUawk=;
 b=IevTAqvF/aAxKWWdXsBJ9C5sJVLEsZZLhXmZdLDXZsg5/UNdxJ1OAbXaq4Jld07pbnowfhYTL
 r0WNdB3ClwACaFIZxqTMlRTcmzFFM959U6yZaFkW97FD7iLo70fks0U
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA4NCBTYWx0ZWRfX7geiP4A/GMjs
 qjA+ViT8KRdWHzsAxsegceWbvTBDxXDrqBotM5Z+h92Mv49zWzlIaMi2pw0FGgo3QCP1yAc47Tu
 b1O+faYA0z/ERRS7Y959Tr1AiGXcDLYVrJJ4HrrfEocWorR1Ah5Ka57FWOObbZG5/jMM5STPL0b
 qx1qZ90+133qvwde2+5tM4ouWp7ZF0AOQF+RIXHLBVitbwF4j2RvdpkrL1WEGUw7K5MgFLL2RPV
 NX0sw+hboa39DqXeFzPAuol2RJ2RIb3WmSDATXhonsKSmG11F53LnYb+gR1I9PW+xDRf3MjCiPu
 u4uE/etGwZyBm4EiBVsR0jEnk8MgRvh+smxqh+JdtBB3Sw9l19BVVJ2lVuIo9AwnVSsuinulQUw
 8qvGXMfOYpq77LuL9UutQm499C++8z5/iJEyTFiId8xzYYL/nvnc5hyaE4eZv+IogensshTR/yR
 7YA/RWgjzGn7Y/hhvPQ==
X-Authority-Analysis: v=2.4 cv=QbjzLcbv c=1 sm=1 tr=0 ts=6ac80621 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=Xl3f10jGzgz6Ja07nhwA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: U2VYhhyWVHUN_NHJtnP_MVTNO7A3SdEQ
X-Proofpoint-ORIG-GUID: U2VYhhyWVHUN_NHJtnP_MVTNO7A3SdEQ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA4NCBTYWx0ZWRfXzqZGaMZuvGsP
 VXnroAC3LR7/N47RJrwLkFu4/822LxSU3bOXPf38m/iq7y2Se3UyMZTEo4Hch6m+HRWerrI69RD
 YKFm81IcofUR9mGX30KoVOcgTikuo58=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_07,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 bulkscore=0 phishscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080084

From: Shivam Rawat <shivrawa@qti.qualcomm.com>

Enable the Adreno 753 GPU on the Nord RRD board and provide the
firmware path for its zap shader.

Signed-off-by: Shivam Rawat <shivrawa@qti.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord-rrd.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord-rrd.dts b/arch/arm64/boot/dts/qcom/nord-rrd.dts
index 3673003c8b21..8f215bd04fff 100644
--- a/arch/arm64/boot/dts/qcom/nord-rrd.dts
+++ b/arch/arm64/boot/dts/qcom/nord-rrd.dts
@@ -364,6 +364,14 @@ vreg_l3l_1p8: ldo3 {
 	};
 };
 
+&gpu_0 {
+	status = "okay";
+};
+
+&gpu_0_zap_shader {
+	firmware-name = "qcom/nord/gen71300_zap.mbn";
+};
+
 &i2c7 {
 	clock-frequency = <400000>;
 

-- 
2.55.0

