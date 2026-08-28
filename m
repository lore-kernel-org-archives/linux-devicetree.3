Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5F5944AB68
	for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 12:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787920702; cv=none; b=P1dqOeG8SQp1gkxJzoZCIZD3ltxnNKMO+Iylvpu5Me3ovO3I/Bfq6OHZVEgUn7EO9ATdVQXD7tLDgHW359AotRLWQM+WyQoBShTAFVegB/xBYEssjvaz1XNpOEhKnPxcOxCrOnpYN22Zd9svHBr53agNs7GfOXUeMbXb4H1O9yY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787920702; c=relaxed/simple;
	bh=ak1t1Tww2SU+UvWrfCScZHknIDQup5S/EvFBTi6V/sU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SiDpC7pg+EaU7qofKFNUuxhNjFZur/2Rr5yt+RbKfYyNuTKFYZb1DmPKqfW41t68bBk2Tnuf4V4mE1kO+4vBLwpvU/MJiJx4vZc62oxthMWhs303v9jFfa20lvDCYDP5JXFerxqhrs/oHEIMrsNrwX2ZwVZvbc2e98JG92mZBDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h3r8H9wv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Rs0UUbtt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h3r8H9wv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Rs0UUbtt"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67SA88HG2596136
	for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 12:38:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UU9XZ2HrQHQbBX6aVhP5UDIGMZ5towmgYqYL6QoFJxk=; b=h3r8H9wvSd5PGmZI
	OSlwFGPvMtwqYf3sb1lgD4JdRfaPbB8EwBTbfy6JizMziZ6Q5eNwaMWrHIMXomwd
	z51oyutIGvLz1CMQ3exfDIKh2BMdZHjk0ZyHZoi5UeSj9+K3GTish/7qKOL02dzw
	0v6p06C/oQ247yW8cWZqVWoel4r4AU5fT+2IaMxavRrpW2DiFUnVtxjYXKCP1V1U
	o//GIkFfsRwIgplx9UglJQtiA6SDVEAedOj0LpZIuMYleVO2EhKVAxlSf1hPWMFd
	PC/yqpsQjnrT0mY2tLjsyIfZPcaahKrj31FVvT6zojf1n46QZjpkS2GhbWxSawFb
	7dKyZw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gb1v3a896-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 12:38:05 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-52fb2a46cb5so22501901cf.3
        for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 05:38:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787920684; x=1788525484; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UU9XZ2HrQHQbBX6aVhP5UDIGMZ5towmgYqYL6QoFJxk=;
        b=Rs0UUbttiOht0vkwf0dwcfaw7S03Dlqh3rU+bszIouqn12UYjASkGzusCW78v5MJhJ
         DoJs1Da13CVmR8lczRjCn++Ena/KFkX6zFJupxLv+eRCSs6sNn0indY9l5YBNNEtFiZB
         NGxC28bBc7FKaqmiLqsxaL7GVmFMoceK0heL4HIiX3n0DeZvwG1wLiqcQDICgLI80Ch5
         v1nwjy+byAJ0y2hpKa1SB+mGuewfNi5kGP5BYTFw43e/rV3EE9h/n00ReJSqVr+KdkdZ
         l1o8apBX2RVNak9kcq8TgygFADkTCiy6rSnQn6wwiK0H1RNkbIG9cm/yU3V98vzMk/vu
         +Wgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787920684; x=1788525484;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UU9XZ2HrQHQbBX6aVhP5UDIGMZ5towmgYqYL6QoFJxk=;
        b=BtjOa/3eIl5BGV1h/2bZpfcuhr/zaoeluBMuN2fuoS+xEl70leJSTFf/S0bRYUALrK
         ozdm/IOuXJbNr5PPkVs+bU6DUCnkf6TZ/BFjT17Tbh0j1YvTJwMa1BF8o/rhK4j+NvxP
         8oOnbH9Lnli/EVL9v1d7ADkOgUR/U6e1kEm2fUHWNW+DV0Q11AYQksQYM8YTsAbV1auB
         o5RMQvK2YEWrMJUDLkLnLuZLWMmvkMFNR+1H3IqRvsvMZkm4PBP6wye8aVbsjIL/L3It
         cnjwqU7xNJpBw904JstR+ECTZS/x/wcgeZBB9D5WCfsFbURLqw5WhJZMZ2NGkyAV5a2h
         eVhA==
X-Forwarded-Encrypted: i=1; AHgh+RotBLcNtR07PIow2pMgc4KmMFukGfBWtlyLtoBFI/TkiIIuMPbr5bZS71ATDy/TQw6Hvld5Se1jwFTm@vger.kernel.org
X-Gm-Message-State: AFuF++nY1vseZcO169A25cu3iqnfFyS/vAmGyeD39nerW6H385I0GP3d
	2VGr6c8Ffbyux12g2vg7MQZXccJtszWJac1iG4um77CYxap1hkyBZ7CsA4ZEyP8loRlvyeBDCCS
	9iPMkkrb2tkQKWuXPIMp77FSWFAnEGgdhg+hO3qNguKjV+PGfCGobsjR6G49emj68wzampab1
X-Gm-Gg: AR+sD10vEA6gnuhbiXETvH8w9QiGLE7W2Bk2GNaUz4POQK80tyBIQBE7y3mNdbN3tyc
	Rzy4k+11Igl17gAbsucNkJWn9LYa8sVzlANpGPVdTCpiOqU9MJTf6cVmNuIlTjspcqJ0lwC0KvD
	9voBoASgGbFUjeatlJH31LZQrQqq3HfjdPdgl2VG0fJd8ACWxpFhoJc/fqrFjqEIz9vf2e2h9O+
	u79HlGlqBZuLe0KXQsjpZqRBnnKtpyjCOm/RxDNQXdefqqmZeg9vUWLvkllpPcdHXCMYbksLXv+
	OKlzqhd215WmvjxmhYMgIR5FybmEaf5R9lQcSY5J+IeNBrcq5rAdNQ7UPB4lGMKmekXRpPkkkgw
	BzyIC6E8=
X-Received: by 2002:a05:622a:164e:b0:52d:953b:2c25 with SMTP id d75a77b69052e-52fb965ec83mr65478841cf.38.1787920684198;
        Fri, 28 Aug 2026 05:38:04 -0700 (PDT)
X-Received: by 2002:a05:622a:164e:b0:52d:953b:2c25 with SMTP id d75a77b69052e-52fb965ec83mr65473751cf.38.1787920678960;
        Fri, 28 Aug 2026 05:37:58 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b92671c0esm39338965e9.2.2026.08.28.05.37.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 05:37:57 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Fri, 28 Aug 2026 15:37:25 +0300
Subject: [PATCH 06/11] arm64: dts: qcom: kaanapali: Disable Inline Crypto
 Engine by default
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260828-b4-dts-qcom-disable-ice-by-default-v1-6-1d6e0c2f5a69@oss.qualcomm.com>
References: <20260828-b4-dts-qcom-disable-ice-by-default-v1-0-1d6e0c2f5a69@oss.qualcomm.com>
In-Reply-To: <20260828-b4-dts-qcom-disable-ice-by-default-v1-0-1d6e0c2f5a69@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        cros-qcom-dts-watchers@chromium.org
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1969;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=ak1t1Tww2SU+UvWrfCScZHknIDQup5S/EvFBTi6V/sU=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqkYEP8HEzJ7PHwK//kjeDAeq71VynkaVhpOlmW
 D+YcGa2ovWJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCapGBDwAKCRAbX0TJAJUV
 VqvUEACht6OtfjUUwRWmcm1GbNW7qq6n9ZyVAVStOrTf0r40OCrlL2juhBCa3ow9rzh5YVkGH98
 NcRovg236fWZm5jktlWh4YDoMTAZ7OdaK4nOAopK4tjmSTtF3vq7auFj6ZR/oWH8ZM44l/UEJAR
 YWU6TOLZHNH0T+142El4hhs8CEE0bgsqHmYgs6oMyBCUN3KZYAFZyCO5F8VFbFN576U/4GFV/h5
 uJoURzvPZCcLNu98j5mltWpNYNfDIxjLq2+SM7GvqUOCCu006HGESuN+oHsG0tZebU4TRAozEBH
 5rKI9glfZOAHzSkq9qDO7duUGve+gBkq260h/HGy+pa90ILGZXAZwAe4mBk+p/Xnoppeye9z47r
 CH2qSv9MLTSbGLFjIUVPeQPQma6BiuNhm2hMbcszDVyXqVjmckFr24cYbD7UhOt6H9iMMnThcBb
 ZFEvR0m5844zY9dehk3IRzrR2R16PYWFA6fhycq8NoNSlJUUT4hYGoD9RZtlveuKpITDl92sdf1
 LiLRM8DMmy2GWuPuSHIHJKqmRhgyOMRV6HJjlXlzrGr7b5LvOkR+wB7NkBuMklzHGQcgINgBjZZ
 s1tnLOYbZBf/W16rdz473i362r8gMfD68l8ciUlZ1B1GJpuoD9nYl874W+GPfY/m5iHpXehrr3t
 gyWJ7gJmmedsChA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDEwOSBTYWx0ZWRfXxz3Hyy3EoYPj
 URyRQvsxgChXB6BfHCtTau7I7T1dEnWgqLNBx1kWTLjYvQKEKlWtvEfRunQUH9ZOv8O7itTpFk7
 ImAQwlijo4ai+7Tm3VVZ0phd2BFyCGGJYjjn1rQYIAxpUQQ4Q6ChPTEchsXABiKzO1DuJbR6NKs
 F0+WvFvmcWJcGWs+Ql1Eb2dCiKB/V5pVGAWf9Qqkf7+nDFto0jpsAvjIwLz1RqvTd7NvkDQvPH9
 4xYTMxzX73h4uR1zXm7iFpo67VgHykHN4Hm15yM5b/9jxzhWtDjZSAnLRDIHLIr34wONtNkDUTb
 Jx999zkCummsRN/nOKACXRKlAHcnCI7tZL2Ipo0WqVZNEr38Khz+ECURdhD5hZ29AwqlUNdcAWn
 Vpub6tjFGkJwsMG3VRjPsLM1RYPd8/lfMQzZ28nsz6AkIBc0tPqud6t35KXe/sz6lSfatmxTLeE
 NA6+louRTtL3Z12oFBA==
X-Proofpoint-ORIG-GUID: 1X_ki4CaENwJF3I5aT8c-lTe5EHp_CDS
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDEwOSBTYWx0ZWRfX8bXt3cNN6OxE
 2GO8prg+Oty6X3DN77W84n3ci6BSLXxjHqg/N611Mf9ghfW1nAnyJXKr+X0CO5SFCqlctTRC8k5
 ReZdGDGxpcdNmFOZk9omW9BpbVrTF4Q=
X-Authority-Analysis: v=2.4 cv=faedDUQF c=1 sm=1 tr=0 ts=6a91812d cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=clBUptZa5v5FR042Ey+sjA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=R9TnukjFd2VXrOE3MjoA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: 1X_ki4CaENwJF3I5aT8c-lTe5EHp_CDS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 phishscore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608280109

Since UFS_PHY_GDSC is attached to the Inline Crypto Engine and the driver
does not currently enable runtime PM, the GDSC remains enabled while the
device is idle, even on boards where there are no consumers.

So disable the Inline Crypto Engine by default in the SoC DTSI and enable
it only in board DTS files that use it.

Fixes: 11b48f6d5ed5 ("arm64: dts: qcom: kaanapali: Add power-domain and iface clk for ice node")
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali-mtp.dts | 4 ++++
 arch/arm64/boot/dts/qcom/kaanapali-qrd.dts | 4 ++++
 arch/arm64/boot/dts/qcom/kaanapali.dtsi    | 2 ++
 3 files changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts b/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
index 6d817381bb37..f1629889354a 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
@@ -908,6 +908,10 @@ vreg_l7n_3p3: ldo7 {
 	};
 };
 
+&ice {
+	status = "okay";
+};
+
 &lpass_vamacro {
 	pinctrl-0 = <&dmic01_default>, <&dmic23_default>;
 	pinctrl-names = "default";
diff --git a/arch/arm64/boot/dts/qcom/kaanapali-qrd.dts b/arch/arm64/boot/dts/qcom/kaanapali-qrd.dts
index abd3e9f8a3eb..1560717b6ea1 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/kaanapali-qrd.dts
@@ -736,6 +736,10 @@ vreg_l7n_3p3: ldo7 {
 	};
 };
 
+&ice {
+	status = "okay";
+};
+
 &pmh0101_flash {
 	status = "okay";
 
diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index 131fd2a16c54..0aafb249af76 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -2619,6 +2619,8 @@ ice: crypto@1d88000 {
 			clock-names = "core",
 				      "iface";
 			power-domains = <&gcc GCC_UFS_PHY_GDSC>;
+
+			status = "disabled";
 		};
 
 		cryptobam: dma-controller@1dc4000 {

-- 
2.54.0

