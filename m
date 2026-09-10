Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A0D2498920
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 14:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789049332; cv=none; b=WgoBEswnfUbdvk34jMHNSyF4J9ArESoUiwrvoIg9uw6wCCQnZ7rGQSiSmZPz/kssBjeZsyfJgYWCo3OH+tl3XKbB/9gP2ySvb3Z+X6NnskJp3nn5+K9Wxa2R+Cbfm5oq+k8DoSGVYyjXLKLvojvMlTnxzwE5oe78D0E8aTg06Co=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789049332; c=relaxed/simple;
	bh=PJp7at6YbmABjQssQHHtns6pe+hmMVd0Nnzb//pLNGo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=A3IcJu2deqKKbjXz5tVjdlTfbKTMv7OWFxtHb8pzDPKbCdUENfv9id1JNdwiClMuBH3YO/lFB2gIfmANC5ourbh7MW0RWrWGsmgA9RgAvIhukS2oVr9FFdUSYzTDJbRfpRHohoOtkUH3nY09+lXKjyLzAV+fX0MlmDs58hYK0lI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NIOO4oHB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A597FpSj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NIOO4oHB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A597FpSj"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68ADc3EC1067904
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 14:08:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Xsa+f+27jsxypSSVPRpVMM
	g/ju4l/7cO2PJaOMBUNws=; b=NIOO4oHBcIOSEwcH1CMpjqjIFnwbS4Tz5CqtIQ
	5T1GEaxyl9UVtXKwKzitUiRK4FKyca8kxEgM8A2h5s3Opzhu8kIw/HNM4CzxBwXw
	rfc+kbnAYvhF7LoNjpYfF+Wa/5f+nMydlPxOKf+HU/YbviuWVBlkSQgjtVQyhwa9
	UuIwFKg/SyVCaxwQ48EhNucnbVT6kIU9iP8hBwDz3vzCSvCztGiIQkMLF5ZqlC1p
	Z0jllnxuIa+5bSOJAaqYEUk3Blm+hhAM7AQpG1Xo23/psM0Y0s9CG20szoYO05vi
	cRCftKkPqdubeXX0C5FKZ08+ZL2ebekXDR8X/Iw5aNcXcOBw==
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkwkw84p6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 14:08:47 +0000 (GMT)
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-6bc8f608979so2570984eaf.3
        for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 07:08:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789049326; x=1789654126; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Xsa+f+27jsxypSSVPRpVMMg/ju4l/7cO2PJaOMBUNws=;
        b=A597FpSj69HQ3Jd64jZWnr7EXJ6hj9htfyMU1kTnnixT4Fn86FRwLv5KMlm68LBhS3
         4hnYGh8PUiXUh6r1gqzagyG1D6WLTu8EUL0gj3lDZKY6uPvTzz8hGQ5rbjkA0dTa6QIS
         5j6HMHL/bNf4lAmuXvLywd5j8txskkE4+CCE4QI0Lb+OS+CVdVkOPwZnKsSqeHaFrSSY
         9GM4nbxlhF4jD+L+RZLtJMkST4Zo1MsDXrjSk3Soi+9j4SMw1vOXYzuawj1o1ZIvJJ9p
         whDt1ODphPLzfG4snXh4855Pgx1QhiGV8z8UMwaGGCEBEYcS05sp+0Iigw+HLwI5aUHB
         2zag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789049326; x=1789654126;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Xsa+f+27jsxypSSVPRpVMMg/ju4l/7cO2PJaOMBUNws=;
        b=P+EIcsY49KarktP2XNT7352cYgDwLkFsYCJ7QekcHdgMMdKDA320CteONzRM24TDXU
         FGzGwKF0bK3huxNQtg2M4X0NbKP3Rd02aDloSAKuoNb77+ggABvjY1XRoQSYFgpFVMp7
         VCz8HaInSeL15QRU1VWJwZMMLTQsVzZT+gCFxbu8OkoLQNwoilQAWvRLxy04GKzmpML7
         qSHRXqEYpiTO4CYd5le9foJ/JBW4VV4ZqHffmo+6MQrqKX/Fcv5JaqnDMa586LvcdgsG
         hwOqdDxgPrlVAJzAi1g8isFdI14uiO5XSXQAtvHqyccPa/ne45kjne31OKMLwfgPC/PP
         pu+w==
X-Forwarded-Encrypted: i=1; AKwUvBzcdgItu6mPRUCiCqR4+pSFB+vET3km5g3KbGBkFZqEs2ISjQC+lvsU67eIBvOy5QhdzTNcn+o1+Yj/@vger.kernel.org
X-Gm-Message-State: AFuF++kwDHO/EHpvtsVkD7m3aKPX6EudAETo40Q7Dp6jP3aaRcMmfHnu
	95cpaNitutdiRSUTs0t2KHrWcIyh2g6urFpjPgTjibnEVCHD2+Yp4D6cR7uZaIBOhb0SfI8tgnW
	nBUWZ6IjBnod6saMXrbimYfqJzf/i5QI9lzNcFPVa91h2tUXzXoHVqBv8kq9h6EmQorHWNcJp
X-Gm-Gg: AYBFou1SA6x1ZR3AeUnFanwkIvl7mywkLkKhNg0xH/a/wRzCAasEH6n89V42bg0jAlF
	HslmXrcMeJevbGI00puLXIjuU8NjRpVyrmAzXQk0PEq4cXRSpHJzS1/DUaICJekguJ3AUVPeG+U
	07rHhiTCG4DBWAplmPOeyfFOF22VyCDI7JXDRUTwFjtPAKsCgJFZkYRDJcWwfB+h2aCJm3BYtr+
	GBjbw2H9JWV8EDUawF8UHAlDDN9vLkKev1Pp7qp6hGYsBaAnwpODc83Tkl8n148zCWnX7beHohu
	hxBmq6gCq8JQQdM+43xcZIarVmns/oCXDIMlfSiXADeC0GYUwc0fe7tzY3pqEeHgGS8OvCzYKUb
	niUf0EQ==
X-Received: by 2002:a05:6820:812:b0:6be:4eb3:e1be with SMTP id 006d021491bc7-6be4eb3ed98mr5956676eaf.39.1789049326401;
        Thu, 10 Sep 2026 07:08:46 -0700 (PDT)
X-Received: by 2002:a05:6820:812:b0:6be:4eb3:e1be with SMTP id 006d021491bc7-6be4eb3ed98mr5956622eaf.39.1789049325769;
        Thu, 10 Sep 2026 07:08:45 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.7.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26c494basm69712295e9.12.2026.09.10.07.08.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 07:08:44 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 17:08:35 +0300
Subject: [PATCH v3] arm64: dts: qcom: eliza-cqs-som: Enable Adreno A722 GPU
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-dts-qcom-eliza-evk-enable-gpu-v3-1-806bf0fc51de@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAOK5omoC/43Oyw6CMBAF0F8hXTuEDq/gyv8wLtoyQJV3oVEJ/
 27BjQsT3UxykztnZmGGRk2GHb2FjWS10V3rQnjwmKpEWxLo3GWGASZBFnDIJwOD6hqgWj8FkL0
 BtULWBGU/QxKHqHjIFQnOnNGPVOj77p8v72xmeSU1bejWqLSZuvGxP2D51vv3luXAQaQqLCSmM
 qLs1BnjD7Oo3Urju8G2kxY/UfyFokNjLqMYRZQEAr+g67q+AJpAGEA4AQAA
X-Change-ID: 20260901-dts-qcom-eliza-evk-enable-gpu-6532c131cea1
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1525;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=PJp7at6YbmABjQssQHHtns6pe+hmMVd0Nnzb//pLNGo=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqornmBIN7oAX3fVfYgFv0vXR0ZXLqJyBqphYi4
 UaQeo0N90SJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqK55gAKCRAbX0TJAJUV
 VhFQD/0eyDEQSNWpja7ldWoi9sap4iQuBgCTYeeOgUrlRSKbfOYW8NO9m35fcHkCDM2om2qIVWQ
 6w6e9/srQRV1LbaWfUxsK488G+22jlSQ8QWyQPqW2FrgeKthdUS8csvLZbVKOo2sVn04I9/ccAp
 YCylwhOhQjARXVmGWdPRao2+LJld8NI8NJssRoBcdj8H9dJdxko7VKNn1y/ljr9uFhzF9T5QTam
 cIZO2fP/0FDRhGIEoklEHE2voMJVUd6K8gFD2Vedbrd3T+RnXmAxL2KLQCDg238loqgVOtd8kfS
 iRkwpd/IAttyVU70UX9KhAeEOYbslwzHfEtV/fQD8CWjLcu5cSZbX6bBtmezwZ8jdHUdDPiq16R
 +aXfOapWKDxvBRHrGjJKOvf+ejBFJ+kCzVJnffR7YFuAf1Z1vRJqy8sraS7cNPtsGoYvyaylhpJ
 wmFN7KzZwe8uwqiH1CQi80ve/GwEKPzlkYSPa/HUaQi/MDuFCecTWWdP35ICr5aQ/qZqUYOcgXf
 cq8hSI+zKafNhAilwxZVVQA8aG3M7GUqcAg5Z9ROpprIvFT8LRs/DihG0CPa7ElcD+vhdCNhOBh
 dZXUXj192hyv0wpel1uMnpwgtdA7blNyLYnDYG339XAZ4DCEux1zY12fLDE5FTGA1TQF/0vW6S9
 f2SyQMVlrgMMaEw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=EZNd0/mC c=1 sm=1 tr=0 ts=6aa2b9ef cx=c_pps
 a=V4L7fE8DliODT/OoDI2WOg==:117 a=dePp4Gl7O00gmbwhyVsZwA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=cfKdWksii-jdlWvcsasA:9 a=QEXdDO2ut3YA:10
 a=WZGXeFmKUf7gPmL3hEjn:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDE3MCBTYWx0ZWRfXyZJt3Vtwptm+
 et11qb7x+7gn4ylfeB0A/CEZSK1viaCpXUSIwDd/7VGHwd3vzK/VqQ79Q+RVMP8VY8XM8WU/BjF
 9wl97TTzRn8hHLZkcctsTNcRTM7jegY=
X-Proofpoint-ORIG-GUID: Z3rvQqvmDJSdxca1QImwF62LMpDkh1YN
X-Proofpoint-GUID: Z3rvQqvmDJSdxca1QImwF62LMpDkh1YN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDE3MCBTYWx0ZWRfXzMT2ZEO2CUco
 Rv4xojGhOLuMItQFT+I2ovTPd3o7sl6o94DPlGWWoGBDgOjC0IAin57XdO2AqYHQv0K5XOUso1Q
 gnkVCyuu4V0WV4TyH0mHsZJE2mUgs5NH0JK1CMRcDaNfGGPs5pJyXb0l1Wk6jPXAxz7hfLcvMSp
 GPC+Q9A+1yDPVqCuopeDiaFfBZs4hRjtKBVju2IHWUwVOBJkd3jZMPsWc32pFayR17Z6GiQkHU7
 UgFPzd5EtPbp/grEsvUvLaVjkUlDJVNS4Uyjby5jMCkHn1jai0rORhEyS+e2PwKZep1RyG0f07L
 A8SdwooIExXkAIfTyDw5B3Q6oC2G/PaMKLmDj8FdeTI6DjP4VECkZrCvBqkY8y1eNvTCSraalt0
 wT7H3G5fQ/GeD8NzAXNlQjdi/qnqbYER/6ncEFaySwcdifZGYPD+JYoIq+zTLRfYMeK69IP7xAw
 4TG3GL8bzvJTCxWpX9g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_04,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 phishscore=0 malwarescore=0 impostorscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100170

Enable the Adreno 722 GPU on the Eliza CQS SoM board and provide the zap
shader firmware path.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
Changes in v3:
- Rebased on next-20260909.
- Moved the nodes in proper place, to preserve alphabetical order.
- Link to v2: https://patch.msgid.link/20260902-dts-qcom-eliza-evk-enable-gpu-v2-1-51b452a460a2@oss.qualcomm.com

Changes in v2:
- Rebased on next-20260901.
- Picked up Konrad's R-b tag.
- Reworded commit message as Konrad suggested.
- Fixed the zap shader firmware filename.
- Link to v1: https://patch.msgid.link/20260901-dts-qcom-eliza-evk-enable-gpu-v1-1-a7c3fb27b4e9@oss.qualcomm.com
---
 arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi b/arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi
index 5ef6c51618bf..fc2d419cfc09 100644
--- a/arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi
@@ -369,6 +369,14 @@ vreg_l7k: ldo7 {
 	};
 };
 
+&gpu {
+	status = "okay";
+};
+
+&gpu_zap_shader {
+	firmware-name = "qcom/eliza/gen71700_zap.mbn";
+};
+
 &pm7550ba_eusb2_repeater {
 	vdd18-supply = <&vreg_l7b>;
 	vdd3-supply = <&vreg_l17b>;

---
base-commit: c68a982815dcce5464e3bf2a31ac94f5146c04ca
change-id: 20260901-dts-qcom-eliza-evk-enable-gpu-6532c131cea1

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>

