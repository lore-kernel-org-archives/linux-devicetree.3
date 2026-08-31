Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B503E24293C
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 09:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788167510; cv=none; b=oRpwEhP0wZqsjdOr93oknqqdeccN7ZBYlj/oHrH2RtL3Zw0Ea/8BCLG5czPOvLZWKUzEA8yS0k5NkNAVPVvIOtY2ReJ2sfhY7MBnXynMNmCYF33D4c1d+L6aCSQpnb+YH/edoPvtkf5pcm4ZjN8PMXcXgN9E8nq+mLpW236nnew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788167510; c=relaxed/simple;
	bh=o+jYyzlg8w6Vj1pZlgtY5tR/vJJUA5BKv5OoEtt35DY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ELzRsikDRt7zqd0HdiAyaNIzGnM8r0s8D6YaGsi+dySkt+jMI4073DUVn+ASb+k5V5enSBCEUSwREyBFNgdFnmYvKziWwwFelQbcRiEnJzB+nz5YesE12TM6BQUZ57aMYUlzQcjddedcyjH0Kn22odK8LsBL84y2LD4pTihfoVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gY1NWNzq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EDsvsoIm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gY1NWNzq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EDsvsoIm"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V8vifA3302690
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 09:11:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=pTFxysWPYnAyH9B0lSkLtR
	KDIKix6AuMwIdf5deV7ZI=; b=gY1NWNzqL+GeA0qKbfIUvyzIRyY0fN/8rmuZrU
	5R3JL/ViNtMLTw/xNx1beOO6cE6IZqY6Kq2cHxhmwNSuAegWkaFvqO5aPKp0eDRl
	trAss62XMZUu4u5P+T3YZlXdINFH8l0+dw1eGu2rCQMwIzLByy8U6lMdt1304F/7
	yiJdZ3djja+4u1HGgoYXhIV59CVAJAjaRVI9C3v9xW03dTlben/ASXcb+CtUfcOL
	CoVm0nm+HSsYg+2kZI0pQLmo9QdBWf/MBs/LlHgRA80S0zDscbCQFJfkencw5sCt
	WFYKVlQ3ETfAKH+/HQYcYuVZqROIBpuX/GYumpmA8pnfDAtw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gd6jgg1v9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 09:11:46 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e5fc4c7e9so284054185a.3
        for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 02:11:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788167506; x=1788772306; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=pTFxysWPYnAyH9B0lSkLtRKDIKix6AuMwIdf5deV7ZI=;
        b=EDsvsoImf4zXthwhbsd7Hl1I+oN4J5XzupvslnoEE4X3Bkux8goH1kDF95UlZSm9co
         D/urhY8fWj7XthFeg9JagO0NdrDPY8Mm/dyGPU5Z75DsX0G1F5s3zI2CdgSmg4bQhDdP
         Q3DisL/taGbVzRC/xP2HwdGAc5QTsWJtF/fttd4ZPipgXUbgWf3BbOxaECNlsWTMaCwE
         HtqYysc9Cg3n0whw7ySIS3VdTTZvUjFKM6jfY/eejS11IUFDU15LAKtgPmMpD7CzF35k
         PIXWhiPCSRTisVrZWNlzq03gc/L5JlHGt+RfppxGwgOnuZULwbPG+1Jsp1kqmmobjBh2
         lG4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788167506; x=1788772306;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=pTFxysWPYnAyH9B0lSkLtRKDIKix6AuMwIdf5deV7ZI=;
        b=I0hrFGSRTDLrXo9H8hJHYqFRx2IY/RsWG+kyGqFz+nJDNLUrylKysH6HErkDJhwplz
         9YOfgft7nyU/9fnRy4etg2OeZOEpZCKtUEn4tXX6aKGIMmboa5YAAvkP4YaJcgEEGvOD
         gJGbqAKPKOptjLQAU9PLZcOj8jVB2zc1UIZMTZD795uhRDoURgbrVB+upM6dTwBf0SJg
         ZwA+IGyxL3SYlQrqr11ykMmDqpRdOnJcl5i2RIARkfRt6O8lClaPuVZIaTpZA9JUIPa9
         WxrrhKbuWQjKTbXdNUuHgkGebTbGG34NrllH7BR722D7tFmxn5HbU2rXM1KanFfbZ8Q0
         TUmA==
X-Forwarded-Encrypted: i=1; AHgh+RqJTylRTb+YAxfDJffnDLecShHCTEVxW+ti3aobAVZlDaQb8t43t2xvrmi/TFlu4DMdOoWO8jbpbnMj@vger.kernel.org
X-Gm-Message-State: AFuF++n4+XyNeEqrj6iKXEMNH6Ce/WTTxclyfprzIktOfVeNDdTD4tDj
	Md8ldTQYvaRfMLdg7cYAcNxD95wucKNbaknG+HbAGd0+OSmdSrMRy9T2I8UV7S8/FJzWG5QlP9h
	9PSacrytlpR15xAGtEPs6eYJhEYyVbJdrQoGZQ5RG1+XwPvSSgb4/T+MtpsG+mZrF
X-Gm-Gg: AR+sD12bwM97SnafvYckPVKfPVLW84qApSjf3HLI55scs6smOmEHt05UqtcWcYd84Bt
	KDOd5+adIhazeGTyP+sTN90uzIAbN4mDoEF7pS/R5vvzNvAQlo/shyo/H/FUgiKPEyOY0ioSCmE
	8kQ6jUTsjiSlrAhdP/wrDu/vtkzD8qVqeVjM2MHigXrpibdSVwPW6j2UUzzgVqv4KCAyRkoj2xr
	Pwb9RcMLEJZ8P2iGuNzoo/wQ0MuX4afvDNS36FotuQ8aPGd9tPb7U65S8Whcte+oiJdY0NEwXv1
	soXbVj34PqGtNjlVY/nq8f4/Eu6Jt65IpDi/MRTl6NzNCqoOeYg20LnvH96KoWl99OA48cwcPtP
	R/1QXpw==
X-Received: by 2002:a05:620a:8298:b0:92e:fd2c:6a26 with SMTP id af79cd13be357-939138ae185mr1964028185a.24.1788167505671;
        Mon, 31 Aug 2026 02:11:45 -0700 (PDT)
X-Received: by 2002:a05:620a:8298:b0:92e:fd2c:6a26 with SMTP id af79cd13be357-939138ae185mr1964022385a.24.1788167504967;
        Mon, 31 Aug 2026 02:11:44 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.13])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48436646548sm10430394f8f.37.2026.08.31.02.11.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 02:11:44 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 31 Aug 2026 12:11:36 +0300
Subject: [PATCH] arm64: dts: qcom: glymur-crd: Mark the EC reset gpio as
 reserved
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-dts-qcom-glymur-crd-reserve-ec-reset-gpio-v1-1-4a9da88755d4@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAEdFlWoC/yWNQQ6CMBAAv0L27CYUSVG/YjzIdq1rhMK2EAnh7
 1a8zVxmVoiswhEuxQrKs0QJfRZzKICe994zissOVVnZ8nQ06FLEkUKH/r10kyKpQ+VcmRmZdkz
 oBwlYt2eybGzTEEHuDcoP+eyv6+3vcWpfTOk3gG37AoRxTWWNAAAA
X-Change-ID: 20260831-dts-qcom-glymur-crd-reserve-ec-reset-gpio-4b9c6e1677cc
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1145;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=o+jYyzlg8w6Vj1pZlgtY5tR/vJJUA5BKv5OoEtt35DY=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqlUVOxiTFmMIjzCLgCb6bDprOrtqWD0Za2bFXb
 95l5lFu1BCJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCapVFTgAKCRAbX0TJAJUV
 VpAHD/4jvqsNB2Ow9c5ppviefuwFIE5I75hMFPh4fMDeVR/u7I18zphh/5vj2GMiRNYneQX4wSd
 xsdKQo+VZtPI04bu0zaxqLT42Kq7Pt83dwZNGJKsoR4FMsFboaGh1CSYWBr3/3YkUysj6g1hC87
 smmVcBryx1CkGWKSpS5Xgydfj1I2ZmGFsg+RePdU12rKAW2WKMy6okzYLnchy6908/RLmDja8Rb
 wdSNTixhQIhaecCSzGGnI9lINYQ+vN0+3qUxSy1qVYaz6GYS0MUwEdh7G5iQiOA3dzZT23Oqna8
 R+8Fl7XmJKTuzQJZ2NoDJME1tutilXEEjMp4EFNp6Bd7AGljxez9XpXjfPZWwMvVVosmZGRrB68
 36VqKWNaqqRbZn0syjOTMxyivb8vIvRWnzxFR55hI/HMdB9e9J8EUDpnZWvTPd/yb4GESXxIhXE
 sohyiyYWCFY1BKJJzKLOe2SMhaqT6yq9aiYyYOG8slh1M22IcX6+eQsPZaM9TMo8uaalLtnYugM
 U2aDr5WJFnHueO9KtRg6kqMx3kJCRvewRx5zIz9ZVb/92Slx6rUK8jvzGKVCzwGBlTQPqMDiQQY
 l2cc/dHp27C9l+JKbn5/Q/qiQCd/mwS9hc2jf0K4Acm37w18O/sydGvgs25zpKj9SyN11LmX9aP
 aA33ZUwl6FwuSvA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: p9njH5Msyu2DoB0Jng8bnIySgje917Uw
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDA3OCBTYWx0ZWRfX9CSua57TsERr
 +hjW6FxCTCelYd/fKyMNAYsWgpJPeIU+1G7RAegGcUDVMA/1sE/fI6ifUYDycF6tPzJ74ClTLys
 DuMdLuaUGD5AOu8dVN6zvVGvkHpd78g=
X-Proofpoint-ORIG-GUID: p9njH5Msyu2DoB0Jng8bnIySgje917Uw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDA3OCBTYWx0ZWRfX9dYBEIVGF0WX
 ZZNixaNfDw19gKfeXdj8/utMHHZl9o/zs0ITg8jFs9R9kutsYymYjLodR8pA/KABxLQYdYszRQz
 n7SB6XU5I+y7jb01adOOo+LragupdMZcfElqwgKDBXZOftycVv+dF7bI0YjkDm7Cfde8u3/FYcS
 49ytc57PqOOguVNo4NbZEil9aSNrKbnhX4NfDhV9DunLv5p3XzHDV+zRjOFeDHmqJxNiyahQ4pJ
 GUodgppVFpRonAoL9MiasP7FgHxLb4idNJ3hh4/POBPStR2TeYYPkw8aD848SRDQUowHgdg9Twi
 x9q5EIRfUuWXyVWiUCx5Jybp+eBo+3c+xf0SpOOxx/02433aic7igpF3KD1Bw8eivu5HHm1U9C0
 Wd6vHtIBIAKhxIccZfkC1YmEAsJC+iiDgnmiIUF+7lQylu6NYMNfvRUXt5KQ4x9Z/JcuV83Y1Gq
 uieCrw2pfNbu5BV3nlg==
X-Authority-Analysis: v=2.4 cv=YsY/gYYX c=1 sm=1 tr=0 ts=6a954552 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=clBUptZa5v5FR042Ey+sjA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=NjM4XxsBxMxLkyKWBQUA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 suspectscore=0 phishscore=0
 priorityscore=1501 adultscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310078

GPIO 65 from TLMM is used by the Embedded Controller as its reset line.
Reserve it to prevent Linux from requesting or reconfiguring it.

Fixes: 9314c6ecace1 ("arm64: dts: qcom: glymur: Enable Glymur CRD board support")
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
index e27c697e3170..4df3ccfee106 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
@@ -963,7 +963,8 @@ &remoteproc_soccp {
 &tlmm {
 	gpio-reserved-ranges = <4 4>, /* EC TZ Secure I3C */
 			       <10 2>, /* OOB UART */
-			       <44 4>; /* Security SPI (TPM) */
+			       <44 4>, /* Security SPI (TPM) */
+			       <65 1>; /* EC reset */
 
 	edp_bl_en: edp-bl-en-state {
 		pins = "gpio18";

---
base-commit: e30626823a406725ce29bc75cb8ec467d3e1e326
change-id: 20260831-dts-qcom-glymur-crd-reserve-ec-reset-gpio-4b9c6e1677cc

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>

