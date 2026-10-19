Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85E2C4E73BB
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 11:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792409174; cv=none; b=sdQCd90nfcmBgC8094aQYS4BDOTPn2uJLak1dhC/H/wf3GrKj+CNJF70LtsSeukhqywSJNUYS3hggfw1D9apgzYhO8OMZslBSaLNHy38rG6BXe8hLIXt9/18R6B1VCA4rI02+GGAAkIbnmFRV0DNO86FX/2Fo7w2WEYjXU2aPtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792409174; c=relaxed/simple;
	bh=OtPhW13oTkk/vnq0/hqRzt/x1W323smpeKt1P7yBbyU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gu8QJ2NGwTzanBw6yJN8efHqNrfc7/aa6PKtxw+37jEZpCXyA3hmCMmCPVakp+7lrjvDRJnH7ShPvbr+eIN0GgEKt3bQZT+SNRbZvy/jxIJr2PUGAL+pG0cV6+MvycHDETuppG+6l+RWhtXmy8e86v01aOE53Bw5h3iVpR0Vl7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lyDi0r4H; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e/weFp9W; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lyDi0r4H";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e/weFp9W"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8Opnb2234252
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 11:26:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	f+pC6oEHMspVu+VNo8HMZcCwsNZGyw7oBC0aS0Ct3Os=; b=lyDi0r4HMJq2W7KL
	AtWTcVrV3xrBuJMST0C0Vam5Rt3oRjCNOOOVwAkBN+tb1IYyrg011pvsQx2BMLra
	xrltTuSiomk2ARr499rSnO9gdiXbli98XchqYpHhkvs849msrt0DTVMfV2YsjcQx
	kvAkDVhGwlNx1qXrh1yYqKzYpFtKHshKxfMr8stTEy9LLSzjI7TMw3n3FdJEVPEr
	jZCaHJL6NvUvxp4EgSZbXWQLn69t0I/yu0GfaFgCy3cR2Gvky3rw9cHgw2F6syXa
	psa45iPGm9mrOa0OM2xQj1Tq9kGctJ8vLWvMwhZKv/KqdwzHD6q3dgRvYtIZAv31
	ow4t1Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf3x8u48-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 11:26:04 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-939c30aa9a0so211420585a.0
        for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 04:26:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792409163; x=1793013963; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f+pC6oEHMspVu+VNo8HMZcCwsNZGyw7oBC0aS0Ct3Os=;
        b=e/weFp9WcAd/d82uYnDgsvfQfi6ZTj5izY4OPMYGQAnkr5PTvpBl5/oGuZ2+yVSCRn
         p6tsuYH01+YpCGWsMq933G5jOKxsBHEv3qsl33Zxsnc74fqqXyNB+r9wnK3ZXKxExXSM
         uApOfU8vKMrD6ncVv5acwU4O5wZ5msHQkzkN8L1xPKHulS5lOkhYxDBFVPpuKO9oF9AT
         Rrk4M7PJ4poVYGlYFpYcO9jSWpOX8uKCn8T6tRzU7p5R2yp3BEPo2RjrEfU7ZnFrVLDa
         +pYX/aRgBNd+7DzuNlBJBCx9xxtJa0Ta6XYcoN2eCGJOPeUWJYYtyiTv7GechDXIkRQZ
         ++9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792409163; x=1793013963;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f+pC6oEHMspVu+VNo8HMZcCwsNZGyw7oBC0aS0Ct3Os=;
        b=K5ox2wcoemGOR4GdO7P0Uvafzuxi1xNEcUFKr/BNEV9kIAhvhrJPafHIWfXG/Ndmmy
         cja6WXFJXW4ERB1ykp6RSGO7vnFycn4nDjsdOJUoH4RAbxsZzdx8VVVTYHTJHQ5rePyS
         3FnzbKhenOJ7S/quukQxVn3vp21122WRnqZ45JXV0W5wMHUzUoBs9xuupkASEG899pbN
         jeKrKXEn30hu+BP01v6HbhintgllCn5t/KoUdkHN0GS8Io7hyIiP/ZtYLyXl3Wm/PUr5
         dUosjwoGcDPuWgDTbdzqzWk/79ltRBxdb5tOP63tHRiAn0ZZf7JFB2hcxSwY8QUKR4wo
         3KFw==
X-Forwarded-Encrypted: i=1; AKwUvBwZVlBL4mgtxaf8TfvOqoAXQWGt7xzZMGIhoojzbQpF2jJxNL0ocKpiWVK28OTKHFa0ldhUct1uADS2@vger.kernel.org
X-Gm-Message-State: AFq9FYK/c2xnXmysnf+XygE45EPNMZPPHQIt/6fph/RqEg2VaVTCjW3X
	PmUmH2QG5SUnCE9GxMuONuvo5VIGfmwOTHuBGTQ9yqHUCR23NeaSTk7P0mEUUiqE6TywaNux63r
	4QBWMv6Xnrf+FkmMqWdkqZv+LR/9aqdqvIN8YvXJd0QsIX8al2cB55DFETHU5dtHB
X-Gm-Gg: AYBFou09efhFjYyMrino7hiv2xV06I2Xxz5V6smxmlJiKAk2LO/EVLHdKtpTS93cRWd
	21bKf7SoMsvcQDvwCCFhY0QwjgE/lGylZAmO971LKsnDRv+e9mb8i4N2+exHnYrzW3zpSJbWAsf
	fH5SLEMYw74GqnV94nzRl2SmLS7KtD3IlV9CrHZEv9NLVrZ+Lw6sxjI30NKpEWzPKyeWlEuzfd3
	fYPKjCDglIyDJl/NaYgFXogxfrHBX77RmQvsHRYY5Z8/v0ldKR+D6v1xBosaQtPIfIn8SY8vkhB
	ZKU8Y3KtXvlT+w8JJ1KVQMZCw5t2ksraNz5YHFStPS/eJ4RiRDPBjlR49sU1lkkBqrAQKC/73gi
	F2zLmydi4ni4BH6cH95KhsZNqxsdFqvi4Pb4PjSkk0wnndOBqyjLW4mNPwuwds/AxO5mmFRms/7
	LyGnHGSkS5DbX4
X-Received: by 2002:a05:620a:2613:b0:939:b8d6:9b1c with SMTP id af79cd13be357-93f29cc8bd1mr1257985485a.19.1792409163400;
        Mon, 19 Oct 2026 04:26:03 -0700 (PDT)
X-Received: by 2002:a05:620a:2613:b0:939:b8d6:9b1c with SMTP id af79cd13be357-93f29cc8bd1mr1257980985a.19.1792409162750;
        Mon, 19 Oct 2026 04:26:02 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ab37ba8851sm12807621fa.22.2026.10.19.04.26.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 04:26:01 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 14:25:43 +0300
Subject: [PATCH v2 7/8] arm64: dts: qcom: sm8150-hdk: fix FSA4480 address
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-sm8150-display-card-v2-7-86c05068efc5@oss.qualcomm.com>
References: <20261019-sm8150-display-card-v2-0-86c05068efc5@oss.qualcomm.com>
In-Reply-To: <20261019-sm8150-display-card-v2-0-86c05068efc5@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
        Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
        Kiran Gunda <quic_kgunda@quicinc.com>,
        Subbaraman Narayanamurthy <quic_subbaram@quicinc.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, mfd@lists.linux.dev,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1054;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=OtPhW13oTkk/vnq0/hqRzt/x1W323smpeKt1P7yBbyU=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ9bVf9aa1sGyKcnvAnxCO1trIi/MeZqoenHTdJMnsk++T
 DtpXH2/k9GYhYGRi0FWTJHFp6Blasym5LAPO6bWwwxiZQKZwsDFKQAT6fVj/+8YNNdXP6E67qzX
 8V3T2w1Nbm7lLEyaP7Nz3oRpFk6Hg1ze5z7qnh7TpJmR4qOtXBCy/aJO83FWtzltO8JMJCyPyNx
 uO1p/X6UqoiqBycJzC7vKh69JDTLCir0TBMXOxL9m8mvN3dwbKhiem6Duwp/x44XBnJre+U36Yc
 7Xb5xI5Zr2ar79vnav3WcXlE6WPu2T3nlC267su5FO2B7FDxync22jDx6dnfalludzrtGHFUcK5
 vPwCx6/aGHjxL5625a65jPfOadZnHCeVzeRT0JkT6+qbDdHZW+98oNPE30kZY/dZtJcf5NNWOFB
 aUsGR7WC/ZLPqRUhs1w+K2qb7C1eK+zx6tcttb1/jmQCAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: IirUIiPruaDQI44iItmnCDA_x_xBxMq7
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA0NSBTYWx0ZWRfX9fGveXhK7qJG
 iViwkSCPblUhGXJTrimfhL8wxr78dwkNobdJCcAS3Td+wQgoUcxKlxBJAYffYE2YMnaZKsMfXC4
 b5o95g2OdbnZgBKiTNUZ28IdmqB9R28=
X-Authority-Analysis: v=2.4 cv=XPOl2ghE c=1 sm=1 tr=0 ts=6ad5fe4c cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=a8YgrFIUZnlsYaPg6kkA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: IirUIiPruaDQI44iItmnCDA_x_xBxMq7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA0NSBTYWx0ZWRfX00IksTlU15TC
 fuyYf1Sk2G+3zBQq5ggHPR3IFhwbZ6On7R71MODgdPb+m3Z1rNPYX2++8OK5G7X2h6UnR3e7ufv
 Q/PqV1nzdkgs2+Ca0LbRNSvHXEa7TU1tMy0zzMiFDSj7TNe5iRh3/CdhEMiXFqlQxlGArSAm5VM
 8r8UM1WIE5HE9O8tckxOTe5xtiHEuIjJ3KE43ocrJg8eli/AJRyoM35j6LFgluKzHdu7LKVHf07
 zoD1wcimlVJZbJAY+0hPXvtxKtezYkpLWZwiEDGs/vNlx5W/Sy7JQuTJjATsElMYPAhvfLgtxDD
 LDdUrmu/aVzbRuhggqxl2eNR7zZ0+3IWM4RYpMXFjzSoT+RroEn8PYyUqDK7vPlfjo0yMqqHWr+
 nQQT5cj1j2bRl9eGRX9KDx1Wyg5ogCo73ufwJqVJoO/hNNJjJMxt2t8rFvafkI3XTKykvVXfRt7
 l1J1Aauu5yl917vfQ/A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 adultscore=0 phishscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610190045

The FSA4480 on the SM8150 HDK responds at 0x43 rather than 0x42. With
the wrong address the mux driver fails to probe, the Type-C controller
and the DisplayPort controller keep waiting for it and the display
subsystem never binds.

Fixes: ba712fd55c7b ("arm64: dts: qcom: sm8150-hdk: enable DisplayPort and USB-C altmode")
Assisted-by: LLM
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8150-hdk.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8150-hdk.dts b/arch/arm64/boot/dts/qcom/sm8150-hdk.dts
index cdced5c848d3..8f4ea981bb89 100644
--- a/arch/arm64/boot/dts/qcom/sm8150-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8150-hdk.dts
@@ -434,9 +434,9 @@ &i2c4 {
 
 	status = "okay";
 
-	typec-mux@42 {
+	typec-mux@43 {
 		compatible = "fcs,fsa4480";
-		reg = <0x42>;
+		reg = <0x43>;
 
 		interrupts-extended = <&tlmm 152 IRQ_TYPE_LEVEL_LOW>;
 

-- 
2.47.3

