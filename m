Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF51541C2E2
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 12:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778675694; cv=none; b=MVI1xGqb/wUHF4Zbtb94hMLCHQYnNR/SHqxurX6nC2WsjAE7PNiQLuMWAvCs1YYcnPZPiKowpiutcDG+oPEdvDGqyngRInqokTSGMXezeiE4HXIrsxkPneGXHmHTmugTxzEhT9k1FYqfaadtmsBr0FBc61WHFmOcX2QuoY8czNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778675694; c=relaxed/simple;
	bh=aebLYbRcchyj2DpGs2D0Vi4WsjillqsL9nVCS+SsX7c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eVlVM0J3OovHt0cC66O3jAYcQ2XiFEWVy38dOsTETuQfBVjqSdngehhUttJa2taoPJ3EWBKiruPxINvrXsXxaMSwgCLCRjBfXRGV3ajMrrgLM67za1egl8mJ7+S2lkrENGDks9eYPhaLCwNdKKURXcrPW+Mgk2hP61yq3wb+WIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jgToGkR1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hM/vAFv8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jgToGkR1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hM/vAFv8"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DAVqfU1393146
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 12:34:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	khQXf2QmPJPS6U1LINJFjANgUjvY0G6V+26gokibeA8=; b=jgToGkR1uxBTw7Qt
	icSee9ZfHJJYcFz71Ue9W4Odp1FgnDx/fhUR0hx9iCw86eQvaaLWJD9mi+7fHYeP
	tvxD3hIbHWUT/pJW38hJbxzmJUxVm8eKj1DI+MvZskmCe7AnC7T8nYRiMPjuUIfg
	/Sl0v2orlhuJrtrOxhjNM7rAiApHNHRvZ0w8LbuAhRifrIdLqqNtaD2cM6skX4Su
	Iy+3iRyVjjC6fKusfOY4mH1wG3psmSOP18W/ls2VBmRZCeCi4j4jl5FwqCI4Q4uL
	y06adyW9XcJUBTOUxBeXZgOaj2PJQ69j8bywCJveWS54iyIyTWNbP9DtGrgB3EWZ
	39/tkw==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4k261mqd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 12:34:52 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-95d434f3356so3452797241.0
        for <devicetree@vger.kernel.org>; Wed, 13 May 2026 05:34:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778675691; x=1779280491; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=khQXf2QmPJPS6U1LINJFjANgUjvY0G6V+26gokibeA8=;
        b=hM/vAFv8n2qZpkaMXu4B/d7TAOAs4CuiLwGlIW1wKvB1HulzeEgbv/WI905SoYdKy6
         o3rstVzs02mR6pmJGgAgddt7hoWfrYMiwI/gvNRa6hwfVjHFtnhSs40eo3HxL9ecZdrN
         TO4iics8dy0m7E4vduy84IW0zzAujb4NC138+P0EZLKr7HasG/7ZzWdtDp1TwfCsy64a
         wjmhuO/mHeQoxmCsunMpQWnUdn8zukX4J/eb5q2XjaLDd8/Qd1n33USGQTAp2uzobtng
         9GL09r2L2JAtChhtaw1p+0ABBD+1RmgEOzzeWf7lUfTm3I5zJ4RxCXoRK7u78CdTHh2+
         ioBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778675691; x=1779280491;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=khQXf2QmPJPS6U1LINJFjANgUjvY0G6V+26gokibeA8=;
        b=Y+Wk0cH6S0RZSXL1VLYrxlU9nPXAkuQqMBtmUO/EQy8O65o7RSPF9K2RaPiy3sPXRB
         m2iGbFNbrRJkPSjO6WqYQ1tL41suOxBS3O60axC+zCzPpUVO7nlTy3wT5I/FpUA/O3ej
         Q/adZ8c8DkfRstDKJsdr3UgBGwx2XsMJw8JwIKJ49CH4+BFA9yNemQ59xEsBBsR0Q8zt
         h27EJdinZOdGESHYL7jQUvznMcuUCsXvHlfj6xsQBIEx8vNw0eIvrrs8+nXIVUIg9LUy
         dofabyXqfxokVGpwYj0MML/dBi9FTfEzhQiOvuTH1fUG6KPC5bbZrkwqzr5XzrmydYWI
         Dd1A==
X-Forwarded-Encrypted: i=1; AFNElJ+jXMC9uZ1D4MvDGUpres1+fjkgHKJcmHvn3cU3IhiALkc84+pOneqKbM1O1KBx69oEg9qRObEBik05@vger.kernel.org
X-Gm-Message-State: AOJu0Yxu7jcfL4Oe+QkTeUSaPFtDgeRTJxzXVXGWRx3ueAcid3UGVmM9
	gpSV12IAv5gvi+KXFR1UXdh/kRAsfeindsks/Q0tfp2VFk9hLOVipGBcFR3AkSU+rEuOL0KNms5
	2cowipwGBcks7rrEOLdDWi7hiH4IuedWVokSRug/CqyNlukySyrJzdKI1DJPzMWPn
X-Gm-Gg: Acq92OG8geoqBRAAWB41Yd7K8ia2Ejv3VQW/Xx2H4CjWVIZwGAtw25xGKtTALisKh51
	znjxH+b7Jodahhpj9/BWDjacnUhrZ8J4KDhf0qv0yw5mydYJH/R5IJ8kVbPNKl7waVNwjoCLkis
	lv8IO2NwjGKCDDPUg2zrUdTRiaIBjR9qhga4BRcaC7YDnegjtrrDUs4Z8T021N+EHYQZ6RomQ4p
	yUA/zHTmpS/kugSg/FDquxmf0OqwpqENe+IvZielRuJW/Ak9+MJBujtxcwaqcSYJLXTHPtpQsyb
	EWw407Or4d3mGNDxOwzIRt4NSJ575AxH0YVk43xdIKYyqzEha8XPJ77SFUumJ5iEPEJ7371fbIi
	d4+nm9enkJn/LJvtqYaB9krnARN2KCuth4rnBgf5tFFyf2kYEYekCHFFix03y9dibQ4qd3F176c
	GLmyg4aDOpbxRrJyh0i/Mt9xP7k50GDbDQWJ4=
X-Received: by 2002:a05:6102:800c:b0:632:8eb6:7a1d with SMTP id ada2fe7eead31-637728c92d7mr1283540137.9.1778675691269;
        Wed, 13 May 2026 05:34:51 -0700 (PDT)
X-Received: by 2002:a05:6102:800c:b0:632:8eb6:7a1d with SMTP id ada2fe7eead31-637728c92d7mr1283527137.9.1778675690780;
        Wed, 13 May 2026 05:34:50 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a95660c1sm4132610e87.66.2026.05.13.05.34.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 05:34:49 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 13 May 2026 15:34:44 +0300
Subject: [PATCH v6 2/6] arm64: dts: qcom: sc8280xp: sort reserved memory
 regions
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-iris-sc8280xp-v6-2-0d11d90d3e26@oss.qualcomm.com>
References: <20260513-iris-sc8280xp-v6-0-0d11d90d3e26@oss.qualcomm.com>
In-Reply-To: <20260513-iris-sc8280xp-v6-0-0d11d90d3e26@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bjorn Andersson <andersson@kernel.org>,
        David Heidelberg <david@ixit.cz>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Johan Hovold <johan+linaro@kernel.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1171;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=aebLYbRcchyj2DpGs2D0Vi4WsjillqsL9nVCS+SsX7c=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqBG/lPD3Y//I4GA6DSdQKuvErsNTOjl9GPDKv3
 Np65rF8f1CJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCagRv5QAKCRCLPIo+Aiko
 1b7LCACv6OIOB5nZjGrKmvmPlr8EJIOcq1UoMTQDlJnQ9u1GQis2ECv10Nf9FeDTfttwvQtpM19
 0/f2QH4aqBjT1ugBJNpfklVkfShtMsb+DhOB9qV2QGElensVZ+W9xS8Js4badc1czOpCINnZYYt
 c+PLK7C2DaHlLCx0w45AwqpJuaNJune0/uqDOyddd04NCR9PNnqBJP9yb49XiiO2T/ZgdFHAfYt
 hzOvWkoHvDu2qYlcRqWtgInOnxH2da26Kc7z4ysyAz0AsQo5keceS7XA3SevXuZTnQq+UQ8PPLk
 aLJxIZdhTmq1jqy9YzhmTJQqknys5f+svqfeo9mm5R9oQW8y
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=M/l97Sws c=1 sm=1 tr=0 ts=6a046fec cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=dWPP9-k4-ZVWm8qm6WgA:9 a=QEXdDO2ut3YA:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDEzMSBTYWx0ZWRfX0p2Z74fYE4kW
 cDV/9yzMNSwZmMW8jyZ/79ArigaSUA/e/LdcsZZdZka2xtJYzRFKhbGIWiEd50GN+0qD54FKkxT
 5lGIjp87+Kh2Y9INd9oEzg/sCrDcriFA7u0ZRX4/Qa3tVxtCryQcHh62IzNPBfZLApe1Xfr362A
 MHSMZH+qFI4ga705OS6stXbXnrK8FyaUuDW5/tfSTBr/Q/kWVLwmfTgJ95uKfeM4cUQeFRI6kFs
 WGh/IJtq1UTgLGRpfy/w9RLai5EqkeX1lA5QKW3LE8r8LTeatWVG80AldHF+dNSN+aTuFR40WvW
 S2yOXe59hg//lGytsNxlSm4V4KeXeSQQIAHcIEMfwJyPir2nl4eSkKzPItZl5Ywv5P+ov9mc50y
 264ZHHX6m+m/DZjBOsWgth73DJ1xD8HjPou7bmasgZHM/G742GSnvqWUt73ewkFqzfB1dM6gg6/
 zHbItVovNfRgU+NV5yg==
X-Proofpoint-ORIG-GUID: o4JUdrt4V-hDjl7Wc8AmPn-xOUAIuoXC
X-Proofpoint-GUID: o4JUdrt4V-hDjl7Wc8AmPn-xOUAIuoXC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0
 spamscore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130131

Move memory region reserved for the GPU to its proper place in DT.

Fixes: 6e9612ced0c9 ("arm64: dts: qcom: sc8280xp: create common zap-shader node")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
index 761f229e8f47..b09bc6f3b518 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
@@ -692,11 +692,6 @@ reserved-region@85b00000 {
 			no-map;
 		};
 
-		pil_gpu_mem: gpu-mem@8bf00000 {
-			reg = <0 0x8bf00000 0 0x2000>;
-			no-map;
-		};
-
 		pil_adsp_mem: adsp-region@86c00000 {
 			reg = <0 0x86c00000 0 0x2000000>;
 			no-map;
@@ -712,6 +707,11 @@ pil_nsp0_mem: cdsp0-region@8a100000 {
 			no-map;
 		};
 
+		pil_gpu_mem: gpu-mem@8bf00000 {
+			reg = <0 0x8bf00000 0 0x2000>;
+			no-map;
+		};
+
 		pil_nsp1_mem: cdsp1-region@8c600000 {
 			reg = <0 0x8c600000 0 0x1e00000>;
 			no-map;

-- 
2.47.3

