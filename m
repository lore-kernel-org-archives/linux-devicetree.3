Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB9F63822B4
	for <devicetree@vger.kernel.org>; Tue,  8 Sep 2026 06:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788848632; cv=none; b=QWBNB8ju+/zM3NVEVwugjv2/O+K1PGIa+G5TNOdoOPsPIh42w/arUHtjvqbuGtxMXOBpmBC5/5+fbhsxzbk7qcNLVwcgw9lRA2ZPJf1NfJC2BePQ/2u8WckF7qp1ZvzfbrB+j2/R3M7Eig1KjzABiQn2NkTRubrCCsdRDUlI2cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788848632; c=relaxed/simple;
	bh=mJATbGpidDn3SSlx/W3gY2kMWMLfR+Jpsm4nDdoHduE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dsgejjqYBQBftzM+oZFEd4ovpuDnx+gGEWaIKXfW2O1UuKNOK6+NnQjy4EzTSCgxC+12F697OZZ4/nf3VOAefBCniYJm61rad7NpdreFxjrWPHWp3Tak4lHaaL6w8m8EQWZCPlMJpfUlu2cbeIKGrjgt4FQ4awBTVQTo+C5E2Rk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q9YnjvQL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GaM5n/Ni; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q9YnjvQL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GaM5n/Ni"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6886Lqok2502437
	for <devicetree@vger.kernel.org>; Tue, 8 Sep 2026 06:23:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	61HdGkF/68LYVs1l8XHHaSlHGHJ3i26abyWFQr6sk/s=; b=Q9YnjvQLzyqLr+Q5
	YaazQ1GvFJmPy5I7L69PVQ1wAmGbh7b0XI9GEYEgHCfNb0UbwHbnAW+Q9L8eYG4p
	7Vbe/LBvz982BGZ1dpsfocuXJzbDuzS0zCZj9kxiWbZvA0SjqzmSi6bISX46gxpm
	zaQ8DT2TSjWx+ClEBREBOoOrw6TnflbnzCHvJy2wo4H1jClKrQwWbkCZb4fa415Z
	VT5HZSBM87hLkZuxLr/rmP9P8PCdJuSCZWxbKONKDJHdIcnTVIRz5SDSOYZGoPVa
	gLE2ra4VdsrLFzIrdXoHWH9mERtR50Tv7GJKMbKzMU13EjJUq+FxCk5ZyyqDO7au
	2vitcg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjcv7g1up-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 08 Sep 2026 06:23:49 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc1cade6b71so3874128a12.0
        for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 23:23:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788848629; x=1789453429; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=61HdGkF/68LYVs1l8XHHaSlHGHJ3i26abyWFQr6sk/s=;
        b=GaM5n/NivhQJ+P1aGp++vW/YN+9aid5SIMgt8Yw9GAHQif6vUeK4SOwz7AF9sSaX6b
         zOxyaHxNdz2TB1LaFeGCBpaJ/YfjF1U6t7FOA51dni+JkUIm+rPvZFAoHKqEuOLpP8tP
         S3R5cNQpaCuA+eiF1vj88mhX+drgfmoj95dYb4OSi95+OR2sGPzocQIYglwVfzWzDhhr
         9cPOnzp9ZGp/5lmwyjdeIoQEYog297y5lcMiKQHXj8MwaA77Ga9ZNCn6Cr+wo+BvcRVR
         gVzzNmaMe7Mogjy/a1/Wsp7OdVLLUS9CP8T3qHvdsrySWIZA+6QghcpBRV7l9idu6SVm
         rBDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788848629; x=1789453429;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=61HdGkF/68LYVs1l8XHHaSlHGHJ3i26abyWFQr6sk/s=;
        b=HE8GwQMcpmDH3GBXGdO0z9wkOU7nWknGsq2o8g+LXpzLW1BA002pQ6lmaVTUTzl3M6
         BFi76Dy4+29k7TQDVznWA7nKjckrFNrknHRFB4xs7RJUilkD1pjulGkPL+C2Vlh0bgF1
         q4jAgdz6v9pZt52Zaao8vZRujMo//3QNVCHZahfSh/5qNcHu3qn02UMUobdCxYucaHeV
         vWsl5Szrg2ZecRhNYbzM7NPmUCbhENI86h1r3xsxe/HWaJcwDJ4zljcdO3jus39zHqUn
         So3sMxNkFUjsxa1XASkU7NHC62ZsgCeHsgdgj8/rqfeKnlCTaaRS7B+asC3q1Cj+0DUc
         CDPA==
X-Forwarded-Encrypted: i=1; AKwUvBxpGE9iV/YFFnITydVBYT8fpyFlvuwU8lM7wH7yHIcl0yMw4kV6jKnNgwfKL01A46AGIws21OHNU45+@vger.kernel.org
X-Gm-Message-State: AFuF++ky3IGCk008WRvVCVJGAKSx3n4MnTUAOZ2+AWHABZTznQJ/S28r
	4sU/Y+ZW1yEsj0pVMNEBSFr+ZNArb5g6JuRiyQPS5oET/5rGdrj98J5ijRq+njVrx8E+R/IUbR0
	yvx2dnl7KeKL62UUhFy/tKH7eHBPoNqbKkhPz9tWJoqFGBqBZRG17p0xk4gfcIKKS
X-Gm-Gg: AYBFou2wHs6J8awL3A4kc9BMHpZif3tTPd/AjxYjUedp0mPPzIpF/kOCV6Zt8Lqx31X
	0lV5aZ3bR/ndY6K6F4Z67wsp2QlIIPM9oL2qCEPCAzhzjE+Il1L+abDiGqrFyKb+zpPmNCFvp74
	HSAFsZHN0u3q/1ORVdgxv8RH3jineUAYOlCsAR2TVVY3gk3hPl6oGUWZN3/lwVA5kONgHjlkH4j
	kURiAXB6iEU7aZaQlvtw6B4l/EjYvtOzKwuAqWcvOwGBKGryEZKmoSY3oHSd+PNkQhXkN1Q77c/
	18/GZos0ukySLBtCZIHf/mON4RwHSts5+DBOtbFPzI/02oBRy23AwPoolazmAQkokVYoIKebUSK
	dx5qQaBi7ezxcmFg7zCwkFvn1SIil7g==
X-Received: by 2002:a05:6a21:3a93:b0:3a2:c9a1:2c26 with SMTP id adf61e73a8af0-3da214198ddmr35394001637.7.1788848628657;
        Mon, 07 Sep 2026 23:23:48 -0700 (PDT)
X-Received: by 2002:a05:6a21:3a93:b0:3a2:c9a1:2c26 with SMTP id adf61e73a8af0-3da214198ddmr35393936637.7.1788848628073;
        Mon, 07 Sep 2026 23:23:48 -0700 (PDT)
Received: from hu-mohdayaa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14332405e92sm26266297c88.8.2026.09.07.23.23.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 23:23:47 -0700 (PDT)
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Date: Tue, 08 Sep 2026 11:53:30 +0530
Subject: [PATCH PRELIMINARY 1/5] arm64: dts: qcom: shikra-iqs-som: fix
 GPIO138 reservation
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-shikra_ethernet_dts-v1-1-69c0c5c7c124@oss.qualcomm.com>
References: <20260908-shikra_ethernet_dts-v1-0-69c0c5c7c124@oss.qualcomm.com>
In-Reply-To: <20260908-shikra_ethernet_dts-v1-0-69c0c5c7c124@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Anurag Pateriya <apateriy@qti.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Richard Cochran <richardcochran@gmail.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788848616; l=1491;
 i=mohd.anwar@oss.qualcomm.com; s=20250907; h=from:subject:message-id;
 bh=mJATbGpidDn3SSlx/W3gY2kMWMLfR+Jpsm4nDdoHduE=;
 b=Jkvw1pk7oGOlN57WgP/TuG5k3irKsBRAa8w+E5vVUW43T7qOC9t/PS572nlfiVy1K/+g+DeCL
 YSYm/g5EgGGCXd+vkMZ5nnX6zyRl8UeIu6/rKqt5Ifj6IfD7P9za1Ba
X-Developer-Key: i=mohd.anwar@oss.qualcomm.com; a=ed25519;
 pk=7JNY72mz7r6hQstsamPYlUbLhQ5+W64pY4LgfSh9DJU=
X-Authority-Analysis: v=2.4 cv=CMEamxrD c=1 sm=1 tr=0 ts=6a9fa9f5 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=QNdpPppxqghzCxVJOWsA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDA2OCBTYWx0ZWRfXxd9szu6wKK4g
 +SVC+9GUfX6K2Em5tPCfjLPSnQtkz2KLHA7TMMMcWo3P3PX3ryct4yuOX6UiKs4T7Il7eNNFNhD
 uvOrSdR/A9jhqtKX3HXxm8kjz/1Q7Ok=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDA2OCBTYWx0ZWRfX5nPo0mOW9wfb
 uttWmBMcasOjEZIP4lSt+tY9NJQvCwtgYKX07Umosxh0xJuavAXwETbvcHa689CA2RBc5NtkkTu
 VTj91Xqn2APsO6H1u5alPHn33S+EC9EXB618My9LvdT8SaukNcUjlBMFXsVxAxZyAgpaVfiXMhV
 dcYycZaqEQZBu/lzP5Th70Zml4u5pDo++p5SpbT6L0vB9sUSy7NUqARxzjn/O3+JoXJdo7GxThi
 7VRkxuKLLsTVeEJBuLFfD0F3o8Tks2FiWmE+oSFx9v7N8dSITfz3G+IiTqifymjG31ncLr5uvV1
 veb+rJP0yzTHxXdz6M3pce4Sy2SMGRw7BStPdnufEG3fFpbk4P27TliUQgGTYlnOeJp3Q+H1jA/
 E7l+Jf4jJTPW0BlDeQvNfCNYdmz0lRaBPxv2h4fHOPl6yFFv/v1eu1O8I63e2zyVz9/rUyfP7yH
 G81q0Lt2Q8/x3r2T+CQ==
X-Proofpoint-ORIG-GUID: ExKG3y_-ZPARLJs8Kg0SBj0ewkEDjP3_
X-Proofpoint-GUID: ExKG3y_-ZPARLJs8Kg0SBj0ewkEDjP3_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_01,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 spamscore=0 suspectscore=0 adultscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080068

The GPIO mappings on the IQS variant differ from the CQ variants.
GPIO138 is connected to the RGMII1_RX_CTL pin rather than the NFC ESE
Secure IO pin; the latter is connected to GPIO49. This incorrect
reservation causes the probe of the second Ethernet port to fail:

  shikra-tlmm 500000.pinctrl: error -EINVAL: pin-138 (5d20000.ethernet)
  shikra-tlmm 500000.pinctrl: error -EINVAL: could not request pin 138
  (GPIO_138) from group gpio138 on device 500000.pinctrl
  qcom-ethqos 5d20000.ethernet: Error applying setting, reverse things back

Replace gpio138 with gpio49 in the reserved list.

Fixes: 779aead2dace ("arm64: dts: qcom: shikra: Add gpio-reserved-ranges to tlmm")
Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi b/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi
index e119ace54e588dca38c7c12fc99cc41d6623f690..c3f5fb84a07c425aef5ae36fc6e2842d87f4cae9 100644
--- a/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi
@@ -220,7 +220,7 @@ pm8150_l18: l18 {
 &tlmm {
 	 gpio-reserved-ranges = <6 4>, /* Fingerprint SPI */
 			       <30 2>, /* NFC SPI */
-			       <138 1>, /* NFC Secure IO */
+			       <49 1>, /* NFC Secure IO */
 			       <155 11>; /* eMMC Boot */
 
 	sw_ctrl_default: sw-ctrl-default-state {

-- 
2.34.1

