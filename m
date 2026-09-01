Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0F7F37C906
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 08:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788250065; cv=none; b=ruBVzUwEOLJCeVYtBzIbV+FqAHn23GQycF/n2l1T1Xr2P6/gwszs6l5YH31husZ+1+uSnGMkgQo8WVVIxiEUNHRCx0GV+aCJCoBOocWZ4Yzo5k942Kwn8XzX07dZWTwL1qLqInNUQZIHns+7PlYaeVSytZUh1UBOPzRMuneeGm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788250065; c=relaxed/simple;
	bh=tN441A2j08V3jCDl8xEwrRaH1qOximKOl/mS1BZDvPE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XfS3J5in1Q5XbR4KKMTs6RLfYEHqbu5PxYGH2mesNTDTTPXolMbz/Ci+eMEreJJI/kiufdRul2kwfONGe7GaosIGMZbT1imxSLD1/6FOMAe6IsFRVp3+TQvCj20e04BHvIvDy+X+K3Thkt+rCXsmnhOiWletdLFRD0lDNnIAZ+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lzO5z3P3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ch/tg046; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lzO5z3P3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ch/tg046"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68179Pxe1282855
	for <devicetree@vger.kernel.org>; Tue, 1 Sep 2026 08:07:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ub51OpT1pPGndfOtUN2Qf/Th8h1NXJq7cvAp84NRqKM=; b=lzO5z3P3twnyJsy/
	0Zh8c/y33YnHM/BgwuZOSoyoo8gGT9djSixiIWOBVbHH68bSbI/U1gGLl0sMgZg4
	4OYVdygfkxpOUts7x1R967VW36mi3oVn5lChUl93n+MrPikJP4X5u78WXtonQtmK
	x81grYDv3GF7ROSDy9ZLxEqxNvBG9Bg1hemJVoVebEhYgIbExMKxmB4ob3c+RnFl
	ZR7ZmJ2QONPRMvGX2vejCeKywBimcrwvSWERgr1Hy3OuQeZ5v10iBi7p3rNA7tzG
	8iUgSTQX9ZMhAhh7449XJ0RBpUnZNkD9a9z0CUZGHlyqE5s3BIsSFuQLlXnabx1d
	dUs5EQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdndx9cg7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 01 Sep 2026 08:07:39 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e53b8a302so645554985a.1
        for <devicetree@vger.kernel.org>; Tue, 01 Sep 2026 01:07:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788250059; x=1788854859; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ub51OpT1pPGndfOtUN2Qf/Th8h1NXJq7cvAp84NRqKM=;
        b=Ch/tg0469oyJfVeV9OX+C7OhDlHHzVZRR9123c6+eG2D/IdSffq1tTmfPIb5HjTtqV
         VzNu9OykhYrbYkXAtHns8+4Bg4rqqeKUIpNZf+BQPTlmdEvcT8wZcIOGwzkaQonxOoBL
         cQslmYR/+L8mg1dz63C9qFBEKbREM6J56yN6VXLPOJ/6uk+YEFYk+TUuTcwDxMdf0gBL
         C4bvX1nAqBTnRInwZBlKdbpnu18W+cSFf6KPE5GTHGrdlw86T6+edBxIn7hu1Myqdy7T
         VUMRfvrZvZMxIsWx8nLRv+zk0RrfwTT/RQ23HBQKeYGbTJ4VyGtAHfTxBDFJBEziNWhh
         p0SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788250059; x=1788854859;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ub51OpT1pPGndfOtUN2Qf/Th8h1NXJq7cvAp84NRqKM=;
        b=pcV0KF4JenEaxjXQkqewyaPmEdS3v8wxcafoVD2fy9u9WNYMCw4T1NrdBO2JReZNap
         P8pbCbm8+CyONa9bsc1tCbwMakt4fDDJIui1kKKww3IHomJUcJzQGrKXR/ZWjkbyrEpu
         I3sU2+ugtytyzwHTuP1DdhrdPq8R0Tck96W8d+2PGV5Lc0XKdrQ3QMWbRocSxfZ7kR/y
         +ZpLFBVITtrXp7Y/uyzj4Sh/tWM4wfVf+8LNq5b/fjS3IPbY/h/Cdd0n+wGoF/u+fGhi
         k+FdPjC33p37JjpfPQzwUyJrLeUoBagY+XarsrU1dWo7jj71ISE1HFHCWn7/2iOQo8I/
         snRw==
X-Forwarded-Encrypted: i=1; AHgh+Rp14eWNPJuAOihMJPdVqvQ/u1I1jwC2LACEBma6DjeImp9hzWhfOPnS/Zi5eaJM+16c4qCPavFc1zsV@vger.kernel.org
X-Gm-Message-State: AFuF++krD/gJt6kr6OZ9kaKGepq5piWbVQNLoxrj7GBgPKwWTUGT2w6F
	3PVgMYMZ5t8s7X9UWQkhcAntznN2gxBadPUqfcQYn2hnaegmdNsOmLLAakWyWbicWVgNXUUV83g
	gMV5bbQKtZQibc6cDGtTupAoT59H7zXfxJcX9JnvaMJo0n71uyI0SKW1sRcqCDst0
X-Gm-Gg: AR+sD10uoyYETIBcZ1kcGqJa+FQ3qy/tfZBjX0iuM0mnp0memFYgn61paHzX+KVGv3f
	NcZJ3r2Kxjm6zO8zpS6jia9phn47oaRy3UkLsE2bbb/UxRt8sm1lYLqwcUQwEHrBSj2Si4tcqLz
	ba99V9V12L8l4h6/d53rMExB2ej5A/VKIGxv9mGC5qctAp7LDaULJJF06Yc7lDjmUjyLbPmJG5H
	yR72RvOpC9S+TU4ZIZlCgFS0YVEL/iXfkLe6ijpowFIwcSxvUuKJpqoLLCCxdVtt9O7se/xXvhh
	okxPPNgM11Xul3GaXe/1XHKz17r5nn7kHY8jcUgXteJj7c0uw87bGEIBFK4aNm04nCYp1uqmCK6
	sqeD1UYaP
X-Received: by 2002:a05:620a:444f:b0:939:2940:6368 with SMTP id af79cd13be357-93929406402mr1933014685a.19.1788250058464;
        Tue, 01 Sep 2026 01:07:38 -0700 (PDT)
X-Received: by 2002:a05:620a:444f:b0:939:2940:6368 with SMTP id af79cd13be357-93929406402mr1933007785a.19.1788250057848;
        Tue, 01 Sep 2026 01:07:37 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.178])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48442d3d2eesm3267776f8f.15.2026.09.01.01.07.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 01:07:36 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Tue, 01 Sep 2026 11:07:01 +0300
Subject: [PATCH v2 04/16] arm64: dts: qcom: x1e80100-dell-xps13-9345: Mark
 the EC reset gpio as reserved
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-dts-qcom-hamoa-reserve-ec-reset-gpio-v2-4-f4ab7e4bb75d@oss.qualcomm.com>
References: <20260901-dts-qcom-hamoa-reserve-ec-reset-gpio-v2-0-f4ab7e4bb75d@oss.qualcomm.com>
In-Reply-To: <20260901-dts-qcom-hamoa-reserve-ec-reset-gpio-v2-0-f4ab7e4bb75d@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Marc Zyngier <maz@kernel.org>,
        Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
        Konstantin Shabanov <mail@etehtsea.me>,
        Srinivas Kandagatla <srini@kernel.org>,
        Ettore Chimenti <ettore.chimenti@linaro.org>,
        Georg Gottleuber <ggo@tuxedocomputers.com>,
        Xilin Wu <wuxilin123@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Val Packett <val@packett.cool>,
        Laurentiu Tudor <laurentiu.tudor1@dell.com>,
        Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
        Dale Whinham <daleyo@gmail.com>,
        =?utf-8?q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Harrison Vanderbyl <harrison.vanderbyl@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Konrad Dybcio <quic_kdybcio@quicinc.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1119;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=tN441A2j08V3jCDl8xEwrRaH1qOximKOl/mS1BZDvPE=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqloeuEYxK8/ZCk9O3L4/VcXpkgzptlZdK9G3Qy
 0/HXV6+traJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCapaHrgAKCRAbX0TJAJUV
 VmSvEADCkuxwObHMfPPlGdOejFWSmTVLfH/zqt6RBd7ftTveyTubIs3+n0aroxI53OQlVlQ//Ek
 jcSry3E5WaT+f6f94eYKdK5QxODe4W9zhO+4twWcWrZzSMwPPAvaP05SXcil5m3HF8J+nlq+B5j
 FJAf7GGVJ6kICyEm5BCP/hqU8MT7UTHk8eJodl7v6Rl9NPhbrQ39Kq/bmz2evocQ8XSRR5W9t9N
 X5ljk/Q3ZxRtzS7lkBMZOUMu5G4LSJjpFbtGH7PqF9FYs/ZCtT34Icxak2YJDPlS5npsaxmbVt4
 TJuizfUhaJj+192lTdweOizlZu2jLf24x1rg4mE/CNJIMbt7JpWRJSpo9uzVdIxG6KQFmuO9yE2
 JQ0qo6TLWgiHXOT9PIRdycQJyPn3AajgLH3BrxxczTsBrs7Fbz+YeJA45qSH6oQpjxESvnt87l/
 ZkBgrZ+9TQZYMC1pfxXS/XuLR8TZetTrrAwOpnZoEka2DG0aXDJB0pCKcsB8qXIoAHBB371dOD2
 m2ZAnATDZEoMZXwpTBCMhBcmjdUmjmHCDbHdh/TAVI79wZFxdUelaEH9KQvcd0G2sOj4bCyfjT2
 FkyjQuILJFA0rru5qg1OFtodRWx0mbhqCkzO0Ue4h86zGiT5pg0ybTEo4C7tancW18j9vcxCqrx
 nanF+AxEnyfONVw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: J3EDJZT1wCDlAnaKIeaVu-ElotRTrzV5
X-Proofpoint-ORIG-GUID: J3EDJZT1wCDlAnaKIeaVu-ElotRTrzV5
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA3MSBTYWx0ZWRfX5Punr3swv50E
 nVxMMsiwC3l8THyvweEySEMXSZLGX8RoT+DQhY1Dm5BhnAFZGVwqsXHwg+9N1/CbRvakS+htuL8
 p+giy563j8DAnbWZ07wRBLev4gS+9q0=
X-Authority-Analysis: v=2.4 cv=U8eiy+ru c=1 sm=1 tr=0 ts=6a9687cb cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=G5ilVN+faPP2Ze1SHB4iFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=UFfQ5ueM2aPJ8qDrgdoA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA3MSBTYWx0ZWRfX7m6oH2RD+8Dd
 FZhZENb8rNsTNcaqMQrHfiA/ZZsizIoKlFhXe0Jk4ykGeOCYURIaeLVlwp3nTYn3sBsWEOz6jCl
 PHEUs7W8e9IX8dudoifZk61FhKjgmoxvGHgHJRU6xPWpJs1wdY0YO9dI3UnIGMvCoMYF8kIpD0p
 NyvA+Io5TqWcfKSUuDgtlv4OuyUYXukbBJlg2jWrkIWAONQj4Mlypi5jFcV/vTNps1HFxCRUr/r
 fFS8S85REf7ntiyzVkgjnUdxcqAL5LIloactVE6KmD9cuwh99WOaCDpNK7tUhOmz23+w48X+orz
 z3kZX3tNXZr9D6/d2gGftcYmtB9PlBhYBpnqGU9X+IxVr5Cm7xFzXWBGZk1vhtGFbe5iRMaMslD
 r7JvnbPN7G1WLg8nMzWnZ7zd17etLiK5XMfILkwkMV+GR/t+oyGmvD8Ct3Fa0nU9K3BuiBse9ve
 VDUyetcXo62KhPFqY+A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_02,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0 adultscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010071

GPIO 65 from TLMM is used by the embedded controller as its reset line.

On some devices, toggling the embedded controller reset line makes the
device not power up at all, unless the battery is unplugged.

So reserve it in order to prevent Linux from requesting or
reconfiguring it.

Fixes: f5b788d0e8cd ("arm64: dts: qcom: Add support for X1-based Dell XPS 13 9345")
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts b/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts
index 2be5a37c00cc..b795b65d604e 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts
@@ -1072,6 +1072,7 @@ &smb2360_1_eusb2_repeater {
 &tlmm {
 	gpio-reserved-ranges = <44 4>,  /* SPI11 (TPM) */
 			       <76 4>,  /* SPI19 (TZ Protected) */
+			       <65 1>, /* EC reset */
 			       <238 1>; /* UFS Reset */
 
 	cam_indicator_en: cam-indicator-en-state {

-- 
2.54.0

