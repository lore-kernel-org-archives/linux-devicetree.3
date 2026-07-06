Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57FD147ECF0
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 21:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783374072; cv=none; b=HTE/SFufIl3bxyuCzCEOjfWAYWruqsMWudzLtmVSA5/drbsha8CbJFP6CgyiqE/8rWhHFq6VgThldBiL0OOtVaOOdPzYCqGqX4SCuefT+fT45irQshSi/08/0oPO5W2lOdqCmsRiHkV9R+9pB2gTd5aWv1eEBdKZO4luWWz/p/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783374072; c=relaxed/simple;
	bh=HJVDDzLQpfOXNE55MkX0GzvtfcyfyTEpLV03CHtMIG8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VRHLQtNW1vFauJL62uzHVgbmV9HO13aVGm+G598uoiIEE4erCieGb59cVD4hCph5fYlQ32nj0Ibx/IEDOfAU7un/749TzI5MtAc9wq0qOSOmILxyXcxEjo0QlcMxB4yKtbBUeM7M1ayyIIxSlEpZ74c+TITuYjIjjAjlGqqGDFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=njTE8qK6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ftmOL7TC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="njTE8qK6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ftmOL7TC"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666KEJQY1639917
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 21:41:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lECXM1p7mMPSbcZ5Smb9oe9AFh1hLoc+9PilQyUZhA8=; b=njTE8qK6HOr/c07s
	nWJ62yK7y5zZB6HxnWuxRHGIbpX/GR6+AbzabIh7+TiSZ/sALesKBtbTUhXWOYaX
	UCSkt11/mJwBkA7ieDsiwlbciJLTKTLnimAuuNdf9RDmzLD5Fp4G93Ory2NbHBTL
	kJnB55MdwG2dWytvowbRjALalOlBbMX9diBjsjs2I3Mh0pu+byBkPe1A/NwC2pwh
	l+9/FfX1GWDqrJJSGektaCNA5OubT1JrU9e42JwkztuwpoLVhM6xo4fhM8jDaL3M
	Dwp0AxiHrwiIQJO6GlqVggp0tNF5uOEaMW9qKjRWiQIJpV42fSYUm7D0D+M7BQ9y
	sJLZqQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8a3r2ydq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 21:41:09 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2c9a700dc0eso29047505ad.1
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 14:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783374068; x=1783978868; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lECXM1p7mMPSbcZ5Smb9oe9AFh1hLoc+9PilQyUZhA8=;
        b=ftmOL7TCj69YyKFSOVzrkzP7VBQW1WVl3cqXn2OdbxTsbLHPQV75igC9/gABXWWbg8
         IIDzs4+c1X90Jlyjli19j81QeTrU30y+Eb4Q4JX17hsqMDWl7g3jmRCcLUKlDr/DkOwm
         Oj30tHk+IDT/FzruAr7nL3bys+rIb17TcqQrhpKsosVuR4LmWqatNTsnwPNxB51Nim4Z
         WUzl27loaszojqK9byOBeRQQakX2fIxHW2mAVleAQ82mt4tKL9zgL0P+HOzlfaoV/6+K
         zIDy4Sovfn+xWR9CDwa1DcRrtZ6ogUlCBUg3g0SP2ehJoMHYUdeR2PPucolo2t+ycfIw
         GsvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783374068; x=1783978868;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lECXM1p7mMPSbcZ5Smb9oe9AFh1hLoc+9PilQyUZhA8=;
        b=bGGeGS0dvVJRxmxmm+zxUxwHfLrt8uHTT0seHlhRkU+b/cJ2EOPl/cdsiw0r4LJ//B
         AykFQBnTWa++WJG7ARrjT3tTPU2WXy4K6u02zJbEd78Nm/NOw0OICwv6+QkxkXlQP/aZ
         aNXHeEPArQy5DRxA8RJPdxuxzGGLzI2IhiqMkd/uOMnQStRZWq8zerZyuaLcmv+srFbF
         9642PyNYzLdG7jkRWcPWHENzicO9ykaQvFPypGmopNMS4ZtLDAelXoRYsoEvbHABIXP8
         xnR9FfQIhhFtLwbydfq2nFigccNO2nMpBWVyP8RhLaSDVs0Dj7qIm3uAoJANn6ftvFYs
         vZ3A==
X-Forwarded-Encrypted: i=1; AHgh+Ro9BPvBe74o9BDfdIHLwoBEnbUL0gU0BsAebjaJ8yc/LJFUt1v8ue8Bp5l5xGOMfDyJw/ZceyW4QGxt@vger.kernel.org
X-Gm-Message-State: AOJu0YycWPDFc8c8tVwiT5x+t7X38dROFxTJWyrKfSGeX3sxc9yJplsh
	RORsx24E8Z7AthaFYEH0TM7mcqqXzoTx+45N/4AHnpZnbM6tZTd1IggYwTJznbcnV4u/c6cbsLw
	omjogwIaP/ozyhWPHOqvVze7oCTtG/mK7e4qbxbehw45AgikKwFzBauHgFcbWjXpn
X-Gm-Gg: AfdE7clSCb8+s2LPgRNLDMJbpDhkw+P3Qd/yAffkDsiEkGtTkiWP6EnSPvL2bMaUUyG
	/ak7OlFB4OpxJqKbgSITIwBtEQlYrJGcamlGoVSABiXwFgiZlg9H/D6RTE3kir+wW7hzdhgCx3n
	FXH9pSUFbP69cHV1Ky2NYC8+XIH146d40Xl4lPpGDvW6h5AbAhlz8mCc7IjKJPYFPdW4sxmXcPn
	y1Wj8+YwBDGVQqdOMmi5nCvZpEXx94OsZO6AvXPDyH7/6mXjERhQDBPOfZLHxR/fCJ3rbx2tXvE
	B2TWwvUFV2x82FiUWMAr+i1WNte6i16dWhj9RUKzYc63u4YBeM0a6jj9N+7ddAmSkyZMzLVxeuR
	Wq2Awy0VQNOVHQxyI2UH9R03XuMc/5ZP4Jdw=
X-Received: by 2002:a17:902:e78f:b0:2cc:741a:ff33 with SMTP id d9443c01a7336-2ccbf07b90dmr27229375ad.43.1783374068141;
        Mon, 06 Jul 2026 14:41:08 -0700 (PDT)
X-Received: by 2002:a17:902:e78f:b0:2cc:741a:ff33 with SMTP id d9443c01a7336-2ccbf07b90dmr27228815ad.43.1783374067709;
        Mon, 06 Jul 2026 14:41:07 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b659d8da9sm901810c88.14.2026.07.06.14.40.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 14:41:07 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Tue, 07 Jul 2026 03:10:21 +0530
Subject: [PATCH v3 3/7] arm64: dts: qcom: kaanapali: Add QFPROM node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260707-kaana-gpu-dt-v3-3-8dac9a60dd5c@oss.qualcomm.com>
References: <20260707-kaana-gpu-dt-v3-0-8dac9a60dd5c@oss.qualcomm.com>
In-Reply-To: <20260707-kaana-gpu-dt-v3-0-8dac9a60dd5c@oss.qualcomm.com>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783374032; l=1140;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=xlkJOQ68/B3gMybJ9Ns4FY50UaqHntYHUufy67tsBxg=;
 b=7edwsEeVv8RHFs9wiiykhb6VXFeyYOH/HK4hwAwFZ0IHw5gWNb6aDpzyhjQU9h/vPFqbm1TSa
 s9NCvSNutLKBK4+wkAdMeVSn/V2LA9Rq/OVHw7b/aeeMzaXAawE2luN
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDIxOCBTYWx0ZWRfX4lpmIcTMZV0N
 3xKBr/3BcZZ0uy9jBZZKsxxBd4sqZbW6jI2/mRNgB4Vuw0sKDkwWPGKYD6KpqPVCj7bC3Hq8osy
 5xPHWjScINaxwWoqLx76m8t6wm1CsfdBfUz5/MKdsvwLg3MxU9/7dVGV7wcI1UQfbIrbqgvumm2
 EATqLKxN/I3qzJ0fjzgzN9wbqUeVGFsPPgKwqVEuAKN2K6vCJGESvnZmfvtf3TmwEiTw3i6e4dN
 v0EXFdIIjvKstxzC0eOemonfGBT8roxBpb36jj0AVryKNPK+dk7LvW2Rw8PYcCZ0a1o5lTh0Fyc
 8fGVbDWa3Xbjc97ZlIEcW1ZDRT/xO1pz0oL7r9f7gfqKjZZBsyrL2SnONTwShSATdFOevAvbXPP
 FZqRRYy0+tGHyyMyDY0Ts6rfKLdwvPItVpK1O4+T+0yq9U31y1Xax5pXfZn4ul8aZR7XlG1JXpp
 8+PgjC873R2evgitrAw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDIxOCBTYWx0ZWRfX9+F6ly9OhCDd
 5xtoXl7xt1PHb1q3y7v9qJiWnGfUi+e0+MtAVgsn6gKHurlz12B8Hm9GTSeydkjRg7WkXjHjHgi
 WzYUd8/F4bZt5SpzW0xt8ixCoDKU67s=
X-Proofpoint-GUID: tkkK6hjXztG5KlgZo9VrFAZuCEBOsH36
X-Proofpoint-ORIG-GUID: tkkK6hjXztG5KlgZo9VrFAZuCEBOsH36
X-Authority-Analysis: v=2.4 cv=OKcXGyaB c=1 sm=1 tr=0 ts=6a4c20f5 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=doS3iEISOceegCkkCwMA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_03,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 spamscore=0 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060218

From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>

Add the QFPROM node and GPU related subnodes on Kaanapali SoC.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index a41962366941..2d0db71cabf1 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -5871,6 +5871,18 @@ rpmhpd_opp_super_turbo_no_cpr: opp-480 {
 			};
 		};
 
+		efuse@221c8000 {
+			compatible = "qcom,kaanapali-qfprom", "qcom,qfprom";
+			reg = <0x0 0x221c8000 0x0 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			gpu_speed_bin: gpu-speed-bin@142 {
+				reg = <0x142 0x2>;
+				bits = <3 9>;
+			};
+		};
+
 		nsp_noc: interconnect@260c0000 {
 			compatible = "qcom,kaanapali-nsp-noc";
 			reg = <0x0 0x260c0000 0x0 0x21280>;

-- 
2.54.0

