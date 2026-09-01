Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C033F47A87D
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 09:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788256290; cv=none; b=GkoPkPzsnuoKMABDyb6SnziHx49ECNTRizCcYqIyFDfMbP4bOeef6agCZHGfx9GZxot1ZNejxUGzh9bOL2A9rBkIOwUeiEMp5eB7rC383lQ3YHxl+fUwGZBT8/yeQFKSCHIpnUrdq6jU8zKeCknSvFqbwPyB5uhWXXzLPt8k6FQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788256290; c=relaxed/simple;
	bh=L7RQD5/LnUNN+s/Jecjvx7E25e68IWUWZrpA+5v3D2g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bJg2HcLtJQZA1Pq1B/DjWXf+SuFBwacew0n/zbIo7k3Cd9xYBr1ic0oWLQhvBXA14E2h4DynLA1YxW6J1BcHIC1Zfv+DR31Nd4lHv6Og9ycrcxeTnveEFN08nMwG4VMh0NPdJfp/vW6Lp6UUXkcTqqcz1P8oJaYZVfiSj2RBrjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QZGq4Hqc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VFkJ1rvj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QZGq4Hqc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VFkJ1rvj"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68179Cut2061537
	for <devicetree@vger.kernel.org>; Tue, 1 Sep 2026 09:51:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Jb50+pYjwgA
	TQrbLAr/ZmgQJVjW8TG6fm693bt3UZ/I=; b=QZGq4Hqc4YPyRrfbLWdCcXuOA8k
	CdC1cva4qKtMD7gPP5Z5vyeEmXphN/AisMVePoDd60mOuhK3gQqevGi0XoGdgWC6
	/GuH+rqM2EhBiGKMa7wsRx3akHcSnJcZwFhG24P5Y0dKt/ohP8bAnKu4g5GzO/fQ
	XrfQOqtkfNZrsdnvKHtqJOt8PkbkzVPfJmg2L89XUm+BB4i+I4dH4i1zFX+uK2w0
	SWughQsGEK0h9hjQS0h/vbVREiFDJ1iZaW4Ux82TCeNgTfyxIymsUQa40i8fEKCn
	toRUmTnP1TY0SgpngHFqXjyXo8egpSybDKAu1ImzxQXgB4YnJyVGzMhJT8A==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdqbh1djq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 01 Sep 2026 09:51:27 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2d70d8839f0so15444805ad.0
        for <devicetree@vger.kernel.org>; Tue, 01 Sep 2026 02:51:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788256286; x=1788861086; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Jb50+pYjwgATQrbLAr/ZmgQJVjW8TG6fm693bt3UZ/I=;
        b=VFkJ1rvjxczmKII5G647YGAUdcuTnA5PPHx5WyVkn+3u6jGGiWkvKXkblnDztd3I5A
         wOnSmxhzZ4NdY+FxHh/VEBXgVUlnxNkdXay+AFP6rNqcBxAKAbCsxTlXzEMAv5+bIK8S
         NuCNaeblzZT63iAYn/JY4m/staHJ6qOM/aB6MeJOiyETPMYTpiJptnCdky9sm2R+LRU3
         SOG2krbZBV6XqMTlTgIHIFoB4XVKIn7PDsGq6CoKGQ9oNss9SzQg7jTQL8XYco91LSYG
         8lnRc7bfTCXBDquieFUsrpxD3oGuzCIggb+Cy4bBXEt9BBNs1kIAYsHKnY1SaopWtXRk
         Kh0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788256286; x=1788861086;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Jb50+pYjwgATQrbLAr/ZmgQJVjW8TG6fm693bt3UZ/I=;
        b=TI2a7dOkXCnmmTkRijTc5R6xZhoDDjidlNtQtqXMWo7NfMHKuKpqXBMd4TfDe59TJx
         L+wRrd9B8WW/IWZBIaAcl9JVd1AvuRejWZh0tE7Ke+2gmpm6nXtvnBH55tgCJMH9eRuu
         tyutd2twQa4p0PAeuKtElpEtqLT3zaFUZRbcCkomAFr3h3NVRM4YLO4XMVAJW1jMb21V
         iuj7atVWdCkZAtghWYAUUJKVTxMy5R40EM/JbWNNqrLCoFUsJ58lpmgjGADfbki81fAU
         gel09gd9TM+qt8OTqWmgdeUNFmUPLeS71yMoQsf3ijxXw8XgyHGMZZuLY5EUgWb9Q2Wv
         JJBQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro1pShycKZFLHln/16cC5Oo2hMdb/kk8zdBjsJ15a/GNmvizsw4I72ykbMXR5hb953OqC+VIcp+tfLT@vger.kernel.org
X-Gm-Message-State: AFuF++nryzH4fNZMo+XvDXs/erXZ17emBtYkm2y3t/1jTLWWCB3xno/9
	einT6mWs7s1qQI0VWw8u8cqPeNvCpHWayYZHDzeprpp+EvXVt9B0zOah3LESH2JWHLG2zN00DFl
	XdXJXTjzSz07fkURTi2ZkTRP7w+E2wQuaHkz26DLPeMYGGxkXrOEfaF5lcHSDEY1f
X-Gm-Gg: AYBFou2AtUFUrJpfpubD8Mn3Aegv9/cIVZNEmtmUVaa5M6ckdopB3UFchscM1A1cfo9
	I9v0riWTRJaYUU3AivTVWQHVJ93E5Du+gOBj3RSKoDTKYuDxHDzEYIIVT25kPWaI6uztoTMkUZC
	NU+sobFpb0ZbZFB2739TZMv9mw4Qib+Fs6B7oBUF0N2NeemkvfmBTI31at2eNyZE7PCtf4fvcEU
	DOjtjetRulAxIKdN7KEykMntifzHzbBdJnV8xQl4gpCHe2WJbpdHxqH+WfyKkk5vkHBgjZh39O7
	xJIFLbejcVUK2duGzyIeGH3Hp1imfqtZdJaJHEzMDst/QQzY52jA478B5foel7gK0el8+BPNfWe
	fIkll90wxSGu6TNm5Jx2zXixCvBLOyJxHnqOixHHax63VC82pHhd+5wYNlKZD
X-Received: by 2002:a17:903:1848:b0:2d8:d4d1:313d with SMTP id d9443c01a7336-2d94a96836cmr113814895ad.20.1788256286439;
        Tue, 01 Sep 2026 02:51:26 -0700 (PDT)
X-Received: by 2002:a17:903:1848:b0:2d8:d4d1:313d with SMTP id d9443c01a7336-2d94a96836cmr113813925ad.20.1788256285941;
        Tue, 01 Sep 2026 02:51:25 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286fa37fa5sm40641466eec.29.2026.09.01.02.51.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 02:51:25 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 2/4] dt-bindings: phy: qcom,snps-eusb2-phy: Document the Nord eUSB2 PHY
Date: Tue,  1 Sep 2026 17:50:53 +0800
Message-ID: <20260901095055.42229-3-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260901095055.42229-1-shengchao.guo@oss.qualcomm.com>
References: <20260901095055.42229-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA4NiBTYWx0ZWRfX6XWzLQ1A/J7B
 5uMsOOa/HtIyJ80ko1uUVRiWAZFCVObKlKprOPENWYdpD289Q9tzlG7iTOqZCM2PfuRxDvwvMNn
 CSQ9QEBErSiNz4GcKiKD0idyPuocWIY=
X-Authority-Analysis: v=2.4 cv=R9wz39RX c=1 sm=1 tr=0 ts=6a96a01f cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=aaKdBBw8xNbH9Tj6BHYA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: fPHkN9eMz6Bv4NlAbFa4-PpywKznGZMW
X-Proofpoint-ORIG-GUID: fPHkN9eMz6Bv4NlAbFa4-PpywKznGZMW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA4NiBTYWx0ZWRfX5FAxXGhqSOi6
 DnjgFwZjf+7aJz+2TdvbNnKomrZtHYZOEHdkcwCmsLh53Ej1lYOSfCI3ivLgMMeXxNkmgFXLed+
 0Vb29dVa6EvW+4/LugqTTm8fVifX91Nl/rw6Piyi2EV2DJPgQ0+AA1frpVaJV/KaKhmwBAFRrO6
 Sv12jCk/Vc8f7gVxk3lB1wAsEqOtewCj/EVPT+CFz0Xeh0p5t1cx0eefc5eAWhQ2H5l0mMB1hnE
 t5UV+WA9keQUGw4AEqQQF/HaU1fpEpvE5cSsX3LjBAAeNwnOqgfMeUTSyA2PS+5Q3VcepPJ5UnG
 8I4bd30EhnDLzrLa8u6giKILBytZY20uLY3aKG5y/rlMGujig0129AqAi3Z8h0wKWUN+EZNiHVQ
 7pDK+hPVhjAPLfKyenqw+wx/lCDKLg7WNxz2CAAbIi+9j/7azUIiZmm+L4GG+s0VnR1qgea1/L0
 9RI4vAmaDXwt3jQdHyg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_02,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 clxscore=1015 phishscore=0 suspectscore=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609010086

From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Add a compatible for the eUSB2 PHY found on the Qualcomm Nord SoC.
It is compatible with the sm8550 eUSB2 PHY.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml
index 2140482c8e3b..7fe8c82db38d 100644
--- a/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml
@@ -19,6 +19,7 @@ properties:
           - enum:
               - qcom,eliza-snps-eusb2-phy
               - qcom,milos-snps-eusb2-phy
+              - qcom,nord-snps-eusb2-phy
               - qcom,sar2130p-snps-eusb2-phy
               - qcom,sdx75-snps-eusb2-phy
               - qcom,sm8650-snps-eusb2-phy
-- 
2.43.0

