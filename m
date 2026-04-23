Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B0CC3F0AB6
	for <devicetree@vger.kernel.org>; Thu, 23 Apr 2026 13:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776950748; cv=none; b=ATeBc4ZfIZ/BRPyNwVmm0nMOHalXbEesq+G3O+TXezKH+6Hrsv/U8zHtdBZGTPhr397j9HwWtokdps2ieMDdlnO2taQWManwHgXJ/37YCaKN+5dWabn2oXeFYItbmHzCtRYp0zTx0BV1NSP+HiztBA2haE9+1FMzTKTo+GTiMHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776950748; c=relaxed/simple;
	bh=mhFWDjcQIlaFOUDhsBU+7/btI9eHrJel0pVml7G0csI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=YgaD7TNjjy+f7zDENAaGCA2t+PUJGpdcD4GRi5o2hiWCxtArHgRpd7p/IkfNmCIMIEJbmB8oNnj8WbalPunGL6yswQnamSJslbrcJTrVhVUunw6XhZLHuG7JbvUYlEK4L6QeoN4dCO5FkIAqk9tHN3/GvYWToi2CqWwaULgLYLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ha2f6MxK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QBMAzQa1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ha2f6MxK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QBMAzQa1"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63NBwijV009895
	for <devicetree@vger.kernel.org>; Thu, 23 Apr 2026 13:25:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=t5PtXP2uc5cR+cffqPRMLt
	M49KDHVnt86V5Mw48FhQ0=; b=Ha2f6MxKPMf0GmVGSQvi7Ob6/0WDbNVZHUD7D4
	WI8mo+ZK3xUt01S1M0ihjjCMFPYnwVfwkmCnAzrdDqErA9mwvNI5yWMY7Nhcoavv
	tX6XZ77T0V0GWTpWNydGwlWpNsgDiyMxXFvuTxzVG33qmehczkQsxgMtTM7dCWNG
	sp9LpkIo1CtzBNiKAfysFvl3j8FFjVVjWKfgYEacFV4BvAcha/mCOoFZy/N0N8JY
	mrW9q54KB7pq99jkZy878bKfAV+ofqRI6WJLvP+7kzWQcZLToy+xGUFbtOw0lhea
	TbBKvb4kLmchlL97fpiDss+eYyNbyIKLR8s3KB5lvgzCQp3Q==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dqk1789sk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 23 Apr 2026 13:25:46 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b630b4d8d52so3798977a12.3
        for <devicetree@vger.kernel.org>; Thu, 23 Apr 2026 06:25:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776950745; x=1777555545; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=t5PtXP2uc5cR+cffqPRMLtM49KDHVnt86V5Mw48FhQ0=;
        b=QBMAzQa1CXol7HZA884aankYZ30qqabrTlNaX/WotxwCg1YjTB57vYVtBCfo9S5REL
         IvD4zypyBM1irSsW12C8gY/lBLbazLhJVezFQO8FXKjMAN9pYMmQktgsYX+eJxY2/GLZ
         4tkQa3+FicR9gbCsR1vriWILfAloUNUHmeu2d5hbNx+QsvNX3HWI6DrKjShWwsWzOSNw
         RjvRhw56GvFkvWk0Nw5uqrCcnoVRvYFlkY2ejBUYEcBLGzEgLqOWIt2QhOsFj2j+UPDD
         1PzIfqL/WJYQd0l4SCkJi9sYCDxL3hCL6/Y0hYyzCEeuPPTScVJA2K8IzHQZGqC5YIPx
         I0tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776950745; x=1777555545;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t5PtXP2uc5cR+cffqPRMLtM49KDHVnt86V5Mw48FhQ0=;
        b=kYkG94mYIpZDbzYqUtMqk1/Xlxw7Dg3jXc3EHuIcsPlPg7TylF38IqHd8XyO69Pwty
         SX633ZSjNxPbAI8mX8sq+wv9dmkG5hu5maomf+vprc/UNOhcFFs/WuwOn76q6Cqlstkg
         JQpytKjg7RIX5qH+q/vDP62qK4QneUGb2sHOT2/D0sK5nh1iWQu7L/ukPifWt1R0jlZd
         JFtOpE21RMCseJrchd8Z7Hh4mF5+Pyzdcet3rjkH2FmGiESoCw/7lrSsFBr49xbNHnGt
         Xuv4QOrsGu3rUCB3oj0q2BD0+NVS+63F5NftNg726tDLJHrRObS55kE4iwzHU9NNFQoH
         q9Fg==
X-Forwarded-Encrypted: i=1; AFNElJ9g1amT7/voze/RGK10+izWpa3atkIT3SWf5wkHrGDXzsaTE01JUwQRBsqjSTSnK1/8KzrE1fiPn/Xm@vger.kernel.org
X-Gm-Message-State: AOJu0YxRac3Ju7Gmb51P8t/Aqbn1yplJLV7zSfk7VMnu+ZPbxzhRrd0/
	4G6CvINyJDxRB7WzX/Rq+hOH9Y0xwikb/GsoAkdKHa3l15EHVpgUpLuNNypQybUQevB42YujVqW
	ygeqRG3DFb8GA9XSdkUiqQ200sxEdYIoCsJOTdDAlEung3cbC1paHFG/Om9hanumK
X-Gm-Gg: AeBDievU0FtOopvJN9Cl/x4SRwTSmDyleFmPSpfOj7oFaNnG/bxpKgeuwyHNlcYkwhE
	+eCEBg3s7rbOJltk91ai7oK/lZiIa3znJZp9udlrriBdDX+JDGH/Ypt/9gRFlORsr8qVdSxjX1T
	FGYHBe61J5Do1u5zDVFL5pubsn1W/8pTDfvlyNyl8TNZTi6VC7sm9vlc11KGrxoBixEEmY7JUJJ
	9c9AHdZX8dFgdEQV5+4ShTv+JeHseYhysHAEQzpNWRJMW9YaY4xR+3jdjMUlEZiP3XHgj+GKVW7
	OhxIu+jlslKKuedknr8Nob0n9l54rRsyY0SocX/deNZDq4NwYIaU0KYXYdFVMaX/Yx9PefYoP8U
	8ug44XxJod87GWO2XF5t+jeb+jvd+q/VempIUqT+/o+Xh9cOHhzGUXIV5DQf6zQmBoA==
X-Received: by 2002:a05:6a20:4306:b0:39b:c79d:2336 with SMTP id adf61e73a8af0-3a08d89fb6dmr29537155637.27.1776950745215;
        Thu, 23 Apr 2026 06:25:45 -0700 (PDT)
X-Received: by 2002:a05:6a20:4306:b0:39b:c79d:2336 with SMTP id adf61e73a8af0-3a08d89fb6dmr29537106637.27.1776950744586;
        Thu, 23 Apr 2026 06:25:44 -0700 (PDT)
Received: from hu-kuldsing-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c79770587c1sm15647276a12.32.2026.04.23.06.25.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 06:25:44 -0700 (PDT)
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Date: Thu, 23 Apr 2026 18:55:31 +0530
Subject: [PATCH] arm64: dts: qcom: kaanapali: Add TRNG node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260423-knp_rng-v1-1-9df6c0391a8f@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAMod6mkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDEyNj3ey8gviivHTdVNMU4zSDFIMkEwtDJaDqgqLUtMwKsEnRsRB+cWl
 SVmpyCUi7Um0tABBnN5ZrAAAA
X-Change-ID: 20260423-knp_rng-e5d3f0d0b481
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Proofpoint-GUID: 3iXEgl_ZDtFKAb3Wry9ol-lwwDvn4gyc
X-Authority-Analysis: v=2.4 cv=R98z39RX c=1 sm=1 tr=0 ts=69ea1dda cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=wRMDb1tyTjY7daH1K8wA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIzMDEzNCBTYWx0ZWRfX2oVgx3p6v3ai
 QWYKdaWeX7sCCUjChEYJS+aHaSS+omXXdq24HcTXeiJZu3FPF8u0uPy9JiCkgm0xjiEZUZ2E/x6
 cah9hzQOzu8PEicYrs41dgLvLUubE+kzojPMNO/W9kPseB7JODM3gUTBWQgkdnn6BQwr7PyTfmn
 T4GPANcWlL7gz3AqOarIMwJLnk/21IL8KIQExB91FgTtcmX24b5y7DBw4aoxXvpZV7vRfXla0zU
 LVCqgriI3NlxdpLptZvl3xJzoiZuV77ugnoSJdxFoyzzXlpH68pPWrGErbwUBBVI1XOqqN7Mufy
 Y5rJJJpPbbhxquCUUKJvFvyNTPKb7HfqCH7zshpi6zBoRRlex7o6HAlVMTXIGbliMKkROyZhilf
 kzXw7S5kANhLVLZ57WobRGFoPEhJNBSpQLNXtsHcjA7WTZdy8hOhe2LThThZzNtNa0uQy/pxzor
 08oHJ4NDvA7XDAaMgqQ==
X-Proofpoint-ORIG-GUID: 3iXEgl_ZDtFKAb3Wry9ol-lwwDvn4gyc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 malwarescore=0 impostorscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604230134

Add the kaanpali nodes for the True Random Number Generator (TRNG).

Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
---
Tested-on: kaanapali-mtp

Testing:
- Boot the board and verify qcom_rng driver probe success.
- Validated rngtest utils

Steps followed:
- cat /sys/class/misc/hw_random/rng_available
- echo qcom_hwrng > /sys/class/misc/hw_random/rng_current
- cat /sys/class/misc/hw_random/rng_current
- cat /dev/random | rngtest -c 1000
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index 7cc326aa1a1a..9dafd5518c0f 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -1513,6 +1513,11 @@ &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
 			};
 		};
 
+		rng: rng@10c3000 {
+			compatible = "qcom,kaanapali-trng", "qcom,trng";
+			reg = <0x0 0x010c3000 0x0 0x1000>;
+		};
+
 		ipcc: mailbox@1106000 {
 			compatible = "qcom,kaanapali-ipcc", "qcom,ipcc";
 			reg = <0x0 0x01106000 0x0 0x1000>;

---
base-commit: 70c8a7ec6715b5fb14e501731b5b9210a16684f7
change-id: 20260423-knp_rng-e5d3f0d0b481

Best regards,
--  
Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>

